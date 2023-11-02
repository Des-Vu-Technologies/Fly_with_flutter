The `Radio` widget is used in Flutter to create radio buttons, which allow users to select a single option from a list of choices. Each radio button has a unique value, and only one radio button in a group can be selected at a time. Here are some key properties and features of the `Radio` widget:

### Key Properties and Features of the `Radio` Widget:

1. **`value` (required):** The value associated with the radio button. It should be unique for each radio button in a group.

2. **`groupValue` (required):** The current selected value among the radio buttons in the group. The radio button with a `value` that matches the `groupValue` will be selected.

3. **`onChanged` (required):** A callback function that is called when the radio button is tapped. It is responsible for updating the `groupValue` to reflect the selected value.

4. **`activeColor`: The color of the selected radio button's dot or icon.

5. **`materialTapTargetSize`: Specifies the minimum size of the tap target for the radio button.

6. **`visualDensity`: Adjusts the padding and size of the radio button's touch target.

### Example Usage:

Here's a simple example of how to use the `Radio` widget in Flutter:

```dart
var selectedValue;
var radioValue1 = 'Option 1';
var radioValue2 = 'Option 2';

Column(
  children: <Widget>[
    ListTile(
      title: Text('Option 1'),
      leading: Radio(
        value: radioValue1,
        groupValue: selectedValue,
        onChanged: (value) {
          // Handle the change
          setState(() {
            selectedValue = value;
          });
        },
      ),
    ),
    ListTile(
      title: Text('Option 2'),
      leading: Radio(
        value: radioValue2,
        groupValue: selectedValue,
        onChanged: (value) {
          // Handle the change
          setState(() {
            selectedValue = value;
          });
        },
      ),
    ),
  ],
)
```

In this example:

- We use a `Column` to display a list of radio buttons, each embedded in a `ListTile` for a better user interface.

- The `Radio` widgets have distinct `value` properties (in this case, `'Option 1'` and `'Option 2'`) and share the same `groupValue` variable (`selectedValue`) to indicate which radio button is currently selected.

- When a radio button is tapped, its `onChanged` callback updates the `selectedValue`, causing the selected radio button to change.

- The `setState` function is used to trigger a rebuild of the UI when the `selectedValue` is updated.

This is a basic example, and you can expand on it to create radio button groups with more options and custom styling as needed for your Flutter app.