Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78F9280CD5;
	Tue, 21 Apr 2026 22:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776809032; cv=none; b=MTh7YmoaazoutcWf9vwoRGByF7PumiQC5ASGpUXl051rPaxKg4Spgtw9TcolosGyjrklrjXmsIe/gr9XBi/8mAxrksQl/rhgLRsJ5ywDATXX2fRmJTiSu2KpbCKUa9E6th5Rqc7EApNyoO68sF0HeQUwtx4156lGVW6AfeebxvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776809032; c=relaxed/simple;
	bh=jSpo4E3D0obnP0GYSvuDK08WiGsOi5DvMNbZAH+DZ3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l4kgDc7Pu+oC1gNbj+Zzn4QDynxhhEP5oh6R9NDHLbelNKwU7E3Wbq2woiVcMF4lTULoYiaGHTTzKwz0x4warZU3CHkQIK2qoY5LHmZp0mDnou+wgFCsKsbwbz8f8mWXTqeB7cnXAz5WoO5lBDOuA8dcb8U8Gcgh1czY3XBHUTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=uL2leVjm; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="uL2leVjm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1776809024; x=1777413824; i=w_armin@gmx.de;
	bh=Aoc47w7rm7TT2DKVOQCvlZRPQJnqh+szbT7+C+YvwaY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=uL2leVjmCyVDvBostdgr7lTAKHp7nVHsbhT3xiCEQw4dGTrQK1k4uHT+tvCZ3Q8W
	 d5gnqpFs+1s4glN+gB4bipo5BzNJsQ33vahW6GwQzDSn5Xd2jPr6od6tULy9RBMwI
	 dGV0rJJqVBCSIOmY6g+R90SN8GOtIrAkvIBfNGKxq0glmWEG6cGZqncI8DpyQnutk
	 DqFlaU6bgtt9WeCSMtsy+Oz/mrF1o6HlFNzg3VcX+NnaRvIvMXxMMgAkMpRduu5nK
	 mng9lkrr3CTjRzS5C+L0oZpr12VFxKNHbyL+vqVGLldXlKBJqgcYLvOcD3j9jR/vv
	 zg1maBQNySCL+2bGvw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAOJV-1w7rSm36sN-003eS8; Wed, 22
 Apr 2026 00:03:43 +0200
Message-ID: <c7543e73-f8c7-4ea7-8c86-e12ce37f97ef@gmx.de>
Date: Wed, 22 Apr 2026 00:03:41 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] platform/x86: uniwill-laptop: Offer support to
 activate local dimming
To: Werner Sembach <wse@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260421201103.142403-1-wse@tuxedocomputers.com>
 <20260421201103.142403-4-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260421201103.142403-4-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PUhhARPANkVFwcXpyJ6M94x8gcgR6CGjx1X2BnvXusZj3EBkVkj
 2TPU6AMzHEX8sOmsZZyow1gioozCMNuaYU7EpslycOZND1PNmNTrD0eONP9J3C55piy/rpw
 nybmcoetio/hAK8eLtxCKw3GMvdBkY17AjLdAsiNDwB8l3Y41965hYcXFsjS02R35erBqix
 S5jY567Q+pm19T6N6rGeQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:j10c/ABXyqY=;4HguErTRTbRbduSXvCwEaD7xG5D
 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

Am 21.04.26 um 22:01 schrieb Werner Sembach:

> This patch adds a sysfs variable local_dimming to supported devices.
> Setting it to true enables local dimming for the internal notebook displ=
ay.
>
> Currently only TUXEDO Stellaris 16 Gen7 Intel/AMD with mLED displays are
> supported.
>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 162 +++++++++++++++++++-
>   1 file changed, 158 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index 62d56cc67e2e8..909d8608a2f80 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -275,6 +275,9 @@
>   #define EC_ADDR_USB_C_POWER_PRIORITY	0x07CC
>   #define USB_C_POWER_PRIORITY		BIT(7)
>  =20
> +#define EC_ADDR_LOCAL_DIMMING_SUPPORT	0x0D4F
> +#define LOCAL_DIMMING_SUPPORT		BIT(0)
> +
>   /* Same bits as EC_ADDR_LIGHTBAR_AC_CTRL except LIGHTBAR_S3_OFF */
>   #define EC_ADDR_LIGHTBAR_BAT_CTRL	0x07E2
>  =20
> @@ -296,6 +299,14 @@
>  =20
>   #define EC_ADDR_GPU_FAN_SPEED_TABLE	0x0F50
>  =20
> +#define WMI_GUID_BC			"ABBC0F6F-8EA1-11D1-00A0-C90629100000"
> +#define WMI_DEFAULT_INSTANCE		0x00
> +#define WMI_DEFAULT_METHOD		0x04
> +
> +#define WMI_FUNC_SET_FEATURE		0x00000500
> +#define WMI_FEATURE_LOCAL_DIMMING_OFF	0x0d
> +#define WMI_FEATURE_LOCAL_DIMMING_ON	0x0e
> +
>   /*
>    * Those two registers technically allow for manual fan control,
>    * but are unstable on some models and are likely not meant to
> @@ -332,6 +343,7 @@
>   #define UNIWILL_FEATURE_SECONDARY_FAN		BIT(9)
>   #define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL	BIT(10)
>   #define UNIWILL_FEATURE_USB_C_POWER_PRIORITY	BIT(11)
> +#define UNIWILL_FEATURE_LOCAL_DIMMING		BIT(12)
>  =20
>   enum usb_c_power_priority_options {
>   	USB_C_POWER_PRIORITY_CHARGING =3D 0,
> @@ -367,6 +379,8 @@ struct uniwill_data {
>   	struct notifier_block nb;
>   	struct mutex usb_c_power_priority_lock; /* Protects dependent bit wri=
te and state safe */
>   	enum usb_c_power_priority_options last_usb_c_power_priority_option;
> +	struct mutex local_dimming_lock; /* Protects call to local dimming wmi=
 method */
