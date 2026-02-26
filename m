Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D62286D70;
	Thu, 26 Feb 2026 01:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772068289; cv=none; b=XxBPjn34OSTqIaXqaYLHPKisff1tm5kWj6K2GNdt26WG4vRmJu0aMF8ML7g2Un0OgMZ4QYNW6s7XoHzfY2TIgHJgxdfKr6xfuq7DqWNtsCbGh7I/XJXnscAf6XwbEGbOKl72GCHcw7bwvsFoTcF5r2SVLAVzfwj3il3mPYnJ1Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772068289; c=relaxed/simple;
	bh=C0at+c31rgtCebKMEsnjWXQwiW2afrRRGHCx1WSJKtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sAR0c0Ec7wDtAgKpM0bH89CWRxOIYbTxOajh3LBAn5ocOceJg4LFGBD7sJFduZqRhqfofCppFQBCgjjv3lXX86RfDF4Ig+j5XrSLPXCZQ/gtCF1VKkURnE2/EycvxBJ/AzlTpE7YPywlURv/krg/wly2Yg5S4XVGQ/2BJVbRxQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=laoCScrd; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="laoCScrd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772068277; x=1772673077; i=w_armin@gmx.de;
	bh=Q0MK6rkb6/okY49dDmejFwQnJ1c5pM8mikYYwiPFZ4w=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=laoCScrdZvcx3EUAGfNj6kn4CEA0zi5fxyWocQLSZ/oC9Y8twXnYClsz8n+m/IyM
	 CgSwEHmElIpriHpRdcbYvERr8cT2WLkfw6SKsbqM9/aI6S50voBU06AE2poO0uWB8
	 dRLoFclqWL9+0rs8KStbHKvSu25+CM/Yy19m8ubsvnNJFO7OXgd4v3qej5el5i6bK
	 UNceG6fx8m/VGqjv9iesXPMGP9c24gpwsoEuN2ZtR8+4obNVe+gefre72tikpqqEy
	 q3LBd0VmZ2/tm9tU6tIcOfJrCRS6cLFlMjP4qZzbFmg0uCYRBHNE0QdX9dm3Npwln
	 I5W5uCXylke3WkxdnQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N2V0H-1viRit3Mdz-00rJH1; Thu, 26
 Feb 2026 02:11:17 +0100
Message-ID: <fb265a61-df38-472e-b155-c19f4dea2049@gmx.de>
Date: Thu, 26 Feb 2026 02:11:15 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] platform/x86/uniwill: Implement USB-C power priority
 setting
To: Werner Sembach <wse@tuxedocomputers.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260226003408.1623547-1-wse@tuxedocomputers.com>
 <20260226003408.1623547-2-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260226003408.1623547-2-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Mfk5LXfpGjCGwmfmYR/cz3ZRadV/pecPGXoyi8r8ObMUmql4tNl
 Fi2JMTr3QOM0/9CeTlYVch3a7im3ZNHtF+3qLrXfwcZIWezYfotLwDKCMgS50G9j2JyWJdk
 RbP322VMLuF+KDivifJHpNIh0PMjYo4w67x6ep4NLCEcuA0b++GCGQSgkOOKF+dS/zrAUdb
 eNaWrCi+fjGn2wc0SiOkw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ExPkbisC2Ms=;khmgrrTFOZF4cZxYYOU+Mrx+zX9
 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
 H4rQekDiY8wVkIxTkkSs

Am 26.02.26 um 01:31 schrieb Werner Sembach:

