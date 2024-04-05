import 'dart:convert';

import 'package:QCM/Ipqc.dart';
import 'package:QCM/Iqcp.dart';
import 'package:QCM/Welcomepage.dart';
import 'package:QCM/components/app_button_widget.dart';

import 'package:flutter/material.dart';

import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

import '../components/appbar.dart';
import '../constant/app_assets.dart';
import '../constant/app_color.dart';
import '../constant/app_fonts.dart';
import '../constant/app_helper.dart';

import '../constant/app_styles.dart';

class Postlam extends StatefulWidget {
  @override
  _PostlamState createState() => _PostlamState();
}

class _PostlamState extends State<Postlam> {
  TextEditingController lotSizeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController shiftController = TextEditingController();
  TextEditingController lineController = TextEditingController();
  TextEditingController poController = TextEditingController();

  /******Trimming **********/
  final _registerFormKey = GlobalKey<FormState>();
  TextEditingController trimmingWiCrieteriaController = TextEditingController();
  TextEditingController trimmingWiFrequencyController = TextEditingController();
  TextEditingController trimmingWiController = TextEditingController();
  TextEditingController trimmingPhysicalCriteriaController =
      TextEditingController();
  TextEditingController trimmingPhysicalFrequencyController =
      TextEditingController();
  TextEditingController trimmingPhysicalObs1Controller =
      TextEditingController();
  TextEditingController trimmingPhysicalObs2Controller =
      TextEditingController();
  TextEditingController trimmingPhysicalObs3Controller =
      TextEditingController();
  TextEditingController trimmingPhysicalObs4Controller =
      TextEditingController();
  TextEditingController trimmingPhysicalObs5Controller =
      TextEditingController();
  /**************Post LAM Visual Inspection*********** */
  TextEditingController postLamWiCrieteriaController = TextEditingController();
  TextEditingController postLamWiFrequencyController = TextEditingController();
  TextEditingController postLamWiController = TextEditingController();
  TextEditingController postLamVisualCrieteriaController =
      TextEditingController();
  TextEditingController postLamVisualFrequencyController =
      TextEditingController();
  TextEditingController postLamVisualObs1Controller = TextEditingController();
  TextEditingController postLamVisualObs2Controller = TextEditingController();
  TextEditingController postLamVisualObs3Controller = TextEditingController();
  TextEditingController postLamVisualObs4Controller = TextEditingController();
  TextEditingController postLamVisualObs5Controller = TextEditingController();
  /////////// Framing/////////////////////
  TextEditingController framingWiCrieteriaController = TextEditingController();
  TextEditingController framingWiFrequencyController = TextEditingController();
  TextEditingController framingWiController = TextEditingController();
  TextEditingController framingGlueUniCrieteriaController =
      TextEditingController();
  TextEditingController framingGlueUniFrequencyController =
      TextEditingController();
  TextEditingController framingGlueUniObs1Controller = TextEditingController();
  TextEditingController framingGlueUniObs2Controller = TextEditingController();
  TextEditingController framingGlueUniObs3Controller = TextEditingController();
  TextEditingController framingGlueUniObs4Controller = TextEditingController();
  TextEditingController framingGlueUniObs5Controller = TextEditingController();
  TextEditingController framingGlueWeightCrieteriaController =
      TextEditingController();
  TextEditingController framingGlueWeightFrequencyController =
      TextEditingController();
  TextEditingController framingGlueWeightController = TextEditingController();
  TextEditingController framingCornerCrieteriaController =
      TextEditingController();
  TextEditingController framingCornerFrequencyController =
      TextEditingController();
  TextEditingController framingCornerObs1Controller = TextEditingController();
  TextEditingController framingCornerObs2Controller = TextEditingController();
  TextEditingController framingCornerObs3Controller = TextEditingController();
  TextEditingController framingCornerObs4Controller = TextEditingController();
  TextEditingController framingCornerObs5Controller = TextEditingController();
  TextEditingController framingTopCrieteriaController = TextEditingController();
  TextEditingController framingTopFrequencyController = TextEditingController();
  TextEditingController framingTopController = TextEditingController();
  TextEditingController framingMountingCrieteriaController =
      TextEditingController();
  TextEditingController framingMountingFrequencyController =
      TextEditingController();
  TextEditingController framingMountingController = TextEditingController();
  TextEditingController framingAnodizingCrieteriaController =
      TextEditingController();
  TextEditingController framingAnodizingFrequencyController =
      TextEditingController();
  TextEditingController framingAnodizingController = TextEditingController();
  /*******************Junction Box Assembly */
  TextEditingController junctionWiCrieteriaController = TextEditingController();
  TextEditingController junctionWiFrequencyController = TextEditingController();
  TextEditingController junctionWiController = TextEditingController();
  TextEditingController junctionGlueCrieteriaController =
      TextEditingController();
  TextEditingController junctionGlueFrequencyController =
      TextEditingController();
  TextEditingController junctionGlueObs1Controller = TextEditingController();
  TextEditingController junctionGlueObs2Controller = TextEditingController();
  TextEditingController junctionGlueObs3Controller = TextEditingController();
  TextEditingController junctionGlueObs4Controller = TextEditingController();
  TextEditingController junctionGlueObs5Controller = TextEditingController();
  TextEditingController junctionJbCrieteriaController = TextEditingController();
  TextEditingController junctionJbFrequencyController = TextEditingController();
  TextEditingController junctionJbObs1Controller = TextEditingController();
  TextEditingController junctionJbObs2Controller = TextEditingController();
  TextEditingController junctionJbObs3Controller = TextEditingController();
  TextEditingController junctionJbObs4Controller = TextEditingController();
  TextEditingController junctionJbObs5Controller = TextEditingController();
  TextEditingController junctionGlueWeightCrieteriaController =
      TextEditingController();
  TextEditingController junctionGlueWeightFrequencyController =
      TextEditingController();
  TextEditingController junctionGlueWeightController = TextEditingController();

  TextEditingController junctionGlueRatioCrieteriaController =
      TextEditingController();
  TextEditingController junctionGlueRatioFrequencyController =
      TextEditingController();
  TextEditingController junctionGlueRatioController = TextEditingController();
  /************************Curing*********************** */
  TextEditingController curingWiCrieteriaController = TextEditingController();
  TextEditingController curingWiFrequencyController = TextEditingController();
  TextEditingController curingWiController = TextEditingController();
  TextEditingController curingTimeCrieteriaController = TextEditingController();
  TextEditingController curingTimeFrequencyController = TextEditingController();
  TextEditingController curingTimeController = TextEditingController();
  TextEditingController curingTempCrieteriaController = TextEditingController();
  TextEditingController curingTempFrequencyController = TextEditingController();
  TextEditingController curingTempController = TextEditingController();
  /**************************Buffing******************************* */
  TextEditingController buffingWiCrieteriaController = TextEditingController();
  TextEditingController buffingWiFrequencyController = TextEditingController();
  TextEditingController buffingWiController = TextEditingController();
  TextEditingController buffingEdgeCrieteriaController =
      TextEditingController();
  TextEditingController buffingEdgeFrequencyController =
      TextEditingController();
  TextEditingController buffingEdseObs1Controller = TextEditingController();
  TextEditingController buffingEdseObs2Controller = TextEditingController();
  TextEditingController buffingEdseObs3Controller = TextEditingController();
  TextEditingController buffingEdseObs4Controller = TextEditingController();
  TextEditingController buffingEdseObs5Controller = TextEditingController();
  /**************************Cleaning******************************* */
  TextEditingController cleaningWiCrieteriaController = TextEditingController();
  TextEditingController cleaningWiFrequencyController = TextEditingController();
  TextEditingController cleaningWiController = TextEditingController();
  TextEditingController cleaningModuleCrieteriaController =
      TextEditingController();
  TextEditingController cleaningModuleFrequencyController =
      TextEditingController();
  TextEditingController cleaningModuleObs1Controller = TextEditingController();
  TextEditingController cleaningModuleObs2Controller = TextEditingController();
  TextEditingController cleaningModuleObs3Controller = TextEditingController();
  TextEditingController cleaningModuleObs4Controller = TextEditingController();
  TextEditingController cleaningModuleObs5Controller = TextEditingController();
  /******************************Sun Simulator************** */
  TextEditingController sunWiFrequencyController = TextEditingController();
  TextEditingController sunWiCrieteriaController = TextEditingController();
  TextEditingController sunWiController = TextEditingController();
  TextEditingController sunTempCrieteriaController = TextEditingController();
  TextEditingController sunTempFrequencyController = TextEditingController();
  TextEditingController sunTempController = TextEditingController();
  TextEditingController sunIrradianceCrieteriaController =
      TextEditingController();
  TextEditingController sunIrradianceFrequencyController =
      TextEditingController();
  TextEditingController sunIrradianceController = TextEditingController();
  TextEditingController sunCaliCrieteriaController = TextEditingController();
  TextEditingController sunCaliFrequencyController = TextEditingController();
  TextEditingController sunCali1TimeController = TextEditingController();
  TextEditingController sunCali1RoomController = TextEditingController();
  TextEditingController sunCali1ModuleTempController = TextEditingController();
  TextEditingController sunCali1ModuleIdController = TextEditingController();
  TextEditingController sunCali2TimeController = TextEditingController();
  TextEditingController sunCali2RoomController = TextEditingController();
  TextEditingController sunCali2ModuleTempController = TextEditingController();
  TextEditingController sunCali2ModuleIdController = TextEditingController();
  TextEditingController sunCali3TimeController = TextEditingController();
  TextEditingController sunCali3RoomController = TextEditingController();
  TextEditingController sunCali3ModuleTempController = TextEditingController();
  TextEditingController sunCali3ModuleIdController = TextEditingController();
  TextEditingController sunLastCrieteriaController = TextEditingController();
  TextEditingController sunLastFrequencyController = TextEditingController();
  TextEditingController sunLast1Controller = TextEditingController();
  TextEditingController sunLast2Controller = TextEditingController();
  TextEditingController sunLast3Controller = TextEditingController();
  TextEditingController sunExpiryCrieteriaController = TextEditingController();
  TextEditingController sunExpiryFrequencyController = TextEditingController();
  TextEditingController sunExpiryController = TextEditingController();
  /******************************Hipot*********************************/
  TextEditingController hipotWiCrieteriaController = TextEditingController();
  TextEditingController hipotWiFrequencyController = TextEditingController();
  TextEditingController hipotWiController = TextEditingController();
  TextEditingController hipotParameterCrieteriaController =
      TextEditingController();
  TextEditingController hipotParameterFrequencyController =
      TextEditingController();
  TextEditingController hipotParameterController = TextEditingController();
  TextEditingController hipotDCWCrieteriaController = TextEditingController();
  TextEditingController hipotDCWFrequencyController = TextEditingController();
  TextEditingController hipotDCWObs1Controller = TextEditingController();
  TextEditingController hipotDCWObs2Controller = TextEditingController();
  TextEditingController hipotDCWObs3Controller = TextEditingController();
  TextEditingController hipotDCWObs4Controller = TextEditingController();
  TextEditingController hipotDCWObs5Controller = TextEditingController();
  TextEditingController hipotIRCrieteriaController = TextEditingController();
  TextEditingController hipotIRFrequencyController = TextEditingController();
  TextEditingController hipotIRObs1Controller = TextEditingController();
  TextEditingController hipotIRObs2Controller = TextEditingController();
  TextEditingController hipotIRObs3Controller = TextEditingController();
  TextEditingController hipotIRObs4Controller = TextEditingController();
  TextEditingController hipotIRObs5Controller = TextEditingController();
  TextEditingController hipotGroundCrieteriaController =
      TextEditingController();
  TextEditingController hipotGroundFrequencyController =
      TextEditingController();
  TextEditingController hipotGroundObs1Controller = TextEditingController();
  TextEditingController hipotGroundObs2Controller = TextEditingController();
  TextEditingController hipotGroundObs3Controller = TextEditingController();
  TextEditingController hipotGroundObs4Controller = TextEditingController();
  TextEditingController hipotGroundObs5Controller = TextEditingController();
  /*************************Final EL Test*************** */

  TextEditingController elWiCrieteriaController = TextEditingController();
  TextEditingController elWiFrequencyController = TextEditingController();
  TextEditingController elWiController = TextEditingController();

  TextEditingController elVoltageCrieteriaController = TextEditingController();
  TextEditingController elVoltageFrequencyController = TextEditingController();
  TextEditingController elVoltageController = TextEditingController();
  TextEditingController elDefectsCrieteriaController = TextEditingController();
  TextEditingController elDefectsFrequencyController = TextEditingController();
  TextEditingController elDefectsObs1Controller = TextEditingController();
  TextEditingController elDefectsObs2Controller = TextEditingController();
  TextEditingController elDefectsObs3Controller = TextEditingController();
  TextEditingController elDefectsObs4Controller = TextEditingController();
  TextEditingController elDefectsObs5Controller = TextEditingController();
  /*************************RFID Reading & Writing*************** */

  TextEditingController rfidWiCrieteriaController = TextEditingController();
  TextEditingController rfidWiFrequencyController = TextEditingController();
  TextEditingController rfidWiController = TextEditingController();

  TextEditingController rfidFixingCrieteriaController = TextEditingController();
  TextEditingController rfidFixingFrequencyController = TextEditingController();
  TextEditingController rfidFixingObs1Controller = TextEditingController();
  TextEditingController rfidFixingObs2Controller = TextEditingController();
  TextEditingController rfidFixingObs3Controller = TextEditingController();
  TextEditingController rfidFixingObs4Controller = TextEditingController();
  TextEditingController rfidFixingObs5Controller = TextEditingController();
  TextEditingController rfidTagCrieteriaController = TextEditingController();
  TextEditingController rfidTagFrequencyController = TextEditingController();
  TextEditingController rfidTagController = TextEditingController();
  TextEditingController rfidCertificationCrieteriaController =
      TextEditingController();
  TextEditingController rfidCertificationFrequencyController =
      TextEditingController();
  TextEditingController rfidCertificationController = TextEditingController();
  TextEditingController rfidCellCrieteriaController = TextEditingController();
  TextEditingController rfidCellFrequencyController = TextEditingController();
  TextEditingController rfidCellController = TextEditingController();
  TextEditingController rfidModuleCrieteriaController = TextEditingController();
  TextEditingController rfidModuleFrequencyController = TextEditingController();
  TextEditingController rfidModuleController = TextEditingController();
  /******************************Back Label******************************** */
  TextEditingController backLabelDataCrieteriaController =
      TextEditingController();
  TextEditingController backLabelDataFrequencyController =
      TextEditingController();
  TextEditingController backLabelDataObs1Controller = TextEditingController();
  TextEditingController backLabelDataObs2Controller = TextEditingController();
  TextEditingController backLabelDataObs3Controller = TextEditingController();
  TextEditingController backLabelDataObs4Controller = TextEditingController();
  TextEditingController backLabelDataObs5Controller = TextEditingController();
  TextEditingController backLabelAirCrieteriaController =
      TextEditingController();
  TextEditingController backLabelAirFrequencyController =
      TextEditingController();
  TextEditingController backLabelAirObs1Controller = TextEditingController();
  TextEditingController backLabelAirObs2Controller = TextEditingController();
  TextEditingController backLabelAirObs3Controller = TextEditingController();
  TextEditingController backLabelAirObs4Controller = TextEditingController();
  TextEditingController backLabelAirObs5Controller = TextEditingController();
  /*************************Final Viisual Inspection *********************** */
  TextEditingController finalInspectionCrieteriaController =
      TextEditingController();
  TextEditingController finalInspectionFrequencyController =
      TextEditingController();
  TextEditingController finalInspectionObs1Controller = TextEditingController();
  TextEditingController finalInspectionObs2Controller = TextEditingController();
  TextEditingController finalInspectionObs3Controller = TextEditingController();
  TextEditingController finalInspectionObs4Controller = TextEditingController();
  TextEditingController finalInspectionObs5Controller = TextEditingController();
  TextEditingController finalFitmentCrieteriaController =
      TextEditingController();
  TextEditingController finalFitmentFrequencyController =
      TextEditingController();
  TextEditingController finalFitmentObs1Controller = TextEditingController();
  TextEditingController finalFitmentObs2Controller = TextEditingController();
  TextEditingController finalFitmentObs3Controller = TextEditingController();
  TextEditingController finalFitmentObs4Controller = TextEditingController();
  TextEditingController finalFitmentObs5Controller = TextEditingController();
  TextEditingController finalWiCrieteriaController = TextEditingController();
  TextEditingController finalWiFrequencyController = TextEditingController();
  TextEditingController finalWiController = TextEditingController();
  /***********************************Packaging*********************** */
  TextEditingController packagingBarcodeCrieteriaController =
      TextEditingController();
  TextEditingController packagingBarcodeFrequencyController =
      TextEditingController();
  TextEditingController packagingBarcodeObs1Controller =
      TextEditingController();
  TextEditingController packagingBarcodeObs2Controller =
      TextEditingController();
  TextEditingController packagingBarcodeObs3Controller =
      TextEditingController();
  TextEditingController packagingBarcodeObs4Controller =
      TextEditingController();
  TextEditingController packagingBarcodeObs5Controller =
      TextEditingController();
  TextEditingController packagingpackingCrieteriaController =
      TextEditingController();
  TextEditingController packagingpackingFrequencyController =
      TextEditingController();
  TextEditingController packagingpackingObs1Controller =
      TextEditingController();
  TextEditingController packagingpackingObs2Controller =
      TextEditingController();
  TextEditingController packagingpackingObs3Controller =
      TextEditingController();
  TextEditingController packagingpackingObs4Controller =
      TextEditingController();
  TextEditingController packagingpackingObs5Controller =
      TextEditingController();
  TextEditingController packagingBoxCrieteriaController =
      TextEditingController();
  TextEditingController packagingBoxFrequencyController =
      TextEditingController();
  TextEditingController packagingBoxObs1Controller = TextEditingController();
  TextEditingController packagingBoxObs2Controller = TextEditingController();
  TextEditingController packagingBoxObs3Controller = TextEditingController();
  TextEditingController packagingBoxObs4Controller = TextEditingController();
  TextEditingController packagingBoxObs5Controller = TextEditingController();
  TextEditingController packagingStretchCrieteriaController =
      TextEditingController();
  TextEditingController packagingStretchFrequencyController =
      TextEditingController();
  TextEditingController packagingStretchObs1Controller =
      TextEditingController();
  TextEditingController packagingStretchObs2Controller =
      TextEditingController();
  TextEditingController packagingStretchObs3Controller =
      TextEditingController();
  TextEditingController packagingStretchObs4Controller =
      TextEditingController();
  TextEditingController packagingStretchObs5Controller =
      TextEditingController();

  bool menu = false, user = false, face = false, home = false;
  bool _isLoading = false;
  String setPage = 'trimming', pic = '';
  String invoiceDate = '';
  String date = '';
  bool? isCycleTimeTrue;
  bool? isBacksheetCuttingTrue;

  @override
  void initState() {
    super.initState();
    setState(() {
      // Trimming
      trimmingWiFrequencyController.text = "Once a Shift";
      trimmingWiCrieteriaController.text = "Must be Present";
      trimmingPhysicalFrequencyController.text = "5 Piece per Shift";
      trimmingPhysicalCriteriaController.text =
          "Uniniform trimming without any burr & residue";
      // Post Lam Visual Inspection
      postLamWiFrequencyController.text = "Once a Shift";
      postLamWiCrieteriaController.text = "Must be Present";
      postLamVisualFrequencyController.text = "5 Piece per Shift";
      postLamVisualCrieteriaController.text =
          "As per Visual inspection criteria : GSPl/IPQC/VI/021";

      // Framing
      framingWiFrequencyController.text = "Once a Shift";
      framingWiCrieteriaController.text = "Must be Present";
      framingGlueUniFrequencyController.text = "5 Piece per Shift";
      framingGlueUniCrieteriaController.text =
          "should be continious & uniform,no gap between frame and backsheet";
      framingGlueWeightFrequencyController.text = "Once a Shift";
      framingGlueWeightCrieteriaController.text = "As per GSPL/IPQC/FG/013";
      framingCornerFrequencyController.text = "5 Piece per Shift";
      framingCornerCrieteriaController.text = "No Corner Gap,No overlapping";
      framingTopFrequencyController.text = "Once a Shift";
      framingTopFrequencyController.text = "As per PO or process card";
      framingMountingFrequencyController.text = "once a Shift";
      framingTopCrieteriaController.text = "+-1mm ";
      framingAnodizingFrequencyController.text = "onc a Shift";
      framingAnodizingFrequencyController.text = ">=15micron ";
      // Junction Box Assembly
      junctionWiFrequencyController.text = "Once a Shift";
      junctionWiCrieteriaController.text = "Must be Present";
      junctionGlueFrequencyController.text = "5 Piece per Shift";
      junctionGlueCrieteriaController.text =
          "Should be continious & uniform,no gap between frame and backsheet";
      junctionJbFrequencyController.text = "5 piece per Shift";
      junctionJbCrieteriaController.text = "No Tilting";
      junctionGlueWeightFrequencyController.text = "Once a  Shift";
      junctionGlueWeightCrieteriaController.text = "As per GSPL/IPQC/JB/014";
      junctionGlueRatioFrequencyController.text = "Once a  Shift";
      junctionGlueRatioCrieteriaController.text = "As per GSPL/IPQC/JB/015";
      // Curing
      curingWiFrequencyController.text = "Once a Shift";
      curingWiCrieteriaController.text = "Must be Present";
      curingTimeFrequencyController.text = "Continuos";
      curingTimeCrieteriaController.text = ">=4Hr";
      curingTempFrequencyController.text = "Once a Shift";
      curingTempCrieteriaController.text = "25+-5oc &>=50%RH";
      // Buffing
      buffingWiFrequencyController.text = "Once a Shift";
      buffingWiCrieteriaController.text = "Must be Present";
      buffingEdgeFrequencyController.text = "5 Piece per Shift";
      buffingEdgeCrieteriaController.text =
          "should not be sharp & Buffing belt should be properly working";
      // Cleaning
      cleaningWiFrequencyController.text = "Once a Shift";
      cleaningWiFrequencyController.text = "Must be Present";
      cleaningModuleFrequencyController.text = "5 Piece per Shift";
      cleaningModuleFrequencyController.text =
          "As per visual inspection criteria Annexure-A8";
      // Sun Simulator
      sunWiFrequencyController.text = "Once a Shift";
      sunWiCrieteriaController.text = "Must be Present";
      sunTempFrequencyController.text = "Once a Shift";
      sunTempCrieteriaController.text = "25+-2°C";
      sunIrradianceFrequencyController.text = "Once a Shift";
      sunIrradianceCrieteriaController.text = "1000W/m²";
      sunCaliFrequencyController.text = "Every Four Hour";
      sunCaliCrieteriaController.text =
          " Calibration performed at 25+-2°C room temperature ";
      sunLastFrequencyController.text = "Every Four Hour";
      sunLastCrieteriaController.text = " verify also it's result";
      sunExpiryFrequencyController.text = "Once a Shift";
      sunExpiryCrieteriaController.text = " 3 Months";

      // Hipot
      hipotWiFrequencyController.text = "Once a Shift";
      hipotWiCrieteriaController.text = "Must be Present";
      hipotParameterFrequencyController.text = "Once a Shift";
      hipotParameterCrieteriaController.text = "As per UL/As per IEC";
      hipotDCWFrequencyController.text = "5 Piece per Shift";
      hipotDCWCrieteriaController.text = "As per GSPL technical Specification";
      hipotIRFrequencyController.text = "5 Piece per Shift";
      hipotIRCrieteriaController.text = "As per GSPL technical Specification";
      hipotGroundFrequencyController.text = "5 Piece per Shift";
      hipotGroundCrieteriaController.text =
          "As per GSPL technical Specification";
      // Final El Test
      elWiFrequencyController.text = "Once a Shift";
      elWiCrieteriaController.text = "Must be Present";
      elVoltageFrequencyController.text = "Once a Shift";
      elVoltageCrieteriaController.text = "As per Voc & Isc";
      elDefectsFrequencyController.text = "5 Piece per Shift";
      elDefectsCrieteriaController.text = "As per GSPL/IPQC/EL/020";
      // RFID Reading & Writing
      rfidWiFrequencyController.text = "Once a Shift";
      rfidWiCrieteriaController.text = "Must be Present";
      rfidFixingFrequencyController.text = "5 Piece per Shift";
      rfidFixingCrieteriaController.text = "As per process Card";
      rfidTagFrequencyController.text = "Continuous";
      rfidTagCrieteriaController.text =
          "A Tag should be read & write Content should comply MNRE guidline";
      rfidCertificationFrequencyController.text = "Once a Shift";
      rfidCertificationCrieteriaController.text =
          "As per IEC/UL REPORT(As applicable)";
      rfidCellFrequencyController.text = "Once a Shift";
      rfidCellCrieteriaController.text = "As per BOM";
      rfidModuleFrequencyController.text = "Once a Shift";
      rfidModuleCrieteriaController.text = "As per process Card";
      // Back Label
      backLabelDataFrequencyController.text = "5 Piece per  Shift";
      backLabelDataCrieteriaController.text = "As per Datasheet/process card";
      backLabelAirFrequencyController.text = "5 Piece per Shift";
      backLabelAirCrieteriaController.text = "Not Acceptable";
      // Final Visual Inspection
      finalInspectionFrequencyController.text = "5 Piece per  Shift";
      finalInspectionCrieteriaController.text =
          "As per Visual Inspection criteria GSPl/IPQC/VI/021";
      finalFitmentFrequencyController.text = "5 Piece per Shift";
      finalFitmentCrieteriaController.text =
          "Partial fitment of JB cover not allowed";
      finalWiFrequencyController.text = "5 Piece per Shift";
      finalWiCrieteriaController.text = "Must be present";
      // PAckaging
      packagingBarcodeFrequencyController.text = "5 Piece per  Shift";
      packagingBarcodeCrieteriaController.text = "As per GSPL/FQC/PV/001";
      packagingpackingFrequencyController.text = "5 box per Shift";
      packagingpackingCrieteriaController.text = "As per GSPL/FQC/PV/001";
      packagingBoxFrequencyController.text = "5 Box per Shift";
      packagingBoxCrieteriaController.text = "No Damage/Dull printing";
      packagingStretchFrequencyController.text = "5 Box per Shift";
      packagingStretchCrieteriaController.text = "Should be all around";
    });
  }

