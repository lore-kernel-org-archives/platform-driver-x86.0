Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B596EC5
	for <platform-driver-x86@vger.kernel.org>; Sun, 14 Jan 2024 16:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HNGEo2Al"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705250103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jdw+7gt1nEV0mGxoDo2azbfbm9yfPMBbLB8ljSRmOWw=;
	b=HNGEo2Al9IlK9z32lYOc5R5+4YZ/XbChiFGGo0QAN7tixvHr0+/F1w1hDStnpGF0gIw1uR
	RnKM2QDjOIr+bGhx1mfwIp/lJFuK62wUii5tZM0qQFaLcJkGHCqM0QRi7Z1qY2LyzGste+
	2JAMarPkL7v5aTLeGDV2FMH9OQlv4ug=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-Jn5DF4b2OTeDcmSOMwURLQ-1; Sun, 14 Jan 2024 11:35:01 -0500
X-MC-Unique: Jn5DF4b2OTeDcmSOMwURLQ-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-50eca8c00f1so4467062e87.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 14 Jan 2024 08:35:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705250100; x=1705854900;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jdw+7gt1nEV0mGxoDo2azbfbm9yfPMBbLB8ljSRmOWw=;
        b=Y/qVaZy116vOOASw1vSRL5KTnK4ZdA3V5Gezt9VU1AuecWvbmVoMmi6jXA2qr0uvde
         6E/LZZE8CdeT25Od4ZQJ0GuYLYmP6FzX1R5g4fxbRyxi3ERPxcWe/mANsOYOwOV0E3N6
         6WGrzOaBgS2paUsye8ONMgq/M7qDYKrlYDcpl7T1BFttMElyM/Jvw1Sqxc8mlx/rwkmf
         lyJNvcHv+xyOlKK70fSyaU7f25aDDUi33ZUm8yptJ/jfZrWM+zhG23cO9ry0jGgDqE2C
         Q94RgtxMX5L6BesVJdKErIvV1zqOyRwJSvOVXrytOtnm5yqeSWYrbbO5iNZbOBodYMhp
         PLGA==
X-Gm-Message-State: AOJu0YzqMlHqz+KteNUYTwPFnTtZbiTceFHMlgnSR0cGlTSRIyvJHEW+
	68h0QIH5lurPApibYCyezeCGOWp53KhXOoeXJAlLr1KsGuSNfNWKvgWBRmhNp1NMtUsj6ygHLr7
	o5OL5CWwuBlDA7b3Bi2eWJ7iDahADfsOSOoIHJMqv3A==
X-Received: by 2002:ac2:5588:0:b0:50e:69dd:e50b with SMTP id v8-20020ac25588000000b0050e69dde50bmr1589611lfg.61.1705250100410;
        Sun, 14 Jan 2024 08:35:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIl5uCbThz0WLz7YOKUIOuNhxgL2ymPZ4CGKN01WvHnxqufpWYX5B4lJRcmWU8OeE8Jg3pdg==
X-Received: by 2002:ac2:5588:0:b0:50e:69dd:e50b with SMTP id v8-20020ac25588000000b0050e69dde50bmr1589600lfg.61.1705250100096;
        Sun, 14 Jan 2024 08:35:00 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id s1-20020a1709060d6100b00a2684d2e684sm4275019ejh.92.2024.01.14.08.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jan 2024 08:34:59 -0800 (PST)
Message-ID: <3979bfb3-2cdc-4dce-a500-03c98c943eb7@redhat.com>
Date: Sun, 14 Jan 2024 17:34:58 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: remove obsolete calls to ledtrig_audio_get
Content-Language: en-US, nl
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, Perry Yuan <Perry.Yuan@dell.com>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: acpi4asus-user@lists.sourceforge.net,
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com,
 ibm-acpi-devel@lists.sourceforge.net
References: <dc5c0a33-ad25-4dac-828c-88dc78da0c9c@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <dc5c0a33-ad25-4dac-828c-88dc78da0c9c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Heiner