> On some devices Uniwill offers the option to set the USB-C port to
> prioritise charging or performance. This patch exposes this setting to t=
he
> userspace via sysfs for all TUXEDO devices supporting it.
>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 99 +++++++++++++++++++--
>   1 file changed, 94 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index 7ab82cf16f388..4d9657a3b8c10 100644
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
> @@ -343,6 +344,7 @@ struct uniwill_data {
>   	struct mutex input_lock;	/* Protects input sequence during notify */
>   	struct input_dev *input_device;
>   	struct notifier_block nb;
> +	unsigned int last_usb_c_power_priority;
>   };
>  =20
>   struct uniwill_battery_entry {
> @@ -527,6 +529,7 @@ static bool uniwill_writeable_reg(struct device *dev=
, unsigned int reg)
>   	case EC_ADDR_CTGP_DB_CTGP_OFFSET:
>   	case EC_ADDR_CTGP_DB_TPP_OFFSET:
>   	case EC_ADDR_CTGP_DB_DB_OFFSET:
> +	case EC_ADDR_USB_C_POWER_PRIORITY:
>   		return true;
>   	default:
>   		return false;
> @@ -565,6 +568,7 @@ static bool uniwill_readable_reg(struct device *dev,=
 unsigned int reg)
>   	case EC_ADDR_CTGP_DB_CTGP_OFFSET:
>   	case EC_ADDR_CTGP_DB_TPP_OFFSET:
>   	case EC_ADDR_CTGP_DB_DB_OFFSET:
> +	case EC_ADDR_USB_C_POWER_PRIORITY:
>   		return true;
>   	default:
>   		return false;
> @@ -587,6 +591,7 @@ static bool uniwill_volatile_reg(struct device *dev,=
 unsigned int reg)
>   	case EC_ADDR_TRIGGER:
>   	case EC_ADDR_SWITCH_STATUS:
>   	case EC_ADDR_CHARGE_CTRL:
> +	case EC_ADDR_USB_C_POWER_PRIORITY:
>   		return true;
>   	default:
>   		return false;
> @@ -883,6 +888,86 @@ static int uniwill_nvidia_ctgp_init(struct uniwill_=
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

Please put a blank line here.

> +	value =3D USB_C_POWER_PRIORITY_OPTIONS_VALUE[ret];
> +
> +	ret =3D regmap_update_bits(data->regmap, EC_ADDR_USB_C_POWER_PRIORITY,
> +				 USB_C_POWER_PRIORITY, value);
> +	if (ret < 0)
> +		return ret;
> +

I think you need a mutex here, so concurrent writes to the charging priori=
ty
sysfs attribute are serialized. This mutex would then also protect concurr=
ent
access to data->last_usb_c_power_priority by the event handler.

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

Please just emit USB_C_POWER_PRIORITY_OPTIONS_VALUE[USB_C_POWER_PRIORITY_O=
PTIONS_PERFORMANCE] directly
when the bit is set, and USB_C_POWER_PRIORITY_OPTIONS_VALUE[USB_C_POWER_PR=
IORITY_OPTIONS_CHARGING] otherwise.
This for loop provides no real value.

> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(usb_c_power_priority);
> +
> +static int usb_c_power_priority_restore(struct uniwill_data *data)
> +{
> +	int ret;
> +
> +	ret =3D regmap_update_bits(data->regmap, EC_ADDR_OEM_4, USB_C_POWER_PR=
IORITY,
> +				 data->last_usb_c_power_priority);
> +	if (ret < 0)
> +		return ret;
> +
> +	return ret;

Please check the feature flag here before performing the register access. =
You should also
omit "ret" and instead return the result directly.

Maybe you also need to add the appropriate suspend/resume functions for th=
is?

> +}
> +
>   static struct attribute *uniwill_attrs[] =3D {
>   	/* Keyboard-related */
>   	&dev_attr_fn_lock.attr,
> @@ -893,6 +978,7 @@ static struct attribute *uniwill_attrs[] =3D {
>   	&dev_attr_breathing_in_suspend.attr,
>   	/* Power-management-related */
>   	&dev_attr_ctgp_offset.attr,
> +	&dev_attr_usb_c_power_priority.attr,
>   	NULL
>   };
>  =20
> @@ -927,6 +1013,11 @@ static umode_t uniwill_attr_is_visible(struct kobj=
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
> @@ -1417,9 +1508,7 @@ static int uniwill_notifier_call(struct notifier_b=
lock *nb, unsigned long action
>  =20
>   		return NOTIFY_OK;
>   	case UNIWILL_OSD_DC_ADAPTER_CHANGED:
> -		/* noop for the time being, will change once charging priority
> -		 * gets implemented.
> -		 */
> +		usb_c_power_priority_restore(data);

Please use notifier_from_errno() here.

Thanks,
Armin Wolf

>  =20
>   		return NOTIFY_OK;
>   	case UNIWILL_OSD_FN_LOCK:
