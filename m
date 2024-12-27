Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2A4184F;
	Fri, 27 Dec 2024 00:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735260280; cv=none; b=aU/zfg8wJ+SKsc8uGBLP5LOeFXM6Qv8vnDLvYrV2EF/J3+t0AUEV/zYtoPf1ndtIUPvrV6abBDrQ5jOO0TMF35w80HGb0g8pjohuQTpN37ZLE4tGoayKcu6pjSNvUbsCGI1FGE5y6GAcrbP7InUC/7FE0Fe4YH8+jNGG/CFFct0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735260280; c=relaxed/simple;
	bh=pq9CbGWtn4yjEX0g+rfVmt40+OSpIsOahQl90V7pR5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZOktA1GL+yQSIZpQQNLkrbJELqqIoBOx8/g5JTjyciwGQ1R7H8pPzaMtvOrZmTxx3ILokupUEvbDx7q8Z/4ya26djGW5phFTuFGb8/cUELiQIF0jzxeeuiYpIsui/0bmLL7ziiGQpgA2jLOKSnHAiaYfkN+byTbYdb+deErytFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ZOcuez8A; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ZOcuez8A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735260265; x=1735865065; i=w_armin@gmx.de;
	bh=mYILtji4LcVFeYDg/UI0Fu3cWaNVaHDjiZj6He0+F+o=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ZOcuez8A1TtVIyePltv8dqce7UMQ/BwHooDCaw2q8qXBElvPsmASgoKBS5nM++NR
	 f/4b0jve8DpnEJ2S47CouvM4neibgFBUqHwn1J20yeINCoGqnlVpi8qbKdzjRFi0/
	 ZM+Aenm3vImdbhGJUXBSgiMrqw3Pvm5t0tA5TkZnt2/nxLCCxcFiWnV+o2Gh+joEl
	 8ipCuvzkhUj8F4vyCG7QrRLPlJF+6l4Jg9b8JbT9+O5flLhYzKtadFbH3OZVSXf2D
	 /oiOrWo6aoHNBeoPO0MS9AvhKx+wfPEK6+XhMJgePM0QKwfJX7uLt+af4o0xm6gZB
	 8q+0psQLrcSQ63a08A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M42jQ-1tQySm3uDI-004DXn; Fri, 27
 Dec 2024 01:44:25 +0100
Message-ID: <a4793eec-3d15-4a2a-9b7b-ff4da6cc8b6c@gmx.de>
Date: Fri, 27 Dec 2024 01:44:23 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/20] alienware-wmi: Improve hdmi_mux, amplifier and
 deepslp group creation
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
 hdegoede@redhat.com, linux-kernel@vger.kernel.org,
 Dell.Client.Kernel@dell.com
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-5-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241221055917.10555-5-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FSrEmLLqs40ir8wO4XnMvPu1Y8TJEyM+78cSF90hKYh7TZAAxF7
 8Lov4Ycwed472iKwkzVtp/vZmJOU6QLzMz1j9kQhE5NnkZlUVTKAiujO1WXdgyT07ShE3fy
 mQIFLoyr09bdDvhfeRPmsO6YUyXs3nJ9niaPU1n+pZ6Jg7OzniAXTaxNoxEhKC7N8f+yZsD
 uPohsGl1l12A457DAcuyg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kqti5l1dtQc=;aBeGmprbYct5umi3UICg/C6QpRH
 PUP0lwQOC9+Mi/iea1Olu/aCwFZ4jUDs1WtKvzBJO3X3NuvBeaj2sPex0saugyLDbY+WpY0Wc
 dCNOJS5llRi3tOcu86CG/s3zIGm9wlfMZd5RtQ1eqK8Voi84SsVIztEsDmceBJz25UW8ba1EI
 ZP8aG7vXH/8gsKAQ9GgVR0/GDYe9xNjeiMsmJRJnShSyhS1EX+T5ohJDTMynuh5+nMHLC9MT0
 DsmxoxDYu0++NJGTvUsnep+mNI0eXzuFix3YfoNx1A8KEEkCuK5xyxSnzTle/Mtn7IB5I2akA
 pedO8NHejNEa3CI23Jd4u2pVZex36agAIR0WOX/NHpUrh6KdhcEGsAPOpTDdxS5iLiNJs0tM5
 fJbovpIXXEkRe2fDIOBCb3t7Ikr4Ibdhz3oiunuPwdUyCrIVvdGphifZroDWJ0w9ozB8QZMwc
 Aa1n0Bzsy6nc/WsBAp4auInGIuYconXBHgY/ZrVjeX5uDunips4MhlUKXiVTPkMx2uAv3iwOK
 6Q5FutAhkjodMglubvXsnUtheOPCfKEYZSV50rX/ud/ej3No4vbfCCH1nbgSMtmV40qURDCwE
 eacT8at1KCQLOQ9LjSR3cJwxwG4pGyYRmnVLuWbdKn5juknKj5ywyzVQoruwcyt0hQni9EJiP
 rl5rwagApkvc1+8odxBOMerWd/D41CmD2lRqwjbr8rnQcQkySQChlmQkpX8Sz9P1q8+6+l+8K
 5Gknw9ttupyiidHGENZfVpatLAnz/+5rQ0BB/ewcSprRGY2NbyAARQfuJSnSMMgdPp4uBj1IF
 oEvsuoeMhNswuxHjwzPRne3gGzjz2ehouHLJv0FXzPhidgo4N4fCGBlqEOjbgtAx2srOjuQ2L
 xG92KGTQH0ZB72CT9WAtLWnEE9XjC/K1/eG642u23JoP8UBcqkEweaw7tDZVA21igsjo/qFuI
 vYLBdDQrcBuS/5C4tH/tXw1FBjVFKe7+0jW46DjLHwFRQXof9phYD7A8URvH7nXD5bl1jW9PM
 QEXMhE6VU8MBlVbxq1B4sKSNtoBCNCOkOtxXzSNnbvukOL2/0ScVPnKbFegDZylLJzSO8nXfN
 zkSUoCBmLhGA7fIyvvxNMCJioYProd

