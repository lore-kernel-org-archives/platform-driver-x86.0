Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28925EC5
	for <platform-driver-x86@vger.kernel.org>; Sun, 14 Jan 2024 16:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d8C9Ck2R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705250211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YTddHP4o53J1u0u/L+vKkChvXUE/z8/TOXP3i5W8SvY=;
	b=d8C9Ck2R9Duk+gIrQLvTCjvrdU7gnErYSgDch64aKAN57HDta940xXrnpJGynjVurqxvF2
	oejnEQUlqKwBy+6yEC+50ckk8tbSH5yBvaxvDXh53yRA3RB0FGveGKMjpAn1maOmD7hy48
	dzt8aPVWD9dbKHEz3jmh8+je4iY9M3Q=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-2r8uvTHdOWKNcdQRhAXJSg-1; Sun, 14 Jan 2024 11:36:50 -0500
X-MC-Unique: 2r8uvTHdOWKNcdQRhAXJSg-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2cccdcfea74so2368201fa.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 14 Jan 2024 08:36:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705250208; x=1705855008;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YTddHP4o53J1u0u/L+vKkChvXUE/z8/TOXP3i5W8SvY=;
        b=qGsh11GH4rSF+8sR5IW1miOqJog3vWYeXoK7EuOpGlViBOQUlfmlB6BOx8jn6N4AbZ
         Je7tP8PO7WFcxXnE+2rH37RFWyWTSV/CLW1Ra0WfleqoQF//LfFTvPnR141+98zjLvmg
         KtBSHmhj4qYXAZUXbKnUQ6Sx3sxEWk0gnGf1sjAvZRoTY0xI1wS2BannHC7X0yRGfmJL
         PUBq99VN0/PU8chsHfNdVMdsabxV6dpPl9m2khf8jhSerYlGMvYunXUcBz2nIKHpsKTD
         rzAVI11oKbHcVX3o+aG7mYm+sTlvGlbVoqACTkUN7mvVtwy2yGRMhBvLu5uof9M83rvr
         MSiA==
X-Gm-Message-State: AOJu0Yyuvm5/mJIXYrS8sFSdjql+LGj82adxMiEY1X7oRunRXVwYthZQ
	Q7UZOrEqu24t/9Hk1UQshwf3Xj1OPYpY1G82E79JTYTLCjAvEHax8RZsza5H1SnSrmUe1Q8ZY3k
	t+yMDuJQuoeqZ7X/Ayap/Op7CoZM32Xtno2KojT9xGg==
X-Received: by 2002:ac2:4e6e:0:b0:50e:7c70:f8da with SMTP id y14-20020ac24e6e000000b0050e7c70f8damr1922320lfs.16.1705250208805;
        Sun, 14 Jan 2024 08:36:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmXTx8a+M6M3wuE0+Lok3KNqVzbU7OyFFc0qcpREaxBX/m+PRjR+bZAPSzJqh28sGrojuGWA==
X-Received: by 2002:ac2:4e6e:0:b0:50e:7c70:f8da with SMTP id y14-20020ac24e6e000000b0050e7c70f8damr1922313lfs.16.1705250208464;
        Sun, 14 Jan 2024 08:36:48 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id bl2-20020a170906c24200b00a29d232ab76sm4240686ejb.182.2024.01.14.08.36.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jan 2024 08:36:47 -0800 (PST)
Message-ID: <7eb0afeb-4301-4128-8902-66175b5659f1@redhat.com>
Date: Sun, 14 Jan 2024 17:36:47 +0100
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
 Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com
References: <dc5c0a33-ad25-4dac-828c-88dc78da0c9c@gmail.com>
 <d7dde671-bceb-4f5d-b4b6-99561fc77ac8@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <d7dde671-bceb-4f5d-b4b6-99561fc77ac8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Heiner,

