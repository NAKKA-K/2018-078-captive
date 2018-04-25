<template>
  <div id="app">
    <img src="./assets/logo.png">

    <form id="form" @submit="formValidator" action="https://securelogin.arubanetworks.com/swarm.cgi" method="POST">
      <p>
        <div class="error">{{ ageValidator }}</div>
        <label for="age" class="input-label">年齢{{ $t('form.age')}}:</label>
        <input type="number" id="age" v-model="ans.age" class="input-row">
      </p>
      <p>
        <div class="error">{{ genderValidator }}</div>
        <label for="gender" class="input-label">性別:</label>
        <select v-model="ans.gender" placeholder="性別" class="input-row">
          <option value="">---</option>
          <option value="男性">男性</option>
          <option value="女性">女性</option>
          <option value="その他">その他</option>
        </select>
      </p>

      <input type="hidden" name="user" value="078KOBE2018">
      <input type="hidden" name="password" value="078KOBE2018">
      <input type="hidden" name="cmd" value="authenticate">
      <input type="submit" value="送信">
    </form>

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
    console.log(this.i18n);
    $i18n.locale = language;
    console.log(language)
  },
  computed: {
    ageValidator:function() {
      if(this.ans.age < 0 | 100 < this.ans.age){
        this.validation.age = false;
        return '0以上100以下で入力してください';
      }else if(this.ans.age === ''){
        this.validation.age = false;
        return '年齢を入力してください';
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
      return '性別を選択してください';
    }
  },
  methods: {
    formValidator: function(e) {
      if(this.validation.age === false ||
         this.validation.gender === false){
        e.preventDefault();
        alert('項目を正しく入力してください');
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
</style>