Am 21.12.24 um 06:59 schrieb Kurt Borja:

> Devices with hdmi_mux, amplifier or deepslp quirks create a sysfs group
> for each available feature. To accomplish this, helper create/remove
> functions were called on module init, but they had the following
> problems:
>
>   - Create helpers called remove helpers on failure, which in turn tried
>     to remove the sysfs group that failed to be created
>   - If group creation failed mid way, previous successfully created grou=
ps
>     were not cleaned up
>   - Module exit only removed hdmi_mux group
>
> To improve this, drop all helpers and let the platform driver manage the=
se
> sysfs groups, while controlling visibility with their respective quirks.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/x86/dell/alienware-wmi.c | 114 ++++++++--------------
>   1 file changed, 38 insertions(+), 76 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platfor=
m/x86/dell/alienware-wmi.c
> index 273ce9b10765..e010c94555e8 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -417,12 +417,6 @@ static struct platform_zone *zone_data;
>   static struct platform_profile_handler pp_handler;
>   static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROF=
ILE_LAST];
>
> -static struct platform_driver platform_driver =3D {
> -	.driver =3D {
> -		.name =3D "alienware-wmi",
> -	}
> -};
> -
>   static struct attribute_group zone_attribute_group =3D {
>   	.name =3D "rgb_zones",
>   };
> @@ -804,6 +798,12 @@ static DEVICE_ATTR(cable, S_IRUGO, show_hdmi_cable,=
 NULL);
>   static DEVICE_ATTR(source, S_IRUGO | S_IWUSR, show_hdmi_source,
>   		   toggle_hdmi_source);
>
> +static bool hdmi_group_visible(struct kobject *kobj)
> +{
> +	return quirks->hdmi_mux;
> +}
> +DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(hdmi);
> +
>   static struct attribute *hdmi_attrs[] =3D {
>   	&dev_attr_cable.attr,
>   	&dev_attr_source.attr,
> @@ -812,25 +812,10 @@ static struct attribute *hdmi_attrs[] =3D {
>
>   static const struct attribute_group hdmi_attribute_group =3D {
>   	.name =3D "hdmi",
> +	.is_visible =3D SYSFS_GROUP_VISIBLE(hdmi),
>   	.attrs =3D hdmi_attrs,
>   };
>
> -static void remove_hdmi(struct platform_device *dev)
> -{
> -	if (quirks->hdmi_mux > 0)
> -		sysfs_remove_group(&dev->dev.kobj, &hdmi_attribute_group);
> -}
> -
> -static int create_hdmi(struct platform_device *dev)
> -{
> -	int ret;
> -
> -	ret =3D sysfs_create_group(&dev->dev.kobj, &hdmi_attribute_group);
> -	if (ret)
> -		remove_hdmi(dev);
> -	return ret;
> -}
> -
>   /*
>    * Alienware GFX amplifier support
>    * - Currently supports reading cable status
> @@ -859,6 +844,12 @@ static ssize_t show_amplifier_status(struct device =
*dev,
>
>   static DEVICE_ATTR(status, S_IRUGO, show_amplifier_status, NULL);
>
> +static bool amplifier_group_visible(struct kobject *kobj)
> +{
> +	return quirks->amplifier;
> +}
> +DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(amplifier);
> +
>   static struct attribute *amplifier_attrs[] =3D {
>   	&dev_attr_status.attr,
>   	NULL,
> @@ -866,25 +857,10 @@ static struct attribute *amplifier_attrs[] =3D {
>
>   static const struct attribute_group amplifier_attribute_group =3D {
>   	.name =3D "amplifier",
> +	.is_visible =3D SYSFS_GROUP_VISIBLE(amplifier),
>   	.attrs =3D amplifier_attrs,
>   };
>
> -static void remove_amplifier(struct platform_device *dev)
> -{
> -	if (quirks->amplifier > 0)
> -		sysfs_remove_group(&dev->dev.kobj, &amplifier_attribute_group);
> -}
> -
> -static int create_amplifier(struct platform_device *dev)
> -{
> -	int ret;
> -
> -	ret =3D sysfs_create_group(&dev->dev.kobj, &amplifier_attribute_group)=
;
> -	if (ret)
> -		remove_amplifier(dev);
> -	return ret;
> -}
> -
>   /*
>    * Deep Sleep Control support
>    * - Modifies BIOS setting for deep sleep control allowing extra wakeu=
p events
> @@ -937,6 +913,12 @@ static ssize_t toggle_deepsleep(struct device *dev,
>
>   static DEVICE_ATTR(deepsleep, S_IRUGO | S_IWUSR, show_deepsleep_status=
, toggle_deepsleep);
>
> +static bool deepsleep_group_visible(struct kobject *kobj)
> +{
> +	return quirks->deepslp;
> +}
> +DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(deepsleep);
> +
>   static struct attribute *deepsleep_attrs[] =3D {
>   	&dev_attr_deepsleep.attr,
>   	NULL,
> @@ -944,25 +926,10 @@ static struct attribute *deepsleep_attrs[] =3D {
>
>   static const struct attribute_group deepsleep_attribute_group =3D {
>   	.name =3D "deepsleep",
> +	.is_visible =3D SYSFS_GROUP_VISIBLE(deepsleep),
>   	.attrs =3D deepsleep_attrs,
>   };
>
> -static void remove_deepsleep(struct platform_device *dev)
> -{
> -	if (quirks->deepslp > 0)
> -		sysfs_remove_group(&dev->dev.kobj, &deepsleep_attribute_group);
> -}
> -
> -static int create_deepsleep(struct platform_device *dev)
> -{
> -	int ret;
> -
> -	ret =3D sysfs_create_group(&dev->dev.kobj, &deepsleep_attribute_group)=
;
> -	if (ret)
> -		remove_deepsleep(dev);
> -	return ret;
> -}
> -
>   /*
>    * Thermal Profile control
>    *  - Provides thermal profile control through the Platform Profile AP=
I
> @@ -1172,6 +1139,23 @@ static void remove_thermal_profile(void)
>   		platform_profile_remove(&pp_handler);
>   }
>
> +/*
> + * Platform Driver
> + */
> +static const struct attribute_group *alienfx_groups[] =3D {
> +	&hdmi_attribute_group,
> +	&amplifier_attribute_group,
> +	&deepsleep_attribute_group,
> +	NULL
> +};
> +
> +static struct platform_driver platform_driver =3D {
> +	.driver =3D {
> +		.name =3D "alienware-wmi",
> +		.dev_groups =3D alienfx_groups,
> +	},
> +};
> +
>   static int __init alienware_wmi_init(void)
>   {
>   	int ret;
> @@ -1211,24 +1195,6 @@ static int __init alienware_wmi_init(void)
>   	if (ret)
>   		goto fail_platform_device2;
>
> -	if (quirks->hdmi_mux > 0) {
> -		ret =3D create_hdmi(platform_device);
> -		if (ret)
> -			goto fail_prep_hdmi;
> -	}
> -
> -	if (quirks->amplifier > 0) {
> -		ret =3D create_amplifier(platform_device);
> -		if (ret)
> -			goto fail_prep_amplifier;
> -	}
> -
> -	if (quirks->deepslp > 0) {
> -		ret =3D create_deepsleep(platform_device);
> -		if (ret)
> -			goto fail_prep_deepsleep;
> -	}
> -
>   	if (quirks->thermal) {
>   		ret =3D create_thermal_profile(platform_device);
>   		if (ret)
> @@ -1245,9 +1211,6 @@ static int __init alienware_wmi_init(void)
>   	alienware_zone_exit(platform_device);
>   	remove_thermal_profile();
>   fail_prep_thermal_profile:
> -fail_prep_deepsleep:
> -fail_prep_amplifier:
> -fail_prep_hdmi:
>   	platform_device_del(platform_device);
>   fail_platform_device2:
>   	platform_device_put(platform_device);
> @@ -1262,7 +1225,6 @@ module_init(alienware_wmi_init);
>   static void __exit alienware_wmi_exit(void)
>   {
>   	alienware_zone_exit(platform_device);
> -	remove_hdmi(platform_device);
>   	remove_thermal_profile();
>   	platform_device_unregister(platform_device);
>   	platform_driver_unregister(&platform_driver);