  Future createData() async {
    print('sampleeeeeeeeeeeeeeeeeeeeeeeee');
    print(junctionWiController.text);
    // print(packagingSampleData);
    var PostLamDetails = {
      "Date": date,
      "Shift": shiftController.text,
      "Line": lineController.text,
      "Po.No": poController.text,
      "Document No": "GSPL/IPQC/IPC/003",
      "RevNo": "Ver2.0/28-03-2024"
    };

    var Postlam = {
      "Trimming": {
        "Avaibility of WI": trimmingWiController.text,
        "Frequency": trimmingWiFrequencyController.text,
        "Crieteria": trimmingWiCrieteriaController.text,
        "Physical verification of Union trimming & Blade replacing frequency": {
          "Observation 1": trimmingPhysicalObs1Controller.text,
          "Observation 2": trimmingPhysicalObs2Controller.text,
          "Observation 3": trimmingPhysicalObs3Controller.text,
          "Observation 4": trimmingPhysicalObs4Controller.text,
          "Observation 5": trimmingPhysicalObs5Controller.text,
        },
        "Frequency": trimmingPhysicalFrequencyController.text,
        "Acceptance_Criteria": trimmingPhysicalCriteriaController.text,
      },
      "Post Lam Visual Inspection": {
        "Avaibility of WI & criteria": postLamWiController.text,
        "Frequency": postLamWiFrequencyController.text,
        "Acceptance_Criteria": postLamWiCrieteriaController.text,
        "Visual Defects": {
          "Observation 1": postLamVisualObs1Controller.text,
          "Observation 2": postLamVisualObs2Controller.text,
          "Observation 3": postLamVisualObs3Controller.text,
          "Observation 4": postLamVisualObs4Controller.text,
          "Observation 5": postLamVisualObs5Controller.text,
        },
        "Frequency": postLamVisualFrequencyController.text,
        "Crieteria": postLamVisualCrieteriaController.text,
      },
      "Framing": {
        "Avaibility of WI & Sealant weight Specification":
            framingWiController.text,
        "Frequency": framingWiFrequencyController.text,
        "Crieteria": framingWiCrieteriaController.text,
        "Glue uniformity & continuity in frame groove": {
          "Observation 1": framingGlueUniObs1Controller.text,
          "Observation 2": framingGlueUniObs2Controller.text,
          "Observation 3": framingGlueUniObs3Controller.text,
          "Observation 4": framingGlueUniObs4Controller.text,
          "Observation 5": framingGlueUniObs5Controller.text,
        },
        "Frequency": framingGlueUniFrequencyController.text,
        "Crieteria": framingGlueUniCrieteriaController.text,
        "Glue Weight": framingGlueWeightController.text,
        "Frequency": framingGlueWeightFrequencyController.text,
        "Crieteria": framingGlueWeightCrieteriaController.text,
        "Corner Gap": {
          "Observation 1": framingCornerObs1Controller.text,
          "Observation 2": framingCornerObs2Controller.text,
          "Observation 3": framingCornerObs3Controller.text,
          "Observation 4": framingCornerObs4Controller.text,
          "Observation 5": framingCornerObs5Controller.text,
        },
        "Frequency": framingCornerFrequencyController.text,
        "Crieteria": framingCornerCrieteriaController.text,
        "Top & Buttom cut Length side cut length": framingTopController.text,
        "Frequency": framingTopFrequencyController.text,
        "Crieteria": framingTopCrieteriaController.text,
        "Mounting hole x,y pitch": framingMountingController.text,
        "Frequency": framingMountingFrequencyController.text,
        "Crieteria": framingMountingCrieteriaController.text,
        "Anodizing thicknes": framingAnodizingController.text,
        "Frequency": framingAnodizingFrequencyController.text,
        "Crieteria": framingAnodizingCrieteriaController.text,
      },
      "Junction Box Assembly": {
        "Avaibility of WI & sealant weight specification":
            junctionWiController.text,
        "Frequency": junctionWiFrequencyController.text,
        "Crieteria": junctionWiCrieteriaController.text,
        "Glue around jB": {
          "Observation 1": junctionGlueObs1Controller.text,
          "Observation 2": junctionGlueObs2Controller.text,
          "Observation 3": junctionGlueObs3Controller.text,
          "Observation 4": junctionGlueObs4Controller.text,
          "Observation 5": junctionGlueObs5Controller.text,
        },
        "Frequency": junctionGlueFrequencyController.text,
        "Crieteria": junctionGlueFrequencyController.text,
        "JB tilt": {
          "Observation 1": junctionJbObs1Controller.text,
          "Observation 2": junctionJbObs2Controller.text,
          "Observation 3": junctionJbObs3Controller.text,
          "Observation 4": junctionJbObs4Controller.text,
          "Observation 5": junctionJbObs5Controller.text,
        },
        "Frequency": junctionJbFrequencyController.text,
        "Crieteria": junctionJbFrequencyController.text,
        "Glue Weight": junctionGlueWeightController.text,
        "Frequency": junctionGlueWeightFrequencyController.text,
        "Crieteria": junctionGlueWeightCrieteriaController.text,
        "Glue(Base+Catalyst)potting Ratio &Weight":
            junctionGlueRatioController.text,
        "Frequency": junctionGlueRatioFrequencyController.text,
        "Crieteria": junctionGlueRatioCrieteriaController.text,
      },
      "Curing": {
        "Avaibility of WI ": curingWiController.text,
        "Frequency": curingWiFrequencyController.text,
        "Crieteria": curingWiCrieteriaController.text,
        "Curing Time ": curingTimeController.text,
        "Frequency": curingTimeFrequencyController.text,
        "Crieteria": curingTimeCrieteriaController.text,
        "Temperature & Humidity ": curingTempController.text,
        "Frequency": curingTempFrequencyController.text,
        "Crieteria": curingTempCrieteriaController.text,
      },
      "Buffing": {
        "Avaibillity of WI": buffingWiController.text,
        "Frequency": buffingWiFrequencyController.text,
        "Crieteria": buffingWiCrieteriaController.text,
        "Edge of corner, Buffing belt condition": {
          "Observation 1": buffingEdseObs1Controller.text,
          "Observation 2": buffingEdseObs2Controller.text,
          "Observation 3": buffingEdseObs3Controller.text,
          "Observation 4": buffingEdseObs4Controller.text,
          "Observation 5": buffingEdseObs5Controller.text,
        },
        "Frequency": buffingEdgeFrequencyController.text,
        "Crieteria": buffingEdgeCrieteriaController.text,
      },
      "Cleaning": {
        "Avaibillity of WI": cleaningWiController.text,
        "Frequency": cleaningWiFrequencyController.text,
        "Crieteria": cleaningWiCrieteriaController.text,
        "Module should be free from -Protective Film,Scratches on Frame-Backsheet,Corner cleaning of module,Silicon Sealant glue/backsheet,frame cleaning,jb cleaning,No burr":
            {
          "Observation 1": cleaningModuleObs1Controller.text,
          "Observation 2": cleaningModuleObs2Controller.text,
          "Observation 3": cleaningModuleObs3Controller.text,
          "Observation 4": cleaningModuleObs4Controller.text,
          "Observation 5": cleaningModuleObs5Controller.text,
        },
        "Frequency": cleaningModuleFrequencyController.text,
        "Crieteria": cleaningModuleCrieteriaController.text,
      },
      "Sun Simulator Calibration": {
        "Avaibillity of WI": sunWiController.text,
        "Frequency": sunWiFrequencyController.text,
        "Crieteria": sunWiCrieteriaController.text,
        "Temperature": sunTempController.text,
        "Frequency": sunTempFrequencyController.text,
        "Crieteria": sunTempCrieteriaController.text,
        "Irradiance": sunIrradianceController.text,
        "Frequency": sunIrradianceFrequencyController.text,
        "Crieteria": sunIrradianceCrieteriaController.text,
        "Each sun simulator validated after every four hours using valid silver reference PV module":
            {
          "Inspection First": {
            "Time": sunCali1TimeController.text,
            "Room Temp": sunCali1RoomController.text,
            "Module Temp": sunCali1ModuleTempController.text,
            "Module Id": sunCali1ModuleIdController.text,
          },
          "Inspection Second": {
            "Time": sunCali2TimeController.text,
            "Room Temp": sunCali2RoomController.text,
            "Module Temp": sunCali2ModuleTempController.text,
            "Module Id": sunCali2ModuleIdController.text,
          },
          "Inspection Third": {
            "Time": sunCali3TimeController.text,
            "Room Temp": sunCali3RoomController.text,
            "Module Temp": sunCali3ModuleTempController.text,
            "Module Id": sunCali3ModuleIdController.text,
          },
        },
        "Frequency": sunCaliFrequencyController.text,
        "Crieteria": sunCaliCrieteriaController.text,
        "Last Validation or calibration date and time": {
          "First Inspection": sunLast1Controller.text,
          "Second Inspection": sunLast2Controller.text,
          "Third Inspection": sunLast3Controller.text,
        },
        "Frequency": sunLastFrequencyController.text,
        "Crieteria": sunLastCrieteriaController.text,
        "Expiry Date of Silver Module Verification": sunExpiryController.text,
        "Frequency": sunExpiryFrequencyController.text,
        "Crieteria": sunExpiryCrieteriaController.text,
      },
      "Hipot": {
        "Avaibillity of WI": hipotWiController.text,
        "Frequency": hipotWiFrequencyController.text,
        "Crieteria": hipotWiCrieteriaController.text,
        "parameter": hipotParameterController.text,
        "Frequency": hipotParameterFrequencyController.text,
        "Crieteria": hipotParameterCrieteriaController.text,
        "DCW-4.0KV ": {
          "Observation 1": hipotDCWObs1Controller.text,
          "Observation 2": hipotDCWObs2Controller.text,
          "Observation 3": hipotDCWObs3Controller.text,
          "Observation 4": hipotDCWObs4Controller.text,
          "Observation 5": hipotDCWObs5Controller.text,
        },
        "Frequency": hipotDCWFrequencyController.text,
        "Crieteria": hipotDCWCrieteriaController.text,
        "IR-1.5 KV ": {
          "Observation 1": hipotIRObs1Controller.text,
          "Observation 2": hipotIRObs2Controller.text,
          "Observation 3": hipotIRObs3Controller.text,
          "Observation 4": hipotIRObs4Controller.text,
          "Observation 5": hipotIRObs5Controller.text,
        },
        "Frequency": hipotIRFrequencyController.text,
        "Crieteria": hipotIRCrieteriaController.text,
        "Ground Continuity-62.5A ": {
          "Observation 1": hipotGroundObs1Controller.text,
          "Observation 2": hipotGroundObs2Controller.text,
          "Observation 3": hipotGroundObs3Controller.text,
          "Observation 4": hipotGroundObs4Controller.text,
          "Observation 5": hipotGroundObs5Controller.text,
        },
        "Frequency": hipotGroundFrequencyController.text,
        "Crieteria": hipotGroundCrieteriaController.text,
      },
      "Final EL TEST": {
        "Avaibillity of WI": elWiController.text,
        "Frequency": elWiFrequencyController.text,
        "Crieteria": elWiCrieteriaController.text,
        "Voltage & Current Verification in DC power supply":
            elVoltageController.text,
        "Frequency": elVoltageFrequencyController.text,
        "Crieteria": elVoltageCrieteriaController.text,
        "EL Defect": {
          "Observation 1": elDefectsObs1Controller.text,
          "Observation 2": elDefectsObs2Controller.text,
          "Observation 3": elDefectsObs3Controller.text,
          "Observation 4": elDefectsObs4Controller.text,
          "Observation 5": elDefectsObs5Controller.text,
        },
        "Frequency": elDefectsFrequencyController.text,
        "Crieteria": elDefectsCrieteriaController.text,
      },
      "RFID Reading & writing": {
        "Avaibillity of WI": rfidWiController.text,
        "Frequency": rfidWiFrequencyController.text,
        "Crieteria": rfidWiCrieteriaController.text,
        "Fixing position": {
          "Observation 1": rfidFixingObs1Controller.text,
          "Observation 2": rfidFixingObs2Controller.text,
          "Observation 3": rfidFixingObs3Controller.text,
          "Observation 4": rfidFixingObs4Controller.text,
          "Observation 5": rfidFixingObs5Controller.text,
        },
        "Frequency": rfidFixingFrequencyController.text,
        "Crieteria": rfidFixingCrieteriaController.text,
        "Tag read & write": rfidTagController.text,
        "Frequency": rfidTagFrequencyController.text,
        "Crieteria": rfidTagCrieteriaController.text,
        "Certification Date Verification": rfidCertificationController.text,
        "Frequency": rfidCertificationFrequencyController.text,
        "Crieteria": rfidCertificationCrieteriaController.text,
        "Module Manufacturing Month Verification": rfidModuleController.text,
        "Frequency": rfidModuleFrequencyController.text,
        "Crieteria": rfidModuleCrieteriaController.text,
      },
      "Back Label": {
        "Data Verification": {
          "Observation 1": backLabelDataObs1Controller.text,
          "Observation 2": backLabelDataObs2Controller.text,
          "Observation 3": backLabelDataObs3Controller.text,
          "Observation 4": backLabelDataObs4Controller.text,
          "Observation 5": backLabelDataObs5Controller.text,
        },
        "Frequency": backLabelDataFrequencyController.text,
        "Crieteria": backLabelDataCrieteriaController.text,
        "Air Bubbles,Tilt & Misprint": {
          "Observation 1": backLabelAirObs1Controller.text,
          "Observation 2": backLabelAirObs2Controller.text,
          "Observation 3": backLabelAirObs3Controller.text,
          "Observation 4": backLabelAirObs4Controller.text,
          "Observation 5": backLabelAirObs5Controller.text,
        },
        "Frequency": backLabelAirFrequencyController.text,
        "Crieteria": backLabelAirCrieteriaController.text,
      },
      "Final Visual Inspection": {
        "Visual inspection ": {
          "Observation 1": finalInspectionObs1Controller.text,
          "Observation 2": finalInspectionObs2Controller.text,
          "Observation 3": finalInspectionObs3Controller.text,
          "Observation 4": finalInspectionObs4Controller.text,
          "Observation 5": finalInspectionObs5Controller.text,
        },
        "Frequency": finalInspectionFrequencyController.text,
        "Crieteria": finalInspectionCrieteriaController.text,
        "Fitment of JB cover": {
          "Observation 1": finalFitmentObs1Controller.text,
          "Observation 2": finalFitmentObs2Controller.text,
          "Observation 3": finalFitmentObs3Controller.text,
          "Observation 4": finalFitmentObs4Controller.text,
          "Observation 5": finalFitmentObs5Controller.text,
        },
        "Frequency": finalFitmentFrequencyController.text,
        "Crieteria": finalFitmentCrieteriaController.text,
        "Availability of acceptance Criteri & WI": finalWiController.text,
        "Frequency": finalWiFrequencyController.text,
        "Crieteria": finalWiCrieteriaController.text,
      },
      "Packaging": {
        "Barcode Defects(unclear/duplication) ": {
          "Observation 1": packagingBarcodeObs1Controller.text,
          "Observation 2": packagingBarcodeObs2Controller.text,
          "Observation 3": packagingBarcodeObs3Controller.text,
          "Observation 4": packagingBarcodeObs4Controller.text,
          "Observation 5": packagingBarcodeObs5Controller.text,
        },
        "Frequency": packagingBarcodeFrequencyController.text,
        "Crieteria": packagingBarcodeCrieteriaController.text,
        "Packing Label & Contents": {
          "Observation 1": packagingpackingObs1Controller.text,
          "Observation 2": packagingpackingObs2Controller.text,
          "Observation 3": packagingpackingObs3Controller.text,
          "Observation 4": packagingpackingObs4Controller.text,
          "Observation 5": packagingpackingObs5Controller.text,
        },
        "Frequency": packagingpackingFrequencyController.text,
        "Crieteria": packagingpackingCrieteriaController.text,
        "Box Condition": {
          "Observation 1": packagingBoxObs1Controller.text,
          "Observation 2": packagingBoxObs2Controller.text,
          "Observation 3": packagingBoxObs3Controller.text,
          "Observation 4": packagingBoxObs4Controller.text,
          "Observation 5": packagingBoxObs5Controller.text,
        },
        "Frequency": packagingBoxFrequencyController.text,
        "Crieteria": packagingBoxCrieteriaController.text,
        "Stretch wrapping": {
          "Observation 1": packagingStretchObs1Controller.text,
          "Observation 2": packagingStretchObs2Controller.text,
          "Observation 3": packagingStretchObs3Controller.text,
          "Observation 4": packagingStretchObs4Controller.text,
          "Observation 5": packagingStretchObs5Controller.text,
        },
        "Frequency": packagingStretchFrequencyController.text,
        "Crieteria": packagingStretchCrieteriaController.text,
      },
    };

    print(Postlam);
  }

  Future getdata(String phone, BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    FocusScope.of(context).unfocus();
    if (lotSizeController.text.isEmpty || phone.isEmpty) {
      Toast.show("Please enter required details !",
          duration: Toast.lengthLong,
          gravity: Toast.center,
          backgroundColor: AppColors.redColor);
      return;
    }
    final url = "AppStrings.path" + 'login/RegistersendOTP';
    final prefs = await SharedPreferences.getInstance();
    var params = {"Mobile": phone};
    var response = await http.post(
      Uri.parse(url),
      body: json.encode(params),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      setState(() {
        _isLoading = false;
      });
      var objData = json.decode(response.body);
      if (objData['success'] == false) {
        Toast.show(objData['message'],
            duration: Toast.lengthLong,
            gravity: Toast.center,
            backgroundColor: AppColors.redColor);
      } else {
        Toast.show(objData['data']['message'],
            duration: Toast.lengthLong,
            gravity: Toast.center,
            backgroundColor: AppColors.blueColor);
        setState(() {
          setPage = 'second';
          //  otp = objData['data']['sentotp']['otp'].toString();
        });
      }
    } else {
      Toast.show("Error In Server",
          duration: Toast.lengthLong, gravity: Toast.center);
    }
  }

  Future register(List Data) async {
    print("Bhhhhhhhhhhhhh");
    print(Data);
    final url = "AppStrings.path" + 'login/Registermember';
    var response = await http.post(
      Uri.parse(url),
      body: jsonEncode(<String, String>{
        // "personid": personid != null ? (personid ?? '') : '',
        // "Firstname": fname,
        // "Lastname": lname,
        // "Phonenum": phone,
        // "Organization": organization,
        // "AppType": widget.appName,
        // "Country": country == null ? '' : country,
        // "State": state == null ? '' : state,
        // "City": city == null ? '' : city,
        // "Gender": gender == null ? '' : gender,
        // "Referred": referral == null ? '' : referral,
        // "Occupation": occupation == null ? '' : occupation,
        // "businesscategory": businessscategory == null ? '' : businessscategory,
        // "businessname": companyname == null ? '' : companyname,
        // "designation": desigation == null ? '' : desigation,
        // "Otp": (otp ?? ''),
      }),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        _isLoading = false;
      });
      var responseData = json.decode(response.body);

