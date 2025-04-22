part of '../multi_dropdown.dart';

/// Represents an item in a dropdown menu.
class DropdownItem<T> {
  /// Creates a new instance of [DropdownItem].
  ///
  /// The [label] and [value] parameters are required.
  /// The [disabled], [selected], and [key] parameters are optional.
  DropdownItem({
    required this.label,
    required this.value,
    this.disabled = false,
    this.selected = false,
    this.key,
  });

  /// Creates a new instance of [DropdownItem] from a map.
  ///
  /// The map should contain the following keys:
  /// - 'label': The label of the dropdown item (required).
  /// - 'value': The value associated with the dropdown item (required).
  /// - 'disabled': Indicates whether the dropdown item is disabled (optional, default is false).
  /// - 'selected': Indicates whether the dropdown item is selected (optional, default is false).
  /// - 'key': A unique identifier for the dropdown item (optional).
  factory DropdownItem.fromMap(Map<String, dynamic> map) {
    return DropdownItem<T>(
      label: map['label'] as String? ?? '',
      value: map['value'] as T,
      disabled: map['disabled'] as bool? ?? false,
      selected: map['selected'] as bool? ?? false,
      key: map['key'] as GlobalKey? ?? GlobalKey(),
    );
  }

  /// The label of the dropdown item.
  final String label;

  /// The value associated with the dropdown item.
  final T value;

  /// Indicates whether the dropdown item is disabled.
  bool disabled;

  /// Indicates whether the dropdown item is selected.
  bool selected;

  /// A unique identifier for the dropdown item.
  final GlobalKey? key;

  /// Converts the [DropdownItem] instance to a map.
  ///
  /// The returned map will contain the following keys:
  /// - 'label': The label of the dropdown item.
  /// - 'value': The value associated with the dropdown item.
  /// - 'disabled': Indicates whether the dropdown item is disabled.
  /// - 'selected': Indicates whether the dropdown item is selected.
  /// - 'key': A unique identifier for the dropdown item (if provided).
  Map<String, dynamic> toMap() {
    final map = {
      'label': label,
      'value': value,
      'disabled': disabled,
      'selected': selected,
    };

    if (key != null) {
      map['key'] = key.toString();
    }

    return map;
  }

  /// Converts the [DropdownItem] instance to a JSON string.
  String toJson() => jsonEncode(toMap);

  @override
  String toString() {
    return 'ValueItem(label: $label, value: $value, disabled: $disabled, selected: $selected, key: $key)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DropdownItem<T> &&
        other.label == label &&
        other.value == value &&
        other.disabled == disabled &&
        other.selected == selected &&
        other.key == key;
  }

  @override
  int get hashCode =>
      label.hashCode ^
      value.hashCode ^
      disabled.hashCode ^
      selected.hashCode ^
      (key?.hashCode ?? 0);

  /// Creates a copy of the [DropdownItem] instance with the specified properties.
  ///
  /// If any of the properties are not provided, the corresponding properties of the original instance will be used.
  DropdownItem<T> copyWith({
    String? label,
    T? value,
    bool? disabled,
    bool? selected,
    GlobalKey? key,
  }) {
    return DropdownItem<T>(
      label: label ?? this.label,
      value: value ?? this.value,
      disabled: disabled ?? this.disabled,
      selected: selected ?? this.selected,
      key: key ?? this.key,
    );
  }
}
