Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1662701D9;
	Sun, 11 Oct 2026 00:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791679993; cv=none; b=WTSR4/Vbaq/6Zt0ln2l6UY0ndIc5d2RdIvaAOy+eeuVu8FAca3SvW16EhrVMd/fBGlQN0mu1jlbSInKMB2mzMUrgM/CufN8U9KqAgx6vihRc8X/QPeNBjMZBtla3mHUOKAqM6V16ZbwNNF2+FJ565zSRMGyKe92KvCUOeBqx8xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791679993; c=relaxed/simple;
	bh=lMiXQ4eWPksa7CPVfwH0uIIK+xv7NOu5IqI11dATdUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ryEXcp0llhjEyvvXORoUHqV/Y48VwgbkX7iDFFp9Ekx7xmDkYnAFud/g1XQQ6yim6x1hFTZnWwfjR2oqTAIoVdnOpnRqq+xp281iRSAIOeqnQuKaIpSbHY3puaugr4QYvj3OStuPu5/HQcVlaK6eDJBTOSecbpjSofbVU+TDTbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=k2AbOOFk; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="k2AbOOFk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1791679977; x=1792284777; i=w_armin@gmx.de;
	bh=oKwDWveLeKsFarfEGQeFrEyWyh9CSzNtAIVGyXQP1dg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=k2AbOOFkx+4GPYeFxk5wBM6KKF6ky9bczifjShGEr0zTYRnImPOrEIB4bKHx5dtV
	 o4ytYjk4SkIth96pcpBvFqWhULR7yRXa21RHHCTlkTvGJacI3f+zUI+cZfgpV0zPu
	 6to12VBfy/ySq2qKtyqM3SfRbBziGiwUKgURkScs3XjIko2vQuQAlbyqB6r8rjQYh
	 IVHcoJCxbh93wYiOVPFLmuoXShh0FZ1SXms30DbL2zYPRNt7Nt/+oZ1PxIloDb4Iv
	 dKauTN4M+Yo712z/fuLYzaWdzzYV3MZAutBvhiVV780Pry8uEacAN9U8jBu/BZOfa
	 /IbOlMJBFIGUjIlx7g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGhuU-1xSNFj1Jf0-00GItV; Sun, 11
 Oct 2026 02:52:57 +0200
Message-ID: <9087d109-d757-43bc-b80d-64df7dc9ff82@gmx.de>
Date: Sun, 11 Oct 2026 02:52:55 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] platform/x86: uniwill-laptop: Implement rainbow
 animation as trigger
To: Rong Zhang <i@rong.moe>, hansg@kernel.org, ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261007144101.323289-1-W_Armin@gmx.de>
 <20261007144101.323289-3-W_Armin@gmx.de>
 <035799dd461fe0e7a60564e11f10fd23eb3daabf.camel@rong.moe>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <035799dd461fe0e7a60564e11f10fd23eb3daabf.camel@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:k0us9+TluBv/WxkFPVwyw4MdxQdohdokeVfx7sKZH5MxXeaEPPo
 C98Okr15ZDTPq5N/6O2J8UVqSBN4MEi9ZXKI0gR2fal7s9fZlomLk9BQUFv3ZS/LErCNPhd
 TOm2GD8uSfr88pM6FGVLUl3h8SacaodwjzIxLuhLMQ6KuJC2hOahGCIjVgjKKqtdpiZvduY
 bEvo7fSSGMivGfyHE+sEg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XgBy83yGGc8=;y9bG5gX5eks3Csv1vv4JOejE3s3
 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
 =

Am 10.10.26 um 13:20 schrieb Rong Zhang:

