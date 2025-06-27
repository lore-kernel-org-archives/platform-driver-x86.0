Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD6D3C01
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Jun 2025 08:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751012140; cv=none; b=VgzYONB4lUtAGnyvtD613AuW48z7romfoSh0X/+JsbAzLfeaQumdDx23V/qlxTVbC7cBlMMl8keEihH/Mf0QytJG3/CwncY7YEVpy9iHJZ+gyJysvn9em8LCSbO/aa0PDi2cM8PCGHJH6BWzCWi64Ul7ziZ4rSZL7PDje6UgeMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751012140; c=relaxed/simple;
	bh=VvmVSJB3peSGWcJprzwfKibit3VBOXLTZqVgGcO4bnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mQVdHQqt5IW/oVtastOdNGSKk7Dq8bsy7bxJqDjTibj/g0bYfweoKN9Hm1ak7di3+2m4vMYz0nCKm50DVfPpglBGmqfBSK1O4lGWNICtTMMyMdWOHF2agpSrUGlFB9I58qZQ2WP5Ayo0fJlOI+3XI/JO9u05MI1D3eyIRQplBjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jlSNCzYZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jlSNCzYZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AA3DC4CEE3;
	Fri, 27 Jun 2025 08:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751012137;
	bh=VvmVSJB3peSGWcJprzwfKibit3VBOXLTZqVgGcO4bnU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jlSNCzYZV2noLk7DnXO+yjy3GTRbSsp6n3qv9heHF4p4akmE7XnMXrjb7IR4lvGAV
	 0U2GayYjKcmG+gF9HBanL/d/ZyTS24YG+cdBNjdhgcaCzZ52r7APifAlR8czLvDkam
	 3L9QRXoolyJJIiO5pKHGC+MBgnPUTLsBj8mzNVDeaJTbj2nxRrqX/NLr+umw3O6Az5
	 68JWN6wLVmZd/YcLpRJ+V1+IXtQZ2n6Wk/plAYvqgyZo1lhEcziB1onSdNOCxlj1l+
	 zYtIWoqiBGbMrQ/EQS3lYneyZgWnQ4jObvp9u6Lv/XzvRP9y4fTEGDk5injWWQOSRJ
	 c/MEGZZ6zl6kQ==
Message-ID: <96d47457-cc87-46ed-ae9f-75f2fbcff76c@kernel.org>
Date: Fri, 27 Jun 2025 10:15:35 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] platform/x86: x86-android-tablets: Add
 generic_lipo_4v2_battery info
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: platform-driver-x86@vger.kernel.org
References: <20250609104620.25896-1-hansg@kernel.org>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250609104620.25896-1-hansg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ilpo,

This series seems to have fallen through the cracks ?

If you're waiting for a review, both patches already have
a Reviewed-by from Andy given to the v1 series, this v2 just
fixes a small nitpick from Andy's v1 review in patch 2/2.

And the matching ug3105 driver changes have already landed in:
https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git/log/?h=for-next

Regards,

Hans



