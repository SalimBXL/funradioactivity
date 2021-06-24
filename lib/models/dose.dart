import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:funradioactivity/consts/tracers.dart';

class Dose {
  Dose(
      {@required TimeOfDay time,
      @required double activity,
      @required UNITS unit,
      @required TRACERS tracer,
      String reference = ""}) {
    this._time = time;
    this._tracer = tracer;
    this._activity = activity;
    this._unit = unit;
    if (this._unit != UNITS.Bq) this._convertActivityToBq();
    this._reference = reference;
  }

  TRACERS _tracer;
  double _activity; // in Bq...
  UNITS _unit;
  TimeOfDay _time;
  String _reference;

  void _convertActivityToBq() {
    if (this._unit == UNITS.MBq) {
      this._activity *= 1000000;
    }
    if (this._unit == UNITS.GBq) {
      this._activity *= 1000000000;
    }
  }

  double _convertBqToMBq(double value) => (value / 1000000);
  double _convertBqToGBq(double value) => (value / 1000000000);

  TRACERS get tracer => this._tracer;
  UNITS get unit => this._unit;
  TimeOfDay get time => this._time;
  double get activityInBq => this._activity;
  double get activity {
    double _result;
    if (this._unit == UNITS.Bq) _result = this._activity;
    if (this._unit == UNITS.MBq) _result = this._convertBqToMBq(this._activity);
    if (this._unit == UNITS.GBq) _result = this._convertBqToGBq(this._activity);
    return _result;
  }

  String get humanizedTime => "${(this._time.hour < 10) ? "0" : ""}"
      "${this._time.hour}:"
      "${(this._time.minute < 10) ? "0" : ""}"
      "${this._time.minute}";

  Duration _elapsedTime() {
    DateTime _now = DateTime.now();
    DateTime _time = DateTime(
      _now.year,
      _now.month,
      _now.day,
      this._time.hour,
      this._time.minute,
    );
    return _now.difference(_time);
  }

  String get elapsedTime {
    Duration diff = this._elapsedTime();
    int _h = (diff.inHours).truncate();
    int _m = (diff.inMinutes - (_h * 60)).truncate();
    int _s = (diff.inSeconds - (_h * 60 * 60) - (_m * 60)).truncate();
    return "${(_h < 10) ? 0 : ''}$_h"
        ":${(_m < 10) ? 0 : ''}$_m"
        ":${(_s < 10) ? 0 : ''}$_s";
  }

  double get computedActivity {
    double _result;
    double _at = computedActivityInBq;
    if (this._unit == UNITS.Bq) _result = _at;
    if (this._unit == UNITS.MBq) _result = this._convertBqToMBq(_at);
    if (this._unit == UNITS.GBq) _result = this._convertBqToGBq(_at);
    return _result;
  }

  double get computedActivityInBq {
    int _elapsedTimeInMinutes = this._elapsedTime().inMinutes;
    double _tracerHalfTimeInMinutes = TRACERS_HALFLIFE[this._tracer];
    double _halfLifeTimes = (_elapsedTimeInMinutes / _tracerHalfTimeInMinutes);
    double _a0 = this._activity;

    double _at =
        (_a0 * pow(EULER, (-DECAY_CONST * _halfLifeTimes))).roundToDouble();

    return _at;
  }

  double computedActivityInUnit(UNITS unitToConvert) {
    double _result;
    double _at = this.computedActivityInBq;
    if (unitToConvert == UNITS.Bq) _result = _at;
    if (unitToConvert == UNITS.MBq) _result = this._convertBqToMBq(_at);
    if (unitToConvert == UNITS.GBq) _result = this._convertBqToGBq(_at);
    return _result;
  }

  String get reference => this._reference;

  factory Dose.fromJson(Map<String, dynamic> json) {
    // TRACER
    TRACERS _tracer;
    TRACERS.values.forEach((element) {
      String e = describeEnum(element).toUpperCase();
      String j = json['tracer'].toString().toUpperCase();
      bool eq = (e == j);
      if (eq) _tracer = element;
    });

    // TIME
    TimeOfDay _time;
    String t = json['time'].toString().split(" ").last;
    _time = TimeOfDay(
        hour: int.parse(t.split(":").first),
        minute: int.parse(t.split(":").last));

    // ACTIVITY & UNIT
    double _activity =
        double.parse(json['calibration'].toString().split(" ").first);
    UNITS _unit;
    String _u = json['calibration'].toString().split(" ").last;
    UNITS.values.forEach((element) {
      String e = describeEnum(element).toUpperCase();
      String j = _u.toUpperCase();
      bool eq = (e == j);
      if (eq) _unit = element;
    });

    // REFERENCE
    String _reference = json['ref'];

    return Dose(
      tracer: _tracer,
      time: _time,
      activity: _activity,
      unit: _unit,
      reference: _reference,
    );
  }
}
