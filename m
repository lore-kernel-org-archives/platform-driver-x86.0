Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D3236728E;
	Mon,  8 Jun 2026 11:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780918181; cv=none; b=SfRMfW5adeAmRUbLv1/8dn6ovZj5JjI8ZhsZ5qJN6ZWbW1ZnsJDUa0jqhICKOdlcH9wq+SuS4queKxXJWcEPuB8Qzd87W6PJNurxIK09ZjQAIOXfybE0YpmwN1F3zom+Fv8vVllrehD4r/e762xo9SREURBoTb84z8NqYJfygjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780918181; c=relaxed/simple;
	bh=x3ZOSrfqtXDjU4feA0hEl3fI6dz8PgtOWVtd1PdFTMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=F5DY2le8PQm8VqbjWfdpS77oaABepYq0oUBCjyGgOIKGQdZBSaBAujiP0MdMWdalHx14LM8Z+f+UYoO4XSXgCCczxeM6wjgf1kZS6BEzfcaCY/mcZWY1nGdUjnBMltCifdC/aCnn2kgSXb1BpIgtYu8rtAynHLLx26DBgqbiCEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=csFhugYK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="csFhugYK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A050D1F00893;
	Mon,  8 Jun 2026 11:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780918177;
	bh=3ygbC6m2s/GQZchwVO5EluqRXp2hgTBgZAJoFyl0jnA=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=csFhugYKykFJzTtnRjf3P0ey9PkYeL7a9JVXUGHv2Z9M8I1R7Spy85ta8Lmu6y1YT
	 jfPKHqv6E0mCWK/EAqPoVOVvgdqYPghYxhyis4cplLxKEgl0Ivr+G6UskzkDCQTg6v
	 HyARVqA7/8pTxrAm/X6L8v9zqsY79m5TPQDMmVW6+uK++fXRc1t5BG/OWWSd1mFtht
	 BbQK9hW1EMB4g/NyV++eWf69rchs54UBzH7dPnqyY6jzv2T28dksaEtFmry4owpNlh
	 vLDbPtRq5rwD7l84u7rfv61Gv9gx9pJvCKkuGu86VsdBaiLGatw3a1yjgA8eSUDEWy
	 GOmrXUbhdxyZA==
Message-ID: <91af7990-d24a-4f30-aeb2-e5110738a4ec@kernel.org>
Date: Mon, 8 Jun 2026 13:29:35 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] platform/x86: hp-wmi: Add multicolor LED support for
 HP keyboard backlight
To: =?UTF-8?B?0JrQvtC90LXQvdC60L4g0JDQvdC00YDQtdC5INCS0LjQutGC0L7RgNC+0LI=?=
 =?UTF-8?B?0LjRhw==?= <admin@aquinas.su>, ilpo.jarvinen@linux.intel.com,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <9VMMQwZjRUOGJGZr-0_YbA@aquinas.su>
 <Yum2UkOKSk-F7vHbhPXMxA@aquinas.su>
 <e1bce5de-34e8-4351-96ae-7edf4379b99b@kernel.org>
 <Jhl3t35KQoOh1UjBI9iDGA@aquinas.su>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <Jhl3t35KQoOh1UjBI9iDGA@aquinas.su>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 18-May-26 3:36 PM, Коненко Андрей Викторович wrote:
>>
>> I'm afraid the names are still wrong. Your patch results in e.g. :
>>
>> hp::kbd_backlight_zone-right
>>
>> where as per:
>>
>> https://lore.kernel.org/linux-leds/20260504145434.12746-1-johannes.goede@oss
>> .qualcomm.com/
>>
>> this should be:
>>
>> hp::kbd_zoned_backlight-right
>>
>> Regards,
>>
>> Hans
>>
> 
> I would like to sincerely apologize for the mistake in understanding the 
> documentation. I received feedback pointing out my error, corrected it 
> accordingly, but unfortunately, there was still an oversight. After being 
> notified of the second error, I have now thoroughly reviewed everything again 
> and made all necessary corrections.

