Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD18240611;
	Fri, 27 Feb 2026 10:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772189872; cv=none; b=CsxRwukuLhEYjyjzUraIbRy54b+7jSgrP7nCxto7if+WpQl2s9rD2aAOa4lIH7r+fiURlOaGLZc2GvBZtVtW/+TEpuiCOCz+ylqsTo1J6twwnYcgm2A40w+rM9twXDDZ9pOuM+NRplVsBKpm9AbjPBKrs13vX1hxXXmr2U70AJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772189872; c=relaxed/simple;
	bh=xGb7ApnB8rzEQY/YorNFoffA7QaEn2thMXpc6L7PaDw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MbIGob1scBaTrbcfNo8KgLKDIBMPqVyOZdWJRMbSBd20YX3f/A3lyYL0JwLPaChEnpEdqN2ToD6nRizUck3o3UwbEqiRd3ANvnOSebfGf9KX180r02ZXRhN73s6Emikzjx4bsUmdCykPfwdYJf73KxeOA4KS+uDZHOoW4bF8LVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fp5V0M3Q; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fp5V0M3Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772189871; x=1803725871;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=xGb7ApnB8rzEQY/YorNFoffA7QaEn2thMXpc6L7PaDw=;
  b=fp5V0M3QSHmlD/rLvuvnjEzGzQ3kMp1RJYX6EQjK/zg4TMJttArnMWnC
   SOg3ppteVpbNCWBBO+3bgFiXb4QmfA8PYwKizYZu+/4Z01KFkWn8y6jOG
   oZq0mxlckUVLwXoFKQ+hhx5jbgcfs29DMOwEYnfLYUwQOUPZ0QQN8Kh4g
   ZhrcpIWGhyXU5x+W+QlRiCM9vyd5yMlonFpkHZxuuNmUDFWE1B05WT70W
   O41A4GxmXQCuRvOvL0vs+JVtNqg2osI/pPa1Q3i+TIDNMBXF4R0hxdUWm
   js+KWHNjvzAgrpxu7UnoU6ZfhRLV3ezuLsJltOV4UogoSdChQjRDrVU4x
   A==;
X-CSE-ConnectionGUID: 0BTQoLWuQ7KMj73JckXSFQ==
X-CSE-MsgGUID: Ekh7np8dSMSRg8OIyJRsBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="90673039"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="90673039"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 02:57:50 -0800
X-CSE-ConnectionGUID: y79PnbOhTqOWGfmQ6pb6+A==
X-CSE-MsgGUID: Q74YW7FgQS+ZNn8MmHqRsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="254644747"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 02:57:48 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 27 Feb 2026 12:57:44 +0200 (EET)
To: Edip Hazuri <edip@medip.dev>
cc: Hans de Goede <hansg@kernel.org>, kuba@kernel.org, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: hp-wmi: Add keyboard backlight support
In-Reply-To: <20260227063122.7184-2-edip@medip.dev>
Message-ID: <ed9a58e6-9cf3-d692-c271-b66d61c31ffa@linux.intel.com>
References: <20260227063122.7184-2-edip@medip.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 27 Feb 2026, edip@medip.dev wrote:

> From: Edip Hazuri <edip@medip.dev>
> 
> This patch adds support for changing keyboard backlight. It only
> supports Hp Victus/Omen laptops with one or four zone keyboard
> backlight. Per-key rgb isn't supported
> 
> 

One empty line is enough.

