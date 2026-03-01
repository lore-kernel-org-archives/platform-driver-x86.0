Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3336C2517AC;
	Sun,  1 Mar 2026 13:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772370352; cv=none; b=AJRh2WH4s5RA2D3CoyCUg74WjZTc++pnhqSSrLdaHx8RIe4CjnRJDSzdC8hN3EAuWsaQYFaCV/cbfw+fIx8fFlY+hEeabn85+khEUzeih0X90b1n6QKRSjVs7/vX5LksTuEIeIJAOTKIz9LO07dRJL2eDGJW1RsV9/xknBJsAOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772370352; c=relaxed/simple;
	bh=/uLl0NV+S6xdfnWcvyH1FjAr9p1SVsBbtfkxNORvdVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NmcNgpKX99RgoSfHTwg1cb+bsitzYLMLTIg+NUUp3IEfdkZZ913FNHfZ4lRrfdEENi2tqnqNTUzJTSdXsmXJ4SFeDBnV2Wwx3f7uXaSFTfaw69pdttqz4iXEXcWqUe0HbzxYImXtnzOUVtBEiAP+OUdUpsnLWLzD+jJLBDwsKGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Vsy7cCu3; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Vsy7cCu3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772370348; x=1772975148; i=w_armin@gmx.de;
	bh=p7tKTDxlDiBzv2SAOLUMbPsarJHdxOqowwd5SD31rok=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Vsy7cCu3mwv2jEhcGXj6eMVg+Zpq7AIRDVnLftrS6CpSWm84/F4L5JN4EASJwgg9
	 /x8yfAeNlZLkAsTNrF9/XJe2J+iylFSRwPvoufida+TGhnBGtEPnHn8PWqlL5QICu
	 VehFlthIgWOyqmy2v1I347j6l1rbFQhT0imU3Z1TnmD6e30Do6BQP7pNwNtM60Fkv
	 1p3pEKo6AYG2nwvzfzJTjRi6X3bKHc8XdxgAGuNJPb8YVZAiOYFAZTbwomZ1e/bmX
	 Xt9cEBIznawUHKYnJjKCjbdHjE5qbKqo4miQUiZ+GxVd2A+skq9UrUzoY+N1xTNe+
	 eqKSvnj8aSRi4OYc+Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M5fIQ-1w3oIg0OVu-00Cehf; Sun, 01
 Mar 2026 14:05:48 +0100
Message-ID: <1f498e55-c365-4fb5-b06f-e0413774a453@gmx.de>
Date: Sun, 1 Mar 2026 14:05:46 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] platform/x86/uniwill: Implement USB-C power
 priority setting
To: Werner Sembach <wse@tuxedocomputers.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260227200906.514928-1-wse@tuxedocomputers.com>
 <20260227200906.514928-3-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260227200906.514928-3-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RyFXCyYQsRlPBmNVEEVkDOwCEcq8TRf1C1e5NNuaHwL62RXAWWI
 RsMOrW7mVyJrsC28ucmXD9DELTVYHRMGp3y6dAr/HH+fYjd1tzIpEULqMnkZ6IWQErSiFhY
 qTAiZggnMiVTAu/APA4NK1ONXudG5dqXsUzSD26REk8rOQ4awjHDZrUqtrzRbKL69RF92Xy
 1UuFd/NVPXhFjMIh3Iu8w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LhSjVCdQn+Y=;PXJw3X3rqKP5w+/lBHVfgAskQfs
 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

Am 27.02.26 um 21:07 schrieb Werner Sembach:

> On some devices Uniwill offers the option to set the USB-C port to
> prioritise charging or performance. This patch exposes this setting to t=
he
> userspace via sysfs for all TUXEDO devices supporting it.
>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 147 +++++++++++++++++++-
>   1 file changed, 140 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index 048b265bff374..f92c24d64160b 100644
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
> +	USB_C_POWER_PRIORITY_OPTIONS_CHARGING =3D 0,
> +	USB_C_POWER_PRIORITY_OPTIONS_PERFORMANCE,
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
> @@ -883,6 +894,106 @@ static int uniwill_nvidia_ctgp_init(struct uniwill=
_data *data)
>   	return 0;
>   }
>  =20
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
> +	enum usb_c_power_priority_options option;
> +	unsigned int value;
> +	int ret;
> +
> +	option =3D sysfs_match_string(USB_C_POWER_PRIORITY_OPTIONS_TEXT, buf);
> +	if (option < 0)
> +		return option;
> +
> +	value =3D USB_C_POWER_PRIORITY_OPTIONS_VALUE[option];
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
> +	unsigned int value, i;
> +	int ret;
> +
> +	ret =3D regmap_read(data->regmap, EC_ADDR_USB_C_POWER_PRIORITY, &value=
);
> +	if (ret < 0)
> +		return ret;
> +
> +	value &=3D USB_C_POWER_PRIORITY;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(USB_C_POWER_PRIORITY_OPTIONS_VALUE); ++i)
> +		if (USB_C_POWER_PRIORITY_OPTIONS_VALUE[i] =3D=3D value)
> +			return sysfs_emit(buf, "%s\n",
> +					  USB_C_POWER_PRIORITY_OPTIONS_TEXT[i]);
> +

