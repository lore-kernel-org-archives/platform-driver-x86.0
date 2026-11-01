Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793553794;
	b=W3b6kkWaFSLpEi9NWntTI+IMmyLy9RdQw4hJKfUrRJ4gfa2f0VoCRiiLaMzSfUfzXk9o
	 EXDE+152N+/rdvl0eWYthcHTv7d4B2cvhlXufw8XfMFwQSsvPk3nQirMtDaHzmwiyZLGa
	 764jApeXprg/FkUj+NDBVeTx51eVYF6dXiGDh00o+y7Ybuht/f7wXcZKwTxR/BPah0aCC
	 D/Zrw7NHS9U02s+Kupl8wXJM2NwCrLhNk36/CnFxKmzAe5/it0jm5+6VQo45vi+A0TrW7
	 a4j6IaamdeI2TOwCHSwT+bSm6r8iM6DRo3eJDp8DD7cp0MCKA71gQlh73QVhjzjHXVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793553794;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=rjlm1NLd/OJojriPp5I3Kir/LDQArxR6bfxyFOtWTE8=;
	b=GK8FEW6Jq7SIXM/VTIUzCDNJDp/M+U8b8Yo6vYMXkirA5uY1ScS+EppPLLmHdLIuPpxK
	 S4yhDmQogYOZ0fdgDHMnRD2wO54Ax7z00XxyPJ224MvHsUfzcXke82jGkjRq4U1VI/Deo
	 Qt5kn1dKYJ4IoPikoV0ire0dCL1mfJdWFx6jcwGpNGJogTFQekQEBBqz4i8D6z49t7oRr
	 rH5BuEhxdctUXuPEiQ2LaokpPJ7tVJMiGPRIyNjB+3gHtkXywCkljfojZXIHaXBl/kT8I
	 hYBygg/s0LUW3YuCbye1tzR3scRsQyVx118oIGJscZp0260kMAXPHLHeErhwW9HqoWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=quNyzMbh;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FB4606A324;
	Sun,  1 Nov 2026 17:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83FB4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=quNyzMbh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1793553791; x=1794158591; i=w_armin@gmx.de;
	bh=rjlm1NLd/OJojriPp5I3Kir/LDQArxR6bfxyFOtWTE8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=quNyzMbhkqA6PqoqTgxgeTyfjFnNEk8YP3ISUv1X5TIXw0lKkr9VSoXbAwM3gbII
	 gB7Mbb3VqBingYEnSVLDVHkWWLFlCvkC7YJYzlHdmKrbtSeeoQZZ2cERwoDIQgA/Z
	 fg50MVz8XfjnzfHYGFNd5Nayydyk6xfpZeaa4tLylmXI4ACOmy0ytG+Y/pNxDGJee
	 JVVjvnPFK2s65HcJxiK0DBSEmvrpw32uXdcQxspwC97TzhxeO6dR5eurt8HFD3E22
	 0arvs7ftcb+1fltA9rCXDEIlhvI7o0LOIv9V0jMLOz4caYI28O3dLGiMxOUOEGXPY
	 WM7vuqSrbUfgyptpwA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MpUUm-1wlA2N1Alw-00j2dw; Sun, 01
 Nov 2026 18:23:11 +0100
Message-ID: <b5c60864-f081-4b39-9ccb-cc86af90827b@gmx.de>
Date: Sun, 1 Nov 2026 18:23:09 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86: uniwill: Add platform profile support
To: dydydd <admin@qb.edu.kg>
Cc: Hans de Goede <hansg@kernel.org>,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023034822.141263-1-admin@qb.edu.kg>
 <20261023034822.141263-2-admin@qb.edu.kg>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20261023034822.141263-2-admin@qb.edu.kg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jJBTd7tms8VUKqXwbvA1I+Rzu4QbfvOBK4TR7OqNp6xnDKW2iWS
 uMyfkR5ufBezCVgfI69ory0mgHVoTCfBToTtg0DzSub+Sk6YMI2Bt2T9HC3ce1gCP07PvPi
 Feq8fYWBeJtj0eeXUtb+aArzX1yzo8STnTLyysLlsGBjcAj0uwrNroY7/6KLcxaDb8onc7G
 vwWHw4vTFu0xBPy17Cv0A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7zVLdH38BEg=;p3LkDaSuWtEg61cLNNCFQGERRM2
 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
 VEo7hgldC9f/1VFin6w==

Am 23.10.26 um 05:48 schrieb dydydd:

