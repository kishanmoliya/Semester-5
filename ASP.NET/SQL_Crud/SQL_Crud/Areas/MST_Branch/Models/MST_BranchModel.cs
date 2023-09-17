using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace SQL_Crud.Areas.MST_Branch.Models
{
    public class MST_BranchModel
    {

        public int? BranchID { get; set; }

        [Required]
        [DisplayName("Country Name")]
        public string BranchName { get; set; } = string.Empty;

        [Required]
        [DisplayName("Country Code")]
        public string BranchCode { get; set; } = string.Empty;
    }
}
