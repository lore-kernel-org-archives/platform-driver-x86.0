Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F4BC05027
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Feb 2023 08:18:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231454AbjBAISY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Feb 2023 03:18:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbjBAISX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Feb 2023 03:18:23 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F7585DC26
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Feb 2023 00:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675239461;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JuxYq34t7PfJj7E4GmUBdjgfoVat55RdgeD+Y/ttYPY=;
        b=Il0f6+3cramEiXKkIm3OQrLIK67kzAB3wy1EtNIT2Cnbw3rLtdUcjY+frj9gEy2bxzjHLz
        sUQMcOcMx2J72ni0YLQcqsJ0hfPRY4AfUjDJ+VZp7B77wnb1vPFmuc10XgiBg5ZZWirpOM
        Y2R2eFjXKOzUhlgl87GHm1gs+rZ6WVY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-134-8iQsfaUTMBqkR-UrlHI_9g-1; Wed, 01 Feb 2023 03:17:40 -0500
X-MC-Unique: 8iQsfaUTMBqkR-UrlHI_9g-1
Received: by mail-ed1-f69.google.com with SMTP id a29-20020a50c31d000000b004a248bc5b6dso5810229edb.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Feb 2023 00:17:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JuxYq34t7PfJj7E4GmUBdjgfoVat55RdgeD+Y/ttYPY=;
        b=ExR2B+dfh2CRJVMSy2jufBbFOix7lc54TXnmjDnSevd/u7B4dD9Eo+eM8cmLSsK8Fx
         PvO1hP9WLrEofjg4znTSB+REo6w4h5zl4ksbptui5MP8/jIOKiNXXxCqyePuJ3aHVeq8
         9OnresQ5QsAeUNzruuXUv/KcBCXPwGO+iKG6NhoK2JihTofcPFM0HsKamLLu9/FdcO35
         YsGjhAOwWQLdlOMKKT+8MslZ2r5N6h3eLPB6J8ZA6fw3ElE+TABxwj123UfFxjWU6U0v
         c8/fyrRkVff2BRMpUi04UJNDUVv/mPTaFsiQo7MqbF+LMZFyfW4YUpJCfzvGa16gMXtC
         LyyA==
X-Gm-Message-State: AO0yUKVms1yKedSbpnQAVVkLJq+AoEXexlGSSLNstM1ESUQQYpKw9Qwp
        OZ0HB7Njxpqzo/Cs5xPFsSs/yqUmnNimUwD1LrViUemVDQiMbgknwHAW3PZ5eu8Mq60hM2ASpzD
        /c3bmO4O3avdJNYPt5sXYASpljKN7uHekjA==
X-Received: by 2002:a05:6402:890:b0:47f:bc9b:46ec with SMTP id e16-20020a056402089000b0047fbc9b46ecmr1012619edy.7.1675239459245;
        Wed, 01 Feb 2023 00:17:39 -0800 (PST)
X-Google-Smtp-Source: AK7set+hNw8M45KT3eTG/XkcCnAl0oyfNkXkSHGmpj2TuL8+u9EUbg7tfZpDHdh43EQ+gUlHSxRSKw==
X-Received: by 2002:a05:6402:890:b0:47f:bc9b:46ec with SMTP id e16-20020a056402089000b0047fbc9b46ecmr1012607edy.7.1675239458949;
        Wed, 01 Feb 2023 00:17:38 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id x5-20020aa7cd85000000b00497d8613532sm9507838edv.5.2023.02.01.00.17.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 00:17:38 -0800 (PST)
Message-ID: <9b761996-d522-b0f8-6472-10e40e09e036@redhat.com>
Date:   Wed, 1 Feb 2023 09:17:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH V3] platform/x86: hp-wmi: Support omen backlight control
 wmi-acpi methods
To:     Rishit Bansal <rishitbansal0@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20230131235027.36304-1-rishitbansal0@gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230131235027.36304-1-rishitbansal0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Rishit,

