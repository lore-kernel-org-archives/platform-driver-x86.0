From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] acer-wmi: use pr_<level> for messages
Date: Wed, 16 Mar 2011 09:47:38 -0700
Message-ID: <20110316164738.GB6974@core.coreip.homeip.net>
References: <1300272756-32576-1-git-send-email-jlee@novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:59170 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752531Ab1CPQrn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 16 Mar 2011 12:47:43 -0400
Received: by pwi15 with SMTP id 15so309096pwi.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Mar 2011 09:47:42 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1300272756-32576-1-git-send-email-jlee@novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@novell.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Matthew Garrett <mjg@redhat.com>, Corentin Chary <corentincj@iksaif.net>

On Wed, Mar 16, 2011 at 06:52:36PM +0800, Lee, Chun-Yi wrote:
> acer-wmi: use pr_<level> for messages
> 
> Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
> Cc: Matthew Garrett <mjg@redhat.com>
> Cc: Corentin Chary <corentincj@iksaif.net>
> Cc: Dmitry Torokhov <dtor@mail.ru>
> Signed-off-by: Lee, Chun-Yi <jlee@novell.com>

Looks good, thanks for cleaning this up.

Reviewed-by: Dmitry Torokhov <dtor@mail.ru>

> ---
>  drivers/platform/x86/acer-wmi.c |   68 ++++++++++++++++-----------------------
>  1 files changed, 28 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index d10b280..1953c70 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -22,6 +22,8 @@
>   *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
>   */
>  
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/init.h>
> @@ -47,12 +49,6 @@ MODULE_AUTHOR("Carlos Corbacho");
>  MODULE_DESCRIPTION("Acer Laptop WMI Extras Driver");
>  MODULE_LICENSE("GPL");
>  
> -#define ACER_LOGPREFIX "acer-wmi: "
> -#define ACER_ERR KERN_ERR ACER_LOGPREFIX
> -#define ACER_NOTICE KERN_NOTICE ACER_LOGPREFIX
> -#define ACER_INFO KERN_INFO ACER_LOGPREFIX
> -#define ACER_WARNING KERN_WARNING ACER_LOGPREFIX
> -
>  /*
>   * Magic Number
>   * Meaning is unknown - this number is required for writing to ACPI for AMW0
> @@ -846,7 +842,7 @@ static void type_aa_dmi_decode(const struct dmi_header *header, void *dummy)
>  	has_type_aa = true;
>  	type_aa = (struct hotkey_function_type_aa *) header;
>  
> -	printk(ACER_INFO "Function bitmap for Communication Button: 0x%x\n",
> +	pr_info("Function bitmap for Communication Button: 0x%x\n",
>  		type_aa->commun_func_bitmap);
>  
>  	if (type_aa->commun_func_bitmap & ACER_WMID3_GDS_WIRELESS)
> @@ -1036,7 +1032,7 @@ static int __devinit acer_backlight_init(struct device *dev)
>  	bd = backlight_device_register("acer-wmi", dev, NULL, &acer_bl_ops,
>  				       &props);
>  	if (IS_ERR(bd)) {
> -		printk(ACER_ERR "Could not register Acer backlight device\n");
> +		pr_err("Could not register Acer backlight device\n");
>  		acer_backlight_device = NULL;
>  		return PTR_ERR(bd);
>  	}
> @@ -1083,8 +1079,7 @@ static acpi_status wmid3_get_device_status(u32 *value, u16 device)
>  		return AE_ERROR;
>  	}
>  	if (obj->buffer.length != 8) {
> -		printk(ACER_WARNING "Unknown buffer length %d\n",
> -			obj->buffer.length);
> +		pr_warning("Unknown buffer length %d\n", obj->buffer.length);
>  		kfree(obj);
>  		return AE_ERROR;
>  	}
> @@ -1093,7 +1088,7 @@ static acpi_status wmid3_get_device_status(u32 *value, u16 device)
>  	kfree(obj);
>  
>  	if (return_value.error_code || return_value.ec_return_value)
> -		printk(ACER_WARNING "Get Device Status failed: "
> +		pr_warning("Get Device Status failed: "
>  			"0x%x - 0x%x\n", return_value.error_code,
>  			return_value.ec_return_value);
>  	else
> @@ -1309,7 +1304,7 @@ static void acer_wmi_notify(u32 value, void *context)
>  
>  	status = wmi_get_event_data(value, &response);
>  	if (status != AE_OK) {
> -		printk(ACER_WARNING "bad event status 0x%x\n", status);
> +		pr_warning("bad event status 0x%x\n", status);
>  		return;
>  	}
>  
> @@ -1318,14 +1313,12 @@ static void acer_wmi_notify(u32 value, void *context)
>  	if (!obj)
>  		return;
>  	if (obj->type != ACPI_TYPE_BUFFER) {
> -		printk(ACER_WARNING "Unknown response received %d\n",
> -			obj->type);
> +		pr_warning("Unknown response received %d\n", obj->type);
>  		kfree(obj);
>  		return;
>  	}
>  	if (obj->buffer.length != 8) {
> -		printk(ACER_WARNING "Unknown buffer length %d\n",
> -			obj->buffer.length);
> +		pr_warning("Unknown buffer length %d\n", obj->buffer.length);
>  		kfree(obj);
>  		return;
>  	}
> @@ -1337,11 +1330,11 @@ static void acer_wmi_notify(u32 value, void *context)
>  	case WMID_HOTKEY_EVENT:
>  		if (!sparse_keymap_report_event(acer_wmi_input_dev,
>  				return_value.key_num, 1, true))
> -			printk(ACER_WARNING "Unknown key number - 0x%x\n",
> +			pr_warning("Unknown key number - 0x%x\n",
>  				return_value.key_num);
>  		break;
>  	default:
> -		printk(ACER_WARNING "Unknown function number - %d - %d\n",
> +		pr_warning("Unknown function number - %d - %d\n",
>  			return_value.function, return_value.key_num);
>  		break;
>  	}
> @@ -1370,8 +1363,7 @@ wmid3_set_lm_mode(struct lm_input_params *params,
>  		return AE_ERROR;
>  	}
>  	if (obj->buffer.length != 4) {
> -		printk(ACER_WARNING "Unknown buffer length %d\n",
> -		       obj->buffer.length);
> +		pr_warning("Unknown buffer length %d\n", obj->buffer.length);
>  		kfree(obj);
>  		return AE_ERROR;
>  	}
> @@ -1396,11 +1388,11 @@ static int acer_wmi_enable_ec_raw(void)
>  	status = wmid3_set_lm_mode(&params, &return_value);
>  
>  	if (return_value.error_code || return_value.ec_return_value)
> -		printk(ACER_WARNING "Enabling EC raw mode failed: "
> +		pr_warning("Enabling EC raw mode failed: "
>  		       "0x%x - 0x%x\n", return_value.error_code,
>  		       return_value.ec_return_value);
>  	else
> -		printk(ACER_INFO "Enabled EC raw mode");
> +		pr_info("Enabled EC raw mode");
>  
>  	return status;
>  }
> @@ -1419,7 +1411,7 @@ static int acer_wmi_enable_lm(void)
>  	status = wmid3_set_lm_mode(&params, &return_value);
>  
>  	if (return_value.error_code || return_value.ec_return_value)
> -		printk(ACER_WARNING "Enabling Launch Manager failed: "
> +		pr_warning("Enabling Launch Manager failed: "
>  		       "0x%x - 0x%x\n", return_value.error_code,
>  		       return_value.ec_return_value);
>  
> @@ -1636,7 +1628,7 @@ static int create_debugfs(void)
>  {
>  	interface->debug.root = debugfs_create_dir("acer-wmi", NULL);
>  	if (!interface->debug.root) {
> -		printk(ACER_ERR "Failed to create debugfs directory");
> +		pr_err("Failed to create debugfs directory");
>  		return -ENOMEM;
>  	}
>  
> @@ -1657,11 +1649,10 @@ static int __init acer_wmi_init(void)
>  {
>  	int err;
>  
> -	printk(ACER_INFO "Acer Laptop ACPI-WMI Extras\n");
> +	pr_info("Acer Laptop ACPI-WMI Extras\n");
>  
>  	if (dmi_check_system(acer_blacklist)) {
> -		printk(ACER_INFO "Blacklisted hardware detected - "
> -				"not loading\n");
> +		pr_info("Blacklisted hardware detected - not loading\n");
>  		return -ENODEV;
>  	}
>  
> @@ -1678,12 +1669,11 @@ static int __init acer_wmi_init(void)
>  
>  	if (wmi_has_guid(WMID_GUID2) && interface) {
>  		if (ACPI_FAILURE(WMID_set_capabilities())) {
> -			printk(ACER_ERR "Unable to detect available WMID "
> -					"devices\n");
> +			pr_err("Unable to detect available WMID devices\n");
>  			return -ENODEV;
>  		}
>  	} else if (!wmi_has_guid(WMID_GUID2) && interface) {
> -		printk(ACER_ERR "No WMID device detection method found\n");
> +		pr_err("No WMID device detection method found\n");
>  		return -ENODEV;
>  	}
>  
> @@ -1691,8 +1681,7 @@ static int __init acer_wmi_init(void)
>  		interface = &AMW0_interface;
>  
>  		if (ACPI_FAILURE(AMW0_set_capabilities())) {
> -			printk(ACER_ERR "Unable to detect available AMW0 "
> -					"devices\n");
> +			pr_err("Unable to detect available AMW0 devices\n");
>  			return -ENODEV;
>  		}
>  	}
> @@ -1701,8 +1690,7 @@ static int __init acer_wmi_init(void)
>  		AMW0_find_mailled();
>  
>  	if (!interface) {
> -		printk(ACER_INFO "No or unsupported WMI interface, unable to "
> -				"load\n");
> +		pr_err("No or unsupported WMI interface, unable to load\n");
>  		return -ENODEV;
>  	}
>  
> @@ -1710,22 +1698,22 @@ static int __init acer_wmi_init(void)
>  
>  	if (acpi_video_backlight_support() && has_cap(ACER_CAP_BRIGHTNESS)) {
>  		interface->capability &= ~ACER_CAP_BRIGHTNESS;
> -		printk(ACER_INFO "Brightness must be controlled by "
> +		pr_info("Brightness must be controlled by "
>  		       "generic video driver\n");
>  	}
>  
>  	if (wmi_has_guid(WMID_GUID3)) {
>  		if (ec_raw_mode) {
>  			if (ACPI_FAILURE(acer_wmi_enable_ec_raw())) {
> -				printk(ACER_ERR "Cannot enable EC raw mode\n");
> +				pr_err("Cannot enable EC raw mode\n");
>  				return -ENODEV;
>  			}
>  		} else if (ACPI_FAILURE(acer_wmi_enable_lm())) {
> -			printk(ACER_ERR "Cannot enable Launch Manager mode\n");
> +			pr_err("Cannot enable Launch Manager mode\n");
>  			return -ENODEV;
>  		}
>  	} else if (ec_raw_mode) {
> -		printk(ACER_INFO "No WMID EC raw mode enable method\n");
> +		pr_info("No WMID EC raw mode enable method\n");
>  	}
>  
>  	if (wmi_has_guid(ACERWMID_EVENT_GUID)) {
> @@ -1736,7 +1724,7 @@ static int __init acer_wmi_init(void)
>  
>  	err = platform_driver_register(&acer_platform_driver);
>  	if (err) {
> -		printk(ACER_ERR "Unable to register platform driver.\n");
> +		pr_err("Unable to register platform driver.\n");
>  		goto error_platform_register;
>  	}
>  
> @@ -1791,7 +1779,7 @@ static void __exit acer_wmi_exit(void)
>  	platform_device_unregister(acer_platform_device);
>  	platform_driver_unregister(&acer_platform_driver);
>  
> -	printk(ACER_INFO "Acer Laptop WMI Extras unloaded\n");
> +	pr_info("Acer Laptop WMI Extras unloaded\n");
>  	return;
>  }
>  
> -- 
> 1.6.0.2
> 

-- 
Dmitry