> Hi Armin,
>
> On Wed, 2026-10-07 at 16:38 +0200, Armin Wolf wrote:
>> It turns out that some models require the lightbar to be activated
>> in order to display the rainbow animation, so users have to access
>> both the "rainbow_animation" sysfs attribute and the LED sysfs
>> interface when enabling the rainbow animation. This can cause short
>> glitches when the lightbar was previously disabled.
>>
>> Fix this by replacing the sysfs attribute with a custom LED trigger
>> called "uniwill-rainbow". Selecting this trigger will atomically
>> activate the lightbar and enable the rainbow animation mode. This
>> can potentially break userspace applications using the old sysfs
>> attribute, but so far no such application is known to exist (yet).
>>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   .../ABI/removed/sysfs-driver-uniwill-laptop   |  10 ++
>>   .../ABI/testing/sysfs-driver-uniwill-laptop   |  11 --
>>   .../admin-guide/laptops/uniwill-laptop.rst    |   5 +-
>>   MAINTAINERS                                   |   1 +
>>   drivers/platform/x86/uniwill/Kconfig          |   1 +
>>   drivers/platform/x86/uniwill/uniwill-acpi.c   | 133 +++++++++++------=
-
>>   6 files changed, 95 insertions(+), 66 deletions(-)
>>   create mode 100644 Documentation/ABI/removed/sysfs-driver-uniwill-lap=
top
>>
>> diff --git a/Documentation/ABI/removed/sysfs-driver-uniwill-laptop b/Do=
cumentation/ABI/removed/sysfs-driver-uniwill-laptop
>> new file mode 100644
>> index 000000000000..c226efc23b59
>> --- /dev/null
>> +++ b/Documentation/ABI/removed/sysfs-driver-uniwill-laptop
>> @@ -0,0 +1,10 @@
>> +What:		/sys/bus/platform/devices/INOU0000:XX/rainbow_animation
>> +Date:		November 2025
>> +KernelVersion:	6.19
>> +Contact:	Armin Wolf <W_Armin@gmx.de>
>> +Description:
>> +		Forces the integrated lightbar to display a rainbow animation when t=
he machine
>> +		is not suspended. Writing "1"/"0" into this file enables/disables th=
is
>> +		functionality.
>> +
>> +		Reading this file returns the current status of the rainbow animatio=
n functionality.
> It'd be more helpful by documenting the removal date, version and what
> has replaced it.

True, i will write a patch to address this.

>> diff --git a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop b/Do=
cumentation/ABI/testing/sysfs-driver-uniwill-laptop
>> index 943f92c6b561..b9b9feebe2ed 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>> +++ b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>> @@ -29,17 +29,6 @@ Description:
>>   		Reading this file returns the current enable status of the touchpad=
 toggle