> +	bool last_local_dimming_option;
>   };
>  =20
>   struct uniwill_battery_entry {
> @@ -774,7 +788,7 @@ static int super_key_enable_init(struct uniwill_data=
 *data)
>   	if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY))
>   		return 0;
>  =20
> -	return devm_mutex_init(&data->dev, &data->super_key_lock);
> +	return devm_mutex_init(data->dev, &data->super_key_lock);
>   }
>  =20
>   static int uniwill_write_touchpad_toggle_enable(struct uniwill_data *d=
ata, bool status)
> @@ -1086,6 +1100,87 @@ static int usb_c_power_priority_init(struct uniwi=
ll_data *data)
>   	return 0;
>   }
>  =20
> +struct __packed uniwill_wmi_input {
> +	u8 args[4];
> +	u32 function;
> +	/* Prevent accidential out of bounds access by the ACPI code */
> +	u32 reserved[8];
> +};
> +
> +static int set_local_dimming(bool enable)
> +{
> +	struct __packed uniwill_wmi_input wmi_input;
> +	struct acpi_buffer wmi_buf =3D { (acpi_size) sizeof(wmi_input), &wmi_i=
nput };
> +	acpi_status status;
> +
> +	wmi_input.function =3D WMI_FUNC_SET_FEATURE;
> +	wmi_input.args[0] =3D enable ? WMI_FEATURE_LOCAL_DIMMING_ON : WMI_FEAT=
URE_LOCAL_DIMMING_OFF;
> +
> +	status =3D wmi_evaluate_method(WMI_GUID_BC, WMI_DEFAULT_INSTANCE, WMI_=
DEFAULT_METHOD,
> +				     &wmi_buf, &wmi_buf);

NAK, this API is deprecated and should not be used. Instead we should regi=
ster a WMI driver during module
initialization that uses wmidev_invoke_method().

Can you share with me the ACPI tables of a device that supports this featu=
re?

Thanks,
Armin Wolf

> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static ssize_t local_dimming_store(struct device *dev,
> +				   struct device_attribute *attr,
> +				   const char *buf, size_t count)
> +{
> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
> +	bool enable;
> +	int ret;
> +
> +	ret =3D kstrtobool(buf, &enable);
> +	if (ret < 0)
> +		return ret;
> +
> +	guard(mutex)(&data->local_dimming_lock);
> +
> +	ret =3D set_local_dimming(enable);
> +	if (ret)
> +		return ret;
> +
> +	data->last_local_dimming_option =3D enable;
> +
> +	return count;
> +}
> +
> +static ssize_t local_dimming_show(struct device *dev,
> +				  struct device_attribute *attr,
> +				  char *buf)
> +{
> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%d\n", data->last_local_dimming_option);
> +}
> +
> +static DEVICE_ATTR_RW(local_dimming);
> +
> +static int local_dimming_restore(struct uniwill_data *data)
> +{
> +	guard(mutex)(&data->local_dimming_lock);
> +
> +	return set_local_dimming(data->last_local_dimming_option);
> +}
> +
> +static int local_dimming_init(struct uniwill_data *data)
> +{
> +	int ret;
> +
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_LOCAL_DIMMING))
> +		return 0;
> +
> +	ret =3D devm_mutex_init(data->dev, &data->local_dimming_lock);
> +	if (ret < 0)
> +		return ret;
> +
> +	data->last_local_dimming_option =3D 0;
> +
> +	return local_dimming_restore(data);
> +}
> +
>   static struct attribute *uniwill_attrs[] =3D {
>   	/* Keyboard-related */
>   	&dev_attr_fn_lock.attr,
> @@ -1097,6 +1192,7 @@ static struct attribute *uniwill_attrs[] =3D {
>   	/* Power-management-related */
>   	&dev_attr_ctgp_offset.attr,
>   	&dev_attr_usb_c_power_priority.attr,
> +	&dev_attr_local_dimming.attr,
>   	NULL
>   };
>  =20
> @@ -1136,6 +1232,11 @@ static umode_t uniwill_attr_is_visible(struct kob=
ject *kobj, struct attribute *a
>   			return attr->mode;
>   	}
>  =20
> +	if (attr =3D=3D &dev_attr_local_dimming.attr) {
> +		if (uniwill_device_supports(data, UNIWILL_FEATURE_LOCAL_DIMMING))
> +			return attr->mode;
> +	}
> +
>   	return 0;
>   }
>  =20
> @@ -1922,6 +2023,10 @@ static int uniwill_probe(struct platform_device *=
pdev)
>   	if (ret < 0)
>   		return ret;
>  =20
> +	ret =3D local_dimming_init(data);
> +	if (ret < 0)
> +		return ret;
> +
>   	return uniwill_input_init(data);
>   }
>  =20
> @@ -2075,6 +2180,14 @@ static int uniwill_resume_usb_c_power_priority(st=
ruct uniwill_data *data)
>   	return usb_c_power_priority_restore(data);
>   }
>  =20
> +static int uniwill_resume_local_dimming(struct uniwill_data *data)
> +{
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_LOCAL_DIMMING))
> +		return 0;
> +
> +	return local_dimming_restore(data);
> +}
> +
>   static int uniwill_resume(struct device *dev)
>   {
>   	struct uniwill_data *data =3D dev_get_drvdata(dev);
> @@ -2106,7 +2219,11 @@ static int uniwill_resume(struct device *dev)
>   	if (ret < 0)
>   		return ret;
>  =20
> -	return uniwill_resume_usb_c_power_priority(data);
> +	ret =3D uniwill_resume_usb_c_power_priority(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	return uniwill_resume_local_dimming(data);
>   }
>  =20
>   static DEFINE_SIMPLE_DEV_PM_OPS(uniwill_pm_ops, uniwill_suspend, uniwi=
ll_resume);
> @@ -2222,6 +2339,17 @@ static struct uniwill_device_descriptor tux_featu=
reset_3_nvidia_descriptor __ini
>   		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL,
>   };
>  =20
> +static struct uniwill_device_descriptor tux_featureset_3_nvidia_mled_de=
scriptor __initdata =3D {
> +	.features =3D UNIWILL_FEATURE_FN_LOCK |
> +		    UNIWILL_FEATURE_SUPER_KEY |
> +		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_GPU_TEMP |
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_SECONDARY_FAN |
> +		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
> +		    UNIWILL_FEATURE_LOCAL_DIMMING,
> +};
> +
>   static int phxtxx1_probe(struct uniwill_data *data)
>   {
>   	unsigned int value;
> @@ -2272,6 +2400,32 @@ static struct uniwill_device_descriptor phxarx1_p=
hxaqf1_descriptor __initdata =3D
>   	.probe =3D phxarx1_phxaqf1_probe,
>   };
>  =20
> +static int x6fr5xxy_probe(struct uniwill_data *data)
> +{
> +	unsigned int value;
> +	int ret;
> +
> +	ret =3D regmap_read(data->regmap, EC_ADDR_LOCAL_DIMMING_SUPPORT, &valu=
e);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (value !=3D 0xff && value & LOCAL_DIMMING_SUPPORT)
> +		data->features |=3D UNIWILL_FEATURE_LOCAL_DIMMING;
> +
> +	return 0;
> +};
> +
> +static struct uniwill_device_descriptor x6fr5xxy_descriptor __initdata =
=3D {
> +	.features =3D UNIWILL_FEATURE_FN_LOCK |
> +		    UNIWILL_FEATURE_SUPER_KEY |
> +		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_GPU_TEMP |
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_SECONDARY_FAN |
> +		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL,
> +	.probe =3D x6fr5xxy_probe,
> +};
> +
>   static struct uniwill_device_descriptor pf5pu1g_descriptor __initdata =
=3D {
>   	.features =3D UNIWILL_FEATURE_FN_LOCK |
>   		    UNIWILL_FEATURE_SUPER_KEY |
> @@ -2662,7 +2816,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR5xxY"),
>   		},
> -		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
> +		.driver_data =3D &x6fr5xxy_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen7 Intel",
> @@ -2678,7 +2832,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY_mLED"),
>   		},
> -		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
> +		.driver_data =3D &tux_featureset_3_nvidia_mled_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Book BA15 Gen10 AMD",
