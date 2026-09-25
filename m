Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6413AD50B;
	Fri, 25 Sep 2026 23:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790380490; cv=none; b=nZR7Gd1nsvuvhh4V2WzFvboKy8H/vXaPbbpws6X1GxNg1J56dR5Fa0w4UyjR5frs7OYjPxc6K8s9teptldF1RfULBepyNqnYFnj/W9+QG/t4AjNe4imjsF8txS88ycFvdALDsWmW4IVzgTJklbfzJCkrpiob458TgLnE8cEP7TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790380490; c=relaxed/simple;
	bh=B+aEFAVYS9sVpndG+dj9Y/KTLUw4rbKOIz/NI24BpSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=alNLLPvUmXt24bj+VZZI6f9NcXXWRmiPRm04X68p5Qeft/KpltpRVBvnT2HC9Fu7AyHzs7rbRDp4QZUu42rcDLSd9RzpFqgikAOGsWob+uVcj/eB0FAz8gAd76hyAuXRVRz51IdD46CwmqG5h/1jVJ5nz6oty0lbR1dNCNNs54c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=i2Vqw3Kt; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="i2Vqw3Kt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1790380482; x=1790985282; i=w_armin@gmx.de;
	bh=91YN2Aq8hGYg39K/4uawdw+Jm2tc3dL0lTwqctZRkEs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=i2Vqw3Kt+jMvuuunqAGuEHWZxhCnn87AnA9OC2vHKUn/PN11RCusJ+DIZkevC25G
	 wHkLHUdGEKyFkf4BzPANDlWT3kOSDYxfwuKuNR6NRrpQmb7Fbanxeqp8UMf3rmMiB
	 EQFyRFz5j6KEcm0M88vyT361Qr4ga0CeTN0Bz2823s5tHkwvmC7K1b1W3W1gmWFQl
	 jdTx5+1paFEi9RbCzXkunrBr0GfucMdsy3PHdJOrhNhP1qKXlKB4bzgmHpfSqrJ7K
	 VrAoYgzN4Ei6s/8jEyBAyJUNuP3P10uWLh5YodpJqSbF3UneXcU+pUW62KmnpKRrw
	 25MEFQt+JJPSqeQF1g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MgNct-1wX57V1yJT-00oAQZ; Sat, 26
 Sep 2026 01:54:42 +0200
Message-ID: <0b2b863f-d12a-4b1f-93a3-45a42f3ef503@gmx.de>
Date: Sat, 26 Sep 2026 01:54:40 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] platform/x86: uniwill-laptop: Add platform profile
 support
To: Mohamed Jouini <amad3v@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260925211635.1422516-1-amad3v@gmail.com>
 <20260925211635.1422516-3-amad3v@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260925211635.1422516-3-amad3v@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+0TRuMdvhzQOfF8ei26amjetiVPHC700uMFojwtagoB/mJCwXJo
 Bo7pAeWBnlSXFF9PKnTVndz+BiyCcvWXnDBFhB9NlaUpIOcCMWxkAepvzm5oIJxUZNItFcT
 q3+GyMHJbjmu/rQ00R/JmBRAqZAKNtQuBNgQmqFO0ba/ffOerZebUKLdl3aGmfc61Ke/Ho9
 eNJzxyfHrlUob7D/e1d9g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OT6o/b3klKs=;6xIlHLgXb3Zc/bp7bM6QrLW3zXO
 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
 rSfJ48lmnxXjlb/qqJ0qySGeDQ==

Am 25.09.26 um 23:16 schrieb Mohamed Jouini:

> The EC exposes the three firmware power modes (BIOS "office", "balance"
> and "turbo") in EC_ADDR_MANUAL_FAN_CTRL. The ACPI tables name BIT(4) TBM=
E
> and BIT(7) UFME and only evaluate those two bits; writing the register
> makes the EC apply the whole mode: mode LED colour, NVIDIA Dynamic
> Boost/TPP limits (DBAP/ETPP) and the _Q88 mode-change notification.
>
> Expose the modes as low-power/balanced/performance platform profiles on
> the PCSpecialist Recoil 16 AMD and handle the mode key: the EC only
> cycles the mode itself until the OS sets one, afterwards it just reports
> UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE, so notify userspace if the EC
> already switched and cycle the profile otherwise.

Nice work, but AFAIK the whole fan control/platform profile complex needs =
a bit more
work before we can enable this feature. Can we skip this patch for now?

Thanks,
Armin Wolf