>>   		functionality.
>>  =20
>> -What:		/sys/bus/platform/devices/INOU0000:XX/rainbow_animation
>> -Date:		November 2025
>> -KernelVersion:	6.19
>> -Contact:	Armin Wolf <W_Armin@gmx.de>
>> -Description:
>> -		Forces the integrated lightbar to display a rainbow animation when t=
he machine
>> -		is not suspended. Writing "1"/"0" into this file enables/disables th=
is
>> -		functionality.
>> -
>> -		Reading this file returns the current status of the rainbow animatio=
n functionality.
>> -
>>   What:		/sys/bus/platform/devices/INOU0000:XX/breathing_in_suspend
>>   Date:		November 2025
>>   KernelVersion:	6.19
>> diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst b/Doc=
umentation/admin-guide/laptops/uniwill-laptop.rst
>> index be50b45b82ef..aaf50e3074c1 100644
>> --- a/Documentation/admin-guide/laptops/uniwill-laptop.rst
>> +++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
>> @@ -74,8 +74,9 @@ Lightbar
>>   The ``uniwill-laptop`` driver exposes the lightbar found on some mode=
ls as a standard multicolor
>>   LED class device. The default name of this LED class device is ``uniw=
ill:multicolor:status``.
>>  =20
>> -See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details =
on how to control the various
>> -animation modes of the lightbar.
>> +The lightbar supports a separate rainbow animation mode that can be en=
abled by selecting the
>> +`uniwill-rainbow` LED trigger. To enable a breathing animation during =
suspend, see
>> +Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details.
>>  =20
>>   Keyboard Backlight
>>   ------------------
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index fa0571a5e479..f9dd979d0fa7 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -28106,6 +28106,7 @@ UNIWILL LAPTOP DRIVER
>>   M:	Armin Wolf <W_Armin@gmx.de>
>>   L:	platform-driver-x86@vger.kernel.org
>>   S:	Maintained
>> +F:	Documentation/ABI/removed/sysfs-driver-uniwill-laptop
>>   F:	Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>>   F:	Documentation/admin-guide/laptops/uniwill-laptop.rst
>>   F:	Documentation/wmi/devices/uniwill-laptop.rst
>> diff --git a/drivers/platform/x86/uniwill/Kconfig b/drivers/platform/x8=
6/uniwill/Kconfig
>> index d07cc8440188..f80794bdfaef 100644
>> --- a/drivers/platform/x86/uniwill/Kconfig
>> +++ b/drivers/platform/x86/uniwill/Kconfig
>> @@ -28,6 +28,7 @@ config UNIWILL_LAPTOP
>>   	depends on DMI
>>   	select REGMAP
>>   	select INPUT_SPARSEKMAP
>> +	select LEDS_TRIGGERS
>>   	help
>>   	  This driver adds support for various extra features found on Uniwi=
ll laptops,
>>   	  like the lightbar, hwmon sensors and hotkeys. It also supports man=
y OEM laptops
>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/plat=
form/x86/uniwill/uniwill-acpi.c
>> index 788bf4064d34..0fb0d267664a 100644
>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> @@ -900,51 +900,6 @@ static ssize_t touchpad_toggle_enable_show(struct =
device *dev, struct device_att
>>  =20
>>   static DEVICE_ATTR_RW(touchpad_toggle_enable);
>>  =20
>> -static ssize_t rainbow_animation_store(struct device *dev, struct devi=
ce_attribute *attr,
>> -				       const char *buf, size_t count)
>> -{
>> -	struct uniwill_data *data =3D dev_get_drvdata(dev);
>> -	unsigned int value;
>> -	bool enable;
>> -	int ret;
>> -
>> -	ret =3D kstrtobool(buf, &enable);
>> -	if (ret < 0)
>> -		return ret;
>> -
>> -	if (enable)
>> -		value =3D LIGHTBAR_WELCOME;
>> -	else
>> -		value =3D 0;
>> -
>> -	guard(mutex)(&data->led_lock);
>> -
>> -	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, LI=
GHTBAR_WELCOME, value);
>> -	if (ret < 0)
>> -		return ret;
>> -
>> -	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL, L=
IGHTBAR_WELCOME, value);
>> -	if (ret < 0)
>> -		return ret;
>> -
>> -	return count;
>> -}
>> -
>> -static ssize_t rainbow_animation_show(struct device *dev, struct devic=
e_attribute *attr, char *buf)
>> -{
>> -	struct uniwill_data *data =3D dev_get_drvdata(dev);
>> -	unsigned int value;
>> -	int ret;
>> -
>> -	ret =3D regmap_read(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, &value);
>> -	if (ret < 0)
>> -		return ret;
>> -
>> -	return sysfs_emit(buf, "%d\n", !!(value & LIGHTBAR_WELCOME));
>> -}
>> -
>> -static DEVICE_ATTR_RW(rainbow_animation);
>> -
>>   static ssize_t breathing_in_suspend_store(struct device *dev, struct =
device_attribute *attr,
>>   					  const char *buf, size_t count)
>>   {
>> @@ -1258,7 +1213,6 @@ static struct attribute *uniwill_attrs[] =3D {
>>   	&dev_attr_super_key_enable.attr,
>>   	&dev_attr_touchpad_toggle_enable.attr,
>>   	/* Lightbar-related */
>> -	&dev_attr_rainbow_animation.attr,
>>   	&dev_attr_breathing_in_suspend.attr,
>>   	/* Power-management-related */
>>   	&dev_attr_ctgp_offset.attr,
>> @@ -1288,8 +1242,7 @@ static umode_t uniwill_attr_is_visible(struct kob=
ject *kobj, struct attribute *a
>>   			return attr->mode;
>>   	}
>>  =20
>> -	if (attr =3D=3D &dev_attr_rainbow_animation.attr ||
>> -	    attr =3D=3D &dev_attr_breathing_in_suspend.attr) {
>> +	if (attr =3D=3D &dev_attr_breathing_in_suspend.attr) {
>>   		if (uniwill_device_supports(data, UNIWILL_FEATURE_LIGHTBAR))
>>   			return attr->mode;
> It'd be better to convert breathing_in_suspend into an LED device
> attribute. See led_classdev->groups.

We cannot do this because this field is being used by the multicolor LED c=
lass.
I can try to find a workaround for this.

>>   	}
>> @@ -1537,6 +1490,59 @@ static int uniwill_led_brightness_set(struct led=
_classdev *led_cdev, enum led_br
>>   	return regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL, L=
IGHTBAR_S0_OFF, value);
>>   }
>>  =20
>> +static int uniwill_led_hw_control_set(struct led_classdev *led_cdev, u=
nsigned long flags)
>> +{
>> +	struct led_classdev_mc *led_mc_cdev =3D lcdev_to_mccdev(led_cdev);
>> +	struct uniwill_data *data =3D container_of(led_mc_cdev, struct uniwil=
l_data, led_mc_cdev);
>> +	unsigned int value;
>> +	int ret;
>> +
>> +	guard(mutex)(&data->led_lock);
>> +
>> +	if (flags)
>> +		value =3D LIGHTBAR_WELCOME;
>> +	else
>> +		value =3D LIGHTBAR_S0_OFF;
>> +
>> +	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL,
>> +				 LIGHTBAR_S0_OFF | LIGHTBAR_WELCOME, value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret =3D regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL,
>> +				 LIGHTBAR_S0_OFF | LIGHTBAR_WELCOME, value);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	/* The LED is always on during hw control */
>> +	led_cdev->brightness =3D flags;
>> +
>> +	return 0;
>> +}
>> +
>> +static int uniwill_lightbar_trigger_activate(struct led_classdev *led_=
cdev)
>> +{
>> +	return led_cdev->hw_control_set(led_cdev, 1);
>> +}
>> +
>> +static void uniwill_lightbar_trigger_deactivate(struct led_classdev *l=
ed_cdev)
>> +{
>> +	int ret;
>> +
>> +	ret =3D led_cdev->hw_control_set(led_cdev, 0);
>> +	if (ret < 0)
>> +		dev_err(led_cdev->dev, "Failed to stop rainbow animation: %d\n", ret=
);
>> +}
>> +
>> +static struct led_hw_trigger_type uniwill_lightbar_trigger_type;
>> +
>> +static struct led_trigger uniwill_lightbar_trigger =3D {
>> +	.name =3D "uniwill-rainbow",
>> +	.activate =3D uniwill_lightbar_trigger_activate,
>> +	.deactivate =3D uniwill_lightbar_trigger_deactivate,
>> +	.trigger_type =3D &uniwill_lightbar_trigger_type,
>> +};
>> +
>>   #define LIGHTBAR_MASK	(LIGHTBAR_APP_EXISTS | LIGHTBAR_S0_OFF | LIGHTB=
AR_S3_OFF | LIGHTBAR_WELCOME)
>>  =20
>>   static int uniwill_led_init(struct uniwill_data *data)
>> @@ -1587,12 +1593,18 @@ static int uniwill_led_init(struct uniwill_data=
 *data)
