import React from 'react';
import {NavigationContainer} from '@react-navigation/native';
import {createStackNavigator} from '@react-navigation/stack';
import {createBottomTabNavigator} from '@react-navigation/bottom-tabs';
import Icon from 'react-native-vector-icons/FontAwesome5';
import Index from '../Screens/index';
import View from '../Screens/view';
import Category from '../Screens/category';
import CategoryView from '../Screens/category_view';
const Stack = createStackNavigator();
const Tab = createBottomTabNavigator();

const HomeStack = () => {
  return (
    <Stack.Navigator initialRouteName="index">
      <Stack.Screen
        options={{
          headerShown: false,
        }}
        name="index"
        component={Index}
      />
      <Stack.Screen
        options={{
          headerShown: false,
        }}
        name="view"
        component={View}
      />
    </Stack.Navigator>
  );
};

const CategoryStack = () => {
  return (
    <Stack.Navigator initialRouteName="index">
      <Stack.Screen
        options={{
          headerShown: false,
        }}
        name="index"
        component={Category}
      />
      <Stack.Screen
        options={{
          headerShown: false,
        }}
        name="category_view"
        component={CategoryView}
      />
      <Stack.Screen
        options={{
          headerShown: false,
        }}
        name="view"
        component={View}
      />
    </Stack.Navigator>
  );
};

const AppTabs = () => {
  return (
    <Tab.Navigator>
      <Tab.Screen
        name="Home"
        component={HomeStack}
        options={{
          headerShown: false,
          tabBarIcon: ({color, size}) => (
            <Icon name="home" color={color} size={size} />
          ),
        }}
      />
      <Tab.Screen
        name="Category"
        component={CategoryStack}
        options={{
          headerShown: false,
          tabBarIcon: ({color, size}) => (
            <Icon name="folder" color={color} size={size} />
          ),
        }}
      />
    </Tab.Navigator>
  );
};

const AppNavigationContainer = () => {
  return <AppTabs />;
};

export default AppNavigationContainer;
