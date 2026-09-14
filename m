Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B67481650;
	Mon, 14 Sep 2026 12:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390155; cv=none; b=c1v6ukNwm9xHp52IeLzwLbKH9Xi6lBNd1FVLzjZDBy24EwhVJlBeDq3a4II2f5yTNarlaPYsYwleCr314AutmUjIYXNCpvQVEgqZeDb9Qe2pgZfZ2sqpk9BNhT/SLQZ53T/TpQBcEw3kQIV+QQ/AFvCKY9btg9nHQP8Vsb2T2/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390155; c=relaxed/simple;
	bh=hQoaN/XEcxHjMk6M9kkkP7AQ1iSkTxtokW8kI+LbS0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hF6+AsvJL69b/N+IA4Pdo8AYaKFTHR1MGoPU2PTWDPZGj0SQX8TQnee/ZhiSMkJlQq31ufaZL11bXpEpCutrJRGbno6xgEXl2mCsw8FJ746P4t/DOW/0Ms3RfRbxtgN/2c3msz+bvGuBi9XCOHpx/KWbcGzdnkrOYeSqQt2pO00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nufsHAjS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nufsHAjS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2628E1F008A3;
	Mon, 14 Sep 2026 12:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789390152;
	bh=rBfNtx5UrArM7dTlF0yRPcwrDmsOZhRajpSMvWBWYzU=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=nufsHAjSYkwaJDH9ZX/KP2j1Jy9Du9ltBAcN0bKtjpK6o941mKpsa5ihnlEcJbpgS
	 eU9Dfnj+dbNi3j8bmUr43iL2xAg7Qi+jjw4AQ15p56wE5d8+MxpuHJVRI5XqIrzWWW
	 ShHpIlZNvkeYnPfp/yBIJR+8SnGH6jmmQLePDI+qAWdatT1xfn4wWprhyMMI5blH3d
	 qHKB1LPTcVPtvEWE8bSMmBkliTR4klBDQwxvrruRpoC66bxRMBpIbijamGR80VQQGu
	 yfC1VYkCif7Qo/C70xKaRXP1glcByRF22rWOtwttCxl2ouPI1Q+fQDB2XVBTf0QBaU
	 x4pOMcxYviiNA==
Message-ID: <869a93fa-a183-4272-a450-2b1f19338481@kernel.org>
Date: Mon, 14 Sep 2026 14:49:09 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11] platform/x86: hp-wmi: Add multicolor LED support for
 HP keyboard backlight
To: =?UTF-8?B?0JrQvtC90LXQvdC60L4g0JDQvdC00YDQtdC5INCS0LjQutGC0L7RgNC+0LI=?=
 =?UTF-8?B?0LjRhw==?= <admin@aquinas.su>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