>>   	data->led_mc_cdev.led_cdev.max_brightness =3D 1;
>>   	data->led_mc_cdev.led_cdev.flags =3D LED_REJECT_NAME_CONFLICT;
>>   	data->led_mc_cdev.led_cdev.brightness_set_blocking =3D uniwill_led_b=
rightness_set;
>> +	data->led_mc_cdev.led_cdev.trigger_type =3D &uniwill_lightbar_trigger=
_type;
>> +	data->led_mc_cdev.led_cdev.hw_control_trigger =3D uniwill_lightbar_tr=
igger.name;
>> +	data->led_mc_cdev.led_cdev.hw_control_set =3D uniwill_led_hw_control_=
set;
> A private trigger does not need hw_control_set, which is only meant to
> coordinate between different drivers, i.e., in the case when the LED
> device and the hardware control trigger are located at different drivers=
.
>
> I've also updated the documentation in commit 8e04e5382aa9 ("leds:
> trigger: Add hw_offloaded() callback and provide
> trigger_may_offload_to_hw attribute"), quoted below:
>
>     Alternatively, a private trigger can be implemented along with the L=
ED
>     driver if the LED's hardware control doesn't fit any generic trigger=
. To
>     associate the private trigger with the LED classdev, their `trigger_=
type`
>     must be the same. To declare that the private trigger provides hardw=
are
>     control for the associated LED classdev, set the `hw_control_trigger=
`
>     string to the trigger's name. Since both the LED classdev and the pr=
ivate
>     trigger are in the same LED driver, it's not necessary for them to
>     coordinate via `hw_control_*` callbacks.
>
> I'd suggest calling uniwill_led_hw_control_set() directly from the
> trigger's [de]activate callbacks, just like other drivers.