On 2/1/23 00:50, Rishit Bansal wrote:
> The HP Omen Command Studio application includes a Light Studio feature
> which can be used to control various features related to the keyboard
> backlight via the 0x20009 command.
> 
> The command supports the following queries:
> 
> - 0x1: Checks if keyboard lighting is supported
> - 0x2: Get the zone colors of each of the 4 zones on the keyboard
> - 0x3: Set the zone colors of each of the 4 zones on the keyboard
> - 0x4: Gets the state (on/off) of the backlight
> - 0x5: Sets the state (on/off) of the backlight
> 
> This patch introduces a new sysfs led class called
> "hp_omen::kbd_backlight" which can be used to control the state of the
> backlight. It also includes a sysfs RW attribute at the following
> location:
> 
> /sys/class/leds/hp_omen::kbd_backlight/zone_colors
> 
> This file contains the color codes for each of the 4 zones of the
> keyboard. Each zone's color is represented by R,G and B components, each
> of which take a byte. Therefore, the total size of this file is always:
> 
> 4 (zones) * 3 (components R,G,B) = 12 bytes
> 
> An example output from this file is:
> 
> $ xxd /sys/class/leds/hp_omen\:\:kbd_backlight/zone_colors
> 00000000: 01ff 00ff 01ff ffff 01ff 0101            ............
> 
> The above output means that each zone has the following hex
> color codes:
> Zone 1: #01ff00
> Zone 2: #ff01ff
> Zone 3: #ffff01
> Zone 4: #ff0101
> 
> Colors can be set on the backlight by writing back to this file by
> passing 12 bytes in the exact same format as above.
> 
> Additionally this patch also maps the backlight event to the KEY_KBDILLUMTOGGLE
> key so it shows the correct notification on userspace.
> 
> The patch has been tested on an HP Omen 15-en0037AX (AMD) laptop.
> 
> Signed-off-by: Rishit Bansal <rishitbansal0@gmail.com>
> ---
> Changes since v1:
>  - Map backlight key to KEY_KBDILLUMTOGGLE
> 
> Changes since v2:
>  - Changes all str operations to memcpy() to handle null bytes edge
>    cases
>  - Renamed kbd_rgb to zone_colors, and moved it to inside the
>    kbd_backlight directory
>  - Added documentation for the zone_colors file
>  - Removed KEY_KBDILLUMTOGGLE from the parse-map, and instead emitted
>    directly
>  - Remove logic to unregister from devm
>  - Moved a few constants to #define
>  - Updated path description with more details on zone_colors file format
> ---
>  .../ABI/testing/sysfs-platform-hp-wmi         |  33 +++++
>  drivers/platform/x86/hp/hp-wmi.c              | 116 ++++++++++++++++++
>  2 files changed, 149 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-platform-hp-wmi
> 
> diff --git a/Documentation/ABI/testing/sysfs-platform-hp-wmi b/Documentation/ABI/testing/sysfs-platform-hp-wmi
> new file mode 100644
> index 000000000000..ccf2d29185ee
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-platform-hp-wmi
> @@ -0,0 +1,33 @@
> +What:		/sys/class/leds/hp_omen::kbd_backlight/zone_colors
> +Date:		Feb 2023
> +KernelVersion:	6.2
> +Contact:	Rishit Bansal <rishitbansal0@gmail.com>
> +Description:
> +		This file stores the RGB color codes for each of
> +		the 4 zones of the backlight on HP omen keyboards.
> +
> +		Each zone takes R,G,B values. The R,G,B values each can
> +		range from 0-255. This means the whole state of the colors
> +		can be represented in 12 bytes:
> +
> +		(4 zones * 3 color components (R,G,B) * 1 byte = 12 bytes)
> +
> +		Here is an example where we read the file:
> +
> +			xxd /sys/class/leds/hp_omen\:\:kbd_backlight/zone_colors
> +			00000000: 01ff 00ff 01ff ffff 01ff 0101            ............
> +
> +		The above output means that each zone has the following hex
> +		color codes:
> +		Zone 1: #01ff00
> +		Zone 2: #ff01ff
> +		Zone 3: #ffff01
> +		Zone 4: #ff0101
> +
> +		The colors of the each of the zones can be set by writing
> +		the same format to this file. For example to set all zones
> +		to white, we would do:
> +
> +			echo -n -e '\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff' | sudo tee /sys/class/leds/hp_omen\:\:kbd_backlight/zone_colors

Thank you for the new version and thank you for writing this doc, that is
not only helpful for users but also for the review.

Looking at the above I think what you should do is create not 1 but 4
sysfs files like this:

/sys/class/leds/hp_omen::kbd_backlight/zone1_colors
/sys/class/leds/hp_omen::kbd_backlight/zone2_colors
/sys/class/leds/hp_omen::kbd_backlight/zone3_colors
/sys/class/leds/hp_omen::kbd_backlight/zone4_colors

And then a user could do e.g.:

[hans@shalem ~]$ cat /sys/class/leds/hp_omen::kbd_backlight/zone1_colors
#01ff00
[hans@shalem ~]$

And e.g.:

