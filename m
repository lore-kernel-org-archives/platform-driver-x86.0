Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E5F30E838;
	Sat, 25 Jul 2026 14:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784990708; cv=none; b=JVr4EeG0aFfqgMC6GQ723oYeWIfWCa5xlhE3NNE5smJXeEtgKl/FmtEB7MQjmu4Sfztq2/6tLyfb+HmZ7fNA5N+VxpxdH+4tyYspqvE0cUlwlLxBxehTe1Vxthq1VN+cXk8uSVSSQoxdJym28sPNk8FltZXPRr6wYkfAiuyxc9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784990708; c=relaxed/simple;
	bh=bibKzrrLwqjOSMVQWjJi61sDUH+qlCk0nluaBSBtU7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eiAFJ4JZRYmPxwGOqxXjdq2oUeCUF0fgMbnHAMrTpL1vGd+rR4myOk96+1jfkJE+go0A/9odBdve8KlLboVXGwyqelGZNOoxZi55tSz7dPB9c7d0743Jyhse6aml8RDXcm40G0ZpVCsmlf4uUlLt73ZCsmHh9f3Yq5w6fSnpJIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=hOyZ0uyZ; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="hOyZ0uyZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1784990697; x=1785595497; i=w_armin@gmx.de;
	bh=t0VE1FPhZJH1CR4k6Oue2U6e13+hRUr7HlLMY3KQxLY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=hOyZ0uyZ3lVmg3csT8lTJjOb8xpwhVRf2VLiVsDjCMOFeW4xwSA/oB+NpLWGb4p8
	 rI0Nu+RbzyVsGWTpyehyUbzthC575E+mn6xNS6jgOuTr1bbRp1tboHCmIQNdSf8pn
	 rstwMt4DPBx9EhcTPRncWouHAJz0SjofBWYJBugOI+i1F2hGFu1NdK78dRLox51k5
	 Tb7o2wDLCysHTw6eG10ceXB+8ceXw7jPJjfWtp3HyAkXcQ1WPZlfW+A3hs3NdFZE1
	 5J8Mz8CFJNMXiURC4JCbmMuA9mBhAJczS4Yz6qvEItNGe3y4yHa+kLwRROEh4/AQB
	 8SJcMhAWxhic7qQetw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MysVs-1x9zjP0kjq-010wlO; Sat, 25
 Jul 2026 16:44:57 +0200
Message-ID: <98179131-7beb-4ce0-93ca-2ebc58826d56@gmx.de>
Date: Sat, 25 Jul 2026 16:44:55 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86: uniwill-laptop: Fix brightness notify
 for 3 level keyboards
To: Werner Sembach <wse@tuxedocomputers.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260724230056.708736-1-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260724230056.708736-1-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RglqJR7oTlN8jasHXw1oeouZ7bLAl2BcBoqpf3SljF1C/cFp8Fp
 m7OJ7LP8GoVRzV14WPE9tygzn1M3W1jCek9XgqHBx5YEnG6EjWZ32A9JX/qo3EQRHAk4/LB
 Gezvy/kykavWmCT36LJO29kUMhAR4WJ5QQKZ1TvegEuW1ImOhSBngYt9itWyObMR2R6zl22
 6cIeaQs0y175xMpN34J7Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9myFCZqaRsE=;dNtMcQf+QnW9UDU1ZC1eTOkebW1
 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

Am 25.07.26 um 01:00 schrieb Werner Sembach:

> The devices with 3 brightness level keyboards seem to send
> UNIWILL_OSD_KB_LED_LEVEL0, UNIWILL_OSD_KB_LED_LEVEL2, and
> UNIWILL_OSD_KB_LED_LEVEL4 and not UNIWILL_OSD_KB_LED_LEVEL0,
> UNIWILL_OSD_KB_LED_LEVEL1, and UNIWILL_OSD_KB_LED_LEVEL2 so this patch d=
oes
> not return the brightness based on one of these events, but the brightne=
ss
> read from hardware.
>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 22 +++------------------
>   1 file changed, 3 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index 7a2eeaec4c961..d9a33be4f4a37 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -1626,7 +1626,7 @@ static int uniwill_led_init(struct uniwill_data *d=
ata)
>   							 &init_data);
>   }
>  =20
> -static int uniwill_notify_kbd_led(struct uniwill_data *data, int bright=
ness)
> +static int uniwill_notify_kbd_led(struct uniwill_data *data)
>   {
>   	struct led_classdev *led_cdev;
>   	int ret;
> @@ -1643,7 +1643,7 @@ static int uniwill_notify_kbd_led(struct uniwill_d=
ata *data, int brightness)
>   	if (ret < 0)
>   		return ret;
>  =20
> -	led_classdev_notify_brightness_hw_changed(led_cdev, brightness);
> +	led_classdev_notify_brightness_hw_changed(led_cdev, led_cdev->brightne=
ss);

WMI events are usually delivered with a large latency, a userspace applica=
tion could
have changed the LED brightness value in the meantime.

Please check the maximum keyboard backlight brightness inside uniwill_noti=
fy_kbd_led()
and translate the brightness values instead:

/* Comment here */
switch (data->kbd_led_max_brightness) {
case 4:
	break;
case 2:
	switch (brightness) {
	case 0:
		break;
	case 2:
		brightness =3D 1;
		break;
	case 4:
		brightness =3D 2;
		break;
	default:
		return -EINVAL;
	}
	break;
default:
	return -EINVAL;
}

Thanks,
Armin Wolf

>  =20
>   	return 0;
>   }
> @@ -2215,30 +2215,14 @@ static int uniwill_notifier_call(struct notifier=
_block *nb, unsigned long action
>  =20
>   		return NOTIFY_OK;
>   	case UNIWILL_OSD_KB_LED_LEVEL0:
> -		if (!uniwill_device_supports(data, UNIWILL_FEATURE_KEYBOARD_BACKLIGHT=
))
> -			return NOTIFY_DONE;
> -
> -		return notifier_from_errno(uniwill_notify_kbd_led(data, 0));
>   	case UNIWILL_OSD_KB_LED_LEVEL1:
> -		if (!uniwill_device_supports(data, UNIWILL_FEATURE_KEYBOARD_BACKLIGHT=
))
> -			return NOTIFY_DONE;
> -
> -		return notifier_from_errno(uniwill_notify_kbd_led(data, 1));
>   	case UNIWILL_OSD_KB_LED_LEVEL2:
> -		if (!uniwill_device_supports(data, UNIWILL_FEATURE_KEYBOARD_BACKLIGHT=
))
> -			return NOTIFY_DONE;
> -
> -		return notifier_from_errno(uniwill_notify_kbd_led(data, 2));
>   	case UNIWILL_OSD_KB_LED_LEVEL3:
> -		if (!uniwill_device_supports(data, UNIWILL_FEATURE_KEYBOARD_BACKLIGHT=
))
> -			return NOTIFY_DONE;
> -
> -		return notifier_from_errno(uniwill_notify_kbd_led(data, 3));
>   	case UNIWILL_OSD_KB_LED_LEVEL4:
>   		if (!uniwill_device_supports(data, UNIWILL_FEATURE_KEYBOARD_BACKLIGH=
T))
>   			return NOTIFY_DONE;
>  =20
> -		return notifier_from_errno(uniwill_notify_kbd_led(data, 4));
> +		return notifier_from_errno(uniwill_notify_kbd_led(data));
>   	default:
>   		mutex_lock(&data->input_lock);
>   		sparse_keymap_report_event(data->input_device, action, 1, true);
>
> base-commit: caf8342512c3056005f475d350eeca089c3c6623
