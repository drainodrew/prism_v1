class PrismSale {
  constructor () {
    this.totalSales = 0
    this.maxSales = 100
    this.owner = "0x..."
    this.charity = "0x..."
    this.sales = {
    }
  }

  canBuy () {
    return this.totalSales < this.maxSales
  }

  hasAccess () {
    //////
    return this.sales[address]
  }

  buy() {
    ///
    this.sales[address] = true
  }
}