[hans@shalem ~]$ echo #ff0000 > /sys/class/leds/hp_omen::kbd_backlight/zone1_colors

This will make it much easier for users to use and generally
speaking we try to avoid putting binary files in sysfs.

You can take a look at drivers/hid/hid-lg-g15.c and then the
color_store() function for an existing example of parsing
rgb colors in the form of #rrggbb.

Also if you look at lg_g510_kbd_led_write() you see there that
that driver actually emulates a brightness range of 0-255 for

/sys/class/leds/hp_omen::kbd_backlight/brightness

by scaling the user requested zone values by the brightness
value, giving a bigger brightness range in a standard
sysfs interface which is e.g. supported by upower and by
some desktop environments using upower, so that even
without knowing how to control the specific zones users
can still control at least the brightness.

So I think that what you want to do is add:

struct hp_omen_kbd_led {
	struct led_classdev cdev;
	u8 red[4];
	u8 green[4];
	u8 blue[4];
	enum led_brightness brightness;
};

struct hp_omen_kbd_led omen_kbd_led;

And then have 4 zone sysfs files which fill the red, green and blue
arrays (and also fill these with initial values at probe) and
then have an omen_kbd_led_update_zones() function which creates
the 12 bytes you need to send by for each zone calculating the
values similar to this lg_g510_kbd_led_write() code:

        g15->transfer_buf[1] =
                DIV_ROUND_CLOSEST(g15_led->red * brightness, 255);
        g15->transfer_buf[2] =
                DIV_ROUND_CLOSEST(g15_led->green * brightness, 255);
        g15->transfer_buf[3] =
                DIV_ROUND_CLOSEST(g15_led->blue * brightness, 255);

And then on store of a zone, you update the red, green, blue values
for that zone and call omen_kbd_led_update_zones()

and from set_omen_backlight_brightness() you then:

1. Store the brightness
2. Do the on/off setting of the backlight as done already
3. Call omen_kbd_led_update_zones() to update the zones for
   the brightness change

I believe that this will give a much nicer user experience
then the current binary file which sets all 4 zones at once
approach.

Regards,

Hans









