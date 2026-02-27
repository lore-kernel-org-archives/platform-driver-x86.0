Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77A8395270;
	Fri, 27 Feb 2026 09:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772184728; cv=none; b=gcKFLPWX0j4jygm0/2vvNDpCXUGf2XK+dLy9Wd6HlfuP8BMKBOwvMV7kiLRPIF6Xt6jkh5m8/wRXFNF1Q6pVE0DAKMronMQWNy2OVlQXFcW5nQ5PpBetZSrAdUec4gfnSsLgIwFfDfQrhVGTM8ZahmnVYaeLrGmgFCyFUj/zAhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772184728; c=relaxed/simple;
	bh=wtX/KeXORdLx47fqs3/q4yBzZO4JSNFQcIKBWY3c7GU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ky1yBI5oEGW828PBHEu79nhhoCDX+Ycf6rMHCXlM+4roaGm96zG4RaT/UAFvwvEp6WM0ajWNhnO1HXD33PxsDWPUbxvVHMrsJc9PY+9qLf8QiRUU0LlizijEW/p2F1ZjuFA1VCUV/5ynfJBo8sHNKsCo216ldZavxSM7767S9R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=hnjbeboV; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="hnjbeboV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772184721; x=1772789521; i=w_armin@gmx.de;
	bh=pVRC1gY8o5H3YOfrg9JAj75S3O6DflI+HZhNOPYlbPE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=hnjbeboVIKFr3aZZdsa/ZRkxNZxgK5iVD6x84IAVDUYKQOKbd0ZU0KmxWOWRd74B
	 lyvPGOyz+YJflee+XsNAY6lXRCoYhRiTDjRqVncTW3fkY+SN8KZqJ6/Fd8Hj7D2x3
	 VVnGnM2cUCa+oMCipHsPoAIzN6PyeZ9GebFdRa/ouy/LB3VdglwjHb+BIUt4TYq8e
	 oPKm2/Znuj9iumjqk5s9EhaTUonXR+lvzT3/JWqOmt6xeMTPizZT2fRw/RTfHp53O
	 U1vC/cUS6FIw0OsGF5PRrLZlHGTd8UQyRSf92Kedl1TneLteqfrVC22N0o0umVp99
	 +TiAapNTtX65WB2WRA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6bfw-1vdoYo2vfy-00w4UL; Fri, 27
 Feb 2026 10:32:00 +0100
Message-ID: <3123878e-d791-418f-af3c-29076afd6ddc@gmx.de>
Date: Fri, 27 Feb 2026 10:31:59 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] platform/x86/uniwill: Implement USB-C power
 priority setting
To: Werner Sembach <wse@tuxedocomputers.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260226205302.123782-1-wse@tuxedocomputers.com>
 <20260226205302.123782-3-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260226205302.123782-3-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:c/z6ELQYS/ooqRIROIkVudphgruY8DRRgikRzoxWWJKvbGgxWlP
 Zv6VMBti9VwkXx41zAY0QwmQv9Qg3xOcOhvYn52tmzz4zIxpSPI1PylDvHF6KXTQAre51HM
 DEStRmjKxS2GWIccQWeNiOseAcD+kdNluBIrDid5O+AjiGhtCWP57b8MRfKUV6wRWYMnHTE
 0Vcb9PY/u9GAUoypb4Fng==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WwvSxqNrWNo=;AsvRpPXVIdcuw5tQIIZAQnDtSw2
 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
 ihBNWSBQ0+cFPjhgqQPm

Am 26.02.26 um 21:50 schrieb Werner Sembach:

> On some devices Uniwill offers the option to set the USB-C port to
> prioritise charging or performance. This patch exposes this setting to t=
he
> userspace via sysfs for all TUXEDO devices supporting it.
>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 103 ++++++++++++++++++--
>   1 file changed, 97 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index 7ab82cf16f388..a34b1eed74eb2 100644
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
> @@ -324,6 +324,7 @@
>   #define UNIWILL_FEATURE_PRIMARY_FAN		BIT(7)
>   #define UNIWILL_FEATURE_SECONDARY_FAN		BIT(8)
>   #define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL	BIT(9)
> +#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY	BIT(10)
>  =20
>   struct uniwill_data {
>   	struct device *dev;
> @@ -343,6 +344,8 @@ struct uniwill_data {
>   	struct mutex input_lock;	/* Protects input sequence during notify */
>   	struct input_dev *input_device;
>   	struct notifier_block nb;
> +	struct mutex usb_c_power_priority_lock; /* Protects dependent bit writ=
e and state safe */
> +	unsigned int last_usb_c_power_priority;
>   };
>  =20
>   struct uniwill_battery_entry {
> @@ -527,6 +530,7 @@ static bool uniwill_writeable_reg(struct device *dev=
, unsigned int reg)
>   	case EC_ADDR_CTGP_DB_CTGP_OFFSET:
>   	case EC_ADDR_CTGP_DB_TPP_OFFSET:
>   	case EC_ADDR_CTGP_DB_DB_OFFSET:
> +	case EC_ADDR_USB_C_POWER_PRIORITY:
>   		return true;
>   	default:
>   		return false;
> @@ -565,6 +569,7 @@ static bool uniwill_readable_reg(struct device *dev,=
 unsigned int reg)
>   	case EC_ADDR_CTGP_DB_CTGP_OFFSET:
>   	case EC_ADDR_CTGP_DB_TPP_OFFSET:
>   	case EC_ADDR_CTGP_DB_DB_OFFSET:
> +	case EC_ADDR_USB_C_POWER_PRIORITY:
>   		return true;
>   	default:
>   		return false;
> @@ -587,6 +592,7 @@ static bool uniwill_volatile_reg(struct device *dev,=
 unsigned int reg)
>   	case EC_ADDR_TRIGGER:
>   	case EC_ADDR_SWITCH_STATUS:
>   	case EC_ADDR_CHARGE_CTRL:
> +	case EC_ADDR_USB_C_POWER_PRIORITY:
>   		return true;
>   	default:
>   		return false;
> @@ -883,6 +889,78 @@ static int uniwill_nvidia_ctgp_init(struct uniwill_=
data *data)
>   	return 0;
>   }
>  =20
> +enum usb_c_power_priority_options {
> +	USB_C_POWER_PRIORITY_OPTIONS_CHARGING =3D 0,
> +	USB_C_POWER_PRIORITY_OPTIONS_PERFORMANCE,
> +};
> +
> +static const char * const USB_C_POWER_PRIORITY_OPTIONS_TEXT[] =3D {
> +	[USB_C_POWER_PRIORITY_OPTIONS_CHARGING]		=3D "charging",
> +	[USB_C_POWER_PRIORITY_OPTIONS_PERFORMANCE]	=3D "performance",
> +};
> +
> +static const u8 USB_C_POWER_PRIORITY_OPTIONS_VALUE[] =3D {
> +	[USB_C_POWER_PRIORITY_OPTIONS_CHARGING]		=3D 0,
> +	[USB_C_POWER_PRIORITY_OPTIONS_PERFORMANCE]	=3D USB_C_POWER_PRIORITY,
> +};
> +
> +static ssize_t usb_c_power_priority_store(struct device *dev,
> +					  struct device_attribute *attr,
> +					  const char *buf, size_t count)
> +{
> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret =3D sysfs_match_string(USB_C_POWER_PRIORITY_OPTIONS_TEXT, buf);
> +	if (ret < 0)
> +		return ret;
> +
> +	value =3D USB_C_POWER_PRIORITY_OPTIONS_VALUE[ret];
> +
> +	guard(mutex)(&data->usb_c_power_priority_lock);
> +
> +	ret =3D regmap_update_bits(data->regmap, EC_ADDR_USB_C_POWER_PRIORITY,
> +				 USB_C_POWER_PRIORITY, value);
> +	if (ret < 0)
> +		return ret;
> +
> +	data->last_usb_c_power_priority =3D value;
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
> +	ssize_t count =3D 0;
> +	int ret;
> +
> +	ret =3D regmap_read(data->regmap, EC_ADDR_USB_C_POWER_PRIORITY, &value=
);
> +	if (ret < 0)
> +		return ret;
> +
> +	value &=3D USB_C_POWER_PRIORITY;
> +
> +	for (int i =3D 0; i < ARRAY_SIZE(USB_C_POWER_PRIORITY_OPTIONS_VALUE); =
++i) {
> +		if (USB_C_POWER_PRIORITY_OPTIONS_VALUE[i] =3D=3D value)
> +			count +=3D sysfs_emit_at(buf, count, "[%s] ",
> +					       USB_C_POWER_PRIORITY_OPTIONS_TEXT[i]);
> +		else
> +			count +=3D sysfs_emit_at(buf, count, "%s ",
> +					       USB_C_POWER_PRIORITY_OPTIONS_TEXT[i]);
> +	}
> +	if (count)
> +		buf[count - 1] =3D '\n';
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(usb_c_power_priority);
> +
>   static struct attribute *uniwill_attrs[] =3D {
>   	/* Keyboard-related */
>   	&dev_attr_fn_lock.attr,
> @@ -893,6 +971,7 @@ static struct attribute *uniwill_attrs[] =3D {
>   	&dev_attr_breathing_in_suspend.attr,
>   	/* Power-management-related */
>   	&dev_attr_ctgp_offset.attr,
> +	&dev_attr_usb_c_power_priority.attr,
>   	NULL
>   };
>  =20
> @@ -927,6 +1006,11 @@ static umode_t uniwill_attr_is_visible(struct kobj=
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
> @@ -1417,11 +1501,13 @@ static int uniwill_notifier_call(struct notifier=
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
> +		return notifier_from_errno(regmap_update_bits(data->regmap,
> +							      EC_ADDR_OEM_4,
> +							      USB_C_POWER_PRIORITY,
> +							      data->last_usb_c_power_priority));

You need to lock the associated mutex here before accessing last_usb_c_pow=
er_priority. Since this
is not possible inside a switch statement when using guard(), i suggest th=
at you move this code
(feature check + register access) into a small helper function.

>   	case UNIWILL_OSD_FN_LOCK:
>   		if (!uniwill_device_supports(data, UNIWILL_FEATURE_FN_LOCK))
>   			return NOTIFY_DONE;
> @@ -1515,10 +1601,15 @@ static int uniwill_probe(struct platform_device =
*pdev)
>   		return PTR_ERR(regmap);
>  =20
>   	data->regmap =3D regmap;
> +
>   	ret =3D devm_mutex_init(&pdev->dev, &data->super_key_lock);
>   	if (ret < 0)
>   		return ret;
>  =20
> +	ret =3D devm_mutex_init(&pdev->dev, &data->usb_c_power_priority_lock);
> +	if (ret < 0)
> +		return ret;

last_usb_c_power_priority still needs to be initialized with the value of =
USB_C_POWER_PRIORITY here.
I suggest that you move all of this (feature check + mutex + init) into a =
small helper function.

Thanks,
Armin Wolf

> +
>   	ret =3D uniwill_ec_init(data);
>   	if (ret < 0)
>   		return ret;
