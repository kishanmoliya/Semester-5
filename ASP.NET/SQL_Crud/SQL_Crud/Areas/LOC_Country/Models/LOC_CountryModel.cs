using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace SQL_Crud.Areas.LOC_Country.Models
{
    public class LOC_CountryModel
    {
        public int? CountryID { get; set; }

        [Required]
        [DisplayName("Country Name")]
        public string CountryName { get; set; } = string.Empty;

        [Required]
        [DisplayName("Country Code")]
        public string CountryCode { get; set; } = string.Empty;
    }
}
