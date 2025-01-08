Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFC01F37C9;
	Wed,  8 Jan 2025 12:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736338268; cv=none; b=SXRBWQQOdB6RkyMOaLqDHpsAgEZSdbtpuw6nPdx5bg2fRLd8NpMINsWTGtdB3AMfE7XvKX6Z/ri0+sQYh3GawNwn+GmEsJD+d8shuJwUF/EegcsyxREjWmI43w9thGJ+5RPHBCUaZEqyc+g592yB6wLVgMdSOnviusx5ykjWwSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736338268; c=relaxed/simple;
	bh=mO5fah9q/n6lr+3b68ZRFejEsUMjBxVbFik87zJRSIM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=eRufDUWJVYryUcIVq5fhGupLRlZZhznBVAjhbOsSPyfuivnhNP7huotYigr9N22IxQRuxPNoY60vmww7wBaCyUEQylpiaaOuZVfiRi6fHr1sU9p2ByTBh/KEGUkSgzTyTDlyWhHGOu4u8TVcOIl7RJoRbift//TAuxGfbfAV9tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d7KnckI+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d7KnckI+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736338264; x=1767874264;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=mO5fah9q/n6lr+3b68ZRFejEsUMjBxVbFik87zJRSIM=;
  b=d7KnckI+yyH48NuzlFzoS612i+eYI3/cVWwmL87CFjNZ5jwSA2za6sSp
   DQmK9OFuq9CCVW0MzMcwAmyB1KpH0Y0DSRgf1nXrpYvtP/HyG9nyDHPDX
   9QDng1ALuPS3/6FYZVAvcSstBUidkkQeoQGJIdlr6UkoxnmEBDofp+rEk
   UJRWN6NEb4zPuvNc4saqquru2n8Z78EZHJaBbwU5tVgqNThkQWZ7u2Kdf
   sR8hljBK4bVI+azhOHmlgw/RC44Pu4TAEXGWlwQgh63Dw9p2hWdIF2eNw
   PHhopGrFoCLWJxD6hJcmAK3NvcedLn1hmbu2L7JK2gxk3QZm8QWtdTi2q
   g==;
X-CSE-ConnectionGUID: d+yppc/9QXu8fINkhL4cIw==
X-CSE-MsgGUID: vikogS7TRjyp6PgFeYf29A==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36444204"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="36444204"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 04:11:04 -0800
X-CSE-ConnectionGUID: J/xt7ew6SlymIYdW6R8fKA==
X-CSE-MsgGUID: OkKO+nxUQeqOWe2nl5O8fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="103138174"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.87])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 04:11:00 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 8 Jan 2025 14:10:56 +0200 (EET)
To: Kurt Borja <kuurtb@gmail.com>
cc: platform-driver-x86@vger.kernel.org, Armin Wolf <w_armin@gmx.de>, 
    mario.limonciello@amd.com, Hans de Goede <hdegoede@redhat.com>, 
    Dell.Client.Kernel@dell.com, LKML <linux-kernel@vger.kernel.org>, 
    Armin Wolf <W_Armin@gmx.de>
Subject: Re: [PATCH v3 06/20] platform/x86: alienware_wmi: General cleanup
 of WMAX methods
In-Reply-To: <20250105153019.19206-8-kuurtb@gmail.com>
Message-ID: <faa1620e-8626-4963-2503-847a620a6509@linux.intel.com>
References: <20250105153019.19206-2-kuurtb@gmail.com> <20250105153019.19206-8-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 5 Jan 2025, Kurt Borja wrote:

> Reorder variable declaration from longest to shortest. Standarize
> show/store method names of WMAX's sysfs groups.
> 
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>  drivers/platform/x86/dell/alienware-wmi.c | 67 +++++++++++------------
>  1 file changed, 32 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
> index 418abf46b593..190fee7539bf 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -725,14 +725,14 @@ static acpi_status alienware_wmax_command(void *in_args, size_t in_size,
>   *	The HDMI mux sysfs node indicates the status of the HDMI input mux.
>   *	It can toggle between standard system GPU output and HDMI input.
>   */
> -static ssize_t show_hdmi_cable(struct device *dev,
> -			       struct device_attribute *attr, char *buf)
> +static ssize_t cable_show(struct device *dev, struct device_attribute *attr,
> +			  char *buf)
>  {
> -	acpi_status status;
> -	u32 out_data;
>  	struct wmax_basic_args in_args = {
>  		.arg = 0,
>  	};
> +	acpi_status status;
> +	u32 out_data;

Hi Kurt,

I took patches 1-6 into review-ilpo-next as they seemed very obvious and 
had multiple rev-bys by now.

Please note that I edited this patch to add the new lines after function 
variable declarations in a few functions where they were missing.

--
 i.

>  	status =
>  	    alienware_wmax_command(&in_args, sizeof(in_args),
>  				   WMAX_METHOD_HDMI_CABLE, &out_data);
> @@ -746,14 +746,14 @@ static ssize_t show_hdmi_cable(struct device *dev,
>  	return sysfs_emit(buf, "unconnected connected [unknown]\n");
>  }
>  
> -static ssize_t show_hdmi_source(struct device *dev,
> -				struct device_attribute *attr, char *buf)
> +static ssize_t source_show(struct device *dev, struct device_attribute *attr,
> +			   char *buf)
>  {
> -	acpi_status status;
> -	u32 out_data;
>  	struct wmax_basic_args in_args = {
>  		.arg = 0,
>  	};
> +	acpi_status status;
> +	u32 out_data;
>  	status =
>  	    alienware_wmax_command(&in_args, sizeof(in_args),
>  				   WMAX_METHOD_HDMI_STATUS, &out_data);
> @@ -768,12 +768,11 @@ static ssize_t show_hdmi_source(struct device *dev,
>  	return sysfs_emit(buf, "input gpu [unknown]\n");
>  }
>  
> -static ssize_t toggle_hdmi_source(struct device *dev,
> -				  struct device_attribute *attr,
> -				  const char *buf, size_t count)
> +static ssize_t source_store(struct device *dev, struct device_attribute *attr,
> +			    const char *buf, size_t count)
>  {
> -	acpi_status status;
>  	struct wmax_basic_args args;
> +	acpi_status status;
>  	if (strcmp(buf, "gpu\n") == 0)
>  		args.arg = 1;
>  	else if (strcmp(buf, "input\n") == 0)
> @@ -791,9 +790,8 @@ static ssize_t toggle_hdmi_source(struct device *dev,
>  	return count;
>  }
>  
> -static DEVICE_ATTR(cable, S_IRUGO, show_hdmi_cable, NULL);
> -static DEVICE_ATTR(source, S_IRUGO | S_IWUSR, show_hdmi_source,
> -		   toggle_hdmi_source);
> +static DEVICE_ATTR_RO(cable);
> +static DEVICE_ATTR_RW(source);
>  
>  static bool hdmi_group_visible(struct kobject *kobj)
>  {
> @@ -818,14 +816,14 @@ static const struct attribute_group hdmi_attribute_group = {
>   * - Currently supports reading cable status
>   * - Leaving expansion room to possibly support dock/undock events later
>   */
> -static ssize_t show_amplifier_status(struct device *dev,
> -				     struct device_attribute *attr, char *buf)
> +static ssize_t status_show(struct device *dev, struct device_attribute *attr,
> +			   char *buf)
>  {
> -	acpi_status status;
> -	u32 out_data;
>  	struct wmax_basic_args in_args = {
>  		.arg = 0,
>  	};
> +	acpi_status status;
> +	u32 out_data;
>  	status =
>  	    alienware_wmax_command(&in_args, sizeof(in_args),
>  				   WMAX_METHOD_AMPLIFIER_CABLE, &out_data);
> @@ -839,7 +837,7 @@ static ssize_t show_amplifier_status(struct device *dev,
>  	return sysfs_emit(buf, "unconnected connected [unknown]\n");
>  }
>  
> -static DEVICE_ATTR(status, S_IRUGO, show_amplifier_status, NULL);
> +static DEVICE_ATTR_RO(status);
>  
>  static bool amplifier_group_visible(struct kobject *kobj)
>  {
> @@ -862,14 +860,14 @@ static const struct attribute_group amplifier_attribute_group = {
>   * Deep Sleep Control support
>   * - Modifies BIOS setting for deep sleep control allowing extra wakeup events
>   */
> -static ssize_t show_deepsleep_status(struct device *dev,
> -				     struct device_attribute *attr, char *buf)
> +static ssize_t deepsleep_show(struct device *dev, struct device_attribute *attr,
> +			      char *buf)
>  {
> -	acpi_status status;
> -	u32 out_data;
>  	struct wmax_basic_args in_args = {
>  		.arg = 0,
>  	};
> +	acpi_status status;
> +	u32 out_data;
>  	status = alienware_wmax_command(&in_args, sizeof(in_args),
>  					WMAX_METHOD_DEEP_SLEEP_STATUS, &out_data);
>  	if (ACPI_SUCCESS(status)) {
> @@ -884,12 +882,11 @@ static ssize_t show_deepsleep_status(struct device *dev,
>  	return sysfs_emit(buf, "disabled s5 s5_s4 [unknown]\n");
>  }
>  
> -static ssize_t toggle_deepsleep(struct device *dev,
> -				struct device_attribute *attr,
> -				const char *buf, size_t count)
> +static ssize_t deepsleep_store(struct device *dev, struct device_attribute *attr,
> +			       const char *buf, size_t count)
>  {
> -	acpi_status status;
>  	struct wmax_basic_args args;
> +	acpi_status status;
>  
>  	if (strcmp(buf, "disabled\n") == 0)
>  		args.arg = 0;
> @@ -908,7 +905,7 @@ static ssize_t toggle_deepsleep(struct device *dev,
>  	return count;
>  }
>  
> -static DEVICE_ATTR(deepsleep, S_IRUGO | S_IWUSR, show_deepsleep_status, toggle_deepsleep);
> +static DEVICE_ATTR_RW(deepsleep);
>  
>  static bool deepsleep_group_visible(struct kobject *kobj)
>  {
> @@ -956,13 +953,13 @@ static bool is_wmax_thermal_code(u32 code)
>  
>  static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
>  {
> -	acpi_status status;
>  	struct wmax_u32_args in_args = {
>  		.operation = operation,
>  		.arg1 = arg,
>  		.arg2 = 0,
>  		.arg3 = 0,
>  	};
> +	acpi_status status;
>  
>  	status = alienware_wmax_command(&in_args, sizeof(in_args),
>  					WMAX_METHOD_THERMAL_INFORMATION,
> @@ -979,13 +976,13 @@ static int wmax_thermal_information(u8 operation, u8 arg, u32 *out_data)
>  
>  static int wmax_thermal_control(u8 profile)
>  {
> -	acpi_status status;
>  	struct wmax_u32_args in_args = {
>  		.operation = WMAX_OPERATION_ACTIVATE_PROFILE,
>  		.arg1 = profile,
>  		.arg2 = 0,
>  		.arg3 = 0,
>  	};
> +	acpi_status status;
>  	u32 out_data;
>  
>  	status = alienware_wmax_command(&in_args, sizeof(in_args),
> @@ -1003,13 +1000,13 @@ static int wmax_thermal_control(u8 profile)
>  
>  static int wmax_game_shift_status(u8 operation, u32 *out_data)
>  {
> -	acpi_status status;
>  	struct wmax_u32_args in_args = {
>  		.operation = operation,
>  		.arg1 = 0,
>  		.arg2 = 0,
>  		.arg3 = 0,
>  	};
> +	acpi_status status;
>  
>  	status = alienware_wmax_command(&in_args, sizeof(in_args),
>  					WMAX_METHOD_GAME_SHIFT_STATUS,
> @@ -1078,11 +1075,11 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
>  
>  static int create_thermal_profile(struct platform_device *platform_device)
>  {
> -	u32 out_data;
> +	enum platform_profile_option profile;
> +	enum wmax_thermal_mode mode;
>  	u8 sys_desc[4];
>  	u32 first_mode;
> -	enum wmax_thermal_mode mode;
> -	enum platform_profile_option profile;
> +	u32 out_data;
>  	int ret;
>  
>  	ret = wmax_thermal_information(WMAX_OPERATION_SYS_DESCRIPTION,
> 

-- 
 i.

