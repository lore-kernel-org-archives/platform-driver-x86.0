Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1458626F2A1;
	Sat,  7 Mar 2026 15:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772898747; cv=none; b=ViWnQNxh90dBX0PL2Ql4sPryW2IR5USeDgVOxCwjxPvhT2LtVdryF1mrcNN4PMSf6rDodCUVykQQ2t5vLsHNqV/+aCGhjHNXnpWNb7cUdnIRnuGaMhC6azClWdHArqxKaEGSmO+2KAUsMppPWf9YLpBUWV4AxI4/5/ROGraxqmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772898747; c=relaxed/simple;
	bh=8XBsE/3/bPcmYyXGDvkyB+8o0cE8qKLF+uEanfgU+cw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OBXrYDHcb6iAlVjHuwD8Zv0hqSG6ivOwl3MsFvy70SGqcuoDPmuTR8J1FQxF1Dr64mm1IpHDkVKRvsN0NOzpCWM9liJnfCbCYH8KKhk2OIPspn7rBtDQHOlTDj925t94VRZWCpg0410VWXTAk2UXqovzDJ+NI5UveNvqp9Q7yAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=IlXgKY2+; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="IlXgKY2+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772898732; x=1773503532; i=w_armin@gmx.de;
	bh=XohZFo8GARpc1/Yi+fZEtuw2sfxaSyFRHGAjvX/bYoA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=IlXgKY2+x0sfMOlNBmNYedo1LrRJzGQdgEaGnh/KrqhHI0MTKoghwp+7JYnbFjbh
	 ZqTONcWhs9Vji0QiqYIR5DfcGegNS80f4w+2S+W7mLeX7bFfo2xy2LiIWr4Jn1ecK
	 OwrPyyGckN/77aGFayfSPnWveMVmDQ7hNt0yuF921JqpHw8ZFTflmLXqoiCMb5DLy
	 zd1F46nXh/NZpvAIx8VCzLE+bLDPQlQhAoxTJVD3+SPXAkBrc19/ak8QDgRZi6S/L
	 MkEjsog8080hY39JguI6wW04wYFu6uahc7SuaxVjF5RySmE1pmWzcK2sqdX/QwoKf
	 1/5ft2LCHyj3RTwElw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTRR0-1w4MXA169k-00IFRX; Sat, 07
 Mar 2026 16:52:12 +0100
Message-ID: <cb3438af-2f5e-4699-9feb-8e980af8d1d2@gmx.de>
Date: Sat, 7 Mar 2026 16:52:08 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] platform/x86/uniwill: Implement USB-C power
 priority setting
To: Werner Sembach <wse@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260303225440.504358-1-wse@tuxedocomputers.com>
 <20260303225440.504358-3-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260303225440.504358-3-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eX8aPO+8B+Sgb35ePNBZ/Kpo6NrPrI2wY4Nz4uGZKjoRsNmt4os
 Q31QWjWsUoWNRirZueGeNNn+3gQQSWNxWXwhVO3w5SSCB0IFe01hNSZ6kNdi+7igq4B3dcT
 3vcurqNDH3MRx9d4lxjQgRw/TmBQWSdlIdgW/tftIBJsqwX/7qAmSblm6HOVdrxxcO9A2Z0
 FDDw77nlmIRbPDPnFp72g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:oaLuXwSR0Sg=;NID8uuARbjHg+OjsjuRiQGxsumB
 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

Am 03.03.26 um 23:54 schrieb Werner Sembach:

> On some devices Uniwill offers the option to set the USB-C port to
> prioritise charging or performance. This patch exposes this setting to t=
he
> userspace via sysfs for all TUXEDO devices supporting it.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 145 +++++++++++++++++++-
>   1 file changed, 138 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index 048b265bff374..22ae5fccd6a06 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -266,8 +266,8 @@
>   #define BATTERY_CHARGE_FULL_OVER_24H	BIT(3)
>   #define BATTERY_ERM_STATUS_REACHED	BIT(4)
>  =20
> -#define EC_ADDR_CHARGE_PRIO		0x07CC
> -#define CHARGING_PERFORMANCE		BIT(7)
> +#define EC_ADDR_USB_C_POWER_PRIORITY	0x07CC
> +#define USB_C_POWER_PRIORITY		BIT(7)
>  =20
>   /* Same bits as EC_ADDR_LIGHTBAR_AC_CTRL except LIGHTBAR_S3_OFF */
>   #define EC_ADDR_LIGHTBAR_BAT_CTRL	0x07E2
> @@ -324,6 +324,12 @@
>   #define UNIWILL_FEATURE_PRIMARY_FAN		BIT(7)
>   #define UNIWILL_FEATURE_SECONDARY_FAN		BIT(8)
>   #define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL	BIT(9)
> +#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY	BIT(10)
> +
> +enum usb_c_power_priority_options {
> +	USB_C_POWER_PRIORITY_CHARGING =3D 0,
> +	USB_C_POWER_PRIORITY_PERFORMANCE,
> +};
>  =20
>   struct uniwill_data {
>   	struct device *dev;
> @@ -343,6 +349,8 @@ struct uniwill_data {
>   	struct mutex input_lock;	/* Protects input sequence during notify */
>   	struct input_dev *input_device;
>   	struct notifier_block nb;
> +	struct mutex usb_c_power_priority_lock; /* Protects dependent bit writ=
e and state safe */
> +	enum usb_c_power_priority_options last_usb_c_power_priority_option;
>   };
>  =20
>   struct uniwill_battery_entry {
> @@ -527,6 +535,7 @@ static bool uniwill_writeable_reg(struct device *dev=
, unsigned int reg)
>   	case EC_ADDR_CTGP_DB_CTGP_OFFSET:
>   	case EC_ADDR_CTGP_DB_TPP_OFFSET:
>   	case EC_ADDR_CTGP_DB_DB_OFFSET:
> +	case EC_ADDR_USB_C_POWER_PRIORITY:
>   		return true;
>   	default:
>   		return false;
> @@ -565,6 +574,7 @@ static bool uniwill_readable_reg(struct device *dev,=
 unsigned int reg)
>   	case EC_ADDR_CTGP_DB_CTGP_OFFSET:
>   	case EC_ADDR_CTGP_DB_TPP_OFFSET:
>   	case EC_ADDR_CTGP_DB_DB_OFFSET:
> +	case EC_ADDR_USB_C_POWER_PRIORITY:
>   		return true;
>   	default:
>   		return false;
> @@ -587,6 +597,7 @@ static bool uniwill_volatile_reg(struct device *dev,=
 unsigned int reg)
>   	case EC_ADDR_TRIGGER:
>   	case EC_ADDR_SWITCH_STATUS:
>   	case EC_ADDR_CHARGE_CTRL:
> +	case EC_ADDR_USB_C_POWER_PRIORITY:
>   		return true;
>   	default:
>   		return false;
> @@ -883,6 +894,104 @@ static int uniwill_nvidia_ctgp_init(struct uniwill=
_data *data)
>   	return 0;
>   }
>  =20
> +static const char * const USB_C_POWER_PRIORITY_TEXT[] =3D {
> +	[USB_C_POWER_PRIORITY_CHARGING]		=3D "charging",
> +	[USB_C_POWER_PRIORITY_PERFORMANCE]	=3D "performance",
> +};
> +
> +static const u8 USB_C_POWER_PRIORITY_VALUE[] =3D {
> +	[USB_C_POWER_PRIORITY_CHARGING]		=3D 0,
> +	[USB_C_POWER_PRIORITY_PERFORMANCE]	=3D USB_C_POWER_PRIORITY,
> +};
> +
> +static ssize_t usb_c_power_priority_store(struct device *dev,
> +					  struct device_attribute *attr,
> +					  const char *buf, size_t count)
> +{
> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
> +	enum usb_c_power_priority_options option;
> +	unsigned int value;
> +	int ret;
> +
> +	option =3D sysfs_match_string(USB_C_POWER_PRIORITY_TEXT, buf);
> +	if (option < 0)
> +		return option;
> +
> +	value =3D USB_C_POWER_PRIORITY_VALUE[option];
> +
> +	guard(mutex)(&data->usb_c_power_priority_lock);
> +
> +	ret =3D regmap_update_bits(data->regmap, EC_ADDR_USB_C_POWER_PRIORITY,
> +				 USB_C_POWER_PRIORITY, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	data->last_usb_c_power_priority_option =3D option;
> +
> +	return count;
> +}
> +
> +static ssize_t usb_c_power_priority_show(struct device *dev,
> +					 struct device_attribute *attr,
> +					 char *buf)
> +{
> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret =3D regmap_read(data->regmap, EC_ADDR_USB_C_POWER_PRIORITY, &value=
);
> +	if (ret < 0)
> +		return ret;
> +
> +	value &=3D USB_C_POWER_PRIORITY;
> +
> +	if (USB_C_POWER_PRIORITY_VALUE[USB_C_POWER_PRIORITY_PERFORMANCE] =3D=
=3D value)
> +		return sysfs_emit(buf, "%s\n",
> +				  USB_C_POWER_PRIORITY_TEXT[USB_C_POWER_PRIORITY_PERFORMANCE]);
> +
> +	return sysfs_emit(buf, "%s\n", USB_C_POWER_PRIORITY_TEXT[USB_C_POWER_P=
RIORITY_CHARGING]);
> +}
> +
> +static DEVICE_ATTR_RW(usb_c_power_priority);
> +
> +static int usb_c_power_priority_restore(struct uniwill_data *data)
> +{
> +	unsigned int value;
> +
> +	value =3D USB_C_POWER_PRIORITY_VALUE[data->last_usb_c_power_priority_o=
ption];
> +
> +	guard(mutex)(&data->usb_c_power_priority_lock);
> +
> +	return regmap_update_bits(data->regmap, EC_ADDR_USB_C_POWER_PRIORITY,
> +				  USB_C_POWER_PRIORITY, value);
> +}
> +
> +static int usb_c_power_priority_init(struct uniwill_data *data)
> +{
> +	unsigned int value;
> +	int ret;
> +
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_USB_C_POWER_PRIORIT=
Y))
> +		return 0;
> +
> +	ret =3D devm_mutex_init(data->dev, &data->usb_c_power_priority_lock);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D regmap_read(data->regmap, EC_ADDR_USB_C_POWER_PRIORITY, &value=
);
> +	if (ret < 0)
> +		return ret;
> +
> +	value &=3D USB_C_POWER_PRIORITY;
> +
> +	data->last_usb_c_power_priority_option =3D
> +		USB_C_POWER_PRIORITY_VALUE[USB_C_POWER_PRIORITY_PERFORMANCE] =3D=3D v=
alue ?
> +			USB_C_POWER_PRIORITY_PERFORMANCE :
> +			USB_C_POWER_PRIORITY_CHARGING;
> +
> +	return 0;
> +}
> +
>   static struct attribute *uniwill_attrs[] =3D {
>   	/* Keyboard-related */
>   	&dev_attr_fn_lock.attr,
> @@ -893,6 +1002,7 @@ static struct attribute *uniwill_attrs[] =3D {
>   	&dev_attr_breathing_in_suspend.attr,
>   	/* Power-management-related */
>   	&dev_attr_ctgp_offset.attr,
> +	&dev_attr_usb_c_power_priority.attr,
>   	NULL
>   };
>  =20
> @@ -927,6 +1037,11 @@ static umode_t uniwill_attr_is_visible(struct kobj=
ect *kobj, struct attribute *a
>   			return attr->mode;
>   	}
>  =20
> +	if (attr =3D=3D &dev_attr_usb_c_power_priority.attr) {
> +		if (uniwill_device_supports(data, UNIWILL_FEATURE_USB_C_POWER_PRIORIT=
Y))
> +			return attr->mode;
> +	}
> +
>   	return 0;
>   }
>  =20
> @@ -1417,11 +1532,10 @@ static int uniwill_notifier_call(struct notifier=
_block *nb, unsigned long action
>  =20
>   		return NOTIFY_OK;
>   	case UNIWILL_OSD_DC_ADAPTER_CHANGED:
> -		/* noop for the time being, will change once charging priority
> -		 * gets implemented.
> -		 */
> +		if (!uniwill_device_supports(data, UNIWILL_FEATURE_USB_C_POWER_PRIORI=
TY))
> +			return NOTIFY_DONE;
>  =20
> -		return NOTIFY_OK;
> +		return notifier_from_errno(usb_c_power_priority_restore(data));
>   	case UNIWILL_OSD_FN_LOCK:
>   		if (!uniwill_device_supports(data, UNIWILL_FEATURE_FN_LOCK))
>   			return NOTIFY_DONE;
> @@ -1515,10 +1629,15 @@ static int uniwill_probe(struct platform_device =
*pdev)
>   		return PTR_ERR(regmap);
>  =20
>   	data->regmap =3D regmap;
> +
>   	ret =3D devm_mutex_init(&pdev->dev, &data->super_key_lock);
>   	if (ret < 0)
>   		return ret;
>  =20
> +	ret =3D usb_c_power_priority_init(data);
> +	if (ret < 0)
> +		return ret;
> +
>   	ret =3D uniwill_ec_init(data);
>   	if (ret < 0)
>   		return ret;
> @@ -1681,6 +1800,14 @@ static int uniwill_resume_nvidia_ctgp(struct uniw=
ill_data *data)
>   			       CTGP_DB_DB_ENABLE | CTGP_DB_CTGP_ENABLE);
>   }
>  =20
> +static int uniwill_resume_usb_c_power_priority(struct uniwill_data *dat=
a)
> +{
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_USB_C_POWER_PRIORIT=
Y))
> +		return 0;
> +
> +	return usb_c_power_priority_restore(data);
> +}
> +
>   static int uniwill_resume(struct device *dev)
>   {
>   	struct uniwill_data *data =3D dev_get_drvdata(dev);
> @@ -1704,7 +1831,11 @@ static int uniwill_resume(struct device *dev)
>   	if (ret < 0)
>   		return ret;
>  =20
> -	return uniwill_resume_nvidia_ctgp(data);
> +	ret =3D uniwill_resume_nvidia_ctgp(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	return uniwill_resume_usb_c_power_priority(data);
>   }
>  =20
>   static DEFINE_SIMPLE_DEV_PM_OPS(uniwill_pm_ops, uniwill_suspend, uniwi=
ll_resume);
