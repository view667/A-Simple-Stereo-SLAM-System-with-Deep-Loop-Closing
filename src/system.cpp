#include "myslam/system.h"
#include "myslam/config.h"

namespace myslam{

// -------------------------------------------------------------------------
System::System(const std::string &strConfigPath):
        _strConfigPath(strConfigPath) {}



// -------------------------------------------------------------------------
bool System::Init(){
    // read the config file
    if (Config::SetParameterFile(_strConfigPath) == false){
        return false;
    }

    // initial the ORB extractor, for frontend and loopclosing
    int numORBNewFeatures = Config::Get<int>("ORBextractor.nNewFeatures");
    float fScaleFactor = Config::Get<float>("ORBextractor.scaleFactor");
    int nLevels = Config::Get<int>("ORBextractor.nLevels");
    int fIniThFAST = Config::Get<int>("ORBextractor.iniThFAST");
    int fMinThFAST = Config::Get<int>("ORBextractor.minThFAST");
    _mpORBextractor = ORBextractor::Ptr(new ORBextractor(numORBNewFeatures,fScaleFactor,nLevels,fIniThFAST,fMinThFAST));

    // get left and right cameras
    GetCamera();

    // create compnents and start each one's thread
    _mpFrontend = Frontend::Ptr(new Frontend);
    _mpBackend = Backend::Ptr(new Backend);
    _mpLoopClosing = LoopClosing::Ptr(new LoopClosing);
    _mpViewer = Viewer::Ptr(new Viewer);
    _mpMap = Map::Ptr(new Map);


    // create links between each components
    _mpFrontend->SetViewer(_mpViewer);
    _mpFrontend->SetCameras(_mpCameraLeft, _mpCameraRight);
    _mpFrontend->SetMap(_mpMap);
    _mpFrontend->SetBackend(_mpBackend);
    _mpFrontend->SetORBextractor(_mpORBextractor);

    if(_mpBackend){
        _mpBackend->SetMap(_mpMap);
        _mpBackend->SetViewer(_mpViewer);
        _mpBackend->SetCameras(_mpCameraLeft, _mpCameraRight);
        _mpBackend->SetLoopClosing(_mpLoopClosing);
    }

    if(_mpLoopClosing){
        _mpLoopClosing->SetMap(_mpMap);
        _mpLoopClosing->SetCameras(_mpCameraLeft, _mpCameraRight);
        _mpLoopClosing->SetORBextractor(_mpORBextractor);
    }

    if(_mpViewer){
        _mpViewer->SetMap(_mpMap);
    }
    

    return true;
}

void System::Stop(){
    if(_mpViewer)
        _mpViewer->Close();
    if(_mpBackend)
        _mpBackend->Stop();
    if(_mpLoopClosing)
        _mpLoopClosing->Stop();
}


// -------------------------------------------------------------------------
bool System::RunStep(const cv::Mat &leftImg, const cv::Mat &rightImg, const double &dTimestamp){
    
   bool success =  _mpFrontend->GrabStereoImage(leftImg, rightImg, dTimestamp);
    
    return success;
}


// -------------------------------------------------------------------------
void System::GetCamera(){

    float fxLeft = Config::Get<float>("Camera.right.fx");
    float  fyLeft = Config::Get<float>("Camera.right.fy");
    float cxLeft = Config::Get<float>("Camera.right.cx");
    float cyLeft = Config::Get<float>("Camera.right.cy");
    Vec3 tLeft = Vec3::Zero();

    float fxRight = Config::Get<float>("Camera.right.fx");
    float  fyRight = Config::Get<float>("Camera.right.fy");
    float cxRight = Config::Get<float>("Camera.right.cx");
    float  cyRight = Config::Get<float>("Camera.right.cy");
    float bf = Config::Get<float>("Camera.bf");
    float baseline = bf / fxRight;
    Vec3 tRight = Vec3(- baseline, 0, 0);

    _mpCameraLeft = Camera::Ptr(new Camera(fxLeft, fyLeft, cxLeft, cyLeft,
                                        0, SE3(SO3(), tLeft)));
    _mpCameraRight = Camera::Ptr(new Camera(fxRight, fyRight, cxRight, cyRight,
                                        baseline, SE3(SO3(), tRight)));
}





} // namespace myslam