Please drop this for-loop and use a if-statement instead:

	if (value & USB_C_POWER_PRIORITY)
		return sysfs_emit(buf, "%s\n", USB_C_POWER_PRIORITY_OPTIONS_TEXT[USB_C_P=
OWER_PRIORITY_OPTIONS_PERFORMANCE]);

	return sysfs_emit(buf, "%s\n", USB_C_POWER_PRIORITY_OPTIONS_TEXT[USB_C_PO=
WER_PRIORITY_OPTIONS_CHARGING]);

Also, i think USB_C_POWER_PRIORITY_OPTIONS_VALUE[] is unnecessary. Using a=
n if-statement would yield more readable
code than using for-loops in this case.

> +	/* Since all possible values are valid, this should be unreachable. */
> +	return -EINVAL;
> +}
> +
> +static DEVICE_ATTR_RW(usb_c_power_priority);
> +
> +static int usb_c_power_priority_restore(struct uniwill_data *data)
> +{
> +	unsigned int value;
> +
> +	value =3D USB_C_POWER_PRIORITY_OPTIONS_VALUE[data->last_usb_c_power_pr=
iority_option];

You need to take the appropriate mutex here.

> +
> +	return regmap_update_bits(data->regmap, EC_ADDR_USB_C_POWER_PRIORITY,
> +				  USB_C_POWER_PRIORITY, value);
> +}
> +
> +static int usb_c_power_priority_init(struct uniwill_data *data)
> +{
> +	unsigned int value, i;
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
> +	for (i =3D 0; i < ARRAY_SIZE(USB_C_POWER_PRIORITY_OPTIONS_VALUE); ++i)
> +		if (USB_C_POWER_PRIORITY_OPTIONS_VALUE[i] =3D=3D value) {
> +			data->last_usb_c_power_priority_option =3D i;
> +			return 0;
> +		}

Please drop this for-loop and use an if-statement instead.

> +
> +	/* Since all possible values are valid, this should be unreachable. */
> +	return -EINVAL;
> +}
> +
>   static struct attribute *uniwill_attrs[] =3D {
>   	/* Keyboard-related */
>   	&dev_attr_fn_lock.attr,
> @@ -893,6 +1004,7 @@ static struct attribute *uniwill_attrs[] =3D {
>   	&dev_attr_breathing_in_suspend.attr,
>   	/* Power-management-related */
>   	&dev_attr_ctgp_offset.attr,
> +	&dev_attr_usb_c_power_priority.attr,
>   	NULL
>   };
>  =20
> @@ -927,6 +1039,11 @@ static umode_t uniwill_attr_is_visible(struct kobj=
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
> @@ -1417,11 +1534,10 @@ static int uniwill_notifier_call(struct notifier=
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
> @@ -1515,10 +1631,15 @@ static int uniwill_probe(struct platform_device =
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
> @@ -1681,6 +1802,14 @@ static int uniwill_resume_nvidia_ctgp(struct uniw=
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

I think it would make sense to move the feature check into usb_c_power_pri=
ority_restore().
This way usb_c_power_priority_restore() can be called by both the notifier=
 and the resume
code directly.

It would also be very nice if you can include a short changelog with your =
next patch series.

Thanks,
Armin Wolf

> +
> +	return usb_c_power_priority_restore(data);
> +}
> +
>   static int uniwill_resume(struct device *dev)
>   {
>   	struct uniwill_data *data =3D dev_get_drvdata(dev);
> @@ -1704,7 +1833,11 @@ static int uniwill_resume(struct device *dev)
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