> The EC exposes PL1/PL2/PL4 registers, but the driver did not provide any
> way to change them, so the admin guide stated that platform profile
> support was not implemented.
>
> Add a standard platform_profile device that writes the three power limit
> registers. The values are per-machine, so they are stored in the device
> descriptor instead of being hardcoded in the profile code, and machines
> without known values do not register the interface at all.
>
> The EC only latches writes to these registers while manual control (bit =
0
> of EC_ADDR_AP_OEM) is asserted; uniwill_ec_init() already sets that bit
> for the lifetime of the driver, so the profile code re-asserts it before
> writing to stay correct if the EC drops it.
>
> After a cold boot the registers read back as 0, meaning "no limit set".
> Derive the reported profile from PL1 and apply the default profile in th=
at
> case, so the sysfs value never disagrees with the hardware.
>
> Tested on: MECHREVO Jiaolong16K Series GM6BG0Q, BIOS N.1.19MRO15,
>             EC 1.24.

Thank your for your patch. I am well aware that platform profile support
is a highly requested feature, but we need to implement support for the
SMRW ACPI control method first, because this method tells us if PL1/PL2/PL=
4
control is supported, and if yes what the maximum values are. Also the EC
contains registers with the default PLx values for each platform profile,
so having to hardwire those is IMHO unnecessary.

Can we drop this patch and revisit this issue when support for SMRW is add=
ed?
I first need to finish full battery support and cleanup the driver a bit.

Thanks,
Armin Wolf

