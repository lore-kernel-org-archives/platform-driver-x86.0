Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794570126;
	b=BQv3qFyAqE351xi7Md2bG9KNj/RKXuzUal95ceOq9oBfo8FZDC9i4ImE2u4+Pmfdz4Q4
	 g8ijK/vVgkKYYkqY0CepV2+MBvHVgnRwBX53AIMBk5Oyfv+sPiNrRVmI0ALP26ByHmJae
	 UXt8cya6bKBtlzq5r5eGZM3vcb/cy3v6fRGZItOa1UnYUSJOXXvZcsEa93jD5+MpgTpXg
	 hvZHquscDGDDsP6ezJLRDXdeQAOgfSvWuysO9YxZEikA455/0KSQb0yRZJ24M8ZvRXirr
	 gUdS/0WkTzaIZe5iubou1pzUeysuJxHRUHIVMLolDIVZedh+9MlKHxX3TRD63pj8YJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794570126;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=7Fgg1BGTG3mDc/rHsRF3Hf1P524y67Gokatn8FuFYJE=;
	b=382tu5NK9OMY2Z6y7/M4oEmnZIwCds3tn2IENOcc7D/ulY1yqfbt5tlZTC9dEYpDvzJR
	 uivVRlvUCQFm0o/DG66nVn1ZxjB5/f47kFGP3q3LxeiGs3Q4dmA47d4cwX5M1BFVMX0kW
	 KTjCEefYctNqS7xQUhk9k0utOA9DZKNVU6xbcgbIt9ZmqSOKPLGIAlr64vr47Rphafm69
	 k7cHQOv1alkLy/tsw5qChrOTAixbiVjsxk9l/yWrXhrxLPRx38r7Gj90xQDHwxkDQ5uoK
	 0mEo38pGMo3Evxp/9i2kqzP5rqd9LQRpxpy/TapTJro0FGtcw7caqyrPQBfHsCbP7DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MQi2ijgy;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EDD606A327;
	Fri, 13 Nov 2026 11:42:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45EDD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MQi2ijgy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794570125; x=1826106125;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=U+1LDJ9TnD3lv7aSxa634526Hok9eeX0Cq/dtgryAzw=;
  b=MQi2ijgyAYVGesyApDgOKMZi7cMbhHJ79nu4EIm+pXB+/4QRNjDwiKxA
   fu68FB56PqEfER7T82enXEKLCIRg7a0++TQovFaD4AFQoLxYtLxDokB3y
   +oJJZzxFya0beGgCHhC6JCaVrWkt4PtQrdgu2RHkgmPSoYamZUaoc7l7q
   haQQv/pCTcI1uKdu7fWwLXDSngqGe7dwiXSuCR+p7XmQfHNeqtq0P1WOm
   s4r5q3zVbLk5wVglTBAQnLQHGj9l2hiyRS4OadU5l1kCxNh80P2gEA/IU
   kcoMC+9nr2ryiDTbHwhMlPu/ovjUtVGjK2v5jrwaIgx7yCmKliQ8C2GGo
   A==;
X-CSE-ConnectionGUID: tWa0KS11QCqvRD6ucAe7KQ==
X-CSE-MsgGUID: ZYwykF3gR06Ug+wOXZpSZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3271560"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3271560"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 03:42:05 -0800
X-CSE-ConnectionGUID: TSx5JUcLR9qWyAhn1XbpEA==
X-CSE-MsgGUID: gtSbaUg4S8mZbjgWrEUYuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9064817"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.214])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 03:42:02 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 13 Nov 2026 13:41:58 +0200 (EET)
To: Batuhan <tuugspeedman@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, "Lee, Chun-Yi" <jlee@suse.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v2] platform/x86: acer-wmi: Add 4-zone RGB keyboard
 support for Nitro AN515-58
In-Reply-To: <20261111190925.7250-1-tuugspeedman@gmail.com>
Message-ID: <2e931d55-1705-414b-9477-ce7c677d89c9@linux.intel.com>
References: <20261111190925.7250-1-tuugspeedman@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-73182277-1794570118=:6498"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-73182277-1794570118=:6498
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 11 Nov 2026, Batuhan wrote:

> From: Batuhan G=C3=BCvener <tuugspeedman@gmail.com>
>=20
> Add support for the 4-zone RGB keyboard backlights found on Acer Nitro
> AN515-58 laptops.
>=20
> The hardware operates via a dual-control mechanism: global hardware
> brightness is managed by the EC via RAM offset 0x31 with a range of 0 to =
4
> (where 0x04 is maximum intensity), while per-zone RGB color control is
> handled via WMI Method 6.
>=20
> Exposing max_brightness =3D 4 to match the EC hardware level causes the
> led-class-multicolor subsystem to scale color components down, restrictin=
g
> the palette to 5x5x5 (125) total color combinations. Keeping max_brightne=
ss
> at 255 allows fine-grained 8-bit per-channel control from userspace, thou=
gh
> it creates a dual-control scenario where hardware EC brightness and
> userspace multicolor brightness operate concurrently (e.g. EC brightness =
at
> 4 while userspace intensity is 0).
>=20
> Additionally, when the system resumes from a shutdown or power cycle
> while brightness is set to 0, the hardware initializes with 0
> brightness but cannot derive valid multi-intensity values. To ensure
> consistent state evaluation, it defaults to max intensity
> (255, 255, 255 - white).
>=20
> This implementation builds upon initial findings and reverse-engineering
> efforts by Dirga Yuza and open-source community driver implementations.
>=20
> Link: https://lore.kernel.org/r/20260503062131.158944-1-dirgayuza123@gmai=
l.com/
> Link: https://github.com/0x7375646F/Linuwu-Sense
> Link: https://github.com/JafarAkhondali/acer-predator-turbo-and-rgb-keybo=
ard-linux-module
>=20
> Signed-off-by: Batuhan G=C3=BCvener <tuugspeedman@gmail.com>
>=20
> ---
> Changes since v1:
> - Clear non-English comments
> - Rebase onto linux-next
> ---
>  drivers/platform/x86/Kconfig    |   1 +
>  drivers/platform/x86/acer-wmi.c | 264 ++++++++++++++++++++++++++++++++
>  2 files changed, 265 insertions(+)
>=20
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 4154045595d0..f6af91ede346 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -169,6 +169,7 @@ config ACER_WMI
>  =09select LEDS_CLASS
>  =09select NEW_LEDS
>  =09select PLATFORM_PROFILE
> +=09select LEDS_CLASS_MULTICOLOR
>  =09help
>  =09  This is a driver for newer Acer (and Wistron) laptops. It adds
>  =09  wireless radio and bluetooth control, and on some laptops,
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-=
wmi.c
> index 3a018fdf5138..a374f4a6c979 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -20,6 +20,7 @@
>  #include <linux/fixp-arith.h>
>  #include <linux/backlight.h>
>  #include <linux/leds.h>
> +#include <linux/led-class-multicolor.h>
>  #include <linux/platform_device.h>
>  #include <linux/platform_profile.h>
>  #include <linux/acpi.h>
> @@ -36,6 +37,9 @@
>  #include <linux/unaligned.h>
>  #include <linux/bitfield.h>
>  #include <linux/bitmap.h>
> +#include <linux/bits.h>
> +#include <linux/container_of.h>
> +#include <linux/mutex.h>

Please try to put these into where they're even remotely close to where=20
they'd be in alphabetical order. Alternatively, add a patch which sorts=20
these alphabetically per group (linux/, acpi/, asm/, etc), with one empty=
=20
line in between each group.

> =20
>  MODULE_AUTHOR("Carlos Corbacho");
>  MODULE_DESCRIPTION("Acer Laptop WMI Extras Driver");
> @@ -77,6 +81,41 @@ MODULE_LICENSE("GPL");
>  #define ACER_WMID_SET_GAMING_MISC_SETTING_METHODID 22
>  #define ACER_WMID_GET_GAMING_MISC_SETTING_METHODID 23
> =20
> +/*Method IDs for 4 zone keyboard RGB*/
> +#define WMID_GUID4 "7A4DDFE7-5B5D-40B4-8595-4408E0CC7F56"
> +#define ACER_WMID_SET_GAMING_STATIC_LED_METHODID 6
> +#define ACER_WMID_SET_GAMING_DYNAMIC_LED_METHODID 5
> +#define ACER_WMID_SET_GAMINGKBBL_METHODID 20
> +
> +/*
> + * Gaming keyboard backlight enable command payload:
> + * Bit 3: Controller enable flag
> + * Bits [43:40]: Target 4-zone keyboard backlight interface

Please define these separately. Use GENMASK() for the second field.

You can likely drop the comments when using good names. Especially with=20
the bit 3.

> + */
> +#define ACER_GAMING_LED_KBBL_ENABLE=09(BIT_ULL(3) | (15ULL << 40))