> +
> +
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 0a99058be813..f86cb7feaad4 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -27,6 +27,7 @@
>  #include <linux/rfkill.h>
>  #include <linux/string.h>
>  #include <linux/dmi.h>
> +#include <linux/leds.h>
>  
>  MODULE_AUTHOR("Matthew Garrett <mjg59@srcf.ucam.org>");
>  MODULE_DESCRIPTION("HP laptop WMI hotkeys driver");
> @@ -136,6 +137,7 @@ enum hp_wmi_command {
>  	HPWMI_WRITE	= 0x02,
>  	HPWMI_ODM	= 0x03,
>  	HPWMI_GM	= 0x20008,
> +	HPWMI_KB	= 0x20009,
>  };
>  
>  enum hp_wmi_hardware_mask {
> @@ -254,6 +256,9 @@ static const char * const tablet_chassis_types[] = {
>  
>  #define DEVICE_MODE_TABLET	0x06
>  
> +#define OMEN_ZONE_COLOR_OFFSET 0x19
> +#define OMEN_ZONE_COLOR_LEN 0x0c
> +
>  /* map output size to the corresponding WMI method id */
>  static inline int encode_outsize_for_pvsz(int outsize)
>  {
> @@ -734,12 +739,56 @@ static ssize_t postcode_store(struct device *dev, struct device_attribute *attr,
>  	return count;
>  }
>  
> +static ssize_t zone_colors_show(struct device *dev,
> +				    struct device_attribute *attr, char *buf)
> +{
> +	u8 val[128];
> +
> +	int ret = hp_wmi_perform_query(HPWMI_HDDTEMP_QUERY, HPWMI_KB, &val,
> +				       zero_if_sup(val), sizeof(val));
> +
> +	if (ret)
> +		return ret;
> +
> +	memcpy(buf, &val[OMEN_ZONE_COLOR_OFFSET], OMEN_ZONE_COLOR_LEN);
> +
> +	return OMEN_ZONE_COLOR_LEN;
> +}
> +
> +static ssize_t zone_colors_store(struct device *dev,
> +				     struct device_attribute *attr,
> +				     const char *buf, size_t count)
> +{
> +	u8 val[128];
> +	int ret;
> +
> +	ret = hp_wmi_perform_query(HPWMI_HDDTEMP_QUERY, HPWMI_KB, &val,
> +				   zero_if_sup(val), sizeof(val));
> +
> +	if (ret)
> +		return ret;
> +
> +	if (count != OMEN_ZONE_COLOR_LEN)
> +		return -1;
> +
> +	memcpy(&val[OMEN_ZONE_COLOR_OFFSET], buf, count);
> +
> +	ret = hp_wmi_perform_query(HPWMI_ALS_QUERY, HPWMI_KB, &val, sizeof(val),
> +				   0);
> +
> +	if (ret)
> +		return ret;
> +
> +	return OMEN_ZONE_COLOR_LEN;
> +}
> +
>  static DEVICE_ATTR_RO(display);
>  static DEVICE_ATTR_RO(hddtemp);
>  static DEVICE_ATTR_RW(als);
>  static DEVICE_ATTR_RO(dock);
>  static DEVICE_ATTR_RO(tablet);
>  static DEVICE_ATTR_RW(postcode);
> +static DEVICE_ATTR_RW(zone_colors);
>  
>  static struct attribute *hp_wmi_attrs[] = {
>  	&dev_attr_display.attr,
> @@ -752,6 +801,12 @@ static struct attribute *hp_wmi_attrs[] = {
>  };
>  ATTRIBUTE_GROUPS(hp_wmi);
>  
> +static struct attribute *omen_kbd_led_attrs[] = {
> +	&dev_attr_zone_colors.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(omen_kbd_led);
> +
>  static void hp_wmi_notify(u32 value, void *context)
>  {
>  	struct acpi_buffer response = { ACPI_ALLOCATE_BUFFER, NULL };
> @@ -853,6 +908,10 @@ static void hp_wmi_notify(u32 value, void *context)
>  	case HPWMI_PROXIMITY_SENSOR:
>  		break;
>  	case HPWMI_BACKLIT_KB_BRIGHTNESS:
> +		input_report_key(hp_wmi_input_dev, KEY_KBDILLUMTOGGLE, true);
> +		input_sync(hp_wmi_input_dev);
> +		input_report_key(hp_wmi_input_dev, KEY_KBDILLUMTOGGLE, false);
> +		input_sync(hp_wmi_input_dev);
>  		break;
>  	case HPWMI_PEAKSHIFT_PERIOD:
>  		break;
> @@ -1294,6 +1353,60 @@ static int thermal_profile_setup(void)
>  
>  static int hp_wmi_hwmon_init(void);
>  
> +static enum led_brightness get_omen_backlight_brightness(struct led_classdev *cdev)
> +{
> +	u8 val;
> +
> +	int ret = hp_wmi_perform_query(HPWMI_HARDWARE_QUERY, HPWMI_KB, &val, zero_if_sup(val), sizeof(val));
> +
> +	if (ret)
> +		return ret;
> +
> +	return (val & 0x80) ? LED_ON : LED_OFF;
> +}
> +
> +static void set_omen_backlight_brightness(struct led_classdev *cdev, enum led_brightness value)
> +{
> +	char buffer[4] = { (value == LED_OFF) ? 0x64 : 0xe4, 0, 0, 0 };
> +
> +	hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, HPWMI_KB, &buffer,
> +				       sizeof(buffer), 0);
> +}
> +
> +static struct led_classdev omen_kbd_led = {
> +	.name = "hp_omen::kbd_backlight",
> +	.brightness_set = set_omen_backlight_brightness,
> +	.brightness_get = get_omen_backlight_brightness,
> +	.max_brightness = 1,
> +	.groups = omen_kbd_led_groups,
> +};
> +
> +static bool is_omen_lighting_supported(void)
> +{
> +	u8 val;
> +
> +	int ret = hp_wmi_perform_query(HPWMI_DISPLAY_QUERY, HPWMI_KB, &val, zero_if_sup(val), sizeof(val));
> +
> +	if (ret)
> +		return false;
> +
> +	return (val & 1) == 1;
> +}
> +
> +static int omen_backlight_init(struct device *dev)
> +{
> +	int ret;
> +
> +	input_set_capability(hp_wmi_input_dev, KE_KEY, KEY_KBDILLUMTOGGLE);
> +
> +	ret = devm_led_classdev_register(dev, &omen_kbd_led);
> +
> +	if (ret < 0)
> +		return -1;
> +
> +	return 0;
> +}
> +
>  static int __init hp_wmi_bios_setup(struct platform_device *device)
>  {
>  	int err;
> @@ -1321,6 +1434,9 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
>  
>  	thermal_profile_setup();
>  
> +	if (is_omen_lighting_supported())
> +		omen_backlight_init(&device->dev);
> +
>  	return 0;
>  }
>  

