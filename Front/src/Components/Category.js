import React from 'react';
import {View, TouchableOpacity, Text, StyleSheet, Image} from 'react-native';
import {useNavigation} from '@react-navigation/native';
const Category = ({item}) => {
  const history = useNavigation();
  return (
    <TouchableOpacity
      onPress={() => history.navigate('category_view', {id: item.id})}
      style={style.container}>
      <View style={style.detail_container}>
        <Text style={style.title}>{item.name}</Text>
      </View>
    </TouchableOpacity>
  );
};

const style = StyleSheet.create({
  container: {
    height: 150,
    flex: 1,
    backgroundColor: 'red',
    marginHorizontal: 5,
    marginBottom: 15,
    borderRadius: 5,
  },
  image: {
    width: '100%',
    height: 200,
    borderRadius: 5,
  },
  image_container: {
    shadowColor: '#000',
    shadowOffset: {
      width: 0,
      height: 3,
    },
    shadowOpacity: 0.29,
    shadowRadius: 4.65,

    elevation: 7,
    width: '100%',
    height: 200,
  },
  detail_container: {
    marginTop: 5,
    position: 'absolute',
    bottom: 0,
    backgroundColor: 'rgba(0,0,0,0.5)',
    padding: 10,
    width: '100%',
    height: '100%',
    justifyContent: 'center',
    borderRadius: 5,
  },
  title: {
    textAlign: 'center',
    fontSize: 17,
    fontWeight: '700',
    color: 'white',
  },
  category_container: {
    position: 'absolute',
    zIndex: 99999,
    backgroundColor: 'rgba(0,0,0,0.5)',
    paddingVertical: 5,
    paddingHorizontal: 10,
    left: 5,
    top: 5,
  },
  category: {
    fontSize: 12,
    textAlign: 'center',
    color: 'white',
    fontWeight: '700',
  },
  star_container: {
    position: 'absolute',
    right: 5,
    top: 5,
    zIndex: 99999,
    backgroundColor: '#EC712B',
    width: 30,
    height: 30,
    borderRadius: 100,
    justifyContent: 'center',
    alignItems: 'center',
  },
  star: {
    fontSize: 14,
    color: 'white',
    fontWeight: '700',
    textAlign: 'center',
  },
});

export default Category;