On 9-Jun-25 12:46 PM, Hans de Goede wrote:
> Move the asus_tf103c_battery_node to shared-psy-info.c and rename it to
> generic_lipo_4v2_battery_node.
> 
> This is a preparation patch for adding ovc-capacity-table info to
> the battery nodes.
> 
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> ---
>  .../platform/x86/x86-android-tablets/asus.c   | 21 +++----------------
>  .../x86/x86-android-tablets/shared-psy-info.c | 16 ++++++++++++++
>  .../x86/x86-android-tablets/shared-psy-info.h |  1 +
>  3 files changed, 20 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets/asus.c b/drivers/platform/x86/x86-android-tablets/asus.c
> index 7dde63b9943f..97cd14c1fd23 100644
> --- a/drivers/platform/x86/x86-android-tablets/asus.c
> +++ b/drivers/platform/x86/x86-android-tablets/asus.c
> @@ -206,24 +206,9 @@ static const struct software_node asus_tf103c_touchscreen_node = {
>  	.properties = asus_tf103c_touchscreen_props,
>  };
>  
> -static const struct property_entry asus_tf103c_battery_props[] = {
> -	PROPERTY_ENTRY_STRING("compatible", "simple-battery"),
> -	PROPERTY_ENTRY_STRING("device-chemistry", "lithium-ion-polymer"),
> -	PROPERTY_ENTRY_U32("precharge-current-microamp", 256000),
> -	PROPERTY_ENTRY_U32("charge-term-current-microamp", 128000),
> -	PROPERTY_ENTRY_U32("constant-charge-current-max-microamp", 2048000),
> -	PROPERTY_ENTRY_U32("constant-charge-voltage-max-microvolt", 4208000),
> -	PROPERTY_ENTRY_U32("factory-internal-resistance-micro-ohms", 150000),
> -	{ }
> -};
> -
> -static const struct software_node asus_tf103c_battery_node = {
> -	.properties = asus_tf103c_battery_props,
> -};
> -
>  static const struct property_entry asus_tf103c_bq24190_props[] = {
>  	PROPERTY_ENTRY_STRING_ARRAY_LEN("supplied-from", tusb1211_chg_det_psy, 1),
> -	PROPERTY_ENTRY_REF("monitored-battery", &asus_tf103c_battery_node),
> +	PROPERTY_ENTRY_REF("monitored-battery", &generic_lipo_4v2_battery_node),
>  	PROPERTY_ENTRY_U32("ti,system-minimum-microvolt", 3600000),
>  	PROPERTY_ENTRY_BOOL("omit-battery-class"),
>  	PROPERTY_ENTRY_BOOL("disable-reset"),
> @@ -236,7 +221,7 @@ static const struct software_node asus_tf103c_bq24190_node = {
>  
>  static const struct property_entry asus_tf103c_ug3105_props[] = {
>  	PROPERTY_ENTRY_STRING_ARRAY_LEN("supplied-from", bq24190_psy, 1),
> -	PROPERTY_ENTRY_REF("monitored-battery", &asus_tf103c_battery_node),
> +	PROPERTY_ENTRY_REF("monitored-battery", &generic_lipo_4v2_battery_node),
>  	PROPERTY_ENTRY_U32("upisemi,rsns-microohm", 5000),
>  	{ }
>  };
> @@ -321,6 +306,6 @@ const struct x86_dev_info asus_tf103c_info __initconst = {
>  	.gpio_button = &asus_me176c_tf103c_lid,
>  	.gpio_button_count = 1,
>  	.gpiod_lookup_tables = asus_tf103c_gpios,
> -	.bat_swnode = &asus_tf103c_battery_node,
> +	.bat_swnode = &generic_lipo_4v2_battery_node,
>  	.modules = bq24190_modules,
>  };
> diff --git a/drivers/platform/x86/x86-android-tablets/shared-psy-info.c b/drivers/platform/x86/x86-android-tablets/shared-psy-info.c
> index a46fa15acfb1..55da57477153 100644
> --- a/drivers/platform/x86/x86-android-tablets/shared-psy-info.c
> +++ b/drivers/platform/x86/x86-android-tablets/shared-psy-info.c
> @@ -39,6 +39,22 @@ const struct software_node fg_bq25890_supply_node = {
>  	.properties = fg_bq25890_supply_props,
>  };
>  
> +/* Standard LiPo (max 4.2V) settings used by most devs with a LiPo battery */
> +static const struct property_entry generic_lipo_4v2_battery_props[] = {
> +	PROPERTY_ENTRY_STRING("compatible", "simple-battery"),
> +	PROPERTY_ENTRY_STRING("device-chemistry", "lithium-ion-polymer"),
> +	PROPERTY_ENTRY_U32("precharge-current-microamp", 256000),
> +	PROPERTY_ENTRY_U32("charge-term-current-microamp", 128000),
> +	PROPERTY_ENTRY_U32("constant-charge-current-max-microamp", 2048000),
> +	PROPERTY_ENTRY_U32("constant-charge-voltage-max-microvolt", 4208000),
> +	PROPERTY_ENTRY_U32("factory-internal-resistance-micro-ohms", 150000),
> +	{ }
> +};
> +
> +const struct software_node generic_lipo_4v2_battery_node = {
> +	.properties = generic_lipo_4v2_battery_props,
> +};
> +
>  /* LiPo HighVoltage (max 4.35V) settings used by most devs with a HV battery */
>  static const struct property_entry generic_lipo_hv_4v35_battery_props[] = {
>  	PROPERTY_ENTRY_STRING("compatible", "simple-battery"),
> diff --git a/drivers/platform/x86/x86-android-tablets/shared-psy-info.h b/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
> index c2d2968cddc2..bcf9845ad275 100644
> --- a/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
> +++ b/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
> @@ -21,6 +21,7 @@ extern const char * const bq25890_psy[];
>  
>  extern const struct software_node fg_bq24190_supply_node;
>  extern const struct software_node fg_bq25890_supply_node;
> +extern const struct software_node generic_lipo_4v2_battery_node;
>  extern const struct software_node generic_lipo_hv_4v35_battery_node;
>  
>  extern struct bq24190_platform_data bq24190_pdata;

