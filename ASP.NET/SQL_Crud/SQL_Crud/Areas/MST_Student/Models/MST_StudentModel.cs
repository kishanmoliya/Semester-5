using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace SQL_Crud.Areas.MST_Student.Models
{
    public class MST_StudentModel
    {
        public int CityID { get; set; }

        public int BranchID { get; set; }
        public int? StudentID { get; set; }

        [Required]
        [DisplayName("Student Name")]
        public string StudentName { get; set; } = string.Empty;

        [Required]
        [DisplayName("Branch Name")]
        public string BranchName { get; set; } = string.Empty;

        [Required]
        [DisplayName("Mobile No.")]
        public string MobileNoStudent { get; set; } = string.Empty;

        [Required]
        [DisplayName("Email")]
        public string Email { get; set; } = string.Empty;
    }

    public class MST_CityDropdownModel
    {
        public int CityID { get; set; }
        public string CityName { get; set; } = string.Empty;
    }

    public class MST_BranchDropdownModel
    {
        public int BranchID { get; set; }
        public string BranchName { get; set; } = string.Empty;
    }
}