> Signed-off-by: Edip Hazuri <edip@medip.dev>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 276 +++++++++++++++++++++++++++++++
>  1 file changed, 276 insertions(+)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 304d9ac63c8a..ea74a71998dc 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -23,6 +23,8 @@
>  #include <linux/input.h>
>  #include <linux/input/sparse-keymap.h>
>  #include <linux/kernel.h>
> +#include <linux/led-class-multicolor.h>
> +#include <linux/leds.h>
>  #include <linux/limits.h>
>  #include <linux/minmax.h>
>  #include <linux/module.h>
> @@ -58,6 +60,8 @@ enum hp_ec_offsets {
>  #define HP_POWER_LIMIT_DEFAULT	 0x00
>  #define HP_POWER_LIMIT_NO_CHANGE 0xFF
>  
> +#define HP_COLOR_TABLE_PADDING 25
> +
>  #define ACPI_AC_CLASS "ac_adapter"
>  
>  #define zero_if_sup(tmp) (zero_insize_support?0:sizeof(tmp)) // use when zero insize is required
> @@ -98,6 +102,15 @@ enum hp_thermal_profile {
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
> +
>  
>  struct thermal_profile_params {
>  	u8 performance;
> @@ -290,16 +303,27 @@ enum hp_wmi_gm_commandtype {
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
> @@ -373,6 +397,16 @@ static const struct key_entry hp_wmi_keymap[] = {
>  	{ KE_END, 0 }
>  };
>  
> +struct hp_kbd_led_priv {
> +	int zone;               /* Zone index (0-3) */
> +	enum led_brightness last_brightness;  /* Brightness before turning off */
> +};
> +
> +struct hp_mc_leds {
> +	struct led_classdev_mc devices[4];
> +	struct hp_kbd_led_priv priv[4];
> +};
> +
>  /*
>   * Mutex for the active_platform_profile variable,
>   * see omen_powersource_event.
> @@ -382,6 +416,7 @@ static DEFINE_MUTEX(active_platform_profile_lock);
>  static struct input_dev *hp_wmi_input_dev;
>  static struct input_dev *camera_shutter_input_dev;
>  static struct platform_device *hp_wmi_platform_dev;
> +static struct hp_mc_leds hp_multicolor_leds;
>  static struct device *platform_profile_device;
>  static struct notifier_block platform_power_source_nb;
>  static enum platform_profile_option active_platform_profile;
> @@ -1068,6 +1103,8 @@ static struct attribute *hp_wmi_attrs[] = {
>  };
>  ATTRIBUTE_GROUPS(hp_wmi);
>  
> +static void hp_kbd_brightness_set_by_hwd(u32 event_data);
> +
>  static void hp_wmi_notify(union acpi_object *obj, void *context)
>  {
>  	u32 event_id, event_data;
> @@ -1168,6 +1205,7 @@ static void hp_wmi_notify(union acpi_object *obj, void *context)
>  	case HPWMI_PROXIMITY_SENSOR:
>  		break;
>  	case HPWMI_BACKLIT_KB_BRIGHTNESS:
> +		hp_kbd_brightness_set_by_hwd(event_data);
>  		break;
>  	case HPWMI_PEAKSHIFT_PERIOD:
>  		break;
> @@ -1430,6 +1468,240 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
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
> +static int hp_kbd_backlight_set_rgb_color(int zone, int red, int green, int blue)
> +{
> +	int ret;
> +	u8 color_table[128];

Reverse xmas-tree order.

> +
> +	/*
> +	 * Get the current color table and then change only the relevant parts.
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
> +	ret = hp_wmi_perform_query(HPWMI_BACKLIGHT_COLOR_SET_QUERY, HPWMI_BACKLIGHT,
> +				   color_table, sizeof(color_table), sizeof(color_table));
> +	if (ret)
> +		return ret < 0 ? ret : -EINVAL;

Split this into two if + return statements please.

> +
> +	return 0;
> +}
> +
> +static bool hp_kbd_backlight_is_on(void)
> +{
> +	u8 data;
> +	int ret;
> +
> +	ret = hp_wmi_perform_query(HPWMI_BACKLIGHT_BRIGHTNESS_GET_QUERY, HPWMI_BACKLIGHT, &data,
> +				sizeof(data), sizeof(data));
> +
> +	if (ret)

Don't leave empty lines between call and it's error handling.

> +		return false;
> +
> +	return data == HPWMI_BACKLIGHT_SET_ON_QUERY;
> +}
> +
> +static int hp_kbd_set_brightness(struct led_classdev *led_cdev,
> +					enum led_brightness brightness)
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
> +		ret = hp_wmi_perform_query(HPWMI_BACKLIGHT_BRIGHTNESS_SET_QUERY,
> +					   HPWMI_BACKLIGHT, &data,
> +					   sizeof(data), sizeof(data));
> +		if (ret)
> +			return ret;
> +
> +		/*
> +		 * Turning the backlight on via WMI turns all zones,
> +		 * so we need to restore the other zones' off state.
> +		 */
> +		for (int i = 0; i < ARRAY_SIZE(hp_multicolor_leds.devices); i++) {

Include for ARRAY_SIZE()

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
> +	struct hp_kbd_led_priv *priv;
> +	struct led_classdev *led_cdev;

Reverse xmas-tree order.

> +	u8 brightness;
> +
> +	for (int zone = 0; zone < ARRAY_SIZE(hp_multicolor_leds.devices); zone++) {
> +		if (!hp_multicolor_leds.devices[zone].led_cdev.name)
> +			continue;
> +
> +		led_cdev = &hp_multicolor_leds.devices[zone].led_cdev;
> +

Remove empty line.

> +		if (!led_cdev->dev)
> +			continue;
> +
> +		priv = hp_led_get_priv(led_cdev);
> +
> +		if (event_data == 0x2) {
> +			brightness = priv->last_brightness ?
> +				     priv->last_brightness : LED_FULL;

This is equal to:

priv->last_brightness ? : LED_FULL;

> +		} else if (event_data == 0x0) {
> +			priv->last_brightness = led_cdev->brightness;
> +			brightness = LED_OFF;
> +		} else {
> +			dev_warn(dev,
> +				 "Unknown keyboard backlight event - 0x%x\n",
> +				 event_data);

Just put this to two lines.

> +			return;
> +		}
> +
> +		led_cdev->brightness = brightness;
> +		led_classdev_notify_brightness_hw_changed(led_cdev, brightness);
> +	}
> +}
> +
> +static int __init hp_mc_leds_register(int num_zones)
> +{
> +	u8 color_table[128];
> +	int ret;
> +
> +	ret = hp_wmi_perform_query(HPWMI_BACKLIGHT_COLOR_GET_QUERY, HPWMI_BACKLIGHT,
> +		  color_table, zero_if_sup(color_table),
> +		  sizeof(color_table));

Align these to (.

> +

Remove empty line.

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
> +							"hp::kbd_backlight");
> +		else if (num_zones > 1)
> +			led_cdev->name = devm_kasprintf(dev, GFP_KERNEL,
> +							"hp::kbd_backlight_zone%d",
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
> +		mc_subled_info = devm_kzalloc(dev,
> +					      sizeof(*mc_subled_info) * 3,

This fits to one line.

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
> +							    multicolor_led_dev);

Just put this on one line, it's shorter than the dev_err() below.

> +		if (ret) {
> +			dev_err(dev, "Failed to register multicolor RGB backlight\n");
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
> +	int ret = hp_wmi_perform_query(HPWMI_GET_KEYBOARD_TYPE_QUERY, HPWMI_GM, &keyboard_type,
> +			 sizeof(keyboard_type), sizeof(keyboard_type));
> +	if (ret)
> +		return ret;

Leave empty line in between variable declarations and code, you need to 
assign the return value separately to ret.

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
>  static int platform_profile_omen_get_ec(enum platform_profile_option *profile)
>  {
>  	int tp;
> @@ -2230,6 +2502,10 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
>  
>  	thermal_profile_setup(device);
>  
> +	err = hp_kbd_rgb_setup();
> +	if (err)
> +		dev_err(&device->dev, "Failed to initialize keyboard RGB\n");
> +
>  	return 0;
>  }
>  
> 

-- 
 i.

