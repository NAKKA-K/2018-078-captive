<template>
  <div id="app">
    <img src="./assets/logo.png">

    <form id="form" @submit="formValidator" action="https://securelogin.arubanetworks.com/swarm.cgi" method="POST">
      <p>
        <div class="error">{{ ageValidator }}</div>
        <label for="age" class="input-label">{{ $t('form.age') }}:</label>
        <input type="number" id="age" v-model="ans.age" class="input-row">
      </p>
      <p>
        <div class="error">{{ genderValidator }}</div>
        <label for="gender" class="input-label">{{ $t('form.sex') }}:</label>
        <select v-model="ans.gender" placeholder="Sex" class="input-row">
          <option value="">---</option>
          <option value="男性">{{ $t('sex_select.male') }}</option>
          <option value="女性">{{ $t('sex_select.female') }}</option>
          <option value="その他">{{ $t('sex_select.other') }}</option>
        </select>
      </p>

      <input type="hidden" name="user" value="078KOBE2018">
      <input type="hidden" name="password" value="078KOBE2018">
      <input type="hidden" name="cmd" value="authenticate">
      <input type="submit" value="Submit">
    </form>


    <div class="terms-box">
        <p class="terms-of-service">{{ termsService }}</p>
    </div>

  </div>
</template>


<script>

export default {
  name: 'app',
  data () {
    return {
      ans: {
        age: '',
        gender: '',
      },
      validation: {
        age: false,
        gender: false
      },
      baseUrl: 'http://127.0.0.1:8080'
    }
  },
  created: function() {
    var language = (window.navigator.userLanguage ||
                    window.navigator.language ||
                    window.navigator.browserLanguage
                   ).substr(0, 2) === "ja" ? "ja" : "en";
    this.$i18n.locale = language;
    console.log(this.$i18n.locale);
  },
  computed: {
    ageValidator:function() {
      if(this.ans.age < 0 | 100 < this.ans.age){
        this.validation.age = false;
        return `${this.$t('error.overAge')}`;
      }else if(this.ans.age === ''){
        this.validation.age = false;
        return `${this.$t('error.noneAge')}`;
      }

      this.validation.age = true;
      return '';
    },
    genderValidator:function() {
      if(this.ans.gender === '男性' ||
         this.ans.gender === '女性' ||
         this.ans.gender === 'その他'){
        this.validation.gender = true;
        return '';
      }
      return `${this.$t('error.noneSex')}`;
    },
    termsService: function() {
      if(this.$i18n.locale === "ja"){
        return `======== 利用規約について ========
        はじめにこのネットワークに接続した時点で、下記に掲げる利用規約にご同意いただいたものとみなします。
        この利用規約に同意できない場合は、このホットスポットワイヤレス・ネットワークに接続することはできません。
        下記利用規約では、「ユーザ」は、このホットスポット無線ネットワークの利用者を表し、「サービス」は、このホットスポットの無線ネットワークおよび関連サービスを指します。
        また「オペレーター」は、このホットスポットのボランティア事業者、およびネットワークに貢献したスポンサーを表しています。
        利用規約
            1. この利用規約に同意した場合、ユーザはサービスがその日限りの無償のボランティアによって提供されていることを認めたものとします。これは、我々が24時間365日のサポートやサービスの監視を提供することができないことを意味し、本サービスに関する問題は、我々が時間を割ける限りの早さで扱われることを表しています。
            2. オペレーターは、信頼性の高く安定したサービスを提供するために可能な限りの最善を尽くします。    
                a. サービスは、予告なく利用できなくなる場合があります。万が一、問題が発生した場合、私達は可能な限り迅速にサービスを復旧させるよう努力します。    
                b. オペレーターは、ネットワーク上を流れる任意のデータの破損・紛失及び、データの傍受に関して一切責任を負わないものとします。        
                    i. これは、電子メールの利用・データのダウンロード及びアップロードを行った際のデータの紛失や破損に関して責任を負わないことを意味します。また、パスワードやアカウント名等が傍受されても責任を負えないことを意味します。
                c. ユーザの機器とデータのセキュリティは、オペレーターの責任ではありません。オペレーターは、ハッキング・ウイルス・盗聴のリスクおよびその他同様の危険により発生した、ユーザーのあらゆる種類の損失・損害について、責任を負うことはできません。    
           3. このホットスポットは、コミュニティーによってコミュニティーのために提供されています。ユーザーはこの「コミュニティ志向」をよく理解したうえでサービスを利用するものとします。また、オペレーターは公平で均一なサービスを提供するために、下記の特権を保持します。        
               a. 本規約に違反しているとみなせる場合、またはマナーが悪い（例、割り当てられている帯域を全て使い果たした場合）場合、及びその他の理由でサービスへのアクセスを拒否する場合があります。        
               b. 全てのネットワーク・プロトコルにおいて、利用規約に反している可能性があるか不適切だとみなした場合、アクセスを制限する場合があります。それらのネットワーク・プロトコルにはKaZaA、eDonkey、Napsterのようなファイル共有ソフトが含まれますが、それらに限ったものではありません。        
               c. 公平で安定したサービスを提供するために、必要に応じて帯域制限を設けることがあります。    
           4. ユーザーは、法律、法令および公序良俗に反しない利用を維持することに同意します。著作権法に違反する恐れのあるもののダウンロードまたはアップロード、サイバー攻撃に該当する行為、及びそれらに類似する行為は固く禁じます。    
           5. 本ネットワークを通過するパケットの一部もしくわ全ては、オペレーターの技術向上とネットワークに関係する研究のため、個人を特定しない形で収集・記録されます。    
               a. 収集・記録されたパケットは厳重に保管され、目的以外には使用しません。   
               b. また、個人が特定できる形での外部への公開などもいたしません。    
           6. 本利用規約は、オペレーターにより理由を問わず変更される場合があります。`
      }
      return `${this.$t('service.terms')}`;
    }
  },
  methods: {
    formValidator: function(e) {
      if(this.validation.age === false ||
         this.validation.gender === false){
        e.preventDefault();
        alert(`${this.$t('error.invalidForm')}`);
        return;
      }

      console.log(this.ans)
      this.$http.post(this.baseUrl + '', this.ans).then(response => {
        console.log('success');
      }, response => {
        e.preventDefault();
        console.log('faild');
      });
    }
  }
}
</script>

<style lang="scss">
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

.input-label {
  font-size: 1.2rem;
}

.input-row {
  width: 100px;
  height: 25px;
}

.error {
  color: red;
}

.terms-box {
  text-align: center;
}
.terms-of-service {
  height: 200px;
  width: 60vw;  
  margin: 100px auto;
  overflow: auto;
  white-space:pre;
}
</style>
