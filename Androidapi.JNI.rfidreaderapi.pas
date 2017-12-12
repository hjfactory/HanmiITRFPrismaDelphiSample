
unit Androidapi.JNI.rfidreaderapi;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.App,
  Androidapi.JNI.Bluetooth,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.JavaUtil,
  Androidapi.JNI.Os,
  Androidapi.JNI.Util,
  Androidapi.JNI.Widget;

type
// ===== Forward declarations =====

  JAnimator = interface;//android.animation.Animator
  JAnimator_AnimatorListener = interface;//android.animation.Animator$AnimatorListener
  JAnimator_AnimatorPauseListener = interface;//android.animation.Animator$AnimatorPauseListener
  JKeyframe = interface;//android.animation.Keyframe
  JLayoutTransition = interface;//android.animation.LayoutTransition
  JLayoutTransition_TransitionListener = interface;//android.animation.LayoutTransition$TransitionListener
  JPropertyValuesHolder = interface;//android.animation.PropertyValuesHolder
  JStateListAnimator = interface;//android.animation.StateListAnimator
  JTimeInterpolator = interface;//android.animation.TimeInterpolator
  JTypeConverter = interface;//android.animation.TypeConverter
  JTypeEvaluator = interface;//android.animation.TypeEvaluator
  JValueAnimator = interface;//android.animation.ValueAnimator
  JValueAnimator_AnimatorUpdateListener = interface;//android.animation.ValueAnimator$AnimatorUpdateListener
  JPathMotion = interface;//android.transition.PathMotion
  JScene = interface;//android.transition.Scene
  JTransition = interface;//android.transition.Transition
  JTransition_EpicenterCallback = interface;//android.transition.Transition$EpicenterCallback
  JTransition_TransitionListener = interface;//android.transition.Transition$TransitionListener
  JTransitionManager = interface;//android.transition.TransitionManager
  JTransitionPropagation = interface;//android.transition.TransitionPropagation
  JTransitionValues = interface;//android.transition.TransitionValues
  JInterpolator = interface;//android.view.animation.Interpolator
  JToolbar_LayoutParams = interface;//android.widget.Toolbar$LayoutParams
  JEventListenerManager = interface;//com.hanmiit.event.EventListenerManager
  JATRfidManager = interface;//com.hanmiit.lib.ATRfidManager
  JATRfidReader = interface;//com.hanmiit.lib.ATRfidReader
  JConnectionStateListener = interface;//com.hanmiit.lib.device.event.ConnectionStateListener
  JATRfidReader_1 = interface;//com.hanmiit.lib.ATRfidReader$1
  JProtocolRfidEventListener = interface;//com.hanmiit.lib.rfid.protocol.event.ProtocolRfidEventListener
  JATRfidReader_2 = interface;//com.hanmiit.lib.ATRfidReader$2
  JATRfidReader_3 = interface;//com.hanmiit.lib.ATRfidReader$3
  JATRfidReader_EventHandler = interface;//com.hanmiit.lib.ATRfidReader$EventHandler
  JATRfidReader_Watcher = interface;//com.hanmiit.lib.ATRfidReader$Watcher
  JParamHelper = interface;//com.hanmiit.lib.barcode.ParamHelper
  JParamValue = interface;//com.hanmiit.lib.barcode.ParamValue
  JParamValueList = interface;//com.hanmiit.lib.barcode.ParamValueList
  JDecodeEventArgs = interface;//com.hanmiit.lib.barcode.args.DecodeEventArgs
  JPayloadBuffer = interface;//com.hanmiit.lib.barcode.param.PayloadBuffer
  JResultBytesValue = interface;//com.hanmiit.lib.barcode.param.ResultBytesValue
  JBarcodeType = interface;//com.hanmiit.lib.barcode.type.BarcodeType
  JBooklandIsbnFormat = interface;//com.hanmiit.lib.barcode.type.BooklandIsbnFormat
  JCodabarStartStopCharactersDetection = interface;//com.hanmiit.lib.barcode.type.CodabarStartStopCharactersDetection
  JCode11CheckDigitVerification = interface;//com.hanmiit.lib.barcode.type.Code11CheckDigitVerification
  JCompositeBeepMode = interface;//com.hanmiit.lib.barcode.type.CompositeBeepMode
  JCouponReportFormat = interface;//com.hanmiit.lib.barcode.type.CouponReportFormat
  JDecodeUpcEanSupplementals = interface;//com.hanmiit.lib.barcode.type.DecodeUpcEanSupplementals
  JDecodeUpcSupplementalsAIMID = interface;//com.hanmiit.lib.barcode.type.DecodeUpcSupplementalsAIMID
  JEncodingType = interface;//com.hanmiit.lib.barcode.type.EncodingType
  JGs1DataBarLimitedSecurityLevel = interface;//com.hanmiit.lib.barcode.type.Gs1DataBarLimitedSecurityLevel
  JI2of5CheckDigitVerification = interface;//com.hanmiit.lib.barcode.type.I2of5CheckDigitVerification
  JI2of5SecurityLevel = interface;//com.hanmiit.lib.barcode.type.I2of5SecurityLevel
  JInverseType = interface;//com.hanmiit.lib.barcode.type.InverseType
  JMsiCheckDigitAlgorithm = interface;//com.hanmiit.lib.barcode.type.MsiCheckDigitAlgorithm
  JMsiCheckDigits = interface;//com.hanmiit.lib.barcode.type.MsiCheckDigits
  JParamName = interface;//com.hanmiit.lib.barcode.type.ParamName
  JPreamble = interface;//com.hanmiit.lib.barcode.type.Preamble
  JRedundancyLevel = interface;//com.hanmiit.lib.barcode.type.RedundancyLevel
  JSSICommand = interface;//com.hanmiit.lib.barcode.type.SSICommand
  JSecurityLevel = interface;//com.hanmiit.lib.barcode.type.SecurityLevel
  JUpcCompositeMode = interface;//com.hanmiit.lib.barcode.type.UpcCompositeMode
  JUpcEanSecurityLevel = interface;//com.hanmiit.lib.barcode.type.UpcEanSecurityLevel
  JDevice = interface;//com.hanmiit.lib.device.Device
  JDevBluetooth = interface;//com.hanmiit.lib.device.DevBluetooth
  JDevBluetooth_ConnectingThread = interface;//com.hanmiit.lib.device.DevBluetooth$ConnectingThread
  JDevBluetooth_ListenThread = interface;//com.hanmiit.lib.device.DevBluetooth$ListenThread
  JDevBluetooth_ReceiveThread = interface;//com.hanmiit.lib.device.DevBluetooth$ReceiveThread
  JDevBluetoothLe = interface;//com.hanmiit.lib.device.DevBluetoothLe
  JDevBluetoothLe_1 = interface;//com.hanmiit.lib.device.DevBluetoothLe$1
  JDevBluetoothLe_2 = interface;//com.hanmiit.lib.device.DevBluetoothLe$2
  JDevice_1 = interface;//com.hanmiit.lib.device.Device$1
  JBleDeviceListActivity = interface;//com.hanmiit.lib.device.dialog.BleDeviceListActivity
  JBleDeviceListActivity_1 = interface;//com.hanmiit.lib.device.dialog.BleDeviceListActivity$1
  J1_1 = interface;//com.hanmiit.lib.device.dialog.BleDeviceListActivity$1$1
  JBleDeviceListActivity_2 = interface;//com.hanmiit.lib.device.dialog.BleDeviceListActivity$2
  J2_1 = interface;//com.hanmiit.lib.device.dialog.BleDeviceListActivity$2$1
  JBleDeviceListAdapter = interface;//com.hanmiit.lib.device.dialog.BleDeviceListAdapter
  JBleDeviceListAdapter_1 = interface;//com.hanmiit.lib.device.dialog.BleDeviceListAdapter$1
  JBleDeviceListAdapter_2 = interface;//com.hanmiit.lib.device.dialog.BleDeviceListAdapter$2
  JBleDeviceListAdapter_DeviceListItem = interface;//com.hanmiit.lib.device.dialog.BleDeviceListAdapter$DeviceListItem
  JBleDeviceListAdapter_DeviceListViewHolder = interface;//com.hanmiit.lib.device.dialog.BleDeviceListAdapter$DeviceListViewHolder
  JDeviceList = interface;//com.hanmiit.lib.device.dialog.DeviceList
  JDeviceListActivity = interface;//com.hanmiit.lib.device.dialog.DeviceListActivity
  JDeviceListActivity_1 = interface;//com.hanmiit.lib.device.dialog.DeviceListActivity$1
  JDeviceListAdapter = interface;//com.hanmiit.lib.device.dialog.DeviceListAdapter
  JDeviceListAdapter_DeviceListItem = interface;//com.hanmiit.lib.device.dialog.DeviceListAdapter$DeviceListItem
  JDeviceListAdapter_DeviceListViewHolder = interface;//com.hanmiit.lib.device.dialog.DeviceListAdapter$DeviceListViewHolder
  JConnectionState = interface;//com.hanmiit.lib.device.type.ConnectionState
  JATLog = interface;//com.hanmiit.lib.diagnostics.ATLog
  JATLog_1 = interface;//com.hanmiit.lib.diagnostics.ATLog$1
  JATLog_ATUncaughtExceptionHandler = interface;//com.hanmiit.lib.diagnostics.ATLog$ATUncaughtExceptionHandler
  JATLog_QueueItem = interface;//com.hanmiit.lib.diagnostics.ATLog$QueueItem
  JDump = interface;//com.hanmiit.lib.diagnostics.Dump
  JRangeValue = interface;//com.hanmiit.lib.params.RangeValue
  JModuleRfBlaster = interface;//com.hanmiit.lib.rfid.ModuleRfBlaster
  JAccessResultArgs = interface;//com.hanmiit.lib.rfid.args.AccessResultArgs
  JReadedTagArgs = interface;//com.hanmiit.lib.rfid.args.ReadedTagArgs
  JATRfidEventListener = interface;//com.hanmiit.lib.rfid.event.ATRfidEventListener
  JATRfidEventListenerManager = interface;//com.hanmiit.lib.rfid.event.ATRfidEventListenerManager
  JATRfidReaderException = interface;//com.hanmiit.lib.rfid.exception.ATRfidReaderException
  JLockParam = interface;//com.hanmiit.lib.rfid.params.LockParam
  JMinMaxValue = interface;//com.hanmiit.lib.rfid.params.MinMaxValue
  JResultDataValue = interface;//com.hanmiit.lib.rfid.params.ResultDataValue
  JSelectMaskEpcParam = interface;//com.hanmiit.lib.rfid.params.SelectMaskEpcParam
  JSelectMaskParam = interface;//com.hanmiit.lib.rfid.params.SelectMaskParam
  JStringIntegerValue = interface;//com.hanmiit.lib.rfid.params.StringIntegerValue
  JCommandParam = interface;//com.hanmiit.lib.rfid.params.command.CommandParam
  JLockTagCommandParam = interface;//com.hanmiit.lib.rfid.params.command.LockTagCommandParam
  JReadMemoryCommandParam = interface;//com.hanmiit.lib.rfid.params.command.ReadMemoryCommandParam
  JWriteMemoryCommandParam = interface;//com.hanmiit.lib.rfid.params.command.WriteMemoryCommandParam
  JProtocolRfBlaster = interface;//com.hanmiit.lib.rfid.protocol.ProtocolRfBlaster
  JProtocolRfBlaster_Packet = interface;//com.hanmiit.lib.rfid.protocol.ProtocolRfBlaster$Packet
  JProtocolRfBlaster_ReceiveThread = interface;//com.hanmiit.lib.rfid.protocol.ProtocolRfBlaster$ReceiveThread
  JProtocolRfBlaster_Watcher = interface;//com.hanmiit.lib.rfid.protocol.ProtocolRfBlaster$Watcher
  JActionState = interface;//com.hanmiit.lib.rfid.type.ActionState
  JAlgorithmType = interface;//com.hanmiit.lib.rfid.type.AlgorithmType
  JBatteryStatusType = interface;//com.hanmiit.lib.rfid.type.BatteryStatusType
  JBuzzerState = interface;//com.hanmiit.lib.rfid.type.BuzzerState
  JCommandType = interface;//com.hanmiit.lib.rfid.type.CommandType
  JLbtItem = interface;//com.hanmiit.lib.rfid.type.LbtItem
  JLockState = interface;//com.hanmiit.lib.rfid.type.LockState
  JMaskActionType = interface;//com.hanmiit.lib.rfid.type.MaskActionType
  JMaskTargetType = interface;//com.hanmiit.lib.rfid.type.MaskTargetType
  JMemoryBank = interface;//com.hanmiit.lib.rfid.type.MemoryBank
  JOperationMode = interface;//com.hanmiit.lib.rfid.type.OperationMode
  JRemoteKeyState = interface;//com.hanmiit.lib.rfid.type.RemoteKeyState
  Jtype_ResultCode = interface;//com.hanmiit.lib.rfid.type.ResultCode
  JSelectFlag = interface;//com.hanmiit.lib.rfid.type.SelectFlag
  JSessionFlag = interface;//com.hanmiit.lib.rfid.type.SessionFlag
  JSessionType = interface;//com.hanmiit.lib.rfid.type.SessionType
  JSubCommandType = interface;//com.hanmiit.lib.rfid.type.SubCommandType
  JTagDataType = interface;//com.hanmiit.lib.rfid.type.TagDataType
  JBitConvert = interface;//com.hanmiit.lib.util.BitConvert
  JByteCompare = interface;//com.hanmiit.lib.util.ByteCompare
  JByteQueue = interface;//com.hanmiit.lib.util.ByteQueue
  JDrawUtil = interface;//com.hanmiit.lib.util.DrawUtil
  JStringConvert = interface;//com.hanmiit.lib.util.StringConvert
  JSysUtil = interface;//com.hanmiit.lib.util.SysUtil
  Jutil_Version = interface;//com.hanmiit.lib.util.Version
  JPipedInputStream = interface;//java.io.PipedInputStream
  JPipedOutputStream = interface;//java.io.PipedOutputStream
  JAbstractStringBuilder = interface;//java.lang.AbstractStringBuilder
  JStringBuffer = interface;//java.lang.StringBuffer
  JStringBuilder = interface;//java.lang.StringBuilder
  JSemaphore = interface;//java.util.concurrent.Semaphore

