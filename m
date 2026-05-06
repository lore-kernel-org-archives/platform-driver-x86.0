Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBABD346E63;
	Wed,  6 May 2026 10:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778064071; cv=none; b=O51m+rvh6RDcnYtCCLdfCIEe8FrdMraJicYa5IhrgPJd6eSua90T3LrHcTJ1jSapupvd6ZbUvJP1wSiGxqoYIxn7DoKCDF4sehaHhCFiUihPBOtLlFy+SRDufD9/jozPGOCVOpJcOoJtPOGQ1ijxBLC04mYGaczwC51S/78eyHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778064071; c=relaxed/simple;
	bh=ysGnYdUiVBL7Sw7VuByDcQ6YofGjRnNG0T6indBRmbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LuUFQ0NtHchNRn9d5dZyZrxN0AHESTY891DiMyZUmN/8AExniRy3ujZwEbbpV+8B3q02rjls/PVvnMPeE3AfqWHG/Nsxz0ga0AKmlfCC9wvKa8wpmo74/nC7tdlcJDtR01VysEMjI9REezv3HAoOrkeKr24kn7mdu5D7oxQ8xRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=kRFP43xR; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="kRFP43xR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1778064067; x=1778668867; i=w_armin@gmx.de;
	bh=HKDFfKMjzL+Hjoc3hy4sMXOOYIeumEbWlqx83603BNU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=kRFP43xRBHHuwhaCMV0cW+ay8iBxvjFcWjD/b7h0O8VUMc3bDWZ2YcZuSEPRjCqp
	 1vlTCXwEP+2lFmjJQBOKkwUkoNIXyQyYvIMfvl1gCTl/qWl2oRzcBGpyPrdSd/vK+
	 xyn8rzGv4J8a4676p+ycc61O35C+7DjZkfAJLFpWJgA2Y/9NJ43lLXk7ClR8gOGJN
	 an7uQOU+KmsxQLRZ6GIj/+dgerZP0RcYzaP0z+4TKxyJpsDRmkKtOog64gyDSqTwO
	 K+eSO3hHVsvLirT2Et/hROzYT+JVI7bbnd1NcGUZZ9X3Ri5MnHxA2/bwv1Kl4uoRv
	 O269GmGiGUcMJNBpEw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mi2Jt-1vgp5n3tBZ-00kqaR; Wed, 06
 May 2026 12:41:07 +0200
Message-ID: <d40ab6ec-cf11-483a-8394-3744b421f8cc@gmx.de>
Date: Wed, 6 May 2026 12:41:05 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86/amd: Introduce Halo Box RGB LED driver
To: "Lin, Leo" <Leo.Lin@amd.com>, "S-k, Shyam-sundar"
 <Shyam-sundar.S-k@amd.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <20260504-halo-leds-v2-plus-v2-1-af027727605b@amd.com>
 <3f59c433-422a-40ef-b9fa-bbd77df47896@amd.com>
 <DS0PR12MB8479CCAB7C0090AC959C22CFFE3F2@DS0PR12MB8479.namprd12.prod.outlook.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <DS0PR12MB8479CCAB7C0090AC959C22CFFE3F2@DS0PR12MB8479.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YDFLIz2om1W6Izcfx5Ub2ID1XNEnKre0lWejHx7PkojnLWOA7TQ
 SyAQFDb0+WUj87IQ4WYY5rnSnFduMGqc7NnfRG0fzgE6JILbcdETpNvWz6BzZnrKB8Ea6RW
 B/WbnPnRIl+uyaysOvBj+2PkIOmpS7uidcz5jQdeh50cd1MpsRTGf5pu6bxTf3I+HLofQIb
 +FGMcilDrN/GJ+e1CZyHw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kovi6M1pjO4=;QJFxDF6Uqhs/DCULwdCoiDoWA7U
 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
 20mtcAWjp3ktNaOZqo=