KBBL ? If it that's short for "keyboard backlight", use KBD_BL instead.

=2E..Then use named ones (xx | FIELD_PREP(yy, FIELD_MAX(yy)))

You'll likely need to split the construct to multiple lines to keep it=20
readable.

> +
> +/*
> + * Method 6 Gaming Static LED payload format:
> + * Bits [23:16]: Red intensity
> + * Bits [15:8]:  Green intensity
> + * Bits [7:0]:   Blue intensity

Same as GENMASK() already tells us so keep only the first line, if=20
anything.

> + */
> +#define ACER_GAMING_STATIC_LED_RED_MASK   GENMASK(23, 16)
> +#define ACER_GAMING_STATIC_LED_GREEN_MASK GENMASK(15, 8)
> +#define ACER_GAMING_STATIC_LED_BLUE_MASK  GENMASK(7, 0)
> +
> +/* 4-Zone RGB Keyboard EC RAM Offsets */

Does this add some value over the define name, if you think it does,=20
consider if define could be named better. You can then likely drop the=20
comment as redundant.

We only comment non-obvious/tricky bits, not repeat what can be read from=
=20
the code. Try to make naming and code so readable on its own, you only=20
rarely need to add a comment!

> +#define ACER_EC_ZONE_COLOR_BASE_ADDR       0x3C
> +
> +/* 4-Zone RGB Keyboard Protocol Constants */
> +#define ACER_KBD_STATIC_PREAMBLE_BRIGHTNESS 100
> +#define ACER_KBD_RGB_MAX_INTENSITY         255
> +#define ACER_KBD_NUM_ZONES                 4
> +#define ACER_KBD_NUM_COLOR_CHANNELS        3
> +
> +/* Keyboard Backlight Modes */
> +#define ACER_KBD_MODE_STATIC               0
> +
>  #define ACER_GAMING_FAN_BEHAVIOR_CPU BIT(0)
>  #define ACER_GAMING_FAN_BEHAVIOR_GPU BIT(3)
> =20
> @@ -389,6 +428,131 @@ struct wmi_interface {
>  /* The static interface pointer, points to the currently detected interf=
ace */
>  static struct wmi_interface *interface;
> =20
> +/*Defining payload packages, zone information and general LED protocols =
*/
> +static acpi_status WMI_gaming_execute_u64(u32 method_id, u64 in, u64 *ou=
t);
> +
> +struct led_information {
> +=09struct led_classdev_mc led_general;
> +=09struct mc_subled led_colors[3];
> +=09struct rgb_wmi *parent;
> +=09u8 zone_id;
> +=09u8 current_brightness;
> +};
> +
> +struct rgb_wmi {
> +=09struct mutex led_lock; /* making sure EC receives single command at a=
 time */
> +=09struct led_information zones[4];
> +};
> +
> +static int acer_kbd_set_static_preamble(u8 ec_brightness)
> +{
> +=09u8 r =3D ACER_KBD_RGB_MAX_INTENSITY;
> +=09u8 g =3D ACER_KBD_RGB_MAX_INTENSITY;
> +=09u8 b =3D ACER_KBD_RGB_MAX_INTENSITY;
> +
> +=09ec_read(ACER_EC_ZONE_COLOR_BASE_ADDR, &r);
> +=09ec_read(ACER_EC_ZONE_COLOR_BASE_ADDR + 1, &g);
> +=09ec_read(ACER_EC_ZONE_COLOR_BASE_ADDR + 2, &b);
> +
> +=09u8 gm_input[16] =3D {
> +=09=09ACER_KBD_MODE_STATIC,   /* mode =3D static */
> +=09=090,                      /* speed */
> +=09=09ec_brightness,          /* brightness, 0-100 */
> +=09=090,                      /* reserved */
> +=09=090,                      /* direction */
> +=09=09r, g, b,                /* color readings from EC */
> +=09=093, 1, 0, 0, 0, 0, 0, 0

Can you make a __packed struct out of this since so member names out=20
document what the thing is about. Don't forget to check if you've the=20
include for __packed if you end up using it.

> +=09};
> +=09struct acpi_buffer input =3D { .length =3D sizeof(gm_input), .pointer=
 =3D gm_input };
> +=09struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +=09union acpi_object *obj;
> +=09acpi_status status;
> +=09u64 resp =3D 0;
> +
> +=09status =3D wmi_evaluate_method(WMID_GUID4, 0,

/**
 * wmi_evaluate_method - Evaluate a WMI method (deprecated)

Please do not add users for the deprecated WMI interface.

> +=09=09=09=09     ACER_WMID_SET_GAMINGKBBL_METHODID,
> +=09=09=09      &input, &output);

Misindented.

> +=09if (ACPI_FAILURE(status))
> +=09=09return -EIO;
> +
> +=09obj =3D output.pointer;
> +=09if (obj && obj->type =3D=3D ACPI_TYPE_BUFFER) {
> +=09=09if (obj->buffer.length >=3D 8)
> +=09=09=09resp =3D get_unaligned_le64(obj->buffer.pointer);
> +=09=09else if (obj->buffer.length >=3D 4)
> +=09=09=09resp =3D get_unaligned_le32(obj->buffer.pointer);
> +=09=09else if (obj->buffer.length >=3D 1)
> +=09=09=09resp =3D ((u8 *)obj->buffer.pointer)[0];
> +=09}
> +
> +=09kfree(obj);

Use __free(), declare the variable mid-function where assigning to it.

> +
> +=09return resp ? -EIO : 0;
> +}
> +
> +static int send_zone_color(u8 zone_bit, u8 r, u8 g, u8 b)
> +{
> +=09acpi_status status;
> +=09u64 resp =3D 0;
> +=09u64 payload;
> +=09u32 rgb;
> +
> +=09rgb =3D FIELD_PREP(ACER_GAMING_STATIC_LED_RED_MASK, r) |
> +=09FIELD_PREP(ACER_GAMING_STATIC_LED_GREEN_MASK, g) |
> +=09FIELD_PREP(ACER_GAMING_STATIC_LED_BLUE_MASK, b);

Misindented.

> +
> +=09payload =3D (u64)cpu_to_be32(rgb) | zone_bit;

Consider __packed struct so you don't need to do crazy casts like that.
Only cast when passing it to execute.

> +
> +=09status =3D WMI_gaming_execute_u64(ACER_WMID_SET_GAMING_STATIC_LED_MET=
HODID,
> +=09=09=09=09=09payload, &resp);
> +=09if (ACPI_FAILURE(status))
> +=09=09return -EIO;
> +
> +=09return resp ? -EIO : 0;

Would this be cleaner if you'd use || resp.

> +}
> +
> +static enum led_brightness rgb_get(struct led_classdev *led_cdev)
> +{
> +=09struct led_classdev_mc *general_mcolor =3D lcdev_to_mccdev(led_cdev);
> +=09struct led_information *led_info =3D container_of(general_mcolor,
> +=09=09=09=09=09=09=09struct led_information,
> +=09=09=09=09=09=09 led_general);

Misaligned.

> +=09return led_info->current_brightness;
> +}
> +
> +static int rgb_set(struct led_classdev *led_cdev, enum led_brightness br=
ightness)
> +{
> +=09struct led_classdev_mc *general_mcolor =3D lcdev_to_mccdev(led_cdev);
> +=09struct led_information *led_info =3D container_of(general_mcolor,
> +=09=09=09=09=09=09=09struct led_information,
> +=09=09=09=09=09=09 led_general);

Misaligned. Please check if you have more copy-pasted? entries like this.

> +=09struct rgb_wmi *data =3D led_info->parent;
> +=09u8 r, g, b;
> +=09int ret;
> +
> +=09mutex_lock(&data->led_lock);
> +
> +=09if (brightness =3D=3D 0) {
> +=09=09r =3D 0;
> +=09=09g =3D 0;
> +=09=09b =3D 0;
> +=09} else {
> +=09=09led_mc_calc_color_components(general_mcolor, brightness);
> +=09=09r =3D led_info->led_colors[0].brightness;
> +=09=09g =3D led_info->led_colors[1].brightness;
> +=09=09b =3D led_info->led_colors[2].brightness;
> +=09}
> +
> +=09ret =3D send_zone_color((u8)led_info->zone_id, r, g, b);

Isn't it already u8???.

> +
> +=09if (!ret) {

Reverse logic and handle errors first. Keep call and it's error handling=20
together without empty lines in between.

Since you now need to unlock to return immediately, you should also=20
convert this to guard() (which is preferred way for doing locking anyway).

> +=09=09led_info->current_brightness =3D brightness;
> +=09=09led_cdev->brightness =3D brightness;
> +=09}
> +
> +=09mutex_unlock(&data->led_lock);
> +=09return ret;
> +}
>  /*
>   * Embedded Controller quirks
>   * Some laptops require us to directly access the EC to either enable or=
 query
> @@ -406,10 +570,94 @@ struct quirk_entry {
>  =09bool hwmon;
>  =09bool platform_profile;
>  =09bool pwm;
> +=09u8 kbl_four_zone;
>  };
> =20
>  static struct quirk_entry *quirks;
> =20
> +static int acer_kbd_rgb_init(struct platform_device *device, struct rgb_=
wmi *rgb_data)
> +{
> +=09static const char * const zone_names[] =3D {
> +=09=09"acer-wmi:rgb:kbd_backlight-left",
> +=09=09"acer-wmi:rgb:kbd_backlight-center-left",
> +=09=09"acer-wmi:rgb:kbd_backlight-center-right",
> +=09=09"acer-wmi:rgb:kbd_backlight-right",
> +=09};
> +=09u64 gaming_sysinfo;
> +=09acpi_status status;
> +=09int ret, i;
> +
> +=09if (!quirks || !quirks->kbl_four_zone)
> +=09=09return -ENODEV;
> +
> +=09status =3D WMI_gaming_execute_u64(ACER_WMID_GET_GAMING_SYS_INFO_METHO=
DID, 0, &gaming_sysinfo);
> +=09if (ACPI_FAILURE(status))
> +=09=09return -EIO;
> +
> +=09status =3D WMI_gaming_execute_u64(ACER_WMID_SET_GAMING_LED_METHODID,
> +=09=09=09=09=09ACER_GAMING_LED_KBBL_ENABLE, NULL);
> +=09if (ACPI_FAILURE(status))
> +=09=09return -EIO;
> +
> +=09ret =3D acer_kbd_set_static_preamble(ACER_KBD_STATIC_PREAMBLE_BRIGHTN=
ESS);
> +=09if (ret)
> +=09=09pr_warn("Failed to set static preamble on init: %d\n", ret);
> +
> +=09mutex_init(&rgb_data->led_lock);

devm_mutex_init() + error handling.

> +
> +=09for (i =3D 0; i < ACER_KBD_NUM_ZONES; i++) {
> +=09=09struct led_information *zone =3D &rgb_data->zones[i];
> +=09=09u8 r =3D 0, g =3D 0, b =3D 0;
> +=09=09u8 max_val;
> +=09=09u8 start_offset =3D ACER_EC_ZONE_COLOR_BASE_ADDR + (i * ACER_KBD_N=
UM_COLOR_CHANNELS);

Reverse xmas-tree order.

> +
> +=09=09zone->zone_id =3D BIT(i);
> +=09=09zone->parent  =3D rgb_data;
> +
> +=09=09if (ec_read(start_offset, &r) !=3D 0 ||
> +=09=09=09ec_read(start_offset + 1, &g) !=3D 0 ||
> +=09=09=09ec_read(start_offset + 2, &b) !=3D 0) {

Misaligned.

> +=09=09=09r =3D ACER_KBD_RGB_MAX_INTENSITY;
> +=09=09=09g =3D ACER_KBD_RGB_MAX_INTENSITY;
> +=09=09=09b =3D ACER_KBD_RGB_MAX_INTENSITY;
> +=09=09}
> +
> +=09=09max_val =3D max3(r, g, b);
> +
> +=09=09if (max_val =3D=3D 0) {
> +=09=09=09zone->led_colors[0].intensity =3D ACER_KBD_RGB_MAX_INTENSITY;
> +=09=09=09zone->led_colors[1].intensity =3D ACER_KBD_RGB_MAX_INTENSITY;
> +=09=09=09zone->led_colors[2].intensity =3D ACER_KBD_RGB_MAX_INTENSITY;
> +=09=09=09zone->current_brightness =3D 0;
> +=09=09} else {
> +=09=09=09zone->led_colors[0].intensity =3D (r * ACER_KBD_RGB_MAX_INTENSI=
TY) / max_val;
> +=09=09=09zone->led_colors[1].intensity =3D (g * ACER_KBD_RGB_MAX_INTENSI=
TY) / max_val;
> +=09=09=09zone->led_colors[2].intensity =3D (b * ACER_KBD_RGB_MAX_INTENSI=
TY) / max_val;
> +=09=09=09zone->current_brightness =3D max_val;
> +=09=09}
> +
> +=09=09zone->led_colors[0].color_index =3D LED_COLOR_ID_RED;
> +=09=09zone->led_colors[1].color_index =3D LED_COLOR_ID_GREEN;
> +=09=09zone->led_colors[2].color_index =3D LED_COLOR_ID_BLUE;
> +
> +=09=09zone->led_general.subled_info =3D zone->led_colors;
> +=09=09zone->led_general.num_colors  =3D ACER_KBD_NUM_COLOR_CHANNELS;
> +
> +=09=09zone->led_general.led_cdev.name =3D zone_names[i];
> +=09=09zone->led_general.led_cdev.max_brightness =3D ACER_KBD_RGB_MAX_INT=
ENSITY;
> +=09=09zone->led_general.led_cdev.brightness =3D zone->current_brightness=
;
> +=09=09zone->led_general.led_cdev.brightness_set_blocking =3D rgb_set;
> +=09=09zone->led_general.led_cdev.brightness_get =3D rgb_get;
> +=09=09zone->led_general.led_cdev.flags =3D LED_RETAIN_AT_SHUTDOWN;
> +
> +=09=09ret =3D devm_led_classdev_multicolor_register(&device->dev,
> +=09=09=09=09=09=09=09=09&zone->led_general);

Misaligned.

> +=09=09if (ret)
> +=09=09=09return ret;
> +=09}
> +=09=09return 0;
> +}
> +
>  static void __init set_quirks(void)
>  {
>  =09if (quirks->mailled)
> @@ -466,6 +714,7 @@ static struct quirk_entry quirk_acer_nitro_an515_58 =
=3D {
>  =09.hwmon =3D true,
>  =09.platform_profile =3D true,
>  =09.pwm =3D true,
> +=09.kbl_four_zone =3D 1,
>  };
> =20
>  static struct quirk_entry quirk_acer_predator_ph315_53 =3D {
> @@ -2815,6 +3064,8 @@ static int acer_wmi_hwmon_init(void);
>  /*
>   * Platform device
>   */
> +static struct rgb_wmi acer_rgb_data;
> +
>  static int acer_platform_probe(struct platform_device *device)
>  {
>  =09int err;
> @@ -2846,6 +3097,11 @@ static int acer_platform_probe(struct platform_dev=
ice *device)
>  =09=09if (err)
>  =09=09=09goto error_hwmon;
>  =09}
> +=09if (quirks->kbl_four_zone) {
> +=09=09err =3D acer_kbd_rgb_init(device, &acer_rgb_data);
> +=09=09if (err)
> +=09=09=09pr_warn("Failed to initialize 4-zone RGB keyboard: %d\n", err);

dev_warn()

> +=09}
> =20
>  =09return 0;
> =20
> @@ -2898,6 +3154,7 @@ static int acer_suspend(struct device *dev)
>  static int acer_resume(struct device *dev)
>  {
>  =09struct acer_data *data =3D &interface->data;
> +=09int ret;
> =20
>  =09if (!data)
>  =09=09return -ENOMEM;
> @@ -2911,6 +3168,13 @@ static int acer_resume(struct device *dev)
>  =09if (acer_wmi_accel_dev)
>  =09=09acer_gsensor_init();
> =20
> +=09/* Ensuring keyboard is at static mode after resuming from sleep. */
> +=09if (quirks && quirks->kbl_four_zone) {
> +=09=09ret =3D acer_kbd_set_static_preamble(ACER_KBD_STATIC_PREAMBLE_BRIG=
HTNESS);
> +=09=09if (ret)
> +=09=09=09pr_warn("Failed to restore keyboard static mode on resume: %d\n=
", ret);

dev_warn()

> +=09}
> +
>  =09return 0;
>  }
>  #else
>=20

--=20
 i.

--8323328-73182277-1794570118=:6498--