I decided to use this callbacks in order to be able to add support for the=
 keyboard backlight
animation in the future (if we someday find a device that supports this fe=
ature).

>>  =20
>>   	if (value & LIGHTBAR_S0_OFF)
>>   		data->led_mc_cdev.led_cdev.brightness =3D 0;
>>   	else
>>   		data->led_mc_cdev.led_cdev.brightness =3D 1;
>>  =20
>> +	if (value & LIGHTBAR_WELCOME)
> Check !LIGHTBAR_S0_OFF too?
>
> If the last state is LIGHTBAR_S0_OFF|LIGHTBAR_WELCOME (probably caused b=
y
> an outdated driver without this patch), the trigger's activate callback
> will be called on probe, lighting up the previously off LED. Is this
> intentional?
>
> Thanks,
> Rong

Yes, this is intentional. LIGHTBAR_WELCOME implies !LIGHTBAR_S0_OFF, some =
devices
even assume this.

Thanks,
Armin Wolf

>> +		data->led_mc_cdev.led_cdev.default_trigger =3D uniwill_lightbar_trig=
ger.name;
>> +
>>   	for (int i =3D 0; i < LED_CHANNELS; i++) {
>>   		data->led_mc_subled_info[i].color_index =3D color_indices[i];
>>  =20
>> @@ -3540,17 +3552,31 @@ static int __init uniwill_init(void)
>>   		pr_warn("Enabling potentially unsupported features\n");
>>   	}
>>  =20
>> -	ret =3D platform_driver_register(&uniwill_driver);
>> +	/*
>> +	 * We cannot register the trigger inside the .probe callback of the
>> +	 * platform driver, because each trigger needs a unique name.
>> +	 */
>> +	ret =3D led_trigger_register(&uniwill_lightbar_trigger);
>>   	if (ret < 0)
>>   		return ret;
>>  =20
>> +	ret =3D platform_driver_register(&uniwill_driver);
>> +	if (ret < 0)
>> +		goto err_platform;
>> +
>>   	ret =3D uniwill_wmi_register_driver();
>> -	if (ret < 0) {
>> -		platform_driver_unregister(&uniwill_driver);
>> -		return ret;
>> -	}
>> +	if (ret < 0)
>> +		goto err_wmi;
>>  =20
>>   	return 0;
>> +
>> +err_wmi:
>> +	platform_driver_unregister(&uniwill_driver);
>> +
>> +err_platform:
>> +	led_trigger_unregister(&uniwill_lightbar_trigger);
>> +
>> +	return ret;
>>   }
>>   module_init(uniwill_init);
>>  =20
>> @@ -3558,6 +3584,7 @@ static void __exit uniwill_exit(void)
>>   {
>>   	uniwill_wmi_unregister_driver();
>>   	platform_driver_unregister(&uniwill_driver);
>> +	led_trigger_unregister(&uniwill_lightbar_trigger);
>>   }
>>   module_exit(uniwill_exit);
>>  =20
