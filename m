From: joeyli <jlee@suse.com>
Subject: Re: [PATCH 02/15] acer-wmi: Mark init data and code as such
Date: Tue, 29 Jul 2014 11:18:55 +0800
Message-ID: <20140729031855.GL24967@linux-rxt1.site>
References: <1405532597-28262-1-git-send-email-minipli@googlemail.com>
 <1405532597-28262-3-git-send-email-minipli@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:32957 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751779AbaG2DYZ (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:0:0>);
	Mon, 28 Jul 2014 23:24:25 -0400
Content-Disposition: inline
In-Reply-To: <1405532597-28262-3-git-send-email-minipli@googlemail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mathias Krause <minipli@googlemail.com>
Cc: Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org

On Wed, Jul 16, 2014 at 07:43:04PM +0200, Mathias Krause wrote:
> Quite a lot of code and data of acer-wmi.c is only ever used during
> initialization. Mark those accordingly -- and constify, where
> appropriate -- so the memory can be released afterwards.
> 
> All in all those changes move ~10 kB of code and data to the .init
> sections, marking them for release after initialization has finished.
> 
> Signed-off-by: Mathias Krause <minipli@googlemail.com>
> Cc: "Lee, Chun-Yi" <jlee@suse.com>

This patch good to me.

Signed-off-by: "Lee, Chun-Yi" <jlee@suse.com>


Thanks a lot!
Joey Lee