> Signed-off-by: Mohamed Jouini <amad3v@gmail.com>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 133 +++++++++++++++++++-
>   1 file changed, 132 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index beba5a76a..0932e5937 100644
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
> @@ -184,6 +185,15 @@
>   #define FAN_MODE_HIGH			BIT(5)
>   #define FAN_MODE_BOOST			BIT(6)
>   #define FAN_MODE_USER			BIT(7)
> +/*
> + * Firmware power modes (BIOS "office/balance/turbo"). The ACPI tables =
name
> + * BIT(4) TBME and BIT(7) UFME and only evaluate those two bits; the va=
lues
> + * below are exactly what the EC itself stores when the mode button is =
pressed.
> + */
> +#define PERF_MODE_MASK			(FAN_MODE_USER | FAN_MODE_HIGH | FAN_MODE_TURB=
O)
> +#define PERF_MODE_OFFICE		(FAN_MODE_USER | FAN_MODE_HIGH)
> +#define PERF_MODE_BALANCE		FAN_MODE_HIGH
> +#define PERF_MODE_TURBO			(FAN_MODE_HIGH | FAN_MODE_TURBO)
>  =20
>   #define EC_ADDR_PWM_1			0x075B
>  =20
> @@ -369,6 +379,7 @@
>   #define UNIWILL_FEATURE_KEYBOARD_BACKLIGHT	BIT(12)
>   #define UNIWILL_FEATURE_AC_AUTO_BOOT		BIT(13)
>   #define UNIWILL_FEATURE_USB_POWERSHARE		BIT(14)
> +#define UNIWILL_FEATURE_PERFORMANCE_MODES	BIT(15)
>  =20
>   enum usb_c_power_priority_options {
>   	USB_C_POWER_PRIORITY_CHARGING =3D 0,
> @@ -418,6 +429,8 @@ struct uniwill_data {
>   	struct notifier_block nb;
>   	struct mutex usb_c_power_priority_lock; /* Protects dependent bit wri=
te and state safe */
>   	enum usb_c_power_priority_options last_usb_c_power_priority_option;
> +	struct device *ppdev;
> +	enum platform_profile_option last_profile;	/* last profile read or wri=
tten */
>   };
>  =20
>   struct uniwill_battery_entry {
> @@ -602,6 +615,7 @@ static bool uniwill_writeable_reg(struct device *dev=
, unsigned int reg)
>   	case EC_ADDR_LIGHTBAR_AC_GREEN:
>   	case EC_ADDR_LIGHTBAR_AC_BLUE:
>   	case EC_ADDR_BIOS_OEM:
> +	case EC_ADDR_MANUAL_FAN_CTRL:
>   	case EC_ADDR_TRIGGER:
>   	case EC_ADDR_RGB_RED:
>   	case EC_ADDR_RGB_GREEN:
> @@ -643,6 +657,7 @@ static bool uniwill_readable_reg(struct device *dev,=
 unsigned int reg)
>   	case EC_ADDR_LIGHTBAR_AC_GREEN:
>   	case EC_ADDR_LIGHTBAR_AC_BLUE:
>   	case EC_ADDR_BIOS_OEM:
> +	case EC_ADDR_MANUAL_FAN_CTRL:
>   	case EC_ADDR_PWM_1:
>   	case EC_ADDR_PWM_2:
>   	case EC_ADDR_SUPPORT_2:
> @@ -682,6 +697,7 @@ static bool uniwill_volatile_reg(struct device *dev,=
 unsigned int reg)
>   	case EC_ADDR_SECOND_FAN_RPM_2:
>   	case EC_ADDR_BAT_ALERT:
>   	case EC_ADDR_BIOS_OEM:
> +	case EC_ADDR_MANUAL_FAN_CTRL:
>   	case EC_ADDR_PWM_1:
>   	case EC_ADDR_PWM_2:
>   	case EC_ADDR_SUPPORT_2:
> @@ -2168,6 +2184,110 @@ static int uniwill_battery_init(struct uniwill_d=
ata *data)
>   	return devm_battery_hook_register(data->dev, &data->hook);
>   }
>  =20
> +static int uniwill_platform_profile_probe(void *drvdata, unsigned long =
*choices)
> +{
> +	set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
> +	set_bit(PLATFORM_PROFILE_BALANCED, choices);
> +	set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
> +
> +	return 0;
> +}
> +
> +static int uniwill_platform_profile_get(struct device *dev, enum platfo=
rm_profile_option *profile)
> +{
> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret =3D regmap_read(data->regmap, EC_ADDR_MANUAL_FAN_CTRL, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Same decision as the firmware's PMSC method */
> +	switch (value & (FAN_MODE_USER | FAN_MODE_TURBO)) {
> +	case FAN_MODE_USER:
> +		*profile =3D PLATFORM_PROFILE_LOW_POWER;
> +		break;
> +	case FAN_MODE_TURBO:
> +		*profile =3D PLATFORM_PROFILE_PERFORMANCE;
> +		break;
> +	default:
> +		*profile =3D PLATFORM_PROFILE_BALANCED;
> +		break;
> +	}
> +
> +	WRITE_ONCE(data->last_profile, *profile);
> +
> +	return 0;
> +}
> +
> +static int uniwill_platform_profile_set(struct device *dev, enum platfo=
rm_profile_option profile)
> +{
> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	switch (profile) {
> +	case PLATFORM_PROFILE_LOW_POWER:
> +		value =3D PERF_MODE_OFFICE;
> +		break;
> +	case PLATFORM_PROFILE_BALANCED:
> +		value =3D PERF_MODE_BALANCE;
> +		break;
> +	case PLATFORM_PROFILE_PERFORMANCE:
> +		value =3D PERF_MODE_TURBO;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	/* The EC applies the mode (LED, power limits, ACPI notifications) its=
elf */
> +	ret =3D regmap_update_bits(data->regmap, EC_ADDR_MANUAL_FAN_CTRL, PERF=
_MODE_MASK, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	WRITE_ONCE(data->last_profile, profile);
> +
> +	return 0;
> +}
> +
> +static const struct platform_profile_ops uniwill_platform_profile_ops =
=3D {
> +	.probe =3D uniwill_platform_profile_probe,
> +	.profile_get =3D uniwill_platform_profile_get,
> +	.profile_set =3D uniwill_platform_profile_set,
> +};
> +
> +static int uniwill_platform_profile_init(struct uniwill_data *data)
> +{
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_PERFORMANCE_MODES))
> +		return 0;
> +
> +	data->ppdev =3D devm_platform_profile_register(data->dev, DRIVER_NAME,=
 data,
> +						     &uniwill_platform_profile_ops);
> +	if (IS_ERR(data->ppdev))
> +		return PTR_ERR(data->ppdev);
> +
> +	return uniwill_platform_profile_get(data->ppdev, &data->last_profile);
> +}
> +
> +/*
> + * The EC only cycles the mode on its own until the OS sets a mode once=
; after
> + * that the button just reports UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE. Ha=
ndle
> + * both cases: if the EC already switched, only notify userspace, other=
wise
> + * cycle the profile ourselves.
> + */
> +static void uniwill_platform_profile_button(struct uniwill_data *data)
> +{
> +	enum platform_profile_option before =3D READ_ONCE(data->last_profile),=
 now;
> +
> +	msleep(100);	/* give the EC time to apply its own switch, if any */
> +
> +	if (!uniwill_platform_profile_get(data->ppdev, &now) && now !=3D befor=
e)
> +		platform_profile_notify(data->ppdev);
> +	else
> +		platform_profile_cycle();
> +}
> +
>   static int uniwill_notifier_call(struct notifier_block *nb, unsigned l=
ong action, void *dummy)
>   {
>   	struct uniwill_data *data =3D container_of(nb, struct uniwill_data, n=
b);
> @@ -2239,6 +2359,12 @@ static int uniwill_notifier_call(struct notifier_=
block *nb, unsigned long action
>   			return NOTIFY_DONE;
>  =20
>   		return notifier_from_errno(uniwill_notify_kbd_led(data, 4));
> +	case UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE:
> +		if (uniwill_device_supports(data, UNIWILL_FEATURE_PERFORMANCE_MODES))=
 {
> +			uniwill_platform_profile_button(data);
> +			return NOTIFY_OK;
> +		}
> +		fallthrough;
>   	default:
>   		mutex_lock(&data->input_lock);
>   		sparse_keymap_report_event(data->input_device, action, 1, true);
> @@ -2375,6 +2501,10 @@ static int uniwill_probe(struct platform_device *=
pdev)
>   	if (ret < 0)
>   		return ret;
>  =20
> +	ret =3D uniwill_platform_profile_init(data);
> +	if (ret < 0)
> +		return ret;
> +
>   	return uniwill_input_init(data);
>   }
>  =20
> @@ -2797,7 +2927,8 @@ static struct uniwill_device_descriptor pcs_recoil=
16_amd_descriptor __initdata =3D
>   		    UNIWILL_FEATURE_SECONDARY_FAN |
>   		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
>   		    UNIWILL_FEATURE_AC_AUTO_BOOT |
> -		    UNIWILL_FEATURE_USB_POWERSHARE,
> +		    UNIWILL_FEATURE_USB_POWERSHARE |
> +		    UNIWILL_FEATURE_PERFORMANCE_MODES,
>   };
>  =20
>   static int phxtxx1_probe(struct uniwill_data *data)
