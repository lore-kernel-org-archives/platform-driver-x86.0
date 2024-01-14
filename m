Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57ADB28F4
	for <platform-driver-x86@vger.kernel.org>; Sun, 14 Jan 2024 18:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LEhA+1ys"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705258614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G8k+j3Zq1KBDKp3ZxSbZTbYrJN4lVOTmWHBkEE278hE=;
	b=LEhA+1ysIAV7eFMnLjk+eN5G1lSKAsKx92ALpYC/SgxucDUYh0ap+3blqKM3sp3ejZNYDU
	V76YMt/f9hdC9dyTcE7+zRFEJDKWjjzNdQdLEP8tXPMpbZJgJV8P1PiUMfj7z7nsRQSeb7
	E/rWOklnTXUTO4RLie01TSRsSUrRSoI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-aU2tG8UFN_ikgyGej59wGg-1; Sun, 14 Jan 2024 13:56:52 -0500
X-MC-Unique: aU2tG8UFN_ikgyGej59wGg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a2b6c2a5fddso263155266b.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 14 Jan 2024 10:56:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705258611; x=1705863411;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G8k+j3Zq1KBDKp3ZxSbZTbYrJN4lVOTmWHBkEE278hE=;
        b=Jhp+XwJrnzUT8zChOP8u9NPe9jp7xHwq1J1/GN7ZHj8hCnztPJpM1AeudTvk+med+n
         +wc1kNgJ7GUzFw9hoU4rfRS4mtwtRo8v0tJMk7byqURgiGBcTwvG81ZkK7ekEw/wAbB2
         E4SZGsVQ6gYPg5XMgIGxbbbRiD/pAh0XnUdblM6vTdDpgWP7J11Olp1vAXT7s5ZkKo32
         1o9CGHB42IB9V/r9iKnu/QL61aVoF+U01x9ptwmyXqStd3JTm0zlA7m64T8LqKBRSSDR
         T0r8CJY65nMox9xhVj/lljFWa17Gnc8t+iSc3xdIt0XPjlybMOtA68ml0D5pWgbTt0Ps
         fzAg==
X-Gm-Message-State: AOJu0Yx5BA0gI23Y/5/IGnPGRnH4RIE8rg2W4tOwgfCKuarRAATWG4fX
	dITdEXg3gJNY+Xv2aLvIIae3Kr2eqAC0JB6Px1ZU+So5TSk78L6KXdCQ1FHRwd3MM1hVsmu/NM+
	fvbOUT7iWzh6fK05j4rdBZ0KsajiYpeDROZyU/h6o/A==
X-Received: by 2002:a17:907:c8a:b0:a28:b2b0:fe14 with SMTP id gi10-20020a1709070c8a00b00a28b2b0fe14mr1723698ejc.144.1705258611729;
        Sun, 14 Jan 2024 10:56:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSNiCsEUJI5eVbBBEbjbotuVhPqw90/G9K4Dl6iBGhhTex5Ig38s4LEdup5Nfp2GGqVMBoKQ==
X-Received: by 2002:a17:907:c8a:b0:a28:b2b0:fe14 with SMTP id gi10-20020a1709070c8a00b00a28b2b0fe14mr1723695ejc.144.1705258611473;
        Sun, 14 Jan 2024 10:56:51 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id st7-20020a170907c08700b00a2cfa8edbcesm2646129ejc.199.2024.01.14.10.56.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jan 2024 10:56:51 -0800 (PST)
Message-ID: <52263b68-b52c-43e3-b038-211bc7eed3bb@redhat.com>
Date: Sun, 14 Jan 2024 19:56:50 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: remove obsolete calls to
 ledtrig_audio_get
Content-Language: en-US, nl
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: acpi4asus-user@lists.sourceforge.net,
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com,
 ibm-acpi-devel@lists.sourceforge.net
References: <daef7331-dcb4-4b3a-802e-656629486b4c@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <daef7331-dcb4-4b3a-802e-656629486b4c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/14/24 18:14, Heiner Kallweit wrote:
> Since 64f67b5240db ("leds: trigger: audio: Add an activate callback to
> ensure the initial brightness is set") the audio triggers have an
> activate callback which sets the LED brightness as soon as the
> (default) trigger is bound to the LED device. So we can remove the
> call to ledtrig_audio_get.
> 
> Positive side effect: There's no code dependency to ledtrig-audio any
> longer, what allows to remove some Kconfig dependencies.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - remove Kconfig dependencies related to the audio LED trigger

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/platform/x86/Kconfig                 | 6 ------
>  drivers/platform/x86/asus-wmi.c              | 1 -
>  drivers/platform/x86/dell/Kconfig            | 3 ---
>  drivers/platform/x86/dell/dell-laptop.c      | 2 --
>  drivers/platform/x86/dell/dell-wmi-privacy.c | 1 -
>  drivers/platform/x86/huawei-wmi.c            | 1 -
>  drivers/platform/x86/thinkpad_acpi.c         | 1 -
>  7 files changed, 15 deletions(-)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index bdd302274..6dbd40e2a 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -56,8 +56,6 @@ config HUAWEI_WMI
>  	depends on INPUT
>  	select INPUT_SPARSEKMAP
>  	select LEDS_CLASS
> -	select LEDS_TRIGGERS
> -	select LEDS_TRIGGER_AUDIO
>  	select NEW_LEDS
>  	help
>  	  This driver provides support for Huawei WMI hotkeys, battery charge
> @@ -269,8 +267,6 @@ config ASUS_WMI
>  	select INPUT_SPARSEKMAP
>  	select LEDS_CLASS
>  	select NEW_LEDS
> -	select LEDS_TRIGGERS
> -	select LEDS_TRIGGER_AUDIO
>  	select ACPI_PLATFORM_PROFILE
>  	help
>  	  Say Y here if you have a WMI aware Asus laptop (like Eee PCs or new
> @@ -507,8 +503,6 @@ config THINKPAD_ACPI
>  	select NVRAM
>  	select NEW_LEDS
>  	select LEDS_CLASS
> -	select LEDS_TRIGGERS
> -	select LEDS_TRIGGER_AUDIO
>  	help
>  	  This is a driver for the IBM and Lenovo ThinkPad laptops. It adds
>  	  support for Fn-Fx key combinations, Bluetooth control, video
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
> diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
> index e712df67f..bd9f44597 100644
> --- a/drivers/platform/x86/dell/Kconfig
> +++ b/drivers/platform/x86/dell/Kconfig
> @@ -57,8 +57,6 @@ config DELL_LAPTOP
>  	select POWER_SUPPLY
>  	select LEDS_CLASS
>  	select NEW_LEDS
> -	select LEDS_TRIGGERS
> -	select LEDS_TRIGGER_AUDIO
>  	help
>  	This driver adds support for rfkill and backlight control to Dell
>  	laptops (except for some models covered by the Compal driver).
> @@ -165,7 +163,6 @@ config DELL_WMI
>  
>  config DELL_WMI_PRIVACY
>  	bool "Dell WMI Hardware Privacy Support"
> -	depends on LEDS_TRIGGER_AUDIO = y || DELL_WMI = LEDS_TRIGGER_AUDIO
>  	depends on DELL_WMI
>  	help
>  	  This option adds integration with the "Dell Hardware Privacy"
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

