From: jlee@suse.com
Subject: Re: [PATCH v4 1/2] platform/x86: acer-wmi: Inform firmware that RF
 Button Driver is active
Date: Tue, 14 Feb 2017 08:33:30 +0800
Message-ID: <20170214003330.weeyeict7ke65a3u@linux-rasp2>
References: <20170208135141.2105-1-drake@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:52024 "EHLO
        smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751477AbdBNAeD (ORCPT
        <rfc822;groupwise-platform-driver-x86@vger.kernel.org:0:0>);
        Mon, 13 Feb 2017 19:34:03 -0500
Content-Disposition: inline
In-Reply-To: <20170208135141.2105-1-drake@endlessm.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Daniel Drake <drake@endlessm.com>
Cc: dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux@endlessm.com, chiu@endlessm.com

On Wed, Feb 08, 2017 at 07:51:40AM -0600, Daniel Drake wrote:
> From: Chris Chiu <chiu@endlessm.com>
> 
> The same method to activate LM(Launch Manager) can also be used to
> activate the RF Button driver with different bit toggled in the same
> lm_status. To express that many functions this byte field can achieve,
> rename the lm_status to app_status. And also the app_mask is the bit
> mask which specifically indicate which bits are going to be changed.
> 
> This solves a problem where the AR9565 wifi included in the
> Acer Aspire ES1-421 is permanently hard blocked according to the rfkill
> GPIO read by ath9k.
> 
> Signed-off-by: Chris Chiu <chiu@endlessm.com>
> Signed-off-by: Daniel Drake <drake@endlessm.com>

Reviewed-by: Lee, Chun-Yi <jlee@suse.com>


Thanks for your patches!

Joey Lee