No problem, thank you for the new version.

> I truly appreciate your patience and guidance throughout this process. Your 
> feedback has been extremely helpful in helping me reach the correct 
> understanding. I am committed to ensuring that all future submissions are 
> fully compliant with the documentation requirements.
> 
> Thank you for your time and understanding.
> 
> ---
> 
> From: Edip Hazuri <edip@medip.dev>
> 
> Add support for the HP keyboard RGB backlight found on HP OMEN and
> HP Victus laptops. These keyboards expose per-zone RGB control through
> WMI commands.
> 
> Register multicolor LED class devices for each keyboard zone (up to 4
> zones, depending on the keyboard type). Each zone exposes individual
> red, green, and blue channels via the multicolor LED subsystem.
> 
> Also hardware-initiated brightness changes (e.g. via the keyboard
> backlight hotkey, mostly fn+f4) are reported.
> 
> The color data is stored in a 128-byte color table managed by the
> firmware, with RGB values starting at offset 25, packed sequentially
> per zone.
> 
> Signed-off-by: Konenko Andrey Viktorovich <admin@aquinas.su>
> 
> ---
> 
> Changes since v7:
>  - The LED class device names changed to be consistent with the documentation.

Thanks, the naming now looks good to me:

Acked-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans




> 
> Changes since v6:
>  - The LED class device names have been made more consistent with the 
> documentation, in accordance with patch https://lore.kernel.org/linux-leds/
> 20260504145434.12746-1-johannes.goede@oss.qualcomm.com/
> underscores have been replaced with dashes where indicated.
> 
> Changes since v5:
>  - LED class device names changed from a number to using a descriptive name 
> for each zone.
> 
> v4: https://lore.kernel.org/all/20260303084022.7223-3-edip@medip.dev/
> 
> Changes since v4:
>  - Fix circular dependencies
> 
> Changes since v3:
>  - Merge the changes into a single commit
> 
> Changes since v1:
>  - Fix mentioned style errors
>  - Add Kconfig dependencies
> 
> ---
> 
>  drivers/platform/x86/hp/Kconfig  |   2 +
>  drivers/platform/x86/hp/hp-wmi.c | 284 ++++++++++++++++++++++++++++++-
>  2 files changed, 285 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/hp/Kconfig b/drivers/platform/x86/hp/Kconfig
> index dd51491b9bcd..2a1841cbec76 100644
> --- a/drivers/platform/x86/hp/Kconfig
> +++ b/drivers/platform/x86/hp/Kconfig
> @@ -45,6 +45,8 @@ config HP_WMI
>  	select INPUT_SPARSEKMAP
>  	select ACPI_PLATFORM_PROFILE
>  	select HWMON
> +	select LEDS_CLASS
> +	select LEDS_CLASS_MULTICOLOR
>  	help
>  	  Say Y here if you want to support WMI-based hotkeys on HP laptops 
> and
>  	  to read data from WMI such as docking or ambient light sensor 
> state.
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-
> wmi.c
> index d1cc6e7d176c..19da18f68337 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -14,6 +14,7 @@
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
>  #include <linux/acpi.h>
> +#include <linux/array_size.h>
>  #include <linux/cleanup.h>
>  #include <linux/compiler_attributes.h>
>  #include <linux/dmi.h>
> @@ -23,6 +24,8 @@
>  #include <linux/input.h>
>  #include <linux/input/sparse-keymap.h>
>  #include <linux/kernel.h>
> +#include <linux/led-class-multicolor.h>
> +#include <linux/leds.h>
>  #include <linux/limits.h>
>  #include <linux/minmax.h>
>  #include <linux/module.h>
> @@ -57,6 +60,7 @@ enum hp_ec_offsets {
>  
>  #define HP_FAN_SPEED_AUTOMATIC	 0x00
>  #define HP_POWER_LIMIT_DEFAULT	 0x00
> +#define HP_COLOR_TABLE_PADDING	 25
>  #define HP_POWER_LIMIT_NO_CHANGE 0xFF
>  
>  #define zero_if_sup(tmp) (zero_insize_support?0:sizeof(tmp)) // use when zero 
> insize is required
> @@ -97,6 +101,14 @@ enum hp_thermal_profile {
>  	HP_THERMAL_PROFILE_QUIET			= 0x03,
>  };
>  
> +enum hp_keyboard_type {
> +	HP_KEYBOARD_TYPE_NOBACKLIGHT                = 0x0,
> +	HP_KEYBOARD_TYPE_FOURZONE_WITH_NUMPAD       = 0x1,
> +	HP_KEYBOARD_TYPE_FOURZONE_WITHOUT_NUMPAD    = 0x2,
> +	HP_KEYBOARD_TYPE_RGB_PER_KEY                = 0x3,
> +	HP_KEYBOARD_TYPE_SINGLEZONE_WITH_NUMPAD     = 0x4,
> +	HP_KEYBOARD_TYPE_SINGLEZONE_WITHOUT_NUMPAD  = 0x5,
> +};
>  
>  struct thermal_profile_params {
>  	u8 performance;
> @@ -338,16 +350,27 @@ enum hp_wmi_gm_commandtype {
>  	HPWMI_GET_GPU_THERMAL_MODES_QUERY	= 0x21,
>  	HPWMI_SET_GPU_THERMAL_MODES_QUERY	= 0x22,
>  	HPWMI_SET_POWER_LIMITS_QUERY		= 0x29,
> +	HPWMI_GET_KEYBOARD_TYPE_QUERY		= 0x2b,
>  	HPWMI_VICTUS_S_FAN_SPEED_GET_QUERY	= 0x2D,
>  	HPWMI_VICTUS_S_FAN_SPEED_SET_QUERY	= 0x2E,
>  	HPWMI_VICTUS_S_GET_FAN_TABLE_QUERY	= 0x2F,
>  };
>  
> +enum hp_wmi_backlight_commandtype {
> +	HPWMI_BACKLIGHT_COLOR_GET_QUERY         = 0x02,
> +	HPWMI_BACKLIGHT_COLOR_SET_QUERY         = 0x03,
> +	HPWMI_BACKLIGHT_BRIGHTNESS_GET_QUERY    = 0x04,
> +	HPWMI_BACKLIGHT_BRIGHTNESS_SET_QUERY    = 0x05,
> +	HPWMI_BACKLIGHT_SET_OFF_QUERY           = 0x64,
> +	HPWMI_BACKLIGHT_SET_ON_QUERY            = 0xE4,
> +};
> +
>  enum hp_wmi_command {
>  	HPWMI_READ	= 0x01,
>  	HPWMI_WRITE	= 0x02,
>  	HPWMI_ODM	= 0x03,
>  	HPWMI_GM	= 0x20008,
> +	HPWMI_BACKLIGHT = 0x20009,
>  };
>  
>  enum hp_wmi_hardware_mask {
> @@ -355,6 +378,24 @@ enum hp_wmi_hardware_mask {
>  	HPWMI_TABLET_MASK	= 0x04,
>  };
>  
> +struct hp_kbd_led_priv {
> +	int zone;               /* Zone index (0-3) */
> +	enum led_brightness last_brightness;  /* Brightness before turning 
> off */
> +};
> +
> +struct hp_mc_leds {
> +	struct led_classdev_mc devices[4];
> +	struct hp_kbd_led_priv priv[4];
> +};
> +
> +/* zone naming for 4-zone keyboards (HP Omen) */
> +static const char *const hp_zone_names_4[] = {
> +	[0] = "zoned_backlight-right",
> +	[1] = "zoned_backlight-center",
> +	[2] = "zoned_backlight-left",
> +	[3] = "zoned_backlight-wasd",
> +};
> +
>  struct bios_return {
>  	u32 sigpass;
>  	u32 return_code;
> @@ -435,6 +476,7 @@ static DEFINE_MUTEX(active_platform_profile_lock);
>  static struct input_dev *hp_wmi_input_dev;
>  static struct input_dev *camera_shutter_input_dev;
>  static struct platform_device *hp_wmi_platform_dev;
> +static struct hp_mc_leds hp_multicolor_leds;
>  static struct device *platform_profile_device;
>  static struct notifier_block platform_power_source_nb;
>  static enum platform_profile_option active_platform_profile;
> @@ -1122,6 +1164,8 @@ static struct attribute *hp_wmi_attrs[] = {
>  };
>  ATTRIBUTE_GROUPS(hp_wmi);
>  
> +static void hp_kbd_brightness_set_by_hwd(u32 event_data);
> +
>  static void hp_wmi_notify(union acpi_object *obj, void *context)
>  {
>  	u32 event_id, event_data;
> @@ -1222,6 +1266,7 @@ static void hp_wmi_notify(union acpi_object *obj, void 
> *context)
>  	case HPWMI_PROXIMITY_SENSOR:
>  		break;
>  	case HPWMI_BACKLIT_KB_BRIGHTNESS:
> +		hp_kbd_brightness_set_by_hwd(event_data);
>  		break;
>  	case HPWMI_PEAKSHIFT_PERIOD:
>  		break;
> @@ -1484,6 +1529,241 @@ static int __init hp_wmi_rfkill2_setup(struct 
> platform_device *device)
>  	return err;
>  }
>  
> +static struct hp_kbd_led_priv *hp_led_get_priv(struct led_classdev *led_cdev)
> +{
> +	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(led_cdev);
> +	int zone = mc_cdev - hp_multicolor_leds.devices;
> +
> +	return &hp_multicolor_leds.priv[zone];
> +}
> +
> +static int hp_kbd_backlight_set_rgb_color(int zone, int red, int green, int 
> blue)
> +{
> +	u8 color_table[128];
> +	int ret;
> +
> +	/*
> +	 * Get the current color table and then change only the relevant 
> parts.
> +	 */
> +	ret = hp_wmi_perform_query(HPWMI_BACKLIGHT_COLOR_GET_QUERY,
> +				   HPWMI_BACKLIGHT, color_table,
> +				   zero_if_sup(color_table),
> +				   sizeof(color_table));
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * RGB color data starts at offset 25 +3 per zone (r g b)
> +	 * e.g. if zone 1 starts in 25 zone 2 starts in 28
> +	 */
> +	color_table[HP_COLOR_TABLE_PADDING + zone * 3]     = red;
> +	color_table[HP_COLOR_TABLE_PADDING + zone * 3 + 1] = green;
> +	color_table[HP_COLOR_TABLE_PADDING + zone * 3 + 2] = blue;
> +
> +	ret = hp_wmi_perform_query(HPWMI_BACKLIGHT_COLOR_SET_QUERY, 
> HPWMI_BACKLIGHT,
> +				   color_table, sizeof(color_table), 
> sizeof(color_table));
> +	if (ret < 0)
> +		return ret;
> +	if (ret)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static bool hp_kbd_backlight_is_on(void)
> +{
> +	u8 data;
> +	int ret;
> +
> +	ret = hp_wmi_perform_query(HPWMI_BACKLIGHT_BRIGHTNESS_GET_QUERY, 
> HPWMI_BACKLIGHT, &data,
> +				sizeof(data), sizeof(data));
> +	if (ret)
> +		return false;
> +
> +	return data == HPWMI_BACKLIGHT_SET_ON_QUERY;
> +}
> +
> +static int hp_kbd_set_brightness(struct led_classdev *led_cdev,
> +					enum led_brightness 
> brightness)
> +{
> +	struct hp_kbd_led_priv *priv = hp_led_get_priv(led_cdev);
> +	struct led_classdev_mc *mc_cdev;
> +	struct led_classdev_mc *device;
> +	int red, green, blue;
> +	int ret;
> +
> +	if (!hp_kbd_backlight_is_on()) {
> +		u8 data = HPWMI_BACKLIGHT_SET_ON_QUERY;
> +
> +		ret = 
> hp_wmi_perform_query(HPWMI_BACKLIGHT_BRIGHTNESS_SET_QUERY,
> +					   HPWMI_BACKLIGHT, &data,
> +					   sizeof(data), 
> sizeof(data));
> +		if (ret)
> +			return ret;
> +
> +		/*
> +		 * Turning the backlight on via WMI turns all zones,
> +		 * so we need to restore the other zones' off state.
> +		 */
> +		for (int i = 0; i < 
> ARRAY_SIZE(hp_multicolor_leds.devices); i++) {
> +			if (i == priv->zone)
> +				continue;
> +
> +			device = &hp_multicolor_leds.devices[i];
> +			if (!device->led_cdev.name)
> +				continue;
> +			hp_kbd_backlight_set_rgb_color(i,
> +				device->subled_info[0].brightness,
> +				device->subled_info[1].brightness,
> +				device->subled_info[2].brightness);
> +		}
> +	}
> +
> +	led_cdev->brightness = brightness;
> +
> +	mc_cdev = lcdev_to_mccdev(led_cdev);
> +	led_mc_calc_color_components(mc_cdev, brightness);
> +
> +	red = mc_cdev->subled_info[0].brightness;
> +	green = mc_cdev->subled_info[1].brightness;
> +	blue = mc_cdev->subled_info[2].brightness;
> +
> +	return hp_kbd_backlight_set_rgb_color(priv->zone, red, green, blue);
> +}
> +
> +static void hp_kbd_brightness_set_by_hwd(u32 event_data)
> +{
> +	struct device *dev = &hp_wmi_platform_dev->dev;
> +	struct led_classdev *led_cdev;
> +	struct hp_kbd_led_priv *priv;
> +	u8 brightness;
> +
> +	for (int zone = 0; zone < ARRAY_SIZE(hp_multicolor_leds.devices); 
> zone++) {
> +		if (!hp_multicolor_leds.devices[zone].led_cdev.name)
> +			continue;
> +
> +		led_cdev = &hp_multicolor_leds.devices[zone].led_cdev;
> +		if (!led_cdev->dev)
> +			continue;
> +
> +		priv = hp_led_get_priv(led_cdev);
> +
> +		if (event_data == 0x2) {
> +			brightness = priv->last_brightness ? : LED_FULL;
> +		} else if (event_data == 0x0) {
> +			priv->last_brightness = led_cdev->brightness;
> +			brightness = LED_OFF;
> +		} else {
> +			dev_warn(dev, "Unknown keyboard backlight event 
> - 0x%x\n",
> +				 event_data);
> +			return;
> +		}
> +
> +		led_cdev->brightness = brightness;
> +		led_classdev_notify_brightness_hw_changed(led_cdev, 
> brightness);
> +	}
> +}
> +
> +static int __init hp_mc_leds_register(int num_zones)
> +{
> +	u8 color_table[128];
> +	int ret;
> +
> +	ret = hp_wmi_perform_query(HPWMI_BACKLIGHT_COLOR_GET_QUERY, 
> HPWMI_BACKLIGHT,
> +				   color_table, 
> zero_if_sup(color_table),
> +				   sizeof(color_table));
> +	if (ret)
> +		return ret;
> +
> +	for (int zone = 0; zone < num_zones; zone++) {
> +		struct led_classdev_mc *multicolor_led_dev;
> +		struct led_classdev *led_cdev;
> +		struct mc_subled *mc_subled_info;
> +		struct hp_kbd_led_priv *priv;
> +		struct device *dev;
> +
> +		dev = &hp_wmi_platform_dev->dev;
> +		multicolor_led_dev = &hp_multicolor_leds.devices[zone];
> +		led_cdev = &multicolor_led_dev->led_cdev;
> +		priv = &hp_multicolor_leds.priv[zone];
> +
> +		if (num_zones == 1)
> +			led_cdev->name = devm_kasprintf(dev, GFP_KERNEL,
> +							
> "hp::kbd_backlight");
> +		else if (num_zones == 4 && zone < 
> ARRAY_SIZE(hp_zone_names_4))
> +			led_cdev->name = devm_kasprintf(dev, GFP_KERNEL,
> +							
> "hp::kbd_%s",
> +							
> hp_zone_names_4[zone]);
> +		else if (num_zones > 1)
> +			led_cdev->name = devm_kasprintf(dev, GFP_KERNEL,
> +							
> "hp::kbd_zoned_backlight-%d",
> +							zone);
> +
> +		if (!led_cdev->name)
> +			return -ENOMEM;
> +		led_cdev->brightness = hp_kbd_backlight_is_on() ?
> +				       LED_FULL : LED_OFF;
> +		led_cdev->max_brightness = LED_FULL;
> +		led_cdev->brightness_set_blocking = hp_kbd_set_brightness;
> +		led_cdev->flags = LED_CORE_SUSPENDRESUME |
> +				  LED_RETAIN_AT_SHUTDOWN |
> +				  LED_BRIGHT_HW_CHANGED;
> +
> +		mc_subled_info = devm_kzalloc(dev, sizeof(*mc_subled_info) 
> * 3,
> +					      GFP_KERNEL);
> +		if (!mc_subled_info)
> +			return -ENOMEM;
> +
> +		mc_subled_info[0].color_index = LED_COLOR_ID_RED;
> +		mc_subled_info[1].color_index = LED_COLOR_ID_GREEN;
> +		mc_subled_info[2].color_index = LED_COLOR_ID_BLUE;
> +
> +		for (int i = 0; i < 3; i++) {
> +			int off = HP_COLOR_TABLE_PADDING + zone * 3 + i;
> +
> +			mc_subled_info[i].channel = zone * 3 + i;
> +			mc_subled_info[i].intensity = color_table[off];
> +			mc_subled_info[i].brightness = LED_FULL;
> +		}
> +
> +		multicolor_led_dev->subled_info = mc_subled_info;
> +		multicolor_led_dev->num_colors = 3;
> +
> +		ret = devm_led_classdev_multicolor_register(dev, 
> multicolor_led_dev);
> +		if (ret) {
> +			dev_err(dev, "Failed to register multicolor RGB 
> backlight\n");
> +			return ret;
> +		}
> +
> +		/* Initialize private data */
> +		priv->zone = zone;
> +		priv->last_brightness = LED_FULL;
> +	}
> +	return 0;
> +}
> +
> +static int __init hp_kbd_rgb_setup(void)
> +{
> +	u8 keyboard_type;
> +	int ret;
> +
> +	ret = hp_wmi_perform_query(HPWMI_GET_KEYBOARD_TYPE_QUERY, HPWMI_GM, 
> &keyboard_type,
> +				   sizeof(keyboard_type), 
> sizeof(keyboard_type));
> +	if (ret)
> +		return ret;
> +
> +	switch (keyboard_type) {
> +	case HP_KEYBOARD_TYPE_FOURZONE_WITH_NUMPAD:
> +	case HP_KEYBOARD_TYPE_FOURZONE_WITHOUT_NUMPAD:
> +		return hp_mc_leds_register(4);
> +	case HP_KEYBOARD_TYPE_SINGLEZONE_WITH_NUMPAD:
> +	case HP_KEYBOARD_TYPE_SINGLEZONE_WITHOUT_NUMPAD:
> +		return hp_mc_leds_register(1);
> +	default:
> +		return 0;
> +	}
> +}
> +
>  static int platform_profile_omen_get_ec(enum platform_profile_option 
> *profile)
>  {
>  	int tp;
> @@ -2285,7 +2565,9 @@ static int __init hp_wmi_bios_setup(struct 
> platform_device *device)
>  		return err;
>  
>  	thermal_profile_setup(device);
> -
> +	err = hp_kbd_rgb_setup();
> +	if (err)
> +		dev_err(&device->dev, "Failed to initialize keyboard 
> RGB\n");
>  	return 0;
>  }
>  

