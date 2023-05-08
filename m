Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D066C77B75
	for <platform-driver-x86@archiver.kernel.org>; Mon,  8 May 2023 07:38:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233252AbjEHHit (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 8 May 2023 03:38:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233284AbjEHHih (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 8 May 2023 03:38:37 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2631D4EF4
        for <platform-driver-x86@vger.kernel.org>; Mon,  8 May 2023 00:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683531513; x=1715067513;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=UEEJxPzTFoXO2SoR465XzjjXsYX2Ruu1m17iYRMfTNE=;
  b=ABj05t68fhL+DQWT3shUpJU6WHEdj4qN3X3vQyev0xgb5GJvIx1aBgZw
   Nk8uItqfzygYLws2684Z1PzUugXOtICOPlCp62ChYqOjmGQX1MPt1BAyd
   3Pw6KdCATkb5WXr/0GYT8WTj5vpbNlDSmCUxUSpj+izd9TkgrtpVpBYn1
   mQ32LT7OF18lBb3b0kBy9yYOO/oIhXN9Gb7l/sHf950coWw9nn0E+Bve1
   yd0IIWfvQimHGAyRqqfo29YFVfTmI+slRtdLNQ6iPcJi6xllNWhY1HZ8n
   dGGsWR86p+9C/XaIEHlilm1+lzCFEie2/1VC2vFgeZyRfppveL7RR7Ylb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="412838498"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="412838498"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 00:38:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="810157077"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="810157077"
Received: from cciobanu-mobl1.ger.corp.intel.com ([10.249.37.159])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 00:38:17 -0700
Date:   Mon, 8 May 2023 10:38:12 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/2] platform/x86: x86-android-tablets: Add support for
 more then 1 gpio_key
In-Reply-To: <20230505205901.42649-1-hdegoede@redhat.com>
Message-ID: <aa70c911-d4b4-bdd8-66fa-9bcd4e8edcb7@linux.intel.com>
References: <20230505205901.42649-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-2054652999-1683531321=:1790"
Content-ID: <92b0d49f-64c9-21e-39ea-20d9edde55@linux.intel.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2054652999-1683531321=:1790
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <d880d226-fae-dd25-4856-6cfd6c272bfe@linux.intel.com>

On Fri, 5 May 2023, Hans de Goede wrote:

> Modify the gpio_keys support in x86_android_tablet_init() for
> tablets which have more then 1 key/button which needs to be handled
> by the gpio_keys driver.
> 
> This requires copying over the struct gpio_keys_button from
> the x86_gpio_button struct array to a new gpio_keys_button struct array,
> as an added benefit this allows marking the per model x86_gpio_button
> arrays __initconst so that they all can be freed after module init().
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../platform/x86/x86-android-tablets/asus.c   |  4 ++-
>  .../platform/x86/x86-android-tablets/core.c   | 33 ++++++++++++-------
>  .../platform/x86/x86-android-tablets/lenovo.c |  6 ++--
>  .../platform/x86/x86-android-tablets/other.c  |  6 ++--
>  .../x86-android-tablets/x86-android-tablets.h |  3 +-
>  5 files changed, 35 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets/asus.c b/drivers/platform/x86/x86-android-tablets/asus.c
> index 2aca91678219..f9c4083be86d 100644
> --- a/drivers/platform/x86/x86-android-tablets/asus.c
> +++ b/drivers/platform/x86/x86-android-tablets/asus.c
> @@ -24,7 +24,7 @@ static struct gpiod_lookup_table int3496_gpo2_pin22_gpios = {
>  	},
>  };
>  
> -static struct x86_gpio_button asus_me176c_tf103c_lid = {
> +static const struct x86_gpio_button asus_me176c_tf103c_lid __initconst = {
>  	.button = {
>  		.code = SW_LID,
>  		.active_low = true,
> @@ -175,6 +175,7 @@ const struct x86_dev_info asus_me176c_info __initconst = {
>  	.serdev_info = asus_me176c_serdevs,
>  	.serdev_count = ARRAY_SIZE(asus_me176c_serdevs),
>  	.gpio_button = &asus_me176c_tf103c_lid,
> +	.gpio_button_count = 1,
>  	.gpiod_lookup_tables = asus_me176c_gpios,
>  	.bat_swnode = &generic_lipo_hv_4v35_battery_node,
>  	.modules = bq24190_modules,
> @@ -317,6 +318,7 @@ const struct x86_dev_info asus_tf103c_info __initconst = {
>  	.pdev_info = int3496_pdevs,
>  	.pdev_count = 1,
>  	.gpio_button = &asus_me176c_tf103c_lid,
> +	.gpio_button_count = 1,
>  	.gpiod_lookup_tables = asus_tf103c_gpios,
>  	.bat_swnode = &asus_tf103c_battery_node,
>  	.modules = bq24190_modules,
> diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
> index 245167674aa2..0c7142f4eccc 100644
> --- a/drivers/platform/x86/x86-android-tablets/core.c
> +++ b/drivers/platform/x86/x86-android-tablets/core.c
> @@ -124,6 +124,7 @@ static int serdev_count;
>  static struct i2c_client **i2c_clients;
>  static struct platform_device **pdevs;
>  static struct serdev_device **serdevs;
> +static struct gpio_keys_button *buttons;
>  static struct gpiod_lookup_table * const *gpiod_lookup_tables;
>  static const struct software_node *bat_swnode;
>  static void (*exit_handler)(void);
> @@ -238,6 +239,7 @@ static void x86_android_tablet_cleanup(void)
>  		platform_device_unregister(pdevs[i]);
>  
>  	kfree(pdevs);
> +	kfree(buttons);
>  
>  	for (i = 0; i < i2c_client_count; i++)
>  		i2c_unregister_device(i2c_clients[i]);
> @@ -353,22 +355,31 @@ static __init int x86_android_tablet_init(void)
>  		}
>  	}
>  
> -	if (dev_info->gpio_button) {
> -		struct gpio_keys_platform_data pdata = {
> -			.buttons = &dev_info->gpio_button->button,
> -			.nbuttons = 1,
> -		};
> +	if (dev_info->gpio_button_count) {
> +		struct gpio_keys_platform_data pdata = { };
>  		struct gpio_desc *gpiod;
>  
> -		/* Get GPIO for the gpio-button */
> -		ret = x86_android_tablet_get_gpiod(dev_info->gpio_button->chip,
> -						   dev_info->gpio_button->pin, &gpiod);
> -		if (ret < 0) {
> +		buttons = kcalloc(dev_info->gpio_button_count, sizeof(*buttons), GFP_KERNEL);
> +		if (!buttons) {
>  			x86_android_tablet_cleanup();
> -			return ret;
> +			return -ENOMEM;
> +		}
> +
> +		for (i = 0; i < dev_info->gpio_button_count; i++) {
> +			buttons[i] = dev_info->gpio_button[i].button;
> +			/* Get GPIO for the gpio-button */
> +			ret = x86_android_tablet_get_gpiod(dev_info->gpio_button[i].chip,
> +							   dev_info->gpio_button[i].pin, &gpiod);

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

With the note that the comment seems to just spell out what the code does 
so it feels useless.

-- 
 i.

> +			if (ret < 0) {
> +				x86_android_tablet_cleanup();
> +				return ret;
> +			}
> +
> +			buttons[i].gpio = desc_to_gpio(gpiod);
>  		}
>  
> -		dev_info->gpio_button->button.gpio = desc_to_gpio(gpiod);
> +		pdata.buttons = buttons;
> +		pdata.nbuttons = dev_info->gpio_button_count;
>  
>  		pdevs[pdev_count] = platform_device_register_data(NULL, "gpio-keys",
>  								  PLATFORM_DEVID_AUTO,
> diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
> index 50031e902a2c..26a4ef670ad7 100644
> --- a/drivers/platform/x86/x86-android-tablets/lenovo.c
> +++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
> @@ -160,7 +160,7 @@ static const struct x86_serdev_info lenovo_yb1_x90_serdevs[] __initconst = {
>  	},
>  };
>  
> -static struct x86_gpio_button lenovo_yb1_x90_lid = {
> +static const struct x86_gpio_button lenovo_yb1_x90_lid __initconst = {
>  	.button = {
>  		.code = SW_LID,
>  		.active_low = true,
> @@ -232,6 +232,7 @@ const struct x86_dev_info lenovo_yogabook_x90_info __initconst = {
>  	.serdev_info = lenovo_yb1_x90_serdevs,
>  	.serdev_count = ARRAY_SIZE(lenovo_yb1_x90_serdevs),
>  	.gpio_button = &lenovo_yb1_x90_lid,
> +	.gpio_button_count = 1,
>  	.gpiod_lookup_tables = lenovo_yb1_x90_gpios,
>  	.init = lenovo_yb1_x90_init,
>  };
> @@ -268,7 +269,7 @@ static const struct software_node lenovo_yoga_tab2_830_1050_bq24190_node = {
>  	.properties = lenovo_yoga_tab2_830_1050_bq24190_props,
>  };
>  
> -static struct x86_gpio_button lenovo_yoga_tab2_830_1050_lid = {
> +static const struct x86_gpio_button lenovo_yoga_tab2_830_1050_lid __initconst = {
>  	.button = {
>  		.code = SW_LID,
>  		.active_low = true,
> @@ -394,6 +395,7 @@ const struct x86_dev_info lenovo_yoga_tab2_830_1050_info __initconst = {
>  	.pdev_info = int3496_pdevs,
>  	.pdev_count = 1,
>  	.gpio_button = &lenovo_yoga_tab2_830_1050_lid,
> +	.gpio_button_count = 1,
>  	.gpiod_lookup_tables = lenovo_yoga_tab2_830_1050_gpios,
>  	.bat_swnode = &generic_lipo_hv_4v35_battery_node,
>  	.modules = bq24190_modules,
> diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
> index 3754d2453cdb..4d54c89e6ca2 100644
> --- a/drivers/platform/x86/x86-android-tablets/other.c
> +++ b/drivers/platform/x86/x86-android-tablets/other.c
> @@ -94,7 +94,7 @@ const struct x86_dev_info acer_b1_750_info __initconst = {
>   * which is not described in the ACPI tables in anyway.
>   * Use the x86-android-tablets infra to create a gpio-button device for this.
>   */
> -static struct x86_gpio_button advantech_mica_071_button = {
> +static const struct x86_gpio_button advantech_mica_071_button __initconst = {
>  	.button = {
>  		.code = KEY_PROG1,
>  		.active_low = true,
> @@ -109,6 +109,7 @@ static struct x86_gpio_button advantech_mica_071_button = {
>  
>  const struct x86_dev_info advantech_mica_071_info __initconst = {
>  	.gpio_button = &advantech_mica_071_button,
> +	.gpio_button_count = 1,
>  };
>  
>  /*
> @@ -449,7 +450,7 @@ const struct x86_dev_info nextbook_ares8a_info __initconst = {
>   * This button has a WMI interface, but that is broken. Instead of trying to
>   * use the broken WMI interface, instantiate a gpio_keys device for this.
>   */
> -static struct x86_gpio_button peaq_c1010_button = {
> +static const struct x86_gpio_button peaq_c1010_button __initconst = {
>  	.button = {
>  		.code = KEY_SOUND,
>  		.active_low = true,
> @@ -464,6 +465,7 @@ static struct x86_gpio_button peaq_c1010_button = {
>  
>  const struct x86_dev_info peaq_c1010_info __initconst = {
>  	.gpio_button = &peaq_c1010_button,
> +	.gpio_button_count = 1,
>  	/*
>  	 * Move the ACPI event handler used by the broken WMI interface out of
>  	 * the way. This is the only event handler on INT33FC:00.
> diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
> index 8e9f7238015c..8f04a052eada 100644
> --- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
> +++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
> @@ -73,10 +73,11 @@ struct x86_dev_info {
>  	const struct x86_i2c_client_info *i2c_client_info;
>  	const struct platform_device_info *pdev_info;
>  	const struct x86_serdev_info *serdev_info;
> -	struct x86_gpio_button *gpio_button;
> +	const struct x86_gpio_button *gpio_button;
>  	int i2c_client_count;
>  	int pdev_count;
>  	int serdev_count;
> +	int gpio_button_count;
>  	int (*init)(void);
>  	void (*exit)(void);
>  };
> 
--8323329-2054652999-1683531321=:1790--