On 1/13/24 18:16, Heiner Kallweit wrote:
> On 13.01.2024 18:03, Heiner Kallweit wrote:
>> Since 64f67b5240db ("leds: trigger: audio: Add an activate callback to
>> ensure the initial brightness is set") the audio triggers have an
>> activate callback which sets the LED brightness as soon as the
>> (default) trigger is bound to the LED device. So we can remove the
>> call to ledtrig_audio_get.
>>
>> Positive side effect: There's no code dependency to ledtrig-audio any
>> longer.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/platform/x86/asus-wmi.c              | 1 -
>>  drivers/platform/x86/dell/dell-laptop.c      | 2 --
>>  drivers/platform/x86/dell/dell-wmi-privacy.c | 1 -
>>  drivers/platform/x86/huawei-wmi.c            | 1 -
>>  drivers/platform/x86/thinkpad_acpi.c         | 1 -
>>  5 files changed, 6 deletions(-)
>>
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>> index 18be35fdb..21dee425e 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -1620,7 +1620,6 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
>>  	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MICMUTE_LED)) {
>>  		asus->micmute_led.name = "platform::micmute";
>>  		asus->micmute_led.max_brightness = 1;
>> -		asus->micmute_led.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
>>  		asus->micmute_led.brightness_set_blocking = micmute_led_set;
>>  		asus->micmute_led.default_trigger = "audio-micmute";
>>  
>> diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
>> index 658643835..42f7de2b4 100644
>> --- a/drivers/platform/x86/dell/dell-laptop.c
>> +++ b/drivers/platform/x86/dell/dell-laptop.c
>> @@ -2252,7 +2252,6 @@ static int __init dell_init(void)
>>  	if (dell_smbios_find_token(GLOBAL_MIC_MUTE_DISABLE) &&
>>  	    dell_smbios_find_token(GLOBAL_MIC_MUTE_ENABLE) &&
>>  	    !dell_privacy_has_mic_mute()) {
>> -		micmute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
>>  		ret = led_classdev_register(&platform_device->dev, &micmute_led_cdev);
>>  		if (ret < 0)
>>  			goto fail_led;
>> @@ -2261,7 +2260,6 @@ static int __init dell_init(void)
>>  
>>  	if (dell_smbios_find_token(GLOBAL_MUTE_DISABLE) &&
>>  	    dell_smbios_find_token(GLOBAL_MUTE_ENABLE)) {
>> -		mute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MUTE);
>>  		ret = led_classdev_register(&platform_device->dev, &mute_led_cdev);
>>  		if (ret < 0)
>>  			goto fail_backlight;
>> diff --git a/drivers/platform/x86/dell/dell-wmi-privacy.c b/drivers/platform/x86/dell/dell-wmi-privacy.c
>> index c517bd45d..4d94603f7 100644
>> --- a/drivers/platform/x86/dell/dell-wmi-privacy.c
>> +++ b/drivers/platform/x86/dell/dell-wmi-privacy.c
>> @@ -288,7 +288,6 @@ static int dell_privacy_leds_setup(struct device *dev)
>>  	priv->cdev.max_brightness = 1;
>>  	priv->cdev.brightness_set_blocking = dell_privacy_micmute_led_set;
>>  	priv->cdev.default_trigger = "audio-micmute";
>> -	priv->cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
>>  	return devm_led_classdev_register(dev, &priv->cdev);
>>  }
>>  
>> diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
>> index 0ef1c46b6..dde139c69 100644
>> --- a/drivers/platform/x86/huawei-wmi.c
>> +++ b/drivers/platform/x86/huawei-wmi.c
>> @@ -310,7 +310,6 @@ static void huawei_wmi_leds_setup(struct device *dev)
>>  	huawei->cdev.max_brightness = 1;
>>  	huawei->cdev.brightness_set_blocking = &huawei_wmi_micmute_led_set;
>>  	huawei->cdev.default_trigger = "audio-micmute";
>> -	huawei->cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
>>  	huawei->cdev.dev = dev;
>>  	huawei->cdev.flags = LED_CORE_SUSPENDRESUME;
>>  
>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>> index c4895e9bc..d1c9f91fd 100644
>> --- a/drivers/platform/x86/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>> @@ -9285,7 +9285,6 @@ static int mute_led_init(struct ibm_init_struct *iibm)
>>  			continue;
>>  		}
>>  
>> -		mute_led_cdev[i].brightness = ledtrig_audio_get(i);
>>  		err = led_classdev_register(&tpacpi_pdev->dev, &mute_led_cdev[i]);
>>  		if (err < 0) {
>>  			while (i--)
> 
> The mail to Perry bounced (user unknown), does the MAINTAINERS entry need an update?
> 
> Perry Yuan <Perry.Yuan@dell.com>

Yes I believe that you are right can you please send a MAINTAINERS patch
dropping the:

M:      Perry Yuan <Perry.Yuan@dell.com>

line, leaving the:

L:      Dell.Client.Kernel@dell.com

line as the primary contact for the "DELL WMI HARDWARE PRIVACY SUPPORT" ?

Regards,

Hans