> Signed-off-by: dydydd <admin@qb.edu.kg>
> ---
>   .../admin-guide/laptops/uniwill-laptop.rst    |  10 +-
>   drivers/platform/x86/uniwill/uniwill-acpi.c   | 169 +++++++++++++++++-
>   2 files changed, 177 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst b/Docu=
mentation/admin-guide/laptops/uniwill-laptop.rst
> index be50b45b..9442ae71 100644
> --- a/Documentation/admin-guide/laptops/uniwill-laptop.rst
> +++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
> @@ -38,7 +38,15 @@ two fans. Userspace applications can access sensor re=
adings over the hwmon sysfs
>   Platform profile
>   ----------------
>  =20
> -Support for changing the platform performance mode is currently not imp=
lemented.
> +On devices that implement the EC power limit registers, the ``uniwill-l=
aptop`` driver
> +registers a standard platform profile device. It is available at
> +``/sys/firmware/acpi/platform_profile`` and accepts ``low-power``, ``ba=
lanced`` and
> +``performance``.
> +
> +Each profile maps to a set of PL1/PL2/PL4 values taken from the OEM con=
trol center
> +configuration for that machine. Writing a profile updates the EC power =
limits, which
> +the firmware keeps until the next reboot. Machines without known profil=
e values do not
> +expose the interface.
>  =20
>   Battery Charging Control
>   ------------------------
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index 94ed83ed..6d91b8f8 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -39,6 +39,7 @@
>   #include <linux/mutex.h>
>   #include <linux/notifier.h>
>   #include <linux/platform_device.h>
> +#include <linux/platform_profile.h>
>   #include <linux/pm.h>
>   #include <linux/printk.h>
>   #include <linux/regmap.h>
> @@ -369,6 +370,18 @@
>   #define UNIWILL_FEATURE_KEYBOARD_BACKLIGHT	BIT(12)
>   #define UNIWILL_FEATURE_AC_AUTO_BOOT		BIT(13)
>   #define UNIWILL_FEATURE_USB_POWERSHARE		BIT(14)
> +#define UNIWILL_FEATURE_PLATFORM_PROFILE	BIT(15)
> +
> +/*
> + * Power limits used by one platform profile. The EC keeps these in sin=
gle
> + * byte registers, so the values are plain watts.
> + */
> +struct uniwill_performance_profile {
> +	enum platform_profile_option profile;
> +	u8 pl1;
> +	u8 pl2;
> +	u8 pl4;
> +};
>  =20
>   enum usb_c_power_priority_options {
>   	USB_C_POWER_PRIORITY_CHARGING =3D 0,
> @@ -418,6 +431,10 @@ struct uniwill_data {
>   	struct notifier_block nb;
>   	struct mutex usb_c_power_priority_lock; /* Protects dependent bit wri=
te and state safe */
>   	enum usb_c_power_priority_options last_usb_c_power_priority_option;
> +	struct mutex profile_lock;	/* Protects profile writes */
> +	enum platform_profile_option current_profile;
> +	const struct uniwill_performance_profile *profiles;
> +	unsigned int num_profiles;
>   };
>  =20
>   struct uniwill_battery_entry {
> @@ -430,6 +447,9 @@ struct uniwill_device_descriptor {
>   	bool kbd_led_single_color;
>   	u8 kbd_led_max_brightness;
>   	u8 lightbar_max_brightness;
> +	/* Only used when UNIWILL_FEATURE_PLATFORM_PROFILE is set. */
> +	const struct uniwill_performance_profile *profiles;
> +	unsigned int num_profiles;
>   	/* Executed during driver probing */
>   	int (*probe)(struct uniwill_data *data);
>   };
> @@ -619,6 +639,9 @@ static bool uniwill_writeable_reg(struct device *dev=
, unsigned int reg)
>   	case EC_ADDR_CTGP_DB_TPP_OFFSET:
>   	case EC_ADDR_CTGP_DB_DB_OFFSET:
>   	case EC_ADDR_USB_C_POWER_PRIORITY:
> +	case EC_ADDR_PL1_SETTING:
> +	case EC_ADDR_PL2_SETTING:
> +	case EC_ADDR_PL4_SETTING:
>   		return true;
>   	default:
>   		return false;
> @@ -665,6 +688,9 @@ static bool uniwill_readable_reg(struct device *dev,=
 unsigned int reg)
>   	case EC_ADDR_CTGP_DB_TPP_OFFSET:
>   	case EC_ADDR_CTGP_DB_DB_OFFSET:
>   	case EC_ADDR_USB_C_POWER_PRIORITY:
> +	case EC_ADDR_PL1_SETTING:
> +	case EC_ADDR_PL2_SETTING:
> +	case EC_ADDR_PL4_SETTING:
>   		return true;
>   	default:
>   		return false;
> @@ -691,6 +717,9 @@ static bool uniwill_volatile_reg(struct device *dev,=
 unsigned int reg)
>   	case EC_ADDR_OEM_4:
>   	case EC_ADDR_CHARGE_CTRL:
>   	case EC_ADDR_USB_C_POWER_PRIORITY:
> +	case EC_ADDR_PL1_SETTING:
> +	case EC_ADDR_PL2_SETTING:
> +	case EC_ADDR_PL4_SETTING:
>   		return true;
>   	default:
>   		return false;
> @@ -1048,6 +1077,121 @@ static int uniwill_nvidia_ctgp_init(struct uniwi=
ll_data *data)
>   	return 0;
>   }
>  =20
> +/*
> + * Platform profile support.
> + *
> + * The EC latches PL1/PL2/PL4 only while manual control (bit 0 of
> + * EC_ADDR_AP_OEM) is asserted, otherwise it overwrites them with its o=
wn
> + * values within a few seconds. uniwill_ec_init() already sets that bit=
 for
> + * the lifetime of the driver, so the profiles can simply write the reg=
isters.
> + */
> +static const struct uniwill_performance_profile *
> +uniwill_lookup_profile(struct uniwill_data *data, enum platform_profile=
_option profile)
> +{
> +	for (int i =3D 0; i < data->num_profiles; i++) {
> +		if (data->profiles[i].profile =3D=3D profile)
> +			return &data->profiles[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +static int uniwill_profile_get(struct device *dev, enum platform_profil=
e_option *profile)
> +{
> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
> +
> +	*profile =3D data->current_profile;
> +
> +	return 0;
> +}
> +
> +static int uniwill_profile_set(struct device *dev, enum platform_profil=
e_option profile)
> +{
> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
> +	const struct uniwill_performance_profile *limits;
> +	int ret;
> +
> +	limits =3D uniwill_lookup_profile(data, profile);
> +	if (!limits)
> +		return -EOPNOTSUPP;
> +
> +	guard(mutex)(&data->profile_lock);
> +
> +	ret =3D regmap_set_bits(data->regmap, EC_ADDR_AP_OEM, ENABLE_MANUAL_CT=
RL);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D regmap_write(data->regmap, EC_ADDR_PL1_SETTING, limits->pl1);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D regmap_write(data->regmap, EC_ADDR_PL2_SETTING, limits->pl2);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D regmap_write(data->regmap, EC_ADDR_PL4_SETTING, limits->pl4);
> +	if (ret < 0)
> +		return ret;
> +
> +	data->current_profile =3D profile;
> +
> +	return 0;
> +}
> +
> +static int uniwill_profile_probe(void *drvdata, unsigned long *choices)
> +{
> +	struct uniwill_data *data =3D drvdata;
> +
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_PLATFORM_PROFILE))
> +		return -ENODEV;
> +
> +	for (int i =3D 0; i < data->num_profiles; i++)
> +		set_bit(data->profiles[i].profile, choices);
> +
> +	return 0;
> +}
> +
> +static const struct platform_profile_ops uniwill_profile_ops =3D {
> +	.probe =3D uniwill_profile_probe,
> +	.profile_get =3D uniwill_profile_get,
> +	.profile_set =3D uniwill_profile_set,
> +};
> +
> +static int uniwill_profile_init(struct uniwill_data *data)
> +{
> +	unsigned int value;
> +	int ret;
> +
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_PLATFORM_PROFILE))
> +		return 0;
> +
> +	/*
> +	 * The EC reports 0 after a cold boot, which means "no limit set". Der=
ive
> +	 * the initial profile from PL1 so the sysfs value always matches what=
 the
> +	 * firmware is actually doing.
> +	 */
> +	ret =3D regmap_read(data->regmap, EC_ADDR_PL1_SETTING, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	data->current_profile =3D PLATFORM_PROFILE_BALANCED;
> +	for (int i =3D 0; i < data->num_profiles; i++) {
> +		if (data->profiles[i].pl1 =3D=3D value) {
> +			data->current_profile =3D data->profiles[i].profile;
> +			break;
> +		}
> +	}
> +
> +	if (!value) {
> +		ret =3D uniwill_profile_set(data->dev, data->current_profile);
> +		if (ret < 0)
> +			dev_warn(data->dev, "Failed to apply default profile: %d\n", ret);
> +	}
> +
> +	return PTR_ERR_OR_ZERO(devm_platform_profile_register(data->dev, DRIVE=
R_NAME, data,
> +							      &uniwill_profile_ops));
> +}
> +
>   static const char * const usb_c_power_priority_text[] =3D {
>   	[USB_C_POWER_PRIORITY_CHARGING]		=3D "charging",
>   	[USB_C_POWER_PRIORITY_PERFORMANCE]	=3D "performance",
> @@ -2331,6 +2475,10 @@ static int uniwill_probe(struct platform_device *=
pdev)
>   	if (ret < 0)
>   		return ret;
>  =20
> +	ret =3D devm_mutex_init(&pdev->dev, &data->profile_lock);
> +	if (ret < 0)
> +		return ret;
> +
>   	ret =3D uniwill_ec_init(data);
>   	if (ret < 0)
>   		return ret;
> @@ -2339,6 +2487,8 @@ static int uniwill_probe(struct platform_device *p=
dev)
>   	data->kbd_led_single_color =3D device_descriptor.kbd_led_single_color=
;
>   	data->kbd_led_max_brightness =3D device_descriptor.kbd_led_max_bright=
ness;
>   	data->lightbar_max_brightness =3D device_descriptor.lightbar_max_brig=
htness;
> +	data->profiles =3D device_descriptor.profiles;
> +	data->num_profiles =3D device_descriptor.num_profiles;
>  =20
>   	/*
>   	 * Some devices might need to perform some device-specific initializa=
tion steps
> @@ -2371,6 +2521,10 @@ static int uniwill_probe(struct platform_device *=
pdev)
>   	if (ret < 0)
>   		return ret;
>  =20
> +	ret =3D uniwill_profile_init(data);
> +	if (ret < 0)
> +		return ret;
> +
>   	ret =3D usb_c_power_priority_init(data);
>   	if (ret < 0)
>   		return ret;
> @@ -2677,6 +2831,12 @@ static struct uniwill_device_descriptor machenike=
_l16p_descriptor __initdata =3D {
>   	.kbd_led_max_brightness =3D 4,
>   };
>  =20
> +static const struct uniwill_performance_profile mechrevo_gm6bg0q_profil=
es[] =3D {
> +	{ PLATFORM_PROFILE_LOW_POWER,	35, 35, 100 },
> +	{ PLATFORM_PROFILE_BALANCED,	65, 65, 100 },
> +	{ PLATFORM_PROFILE_PERFORMANCE,	80, 80, 100 },
> +};
> +
>   static struct uniwill_device_descriptor mechrevo_gm6bg0q_descriptor __=
initdata =3D {
>   	.features =3D UNIWILL_FEATURE_FN_LOCK |
>   		    UNIWILL_FEATURE_SUPER_KEY |
> @@ -2690,7 +2850,14 @@ static struct uniwill_device_descriptor mechrevo_=
gm6bg0q_descriptor __initdata =3D
>   		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY |
>   		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT |
>   		    UNIWILL_FEATURE_AC_AUTO_BOOT |
> -		    UNIWILL_FEATURE_USB_POWERSHARE,
> +		    UNIWILL_FEATURE_USB_POWERSHARE |
> +		    UNIWILL_FEATURE_PLATFORM_PROFILE,
> +	/*
> +	 * Taken from the OEM control center profiles (Mode1/2/3_Profile1.json=
).
> +	 * Low power and balanced are the "office" and "gaming" profiles.
> +	 */
> +	.profiles =3D mechrevo_gm6bg0q_profiles,
> +	.num_profiles =3D ARRAY_SIZE(mechrevo_gm6bg0q_profiles),
>   	.kbd_led_single_color =3D false,
>   	.kbd_led_max_brightness =3D 4,
>   };
