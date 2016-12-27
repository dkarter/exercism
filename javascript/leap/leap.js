class Year  {
  constructor (year) {
    this.year = year;
  }

  isLeap() {
    const skipCentury = this.year % 400 !== 0 && this.year % 100 === 0;
    const leapYear = this.year % 4 === 0;
    return !skipCentury && leapYear;
  }
};


module.exports = Year;
