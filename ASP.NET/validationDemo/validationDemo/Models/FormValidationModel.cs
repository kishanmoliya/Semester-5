
using System.ComponentModel.DataAnnotations;

namespace validationDemo.Models
{
    public class FormValidationModel
    {
        [Required]
        public string FirstName{ get; set; }

        [Required(ErrorMessage = "Must Enter LastName")]
        public string LastName { get; set; }
    }
}
