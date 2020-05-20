
var handles = ["SELECT STATE","Andhra Pradesh","Arunachal Pradesh","Assam","Bihar","Chhattisgarh","Dadra and Nagar Haveli","Daman and Diu","Delhi","Goa","Gujarat","Haryana","Himachal Pradesh","Jammu and Kashmir","Jharkhand","Karnataka",
                                        "Kerala","Madhya Pradesh","Maharashtra","Manipur","Meghalaya","Mizoram","Nagaland","Orissa","Puducherry","Punjab", "Rajasthan","Sikkim","Tamil Nadu",
                                        "Telangana","Tripura","Uttar Pradesh","Uttarakhand","West Bengal"];

$(function() {
  var options = '';
  for (var i = 0; i < handles.length; i++) {
      options += '<option value="' + handles[i] + '">' + handles[i] + '</option>';
  }
  $('#listBox').html(options);
});
function selct_district($val)
{
    if($val=='SELECT STATE') {
   var options = '';
  $('#secondlist').html(options);
  }
 if($val=='Andhra Pradesh') {
   var andhra = ["Anantapur","Chittoor","East Godavari","Guntur","Krishna","Kurnool","Prakasam","Srikakulam","SriPotti SriRamulu Nellore",
                                    "Vishakhapatnam","Vizianagaram","West Godavari","Cudappah"];
   $(function() {
  var options = '';
  for (var i = 0; i < andhra.length; i++) {
      options += '<option value="' + andhra[i] + '">' + andhra[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
  if ($val=='Arunachal Pradesh') {
    var ap = ["Anjaw","Changlang","Dibang Valley","East Siang","Kurung Kumey","Lohit","Longding","Lower Dibang Valley","Lower Subansiri","Papum Pare",
                                        "Tawang","Tirap","Upper Siang","Upper Subansiri","West Kameng","West Siang"];
   $(function() {
  var options = '';
  for (var i = 0; i < ap.length; i++) {
      options += '<option value="' + ap[i] + '">' + ap[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
  if ($val=='Assam') {
    var assam = ["Baksa","Barpeta","Bongaigaon","Cachar","Chirang","Darrang","Dhemaji","Dhubri","Dibrugarh","Goalpara","Golaghat","Hailakandi","Jorhat",
                                     "Kamrup","Kamrup Metropolitan","Karbi Anglong","Karimganj","Kokrajhar","Lakhimpur","Morigaon","Nagaon","Nalbari","Sivasagar","Sonitpur","Tinsukia","Udalguri"];
   $(function() {
  var options = '';
  for (var i = 0; i < assam.length; i++) {
      options += '<option value="' + assam[i] + '">' + assam[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
  if ($val=='Bihar') {
    var bihar = ["Araria","Arwal","Aurangabad","Banka","Begusarai","Bhagalpur","Bhojpur","Buxar","Darbhanga","East Champaran","Gaya","Gopalganj","Jamui","Jehanabad","Kaimur",
                                        "Katihar","Khagaria","Kishanganj","Lakhisarai","Madhepura","Madhubani","Munger","Muzaffarpur","Nalanda","Nawada","Pashchim Champaran","Patna","Purnia","Rohtas","Saharsa",
                                        "Samastipur","Saran","Sheikhpura","Sheohar","Sitamarhi","Siwan","Supaul","Vaishali","West Champaran"];
   $(function() {
  var options = '';
  for (var i = 0; i < bihar.length; i++) {
      options += '<option value="' + bihar[i] + '">' + bihar[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
  if ($val=='Chhattisgarh') {
    var Chhattisgarh = ["Bastar","Bijapur","Bilaspur","Dakshin Bastar Dantewada","Dhamtari","Durg","Jashpur","Janjgir-Champa","Kabirdham","Korba","Koriya","Mahasamund",
                                            "Narayanpur","Raigarh","Rajnandgaon","Raipur","Surajpur","Surguja","Uttar Bastar Kanker"];
   $(function() {
  var options = '';
  for (var i = 0; i < Chhattisgarh.length; i++) {
      options += '<option value="' + Chhattisgarh[i] + '">' + Chhattisgarh[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
  if ($val=='Dadra and Nagar Haveli') {
    var dadra = ["Amal","Silvassa"];
   $(function() {
  var options = '';
  for (var i = 0; i < dadra.length; i++) {
      options += '<option value="' + dadra[i] + '">' + dadra[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
  if ($val=='Daman and Diu') {
    var daman = ["Daman","Diu"];
   $(function() {
  var options = '';
  for (var i = 0; i < daman.length; i++) {
      options += '<option value="' + daman[i] + '">' + daman[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
  if ($val=='Delhi') {
    var delhi = ["Central", "East Delhi","New Delhi","North Delhi","North East","North West","West Delhi"];
   $(function() {
  var options = '';
  for (var i = 0; i < delhi.length; i++) {
      options += '<option value="' + delhi[i] + '">' + delhi[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
  if ($val=='Goa') {
    var goa = ["Chapora","Dabolim","Madgaon","Marmugao (Marmagao)","Panaji Port","Panjim","Pellet Plant Jetty/Shiroda","Talpona","Vasco da Gama"];
   $(function() {
  var options = '';
  for (var i = 0; i < goa.length; i++) {
      options += '<option value="' + goa[i] + '">' + goa[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
  if ($val=='Gujarat') {
    var gujarat = ["Ahmedabad","Amreli","Anand","Banas kantha","Bharuch","Bhavnagar","Dohad(Dahod)","Gandhinagar","Jamnagar","Junagadh",
                                        "Kachchh","Kheda","Mehsana","Narmada","Navsari","Panch mahals","Patan","Porbandar","Rajkot","Sabar kantha","Surat","Surendranagar","Tapi","The Dangs","Vadodara","Valsad"];
   $(function() {
  var options = '';
  for (var i = 0; i < gujarat.length; i++) {
      options += '<option value="' + gujarat[i] + '">' + gujarat[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
  if ($val=='Haryana') {
    var haryana = ["Ambala","Bhiwani","Faridabad","Fatehabad","Gurgaon","Hissar","Jhajjar","Jind","Karnal","Kaithal",
                                            "Kurukshetra","Mahendragarh","Mewat","Palwal","Panchkula","Panipat","Rewari","Rohtak","Sirsa","Sonipat","Yamuna Nagar"];
   $(function() {
  var options = '';
  for (var i = 0; i < haryana.length; i++) {
      options += '<option value="' + haryana[i] + '">' + haryana[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
  
  if ($val=='Himachal Pradesh') {
    var himachal = ["Bilaspur","Chamba","Hamirpur","Kangra","Kinnaur","Kullu","Lahul & Spiti","Mandi","Shimla","Sirmaur","Solan","Una"];
   $(function() {
  var options = '';
  for (var i = 0; i < himachal.length; i++) {
      options += '<option value="' + himachal[i] + '">' + himachal[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
  if ($val=='Jammu and Kashmir') {
    var jammu = ["Anantnag","Badgam","Bandipore (Bandipora)","Baramula (Baramulla)","Doda","Ganderbal","Jammu","Kargil","Kathua","Kishtwar","Kulgam","Kupwara","Leh","Pulwama","Punch (Poonch)","Rajouri","Ramban","Reasi","Samba","Shupiyan (Shopian)","Srinagar","Udhampur"];
   $(function() {
  var options = '';
  for (var i = 0; i < jammu.length; i++) {
      options += '<option value="' + jammu[i] + '">' + jammu[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
  if ($val=='Jharkhand') {
    var jharkhand = ["Bokaro","Chatra","Deoghar","Dhanbad","Dumka","Garhwa","Giridih","Godda","Garhwa","Giridih","Godda","Gumla","Hazaribag","Jamtara","Khunti","Koderma","Latehar","Lohardaga","Pakur","Palamu",
                                            "Ramgarh","Ranchi","Sahibganj","Seraikela Kharsawan","Simdega"];
   $(function() {
  var options = '';
  for (var i = 0; i < jharkhand.length; i++) {
      options += '<option value="' + jharkhand[i] + '">' + jharkhand[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
  if ($val=='Karnataka') {
    var karnataka = ["Bagalkot","Bangalore","Bangalore Urban","Belgaum","Bellary","Bidar","Bijapur","Chamarajnagar", "Chikkamagaluru","Chikkaballapura (Chikballapur)",
                                           "Chitradurga","Dakshina Kannada","Davanagere","Dharwad","Gadag","Gulbarga","Hassan","Haveri","Kodagu",
                                           "Kolar","Koppal","Mandya","Mysore","Raichur","Shimoga","Tumkur","Udupi","Uttara Kannada","Ramanagara","Yadgir"];
   $(function() {
  var options = '';
  for (var i = 0; i < karnataka.length; i++) {
      options += '<option value="' + karnataka[i] + '">' + karnataka[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
  if ($val=='Kerala') {
    var kerala = ["Alappuzha","Ernakulam","Idukki","Kannur","Kasaragod","Kollam","Kottayam","Kozhikode","Malappuram","Palakkad","Pathanamthitta","Thrissur","Thiruvananthapuram","Wayanad"];
   $(function() {
  var options = '';
  for (var i = 0; i < kerala.length; i++) {
      options += '<option value="' + kerala[i] + '">' + kerala[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
  if ($val=='Madhya Pradesh') {
    var mp = ["Alirajpur","Anuppur","Ashoknagar","Balaghat","Barwani","Betul","Bhind","Bhopal","Burhanpur","Chhatarpur","Chhindwara","Damoh","Datia","Dewas","Dhar","Guna","Gwalior","Hoshangabad",
                                    "Indore","Jabalpur","Jhabua","Katni","Khandwa","Khargone","Mandla","Mandsaur","Morena","Narsimhapur (Narsinghpur)","Neemuch","Panna","Raisen","Rajgarh","Ratlam",
                                    "Rewa","Sagar","Satna","Sehore","Seoni","Shahdol","Shajapur","Sheopur","Shivpuri","Sidhi","Singrauli","Tikamgarh","Ujjain","Umaria","Vidisha"];
   $(function() {
  var options = '';
  for (var i = 0; i < mp.length; i++) {
      options += '<option value="' + mp[i] + '">' + mp[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
  if ($val=='Maharashtra') {
    var maharashtra = ["Ahmednagar","Akola","Amaravati","Aurangabad","Beed","Bhandara","Buldhana","Chandrapur","Dhule","Gadchiroli","Gondia","Hingoli","Jalgaon",
                                             "Jalna","Kolhapur","Latur","Mumbai City","Mumbai Suburban","Nagpur","Nanded","Nandurbar","Nashik","Osmanabad","Palghar","Parbhani","Pune","Ratnagiri","Ratnagiri","Sangli","Satara","Sindhudurg","Solapur","Thane","Wardha","Washim","Yavatmal"];
   $(function() {
  var options = '';
  for (var i = 0; i < maharashtra.length; i++) {
      options += '<option value="' + maharashtra[i] + '">' + maharashtra[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
   if ($val=='Manipur') {
    var manipur = ["Bishnupur","Chandel","Churachandpur","Imphal East","Imphal West","Senapati","Tamenglong","Thoubal","Ukhrul"];
   $(function() {
  var options = '';
  for (var i = 0; i < manipur.length; i++) {
      options += '<option value="' + manipur[i] + '">' + manipur[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
   if ($val=='Meghalaya') {
    var meghalaya = ["Baghamara","Cherrapunjee (Cherrapunji)","Jowai","Lawsohtun","Madanriting (Madanrting)","Mairang","Mawlai","Mawpat","Nongkseh","Nongmynsong","Nongpoh","Nongstoin","Nongthymmai","Pynthormukhrah (Pynthorumkhrah)","Resubelpara","Shillong"," Shillong Cantonment","Tura","Umlyngka","Umpling","Umroi","Williamnagar"];
   $(function() {
  var options = '';
  for (var i = 0; i < meghalaya.length; i++) {
      options += '<option value="' + meghalaya[i] + '">' + meghalaya[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
   if ($val=='Mizoram') {
    var mizoram = ["Aizawl","Champhai","Kolasib","Lawngtlai","Lunglei","Mamit","Saiha","Serchhip"];
   $(function() {
  var options = '';
  for (var i = 0; i < mizoram.length; i++) {
      options += '<option value="' + mizoram[i] + '">' + mizoram[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
   if ($val=='Nagaland') {
    var nagaland = ["Dimapur","Kiphire","Kohima","Longleng","Mokokchung","Mon","Peren","Phek","Tuensang","Wokha","Zunheboto"];
   $(function() {
  var options = '';
  for (var i = 0; i < nagaland.length; i++) {
      options += '<option value="' + nagaland[i] + '">' + nagaland[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
  if ($val=='Orissa') {
    var orissa = ["Anugul (Angul)","Balangir","Baleshwar (Balasore)","Bargarh","Baudh (Boudh)","Bhadrak","Cuttack","Debagarh","Dhenkanal","Gajapati","Ganjam","Jagatsinghapur","Jajapur","Jharsuguda","Kalahandi","Kandhamal","Kendrapara","Kendujhar","Khordha","Koraput","Malkangiri","Mayurbhanj","Nabarangapur (Nabarangpur)","Nayagarh", "Nuapada","Puri","Rayagada","Sambalpur","Subarnapur","Sundargarh (Sundergarh)"];
   $(function() {
  var options = '';
  for (var i = 0; i < orissa.length; i++) {
      options += '<option value="' + orissa[i] + '">' + orissa[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
  if ($val=='Puducherry') {
    var puducherry = ["Karaikal","Mahe","Pondicherry","Yanam"];
   $(function() {
  var options = '';
  for (var i = 0; i < puducherry.length; i++) {
      options += '<option value="' + puducherry[i] + '">' + puducherry[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
  if ($val=='Punjab') {
    var punjab = ["Amritsar","Barnala","Bathinda","Faridkot","Fatehgarh Sahib","Firozpur","Gurdaspur","Hoshiarpur","Jalandhar","Kapurthala","Ludhiana","Mansa","Moga","Muktsar (Sri Muktsar Sahib)",
                                        "Patiala","Rupnagar","Sahibzada Ajit Singh Nagar","Sangrur","Shahid Bhagat Singh Nagar","Tarn Taran"];
   $(function() {
  var options = '';
  for (var i = 0; i < punjab.length; i++) {
      options += '<option value="' + punjab[i] + '">' + napunjabgaland[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
  if ($val=='Rajasthan') {
    var rajasthan = ["Ajmer","Alwar","Banswara","Barmer","Bharatpur","Bhilwara","Bikaner","Bundi","Chittaurgarh","Churu","Dausa","Dhaulpur (Dholpur)","Dungarpur","Ganganagar","Hanumangarh","Jaipur",
                                       "Jaisalmer","Jalor (Jalore)","Jhalawar","Jhunjhunu","Jodhpur","Karauli","Kota","Nagaur","Pali","Pratapgarh","Rajsamand","Sawai Madhopur","Sikar","Sirohi","Tonk","Udaipur"];
   $(function() {
  var options = '';
  for (var i = 0; i < rajasthan.length; i++) {
      options += '<option value="' + rajasthan[i] + '">' + rajasthan[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
  if ($val=='Sikkim') {
    var sikkim = ["Gangtok (incl. Upper Tadong)","Gyalshing","Jorethang","Mangan","Namchi","Nayabazar","Rangpo","Rhenak (Rhenock)","Singtam"];
   $(function() {
  var options = '';
  for (var i = 0; i < sikkim.length; i++) {
      options += '<option value="' + sikkim[i] + '">' + sikkim[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
  
  if ($val=='Tamil Nadu') {
    var tn = ["Ariyalur","Chennai","Coimbatore","Cuddalore","Dharmapuri","Dindigul","Erode","Kanchipuram","Kanyakumari","Karur","Krishnagiri","Madurai","Nagapattinam","Namakkal","Perambalur","Pudukkottai","Ramanathapuram","Salem","Sivaganga","Thanjavur","Theni", "The Nilgiris","Thiruvallur (Tiruvallur)","Thiruvarur (Tiruvarur)","Thoothukkudi","Tiruchirappalli","Tirunelveli","Tiruppur","Tiruvannamalai",
                                 "Vellore","Villupuram","Virudhunagar"];
   $(function() {
  var options = '';
  for (var i = 0; i < tn.length; i++) {
      options += '<option value="' + tn[i] + '">' + tn[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
  
  if ($val=='Telangana') {
    var telangana = ["Adilabad","Hyderabad","Karimnagar","Khammam","Mahbubnagar","Medak","Nalgonda","Nizamabad","Ranga Reddy","Warangal"];
   $(function() {
  var options = '';
  for (var i = 0; i < telangana.length; i++) {
      options += '<option value="' + telangana[i] + '">' + telangana[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
  
  if ($val=='Tripura') {
    var tripura = ["Agartala","Amarpur","Ambassa","Anandanagar","Bankimnagar","Belonia","Bishalgarh","Briddhanagar","Chandigarh","Charipara","Dewanpasa","Dharmanagar","Dhwajnagar","Dukli","Fatikroy","Fulkumari","Gakulnagar","Gakulpur","Gandhigram","Kailasahar (Kailashahar)","Kamalpur","Kalachhari","Kanchanpur","Khowai","Kumarghat","Lebachhara","Mahurighat","Madhuban","Madhupur","Manu","Matarbari","Narsingarh","Panisagar","Radhakishorenagar","Ranirbazar","Old Raghna Bazar","Sabroom","Santir Bazar","Singarbil","Sonamura","Taranagar","Teliamura","Udaipur","Uttar Champamura"];
   $(function() {
  var options = '';
  for (var i = 0; i < tripura.length; i++) {
      options += '<option value="' + tripura[i] + '">' + tripura[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
  
  if ($val=='Uttar Pradesh') {
    var up = ["Agra","Aligarh","Allahabad","Ambedkar Nagar","Amroha (Jyotiba Phule Nagar)","Auraiya","Azamgarh","Banbasa","Baghpat","Bahraich","Ballia","Balrampur","Banda","Bara Banki","Bareilly","Basti","Bijnor","Budaun","Bulandshahr","Chandauli","Chitrakoot","Deoria","Etah","Etawah","Faizabad","Farrukhabad","Fatehpur","Firozabad","Gautam Buddha Nagar","Ghaziabad","Ghazipur","Gonda","Gorakhpur",
                                    "Hamirpur","Hardoi","Hathras (Mahamaya Nagar)","Jalaun","Jaunpur ","Jhansi","","Kanpur","Kannauj","Kanpur Dehat","Kanpur Nagar","Kasganj (Kanshiram Nagar)","Kaushambi","Kheri (Lakhimpur Kheri)","Kushinagar","Lalitpur","Lucknow","Mahoba","Mahrajganj (Maharajganj)","Mainpuri","Mathura","Mau","Meerut","Mirzapur","Moradabad","Muzaffarnagar",
                                    "Pilibhit","Pratapgarh","Rae Bareli","Rampur","Saharanpur","Sant Kabir Nagar","Sant Ravidas Nagar (Bhadohi)","Surajpur","Shahjahanpur","Shrawasti (Shravasti)","Siddharthnagar","Sitapur","Sonbhadra","Sultanpur","Unnao","Varanasi"];
   $(function() {
  var options = '';
  for (var i = 0; i < up.length; i++) {
      options += '<option value="' + up[i] + '">' + up[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
  
  if ($val=='Uttarakhand') {
    var uttarakhand = ["Almora","Bageshwar","Chamoli","Champawat","DehraDun","Garhwal","Haldwani","Hardwar (Haridwar)","Haridwar","Nainital","Pithoragarh","Rudraprayag","Pithoragarh","Tehri Garhwal","Udham Singh Nagar","Uttarkashi"];
   $(function() {
  var options = '';
  for (var i = 0; i < uttarakhand.length; i++) {
      options += '<option value="' + uttarakhand[i] + '">' + uttarakhand[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
  
  if ($val=='West Bengal') {
    var wb = ["Bankura","Bardhaman","Birbhum","Dakshin Dinajpur","Darjiling (Darjeeling)","Haora (Howrah)","Hugli (Hooghly)"	,
                                    "Jalpaiguri","Koch Bihar (Cooch Behar)","Kolkata","Maldah","Murshidabad","Nadia","North 24 Parganas","Paschim Medinipur","Purba Medinipur","Puruliya","South 24 Parganas","Uttar Dinajpur"];
   $(function() {
  var options = '';
  for (var i = 0; i < wb.length; i++) {
      options += '<option value="' + wb[i] + '">' + wb[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
}