// ===== Interface declarations =====

  JAnimatorClass = interface(JObjectClass)
    ['{3F76A5DF-389E-4BD3-9861-04C5B00CEADE}']
    {class} function init: JAnimator; cdecl;//Deprecated
    {class} procedure cancel; cdecl;
    {class} function clone: JAnimator; cdecl;
    {class} function getListeners: JArrayList; cdecl;
    {class} function getStartDelay: Int64; cdecl;
    {class} function isPaused: Boolean; cdecl;
    {class} procedure removeAllListeners; cdecl;
    {class} procedure removeListener(listener: JAnimator_AnimatorListener); cdecl;
    {class} procedure removePauseListener(listener: JAnimator_AnimatorPauseListener); cdecl;
    {class} procedure setStartDelay(startDelay: Int64); cdecl;//Deprecated
    {class} procedure setTarget(target: JObject); cdecl;//Deprecated
    {class} procedure setupEndValues; cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/Animator')]
  JAnimator = interface(JObject)
    ['{FA13E56D-1B6D-4A3D-8327-9E5BA785CF21}']
    procedure addListener(listener: JAnimator_AnimatorListener); cdecl;
    procedure addPauseListener(listener: JAnimator_AnimatorPauseListener); cdecl;
    procedure &end; cdecl;
    function getDuration: Int64; cdecl;
    function getInterpolator: JTimeInterpolator; cdecl;
    function isRunning: Boolean; cdecl;
    function isStarted: Boolean; cdecl;
    procedure pause; cdecl;
    procedure resume; cdecl;//Deprecated
    function setDuration(duration: Int64): JAnimator; cdecl;//Deprecated
    procedure setInterpolator(value: JTimeInterpolator); cdecl;//Deprecated
    procedure setupStartValues; cdecl;//Deprecated
    procedure start; cdecl;//Deprecated
  end;
  TJAnimator = class(TJavaGenericImport<JAnimatorClass, JAnimator>) end;

  JAnimator_AnimatorListenerClass = interface(IJavaClass)
    ['{5ED6075A-B997-469C-B8D9-0AA8FB7E4798}']
    {class} procedure onAnimationRepeat(animation: JAnimator); cdecl;//Deprecated
    {class} procedure onAnimationStart(animation: JAnimator); cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/Animator$AnimatorListener')]
  JAnimator_AnimatorListener = interface(IJavaInstance)
    ['{E2DE8DD6-628B-4D84-AA46-8A1E3F00FF13}']
    procedure onAnimationCancel(animation: JAnimator); cdecl;//Deprecated
    procedure onAnimationEnd(animation: JAnimator); cdecl;//Deprecated
  end;
  TJAnimator_AnimatorListener = class(TJavaGenericImport<JAnimator_AnimatorListenerClass, JAnimator_AnimatorListener>) end;

  JAnimator_AnimatorPauseListenerClass = interface(IJavaClass)
    ['{CB0DC3F0-63BC-4284-ADD0-2ED367AE11E5}']
    {class} procedure onAnimationPause(animation: JAnimator); cdecl;
    {class} procedure onAnimationResume(animation: JAnimator); cdecl;
  end;

  [JavaSignature('android/animation/Animator$AnimatorPauseListener')]
  JAnimator_AnimatorPauseListener = interface(IJavaInstance)
    ['{43C9C106-65EA-4A7D-A958-FAB9E43FA4A6}']
  end;
  TJAnimator_AnimatorPauseListener = class(TJavaGenericImport<JAnimator_AnimatorPauseListenerClass, JAnimator_AnimatorPauseListener>) end;

  JKeyframeClass = interface(JObjectClass)
    ['{D383116E-5CCF-48D8-9EA1-B26FBF24BA39}']
    {class} function init: JKeyframe; cdecl;//Deprecated
    {class} function getInterpolator: JTimeInterpolator; cdecl;//Deprecated
    {class} function getType: Jlang_Class; cdecl;//Deprecated
    {class} function getValue: JObject; cdecl;//Deprecated
    {class} function ofFloat(fraction: Single; value: Single): JKeyframe; cdecl; overload;//Deprecated
    {class} function ofFloat(fraction: Single): JKeyframe; cdecl; overload;//Deprecated
    {class} function ofInt(fraction: Single; value: Integer): JKeyframe; cdecl; overload;//Deprecated
    {class} function ofInt(fraction: Single): JKeyframe; cdecl; overload;//Deprecated
    {class} function ofObject(fraction: Single; value: JObject): JKeyframe; cdecl; overload;//Deprecated
    {class} function ofObject(fraction: Single): JKeyframe; cdecl; overload;//Deprecated
    {class} procedure setInterpolator(interpolator: JTimeInterpolator); cdecl;//Deprecated
    {class} procedure setValue(value: JObject); cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/Keyframe')]
  JKeyframe = interface(JObject)
    ['{9D0687A4-669E-440F-8290-154739405019}']
    function clone: JKeyframe; cdecl;//Deprecated
    function getFraction: Single; cdecl;//Deprecated
    function hasValue: Boolean; cdecl;//Deprecated
    procedure setFraction(fraction: Single); cdecl;//Deprecated
  end;
  TJKeyframe = class(TJavaGenericImport<JKeyframeClass, JKeyframe>) end;

  JLayoutTransitionClass = interface(JObjectClass)
    ['{433C5359-0A96-4796-AD7B-8084EF7EF7C4}']
    {class} function _GetAPPEARING: Integer; cdecl;
    {class} function _GetCHANGE_APPEARING: Integer; cdecl;
    {class} function _GetCHANGE_DISAPPEARING: Integer; cdecl;
    {class} function _GetCHANGING: Integer; cdecl;
    {class} function _GetDISAPPEARING: Integer; cdecl;
    {class} function init: JLayoutTransition; cdecl;//Deprecated
    {class} procedure addTransitionListener(listener: JLayoutTransition_TransitionListener); cdecl;
    {class} procedure disableTransitionType(transitionType: Integer); cdecl;
    {class} function getInterpolator(transitionType: Integer): JTimeInterpolator; cdecl;
    {class} function getStagger(transitionType: Integer): Int64; cdecl;
    {class} function getStartDelay(transitionType: Integer): Int64; cdecl;
    {class} function isChangingLayout: Boolean; cdecl;//Deprecated
    {class} function isRunning: Boolean; cdecl;//Deprecated
    {class} function isTransitionTypeEnabled(transitionType: Integer): Boolean; cdecl;//Deprecated
    {class} procedure setAnimator(transitionType: Integer; animator: JAnimator); cdecl;//Deprecated
    {class} procedure setDuration(duration: Int64); cdecl; overload;//Deprecated
    {class} procedure setDuration(transitionType: Integer; duration: Int64); cdecl; overload;//Deprecated
    {class} procedure showChild(parent: JViewGroup; child: JView); cdecl; overload;//Deprecated
    {class} procedure showChild(parent: JViewGroup; child: JView; oldVisibility: Integer); cdecl; overload;//Deprecated
    {class} property APPEARING: Integer read _GetAPPEARING;
    {class} property CHANGE_APPEARING: Integer read _GetCHANGE_APPEARING;
    {class} property CHANGE_DISAPPEARING: Integer read _GetCHANGE_DISAPPEARING;
    {class} property CHANGING: Integer read _GetCHANGING;
    {class} property DISAPPEARING: Integer read _GetDISAPPEARING;
  end;

  [JavaSignature('android/animation/LayoutTransition')]
  JLayoutTransition = interface(JObject)
    ['{42450BEE-EBF2-4954-B9B7-F8DAE7DF0EC1}']
    procedure addChild(parent: JViewGroup; child: JView); cdecl;
    procedure enableTransitionType(transitionType: Integer); cdecl;
    function getAnimator(transitionType: Integer): JAnimator; cdecl;
    function getDuration(transitionType: Integer): Int64; cdecl;
    function getTransitionListeners: JList; cdecl;//Deprecated
    procedure hideChild(parent: JViewGroup; child: JView); cdecl; overload;//Deprecated
    procedure hideChild(parent: JViewGroup; child: JView; newVisibility: Integer); cdecl; overload;//Deprecated
    procedure removeChild(parent: JViewGroup; child: JView); cdecl;//Deprecated
    procedure removeTransitionListener(listener: JLayoutTransition_TransitionListener); cdecl;//Deprecated
    procedure setAnimateParentHierarchy(animateParentHierarchy: Boolean); cdecl;//Deprecated
    procedure setInterpolator(transitionType: Integer; interpolator: JTimeInterpolator); cdecl;//Deprecated
    procedure setStagger(transitionType: Integer; duration: Int64); cdecl;//Deprecated
    procedure setStartDelay(transitionType: Integer; delay: Int64); cdecl;//Deprecated
  end;
  TJLayoutTransition = class(TJavaGenericImport<JLayoutTransitionClass, JLayoutTransition>) end;

  JLayoutTransition_TransitionListenerClass = interface(IJavaClass)
    ['{9FA6F1EC-8EDB-4A05-AF58-B55A525AE114}']
    {class} procedure endTransition(transition: JLayoutTransition; container: JViewGroup; view: JView; transitionType: Integer); cdecl;//Deprecated
    {class} procedure startTransition(transition: JLayoutTransition; container: JViewGroup; view: JView; transitionType: Integer); cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/LayoutTransition$TransitionListener')]
  JLayoutTransition_TransitionListener = interface(IJavaInstance)
    ['{0FBE048F-FCDA-4692-B6F1-DE0F07FAE885}']
  end;
  TJLayoutTransition_TransitionListener = class(TJavaGenericImport<JLayoutTransition_TransitionListenerClass, JLayoutTransition_TransitionListener>) end;

  JPropertyValuesHolderClass = interface(JObjectClass)
    ['{36C77AFF-9C3F-42B6-88F3-320FE8CF9B25}']
    {class} function ofMultiFloat(propertyName: JString; values: TJavaBiArray<Single>): JPropertyValuesHolder; cdecl; overload;
    {class} function ofMultiFloat(propertyName: JString; path: JPath): JPropertyValuesHolder; cdecl; overload;
    {class} function ofMultiInt(propertyName: JString; values: TJavaBiArray<Integer>): JPropertyValuesHolder; cdecl; overload;
    {class} function ofMultiInt(propertyName: JString; path: JPath): JPropertyValuesHolder; cdecl; overload;
    {class} function ofObject(propertyName: JString; converter: JTypeConverter; path: JPath): JPropertyValuesHolder; cdecl; overload;
    {class} function ofObject(property_: JProperty; converter: JTypeConverter; path: JPath): JPropertyValuesHolder; cdecl; overload;
    {class} procedure setConverter(converter: JTypeConverter); cdecl;
    {class} procedure setEvaluator(evaluator: JTypeEvaluator); cdecl;
    {class} procedure setProperty(property_: JProperty); cdecl;
    {class} procedure setPropertyName(propertyName: JString); cdecl;
  end;

  [JavaSignature('android/animation/PropertyValuesHolder')]
  JPropertyValuesHolder = interface(JObject)
    ['{12B4ABFD-CBCA-4636-AF2D-C386EF895DC3}']
    function clone: JPropertyValuesHolder; cdecl;//Deprecated
    function getPropertyName: JString; cdecl;//Deprecated
    function toString: JString; cdecl;//Deprecated
  end;
  TJPropertyValuesHolder = class(TJavaGenericImport<JPropertyValuesHolderClass, JPropertyValuesHolder>) end;

  JStateListAnimatorClass = interface(JObjectClass)
    ['{109E4067-E218-47B1-93EB-65B8916A98D8}']
    {class} function init: JStateListAnimator; cdecl;//Deprecated
    {class} procedure jumpToCurrentState; cdecl;
  end;

  [JavaSignature('android/animation/StateListAnimator')]
  JStateListAnimator = interface(JObject)
    ['{CA2A9587-26AA-4DC2-8DFF-A1305A37608F}']
    procedure addState(specs: TJavaArray<Integer>; animator: JAnimator); cdecl;
    function clone: JStateListAnimator; cdecl;
  end;
  TJStateListAnimator = class(TJavaGenericImport<JStateListAnimatorClass, JStateListAnimator>) end;

  JTimeInterpolatorClass = interface(IJavaClass)
    ['{1E682A1C-9102-461D-A3CA-5596683F1D66}']
  end;

  [JavaSignature('android/animation/TimeInterpolator')]
  JTimeInterpolator = interface(IJavaInstance)
    ['{639F8A83-7D9B-49AF-A19E-96B27E46D2AB}']
    function getInterpolation(input: Single): Single; cdecl;
  end;
  TJTimeInterpolator = class(TJavaGenericImport<JTimeInterpolatorClass, JTimeInterpolator>) end;

  JTypeConverterClass = interface(JObjectClass)
    ['{BE2DD177-6D79-4B0C-B4F5-4E4CD9D7436D}']
    {class} function init(fromClass: Jlang_Class; toClass: Jlang_Class): JTypeConverter; cdecl;//Deprecated
    {class} function convert(value: JObject): JObject; cdecl;
  end;

  [JavaSignature('android/animation/TypeConverter')]
  JTypeConverter = interface(JObject)
    ['{BFEA4116-0766-4AD9-AA8F-4C15A583EB2E}']
  end;
  TJTypeConverter = class(TJavaGenericImport<JTypeConverterClass, JTypeConverter>) end;

  JTypeEvaluatorClass = interface(IJavaClass)
    ['{15B67CAF-6F50-4AA3-A88F-C5AF78D62FD4}']
  end;

  [JavaSignature('android/animation/TypeEvaluator')]
  JTypeEvaluator = interface(IJavaInstance)
    ['{F436383D-6F44-40D8-ACDD-9057777691FC}']
    function evaluate(fraction: Single; startValue: JObject; endValue: JObject): JObject; cdecl;//Deprecated
  end;
  TJTypeEvaluator = class(TJavaGenericImport<JTypeEvaluatorClass, JTypeEvaluator>) end;

  JValueAnimatorClass = interface(JAnimatorClass)
    ['{FF3B71ED-5A33-45B0-8500-7672B0B98E2C}']
    {class} function _GetINFINITE: Integer; cdecl;
    {class} function _GetRESTART: Integer; cdecl;
    {class} function _GetREVERSE: Integer; cdecl;
    {class} function init: JValueAnimator; cdecl;//Deprecated
    {class} procedure &end; cdecl;//Deprecated
    {class} function getAnimatedFraction: Single; cdecl;//Deprecated
    {class} function getAnimatedValue: JObject; cdecl; overload;//Deprecated
    {class} function getFrameDelay: Int64; cdecl;//Deprecated
    {class} function getInterpolator: JTimeInterpolator; cdecl;//Deprecated
    {class} function getRepeatCount: Integer; cdecl;//Deprecated
    {class} function getValues: TJavaObjectArray<JPropertyValuesHolder>; cdecl;//Deprecated
    {class} function isRunning: Boolean; cdecl;//Deprecated
    {class} function isStarted: Boolean; cdecl;//Deprecated
    {class} procedure pause; cdecl;
    {class} procedure reverse; cdecl;
    {class} procedure setCurrentFraction(fraction: Single); cdecl;
    {class} procedure setCurrentPlayTime(playTime: Int64); cdecl;
    {class} procedure setFrameDelay(frameDelay: Int64); cdecl;
    {class} procedure setInterpolator(value: JTimeInterpolator); cdecl;
    {class} procedure setStartDelay(startDelay: Int64); cdecl;
    {class} procedure start; cdecl;
    {class} property INFINITE: Integer read _GetINFINITE;
    {class} property RESTART: Integer read _GetRESTART;
    {class} property REVERSE: Integer read _GetREVERSE;
  end;

  [JavaSignature('android/animation/ValueAnimator')]
  JValueAnimator = interface(JAnimator)
    ['{70F92B14-EFD4-4DC7-91DE-6617417AE194}']
    procedure addUpdateListener(listener: JValueAnimator_AnimatorUpdateListener); cdecl;//Deprecated
    procedure cancel; cdecl;//Deprecated
    function clone: JValueAnimator; cdecl;//Deprecated
    function getAnimatedValue(propertyName: JString): JObject; cdecl; overload;//Deprecated
    function getCurrentPlayTime: Int64; cdecl;//Deprecated
    function getDuration: Int64; cdecl;//Deprecated
    function getRepeatMode: Integer; cdecl;//Deprecated
    function getStartDelay: Int64; cdecl;//Deprecated
    procedure removeAllUpdateListeners; cdecl;
    procedure removeUpdateListener(listener: JValueAnimator_AnimatorUpdateListener); cdecl;
    procedure resume; cdecl;
    function setDuration(duration: Int64): JValueAnimator; cdecl;
    procedure setEvaluator(value: JTypeEvaluator); cdecl;
    procedure setRepeatCount(value: Integer); cdecl;
    procedure setRepeatMode(value: Integer); cdecl;
    function toString: JString; cdecl;//Deprecated
  end;
  TJValueAnimator = class(TJavaGenericImport<JValueAnimatorClass, JValueAnimator>) end;

  JValueAnimator_AnimatorUpdateListenerClass = interface(IJavaClass)
    ['{9CA50CBF-4462-4445-82CD-13CE985E2DE4}']
    {class} procedure onAnimationUpdate(animation: JValueAnimator); cdecl;
  end;

  [JavaSignature('android/animation/ValueAnimator$AnimatorUpdateListener')]
  JValueAnimator_AnimatorUpdateListener = interface(IJavaInstance)
    ['{0F883491-52EF-4A40-B7D2-FC23E11E46FE}']
  end;
  TJValueAnimator_AnimatorUpdateListener = class(TJavaGenericImport<JValueAnimator_AnimatorUpdateListenerClass, JValueAnimator_AnimatorUpdateListener>) end;

  JPathMotionClass = interface(JObjectClass)
    ['{E1CD1A94-115C-492C-A490-37F0E72956EB}']
    {class} function init: JPathMotion; cdecl; overload;//Deprecated
    {class} function init(context: JContext; attrs: JAttributeSet): JPathMotion; cdecl; overload;//Deprecated
    {class} function getPath(startX: Single; startY: Single; endX: Single; endY: Single): JPath; cdecl;//Deprecated
  end;

  [JavaSignature('android/transition/PathMotion')]
  JPathMotion = interface(JObject)
    ['{BDC08353-C9FB-42D7-97CC-C35837D2F536}']
  end;
  TJPathMotion = class(TJavaGenericImport<JPathMotionClass, JPathMotion>) end;

  JSceneClass = interface(JObjectClass)
    ['{8B9120CA-AEEA-4DE3-BDC9-15CFD23A7B07}']
    {class} function init(sceneRoot: JViewGroup): JScene; cdecl; overload;//Deprecated
    {class} function init(sceneRoot: JViewGroup; layout: JView): JScene; cdecl; overload;//Deprecated
    {class} function init(sceneRoot: JViewGroup; layout: JViewGroup): JScene; cdecl; overload;//Deprecated
    {class} function getSceneForLayout(sceneRoot: JViewGroup; layoutId: Integer; context: JContext): JScene; cdecl;
    {class} function getSceneRoot: JViewGroup; cdecl;
    {class} procedure setEnterAction(action: JRunnable); cdecl;
    {class} procedure setExitAction(action: JRunnable); cdecl;
  end;

  [JavaSignature('android/transition/Scene')]
  JScene = interface(JObject)
    ['{85A60B99-5837-4F1F-A344-C627DD586B82}']
    procedure enter; cdecl;
    procedure exit; cdecl;
  end;
  TJScene = class(TJavaGenericImport<JSceneClass, JScene>) end;

  JTransitionClass = interface(JObjectClass)
    ['{60EC06BC-8F7A-4416-A04B-5B57987EB18E}']
    {class} function _GetMATCH_ID: Integer; cdecl;
    {class} function _GetMATCH_INSTANCE: Integer; cdecl;
    {class} function _GetMATCH_ITEM_ID: Integer; cdecl;
    {class} function _GetMATCH_NAME: Integer; cdecl;
    {class} function init: JTransition; cdecl; overload;//Deprecated
    {class} function init(context: JContext; attrs: JAttributeSet): JTransition; cdecl; overload;//Deprecated
    {class} function addTarget(targetId: Integer): JTransition; cdecl; overload;//Deprecated
    {class} function addTarget(targetName: JString): JTransition; cdecl; overload;//Deprecated
    {class} function addTarget(targetType: Jlang_Class): JTransition; cdecl; overload;//Deprecated
    {class} procedure captureStartValues(transitionValues: JTransitionValues); cdecl;//Deprecated
    {class} function clone: JTransition; cdecl;//Deprecated
    {class} function createAnimator(sceneRoot: JViewGroup; startValues: JTransitionValues; endValues: JTransitionValues): JAnimator; cdecl;//Deprecated
    {class} function excludeTarget(targetId: Integer; exclude: Boolean): JTransition; cdecl; overload;//Deprecated
    {class} function excludeTarget(targetName: JString; exclude: Boolean): JTransition; cdecl; overload;//Deprecated
    {class} function excludeTarget(target: JView; exclude: Boolean): JTransition; cdecl; overload;//Deprecated
    {class} function getEpicenterCallback: JTransition_EpicenterCallback; cdecl;//Deprecated
    {class} function getInterpolator: JTimeInterpolator; cdecl;//Deprecated
    {class} function getName: JString; cdecl;//Deprecated
    {class} function getTargetIds: JList; cdecl;
    {class} function getTargetNames: JList; cdecl;
    {class} function getTargetTypes: JList; cdecl;
    {class} function isTransitionRequired(startValues: JTransitionValues; endValues: JTransitionValues): Boolean; cdecl;
    {class} function removeListener(listener: JTransition_TransitionListener): JTransition; cdecl;
    {class} function removeTarget(target: Jlang_Class): JTransition; cdecl; overload;
    {class} function setDuration(duration: Int64): JTransition; cdecl;
    {class} procedure setEpicenterCallback(epicenterCallback: JTransition_EpicenterCallback); cdecl;
    {class} procedure setPropagation(transitionPropagation: JTransitionPropagation); cdecl;
    {class} function setStartDelay(startDelay: Int64): JTransition; cdecl;
    {class} function toString: JString; cdecl;
    {class} property MATCH_ID: Integer read _GetMATCH_ID;
    {class} property MATCH_INSTANCE: Integer read _GetMATCH_INSTANCE;
    {class} property MATCH_ITEM_ID: Integer read _GetMATCH_ITEM_ID;
    {class} property MATCH_NAME: Integer read _GetMATCH_NAME;
  end;

  [JavaSignature('android/transition/Transition')]
  JTransition = interface(JObject)
    ['{C2F8200F-1C83-40AE-8C5B-C0C8BFF17F88}']
    function addListener(listener: JTransition_TransitionListener): JTransition; cdecl;//Deprecated
    function addTarget(target: JView): JTransition; cdecl; overload;//Deprecated
    function canRemoveViews: Boolean; cdecl;//Deprecated
    procedure captureEndValues(transitionValues: JTransitionValues); cdecl;//Deprecated
    function excludeChildren(targetId: Integer; exclude: Boolean): JTransition; cdecl; overload;//Deprecated
    function excludeChildren(target: JView; exclude: Boolean): JTransition; cdecl; overload;//Deprecated
    function excludeChildren(type_: Jlang_Class; exclude: Boolean): JTransition; cdecl; overload;//Deprecated
    function excludeTarget(type_: Jlang_Class; exclude: Boolean): JTransition; cdecl; overload;//Deprecated
    function getDuration: Int64; cdecl;//Deprecated
    function getEpicenter: JRect; cdecl;//Deprecated
    function getPathMotion: JPathMotion; cdecl;
    function getPropagation: JTransitionPropagation; cdecl;
    function getStartDelay: Int64; cdecl;
    function getTargets: JList; cdecl;
    function getTransitionProperties: TJavaObjectArray<JString>; cdecl;
    function getTransitionValues(view: JView; start: Boolean): JTransitionValues; cdecl;
    function removeTarget(targetId: Integer): JTransition; cdecl; overload;
    function removeTarget(targetName: JString): JTransition; cdecl; overload;
    function removeTarget(target: JView): JTransition; cdecl; overload;
    function setInterpolator(interpolator: JTimeInterpolator): JTransition; cdecl;
    procedure setPathMotion(pathMotion: JPathMotion); cdecl;
  end;
  TJTransition = class(TJavaGenericImport<JTransitionClass, JTransition>) end;

  JTransition_EpicenterCallbackClass = interface(JObjectClass)
    ['{8141257A-130B-466C-A08D-AA3A00946F4C}']
    {class} function init: JTransition_EpicenterCallback; cdecl;//Deprecated
    {class} function onGetEpicenter(transition: JTransition): JRect; cdecl;//Deprecated
  end;

  [JavaSignature('android/transition/Transition$EpicenterCallback')]
  JTransition_EpicenterCallback = interface(JObject)
    ['{CE004917-266F-4076-8913-F23184824FBA}']
  end;
  TJTransition_EpicenterCallback = class(TJavaGenericImport<JTransition_EpicenterCallbackClass, JTransition_EpicenterCallback>) end;

  JTransition_TransitionListenerClass = interface(IJavaClass)
    ['{D5083752-E8A6-46DF-BE40-AE11073C387E}']
    {class} procedure onTransitionResume(transition: JTransition); cdecl;//Deprecated
    {class} procedure onTransitionStart(transition: JTransition); cdecl;//Deprecated
  end;

  [JavaSignature('android/transition/Transition$TransitionListener')]
  JTransition_TransitionListener = interface(IJavaInstance)
    ['{C32BE107-6E05-4898-AF0A-FAD970D66E29}']
    procedure onTransitionCancel(transition: JTransition); cdecl;//Deprecated
    procedure onTransitionEnd(transition: JTransition); cdecl;//Deprecated
    procedure onTransitionPause(transition: JTransition); cdecl;//Deprecated
  end;
  TJTransition_TransitionListener = class(TJavaGenericImport<JTransition_TransitionListenerClass, JTransition_TransitionListener>) end;

  JTransitionManagerClass = interface(JObjectClass)
    ['{4160EFA0-3499-4964-817E-46497BB5B957}']
    {class} function init: JTransitionManager; cdecl;//Deprecated
    {class} procedure beginDelayedTransition(sceneRoot: JViewGroup); cdecl; overload;
    {class} procedure beginDelayedTransition(sceneRoot: JViewGroup; transition: JTransition); cdecl; overload;
    {class} procedure endTransitions(sceneRoot: JViewGroup); cdecl;
    {class} procedure go(scene: JScene); cdecl; overload;
    {class} procedure go(scene: JScene; transition: JTransition); cdecl; overload;
    {class} procedure setTransition(scene: JScene; transition: JTransition); cdecl; overload;
  end;

  [JavaSignature('android/transition/TransitionManager')]
  JTransitionManager = interface(JObject)
    ['{FF5E1210-1F04-4F81-9CAC-3D7A5C4E972B}']
    procedure setTransition(fromScene: JScene; toScene: JScene; transition: JTransition); cdecl; overload;
    procedure transitionTo(scene: JScene); cdecl;
  end;
  TJTransitionManager = class(TJavaGenericImport<JTransitionManagerClass, JTransitionManager>) end;

  JTransitionPropagationClass = interface(JObjectClass)
    ['{A881388A-C877-4DD9-9BAD-1BA4F56133EE}']
    {class} function init: JTransitionPropagation; cdecl;//Deprecated
    {class} procedure captureValues(transitionValues: JTransitionValues); cdecl;//Deprecated
  end;

  [JavaSignature('android/transition/TransitionPropagation')]
  JTransitionPropagation = interface(JObject)
    ['{7595B7EF-6BCE-4281-BC67-335E2FB6C091}']
    function getPropagationProperties: TJavaObjectArray<JString>; cdecl;//Deprecated
    function getStartDelay(sceneRoot: JViewGroup; transition: JTransition; startValues: JTransitionValues; endValues: JTransitionValues): Int64; cdecl;//Deprecated
  end;
  TJTransitionPropagation = class(TJavaGenericImport<JTransitionPropagationClass, JTransitionPropagation>) end;

  JTransitionValuesClass = interface(JObjectClass)
    ['{3BF98CFA-6A4D-4815-8D42-15E97C916D91}']
    {class} function init: JTransitionValues; cdecl;//Deprecated
    {class} function equals(other: JObject): Boolean; cdecl;//Deprecated
    {class} function hashCode: Integer; cdecl;//Deprecated
    {class} function toString: JString; cdecl;//Deprecated
  end;

  [JavaSignature('android/transition/TransitionValues')]
  JTransitionValues = interface(JObject)
    ['{178E09E6-D32C-48A9-ADCF-8CCEA804052A}']
    function _Getvalues: JMap; cdecl;
    function _Getview: JView; cdecl;
    procedure _Setview(Value: JView); cdecl;
    property values: JMap read _Getvalues;
    property view: JView read _Getview write _Setview;
  end;
  TJTransitionValues = class(TJavaGenericImport<JTransitionValuesClass, JTransitionValues>) end;

  JInterpolatorClass = interface(JTimeInterpolatorClass)
    ['{A575B46A-E489-409C-807A-1B8F2BE092E8}']
  end;

  [JavaSignature('android/view/animation/Interpolator')]
  JInterpolator = interface(JTimeInterpolator)
    ['{F1082403-52DA-4AF0-B017-DAB334325FC7}']
  end;
  TJInterpolator = class(TJavaGenericImport<JInterpolatorClass, JInterpolator>) end;

  JToolbar_LayoutParamsClass = interface(JActionBar_LayoutParamsClass)
    ['{6D43796C-C163-4084-BB30-6FE68AFD7ABB}']
    {class} function init(c: JContext; attrs: JAttributeSet): JToolbar_LayoutParams; cdecl; overload;//Deprecated
    {class} function init(width: Integer; height: Integer): JToolbar_LayoutParams; cdecl; overload;//Deprecated
    {class} function init(width: Integer; height: Integer; gravity: Integer): JToolbar_LayoutParams; cdecl; overload;//Deprecated
    {class} function init(gravity: Integer): JToolbar_LayoutParams; cdecl; overload;//Deprecated
    {class} function init(source: JToolbar_LayoutParams): JToolbar_LayoutParams; cdecl; overload;//Deprecated
    {class} function init(source: JActionBar_LayoutParams): JToolbar_LayoutParams; cdecl; overload;//Deprecated
    {class} function init(source: JViewGroup_MarginLayoutParams): JToolbar_LayoutParams; cdecl; overload;//Deprecated
    {class} function init(source: JViewGroup_LayoutParams): JToolbar_LayoutParams; cdecl; overload;//Deprecated
  end;

  [JavaSignature('android/widget/Toolbar$LayoutParams')]
  JToolbar_LayoutParams = interface(JActionBar_LayoutParams)
    ['{BCD101F9-B7B7-4B2F-9460-056B3EA7B9F0}']
  end;
  TJToolbar_LayoutParams = class(TJavaGenericImport<JToolbar_LayoutParamsClass, JToolbar_LayoutParams>) end;

  JEventListenerManagerClass = interface(JObjectClass)
    ['{5B0F149A-E8E7-4ECB-AAE1-98D1A58E667C}']
    {class} function init: JEventListenerManager; cdecl;
  end;

  [JavaSignature('com/hanmiit/event/EventListenerManager')]
  JEventListenerManager = interface(JObject)
    ['{B44860E7-B166-4682-AE90-77D1D86E5164}']
    //procedure addEventListener(P1: J); cdecl;
    procedure removeAll; cdecl;
    //procedure removeEventListener(P1: J); cdecl;
    procedure removeLastEventListener; cdecl;
  end;
  TJEventListenerManager = class(TJavaGenericImport<JEventListenerManagerClass, JEventListenerManager>) end;

  JATRfidManagerClass = interface(JObjectClass)
    ['{2CA09FA3-3EDA-4D2A-825A-13973F35FE83}']
    {class} function _GetREQUEST_BLE_DEVICE_LIST: Integer; cdecl;
    {class} function _GetREQUEST_DEVICE_LIST: Integer; cdecl;
    {class} function _GetREQUEST_ENABLE_BLUETOOTH: Integer; cdecl;
    {class} procedure checkEnableBluetooth(P1: JContext); cdecl;
    {class} function connectMostRecentDevice: Boolean; cdecl; overload;
    {class} function connectMostRecentDevice(P1: Integer): Boolean; cdecl; overload;
    {class} procedure ensureDiscoverable(P1: JContext; P2: Integer); cdecl;
    {class} function getContext: JContext; cdecl;
    {class} function getInstance: JATRfidReader; cdecl; overload;
    {class} function getInstance(P1: Integer): JATRfidReader; cdecl; overload;
    {class} function getReaderAddress(P1: JIntent): JString; cdecl;
    {class} function getReaderId(P1: JIntent): Integer; cdecl;
    {class} function getRefCount: Integer; cdecl; overload;
    {class} function getRefCount(P1: Integer): Integer; cdecl; overload;
    {class} function getVersion: JString; cdecl;
    {class} function init: JATRfidManager; cdecl;
    {class} function isBluetoothLeSupported(P1: JContext): Boolean; cdecl;
    {class} function isBluetoothSupported: Boolean; cdecl;
    {class} procedure onActivityResult(P1: Integer; P2: Integer; P3: JIntent); cdecl;
    {class} procedure onDestroy; cdecl; overload;
    {class} procedure onDestroy(P1: Integer); cdecl; overload;
    {class} procedure openBleDeviceListActivity(P1: JContext); cdecl; overload;
    {class} procedure openBleDeviceListActivity(P1: JContext; P2: Integer); cdecl; overload;
    {class} procedure openDeviceListActivity(P1: JContext); cdecl; overload;
    {class} procedure openDeviceListActivity(P1: JContext; P2: Integer); cdecl; overload;
    {class} procedure setContext(P1: JContext); cdecl;
    {class} property REQUEST_BLE_DEVICE_LIST: Integer read _GetREQUEST_BLE_DEVICE_LIST;
    {class} property REQUEST_DEVICE_LIST: Integer read _GetREQUEST_DEVICE_LIST;
    {class} property REQUEST_ENABLE_BLUETOOTH: Integer read _GetREQUEST_ENABLE_BLUETOOTH;
  end;

  [JavaSignature('com/hanmiit/lib/ATRfidManager')]
  JATRfidManager = interface(JObject)
    ['{2C6A7DA0-9FFE-4F2C-A6F9-0355341B20B3}']
  end;
  TJATRfidManager = class(TJavaGenericImport<JATRfidManagerClass, JATRfidManager>) end;

  JATRfidReaderClass = interface(JObjectClass)
    ['{5175E940-3DDF-428A-8DB9-FAA67AB5C6B4}']
    {class} function _GetMAX_SELECTION_MASK: Integer; cdecl;
    {class} function _GetMIN_SELECTION_MASK: Integer; cdecl;
    {class} property MAX_SELECTION_MASK: Integer read _GetMAX_SELECTION_MASK;
    {class} property MIN_SELECTION_MASK: Integer read _GetMIN_SELECTION_MASK;
  end;

  [JavaSignature('com/hanmiit/lib/ATRfidReader')]
  JATRfidReader = interface(JObject)
    ['{B0DF8257-4800-4774-AC74-0BC593F7609B}']
    procedure addEpcMask(P1: JSelectMaskEpcParam); cdecl; overload;
    procedure addEpcMask(P1: Integer; P2: Integer; P3: JString); cdecl; overload;
    function blockErase(P1: JMemoryBank; P2: Integer; P3: Integer): Jtype_ResultCode; cdecl;
    function blockWrite(P1: JMemoryBank; P2: Integer; P3: JString): Jtype_ResultCode; cdecl;
    procedure clearEpcMask; cdecl;
    procedure clearSelectionMask; cdecl;
    procedure connectBleDevice; cdecl; overload;
    procedure connectBleDevice(P1: JString); cdecl; overload;
    procedure connectDevice; cdecl; overload;
    procedure connectDevice(P1: JString); cdecl; overload;
    function defaultParameter: Jtype_ResultCode; cdecl;
    procedure destroy; cdecl;
    procedure disconnectDevice; cdecl;
    function getAccessPassword: JString; cdecl;
    function getAction: JActionState; cdecl;
    function getActionTIDReadLength: Integer; cdecl;
    function getAddress: JString; cdecl;
    function getAutoOffTime: Integer; cdecl;
    function getBarcodeAllParam: JParamValueList; cdecl;
    function getBarcodeMode: Boolean; cdecl;
    function getBarcodeParam(P1: TJavaObjectArray<JParamName>): JParamValueList; cdecl;
    function getBatteryStatus: Integer; cdecl;
    function getBleVersion: JString; cdecl;
    function getBuzzer: JBuzzerState; cdecl;
    function getCharset: JCharset; cdecl;
    function getContinuousMode: Boolean; cdecl;
    function getCurrentLinkProfile: Integer; cdecl;
    function getDefaultLinkProfile: Integer; cdecl;
    function getEpcMask(P1: Integer): JSelectMaskEpcParam; cdecl;
    function getEpcMaskCount: Integer; cdecl;
    function getEpcMaskMatchMode: Boolean; cdecl;
    function getFirmwareVersion: JString; cdecl;
    function getId: Integer; cdecl;
    function getIdleTime: Integer; cdecl;
    function getInventorySession: JSessionType; cdecl;
    function getInventoryTime: Integer; cdecl;
    function getLbt: TJavaObjectArray<JLbtItem>; cdecl;
    function getLbtFreq(P1: Integer): JString; cdecl;
    function getLbtMask: TJavaArray<Integer>; cdecl;
    function getLimitTagCount: Integer; cdecl;
    function getOperationMode: JOperationMode; cdecl;
    function getOperationTime: Integer; cdecl;
    function getPowerGain: Integer; cdecl;
    function getPowerGainRange: JMinMaxValue; cdecl;
    function getReportMode: Boolean; cdecl;
    function getReportRSSI: Boolean; cdecl;
    function getResultCode: Jtype_ResultCode; cdecl;
    function getSameTagReportTime: Integer; cdecl;
    function getSelectionMask(P1: Integer): JSelectMaskParam; cdecl;
    function getSerialNumber: JString; cdecl;
    function getSessionFlag: JSessionFlag; cdecl;
    function getState: JConnectionState; cdecl;
    function getStoredMode: Boolean; cdecl;
    function getStoredTagCount: Integer; cdecl;
    function getTime: JDate; cdecl;
    function getUseKeyAction: Boolean; cdecl;
    function getUseSelectionMask: JSelectFlag; cdecl;
    function hardReset: Jtype_ResultCode; cdecl;
    function inventory: Jtype_ResultCode; cdecl;
    function isBarcodeModule: Boolean; cdecl;
    function kill(P1: JString): Jtype_ResultCode; cdecl;
    function loadDebugMessage: Jtype_ResultCode; cdecl;
    function loadStoredTag: Jtype_ResultCode; cdecl;
    function lock(P1: JLockParam): Jtype_ResultCode; cdecl;
    function permaLock(P1: JLockParam): Jtype_ResultCode; cdecl;
    function readMemory(P1: JMemoryBank; P2: Integer; P3: Integer): Jtype_ResultCode; cdecl;
    function removeAllStoredTags: Jtype_ResultCode; cdecl;
    procedure removeEventListener(P1: JATRfidEventListener); cdecl;
    procedure removeSelectionMask(P1: Integer); cdecl;
    procedure saveEpcMask; cdecl;
    function saveParameter: Jtype_ResultCode; cdecl;
    function saveStoredTag(P1: JString): Jtype_ResultCode; cdecl;
    procedure setAccessPassword(P1: JString); cdecl;
    procedure setActionTIDReadLength(P1: Integer); cdecl;
    procedure setAddress(P1: JString); cdecl;
    procedure setAutoOffTime(P1: Integer); cdecl;
    procedure setBarcodeContinueMode(P1: Boolean); cdecl;
    function setBarcodeMode(P1: Boolean; P2: Integer): Jtype_ResultCode; cdecl;
    function setBarcodeParam(P1: JParamValueList): Boolean; cdecl;
    procedure setBuzzer(P1: JBuzzerState); cdecl;
    procedure setCarrierWaveDelay(P1: Integer); cdecl;
    function setCharset(P1: JCharset): Boolean; cdecl;
    procedure setContinuousMode(P1: Boolean); cdecl;
    procedure setCurrentLinkProfile(P1: Integer); cdecl;
    procedure setDebugMode(P1: Boolean); cdecl;
    procedure setDefaultLinkProfile(P1: Integer); cdecl;
    procedure setEpcMaskMatchMode(P1: Boolean); cdecl;
    procedure setEventListener(P1: JATRfidEventListener); cdecl;
    procedure setIdleTime(P1: Integer); cdecl;
    procedure setInventorySession(P1: JSessionType); cdecl;
    procedure setInventoryTime(P1: Integer); cdecl;
    procedure setLbt(P1: TJavaObjectArray<JLbtItem>); cdecl;
    procedure setLimitTagCount(P1: Integer); cdecl;
    procedure setOperationMode(P1: JOperationMode); cdecl;
    procedure setOperationTime(P1: Integer); cdecl;
    procedure setPowerGain(P1: Integer); cdecl;
    procedure setReportMode(P1: Boolean); cdecl;
    procedure setReportRSSI(P1: Boolean); cdecl;
    procedure setSameTagReportTime(P1: Integer); cdecl;
    procedure setSelectionMask(P1: Integer; P2: JSelectMaskParam); cdecl;
    procedure setSerialNumber(P1: JString); cdecl;
    procedure setSessionFlag(P1: JSessionFlag); cdecl;
    procedure setStoredMode(P1: Boolean); cdecl;
    procedure setTime(P1: JDate); cdecl;
    procedure setUseKeyAction(P1: Boolean); cdecl;
    procedure setUseSelectionMask(P1: JSelectFlag); cdecl;
    function softReset: Jtype_ResultCode; cdecl;
    function startDecode: Boolean; cdecl;
    function stop: Jtype_ResultCode; cdecl;
    function stopAsync: Jtype_ResultCode; cdecl;
    function stopDecode: Jtype_ResultCode; cdecl;
    function unlock(P1: JLockParam): Jtype_ResultCode; cdecl;
    function usedSelectionMask(P1: Integer): Boolean; cdecl;
    function writeMemory(P1: JMemoryBank; P2: Integer; P3: JString): Jtype_ResultCode; cdecl;
  end;
  TJATRfidReader = class(TJavaGenericImport<JATRfidReaderClass, JATRfidReader>) end;

  JConnectionStateListenerClass = interface(IJavaClass)
    ['{529438DF-D225-4775-B133-F1DF4C5E1859}']
    {class} procedure onStateChanged(P1: JConnectionState); cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/device/event/ConnectionStateListener')]
  JConnectionStateListener = interface(IJavaInstance)
    ['{15A33AB9-2671-4E66-A425-23EF5674DB45}']
  end;
  TJConnectionStateListener = class(TJavaGenericImport<JConnectionStateListenerClass, JConnectionStateListener>) end;

  JATRfidReader_1Class = interface(JConnectionStateListenerClass)
    ['{9D3FEAA9-492E-4654-891E-4D2954186096}']
  end;

  [JavaSignature('com/hanmiit/lib/ATRfidReader$1')]
  JATRfidReader_1 = interface(JConnectionStateListener)
    ['{984F8A52-713D-44BE-ADCC-68F319E9B240}']
    procedure onStateChanged(P1: JConnectionState); cdecl;
  end;
  TJATRfidReader_1 = class(TJavaGenericImport<JATRfidReader_1Class, JATRfidReader_1>) end;

  JProtocolRfidEventListenerClass = interface(IJavaClass)
    ['{139B2706-06C9-4595-A7E8-098FDA33C543}']
    {class} procedure onAccessResult(P1: Jtype_ResultCode; P2: JActionState; P3: JString; P4: JString; P5: Integer; P6: Integer); cdecl;
    {class} procedure onActionChanged(P1: JActionState); cdecl;
    {class} procedure onCommandComplete(P1: JCommandType); cdecl;
    {class} procedure onDebugMessage(P1: JString); cdecl;
    {class} procedure onDetectBarcode(P1: JBarcodeType; P2: JString; P3: JString); cdecl;
    {class} procedure onLoadTag(P1: JString); cdecl;
    {class} procedure onReadedTag(P1: JActionState; P2: JString; P3: Integer; P4: Integer); cdecl;
    {class} procedure onRemoteKeyChanged(P1: JRemoteKeyState); cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/protocol/event/ProtocolRfidEventListener')]
  JProtocolRfidEventListener = interface(IJavaInstance)
    ['{B2EA1DF3-D098-465F-9402-4ED19986D7E5}']
  end;
  TJProtocolRfidEventListener = class(TJavaGenericImport<JProtocolRfidEventListenerClass, JProtocolRfidEventListener>) end;

  JATRfidReader_2Class = interface(JProtocolRfidEventListenerClass)
    ['{18C8F595-608A-4B53-8B2D-EFB42C9B6CE6}']
  end;

  [JavaSignature('com/hanmiit/lib/ATRfidReader$2')]
  JATRfidReader_2 = interface(JProtocolRfidEventListener)
    ['{1595EC00-F3E1-4CDC-9E02-8FD7B1D08E16}']
    procedure onAccessResult(P1: Jtype_ResultCode; P2: JActionState; P3: JString; P4: JString; P5: Integer; P6: Integer); cdecl;
    procedure onActionChanged(P1: JActionState); cdecl;
    procedure onCommandComplete(P1: JCommandType); cdecl;
    procedure onDebugMessage(P1: JString); cdecl;
    procedure onDetectBarcode(P1: JBarcodeType; P2: JString; P3: JString); cdecl;
    procedure onLoadTag(P1: JString); cdecl;
    procedure onReadedTag(P1: JActionState; P2: JString; P3: Integer; P4: Integer); cdecl;
    procedure onRemoteKeyChanged(P1: JRemoteKeyState); cdecl;
  end;
  TJATRfidReader_2 = class(TJavaGenericImport<JATRfidReader_2Class, JATRfidReader_2>) end;

  JATRfidReader_3Class = interface(JRunnableClass)
    ['{6BB0157B-5F94-4877-99C2-14041C13278E}']
  end;

  [JavaSignature('com/hanmiit/lib/ATRfidReader$3')]
  JATRfidReader_3 = interface(JRunnable)
    ['{71BD5743-89F3-4619-8854-38AE9D0CCF77}']
    procedure run; cdecl;
  end;
  TJATRfidReader_3 = class(TJavaGenericImport<JATRfidReader_3Class, JATRfidReader_3>) end;

  JATRfidReader_EventHandlerClass = interface(JHandlerClass)
    ['{64C8493A-D233-4446-9124-5A68A7C5C6D5}']
    {class} procedure handleMessage(P1: JMessage); cdecl;
    {class} function init(P1: JATRfidReader): JATRfidReader_EventHandler; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/ATRfidReader$EventHandler')]
  JATRfidReader_EventHandler = interface(JHandler)
    ['{B2295A80-6BB7-4D93-B2A9-D00D95C6B934}']
  end;
  TJATRfidReader_EventHandler = class(TJavaGenericImport<JATRfidReader_EventHandlerClass, JATRfidReader_EventHandler>) end;

  JATRfidReader_WatcherClass = interface(JThreadClass)
    ['{CB8AF5BC-3FD7-43D2-B5AE-675BA9BFDB7D}']
  end;

  [JavaSignature('com/hanmiit/lib/ATRfidReader$Watcher')]
  JATRfidReader_Watcher = interface(JThread)
    ['{B0AACB4A-3C5D-408F-9DD6-90CDF16BCDDC}']
    procedure cancel; cdecl;
    procedure run; cdecl;
  end;
  TJATRfidReader_Watcher = class(TJavaGenericImport<JATRfidReader_WatcherClass, JATRfidReader_Watcher>) end;

  JParamHelperClass = interface(JObjectClass)
    ['{810FD01B-8D5F-468D-A70A-182767F31F2B}']
    {class} function getBytes(P1: JParamValueList): TJavaArray<Byte>; cdecl; overload;
    {class} function getBytes(P1: TJavaObjectArray<JParamName>): TJavaArray<Byte>; cdecl; overload;
    {class} function getParamList(P1: TJavaArray<Byte>): JParamValueList; cdecl;
    {class} function init: JParamHelper; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/barcode/ParamHelper')]
  JParamHelper = interface(JObject)
    ['{8294BDA1-B7A3-4753-B18C-34FED20A824E}']
  end;
  TJParamHelper = class(TJavaGenericImport<JParamHelperClass, JParamHelper>) end;

  JParamValueClass = interface(JObjectClass)
    ['{C05EE19C-CB08-4407-8C26-CEBEBAF11D44}']
    {class} function getBoolean: Boolean; cdecl;
    {class} function getName: JParamName; cdecl;
    {class} function getValue: Integer; cdecl;
    {class} function init(P1: JParamName): JParamValue; cdecl; overload;
    {class} function init(P1: JParamName; P2: Boolean): JParamValue; cdecl; overload;
    {class} function init(P1: JParamName; P2: Integer): JParamValue; cdecl; overload;
    {class} procedure setValue(P1: Integer); cdecl;
    {class} function toString: JString; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/barcode/ParamValue')]
  JParamValue = interface(JObject)
    ['{A9B8587F-FAE4-4A4D-A4F2-DE57D3CF3FFD}']
  end;
  TJParamValue = class(TJavaGenericImport<JParamValueClass, JParamValue>) end;

  JParamValueListClass = interface(JIterableClass)
    ['{56F3AA35-858D-4DFD-B9C1-DC4B011E7577}']
    {class} procedure add(P1: TJavaObjectArray<JParamName>); cdecl; overload;
    {class} procedure add(P1: JParamName); cdecl; overload;
    {class} procedure add(P1: TJavaObjectArray<JParamValue>); cdecl; overload;
    {class} procedure add(P1: JParamValue); cdecl; overload;
    {class} procedure add(P1: JParamName; P2: Integer); cdecl; overload;
    {class} procedure clear; cdecl;
    {class} function &get(P1: JParamName): JParamValue; cdecl;
    {class} function getBoolean(P1: JParamName): Boolean; cdecl;
    {class} function getLength: Integer; cdecl;
    {class} function getValue(P1: JParamName): Integer; cdecl;
    {class} function init: JParamValueList; cdecl; overload;
    {class} function init(P1: TJavaObjectArray<JParamValue>): JParamValueList; cdecl; overload;
    {class} function init(P1: TJavaObjectArray<JParamName>): JParamValueList; cdecl; overload;
    {class} function iterator: JIterator; cdecl;
    {class} procedure remove(P1: JParamName); cdecl;
    {class} function toString: JString; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/barcode/ParamValueList')]
  JParamValueList = interface(JIterable)
    ['{B4D7F9E7-691F-4429-99A8-6C3F7D3DDCE0}']
  end;
  TJParamValueList = class(TJavaGenericImport<JParamValueListClass, JParamValueList>) end;

  JDecodeEventArgsClass = interface(JObjectClass)
    ['{08A9FA8C-8432-46D5-A185-10561865BEF2}']
    {class} function getBarcode: JString; cdecl;
    {class} function getCodeId: JString; cdecl;
    {class} function getType: JBarcodeType; cdecl;
    {class} function init(P1: JBarcodeType; P2: JString; P3: JString): JDecodeEventArgs; cdecl;
    {class} function toString: JString; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/barcode/args/DecodeEventArgs')]
  JDecodeEventArgs = interface(JObject)
    ['{CE511FA6-FD3D-4512-A951-FE0A7D4FEB26}']
  end;
  TJDecodeEventArgs = class(TJavaGenericImport<JDecodeEventArgsClass, JDecodeEventArgs>) end;

  JPayloadBufferClass = interface(JObjectClass)
    ['{C3BFA651-2B8F-43BD-92F7-9AE1DFDB48D4}']
    {class} function getCommand: JSSICommand; cdecl;
    {class} function getLength: Integer; cdecl;
    {class} function init: JPayloadBuffer; cdecl;
    {class} procedure put(P1: TJavaArray<Byte>); cdecl;
    {class} function reset: TJavaArray<Byte>; cdecl;
    {class} procedure setCommand(P1: JSSICommand); cdecl;
    {class} function toString: JString; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/barcode/param/PayloadBuffer')]
  JPayloadBuffer = interface(JObject)
    ['{6025C0FB-D884-4B27-B237-4978BD7CFD6B}']
  end;
  TJPayloadBuffer = class(TJavaGenericImport<JPayloadBufferClass, JPayloadBuffer>) end;

  JResultBytesValueClass = interface(JObjectClass)
    ['{D287D7C5-9CE7-4690-B00E-8B90BA6255CC}']
    {class} function getPayload: TJavaArray<Byte>; cdecl;
    {class} function getResult: Boolean; cdecl;
    {class} function init(P1: Boolean): JResultBytesValue; cdecl; overload;
    {class} function init(P1: Boolean; P2: TJavaArray<Byte>): JResultBytesValue; cdecl; overload;
    {class} function toString: JString; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/barcode/param/ResultBytesValue')]
  JResultBytesValue = interface(JObject)
    ['{CE1CFC37-B6C4-47A8-B0E3-07192E6F7AAE}']
  end;
  TJResultBytesValue = class(TJavaGenericImport<JResultBytesValueClass, JResultBytesValue>) end;

  JBarcodeTypeClass = interface(JEnumClass)
    ['{2FD6C547-A163-4F4F-9876-55524A48D3E1}']
    {class} function _GetAustralianPost: JBarcodeType; cdecl;
    {class} function _GetAztecCode: JBarcodeType; cdecl;
    {class} function _GetAztecRuneCode: JBarcodeType; cdecl;
    {class} function _GetBooklandEAN: JBarcodeType; cdecl;
    {class} function _GetBritishPost: JBarcodeType; cdecl;
    {class} function _GetCanadianPost: JBarcodeType; cdecl;
    {class} function _GetChinaPost: JBarcodeType; cdecl;
    {class} function _GetCodabar: JBarcodeType; cdecl;
    {class} function _GetCodablockF: JBarcodeType; cdecl;
    {class} function _GetCode11: JBarcodeType; cdecl;
    {class} function _GetCode128: JBarcodeType; cdecl;
    {class} function _GetCode16K: JBarcodeType; cdecl;
    {class} function _GetCode32: JBarcodeType; cdecl;
    {class} function _GetCode39: JBarcodeType; cdecl;
    {class} function _GetCode49: JBarcodeType; cdecl;
    {class} function _GetCode93: JBarcodeType; cdecl;
    {class} function _GetComposite: JBarcodeType; cdecl;
    {class} function _GetD2of5: JBarcodeType; cdecl;
    {class} function _GetDataMatrix: JBarcodeType; cdecl;
    {class} function _GetEAN128: JBarcodeType; cdecl;
    {class} function _GetEAN13: JBarcodeType; cdecl;
    {class} function _GetEAN13CouponCode: JBarcodeType; cdecl;
    {class} function _GetEAN8: JBarcodeType; cdecl;
    {class} function _GetHanXin: JBarcodeType; cdecl;
    {class} function _GetI2of5: JBarcodeType; cdecl;
    {class} function _GetIATA: JBarcodeType; cdecl;
    {class} function _GetISBT128: JBarcodeType; cdecl;
    {class} function _GetISBT128Concat: JBarcodeType; cdecl;
    {class} function _GetJapanesePost: JBarcodeType; cdecl;
    {class} function _GetKixPost: JBarcodeType; cdecl;
    {class} function _GetKoreaPost: JBarcodeType; cdecl;
    {class} function _GetMSI: JBarcodeType; cdecl;
    {class} function _GetMacroMicroPDF: JBarcodeType; cdecl;
    {class} function _GetMaxiCode: JBarcodeType; cdecl;
    {class} function _GetMicroPDF: JBarcodeType; cdecl;
    {class} function _GetMicroQR: JBarcodeType; cdecl;
    {class} function _GetMultipacketFormat: JBarcodeType; cdecl;
    {class} function _GetNoRead: JBarcodeType; cdecl;
    {class} function _GetOCR: JBarcodeType; cdecl;
    {class} function _GetPDF417: JBarcodeType; cdecl;
    {class} function _GetParameterFNC3: JBarcodeType; cdecl;
    {class} function _GetPlanetCode: JBarcodeType; cdecl;
    {class} function _GetPlesseyCode: JBarcodeType; cdecl;
    {class} function _GetPosiCode: JBarcodeType; cdecl;
    {class} function _GetPostnet: JBarcodeType; cdecl;
    {class} function _GetQRCode: JBarcodeType; cdecl;
    {class} function _GetR2of5: JBarcodeType; cdecl;
    {class} function _GetRSS: JBarcodeType; cdecl;
    {class} function _GetScanletWebcode: JBarcodeType; cdecl;
    {class} function _GetTLC39: JBarcodeType; cdecl;
    {class} function _GetTelepen: JBarcodeType; cdecl;
    {class} function _GetTriopticCode: JBarcodeType; cdecl;
    {class} function _GetUPCA: JBarcodeType; cdecl;
    {class} function _GetUPCE: JBarcodeType; cdecl;
    {class} function _GetUPUFICSPostal: JBarcodeType; cdecl;
    {class} function _GetUSPS4CB: JBarcodeType; cdecl;
    {class} function _GetVeriCode: JBarcodeType; cdecl;
    {class} function _GetX2of5: JBarcodeType; cdecl;
    {class} function valueOf(P1: JString): JBarcodeType; cdecl;
    {class} function values: TJavaObjectArray<JBarcodeType>; cdecl;
    {class} property AustralianPost: JBarcodeType read _GetAustralianPost;
    {class} property AztecCode: JBarcodeType read _GetAztecCode;
    {class} property AztecRuneCode: JBarcodeType read _GetAztecRuneCode;
    {class} property BooklandEAN: JBarcodeType read _GetBooklandEAN;
    {class} property BritishPost: JBarcodeType read _GetBritishPost;
    {class} property CanadianPost: JBarcodeType read _GetCanadianPost;
    {class} property ChinaPost: JBarcodeType read _GetChinaPost;
    {class} property Codabar: JBarcodeType read _GetCodabar;
    {class} property CodablockF: JBarcodeType read _GetCodablockF;
    {class} property Code11: JBarcodeType read _GetCode11;
    {class} property Code128: JBarcodeType read _GetCode128;
    {class} property Code16K: JBarcodeType read _GetCode16K;
    {class} property Code32: JBarcodeType read _GetCode32;
    {class} property Code39: JBarcodeType read _GetCode39;
    {class} property Code49: JBarcodeType read _GetCode49;
    {class} property Code93: JBarcodeType read _GetCode93;
    {class} property Composite: JBarcodeType read _GetComposite;
    {class} property D2of5: JBarcodeType read _GetD2of5;
    {class} property DataMatrix: JBarcodeType read _GetDataMatrix;
    {class} property EAN128: JBarcodeType read _GetEAN128;
    {class} property EAN13: JBarcodeType read _GetEAN13;
    {class} property EAN13CouponCode: JBarcodeType read _GetEAN13CouponCode;
    {class} property EAN8: JBarcodeType read _GetEAN8;
    {class} property HanXin: JBarcodeType read _GetHanXin;
    {class} property I2of5: JBarcodeType read _GetI2of5;
    {class} property IATA: JBarcodeType read _GetIATA;
    {class} property ISBT128: JBarcodeType read _GetISBT128;
    {class} property ISBT128Concat: JBarcodeType read _GetISBT128Concat;
    {class} property JapanesePost: JBarcodeType read _GetJapanesePost;
    {class} property KixPost: JBarcodeType read _GetKixPost;
    {class} property KoreaPost: JBarcodeType read _GetKoreaPost;
    {class} property MSI: JBarcodeType read _GetMSI;
    {class} property MacroMicroPDF: JBarcodeType read _GetMacroMicroPDF;
    {class} property MaxiCode: JBarcodeType read _GetMaxiCode;
    {class} property MicroPDF: JBarcodeType read _GetMicroPDF;
    {class} property MicroQR: JBarcodeType read _GetMicroQR;
    {class} property MultipacketFormat: JBarcodeType read _GetMultipacketFormat;
    {class} property NoRead: JBarcodeType read _GetNoRead;
    {class} property OCR: JBarcodeType read _GetOCR;
    {class} property PDF417: JBarcodeType read _GetPDF417;
    {class} property ParameterFNC3: JBarcodeType read _GetParameterFNC3;
    {class} property PlanetCode: JBarcodeType read _GetPlanetCode;
    {class} property PlesseyCode: JBarcodeType read _GetPlesseyCode;
    {class} property PosiCode: JBarcodeType read _GetPosiCode;
    {class} property Postnet: JBarcodeType read _GetPostnet;
    {class} property QRCode: JBarcodeType read _GetQRCode;
    {class} property R2of5: JBarcodeType read _GetR2of5;
    {class} property RSS: JBarcodeType read _GetRSS;
    {class} property ScanletWebcode: JBarcodeType read _GetScanletWebcode;
    {class} property TLC39: JBarcodeType read _GetTLC39;
    {class} property Telepen: JBarcodeType read _GetTelepen;
    {class} property TriopticCode: JBarcodeType read _GetTriopticCode;
    {class} property UPCA: JBarcodeType read _GetUPCA;
    {class} property UPCE: JBarcodeType read _GetUPCE;
    {class} property UPUFICSPostal: JBarcodeType read _GetUPUFICSPostal;
    {class} property USPS4CB: JBarcodeType read _GetUSPS4CB;
    {class} property VeriCode: JBarcodeType read _GetVeriCode;
    {class} property X2of5: JBarcodeType read _GetX2of5;
  end;

  [JavaSignature('com/hanmiit/lib/barcode/type/BarcodeType')]
  JBarcodeType = interface(JEnum)
    ['{0EA41231-373E-415B-86B4-6D2DBB3BFB28}']
    function toString: JString; cdecl;
  end;
  TJBarcodeType = class(TJavaGenericImport<JBarcodeTypeClass, JBarcodeType>) end;

  JBooklandIsbnFormatClass = interface(JEnumClass)
    ['{535E10CD-5018-410D-A5D4-2B798F65AF21}']
    {class} function _GetBooklandIsbn10: JBooklandIsbnFormat; cdecl;
    {class} function _GetBooklandIsbn13: JBooklandIsbnFormat; cdecl;
    {class} function valueOf(P1: JString): JBooklandIsbnFormat; cdecl; overload;
    {class} function valueOf(P1: Byte): JBooklandIsbnFormat; cdecl; overload;
    {class} function values: TJavaObjectArray<JBooklandIsbnFormat>; cdecl;
    {class} property BooklandIsbn10: JBooklandIsbnFormat read _GetBooklandIsbn10;
    {class} property BooklandIsbn13: JBooklandIsbnFormat read _GetBooklandIsbn13;
  end;

  [JavaSignature('com/hanmiit/lib/barcode/type/BooklandIsbnFormat')]
  JBooklandIsbnFormat = interface(JEnum)
    ['{0B1A3C2E-8660-4F4E-94E7-C1CC99A4F373}']
    function getCode: Byte; cdecl;
    function toString: JString; cdecl;
  end;
  TJBooklandIsbnFormat = class(TJavaGenericImport<JBooklandIsbnFormatClass, JBooklandIsbnFormat>) end;

  JCodabarStartStopCharactersDetectionClass = interface(JEnumClass)
    ['{9468A851-3618-474A-B189-E911840AA9C3}']
    {class} function _GetLowerCase: JCodabarStartStopCharactersDetection; cdecl;
    {class} function _GetUpperCase: JCodabarStartStopCharactersDetection; cdecl;
    {class} function valueOf(P1: JString): JCodabarStartStopCharactersDetection; cdecl; overload;
    {class} function valueOf(P1: Integer): JCodabarStartStopCharactersDetection; cdecl; overload;
    {class} function values: TJavaObjectArray<JCodabarStartStopCharactersDetection>; cdecl;
    {class} property LowerCase: JCodabarStartStopCharactersDetection read _GetLowerCase;
    {class} property UpperCase: JCodabarStartStopCharactersDetection read _GetUpperCase;
  end;

  [JavaSignature('com/hanmiit/lib/barcode/type/CodabarStartStopCharactersDetection')]
  JCodabarStartStopCharactersDetection = interface(JEnum)
    ['{826CD72A-C8FA-451E-B358-678272446023}']
    function getCode: Byte; cdecl;
    function toString: JString; cdecl;
  end;
  TJCodabarStartStopCharactersDetection = class(TJavaGenericImport<JCodabarStartStopCharactersDetectionClass, JCodabarStartStopCharactersDetection>) end;

  JCode11CheckDigitVerificationClass = interface(JEnumClass)
    ['{529DE8B2-A7C3-459D-B4B3-0EF60B0E8A6C}']
    {class} function _GetDisable: JCode11CheckDigitVerification; cdecl;
    {class} function _GetOneCheckDigit: JCode11CheckDigitVerification; cdecl;
    {class} function _GetTwoCheckDigit: JCode11CheckDigitVerification; cdecl;
    {class} function valueOf(P1: JString): JCode11CheckDigitVerification; cdecl; overload;
    {class} function valueOf(P1: Byte): JCode11CheckDigitVerification; cdecl; overload;
    {class} function values: TJavaObjectArray<JCode11CheckDigitVerification>; cdecl;
    {class} property Disable: JCode11CheckDigitVerification read _GetDisable;
    {class} property OneCheckDigit: JCode11CheckDigitVerification read _GetOneCheckDigit;
    {class} property TwoCheckDigit: JCode11CheckDigitVerification read _GetTwoCheckDigit;
  end;

  [JavaSignature('com/hanmiit/lib/barcode/type/Code11CheckDigitVerification')]
  JCode11CheckDigitVerification = interface(JEnum)
    ['{149431E0-B495-436B-938E-3801FBF49A6E}']
    function getCode: Byte; cdecl;
    function toString: JString; cdecl;
  end;
  TJCode11CheckDigitVerification = class(TJavaGenericImport<JCode11CheckDigitVerificationClass, JCode11CheckDigitVerification>) end;

  JCompositeBeepModeClass = interface(JEnumClass)
    ['{9A1B3331-D297-4196-A2FA-D202526422AC}']
    {class} function _GetBeepAsEachCodeTypeIsDecoded: JCompositeBeepMode; cdecl;
    {class} function _GetDoubleBeepAfterBothAreDecoded: JCompositeBeepMode; cdecl;
    {class} function _GetSingleBeepAfterBothAreDecoded: JCompositeBeepMode; cdecl;
    {class} function valueOf(P1: JString): JCompositeBeepMode; cdecl; overload;
    {class} function valueOf(P1: Byte): JCompositeBeepMode; cdecl; overload;
    {class} function values: TJavaObjectArray<JCompositeBeepMode>; cdecl;
    {class} property BeepAsEachCodeTypeIsDecoded: JCompositeBeepMode read _GetBeepAsEachCodeTypeIsDecoded;
    {class} property DoubleBeepAfterBothAreDecoded: JCompositeBeepMode read _GetDoubleBeepAfterBothAreDecoded;
    {class} property SingleBeepAfterBothAreDecoded: JCompositeBeepMode read _GetSingleBeepAfterBothAreDecoded;
  end;

  [JavaSignature('com/hanmiit/lib/barcode/type/CompositeBeepMode')]
  JCompositeBeepMode = interface(JEnum)
    ['{23EA109F-CE02-45B3-AF17-E1BB0F24166B}']
    function getCode: Byte; cdecl;
    function toString: JString; cdecl;
  end;
  TJCompositeBeepMode = class(TJavaGenericImport<JCompositeBeepModeClass, JCompositeBeepMode>) end;

  JCouponReportFormatClass = interface(JEnumClass)
    ['{56AD67C9-C358-4966-AB96-2E20315A84F3}']
    {class} function _GetBothCouponFormat: JCouponReportFormat; cdecl;
    {class} function _GetNewCouponSymbols: JCouponReportFormat; cdecl;
    {class} function _GetOldCouponSymbols: JCouponReportFormat; cdecl;
    {class} function valueOf(P1: JString): JCouponReportFormat; cdecl; overload;
    {class} function valueOf(P1: Byte): JCouponReportFormat; cdecl; overload;
    {class} function values: TJavaObjectArray<JCouponReportFormat>; cdecl;
    {class} property BothCouponFormat: JCouponReportFormat read _GetBothCouponFormat;
    {class} property NewCouponSymbols: JCouponReportFormat read _GetNewCouponSymbols;
    {class} property OldCouponSymbols: JCouponReportFormat read _GetOldCouponSymbols;
  end;

  [JavaSignature('com/hanmiit/lib/barcode/type/CouponReportFormat')]
  JCouponReportFormat = interface(JEnum)
    ['{021DA23E-6967-4FAC-9BF1-D2778BE5D709}']
    function getCode: Byte; cdecl;
    function toString: JString; cdecl;
  end;
  TJCouponReportFormat = class(TJavaGenericImport<JCouponReportFormatClass, JCouponReportFormat>) end;

  JDecodeUpcEanSupplementalsClass = interface(JEnumClass)
    ['{689127ED-C89C-4CC6-B45D-BC66F7A2C7EB}']
    {class} function _GetAutodiscriminate: JDecodeUpcEanSupplementals; cdecl;
    {class} function _GetCode37X: JDecodeUpcEanSupplementals; cdecl;
    {class} function _GetCode491: JDecodeUpcEanSupplementals; cdecl;
    {class} function _GetCode4XX: JDecodeUpcEanSupplementals; cdecl;
    {class} function _GetCode977: JDecodeUpcEanSupplementals; cdecl;
    {class} function _GetCode97X: JDecodeUpcEanSupplementals; cdecl;
    {class} function _GetDecode: JDecodeUpcEanSupplementals; cdecl;
    {class} function _GetIgnore: JDecodeUpcEanSupplementals; cdecl;
    {class} function _GetSmart: JDecodeUpcEanSupplementals; cdecl;
    {class} function valueOf(P1: JString): JDecodeUpcEanSupplementals; cdecl; overload;
    {class} function valueOf(P1: Byte): JDecodeUpcEanSupplementals; cdecl; overload;
    {class} function values: TJavaObjectArray<JDecodeUpcEanSupplementals>; cdecl;
    {class} property Autodiscriminate: JDecodeUpcEanSupplementals read _GetAutodiscriminate;
    {class} property Code37X: JDecodeUpcEanSupplementals read _GetCode37X;
    {class} property Code491: JDecodeUpcEanSupplementals read _GetCode491;
    {class} property Code4XX: JDecodeUpcEanSupplementals read _GetCode4XX;
    {class} property Code977: JDecodeUpcEanSupplementals read _GetCode977;
    {class} property Code97X: JDecodeUpcEanSupplementals read _GetCode97X;
    {class} property Decode: JDecodeUpcEanSupplementals read _GetDecode;
    {class} property Ignore: JDecodeUpcEanSupplementals read _GetIgnore;
    {class} property Smart: JDecodeUpcEanSupplementals read _GetSmart;
  end;

  [JavaSignature('com/hanmiit/lib/barcode/type/DecodeUpcEanSupplementals')]
  JDecodeUpcEanSupplementals = interface(JEnum)
    ['{B639111F-4136-4137-9E15-A0F528869660}']
    function getCode: Byte; cdecl;
    function toString: JString; cdecl;
  end;
  TJDecodeUpcEanSupplementals = class(TJavaGenericImport<JDecodeUpcEanSupplementalsClass, JDecodeUpcEanSupplementals>) end;

  JDecodeUpcSupplementalsAIMIDClass = interface(JEnumClass)
    ['{CB192E6D-5346-4986-A66D-0A5C41D8E8CF}']
    {class} function _GetCombined: JDecodeUpcSupplementalsAIMID; cdecl;
    {class} function _GetSeparate: JDecodeUpcSupplementalsAIMID; cdecl;
    {class} function _GetSeparateTransmissions: JDecodeUpcSupplementalsAIMID; cdecl;
    {class} function valueOf(P1: JString): JDecodeUpcSupplementalsAIMID; cdecl; overload;
    {class} function valueOf(P1: Byte): JDecodeUpcSupplementalsAIMID; cdecl; overload;
    {class} function values: TJavaObjectArray<JDecodeUpcSupplementalsAIMID>; cdecl;
    {class} property Combined: JDecodeUpcSupplementalsAIMID read _GetCombined;
    {class} property Separate: JDecodeUpcSupplementalsAIMID read _GetSeparate;
    {class} property SeparateTransmissions: JDecodeUpcSupplementalsAIMID read _GetSeparateTransmissions;
  end;

  [JavaSignature('com/hanmiit/lib/barcode/type/DecodeUpcSupplementalsAIMID')]
  JDecodeUpcSupplementalsAIMID = interface(JEnum)
    ['{E782F8B4-422F-4DA3-BE8B-7B0892085FAD}']
    function getCode: Byte; cdecl;
    function toString: JString; cdecl;
  end;
  TJDecodeUpcSupplementalsAIMID = class(TJavaGenericImport<JDecodeUpcSupplementalsAIMIDClass, JDecodeUpcSupplementalsAIMID>) end;

  JEncodingTypeClass = interface(JEnumClass)
    ['{C5CB2EC2-6F9C-473B-8940-D0CEEA0ED9C3}']
    {class} function _GetAlphanumericEncoding: JEncodingType; cdecl;
    {class} function _GetAutodiscriminate: JEncodingType; cdecl;
    {class} function _GetNumericEncoding: JEncodingType; cdecl;
    {class} function _GetRawFormat: JEncodingType; cdecl;
    {class} function valueOf(P1: JString): JEncodingType; cdecl; overload;
    {class} function valueOf(P1: Byte): JEncodingType; cdecl; overload;
    {class} function values: TJavaObjectArray<JEncodingType>; cdecl;
    {class} property AlphanumericEncoding: JEncodingType read _GetAlphanumericEncoding;
    {class} property Autodiscriminate: JEncodingType read _GetAutodiscriminate;
    {class} property NumericEncoding: JEncodingType read _GetNumericEncoding;
    {class} property RawFormat: JEncodingType read _GetRawFormat;
  end;

  [JavaSignature('com/hanmiit/lib/barcode/type/EncodingType')]
  JEncodingType = interface(JEnum)
    ['{20CBCAAA-47FC-4D4D-8AFF-9268270CF297}']
    function getCode: Byte; cdecl;
    function toString: JString; cdecl;
  end;
  TJEncodingType = class(TJavaGenericImport<JEncodingTypeClass, JEncodingType>) end;

  JGs1DataBarLimitedSecurityLevelClass = interface(JEnumClass)
    ['{65E4D1D9-0C75-4147-A57E-113D2AEBA766}']
    {class} function _GetLevel1: JGs1DataBarLimitedSecurityLevel; cdecl;
    {class} function _GetLevel2: JGs1DataBarLimitedSecurityLevel; cdecl;
    {class} function _GetLevel3: JGs1DataBarLimitedSecurityLevel; cdecl;
    {class} function _GetLevel4: JGs1DataBarLimitedSecurityLevel; cdecl;
    {class} function valueOf(P1: JString): JGs1DataBarLimitedSecurityLevel; cdecl; overload;
    {class} function valueOf(P1: Byte): JGs1DataBarLimitedSecurityLevel; cdecl; overload;
    {class} function values: TJavaObjectArray<JGs1DataBarLimitedSecurityLevel>; cdecl;
    {class} property Level1: JGs1DataBarLimitedSecurityLevel read _GetLevel1;
    {class} property Level2: JGs1DataBarLimitedSecurityLevel read _GetLevel2;
    {class} property Level3: JGs1DataBarLimitedSecurityLevel read _GetLevel3;
    {class} property Level4: JGs1DataBarLimitedSecurityLevel read _GetLevel4;
  end;

  [JavaSignature('com/hanmiit/lib/barcode/type/Gs1DataBarLimitedSecurityLevel')]
  JGs1DataBarLimitedSecurityLevel = interface(JEnum)
    ['{EEF63424-DBC2-41F1-A18A-65A4403E6253}']
    function getCode: Byte; cdecl;
    function toString: JString; cdecl;
  end;
  TJGs1DataBarLimitedSecurityLevel = class(TJavaGenericImport<JGs1DataBarLimitedSecurityLevelClass, JGs1DataBarLimitedSecurityLevel>) end;

  JI2of5CheckDigitVerificationClass = interface(JEnumClass)
    ['{3C858804-7E05-4909-83D7-F973BFB391EB}']
    {class} function _GetDisable: JI2of5CheckDigitVerification; cdecl;
    {class} function _GetOpccCheckDigit: JI2of5CheckDigitVerification; cdecl;
    {class} function _GetUssCheckDigit: JI2of5CheckDigitVerification; cdecl;
    {class} function valueOf(P1: JString): JI2of5CheckDigitVerification; cdecl; overload;
    {class} function valueOf(P1: Integer): JI2of5CheckDigitVerification; cdecl; overload;
    {class} function values: TJavaObjectArray<JI2of5CheckDigitVerification>; cdecl;
    {class} property Disable: JI2of5CheckDigitVerification read _GetDisable;
    {class} property OpccCheckDigit: JI2of5CheckDigitVerification read _GetOpccCheckDigit;
    {class} property UssCheckDigit: JI2of5CheckDigitVerification read _GetUssCheckDigit;
  end;

  [JavaSignature('com/hanmiit/lib/barcode/type/I2of5CheckDigitVerification')]
  JI2of5CheckDigitVerification = interface(JEnum)
    ['{B751E677-4BB9-49C1-9CBD-F903C35112BB}']
    function getCode: Byte; cdecl;
    function toString: JString; cdecl;
  end;
  TJI2of5CheckDigitVerification = class(TJavaGenericImport<JI2of5CheckDigitVerificationClass, JI2of5CheckDigitVerification>) end;

  JI2of5SecurityLevelClass = interface(JEnumClass)
    ['{533BF364-B791-41E3-8623-4F77F65A8512}']
    {class} function _GetSecurityLevel0: JI2of5SecurityLevel; cdecl;
    {class} function _GetSecurityLevel1: JI2of5SecurityLevel; cdecl;
    {class} function _GetSecurityLevel2: JI2of5SecurityLevel; cdecl;
    {class} function _GetSecurityLevel3: JI2of5SecurityLevel; cdecl;
    {class} function valueOf(P1: JString): JI2of5SecurityLevel; cdecl; overload;
    {class} function valueOf(P1: Byte): JI2of5SecurityLevel; cdecl; overload;
    {class} function values: TJavaObjectArray<JI2of5SecurityLevel>; cdecl;
    {class} property SecurityLevel0: JI2of5SecurityLevel read _GetSecurityLevel0;
    {class} property SecurityLevel1: JI2of5SecurityLevel read _GetSecurityLevel1;
    {class} property SecurityLevel2: JI2of5SecurityLevel read _GetSecurityLevel2;
    {class} property SecurityLevel3: JI2of5SecurityLevel read _GetSecurityLevel3;
  end;

  [JavaSignature('com/hanmiit/lib/barcode/type/I2of5SecurityLevel')]
  JI2of5SecurityLevel = interface(JEnum)
    ['{EE795737-2F30-4358-AD12-A03FA52149B1}']
    function getCode: Byte; cdecl;
    function toString: JString; cdecl;
  end;
  TJI2of5SecurityLevel = class(TJavaGenericImport<JI2of5SecurityLevelClass, JI2of5SecurityLevel>) end;

  JInverseTypeClass = interface(JEnumClass)
    ['{0AD7B91E-B4DA-4BEA-B1BA-5F7FD3A78B7C}']
    {class} function _GetInverseAutodetect: JInverseType; cdecl;
    {class} function _GetInverseOnly: JInverseType; cdecl;
    {class} function _GetRegular: JInverseType; cdecl;
    {class} function valueOf(P1: JString): JInverseType; cdecl; overload;
    {class} function valueOf(P1: Byte): JInverseType; cdecl; overload;
    {class} function values: TJavaObjectArray<JInverseType>; cdecl;
    {class} property InverseAutodetect: JInverseType read _GetInverseAutodetect;
    {class} property InverseOnly: JInverseType read _GetInverseOnly;
    {class} property Regular: JInverseType read _GetRegular;
  end;

  [JavaSignature('com/hanmiit/lib/barcode/type/InverseType')]
  JInverseType = interface(JEnum)
    ['{5A348A5E-1CB5-4557-B283-9369FE89047E}']
    function getCode: Byte; cdecl;
    function toString: JString; cdecl;
  end;
  TJInverseType = class(TJavaGenericImport<JInverseTypeClass, JInverseType>) end;

  JMsiCheckDigitAlgorithmClass = interface(JEnumClass)
    ['{CA936B47-E085-41BB-8F84-13EC8B7C9546}']
    {class} function _GetMod10Mod10: JMsiCheckDigitAlgorithm; cdecl;
    {class} function _GetMod10Mod11: JMsiCheckDigitAlgorithm; cdecl;
    {class} function valueOf(P1: JString): JMsiCheckDigitAlgorithm; cdecl; overload;
    {class} function valueOf(P1: Byte): JMsiCheckDigitAlgorithm; cdecl; overload;
    {class} function values: TJavaObjectArray<JMsiCheckDigitAlgorithm>; cdecl;
    {class} property Mod10Mod10: JMsiCheckDigitAlgorithm read _GetMod10Mod10;
    {class} property Mod10Mod11: JMsiCheckDigitAlgorithm read _GetMod10Mod11;
  end;

  [JavaSignature('com/hanmiit/lib/barcode/type/MsiCheckDigitAlgorithm')]
  JMsiCheckDigitAlgorithm = interface(JEnum)
    ['{81F40756-418A-4C54-AA6A-5915503061AA}']
    function getCode: Byte; cdecl;
    function toString: JString; cdecl;
  end;
  TJMsiCheckDigitAlgorithm = class(TJavaGenericImport<JMsiCheckDigitAlgorithmClass, JMsiCheckDigitAlgorithm>) end;

  JMsiCheckDigitsClass = interface(JEnumClass)
    ['{82E406CE-D3A1-463A-9B76-028AB8E139E4}']
    {class} function _GetOneCheckDigit: JMsiCheckDigits; cdecl;
    {class} function _GetTwoCheckDigit: JMsiCheckDigits; cdecl;
    {class} function valueOf(P1: JString): JMsiCheckDigits; cdecl; overload;
    {class} function valueOf(P1: Byte): JMsiCheckDigits; cdecl; overload;
    {class} function values: TJavaObjectArray<JMsiCheckDigits>; cdecl;
    {class} property OneCheckDigit: JMsiCheckDigits read _GetOneCheckDigit;
    {class} property TwoCheckDigit: JMsiCheckDigits read _GetTwoCheckDigit;
  end;

  [JavaSignature('com/hanmiit/lib/barcode/type/MsiCheckDigits')]
  JMsiCheckDigits = interface(JEnum)
    ['{9639A510-E68E-49A1-B261-C6E3643C05D6}']
    function getCode: Byte; cdecl;
    function toString: JString; cdecl;
  end;
  TJMsiCheckDigits = class(TJavaGenericImport<JMsiCheckDigitsClass, JMsiCheckDigits>) end;

  JParamNameClass = interface(JEnumClass)
    ['{E31F14D9-A2C5-4BB7-B14C-6AC153EC0B18}']
    {class} function _GetAimBrightness: JParamName; cdecl;
    {class} function _GetAustraliaPost: JParamName; cdecl;
    {class} function _GetAustraliaPostFormat: JParamName; cdecl;
    {class} function _GetAztec: JParamName; cdecl;
    {class} function _GetAztecInverse: JParamName; cdecl;
    {class} function _GetBaudRate: JParamName; cdecl;
    {class} function _GetBeepAfterGoodDecode: JParamName; cdecl;
    {class} function _GetBeeperDuration: JParamName; cdecl;
    {class} function _GetBeeperTone: JParamName; cdecl;
    {class} function _GetBeeperVolume: JParamName; cdecl;
    {class} function _GetBitsPerPixel: JParamName; cdecl;
    {class} function _GetBooklandEAN: JParamName; cdecl;
    {class} function _GetBooklandISBNFormat: JParamName; cdecl;
    {class} function _GetBootUpEvent: JParamName; cdecl;
    {class} function _GetBottomPixel: JParamName; cdecl;
    {class} function _GetBufferCode39: JParamName; cdecl;
    {class} function _GetC2of5: JParamName; cdecl;
    {class} function _GetCLSIEditing: JParamName; cdecl;
    {class} function _GetCheckISBTTable: JParamName; cdecl;
    {class} function _GetCheckParity: JParamName; cdecl;
    {class} function _GetCodabar: JParamName; cdecl;
    {class} function _GetCodabarCharDetection: JParamName; cdecl;
    {class} function _GetCodabarLength1: JParamName; cdecl;
    {class} function _GetCodabarLength2: JParamName; cdecl;
    {class} function _GetCode11: JParamName; cdecl;
    {class} function _GetCode11CheckDigitVerification: JParamName; cdecl;
    {class} function _GetCode11Length1: JParamName; cdecl;
    {class} function _GetCode11Length2: JParamName; cdecl;
    {class} function _GetCode128: JParamName; cdecl;
    {class} function _GetCode128Emul: JParamName; cdecl;
    {class} function _GetCode128Length1: JParamName; cdecl;
    {class} function _GetCode128Length2: JParamName; cdecl;
    {class} function _GetCode128ReducedQuietZone: JParamName; cdecl;
    {class} function _GetCode32Prefix: JParamName; cdecl;
    {class} function _GetCode39: JParamName; cdecl;
    {class} function _GetCode39CheckDigitVerification: JParamName; cdecl;
    {class} function _GetCode39FullASCIIConversion: JParamName; cdecl;
    {class} function _GetCode39Length1: JParamName; cdecl;
    {class} function _GetCode39Length2: JParamName; cdecl;
    {class} function _GetCode39ReducedQuietZone: JParamName; cdecl;
    {class} function _GetCode93: JParamName; cdecl;
    {class} function _GetCode93Length1: JParamName; cdecl;
    {class} function _GetCode93Length2: JParamName; cdecl;
    {class} function _GetCompositeBeepMode: JParamName; cdecl;
    {class} function _GetCompositeCCAB: JParamName; cdecl;
    {class} function _GetCompositeCCC: JParamName; cdecl;
    {class} function _GetCompositeTLC39: JParamName; cdecl;
    {class} function _GetContinuousBarCodeRead: JParamName; cdecl;
    {class} function _GetConvertCode39toCode32: JParamName; cdecl;
    {class} function _GetConvertGS1DatabarToUPCEAN: JParamName; cdecl;
    {class} function _GetConvertI2of5toEAN13: JParamName; cdecl;
    {class} function _GetConvertUPCE1toA: JParamName; cdecl;
    {class} function _GetConvertUPCEtoA: JParamName; cdecl;
    {class} function _GetCouponReport: JParamName; cdecl;
    {class} function _GetD2of5: JParamName; cdecl;
    {class} function _GetD2of5Length1: JParamName; cdecl;
    {class} function _GetD2of5Length2: JParamName; cdecl;
    {class} function _GetDataMatrix: JParamName; cdecl;
    {class} function _GetDataMatrixInverse: JParamName; cdecl;
    {class} function _GetDecodeAimingPattern: JParamName; cdecl;
    {class} function _GetDecodeDataPacketFormat: JParamName; cdecl;
    {class} function _GetDecodeEvent: JParamName; cdecl;
    {class} function _GetDecodeLEDBehavior: JParamName; cdecl;
    {class} function _GetDecodeMirrorImages: JParamName; cdecl;
    {class} function _GetDecodeSessionTimeout: JParamName; cdecl;
    {class} function _GetDecodeUPCEANSupply: JParamName; cdecl;
    {class} function _GetDecodeUPCEANSupplyAIMID: JParamName; cdecl;
    {class} function _GetDecodingAutoexposure: JParamName; cdecl;
    {class} function _GetDecodingIllumination: JParamName; cdecl;
    {class} function _GetEAN13: JParamName; cdecl;
    {class} function _GetEAN8: JParamName; cdecl;
    {class} function _GetEAN8Extend: JParamName; cdecl;
    {class} function _GetEscapedChar: JParamName; cdecl;
    {class} function _GetExposureTime: JParamName; cdecl;
    {class} function _GetFixedGain: JParamName; cdecl;
    {class} function _GetFrameRate: JParamName; cdecl;
    {class} function _GetFuzzy1DProcessing: JParamName; cdecl;
    {class} function _GetGS1128: JParamName; cdecl;
    {class} function _GetGS1128EmulMode: JParamName; cdecl;
    {class} function _GetGS1Databar: JParamName; cdecl;
    {class} function _GetGS1DatabarExpanded: JParamName; cdecl;
    {class} function _GetGS1DatabarLimited: JParamName; cdecl;
    {class} function _GetGS1DatabarLimitedSecurityLevel: JParamName; cdecl;
    {class} function _GetHanXin: JParamName; cdecl;
    {class} function _GetHanXinInverse: JParamName; cdecl;
    {class} function _GetHostCharacterTimeout: JParamName; cdecl;
    {class} function _GetHostRTSLineState: JParamName; cdecl;
    {class} function _GetHostSerialResponseTimeout: JParamName; cdecl;
    {class} function _GetI2of5: JParamName; cdecl;
    {class} function _GetI2of5CheckDigitVerification: JParamName; cdecl;
    {class} function _GetI2of5Length1: JParamName; cdecl;
    {class} function _GetI2of5Length2: JParamName; cdecl;
    {class} function _GetI2of5ReducedQuietZone: JParamName; cdecl;
    {class} function _GetISBT128: JParamName; cdecl;
    {class} function _GetISBTConcatenation: JParamName; cdecl;
    {class} function _GetISBTConcatenationRedundancy: JParamName; cdecl;
    {class} function _GetISSNEAN: JParamName; cdecl;
    {class} function _GetIgnoreCode128FNC4: JParamName; cdecl;
    {class} function _GetIlluminationBrightness: JParamName; cdecl;
    {class} function _GetImageBrightness: JParamName; cdecl;
    {class} function _GetImageCaptureAutoexposure: JParamName; cdecl;
    {class} function _GetImageCaptureIllumination: JParamName; cdecl;
    {class} function _GetImageContrastEnhancement: JParamName; cdecl;
    {class} function _GetImageCropping: JParamName; cdecl;
    {class} function _GetImageEdgeSharpening: JParamName; cdecl;
    {class} function _GetImageEnhancement: JParamName; cdecl;
    {class} function _GetImageFileFormatSelection: JParamName; cdecl;
    {class} function _GetImageFileMetaData: JParamName; cdecl;
    {class} function _GetImageResolution: JParamName; cdecl;
    {class} function _GetImageRotation: JParamName; cdecl;
    {class} function _GetIntercharacterGapSize: JParamName; cdecl;
    {class} function _GetInterpacketDelay: JParamName; cdecl;
    {class} function _GetInverse1D: JParamName; cdecl;
    {class} function _GetJPEGImageOptions: JParamName; cdecl;
    {class} function _GetJPEGQualityValue: JParamName; cdecl;
    {class} function _GetJPEGSizeValue: JParamName; cdecl;
    {class} function _GetJapanPostal: JParamName; cdecl;
    {class} function _GetK3of5: JParamName; cdecl;
    {class} function _GetLEDIllumination: JParamName; cdecl;
    {class} function _GetLeftPixel: JParamName; cdecl;
    {class} function _GetLockParameterScanning: JParamName; cdecl;
    {class} function _GetLowLightMotionDetection: JParamName; cdecl;
    {class} function _GetM2of5: JParamName; cdecl;
    {class} function _GetM2of5CheckDigit: JParamName; cdecl;
    {class} function _GetM2of5Length1: JParamName; cdecl;
    {class} function _GetM2of5Length2: JParamName; cdecl;
    {class} function _GetMSI: JParamName; cdecl;
    {class} function _GetMSICheckDigit: JParamName; cdecl;
    {class} function _GetMSICheckDigitAlgorithm: JParamName; cdecl;
    {class} function _GetMSILength1: JParamName; cdecl;
    {class} function _GetMSILength2: JParamName; cdecl;
    {class} function _GetMacroPDFTransmit: JParamName; cdecl;
    {class} function _GetMaxicode: JParamName; cdecl;
    {class} function _GetMicroPDF417: JParamName; cdecl;
    {class} function _GetMicroQR: JParamName; cdecl;
    {class} function _GetMirroredImage: JParamName; cdecl;
    {class} function _GetMobilePhoneDisplayMode: JParamName; cdecl;
    {class} function _GetMultipacketOption: JParamName; cdecl;
    {class} function _GetNOTISEditing: JParamName; cdecl;
    {class} function _GetNetherlandsKIXCode: JParamName; cdecl;
    {class} function _GetPDF417: JParamName; cdecl;
    {class} function _GetPDFPrioritization: JParamName; cdecl;
    {class} function _GetPDFPrioritizationTimeout: JParamName; cdecl;
    {class} function _GetParameterEvent: JParamName; cdecl;
    {class} function _GetParameterScanning: JParamName; cdecl;
    {class} function _GetParity: JParamName; cdecl;
    {class} function _GetPicklistMode: JParamName; cdecl;
    {class} function _GetPowerMode: JParamName; cdecl;
    {class} function _GetPresentationModeFieldofView: JParamName; cdecl;
    {class} function _GetQRCode: JParamName; cdecl;
    {class} function _GetQRInverse: JParamName; cdecl;
    {class} function _GetRedundancyLevel: JParamName; cdecl;
    {class} function _GetRightPixel: JParamName; cdecl;
    {class} function _GetSSIPrefix: JParamName; cdecl;
    {class} function _GetSSISuffix1: JParamName; cdecl;
    {class} function _GetSSISuffix2: JParamName; cdecl;
    {class} function _GetScanDataTransmissionFormat: JParamName; cdecl;
    {class} function _GetSecurityLevel: JParamName; cdecl;
    {class} function _GetSnapshotAimingPattern: JParamName; cdecl;
    {class} function _GetSnapshotModeTimeout: JParamName; cdecl;
    {class} function _GetSoftwareHandshaking: JParamName; cdecl;
    {class} function _GetStopBits: JParamName; cdecl;
    {class} function _GetSuppressPowerupBeeps: JParamName; cdecl;
    {class} function _GetTargetVideoFrameSize: JParamName; cdecl;
    {class} function _GetTimeDelaytoLowPowerMode: JParamName; cdecl;
    {class} function _GetTimeoutBetweenDecodesDifferentSymbols: JParamName; cdecl;
    {class} function _GetTimeoutBetweenDecodesSameSymbol: JParamName; cdecl;
    {class} function _GetTopPixel: JParamName; cdecl;
    {class} function _GetTransmitCode11CheckDigit: JParamName; cdecl;
    {class} function _GetTransmitCode39CheckDigit: JParamName; cdecl;
    {class} function _GetTransmitCodeIDCharacter: JParamName; cdecl;
    {class} function _GetTransmitI2of5CheckDigit: JParamName; cdecl;
    {class} function _GetTransmitM2of5CheckDigit: JParamName; cdecl;
    {class} function _GetTransmitMSICheckDigit: JParamName; cdecl;
    {class} function _GetTransmitMacroPDFControlHeader: JParamName; cdecl;
    {class} function _GetTransmitNoRead: JParamName; cdecl;
    {class} function _GetTransmitUKPostalCheckDigit: JParamName; cdecl;
    {class} function _GetTransmitUPCACheckDigit: JParamName; cdecl;
    {class} function _GetTransmitUPCE1CheckDigit: JParamName; cdecl;
    {class} function _GetTransmitUPCECheckDigit: JParamName; cdecl;
    {class} function _GetTransmitUSPostalCheckDigit: JParamName; cdecl;
    {class} function _GetTriggerModes: JParamName; cdecl;
    {class} function _GetTriopticCode39: JParamName; cdecl;
    {class} function _GetUCCCouponExtendCode: JParamName; cdecl;
    {class} function _GetUKPostal: JParamName; cdecl;
    {class} function _GetUPCA: JParamName; cdecl;
    {class} function _GetUPCAPreamble: JParamName; cdecl;
    {class} function _GetUPCCompositeMode: JParamName; cdecl;
    {class} function _GetUPCE: JParamName; cdecl;
    {class} function _GetUPCE1: JParamName; cdecl;
    {class} function _GetUPCE1Preamble: JParamName; cdecl;
    {class} function _GetUPCEANSupplyRedundancy: JParamName; cdecl;
    {class} function _GetUPCEPreamble: JParamName; cdecl;
    {class} function _GetUPCReducedQuietZone: JParamName; cdecl;
    {class} function _GetUPUFICSPostal: JParamName; cdecl;
    {class} function _GetUSPS4CB: JParamName; cdecl;
    {class} function _GetUSPlanet: JParamName; cdecl;
    {class} function _GetUSPostnet: JParamName; cdecl;
    {class} function _GetUniqueBarCodeReporting: JParamName; cdecl;
    {class} function _GetUnlockParameterScanning: JParamName; cdecl;
    {class} function _GetUserParameterPassThrough: JParamName; cdecl;
    {class} function _GetUserProgrammableSupply1: JParamName; cdecl;
    {class} function _GetUserProgrammableSupply2: JParamName; cdecl;
    {class} function _GetValidateConcatenatedParameterBarCodes: JParamName; cdecl;
    {class} function _GetVideoResolution: JParamName; cdecl;
    {class} function _GetVideoViewFinder: JParamName; cdecl;
    {class} function _GetVideoViewFinderImageSize: JParamName; cdecl;
    {class} function _GetVisualDecodeIndicatorDecodeBlinkDuration: JParamName; cdecl;
    {class} function _GetVisualDecodeIndicatorDecodeBlinks: JParamName; cdecl;
    {class} function valueOf(P1: JString): JParamName; cdecl;
    {class} function values: TJavaObjectArray<JParamName>; cdecl;
    {class} property AimBrightness: JParamName read _GetAimBrightness;
    {class} property AustraliaPost: JParamName read _GetAustraliaPost;
    {class} property AustraliaPostFormat: JParamName read _GetAustraliaPostFormat;
    {class} property Aztec: JParamName read _GetAztec;
    {class} property AztecInverse: JParamName read _GetAztecInverse;
    {class} property BaudRate: JParamName read _GetBaudRate;
    {class} property BeepAfterGoodDecode: JParamName read _GetBeepAfterGoodDecode;
    {class} property BeeperDuration: JParamName read _GetBeeperDuration;
    {class} property BeeperTone: JParamName read _GetBeeperTone;
    {class} property BeeperVolume: JParamName read _GetBeeperVolume;
    {class} property BitsPerPixel: JParamName read _GetBitsPerPixel;
    {class} property BooklandEAN: JParamName read _GetBooklandEAN;
    {class} property BooklandISBNFormat: JParamName read _GetBooklandISBNFormat;
    {class} property BootUpEvent: JParamName read _GetBootUpEvent;
    {class} property BottomPixel: JParamName read _GetBottomPixel;
    {class} property BufferCode39: JParamName read _GetBufferCode39;
    {class} property C2of5: JParamName read _GetC2of5;
    {class} property CLSIEditing: JParamName read _GetCLSIEditing;
    {class} property CheckISBTTable: JParamName read _GetCheckISBTTable;
    {class} property CheckParity: JParamName read _GetCheckParity;
    {class} property Codabar: JParamName read _GetCodabar;
    {class} property CodabarCharDetection: JParamName read _GetCodabarCharDetection;
    {class} property CodabarLength1: JParamName read _GetCodabarLength1;
    {class} property CodabarLength2: JParamName read _GetCodabarLength2;
    {class} property Code11: JParamName read _GetCode11;
    {class} property Code11CheckDigitVerification: JParamName read _GetCode11CheckDigitVerification;
    {class} property Code11Length1: JParamName read _GetCode11Length1;
    {class} property Code11Length2: JParamName read _GetCode11Length2;
    {class} property Code128: JParamName read _GetCode128;
    {class} property Code128Emul: JParamName read _GetCode128Emul;
    {class} property Code128Length1: JParamName read _GetCode128Length1;
    {class} property Code128Length2: JParamName read _GetCode128Length2;
    {class} property Code128ReducedQuietZone: JParamName read _GetCode128ReducedQuietZone;
    {class} property Code32Prefix: JParamName read _GetCode32Prefix;
    {class} property Code39: JParamName read _GetCode39;
    {class} property Code39CheckDigitVerification: JParamName read _GetCode39CheckDigitVerification;
    {class} property Code39FullASCIIConversion: JParamName read _GetCode39FullASCIIConversion;
    {class} property Code39Length1: JParamName read _GetCode39Length1;
    {class} property Code39Length2: JParamName read _GetCode39Length2;
    {class} property Code39ReducedQuietZone: JParamName read _GetCode39ReducedQuietZone;
    {class} property Code93: JParamName read _GetCode93;
    {class} property Code93Length1: JParamName read _GetCode93Length1;
    {class} property Code93Length2: JParamName read _GetCode93Length2;
    {class} property CompositeBeepMode: JParamName read _GetCompositeBeepMode;
    {class} property CompositeCCAB: JParamName read _GetCompositeCCAB;
    {class} property CompositeCCC: JParamName read _GetCompositeCCC;
    {class} property CompositeTLC39: JParamName read _GetCompositeTLC39;
    {class} property ContinuousBarCodeRead: JParamName read _GetContinuousBarCodeRead;
    {class} property ConvertCode39toCode32: JParamName read _GetConvertCode39toCode32;
    {class} property ConvertGS1DatabarToUPCEAN: JParamName read _GetConvertGS1DatabarToUPCEAN;
    {class} property ConvertI2of5toEAN13: JParamName read _GetConvertI2of5toEAN13;
    {class} property ConvertUPCE1toA: JParamName read _GetConvertUPCE1toA;
    {class} property ConvertUPCEtoA: JParamName read _GetConvertUPCEtoA;
    {class} property CouponReport: JParamName read _GetCouponReport;
    {class} property D2of5: JParamName read _GetD2of5;
    {class} property D2of5Length1: JParamName read _GetD2of5Length1;
    {class} property D2of5Length2: JParamName read _GetD2of5Length2;
    {class} property DataMatrix: JParamName read _GetDataMatrix;
    {class} property DataMatrixInverse: JParamName read _GetDataMatrixInverse;
    {class} property DecodeAimingPattern: JParamName read _GetDecodeAimingPattern;
    {class} property DecodeDataPacketFormat: JParamName read _GetDecodeDataPacketFormat;
    {class} property DecodeEvent: JParamName read _GetDecodeEvent;
    {class} property DecodeLEDBehavior: JParamName read _GetDecodeLEDBehavior;
    {class} property DecodeMirrorImages: JParamName read _GetDecodeMirrorImages;
    {class} property DecodeSessionTimeout: JParamName read _GetDecodeSessionTimeout;
    {class} property DecodeUPCEANSupply: JParamName read _GetDecodeUPCEANSupply;
    {class} property DecodeUPCEANSupplyAIMID: JParamName read _GetDecodeUPCEANSupplyAIMID;
    {class} property DecodingAutoexposure: JParamName read _GetDecodingAutoexposure;
    {class} property DecodingIllumination: JParamName read _GetDecodingIllumination;
    {class} property EAN13: JParamName read _GetEAN13;
    {class} property EAN8: JParamName read _GetEAN8;
    {class} property EAN8Extend: JParamName read _GetEAN8Extend;
    {class} property EscapedChar: JParamName read _GetEscapedChar;
    {class} property ExposureTime: JParamName read _GetExposureTime;
    {class} property FixedGain: JParamName read _GetFixedGain;
    {class} property FrameRate: JParamName read _GetFrameRate;
    {class} property Fuzzy1DProcessing: JParamName read _GetFuzzy1DProcessing;
    {class} property GS1128: JParamName read _GetGS1128;
    {class} property GS1128EmulMode: JParamName read _GetGS1128EmulMode;
    {class} property GS1Databar: JParamName read _GetGS1Databar;
    {class} property GS1DatabarExpanded: JParamName read _GetGS1DatabarExpanded;
    {class} property GS1DatabarLimited: JParamName read _GetGS1DatabarLimited;
    {class} property GS1DatabarLimitedSecurityLevel: JParamName read _GetGS1DatabarLimitedSecurityLevel;
    {class} property HanXin: JParamName read _GetHanXin;
    {class} property HanXinInverse: JParamName read _GetHanXinInverse;
    {class} property HostCharacterTimeout: JParamName read _GetHostCharacterTimeout;
    {class} property HostRTSLineState: JParamName read _GetHostRTSLineState;
    {class} property HostSerialResponseTimeout: JParamName read _GetHostSerialResponseTimeout;
    {class} property I2of5: JParamName read _GetI2of5;
    {class} property I2of5CheckDigitVerification: JParamName read _GetI2of5CheckDigitVerification;
    {class} property I2of5Length1: JParamName read _GetI2of5Length1;
    {class} property I2of5Length2: JParamName read _GetI2of5Length2;
    {class} property I2of5ReducedQuietZone: JParamName read _GetI2of5ReducedQuietZone;
    {class} property ISBT128: JParamName read _GetISBT128;
    {class} property ISBTConcatenation: JParamName read _GetISBTConcatenation;
    {class} property ISBTConcatenationRedundancy: JParamName read _GetISBTConcatenationRedundancy;
    {class} property ISSNEAN: JParamName read _GetISSNEAN;
    {class} property IgnoreCode128FNC4: JParamName read _GetIgnoreCode128FNC4;
    {class} property IlluminationBrightness: JParamName read _GetIlluminationBrightness;
    {class} property ImageBrightness: JParamName read _GetImageBrightness;
    {class} property ImageCaptureAutoexposure: JParamName read _GetImageCaptureAutoexposure;
    {class} property ImageCaptureIllumination: JParamName read _GetImageCaptureIllumination;
    {class} property ImageContrastEnhancement: JParamName read _GetImageContrastEnhancement;
    {class} property ImageCropping: JParamName read _GetImageCropping;
    {class} property ImageEdgeSharpening: JParamName read _GetImageEdgeSharpening;
    {class} property ImageEnhancement: JParamName read _GetImageEnhancement;
    {class} property ImageFileFormatSelection: JParamName read _GetImageFileFormatSelection;
    {class} property ImageFileMetaData: JParamName read _GetImageFileMetaData;
    {class} property ImageResolution: JParamName read _GetImageResolution;
    {class} property ImageRotation: JParamName read _GetImageRotation;
    {class} property IntercharacterGapSize: JParamName read _GetIntercharacterGapSize;
    {class} property InterpacketDelay: JParamName read _GetInterpacketDelay;
    {class} property Inverse1D: JParamName read _GetInverse1D;
    {class} property JPEGImageOptions: JParamName read _GetJPEGImageOptions;
    {class} property JPEGQualityValue: JParamName read _GetJPEGQualityValue;
    {class} property JPEGSizeValue: JParamName read _GetJPEGSizeValue;
    {class} property JapanPostal: JParamName read _GetJapanPostal;
    {class} property K3of5: JParamName read _GetK3of5;
    {class} property LEDIllumination: JParamName read _GetLEDIllumination;
    {class} property LeftPixel: JParamName read _GetLeftPixel;
    {class} property LockParameterScanning: JParamName read _GetLockParameterScanning;
    {class} property LowLightMotionDetection: JParamName read _GetLowLightMotionDetection;
    {class} property M2of5: JParamName read _GetM2of5;
    {class} property M2of5CheckDigit: JParamName read _GetM2of5CheckDigit;
    {class} property M2of5Length1: JParamName read _GetM2of5Length1;
    {class} property M2of5Length2: JParamName read _GetM2of5Length2;
    {class} property MSI: JParamName read _GetMSI;
    {class} property MSICheckDigit: JParamName read _GetMSICheckDigit;
    {class} property MSICheckDigitAlgorithm: JParamName read _GetMSICheckDigitAlgorithm;
    {class} property MSILength1: JParamName read _GetMSILength1;
    {class} property MSILength2: JParamName read _GetMSILength2;
    {class} property MacroPDFTransmit: JParamName read _GetMacroPDFTransmit;
    {class} property Maxicode: JParamName read _GetMaxicode;
    {class} property MicroPDF417: JParamName read _GetMicroPDF417;
    {class} property MicroQR: JParamName read _GetMicroQR;
    {class} property MirroredImage: JParamName read _GetMirroredImage;
    {class} property MobilePhoneDisplayMode: JParamName read _GetMobilePhoneDisplayMode;
    {class} property MultipacketOption: JParamName read _GetMultipacketOption;
    {class} property NOTISEditing: JParamName read _GetNOTISEditing;
    {class} property NetherlandsKIXCode: JParamName read _GetNetherlandsKIXCode;
    {class} property PDF417: JParamName read _GetPDF417;
    {class} property PDFPrioritization: JParamName read _GetPDFPrioritization;
    {class} property PDFPrioritizationTimeout: JParamName read _GetPDFPrioritizationTimeout;
    {class} property ParameterEvent: JParamName read _GetParameterEvent;
    {class} property ParameterScanning: JParamName read _GetParameterScanning;
    {class} property Parity: JParamName read _GetParity;
    {class} property PicklistMode: JParamName read _GetPicklistMode;
    {class} property PowerMode: JParamName read _GetPowerMode;
    {class} property PresentationModeFieldofView: JParamName read _GetPresentationModeFieldofView;
    {class} property QRCode: JParamName read _GetQRCode;
    {class} property QRInverse: JParamName read _GetQRInverse;
    {class} property RedundancyLevel: JParamName read _GetRedundancyLevel;
    {class} property RightPixel: JParamName read _GetRightPixel;
    {class} property SSIPrefix: JParamName read _GetSSIPrefix;
    {class} property SSISuffix1: JParamName read _GetSSISuffix1;
    {class} property SSISuffix2: JParamName read _GetSSISuffix2;
    {class} property ScanDataTransmissionFormat: JParamName read _GetScanDataTransmissionFormat;
    {class} property SecurityLevel: JParamName read _GetSecurityLevel;
    {class} property SnapshotAimingPattern: JParamName read _GetSnapshotAimingPattern;
    {class} property SnapshotModeTimeout: JParamName read _GetSnapshotModeTimeout;
    {class} property SoftwareHandshaking: JParamName read _GetSoftwareHandshaking;
    {class} property StopBits: JParamName read _GetStopBits;
    {class} property SuppressPowerupBeeps: JParamName read _GetSuppressPowerupBeeps;
    {class} property TargetVideoFrameSize: JParamName read _GetTargetVideoFrameSize;
    {class} property TimeDelaytoLowPowerMode: JParamName read _GetTimeDelaytoLowPowerMode;
    {class} property TimeoutBetweenDecodesDifferentSymbols: JParamName read _GetTimeoutBetweenDecodesDifferentSymbols;
    {class} property TimeoutBetweenDecodesSameSymbol: JParamName read _GetTimeoutBetweenDecodesSameSymbol;
    {class} property TopPixel: JParamName read _GetTopPixel;
    {class} property TransmitCode11CheckDigit: JParamName read _GetTransmitCode11CheckDigit;
    {class} property TransmitCode39CheckDigit: JParamName read _GetTransmitCode39CheckDigit;
    {class} property TransmitCodeIDCharacter: JParamName read _GetTransmitCodeIDCharacter;
    {class} property TransmitI2of5CheckDigit: JParamName read _GetTransmitI2of5CheckDigit;
    {class} property TransmitM2of5CheckDigit: JParamName read _GetTransmitM2of5CheckDigit;
    {class} property TransmitMSICheckDigit: JParamName read _GetTransmitMSICheckDigit;
    {class} property TransmitMacroPDFControlHeader: JParamName read _GetTransmitMacroPDFControlHeader;
    {class} property TransmitNoRead: JParamName read _GetTransmitNoRead;
    {class} property TransmitUKPostalCheckDigit: JParamName read _GetTransmitUKPostalCheckDigit;
    {class} property TransmitUPCACheckDigit: JParamName read _GetTransmitUPCACheckDigit;
    {class} property TransmitUPCE1CheckDigit: JParamName read _GetTransmitUPCE1CheckDigit;
    {class} property TransmitUPCECheckDigit: JParamName read _GetTransmitUPCECheckDigit;
    {class} property TransmitUSPostalCheckDigit: JParamName read _GetTransmitUSPostalCheckDigit;
    {class} property TriggerModes: JParamName read _GetTriggerModes;
    {class} property TriopticCode39: JParamName read _GetTriopticCode39;
    {class} property UCCCouponExtendCode: JParamName read _GetUCCCouponExtendCode;
    {class} property UKPostal: JParamName read _GetUKPostal;
    {class} property UPCA: JParamName read _GetUPCA;
    {class} property UPCAPreamble: JParamName read _GetUPCAPreamble;
    {class} property UPCCompositeMode: JParamName read _GetUPCCompositeMode;
    {class} property UPCE: JParamName read _GetUPCE;
    {class} property UPCE1: JParamName read _GetUPCE1;
    {class} property UPCE1Preamble: JParamName read _GetUPCE1Preamble;
    {class} property UPCEANSupplyRedundancy: JParamName read _GetUPCEANSupplyRedundancy;
    {class} property UPCEPreamble: JParamName read _GetUPCEPreamble;
    {class} property UPCReducedQuietZone: JParamName read _GetUPCReducedQuietZone;
    {class} property UPUFICSPostal: JParamName read _GetUPUFICSPostal;
    {class} property USPS4CB: JParamName read _GetUSPS4CB;
    {class} property USPlanet: JParamName read _GetUSPlanet;
    {class} property USPostnet: JParamName read _GetUSPostnet;
    {class} property UniqueBarCodeReporting: JParamName read _GetUniqueBarCodeReporting;
    {class} property UnlockParameterScanning: JParamName read _GetUnlockParameterScanning;
    {class} property UserParameterPassThrough: JParamName read _GetUserParameterPassThrough;
    {class} property UserProgrammableSupply1: JParamName read _GetUserProgrammableSupply1;
    {class} property UserProgrammableSupply2: JParamName read _GetUserProgrammableSupply2;
    {class} property ValidateConcatenatedParameterBarCodes: JParamName read _GetValidateConcatenatedParameterBarCodes;
    {class} property VideoResolution: JParamName read _GetVideoResolution;
    {class} property VideoViewFinder: JParamName read _GetVideoViewFinder;
    {class} property VideoViewFinderImageSize: JParamName read _GetVideoViewFinderImageSize;
    {class} property VisualDecodeIndicatorDecodeBlinkDuration: JParamName read _GetVisualDecodeIndicatorDecodeBlinkDuration;
    {class} property VisualDecodeIndicatorDecodeBlinks: JParamName read _GetVisualDecodeIndicatorDecodeBlinks;
  end;

  [JavaSignature('com/hanmiit/lib/barcode/type/ParamName')]
  JParamName = interface(JEnum)
    ['{0FE76D1A-6A16-4204-B1F9-4F47720A5D9B}']
    function toString: JString; cdecl;
  end;
  TJParamName = class(TJavaGenericImport<JParamNameClass, JParamName>) end;

  JPreambleClass = interface(JEnumClass)
    ['{61E4B549-B924-4C93-B4A3-4D9EEA41B4B4}']
    {class} function _GetNoPreamble: JPreamble; cdecl;
    {class} function _GetSystemCharacter: JPreamble; cdecl;
    {class} function _GetSystemCharacterCountryCode: JPreamble; cdecl;
    {class} function valueOf(P1: JString): JPreamble; cdecl; overload;
    {class} function valueOf(P1: Byte): JPreamble; cdecl; overload;
    {class} function values: TJavaObjectArray<JPreamble>; cdecl;
    {class} property NoPreamble: JPreamble read _GetNoPreamble;
    {class} property SystemCharacter: JPreamble read _GetSystemCharacter;
    {class} property SystemCharacterCountryCode: JPreamble read _GetSystemCharacterCountryCode;
  end;

  [JavaSignature('com/hanmiit/lib/barcode/type/Preamble')]
  JPreamble = interface(JEnum)
    ['{B1E02939-4E31-4CDF-BD8B-2ACC0AD8E19B}']
    function getCode: Byte; cdecl;
    function toString: JString; cdecl;
  end;
  TJPreamble = class(TJavaGenericImport<JPreambleClass, JPreamble>) end;

  JRedundancyLevelClass = interface(JEnumClass)
    ['{D01640B8-EF04-492E-B8E8-1C7E007C41EA}']
    {class} function _GetRedundancyLevel1: JRedundancyLevel; cdecl;
    {class} function _GetRedundancyLevel2: JRedundancyLevel; cdecl;
    {class} function _GetRedundancyLevel3: JRedundancyLevel; cdecl;
    {class} function _GetRedundancyLevel4: JRedundancyLevel; cdecl;
    {class} function valueOf(P1: JString): JRedundancyLevel; cdecl; overload;
    {class} function valueOf(P1: Byte): JRedundancyLevel; cdecl; overload;
    {class} function values: TJavaObjectArray<JRedundancyLevel>; cdecl;
    {class} property RedundancyLevel1: JRedundancyLevel read _GetRedundancyLevel1;
    {class} property RedundancyLevel2: JRedundancyLevel read _GetRedundancyLevel2;
    {class} property RedundancyLevel3: JRedundancyLevel read _GetRedundancyLevel3;
    {class} property RedundancyLevel4: JRedundancyLevel read _GetRedundancyLevel4;
  end;

  [JavaSignature('com/hanmiit/lib/barcode/type/RedundancyLevel')]
  JRedundancyLevel = interface(JEnum)
    ['{6DC5609E-9673-4471-A53A-4FB96887722E}']
    function getCode: Byte; cdecl;
    function toString: JString; cdecl;
  end;
  TJRedundancyLevel = class(TJavaGenericImport<JRedundancyLevelClass, JRedundancyLevel>) end;

  JSSICommandClass = interface(JEnumClass)
    ['{1B8A9BE3-E41D-4789-8689-60DFABDBF388}']
    {class} function _GetACK: JSSICommand; cdecl;
    {class} function _GetAIM_OFF: JSSICommand; cdecl;
    {class} function _GetAIM_ON: JSSICommand; cdecl;
    {class} function _GetBEEP: JSSICommand; cdecl;
    {class} function _GetCAPABILITIES_REPLY: JSSICommand; cdecl;
    {class} function _GetCAPABILITIES_REQUEST: JSSICommand; cdecl;
    {class} function _GetDECODE_DATA: JSSICommand; cdecl;
    {class} function _GetEVENT: JSSICommand; cdecl;
    {class} function _GetINVALID_CHECKSUM: JSSICommand; cdecl;
    {class} function _GetINVALID_SOURCE_MESSAGE: JSSICommand; cdecl;
    {class} function _GetLED_OFF: JSSICommand; cdecl;
    {class} function _GetLED_ON: JSSICommand; cdecl;
    {class} function _GetNAK: JSSICommand; cdecl;
    {class} function _GetPARAM_DEFAULTS: JSSICommand; cdecl;
    {class} function _GetPARAM_REQUEST: JSSICommand; cdecl;
    {class} function _GetPARAM_SEND: JSSICommand; cdecl;
    {class} function _GetREMOTE_KEY_ACTION: JSSICommand; cdecl;
    {class} function _GetREPLY_ID: JSSICommand; cdecl;
    {class} function _GetREPLY_REVISION: JSSICommand; cdecl;
    {class} function _GetREQUEST_ID: JSSICommand; cdecl;
    {class} function _GetREQUEST_REVISION: JSSICommand; cdecl;
    {class} function _GetSCAN_DISABLE: JSSICommand; cdecl;
    {class} function _GetSCAN_ENABLE: JSSICommand; cdecl;
    {class} function _GetSLEEP: JSSICommand; cdecl;
    {class} function _GetSTART_DECODE: JSSICommand; cdecl;
    {class} function _GetSTOP_DECODE: JSSICommand; cdecl;
    {class} function _GetTIMEOUT: JSSICommand; cdecl;
    {class} function _GetUNKNOWN: JSSICommand; cdecl;
    {class} function valueOf(P1: JString): JSSICommand; cdecl; overload;
    {class} function valueOf(P1: Byte): JSSICommand; cdecl; overload;
    {class} function values: TJavaObjectArray<JSSICommand>; cdecl;
    {class} property ACK: JSSICommand read _GetACK;
    {class} property AIM_OFF: JSSICommand read _GetAIM_OFF;
    {class} property AIM_ON: JSSICommand read _GetAIM_ON;
    {class} property BEEP: JSSICommand read _GetBEEP;
    {class} property CAPABILITIES_REPLY: JSSICommand read _GetCAPABILITIES_REPLY;
    {class} property CAPABILITIES_REQUEST: JSSICommand read _GetCAPABILITIES_REQUEST;
    {class} property DECODE_DATA: JSSICommand read _GetDECODE_DATA;
    {class} property EVENT: JSSICommand read _GetEVENT;
    {class} property INVALID_CHECKSUM: JSSICommand read _GetINVALID_CHECKSUM;
    {class} property INVALID_SOURCE_MESSAGE: JSSICommand read _GetINVALID_SOURCE_MESSAGE;
    {class} property LED_OFF: JSSICommand read _GetLED_OFF;
    {class} property LED_ON: JSSICommand read _GetLED_ON;
    {class} property NAK: JSSICommand read _GetNAK;
    {class} property PARAM_DEFAULTS: JSSICommand read _GetPARAM_DEFAULTS;
    {class} property PARAM_REQUEST: JSSICommand read _GetPARAM_REQUEST;
    {class} property PARAM_SEND: JSSICommand read _GetPARAM_SEND;
    {class} property REMOTE_KEY_ACTION: JSSICommand read _GetREMOTE_KEY_ACTION;
    {class} property REPLY_ID: JSSICommand read _GetREPLY_ID;
    {class} property REPLY_REVISION: JSSICommand read _GetREPLY_REVISION;
    {class} property REQUEST_ID: JSSICommand read _GetREQUEST_ID;
    {class} property REQUEST_REVISION: JSSICommand read _GetREQUEST_REVISION;
    {class} property SCAN_DISABLE: JSSICommand read _GetSCAN_DISABLE;
    {class} property SCAN_ENABLE: JSSICommand read _GetSCAN_ENABLE;
    {class} property SLEEP: JSSICommand read _GetSLEEP;
    {class} property START_DECODE: JSSICommand read _GetSTART_DECODE;
    {class} property STOP_DECODE: JSSICommand read _GetSTOP_DECODE;
    {class} property TIMEOUT: JSSICommand read _GetTIMEOUT;
    {class} property UNKNOWN: JSSICommand read _GetUNKNOWN;
  end;

  [JavaSignature('com/hanmiit/lib/barcode/type/SSICommand')]
  JSSICommand = interface(JEnum)
    ['{875358F7-D4F1-415C-9871-E6C93D44BBED}']
    function getCode: Byte; cdecl;
  end;
  TJSSICommand = class(TJavaGenericImport<JSSICommandClass, JSSICommand>) end;

  JSecurityLevelClass = interface(JEnumClass)
    ['{6F5D0F9E-99E3-4ED5-AA4B-86B21189007E}']
    {class} function _GetSecurityLevel0: JSecurityLevel; cdecl;
    {class} function _GetSecurityLevel1: JSecurityLevel; cdecl;
    {class} function _GetSecurityLevel2: JSecurityLevel; cdecl;
    {class} function _GetSecurityLevel3: JSecurityLevel; cdecl;
    {class} function valueOf(P1: JString): JSecurityLevel; cdecl; overload;
    {class} function valueOf(P1: Byte): JSecurityLevel; cdecl; overload;
    {class} function values: TJavaObjectArray<JSecurityLevel>; cdecl;
    {class} property SecurityLevel0: JSecurityLevel read _GetSecurityLevel0;
    {class} property SecurityLevel1: JSecurityLevel read _GetSecurityLevel1;
    {class} property SecurityLevel2: JSecurityLevel read _GetSecurityLevel2;
    {class} property SecurityLevel3: JSecurityLevel read _GetSecurityLevel3;
  end;

  [JavaSignature('com/hanmiit/lib/barcode/type/SecurityLevel')]
  JSecurityLevel = interface(JEnum)
    ['{179FA4A4-A8D4-4533-A167-C3840434E10C}']
    function getCode: Byte; cdecl;
    function toString: JString; cdecl;
  end;
  TJSecurityLevel = class(TJavaGenericImport<JSecurityLevelClass, JSecurityLevel>) end;

  JUpcCompositeModeClass = interface(JEnumClass)
    ['{F702A398-5A59-4BA0-891D-13A595C939F5}']
    {class} function _GetAutodiscriminateUpcComposites: JUpcCompositeMode; cdecl;
    {class} function _GetUpcAlwaysLinked: JUpcCompositeMode; cdecl;
    {class} function _GetUpcNeverLinked: JUpcCompositeMode; cdecl;
    {class} function valueOf(P1: JString): JUpcCompositeMode; cdecl; overload;
    {class} function valueOf(P1: Byte): JUpcCompositeMode; cdecl; overload;
    {class} function values: TJavaObjectArray<JUpcCompositeMode>; cdecl;
    {class} property AutodiscriminateUpcComposites: JUpcCompositeMode read _GetAutodiscriminateUpcComposites;
    {class} property UpcAlwaysLinked: JUpcCompositeMode read _GetUpcAlwaysLinked;
    {class} property UpcNeverLinked: JUpcCompositeMode read _GetUpcNeverLinked;
  end;

  [JavaSignature('com/hanmiit/lib/barcode/type/UpcCompositeMode')]
  JUpcCompositeMode = interface(JEnum)
    ['{F40258BE-A34C-4BBD-A704-E44F136DFBBA}']
    function getCode: Byte; cdecl;
    function toString: JString; cdecl;
  end;
  TJUpcCompositeMode = class(TJavaGenericImport<JUpcCompositeModeClass, JUpcCompositeMode>) end;

  JUpcEanSecurityLevelClass = interface(JEnumClass)
    ['{7BB56DDE-159A-44D4-ABD9-DF3C4A10F23C}']
    {class} function _GetLevel0: JUpcEanSecurityLevel; cdecl;
    {class} function _GetLevel1: JUpcEanSecurityLevel; cdecl;
    {class} function _GetLevel2: JUpcEanSecurityLevel; cdecl;
    {class} function _GetLevel3: JUpcEanSecurityLevel; cdecl;
    {class} function valueOf(P1: JString): JUpcEanSecurityLevel; cdecl; overload;
    {class} function valueOf(P1: Byte): JUpcEanSecurityLevel; cdecl; overload;
    {class} function values: TJavaObjectArray<JUpcEanSecurityLevel>; cdecl;
    {class} property Level0: JUpcEanSecurityLevel read _GetLevel0;
    {class} property Level1: JUpcEanSecurityLevel read _GetLevel1;
    {class} property Level2: JUpcEanSecurityLevel read _GetLevel2;
    {class} property Level3: JUpcEanSecurityLevel read _GetLevel3;
  end;

  [JavaSignature('com/hanmiit/lib/barcode/type/UpcEanSecurityLevel')]
  JUpcEanSecurityLevel = interface(JEnum)
    ['{F59D3205-310B-4EB3-881E-ED6B00F2A4D2}']
    function getCode: Byte; cdecl;
    function toString: JString; cdecl;
  end;
  TJUpcEanSecurityLevel = class(TJavaGenericImport<JUpcEanSecurityLevelClass, JUpcEanSecurityLevel>) end;

  JDeviceClass = interface(JObjectClass)
    ['{879C027C-6029-4114-AA39-783DB1E6D70A}']
    {class} function _GetMAX_BUFFER_SIZE: Integer; cdecl;
    {class} function _GetMAX_STREAM_SIZE: Integer; cdecl;
    {class} function init: JDevice; cdecl;
    {class} property MAX_BUFFER_SIZE: Integer read _GetMAX_BUFFER_SIZE;
    {class} property MAX_STREAM_SIZE: Integer read _GetMAX_STREAM_SIZE;
  end;

  [JavaSignature('com/hanmiit/lib/device/Device')]
  JDevice = interface(JObject)
    ['{80229205-FFA0-42D6-9B47-1EA193D17A2A}']
    procedure connect(P1: JString); cdecl;
    procedure disconnect; cdecl;
    procedure flush; cdecl;
    function getAddress: JString; cdecl;
    function getName: JString; cdecl;
    function getReader: JInputStream; cdecl;
    function getState: JConnectionState; cdecl;
    procedure listen; cdecl;
    procedure setState(P1: JConnectionState); cdecl;
    procedure setStateChangedListener(P1: JConnectionStateListener); cdecl;
    procedure waitConnection; cdecl;
    procedure write(P1: TJavaArray<Byte>); cdecl;
  end;
  TJDevice = class(TJavaGenericImport<JDeviceClass, JDevice>) end;

  JDevBluetoothClass = interface(JDeviceClass)
    ['{05B3E4FA-0BD4-4589-A059-583A50E3252D}']
    {class} procedure connect(P1: JString); cdecl;
    {class} procedure disconnect; cdecl;
    {class} procedure flush; cdecl;
    {class} function getAddress: JString; cdecl;
    {class} function getName: JString; cdecl;
    {class} function init: JDevBluetooth; cdecl;
    {class} procedure listen; cdecl;
    {class} function toString: JString; cdecl;
    {class} procedure waitConnection; cdecl;
    {class} procedure write(P1: TJavaArray<Byte>); cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/device/DevBluetooth')]
  JDevBluetooth = interface(JDevice)
    ['{C1E45E2F-6137-48C4-BB7F-315E13F8F8AC}']
  end;
  TJDevBluetooth = class(TJavaGenericImport<JDevBluetoothClass, JDevBluetooth>) end;

  JDevBluetooth_ConnectingThreadClass = interface(JThreadClass)
    ['{476CC16F-4DEC-4400-B153-343CCA3ACC04}']
    {class} function init(P1: JDevBluetooth; P2: JBluetoothDevice): JDevBluetooth_ConnectingThread; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/device/DevBluetooth$ConnectingThread')]
  JDevBluetooth_ConnectingThread = interface(JThread)
    ['{F1E06036-7450-4D78-856E-DB08BAE82469}']
    procedure cancel; cdecl;
    procedure run; cdecl;
  end;
  TJDevBluetooth_ConnectingThread = class(TJavaGenericImport<JDevBluetooth_ConnectingThreadClass, JDevBluetooth_ConnectingThread>) end;

  JDevBluetooth_ListenThreadClass = interface(JThreadClass)
    ['{F66EAF1D-315A-4751-8671-46BE51607875}']
    {class} function init(P1: JDevBluetooth): JDevBluetooth_ListenThread; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/device/DevBluetooth$ListenThread')]
  JDevBluetooth_ListenThread = interface(JThread)
    ['{D879AAEF-F4EE-488C-8902-6D13CE9FEFE5}']
    procedure cancel; cdecl;
    procedure run; cdecl;
  end;
  TJDevBluetooth_ListenThread = class(TJavaGenericImport<JDevBluetooth_ListenThreadClass, JDevBluetooth_ListenThread>) end;

  JDevBluetooth_ReceiveThreadClass = interface(JThreadClass)
    ['{8C710104-09C7-43D8-9E26-D03622AE3CFC}']
    {class} function init(P1: JDevBluetooth; P2: JBluetoothSocket): JDevBluetooth_ReceiveThread; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/device/DevBluetooth$ReceiveThread')]
  JDevBluetooth_ReceiveThread = interface(JThread)
    ['{89C885E6-6579-46F4-9F4C-89A6BBD037A4}']
    procedure cancel; cdecl;
    procedure flush; cdecl;
    procedure run; cdecl;
    procedure write(P1: TJavaArray<Byte>); cdecl;
  end;
  TJDevBluetooth_ReceiveThread = class(TJavaGenericImport<JDevBluetooth_ReceiveThreadClass, JDevBluetooth_ReceiveThread>) end;

  JDevBluetoothLeClass = interface(JDeviceClass)
    ['{BDA9F979-ED6A-40C7-9420-11FE3E0A66B9}']
    {class} function _GetUUID_BLASTER_BT53H_SERVICE: JUUID; cdecl;
    {class} function _GetUUID_BLASTER_READ_BT53H_CHARACTERISTIC: JUUID; cdecl;
    {class} function _GetUUID_BLASTER_READ_CHARACTERISTIC: JUUID; cdecl;
    {class} function _GetUUID_BLASTER_SERVICE: JUUID; cdecl;
    {class} function _GetUUID_BLASTER_WRITE_BT53H_CHARACTERISTIC: JUUID; cdecl;
    {class} function _GetUUID_BLASTER_WRITE_CHARACTERISTIC: JUUID; cdecl;
    {class} function _GetUUID_CHAR_AGG_FORMAT: JUUID; cdecl;
    {class} function _GetUUID_CHAR_CLIENT_CONFIG: JUUID; cdecl;
    {class} function _GetUUID_CHAR_DESCRIPTION: JUUID; cdecl;
    {class} function _GetUUID_CHAR_EXT_PROP: JUUID; cdecl;
    {class} function _GetUUID_CHAR_PRESENT_FORMAT: JUUID; cdecl;
    {class} function _GetUUID_CHAR_SRVR_CONFIG: JUUID; cdecl;
    {class} function init: JDevBluetoothLe; cdecl;
    {class} property UUID_BLASTER_BT53H_SERVICE: JUUID read _GetUUID_BLASTER_BT53H_SERVICE;
    {class} property UUID_BLASTER_READ_BT53H_CHARACTERISTIC: JUUID read _GetUUID_BLASTER_READ_BT53H_CHARACTERISTIC;
    {class} property UUID_BLASTER_READ_CHARACTERISTIC: JUUID read _GetUUID_BLASTER_READ_CHARACTERISTIC;
    {class} property UUID_BLASTER_SERVICE: JUUID read _GetUUID_BLASTER_SERVICE;
    {class} property UUID_BLASTER_WRITE_BT53H_CHARACTERISTIC: JUUID read _GetUUID_BLASTER_WRITE_BT53H_CHARACTERISTIC;
    {class} property UUID_BLASTER_WRITE_CHARACTERISTIC: JUUID read _GetUUID_BLASTER_WRITE_CHARACTERISTIC;
    {class} property UUID_CHAR_AGG_FORMAT: JUUID read _GetUUID_CHAR_AGG_FORMAT;
    {class} property UUID_CHAR_CLIENT_CONFIG: JUUID read _GetUUID_CHAR_CLIENT_CONFIG;
    {class} property UUID_CHAR_DESCRIPTION: JUUID read _GetUUID_CHAR_DESCRIPTION;
    {class} property UUID_CHAR_EXT_PROP: JUUID read _GetUUID_CHAR_EXT_PROP;
    {class} property UUID_CHAR_PRESENT_FORMAT: JUUID read _GetUUID_CHAR_PRESENT_FORMAT;
    {class} property UUID_CHAR_SRVR_CONFIG: JUUID read _GetUUID_CHAR_SRVR_CONFIG;
  end;

  [JavaSignature('com/hanmiit/lib/device/DevBluetoothLe')]
  JDevBluetoothLe = interface(JDevice)
    ['{773A11E0-FDB4-46E9-B9A4-6EC18613D10E}']
    procedure connect(P1: JString); cdecl;
    procedure disconnect; cdecl;
    procedure flush; cdecl;
    function getAddress: JString; cdecl;
    function getName: JString; cdecl;
    procedure listen; cdecl;
    function toString: JString; cdecl;
    procedure waitConnection; cdecl;
    procedure write(P1: TJavaArray<Byte>); cdecl;
  end;
  TJDevBluetoothLe = class(TJavaGenericImport<JDevBluetoothLeClass, JDevBluetoothLe>) end;

  JDevBluetoothLe_1Class = interface(JBluetoothGattCallbackClass)
    ['{EC060A7D-E6EA-4E0A-85AB-3C8555AD9639}']
  end;

  [JavaSignature('com/hanmiit/lib/device/DevBluetoothLe$1')]
  JDevBluetoothLe_1 = interface(JBluetoothGattCallback)
    ['{8C1611AA-09A1-4A97-8657-9F0DF21AE212}']
    procedure onCharacteristicChanged(P1: JBluetoothGatt; P2: JBluetoothGattCharacteristic); cdecl;
    procedure onCharacteristicRead(P1: JBluetoothGatt; P2: JBluetoothGattCharacteristic; P3: Integer); cdecl;
    procedure onCharacteristicWrite(P1: JBluetoothGatt; P2: JBluetoothGattCharacteristic; P3: Integer); cdecl;
    procedure onConnectionStateChange(P1: JBluetoothGatt; P2: Integer; P3: Integer); cdecl;
    procedure onDescriptorWrite(P1: JBluetoothGatt; P2: JBluetoothGattDescriptor; P3: Integer); cdecl;
    procedure onReliableWriteCompleted(P1: JBluetoothGatt; P2: Integer); cdecl;
    procedure onServicesDiscovered(P1: JBluetoothGatt; P2: Integer); cdecl;
  end;
  TJDevBluetoothLe_1 = class(TJavaGenericImport<JDevBluetoothLe_1Class, JDevBluetoothLe_1>) end;

  JDevBluetoothLe_2Class = interface(JBroadcastReceiverClass)
    ['{4DE7AB15-420F-4508-AA72-6F8BB2D6943A}']
  end;

  [JavaSignature('com/hanmiit/lib/device/DevBluetoothLe$2')]
  JDevBluetoothLe_2 = interface(JBroadcastReceiver)
    ['{ADA0AD8A-B0CD-4166-8E46-8FA4AC1AD87A}']
    procedure onReceive(P1: JContext; P2: JIntent); cdecl;
  end;
  TJDevBluetoothLe_2 = class(TJavaGenericImport<JDevBluetoothLe_2Class, JDevBluetoothLe_2>) end;

  JDevice_1Class = interface(JRunnableClass)
    ['{FF1C2468-73FD-40E6-BE73-56C904A27F1A}']
  end;

  [JavaSignature('com/hanmiit/lib/device/Device$1')]
  JDevice_1 = interface(JRunnable)
    ['{4877824E-3362-4CF7-AC2E-5BFA461C14BF}']
    procedure run; cdecl;
  end;
  TJDevice_1 = class(TJavaGenericImport<JDevice_1Class, JDevice_1>) end;

  JBleDeviceListActivityClass = interface(JActivityClass)
    ['{FE761D04-06A4-46A2-B1AD-48A0EB28EE61}']
    {class} function init: JBleDeviceListActivity; cdecl;
    {class} procedure onClick(P1: JView); cdecl;
    {class} procedure onItemClick(P1: JAdapterView; P2: JView; P3: Integer; P4: Int64); cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/device/dialog/BleDeviceListActivity')]
  JBleDeviceListActivity = interface(JActivity)
    ['{4AD6918D-AB61-4147-88DF-7D1181BF1F1C}']
  end;
  TJBleDeviceListActivity = class(TJavaGenericImport<JBleDeviceListActivityClass, JBleDeviceListActivity>) end;

  JBleDeviceListActivity_1Class = interface(JBluetoothAdapter_LeScanCallbackClass)
    ['{9DDE9BB5-3706-4318-AB2C-81A66F4200E1}']
  end;

  [JavaSignature('com/hanmiit/lib/device/dialog/BleDeviceListActivity$1')]
  JBleDeviceListActivity_1 = interface(JBluetoothAdapter_LeScanCallback)
    ['{10C2DB77-DD76-43C1-B6FC-B197A916A5EE}']
    procedure onLeScan(P1: JBluetoothDevice; P2: Integer; P3: TJavaArray<Byte>); cdecl;
  end;
  TJBleDeviceListActivity_1 = class(TJavaGenericImport<JBleDeviceListActivity_1Class, JBleDeviceListActivity_1>) end;

  J1_1Class = interface(JRunnableClass)
    ['{B9A6B49A-B5B1-40A9-B027-2B2DDA9570CC}']
  end;

  [JavaSignature('com/hanmiit/lib/device/dialog/BleDeviceListActivity$1$1')]
  J1_1 = interface(JRunnable)
    ['{2C5B373E-1AF3-4F1D-BCD1-997705D81775}']
    procedure run; cdecl;
  end;
  TJ1_1 = class(TJavaGenericImport<J1_1Class, J1_1>) end;

  JBleDeviceListActivity_2Class = interface(JRunnableClass)
    ['{7705E6B4-F484-4124-A194-C429EEEE7BFB}']
  end;

  [JavaSignature('com/hanmiit/lib/device/dialog/BleDeviceListActivity$2')]
  JBleDeviceListActivity_2 = interface(JRunnable)
    ['{7CA1DC08-D2BA-4E45-9CD2-56EDC00D1CD1}']
    procedure run; cdecl;
  end;
  TJBleDeviceListActivity_2 = class(TJavaGenericImport<JBleDeviceListActivity_2Class, JBleDeviceListActivity_2>) end;

  J2_1Class = interface(JRunnableClass)
    ['{2F4C28EB-C923-42A8-8547-C64C78FFD919}']
  end;

  [JavaSignature('com/hanmiit/lib/device/dialog/BleDeviceListActivity$2$1')]
  J2_1 = interface(JRunnable)
    ['{3A5547C1-7BE9-46D0-8AC8-95F3B1AED90B}']
    procedure run; cdecl;
  end;
  TJ2_1 = class(TJavaGenericImport<J2_1Class, J2_1>) end;

  JBleDeviceListAdapterClass = interface(JBaseAdapterClass)
    ['{FDB7DAFC-0CDC-4592-9098-1E582828DB35}']
    {class} procedure Update; cdecl;
    {class} procedure addItem(P1: JBluetoothDevice; P2: Integer); cdecl;
    {class} procedure clear; cdecl;
    {class} function getCount: Integer; cdecl;
    {class} function getItem(P1: Integer): JBluetoothDevice; cdecl;
    {class} function getItemId(P1: Integer): Int64; cdecl;
    {class} function getView(P1: Integer; P2: JView; P3: JViewGroup): JView; cdecl;
    {class} function init: JBleDeviceListAdapter; cdecl;
    {class} procedure shutdown; cdecl;
    {class} procedure startup; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/device/dialog/BleDeviceListAdapter')]
  JBleDeviceListAdapter = interface(JBaseAdapter)
    ['{5DB152DD-0D03-4291-8607-8EAAA3153360}']
  end;
  TJBleDeviceListAdapter = class(TJavaGenericImport<JBleDeviceListAdapterClass, JBleDeviceListAdapter>) end;

  JBleDeviceListAdapter_1Class = interface(JRunnableClass)
    ['{FF4A496C-95B9-49BF-B51F-B78D058783AA}']
  end;

  [JavaSignature('com/hanmiit/lib/device/dialog/BleDeviceListAdapter$1')]
  JBleDeviceListAdapter_1 = interface(JRunnable)
    ['{455D73BF-8199-4E02-B9E7-ED59866101F0}']
    procedure run; cdecl;
  end;
  TJBleDeviceListAdapter_1 = class(TJavaGenericImport<JBleDeviceListAdapter_1Class, JBleDeviceListAdapter_1>) end;

  JBleDeviceListAdapter_2Class = interface(JRunnableClass)
    ['{D82EC92B-819E-4672-9BA6-298739CCA71F}']
  end;

  [JavaSignature('com/hanmiit/lib/device/dialog/BleDeviceListAdapter$2')]
  JBleDeviceListAdapter_2 = interface(JRunnable)
    ['{CE65881B-9A3B-4CC7-98DE-756F4F4A3C5A}']
    procedure run; cdecl;
  end;
  TJBleDeviceListAdapter_2 = class(TJavaGenericImport<JBleDeviceListAdapter_2Class, JBleDeviceListAdapter_2>) end;

  JBleDeviceListAdapter_DeviceListItemClass = interface(JObjectClass)
    ['{F892A48A-D75C-4FF2-B6E2-B9AD6F130B81}']
  end;

  [JavaSignature('com/hanmiit/lib/device/dialog/BleDeviceListAdapter$DeviceListItem')]
  JBleDeviceListAdapter_DeviceListItem = interface(JObject)
    ['{258AB83F-B8B2-42C8-A7F7-BEF15895859A}']
    function toString: JString; cdecl;
  end;
  TJBleDeviceListAdapter_DeviceListItem = class(TJavaGenericImport<JBleDeviceListAdapter_DeviceListItemClass, JBleDeviceListAdapter_DeviceListItem>) end;

  JBleDeviceListAdapter_DeviceListViewHolderClass = interface(JObjectClass)
    ['{8FE43107-02E2-4F1F-B83C-CA5748CBA18D}']
  end;

  [JavaSignature('com/hanmiit/lib/device/dialog/BleDeviceListAdapter$DeviceListViewHolder')]
  JBleDeviceListAdapter_DeviceListViewHolder = interface(JObject)
    ['{604D46E3-7EA3-44AE-9798-ADEF17887BF6}']
  end;
  TJBleDeviceListAdapter_DeviceListViewHolder = class(TJavaGenericImport<JBleDeviceListAdapter_DeviceListViewHolderClass, JBleDeviceListAdapter_DeviceListViewHolder>) end;

  JDeviceListClass = interface(JObjectClass)
    ['{4D29FDA8-7A22-469C-AB40-0DF6B67F5004}']
    {class} function _GetDEVICE_ADDRESS: JString; cdecl;
    {class} function _GetDEVICE_ID: JString; cdecl;
    {class} function init: JDeviceList; cdecl;
    {class} property DEVICE_ADDRESS: JString read _GetDEVICE_ADDRESS;
    {class} property DEVICE_ID: JString read _GetDEVICE_ID;
  end;

  [JavaSignature('com/hanmiit/lib/device/dialog/DeviceList')]
  JDeviceList = interface(JObject)
    ['{B7573D7B-8003-49E8-ADD0-0521EDA23BD7}']
  end;
  TJDeviceList = class(TJavaGenericImport<JDeviceListClass, JDeviceList>) end;

  JDeviceListActivityClass = interface(JActivityClass)
    ['{B22A0F09-B857-4E18-AFD5-F0EC98119D67}']
    {class} function init: JDeviceListActivity; cdecl;
    {class} procedure onClick(P1: JView); cdecl;
    {class} procedure onItemClick(P1: JAdapterView; P2: JView; P3: Integer; P4: Int64); cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/device/dialog/DeviceListActivity')]
  JDeviceListActivity = interface(JActivity)
    ['{F9543EBA-9F35-4CFD-A444-1362B92673CD}']
  end;
  TJDeviceListActivity = class(TJavaGenericImport<JDeviceListActivityClass, JDeviceListActivity>) end;

  JDeviceListActivity_1Class = interface(JBroadcastReceiverClass)
    ['{6E43EE45-7A88-4FE3-B941-7255F440C3C0}']
  end;

  [JavaSignature('com/hanmiit/lib/device/dialog/DeviceListActivity$1')]
  JDeviceListActivity_1 = interface(JBroadcastReceiver)
    ['{8B423FFA-19FD-47C8-B50A-5C81D60B0049}']
    procedure onReceive(P1: JContext; P2: JIntent); cdecl;
  end;
  TJDeviceListActivity_1 = class(TJavaGenericImport<JDeviceListActivity_1Class, JDeviceListActivity_1>) end;

  JDeviceListAdapterClass = interface(JBaseAdapterClass)
    ['{1CE1781F-43C5-433A-9C0E-BF9F5F3BBFF1}']
    {class} procedure addItem(P1: JString); cdecl; overload;
    {class} procedure addItem(P1: JString; P2: JString); cdecl; overload;
    {class} procedure clear; cdecl;
    {class} function getCount: Integer; cdecl;
    {class} function getItem(P1: Integer): JString; cdecl;
    {class} function getItemId(P1: Integer): Int64; cdecl;
    {class} function getView(P1: Integer; P2: JView; P3: JViewGroup): JView; cdecl;
    {class} function init: JDeviceListAdapter; cdecl;
    {class} procedure removeItem(P1: Integer); cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/device/dialog/DeviceListAdapter')]
  JDeviceListAdapter = interface(JBaseAdapter)
    ['{C62C1947-F1ED-48EF-8C20-EB7BC5257BED}']
  end;
  TJDeviceListAdapter = class(TJavaGenericImport<JDeviceListAdapterClass, JDeviceListAdapter>) end;

  JDeviceListAdapter_DeviceListItemClass = interface(JObjectClass)
    ['{07FA9E47-3FF6-4BB8-9A35-7F4861A1BEB5}']
  end;

  [JavaSignature('com/hanmiit/lib/device/dialog/DeviceListAdapter$DeviceListItem')]
  JDeviceListAdapter_DeviceListItem = interface(JObject)
    ['{58D4DB68-68E7-49E0-B873-1755542E5C9A}']
  end;
  TJDeviceListAdapter_DeviceListItem = class(TJavaGenericImport<JDeviceListAdapter_DeviceListItemClass, JDeviceListAdapter_DeviceListItem>) end;

  JDeviceListAdapter_DeviceListViewHolderClass = interface(JObjectClass)
    ['{C2E8A4C8-67A4-4FB2-B738-E8482D04BE3D}']
  end;

  [JavaSignature('com/hanmiit/lib/device/dialog/DeviceListAdapter$DeviceListViewHolder')]
  JDeviceListAdapter_DeviceListViewHolder = interface(JObject)
    ['{81653D90-7B75-4E61-A78F-D9FFA82C3838}']
    function getView: JView; cdecl;
    procedure setItem(P1: JDeviceListAdapter_DeviceListItem); cdecl;
  end;
  TJDeviceListAdapter_DeviceListViewHolder = class(TJavaGenericImport<JDeviceListAdapter_DeviceListViewHolderClass, JDeviceListAdapter_DeviceListViewHolder>) end;

  JConnectionStateClass = interface(JEnumClass)
    ['{DD332794-999B-4DFB-B9BC-6E27B7512D31}']
    {class} function _GetConnected: JConnectionState; cdecl;
    {class} function _GetConnecting: JConnectionState; cdecl;
    {class} function _GetDisconnected: JConnectionState; cdecl;
    {class} function _GetListen: JConnectionState; cdecl;
    {class} function valueOf(P1: JString): JConnectionState; cdecl; overload;
    {class} function valueOf(P1: Integer): JConnectionState; cdecl; overload;
    {class} function values: TJavaObjectArray<JConnectionState>; cdecl;
    {class} property Connected: JConnectionState read _GetConnected;
    {class} property Connecting: JConnectionState read _GetConnecting;
    {class} property Disconnected: JConnectionState read _GetDisconnected;
    {class} property Listen: JConnectionState read _GetListen;
  end;

  [JavaSignature('com/hanmiit/lib/device/type/ConnectionState')]
  JConnectionState = interface(JEnum)
    ['{0F3954EB-ACEA-4A70-9EEE-B76566E14573}']
    function getState: Integer; cdecl;
  end;
  TJConnectionState = class(TJavaGenericImport<JConnectionStateClass, JConnectionState>) end;

  JATLogClass = interface(JObjectClass)
    ['{F2F732F4-7FC5-4D90-A4EF-4D169B58443C}']
    {class} procedure d(P1: JString; P2: JString); cdecl; overload;
    {class} procedure e(P1: JString; P2: JString); cdecl; overload;
    {class} procedure i(P1: JString; P2: JString); cdecl; overload;
    {class} function init: JATLog; cdecl;
    {class} function isLogEnabled: Boolean; cdecl;
    {class} procedure setLogEnabled(P1: Boolean); cdecl;
    {class} procedure shutdown; cdecl;
    {class} procedure startUp(P1: JString; P2: JString); cdecl;
    {class} procedure v(P1: JString; P2: JString); cdecl; overload;
    {class} procedure w(P1: JString; P2: JString); cdecl; overload;
  end;

  [JavaSignature('com/hanmiit/lib/diagnostics/ATLog')]
  JATLog = interface(JObject)
    ['{C0E7591E-4045-4978-922E-CCA01727A7B7}']
  end;
  TJATLog = class(TJavaGenericImport<JATLogClass, JATLog>) end;

  JATLog_1Class = interface(JRunnableClass)
    ['{FC96E943-7AF2-4CC5-8196-A01F2156AF75}']
    {class} procedure run; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/diagnostics/ATLog$1')]
  JATLog_1 = interface(JRunnable)
    ['{6A9546D9-A356-45AD-9726-E504528593C5}']
  end;
  TJATLog_1 = class(TJavaGenericImport<JATLog_1Class, JATLog_1>) end;

  JATLog_ATUncaughtExceptionHandlerClass = interface(JThread_UncaughtExceptionHandlerClass)
    ['{FAB29C27-BAD5-43B7-B440-A24096AA625F}']
    {class} procedure uncaughtException(P1: JThread; P2: JThrowable); cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/diagnostics/ATLog$ATUncaughtExceptionHandler')]
  JATLog_ATUncaughtExceptionHandler = interface(JThread_UncaughtExceptionHandler)
    ['{4329813A-39F1-46CB-BDAC-4B9FB54FF357}']
  end;
  TJATLog_ATUncaughtExceptionHandler = class(TJavaGenericImport<JATLog_ATUncaughtExceptionHandlerClass, JATLog_ATUncaughtExceptionHandler>) end;

  JATLog_QueueItemClass = interface(JObjectClass)
    ['{EF69740A-F402-4F8E-94AC-C1293CE333D2}']
    {class} function toString: JString; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/diagnostics/ATLog$QueueItem')]
  JATLog_QueueItem = interface(JObject)
    ['{770E9850-913E-435B-B195-B1A660E77BDF}']
  end;
  TJATLog_QueueItem = class(TJavaGenericImport<JATLog_QueueItemClass, JATLog_QueueItem>) end;

  JDumpClass = interface(JObjectClass)
    ['{ABBB8FBA-8F80-4A96-93B4-EE1490D7B95D}']
    {class} function dump(P1: TJavaArray<Integer>): JString; cdecl; overload;
    {class} function dump(P1: TJavaObjectArray<JObject>): JString; cdecl; overload;
    {class} function dump(P1: TJavaArray<Byte>): JString; cdecl; overload;
    {class} function dump(P1: TJavaArray<Integer>; P2: Integer): JString; cdecl; overload;
    {class} function dump(P1: TJavaObjectArray<JObject>; P2: Integer): JString; cdecl; overload;
    {class} function dump(P1: TJavaArray<Byte>; P2: Integer): JString; cdecl; overload;
    {class} function dump(P1: TJavaObjectArray<JObject>; P2: Integer; P3: Integer): JString; cdecl; overload;
    {class} function dump(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): JString; cdecl; overload;
    {class} function dump(P1: TJavaArray<Integer>; P2: Integer; P3: Integer): JString; cdecl; overload;
    {class} function init: JDump; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/diagnostics/Dump')]
  JDump = interface(JObject)
    ['{B51FE97A-47AA-40C0-A08F-71F1B147DEFE}']
  end;
  TJDump = class(TJavaGenericImport<JDumpClass, JDump>) end;

  JRangeValueClass = interface(JObjectClass)
    ['{1B65355C-47CB-46C7-8C24-E7EC3E1E16FE}']
    {class} procedure clear; cdecl;
    {class} function getEnd: Integer; cdecl;
    {class} function getLength: Integer; cdecl;
    {class} function getStart: Integer; cdecl;
    {class} function init: JRangeValue; cdecl; overload;
    {class} function init(P1: Integer; P2: Integer): JRangeValue; cdecl; overload;
    {class} procedure setEnd(P1: Integer); cdecl;
    {class} procedure setStart(P1: Integer); cdecl;
    {class} function toString: JString; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/params/RangeValue')]
  JRangeValue = interface(JObject)
    ['{EBFB93B9-3FC6-4BE4-8760-510925F1B7D1}']
  end;
  TJRangeValue = class(TJavaGenericImport<JRangeValueClass, JRangeValue>) end;

  JModuleRfBlasterClass = interface(JObjectClass)
    ['{EE94A3C8-0981-47D3-94E3-8E432C8C17B2}']
    {class} function _GetBARCODE_AIM: Integer; cdecl;
    {class} function _GetBARCODE_NONE: Integer; cdecl;
    {class} function _GetBARCODE_POWER: Integer; cdecl;
    {class} function _GetBAROCDE_TRIGGER: Integer; cdecl;
    {class} function init(P1: JDevice; P2: JProtocolRfidEventListener): JModuleRfBlaster; cdecl;
    {class} property BARCODE_AIM: Integer read _GetBARCODE_AIM;
    {class} property BARCODE_NONE: Integer read _GetBARCODE_NONE;
    {class} property BARCODE_POWER: Integer read _GetBARCODE_POWER;
    {class} property BAROCDE_TRIGGER: Integer read _GetBAROCDE_TRIGGER;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/ModuleRfBlaster')]
  JModuleRfBlaster = interface(JObject)
    ['{B05998AA-5BA0-41A8-8FDC-7BA604EA8763}']
    procedure addEpcMask(P1: JSelectMaskEpcParam); cdecl;
    function aimOff: Boolean; cdecl;
    function aimOn: Boolean; cdecl;
    procedure barcodeKeyActionSetting(P1: Boolean); cdecl;
    function blockErase(P1: JMemoryBank; P2: Integer; P3: Integer): Jtype_ResultCode; cdecl;
    function blockWrite(P1: JMemoryBank; P2: Integer; P3: JString): Jtype_ResultCode; cdecl;
    procedure clearEpcMask; cdecl;
    function defaultParameter: Jtype_ResultCode; cdecl;
    function enterBarcodeBypassMode(P1: Integer): Jtype_ResultCode; cdecl;
    function enterBypassMode: Jtype_ResultCode; cdecl;
    function getAccessPassword: JString; cdecl;
    function getActionTIDReadLength: Integer; cdecl;
    function getAlgorithm: JAlgorithmType; cdecl;
    function getAutoOffTime: Integer; cdecl;
    function getBarcodeMode: Boolean; cdecl;
    function getBarcodeParam(P1: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    function getBarcodePowerState: Integer; cdecl;
    function getBarcodeState: Integer; cdecl;
    function getBatteryStatus: Integer; cdecl;
    function getBleVersion: JString; cdecl;
    function getBuzzer: JBuzzerState; cdecl;
    function getCharset: JCharset; cdecl;
    function getContinuousMode: Boolean; cdecl;
    function getCurrentLinkProfile: Integer; cdecl;
    function getDefaultLinkProfile: Integer; cdecl;
    function getEpcMask(P1: Integer): JSelectMaskEpcParam; cdecl;
    function getEpcMaskCount: Integer; cdecl;
    function getEpcMaskMatchMode: Boolean; cdecl;
    function getFirmwareVersion: JString; cdecl;
    function getIdleTime: Integer; cdecl;
    function getInventorySession: JSessionType; cdecl;
    function getInventoryTime: Integer; cdecl;
    function getKeyAction: Boolean; cdecl;
    function getLBT: Int64; cdecl;
    function getLBTFrequency(P1: Integer): Integer; cdecl;
    function getLBTMask: Int64; cdecl;
    function getLimitTagCount: Integer; cdecl;
    function getMask(P1: Integer): JStringIntegerValue; cdecl;
    function getMaskAction(P1: Integer): JMaskActionType; cdecl;
    function getMaskBank(P1: Integer): JMemoryBank; cdecl;
    function getMaskOffset(P1: Integer): Integer; cdecl;
    function getMaskTarget(P1: Integer): JMaskTargetType; cdecl;
    function getMaskUsed(P1: Integer): Boolean; cdecl;
    function getMaxQ: Integer; cdecl;
    function getMinQ: Integer; cdecl;
    function getOperationMode: Integer; cdecl;
    function getOperationTime: Integer; cdecl;
    function getPowerGain: Integer; cdecl;
    function getPowerGainRange: JMinMaxValue; cdecl;
    function getRegister: JString; cdecl;
    function getRemoteMode: Boolean; cdecl;
    function getReportMode: Boolean; cdecl;
    function getReportRSSI: Boolean; cdecl;
    function getRevision: JString; cdecl;
    function getSameTagReportTime: Integer; cdecl;
    function getSerialNumber: JString; cdecl;
    function getSessionFlag: JSessionFlag; cdecl;
    function getStoredMode: Boolean; cdecl;
    function getStoredTagCount: Integer; cdecl;
    function getTagDataType: JTagDataType; cdecl;
    function getTime: JDate; cdecl;
    function getUseSelectionMask: JSelectFlag; cdecl;
    function hardReset: Jtype_ResultCode; cdecl;
    function inventory: Jtype_ResultCode; cdecl;
    function kill(P1: JString): Jtype_ResultCode; cdecl;
    function leaveBypassMode: Jtype_ResultCode; cdecl;
    function loadDebugMessage: Jtype_ResultCode; cdecl;
    function loadStoredTag: Jtype_ResultCode; cdecl;
    function lock(P1: Integer; P2: Integer): Jtype_ResultCode; cdecl;
    function permaLock(P1: Integer; P2: Integer): Jtype_ResultCode; cdecl;
    function readMemory(P1: JMemoryBank; P2: Integer; P3: Integer): Jtype_ResultCode; cdecl;
    function removeAllStoredTags: Jtype_ResultCode; cdecl;
    procedure saveEpcMask; cdecl;
    function saveParameter: Jtype_ResultCode; cdecl;
    function saveStoredTag(P1: JString): Jtype_ResultCode; cdecl;
    procedure setAccessPassword(P1: JString); cdecl;
    procedure setActionTIDReadLength(P1: Integer); cdecl;
    procedure setAlgorithm(P1: JAlgorithmType); cdecl;
    procedure setAutoOffTime(P1: Integer); cdecl;
    procedure setBarcodeMode(P1: Boolean); cdecl;
    function setBarcodeParam: Boolean; cdecl; overload;
    function setBarcodeParam(P1: TJavaArray<Byte>): Boolean; cdecl; overload;
    procedure setBarcodePowerState(P1: Integer); cdecl;
    procedure setBuzzer(P1: JBuzzerState); cdecl;
    procedure setCarrierWaveDelay(P1: Integer); cdecl;
    function setCharset(P1: JCharset): Boolean; cdecl;
    procedure setContinuousMode(P1: Boolean); cdecl;
    procedure setCurrentLinkProfile(P1: Integer); cdecl;
    procedure setDebugMode(P1: Boolean); cdecl;
    procedure setDefaultLinkProfile(P1: Integer); cdecl;
    procedure setEpcMaskMatchMode(P1: Boolean); cdecl;
    procedure setIdleTime(P1: Integer); cdecl;
    procedure setInventorySession(P1: JSessionType); cdecl;
    procedure setInventoryTime(P1: Integer); cdecl;
    procedure setKeyAction(P1: Boolean); cdecl;
    procedure setLBT(P1: Int64); cdecl;
    procedure setLimitTagCount(P1: Integer); cdecl;
    procedure setMask(P1: Integer; P2: JString); cdecl; overload;
    procedure setMask(P1: Integer; P2: JString; P3: Integer); cdecl; overload;
    procedure setMaskAction(P1: Integer; P2: JMaskActionType); cdecl;
    procedure setMaskBank(P1: Integer; P2: JMemoryBank); cdecl;
    procedure setMaskOffset(P1: Integer; P2: Integer); cdecl;
    procedure setMaskTarget(P1: Integer; P2: JMaskTargetType); cdecl;
    procedure setMaskUsed(P1: Integer; P2: Boolean); cdecl;
    procedure setMaxQ(P1: Integer); cdecl;
    procedure setMinQ(P1: Integer); cdecl;
    procedure setOperationMode(P1: Integer); cdecl;
    procedure setOperationTime(P1: Integer); cdecl;
    procedure setPowerGain(P1: Integer); cdecl;
    procedure setRegister(P1: JString); cdecl;
    procedure setRemoteMode(P1: Boolean); cdecl;
    procedure setReportMode(P1: Boolean); cdecl;
    procedure setReportRSSI(P1: Boolean); cdecl;
    procedure setSameTagReportTime(P1: Integer); cdecl;
    procedure setSerialNumber(P1: JString); cdecl;
    procedure setSessionFlag(P1: JSessionFlag); cdecl;
    procedure setStoredMode(P1: Boolean); cdecl;
    procedure setTagDataType(P1: JTagDataType); cdecl;
    procedure setTime(P1: JDate); cdecl;
    procedure setUseSelectionMask(P1: JSelectFlag); cdecl;
    function softReset: Jtype_ResultCode; cdecl;
    function startDecode: Boolean; cdecl;
    procedure startModule; cdecl;
    procedure stopModule; cdecl;
    function stopOperation: Jtype_ResultCode; cdecl;
    function stopSync: Jtype_ResultCode; cdecl;
    function writeMemory(P1: JMemoryBank; P2: Integer; P3: JString): Jtype_ResultCode; cdecl;
  end;
  TJModuleRfBlaster = class(TJavaGenericImport<JModuleRfBlasterClass, JModuleRfBlaster>) end;

  JAccessResultArgsClass = interface(JObjectClass)
    ['{A45D6904-6633-4253-9A19-97AB63C40228}']
    {class} function getAction: JActionState; cdecl;
    {class} function getCode: Jtype_ResultCode; cdecl;
    {class} function getData: JString; cdecl;
    {class} function getEpc: JString; cdecl;
    {class} function getPhase: Single; cdecl;
    {class} function getRssi: Single; cdecl;
    {class} function init(P1: Jtype_ResultCode; P2: JActionState; P3: JString; P4: JString; P5: Single; P6: Single): JAccessResultArgs; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/args/AccessResultArgs')]
  JAccessResultArgs = interface(JObject)
    ['{230DCFB0-2FF8-4F8E-AEAB-7D30DA287B12}']
  end;
  TJAccessResultArgs = class(TJavaGenericImport<JAccessResultArgsClass, JAccessResultArgs>) end;

  JReadedTagArgsClass = interface(JObjectClass)
    ['{7261148D-8DE7-410F-A253-93C99739271B}']
    {class} function getAction: JActionState; cdecl;
    {class} function getPhase: Single; cdecl;
    {class} function getRssi: Single; cdecl;
    {class} function getTag: JString; cdecl;
    {class} function init(P1: JActionState; P2: JString; P3: Single; P4: Single): JReadedTagArgs; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/args/ReadedTagArgs')]
  JReadedTagArgs = interface(JObject)
    ['{F0C86CE7-41B9-4498-AB58-15061CC60BD8}']
  end;
  TJReadedTagArgs = class(TJavaGenericImport<JReadedTagArgsClass, JReadedTagArgs>) end;

  JATRfidEventListenerClass = interface(IJavaClass)
    ['{04E64ABC-80BE-40A9-A3A9-2EC0D524F57C}']
  end;

  [JavaSignature('com/hanmiit/lib/rfid/event/ATRfidEventListener')]
  JATRfidEventListener = interface(IJavaInstance)
    ['{FC5AAAB2-96B1-4008-ACCE-882664CB26D5}']
    {class} procedure onAccessResult(P1: JATRfidReader; P2: Jtype_ResultCode; P3: JActionState; P4: JString; P5: JString; P6: Single; P7: Single); cdecl;
    {class} procedure onActionChanged(P1: JATRfidReader; P2: JActionState); cdecl;
    {class} procedure onCommandComplete(P1: JATRfidReader; P2: JCommandType); cdecl;
    {class} procedure onDebugMessage(P1: JATRfidReader; P2: JString); cdecl;
    {class} procedure onDetactBarcode(P1: JATRfidReader; P2: JBarcodeType; P3: JString; P4: JString); cdecl;
    {class} procedure onLoadTag(P1: JATRfidReader; P2: JString); cdecl;
    {class} procedure onReadedTag(P1: JATRfidReader; P2: JActionState; P3: JString; P4: Single; P5: Single); cdecl;
    {class} procedure onRemoteKeyStateChanged(P1: JATRfidReader; P2: JRemoteKeyState); cdecl;
    {class} procedure onStateChanged(P1: JATRfidReader; P2: JConnectionState); cdecl;
  end;
  TJATRfidEventListener = class(TJavaGenericImport<JATRfidEventListenerClass, JATRfidEventListener>) end;

  JATRfidEventListenerManagerClass = interface(JEventListenerManagerClass)
    ['{D4020D25-7E8C-4A0D-A0C5-E8C866373AA8}']
    {class} function init: JATRfidEventListenerManager; cdecl;
    {class} procedure raiseAccessResult(P1: JATRfidReader; P2: Jtype_ResultCode; P3: JActionState; P4: JString; P5: JString; P6: Single; P7: Single); cdecl;
    {class} procedure raiseActionChanged(P1: JATRfidReader; P2: JActionState); cdecl;
    {class} procedure raiseCommandComplete(P1: JATRfidReader; P2: JCommandType); cdecl;
    {class} procedure raiseDebugMessage(P1: JATRfidReader; P2: JString); cdecl;
    {class} procedure raiseDetactBarcode(P1: JATRfidReader; P2: JBarcodeType; P3: JString; P4: JString); cdecl;
    {class} procedure raiseLoadTag(P1: JATRfidReader; P2: JString); cdecl;
    {class} procedure raiseReadedTag(P1: JATRfidReader; P2: JActionState; P3: JString; P4: Single; P5: Single); cdecl;
    {class} procedure raiseRemoteKeyStateChanged(P1: JATRfidReader; P2: JRemoteKeyState); cdecl;
    {class} procedure raiseStateChanged(P1: JATRfidReader; P2: JConnectionState); cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/event/ATRfidEventListenerManager')]
  JATRfidEventListenerManager = interface(JEventListenerManager)
    ['{AA817534-5C65-48E2-88AD-72F808AB9DC7}']
  end;
  TJATRfidEventListenerManager = class(TJavaGenericImport<JATRfidEventListenerManagerClass, JATRfidEventListenerManager>) end;

  JATRfidReaderExceptionClass = interface(JExceptionClass)
    ['{7343340D-819E-41A1-9690-F25A0F0344C1}']
    {class} function getResultCode: Jtype_ResultCode; cdecl;
    {class} function init(P1: Jtype_ResultCode): JATRfidReaderException; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/exception/ATRfidReaderException')]
  JATRfidReaderException = interface(JException)
    ['{26EB61EC-B566-4E93-891D-F3C75F99F36D}']
  end;
  TJATRfidReaderException = class(TJavaGenericImport<JATRfidReaderExceptionClass, JATRfidReaderException>) end;

  JLockParamClass = interface(JObjectClass)
    ['{890B5194-55FC-41CD-AB86-F66CCD268500}']
    {class} function _GetACCESS_PASSWORD: Integer; cdecl;
    {class} function _GetEPC: Integer; cdecl;
    {class} function _GetKILL_PASSWORD: Integer; cdecl;
    {class} function _GetTID: Integer; cdecl;
    {class} function _GetUSER: Integer; cdecl;
    {class} function init: JLockParam; cdecl; overload;
    {class} function init(P1: Boolean; P2: Boolean; P3: Boolean; P4: Boolean; P5: Boolean): JLockParam; cdecl; overload;
    {class} property ACCESS_PASSWORD: Integer read _GetACCESS_PASSWORD;
    {class} property EPC: Integer read _GetEPC;
    {class} property KILL_PASSWORD: Integer read _GetKILL_PASSWORD;
    {class} property TID: Integer read _GetTID;
    {class} property USER: Integer read _GetUSER;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/params/LockParam')]
  JLockParam = interface(JObject)
    ['{38D86878-57D5-449E-BEE6-7565620128D7}']
    function getAccessPassword: Boolean; cdecl;
    function getEPC: Boolean; cdecl;
    function getKillPassword: Boolean; cdecl;
    function getLock(P1: Integer): Boolean; cdecl;
    function getTID: Boolean; cdecl;
    function getUser: Boolean; cdecl;
    function getValue: Integer; cdecl;
    procedure setAccessPassword(P1: Boolean); cdecl;
    procedure setEPC(P1: Boolean); cdecl;
    procedure setKillPassword(P1: Boolean); cdecl;
    procedure setLock(P1: Integer; P2: Boolean); cdecl;
    procedure setTID(P1: Boolean); cdecl;
    procedure setUser(P1: Boolean); cdecl;
    function toString: JString; cdecl;
  end;
  TJLockParam = class(TJavaGenericImport<JLockParamClass, JLockParam>) end;

  JMinMaxValueClass = interface(JObjectClass)
    ['{AAAB4D78-30A7-407B-8FB0-1353891E1407}']
    {class} function getMax: Integer; cdecl;
    {class} function getMin: Integer; cdecl;
    {class} function init: JMinMaxValue; cdecl; overload;
    {class} function init(P1: Integer; P2: Integer): JMinMaxValue; cdecl; overload;
    {class} procedure setMax(P1: Integer); cdecl;
    {class} procedure setMin(P1: Integer); cdecl;
    {class} function toString: JString; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/params/MinMaxValue')]
  JMinMaxValue = interface(JObject)
    ['{24C37181-E671-4603-9A5A-DB79DBDCDDEC}']
  end;
  TJMinMaxValue = class(TJavaGenericImport<JMinMaxValueClass, JMinMaxValue>) end;

  JResultDataValueClass = interface(JObjectClass)
    ['{16DB8946-8F75-4E14-80D9-B7012C402E81}']
    {class} function getBinary: TJavaArray<Byte>; cdecl;
    {class} function getData: TJavaArray<Byte>; cdecl;
    {class} function getResultCode: Jtype_ResultCode; cdecl;
    {class} function init(P1: Jtype_ResultCode): JResultDataValue; cdecl; overload;
    {class} function init(P1: Jtype_ResultCode; P2: TJavaArray<Byte>): JResultDataValue; cdecl; overload;
    {class} function init(P1: Jtype_ResultCode; P2: TJavaArray<Byte>; P3: Integer; P4: Integer): JResultDataValue; cdecl; overload;
    {class} function toString: JString; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/params/ResultDataValue')]
  JResultDataValue = interface(JObject)
    ['{9551C871-93E0-4798-80F5-99447B3A3973}']
  end;
  TJResultDataValue = class(TJavaGenericImport<JResultDataValueClass, JResultDataValue>) end;

  JSelectMaskEpcParamClass = interface(JObjectClass)
    ['{EA49FBAB-C101-43C9-A6F4-E6C1B61C8611}']
    {class} function getLength: Integer; cdecl;
    {class} function getMask: JString; cdecl;
    {class} function getOffset: Integer; cdecl;
    {class} function init: JSelectMaskEpcParam; cdecl; overload;
    {class} function init(P1: Integer; P2: Integer; P3: JString): JSelectMaskEpcParam; cdecl; overload;
    {class} procedure setLength(P1: Integer); cdecl;
    {class} procedure setMask(P1: JString); cdecl;
    {class} procedure setOffset(P1: Integer); cdecl;
    {class} function toString: JString; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/params/SelectMaskEpcParam')]
  JSelectMaskEpcParam = interface(JObject)
    ['{0104EDFB-CCDB-4F99-946C-BEA1B6CFA63F}']
  end;
  TJSelectMaskEpcParam = class(TJavaGenericImport<JSelectMaskEpcParamClass, JSelectMaskEpcParam>) end;

  JSelectMaskParamClass = interface(JObjectClass)
    ['{020E75F9-516A-4C3E-AD16-A199E8870875}']
    {class} function getAction: JMaskActionType; cdecl;
    {class} function getBank: JMemoryBank; cdecl;
    {class} function getLength: Integer; cdecl;
    {class} function getMask: JString; cdecl;
    {class} function getOffset: Integer; cdecl;
    {class} function getTarget: JMaskTargetType; cdecl;
    {class} function init: JSelectMaskParam; cdecl; overload;
    {class} function init(P1: JMemoryBank; P2: Integer; P3: JString): JSelectMaskParam; cdecl; overload;
    {class} function init(P1: JMemoryBank; P2: Integer; P3: JString; P4: Integer): JSelectMaskParam; cdecl; overload;
    {class} function init(P1: JMaskTargetType; P2: JMaskActionType; P3: JMemoryBank; P4: Integer; P5: JString): JSelectMaskParam; cdecl; overload;
    {class} function init(P1: JMaskTargetType; P2: JMaskActionType; P3: JMemoryBank; P4: Integer; P5: JString; P6: Integer): JSelectMaskParam; cdecl; overload;
    {class} procedure setAction(P1: JMaskActionType); cdecl;
    {class} procedure setBank(P1: JMemoryBank); cdecl;
    {class} procedure setLength(P1: Integer); cdecl;
    {class} procedure setMask(P1: JString); cdecl;
    {class} procedure setOffset(P1: Integer); cdecl;
    {class} procedure setTarget(P1: JMaskTargetType); cdecl;
    {class} function toString: JString; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/params/SelectMaskParam')]
  JSelectMaskParam = interface(JObject)
    ['{3D19E7E2-68B6-4515-9895-FB0CE663DAED}']
  end;
  TJSelectMaskParam = class(TJavaGenericImport<JSelectMaskParamClass, JSelectMaskParam>) end;

  JStringIntegerValueClass = interface(JObjectClass)
    ['{22702208-16F7-4FD3-BBA3-658D4F45EAF7}']
    {class} function getData: JString; cdecl;
    {class} function getValue: Integer; cdecl;
    {class} function init(P1: JString; P2: Integer): JStringIntegerValue; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/params/StringIntegerValue')]
  JStringIntegerValue = interface(JObject)
    ['{7E0992B3-151C-4176-B349-6FB44A0D583E}']
  end;
  TJStringIntegerValue = class(TJavaGenericImport<JStringIntegerValueClass, JStringIntegerValue>) end;

  JCommandParamClass = interface(JObjectClass)
    ['{6169F4BE-566E-4D60-B23C-D0D8DEA75102}']
    {class} function init(P1: JSubCommandType): JCommandParam; cdecl; overload;
    {class} function init(P1: JSubCommandType; P2: JString): JCommandParam; cdecl; overload;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/params/command/CommandParam')]
  JCommandParam = interface(JObject)
    ['{105005E1-F1C6-46D0-8ABC-537772CCE2B5}']
    function getCommand: JSubCommandType; cdecl;
    function getPassword: JString; cdecl;
    function toString: JString; cdecl;
  end;
  TJCommandParam = class(TJavaGenericImport<JCommandParamClass, JCommandParam>) end;

  JLockTagCommandParamClass = interface(JCommandParamClass)
    ['{712830BA-6B54-4C52-82A5-A8977FD16BE7}']
    {class} function getParam: JLockParam; cdecl;
    {class} function init(P1: JSubCommandType; P2: JLockParam): JLockTagCommandParam; cdecl; overload;
    {class} function init(P1: JSubCommandType; P2: JLockParam; P3: JString): JLockTagCommandParam; cdecl; overload;
    {class} function toString: JString; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/params/command/LockTagCommandParam')]
  JLockTagCommandParam = interface(JCommandParam)
    ['{22A445B1-A26E-4267-BBCA-93D837EC6959}']
  end;
  TJLockTagCommandParam = class(TJavaGenericImport<JLockTagCommandParamClass, JLockTagCommandParam>) end;

  JReadMemoryCommandParamClass = interface(JCommandParamClass)
    ['{A66BB0F7-1E73-4BC9-BF60-DFFCB5FFD463}']
    {class} function getBank: JMemoryBank; cdecl;
    {class} function getLength: Integer; cdecl;
    {class} function getOffset: Integer; cdecl;
    {class} function init(P1: JSubCommandType; P2: JMemoryBank; P3: Integer; P4: Integer): JReadMemoryCommandParam; cdecl; overload;
    {class} function init(P1: JSubCommandType; P2: JMemoryBank; P3: Integer; P4: Integer; P5: JString): JReadMemoryCommandParam; cdecl; overload;
    {class} function toString: JString; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/params/command/ReadMemoryCommandParam')]
  JReadMemoryCommandParam = interface(JCommandParam)
    ['{64EF2125-6F28-400E-B5FC-2B1B3FA18543}']
  end;
  TJReadMemoryCommandParam = class(TJavaGenericImport<JReadMemoryCommandParamClass, JReadMemoryCommandParam>) end;

  JWriteMemoryCommandParamClass = interface(JCommandParamClass)
    ['{4F05D0A4-1DD5-4294-904D-323418DB1740}']
    {class} function getBank: JMemoryBank; cdecl;
    {class} function getData: JString; cdecl;
    {class} function getOffset: Integer; cdecl;
    {class} function init(P1: JSubCommandType; P2: JMemoryBank; P3: Integer; P4: JString): JWriteMemoryCommandParam; cdecl; overload;
    {class} function init(P1: JSubCommandType; P2: JMemoryBank; P3: Integer; P4: JString; P5: JString): JWriteMemoryCommandParam; cdecl; overload;
    {class} function toString: JString; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/params/command/WriteMemoryCommandParam')]
  JWriteMemoryCommandParam = interface(JCommandParam)
    ['{B93592D3-9DC2-409F-930B-A804744C7B5E}']
  end;
  TJWriteMemoryCommandParam = class(TJavaGenericImport<JWriteMemoryCommandParamClass, JWriteMemoryCommandParam>) end;

  JProtocolRfBlasterClass = interface(JObjectClass)
    ['{A7B17C1C-41D7-4AA9-8414-EA22A5FCFF5A}']
    {class} function _GetPARAM_ACCESS_PASSWORD: Byte; cdecl;
    {class} function _GetPARAM_ACT_READ_LEN: Byte; cdecl;
    {class} function _GetPARAM_ALGORITHM: Byte; cdecl;
    {class} function _GetPARAM_AUTO_OFF_TIME: Byte; cdecl;
    {class} function _GetPARAM_BARCODE_PARAM: Byte; cdecl;
    {class} function _GetPARAM_BARCODE_POWER: Byte; cdecl;
    {class} function _GetPARAM_BARCODE_REVISION: Byte; cdecl;
    {class} function _GetPARAM_BARCODE_STATUS: Byte; cdecl;
    {class} function _GetPARAM_BATTERY_STATUS: Byte; cdecl;
    {class} function _GetPARAM_BUZZER: Byte; cdecl;
    {class} function _GetPARAM_CARRIER_WAVE_DELAY: Byte; cdecl;
    {class} function _GetPARAM_CONTINUOUS_MODE: Byte; cdecl;
    {class} function _GetPARAM_CURRENT_PROFILE: Byte; cdecl;
    {class} function _GetPARAM_DEFAULT_PROFILE: Byte; cdecl;
    {class} function _GetPARAM_EPC_MASK: Byte; cdecl;
    {class} function _GetPARAM_EPC_MASK_DATA: Byte; cdecl;
    {class} function _GetPARAM_EPC_MASK_MODE: Byte; cdecl;
    {class} function _GetPARAM_FIRMWARE_VERSION: Byte; cdecl;
    {class} function _GetPARAM_IDLE_TIME: Byte; cdecl;
    {class} function _GetPARAM_INVENTORY_SESSION: Byte; cdecl;
    {class} function _GetPARAM_INVENTORY_TIME: Byte; cdecl;
    {class} function _GetPARAM_KEY_ACTION: Byte; cdecl;
    {class} function _GetPARAM_LBT: Byte; cdecl;
    {class} function _GetPARAM_LBT_FREQUENCY: Byte; cdecl;
    {class} function _GetPARAM_LBT_MASK: Byte; cdecl;
    {class} function _GetPARAM_LIMIT_TAG_COUNT: Byte; cdecl;
    {class} function _GetPARAM_MASK: Byte; cdecl;
    {class} function _GetPARAM_MASK_ACTION: Byte; cdecl;
    {class} function _GetPARAM_MASK_BANK: Byte; cdecl;
    {class} function _GetPARAM_MASK_OFFSET: Byte; cdecl;
    {class} function _GetPARAM_MASK_TARGET: Byte; cdecl;
    {class} function _GetPARAM_MASK_TRUNC: Byte; cdecl;
    {class} function _GetPARAM_MASK_USED: Byte; cdecl;
    {class} function _GetPARAM_MAX_Q: Byte; cdecl;
    {class} function _GetPARAM_MIN_Q: Byte; cdecl;
    {class} function _GetPARAM_OPERATION_MODE: Byte; cdecl;
    {class} function _GetPARAM_OPERATION_TIME: Byte; cdecl;
    {class} function _GetPARAM_POWER_GAIN: Byte; cdecl;
    {class} function _GetPARAM_POWER_GAIN_RANGE: Byte; cdecl;
    {class} function _GetPARAM_REGION: Byte; cdecl;
    {class} function _GetPARAM_REGISTER: Byte; cdecl;
    {class} function _GetPARAM_REMOTE_MODE: Byte; cdecl;
    {class} function _GetPARAM_REPORT_MODE: Byte; cdecl;
    {class} function _GetPARAM_REPORT_RSSI: Byte; cdecl;
    {class} function _GetPARAM_SAME_TAG_REPORT_TIME: Byte; cdecl;
    {class} function _GetPARAM_SERIAL_NUMBER: Byte; cdecl;
    {class} function _GetPARAM_SESSION_FLAG: Byte; cdecl;
    {class} function _GetPARAM_STORED_MODE: Byte; cdecl;
    {class} function _GetPARAM_STORED_TAG_COUNT: Byte; cdecl;
    {class} function _GetPARAM_TAG_DATA_TYPE: Byte; cdecl;
    {class} function _GetPARAM_TIME: Byte; cdecl;
    {class} function _GetPARAM_USE_SELECTION_MASK: Byte; cdecl;
    {class} function _GetSCANNER_ONKEYDOWN: TJavaArray<Byte>; cdecl;
    {class} function _GetSCANNER_ONKEYUP: TJavaArray<Byte>; cdecl;
    {class} function _GetSUBCMD_BLOCK_ERASE: Byte; cdecl;
    {class} function _GetSUBCMD_BLOCK_WRITE: Byte; cdecl;
    {class} function _GetSUBCMD_DECODE_START: Byte; cdecl;
    {class} function _GetSUBCMD_DEFAULT_PARAMETER: Byte; cdecl;
    {class} function _GetSUBCMD_ENTER_BARCODE_BYPADD_MODE: Byte; cdecl;
    {class} function _GetSUBCMD_ENTER_BYPASS_MODE: Byte; cdecl;
    {class} function _GetSUBCMD_HARD_RESET: Byte; cdecl;
    {class} function _GetSUBCMD_INVENTORY: Byte; cdecl;
    {class} function _GetSUBCMD_KILL: Byte; cdecl;
    {class} function _GetSUBCMD_LEAVE_BYPASS_MODE: Byte; cdecl;
    {class} function _GetSUBCMD_LOAD_STORED_TAG: Byte; cdecl;
    {class} function _GetSUBCMD_LOCK: Byte; cdecl;
    {class} function _GetSUBCMD_PERMA_LOCK: Byte; cdecl;
    {class} function _GetSUBCMD_READ_MEMORY: Byte; cdecl;
    {class} function _GetSUBCMD_REMOVE_ALL_STORED_TAG: Byte; cdecl;
    {class} function _GetSUBCMD_SAVE_PARAMETER: Byte; cdecl;
    {class} function _GetSUBCMD_SAVE_STORED_TAG: Byte; cdecl;
    {class} function _GetSUBCMD_SOFT_RESET: Byte; cdecl;
    {class} function _GetSUBCMD_START_DECODE: Byte; cdecl;
    {class} function _GetSUBCMD_STOP_OPERATION: Byte; cdecl;
    {class} function _GetSUBCMD_WRITE_MEMORY: Byte; cdecl;
    {class} function _GetSUBDEBUG_BLE_VER: Byte; cdecl;
    {class} function _GetSUBDEBUG_MODE: Byte; cdecl;
    {class} function _GetSUBDEBUG_MSG: Byte; cdecl;
    {class} function _GetSUBERROR_ERROR: Byte; cdecl;
    {class} function _GetmMutex: JSemaphore; cdecl;
    {class} function init(P1: JDevice; P2: JProtocolRfidEventListener): JProtocolRfBlaster; cdecl;
    {class} property PARAM_ACCESS_PASSWORD: Byte read _GetPARAM_ACCESS_PASSWORD;
    {class} property PARAM_ACT_READ_LEN: Byte read _GetPARAM_ACT_READ_LEN;
    {class} property PARAM_ALGORITHM: Byte read _GetPARAM_ALGORITHM;
    {class} property PARAM_AUTO_OFF_TIME: Byte read _GetPARAM_AUTO_OFF_TIME;
    {class} property PARAM_BARCODE_PARAM: Byte read _GetPARAM_BARCODE_PARAM;
    {class} property PARAM_BARCODE_POWER: Byte read _GetPARAM_BARCODE_POWER;
    {class} property PARAM_BARCODE_REVISION: Byte read _GetPARAM_BARCODE_REVISION;
    {class} property PARAM_BARCODE_STATUS: Byte read _GetPARAM_BARCODE_STATUS;
    {class} property PARAM_BATTERY_STATUS: Byte read _GetPARAM_BATTERY_STATUS;
    {class} property PARAM_BUZZER: Byte read _GetPARAM_BUZZER;
    {class} property PARAM_CARRIER_WAVE_DELAY: Byte read _GetPARAM_CARRIER_WAVE_DELAY;
    {class} property PARAM_CONTINUOUS_MODE: Byte read _GetPARAM_CONTINUOUS_MODE;
    {class} property PARAM_CURRENT_PROFILE: Byte read _GetPARAM_CURRENT_PROFILE;
    {class} property PARAM_DEFAULT_PROFILE: Byte read _GetPARAM_DEFAULT_PROFILE;
    {class} property PARAM_EPC_MASK: Byte read _GetPARAM_EPC_MASK;
    {class} property PARAM_EPC_MASK_DATA: Byte read _GetPARAM_EPC_MASK_DATA;
    {class} property PARAM_EPC_MASK_MODE: Byte read _GetPARAM_EPC_MASK_MODE;
    {class} property PARAM_FIRMWARE_VERSION: Byte read _GetPARAM_FIRMWARE_VERSION;
    {class} property PARAM_IDLE_TIME: Byte read _GetPARAM_IDLE_TIME;
    {class} property PARAM_INVENTORY_SESSION: Byte read _GetPARAM_INVENTORY_SESSION;
    {class} property PARAM_INVENTORY_TIME: Byte read _GetPARAM_INVENTORY_TIME;
    {class} property PARAM_KEY_ACTION: Byte read _GetPARAM_KEY_ACTION;
    {class} property PARAM_LBT: Byte read _GetPARAM_LBT;
    {class} property PARAM_LBT_FREQUENCY: Byte read _GetPARAM_LBT_FREQUENCY;
    {class} property PARAM_LBT_MASK: Byte read _GetPARAM_LBT_MASK;
    {class} property PARAM_LIMIT_TAG_COUNT: Byte read _GetPARAM_LIMIT_TAG_COUNT;
    {class} property PARAM_MASK: Byte read _GetPARAM_MASK;
    {class} property PARAM_MASK_ACTION: Byte read _GetPARAM_MASK_ACTION;
    {class} property PARAM_MASK_BANK: Byte read _GetPARAM_MASK_BANK;
    {class} property PARAM_MASK_OFFSET: Byte read _GetPARAM_MASK_OFFSET;
    {class} property PARAM_MASK_TARGET: Byte read _GetPARAM_MASK_TARGET;
    {class} property PARAM_MASK_TRUNC: Byte read _GetPARAM_MASK_TRUNC;
    {class} property PARAM_MASK_USED: Byte read _GetPARAM_MASK_USED;
    {class} property PARAM_MAX_Q: Byte read _GetPARAM_MAX_Q;
    {class} property PARAM_MIN_Q: Byte read _GetPARAM_MIN_Q;
    {class} property PARAM_OPERATION_MODE: Byte read _GetPARAM_OPERATION_MODE;
    {class} property PARAM_OPERATION_TIME: Byte read _GetPARAM_OPERATION_TIME;
    {class} property PARAM_POWER_GAIN: Byte read _GetPARAM_POWER_GAIN;
    {class} property PARAM_POWER_GAIN_RANGE: Byte read _GetPARAM_POWER_GAIN_RANGE;
    {class} property PARAM_REGION: Byte read _GetPARAM_REGION;
    {class} property PARAM_REGISTER: Byte read _GetPARAM_REGISTER;
    {class} property PARAM_REMOTE_MODE: Byte read _GetPARAM_REMOTE_MODE;
    {class} property PARAM_REPORT_MODE: Byte read _GetPARAM_REPORT_MODE;
    {class} property PARAM_REPORT_RSSI: Byte read _GetPARAM_REPORT_RSSI;
    {class} property PARAM_SAME_TAG_REPORT_TIME: Byte read _GetPARAM_SAME_TAG_REPORT_TIME;
    {class} property PARAM_SERIAL_NUMBER: Byte read _GetPARAM_SERIAL_NUMBER;
    {class} property PARAM_SESSION_FLAG: Byte read _GetPARAM_SESSION_FLAG;
    {class} property PARAM_STORED_MODE: Byte read _GetPARAM_STORED_MODE;
    {class} property PARAM_STORED_TAG_COUNT: Byte read _GetPARAM_STORED_TAG_COUNT;
    {class} property PARAM_TAG_DATA_TYPE: Byte read _GetPARAM_TAG_DATA_TYPE;
    {class} property PARAM_TIME: Byte read _GetPARAM_TIME;
    {class} property PARAM_USE_SELECTION_MASK: Byte read _GetPARAM_USE_SELECTION_MASK;
    {class} property SCANNER_ONKEYDOWN: TJavaArray<Byte> read _GetSCANNER_ONKEYDOWN;
    {class} property SCANNER_ONKEYUP: TJavaArray<Byte> read _GetSCANNER_ONKEYUP;
    {class} property SUBCMD_BLOCK_ERASE: Byte read _GetSUBCMD_BLOCK_ERASE;
    {class} property SUBCMD_BLOCK_WRITE: Byte read _GetSUBCMD_BLOCK_WRITE;
    {class} property SUBCMD_DECODE_START: Byte read _GetSUBCMD_DECODE_START;
    {class} property SUBCMD_DEFAULT_PARAMETER: Byte read _GetSUBCMD_DEFAULT_PARAMETER;
    {class} property SUBCMD_ENTER_BARCODE_BYPADD_MODE: Byte read _GetSUBCMD_ENTER_BARCODE_BYPADD_MODE;
    {class} property SUBCMD_ENTER_BYPASS_MODE: Byte read _GetSUBCMD_ENTER_BYPASS_MODE;
    {class} property SUBCMD_HARD_RESET: Byte read _GetSUBCMD_HARD_RESET;
    {class} property SUBCMD_INVENTORY: Byte read _GetSUBCMD_INVENTORY;
    {class} property SUBCMD_KILL: Byte read _GetSUBCMD_KILL;
    {class} property SUBCMD_LEAVE_BYPASS_MODE: Byte read _GetSUBCMD_LEAVE_BYPASS_MODE;
    {class} property SUBCMD_LOAD_STORED_TAG: Byte read _GetSUBCMD_LOAD_STORED_TAG;
    {class} property SUBCMD_LOCK: Byte read _GetSUBCMD_LOCK;
    {class} property SUBCMD_PERMA_LOCK: Byte read _GetSUBCMD_PERMA_LOCK;
    {class} property SUBCMD_READ_MEMORY: Byte read _GetSUBCMD_READ_MEMORY;
    {class} property SUBCMD_REMOVE_ALL_STORED_TAG: Byte read _GetSUBCMD_REMOVE_ALL_STORED_TAG;
    {class} property SUBCMD_SAVE_PARAMETER: Byte read _GetSUBCMD_SAVE_PARAMETER;
    {class} property SUBCMD_SAVE_STORED_TAG: Byte read _GetSUBCMD_SAVE_STORED_TAG;
    {class} property SUBCMD_SOFT_RESET: Byte read _GetSUBCMD_SOFT_RESET;
    {class} property SUBCMD_START_DECODE: Byte read _GetSUBCMD_START_DECODE;
    {class} property SUBCMD_STOP_OPERATION: Byte read _GetSUBCMD_STOP_OPERATION;
    {class} property SUBCMD_WRITE_MEMORY: Byte read _GetSUBCMD_WRITE_MEMORY;
    {class} property SUBDEBUG_BLE_VER: Byte read _GetSUBDEBUG_BLE_VER;
    {class} property SUBDEBUG_MODE: Byte read _GetSUBDEBUG_MODE;
    {class} property SUBDEBUG_MSG: Byte read _GetSUBDEBUG_MSG;
    {class} property SUBERROR_ERROR: Byte read _GetSUBERROR_ERROR;
    {class} property mMutex: JSemaphore read _GetmMutex;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/protocol/ProtocolRfBlaster')]
  JProtocolRfBlaster = interface(JObject)
    ['{AB9ADB2E-7183-41EB-AA64-33FE03E2BD43}']
    function _GetmBarcodeKeyAction: Boolean; cdecl;
    procedure _SetmBarcodeKeyAction(Value: Boolean); cdecl;
    procedure barcodeKeyActionSetting(P1: Boolean); cdecl;
    function command(P1: Byte): Jtype_ResultCode; cdecl; overload;
    function command(P1: Byte; P2: TJavaArray<Byte>): Jtype_ResultCode; cdecl; overload;
    function commandAsync(P1: Byte): Jtype_ResultCode; cdecl; overload;
    function commandAsync(P1: Byte; P2: TJavaArray<Byte>): Jtype_ResultCode; cdecl; overload;
    function commandSync(P1: Byte): JResultDataValue; cdecl; overload;
    function commandSync(P1: Byte; P2: TJavaArray<Byte>): JResultDataValue; cdecl; overload;
    function debugAsync(P1: Byte): Jtype_ResultCode; cdecl; overload;
    function debugAsync(P1: Byte; P2: TJavaArray<Byte>): Jtype_ResultCode; cdecl; overload;
    function debugSync(P1: Byte): JResultDataValue; cdecl; overload;
    function debugSync(P1: Byte; P2: TJavaArray<Byte>): JResultDataValue; cdecl; overload;
    function getCharset: JCharset; cdecl;
    function getLastCommandType: JCommandType; cdecl;
    function getParameter(P1: Byte): JResultDataValue; cdecl; overload;
    function getParameter(P1: Byte; P2: TJavaArray<Byte>): JResultDataValue; cdecl; overload;
    function getTimeout: Integer; cdecl;
    function isBarcodeMode: Boolean; cdecl;
    function postSsiPacket(P1: JSSICommand): Boolean; cdecl; overload;
    function postSsiPacket(P1: JSSICommand; P2: TJavaArray<Byte>): Boolean; cdecl; overload;
    function sendBarcodeWakeup: Boolean; cdecl;
    function sendSsiPacket(P1: JSSICommand): JResultBytesValue; cdecl; overload;
    function sendSsiPacket(P1: JSSICommand; P2: TJavaArray<Byte>): JResultBytesValue; cdecl; overload;
    procedure setBarcodeMode(P1: Boolean); cdecl;
    function setCharset(P1: JCharset): Boolean; cdecl;
    function setDebugParameter(P1: Byte; P2: TJavaArray<Byte>): Jtype_ResultCode; cdecl;
    function setParameter(P1: Byte): Jtype_ResultCode; cdecl; overload;
    function setParameter(P1: Byte; P2: TJavaArray<Byte>): Jtype_ResultCode; cdecl; overload;
    procedure setRssiMode(P1: Boolean); cdecl;
    procedure setTagDataType(P1: JTagDataType); cdecl;
    procedure setTimeout(P1: Integer); cdecl;
    procedure setUseControl(P1: Boolean); cdecl;
    procedure start; cdecl;
    procedure stop; cdecl;
    property mBarcodeKeyAction: Boolean read _GetmBarcodeKeyAction write _SetmBarcodeKeyAction;
  end;
  TJProtocolRfBlaster = class(TJavaGenericImport<JProtocolRfBlasterClass, JProtocolRfBlaster>) end;

  JProtocolRfBlaster_PacketClass = interface(JObjectClass)
    ['{87A1F077-40FC-41B1-936A-35352ED5B98B}']
    {class} function init(P1: JProtocolRfBlaster): JProtocolRfBlaster_Packet; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/protocol/ProtocolRfBlaster$Packet')]
  JProtocolRfBlaster_Packet = interface(JObject)
    ['{43D639A7-1B5B-462E-98BC-74931BB46B38}']
    function getData: TJavaArray<Byte>; cdecl;
    function isTimeout: Boolean; cdecl;
    function isWaitPacket: Boolean; cdecl;
    procedure setCommand(P1: JSSICommand); cdecl; overload;
    procedure setCommand(P1: Byte; P2: Byte); cdecl; overload;
    function setResponse(P1: Byte; P2: TJavaArray<Byte>): Boolean; cdecl; overload;
    function setResponse(P1: Byte; P2: Byte; P3: TJavaArray<Byte>; P4: Integer; P5: Integer): Boolean; cdecl; overload;
    procedure setTimeout; cdecl;
    procedure waitResponse; cdecl;
  end;
  TJProtocolRfBlaster_Packet = class(TJavaGenericImport<JProtocolRfBlaster_PacketClass, JProtocolRfBlaster_Packet>) end;

  JProtocolRfBlaster_ReceiveThreadClass = interface(JThreadClass)
    ['{5B9CE648-E60E-49C5-88D0-CE3FF837E8A4}']
    {class} function init(P1: JProtocolRfBlaster; P2: JInputStream): JProtocolRfBlaster_ReceiveThread; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/protocol/ProtocolRfBlaster$ReceiveThread')]
  JProtocolRfBlaster_ReceiveThread = interface(JThread)
    ['{451199B0-C74B-4ED0-B0B8-4F8B9041053B}']
    procedure cancel; cdecl;
    procedure clear; cdecl;
    procedure run; cdecl;
  end;
  TJProtocolRfBlaster_ReceiveThread = class(TJavaGenericImport<JProtocolRfBlaster_ReceiveThreadClass, JProtocolRfBlaster_ReceiveThread>) end;

  JProtocolRfBlaster_WatcherClass = interface(JThreadClass)
    ['{9A0FF56A-5A92-43E1-B149-351F2416D4ED}']
    {class} function init(P1: JProtocolRfBlaster): JProtocolRfBlaster_Watcher; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/protocol/ProtocolRfBlaster$Watcher')]
  JProtocolRfBlaster_Watcher = interface(JThread)
    ['{341542B9-7FFE-4D41-BFBD-532630D9A2E3}']
    procedure cancel; cdecl;
    procedure run; cdecl;
  end;
  TJProtocolRfBlaster_Watcher = class(TJavaGenericImport<JProtocolRfBlaster_WatcherClass, JProtocolRfBlaster_Watcher>) end;

  JActionStateClass = interface(JEnumClass)
    ['{BF3DBE24-A6E6-4239-9913-B427EF3BC084}']
    {class} function _GetBlockErase: JActionState; cdecl;
    {class} function _GetBlockWrite: JActionState; cdecl;
    {class} function _GetInventory: JActionState; cdecl;
    {class} function _GetKill: JActionState; cdecl;
    {class} function _GetLock: JActionState; cdecl;
    {class} function _GetPermaLock: JActionState; cdecl;
    {class} function _GetReadMemory: JActionState; cdecl;
    {class} function _GetStartDecode: JActionState; cdecl;
    {class} function _GetStop: JActionState; cdecl;
    {class} function _GetUnlock: JActionState; cdecl;
    {class} function _GetWriteMemory: JActionState; cdecl;
    {class} function valueOf(P1: JString): JActionState; cdecl; overload;
    {class} function valueOf(P1: Integer): JActionState; cdecl; overload;
    {class} function values: TJavaObjectArray<JActionState>; cdecl;
    {class} property BlockErase: JActionState read _GetBlockErase;
    {class} property BlockWrite: JActionState read _GetBlockWrite;
    {class} property Inventory: JActionState read _GetInventory;
    {class} property Kill: JActionState read _GetKill;
    {class} property Lock: JActionState read _GetLock;
    {class} property PermaLock: JActionState read _GetPermaLock;
    {class} property ReadMemory: JActionState read _GetReadMemory;
    {class} property StartDecode: JActionState read _GetStartDecode;
    {class} property Stop: JActionState read _GetStop;
    {class} property Unlock: JActionState read _GetUnlock;
    {class} property WriteMemory: JActionState read _GetWriteMemory;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/type/ActionState')]
  JActionState = interface(JEnum)
    ['{6BFE1ECE-F7A4-4A95-B723-2AEC89E84262}']
    function getCode: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJActionState = class(TJavaGenericImport<JActionStateClass, JActionState>) end;

  JAlgorithmTypeClass = interface(JEnumClass)
    ['{DA9DC7AB-2D31-4B81-8192-8E52742B1093}']
    {class} function _GetDynamicQ: JAlgorithmType; cdecl;
    {class} function _GetFixedQ: JAlgorithmType; cdecl;
    {class} function valueOf(P1: JString): JAlgorithmType; cdecl; overload;
    {class} function valueOf(P1: Integer): JAlgorithmType; cdecl; overload;
    {class} function values: TJavaObjectArray<JAlgorithmType>; cdecl;
    {class} property DynamicQ: JAlgorithmType read _GetDynamicQ;
    {class} property FixedQ: JAlgorithmType read _GetFixedQ;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/type/AlgorithmType')]
  JAlgorithmType = interface(JEnum)
    ['{08EAB453-9DE3-49F2-8E9B-CDF40B13B3A5}']
    function getValue: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJAlgorithmType = class(TJavaGenericImport<JAlgorithmTypeClass, JAlgorithmType>) end;

  JBatteryStatusTypeClass = interface(JEnumClass)
    ['{50FFEAD1-D145-4B7E-8274-8DADD52DA975}']
    {class} function _GetEmpty: JBatteryStatusType; cdecl;
    {class} function _GetFull: JBatteryStatusType; cdecl;
    {class} function _GetP10: JBatteryStatusType; cdecl;
    {class} function _GetP20: JBatteryStatusType; cdecl;
    {class} function _GetP30: JBatteryStatusType; cdecl;
    {class} function _GetP40: JBatteryStatusType; cdecl;
    {class} function _GetP50: JBatteryStatusType; cdecl;
    {class} function _GetP60: JBatteryStatusType; cdecl;
    {class} function _GetP70: JBatteryStatusType; cdecl;
    {class} function _GetP80: JBatteryStatusType; cdecl;
    {class} function _GetP90: JBatteryStatusType; cdecl;
    {class} function valueOf(P1: JString): JBatteryStatusType; cdecl; overload;
    {class} function valueOf(P1: Integer): JBatteryStatusType; cdecl; overload;
    {class} function values: TJavaObjectArray<JBatteryStatusType>; cdecl;
    {class} property Empty: JBatteryStatusType read _GetEmpty;
    {class} property Full: JBatteryStatusType read _GetFull;
    {class} property P10: JBatteryStatusType read _GetP10;
    {class} property P20: JBatteryStatusType read _GetP20;
    {class} property P30: JBatteryStatusType read _GetP30;
    {class} property P40: JBatteryStatusType read _GetP40;
    {class} property P50: JBatteryStatusType read _GetP50;
    {class} property P60: JBatteryStatusType read _GetP60;
    {class} property P70: JBatteryStatusType read _GetP70;
    {class} property P80: JBatteryStatusType read _GetP80;
    {class} property P90: JBatteryStatusType read _GetP90;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/type/BatteryStatusType')]
  JBatteryStatusType = interface(JEnum)
    ['{D4B358F1-4AC6-4ACD-BA53-9326A72CCE15}']
    function getValue: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJBatteryStatusType = class(TJavaGenericImport<JBatteryStatusTypeClass, JBatteryStatusType>) end;

  JBuzzerStateClass = interface(JEnumClass)
    ['{306B7B93-CCFE-45B4-B131-5E4FD8840B5B}']
    {class} function _GetHigh: JBuzzerState; cdecl;
    {class} function _GetLow: JBuzzerState; cdecl;
    {class} function _GetOff: JBuzzerState; cdecl;
    {class} function valueOf(P1: JString): JBuzzerState; cdecl; overload;
    {class} function valueOf(P1: Integer): JBuzzerState; cdecl; overload;
    {class} function values: TJavaObjectArray<JBuzzerState>; cdecl;
    {class} property High: JBuzzerState read _GetHigh;
    {class} property Low: JBuzzerState read _GetLow;
    {class} property Off: JBuzzerState read _GetOff;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/type/BuzzerState')]
  JBuzzerState = interface(JEnum)
    ['{B450F79C-8EF2-4C4F-9FC7-C5C8CB9F8522}']
    function getCode: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJBuzzerState = class(TJavaGenericImport<JBuzzerStateClass, JBuzzerState>) end;

  JCommandTypeClass = interface(JEnumClass)
    ['{6F35684D-53B9-47D3-913D-38167689729C}']
    {class} function _GetDebug: JCommandType; cdecl;
    {class} function _GetDebugMode: JCommandType; cdecl;
    {class} function _GetDefaultParameter: JCommandType; cdecl;
    {class} function _GetEnterBarcode: JCommandType; cdecl;
    {class} function _GetEnterBypass: JCommandType; cdecl;
    {class} function _GetGetProperty: JCommandType; cdecl;
    {class} function _GetHardReset: JCommandType; cdecl;
    {class} function _GetLeaveBypass: JCommandType; cdecl;
    {class} function _GetLoadStoredTag: JCommandType; cdecl;
    {class} function _GetNone: JCommandType; cdecl;
    {class} function _GetOperation: JCommandType; cdecl;
    {class} function _GetRemoveAllStoredTag: JCommandType; cdecl;
    {class} function _GetSaveParemeter: JCommandType; cdecl;
    {class} function _GetSaveStoredTag: JCommandType; cdecl;
    {class} function _GetSetProperty: JCommandType; cdecl;
    {class} function _GetSoftReset: JCommandType; cdecl;
    {class} function valueOf(P1: JString): JCommandType; cdecl; overload;
    {class} function valueOf(P1: Integer): JCommandType; cdecl; overload;
    {class} function values: TJavaObjectArray<JCommandType>; cdecl;
    {class} property Debug: JCommandType read _GetDebug;
    {class} property DebugMode: JCommandType read _GetDebugMode;
    {class} property DefaultParameter: JCommandType read _GetDefaultParameter;
    {class} property EnterBarcode: JCommandType read _GetEnterBarcode;
    {class} property EnterBypass: JCommandType read _GetEnterBypass;
    {class} property GetProperty: JCommandType read _GetGetProperty;
    {class} property HardReset: JCommandType read _GetHardReset;
    {class} property LeaveBypass: JCommandType read _GetLeaveBypass;
    {class} property LoadStoredTag: JCommandType read _GetLoadStoredTag;
    {class} property None: JCommandType read _GetNone;
    {class} property Operation: JCommandType read _GetOperation;
    {class} property RemoveAllStoredTag: JCommandType read _GetRemoveAllStoredTag;
    {class} property SaveParemeter: JCommandType read _GetSaveParemeter;
    {class} property SaveStoredTag: JCommandType read _GetSaveStoredTag;
    {class} property SetProperty: JCommandType read _GetSetProperty;
    {class} property SoftReset: JCommandType read _GetSoftReset;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/type/CommandType')]
  JCommandType = interface(JEnum)
    ['{7CD440F5-138E-4752-BC82-190383DF8912}']
    function getCode: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJCommandType = class(TJavaGenericImport<JCommandTypeClass, JCommandType>) end;

  JLbtItemClass = interface(JObjectClass)
    ['{1E0F7EC5-D5D2-4DB4-BD97-C170A29AD967}']
    {class} function getSlot: Integer; cdecl;
    {class} function init: JLbtItem; cdecl; overload;
    {class} function init(P1: Integer; P2: Boolean): JLbtItem; cdecl; overload;
    {class} function isUsed: Boolean; cdecl;
    {class} procedure setUsed(P1: Boolean); cdecl;
    {class} function toString: JString; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/type/LbtItem')]
  JLbtItem = interface(JObject)
    ['{C902D78D-D075-4670-AE33-9DDA88CE118A}']
  end;
  TJLbtItem = class(TJavaGenericImport<JLbtItemClass, JLbtItem>) end;

  JLockStateClass = interface(JEnumClass)
    ['{3C965773-F913-45FB-9CD6-BE32FE8F5310}']
    {class} function _GetLock: JLockState; cdecl;
    {class} function _GetNoChange: JLockState; cdecl;
    {class} function _GetPermaLock: JLockState; cdecl;
    {class} function _GetUnlock: JLockState; cdecl;
    {class} function valueOf(P1: JString): JLockState; cdecl; overload;
    {class} function valueOf(P1: Integer): JLockState; cdecl; overload;
    {class} function values: TJavaObjectArray<JLockState>; cdecl;
    {class} property Lock: JLockState read _GetLock;
    {class} property NoChange: JLockState read _GetNoChange;
    {class} property PermaLock: JLockState read _GetPermaLock;
    {class} property Unlock: JLockState read _GetUnlock;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/type/LockState')]
  JLockState = interface(JEnum)
    ['{85932707-D074-4584-A262-62D6A1424028}']
    function getAction: Integer; cdecl;
    function getActionLock: Integer; cdecl;
    function getActionPermaLock: Integer; cdecl;
    function getMask: Integer; cdecl;
    function getMaskLock: Integer; cdecl;
    function getMaskPermaLock: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJLockState = class(TJavaGenericImport<JLockStateClass, JLockState>) end;

  JMaskActionTypeClass = interface(JEnumClass)
    ['{71965423-47C3-4BBA-B438-7BF4823B90D4}']
    {class} function _GetAB: JMaskActionType; cdecl;
    {class} function _GetAN: JMaskActionType; cdecl;
    {class} function _GetBA: JMaskActionType; cdecl;
    {class} function _GetBN: JMaskActionType; cdecl;
    {class} function _GetMN: JMaskActionType; cdecl;
    {class} function _GetNA: JMaskActionType; cdecl;
    {class} function _GetNB: JMaskActionType; cdecl;
    {class} function _GetNM: JMaskActionType; cdecl;
    {class} function valueOf(P1: JString): JMaskActionType; cdecl; overload;
    {class} function valueOf(P1: Integer): JMaskActionType; cdecl; overload;
    {class} function values: TJavaObjectArray<JMaskActionType>; cdecl;
    {class} property AB: JMaskActionType read _GetAB;
    {class} property AN: JMaskActionType read _GetAN;
    {class} property BA: JMaskActionType read _GetBA;
    {class} property BN: JMaskActionType read _GetBN;
    {class} property MN: JMaskActionType read _GetMN;
    {class} property NA: JMaskActionType read _GetNA;
    {class} property NB: JMaskActionType read _GetNB;
    {class} property NM: JMaskActionType read _GetNM;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/type/MaskActionType')]
  JMaskActionType = interface(JEnum)
    ['{71B963B1-E032-4136-8E02-C35861DB226C}']
    function getValue: Integer; cdecl;
    function toString(P1: JMaskTargetType): JString; cdecl;
  end;
  TJMaskActionType = class(TJavaGenericImport<JMaskActionTypeClass, JMaskActionType>) end;

  JMaskTargetTypeClass = interface(JEnumClass)
    ['{1123E8A7-9908-4DA8-81A0-079B7224D245}']
    {class} function _GetS0: JMaskTargetType; cdecl;
    {class} function _GetS1: JMaskTargetType; cdecl;
    {class} function _GetS2: JMaskTargetType; cdecl;
    {class} function _GetS3: JMaskTargetType; cdecl;
    {class} function _GetSL: JMaskTargetType; cdecl;
    {class} function valueOf(P1: JString): JMaskTargetType; cdecl; overload;
    {class} function valueOf(P1: Integer): JMaskTargetType; cdecl; overload;
    {class} function values: TJavaObjectArray<JMaskTargetType>; cdecl;
    {class} property S0: JMaskTargetType read _GetS0;
    {class} property S1: JMaskTargetType read _GetS1;
    {class} property S2: JMaskTargetType read _GetS2;
    {class} property S3: JMaskTargetType read _GetS3;
    {class} property SL: JMaskTargetType read _GetSL;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/type/MaskTargetType')]
  JMaskTargetType = interface(JEnum)
    ['{61834A62-005F-4AE2-BFBA-DC8E55325AF0}']
    function getValue: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJMaskTargetType = class(TJavaGenericImport<JMaskTargetTypeClass, JMaskTargetType>) end;

  JMemoryBankClass = interface(JEnumClass)
    ['{F65633FB-BF40-4C54-AE17-0590921707C1}']
    {class} function _GetEPC: JMemoryBank; cdecl;
    {class} function _GetReserved: JMemoryBank; cdecl;
    {class} function _GetTID: JMemoryBank; cdecl;
    {class} function _GetUser: JMemoryBank; cdecl;
    {class} function valueOf(P1: JString): JMemoryBank; cdecl; overload;
    {class} function valueOf(P1: Integer): JMemoryBank; cdecl; overload;
    {class} function values: TJavaObjectArray<JMemoryBank>; cdecl;
    {class} property EPC: JMemoryBank read _GetEPC;
    {class} property Reserved: JMemoryBank read _GetReserved;
    {class} property TID: JMemoryBank read _GetTID;
    {class} property User: JMemoryBank read _GetUser;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/type/MemoryBank')]
  JMemoryBank = interface(JEnum)
    ['{D1D7A529-FD19-4AE9-A198-637FF370F2FA}']
    function getValue: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJMemoryBank = class(TJavaGenericImport<JMemoryBankClass, JMemoryBank>) end;

  JOperationModeClass = interface(JEnumClass)
    ['{34FBC73F-5CAB-4608-A356-A286CACBDE6A}']
    {class} function _GetBarcode: JOperationMode; cdecl;
    {class} function _GetNormal: JOperationMode; cdecl;
    {class} function _GetTID: JOperationMode; cdecl;
    {class} function valueOf(P1: JString): JOperationMode; cdecl; overload;
    {class} function valueOf(P1: Integer): JOperationMode; cdecl; overload;
    {class} function values: TJavaObjectArray<JOperationMode>; cdecl;
    {class} property Barcode: JOperationMode read _GetBarcode;
    {class} property Normal: JOperationMode read _GetNormal;
    {class} property TID: JOperationMode read _GetTID;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/type/OperationMode')]
  JOperationMode = interface(JEnum)
    ['{1B037DF8-46EB-4F12-BB5F-CA1B13F919F4}']
    function getValue: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJOperationMode = class(TJavaGenericImport<JOperationModeClass, JOperationMode>) end;

  JRemoteKeyStateClass = interface(JEnumClass)
    ['{BCC57963-5FF5-4E94-A246-48193D3EBF96}']
    {class} function _GetKeyDown: JRemoteKeyState; cdecl;
    {class} function _GetKeyUp: JRemoteKeyState; cdecl;
    {class} function valueOf(P1: JString): JRemoteKeyState; cdecl; overload;
    {class} function valueOf(P1: Integer): JRemoteKeyState; cdecl; overload;
    {class} function values: TJavaObjectArray<JRemoteKeyState>; cdecl;
    {class} property KeyDown: JRemoteKeyState read _GetKeyDown;
    {class} property KeyUp: JRemoteKeyState read _GetKeyUp;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/type/RemoteKeyState')]
  JRemoteKeyState = interface(JEnum)
    ['{2473C552-650B-4C78-9436-884FE6DE6777}']
    function getState: Integer; cdecl;
  end;
  TJRemoteKeyState = class(TJavaGenericImport<JRemoteKeyStateClass, JRemoteKeyState>) end;

  Jtype_ResultCodeClass = interface(JEnumClass)
    ['{B05062B4-1AF8-4C39-8DAB-099B6232BBF5}']
    {class} function _GetBusy: Jtype_ResultCode; cdecl;
    {class} function _GetCRCError: Jtype_ResultCode; cdecl;
    {class} function _GetCommandFormatError: Jtype_ResultCode; cdecl;
    {class} function _GetHandleMismatch: Jtype_ResultCode; cdecl;
    {class} function _GetInOperation: Jtype_ResultCode; cdecl;
    {class} function _GetInsufficientPower: Jtype_ResultCode; cdecl;
    {class} function _GetInvalidCommand: Jtype_ResultCode; cdecl;
    {class} function _GetInvalidParameter: Jtype_ResultCode; cdecl;
    {class} function _GetInvalidPassword: Jtype_ResultCode; cdecl;
    {class} function _GetInvalidResponse: Jtype_ResultCode; cdecl;
    {class} function _GetLowBattery: Jtype_ResultCode; cdecl;
    {class} function _GetMemoryLocked: Jtype_ResultCode; cdecl;
    {class} function _GetMemoryOverrun: Jtype_ResultCode; cdecl;
    {class} function _GetNoError: Jtype_ResultCode; cdecl;
    {class} function _GetNoTagReply: Jtype_ResultCode; cdecl;
    {class} function _GetNonSpecificError: Jtype_ResultCode; cdecl;
    {class} function _GetNotConnected: Jtype_ResultCode; cdecl;
    {class} function _GetNotSupportFirmware: Jtype_ResultCode; cdecl;
    {class} function _GetOperationFailed: Jtype_ResultCode; cdecl;
    {class} function _GetOtherError: Jtype_ResultCode; cdecl;
    {class} function _GetOutOfRange: Jtype_ResultCode; cdecl;
    {class} function _GetOutOfRetries: Jtype_ResultCode; cdecl;
    {class} function _GetParamError: Jtype_ResultCode; cdecl;
    {class} function _GetReadCountInvalid: Jtype_ResultCode; cdecl;
    {class} function _GetTagLost: Jtype_ResultCode; cdecl;
    {class} function _GetTimeout: Jtype_ResultCode; cdecl;
    {class} function _GetUndefined: Jtype_ResultCode; cdecl;
    {class} function _GetZeroKillPassword: Jtype_ResultCode; cdecl;
    {class} function valueOf(P1: JString): Jtype_ResultCode; cdecl; overload;
    {class} function valueOf(P1: Integer): Jtype_ResultCode; cdecl; overload;
    {class} function values: TJavaObjectArray<Jtype_ResultCode>; cdecl;
    {class} property Busy: Jtype_ResultCode read _GetBusy;
    {class} property CRCError: Jtype_ResultCode read _GetCRCError;
    {class} property CommandFormatError: Jtype_ResultCode read _GetCommandFormatError;
    {class} property HandleMismatch: Jtype_ResultCode read _GetHandleMismatch;
    {class} property InOperation: Jtype_ResultCode read _GetInOperation;
    {class} property InsufficientPower: Jtype_ResultCode read _GetInsufficientPower;
    {class} property InvalidCommand: Jtype_ResultCode read _GetInvalidCommand;
    {class} property InvalidParameter: Jtype_ResultCode read _GetInvalidParameter;
    {class} property InvalidPassword: Jtype_ResultCode read _GetInvalidPassword;
    {class} property InvalidResponse: Jtype_ResultCode read _GetInvalidResponse;
    {class} property LowBattery: Jtype_ResultCode read _GetLowBattery;
    {class} property MemoryLocked: Jtype_ResultCode read _GetMemoryLocked;
    {class} property MemoryOverrun: Jtype_ResultCode read _GetMemoryOverrun;
    {class} property NoError: Jtype_ResultCode read _GetNoError;
    {class} property NoTagReply: Jtype_ResultCode read _GetNoTagReply;
    {class} property NonSpecificError: Jtype_ResultCode read _GetNonSpecificError;
    {class} property NotConnected: Jtype_ResultCode read _GetNotConnected;
    {class} property NotSupportFirmware: Jtype_ResultCode read _GetNotSupportFirmware;
    {class} property OperationFailed: Jtype_ResultCode read _GetOperationFailed;
    {class} property OtherError: Jtype_ResultCode read _GetOtherError;
    {class} property OutOfRange: Jtype_ResultCode read _GetOutOfRange;
    {class} property OutOfRetries: Jtype_ResultCode read _GetOutOfRetries;
    {class} property ParamError: Jtype_ResultCode read _GetParamError;
    {class} property ReadCountInvalid: Jtype_ResultCode read _GetReadCountInvalid;
    {class} property TagLost: Jtype_ResultCode read _GetTagLost;
    {class} property Timeout: Jtype_ResultCode read _GetTimeout;
    {class} property Undefined: Jtype_ResultCode read _GetUndefined;
    {class} property ZeroKillPassword: Jtype_ResultCode read _GetZeroKillPassword;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/type/ResultCode')]
  Jtype_ResultCode = interface(JEnum)
    ['{FA894EB0-9B10-4916-B055-5FCF59F3F554}']
    function getCode: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJtype_ResultCode = class(TJavaGenericImport<Jtype_ResultCodeClass, Jtype_ResultCode>) end;

  JSelectFlagClass = interface(JEnumClass)
    ['{634A568C-2471-44B6-99D7-A2CE885AE961}']
    {class} function _GetAll: JSelectFlag; cdecl;
    {class} function _GetNotSL: JSelectFlag; cdecl;
    {class} function _GetNotUsed: JSelectFlag; cdecl;
    {class} function _GetSL: JSelectFlag; cdecl;
    {class} function valueOf(P1: JString): JSelectFlag; cdecl; overload;
    {class} function valueOf(P1: Integer): JSelectFlag; cdecl; overload;
    {class} function values: TJavaObjectArray<JSelectFlag>; cdecl;
    {class} property All: JSelectFlag read _GetAll;
    {class} property NotSL: JSelectFlag read _GetNotSL;
    {class} property NotUsed: JSelectFlag read _GetNotUsed;
    {class} property SL: JSelectFlag read _GetSL;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/type/SelectFlag')]
  JSelectFlag = interface(JEnum)
    ['{CF3083E2-1800-46F3-AF85-104ADCA6444D}']
    function getValue: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJSelectFlag = class(TJavaGenericImport<JSelectFlagClass, JSelectFlag>) end;

  JSessionFlagClass = interface(JEnumClass)
    ['{7C71929F-7CDE-4706-B959-5576BB12C61D}']
    {class} function _GetA: JSessionFlag; cdecl;
    {class} function _GetAB: JSessionFlag; cdecl;
    {class} function _GetB: JSessionFlag; cdecl;
    {class} function valueOf(P1: JString): JSessionFlag; cdecl; overload;
    {class} function valueOf(P1: Integer): JSessionFlag; cdecl; overload;
    {class} function values: TJavaObjectArray<JSessionFlag>; cdecl;
    {class} property A: JSessionFlag read _GetA;
    {class} property AB: JSessionFlag read _GetAB;
    {class} property B: JSessionFlag read _GetB;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/type/SessionFlag')]
  JSessionFlag = interface(JEnum)
    ['{9EFBC6CD-890B-4F93-B5DC-4300173954EF}']
    function getValue: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJSessionFlag = class(TJavaGenericImport<JSessionFlagClass, JSessionFlag>) end;

  JSessionTypeClass = interface(JEnumClass)
    ['{71E6AF9F-4543-40F0-908E-59C327CAF350}']
    {class} function _GetS0: JSessionType; cdecl;
    {class} function _GetS1: JSessionType; cdecl;
    {class} function _GetS2: JSessionType; cdecl;
    {class} function _GetS3: JSessionType; cdecl;
    {class} function valueOf(P1: JString): JSessionType; cdecl; overload;
    {class} function valueOf(P1: Integer): JSessionType; cdecl; overload;
    {class} function values: TJavaObjectArray<JSessionType>; cdecl;
    {class} property S0: JSessionType read _GetS0;
    {class} property S1: JSessionType read _GetS1;
    {class} property S2: JSessionType read _GetS2;
    {class} property S3: JSessionType read _GetS3;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/type/SessionType')]
  JSessionType = interface(JEnum)
    ['{FBAADAD1-3418-4884-8560-7C39315A5529}']
    function getValue: Integer; cdecl;
    function toString: JString; cdecl;
  end;
  TJSessionType = class(TJavaGenericImport<JSessionTypeClass, JSessionType>) end;

  JSubCommandTypeClass = interface(JEnumClass)
    ['{769223F6-D646-4D1C-BB93-1DE658798838}']
    {class} function _GetBlockErase: JSubCommandType; cdecl;
    {class} function _GetBlockWrite: JSubCommandType; cdecl;
    {class} function _GetDefaultParameter: JSubCommandType; cdecl;
    {class} function _GetEnterBarcodeBypassMode: JSubCommandType; cdecl;
    {class} function _GetEnterBypassMode: JSubCommandType; cdecl;
    {class} function _GetHardReset: JSubCommandType; cdecl;
    {class} function _GetInventory: JSubCommandType; cdecl;
    {class} function _GetKill: JSubCommandType; cdecl;
    {class} function _GetLeaveBypassMode: JSubCommandType; cdecl;
    {class} function _GetLoadStoredTag: JSubCommandType; cdecl;
    {class} function _GetLockTag: JSubCommandType; cdecl;
    {class} function _GetNone: JSubCommandType; cdecl;
    {class} function _GetPermaLockTag: JSubCommandType; cdecl;
    {class} function _GetReadMemory: JSubCommandType; cdecl;
    {class} function _GetRemoveAllStoredTag: JSubCommandType; cdecl;
    {class} function _GetSaveParameter: JSubCommandType; cdecl;
    {class} function _GetSaveStoredTag: JSubCommandType; cdecl;
    {class} function _GetSoftReset: JSubCommandType; cdecl;
    {class} function _GetStop: JSubCommandType; cdecl;
    {class} function _GetWriteMemory: JSubCommandType; cdecl;
    {class} function valueOf(P1: JString): JSubCommandType; cdecl; overload;
    {class} function valueOf(P1: Char): JSubCommandType; cdecl; overload;
    {class} function values: TJavaObjectArray<JSubCommandType>; cdecl;
    {class} property BlockErase: JSubCommandType read _GetBlockErase;
    {class} property BlockWrite: JSubCommandType read _GetBlockWrite;
    {class} property DefaultParameter: JSubCommandType read _GetDefaultParameter;
    {class} property EnterBarcodeBypassMode: JSubCommandType read _GetEnterBarcodeBypassMode;
    {class} property EnterBypassMode: JSubCommandType read _GetEnterBypassMode;
    {class} property HardReset: JSubCommandType read _GetHardReset;
    {class} property Inventory: JSubCommandType read _GetInventory;
    {class} property Kill: JSubCommandType read _GetKill;
    {class} property LeaveBypassMode: JSubCommandType read _GetLeaveBypassMode;
    {class} property LoadStoredTag: JSubCommandType read _GetLoadStoredTag;
    {class} property LockTag: JSubCommandType read _GetLockTag;
    {class} property None: JSubCommandType read _GetNone;
    {class} property PermaLockTag: JSubCommandType read _GetPermaLockTag;
    {class} property ReadMemory: JSubCommandType read _GetReadMemory;
    {class} property RemoveAllStoredTag: JSubCommandType read _GetRemoveAllStoredTag;
    {class} property SaveParameter: JSubCommandType read _GetSaveParameter;
    {class} property SaveStoredTag: JSubCommandType read _GetSaveStoredTag;
    {class} property SoftReset: JSubCommandType read _GetSoftReset;
    {class} property Stop: JSubCommandType read _GetStop;
    {class} property WriteMemory: JSubCommandType read _GetWriteMemory;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/type/SubCommandType')]
  JSubCommandType = interface(JEnum)
    ['{5DFFAA19-4D3F-4D33-8820-8C71A812DA15}']
    function getCommand: Char; cdecl;
    function toString: JString; cdecl;
  end;
  TJSubCommandType = class(TJavaGenericImport<JSubCommandTypeClass, JSubCommandType>) end;

  JTagDataTypeClass = interface(JEnumClass)
    ['{1B6C1EB1-181C-4BE6-8DDA-D3472AB92D0D}']
    {class} function _GetASCII: JTagDataType; cdecl;
    {class} function _GetHEX: JTagDataType; cdecl;
    {class} function valueOf(P1: JString): JTagDataType; cdecl; overload;
    {class} function valueOf(P1: Integer): JTagDataType; cdecl; overload;
    {class} function values: TJavaObjectArray<JTagDataType>; cdecl;
    {class} property ASCII: JTagDataType read _GetASCII;
    {class} property HEX: JTagDataType read _GetHEX;
  end;

  [JavaSignature('com/hanmiit/lib/rfid/type/TagDataType')]
  JTagDataType = interface(JEnum)
    ['{921B2329-C535-47EC-87A3-941A9CB7F0C6}']
    function getCode: Integer; cdecl;
  end;
  TJTagDataType = class(TJavaGenericImport<JTagDataTypeClass, JTagDataType>) end;

  JBitConvertClass = interface(JObjectClass)
    ['{E627E45C-1067-4D61-9D31-1353CAF41818}']
    {class} function getAddDataLength(P1: TJavaArray<Byte>): TJavaArray<Byte>; cdecl;
    {class} function getBoolean(P1: TJavaArray<Byte>): Boolean; cdecl;
    {class} function getBytes(P1: Integer): TJavaArray<Byte>; cdecl; overload;
    {class} function getBytes(P1: JString): TJavaArray<Byte>; cdecl; overload;
    {class} function getBytes(P1: Boolean): TJavaArray<Byte>; cdecl; overload;
    {class} function getHexBytes(P1: JString): TJavaArray<Byte>; cdecl;
    {class} function getHexString(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): JString; cdecl;
    {class} function getInteger(P1: TJavaArray<Byte>): Integer; cdecl; overload;
    {class} function getInteger(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl; overload;
    {class} function getInteger(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): Integer; cdecl; overload;
    {class} function getInteger(P1: TJavaArray<Byte>; P2: Integer; P3: Integer; P4: Integer): Integer; cdecl; overload;
    {class} function getLong(P1: TJavaArray<Byte>): Int64; cdecl; overload;
    {class} function getLong(P1: TJavaArray<Byte>; P2: Integer): Int64; cdecl; overload;
    {class} function getString(P1: TJavaArray<Byte>): JString; cdecl; overload;
    {class} function getString(P1: TJavaArray<Byte>; P2: Integer; P3: Integer): JString; cdecl; overload;
    {class} function init: JBitConvert; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/util/BitConvert')]
  JBitConvert = interface(JObject)
    ['{497DA89B-D975-454B-88FA-23A5E938D3B0}']
  end;
  TJBitConvert = class(TJavaGenericImport<JBitConvertClass, JBitConvert>) end;

  JByteCompareClass = interface(JObjectClass)
    ['{C8057FED-B058-4C90-BE0F-039D611C1611}']
    {class} function getSameByte(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>): Boolean; cdecl;
    {class} function init: JByteCompare; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/util/ByteCompare')]
  JByteCompare = interface(JObject)
    ['{B44906F1-65DD-4562-907A-C70C78BCECFA}']
  end;
  TJByteCompare = class(TJavaGenericImport<JByteCompareClass, JByteCompare>) end;

  JByteQueueClass = interface(JObjectClass)
    ['{C7186CAB-285A-4885-B4EE-FACC1D736C96}']
    {class} procedure clear; cdecl;
    {class} function dequeue(P1: Integer): TJavaArray<Byte>; cdecl; overload;
    {class} function dequeue(P1: Integer; P2: Integer): TJavaArray<Byte>; cdecl; overload;
    {class} procedure enqueue(P1: TJavaArray<Byte>); cdecl; overload;
    {class} procedure enqueue(P1: TJavaArray<Byte>; P2: Integer; P3: Integer); cdecl; overload;
    {class} function findByte(P1: Byte): Integer; cdecl; overload;
    {class} function findByte(P1: Byte; P2: Integer): Integer; cdecl; overload;
    {class} function findPattern(P1: TJavaArray<Byte>): Integer; cdecl; overload;
    {class} function findPattern(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl; overload;
    {class} function getCount: Integer; cdecl; overload;
    {class} function getCount(P1: Integer; P2: Integer): Integer; cdecl; overload;
    {class} function getFront: Integer; cdecl;
    {class} function getRemainSize: Integer; cdecl;
    {class} function getSize: Integer; cdecl;
    {class} function getTail: Integer; cdecl;
    {class} function init: JByteQueue; cdecl;
    {class} function isLength(P1: Integer): Boolean; cdecl;
    {class} function isRange(P1: Integer): Boolean; cdecl;
    {class} function next(P1: Integer): Integer; cdecl;
    {class} function peek(P1: Integer): Integer; cdecl;
    {class} function peekFront: Integer; cdecl;
    {class} function remove(P1: Integer): Boolean; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/util/ByteQueue')]
  JByteQueue = interface(JObject)
    ['{9D07DC1F-AEE2-4C99-8980-0A110D7401DE}']
  end;
  TJByteQueue = class(TJavaGenericImport<JByteQueueClass, JByteQueue>) end;

  JDrawUtilClass = interface(JObjectClass)
    ['{66E7CC6F-D720-43BF-B282-E8D9C648A222}']
    {class} function getDip2Pixel(P1: JContext; P2: Integer): Integer; cdecl;
    {class} function init: JDrawUtil; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/util/DrawUtil')]
  JDrawUtil = interface(JObject)
    ['{574ECCD2-264A-48EB-ADBA-87C290166B32}']
  end;
  TJDrawUtil = class(TJavaGenericImport<JDrawUtilClass, JDrawUtil>) end;

  JStringConvertClass = interface(JObjectClass)
    ['{AAB73428-AF4C-4CF7-BDD6-3ACD32C53D4E}']
    {class} function getByte(P1: JString; P2: Integer): Byte; cdecl;
    {class} function getInteger(P1: JString; P2: Integer): Integer; cdecl;
    {class} function getShort(P1: JString; P2: Integer): SmallInt; cdecl;
    {class} function init: JStringConvert; cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/util/StringConvert')]
  JStringConvert = interface(JObject)
    ['{35068F05-62F9-473E-859A-4B283459EC27}']
  end;
  TJStringConvert = class(TJavaGenericImport<JStringConvertClass, JStringConvert>) end;

  JSysUtilClass = interface(JObjectClass)
    ['{25B67AF1-498B-40F9-B6CF-73279C8B41E8}']
    {class} function init: JSysUtil; cdecl;
    {class} procedure sleep(P1: Integer); cdecl;
  end;

  [JavaSignature('com/hanmiit/lib/util/SysUtil')]
  JSysUtil = interface(JObject)
    ['{5342964D-8DAE-4C7A-B608-30B84D4CABC3}']
  end;
  TJSysUtil = class(TJavaGenericImport<JSysUtilClass, JSysUtil>) end;

  Jutil_VersionClass = interface(JObjectClass)
    ['{4514ACF2-FE79-4F62-A1BF-C1B34E308CAC}']
    {class} function _GetV5_2_2_28: Integer; cdecl;
    {class} function _GetV6_0_0_00: Integer; cdecl;
    {class} function _GetV7_2_5_13: Integer; cdecl;
    {class} function _GetV7_2_5_2: Integer; cdecl;
    {class} function _GetVX_2_2_1: Integer; cdecl;
    {class} function _GetVX_2_2_18: Integer; cdecl;
    {class} function _GetVX_2_2_20: Integer; cdecl;
    {class} function _GetVX_2_2_29: Integer; cdecl;
    {class} function _GetVX_2_2_5: Integer; cdecl;
    {class} function _GetVX_2_6_1: Integer; cdecl;
    {class} function init: Jutil_Version; cdecl;
    {class} function isBefore(P1: Integer): Boolean; cdecl;
    {class} function isLaster(P1: Integer): Boolean; cdecl;
    {class} function isRange(P1: Integer; P2: Integer): Boolean; cdecl;
    {class} procedure setVersion(P1: JString); cdecl;
    {class} property V5_2_2_28: Integer read _GetV5_2_2_28;
    {class} property V6_0_0_00: Integer read _GetV6_0_0_00;
    {class} property V7_2_5_13: Integer read _GetV7_2_5_13;
    {class} property V7_2_5_2: Integer read _GetV7_2_5_2;
    {class} property VX_2_2_1: Integer read _GetVX_2_2_1;
    {class} property VX_2_2_18: Integer read _GetVX_2_2_18;
    {class} property VX_2_2_20: Integer read _GetVX_2_2_20;
    {class} property VX_2_2_29: Integer read _GetVX_2_2_29;
    {class} property VX_2_2_5: Integer read _GetVX_2_2_5;
    {class} property VX_2_6_1: Integer read _GetVX_2_6_1;
  end;

  [JavaSignature('com/hanmiit/lib/util/Version')]
  Jutil_Version = interface(JObject)
    ['{DBFADD09-0F32-4AB8-AF46-B45890199869}']
  end;
  TJutil_Version = class(TJavaGenericImport<Jutil_VersionClass, Jutil_Version>) end;

  JPipedInputStreamClass = interface(JInputStreamClass)
    ['{E6CE4F7F-95BD-480A-8DFE-8DC05B3621FA}']
    {class} function init: JPipedInputStream; cdecl; overload;//Deprecated
    {class} function init(out_: JPipedOutputStream): JPipedInputStream; cdecl; overload;//Deprecated
    {class} function init(pipeSize: Integer): JPipedInputStream; cdecl; overload;//Deprecated
    {class} function init(out_: JPipedOutputStream; pipeSize: Integer): JPipedInputStream; cdecl; overload;//Deprecated
    {class} function available: Integer; cdecl;//Deprecated
    {class} procedure close; cdecl;//Deprecated
  end;

  [JavaSignature('java/io/PipedInputStream')]
  JPipedInputStream = interface(JInputStream)
    ['{76EDD1BD-1C75-49EB-8FD5-4BD779DAAF68}']
    procedure connect(src: JPipedOutputStream); cdecl;
    function read: Integer; cdecl; overload;
    function read(bytes: TJavaArray<Byte>; byteOffset: Integer; byteCount: Integer): Integer; cdecl; overload;
  end;
  TJPipedInputStream = class(TJavaGenericImport<JPipedInputStreamClass, JPipedInputStream>) end;

  JPipedOutputStreamClass = interface(JOutputStreamClass)
    ['{113AEDD2-D996-4A40-99A0-BC4A384F1091}']
    {class} function init: JPipedOutputStream; cdecl; overload;//Deprecated
    {class} function init(target: JPipedInputStream): JPipedOutputStream; cdecl; overload;//Deprecated
    {class} procedure close; cdecl;
    {class} procedure connect(stream: JPipedInputStream); cdecl;
    {class} procedure flush; cdecl;
  end;

  [JavaSignature('java/io/PipedOutputStream')]
  JPipedOutputStream = interface(JOutputStream)
    ['{80A29CC6-BD8C-4F56-B556-6FE272D2BFA4}']
    procedure write(buffer: TJavaArray<Byte>; offset: Integer; count: Integer); cdecl; overload;//Deprecated
    procedure write(oneByte: Integer); cdecl; overload;//Deprecated
  end;
  TJPipedOutputStream = class(TJavaGenericImport<JPipedOutputStreamClass, JPipedOutputStream>) end;

  JAbstractStringBuilderClass = interface(JObjectClass)
    ['{A3321EF2-EA76-44CD-90CE-DFDADB9936BD}']
    {class} function charAt(index: Integer): Char; cdecl;//Deprecated
    {class} function codePointAt(index: Integer): Integer; cdecl;//Deprecated
    {class} function codePointBefore(index: Integer): Integer; cdecl;//Deprecated
    {class} function indexOf(string_: JString): Integer; cdecl; overload;//Deprecated
    {class} function indexOf(subString: JString; start: Integer): Integer; cdecl; overload;//Deprecated
    {class} function lastIndexOf(string_: JString): Integer; cdecl; overload;//Deprecated
    {class} procedure setCharAt(index: Integer; ch: Char); cdecl;
    {class} procedure setLength(length: Integer); cdecl;
    {class} function subSequence(start: Integer; end_: Integer): JCharSequence; cdecl;
    {class} procedure trimToSize; cdecl;
  end;

  [JavaSignature('java/lang/AbstractStringBuilder')]
  JAbstractStringBuilder = interface(JObject)
    ['{39A0E6C5-8F79-44ED-BECB-02252CA2F5C0}']
    function capacity: Integer; cdecl;//Deprecated
    function codePointCount(start: Integer; end_: Integer): Integer; cdecl;//Deprecated
    procedure ensureCapacity(min: Integer); cdecl;//Deprecated
    procedure getChars(start: Integer; end_: Integer; dst: TJavaArray<Char>; dstStart: Integer); cdecl;//Deprecated
    function lastIndexOf(subString: JString; start: Integer): Integer; cdecl; overload;
    function length: Integer; cdecl;
    function offsetByCodePoints(index: Integer; codePointOffset: Integer): Integer; cdecl;
    function substring(start: Integer): JString; cdecl; overload;
    function substring(start: Integer; end_: Integer): JString; cdecl; overload;
    function toString: JString; cdecl;
  end;
  TJAbstractStringBuilder = class(TJavaGenericImport<JAbstractStringBuilderClass, JAbstractStringBuilder>) end;

  JStringBufferClass = interface(JAbstractStringBuilderClass)
    ['{F6BF4ECD-EA63-4AF3-A901-99D4221796D7}']
    {class} function init: JStringBuffer; cdecl; overload;//Deprecated
    {class} function init(capacity: Integer): JStringBuffer; cdecl; overload;//Deprecated
    {class} function init(string_: JString): JStringBuffer; cdecl; overload;//Deprecated
    {class} function init(cs: JCharSequence): JStringBuffer; cdecl; overload;//Deprecated
    {class} function append(b: Boolean): JStringBuffer; cdecl; overload;//Deprecated
    {class} function append(ch: Char): JStringBuffer; cdecl; overload;//Deprecated
    {class} function append(d: Double): JStringBuffer; cdecl; overload;//Deprecated
    {class} function append(obj: JObject): JStringBuffer; cdecl; overload;
    {class} function append(string_: JString): JStringBuffer; cdecl; overload;
    {class} function append(sb: JStringBuffer): JStringBuffer; cdecl; overload;
    {class} function append(s: JCharSequence; start: Integer; end_: Integer): JStringBuffer; cdecl; overload;
    {class} function appendCodePoint(codePoint: Integer): JStringBuffer; cdecl;
    {class} function charAt(index: Integer): Char; cdecl;
    {class} function delete(start: Integer; end_: Integer): JStringBuffer; cdecl;
    {class} function deleteCharAt(location: Integer): JStringBuffer; cdecl;
    {class} procedure ensureCapacity(min: Integer); cdecl;
    {class} function insert(index: Integer; b: Boolean): JStringBuffer; cdecl; overload;
    {class} function insert(index: Integer; i: Integer): JStringBuffer; cdecl; overload;
    {class} function insert(index: Integer; l: Int64): JStringBuffer; cdecl; overload;
    {class} function insert(index: Integer; string_: JString): JStringBuffer; cdecl; overload;//Deprecated
    {class} function insert(index: Integer; chars: TJavaArray<Char>): JStringBuffer; cdecl; overload;//Deprecated
    {class} function lastIndexOf(subString: JString; start: Integer): Integer; cdecl;//Deprecated
    {class} function offsetByCodePoints(index: Integer; codePointOffset: Integer): Integer; cdecl;//Deprecated
    {class} function replace(start: Integer; end_: Integer; string_: JString): JStringBuffer; cdecl;//Deprecated
    {class} function subSequence(start: Integer; end_: Integer): JCharSequence; cdecl;//Deprecated
    {class} function substring(start: Integer): JString; cdecl; overload;//Deprecated
    {class} function substring(start: Integer; end_: Integer): JString; cdecl; overload;//Deprecated
  end;

  [JavaSignature('java/lang/StringBuffer')]
  JStringBuffer = interface(JAbstractStringBuilder)
    ['{3CECFBBE-9C21-4D67-9F6F-52BB1DB2C638}']
    function append(f: Single): JStringBuffer; cdecl; overload;
    function append(i: Integer): JStringBuffer; cdecl; overload;
    function append(l: Int64): JStringBuffer; cdecl; overload;
    function append(chars: TJavaArray<Char>): JStringBuffer; cdecl; overload;
    function append(chars: TJavaArray<Char>; start: Integer; length: Integer): JStringBuffer; cdecl; overload;
    function append(s: JCharSequence): JStringBuffer; cdecl; overload;
    function codePointAt(index: Integer): Integer; cdecl;
    function codePointBefore(index: Integer): Integer; cdecl;
    function codePointCount(beginIndex: Integer; endIndex: Integer): Integer; cdecl;
    procedure getChars(start: Integer; end_: Integer; buffer: TJavaArray<Char>; idx: Integer); cdecl;
    function indexOf(subString: JString; start: Integer): Integer; cdecl;
    function insert(index: Integer; ch: Char): JStringBuffer; cdecl; overload;
    function insert(index: Integer; d: Double): JStringBuffer; cdecl; overload;//Deprecated
    function insert(index: Integer; f: Single): JStringBuffer; cdecl; overload;//Deprecated
    function insert(index: Integer; obj: JObject): JStringBuffer; cdecl; overload;//Deprecated
    function insert(index: Integer; chars: TJavaArray<Char>; start: Integer; length: Integer): JStringBuffer; cdecl; overload;//Deprecated
    function insert(index: Integer; s: JCharSequence): JStringBuffer; cdecl; overload;//Deprecated
    function insert(index: Integer; s: JCharSequence; start: Integer; end_: Integer): JStringBuffer; cdecl; overload;//Deprecated
    function reverse: JStringBuffer; cdecl;//Deprecated
    procedure setCharAt(index: Integer; ch: Char); cdecl;//Deprecated
    procedure setLength(length: Integer); cdecl;//Deprecated
    function toString: JString; cdecl;//Deprecated
    procedure trimToSize; cdecl;//Deprecated
  end;
  TJStringBuffer = class(TJavaGenericImport<JStringBufferClass, JStringBuffer>) end;

  JStringBuilderClass = interface(JAbstractStringBuilderClass)
    ['{D9FACB66-EE60-4BCB-B5B2-248751CCF1B4}']
    {class} function init: JStringBuilder; cdecl; overload;//Deprecated
    {class} function init(capacity: Integer): JStringBuilder; cdecl; overload;//Deprecated
    {class} function init(seq: JCharSequence): JStringBuilder; cdecl; overload;//Deprecated
    {class} function init(str: JString): JStringBuilder; cdecl; overload;//Deprecated
    {class} function append(b: Boolean): JStringBuilder; cdecl; overload;//Deprecated
    {class} function append(c: Char): JStringBuilder; cdecl; overload;//Deprecated
    {class} function append(f: Single): JStringBuilder; cdecl; overload;//Deprecated
    {class} function append(d: Double): JStringBuilder; cdecl; overload;//Deprecated
    {class} function append(obj: JObject): JStringBuilder; cdecl; overload;//Deprecated
    {class} function append(str: TJavaArray<Char>; offset: Integer; len: Integer): JStringBuilder; cdecl; overload;//Deprecated
    {class} function append(csq: JCharSequence): JStringBuilder; cdecl; overload;//Deprecated
    {class} function append(csq: JCharSequence; start: Integer; end_: Integer): JStringBuilder; cdecl; overload;//Deprecated
    {class} function insert(offset: Integer; b: Boolean): JStringBuilder; cdecl; overload;//Deprecated
    {class} function insert(offset: Integer; c: Char): JStringBuilder; cdecl; overload;//Deprecated
    {class} function insert(offset: Integer; i: Integer): JStringBuilder; cdecl; overload;//Deprecated
    {class} function insert(offset: Integer; obj: JObject): JStringBuilder; cdecl; overload;
    {class} function insert(offset: Integer; str: JString): JStringBuilder; cdecl; overload;
    {class} function insert(offset: Integer; ch: TJavaArray<Char>): JStringBuilder; cdecl; overload;
    {class} function replace(start: Integer; end_: Integer; string_: JString): JStringBuilder; cdecl;
    {class} function reverse: JStringBuilder; cdecl;
    {class} function toString: JString; cdecl;
  end;

  [JavaSignature('java/lang/StringBuilder')]
  JStringBuilder = interface(JAbstractStringBuilder)
    ['{F8A75A66-EA10-4337-9ECC-B0CA4FF4D9C5}']
    function append(i: Integer): JStringBuilder; cdecl; overload;//Deprecated
    function append(l: Int64): JStringBuilder; cdecl; overload;//Deprecated
    function append(str: JString): JStringBuilder; cdecl; overload;//Deprecated
    function append(sb: JStringBuffer): JStringBuilder; cdecl; overload;//Deprecated
    function append(chars: TJavaArray<Char>): JStringBuilder; cdecl; overload;//Deprecated
    function appendCodePoint(codePoint: Integer): JStringBuilder; cdecl;//Deprecated
    function delete(start: Integer; end_: Integer): JStringBuilder; cdecl;//Deprecated
    function deleteCharAt(index: Integer): JStringBuilder; cdecl;//Deprecated
    function insert(offset: Integer; l: Int64): JStringBuilder; cdecl; overload;
    function insert(offset: Integer; f: Single): JStringBuilder; cdecl; overload;
    function insert(offset: Integer; d: Double): JStringBuilder; cdecl; overload;
    function insert(offset: Integer; str: TJavaArray<Char>; strOffset: Integer; strLen: Integer): JStringBuilder; cdecl; overload;
    function insert(offset: Integer; s: JCharSequence): JStringBuilder; cdecl; overload;
    function insert(offset: Integer; s: JCharSequence; start: Integer; end_: Integer): JStringBuilder; cdecl; overload;
  end;
  TJStringBuilder = class(TJavaGenericImport<JStringBuilderClass, JStringBuilder>) end;

  JSemaphoreClass = interface(JObjectClass)
    ['{C04ACFCC-6B80-4EC4-88D3-431D1EBAA53C}']
    {class} function init(permits: Integer): JSemaphore; cdecl; overload;//Deprecated
    {class} function init(permits: Integer; fair: Boolean): JSemaphore; cdecl; overload;//Deprecated
    {class} procedure acquire(permits: Integer); cdecl; overload;//Deprecated
    {class} procedure acquireUninterruptibly; cdecl; overload;//Deprecated
    {class} procedure acquireUninterruptibly(permits: Integer); cdecl; overload;//Deprecated
    {class} function getQueueLength: Integer; cdecl;//Deprecated
    {class} function hasQueuedThreads: Boolean; cdecl;//Deprecated
    {class} function isFair: Boolean; cdecl;//Deprecated
    {class} function tryAcquire: Boolean; cdecl; overload;
    {class} function tryAcquire(timeout: Int64; unit_: JTimeUnit): Boolean; cdecl; overload;
    {class} function tryAcquire(permits: Integer): Boolean; cdecl; overload;
  end;

  [JavaSignature('java/util/concurrent/Semaphore')]
  JSemaphore = interface(JObject)
    ['{6F947A1D-8F66-4C25-9D34-0F42D29F32C2}']
    procedure acquire; cdecl; overload;//Deprecated
    function availablePermits: Integer; cdecl;//Deprecated
    function drainPermits: Integer; cdecl;//Deprecated
    procedure release; cdecl; overload;
    procedure release(permits: Integer); cdecl; overload;
    function toString: JString; cdecl;
    function tryAcquire(permits: Integer; timeout: Int64; unit_: JTimeUnit): Boolean; cdecl; overload;
  end;
  TJSemaphore = class(TJavaGenericImport<JSemaphoreClass, JSemaphore>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JAnimator', TypeInfo(Androidapi.JNI.rfidreaderapi.JAnimator));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JAnimator_AnimatorListener', TypeInfo(Androidapi.JNI.rfidreaderapi.JAnimator_AnimatorListener));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JAnimator_AnimatorPauseListener', TypeInfo(Androidapi.JNI.rfidreaderapi.JAnimator_AnimatorPauseListener));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JKeyframe', TypeInfo(Androidapi.JNI.rfidreaderapi.JKeyframe));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JLayoutTransition', TypeInfo(Androidapi.JNI.rfidreaderapi.JLayoutTransition));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JLayoutTransition_TransitionListener', TypeInfo(Androidapi.JNI.rfidreaderapi.JLayoutTransition_TransitionListener));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JPropertyValuesHolder', TypeInfo(Androidapi.JNI.rfidreaderapi.JPropertyValuesHolder));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JStateListAnimator', TypeInfo(Androidapi.JNI.rfidreaderapi.JStateListAnimator));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JTimeInterpolator', TypeInfo(Androidapi.JNI.rfidreaderapi.JTimeInterpolator));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JTypeConverter', TypeInfo(Androidapi.JNI.rfidreaderapi.JTypeConverter));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JTypeEvaluator', TypeInfo(Androidapi.JNI.rfidreaderapi.JTypeEvaluator));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JValueAnimator', TypeInfo(Androidapi.JNI.rfidreaderapi.JValueAnimator));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JValueAnimator_AnimatorUpdateListener', TypeInfo(Androidapi.JNI.rfidreaderapi.JValueAnimator_AnimatorUpdateListener));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JPathMotion', TypeInfo(Androidapi.JNI.rfidreaderapi.JPathMotion));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JScene', TypeInfo(Androidapi.JNI.rfidreaderapi.JScene));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JTransition', TypeInfo(Androidapi.JNI.rfidreaderapi.JTransition));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JTransition_EpicenterCallback', TypeInfo(Androidapi.JNI.rfidreaderapi.JTransition_EpicenterCallback));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JTransition_TransitionListener', TypeInfo(Androidapi.JNI.rfidreaderapi.JTransition_TransitionListener));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JTransitionManager', TypeInfo(Androidapi.JNI.rfidreaderapi.JTransitionManager));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JTransitionPropagation', TypeInfo(Androidapi.JNI.rfidreaderapi.JTransitionPropagation));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JTransitionValues', TypeInfo(Androidapi.JNI.rfidreaderapi.JTransitionValues));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JInterpolator', TypeInfo(Androidapi.JNI.rfidreaderapi.JInterpolator));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JToolbar_LayoutParams', TypeInfo(Androidapi.JNI.rfidreaderapi.JToolbar_LayoutParams));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JEventListenerManager', TypeInfo(Androidapi.JNI.rfidreaderapi.JEventListenerManager));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JATRfidManager', TypeInfo(Androidapi.JNI.rfidreaderapi.JATRfidManager));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JATRfidReader', TypeInfo(Androidapi.JNI.rfidreaderapi.JATRfidReader));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JConnectionStateListener', TypeInfo(Androidapi.JNI.rfidreaderapi.JConnectionStateListener));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JATRfidReader_1', TypeInfo(Androidapi.JNI.rfidreaderapi.JATRfidReader_1));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JProtocolRfidEventListener', TypeInfo(Androidapi.JNI.rfidreaderapi.JProtocolRfidEventListener));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JATRfidReader_2', TypeInfo(Androidapi.JNI.rfidreaderapi.JATRfidReader_2));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JATRfidReader_3', TypeInfo(Androidapi.JNI.rfidreaderapi.JATRfidReader_3));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JATRfidReader_EventHandler', TypeInfo(Androidapi.JNI.rfidreaderapi.JATRfidReader_EventHandler));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JATRfidReader_Watcher', TypeInfo(Androidapi.JNI.rfidreaderapi.JATRfidReader_Watcher));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JParamHelper', TypeInfo(Androidapi.JNI.rfidreaderapi.JParamHelper));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JParamValue', TypeInfo(Androidapi.JNI.rfidreaderapi.JParamValue));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JParamValueList', TypeInfo(Androidapi.JNI.rfidreaderapi.JParamValueList));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JDecodeEventArgs', TypeInfo(Androidapi.JNI.rfidreaderapi.JDecodeEventArgs));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JPayloadBuffer', TypeInfo(Androidapi.JNI.rfidreaderapi.JPayloadBuffer));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JResultBytesValue', TypeInfo(Androidapi.JNI.rfidreaderapi.JResultBytesValue));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JBarcodeType', TypeInfo(Androidapi.JNI.rfidreaderapi.JBarcodeType));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JBooklandIsbnFormat', TypeInfo(Androidapi.JNI.rfidreaderapi.JBooklandIsbnFormat));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JCodabarStartStopCharactersDetection', TypeInfo(Androidapi.JNI.rfidreaderapi.JCodabarStartStopCharactersDetection));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JCode11CheckDigitVerification', TypeInfo(Androidapi.JNI.rfidreaderapi.JCode11CheckDigitVerification));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JCompositeBeepMode', TypeInfo(Androidapi.JNI.rfidreaderapi.JCompositeBeepMode));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JCouponReportFormat', TypeInfo(Androidapi.JNI.rfidreaderapi.JCouponReportFormat));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JDecodeUpcEanSupplementals', TypeInfo(Androidapi.JNI.rfidreaderapi.JDecodeUpcEanSupplementals));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JDecodeUpcSupplementalsAIMID', TypeInfo(Androidapi.JNI.rfidreaderapi.JDecodeUpcSupplementalsAIMID));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JEncodingType', TypeInfo(Androidapi.JNI.rfidreaderapi.JEncodingType));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JGs1DataBarLimitedSecurityLevel', TypeInfo(Androidapi.JNI.rfidreaderapi.JGs1DataBarLimitedSecurityLevel));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JI2of5CheckDigitVerification', TypeInfo(Androidapi.JNI.rfidreaderapi.JI2of5CheckDigitVerification));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JI2of5SecurityLevel', TypeInfo(Androidapi.JNI.rfidreaderapi.JI2of5SecurityLevel));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JInverseType', TypeInfo(Androidapi.JNI.rfidreaderapi.JInverseType));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JMsiCheckDigitAlgorithm', TypeInfo(Androidapi.JNI.rfidreaderapi.JMsiCheckDigitAlgorithm));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JMsiCheckDigits', TypeInfo(Androidapi.JNI.rfidreaderapi.JMsiCheckDigits));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JParamName', TypeInfo(Androidapi.JNI.rfidreaderapi.JParamName));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JPreamble', TypeInfo(Androidapi.JNI.rfidreaderapi.JPreamble));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JRedundancyLevel', TypeInfo(Androidapi.JNI.rfidreaderapi.JRedundancyLevel));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JSSICommand', TypeInfo(Androidapi.JNI.rfidreaderapi.JSSICommand));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JSecurityLevel', TypeInfo(Androidapi.JNI.rfidreaderapi.JSecurityLevel));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JUpcCompositeMode', TypeInfo(Androidapi.JNI.rfidreaderapi.JUpcCompositeMode));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JUpcEanSecurityLevel', TypeInfo(Androidapi.JNI.rfidreaderapi.JUpcEanSecurityLevel));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JDevice', TypeInfo(Androidapi.JNI.rfidreaderapi.JDevice));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JDevBluetooth', TypeInfo(Androidapi.JNI.rfidreaderapi.JDevBluetooth));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JDevBluetooth_ConnectingThread', TypeInfo(Androidapi.JNI.rfidreaderapi.JDevBluetooth_ConnectingThread));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JDevBluetooth_ListenThread', TypeInfo(Androidapi.JNI.rfidreaderapi.JDevBluetooth_ListenThread));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JDevBluetooth_ReceiveThread', TypeInfo(Androidapi.JNI.rfidreaderapi.JDevBluetooth_ReceiveThread));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JDevBluetoothLe', TypeInfo(Androidapi.JNI.rfidreaderapi.JDevBluetoothLe));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JDevBluetoothLe_1', TypeInfo(Androidapi.JNI.rfidreaderapi.JDevBluetoothLe_1));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JDevBluetoothLe_2', TypeInfo(Androidapi.JNI.rfidreaderapi.JDevBluetoothLe_2));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JDevice_1', TypeInfo(Androidapi.JNI.rfidreaderapi.JDevice_1));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JBleDeviceListActivity', TypeInfo(Androidapi.JNI.rfidreaderapi.JBleDeviceListActivity));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JBleDeviceListActivity_1', TypeInfo(Androidapi.JNI.rfidreaderapi.JBleDeviceListActivity_1));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.J1_1', TypeInfo(Androidapi.JNI.rfidreaderapi.J1_1));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JBleDeviceListActivity_2', TypeInfo(Androidapi.JNI.rfidreaderapi.JBleDeviceListActivity_2));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.J2_1', TypeInfo(Androidapi.JNI.rfidreaderapi.J2_1));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JBleDeviceListAdapter', TypeInfo(Androidapi.JNI.rfidreaderapi.JBleDeviceListAdapter));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JBleDeviceListAdapter_1', TypeInfo(Androidapi.JNI.rfidreaderapi.JBleDeviceListAdapter_1));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JBleDeviceListAdapter_2', TypeInfo(Androidapi.JNI.rfidreaderapi.JBleDeviceListAdapter_2));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JBleDeviceListAdapter_DeviceListItem', TypeInfo(Androidapi.JNI.rfidreaderapi.JBleDeviceListAdapter_DeviceListItem));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JBleDeviceListAdapter_DeviceListViewHolder', TypeInfo(Androidapi.JNI.rfidreaderapi.JBleDeviceListAdapter_DeviceListViewHolder));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JDeviceList', TypeInfo(Androidapi.JNI.rfidreaderapi.JDeviceList));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JDeviceListActivity', TypeInfo(Androidapi.JNI.rfidreaderapi.JDeviceListActivity));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JDeviceListActivity_1', TypeInfo(Androidapi.JNI.rfidreaderapi.JDeviceListActivity_1));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JDeviceListAdapter', TypeInfo(Androidapi.JNI.rfidreaderapi.JDeviceListAdapter));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JDeviceListAdapter_DeviceListItem', TypeInfo(Androidapi.JNI.rfidreaderapi.JDeviceListAdapter_DeviceListItem));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JDeviceListAdapter_DeviceListViewHolder', TypeInfo(Androidapi.JNI.rfidreaderapi.JDeviceListAdapter_DeviceListViewHolder));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JConnectionState', TypeInfo(Androidapi.JNI.rfidreaderapi.JConnectionState));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JATLog', TypeInfo(Androidapi.JNI.rfidreaderapi.JATLog));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JATLog_1', TypeInfo(Androidapi.JNI.rfidreaderapi.JATLog_1));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JATLog_ATUncaughtExceptionHandler', TypeInfo(Androidapi.JNI.rfidreaderapi.JATLog_ATUncaughtExceptionHandler));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JATLog_QueueItem', TypeInfo(Androidapi.JNI.rfidreaderapi.JATLog_QueueItem));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JDump', TypeInfo(Androidapi.JNI.rfidreaderapi.JDump));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JRangeValue', TypeInfo(Androidapi.JNI.rfidreaderapi.JRangeValue));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JModuleRfBlaster', TypeInfo(Androidapi.JNI.rfidreaderapi.JModuleRfBlaster));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JAccessResultArgs', TypeInfo(Androidapi.JNI.rfidreaderapi.JAccessResultArgs));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JReadedTagArgs', TypeInfo(Androidapi.JNI.rfidreaderapi.JReadedTagArgs));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JATRfidEventListener', TypeInfo(Androidapi.JNI.rfidreaderapi.JATRfidEventListener));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JATRfidEventListenerManager', TypeInfo(Androidapi.JNI.rfidreaderapi.JATRfidEventListenerManager));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JATRfidReaderException', TypeInfo(Androidapi.JNI.rfidreaderapi.JATRfidReaderException));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JLockParam', TypeInfo(Androidapi.JNI.rfidreaderapi.JLockParam));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JMinMaxValue', TypeInfo(Androidapi.JNI.rfidreaderapi.JMinMaxValue));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JResultDataValue', TypeInfo(Androidapi.JNI.rfidreaderapi.JResultDataValue));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JSelectMaskEpcParam', TypeInfo(Androidapi.JNI.rfidreaderapi.JSelectMaskEpcParam));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JSelectMaskParam', TypeInfo(Androidapi.JNI.rfidreaderapi.JSelectMaskParam));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JStringIntegerValue', TypeInfo(Androidapi.JNI.rfidreaderapi.JStringIntegerValue));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JCommandParam', TypeInfo(Androidapi.JNI.rfidreaderapi.JCommandParam));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JLockTagCommandParam', TypeInfo(Androidapi.JNI.rfidreaderapi.JLockTagCommandParam));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JReadMemoryCommandParam', TypeInfo(Androidapi.JNI.rfidreaderapi.JReadMemoryCommandParam));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JWriteMemoryCommandParam', TypeInfo(Androidapi.JNI.rfidreaderapi.JWriteMemoryCommandParam));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JProtocolRfBlaster', TypeInfo(Androidapi.JNI.rfidreaderapi.JProtocolRfBlaster));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JProtocolRfBlaster_Packet', TypeInfo(Androidapi.JNI.rfidreaderapi.JProtocolRfBlaster_Packet));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JProtocolRfBlaster_ReceiveThread', TypeInfo(Androidapi.JNI.rfidreaderapi.JProtocolRfBlaster_ReceiveThread));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JProtocolRfBlaster_Watcher', TypeInfo(Androidapi.JNI.rfidreaderapi.JProtocolRfBlaster_Watcher));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JActionState', TypeInfo(Androidapi.JNI.rfidreaderapi.JActionState));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JAlgorithmType', TypeInfo(Androidapi.JNI.rfidreaderapi.JAlgorithmType));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JBatteryStatusType', TypeInfo(Androidapi.JNI.rfidreaderapi.JBatteryStatusType));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JBuzzerState', TypeInfo(Androidapi.JNI.rfidreaderapi.JBuzzerState));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JCommandType', TypeInfo(Androidapi.JNI.rfidreaderapi.JCommandType));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JLbtItem', TypeInfo(Androidapi.JNI.rfidreaderapi.JLbtItem));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JLockState', TypeInfo(Androidapi.JNI.rfidreaderapi.JLockState));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JMaskActionType', TypeInfo(Androidapi.JNI.rfidreaderapi.JMaskActionType));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JMaskTargetType', TypeInfo(Androidapi.JNI.rfidreaderapi.JMaskTargetType));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JMemoryBank', TypeInfo(Androidapi.JNI.rfidreaderapi.JMemoryBank));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JOperationMode', TypeInfo(Androidapi.JNI.rfidreaderapi.JOperationMode));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JRemoteKeyState', TypeInfo(Androidapi.JNI.rfidreaderapi.JRemoteKeyState));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.Jtype_ResultCode', TypeInfo(Androidapi.JNI.rfidreaderapi.Jtype_ResultCode));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JSelectFlag', TypeInfo(Androidapi.JNI.rfidreaderapi.JSelectFlag));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JSessionFlag', TypeInfo(Androidapi.JNI.rfidreaderapi.JSessionFlag));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JSessionType', TypeInfo(Androidapi.JNI.rfidreaderapi.JSessionType));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JSubCommandType', TypeInfo(Androidapi.JNI.rfidreaderapi.JSubCommandType));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JTagDataType', TypeInfo(Androidapi.JNI.rfidreaderapi.JTagDataType));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JBitConvert', TypeInfo(Androidapi.JNI.rfidreaderapi.JBitConvert));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JByteCompare', TypeInfo(Androidapi.JNI.rfidreaderapi.JByteCompare));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JByteQueue', TypeInfo(Androidapi.JNI.rfidreaderapi.JByteQueue));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JDrawUtil', TypeInfo(Androidapi.JNI.rfidreaderapi.JDrawUtil));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JStringConvert', TypeInfo(Androidapi.JNI.rfidreaderapi.JStringConvert));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JSysUtil', TypeInfo(Androidapi.JNI.rfidreaderapi.JSysUtil));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.Jutil_Version', TypeInfo(Androidapi.JNI.rfidreaderapi.Jutil_Version));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JPipedInputStream', TypeInfo(Androidapi.JNI.rfidreaderapi.JPipedInputStream));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JPipedOutputStream', TypeInfo(Androidapi.JNI.rfidreaderapi.JPipedOutputStream));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JAbstractStringBuilder', TypeInfo(Androidapi.JNI.rfidreaderapi.JAbstractStringBuilder));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JStringBuffer', TypeInfo(Androidapi.JNI.rfidreaderapi.JStringBuffer));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JStringBuilder', TypeInfo(Androidapi.JNI.rfidreaderapi.JStringBuilder));
  TRegTypes.RegisterType('Androidapi.JNI.rfidreaderapi.JSemaphore', TypeInfo(Androidapi.JNI.rfidreaderapi.JSemaphore));
end;

initialization
  RegisterTypes;
end.

