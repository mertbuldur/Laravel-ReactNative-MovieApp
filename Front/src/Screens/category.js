import React, {useEffect, useState} from 'react';
import {
  View,
  Text,
  SafeAreaView,
  StyleSheet,
  FlatList,
  ScrollView,
} from 'react-native';

import Category from '../Components/Category';
import axios from 'axios';
import {API_URL} from '../Config/Constants';
const index = () => {
  const [loading, setLoading] = useState(true);
  const [data, setData] = useState([]);

  useEffect(() => {
    axios.get(`${API_URL}/api/categories`).then(result => {
      if (result.data.status) {
        setData(result.data.data);

        setLoading(false);
      } else {
        alert(result.data.message);
      }
    });
  }, []);

  const renderItem = ({item}) => {
    return <Category item={item} />;
  };

  if (loading) {
    return (
      <View style={{flex: 1, justifyContent: 'center', alignItems: 'center'}}>
        <Text style={{fontSize: 20}}>Loading...</Text>
      </View>
    );
  }

  return (
    <SafeAreaView style={{flex: 1}}>
      <View style={style.header}>
        <Text style={style.header_title}>Categories</Text>
      </View>
      <View style={style.body}>
        <View style={{flex: 1, paddingHorizontal: 10}}>
          <FlatList
            style={{flex: 1}}
            numColumns={2}
            data={data}
            showsVerticalScrollIndicator={false}
            renderItem={renderItem}
          />
        </View>
      </View>
    </SafeAreaView>
  );
};

const style = StyleSheet.create({
  header: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    paddingHorizontal: 20,
    paddingVertical: 40,
    alignItems: 'center',
  },
  header_title: {
    fontSize: 20,
    fontWeight: '700',
  },
  body: {
    flex: 1,
  },
  body_title: {
    fontSize: 15,
    fontWeight: '500',
    marginBottom: 15,
  },
});
export default index;
