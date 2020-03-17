#include "myslam/map.h"

#include "myslam/keyframe.h"
#include "myslam/mappoint.h"
#include "myslam/feature.h"


namespace myslam{

void Map::InsertKeyFrame(std::shared_ptr<KeyFrame> kf){
    _mpCurrentKF = kf;

    // insert keyframe
    if (_mumpAllKeyFrames.find(kf->mnKFId) == _mumpAllKeyFrames.end()){
        _mumpAllKeyFrames.insert(make_pair(kf->mnKFId, kf));
        _mumpActiveKeyFrames.insert(make_pair(kf->mnKFId, kf));
    }else{
        _mumpAllKeyFrames[kf->mnKFId] = kf;
        _mumpActiveKeyFrames[kf->mnKFId] = kf;
    }

    // remove old keyframe from the optimization window
    if(_mumpActiveKeyFrames.size() > _numActiveKeyFrames){
        RemoveOldActiveKeyframe();
        RemoveOldActiveMapPoints();
    }
}


// -------------------------------------------------------------------

void Map::InsertMapPoint (MapPoint::Ptr map_point) {
    if (_mumpAllMapPoints.find(map_point->mnId) == _mumpAllMapPoints.end()){
        _mumpAllMapPoints.insert(make_pair(map_point->mnId, map_point));
        _mumpActiveMapPoints.insert(make_pair(map_point->mnId, map_point));
    }else {
        _mumpAllMapPoints[map_point->mnId] = map_point;
        _mumpActiveMapPoints[map_point->mnId] = map_point;
    }
}


// -------------------------------------------------------------------

void Map::RemoveOldActiveKeyframe(){
    if(_mpCurrentKF == nullptr)  return;

    double maxDis = 0, minDis = 9999;
    double maxKFId = 0, minKFId = 0;

    // compute the min distance and max distance between current kf and previous active kfs
    auto Twc = _mpCurrentKF->Pose().inverse();
    for(auto &kf: _mumpActiveKeyFrames){
        if(kf.second == _mpCurrentKF) continue;
        auto dis = (kf.second->Pose() * Twc).log().norm();
        if(dis > maxDis){
            maxDis = dis;
            maxKFId = kf.first;
        } else if(dis < minDis){
            minDis = dis;
            minKFId = kf.first;
        }
    }

    // decide which kf to be removed
    const double minDisTh = 0.2;
    KeyFrame::Ptr frameToRemove = nullptr;
    if(minDis < minDisTh){
        frameToRemove = _mumpAllKeyFrames.at(minKFId);
    } else {
        frameToRemove = _mumpAllKeyFrames.at(maxKFId);
    }

    LOG(INFO) << "remove keyframe " << frameToRemove->mnKFId << " from the active keyframes.";

    // remove the kf and its mappoints' observation
    _mumpActiveKeyFrames.erase(frameToRemove->mnKFId);
    for(auto &feat: frameToRemove->mvpFeaturesLeft){
        auto mp = feat->mpMapPoint.lock();
        if(mp){
            mp->RemoveActiveObservation(feat);
        }
    }
    // RemoveOldActiveMapPoints();
}



// -------------------------------------------------------------------

void Map::RemoveOldActiveMapPoints(){
    int cntActiveLandmarkRemoved = 0;
    for(auto iter = _mumpActiveMapPoints.begin(); iter != _mumpActiveMapPoints.end();){
        if(iter->second->mnObservedTimes == 0){
            iter = _mumpActiveMapPoints.erase(iter);
            cntActiveLandmarkRemoved++;
        } else{
            ++iter;
        }
    }
    LOG(INFO) << "Removed " << cntActiveLandmarkRemoved << " active landmarks";
}


// ----------------------------------------------------------------------
Map::MapPointsType Map::GetAllMapPoints(){
    std::unique_lock<std::mutex> lck(_mmutexData);
    return _mumpAllMapPoints;
}


Map::KeyFramesType Map::GetAllKeyFrames(){
    std::unique_lock<std::mutex> lck(_mmutexData);
    return _mumpAllKeyFrames;
}


Map::MapPointsType Map::GetActiveMapPoints(){
    std::unique_lock<std::mutex> lck(_mmutexData);
    return _mumpActiveMapPoints;
}


Map::KeyFramesType Map::GetActiveKeyFrames(){
    std::unique_lock<std::mutex> lck(_mmutexData);
    return _mumpActiveKeyFrames;
}

// ----------------------------------------------------------------------


} // namespace myslam