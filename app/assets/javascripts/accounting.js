console.log("sd");
var sum = 0.0;
$('.cost').each(function()
{
    sum += parseFloat($(this).text());
});
alert(sum);