Am 06.05.26 um 11:26 schrieb Lin, Leo:
> AMD General
>=20
>> -----Original Message-----
>> From: S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>
>> Sent: Wednesday, May 6, 2026 12:34 PM
>> To: Lin, Leo <Leo.Lin@amd.com>; Hans de Goede <hansg@kernel.org>; Ilpo
>> J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>; Mario Limonciello (AMD)
>> <superm1@kernel.org>
>> Cc: linux-kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org
>> Subject: Re: [PATCH v2] platform/x86/amd: Introduce Halo Box RGB LED dr=
iver
>>
>>
>>
>> On 5/4/2026 19:51, Yo-Jung Leo Lin (AMD) wrote:
>>> [You don't often get email from leo.lin@amd.com. Learn why this is
>>> important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> The Halo Box features an RGB LED light bar that can be controlled
>>> through WMI methods to display any color combination.
>>>
>>> The driver exposes the LED through the LED multicolor subsystem,
>>> allowing userspace to control RGB values via sysfs:
>>>    /sys/class/leds/amd_halo:multicolor:status/multi_intensity
>>>    /sys/class/leds/amd_halo:multicolor:status/brightness
>>>
>>> Hardware interface:
>>> - Three separate RGB channels (Red, Green, Blue)
>>> - Each channel controlled via individual WMI method calls
>>> - Value range: 0-100 (matching hardware range directly)
>>>
>>> Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>>> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
>>> Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
>>> ---
>>> v1 -> v2:
>>> - Fix Kconfig dependencies
>>> - Remove amd_halo_wmi_turn_off(). Handle the case where brightness=3D0=
 with
>> the
>>>    same logic where brightness !=3D 0
>>> - Remove the brightness_get callback, because currently there isn't a
>>>    well-defined global bightness in hardware. Note that the sysfs brig=
htness
>>>    stil works. It just caches the value last set.
>>> - Convert to wmidev_invoke_method()
>>> - Convert to ARRAY_SIZE()
>>> - Convert some macros to enum
>>> - Convert to devm_led_classdev_multicolor_register_ext()
>>> - Rename sysfs path to amd_halo:multicolor:status
>>> - Fold default LED colors setting in probe, before registration
>>> - Add no_singleton option
>>> - Make default RGB values into macros and adjust their values
>>> ---
>>>   MAINTAINERS                             |   7 +
>>>   drivers/platform/x86/amd/Kconfig        |  11 ++
>>>   drivers/platform/x86/amd/Makefile       |   1 +
>>>   drivers/platform/x86/amd/amd_halo_led.c | 222
>>> ++++++++++++++++++++++++++++++++
>>>   4 files changed, 241 insertions(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS index
>>> c871acf2179c..464bd4d16461 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -1124,6 +1124,13 @@ F:       drivers/char/hw_random/geode-rng.c
>>>   F:     drivers/crypto/geode*
>>>   F:     drivers/video/fbdev/geode/
>>>
>>> +AMD HALO BOX RGB LED DRIVER
>>> +M:     Mario Limonciello (AMD) <superm1@kernel.org>
>>> +R:     Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
>>> +L:     platform-driver-x86@vger.kernel.org
>>> +S:     Supported
>>> +F:     drivers/platform/x86/amd/amd_halo_led.c
>>> +
>>>   AMD HSMP DRIVER
>>>   M:     Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>>>   R:     Carlos Bilbao <carlos.bilbao@kernel.org>
>>> diff --git a/drivers/platform/x86/amd/Kconfig
>>> b/drivers/platform/x86/amd/Kconfig
>>> index b813f9265368..a1a74ef6c859 100644
>>> --- a/drivers/platform/x86/amd/Kconfig
>>> +++ b/drivers/platform/x86/amd/Kconfig
>>> @@ -34,6 +34,17 @@ config AMD_WBRF
>>>            This mechanism will only be activated on platforms that adv=
ertise a
>>>            need for it.
>>>
>>> +config AMD_HALO_LED
>>> +       tristate "AMD Halo Box RGB LED Driver"
>>> +       depends on ACPI_WMI && LEDS_CLASS_MULTICOLOR
>>> +       help
>>> +         This driver provides RGB LED control for AMD Halo Box device=
s
>>> +         through the LED multicolor subsystem. The Halo Box light bar=
 can
>>> +         be controlled via sysfs to display any RGB color combination=
.
>>> +
>>> +         To compile this driver as a module, choose M here: the modul=
e
>>> +         will be called amd_halo_led.
>>> +
>>>   config AMD_ISP_PLATFORM
>>>          tristate "AMD ISP4 platform driver"
>>>          depends on I2C && X86_64 && ACPI diff --git
>>> a/drivers/platform/x86/amd/Makefile
>>> b/drivers/platform/x86/amd/Makefile
>>> index f6ff0c837f34..2f467dbbfc8a 100644
>>> --- a/drivers/platform/x86/amd/Makefile
>>> +++ b/drivers/platform/x86/amd/Makefile
>>> @@ -10,5 +10,6 @@ obj-$(CONFIG_AMD_PMC)         +=3D pmc/
>>>   obj-$(CONFIG_AMD_HSMP)         +=3D hsmp/
>>>   obj-$(CONFIG_AMD_PMF)          +=3D pmf/
>>>   obj-$(CONFIG_AMD_WBRF)         +=3D wbrf.o
>>> +obj-$(CONFIG_AMD_HALO_LED)     +=3D amd_halo_led.o
>>>   obj-$(CONFIG_AMD_ISP_PLATFORM) +=3D amd_isp4.o
>>>   obj-$(CONFIG_AMD_HFI)          +=3D hfi/
>>> diff --git a/drivers/platform/x86/amd/amd_halo_led.c
>>> b/drivers/platform/x86/amd/amd_halo_led.c
>>> new file mode 100644
>>> index 000000000000..12188571c7d9
>>> --- /dev/null
>>> +++ b/drivers/platform/x86/amd/amd_halo_led.c
>>> @@ -0,0 +1,222 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * AMD Halo Box RGB LED Driver
>>> + *
>>> + * Copyright (C) 2026 Advanced Micro Devices, Inc.
>>> + *
>>> + * This driver provides RGB LED control for AMD Halo Box devices
>>> +through
>>> + * the LED multicolor subsystem. The Halo Box light bar can be
>>> +controlled
>>> + * via sysfs to display any RGB color combination.
>>> + */
>>> +
>>> +#include <linux/acpi.h>
>>> +#include <linux/led-class-multicolor.h> #include <linux/leds.h>
>>> +#include <linux/module.h> #include <linux/mutex.h> #include
>>> +<linux/unaligned.h> #include <linux/wmi.h>
>>> +
>>> +#define AMD_HALO_GUID "081E747B-E028-4232-AF24-EAAEAB2B1E86"
>>> +
>>> +/* WMI method IDs from MOF */
>>> +enum {
>>> +       AMD_HALO_WMI_GET_LIGHTBAR =3D 0x01,
>>> +       AMD_HALO_WMI_SET_LIGHTBAR,
>>> +       AMD_HALO_WMI_TURN_ON,
>>> +       AMD_HALO_WMI_TURN_OFF
>>
>> v2 has turn_off calls removed but the enums are not updated.
>>
>> AMD_HALO_WMI_TURN_ON/OFF values are not in use.
>=20
> Will remove this in the next version

I think this is an error, turning the LED on and off should be done by=20
the driver when setting the brightness. I suggest that the LED is turned=
=20
on when the brightness is greater than 0, otherwise it is turned off.

Thanks,
Armin Wolf

>=20
>>
>>> +};
>>> +
>>> +/* Channel selectors for Arg0 */
>>> +enum {
>>> +       AMD_HALO_CHANNEL_RED =3D 0x01,
>>> +       AMD_HALO_CHANNEL_GREEN,
>>> +       AMD_HALO_CHANNEL_BLUE
>>> +};
>>> +
>>> +/* Status codes from spec */
>>> +#define AMD_HALO_STATUS_SUCCESS                0x0000
>>> +#define AMD_HALO_STATUS_INVALID_PARAM  0xFFFD
>>
>> This macro is not used. Please see below for more comments.
>=20
> Ok, will (see below) keep this macro and do what you suggested.
>=20
>>
>>> +
>>> +/* Brightness uses 0-100 range */
>>> +#define AMD_HALO_MAX_HW_BRIGHTNESS     100
>>> +
>>> +/* Default RGB brightness */
>>> +#define AMD_HALO_DEFAULT_RED           50
>>> +#define AMD_HALO_DEFAULT_GREEN         30
>>> +#define AMD_HALO_DEFAULT_BLUE          30
>>
>> 50/30/30 means a reddish-orange on the startup. Intentional? Should it =
be just
>> 50/50/50 to look white?
>=20
> It is intentional. They are tuned this way to compensate the color-filte=
ring from the materials of the chassis. This is actually much closer to wh=
ite than the values might appear to be at first look.
>=20
>>
>>> +
>>> +/**
>>> + * struct amd_halo_led_data - Driver private data
>>> + * @wdev: WMI device pointer
>>> + * @led_mc: LED multicolor class device
>>> + * @subled_info: RGB channel information
>>> + * @lock: Mutex to protect WMI calls
>>> + */
>>> +struct amd_halo_led_data {
>>> +       struct wmi_device *wdev;
>>> +       struct led_classdev_mc led_mc;
>>> +       struct mc_subled subled_info[3];
>>> +       struct mutex lock;      /* Protects WMI method calls */
>>> +};
>>> +
>>> +struct amd_halo_wmi_args {
>>> +       u32 arg0;
>>> +       u32 arg1;
>>> +};
>>> +
>>> +/**
>>> + * amd_halo_wmi_set_channel - Set a single RGB channel value
>>> + * @wdev: WMI device pointer
>>> + * @channel: Channel selector (1=3DRed, 2=3DGreen, 3=3DBlue)
>>> + * @brightness: brightness to set (0-100)
>>> + *
>>> + * Return: 0 on success, negative error code on failure  */ static
>>> +int amd_halo_wmi_set_channel(struct wmi_device *wdev, u32 channel,
>>> +                                   u32 brightness) {
>>> +       struct amd_halo_wmi_args args =3D {
>>> +               .arg0 =3D channel,
>>> +               .arg1 =3D brightness,
>>> +       };
>>> +       struct wmi_buffer input =3D {
>>> +               .length =3D sizeof(args),
>>> +               .data =3D &args,
>>> +       };
>>> +       struct wmi_buffer output =3D { 0 };
>>> +       u16 result_status;
>>> +       int ret;
>>> +
>>> +       /* Validate input per spec */
>>> +       if (channel < AMD_HALO_CHANNEL_RED ||
>>> +           channel > AMD_HALO_CHANNEL_BLUE ||
>>> +           brightness > AMD_HALO_MAX_HW_BRIGHTNESS)
>>> +               return -EINVAL;
>>> +
>>> +       ret =3D wmidev_invoke_method(wdev, 0, AMD_HALO_WMI_SET_LIGHTBA=
R,
>>> +                                       &input, &output, sizeof(result=
_status));
>>> +       if (ret)
>>> +               return ret;
>>> +
>>> +       /* Return buffer per spec: Bytes[0:1] =3D Status (little-endia=
n) */
>>> +       result_status =3D get_unaligned_le16(output.data);

The WMI driver core already ensures that the le16 is properly aligned,=20
you can safely cast output.data to a __le16 * and then use le16_to_cpu().

>>> +       ret =3D (result_status =3D=3D AMD_HALO_STATUS_SUCCESS) ? 0 : -=
EIO;
>>
>> AMD_HALO_STATUS_INVALID_PARAM macro usage could be something like this?
>>
>> if (result_status =3D=3D AMD_HALO_STATUS_SUCCESS)
>>      ret =3D 0;
>> else if (result_status =3D=3D AMD_HALO_STATUS_INVALID_PARAM)
>>      ret =3D -EINVAL;
>> else
>>      ret =3D -EIO
>>
>> if no, the macro can be entirely dropped.
>=20
> Will keep the macro and do this in the next version.

I would prefer if we could avoid having a macro that affects control=20
flow, a inline function that turns the status code into a errno
is better.

>=20
>>
>>> +
>>> +       kfree(output.data);
>>> +       return ret;
>>> +}
>>> +
>>> +/**
>>> + * amd_halo_brightness_set - Set LED brightness and color
>>> + * @cdev: LED class device
>>> + * @brightness: Brightness value
>>> + *
>>> + * Return: 0 on success, negative error code on failure  */ static
>>> +int amd_halo_brightness_set(struct led_classdev *cdev,
>>> +                                  enum led_brightness brightness) {
>>> +       struct led_classdev_mc *mc_cdev =3D lcdev_to_mccdev(cdev);
>>> +       struct amd_halo_led_data *data =3D container_of(mc_cdev,
>>> +                                                      struct amd_halo=
_led_data,
>>> +                                                      led_mc);
>>> +       u32 red_hw, green_hw, blue_hw;
>>> +       int ret;
>>> +
>>> +       guard(mutex)(&data->lock);
>>> +
>>> +       led_mc_calc_color_components(mc_cdev, brightness);
>>> +       red_hw =3D mc_cdev->subled_info[0].brightness;
>>> +       green_hw =3D mc_cdev->subled_info[1].brightness;
>>> +       blue_hw =3D mc_cdev->subled_info[2].brightness;
>>> +
>>> +       /* Set each channel individually - 3 WMI calls required */
>>> +       ret =3D amd_halo_wmi_set_channel(data->wdev,
>> AMD_HALO_CHANNEL_RED,
>>> +                                      red_hw);
>>> +       if (ret)
>>> +               return ret;
>>> +
>>> +       ret =3D amd_halo_wmi_set_channel(data->wdev,
>> AMD_HALO_CHANNEL_GREEN,
>>> +                                      green_hw);
>>> +       if (ret)
>>> +               return ret;
>>> +
>>> +       return amd_halo_wmi_set_channel(data->wdev,
>> AMD_HALO_CHANNEL_BLUE,
>>> +                                       blue_hw);
>>
>> what if one of the above set_channel fails? 3 things I can think of:
>>
>> - Restore previous state on failure, or
>> - Accept partial updates (current behavior), or
>> - Add a comment documenting this is intentional
>=20
> Not sure if it's a good idea to use the same (already failing) WMI metho=
d to recover the WMI error here, but I guess it's probably better than not=
 recovering it at all. Will add the recovery logic in the next version.
>=20
>>
>>> +}
>>> +
>>> +/**
>>> + * amd_halo_probe - Driver probe function
>>> + * @wdev: WMI device
>>> + * @context: Context data (unused)
>>> + *
>>> + * Return: 0 on success, negative error code on failure  */ static
>>> +int amd_halo_probe(struct wmi_device *wdev, const void *context) {
>>> +       struct led_init_data led_init_data =3D {
>>> +               .devicename =3D "amd_halo",
>>> +               .default_label =3D "multicolor:" LED_FUNCTION_STATUS,
>>> +               .devname_mandatory =3D true
>>> +       };
>>> +       struct amd_halo_led_data *data;
>>> +       int ret;
>>> +
>>> +       data =3D devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
>>> +       if (!data)
>>> +               return -ENOMEM;
>>> +
>>> +       data->wdev =3D wdev;
>>> +       mutex_init(&data->lock);
>>> +       dev_set_drvdata(&wdev->dev, data);
>>> +
>>> +       data->subled_info[0].color_index =3D LED_COLOR_ID_RED;
>>> +       data->subled_info[1].color_index =3D LED_COLOR_ID_GREEN;
>>> +       data->subled_info[2].color_index =3D LED_COLOR_ID_BLUE;
>>> +       data->subled_info[0].intensity =3D AMD_HALO_DEFAULT_RED;
>>> +       data->subled_info[1].intensity =3D AMD_HALO_DEFAULT_GREEN;
>>> +       data->subled_info[2].intensity =3D AMD_HALO_DEFAULT_BLUE;
>>> +
>>> +       data->led_mc.led_cdev.brightness =3D AMD_HALO_MAX_HW_BRIGHTNES=
S;
>>> +       data->led_mc.led_cdev.max_brightness =3D
>> AMD_HALO_MAX_HW_BRIGHTNESS;
>>> +       data->led_mc.led_cdev.brightness_set_blocking =3D
>> amd_halo_brightness_set;
>>> +       data->led_mc.led_cdev.flags =3D LED_CORE_SUSPENDRESUME |
>>> + LED_RETAIN_AT_SHUTDOWN;
>>
>> Are these suspend/resume flags required?
>>
>> Does the hardware retain LED state across suspend/resume, or does the L=
ED core
>> need to restore it?
>=20
> BIOS may change LED color during suspend, so this has to be restored aft=
er a resume.
>=20
>>
>>> +       data->led_mc.num_colors =3D ARRAY_SIZE(data->subled_info);
>>> +       data->led_mc.subled_info =3D data->subled_info;
>>> +
>>> +       ret =3D amd_halo_brightness_set(&data->led_mc.led_cdev,
>>> +                                     AMD_HALO_MAX_HW_BRIGHTNESS);
>>
>> brightness_set is called before the LED registration. Is this intention=
al?
>=20
> It is intentional. For some reasons, the WMI values returned from BIOS w=
on't be accurate after a cold boot, so set them to some known values here.

I dont know if reusing the callback with a partially uninitalized LED=20
device is a good idea. Why not manually calling=20
amd_halo_wmi_set_channel() and friends?

Thanks,
Armin Wolf

>=20
>>
>>> +       if (ret)
>>> +               return dev_err_probe(&wdev->dev, ret,
>>> +                                    "Failed to set default LED
>>> + colors\n");
>>> +
>>> +       ret =3D devm_led_classdev_multicolor_register_ext(&wdev->dev, =
&data-
>>> led_mc,
>>> +                                                       &led_init_data=
);
>>> +       if (ret)
>>> +               return dev_err_probe(&wdev->dev, ret,
>>> +                                    "Failed to register multicolor LE=
D\n");
>>> +       return 0;
>>> +}
>>> +
>>> +static const struct wmi_device_id amd_halo_id_table[] =3D {
>>> +       { .guid_string =3D AMD_HALO_GUID },
>>> +       { }
>>> +};
>>> +MODULE_DEVICE_TABLE(wmi, amd_halo_id_table);
>>> +
>>> +static struct wmi_driver amd_halo_driver =3D {
>>> +       .driver =3D {
>>> +               .name =3D "amd_halo_led",
>>> +       },
>>> +       .id_table =3D amd_halo_id_table,
>>> +       .probe =3D amd_halo_probe,
>>> +       .no_singleton =3D true,
>>> +};
>>> +
>>> +module_wmi_driver(amd_halo_driver);
>>> +
>>> +MODULE_AUTHOR("Mario Limonciello (AMD) <superm1@kernel.org>");
>>> +MODULE_AUTHOR("Leo Lin <Leo.Lin@amd.com>");
>> MODULE_DESCRIPTION("AMD
>>> +Halo Box RGB LED Control Driver"); MODULE_LICENSE("GPL");
>>>
>>> ---
>>> base-commit: 39704f00f747aba3144289870b5fd8ac230a9aaf
>>> change-id: 20260429-halo-leds-v2-plus-722c8083afe8
>>>
>>> Best regards,
>>> --
>>> Yo-Jung Leo Lin (AMD) <leo.lin@amd.com>
>>>
>>>
>=20