> ---
>  drivers/platform/x86/acer-wmi.c | 74 ++++++++++++++++++++++++++++++++---------
>  1 file changed, 58 insertions(+), 16 deletions(-)
> 
> v2: fix typo in Chris's email address (endless=>endlessm)
> 
> v3: move keycode addition to separate patch
> 
> v4: Rename set_function_ structs to func_. Don't fail if firmware rejects
>     the new call since we don't have certainty that this will succeed on
>     all product models.
> 
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index c29b9b6..3795d3f 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -150,15 +150,30 @@ struct event_return_value {
>  #define ACER_WMID3_GDS_BLUETOOTH	(1<<11)	/* BT */
>  #define ACER_WMID3_GDS_TOUCHPAD		(1<<1)	/* Touchpad */
>  
> -struct lm_input_params {
> +/* Hotkey Customized Setting and Acer Application Status.
> + * Set Device Default Value and Report Acer Application Status.
> + * When Acer Application starts, it will run this method to inform
> + * BIOS/EC that Acer Application is on.
> + * App Status
> + *	Bit[0]: Launch Manager Status
> + *	Bit[1]: ePM Status
> + *	Bit[2]: Device Control Status
> + *	Bit[3]: Acer Power Button Utility Status
> + *	Bit[4]: RF Button Status
> + *	Bit[5]: ODD PM Status
> + *	Bit[6]: Device Default Value Control
> + *	Bit[7]: Hall Sensor Application Status
> + */
> +struct func_input_params {
>  	u8 function_num;        /* Function Number */
>  	u16 commun_devices;     /* Communication type devices default status */
>  	u16 devices;            /* Other type devices default status */
> -	u8 lm_status;           /* Launch Manager Status */
> -	u16 reserved;
> +	u8 app_status;          /* Acer Device Status. LM, ePM, RF Button... */
> +	u8 app_mask;		/* Bit mask to app_status */
> +	u8 reserved;
>  } __attribute__((packed));
>  
> -struct lm_return_value {
> +struct func_return_value {
>  	u8 error_code;          /* Error Code */
>  	u8 ec_return_value;     /* EC Return Value */
>  	u16 reserved;
> @@ -1769,13 +1784,13 @@ static void acer_wmi_notify(u32 value, void *context)
>  }
>  
>  static acpi_status __init
> -wmid3_set_lm_mode(struct lm_input_params *params,
> -		  struct lm_return_value *return_value)
> +wmid3_set_function_mode(struct func_input_params *params,
> +			struct func_return_value *return_value)
>  {
>  	acpi_status status;
>  	union acpi_object *obj;
>  
> -	struct acpi_buffer input = { sizeof(struct lm_input_params), params };
> +	struct acpi_buffer input = { sizeof(struct func_input_params), params };
>  	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
>  
>  	status = wmi_evaluate_method(WMID_GUID3, 0, 0x1, &input, &output);
> @@ -1796,7 +1811,7 @@ wmid3_set_lm_mode(struct lm_input_params *params,
>  		return AE_ERROR;
>  	}
>  
> -	*return_value = *((struct lm_return_value *)obj->buffer.pointer);
> +	*return_value = *((struct func_return_value *)obj->buffer.pointer);
>  	kfree(obj);
>  
>  	return status;
> @@ -1804,16 +1819,17 @@ wmid3_set_lm_mode(struct lm_input_params *params,
>  
>  static int __init acer_wmi_enable_ec_raw(void)
>  {
> -	struct lm_return_value return_value;
> +	struct func_return_value return_value;
>  	acpi_status status;
> -	struct lm_input_params params = {
> +	struct func_input_params params = {
>  		.function_num = 0x1,
>  		.commun_devices = 0xFFFF,
>  		.devices = 0xFFFF,
> -		.lm_status = 0x00,            /* Launch Manager Deactive */
> +		.app_status = 0x00,		/* Launch Manager Deactive */
> +		.app_mask = 0x01,
>  	};
>  
> -	status = wmid3_set_lm_mode(&params, &return_value);
> +	status = wmid3_set_function_mode(&params, &return_value);
>  
>  	if (return_value.error_code || return_value.ec_return_value)
>  		pr_warn("Enabling EC raw mode failed: 0x%x - 0x%x\n",
> @@ -1827,16 +1843,17 @@ static int __init acer_wmi_enable_ec_raw(void)
>  
>  static int __init acer_wmi_enable_lm(void)
>  {
> -	struct lm_return_value return_value;
> +	struct func_return_value return_value;
>  	acpi_status status;
> -	struct lm_input_params params = {
> +	struct func_input_params params = {
>  		.function_num = 0x1,
>  		.commun_devices = 0xFFFF,
>  		.devices = 0xFFFF,
> -		.lm_status = 0x01,            /* Launch Manager Active */
> +		.app_status = 0x01,            /* Launch Manager Active */
> +		.app_mask = 0x01,
>  	};
>  
> -	status = wmid3_set_lm_mode(&params, &return_value);
> +	status = wmid3_set_function_mode(&params, &return_value);
>  
>  	if (return_value.error_code || return_value.ec_return_value)
>  		pr_warn("Enabling Launch Manager failed: 0x%x - 0x%x\n",
> @@ -1846,6 +1863,28 @@ static int __init acer_wmi_enable_lm(void)
>  	return status;
>  }
>  
> +static int __init acer_wmi_enable_rf_button(void)
> +{
> +	struct func_return_value return_value;
> +	acpi_status status;
> +	struct func_input_params params = {
> +		.function_num = 0x1,
> +		.commun_devices = 0xFFFF,
> +		.devices = 0xFFFF,
> +		.app_status = 0x10,            /* RF Button Active */
> +		.app_mask = 0x10,
> +	};
> +
> +	status = wmid3_set_function_mode(&params, &return_value);
> +
> +	if (return_value.error_code || return_value.ec_return_value)
> +		pr_warn("Enabling RF Button failed: 0x%x - 0x%x\n",
> +			return_value.error_code,
> +			return_value.ec_return_value);
> +
> +	return status;
> +}
> +
>  #define ACER_WMID_ACCEL_HID	"BST0001"
>  
>  static acpi_status __init acer_wmi_get_handle_cb(acpi_handle ah, u32 level,
> @@ -2229,6 +2268,9 @@ static int __init acer_wmi_init(void)
>  		interface->capability &= ~ACER_CAP_BRIGHTNESS;
>  
>  	if (wmi_has_guid(WMID_GUID3)) {
> +		if (ACPI_FAILURE(acer_wmi_enable_rf_button()))
> +			pr_warn("Cannot enable RF Button Driver\n");
> +
>  		if (ec_raw_mode) {
>  			if (ACPI_FAILURE(acer_wmi_enable_ec_raw())) {
>  				pr_err("Cannot enable EC raw mode\n");
> -- 
> 2.9.3
> 