On 1/13/24 18:03, Heiner Kallweit wrote:
> Since 64f67b5240db ("leds: trigger: audio: Add an activate callback to
> ensure the initial brightness is set") the audio triggers have an
> activate callback which sets the LED brightness as soon as the
> (default) trigger is bound to the LED device. So we can remove the
> call to ledtrig_audio_get.
> 
> Positive side effect: There's no code dependency to ledtrig-audio any
> longer.

Thank you for your patch since these drivers now no longer
depend on the ledtrig-audio module can you please remove the:

        select LEDS_TRIGGERS
        select LEDS_TRIGGER_AUDIO

lines from the Kconfig bits for the modified drivers?

Regards,

Hans



> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/platform/x86/asus-wmi.c              | 1 -
>  drivers/platform/x86/dell/dell-laptop.c      | 2 --
>  drivers/platform/x86/dell/dell-wmi-privacy.c | 1 -
>  drivers/platform/x86/huawei-wmi.c            | 1 -
>  drivers/platform/x86/thinkpad_acpi.c         | 1 -
>  5 files changed, 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 18be35fdb..21dee425e 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1620,7 +1620,6 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
>  	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MICMUTE_LED)) {
>  		asus->micmute_led.name = "platform::micmute";
>  		asus->micmute_led.max_brightness = 1;
> -		asus->micmute_led.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
>  		asus->micmute_led.brightness_set_blocking = micmute_led_set;
>  		asus->micmute_led.default_trigger = "audio-micmute";
>  
> diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
> index 658643835..42f7de2b4 100644
> --- a/drivers/platform/x86/dell/dell-laptop.c
> +++ b/drivers/platform/x86/dell/dell-laptop.c
> @@ -2252,7 +2252,6 @@ static int __init dell_init(void)
>  	if (dell_smbios_find_token(GLOBAL_MIC_MUTE_DISABLE) &&
>  	    dell_smbios_find_token(GLOBAL_MIC_MUTE_ENABLE) &&
>  	    !dell_privacy_has_mic_mute()) {
> -		micmute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
>  		ret = led_classdev_register(&platform_device->dev, &micmute_led_cdev);
>  		if (ret < 0)
>  			goto fail_led;
> @@ -2261,7 +2260,6 @@ static int __init dell_init(void)
>  
>  	if (dell_smbios_find_token(GLOBAL_MUTE_DISABLE) &&
>  	    dell_smbios_find_token(GLOBAL_MUTE_ENABLE)) {
> -		mute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MUTE);
>  		ret = led_classdev_register(&platform_device->dev, &mute_led_cdev);
>  		if (ret < 0)
>  			goto fail_backlight;
> diff --git a/drivers/platform/x86/dell/dell-wmi-privacy.c b/drivers/platform/x86/dell/dell-wmi-privacy.c
> index c517bd45d..4d94603f7 100644
> --- a/drivers/platform/x86/dell/dell-wmi-privacy.c
> +++ b/drivers/platform/x86/dell/dell-wmi-privacy.c
> @@ -288,7 +288,6 @@ static int dell_privacy_leds_setup(struct device *dev)
>  	priv->cdev.max_brightness = 1;
>  	priv->cdev.brightness_set_blocking = dell_privacy_micmute_led_set;
>  	priv->cdev.default_trigger = "audio-micmute";
> -	priv->cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
>  	return devm_led_classdev_register(dev, &priv->cdev);
>  }
>  
> diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
> index 0ef1c46b6..dde139c69 100644
> --- a/drivers/platform/x86/huawei-wmi.c
> +++ b/drivers/platform/x86/huawei-wmi.c
> @@ -310,7 +310,6 @@ static void huawei_wmi_leds_setup(struct device *dev)
>  	huawei->cdev.max_brightness = 1;
>  	huawei->cdev.brightness_set_blocking = &huawei_wmi_micmute_led_set;
>  	huawei->cdev.default_trigger = "audio-micmute";
> -	huawei->cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
>  	huawei->cdev.dev = dev;
>  	huawei->cdev.flags = LED_CORE_SUSPENDRESUME;
>  
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index c4895e9bc..d1c9f91fd 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -9285,7 +9285,6 @@ static int mute_led_init(struct ibm_init_struct *iibm)
>  			continue;
>  		}
>  
> -		mute_led_cdev[i].brightness = ledtrig_audio_get(i);
>  		err = led_classdev_register(&tpacpi_pdev->dev, &mute_led_cdev[i]);
>  		if (err < 0) {
>  			while (i--)

