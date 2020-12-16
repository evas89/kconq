var picker = new Pikaday(
{
    field: document.getElementById('birthday'),
    firstDay: 1,
    minDate: new Date(1900, 0, 1),
    maxDate: new Date(2025, 12, 31),
    yearRange: [1900,2025]
});