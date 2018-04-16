<template>
  <div id="app">
    <img src="./assets/logo.png">

    <form id="form" method="POST">
      <p>
        <label for="age" class="input-label">年齢:</label>
        <input type="text" id="age" v-model="ans.age" class="input-row">
      </p>
      <p>
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

.input-label {
  font-size: 1.2rem;
}

.input-row {
  width: 100px;
  height: 25px;
}
</style>
