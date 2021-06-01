import 'package:flutter/material.dart';
import 'package:funradioactivity/consts/tracers.dart';

class Dose {
  Dose(
      {@required TimeOfDay time,
      @required double activity,
      @required UNITS unit,
      @required TRACERS tracer}) {
    this._time = time;
    this._tracer = tracer;
    this._activity = activity;
    this._unit = unit;
    if (this._unit != UNITS.Bq) this._convertActivityToBq();
  }

  TRACERS _tracer;
  double _activity; // in Bq...
  UNITS _unit;
  TimeOfDay _time;

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

  String get elapsedTime {
    DateTime _now = DateTime.now();
    DateTime _time = DateTime(
      _now.year,
      _now.month,
      _now.day,
      this._time.hour,
      this._time.minute,
    );
    Duration diff = _now.difference(_time);
    int _h = (diff.inHours).truncate();
    int _m = (diff.inMinutes - (_h * 60)).truncate();
    int _s = (diff.inSeconds - (_h * 60 * 60) - (_m * 60)).truncate();
    return "${(_h < 10) ? 0 : ''}$_h "
        ": ${(_m < 10) ? 0 : ''}$_m "
        ": ${(_s < 10) ? 0 : ''}$_s";
  }
}