> ---
>  drivers/platform/x86/acer-wmi.c |   41 ++++++++++++++++++++-------------------
>  1 file changed, 21 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index bbf78b2d6d..31f4da5061 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -294,7 +294,7 @@ struct quirk_entry {
>  
>  static struct quirk_entry *quirks;
>  
> -static void set_quirks(void)
> +static void __init set_quirks(void)
>  {
>  	if (!interface)
>  		return;
> @@ -306,7 +306,7 @@ static void set_quirks(void)
>  		interface->capability |= ACER_CAP_BRIGHTNESS;
>  }
>  
> -static int dmi_matched(const struct dmi_system_id *dmi)
> +static int __init dmi_matched(const struct dmi_system_id *dmi)
>  {
>  	quirks = dmi->driver_data;
>  	return 1;
> @@ -337,7 +337,7 @@ static struct quirk_entry quirk_lenovo_ideapad_s205 = {
>  };
>  
>  /* The Aspire One has a dummy ACPI-WMI interface - disable it */
> -static struct dmi_system_id acer_blacklist[] = {
> +static const struct dmi_system_id acer_blacklist[] __initconst = {
>  	{
>  		.ident = "Acer Aspire One (SSD)",
>  		.matches = {
> @@ -355,7 +355,7 @@ static struct dmi_system_id acer_blacklist[] = {
>  	{}
>  };
>  
> -static struct dmi_system_id acer_quirks[] = {
> +static const struct dmi_system_id acer_quirks[] __initconst = {
>  	{
>  		.callback = dmi_matched,
>  		.ident = "Acer Aspire 1360",
> @@ -530,14 +530,15 @@ static struct dmi_system_id acer_quirks[] = {
>  	{}
>  };
>  
> -static int video_set_backlight_video_vendor(const struct dmi_system_id *d)
> +static int __init
> +video_set_backlight_video_vendor(const struct dmi_system_id *d)
>  {
>  	interface->capability &= ~ACER_CAP_BRIGHTNESS;
>  	pr_info("Brightness must be controlled by generic video driver\n");
>  	return 0;
>  }
>  
> -static const struct dmi_system_id video_vendor_dmi_table[] = {
> +static const struct dmi_system_id video_vendor_dmi_table[] __initconst = {
>  	{
>  		.callback = video_set_backlight_video_vendor,
>  		.ident = "Acer TravelMate 4750",
> @@ -582,7 +583,7 @@ static const struct dmi_system_id video_vendor_dmi_table[] = {
>  };
>  
>  /* Find which quirks are needed for a particular vendor/ model pair */
> -static void find_quirks(void)
> +static void __init find_quirks(void)
>  {
>  	if (!force_series) {
>  		dmi_check_system(acer_quirks);
> @@ -749,7 +750,7 @@ static acpi_status AMW0_set_u32(u32 value, u32 cap)
>  	return wmab_execute(&args, NULL);
>  }
>  
> -static acpi_status AMW0_find_mailled(void)
> +static acpi_status __init AMW0_find_mailled(void)
>  {
>  	struct wmab_args args;
>  	struct wmab_ret ret;
> @@ -781,16 +782,16 @@ static acpi_status AMW0_find_mailled(void)
>  	return AE_OK;
>  }
>  
> -static int AMW0_set_cap_acpi_check_device_found;
> +static int AMW0_set_cap_acpi_check_device_found __initdata;
>  
> -static acpi_status AMW0_set_cap_acpi_check_device_cb(acpi_handle handle,
> +static acpi_status __init AMW0_set_cap_acpi_check_device_cb(acpi_handle handle,
>  	u32 level, void *context, void **retval)
>  {
>  	AMW0_set_cap_acpi_check_device_found = 1;
>  	return AE_OK;
>  }
>  
> -static const struct acpi_device_id norfkill_ids[] = {
> +static const struct acpi_device_id norfkill_ids[] __initconst = {
>  	{ "VPC2004", 0},
>  	{ "IBM0068", 0},
>  	{ "LEN0068", 0},
> @@ -798,7 +799,7 @@ static const struct acpi_device_id norfkill_ids[] = {
>  	{ "", 0},
>  };
>  
> -static int AMW0_set_cap_acpi_check_device(void)
> +static int __init AMW0_set_cap_acpi_check_device(void)
>  {
>  	const struct acpi_device_id *id;
>  
> @@ -808,7 +809,7 @@ static int AMW0_set_cap_acpi_check_device(void)
>  	return AMW0_set_cap_acpi_check_device_found;
>  }
>  
> -static acpi_status AMW0_set_capabilities(void)
> +static acpi_status __init AMW0_set_capabilities(void)
>  {
>  	struct wmab_args args;
>  	struct wmab_ret ret;
> @@ -1184,7 +1185,7 @@ static acpi_status wmid_v2_set_u32(u32 value, u32 cap)
>  	return wmid3_set_device_status(value, device);
>  }
>  
> -static void type_aa_dmi_decode(const struct dmi_header *header, void *dummy)
> +static void __init type_aa_dmi_decode(const struct dmi_header *header, void *d)
>  {
>  	struct hotkey_function_type_aa *type_aa;
>  
> @@ -1209,7 +1210,7 @@ static void type_aa_dmi_decode(const struct dmi_header *header, void *dummy)
>  	commun_fn_key_number = type_aa->commun_fn_key_number;
>  }
>  
> -static acpi_status WMID_set_capabilities(void)
> +static acpi_status __init WMID_set_capabilities(void)
>  {
>  	struct acpi_buffer out = {ACPI_ALLOCATE_BUFFER, NULL};
>  	union acpi_object *obj;
> @@ -1777,7 +1778,7 @@ static void acer_wmi_notify(u32 value, void *context)
>  	}
>  }
>  
> -static acpi_status
> +static acpi_status __init
>  wmid3_set_lm_mode(struct lm_input_params *params,
>  		  struct lm_return_value *return_value)
>  {
> @@ -1811,7 +1812,7 @@ wmid3_set_lm_mode(struct lm_input_params *params,
>  	return status;
>  }
>  
> -static int acer_wmi_enable_ec_raw(void)
> +static int __init acer_wmi_enable_ec_raw(void)
>  {
>  	struct lm_return_value return_value;
>  	acpi_status status;
> @@ -1834,7 +1835,7 @@ static int acer_wmi_enable_ec_raw(void)
>  	return status;
>  }
>  
> -static int acer_wmi_enable_lm(void)
> +static int __init acer_wmi_enable_lm(void)
>  {
>  	struct lm_return_value return_value;
>  	acpi_status status;
> @@ -2120,7 +2121,7 @@ static int remove_sysfs(struct platform_device *device)
>  	return 0;
>  }
>  
> -static int create_sysfs(void)
> +static int __init create_sysfs(void)
>  {
>  	int retval = -ENOMEM;
>  
> @@ -2149,7 +2150,7 @@ static void remove_debugfs(void)
>  	debugfs_remove(interface->debug.root);
>  }
>  
> -static int create_debugfs(void)
> +static int __init create_debugfs(void)
>  {
>  	interface->debug.root = debugfs_create_dir("acer-wmi", NULL);
>  	if (!interface->debug.root) {
> -- 
> 1.7.10.4
> 
