<template>
  <div id="app">
    <img src="./assets/logo.png">

    <form id="form" @submit="formValidator" action="" method="POST">
      <p>
        <div class="error">{{ ageValidator }}</div>
        <label for="age" class="input-label">年齢:</label>
        <input type="number" id="age" v-model="ans.age" class="input-row">
      </p>
      <p>
        <div class="error">{{ sexValidator }}</div>
        <label for="sex" class="input-label">性別:</label>
        <select v-model="ans.sex" placeholder="性別" class="input-row">
          <option value="">---</option>
          <option value="男性">男性</option>
          <option value="女性">女性</option>
          <option value="その他">その他</option>
        </select>
      </p>

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
        sex: '',
      },
      validation: {
        age: false,
        sex: false
      },
      baseUrl: 'http://127.0.0.1'
    }
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
    sexValidator:function() {
      if(this.ans.sex === '男性' ||
         this.ans.sex === '女性' ||
         this.ans.sex === 'その他'){
        this.validation.sex = true;
        return '';
      }
      return '性別を選択してください';
    }
  },
  methods: {
    formValidator: function(e) {
      if(this.validation.age === false ||
         this.validation.sex === false){
        e.preventDefault();
        alert('項目を正しく入力してください');
      }

      e.preventDefault();
      this.$http.post(this.baseUrl + '/api/questions/', this.ans).then(response => {
        console.log('success');
      }, response => {
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