      if (responseData['success'] == true) {
        Toast.show('Provide Some More Information',
            duration: Toast.lengthLong,
            gravity: Toast.center,
            backgroundColor: AppColors.blueColor);

        if (mounted) {
          setState(() {
            _isLoading = false;
            // personid = responseData['data']['data'][0]['personid'];

            if (responseData['data']['data'][0]['Response'] ==
                'Registration successfull') {
              Toast.show(responseData['data']['data'][0]['Response'],
                  duration: Toast.lengthLong,
                  gravity: Toast.center,
                  backgroundColor: AppColors.blueColor);
              setPage = "fourth";
            } else {
              setPage = "third";
            }
          });
        }
      } else {
        Toast.show("OTP is Invalid",
            duration: Toast.lengthLong,
            gravity: Toast.center,
            backgroundColor: AppColors.redColor);
      }
    } else {
      Toast.show("Error In Server",
          duration: Toast.lengthLong, gravity: Toast.center);
    }
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: AppColors.white,
          appBar: GautamAppBar(
            organization: "organizationtype",
            isBackRequired: true,
            memberId: "personid",
            imgPath: "ImagePath",
            memberPic: pic,
            logo: "logo",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return IpqcPage();
              }));
            },
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: setPage == "trimming"
                ? Stack(
                    alignment: Alignment.center,
                    fit: StackFit.expand,
                    children: [
                      SingleChildScrollView(
                        child: Form(
                          key: _registerFormKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            AppAssets.imgLogo,
                                            height: 100,
                                            width: 230,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Center(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Incoming Production Quality Plan",
                                    style: TextStyle(
                                      fontSize: 27,
                                      color: AppColors.black,
                                      fontFamily: appFontFamily,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              const Center(
                                child: Text(
                                  "(Post Lam IPQC Checklist)",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: AppColors.black,
                                    fontFamily: appFontFamily,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 35,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Document No : ',
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'GSPL/IPQC/IP/003',
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Rev.No. / Rev. Date : ',
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Ver.1.0 / 20-08-2024',
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                ],
                              ),

                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Date",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              TextFormField(
                                  // controller: dateController,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  decoration: AppStyles.textFieldInputDecoration
                                      .copyWith(
                                          hintText: "Please Enter Date",
                                          counterText: '',
                                          suffixIcon: Image.asset(
                                            AppAssets.icCalenderBlue,
                                            color: AppColors.primaryColor,
                                          )),
                                  style: AppStyles.textInputTextStyle,
                                  onTap: () async {
                                    DateTime date = DateTime(2021);
                                    FocusScope.of(context)
                                        .requestFocus(new FocusNode());
                                    date = (await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.now()))!;
                                    dateController.text =
                                        DateFormat("EEE MMM dd, yyyy").format(
                                            DateTime.parse(date.toString()));
                                    setState(() {
                                      date = DateFormat("yyyy-MM-dd").format(
                                              DateTime.parse(date.toString()))
                                          as DateTime;
                                    });
                                  },
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: "Please Enter Date")
                                  ])),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Shift",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              TextFormField(
                                controller: shiftController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Shift",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Shift";
                                  } else {
                                    return null;
                                  }
                                },
                              ),

                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Line",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: lineController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Line",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText: "Please Enter Line",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Po.No",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: poController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Po.No",
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText: "Please Enter Po.No",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
/************************************Trimming**************************************** */
                              const Center(
                                child: Text(
                                  "Trimming",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: AppColors.primaryColor,
                                    fontFamily: appFontFamily,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 35,
                              ),

                              Text(
                                "Frequency",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: trimmingWiFrequencyController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Once a Shift",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Avaibility of Wi",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: trimmingWiController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Avaibility of Wi",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText:
                                          "Please Enter Avaibility of Wi",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Crieteria",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                controller: trimmingWiCrieteriaController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Must be present",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10.0),
                                child: Divider(
                                  color: Colors.black,
                                  height: 2.0,
                                  thickness: 2.0,
                                ),
                              ),

                              Text(
                                "Frequency",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: trimmingPhysicalFrequencyController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "5 Piece per Shift ",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),

                              Text(
                                "Physical verification of union trimming & Blade replacing frequency",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: trimmingPhysicalObs1Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Observatiom 1 ",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText: "Please Enter Observatiom 1",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: trimmingPhysicalObs2Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Observatiom 2 ",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText: "Please Enter Observatiom 2 ",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: trimmingPhysicalObs3Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Observatiom 3 ",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText: "Please Enter Observatiom 3",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: trimmingPhysicalObs4Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Observatiom 4 ",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText: "Please Enter Observatiom 4",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: trimmingPhysicalObs5Controller,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText: "Please Enter Observatiom 5 ",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText: "Please Enter Observatiom 5",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Criteria",
                                style: AppStyles.textfieldCaptionTextStyle,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: trimmingPhysicalCriteriaController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration:
                                    AppStyles.textFieldInputDecoration.copyWith(
                                  hintText:
                                      "Uniform Trimming Without any burr & residue ",
                                  counterText: '',
                                ),
                                style: AppStyles.textInputTextStyle,
                                readOnly: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),

                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                              _isLoading
                                  ? Center(child: CircularProgressIndicator())
                                  : AppButton(
                                      textStyle: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.white,
                                        fontSize: 16,
                                      ),
                                      onTap: () {
                                        AppHelper.hideKeyboard(context);
                                        createData();
                                        print(
                                            trimmingPhysicalFrequencyController
                                                .text);
                                        // sendDataToBackend();

                                        _registerFormKey.currentState!.save;
                                        if (_registerFormKey.currentState!
                                            .validate()) {}
                                        setState(() {
                                          setPage = 'postlamvisualinspection';
                                        });
                                      },
                                      label: "Next",
                                      organization: '',
                                    ),
                              const SizedBox(
                                height: 10,
                              ),
                              // Center(
                              //   child: Padding(
                              //     padding: const EdgeInsets.all(8.0),
                              //     child: InkWell(
                              //       onTap: () {
                              //         // Navigator.of(context).pushReplacement(
                              //         //     MaterialPageRoute(
                              //         //         builder: (BuildContext context) =>
                              //         //             LoginPage(
                              //         //                 appName: widget.appName)));
                              //       },
                              //       child: Text(
                              //         "BACK",
                              //         style: TextStyle(
                              //           fontFamily: appFontFamily,
                              //           fontSize: 16,
                              //           fontWeight: FontWeight.w500,
                              //           color: AppColors.redColor,
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              const SizedBox(
                                height: 25,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Powered By Gautam Solar Pvt. Ltd.",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: appFontFamily,
                                        color: AppColors.greyColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : setPage == "postlamvisualinspection"
                    /************Post Lam Visual Inspection****************** */
                    ? Stack(
                        alignment: Alignment.center,
                        fit: StackFit.expand,
                        children: [
                          SingleChildScrollView(
                            child: Form(
                              //  key: _registerFormKey,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          AppAssets.imgLogo,
                                          height: 100,
                                          width: 230,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Center(
                                      child: Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Text(
                                              "Incoming Production Quality Control",
                                              style: TextStyle(
                                                  fontSize: 27,
                                                  color: AppColors.black,
                                                  fontFamily: appFontFamily,
                                                  fontWeight:
                                                      FontWeight.w700)))),
                                  const Center(
                                      child: Text("(Post Lam IPQC Checklist)",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: AppColors.black,
                                              fontFamily: appFontFamily,
                                              fontWeight: FontWeight.w700))),
                                  const SizedBox(
                                    height: 35,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Document No : ',
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        'GSPL/IPQC/IPC/003',
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Rev.No. / Rev. Date : ',
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        'Ver.2.0 / 20-03-2024',
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Center(
                                      child: Text("Post Lam Visual Inspection",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Color.fromARGB(
                                                  255, 13, 160, 0),
                                              fontFamily: appFontFamily,
                                              fontWeight: FontWeight.w700))),
                                  const SizedBox(
                                    height: 20,
                                  ),

                                  Text(
                                    "Frequency",
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    controller: postLamWiFrequencyController,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Once a Shift",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    readOnly: true,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Avaibility of Wi & Crieteria",
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    controller: postLamWiController,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText:
                                          "Please Enter Avaibility of Wi & Crieteria",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    validator: MultiValidator(
                                      [
                                        RequiredValidator(
                                          errorText:
                                              "Please Enter Avaibility of Wi & Crieteria",
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Crieteria",
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    controller: postLamWiCrieteriaController,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Must be present",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    readOnly: true,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(vertical: 10.0),
                                    child: Divider(
                                      color: Colors.black,
                                      height: 2.0,
                                      thickness: 2.0,
                                    ),
                                  ),

                                  Text(
                                    "Frequency",
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller:
                                        postLamVisualFrequencyController,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "5 Piece per Shift ",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    readOnly: true,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Visual Defects",
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: postLamVisualObs1Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Please Enter Observation 1 ",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    validator: MultiValidator(
                                      [
                                        RequiredValidator(
                                          errorText:
                                              "Please Enter Observation 1",
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: postLamVisualObs2Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Please Enter Observation 2 ",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    validator: MultiValidator(
                                      [
                                        RequiredValidator(
                                          errorText:
                                              "Please Enter Observation 2",
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: postLamVisualObs3Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Please Enter Observation 3 ",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    validator: MultiValidator(
                                      [
                                        RequiredValidator(
                                          errorText:
                                              "Please Enter Observation 3",
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: postLamVisualObs4Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Please Enter Observation 4 ",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    validator: MultiValidator(
                                      [
                                        RequiredValidator(
                                          errorText:
                                              "Please Enter Observation 4",
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller: postLamVisualObs5Controller,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText: "Please Enter Observation 5 ",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    validator: MultiValidator(
                                      [
                                        RequiredValidator(
                                          errorText: "Please Enter 5",
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Criteria",
                                    style: AppStyles.textfieldCaptionTextStyle,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller:
                                        postLamVisualCrieteriaController,
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: AppStyles
                                        .textFieldInputDecoration
                                        .copyWith(
                                      hintText:
                                          "As per Visual inspection crieteria:GSPI/IPQC/VI/021 ",
                                      counterText: '',
                                    ),
                                    style: AppStyles.textInputTextStyle,
                                    readOnly: true,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),

                                  Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 10, 0, 0)),
                                  _isLoading
                                      ? Center(
                                          child: CircularProgressIndicator())
                                      : AppButton(
                                          textStyle: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.white,
                                            fontSize: 16,
                                          ),
                                          onTap: () {
                                            AppHelper.hideKeyboard(context);
                                            createData();
                                            // sendDataToBackend();

                                            // _registerFormKey.currentState!.save;
                                            // if (_registerFormKey.currentState!
                                            //     .validate()) {
                                            //   sendDataToBackend();
                                            // }
                                            setState(() {
                                              setPage = "framing";
                                            });
                                            print("Page set");
                                            print(setPage);
                                          },
                                          label: "Next",
                                          organization: '',
                                        ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  // Center(
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.all(8.0),
                                  //     child: InkWell(
                                  //       onTap: () {
                                  //         // Navigator.of(context).pushReplacement(
                                  //         //     MaterialPageRoute(
                                  //         //         builder: (BuildContext context) =>
                                  //         //             LoginPage(
                                  //         //                 appName: widget.appName)));
                                  //       },
                                  //       child: Text(
                                  //         "BACK",
                                  //         style: TextStyle(
                                  //           fontFamily: appFontFamily,
                                  //           fontSize: 16,
                                  //           fontWeight: FontWeight.w500,
                                  //           color: AppColors.redColor,
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            setPage = "trimming";
                                          });
                                          // Navigator.of(context).pushReplacement(
                                          //     MaterialPageRoute(
                                          //         builder: (BuildContext context) =>
                                          //             LoginPage(
                                          //                 appName: widget.appName)));
                                        },
                                        child: const Text(
                                          "BACK",
                                          style: TextStyle(
                                              fontFamily: appFontFamily,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.redColor),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    child: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Powered By Gautam Solar Pvt. Ltd.",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: appFontFamily,
                                            color: AppColors.greyColor,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : setPage == "framing"
                        /******************Framing********************* */
                        ? Stack(
                            alignment: Alignment.center,
                            fit: StackFit.expand,
                            children: [
                              SingleChildScrollView(
                                child: Form(
                                  //  key: _registerFormKey,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              AppAssets.imgLogo,
                                              height: 100,
                                              width: 230,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Center(
                                          child: Padding(
                                              padding: EdgeInsets.only(top: 10),
                                              child: Text(
                                                  "Incoming Production Quality Control",
                                                  style: TextStyle(
                                                      fontSize: 27,
                                                      color: AppColors.black,
                                                      fontFamily: appFontFamily,
                                                      fontWeight:
                                                          FontWeight.w700)))),
                                      const Center(
                                          child: Text(
                                              "(Post Lam IPQC Checklist)",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: AppColors.black,
                                                  fontFamily: appFontFamily,
                                                  fontWeight:
                                                      FontWeight.w700))),
                                      const SizedBox(
                                        height: 35,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Document No : ',
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            'GSPL/IPQC/IPC/003',
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Rev.No. / Rev. Date : ',
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            'Ver.2.0 / 20-03-2024',
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      const Center(
                                          child: Text("Framing",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Color.fromARGB(
                                                      255, 13, 160, 0),
                                                  fontFamily: appFontFamily,
                                                  fontWeight:
                                                      FontWeight.w700))),
                                      const SizedBox(
                                        height: 20,
                                      ),

                                      Text(
                                        "Frequency",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingWiFrequencyController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Once a Shift",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: true,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Avaibility of Wi & Sealant Weight Specification",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller: framingWiController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Please Enter Obsevation",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Obsevation ",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Crieteria",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingWiCrieteriaController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Must be present",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: true,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Divider(
                                          color: Colors.black,
                                          height: 2.0,
                                          thickness: 2.0,
                                        ),
                                      ),
                                      // glue uniformely

                                      Text(
                                        "Frequency",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingGlueUniFrequencyController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "5 Piece per Shift ",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: true,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Glue uniformity & continuty in frame group",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingGlueUniObs1Controller,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText:
                                              "Please Enter Observation 1 ",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Observation 1",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingGlueUniObs2Controller,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText:
                                              "Please Enter Observation 2 ",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Observation 2",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingGlueUniObs3Controller,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText:
                                              "Please Enter Observation 3 ",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Observation 3",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingGlueUniObs4Controller,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText:
                                              "Please Enter Observation 4",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Observation 4",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingGlueUniObs5Controller,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText:
                                              "Please Enter Observation 5 ",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Observation 5",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Criteria",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingGlueUniCrieteriaController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText:
                                              "Should be continuos & uniform , No gap between frame & backsheet ",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: true,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Divider(
                                          color: Colors.black,
                                          height: 2.0,
                                          thickness: 2.0,
                                        ),
                                      ),
                                      // Glue Weight

                                      Text(
                                        "Frequency",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingGlueWeightFrequencyController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Once a Shift",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: true,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),

                                      Text(
                                        "Glue Wieght",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller: framingGlueWeightController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Please Enter Obsevation",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Obsevation ",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Crieteria",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingGlueWeightCrieteriaController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "As Per GSPL/IPQC/FG/013",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: true,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Divider(
                                          color: Colors.black,
                                          height: 2.0,
                                          thickness: 2.0,
                                        ),
                                      ),
                                      // Corner Gap

                                      Text(
                                        "Frequency",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingCornerFrequencyController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "5 piece per Shift",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: true,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Corner Gap",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller: framingCornerObs1Controller,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Please Enter Obsevation 1",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Obsevation 1",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller: framingCornerObs2Controller,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Please Enter Obsevation 2",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Obsevation 2 ",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller: framingCornerObs3Controller,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Please Enter Obsevation 3",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Obsevation 3 ",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller: framingCornerObs4Controller,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Please Enter Obsevation 4",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Obsevation 4 ",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller: framingCornerObs5Controller,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Please Enter Obsevation 5",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Obsevation 5 ",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Crieteria",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingCornerCrieteriaController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText:
                                              "No Corner Gap,No overlapping",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: true,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Divider(
                                          color: Colors.black,
                                          height: 2.0,
                                          thickness: 2.0,
                                        ),
                                      ),

                                      // Top & Button cut length

                                      Text(
                                        "Frequency",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingTopFrequencyController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Once a Shift",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: true,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Top & Button cut Length side cut length",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller: framingTopController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Please Enter Obsevation",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Obsevation ",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Crieteria",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingTopCrieteriaController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "As per PO or process card",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: true,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Divider(
                                          color: Colors.black,
                                          height: 2.0,
                                          thickness: 2.0,
                                        ),
                                      ),

                                      // Mounting hole x,y pitch

                                      Text(
                                        "Frequency",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingMountingFrequencyController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Once a Shift",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: true,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Mounting hole x,y pitch",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller: framingMountingController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Please Enter Obsevation",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Obsevation ",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Crieteria",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingMountingCrieteriaController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "+-1mm",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: true,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Divider(
                                          color: Colors.black,
                                          height: 2.0,
                                          thickness: 2.0,
                                        ),
                                      ),

                                      // Anodizing thickness

                                      Text(
                                        "Frequency",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingAnodizingFrequencyController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Once a Shift",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: true,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Anodizing Thickness",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller: framingAnodizingController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: "Please Enter Obsevation",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        validator: MultiValidator(
                                          [
                                            RequiredValidator(
                                              errorText:
                                                  "Please Enter Obsevation ",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "Crieteria",
                                        style:
                                            AppStyles.textfieldCaptionTextStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        controller:
                                            framingAnodizingCrieteriaController,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: AppStyles
                                            .textFieldInputDecoration
                                            .copyWith(
                                          hintText: ">=15 micron",
                                          counterText: '',
                                        ),
                                        style: AppStyles.textInputTextStyle,
                                        readOnly: true,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),

                                      Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 10, 0, 0)),
                                      _isLoading
                                          ? Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : AppButton(
                                              textStyle: const TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.white,
                                                fontSize: 16,
                                              ),
                                              onTap: () {
                                                AppHelper.hideKeyboard(context);
                                                // sendDataToBackend();

                                                // _registerFormKey
                                                //     .currentState!.save;
                                                // if (_registerFormKey
                                                //     .currentState!
                                                //     .validate()) {
                                                //   // sendDataToBackend();
                                                // }
                                                setState(() {
                                                  setPage = 'junctionbox';
                                                });
                                              },
                                              label: "Next",
                                              organization: '',
                                            ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      // Center(
                                      //   child: Padding(
                                      //     padding: const EdgeInsets.all(8.0),
                                      //     child: InkWell(
                                      //       onTap: () {
                                      //         // Navigator.of(context).pushReplacement(
                                      //         //     MaterialPageRoute(
                                      //         //         builder: (BuildContext context) =>
                                      //         //             LoginPage(
                                      //         //                 appName: widget.appName)));
                                      //       },
                                      //       child: Text(
                                      //         "BACK",
                                      //         style: TextStyle(
                                      //           fontFamily: appFontFamily,
                                      //           fontSize: 16,
                                      //           fontWeight: FontWeight.w500,
                                      //           color: AppColors.redColor,
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                setPage =
                                                    "postlamvisualinspection";
                                              });
                                              // Navigator.of(context).pushReplacement(
                                              //     MaterialPageRoute(
                                              //         builder: (BuildContext context) =>
                                              //             LoginPage(
                                              //                 appName: widget.appName)));
                                            },
                                            child: const Text(
                                              "BACK",
                                              style: TextStyle(
                                                  fontFamily: appFontFamily,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.redColor),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        child: const Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Powered By Gautam Solar Pvt. Ltd.",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: appFontFamily,
                                                color: AppColors.greyColor,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        /*******************Junction Box Assembly************ */
                        : setPage == "junctionbox"
                            ? Stack(
                                alignment: Alignment.center,
                                fit: StackFit.expand,
                                children: [
                                  SingleChildScrollView(
                                    child: Form(
                                      //  key: _registerFormKey,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.center,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  AppAssets.imgLogo,
                                                  height: 100,
                                                  width: 230,
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Center(
                                              child: Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 10),
                                                  child: Text(
                                                      "Incoming Process Quality Control",
                                                      style: TextStyle(
                                                          fontSize: 27,
                                                          color:
                                                              AppColors.black,
                                                          fontFamily:
                                                              appFontFamily,
                                                          fontWeight: FontWeight
                                                              .w700)))),
                                          const Center(
                                              child: Text(
                                                  "(Post Lam IPQC Checklist)",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: AppColors.black,
                                                      fontFamily: appFontFamily,
                                                      fontWeight:
                                                          FontWeight.w700))),
                                          const SizedBox(
                                            height: 35,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Document No : ',
                                                style: AppStyles
                                                    .textfieldCaptionTextStyle,
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                'GSPL/IPQC/IPC/003',
                                                style: AppStyles
                                                    .textfieldCaptionTextStyle,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Rev.No. / Rev. Date : ',
                                                style: AppStyles
                                                    .textfieldCaptionTextStyle,
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                'Ver.2.0 / 20-03-2024',
                                                style: AppStyles
                                                    .textfieldCaptionTextStyle,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          const Center(
                                              child: Text(
                                                  "Junction Box Assembly",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Color.fromARGB(
                                                          255, 13, 160, 0),
                                                      fontFamily: appFontFamily,
                                                      fontWeight:
                                                          FontWeight.w700))),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          // Availability of WI
                                          Text(
                                            "Frequency",
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                            controller:
                                                junctionWiFrequencyController,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText: "Once a Shift",
                                              counterText: '',
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            readOnly: true,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Avaibility of Wi & Sealant Weight Specification",
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                            controller: junctionWiController,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText:
                                                  "Please Enter Obsevation",
                                              counterText: '',
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            validator: MultiValidator(
                                              [
                                                RequiredValidator(
                                                  errorText:
                                                      "Please Enter Obsevation ",
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Crieteria",
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                            controller:
                                                junctionWiCrieteriaController,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText: "Must be present",
                                              counterText: '',
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            readOnly: true,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: Divider(
                                              color: Colors.black,
                                              height: 2.0,
                                              thickness: 2.0,
                                            ),
                                          ),
                                          // glue arroud jb

                                          Text(
                                            "Frequency",
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          TextFormField(
                                            controller:
                                                junctionGlueFrequencyController,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText: "5 Piece per Shift ",
                                              counterText: '',
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            readOnly: true,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Glue around JB",
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          TextFormField(
                                            controller:
                                                junctionGlueObs1Controller,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText:
                                                  "Please Enter Observation 1 ",
                                              counterText: '',
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            validator: MultiValidator(
                                              [
                                                RequiredValidator(
                                                  errorText:
                                                      "Please Enter Observation 1",
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          TextFormField(
                                            controller:
                                                junctionGlueObs2Controller,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText:
                                                  "Please Enter Observation 2 ",
                                              counterText: '',
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            validator: MultiValidator(
                                              [
                                                RequiredValidator(
                                                  errorText:
                                                      "Please Enter Observation 2",
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          TextFormField(
                                            controller:
                                                junctionGlueObs3Controller,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText:
                                                  "Please Enter Observation 3 ",
                                              counterText: '',
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            validator: MultiValidator(
                                              [
                                                RequiredValidator(
                                                  errorText:
                                                      "Please Enter Observation 3",
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          TextFormField(
                                            controller:
                                                junctionGlueObs4Controller,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText:
                                                  "Please Enter Observation 4",
                                              counterText: '',
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            validator: MultiValidator(
                                              [
                                                RequiredValidator(
                                                  errorText:
                                                      "Please Enter Observation 4",
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          TextFormField(
                                            controller:
                                                junctionGlueObs5Controller,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText:
                                                  "Please Enter Observation 5 ",
                                              counterText: '',
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            validator: MultiValidator(
                                              [
                                                RequiredValidator(
                                                  errorText:
                                                      "Please Enter Observation 5",
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Criteria",
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          TextFormField(
                                            controller:
                                                junctionGlueCrieteriaController,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText:
                                                  "Should be continuos & uniform , No gap between frame & backsheet ",
                                              counterText: '',
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            readOnly: true,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: Divider(
                                              color: Colors.black,
                                              height: 2.0,
                                              thickness: 2.0,
                                            ),
                                          ),
                                          // JB Lit

                                          Text(
                                            "Frequency",
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                            controller:
                                                junctionJbFrequencyController,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText:
                                                  "5 Piece per Shift Shift",
                                              counterText: '',
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            readOnly: true,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),

                                          Text(
                                            "JB tilt",
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                            controller:
                                                junctionJbObs1Controller,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText:
                                                  "Please Enter Obsevation1",
                                              counterText: '',
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            validator: MultiValidator(
                                              [
                                                RequiredValidator(
                                                  errorText:
                                                      "Please Enter Obsevation 1",
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          TextFormField(
                                            controller:
                                                junctionJbObs2Controller,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText:
                                                  "Please Enter Obsevation 2",
                                              counterText: '',
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            validator: MultiValidator(
                                              [
                                                RequiredValidator(
                                                  errorText:
                                                      "Please Enter Obsevation 2 ",
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          TextFormField(
                                            controller:
                                                junctionJbObs3Controller,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText:
                                                  "Please Enter Obsevation 3",
                                              counterText: '',
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            validator: MultiValidator(
                                              [
                                                RequiredValidator(
                                                  errorText:
                                                      "Please Enter Obsevation 3",
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          TextFormField(
                                            controller:
                                                junctionGlueObs4Controller,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText:
                                                  "Please Enter Obsevation 4",
                                              counterText: '',
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            validator: MultiValidator(
                                              [
                                                RequiredValidator(
                                                  errorText:
                                                      "Please Enter Obsevation 4 ",
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          TextFormField(
                                            controller:
                                                junctionJbObs5Controller,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText:
                                                  "Please Enter Obsevation 5",
                                              counterText: '',
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            validator: MultiValidator(
                                              [
                                                RequiredValidator(
                                                  errorText:
                                                      "Please Enter Obsevation 5",
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Crieteria",
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                            controller:
                                                junctionJbCrieteriaController,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText: "NO Tilting",
                                              counterText: '',
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            readOnly: true,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: Divider(
                                              color: Colors.black,
                                              height: 2.0,
                                              thickness: 2.0,
                                            ),
                                          ),
                                          //Junc Glue Weight

                                          Text(
                                            "Frequency",
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                            controller:
                                                junctionGlueWeightFrequencyController,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText: "Once per Shift",
                                              counterText: '',
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            readOnly: true,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Glue Weight",
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                            controller:
                                                junctionGlueWeightController,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText:
                                                  "Please Enter Obsevation ",
                                              counterText: '',
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            validator: MultiValidator(
                                              [
                                                RequiredValidator(
                                                  errorText:
                                                      "Please Enter Obsevation ",
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),

                                          Text(
                                            "Crieteria",
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                            controller:
                                                junctionGlueWeightCrieteriaController,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText:
                                                  "As per GSPL/IPQC/JB/014",
                                              counterText: '',
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            readOnly: true,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: Divider(
                                              color: Colors.black,
                                              height: 2.0,
                                              thickness: 2.0,
                                            ),
                                          ),

                                          // Glue(Base+Catalyst)potting ratio and weight

                                          Text(
                                            "Frequency",
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                            controller:
                                                junctionGlueRatioFrequencyController,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText: "Once a Shift",
                                              counterText: '',
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            readOnly: true,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Glue(Base+Catalyst) potting Ratio & Weight",
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                            controller:
                                                junctionGlueRatioController,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText:
                                                  "Please Enter Obsevation",
                                              counterText: '',
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            validator: MultiValidator(
                                              [
                                                RequiredValidator(
                                                  errorText:
                                                      "Please Enter Obsevation ",
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Crieteria",
                                            style: AppStyles
                                                .textfieldCaptionTextStyle,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                            controller:
                                                junctionGlueRatioCrieteriaController,
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            decoration: AppStyles
                                                .textFieldInputDecoration
                                                .copyWith(
                                              hintText:
                                                  "As per GSPL/IPQC/JB/015",
                                              counterText: '',
                                            ),
                                            style: AppStyles.textInputTextStyle,
                                            readOnly: true,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),

                                          Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 10, 0, 0)),
                                          _isLoading
                                              ? Center(
                                                  child:
                                                      CircularProgressIndicator())
                                              : AppButton(
                                                  textStyle: const TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    color: AppColors.white,
                                                    fontSize: 16,
                                                  ),
                                                  onTap: () {
                                                    AppHelper.hideKeyboard(
                                                        context);
                                                    // sendDataToBackend();

                                                    // _registerFormKey
                                                    //     .currentState!.save;
                                                    // if (_registerFormKey
                                                    //     .currentState!
                                                    //     .validate()) {
                                                    //   // sendDataToBackend();
                                                    // }
                                                    setState(() {
                                                      setPage = 'curing';
                                                    });
                                                  },
                                                  label: "Next",
                                                  organization: '',
                                                ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          // Center(
                                          //   child: Padding(
                                          //     padding: const EdgeInsets.all(8.0),
                                          //     child: InkWell(
                                          //       onTap: () {
                                          //         // Navigator.of(context).pushReplacement(
                                          //         //     MaterialPageRoute(
                                          //         //         builder: (BuildContext context) =>
                                          //         //             LoginPage(
                                          //         //                 appName: widget.appName)));
                                          //       },
                                          //       child: Text(
                                          //         "BACK",
                                          //         style: TextStyle(
                                          //           fontFamily: appFontFamily,
                                          //           fontSize: 16,
                                          //           fontWeight: FontWeight.w500,
                                          //           color: AppColors.redColor,
                                          //         ),
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                          Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    setPage = "framing";
                                                  });
                                                  // Navigator.of(context).pushReplacement(
                                                  //     MaterialPageRoute(
                                                  //         builder: (BuildContext context) =>
                                                  //             LoginPage(
                                                  //                 appName: widget.appName)));
                                                },
                                                child: const Text(
                                                  "BACK",
                                                  style: TextStyle(
                                                      fontFamily: appFontFamily,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          AppColors.redColor),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            child: const Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Powered By Gautam Solar Pvt. Ltd.",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: appFontFamily,
                                                    color: AppColors.greyColor,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            /***************Curing********************* */
                            : setPage == "curing"
                                ? Stack(
                                    alignment: Alignment.center,
                                    fit: StackFit.expand,
                                    children: [
                                      SingleChildScrollView(
                                        child: Form(
                                          //  key: _registerFormKey,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                alignment: Alignment.center,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      AppAssets.imgLogo,
                                                      height: 100,
                                                      width: 230,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const Center(
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 10),
                                                      child: Text(
                                                          "Incoming Process Quality Control",
                                                          style: TextStyle(
                                                              fontSize: 27,
                                                              color: AppColors
                                                                  .black,
                                                              fontFamily:
                                                                  appFontFamily,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700)))),
                                              const Center(
                                                  child: Text(
                                                      "(Post Lam IPQC Checklist)",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color:
                                                              AppColors.black,
                                                          fontFamily:
                                                              appFontFamily,
                                                          fontWeight: FontWeight
                                                              .w700))),
                                              const SizedBox(
                                                height: 35,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Document No : ',
                                                    style: AppStyles
                                                        .textfieldCaptionTextStyle,
                                                  ),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    'GSPL/IPQC/IPC/003',
                                                    style: AppStyles
                                                        .textfieldCaptionTextStyle,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Rev.No. / Rev. Date : ',
                                                    style: AppStyles
                                                        .textfieldCaptionTextStyle,
                                                  ),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    'Ver.2.0 / 20-03-2024',
                                                    style: AppStyles
                                                        .textfieldCaptionTextStyle,
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              const Center(
                                                  child: Text("Curing",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Color.fromARGB(
                                                              255, 13, 160, 0),
                                                          fontFamily:
                                                              appFontFamily,
                                                          fontWeight: FontWeight
                                                              .w700))),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              // Curing Availability of WI
                                              Text(
                                                "Frequency",
                                                style: AppStyles
                                                    .textfieldCaptionTextStyle,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              TextFormField(
                                                controller:
                                                    curingWiFrequencyController,
                                                keyboardType:
                                                    TextInputType.text,
                                                textInputAction:
                                                    TextInputAction.next,
                                                decoration: AppStyles
                                                    .textFieldInputDecoration
                                                    .copyWith(
                                                  hintText: "Once a Shift",
                                                  counterText: '',
                                                ),
                                                style: AppStyles
                                                    .textInputTextStyle,
                                                readOnly: true,
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                "Avaibility of Wi ",
                                                style: AppStyles
                                                    .textfieldCaptionTextStyle,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              TextFormField(
                                                controller: curingWiController,
                                                keyboardType:
                                                    TextInputType.text,
                                                textInputAction:
                                                    TextInputAction.next,
                                                decoration: AppStyles
                                                    .textFieldInputDecoration
                                                    .copyWith(
                                                  hintText:
                                                      "Please Enter Obsevation",
                                                  counterText: '',
                                                ),
                                                style: AppStyles
                                                    .textInputTextStyle,
                                                validator: MultiValidator(
                                                  [
                                                    RequiredValidator(
                                                      errorText:
                                                          "Please Enter Obsevation ",
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                "Crieteria",
                                                style: AppStyles
                                                    .textfieldCaptionTextStyle,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              TextFormField(
                                                controller:
                                                    curingWiCrieteriaController,
                                                keyboardType:
                                                    TextInputType.text,
                                                textInputAction:
                                                    TextInputAction.next,
                                                decoration: AppStyles
                                                    .textFieldInputDecoration
                                                    .copyWith(
                                                  hintText: "Must be present",
                                                  counterText: '',
                                                ),
                                                style: AppStyles
                                                    .textInputTextStyle,
                                                readOnly: true,
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 10.0),
                                                child: Divider(
                                                  color: Colors.black,
                                                  height: 2.0,
                                                  thickness: 2.0,
                                                ),
                                              ),
                                              // Curing Time

                                              Text(
                                                "Frequency",
                                                style: AppStyles
                                                    .textfieldCaptionTextStyle,
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              TextFormField(
                                                controller:
                                                    curingTimeFrequencyController,
                                                keyboardType:
                                                    TextInputType.text,
                                                textInputAction:
                                                    TextInputAction.next,
                                                decoration: AppStyles
                                                    .textFieldInputDecoration
                                                    .copyWith(
                                                  hintText:
                                                      "one Piece  per Shift ",
                                                  counterText: '',
                                                ),
                                                style: AppStyles
                                                    .textInputTextStyle,
                                                readOnly: true,
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                "Curing Time",
                                                style: AppStyles
                                                    .textfieldCaptionTextStyle,
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              TextFormField(
                                                controller:
                                                    curingTimeController,
                                                keyboardType:
                                                    TextInputType.text,
                                                textInputAction:
                                                    TextInputAction.next,
                                                decoration: AppStyles
                                                    .textFieldInputDecoration
                                                    .copyWith(
                                                  hintText:
                                                      "Please Enter Observation",
                                                  counterText: '',
                                                ),
                                                style: AppStyles
                                                    .textInputTextStyle,
                                                validator: MultiValidator(
                                                  [
                                                    RequiredValidator(
                                                      errorText:
                                                          "Please Enter Observation",
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),

                                              Text(
                                                "Criteria",
                                                style: AppStyles
                                                    .textfieldCaptionTextStyle,
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              TextFormField(
                                                controller:
                                                    curingTimeCrieteriaController,
                                                keyboardType:
                                                    TextInputType.text,
                                                textInputAction:
                                                    TextInputAction.next,
                                                decoration: AppStyles
                                                    .textFieldInputDecoration
                                                    .copyWith(
                                                  hintText: ">=4Hr ",
                                                  counterText: '',
                                                ),
                                                style: AppStyles
                                                    .textInputTextStyle,
                                                readOnly: true,
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 10.0),
                                                child: Divider(
                                                  color: Colors.black,
                                                  height: 2.0,
                                                  thickness: 2.0,
                                                ),
                                              ),
                                              // Temprature And Humadity

                                              Text(
                                                "Frequency",
                                                style: AppStyles
                                                    .textfieldCaptionTextStyle,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              TextFormField(
                                                controller:
                                                    curingTempFrequencyController,
                                                keyboardType:
                                                    TextInputType.text,
                                                textInputAction:
                                                    TextInputAction.next,
                                                decoration: AppStyles
                                                    .textFieldInputDecoration
                                                    .copyWith(
                                                  hintText:
                                                      "one piece per Shift",
                                                  counterText: '',
                                                ),
                                                style: AppStyles
                                                    .textInputTextStyle,
                                                readOnly: true,
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),

                                              Text(
                                                "Tempratue And Humadity",
                                                style: AppStyles
                                                    .textfieldCaptionTextStyle,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              TextFormField(
                                                controller:
                                                    curingTempController,
                                                keyboardType:
                                                    TextInputType.text,
                                                textInputAction:
                                                    TextInputAction.next,
                                                decoration: AppStyles
                                                    .textFieldInputDecoration
                                                    .copyWith(
                                                  hintText:
                                                      "Please Enter Obsevation",
                                                  counterText: '',
                                                ),
                                                style: AppStyles
                                                    .textInputTextStyle,
                                                validator: MultiValidator(
                                                  [
                                                    RequiredValidator(
                                                      errorText:
                                                          "Please Enter Obsevation ",
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),

                                              Text(
                                                "Crieteria",
                                                style: AppStyles
                                                    .textfieldCaptionTextStyle,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              TextFormField(
                                                controller:
                                                    curingTempCrieteriaController,
                                                keyboardType:
                                                    TextInputType.text,
                                                textInputAction:
                                                    TextInputAction.next,
                                                decoration: AppStyles
                                                    .textFieldInputDecoration
                                                    .copyWith(
                                                  hintText: "25+-oc&>=50%RH",
                                                  counterText: '',
                                                ),
                                                style: AppStyles
                                                    .textInputTextStyle,
                                                readOnly: true,
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),

                                              Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 10, 0, 0)),
                                              _isLoading
                                                  ? Center(
                                                      child:
                                                          CircularProgressIndicator())
                                                  : AppButton(
                                                      textStyle:
                                                          const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: AppColors.white,
                                                        fontSize: 16,
                                                      ),
                                                      onTap: () {
                                                        AppHelper.hideKeyboard(
                                                            context);
                                                        // sendDataToBackend();

                                                        // _registerFormKey
                                                        //     .currentState!.save;
                                                        // if (_registerFormKey
                                                        //     .currentState!
                                                        //     .validate()) {
                                                        //   // sendDataToBackend();
                                                        // }
                                                        setState(() {
                                                          setPage = 'buffing';
                                                        });
                                                      },
                                                      label: "Next",
                                                      organization: '',
                                                    ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              // Center(
                                              //   child: Padding(
                                              //     padding: const EdgeInsets.all(8.0),
                                              //     child: InkWell(
                                              //       onTap: () {
                                              //         // Navigator.of(context).pushReplacement(
                                              //         //     MaterialPageRoute(
                                              //         //         builder: (BuildContext context) =>
                                              //         //             LoginPage(
                                              //         //                 appName: widget.appName)));
                                              //       },
                                              //       child: Text(
                                              //         "BACK",
                                              //         style: TextStyle(
                                              //           fontFamily: appFontFamily,
                                              //           fontSize: 16,
                                              //           fontWeight: FontWeight.w500,
                                              //           color: AppColors.redColor,
                                              //         ),
                                              //       ),
                                              //     ),
                                              //   ),
                                              // ),
                                              const SizedBox(
                                                height: 25,
                                              ),
                                              Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        setPage = "junctionbox";
                                                      });
                                                      // Navigator.of(context).pushReplacement(
                                                      //     MaterialPageRoute(
                                                      //         builder: (BuildContext context) =>
                                                      //             LoginPage(
                                                      //                 appName: widget.appName)));
                                                    },
                                                    child: const Text(
                                                      "BACK",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              appFontFamily,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColors
                                                              .redColor),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 25,
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                child: const Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Powered By Gautam Solar Pvt. Ltd.",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        fontFamily:
                                                            appFontFamily,
                                                        color:
                                                            AppColors.greyColor,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                /******************Bufffing */
                                : setPage == "buffing"
                                    ? Stack(
                                        alignment: Alignment.center,
                                        fit: StackFit.expand,
                                        children: [
                                          SingleChildScrollView(
                                            child: Form(
                                              //  key: _registerFormKey,
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    alignment: Alignment.center,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                          AppAssets.imgLogo,
                                                          height: 100,
                                                          width: 230,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const Center(
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 10),
                                                          child: Text(
                                                              "Incoming Process Quality Control",
                                                              style: TextStyle(
                                                                  fontSize: 27,
                                                                  color:
                                                                      AppColors
                                                                          .black,
                                                                  fontFamily:
                                                                      appFontFamily,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700)))),
                                                  const Center(
                                                      child: Text(
                                                          "(Post Lam IPQC Checklist)",
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color: AppColors
                                                                  .black,
                                                              fontFamily:
                                                                  appFontFamily,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700))),
                                                  const SizedBox(
                                                    height: 35,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Document No : ',
                                                        style: AppStyles
                                                            .textfieldCaptionTextStyle,
                                                      ),
                                                      const SizedBox(
                                                        width: 8,
                                                      ),
                                                      Text(
                                                        'GSPL/IPQC/IPC/003',
                                                        style: AppStyles
                                                            .textfieldCaptionTextStyle,
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Rev.No. / Rev. Date : ',
                                                        style: AppStyles
                                                            .textfieldCaptionTextStyle,
                                                      ),
                                                      const SizedBox(
                                                        width: 8,
                                                      ),
                                                      Text(
                                                        'Ver.2.0 / 20-03-2024',
                                                        style: AppStyles
                                                            .textfieldCaptionTextStyle,
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  const Center(
                                                      child: Text("Buffing",
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      13,
                                                                      160,
                                                                      0),
                                                              fontFamily:
                                                                  appFontFamily,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700))),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  // Buffing Availability of WI
                                                  Text(
                                                    "Frequency",
                                                    style: AppStyles
                                                        .textfieldCaptionTextStyle,
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  TextFormField(
                                                    controller:
                                                        buffingWiFrequencyController,
                                                    keyboardType:
                                                        TextInputType.text,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    decoration: AppStyles
                                                        .textFieldInputDecoration
                                                        .copyWith(
                                                      hintText: "Once a Shift",
                                                      counterText: '',
                                                    ),
                                                    style: AppStyles
                                                        .textInputTextStyle,
                                                    readOnly: true,
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  Text(
                                                    "Avaibility of Wi ",
                                                    style: AppStyles
                                                        .textfieldCaptionTextStyle,
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  TextFormField(
                                                    controller:
                                                        buffingWiController,
                                                    keyboardType:
                                                        TextInputType.text,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    decoration: AppStyles
                                                        .textFieldInputDecoration
                                                        .copyWith(
                                                      hintText:
                                                          "Please Enter Obsevation",
                                                      counterText: '',
                                                    ),
                                                    style: AppStyles
                                                        .textInputTextStyle,
                                                    validator: MultiValidator(
                                                      [
                                                        RequiredValidator(
                                                          errorText:
                                                              "Please Enter Obsevation ",
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  Text(
                                                    "Crieteria",
                                                    style: AppStyles
                                                        .textfieldCaptionTextStyle,
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  TextFormField(
                                                    controller:
                                                        buffingWiCrieteriaController,
                                                    keyboardType:
                                                        TextInputType.text,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    decoration: AppStyles
                                                        .textFieldInputDecoration
                                                        .copyWith(
                                                      hintText:
                                                          "Must be present",
                                                      counterText: '',
                                                    ),
                                                    style: AppStyles
                                                        .textInputTextStyle,
                                                    readOnly: true,
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10.0),
                                                    child: Divider(
                                                      color: Colors.black,
                                                      height: 2.0,
                                                      thickness: 2.0,
                                                    ),
                                                  ),
                                                  // Edge of corner, Buffing belt condition

                                                  Text(
                                                    "Frequency",
                                                    style: AppStyles
                                                        .textfieldCaptionTextStyle,
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  TextFormField(
                                                    controller:
                                                        buffingEdgeFrequencyController,
                                                    keyboardType:
                                                        TextInputType.text,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    decoration: AppStyles
                                                        .textFieldInputDecoration
                                                        .copyWith(
                                                      hintText:
                                                          "5 Piece  per Shift ",
                                                      counterText: '',
                                                    ),
                                                    style: AppStyles
                                                        .textInputTextStyle,
                                                    readOnly: true,
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  Text(
                                                    "Edge of corner, Buffing belt condition",
                                                    style: AppStyles
                                                        .textfieldCaptionTextStyle,
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  TextFormField(
                                                    controller:
                                                        buffingEdseObs1Controller,
                                                    keyboardType:
                                                        TextInputType.text,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    decoration: AppStyles
                                                        .textFieldInputDecoration
                                                        .copyWith(
                                                      hintText:
                                                          "Please Enter Observation 1 ",
                                                      counterText: '',
                                                    ),
                                                    style: AppStyles
                                                        .textInputTextStyle,
                                                    validator: MultiValidator(
                                                      [
                                                        RequiredValidator(
                                                          errorText:
                                                              "Please Enter Observation 1",
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  TextFormField(
                                                    controller:
                                                        buffingEdseObs2Controller,
                                                    keyboardType:
                                                        TextInputType.text,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    decoration: AppStyles
                                                        .textFieldInputDecoration
                                                        .copyWith(
                                                      hintText:
                                                          "Please Enter Observation 2 ",
                                                      counterText: '',
                                                    ),
                                                    style: AppStyles
                                                        .textInputTextStyle,
                                                    validator: MultiValidator(
                                                      [
                                                        RequiredValidator(
                                                          errorText:
                                                              "Please Enter Observation 2",
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  TextFormField(
                                                    controller:
                                                        buffingEdseObs3Controller,
                                                    keyboardType:
                                                        TextInputType.text,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    decoration: AppStyles
                                                        .textFieldInputDecoration
                                                        .copyWith(
                                                      hintText:
                                                          "Please Enter Observation 3 ",
                                                      counterText: '',
                                                    ),
                                                    style: AppStyles
                                                        .textInputTextStyle,
                                                    validator: MultiValidator(
                                                      [
                                                        RequiredValidator(
                                                          errorText:
                                                              "Please Enter Observation 3",
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  TextFormField(
                                                    controller:
                                                        buffingEdseObs4Controller,
                                                    keyboardType:
                                                        TextInputType.text,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    decoration: AppStyles
                                                        .textFieldInputDecoration
                                                        .copyWith(
                                                      hintText:
                                                          "Please Enter Observation 4 ",
                                                      counterText: '',
                                                    ),
                                                    style: AppStyles
                                                        .textInputTextStyle,
                                                    validator: MultiValidator(
                                                      [
                                                        RequiredValidator(
                                                          errorText:
                                                              "Please Enter Observation 4",
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  TextFormField(
                                                    controller:
                                                        buffingEdseObs5Controller,
                                                    keyboardType:
                                                        TextInputType.text,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    decoration: AppStyles
                                                        .textFieldInputDecoration
                                                        .copyWith(
                                                      hintText:
                                                          "Please Enter Observation 5 ",
                                                      counterText: '',
                                                    ),
                                                    style: AppStyles
                                                        .textInputTextStyle,
                                                    validator: MultiValidator(
                                                      [
                                                        RequiredValidator(
                                                          errorText:
                                                              "Please Enter Observation 5",
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),

                                                  Text(
                                                    "Criteria",
                                                    style: AppStyles
                                                        .textfieldCaptionTextStyle,
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  TextFormField(
                                                    controller:
                                                        buffingEdgeFrequencyController,
                                                    keyboardType:
                                                        TextInputType.text,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    decoration: AppStyles
                                                        .textFieldInputDecoration
                                                        .copyWith(
                                                      hintText:
                                                          "Should not be sharp & Buffing belt should be properly working ",
                                                      counterText: '',
                                                    ),
                                                    style: AppStyles
                                                        .textInputTextStyle,
                                                    readOnly: true,
                                                  ),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),

                                                  Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 10, 0, 0)),
                                                  _isLoading
                                                      ? Center(
                                                          child:
                                                              CircularProgressIndicator())
                                                      : AppButton(
                                                          textStyle:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color:
                                                                AppColors.white,
                                                            fontSize: 16,
                                                          ),
                                                          onTap: () {
                                                            AppHelper
                                                                .hideKeyboard(
                                                                    context);
                                                            // sendDataToBackend();

                                                            // _registerFormKey
                                                            //     .currentState!
                                                            //     .save;
                                                            // if (_registerFormKey
                                                            //     .currentState!
                                                            //     .validate()) {
                                                            //   // sendDataToBackend();
                                                            // }
                                                            setState(() {
                                                              setPage =
                                                                  'sunsimulator';
                                                            });
                                                          },
                                                          label: "Next",
                                                          organization: '',
                                                        ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  // Center(
                                                  //   child: Padding(
                                                  //     padding: const EdgeInsets.all(8.0),
                                                  //     child: InkWell(
                                                  //       onTap: () {
                                                  //         // Navigator.of(context).pushReplacement(
                                                  //         //     MaterialPageRoute(
                                                  //         //         builder: (BuildContext context) =>
                                                  //         //             LoginPage(
                                                  //         //                 appName: widget.appName)));
                                                  //       },
                                                  //       child: Text(
                                                  //         "BACK",
                                                  //         style: TextStyle(
                                                  //           fontFamily: appFontFamily,
                                                  //           fontSize: 16,
                                                  //           fontWeight: FontWeight.w500,
                                                  //           color: AppColors.redColor,
                                                  //         ),
                                                  //       ),
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                  const SizedBox(
                                                    height: 25,
                                                  ),
                                                  Center(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            setPage = "buffing";
                                                          });
                                                          // Navigator.of(context).pushReplacement(
                                                          //     MaterialPageRoute(
                                                          //         builder: (BuildContext context) =>
                                                          //             LoginPage(
                                                          //                 appName: widget.appName)));
                                                        },
                                                        child: const Text(
                                                          "BACK",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  appFontFamily,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: AppColors
                                                                  .redColor),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 25,
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    child: const Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "Powered By Gautam Solar Pvt. Ltd.",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontFamily:
                                                                appFontFamily,
                                                            color: AppColors
                                                                .greyColor,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      )

                                    /***************Sun Simulator calibration ******************* */

                                    : setPage == "sunsimulator"
                                        ? Stack(
                                            alignment: Alignment.center,
                                            fit: StackFit.expand,
                                            children: [
                                              SingleChildScrollView(
                                                child: Form(
                                                  //  key: _registerFormKey,
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Container(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Image.asset(
                                                              AppAssets.imgLogo,
                                                              height: 100,
                                                              width: 230,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const Center(
                                                          child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 10),
                                                              child: Text(
                                                                  "Incoming Process Quality Control",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          27,
                                                                      color: AppColors
                                                                          .black,
                                                                      fontFamily:
                                                                          appFontFamily,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700)))),
                                                      const Center(
                                                          child: Text(
                                                              "(Post Lam IPQC Checklist)",
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  color:
                                                                      AppColors
                                                                          .black,
                                                                  fontFamily:
                                                                      appFontFamily,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700))),
                                                      const SizedBox(
                                                        height: 35,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Document No : ',
                                                            style: AppStyles
                                                                .textfieldCaptionTextStyle,
                                                          ),
                                                          const SizedBox(
                                                            width: 8,
                                                          ),
                                                          Text(
                                                            'GSPL/IPQC/IPC/003',
                                                            style: AppStyles
                                                                .textfieldCaptionTextStyle,
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 8,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Rev.No. / Rev. Date : ',
                                                            style: AppStyles
                                                                .textfieldCaptionTextStyle,
                                                          ),
                                                          const SizedBox(
                                                            width: 8,
                                                          ),
                                                          Text(
                                                            'Ver.2.0 / 20-03-2024',
                                                            style: AppStyles
                                                                .textfieldCaptionTextStyle,
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                      const Center(
                                                          child: Text(
                                                              "Sun Simulator Calibration",
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          13,
                                                                          160,
                                                                          0),
                                                                  fontFamily:
                                                                      appFontFamily,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700))),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      // Sun SImulator Availability of WI
                                                      Text(
                                                        "Frequency",
                                                        style: AppStyles
                                                            .textfieldCaptionTextStyle,
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            sunWiFrequencyController,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        decoration: AppStyles
                                                            .textFieldInputDecoration
                                                            .copyWith(
                                                          hintText:
                                                              "Once a Shift",
                                                          counterText: '',
                                                        ),
                                                        style: AppStyles
                                                            .textInputTextStyle,
                                                        readOnly: true,
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                      Text(
                                                        "Avaibility of Wi ",
                                                        style: AppStyles
                                                            .textfieldCaptionTextStyle,
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            sunWiController,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        decoration: AppStyles
                                                            .textFieldInputDecoration
                                                            .copyWith(
                                                          hintText:
                                                              "Please Enter Obsevation",
                                                          counterText: '',
                                                        ),
                                                        style: AppStyles
                                                            .textInputTextStyle,
                                                        validator:
                                                            MultiValidator(
                                                          [
                                                            RequiredValidator(
                                                              errorText:
                                                                  "Please Enter Obsevation ",
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                      Text(
                                                        "Crieteria",
                                                        style: AppStyles
                                                            .textfieldCaptionTextStyle,
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            sunWiCrieteriaController,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        decoration: AppStyles
                                                            .textFieldInputDecoration
                                                            .copyWith(
                                                          hintText:
                                                              "Must be present",
                                                          counterText: '',
                                                        ),
                                                        style: AppStyles
                                                            .textInputTextStyle,
                                                        readOnly: true,
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical: 10.0),
                                                        child: Divider(
                                                          color: Colors.black,
                                                          height: 2.0,
                                                          thickness: 2.0,
                                                        ),
                                                      ),
                                                      // Sun Simulator Temerature
                                                      Text(
                                                        "Frequency",
                                                        style: AppStyles
                                                            .textfieldCaptionTextStyle,
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            sunTempFrequencyController,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        decoration: AppStyles
                                                            .textFieldInputDecoration
                                                            .copyWith(
                                                          hintText:
                                                              "Once Piece  per Shift ",
                                                          counterText: '',
                                                        ),
                                                        style: AppStyles
                                                            .textInputTextStyle,
                                                        readOnly: true,
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                      Text(
                                                        "Temperature",
                                                        style: AppStyles
                                                            .textfieldCaptionTextStyle,
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            sunTempController,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        decoration: AppStyles
                                                            .textFieldInputDecoration
                                                            .copyWith(
                                                          hintText:
                                                              "Please Enter Observation  ",
                                                          counterText: '',
                                                        ),
                                                        style: AppStyles
                                                            .textInputTextStyle,
                                                        validator:
                                                            MultiValidator(
                                                          [
                                                            RequiredValidator(
                                                              errorText:
                                                                  "Please Enter Observation ",
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),

                                                      Text(
                                                        "Criteria",
                                                        style: AppStyles
                                                            .textfieldCaptionTextStyle,
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            sunTempCrieteriaController,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        decoration: AppStyles
                                                            .textFieldInputDecoration
                                                            .copyWith(
                                                          hintText: "25+-2°C ",
                                                          counterText: '',
                                                        ),
                                                        style: AppStyles
                                                            .textInputTextStyle,
                                                        readOnly: true,
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),

                                                      Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical: 10.0),
                                                        child: Divider(
                                                          color: Colors.black,
                                                          height: 2.0,
                                                          thickness: 2.0,
                                                        ),
                                                      ),
                                                      // Sun Simulator Irradance
                                                      Text(
                                                        "Frequency",
                                                        style: AppStyles
                                                            .textfieldCaptionTextStyle,
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            sunIrradianceFrequencyController,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        decoration: AppStyles
                                                            .textFieldInputDecoration
                                                            .copyWith(
                                                          hintText:
                                                              "Once Piece  per Shift ",
                                                          counterText: '',
                                                        ),
                                                        style: AppStyles
                                                            .textInputTextStyle,
                                                        readOnly: true,
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                      Text(
                                                        "Irradiance",
                                                        style: AppStyles
                                                            .textfieldCaptionTextStyle,
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            sunIrradianceController,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        decoration: AppStyles
                                                            .textFieldInputDecoration
                                                            .copyWith(
                                                          hintText:
                                                              "Please Enter Observation  ",
                                                          counterText: '',
                                                        ),
                                                        style: AppStyles
                                                            .textInputTextStyle,
                                                        validator:
                                                            MultiValidator(
                                                          [
                                                            RequiredValidator(
                                                              errorText:
                                                                  "Please Enter Observation ",
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),

                                                      Text(
                                                        "Criteria",
                                                        style: AppStyles
                                                            .textfieldCaptionTextStyle,
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            sunIrradianceCrieteriaController,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        decoration: AppStyles
                                                            .textFieldInputDecoration
                                                            .copyWith(
                                                          hintText: "1000W/m² ",
                                                          counterText: '',
                                                        ),
                                                        style: AppStyles
                                                            .textInputTextStyle,
                                                        readOnly: true,
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),

                                                      Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical: 10.0),
                                                        child: Divider(
                                                          color: Colors.black,
                                                          height: 2.0,
                                                          thickness: 2.0,
                                                        ),
                                                      ),
                                                      //Sun Simulator Each Sun
                                                      Text(
                                                        "Frequency",
                                                        style: AppStyles
                                                            .textfieldCaptionTextStyle,
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            sunCaliFrequencyController,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        decoration: AppStyles
                                                            .textFieldInputDecoration
                                                            .copyWith(
                                                          hintText:
                                                              "Every 4 Hours  ",
                                                          counterText: '',
                                                        ),
                                                        style: AppStyles
                                                            .textInputTextStyle,
                                                        readOnly: true,
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                      Text(
                                                        "Each sun calibrated after every Four hours using valid silver reference PV module",
                                                        style: AppStyles
                                                            .textfieldCaptionTextStyle,
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Text(
                                                        "First Inspection",
                                                        style: AppStyles
                                                            .textfieldCaptionTextStyle,
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            sunCali1TimeController,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        decoration: AppStyles
                                                            .textFieldInputDecoration
                                                            .copyWith(
                                                          hintText: "Time  ",
                                                          counterText: '',
                                                        ),
                                                        style: AppStyles
                                                            .textInputTextStyle,
                                                        validator:
                                                            MultiValidator(
                                                          [
                                                            RequiredValidator(
                                                              errorText:
                                                                  "Please Enter Time ",
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            sunCali1RoomController,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        decoration: AppStyles
                                                            .textFieldInputDecoration
                                                            .copyWith(
                                                          hintText: "Room Temp",
                                                          counterText: '',
                                                        ),
                                                        style: AppStyles
                                                            .textInputTextStyle,
                                                        validator:
                                                            MultiValidator(
                                                          [
                                                            RequiredValidator(
                                                              errorText:
                                                                  "Please Enter Temp ",
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            sunCali1ModuleTempController,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        decoration: AppStyles
                                                            .textFieldInputDecoration
                                                            .copyWith(
                                                          hintText:
                                                              "Module Temp  ",
                                                          counterText: '',
                                                        ),
                                                        style: AppStyles
                                                            .textInputTextStyle,
                                                        validator:
                                                            MultiValidator(
                                                          [
                                                            RequiredValidator(
                                                              errorText:
                                                                  "Please Enter Module Temp ",
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            sunCali1ModuleIdController,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        decoration: AppStyles
                                                            .textFieldInputDecoration
                                                            .copyWith(
                                                          hintText:
                                                              "Module Id  ",
                                                          counterText: '',
                                                        ),
                                                        style: AppStyles
                                                            .textInputTextStyle,
                                                        validator:
                                                            MultiValidator(
                                                          [
                                                            RequiredValidator(
                                                              errorText:
                                                                  "Module Id ",
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                      // second Inspection
                                                      Text(
                                                        "Second Inspection",
                                                        style: AppStyles
                                                            .textfieldCaptionTextStyle,
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            sunCali2TimeController,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        decoration: AppStyles
                                                            .textFieldInputDecoration
                                                            .copyWith(
                                                          hintText: "Time  ",
                                                          counterText: '',
                                                        ),
                                                        style: AppStyles
                                                            .textInputTextStyle,
                                                        validator:
                                                            MultiValidator(
                                                          [
                                                            RequiredValidator(
                                                              errorText:
                                                                  "Please Enter Time ",
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            sunCali2RoomController,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        decoration: AppStyles
                                                            .textFieldInputDecoration
                                                            .copyWith(
                                                          hintText: "Room Temp",
                                                          counterText: '',
                                                        ),
                                                        style: AppStyles
                                                            .textInputTextStyle,
                                                        validator:
                                                            MultiValidator(
                                                          [
                                                            RequiredValidator(
                                                              errorText:
                                                                  "Please Enter Temp ",
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            sunCali2ModuleTempController,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        decoration: AppStyles
                                                            .textFieldInputDecoration
                                                            .copyWith(
                                                          hintText:
                                                              "Module Temp  ",
                                                          counterText: '',
                                                        ),
                                                        style: AppStyles
                                                            .textInputTextStyle,
                                                        validator:
                                                            MultiValidator(
                                                          [
                                                            RequiredValidator(
                                                              errorText:
                                                                  "Please Enter Module Temp ",
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            sunCali2ModuleIdController,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        decoration: AppStyles
                                                            .textFieldInputDecoration
                                                            .copyWith(
                                                          hintText:
                                                              "Module Id  ",
                                                          counterText: '',
                                                        ),
                                                        style: AppStyles
                                                            .textInputTextStyle,
                                                        validator:
                                                            MultiValidator(
                                                          [
                                                            RequiredValidator(
                                                              errorText:
                                                                  "Module Id ",
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                      // Third Inspection
                                                      Text(
                                                        "Third Inspection",
                                                        style: AppStyles
                                                            .textfieldCaptionTextStyle,
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            sunCali3TimeController,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        decoration: AppStyles
                                                            .textFieldInputDecoration
                                                            .copyWith(
                                                          hintText: "Time  ",
                                                          counterText: '',
                                                        ),
                                                        style: AppStyles
                                                            .textInputTextStyle,
                                                        validator:
                                                            MultiValidator(
                                                          [
                                                            RequiredValidator(
                                                              errorText:
                                                                  "Please Enter Time ",
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            sunCali3RoomController,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        decoration: AppStyles
                                                            .textFieldInputDecoration
                                                            .copyWith(
                                                          hintText: "Room Temp",
                                                          counterText: '',
                                                        ),
                                                        style: AppStyles
                                                            .textInputTextStyle,
                                                        validator:
                                                            MultiValidator(
                                                          [
                                                            RequiredValidator(
                                                              errorText:
                                                                  "Please Enter Temp ",
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            sunCali3ModuleTempController,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        decoration: AppStyles
                                                            .textFieldInputDecoration
                                                            .copyWith(
                                                          hintText:
                                                              "Module Temp  ",
                                                          counterText: '',
                                                        ),
                                                        style: AppStyles
                                                            .textInputTextStyle,
                                                        validator:
                                                            MultiValidator(
                                                          [
                                                            RequiredValidator(
                                                              errorText:
                                                                  "Please Enter Module Temp ",
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            sunCali3ModuleIdController,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        decoration: AppStyles
                                                            .textFieldInputDecoration
                                                            .copyWith(
                                                          hintText:
                                                              "Module Id  ",
                                                          counterText: '',
                                                        ),
                                                        style: AppStyles
                                                            .textInputTextStyle,
                                                        validator:
                                                            MultiValidator(
                                                          [
                                                            RequiredValidator(
                                                              errorText:
                                                                  "Module Id ",
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),

                                                      Text(
                                                        "Criteria",
                                                        style: AppStyles
                                                            .textfieldCaptionTextStyle,
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            sunCaliCrieteriaController,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        decoration: AppStyles
                                                            .textFieldInputDecoration
                                                            .copyWith(
                                                          hintText:
                                                              "Calibration performed at 25+-2°C room Temprature ",
                                                          counterText: '',
                                                        ),
                                                        style: AppStyles
                                                            .textInputTextStyle,
                                                        readOnly: true,
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),

                                                      Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical: 10.0),
                                                        child: Divider(
                                                          color: Colors.black,
                                                          height: 2.0,
                                                          thickness: 2.0,
                                                        ),
                                                      ),
                                                      // Last Callibration
                                                      Text(
                                                        "Frequency",
                                                        style: AppStyles
                                                            .textfieldCaptionTextStyle,
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            sunLastFrequencyController,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        decoration: AppStyles
                                                            .textFieldInputDecoration
                                                            .copyWith(
                                                          hintText:
                                                              "Every Four Hour  ",
                                                          counterText: '',
                                                        ),
                                                        style: AppStyles
                                                            .textInputTextStyle,
                                                        readOnly: true,
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                      Text(
                                                        "Last Calibration Date And Time ",
                                                        style: AppStyles
                                                            .textfieldCaptionTextStyle,
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            sunLast1Controller,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        decoration: AppStyles
                                                            .textFieldInputDecoration
                                                            .copyWith(
                                                          hintText:
                                                              "First Inspection  ",
                                                          counterText: '',
                                                        ),
                                                        style: AppStyles
                                                            .textInputTextStyle,
                                                        validator:
                                                            MultiValidator(
                                                          [
                                                            RequiredValidator(
                                                              errorText:
                                                                  "Please Enter First Inspection ",
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            sunLast2Controller,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        decoration: AppStyles
                                                            .textFieldInputDecoration
                                                            .copyWith(
                                                          hintText:
                                                              "Second Inspection  ",
                                                          counterText: '',
                                                        ),
                                                        style: AppStyles
                                                            .textInputTextStyle,
                                                        validator:
                                                            MultiValidator(
                                                          [
                                                            RequiredValidator(
                                                              errorText:
                                                                  "Please Enter Second Inspection ",
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            sunLast3Controller,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        decoration: AppStyles
                                                            .textFieldInputDecoration
                                                            .copyWith(
                                                          hintText:
                                                              "Third Inspection  ",
                                                          counterText: '',
                                                        ),
                                                        style: AppStyles
                                                            .textInputTextStyle,
                                                        validator:
                                                            MultiValidator(
                                                          [
                                                            RequiredValidator(
                                                              errorText:
                                                                  "Please Enter Third Inspection ",
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),

                                                      Text(
                                                        "Criteria",
                                                        style: AppStyles
                                                            .textfieldCaptionTextStyle,
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            sunLastCrieteriaController,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        decoration: AppStyles
                                                            .textFieldInputDecoration
                                                            .copyWith(
                                                          hintText:
                                                              "Verify also its result ",
                                                          counterText: '',
                                                        ),
                                                        style: AppStyles
                                                            .textInputTextStyle,
                                                        readOnly: true,
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),

                                                      Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical: 10.0),
                                                        child: Divider(
                                                          color: Colors.black,
                                                          height: 2.0,
                                                          thickness: 2.0,
                                                        ),
                                                      ),
                                                      //  Sun Simulator Expiry Date
                                                      Text(
                                                        "Frequency",
                                                        style: AppStyles
                                                            .textfieldCaptionTextStyle,
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            sunExpiryFrequencyController,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        decoration: AppStyles
                                                            .textFieldInputDecoration
                                                            .copyWith(
                                                          hintText:
                                                              "Once Piece  per Shift ",
                                                          counterText: '',
                                                        ),
                                                        style: AppStyles
                                                            .textInputTextStyle,
                                                        readOnly: true,
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),
                                                      Text(
                                                        "Expiry Date Verification",
                                                        style: AppStyles
                                                            .textfieldCaptionTextStyle,
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            sunExpiryController,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        decoration: AppStyles
                                                            .textFieldInputDecoration
                                                            .copyWith(
                                                          hintText:
                                                              "Please Enter Observation  ",
                                                          counterText: '',
                                                        ),
                                                        style: AppStyles
                                                            .textInputTextStyle,
                                                        validator:
                                                            MultiValidator(
                                                          [
                                                            RequiredValidator(
                                                              errorText:
                                                                  "Please Enter Observation ",
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),

                                                      Text(
                                                        "Criteria",
                                                        style: AppStyles
                                                            .textfieldCaptionTextStyle,
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            sunExpiryCrieteriaController,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        decoration: AppStyles
                                                            .textFieldInputDecoration
                                                            .copyWith(
                                                          hintText: "3 Months ",
                                                          counterText: '',
                                                        ),
                                                        style: AppStyles
                                                            .textInputTextStyle,
                                                        readOnly: true,
                                                      ),
                                                      const SizedBox(
                                                        height: 15,
                                                      ),

                                                      Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  0, 10, 0, 0)),
                                                      _isLoading
                                                          ? Center(
                                                              child:
                                                                  CircularProgressIndicator())
                                                          : AppButton(
                                                              textStyle:
                                                                  const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: AppColors
                                                                    .white,
                                                                fontSize: 16,
                                                              ),
                                                              onTap: () {
                                                                AppHelper
                                                                    .hideKeyboard(
                                                                        context);
                                                                // sendDataToBackend();

                                                                // _registerFormKey
                                                                //     .currentState!
                                                                //     .save;
                                                                // if (_registerFormKey
                                                                //     .currentState!
                                                                //     .validate()) {
                                                                //   // sendDataToBackend();
                                                                // }
                                                                setState(() {
                                                                  setPage =
                                                                      'hipot';
                                                                });
                                                              },
                                                              label: "Next",
                                                              organization: '',
                                                            ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      // Center(
                                                      //   child: Padding(
                                                      //     padding: const EdgeInsets.all(8.0),
                                                      //     child: InkWell(
                                                      //       onTap: () {
                                                      //         // Navigator.of(context).pushReplacement(
                                                      //         //     MaterialPageRoute(
                                                      //         //         builder: (BuildContext context) =>
                                                      //         //             LoginPage(
                                                      //         //                 appName: widget.appName)));
                                                      //       },
                                                      //       child: Text(
                                                      //         "BACK",
                                                      //         style: TextStyle(
                                                      //           fontFamily: appFontFamily,
                                                      //           fontSize: 16,
                                                      //           fontWeight: FontWeight.w500,
                                                      //           color: AppColors.redColor,
                                                      //         ),
                                                      //       ),
                                                      //     ),
                                                      //   ),
                                                      // ),
                                                      const SizedBox(
                                                        height: 25,
                                                      ),
                                                      Center(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                setPage =
                                                                    "cleaning";
                                                              });
                                                              // Navigator.of(context).pushReplacement(
                                                              //     MaterialPageRoute(
                                                              //         builder: (BuildContext context) =>
                                                              //             LoginPage(
                                                              //                 appName: widget.appName)));
                                                            },
                                                            child: const Text(
                                                              "BACK",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      appFontFamily,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: AppColors
                                                                      .redColor),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 25,
                                                      ),
                                                      Container(
                                                        alignment:
                                                            Alignment.center,
                                                        child: const Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              "Powered By Gautam Solar Pvt. Ltd.",
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    appFontFamily,
                                                                color: AppColors
                                                                    .greyColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        /*******************Hipot*************** */

                                        : setPage == "hipot"
                                            ? Stack(
                                                alignment: Alignment.center,
                                                fit: StackFit.expand,
                                                children: [
                                                  SingleChildScrollView(
                                                    child: Form(
                                                      //  key: _registerFormKey,
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .onUserInteraction,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Container(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Image.asset(
                                                                  AppAssets
                                                                      .imgLogo,
                                                                  height: 100,
                                                                  width: 230,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const Center(
                                                              child: Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              10),
                                                                  child: Text(
                                                                      "Incoming Process Quality Control",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              27,
                                                                          color: AppColors
                                                                              .black,
                                                                          fontFamily:
                                                                              appFontFamily,
                                                                          fontWeight:
                                                                              FontWeight.w700)))),
                                                          const Center(
                                                              child: Text(
                                                                  "(Post Lam IPQC Checklist)",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      color: AppColors
                                                                          .black,
                                                                      fontFamily:
                                                                          appFontFamily,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700))),
                                                          const SizedBox(
                                                            height: 35,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                'Document No : ',
                                                                style: AppStyles
                                                                    .textfieldCaptionTextStyle,
                                                              ),
                                                              const SizedBox(
                                                                width: 8,
                                                              ),
                                                              Text(
                                                                'GSPL/IPQC/IPC/003',
                                                                style: AppStyles
                                                                    .textfieldCaptionTextStyle,
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 8,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                'Rev.No. / Rev. Date : ',
                                                                style: AppStyles
                                                                    .textfieldCaptionTextStyle,
                                                              ),
                                                              const SizedBox(
                                                                width: 8,
                                                              ),
                                                              Text(
                                                                'Ver.2.0 / 20-03-2024',
                                                                style: AppStyles
                                                                    .textfieldCaptionTextStyle,
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          const Center(
                                                              child: Text(
                                                                  "Hipot",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          13,
                                                                          160,
                                                                          0),
                                                                      fontFamily:
                                                                          appFontFamily,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700))),
                                                          const SizedBox(
                                                            height: 20,
                                                          ),
                                                          // Hipot Availability of WI
                                                          Text(
                                                            "Frequency",
                                                            style: AppStyles
                                                                .textfieldCaptionTextStyle,
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                hipotWiFrequencyController,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            decoration: AppStyles
                                                                .textFieldInputDecoration
                                                                .copyWith(
                                                              hintText:
                                                                  "Once a Shift",
                                                              counterText: '',
                                                            ),
                                                            style: AppStyles
                                                                .textInputTextStyle,
                                                            readOnly: true,
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          Text(
                                                            "Avaibility of Wi ",
                                                            style: AppStyles
                                                                .textfieldCaptionTextStyle,
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                hipotWiController,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            decoration: AppStyles
                                                                .textFieldInputDecoration
                                                                .copyWith(
                                                              hintText:
                                                                  "Please Enter Obsevation",
                                                              counterText: '',
                                                            ),
                                                            style: AppStyles
                                                                .textInputTextStyle,
                                                            validator:
                                                                MultiValidator(
                                                              [
                                                                RequiredValidator(
                                                                  errorText:
                                                                      "Please Enter Obsevation ",
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          Text(
                                                            "Crieteria",
                                                            style: AppStyles
                                                                .textfieldCaptionTextStyle,
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                hipotWiCrieteriaController,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            decoration: AppStyles
                                                                .textFieldInputDecoration
                                                                .copyWith(
                                                              hintText:
                                                                  "Must be present",
                                                              counterText: '',
                                                            ),
                                                            style: AppStyles
                                                                .textInputTextStyle,
                                                            readOnly: true,
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        10.0),
                                                            child: Divider(
                                                              color:
                                                                  Colors.black,
                                                              height: 2.0,
                                                              thickness: 2.0,
                                                            ),
                                                          ),
                                                          // Hipot Paramerter

                                                          Text(
                                                            "Frequency",
                                                            style: AppStyles
                                                                .textfieldCaptionTextStyle,
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                hipotParameterFrequencyController,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            decoration: AppStyles
                                                                .textFieldInputDecoration
                                                                .copyWith(
                                                              hintText:
                                                                  "Once per Shift ",
                                                              counterText: '',
                                                            ),
                                                            style: AppStyles
                                                                .textInputTextStyle,
                                                            readOnly: true,
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          Text(
                                                            "Module Should be free from-protective Film,Scratches on frame-Backsheet Corner Cleaning Module ,Silicon Sealant glue/backsheet ,frame cleaning ,jb cleaning ,No burr ",
                                                            style: AppStyles
                                                                .textfieldCaptionTextStyle,
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                hipotParameterController,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            decoration: AppStyles
                                                                .textFieldInputDecoration
                                                                .copyWith(
                                                              hintText:
                                                                  "Please Enter Observation  ",
                                                              counterText: '',
                                                            ),
                                                            style: AppStyles
                                                                .textInputTextStyle,
                                                            validator:
                                                                MultiValidator(
                                                              [
                                                                RequiredValidator(
                                                                  errorText:
                                                                      "Please Enter Observation ",
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),

                                                          Text(
                                                            "Criteria",
                                                            style: AppStyles
                                                                .textfieldCaptionTextStyle,
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                hipotParameterCrieteriaController,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            decoration: AppStyles
                                                                .textFieldInputDecoration
                                                                .copyWith(
                                                              hintText:
                                                                  "As per UL/ As per IEC  ",
                                                              counterText: '',
                                                            ),
                                                            style: AppStyles
                                                                .textInputTextStyle,
                                                            readOnly: true,
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),

                                                          Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        10.0),
                                                            child: Divider(
                                                              color:
                                                                  Colors.black,
                                                              height: 2.0,
                                                              thickness: 2.0,
                                                            ),
                                                          ),
                                                          //DCW_4.0KV

                                                          Text(
                                                            "Frequency",
                                                            style: AppStyles
                                                                .textfieldCaptionTextStyle,
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                hipotDCWFrequencyController,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            decoration: AppStyles
                                                                .textFieldInputDecoration
                                                                .copyWith(
                                                              hintText:
                                                                  "5 Piece per Shift ",
                                                              counterText: '',
                                                            ),
                                                            style: AppStyles
                                                                .textInputTextStyle,
                                                            readOnly: true,
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          Text(
                                                            "DCW-4.0KV ",
                                                            style: AppStyles
                                                                .textfieldCaptionTextStyle,
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                hipotDCWObs1Controller,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            decoration: AppStyles
                                                                .textFieldInputDecoration
                                                                .copyWith(
                                                              hintText:
                                                                  "Please Enter Observation 1  ",
                                                              counterText: '',
                                                            ),
                                                            style: AppStyles
                                                                .textInputTextStyle,
                                                            validator:
                                                                MultiValidator(
                                                              [
                                                                RequiredValidator(
                                                                  errorText:
                                                                      "Please Enter Observation 1",
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                hipotDCWObs2Controller,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            decoration: AppStyles
                                                                .textFieldInputDecoration
                                                                .copyWith(
                                                              hintText:
                                                                  "Please Enter Observation 2  ",
                                                              counterText: '',
                                                            ),
                                                            style: AppStyles
                                                                .textInputTextStyle,
                                                            validator:
                                                                MultiValidator(
                                                              [
                                                                RequiredValidator(
                                                                  errorText:
                                                                      "Please Enter Observation 2",
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                hipotDCWObs3Controller,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            decoration: AppStyles
                                                                .textFieldInputDecoration
                                                                .copyWith(
                                                              hintText:
                                                                  "Please Enter Observation 3  ",
                                                              counterText: '',
                                                            ),
                                                            style: AppStyles
                                                                .textInputTextStyle,
                                                            validator:
                                                                MultiValidator(
                                                              [
                                                                RequiredValidator(
                                                                  errorText:
                                                                      "Please Enter Observation 3",
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                hipotDCWObs4Controller,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            decoration: AppStyles
                                                                .textFieldInputDecoration
                                                                .copyWith(
                                                              hintText:
                                                                  "Please Enter Observation 4  ",
                                                              counterText: '',
                                                            ),
                                                            style: AppStyles
                                                                .textInputTextStyle,
                                                            validator:
                                                                MultiValidator(
                                                              [
                                                                RequiredValidator(
                                                                  errorText:
                                                                      "Please Enter Observation 4",
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                hipotDCWObs5Controller,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            decoration: AppStyles
                                                                .textFieldInputDecoration
                                                                .copyWith(
                                                              hintText:
                                                                  "Please Enter Observation 5  ",
                                                              counterText: '',
                                                            ),
                                                            style: AppStyles
                                                                .textInputTextStyle,
                                                            validator:
                                                                MultiValidator(
                                                              [
                                                                RequiredValidator(
                                                                  errorText:
                                                                      "Please Enter Observation 5",
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),

                                                          Text(
                                                            "Criteria",
                                                            style: AppStyles
                                                                .textfieldCaptionTextStyle,
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                hipotDCWCrieteriaController,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            decoration: AppStyles
                                                                .textFieldInputDecoration
                                                                .copyWith(
                                                              hintText:
                                                                  "As per GSPL technical Specification ",
                                                              counterText: '',
                                                            ),
                                                            style: AppStyles
                                                                .textInputTextStyle,
                                                            readOnly: true,
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),

                                                          Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        10.0),
                                                            child: Divider(
                                                              color:
                                                                  Colors.black,
                                                              height: 2.0,
                                                              thickness: 2.0,
                                                            ),
                                                          ),
                                                          // IR-2.5KV

                                                          Text(
                                                            "Frequency",
                                                            style: AppStyles
                                                                .textfieldCaptionTextStyle,
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                hipotIRFrequencyController,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            decoration: AppStyles
                                                                .textFieldInputDecoration
                                                                .copyWith(
                                                              hintText:
                                                                  "5 Piece per Shift ",
                                                              counterText: '',
                                                            ),
                                                            style: AppStyles
                                                                .textInputTextStyle,
                                                            readOnly: true,
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          Text(
                                                            "1R-2.5KV ",
                                                            style: AppStyles
                                                                .textfieldCaptionTextStyle,
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                hipotIRObs1Controller,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            decoration: AppStyles
                                                                .textFieldInputDecoration
                                                                .copyWith(
                                                              hintText:
                                                                  "Please Enter Observation 1  ",
                                                              counterText: '',
                                                            ),
                                                            style: AppStyles
                                                                .textInputTextStyle,
                                                            validator:
                                                                MultiValidator(
                                                              [
                                                                RequiredValidator(
                                                                  errorText:
                                                                      "Please Enter Observation 1 ",
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                hipotIRObs2Controller,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            decoration: AppStyles
                                                                .textFieldInputDecoration
                                                                .copyWith(
                                                              hintText:
                                                                  "Please Enter Observation 2  ",
                                                              counterText: '',
                                                            ),
                                                            style: AppStyles
                                                                .textInputTextStyle,
                                                            validator:
                                                                MultiValidator(
                                                              [
                                                                RequiredValidator(
                                                                  errorText:
                                                                      "Please Enter Observation 2 ",
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                hipotIRObs3Controller,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            decoration: AppStyles
                                                                .textFieldInputDecoration
                                                                .copyWith(
                                                              hintText:
                                                                  "Please Enter Observation 3  ",
                                                              counterText: '',
                                                            ),
                                                            style: AppStyles
                                                                .textInputTextStyle,
                                                            validator:
                                                                MultiValidator(
                                                              [
                                                                RequiredValidator(
                                                                  errorText:
                                                                      "Please Enter Observation 3 ",
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                hipotIRObs4Controller,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            decoration: AppStyles
                                                                .textFieldInputDecoration
                                                                .copyWith(
                                                              hintText:
                                                                  "Please Enter Observation 4  ",
                                                              counterText: '',
                                                            ),
                                                            style: AppStyles
                                                                .textInputTextStyle,
                                                            validator:
                                                                MultiValidator(
                                                              [
                                                                RequiredValidator(
                                                                  errorText:
                                                                      "Please Enter Observation 4 ",
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                hipotIRObs5Controller,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            decoration: AppStyles
                                                                .textFieldInputDecoration
                                                                .copyWith(
                                                              hintText:
                                                                  "Please Enter Observation 5  ",
                                                              counterText: '',
                                                            ),
                                                            style: AppStyles
                                                                .textInputTextStyle,
                                                            validator:
                                                                MultiValidator(
                                                              [
                                                                RequiredValidator(
                                                                  errorText:
                                                                      "Please Enter Observation 5 ",
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),

                                                          Text(
                                                            "Criteria",
                                                            style: AppStyles
                                                                .textfieldCaptionTextStyle,
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                hipotIRCrieteriaController,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            decoration: AppStyles
                                                                .textFieldInputDecoration
                                                                .copyWith(
                                                              hintText:
                                                                  "As per GSPL Technical Specification ",
                                                              counterText: '',
                                                            ),
                                                            style: AppStyles
                                                                .textInputTextStyle,
                                                            readOnly: true,
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),

                                                          Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        10.0),
                                                            child: Divider(
                                                              color:
                                                                  Colors.black,
                                                              height: 2.0,
                                                              thickness: 2.0,
                                                            ),
                                                          ),
                                                          // Ground Continutity-62.5A

                                                          Text(
                                                            "Frequency",
                                                            style: AppStyles
                                                                .textfieldCaptionTextStyle,
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                hipotGroundFrequencyController,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            decoration: AppStyles
                                                                .textFieldInputDecoration
                                                                .copyWith(
                                                              hintText:
                                                                  "5 Piece per Shift ",
                                                              counterText: '',
                                                            ),
                                                            style: AppStyles
                                                                .textInputTextStyle,
                                                            readOnly: true,
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          Text(
                                                            "Ground Continutity-62.5A ",
                                                            style: AppStyles
                                                                .textfieldCaptionTextStyle,
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                hipotGroundObs1Controller,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            decoration: AppStyles
                                                                .textFieldInputDecoration
                                                                .copyWith(
                                                              hintText:
                                                                  "Please Enter Observation 1  ",
                                                              counterText: '',
                                                            ),
                                                            style: AppStyles
                                                                .textInputTextStyle,
                                                            validator:
                                                                MultiValidator(
                                                              [
                                                                RequiredValidator(
                                                                  errorText:
                                                                      "Please Enter Observation 1 ",
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                hipotGroundObs2Controller,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            decoration: AppStyles
                                                                .textFieldInputDecoration
                                                                .copyWith(
                                                              hintText:
                                                                  "Please Enter Observation 2  ",
                                                              counterText: '',
                                                            ),
                                                            style: AppStyles
                                                                .textInputTextStyle,
                                                            validator:
                                                                MultiValidator(
                                                              [
                                                                RequiredValidator(
                                                                  errorText:
                                                                      "Please Enter Observation 2 ",
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                hipotGroundObs3Controller,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            decoration: AppStyles
                                                                .textFieldInputDecoration
                                                                .copyWith(
                                                              hintText:
                                                                  "Please Enter Observation 3  ",
                                                              counterText: '',
                                                            ),
                                                            style: AppStyles
                                                                .textInputTextStyle,
                                                            validator:
                                                                MultiValidator(
                                                              [
                                                                RequiredValidator(
                                                                  errorText:
                                                                      "Please Enter Observation 3 ",
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                hipotGroundObs4Controller,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            decoration: AppStyles
                                                                .textFieldInputDecoration
                                                                .copyWith(
                                                              hintText:
                                                                  "Please Enter Observation 4  ",
                                                              counterText: '',
                                                            ),
                                                            style: AppStyles
                                                                .textInputTextStyle,
                                                            validator:
                                                                MultiValidator(
                                                              [
                                                                RequiredValidator(
                                                                  errorText:
                                                                      "Please Enter Observation 4 ",
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                hipotGroundObs5Controller,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            decoration: AppStyles
                                                                .textFieldInputDecoration
                                                                .copyWith(
                                                              hintText:
                                                                  "Please Enter Observation 5  ",
                                                              counterText: '',
                                                            ),
                                                            style: AppStyles
                                                                .textInputTextStyle,
                                                            validator:
                                                                MultiValidator(
                                                              [
                                                                RequiredValidator(
                                                                  errorText:
                                                                      "Please Enter Observation 5 ",
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),

                                                          Text(
                                                            "Criteria",
                                                            style: AppStyles
                                                                .textfieldCaptionTextStyle,
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          TextFormField(
                                                            controller:
                                                                hipotIRCrieteriaController,
                                                            keyboardType:
                                                                TextInputType
                                                                    .text,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            decoration: AppStyles
                                                                .textFieldInputDecoration
                                                                .copyWith(
                                                              hintText:
                                                                  "As per GSPL Technical Specification  ",
                                                              counterText: '',
                                                            ),
                                                            style: AppStyles
                                                                .textInputTextStyle,
                                                            readOnly: true,
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),

                                                          Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          0,
                                                                          10,
                                                                          0,
                                                                          0)),
                                                          _isLoading
                                                              ? Center(
                                                                  child:
                                                                      CircularProgressIndicator())
                                                              : AppButton(
                                                                  textStyle:
                                                                      const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: AppColors
                                                                        .white,
                                                                    fontSize:
                                                                        16,
                                                                  ),
                                                                  onTap: () {
                                                                    AppHelper
                                                                        .hideKeyboard(
                                                                            context);
                                                                    // sendDataToBackend();

                                                                    // _registerFormKey
                                                                    //     .currentState!
                                                                    //     .save;
                                                                    // if (_registerFormKey
                                                                    //     .currentState!
                                                                    //     .validate()) {
                                                                    //   // sendDataToBackend();
                                                                    // }
                                                                    setState(
                                                                        () {
                                                                      setPage =
                                                                          'finalel';
                                                                    });
                                                                  },
                                                                  label: "Next",
                                                                  organization:
                                                                      '',
                                                                ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          // Center(
                                                          //   child: Padding(
                                                          //     padding: const EdgeInsets.all(8.0),
                                                          //     child: InkWell(
                                                          //       onTap: () {
                                                          //         // Navigator.of(context).pushReplacement(
                                                          //         //     MaterialPageRoute(
                                                          //         //         builder: (BuildContext context) =>
                                                          //         //             LoginPage(
                                                          //         //                 appName: widget.appName)));
                                                          //       },
                                                          //       child: Text(
                                                          //         "BACK",
                                                          //         style: TextStyle(
                                                          //           fontFamily: appFontFamily,
                                                          //           fontSize: 16,
                                                          //           fontWeight: FontWeight.w500,
                                                          //           color: AppColors.redColor,
                                                          //         ),
                                                          //       ),
                                                          //     ),
                                                          //   ),
                                                          // ),
                                                          const SizedBox(
                                                            height: 25,
                                                          ),
                                                          Center(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    setPage =
                                                                        "sunsimulator";
                                                                  });
                                                                  // Navigator.of(context).pushReplacement(
                                                                  //     MaterialPageRoute(
                                                                  //         builder: (BuildContext context) =>
                                                                  //             LoginPage(
                                                                  //                 appName: widget.appName)));
                                                                },
                                                                child:
                                                                    const Text(
                                                                  "BACK",
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          appFontFamily,
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: AppColors
                                                                          .redColor),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 25,
                                                          ),
                                                          Container(
                                                            alignment: Alignment
                                                                .center,
                                                            child: const Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  "Powered By Gautam Solar Pvt. Ltd.",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontFamily:
                                                                        appFontFamily,
                                                                    color: AppColors
                                                                        .greyColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            /**************Final EL Test ************* */

                                            : setPage == "finalel"
                                                ? Stack(
                                                    alignment: Alignment.center,
                                                    fit: StackFit.expand,
                                                    children: [
                                                      SingleChildScrollView(
                                                        child: Form(
                                                          //  key: _registerFormKey,
                                                          autovalidateMode:
                                                              AutovalidateMode
                                                                  .onUserInteraction,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Image.asset(
                                                                      AppAssets
                                                                          .imgLogo,
                                                                      height:
                                                                          100,
                                                                      width:
                                                                          230,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              const Center(
                                                                  child: Padding(
                                                                      padding: EdgeInsets.only(
                                                                          top:
                                                                              10),
                                                                      child: Text(
                                                                          "Incoming Process Quality Control",
                                                                          style: TextStyle(
                                                                              fontSize: 27,
                                                                              color: AppColors.black,
                                                                              fontFamily: appFontFamily,
                                                                              fontWeight: FontWeight.w700)))),
                                                              const Center(
                                                                  child: Text(
                                                                      "(Post Lam IPQC Checklist)",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              20,
                                                                          color: AppColors
                                                                              .black,
                                                                          fontFamily:
                                                                              appFontFamily,
                                                                          fontWeight:
                                                                              FontWeight.w700))),
                                                              const SizedBox(
                                                                height: 35,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    'Document No : ',
                                                                    style: AppStyles
                                                                        .textfieldCaptionTextStyle,
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 8,
                                                                  ),
                                                                  Text(
                                                                    'GSPL/IPQC/IPC/003',
                                                                    style: AppStyles
                                                                        .textfieldCaptionTextStyle,
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 8,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    'Rev.No. / Rev. Date : ',
                                                                    style: AppStyles
                                                                        .textfieldCaptionTextStyle,
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 8,
                                                                  ),
                                                                  Text(
                                                                    'Ver.2.0 / 20-03-2024',
                                                                    style: AppStyles
                                                                        .textfieldCaptionTextStyle,
                                                                  ),
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                              const Center(
                                                                  child: Text(
                                                                      "Final EL Test",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              20,
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              13,
                                                                              160,
                                                                              0),
                                                                          fontFamily:
                                                                              appFontFamily,
                                                                          fontWeight:
                                                                              FontWeight.w700))),
                                                              const SizedBox(
                                                                height: 20,
                                                              ),
                                                              // Final EL Availability of WI
                                                              Text(
                                                                "Frequency",
                                                                style: AppStyles
                                                                    .textfieldCaptionTextStyle,
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              TextFormField(
                                                                controller:
                                                                    elWiFrequencyController,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .text,
                                                                textInputAction:
                                                                    TextInputAction
                                                                        .next,
                                                                decoration: AppStyles
                                                                    .textFieldInputDecoration
                                                                    .copyWith(
                                                                  hintText:
                                                                      "Once a Shift",
                                                                  counterText:
                                                                      '',
                                                                ),
                                                                style: AppStyles
                                                                    .textInputTextStyle,
                                                                readOnly: true,
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                              Text(
                                                                "Avaibility of Wi ",
                                                                style: AppStyles
                                                                    .textfieldCaptionTextStyle,
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              TextFormField(
                                                                controller:
                                                                    elWiController,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .text,
                                                                textInputAction:
                                                                    TextInputAction
                                                                        .next,
                                                                decoration: AppStyles
                                                                    .textFieldInputDecoration
                                                                    .copyWith(
                                                                  hintText:
                                                                      "Please Enter Obsevation",
                                                                  counterText:
                                                                      '',
                                                                ),
                                                                style: AppStyles
                                                                    .textInputTextStyle,
                                                                validator:
                                                                    MultiValidator(
                                                                  [
                                                                    RequiredValidator(
                                                                      errorText:
                                                                          "Please Enter Obsevation ",
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                              Text(
                                                                "Crieteria",
                                                                style: AppStyles
                                                                    .textfieldCaptionTextStyle,
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              TextFormField(
                                                                controller:
                                                                    elWiCrieteriaController,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .text,
                                                                textInputAction:
                                                                    TextInputAction
                                                                        .next,
                                                                decoration: AppStyles
                                                                    .textFieldInputDecoration
                                                                    .copyWith(
                                                                  hintText:
                                                                      "Must be present",
                                                                  counterText:
                                                                      '',
                                                                ),
                                                                style: AppStyles
                                                                    .textInputTextStyle,
                                                                readOnly: true,
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            10.0),
                                                                child: Divider(
                                                                  color: Colors
                                                                      .black,
                                                                  height: 2.0,
                                                                  thickness:
                                                                      2.0,
                                                                ),
                                                              ),
                                                              //Voltage & Current Verification in DC Power Supply
                                                              Text(
                                                                "Frequency",
                                                                style: AppStyles
                                                                    .textfieldCaptionTextStyle,
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              TextFormField(
                                                                controller:
                                                                    elVoltageFrequencyController,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .text,
                                                                textInputAction:
                                                                    TextInputAction
                                                                        .next,
                                                                decoration: AppStyles
                                                                    .textFieldInputDecoration
                                                                    .copyWith(
                                                                  hintText:
                                                                      "Once a Shift",
                                                                  counterText:
                                                                      '',
                                                                ),
                                                                style: AppStyles
                                                                    .textInputTextStyle,
                                                                readOnly: true,
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                              Text(
                                                                "Voltage & Current Verification in DC Power Supply",
                                                                style: AppStyles
                                                                    .textfieldCaptionTextStyle,
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              TextFormField(
                                                                controller:
                                                                    elVoltageController,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .text,
                                                                textInputAction:
                                                                    TextInputAction
                                                                        .next,
                                                                decoration: AppStyles
                                                                    .textFieldInputDecoration
                                                                    .copyWith(
                                                                  hintText:
                                                                      "Please Enter Obsevation",
                                                                  counterText:
                                                                      '',
                                                                ),
                                                                style: AppStyles
                                                                    .textInputTextStyle,
                                                                validator:
                                                                    MultiValidator(
                                                                  [
                                                                    RequiredValidator(
                                                                      errorText:
                                                                          "Please Enter Obsevation ",
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                              Text(
                                                                "Crieteria",
                                                                style: AppStyles
                                                                    .textfieldCaptionTextStyle,
                                                              ),
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              TextFormField(
                                                                controller:
                                                                    elVoltageCrieteriaController,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .text,
                                                                textInputAction:
                                                                    TextInputAction
                                                                        .next,
                                                                decoration: AppStyles
                                                                    .textFieldInputDecoration
                                                                    .copyWith(
                                                                  hintText:
                                                                      "AS per Voc & ISc",
                                                                  counterText:
                                                                      '',
                                                                ),
                                                                style: AppStyles
                                                                    .textInputTextStyle,
                                                                readOnly: true,
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            10.0),
                                                                child: Divider(
                                                                  color: Colors
                                                                      .black,
                                                                  height: 2.0,
                                                                  thickness:
                                                                      2.0,
                                                                ),
                                                              ),
                                                              // EL Defects
                                                              Text(
                                                                "Frequency",
                                                                style: AppStyles
                                                                    .textfieldCaptionTextStyle,
                                                              ),
                                                              SizedBox(
                                                                height: 15,
                                                              ),
                                                              TextFormField(
                                                                controller:
                                                                    elDefectsFrequencyController,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .text,
                                                                textInputAction:
                                                                    TextInputAction
                                                                        .next,
                                                                decoration: AppStyles
                                                                    .textFieldInputDecoration
                                                                    .copyWith(
                                                                  hintText:
                                                                      "5 Piece  per Shift ",
                                                                  counterText:
                                                                      '',
                                                                ),
                                                                style: AppStyles
                                                                    .textInputTextStyle,
                                                                readOnly: true,
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                              Text(
                                                                "EL Defects",
                                                                style: AppStyles
                                                                    .textfieldCaptionTextStyle,
                                                              ),
                                                              SizedBox(
                                                                height: 15,
                                                              ),
                                                              TextFormField(
                                                                controller:
                                                                    elDefectsObs1Controller,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .text,
                                                                textInputAction:
                                                                    TextInputAction
                                                                        .next,
                                                                decoration: AppStyles
                                                                    .textFieldInputDecoration
                                                                    .copyWith(
                                                                  hintText:
                                                                      "Please Enter Observation 1 ",
                                                                  counterText:
                                                                      '',
                                                                ),
                                                                style: AppStyles
                                                                    .textInputTextStyle,
                                                                validator:
                                                                    MultiValidator(
                                                                  [
                                                                    RequiredValidator(
                                                                      errorText:
                                                                          "Please Enter Observation 1",
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                              TextFormField(
                                                                controller:
                                                                    elDefectsObs2Controller,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .text,
                                                                textInputAction:
                                                                    TextInputAction
                                                                        .next,
                                                                decoration: AppStyles
                                                                    .textFieldInputDecoration
                                                                    .copyWith(
                                                                  hintText:
                                                                      "Please Enter Observation 2 ",
                                                                  counterText:
                                                                      '',
                                                                ),
                                                                style: AppStyles
                                                                    .textInputTextStyle,
                                                                validator:
                                                                    MultiValidator(
                                                                  [
                                                                    RequiredValidator(
                                                                      errorText:
                                                                          "Please Enter Observation 2",
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                              TextFormField(
                                                                controller:
                                                                    elDefectsObs3Controller,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .text,
                                                                textInputAction:
                                                                    TextInputAction
                                                                        .next,
                                                                decoration: AppStyles
                                                                    .textFieldInputDecoration
                                                                    .copyWith(
                                                                  hintText:
                                                                      "Please Enter Observation 3 ",
                                                                  counterText:
                                                                      '',
                                                                ),
                                                                style: AppStyles
                                                                    .textInputTextStyle,
                                                                validator:
                                                                    MultiValidator(
                                                                  [
                                                                    RequiredValidator(
                                                                      errorText:
                                                                          "Please Enter Observation 3",
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                              TextFormField(
                                                                controller:
                                                                    elDefectsObs4Controller,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .text,
                                                                textInputAction:
                                                                    TextInputAction
                                                                        .next,
                                                                decoration: AppStyles
                                                                    .textFieldInputDecoration
                                                                    .copyWith(
                                                                  hintText:
                                                                      "Please Enter Observation 4 ",
                                                                  counterText:
                                                                      '',
                                                                ),
                                                                style: AppStyles
                                                                    .textInputTextStyle,
                                                                validator:
                                                                    MultiValidator(
                                                                  [
                                                                    RequiredValidator(
                                                                      errorText:
                                                                          "Please Enter Observation 4",
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                              TextFormField(
                                                                controller:
                                                                    elDefectsObs5Controller,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .text,
                                                                textInputAction:
                                                                    TextInputAction
                                                                        .next,
                                                                decoration: AppStyles
                                                                    .textFieldInputDecoration
                                                                    .copyWith(
                                                                  hintText:
                                                                      "Please Enter Observation 5 ",
                                                                  counterText:
                                                                      '',
                                                                ),
                                                                style: AppStyles
                                                                    .textInputTextStyle,
                                                                validator:
                                                                    MultiValidator(
                                                                  [
                                                                    RequiredValidator(
                                                                      errorText:
                                                                          "Please Enter Observation 5",
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),

                                                              Text(
                                                                "Criteria",
                                                                style: AppStyles
                                                                    .textfieldCaptionTextStyle,
                                                              ),
                                                              SizedBox(
                                                                height: 15,
                                                              ),
                                                              TextFormField(
                                                                controller:
                                                                    elDefectsCrieteriaController,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .text,
                                                                textInputAction:
                                                                    TextInputAction
                                                                        .next,
                                                                decoration: AppStyles
                                                                    .textFieldInputDecoration
                                                                    .copyWith(
                                                                  hintText:
                                                                      "As Per GSPL/IPQC/EL/020",
                                                                  counterText:
                                                                      '',
                                                                ),
                                                                style: AppStyles
                                                                    .textInputTextStyle,
                                                                readOnly: true,
                                                              ),
                                                              const SizedBox(
                                                                height: 15,
                                                              ),

                                                              Padding(
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                          0,
                                                                          10,
                                                                          0,
                                                                          0)),
                                                              _isLoading
                                                                  ? Center(
                                                                      child:
                                                                          CircularProgressIndicator())
                                                                  : AppButton(
                                                                      textStyle:
                                                                          const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.w700,
                                                                        color: AppColors
                                                                            .white,
                                                                        fontSize:
                                                                            16,
                                                                      ),
                                                                      onTap:
                                                                          () {
                                                                        AppHelper.hideKeyboard(
                                                                            context);
                                                                        // sendDataToBackend();

                                                                        // _registerFormKey
                                                                        //     .currentState!
                                                                        //     .save;
                                                                        // if (_registerFormKey
                                                                        //     .currentState!
                                                                        //     .validate()) {
                                                                        //   // sendDataToBackend();
                                                                        // }
                                                                        setState(
                                                                            () {
                                                                          setPage =
                                                                              'rfid';
                                                                        });
                                                                      },
                                                                      label:
                                                                          "Next",
                                                                      organization:
                                                                          '',
                                                                    ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              // Center(
                                                              //   child: Padding(
                                                              //     padding: const EdgeInsets.all(8.0),
                                                              //     child: InkWell(
                                                              //       onTap: () {
                                                              //         // Navigator.of(context).pushReplacement(
                                                              //         //     MaterialPageRoute(
                                                              //         //         builder: (BuildContext context) =>
                                                              //         //             LoginPage(
                                                              //         //                 appName: widget.appName)));
                                                              //       },
                                                              //       child: Text(
                                                              //         "BACK",
                                                              //         style: TextStyle(
                                                              //           fontFamily: appFontFamily,
                                                              //           fontSize: 16,
                                                              //           fontWeight: FontWeight.w500,
                                                              //           color: AppColors.redColor,
                                                              //         ),
                                                              //       ),
                                                              //     ),
                                                              //   ),
                                                              // ),
                                                              const SizedBox(
                                                                height: 25,
                                                              ),
                                                              Center(
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child:
                                                                      InkWell(
                                                                    onTap: () {
                                                                      setState(
                                                                          () {
                                                                        setPage =
                                                                            "hipot";
                                                                      });
                                                                      // Navigator.of(context).pushReplacement(
                                                                      //     MaterialPageRoute(
                                                                      //         builder: (BuildContext context) =>
                                                                      //             LoginPage(
                                                                      //                 appName: widget.appName)));
                                                                    },
                                                                    child:
                                                                        const Text(
                                                                      "BACK",
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              appFontFamily,
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          color:
                                                                              AppColors.redColor),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 25,
                                                              ),
                                                              Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child:
                                                                    const Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      "Powered By Gautam Solar Pvt. Ltd.",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        fontFamily:
                                                                            appFontFamily,
                                                                        color: AppColors
                                                                            .greyColor,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                /********************RFID Reading & Writing**************** */
                                                : setPage == "rfid"
                                                    ? Stack(
                                                        alignment:
                                                            Alignment.center,
                                                        fit: StackFit.expand,
                                                        children: [
                                                          SingleChildScrollView(
                                                            child: Form(
                                                              //  key: _registerFormKey,
                                                              autovalidateMode:
                                                                  AutovalidateMode
                                                                      .onUserInteraction,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: <Widget>[
                                                                  Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Image
                                                                            .asset(
                                                                          AppAssets
                                                                              .imgLogo,
                                                                          height:
                                                                              100,
                                                                          width:
                                                                              230,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  const Center(
                                                                      child: Padding(
                                                                          padding: EdgeInsets.only(
                                                                              top:
                                                                                  10),
                                                                          child: Text(
                                                                              "Incoming Process Quality Control",
                                                                              style: TextStyle(fontSize: 27, color: AppColors.black, fontFamily: appFontFamily, fontWeight: FontWeight.w700)))),
                                                                  const Center(
                                                                      child: Text(
                                                                          "(Post Lam IPQC Checklist)",
                                                                          style: TextStyle(
                                                                              fontSize: 20,
                                                                              color: AppColors.black,
                                                                              fontFamily: appFontFamily,
                                                                              fontWeight: FontWeight.w700))),
                                                                  const SizedBox(
                                                                    height: 35,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        'Document No : ',
                                                                        style: AppStyles
                                                                            .textfieldCaptionTextStyle,
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            8,
                                                                      ),
                                                                      Text(
                                                                        'GSPL/IPQC/IPC/003',
                                                                        style: AppStyles
                                                                            .textfieldCaptionTextStyle,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 8,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        'Rev.No. / Rev. Date : ',
                                                                        style: AppStyles
                                                                            .textfieldCaptionTextStyle,
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            8,
                                                                      ),
                                                                      Text(
                                                                        'Ver.2.0 / 20-03-2024',
                                                                        style: AppStyles
                                                                            .textfieldCaptionTextStyle,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  const Center(
                                                                      child: Text(
                                                                          "RFID Reading & Writing",
                                                                          style: TextStyle(
                                                                              fontSize: 20,
                                                                              color: Color.fromARGB(255, 13, 160, 0),
                                                                              fontFamily: appFontFamily,
                                                                              fontWeight: FontWeight.w700))),
                                                                  const SizedBox(
                                                                    height: 20,
                                                                  ),
                                                                  // RFID Availability of WI
                                                                  Text(
                                                                    "Frequency",
                                                                    style: AppStyles
                                                                        .textfieldCaptionTextStyle,
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        rfidWiFrequencyController,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    decoration: AppStyles
                                                                        .textFieldInputDecoration
                                                                        .copyWith(
                                                                      hintText:
                                                                          "Once a Shift",
                                                                      counterText:
                                                                          '',
                                                                    ),
                                                                    style: AppStyles
                                                                        .textInputTextStyle,
                                                                    readOnly:
                                                                        true,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  Text(
                                                                    "Avaibility of Wi ",
                                                                    style: AppStyles
                                                                        .textfieldCaptionTextStyle,
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        rfidWiController,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    decoration: AppStyles
                                                                        .textFieldInputDecoration
                                                                        .copyWith(
                                                                      hintText:
                                                                          "Please Enter Obsevation",
                                                                      counterText:
                                                                          '',
                                                                    ),
                                                                    style: AppStyles
                                                                        .textInputTextStyle,
                                                                    validator:
                                                                        MultiValidator(
                                                                      [
                                                                        RequiredValidator(
                                                                          errorText:
                                                                              "Please Enter Obsevation ",
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  Text(
                                                                    "Crieteria",
                                                                    style: AppStyles
                                                                        .textfieldCaptionTextStyle,
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        rfidWiCrieteriaController,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    decoration: AppStyles
                                                                        .textFieldInputDecoration
                                                                        .copyWith(
                                                                      hintText:
                                                                          "Must be present",
                                                                      counterText:
                                                                          '',
                                                                    ),
                                                                    style: AppStyles
                                                                        .textInputTextStyle,
                                                                    readOnly:
                                                                        true,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  Container(
                                                                    margin: EdgeInsets.symmetric(
                                                                        vertical:
                                                                            10.0),
                                                                    child:
                                                                        Divider(
                                                                      color: Colors
                                                                          .black,
                                                                      height:
                                                                          2.0,
                                                                      thickness:
                                                                          2.0,
                                                                    ),
                                                                  ),
                                                                  //Fixing position
                                                                  Text(
                                                                    "Frequency",
                                                                    style: AppStyles
                                                                        .textfieldCaptionTextStyle,
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        rfidFixingFrequencyController,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    decoration: AppStyles
                                                                        .textFieldInputDecoration
                                                                        .copyWith(
                                                                      hintText:
                                                                          "5 Piece Per Shift",
                                                                      counterText:
                                                                          '',
                                                                    ),
                                                                    style: AppStyles
                                                                        .textInputTextStyle,
                                                                    readOnly:
                                                                        true,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  Text(
                                                                    "Fixing position",
                                                                    style: AppStyles
                                                                        .textfieldCaptionTextStyle,
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        rfidFixingObs1Controller,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    decoration: AppStyles
                                                                        .textFieldInputDecoration
                                                                        .copyWith(
                                                                      hintText:
                                                                          "Please Enter Obsevation 1",
                                                                      counterText:
                                                                          '',
                                                                    ),
                                                                    style: AppStyles
                                                                        .textInputTextStyle,
                                                                    validator:
                                                                        MultiValidator(
                                                                      [
                                                                        RequiredValidator(
                                                                          errorText:
                                                                              "Please Enter Obsevation 1",
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        rfidFixingObs2Controller,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    decoration: AppStyles
                                                                        .textFieldInputDecoration
                                                                        .copyWith(
                                                                      hintText:
                                                                          "Please Enter Obsevation 2",
                                                                      counterText:
                                                                          '',
                                                                    ),
                                                                    style: AppStyles
                                                                        .textInputTextStyle,
                                                                    validator:
                                                                        MultiValidator(
                                                                      [
                                                                        RequiredValidator(
                                                                          errorText:
                                                                              "Please Enter Obsevation 2",
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        rfidFixingObs3Controller,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    decoration: AppStyles
                                                                        .textFieldInputDecoration
                                                                        .copyWith(
                                                                      hintText:
                                                                          "Please Enter Obsevation 3",
                                                                      counterText:
                                                                          '',
                                                                    ),
                                                                    style: AppStyles
                                                                        .textInputTextStyle,
                                                                    validator:
                                                                        MultiValidator(
                                                                      [
                                                                        RequiredValidator(
                                                                          errorText:
                                                                              "Please Enter Obsevation 3",
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        rfidFixingObs4Controller,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    decoration: AppStyles
                                                                        .textFieldInputDecoration
                                                                        .copyWith(
                                                                      hintText:
                                                                          "Please Enter Obsevation 4",
                                                                      counterText:
                                                                          '',
                                                                    ),
                                                                    style: AppStyles
                                                                        .textInputTextStyle,
                                                                    validator:
                                                                        MultiValidator(
                                                                      [
                                                                        RequiredValidator(
                                                                          errorText:
                                                                              "Please Enter Obsevation 4",
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        rfidFixingObs5Controller,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    decoration: AppStyles
                                                                        .textFieldInputDecoration
                                                                        .copyWith(
                                                                      hintText:
                                                                          "Please Enter Obsevation 5",
                                                                      counterText:
                                                                          '',
                                                                    ),
                                                                    style: AppStyles
                                                                        .textInputTextStyle,
                                                                    validator:
                                                                        MultiValidator(
                                                                      [
                                                                        RequiredValidator(
                                                                          errorText:
                                                                              "Please Enter Obsevation 5",
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  Text(
                                                                    "Crieteria",
                                                                    style: AppStyles
                                                                        .textfieldCaptionTextStyle,
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        rfidFixingCrieteriaController,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    decoration: AppStyles
                                                                        .textFieldInputDecoration
                                                                        .copyWith(
                                                                      hintText:
                                                                          "As per process Card",
                                                                      counterText:
                                                                          '',
                                                                    ),
                                                                    style: AppStyles
                                                                        .textInputTextStyle,
                                                                    readOnly:
                                                                        true,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  Container(
                                                                    margin: EdgeInsets.symmetric(
                                                                        vertical:
                                                                            10.0),
                                                                    child:
                                                                        Divider(
                                                                      color: Colors
                                                                          .black,
                                                                      height:
                                                                          2.0,
                                                                      thickness:
                                                                          2.0,
                                                                    ),
                                                                  ),
                                                                  // Tag read & write
                                                                  Text(
                                                                    "Frequency",
                                                                    style: AppStyles
                                                                        .textfieldCaptionTextStyle,
                                                                  ),
                                                                  SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        rfidTagFrequencyController,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    decoration: AppStyles
                                                                        .textFieldInputDecoration
                                                                        .copyWith(
                                                                      hintText:
                                                                          "Continuos ",
                                                                      counterText:
                                                                          '',
                                                                    ),
                                                                    style: AppStyles
                                                                        .textInputTextStyle,
                                                                    readOnly:
                                                                        true,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  Text(
                                                                    "Tag read & write",
                                                                    style: AppStyles
                                                                        .textfieldCaptionTextStyle,
                                                                  ),
                                                                  SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        rfidTagController,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    decoration: AppStyles
                                                                        .textFieldInputDecoration
                                                                        .copyWith(
                                                                      hintText:
                                                                          "Please Enter Observation  ",
                                                                      counterText:
                                                                          '',
                                                                    ),
                                                                    style: AppStyles
                                                                        .textInputTextStyle,
                                                                    validator:
                                                                        MultiValidator(
                                                                      [
                                                                        RequiredValidator(
                                                                          errorText:
                                                                              "Please Enter Observation ",
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),

                                                                  Text(
                                                                    "Criteria",
                                                                    style: AppStyles
                                                                        .textfieldCaptionTextStyle,
                                                                  ),
                                                                  SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        rfidTagCrieteriaController,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    decoration: AppStyles
                                                                        .textFieldInputDecoration
                                                                        .copyWith(
                                                                      hintText:
                                                                          "Tag should be read & write Content should comply MNRE guidlin",
                                                                      counterText:
                                                                          '',
                                                                    ),
                                                                    style: AppStyles
                                                                        .textInputTextStyle,
                                                                    readOnly:
                                                                        true,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),

                                                                  Container(
                                                                    margin: EdgeInsets.symmetric(
                                                                        vertical:
                                                                            10.0),
                                                                    child:
                                                                        Divider(
                                                                      color: Colors
                                                                          .black,
                                                                      height:
                                                                          2.0,
                                                                      thickness:
                                                                          2.0,
                                                                    ),
                                                                  ),
                                                                  // Certification Date Verification
                                                                  Text(
                                                                    "Frequency",
                                                                    style: AppStyles
                                                                        .textfieldCaptionTextStyle,
                                                                  ),
                                                                  SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        rfidCertificationFrequencyController,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    decoration: AppStyles
                                                                        .textFieldInputDecoration
                                                                        .copyWith(
                                                                      hintText:
                                                                          "Once a Shift ",
                                                                      counterText:
                                                                          '',
                                                                    ),
                                                                    style: AppStyles
                                                                        .textInputTextStyle,
                                                                    readOnly:
                                                                        true,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  Text(
                                                                    "Certification Date Verification",
                                                                    style: AppStyles
                                                                        .textfieldCaptionTextStyle,
                                                                  ),
                                                                  SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        rfidCertificationController,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    decoration: AppStyles
                                                                        .textFieldInputDecoration
                                                                        .copyWith(
                                                                      hintText:
                                                                          "Please Enter Observation  ",
                                                                      counterText:
                                                                          '',
                                                                    ),
                                                                    style: AppStyles
                                                                        .textInputTextStyle,
                                                                    validator:
                                                                        MultiValidator(
                                                                      [
                                                                        RequiredValidator(
                                                                          errorText:
                                                                              "Please Enter Observation ",
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),

                                                                  Text(
                                                                    "Criteria",
                                                                    style: AppStyles
                                                                        .textfieldCaptionTextStyle,
                                                                  ),
                                                                  SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        rfidCertificationCrieteriaController,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    decoration: AppStyles
                                                                        .textFieldInputDecoration
                                                                        .copyWith(
                                                                      hintText:
                                                                          "As per IEC/UL REPORT(As applicable)",
                                                                      counterText:
                                                                          '',
                                                                    ),
                                                                    style: AppStyles
                                                                        .textInputTextStyle,
                                                                    readOnly:
                                                                        true,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),

                                                                  Container(
                                                                    margin: EdgeInsets.symmetric(
                                                                        vertical:
                                                                            10.0),
                                                                    child:
                                                                        Divider(
                                                                      color: Colors
                                                                          .black,
                                                                      height:
                                                                          2.0,
                                                                      thickness:
                                                                          2.0,
                                                                    ),
                                                                  ),

                                                                  /// Cell Make &Manufacturing Month Verification
                                                                  Text(
                                                                    "Frequency",
                                                                    style: AppStyles
                                                                        .textfieldCaptionTextStyle,
                                                                  ),
                                                                  SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        rfidCellFrequencyController,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    decoration: AppStyles
                                                                        .textFieldInputDecoration
                                                                        .copyWith(
                                                                      hintText:
                                                                          "Once a Shift ",
                                                                      counterText:
                                                                          '',
                                                                    ),
                                                                    style: AppStyles
                                                                        .textInputTextStyle,
                                                                    readOnly:
                                                                        true,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  Text(
                                                                    "Cell Make &Manufacturing Month Verification",
                                                                    style: AppStyles
                                                                        .textfieldCaptionTextStyle,
                                                                  ),
                                                                  SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        rfidCellController,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    decoration: AppStyles
                                                                        .textFieldInputDecoration
                                                                        .copyWith(
                                                                      hintText:
                                                                          "Please Enter Observation  ",
                                                                      counterText:
                                                                          '',
                                                                    ),
                                                                    style: AppStyles
                                                                        .textInputTextStyle,
                                                                    validator:
                                                                        MultiValidator(
                                                                      [
                                                                        RequiredValidator(
                                                                          errorText:
                                                                              "Please Enter Observation ",
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),

                                                                  Text(
                                                                    "Criteria",
                                                                    style: AppStyles
                                                                        .textfieldCaptionTextStyle,
                                                                  ),
                                                                  SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        rfidCellCrieteriaController,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    decoration: AppStyles
                                                                        .textFieldInputDecoration
                                                                        .copyWith(
                                                                      hintText:
                                                                          "As per BOM",
                                                                      counterText:
                                                                          '',
                                                                    ),
                                                                    style: AppStyles
                                                                        .textInputTextStyle,
                                                                    readOnly:
                                                                        true,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),

                                                                  Container(
                                                                    margin: EdgeInsets.symmetric(
                                                                        vertical:
                                                                            10.0),
                                                                    child:
                                                                        Divider(
                                                                      color: Colors
                                                                          .black,
                                                                      height:
                                                                          2.0,
                                                                      thickness:
                                                                          2.0,
                                                                    ),
                                                                  ),
                                                                  // Module Manufacturing Month Verification
                                                                  Text(
                                                                    "Frequency",
                                                                    style: AppStyles
                                                                        .textfieldCaptionTextStyle,
                                                                  ),
                                                                  SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        rfidModuleFrequencyController,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    decoration: AppStyles
                                                                        .textFieldInputDecoration
                                                                        .copyWith(
                                                                      hintText:
                                                                          "Once a Shift ",
                                                                      counterText:
                                                                          '',
                                                                    ),
                                                                    style: AppStyles
                                                                        .textInputTextStyle,
                                                                    readOnly:
                                                                        true,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  Text(
                                                                    "Module Manufacturing Month Verification",
                                                                    style: AppStyles
                                                                        .textfieldCaptionTextStyle,
                                                                  ),
                                                                  SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        rfidModuleController,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    decoration: AppStyles
                                                                        .textFieldInputDecoration
                                                                        .copyWith(
                                                                      hintText:
                                                                          "Please Enter Observation  ",
                                                                      counterText:
                                                                          '',
                                                                    ),
                                                                    style: AppStyles
                                                                        .textInputTextStyle,
                                                                    validator:
                                                                        MultiValidator(
                                                                      [
                                                                        RequiredValidator(
                                                                          errorText:
                                                                              "Please Enter Observation ",
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),

                                                                  Text(
                                                                    "Criteria",
                                                                    style: AppStyles
                                                                        .textfieldCaptionTextStyle,
                                                                  ),
                                                                  SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  TextFormField(
                                                                    controller:
                                                                        rfidModuleCrieteriaController,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .next,
                                                                    decoration: AppStyles
                                                                        .textFieldInputDecoration
                                                                        .copyWith(
                                                                      hintText:
                                                                          "As per process Card",
                                                                      counterText:
                                                                          '',
                                                                    ),
                                                                    style: AppStyles
                                                                        .textInputTextStyle,
                                                                    readOnly:
                                                                        true,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 15,
                                                                  ),

                                                                  Padding(
                                                                      padding: EdgeInsets
                                                                          .fromLTRB(
                                                                              0,
                                                                              10,
                                                                              0,
                                                                              0)),
                                                                  _isLoading
                                                                      ? Center(
                                                                          child:
                                                                              CircularProgressIndicator())
                                                                      : AppButton(
                                                                          textStyle:
                                                                              const TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w700,
                                                                            color:
                                                                                AppColors.white,
                                                                            fontSize:
                                                                                16,
                                                                          ),
                                                                          onTap:
                                                                              () {
                                                                            AppHelper.hideKeyboard(context);
                                                                            // sendDataToBackend();

                                                                            _registerFormKey.currentState!.save;
                                                                            // if (_registerFormKey
                                                                            //     .currentState!
                                                                            //     .validate()) {
                                                                            //   // sendDataToBackend();
                                                                            // }
                                                                            setState(() {
                                                                              setPage = 'backlabel';
                                                                            });
                                                                          },
                                                                          label:
                                                                              "Next",
                                                                          organization:
                                                                              '',
                                                                        ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  // Center(
                                                                  //   child: Padding(
                                                                  //     padding: const EdgeInsets.all(8.0),
                                                                  //     child: InkWell(
                                                                  //       onTap: () {
                                                                  //         // Navigator.of(context).pushReplacement(
                                                                  //         //     MaterialPageRoute(
                                                                  //         //         builder: (BuildContext context) =>
                                                                  //         //             LoginPage(
                                                                  //         //                 appName: widget.appName)));
                                                                  //       },
                                                                  //       child: Text(
                                                                  //         "BACK",
                                                                  //         style: TextStyle(
                                                                  //           fontFamily: appFontFamily,
                                                                  //           fontSize: 16,
                                                                  //           fontWeight: FontWeight.w500,
                                                                  //           color: AppColors.redColor,
                                                                  //         ),
                                                                  //       ),
                                                                  //     ),
                                                                  //   ),
                                                                  // ),
                                                                  const SizedBox(
                                                                    height: 25,
                                                                  ),
                                                                  Center(
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                      child:
                                                                          InkWell(
                                                                        onTap:
                                                                            () {
                                                                          setState(
                                                                              () {
                                                                            setPage =
                                                                                "finalel";
                                                                          });
                                                                          // Navigator.of(context).pushReplacement(
                                                                          //     MaterialPageRoute(
                                                                          //         builder: (BuildContext context) =>
                                                                          //             LoginPage(
                                                                          //                 appName: widget.appName)));
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "BACK",
                                                                          style: TextStyle(
                                                                              fontFamily: appFontFamily,
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.w500,
                                                                              color: AppColors.redColor),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 25,
                                                                  ),
                                                                  Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    child:
                                                                        const Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          "Powered By Gautam Solar Pvt. Ltd.",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            fontFamily:
                                                                                appFontFamily,
                                                                            color:
                                                                                AppColors.greyColor,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    /****************Back Label****************** */
                                                    : setPage == "backlabel"
                                                        ? Stack(
                                                            alignment: Alignment
                                                                .center,
                                                            fit:
                                                                StackFit.expand,
                                                            children: [
                                                              SingleChildScrollView(
                                                                child: Form(
                                                                  //  key: _registerFormKey,
                                                                  autovalidateMode:
                                                                      AutovalidateMode
                                                                          .onUserInteraction,
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: <Widget>[
                                                                      Container(
                                                                        alignment:
                                                                            Alignment.center,
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Image.asset(
                                                                              AppAssets.imgLogo,
                                                                              height: 100,
                                                                              width: 230,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      const Center(
                                                                          child: Padding(
                                                                              padding: EdgeInsets.only(top: 10),
                                                                              child: Text("Incoming Process Quality Control", style: TextStyle(fontSize: 27, color: AppColors.black, fontFamily: appFontFamily, fontWeight: FontWeight.w700)))),
                                                                      const Center(
                                                                          child: Text(
                                                                              "(Post Lam IPQC Checklist)",
                                                                              style: TextStyle(fontSize: 20, color: AppColors.black, fontFamily: appFontFamily, fontWeight: FontWeight.w700))),
                                                                      const SizedBox(
                                                                        height:
                                                                            35,
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            'Document No : ',
                                                                            style:
                                                                                AppStyles.textfieldCaptionTextStyle,
                                                                          ),
                                                                          const SizedBox(
                                                                            width:
                                                                                8,
                                                                          ),
                                                                          Text(
                                                                            'GSPL/IPQC/IPC/003',
                                                                            style:
                                                                                AppStyles.textfieldCaptionTextStyle,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            8,
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            'Rev.No. / Rev. Date : ',
                                                                            style:
                                                                                AppStyles.textfieldCaptionTextStyle,
                                                                          ),
                                                                          const SizedBox(
                                                                            width:
                                                                                8,
                                                                          ),
                                                                          Text(
                                                                            'Ver.2.0 / 20-03-2024',
                                                                            style:
                                                                                AppStyles.textfieldCaptionTextStyle,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      const Center(
                                                                          child: Text(
                                                                              "Back Label",
                                                                              style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 13, 160, 0), fontFamily: appFontFamily, fontWeight: FontWeight.w700))),
                                                                      const SizedBox(
                                                                        height:
                                                                            20,
                                                                      ),
                                                                      // Back Label Data Verification
                                                                      Text(
                                                                        "Frequency",
                                                                        style: AppStyles
                                                                            .textfieldCaptionTextStyle,
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            5,
                                                                      ),
                                                                      TextFormField(
                                                                        controller:
                                                                            backLabelDataFrequencyController,
                                                                        keyboardType:
                                                                            TextInputType.text,
                                                                        textInputAction:
                                                                            TextInputAction.next,
                                                                        decoration: AppStyles
                                                                            .textFieldInputDecoration
                                                                            .copyWith(
                                                                          hintText:
                                                                              "5 Piece Per Shift",
                                                                          counterText:
                                                                              '',
                                                                        ),
                                                                        style: AppStyles
                                                                            .textInputTextStyle,
                                                                        readOnly:
                                                                            true,
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      Text(
                                                                        "Data Verification",
                                                                        style: AppStyles
                                                                            .textfieldCaptionTextStyle,
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            5,
                                                                      ),
                                                                      TextFormField(
                                                                        controller:
                                                                            backLabelDataObs1Controller,
                                                                        keyboardType:
                                                                            TextInputType.text,
                                                                        textInputAction:
                                                                            TextInputAction.next,
                                                                        decoration: AppStyles
                                                                            .textFieldInputDecoration
                                                                            .copyWith(
                                                                          hintText:
                                                                              "Please Enter Obsevation 1",
                                                                          counterText:
                                                                              '',
                                                                        ),
                                                                        style: AppStyles
                                                                            .textInputTextStyle,
                                                                        validator:
                                                                            MultiValidator(
                                                                          [
                                                                            RequiredValidator(
                                                                              errorText: "Please Enter Obsevation 1",
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      TextFormField(
                                                                        controller:
                                                                            backLabelDataObs2Controller,
                                                                        keyboardType:
                                                                            TextInputType.text,
                                                                        textInputAction:
                                                                            TextInputAction.next,
                                                                        decoration: AppStyles
                                                                            .textFieldInputDecoration
                                                                            .copyWith(
                                                                          hintText:
                                                                              "Please Enter Obsevation 2",
                                                                          counterText:
                                                                              '',
                                                                        ),
                                                                        style: AppStyles
                                                                            .textInputTextStyle,
                                                                        validator:
                                                                            MultiValidator(
                                                                          [
                                                                            RequiredValidator(
                                                                              errorText: "Please Enter Obsevation 2",
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      TextFormField(
                                                                        controller:
                                                                            backLabelDataObs3Controller,
                                                                        keyboardType:
                                                                            TextInputType.text,
                                                                        textInputAction:
                                                                            TextInputAction.next,
                                                                        decoration: AppStyles
                                                                            .textFieldInputDecoration
                                                                            .copyWith(
                                                                          hintText:
                                                                              "Please Enter Obsevation 3",
                                                                          counterText:
                                                                              '',
                                                                        ),
                                                                        style: AppStyles
                                                                            .textInputTextStyle,
                                                                        validator:
                                                                            MultiValidator(
                                                                          [
                                                                            RequiredValidator(
                                                                              errorText: "Please Enter Obsevation 3",
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      TextFormField(
                                                                        controller:
                                                                            backLabelDataObs4Controller,
                                                                        keyboardType:
                                                                            TextInputType.text,
                                                                        textInputAction:
                                                                            TextInputAction.next,
                                                                        decoration: AppStyles
                                                                            .textFieldInputDecoration
                                                                            .copyWith(
                                                                          hintText:
                                                                              "Please Enter Obsevation 4",
                                                                          counterText:
                                                                              '',
                                                                        ),
                                                                        style: AppStyles
                                                                            .textInputTextStyle,
                                                                        validator:
                                                                            MultiValidator(
                                                                          [
                                                                            RequiredValidator(
                                                                              errorText: "Please Enter Obsevation 4",
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      TextFormField(
                                                                        controller:
                                                                            backLabelDataObs5Controller,
                                                                        keyboardType:
                                                                            TextInputType.text,
                                                                        textInputAction:
                                                                            TextInputAction.next,
                                                                        decoration: AppStyles
                                                                            .textFieldInputDecoration
                                                                            .copyWith(
                                                                          hintText:
                                                                              "Please Enter Obsevation 5",
                                                                          counterText:
                                                                              '',
                                                                        ),
                                                                        style: AppStyles
                                                                            .textInputTextStyle,
                                                                        validator:
                                                                            MultiValidator(
                                                                          [
                                                                            RequiredValidator(
                                                                              errorText: "Please Enter Obsevation 5",
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      Text(
                                                                        "Crieteria",
                                                                        style: AppStyles
                                                                            .textfieldCaptionTextStyle,
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            5,
                                                                      ),
                                                                      TextFormField(
                                                                        controller:
                                                                            backLabelDataCrieteriaController,
                                                                        keyboardType:
                                                                            TextInputType.text,
                                                                        textInputAction:
                                                                            TextInputAction.next,
                                                                        decoration: AppStyles
                                                                            .textFieldInputDecoration
                                                                            .copyWith(
                                                                          hintText:
                                                                              "As per Datasheet/process card",
                                                                          counterText:
                                                                              '',
                                                                        ),
                                                                        style: AppStyles
                                                                            .textInputTextStyle,
                                                                        readOnly:
                                                                            true,
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      Container(
                                                                        margin: EdgeInsets.symmetric(
                                                                            vertical:
                                                                                10.0),
                                                                        child:
                                                                            Divider(
                                                                          color:
                                                                              Colors.black,
                                                                          height:
                                                                              2.0,
                                                                          thickness:
                                                                              2.0,
                                                                        ),
                                                                      ),

                                                                      // Air Bubbles,Tilt & Misprint
                                                                      Text(
                                                                        "Frequency",
                                                                        style: AppStyles
                                                                            .textfieldCaptionTextStyle,
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      TextFormField(
                                                                        controller:
                                                                            backLabelAirFrequencyController,
                                                                        keyboardType:
                                                                            TextInputType.text,
                                                                        textInputAction:
                                                                            TextInputAction.next,
                                                                        decoration: AppStyles
                                                                            .textFieldInputDecoration
                                                                            .copyWith(
                                                                          hintText:
                                                                              "5 Piece  per Shift ",
                                                                          counterText:
                                                                              '',
                                                                        ),
                                                                        style: AppStyles
                                                                            .textInputTextStyle,
                                                                        readOnly:
                                                                            true,
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      Text(
                                                                        "Air Bubbles,Tilt & Misprint",
                                                                        style: AppStyles
                                                                            .textfieldCaptionTextStyle,
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      TextFormField(
                                                                        controller:
                                                                            backLabelAirObs1Controller,
                                                                        keyboardType:
                                                                            TextInputType.text,
                                                                        textInputAction:
                                                                            TextInputAction.next,
                                                                        decoration: AppStyles
                                                                            .textFieldInputDecoration
                                                                            .copyWith(
                                                                          hintText:
                                                                              "Please Enter Observation 1 ",
                                                                          counterText:
                                                                              '',
                                                                        ),
                                                                        style: AppStyles
                                                                            .textInputTextStyle,
                                                                        validator:
                                                                            MultiValidator(
                                                                          [
                                                                            RequiredValidator(
                                                                              errorText: "Please Enter Observation 1",
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      TextFormField(
                                                                        controller:
                                                                            backLabelAirObs2Controller,
                                                                        keyboardType:
                                                                            TextInputType.text,
                                                                        textInputAction:
                                                                            TextInputAction.next,
                                                                        decoration: AppStyles
                                                                            .textFieldInputDecoration
                                                                            .copyWith(
                                                                          hintText:
                                                                              "Please Enter Observation 2 ",
                                                                          counterText:
                                                                              '',
                                                                        ),
                                                                        style: AppStyles
                                                                            .textInputTextStyle,
                                                                        validator:
                                                                            MultiValidator(
                                                                          [
                                                                            RequiredValidator(
                                                                              errorText: "Please Enter Observation 2",
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      TextFormField(
                                                                        controller:
                                                                            backLabelAirObs3Controller,
                                                                        keyboardType:
                                                                            TextInputType.text,
                                                                        textInputAction:
                                                                            TextInputAction.next,
                                                                        decoration: AppStyles
                                                                            .textFieldInputDecoration
                                                                            .copyWith(
                                                                          hintText:
                                                                              "Please Enter Observation 3 ",
                                                                          counterText:
                                                                              '',
                                                                        ),
                                                                        style: AppStyles
                                                                            .textInputTextStyle,
                                                                        validator:
                                                                            MultiValidator(
                                                                          [
                                                                            RequiredValidator(
                                                                              errorText: "Please Enter Observation 3",
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      TextFormField(
                                                                        controller:
                                                                            backLabelAirObs4Controller,
                                                                        keyboardType:
                                                                            TextInputType.text,
                                                                        textInputAction:
                                                                            TextInputAction.next,
                                                                        decoration: AppStyles
                                                                            .textFieldInputDecoration
                                                                            .copyWith(
                                                                          hintText:
                                                                              "Please Enter Observation 4 ",
                                                                          counterText:
                                                                              '',
                                                                        ),
                                                                        style: AppStyles
                                                                            .textInputTextStyle,
                                                                        validator:
                                                                            MultiValidator(
                                                                          [
                                                                            RequiredValidator(
                                                                              errorText: "Please Enter Observation 4",
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      TextFormField(
                                                                        controller:
                                                                            backLabelAirObs5Controller,
                                                                        keyboardType:
                                                                            TextInputType.text,
                                                                        textInputAction:
                                                                            TextInputAction.next,
                                                                        decoration: AppStyles
                                                                            .textFieldInputDecoration
                                                                            .copyWith(
                                                                          hintText:
                                                                              "Please Enter Observation 5 ",
                                                                          counterText:
                                                                              '',
                                                                        ),
                                                                        style: AppStyles
                                                                            .textInputTextStyle,
                                                                        validator:
                                                                            MultiValidator(
                                                                          [
                                                                            RequiredValidator(
                                                                              errorText: "Please Enter Observation 5",
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),

                                                                      Text(
                                                                        "Criteria",
                                                                        style: AppStyles
                                                                            .textfieldCaptionTextStyle,
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),
                                                                      TextFormField(
                                                                        controller:
                                                                            backLabelAirCrieteriaController,
                                                                        keyboardType:
                                                                            TextInputType.text,
                                                                        textInputAction:
                                                                            TextInputAction.next,
                                                                        decoration: AppStyles
                                                                            .textFieldInputDecoration
                                                                            .copyWith(
                                                                          hintText:
                                                                              "Not Acceptable",
                                                                          counterText:
                                                                              '',
                                                                        ),
                                                                        style: AppStyles
                                                                            .textInputTextStyle,
                                                                        readOnly:
                                                                            true,
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            15,
                                                                      ),

                                                                      Padding(
                                                                          padding: EdgeInsets.fromLTRB(
                                                                              0,
                                                                              10,
                                                                              0,
                                                                              0)),
                                                                      _isLoading
                                                                          ? Center(
                                                                              child: CircularProgressIndicator())
                                                                          : AppButton(
                                                                              textStyle: const TextStyle(
                                                                                fontWeight: FontWeight.w700,
                                                                                color: AppColors.white,
                                                                                fontSize: 16,
                                                                              ),
                                                                              onTap: () {
                                                                                AppHelper.hideKeyboard(context);
                                                                                // sendDataToBackend();

                                                                                _registerFormKey.currentState!.save;
                                                                                // if (_registerFormKey
                                                                                //     .currentState!
                                                                                //     .validate()) {
                                                                                //   // sendDataToBackend();
                                                                                // }
                                                                                setState(() {
                                                                                  setPage = 'finalvisual';
                                                                                });
                                                                              },
                                                                              label: "Next",
                                                                              organization: '',
                                                                            ),
                                                                      const SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      // Center(
                                                                      //   child: Padding(
                                                                      //     padding: const EdgeInsets.all(8.0),
                                                                      //     child: InkWell(
                                                                      //       onTap: () {
                                                                      //         // Navigator.of(context).pushReplacement(
                                                                      //         //     MaterialPageRoute(
                                                                      //         //         builder: (BuildContext context) =>
                                                                      //         //             LoginPage(
                                                                      //         //                 appName: widget.appName)));
                                                                      //       },
                                                                      //       child: Text(
                                                                      //         "BACK",
                                                                      //         style: TextStyle(
                                                                      //           fontFamily: appFontFamily,
                                                                      //           fontSize: 16,
                                                                      //           fontWeight: FontWeight.w500,
                                                                      //           color: AppColors.redColor,
                                                                      //         ),
                                                                      //       ),
                                                                      //     ),
                                                                      //   ),
                                                                      // ),
                                                                      const SizedBox(
                                                                        height:
                                                                            25,
                                                                      ),
                                                                      Center(
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              8.0),
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () {
                                                                              setState(() {
                                                                                setPage = "rfid";
                                                                              });
                                                                              // Navigator.of(context).pushReplacement(
                                                                              //     MaterialPageRoute(
                                                                              //         builder: (BuildContext context) =>
                                                                              //             LoginPage(
                                                                              //                 appName: widget.appName)));
                                                                            },
                                                                            child:
                                                                                const Text(
                                                                              "BACK",
                                                                              style: TextStyle(fontFamily: appFontFamily, fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.redColor),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            25,
                                                                      ),
                                                                      Container(
                                                                        alignment:
                                                                            Alignment.center,
                                                                        child:
                                                                            const Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              "Powered By Gautam Solar Pvt. Ltd.",
                                                                              style: TextStyle(
                                                                                fontSize: 14,
                                                                                fontFamily: appFontFamily,
                                                                                color: AppColors.greyColor,
                                                                                fontWeight: FontWeight.w400,
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        /*******************************Final Visual Inspection */
                                                        : setPage ==
                                                                "finalvisual"
                                                            ? Stack(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                fit: StackFit
                                                                    .expand,
                                                                children: [
                                                                  SingleChildScrollView(
                                                                    child: Form(
                                                                      //  key: _registerFormKey,
                                                                      autovalidateMode:
                                                                          AutovalidateMode
                                                                              .onUserInteraction,
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: <Widget>[
                                                                          Container(
                                                                            alignment:
                                                                                Alignment.center,
                                                                            child:
                                                                                Column(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Image.asset(
                                                                                  AppAssets.imgLogo,
                                                                                  height: 100,
                                                                                  width: 230,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          const Center(
                                                                              child: Padding(padding: EdgeInsets.only(top: 10), child: Text("Incoming Process Quality Control", style: TextStyle(fontSize: 27, color: AppColors.black, fontFamily: appFontFamily, fontWeight: FontWeight.w700)))),
                                                                          const Center(
                                                                              child: Text("(Post Lam IPQC Checklist)", style: TextStyle(fontSize: 20, color: AppColors.black, fontFamily: appFontFamily, fontWeight: FontWeight.w700))),
                                                                          const SizedBox(
                                                                            height:
                                                                                35,
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              Text(
                                                                                'Document No : ',
                                                                                style: AppStyles.textfieldCaptionTextStyle,
                                                                              ),
                                                                              const SizedBox(
                                                                                width: 8,
                                                                              ),
                                                                              Text(
                                                                                'GSPL/IPQC/IPC/003',
                                                                                style: AppStyles.textfieldCaptionTextStyle,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                8,
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              Text(
                                                                                'Rev.No. / Rev. Date : ',
                                                                                style: AppStyles.textfieldCaptionTextStyle,
                                                                              ),
                                                                              const SizedBox(
                                                                                width: 8,
                                                                              ),
                                                                              Text(
                                                                                'Ver.2.0 / 20-03-2024',
                                                                                style: AppStyles.textfieldCaptionTextStyle,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                15,
                                                                          ),
                                                                          const Center(
                                                                              child: Text("Final Visual Inspection", style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 13, 160, 0), fontFamily: appFontFamily, fontWeight: FontWeight.w700))),
                                                                          const SizedBox(
                                                                            height:
                                                                                20,
                                                                          ),
                                                                          // Visual inspection
                                                                          Text(
                                                                            "Frequency",
                                                                            style:
                                                                                AppStyles.textfieldCaptionTextStyle,
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                5,
                                                                          ),
                                                                          TextFormField(
                                                                            controller:
                                                                                finalInspectionFrequencyController,
                                                                            keyboardType:
                                                                                TextInputType.text,
                                                                            textInputAction:
                                                                                TextInputAction.next,
                                                                            decoration:
                                                                                AppStyles.textFieldInputDecoration.copyWith(
                                                                              hintText: "5 Piece per Shift",
                                                                              counterText: '',
                                                                            ),
                                                                            style:
                                                                                AppStyles.textInputTextStyle,
                                                                            readOnly:
                                                                                true,
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                15,
                                                                          ),
                                                                          Text(
                                                                            "Visual inspection ",
                                                                            style:
                                                                                AppStyles.textfieldCaptionTextStyle,
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                5,
                                                                          ),
                                                                          TextFormField(
                                                                            controller:
                                                                                finalInspectionObs1Controller,
                                                                            keyboardType:
                                                                                TextInputType.text,
                                                                            textInputAction:
                                                                                TextInputAction.next,
                                                                            decoration:
                                                                                AppStyles.textFieldInputDecoration.copyWith(
                                                                              hintText: "Please Enter Obsevation 1",
                                                                              counterText: '',
                                                                            ),
                                                                            style:
                                                                                AppStyles.textInputTextStyle,
                                                                            validator:
                                                                                MultiValidator(
                                                                              [
                                                                                RequiredValidator(
                                                                                  errorText: "Please Enter Obsevation 1 ",
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                15,
                                                                          ),
                                                                          TextFormField(
                                                                            controller:
                                                                                finalInspectionObs2Controller,
                                                                            keyboardType:
                                                                                TextInputType.text,
                                                                            textInputAction:
                                                                                TextInputAction.next,
                                                                            decoration:
                                                                                AppStyles.textFieldInputDecoration.copyWith(
                                                                              hintText: "Please Enter Obsevation 2",
                                                                              counterText: '',
                                                                            ),
                                                                            style:
                                                                                AppStyles.textInputTextStyle,
                                                                            validator:
                                                                                MultiValidator(
                                                                              [
                                                                                RequiredValidator(
                                                                                  errorText: "Please Enter Obsevation 2 ",
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                15,
                                                                          ),
                                                                          TextFormField(
                                                                            controller:
                                                                                finalInspectionObs3Controller,
                                                                            keyboardType:
                                                                                TextInputType.text,
                                                                            textInputAction:
                                                                                TextInputAction.next,
                                                                            decoration:
                                                                                AppStyles.textFieldInputDecoration.copyWith(
                                                                              hintText: "Please Enter Obsevation 3",
                                                                              counterText: '',
                                                                            ),
                                                                            style:
                                                                                AppStyles.textInputTextStyle,
                                                                            validator:
                                                                                MultiValidator(
                                                                              [
                                                                                RequiredValidator(
                                                                                  errorText: "Please Enter Obsevation 3 ",
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                15,
                                                                          ),
                                                                          TextFormField(
                                                                            controller:
                                                                                finalInspectionObs4Controller,
                                                                            keyboardType:
                                                                                TextInputType.text,
                                                                            textInputAction:
                                                                                TextInputAction.next,
                                                                            decoration:
                                                                                AppStyles.textFieldInputDecoration.copyWith(
                                                                              hintText: "Please Enter Obsevation 4",
                                                                              counterText: '',
                                                                            ),
                                                                            style:
                                                                                AppStyles.textInputTextStyle,
                                                                            validator:
                                                                                MultiValidator(
                                                                              [
                                                                                RequiredValidator(
                                                                                  errorText: "Please Enter Obsevation 4 ",
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                15,
                                                                          ),
                                                                          TextFormField(
                                                                            controller:
                                                                                finalInspectionObs5Controller,
                                                                            keyboardType:
                                                                                TextInputType.text,
                                                                            textInputAction:
                                                                                TextInputAction.next,
                                                                            decoration:
                                                                                AppStyles.textFieldInputDecoration.copyWith(
                                                                              hintText: "Please Enter Obsevation 5",
                                                                              counterText: '',
                                                                            ),
                                                                            style:
                                                                                AppStyles.textInputTextStyle,
                                                                            validator:
                                                                                MultiValidator(
                                                                              [
                                                                                RequiredValidator(
                                                                                  errorText: "Please Enter Obsevation 5 ",
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                15,
                                                                          ),

                                                                          Text(
                                                                            "Crieteria",
                                                                            style:
                                                                                AppStyles.textfieldCaptionTextStyle,
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                5,
                                                                          ),
                                                                          TextFormField(
                                                                            controller:
                                                                                finalInspectionCrieteriaController,
                                                                            keyboardType:
                                                                                TextInputType.text,
                                                                            textInputAction:
                                                                                TextInputAction.next,
                                                                            decoration:
                                                                                AppStyles.textFieldInputDecoration.copyWith(
                                                                              hintText: "As per Visual Inspection criteria GSPl/IPQC/VI/021",
                                                                              counterText: '',
                                                                            ),
                                                                            style:
                                                                                AppStyles.textInputTextStyle,
                                                                            readOnly:
                                                                                true,
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                15,
                                                                          ),
                                                                          Container(
                                                                            margin:
                                                                                EdgeInsets.symmetric(vertical: 10.0),
                                                                            child:
                                                                                Divider(
                                                                              color: Colors.black,
                                                                              height: 2.0,
                                                                              thickness: 2.0,
                                                                            ),
                                                                          ),

                                                                          // Fitment of JB cover
                                                                          Text(
                                                                            "Frequency",
                                                                            style:
                                                                                AppStyles.textfieldCaptionTextStyle,
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                15,
                                                                          ),
                                                                          TextFormField(
                                                                            controller:
                                                                                finalFitmentFrequencyController,
                                                                            keyboardType:
                                                                                TextInputType.text,
                                                                            textInputAction:
                                                                                TextInputAction.next,
                                                                            decoration:
                                                                                AppStyles.textFieldInputDecoration.copyWith(
                                                                              hintText: "5 Piece  per Shift ",
                                                                              counterText: '',
                                                                            ),
                                                                            style:
                                                                                AppStyles.textInputTextStyle,
                                                                            readOnly:
                                                                                true,
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                15,
                                                                          ),
                                                                          Text(
                                                                            "Fitment of JB cover",
                                                                            style:
                                                                                AppStyles.textfieldCaptionTextStyle,
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                15,
                                                                          ),
                                                                          TextFormField(
                                                                            controller:
                                                                                finalFitmentObs1Controller,
                                                                            keyboardType:
                                                                                TextInputType.text,
                                                                            textInputAction:
                                                                                TextInputAction.next,
                                                                            decoration:
                                                                                AppStyles.textFieldInputDecoration.copyWith(
                                                                              hintText: "Please Enter Observation 1 ",
                                                                              counterText: '',
                                                                            ),
                                                                            style:
                                                                                AppStyles.textInputTextStyle,
                                                                            validator:
                                                                                MultiValidator(
                                                                              [
                                                                                RequiredValidator(
                                                                                  errorText: "Please Enter Observation 1",
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                15,
                                                                          ),
                                                                          TextFormField(
                                                                            controller:
                                                                                finalFitmentObs2Controller,
                                                                            keyboardType:
                                                                                TextInputType.text,
                                                                            textInputAction:
                                                                                TextInputAction.next,
                                                                            decoration:
                                                                                AppStyles.textFieldInputDecoration.copyWith(
                                                                              hintText: "Please Enter Observation 2 ",
                                                                              counterText: '',
                                                                            ),
                                                                            style:
                                                                                AppStyles.textInputTextStyle,
                                                                            validator:
                                                                                MultiValidator(
                                                                              [
                                                                                RequiredValidator(
                                                                                  errorText: "Please Enter Observation 2",
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                15,
                                                                          ),
                                                                          TextFormField(
                                                                            controller:
                                                                                finalFitmentObs3Controller,
                                                                            keyboardType:
                                                                                TextInputType.text,
                                                                            textInputAction:
                                                                                TextInputAction.next,
                                                                            decoration:
                                                                                AppStyles.textFieldInputDecoration.copyWith(
                                                                              hintText: "Please Enter Observation 3 ",
                                                                              counterText: '',
                                                                            ),
                                                                            style:
                                                                                AppStyles.textInputTextStyle,
                                                                            validator:
                                                                                MultiValidator(
                                                                              [
                                                                                RequiredValidator(
                                                                                  errorText: "Please Enter Observation 3",
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                15,
                                                                          ),
                                                                          TextFormField(
                                                                            controller:
                                                                                finalFitmentObs4Controller,
                                                                            keyboardType:
                                                                                TextInputType.text,
                                                                            textInputAction:
                                                                                TextInputAction.next,
                                                                            decoration:
                                                                                AppStyles.textFieldInputDecoration.copyWith(
                                                                              hintText: "Please Enter Observation 4 ",
                                                                              counterText: '',
                                                                            ),
                                                                            style:
                                                                                AppStyles.textInputTextStyle,
                                                                            validator:
                                                                                MultiValidator(
                                                                              [
                                                                                RequiredValidator(
                                                                                  errorText: "Please Enter Observation 4",
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                15,
                                                                          ),
                                                                          TextFormField(
                                                                            controller:
                                                                                finalFitmentObs5Controller,
                                                                            keyboardType:
                                                                                TextInputType.text,
                                                                            textInputAction:
                                                                                TextInputAction.next,
                                                                            decoration:
                                                                                AppStyles.textFieldInputDecoration.copyWith(
                                                                              hintText: "Please Enter Observation 5 ",
                                                                              counterText: '',
                                                                            ),
                                                                            style:
                                                                                AppStyles.textInputTextStyle,
                                                                            validator:
                                                                                MultiValidator(
                                                                              [
                                                                                RequiredValidator(
                                                                                  errorText: "Please Enter Observation 5",
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                15,
                                                                          ),

                                                                          Text(
                                                                            "Criteria",
                                                                            style:
                                                                                AppStyles.textfieldCaptionTextStyle,
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                15,
                                                                          ),
                                                                          TextFormField(
                                                                            controller:
                                                                                finalFitmentCrieteriaController,
                                                                            keyboardType:
                                                                                TextInputType.text,
                                                                            textInputAction:
                                                                                TextInputAction.next,
                                                                            decoration:
                                                                                AppStyles.textFieldInputDecoration.copyWith(
                                                                              hintText: "Partial fitment of JB cover not allowed",
                                                                              counterText: '',
                                                                            ),
                                                                            style:
                                                                                AppStyles.textInputTextStyle,
                                                                            readOnly:
                                                                                true,
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                15,
                                                                          ),
                                                                          Container(
                                                                            margin:
                                                                                EdgeInsets.symmetric(vertical: 10.0),
                                                                            child:
                                                                                Divider(
                                                                              color: Colors.black,
                                                                              height: 2.0,
                                                                              thickness: 2.0,
                                                                            ),
                                                                          ),
                                                                          // Availability of acceptance Criteri &WI
                                                                          Text(
                                                                            "Frequency",
                                                                            style:
                                                                                AppStyles.textfieldCaptionTextStyle,
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                5,
                                                                          ),
                                                                          TextFormField(
                                                                            controller:
                                                                                finalWiFrequencyController,
                                                                            keyboardType:
                                                                                TextInputType.text,
                                                                            textInputAction:
                                                                                TextInputAction.next,
                                                                            decoration:
                                                                                AppStyles.textFieldInputDecoration.copyWith(
                                                                              hintText: "Once a Shift",
                                                                              counterText: '',
                                                                            ),
                                                                            style:
                                                                                AppStyles.textInputTextStyle,
                                                                            readOnly:
                                                                                true,
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                15,
                                                                          ),
                                                                          Text(
                                                                            "Availability of acceptance Criteri & WI ",
                                                                            style:
                                                                                AppStyles.textfieldCaptionTextStyle,
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                5,
                                                                          ),
                                                                          TextFormField(
                                                                            controller:
                                                                                finalWiController,
                                                                            keyboardType:
                                                                                TextInputType.text,
                                                                            textInputAction:
                                                                                TextInputAction.next,
                                                                            decoration:
                                                                                AppStyles.textFieldInputDecoration.copyWith(
                                                                              hintText: "Please Enter Obsevation",
                                                                              counterText: '',
                                                                            ),
                                                                            style:
                                                                                AppStyles.textInputTextStyle,
                                                                            validator:
                                                                                MultiValidator(
                                                                              [
                                                                                RequiredValidator(
                                                                                  errorText: "Please Enter Obsevation ",
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                15,
                                                                          ),
                                                                          Text(
                                                                            "Crieteria",
                                                                            style:
                                                                                AppStyles.textfieldCaptionTextStyle,
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                5,
                                                                          ),
                                                                          TextFormField(
                                                                            controller:
                                                                                finalWiCrieteriaController,
                                                                            keyboardType:
                                                                                TextInputType.text,
                                                                            textInputAction:
                                                                                TextInputAction.next,
                                                                            decoration:
                                                                                AppStyles.textFieldInputDecoration.copyWith(
                                                                              hintText: "Must be present",
                                                                              counterText: '',
                                                                            ),
                                                                            style:
                                                                                AppStyles.textInputTextStyle,
                                                                            readOnly:
                                                                                true,
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                15,
                                                                          ),

                                                                          Padding(
                                                                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                                                                          _isLoading
                                                                              ? Center(child: CircularProgressIndicator())
                                                                              : AppButton(
                                                                                  textStyle: const TextStyle(
                                                                                    fontWeight: FontWeight.w700,
                                                                                    color: AppColors.white,
                                                                                    fontSize: 16,
                                                                                  ),
                                                                                  onTap: () {
                                                                                    AppHelper.hideKeyboard(context);
                                                                                    // sendDataToBackend();

                                                                                    _registerFormKey.currentState!.save;
                                                                                    // if (_registerFormKey
                                                                                    //     .currentState!
                                                                                    //     .validate()) {
                                                                                    //   // sendDataToBackend();
                                                                                    // }
                                                                                    setState(() {
                                                                                      setPage = 'packaging';
                                                                                    });
                                                                                  },
                                                                                  label: "Next",
                                                                                  organization: '',
                                                                                ),
                                                                          const SizedBox(
                                                                            height:
                                                                                10,
                                                                          ),
                                                                          // Center(
                                                                          //   child: Padding(
                                                                          //     padding: const EdgeInsets.all(8.0),
                                                                          //     child: InkWell(
                                                                          //       onTap: () {
                                                                          //         // Navigator.of(context).pushReplacement(
                                                                          //         //     MaterialPageRoute(
                                                                          //         //         builder: (BuildContext context) =>
                                                                          //         //             LoginPage(
                                                                          //         //                 appName: widget.appName)));
                                                                          //       },
                                                                          //       child: Text(
                                                                          //         "BACK",
                                                                          //         style: TextStyle(
                                                                          //           fontFamily: appFontFamily,
                                                                          //           fontSize: 16,
                                                                          //           fontWeight: FontWeight.w500,
                                                                          //           color: AppColors.redColor,
                                                                          //         ),
                                                                          //       ),
                                                                          //     ),
                                                                          //   ),
                                                                          // ),
                                                                          const SizedBox(
                                                                            height:
                                                                                25,
                                                                          ),
                                                                          Center(
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.all(8.0),
                                                                              child: InkWell(
                                                                                onTap: () {
                                                                                  setState(() {
                                                                                    setPage = "backlabel";
                                                                                  });
                                                                                  // Navigator.of(context).pushReplacement(
                                                                                  //     MaterialPageRoute(
                                                                                  //         builder: (BuildContext context) =>
                                                                                  //             LoginPage(
                                                                                  //                 appName: widget.appName)));
                                                                                },
                                                                                child: const Text(
                                                                                  "BACK",
                                                                                  style: TextStyle(fontFamily: appFontFamily, fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.redColor),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                25,
                                                                          ),
                                                                          Container(
                                                                            alignment:
                                                                                Alignment.center,
                                                                            child:
                                                                                const Column(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  "Powered By Gautam Solar Pvt. Ltd.",
                                                                                  style: TextStyle(
                                                                                    fontSize: 14,
                                                                                    fontFamily: appFontFamily,
                                                                                    color: AppColors.greyColor,
                                                                                    fontWeight: FontWeight.w400,
                                                                                  ),
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 10,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              )
                                                            /******************************Packaging************* */
                                                            : setPage ==
                                                                    "packaging"
                                                                ? Stack(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    fit: StackFit
                                                                        .expand,
                                                                    children: [
                                                                      SingleChildScrollView(
                                                                        child:
                                                                            Form(
                                                                          //  key: _registerFormKey,
                                                                          autovalidateMode:
                                                                              AutovalidateMode.onUserInteraction,
                                                                          child:
                                                                              Column(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: <Widget>[
                                                                              Container(
                                                                                alignment: Alignment.center,
                                                                                child: Column(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    Image.asset(
                                                                                      AppAssets.imgLogo,
                                                                                      height: 100,
                                                                                      width: 230,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              const Center(child: Padding(padding: EdgeInsets.only(top: 10), child: Text("Incoming Process Quality Control", style: TextStyle(fontSize: 27, color: AppColors.black, fontFamily: appFontFamily, fontWeight: FontWeight.w700)))),
                                                                              const Center(child: Text("(Post Lam IPQC Checklist)", style: TextStyle(fontSize: 20, color: AppColors.black, fontFamily: appFontFamily, fontWeight: FontWeight.w700))),
                                                                              const SizedBox(
                                                                                height: 35,
                                                                              ),
                                                                              Row(
                                                                                children: [
                                                                                  Text(
                                                                                    'Document No : ',
                                                                                    style: AppStyles.textfieldCaptionTextStyle,
                                                                                  ),
                                                                                  const SizedBox(
                                                                                    width: 8,
                                                                                  ),
                                                                                  Text(
                                                                                    'GSPL/IPQC/IPC/003',
                                                                                    style: AppStyles.textfieldCaptionTextStyle,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              SizedBox(
                                                                                height: 8,
                                                                              ),
                                                                              Row(
                                                                                children: [
                                                                                  Text(
                                                                                    'Rev.No. / Rev. Date : ',
                                                                                    style: AppStyles.textfieldCaptionTextStyle,
                                                                                  ),
                                                                                  const SizedBox(
                                                                                    width: 8,
                                                                                  ),
                                                                                  Text(
                                                                                    'Ver.2.0 / 20-03-2024',
                                                                                    style: AppStyles.textfieldCaptionTextStyle,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              const Center(child: Text("Packaging", style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 13, 160, 0), fontFamily: appFontFamily, fontWeight: FontWeight.w700))),
                                                                              const SizedBox(
                                                                                height: 20,
                                                                              ),
                                                                              // Packaaging Barcode Defects
                                                                              Text(
                                                                                "Frequency",
                                                                                style: AppStyles.textfieldCaptionTextStyle,
                                                                              ),
                                                                              SizedBox(
                                                                                height: 5,
                                                                              ),
                                                                              TextFormField(
                                                                                controller: packagingBarcodeFrequencyController,
                                                                                keyboardType: TextInputType.text,
                                                                                textInputAction: TextInputAction.next,
                                                                                decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                  hintText: "5 Piece per Shift",
                                                                                  counterText: '',
                                                                                ),
                                                                                style: AppStyles.textInputTextStyle,
                                                                                readOnly: true,
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              Text(
                                                                                "Barcode Defects(unclear/duplication) ",
                                                                                style: AppStyles.textfieldCaptionTextStyle,
                                                                              ),
                                                                              SizedBox(
                                                                                height: 5,
                                                                              ),
                                                                              TextFormField(
                                                                                controller: packagingBarcodeObs1Controller,
                                                                                keyboardType: TextInputType.text,
                                                                                textInputAction: TextInputAction.next,
                                                                                decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                  hintText: "Please Enter Obsevation 1",
                                                                                  counterText: '',
                                                                                ),
                                                                                style: AppStyles.textInputTextStyle,
                                                                                validator: MultiValidator(
                                                                                  [
                                                                                    RequiredValidator(
                                                                                      errorText: "Please Enter Obsevation 1",
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              TextFormField(
                                                                                controller: packagingBarcodeObs2Controller,
                                                                                keyboardType: TextInputType.text,
                                                                                textInputAction: TextInputAction.next,
                                                                                decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                  hintText: "Please Enter Obsevation 2",
                                                                                  counterText: '',
                                                                                ),
                                                                                style: AppStyles.textInputTextStyle,
                                                                                validator: MultiValidator(
                                                                                  [
                                                                                    RequiredValidator(
                                                                                      errorText: "Please Enter Obsevation 2",
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              TextFormField(
                                                                                controller: packagingBarcodeObs3Controller,
                                                                                keyboardType: TextInputType.text,
                                                                                textInputAction: TextInputAction.next,
                                                                                decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                  hintText: "Please Enter Obsevation 3",
                                                                                  counterText: '',
                                                                                ),
                                                                                style: AppStyles.textInputTextStyle,
                                                                                validator: MultiValidator(
                                                                                  [
                                                                                    RequiredValidator(
                                                                                      errorText: "Please Enter Obsevation 3",
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              TextFormField(
                                                                                controller: packagingBarcodeObs4Controller,
                                                                                keyboardType: TextInputType.text,
                                                                                textInputAction: TextInputAction.next,
                                                                                decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                  hintText: "Please Enter Obsevation 4",
                                                                                  counterText: '',
                                                                                ),
                                                                                style: AppStyles.textInputTextStyle,
                                                                                validator: MultiValidator(
                                                                                  [
                                                                                    RequiredValidator(
                                                                                      errorText: "Please Enter Obsevation 4",
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              TextFormField(
                                                                                controller: packagingBarcodeObs5Controller,
                                                                                keyboardType: TextInputType.text,
                                                                                textInputAction: TextInputAction.next,
                                                                                decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                  hintText: "Please Enter Obsevation 5",
                                                                                  counterText: '',
                                                                                ),
                                                                                style: AppStyles.textInputTextStyle,
                                                                                validator: MultiValidator(
                                                                                  [
                                                                                    RequiredValidator(
                                                                                      errorText: "Please Enter Obsevation 5",
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),

                                                                              Text(
                                                                                "Crieteria",
                                                                                style: AppStyles.textfieldCaptionTextStyle,
                                                                              ),
                                                                              SizedBox(
                                                                                height: 5,
                                                                              ),
                                                                              TextFormField(
                                                                                controller: packagingBarcodeCrieteriaController,
                                                                                keyboardType: TextInputType.text,
                                                                                textInputAction: TextInputAction.next,
                                                                                decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                  hintText: "As per GSPL/FQC/PV/001",
                                                                                  counterText: '',
                                                                                ),
                                                                                style: AppStyles.textInputTextStyle,
                                                                                readOnly: true,
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              Container(
                                                                                margin: EdgeInsets.symmetric(vertical: 10.0),
                                                                                child: Divider(
                                                                                  color: Colors.black,
                                                                                  height: 2.0,
                                                                                  thickness: 2.0,
                                                                                ),
                                                                              ),

                                                                              // Packing Label & Contents
                                                                              Text(
                                                                                "Frequency",
                                                                                style: AppStyles.textfieldCaptionTextStyle,
                                                                              ),
                                                                              SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              TextFormField(
                                                                                controller: packagingpackingFrequencyController,
                                                                                keyboardType: TextInputType.text,
                                                                                textInputAction: TextInputAction.next,
                                                                                decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                  hintText: "5 Box  per Shift ",
                                                                                  counterText: '',
                                                                                ),
                                                                                style: AppStyles.textInputTextStyle,
                                                                                readOnly: true,
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              Text(
                                                                                "Packing Label & Contents",
                                                                                style: AppStyles.textfieldCaptionTextStyle,
                                                                              ),
                                                                              SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              TextFormField(
                                                                                controller: packagingpackingObs1Controller,
                                                                                keyboardType: TextInputType.text,
                                                                                textInputAction: TextInputAction.next,
                                                                                decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                  hintText: "Please Enter Observation 1 ",
                                                                                  counterText: '',
                                                                                ),
                                                                                style: AppStyles.textInputTextStyle,
                                                                                validator: MultiValidator(
                                                                                  [
                                                                                    RequiredValidator(
                                                                                      errorText: "Please Enter Observation 1",
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              TextFormField(
                                                                                controller: packagingpackingObs2Controller,
                                                                                keyboardType: TextInputType.text,
                                                                                textInputAction: TextInputAction.next,
                                                                                decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                  hintText: "Please Enter Observation 2 ",
                                                                                  counterText: '',
                                                                                ),
                                                                                style: AppStyles.textInputTextStyle,
                                                                                validator: MultiValidator(
                                                                                  [
                                                                                    RequiredValidator(
                                                                                      errorText: "Please Enter Observation 2",
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              TextFormField(
                                                                                controller: packagingpackingObs3Controller,
                                                                                keyboardType: TextInputType.text,
                                                                                textInputAction: TextInputAction.next,
                                                                                decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                  hintText: "Please Enter Observation 3 ",
                                                                                  counterText: '',
                                                                                ),
                                                                                style: AppStyles.textInputTextStyle,
                                                                                validator: MultiValidator(
                                                                                  [
                                                                                    RequiredValidator(
                                                                                      errorText: "Please Enter Observation 3",
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              TextFormField(
                                                                                controller: packagingpackingObs4Controller,
                                                                                keyboardType: TextInputType.text,
                                                                                textInputAction: TextInputAction.next,
                                                                                decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                  hintText: "Please Enter Observation 4 ",
                                                                                  counterText: '',
                                                                                ),
                                                                                style: AppStyles.textInputTextStyle,
                                                                                validator: MultiValidator(
                                                                                  [
                                                                                    RequiredValidator(
                                                                                      errorText: "Please Enter Observation 4",
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              TextFormField(
                                                                                controller: packagingpackingObs5Controller,
                                                                                keyboardType: TextInputType.text,
                                                                                textInputAction: TextInputAction.next,
                                                                                decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                  hintText: "Please Enter Observation 5 ",
                                                                                  counterText: '',
                                                                                ),
                                                                                style: AppStyles.textInputTextStyle,
                                                                                validator: MultiValidator(
                                                                                  [
                                                                                    RequiredValidator(
                                                                                      errorText: "Please Enter Observation 5",
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),

                                                                              Text(
                                                                                "Criteria",
                                                                                style: AppStyles.textfieldCaptionTextStyle,
                                                                              ),
                                                                              SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              TextFormField(
                                                                                controller: packagingpackingCrieteriaController,
                                                                                keyboardType: TextInputType.text,
                                                                                textInputAction: TextInputAction.next,
                                                                                decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                  hintText: "As per GSPL/FQC/PV/001",
                                                                                  counterText: '',
                                                                                ),
                                                                                style: AppStyles.textInputTextStyle,
                                                                                readOnly: true,
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              Container(
                                                                                margin: EdgeInsets.symmetric(vertical: 10.0),
                                                                                child: Divider(
                                                                                  color: Colors.black,
                                                                                  height: 2.0,
                                                                                  thickness: 2.0,
                                                                                ),
                                                                              ),
                                                                              // Box Condition
                                                                              Text(
                                                                                "Frequency",
                                                                                style: AppStyles.textfieldCaptionTextStyle,
                                                                              ),
                                                                              SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              TextFormField(
                                                                                controller: packagingBoxFrequencyController,
                                                                                keyboardType: TextInputType.text,
                                                                                textInputAction: TextInputAction.next,
                                                                                decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                  hintText: "5 Box  per Shift ",
                                                                                  counterText: '',
                                                                                ),
                                                                                style: AppStyles.textInputTextStyle,
                                                                                readOnly: true,
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              Text(
                                                                                "Box Condition",
                                                                                style: AppStyles.textfieldCaptionTextStyle,
                                                                              ),
                                                                              SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              TextFormField(
                                                                                controller: packagingBoxObs1Controller,
                                                                                keyboardType: TextInputType.text,
                                                                                textInputAction: TextInputAction.next,
                                                                                decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                  hintText: "Please Enter Observation 1 ",
                                                                                  counterText: '',
                                                                                ),
                                                                                style: AppStyles.textInputTextStyle,
                                                                                validator: MultiValidator(
                                                                                  [
                                                                                    RequiredValidator(
                                                                                      errorText: "Please Enter Observation 1",
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              TextFormField(
                                                                                controller: packagingBoxObs2Controller,
                                                                                keyboardType: TextInputType.text,
                                                                                textInputAction: TextInputAction.next,
                                                                                decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                  hintText: "Please Enter Observation 2 ",
                                                                                  counterText: '',
                                                                                ),
                                                                                style: AppStyles.textInputTextStyle,
                                                                                validator: MultiValidator(
                                                                                  [
                                                                                    RequiredValidator(
                                                                                      errorText: "Please Enter Observation 2",
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              TextFormField(
                                                                                controller: packagingBoxObs3Controller,
                                                                                keyboardType: TextInputType.text,
                                                                                textInputAction: TextInputAction.next,
                                                                                decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                  hintText: "Please Enter Observation 3 ",
                                                                                  counterText: '',
                                                                                ),
                                                                                style: AppStyles.textInputTextStyle,
                                                                                validator: MultiValidator(
                                                                                  [
                                                                                    RequiredValidator(
                                                                                      errorText: "Please Enter Observation 3",
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              TextFormField(
                                                                                controller: packagingBoxObs4Controller,
                                                                                keyboardType: TextInputType.text,
                                                                                textInputAction: TextInputAction.next,
                                                                                decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                  hintText: "Please Enter Observation 4 ",
                                                                                  counterText: '',
                                                                                ),
                                                                                style: AppStyles.textInputTextStyle,
                                                                                validator: MultiValidator(
                                                                                  [
                                                                                    RequiredValidator(
                                                                                      errorText: "Please Enter Observation 4",
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              TextFormField(
                                                                                controller: packagingBoxObs5Controller,
                                                                                keyboardType: TextInputType.text,
                                                                                textInputAction: TextInputAction.next,
                                                                                decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                  hintText: "Please Enter Observation 5 ",
                                                                                  counterText: '',
                                                                                ),
                                                                                style: AppStyles.textInputTextStyle,
                                                                                validator: MultiValidator(
                                                                                  [
                                                                                    RequiredValidator(
                                                                                      errorText: "Please Enter Observation 5",
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),

                                                                              Text(
                                                                                "Criteria",
                                                                                style: AppStyles.textfieldCaptionTextStyle,
                                                                              ),
                                                                              SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              TextFormField(
                                                                                controller: packagingBoxCrieteriaController,
                                                                                keyboardType: TextInputType.text,
                                                                                textInputAction: TextInputAction.next,
                                                                                decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                  hintText: "No Damage/Dull printin",
                                                                                  counterText: '',
                                                                                ),
                                                                                style: AppStyles.textInputTextStyle,
                                                                                readOnly: true,
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              Container(
                                                                                margin: EdgeInsets.symmetric(vertical: 10.0),
                                                                                child: Divider(
                                                                                  color: Colors.black,
                                                                                  height: 2.0,
                                                                                  thickness: 2.0,
                                                                                ),
                                                                              ),
                                                                              //Stretch Wrapping
                                                                              Text(
                                                                                "Frequency",
                                                                                style: AppStyles.textfieldCaptionTextStyle,
                                                                              ),
                                                                              SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              TextFormField(
                                                                                controller: packagingStretchFrequencyController,
                                                                                keyboardType: TextInputType.text,
                                                                                textInputAction: TextInputAction.next,
                                                                                decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                  hintText: "5 Box  per Shift ",
                                                                                  counterText: '',
                                                                                ),
                                                                                style: AppStyles.textInputTextStyle,
                                                                                readOnly: true,
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              Text(
                                                                                "Stretch wrapping",
                                                                                style: AppStyles.textfieldCaptionTextStyle,
                                                                              ),
                                                                              SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              TextFormField(
                                                                                controller: packagingStretchObs1Controller,
                                                                                keyboardType: TextInputType.text,
                                                                                textInputAction: TextInputAction.next,
                                                                                decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                  hintText: "Please Enter Observation 1 ",
                                                                                  counterText: '',
                                                                                ),
                                                                                style: AppStyles.textInputTextStyle,
                                                                                validator: MultiValidator(
                                                                                  [
                                                                                    RequiredValidator(
                                                                                      errorText: "Please Enter Observation 1",
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              TextFormField(
                                                                                controller: packagingStretchObs2Controller,
                                                                                keyboardType: TextInputType.text,
                                                                                textInputAction: TextInputAction.next,
                                                                                decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                  hintText: "Please Enter Observation 2 ",
                                                                                  counterText: '',
                                                                                ),
                                                                                style: AppStyles.textInputTextStyle,
                                                                                validator: MultiValidator(
                                                                                  [
                                                                                    RequiredValidator(
                                                                                      errorText: "Please Enter Observation 2",
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              TextFormField(
                                                                                controller: packagingStretchObs3Controller,
                                                                                keyboardType: TextInputType.text,
                                                                                textInputAction: TextInputAction.next,
                                                                                decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                  hintText: "Please Enter Observation 3 ",
                                                                                  counterText: '',
                                                                                ),
                                                                                style: AppStyles.textInputTextStyle,
                                                                                validator: MultiValidator(
                                                                                  [
                                                                                    RequiredValidator(
                                                                                      errorText: "Please Enter Observation 3",
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              TextFormField(
                                                                                controller: packagingStretchObs4Controller,
                                                                                keyboardType: TextInputType.text,
                                                                                textInputAction: TextInputAction.next,
                                                                                decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                  hintText: "Please Enter Observation 4 ",
                                                                                  counterText: '',
                                                                                ),
                                                                                style: AppStyles.textInputTextStyle,
                                                                                validator: MultiValidator(
                                                                                  [
                                                                                    RequiredValidator(
                                                                                      errorText: "Please Enter Observation 4",
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              TextFormField(
                                                                                controller: packagingStretchObs5Controller,
                                                                                keyboardType: TextInputType.text,
                                                                                textInputAction: TextInputAction.next,
                                                                                decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                  hintText: "Please Enter Observation 5 ",
                                                                                  counterText: '',
                                                                                ),
                                                                                style: AppStyles.textInputTextStyle,
                                                                                validator: MultiValidator(
                                                                                  [
                                                                                    RequiredValidator(
                                                                                      errorText: "Please Enter Observation 5",
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),

                                                                              Text(
                                                                                "Criteria",
                                                                                style: AppStyles.textfieldCaptionTextStyle,
                                                                              ),
                                                                              SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              TextFormField(
                                                                                controller: packagingStretchCrieteriaController,
                                                                                keyboardType: TextInputType.text,
                                                                                textInputAction: TextInputAction.next,
                                                                                decoration: AppStyles.textFieldInputDecoration.copyWith(
                                                                                  hintText: "Should be all around",
                                                                                  counterText: '',
                                                                                ),
                                                                                style: AppStyles.textInputTextStyle,
                                                                                readOnly: true,
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 15,
                                                                              ),

                                                                              Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0)),
                                                                              _isLoading
                                                                                  ? Center(child: CircularProgressIndicator())
                                                                                  : AppButton(
                                                                                      textStyle: const TextStyle(
                                                                                        fontWeight: FontWeight.w700,
                                                                                        color: AppColors.white,
                                                                                        fontSize: 16,
                                                                                      ),
                                                                                      onTap: () {
                                                                                        AppHelper.hideKeyboard(context);
                                                                                        // sendDataToBackend();

                                                                                        _registerFormKey.currentState!.save;
                                                                                        // if (_registerFormKey
                                                                                        //     .currentState!
                                                                                        //     .validate()) {
                                                                                        //   // sendDataToBackend();
                                                                                        // }
                                                                                        setState(() {
                                                                                          setPage = 'backlabel';
                                                                                        });
                                                                                      },
                                                                                      label: "Next",
                                                                                      organization: '',
                                                                                    ),
                                                                              const SizedBox(
                                                                                height: 10,
                                                                              ),
                                                                              // Center(
                                                                              //   child: Padding(
                                                                              //     padding: const EdgeInsets.all(8.0),
                                                                              //     child: InkWell(
                                                                              //       onTap: () {
                                                                              //         // Navigator.of(context).pushReplacement(
                                                                              //         //     MaterialPageRoute(
                                                                              //         //         builder: (BuildContext context) =>
                                                                              //         //             LoginPage(
                                                                              //         //                 appName: widget.appName)));
                                                                              //       },
                                                                              //       child: Text(
                                                                              //         "BACK",
                                                                              //         style: TextStyle(
                                                                              //           fontFamily: appFontFamily,
                                                                              //           fontSize: 16,
                                                                              //           fontWeight: FontWeight.w500,
                                                                              //           color: AppColors.redColor,
                                                                              //         ),
                                                                              //       ),
                                                                              //     ),
                                                                              //   ),
                                                                              // ),
                                                                              const SizedBox(
                                                                                height: 25,
                                                                              ),
                                                                              Center(
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(8.0),
                                                                                  child: InkWell(
                                                                                    onTap: () {
                                                                                      setState(() {
                                                                                        setPage = "finalel";
                                                                                      });
                                                                                      // Navigator.of(context).pushReplacement(
                                                                                      //     MaterialPageRoute(
                                                                                      //         builder: (BuildContext context) =>
                                                                                      //             LoginPage(
                                                                                      //                 appName: widget.appName)));
                                                                                    },
                                                                                    child: const Text(
                                                                                      "BACK",
                                                                                      style: TextStyle(fontFamily: appFontFamily, fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.redColor),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 25,
                                                                              ),
                                                                              Container(
                                                                                alignment: Alignment.center,
                                                                                child: const Column(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    Text(
                                                                                      "Powered By Gautam Solar Pvt. Ltd.",
                                                                                      style: TextStyle(
                                                                                        fontSize: 14,
                                                                                        fontFamily: appFontFamily,
                                                                                        color: AppColors.greyColor,
                                                                                        fontWeight: FontWeight.w400,
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 10,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  )
                                                                : Container(),
          ),
          bottomNavigationBar: Container(
            height: 60,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 245, 203, 19),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => WelcomePage()));
                    },
                    child: Image.asset(
                        home
                            ? AppAssets.icHomeSelected
                            : AppAssets.icHomeUnSelected,
                        height: 25)),
                const SizedBox(
                  width: 8,
                ),
                InkWell(
                    onTap: () {
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //     builder: (BuildContext context) => AddEditProfile()));
                    },
                    child: Image.asset(
                        user
                            ? AppAssets.imgSelectedPerson
                            : AppAssets.imgPerson,
                        height: 25)),
                const SizedBox(
                  width: 8,
                ),
                InkWell(
                    // onTap: () {
                    //   Navigator.of(context).pushReplacement(MaterialPageRoute(
                    //       builder: (BuildContext context) => Attendance()));
                    // },
                    child: Image.asset(
                        face
                            ? AppAssets.icSearchSelected
                            : AppAssets.icSearchUnSelected,
                        height: 25)),
                const SizedBox(
                  width: 8,
                ),
                InkWell(
                    // onTap: () {
                    //   Navigator.of(context).pushReplacement(MaterialPageRoute(
                    //       builder: (BuildContext context) => PublicDrawer()));
                    // },
                    child: Image.asset(
                        menu ? AppAssets.imgSelectedMenu : AppAssets.imgMenu,
                        height: 25)),
              ],
            ),
          ),
        );
      }),
    );
  }
}
