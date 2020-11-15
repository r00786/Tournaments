// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournaments_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TournamentsState extends TournamentsState {
  @override
  final BuiltList<Tournaments> items;
  @override
  final bool isLastPage;
  @override
  final String cursor;

  factory _$TournamentsState(
          [void Function(TournamentsStateBuilder) updates]) =>
      (new TournamentsStateBuilder()..update(updates)).build();

  _$TournamentsState._({this.items, this.isLastPage, this.cursor}) : super._() {
    if (items == null) {
      throw new BuiltValueNullFieldError('TournamentsState', 'items');
    }
  }

  @override
  TournamentsState rebuild(void Function(TournamentsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TournamentsStateBuilder toBuilder() =>
      new TournamentsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TournamentsState &&
        items == other.items &&
        isLastPage == other.isLastPage &&
        cursor == other.cursor;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, items.hashCode), isLastPage.hashCode), cursor.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TournamentsState')
          ..add('items', items)
          ..add('isLastPage', isLastPage)
          ..add('cursor', cursor))
        .toString();
  }
}

class TournamentsStateBuilder
    implements Builder<TournamentsState, TournamentsStateBuilder> {
  _$TournamentsState _$v;

  ListBuilder<Tournaments> _items;
  ListBuilder<Tournaments> get items =>
      _$this._items ??= new ListBuilder<Tournaments>();
  set items(ListBuilder<Tournaments> items) => _$this._items = items;

  bool _isLastPage;
  bool get isLastPage => _$this._isLastPage;
  set isLastPage(bool isLastPage) => _$this._isLastPage = isLastPage;

  String _cursor;
  String get cursor => _$this._cursor;
  set cursor(String cursor) => _$this._cursor = cursor;

  TournamentsStateBuilder();

  TournamentsStateBuilder get _$this {
    if (_$v != null) {
      _items = _$v.items?.toBuilder();
      _isLastPage = _$v.isLastPage;
      _cursor = _$v.cursor;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TournamentsState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TournamentsState;
  }

  @override
  void update(void Function(TournamentsStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TournamentsState build() {
    _$TournamentsState _$result;
    try {
      _$result = _$v ??
          new _$TournamentsState._(
              items: items.build(), isLastPage: isLastPage, cursor: cursor);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'TournamentsState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
