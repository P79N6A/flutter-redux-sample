import 'package:flutter_shoppingcart/model/cart_item.dart';
import 'package:flutter_shoppingcart/redux/action.dart';
import '../zen_state.dart';

ZenState cartItemsReducer(ZenState state, dynamic action) {
  if (action is AddItemAction) {
    return addItem(state, action);
  } else if (action is ToggleStateItemAction) {
    return toggleState(state, action);
  } else if (action is DeleteItemAction) {
    return deleteItem(state, action);
  }
  return state;
}

ZenState addItem(ZenState state, AddItemAction action) {
  state.cartItems = state.cartItems..add(action.item); //先浅拷贝然后再增加
  return state;
}

ZenState deleteItem(ZenState state, DeleteItemAction action) {
  state.cartItems.removeWhere((oneItem) => oneItem == action.item);
  state.cartItems = state.cartItems; //用于浅拷贝
  return state;
}

ZenState toggleState(ZenState state, ToggleStateItemAction action) {
  CartItem actionItem = action.item;
  actionItem.checked = !actionItem.checked;
  return state;
}
