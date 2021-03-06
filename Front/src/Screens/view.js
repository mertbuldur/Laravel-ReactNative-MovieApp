import React, {useState, useRef, useEffect} from 'react';
import {
  View,
  StyleSheet,
  Text,
  SafeAreaView,
  Image,
  ScrollView,
  TouchableOpacity,
} from 'react-native';
import StarRating from 'react-native-star-rating';
import Icon from 'react-native-vector-icons/FontAwesome5';
import Data from '../Data/Movies.json';
import Modal from 'react-native-modal';
import Video from 'react-native-video';
import axios from 'axios';
import {API_URL} from '../Config/Constants';
const view = props => {
  const videoRef = useRef(null);
  const id = props.route.params.id;
  const [loading, setLoading] = useState(true);
  const [data, setData] = useState([]);
  const [categories, setCategories] = useState([]);
  useEffect(() => {
    axios.get(`${API_URL}/api/movie/${id}`).then(result => {
      if (result.data.status) {
        setData(result.data.data.data);
        setCategories(result.data.data.categories);
        setLoading(false);
      } else {
        alert(result.data.message);
      }
    });
  }, []);

  const [isModalVisible, setModalVisible] = useState(false);
  const [paused, setPaused] = useState(false);
  const Cast = ({item}) => {
    return (
      <View style={style.cast_container}>
        <Image style={style.cast_image} source={{uri: data.images[0].uri}} />
        <Text style={style.cast_name}>{item.cast.name}</Text>
      </View>
    );
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
      <ScrollView showsVerticalScrollIndicator={false} style={{flex: 1}}>
        <View style={style.header}>
          <View style={style.controls}>
            <TouchableOpacity
              onPress={() => props.navigation.goBack()}
              style={{flexDirection: 'row', alignItems: 'center'}}>
              <Icon name="chevron-left" size={20} color="white" />
              <Text
                style={{
                  marginLeft: 5,
                  color: 'white',
                  fontSize: 16,
                  fontWeight: '700',
                }}>
                Back
              </Text>
            </TouchableOpacity>
            <TouchableOpacity>
              <Icon name="share" size={20} color="white" />
            </TouchableOpacity>
          </View>
          <View style={style.overlay} />
          <Image
            source={{uri: data.images[0].uri}}
            resizeMode="cover"
            style={style.header_image}
          />
          <View style={style.playButtonContainer}>
            <TouchableOpacity
              onPress={() => {
                setModalVisible(!isModalVisible);
                setPaused(false);
              }}
              style={style.playButton}>
              <Icon name="play" size={25} color="white" />
            </TouchableOpacity>
          </View>

          <View style={style.informationImageContainer}>
            <Image
              style={style.information_image}
              source={{uri: data.images[0].uri}}
            />
          </View>
          <View style={style.informationNameContainer}>
            <Text style={style.infomationName}>{data.name}</Text>
          </View>
        </View>
        <View style={style.body}>
          <View style={{flexDirection: 'row', justifyContent: 'space-between'}}>
            <View style={{flex: 1}} />
            <View style={style.top_right}>
              <View style={style.top_right_item}>
                <Icon name="street-view" size={20} />
                <Text style={style.top_right_item_text}>{data.director}</Text>
              </View>
              <View style={style.top_right_item}>
                <Icon name="folder" size={20} />
                <Text style={style.top_right_item_text}>
                  {categories.map(item => item.name)}
                </Text>
              </View>
              <View style={style.top_right_item}>
                <Icon name="clock" size={20} />
                <Text style={style.top_right_item_text}>{data.time}</Text>
              </View>
              <View style={style.top_right_item}>
                <StarRating
                  disabled={false}
                  maxStars={5}
                  starSize={20}
                  fullStarColor={'#DB3069'}
                  rating={data.star}
                  selectedStar={rating => console.log(rating)}
                />
              </View>
            </View>
          </View>
          <View style={style.content}>
            <Text style={style.content_text}>{data.text}</Text>
            <View style={style.casts}>
              {data.casts.map(item => (
                <Cast item={item} />
              ))}
            </View>
          </View>
        </View>
      </ScrollView>
      <Modal isVisible={isModalVisible}>
        <View style={style.modalContainer}>
          <View style={style.modalBody}>
            <TouchableOpacity
              onPress={() => {
                setModalVisible(false);
                setPaused(true);
              }}
              style={style.modalCloseButton}>
              <Icon name="times-circle" size={30} color={'white'} />
            </TouchableOpacity>
            <Video
              ref={videoRef}
              resizeMode={'cover'}
              paused={paused}
              source={{uri: data.video}}
              style={style.video}
            />
          </View>
        </View>
      </Modal>
    </SafeAreaView>
  );
};

const style = StyleSheet.create({
  header: {},
  header_image: {
    width: '100%',
    height: 300,
  },
  overlay: {
    position: 'absolute',
    top: 0,
    left: 0,
    backgroundColor: 'rgba(0,0,0,0.5)',
    zIndex: 9,
    width: '100%',
    height: '100%',
  },
  playButtonContainer: {
    position: 'absolute',
    zIndex: 10,
    width: '100%',
    height: '100%',
    justifyContent: 'center',
    alignItems: 'center',
  },
  playButton: {
    width: 60,
    height: 60,
    borderRadius: 100,
    backgroundColor: '#DB3069',
    justifyContent: 'center',
    alignItems: 'center',
  },
  controls: {
    position: 'absolute',
    zIndex: 11,
    flexDirection: 'row',
    justifyContent: 'space-between',
    top: 20,
    width: '100%',
    paddingHorizontal: 20,
  },
  information_image: {
    width: 120,
    height: 180,
    borderRadius: 5,
  },
  informationImageContainer: {
    position: 'absolute',
    bottom: -100,
    left: 20,
    zIndex: 11,
    shadowColor: '#000',
    shadowOffset: {
      width: 0,
      height: 2,
    },
    shadowOpacity: 0.25,
    shadowRadius: 3.84,

    elevation: 5,
  },
  informationNameContainer: {
    position: 'absolute',
    zIndex: 11,
    bottom: 20,
    right: 10,
    width: 230,
  },
  infomationName: {
    fontSize: 18,
    fontWeight: '700',
    color: 'white',
  },
  body: {
    flex: 1,
    // backgroundColor: 'blue',
  },
  top_right: {
    flex: 1.5,
    marginHorizontal: 5,
    paddingVertical: 20,
  },
  top_right_item: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 5,
  },
  top_right_item_text: {
    left: 10,
    textAlign: 'center',
  },
  content: {
    paddingHorizontal: 20,
    paddingVertical: 10,
  },
  content_text: {
    fontSize: 19,
    color: '#666666',
  },
  casts: {
    marginTop: 20,
    flexDirection: 'row',
  },
  cast_container: {
    flex: 1,

    alignItems: 'center',
  },
  cast_image: {
    width: 100,
    height: 150,
    borderRadius: 5,
  },
  cast_name: {
    fontSize: 13,
    marginTop: 5,
    fontWeight: '300',
    textAlign: 'center',
  },
  modalBody: {
    backgroundColor: 'white',
    height: 300,
    width: '100%',
  },
  modalContainer: {flex: 1, justifyContent: 'center', alignItems: 'center'},
  modalCloseButton: {
    position: 'absolute',
    right: -10,
    top: -20,
    zIndex: 99999,
    width: 40,
    height: 40,
    backgroundColor: 'black',
    borderRadius: 100,
    justifyContent: 'center',
    alignItems: 'center',
  },
  video: {
    height: 300,
    //backgroundColor: 'red',
    width: '100%',
  },
});

export default view;
