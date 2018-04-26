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
      }else {
        return `By connecting to this network, you agree to be bound by this Acceptable
        Use Policy (AUP).
        If you cannot agree to this policy, you must not connect to the This
        HotSpot wireless network.
        In the text below, the terms USER and CUSTOMER refer to a user of the This
        HotSpot wireless network and the term SERVICE refers to the This HotSpot
        wireless network and associated services.
        The term OPERATOR refers to the volunteer operators of This HotSpot, and
        the sponsors who have contributed to the network.
        Acceptable Use Policy
          1. By agreeing to this AUP, USERS of this HotSpot accept that the SERVICE is provided by
             unpaid volunteers, who all have other "day jobs". This means that we cannot provide 24x7
             support or monitoring of the SERVICE. Any problems will be any dealt with as soon as we
             have time to spare.
          2. The OPERATORS will do their utmost to provide a reliable, stable service. However, USERS
             of the SERVICE accept that:
                a. The SERVICE may become unavailable at any time, and without notice. If this
                   happens, we will endeavor to restore the SERVICE as soon as we can.
                b. The OPERATORS cannot take any responsibility for any user data traversing the
                   SERVICE. We cannot guarantee that your data will not become lost, damaged, or
                   intercepted in transit. We cannot take responsibility if you lose an email or a
                   download or any other kind of transmission, or if someone gains access to your
                   passwords, or for any other like circumstances.
                c. Security of the USER'S equipment and data is not the responsibility of the
                   OPERATORS. It is the USER'S responsibility to safeguard against the risks of
                   hacking, viruses, eavesdropping, and all other such hazards. The OPERATORS are
                   not liable for any kind of loss or damage whatsoever.
          3. This HotSpot is provided by the community, for the community. As such, it is necessary to use
             the SERVICE in a "community-minded" manner. In order to provide a "fair" service for
             everyone, the OPERATORS reserve the right to:
                a. Bar access to the SERVICE to anyone who is deemed to be in breach of this AUP, or
                   is behaving in an unsociable manner (for example by consuming all available
                   bandwidth for themselves), or for any other reason.
                b. Block access to any network protocols that are deemed inappropriate or may
                   contravene Moving-Edge's AUP. Such network protocols include but are not limited to
                   those used by filesharing applications such as KaZaA, eDonkey, and Napster.
                c. Apply any such traffic shaping as is deemed necessary to provide the SERVICE in a
                   fair and stable manner.
          4. USERS of the SERVICE agree to keep their activities legal and in good taste. USERS are
             forbidden to use the SERVICE for the transfer of copyrighted or offensive materials, or any
             other such articles.
          5. For research and operators' technical improvements, a part or all of the packets passing
             through this network are collected and recorded without personally identifiable.
                a. The recorded data are stored strictly and not used for other than for intended
                   purposes.
                b. In addition, those are not disclosed in the personally identifiable form.
          6. The OPERATORS reserve the right to alter the terms and conditions stated in this document
             at any time and for any reason.`
      }
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
  border: 1px solid;
}
</style>
