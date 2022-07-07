import React, {useEffect, useState} from 'react';
import {
  View,
  Text,
  SafeAreaView,
  StyleSheet,
  FlatList,
  TouchableOpacity,
  ScrollView,
} from 'react-native';
import Data from '../Data/Movies.json';
import NotificationData from '../Data/notification.json';
import Icon from 'react-native-vector-icons/FontAwesome5';
import Film from '../Components/Film';
import Notification from '../Components/Notification';
import axios from 'axios';
import {API_URL} from '../Config/Constants';
const index = props => {
  const [loading, setLoading] = useState(true);
  const [data, setData] = useState([]);
  const [category, setCategory] = useState({});

  useEffect(() => {
    axios
      .get(`${API_URL}/api/category/${props.route.params.id}`)
      .then(result => {
        if (result.data.status) {
          setData(result.data.data.movies);
          setCategory(result.data.data.category);
          setLoading(false);
        } else {
          alert(result.data.message);
        }
      });
  }, []);

  const renderItem = ({item}) => {
    return <Film item={item} />;
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
        <TouchableOpacity onPress={() => props.navigation.goBack()}>
          <Icon name="arrow-left" size={20} color="black" />
        </TouchableOpacity>

        <Text style={style.header_title}>{category.name}</Text>
      </View>
      <ScrollView showsVerticalScrollIndicator={false} style={style.body}>
        <View style={{flex: 1, paddingHorizontal: 10}}>
          <FlatList
            style={{flex: 1}}
            numColumns={2}
            data={data}
            showsVerticalScrollIndicator={false}
            renderItem={renderItem}
          />
        </View>
      </ScrollView>
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