References: <0Ja9VPr1QTSihXZrbKAgzg@aquinas.su>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <0Ja9VPr1QTSihXZrbKAgzg@aquinas.su>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 14-Sep-26 8:33 AM, Коненко Андрей Викторович wrote:
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

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> 
> ---
> Changes since v10:
>  - adapted for current linux-next (20260914)
>  - Added Named Constants:
> 	HP_BACKLIGHT_EVENT_ON — replaces magic number for backlight enable event
> 	HP_BACKLIGHT_EVENT_OFF — replaces magic number for backlight disable event
> 	HP_KBD_RGB_COLORS — replaces universally used literal 3 as RGB color/channel count
>  - Refactored hp_kbd_brightness_set_by_hwd Function - Eliminated reliance on magic numbers in event handling logic (bugfix)
>  - Event Filtering (critical bugfix):
> 	Added event type filtering in hp_wmi_notify() before calling hp_kbd_brightness_set_by_hwd()
> 	This prevents EC flooding and keyboard malfunction on some devices
> 
> Changes since v9:
>  - Fixed corrupted long lines
>  - Fixed changelog
> 
> Changes since v8:
>  - No changes (It was mistake to resend email without any fix)
> 
> Changes since v7:
>  - The LED class device names changed to be consistent with the documentation.
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
>  drivers/platform/x86/hp/Kconfig  |   2 +
>  drivers/platform/x86/hp/hp-wmi.c | 298 ++++++++++++++++++++++++++++++-
>  2 files changed, 299 insertions(+), 1 deletion(-)
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
>  	  Say Y here if you want to support WMI-based hotkeys on HP laptops and
>  	  to read data from WMI such as docking or ambient light sensor state.
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 615b4cf6fc45..cf57b6b00b01 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -28,6 +28,8 @@
>  #include <linux/kstrtox.h>
>  #include <linux/limits.h>
>  #include <linux/minmax.h>
> +#include <linux/led-class-multicolor.h>
> +#include <linux/leds.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/platform_device.h>
> @@ -61,6 +63,10 @@ enum hp_ec_offsets {
>  #define HP_FAN_SPEED_AUTOMATIC	 0x00
>  #define HP_POWER_LIMIT_DEFAULT	 0x00
>  #define HP_POWER_LIMIT_NO_CHANGE 0xFF
> +#define HP_COLOR_TABLE_PADDING  25
> +#define HP_BACKLIGHT_EVENT_ON   0x2
> +#define HP_BACKLIGHT_EVENT_OFF  0x0
> +#define HP_KBD_RGB_COLORS       3
>  #define HPWMI_MUX_MODE_UMA		BIT(0)
>  #define HPWMI_MUX_MODE_HYBRID		BIT(1)
>  #define HPWMI_MUX_MODE_DISCRETE		BIT(2)
> @@ -106,6 +112,14 @@ enum hp_thermal_profile {
>  	HP_THERMAL_PROFILE_QUIET			= 0x03,
>  };
>  
> +enum hp_keyboard_type {
> +	HP_KEYBOARD_TYPE_NOBACKLIGHT		= 0x0,
> +	HP_KEYBOARD_TYPE_FOURZONE_WITH_NUMPAD	= 0x1,
> +	HP_KEYBOARD_TYPE_FOURZONE_WITHOUT_NUMPAD	= 0x2,
> +	HP_KEYBOARD_TYPE_RGB_PER_KEY		= 0x3,
> +	HP_KEYBOARD_TYPE_SINGLEZONE_WITH_NUMPAD	= 0x4,
> +	HP_KEYBOARD_TYPE_SINGLEZONE_WITHOUT_NUMPAD	= 0x5,
> +};
>  
>  struct thermal_profile_params {
>  	u8 performance;
> @@ -433,16 +447,27 @@ enum hp_wmi_gm_commandtype {
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
> +	HPWMI_BACKLIGHT_COLOR_GET_QUERY		= 0x02,
> +	HPWMI_BACKLIGHT_COLOR_SET_QUERY		= 0x03,
> +	HPWMI_BACKLIGHT_BRIGHTNESS_GET_QUERY	= 0x04,
> +	HPWMI_BACKLIGHT_BRIGHTNESS_SET_QUERY	= 0x05,
> +	HPWMI_BACKLIGHT_SET_OFF_QUERY		= 0x64,
> +	HPWMI_BACKLIGHT_SET_ON_QUERY		= 0xE4,
> +};
> +
>  enum hp_wmi_command {
>  	HPWMI_READ	= 0x01,
>  	HPWMI_WRITE	= 0x02,
>  	HPWMI_ODM	= 0x03,
>  	HPWMI_GM	= 0x20008,
> +	HPWMI_BACKLIGHT	= 0x20009,
>  };
>  
>  enum hp_wmi_hardware_mask {
> @@ -450,6 +475,24 @@ enum hp_wmi_hardware_mask {
>  	HPWMI_TABLET_MASK	= 0x04,
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
> @@ -530,6 +573,7 @@ static DEFINE_MUTEX(active_platform_profile_lock);
>  static struct input_dev *hp_wmi_input_dev;
>  static struct input_dev *camera_shutter_input_dev;
>  static struct platform_device *hp_wmi_platform_dev;
> +static struct hp_mc_leds hp_multicolor_leds;
>  static struct device *platform_profile_device;
>  static struct notifier_block platform_power_source_nb;
>  static enum platform_profile_option active_platform_profile;
> @@ -1338,6 +1382,8 @@ static struct attribute *hp_wmi_attrs[] = {
>  };
>  ATTRIBUTE_GROUPS(hp_wmi);
>  
> +static void hp_kbd_brightness_set_by_hwd(u32 event_data);
> +
>  static void hp_wmi_notify(union acpi_object *obj, void *context)
>  {
>  	u32 event_id, event_data;
> @@ -1438,6 +1484,16 @@ static void hp_wmi_notify(union acpi_object *obj, void *context)
>  	case HPWMI_PROXIMITY_SENSOR:
>  		break;
>  	case HPWMI_BACKLIT_KB_BRIGHTNESS:
> +		/*
> +		 * Only handle actual backlight events (0x0 and 0x2).
> +		 * Other event_data values (like keyboard scan codes, e.g. 0x20 for 'd')
> +		 * are keyboard events and should be handled via sparse_keymap,
> +		 * not treated as brightness control commands.
> +		 */
> +		if (event_data != HP_BACKLIGHT_EVENT_ON &&
> +		    event_data != HP_BACKLIGHT_EVENT_OFF)
> +			break;
> +		hp_kbd_brightness_set_by_hwd(event_data);
>  		break;
>  	case HPWMI_PEAKSHIFT_PERIOD:
>  		break;
> @@ -1700,6 +1756,244 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
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
> +	u8 color_table[128];
> +	int ret;
> +
> +	/*
> +	 * Get the current color table and then change only the relevant parts.
> +	 */
> +	ret = hp_wmi_perform_query(HPWMI_BACKLIGHT_COLOR_GET_QUERY,
> +				  HPWMI_BACKLIGHT, color_table,
> +				  zero_if_sup(color_table),
> +				  sizeof(color_table));
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * RGB color data starts at offset 25 +3 per zone (r g b)
> +	 * e.g. if zone 1 starts in 25 zone 2 starts in 28
> +	 */
> +	color_table[HP_COLOR_TABLE_PADDING + zone * HP_KBD_RGB_COLORS]     = red;
> +	color_table[HP_COLOR_TABLE_PADDING + zone * HP_KBD_RGB_COLORS + 1] = green;
> +	color_table[HP_COLOR_TABLE_PADDING + zone * HP_KBD_RGB_COLORS + 2] = blue;
> +
> +	ret = hp_wmi_perform_query(HPWMI_BACKLIGHT_COLOR_SET_QUERY, HPWMI_BACKLIGHT,
> +				  color_table, sizeof(color_table), sizeof(color_table));
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
> +	ret = hp_wmi_perform_query(HPWMI_BACKLIGHT_BRIGHTNESS_GET_QUERY, HPWMI_BACKLIGHT, &data,
> +				sizeof(data), sizeof(data));
> +	if (ret)
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
> +	for (int zone = 0; zone < ARRAY_SIZE(hp_multicolor_leds.devices); zone++) {
> +		if (!hp_multicolor_leds.devices[zone].led_cdev.name)
> +			continue;
> +
> +		led_cdev = &hp_multicolor_leds.devices[zone].led_cdev;
> +		if (!led_cdev->dev)
> +			continue;
> +
> +		priv = hp_led_get_priv(led_cdev);
> +
> +		switch (event_data) {
> +		case HP_BACKLIGHT_EVENT_ON:
> +			brightness = priv->last_brightness ? : LED_FULL;
> +			break;
> +		case HP_BACKLIGHT_EVENT_OFF:
> +			priv->last_brightness = led_cdev->brightness;
> +			brightness = LED_OFF;
> +			break;
> +		default:
> +			dev_warn(dev, "Unknown keyboard backlight event - 0x%x\n",
> +				 event_data);
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
> +				  color_table, zero_if_sup(color_table),
> +				  sizeof(color_table));
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
> +				"hp::kbd_backlight");
> +		else if (num_zones == 4 && zone < ARRAY_SIZE(hp_zone_names_4))
> +			led_cdev->name = devm_kasprintf(dev, GFP_KERNEL,
> +				"hp::kbd_%s",
> +				hp_zone_names_4[zone]);
> +		else if (num_zones > 1)
> +			led_cdev->name = devm_kasprintf(dev, GFP_KERNEL,
> +				"hp::kbd_zoned_backlight-%d",
> +				zone);
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
> +		mc_subled_info = devm_kzalloc(dev, sizeof(*mc_subled_info) * HP_KBD_RGB_COLORS,
> +					      GFP_KERNEL);
> +		if (!mc_subled_info)
> +			return -ENOMEM;
> +
> +		mc_subled_info[0].color_index = LED_COLOR_ID_RED;
> +		mc_subled_info[1].color_index = LED_COLOR_ID_GREEN;
> +		mc_subled_info[2].color_index = LED_COLOR_ID_BLUE;
> +
> +		for (int i = 0; i < HP_KBD_RGB_COLORS; i++) {
> +			int off = HP_COLOR_TABLE_PADDING + zone * HP_KBD_RGB_COLORS + i;
> +
> +			mc_subled_info[i].channel = zone * HP_KBD_RGB_COLORS + i;
> +			mc_subled_info[i].intensity = color_table[off];
> +			mc_subled_info[i].brightness = LED_FULL;
> +		}
> +
> +		multicolor_led_dev->subled_info = mc_subled_info;
> +		multicolor_led_dev->num_colors = HP_KBD_RGB_COLORS;
> +
> +		ret = devm_led_classdev_multicolor_register(dev, multicolor_led_dev);
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
> +	int ret;
> +
> +	ret = hp_wmi_perform_query(HPWMI_GET_KEYBOARD_TYPE_QUERY, HPWMI_GM, &keyboard_type,
> +				sizeof(keyboard_type), sizeof(keyboard_type));
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
>  static int platform_profile_omen_get_ec(enum platform_profile_option *profile)
>  {
>  	int tp;
> @@ -2541,7 +2835,9 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
>  		return err;
>  
>  	thermal_profile_setup(device);
> -
> +	err = hp_kbd_rgb_setup();
> +	if (err)
> +		dev_err(&device->dev, "Failed to initialize keyboard RGB\n");
>  	return 0;
>  }
>  

