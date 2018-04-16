<template>
  <div id="app">
    <img src="./assets/logo.png">
    
    <!-- TODO: delete test code -->
    <p>{{ ans.age }}</p>
    <p v-if="!ageValidator">年齢を入力してください</p>
    <!-- ====================== -->

    <form id="form" method="POST">
      <p>
        <label for="age">年齢:</label>
        <input type="text" id="age" v-model="ans.age">
      </p>
      <p>
        <label for="sex">性別:</label>
        <select v-model="ans.sex" placeholder="性別">
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
      }
    }
  },
  computed: {
    ageValidator:function() {
      this.validation.age = !!this.ans.age;
      return this.validation.age;
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
</style>
