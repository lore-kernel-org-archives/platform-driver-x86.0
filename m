Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011389;
	b=2aaAAOH4JjANE5NdsrxlDQimq8SPlzx4TB/J0dArF8q/aYF4fC/0G2axlikLhyee4aM7
	 D+6/8NFVoEBRSWOisFKluWmN3NNdLYZ9IX/7KNmiF/wcFulAY4q13TvO6ZbOMkzXkpPSY
	 aGflZxkvAlctBOFva/8scV7ql0lapmRXR5YywdWtFk0bKTe6RJz/JYZQLYqOyJBtkjcHf
	 R6B1P4GHAsLmo9+TcVFGTZPui8H/ajF+BuQXomV70yPDUVoZ8KgNiMvijyX1fDGBU5OKP
	 r9eC5y51+EBrQ2Y/bHQUN7vWFdJi9EcQ2utousCNEso3uo5fTbFrlKj0iLLoODrfqYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:From:To:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=E2uE6U5IlqqJIzgsEYgTj5XtWyRrbITzWSv2dlW7rWI=;
	b=yv2lmzyGY4FPHPrCB3L9UXfhBv7/oUisqVFCUDTl/fKds8uXEMBrDs9k+6Py+xxis5Ga
	 wIrvOZUxg+cq1PUahISlmuX1HUcMfAG1XfhLIK5/WpT0i3D0x6cWz04o2YkE3MWp9f2zH
	 HwcXzMpXzLDytCc0wJzejA+FrAcJxOSLIdB+kLFI0k4aG1MHdXlmO3oTcXmd4M2RimQdY
	 Op4f2ElH8xYXfXRTzQKLgjf/cElIiOkA9PZCNKJt0doz6weD8kLKW98HlcUJkyuV3dubt
	 Ez+r5oRjk2xTbXplOKYV8AjpsKR9240tCndh+Vrv0ByMnh7uNbj0C0bgk3KzZxUh/oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tj5JoK7y;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF49860A2626
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 14:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF49860A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tj5JoK7y
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso10352655e9.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 06:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795011387; x=1795616187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E2uE6U5IlqqJIzgsEYgTj5XtWyRrbITzWSv2dlW7rWI=;
        b=tj5JoK7yWf2+AJvSsuONNrWbO5LqmSj5OaCsC0jZe6JP9Rne/Sk6CKDCcwv/9NJhN5
         gxBpGDczt3a57lDNrlHjpbxP3r79iF+dzqA9qtKEaHXYwQMWfyZO+HpZk+ZOYepAnDJN
         eW5QILUUK3WKTpnONqdknmggc73Il/50Pc27aWZRLQJy+X4tdqJR85pvOHlKiz7Brhl9
         v++OERogRzy4Shwzj58YE8MwQjuVh2K+jnE5xf5fo27cpk93e3quKYwNLlIC271MBn+g
         bW8zN88XbUpug3SLyhQfwFRAnXPd8KRh5EwRuL28SbMqIRI5anKi6fUVuLkLsjhuZvEq
         5oGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795011387; x=1795616187;
        h=content-transfer-encoding:content-type:in-reply-to:references:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E2uE6U5IlqqJIzgsEYgTj5XtWyRrbITzWSv2dlW7rWI=;
        b=bIcTb+C5h09Lb8EkZL87JvAPAuCiyFHH/KAgJfJ8fFrQo6Evm65DTgsnzLjm9FWE7C
         mZki1PiJJjpDNu88LCTsEzhcNoFbWsy7lM1s0W8QvrlW6fFkLXwakrfeb2C0J6dScM6Z
         Kdi3EbTlXp83Rp7w+SR4qioGyp4PTMYQTKa2bo6MzROEwlgsEiW75sFIxqcgxtAa1Eqs
         saVQYFDptmP06HS2WpO6i0dFHhQ2V5KuA+HfWzkxCN/hwZsp8fiSM8SLF65pnfPeqtjf
         0L4BSmJ4NBz2TH7o+V2YPGwqoYdUTNtirT9x4sXCkgvzd94i3SQ4LuDhmyHeGhTN/UMA
         eA5g==
X-Gm-Message-State: APuU4Z9tuPamXMHrgvYJSwx0Sr9FxHJydwAPAtkxORVzGiZmMjo9r65C
	P+8llMhauGnsLA8VAlM3siLvIotNPnsyvCR8OH76VIzNkv82E0GLUvIbK7sIxg==
X-Gm-Gg: AYBFou0LsoOD6CKEW7bqttoogReQxxOn1lDDn2BJrzJ8rbZS9glbcwpWfIw3HXYutEg
	9b40ROo50nvVCM4PSsU0KizIYpAun/Ygl3N6dPjHtiIWsH1mYxVeElmbxcdVgYIC2zvOmMtGd2S
	RfgPgNkAgo4qax8ogkE3nHkoLA/n6KOVy60GiM4GuyvcRch0jQt5l2S86mZWFa6f7eTWQkaIFZm
	LmScC9xB4N+OTqdI8Q5XOsDl2Bn2G5gxP2vTBT+XaQz6YErNoTFt090ph5VIKPyl7ns79Yw3DpE
	Whlxlaj7NNuCg5ZUzi2OA8Oq+BggMy9r2FJxqZqqMty9FsP9YfuTFvJ3Mnl0B+pLl3ScEq8ZJCY
	zQDNMNGpvDm9Ti2HRblRtB4H8JceoYvag8CiWe2JrtqYZALZCC2OWLyFYA/lKpnmQmus3MxLNab
	iL8tRLUvxuLGV5dyj0kRy6tdMPU2LRVYcSfQmudfFHA9hAgvdTAwE0X8eNWq43zEvXALENxf6ka
	GMZQYfu6ysrccSTxs/CD6R2dZ7z+km0QFvKtsGChE26e4ws2SQo0y371qA7/oPqeQizKCASeJCW
	MVeww7+0O239uJC1YjNsBSfoYwJhl+CvQMPIJMQoeRxCPTmAM5GrJrJp6Q==
X-Received: by 2002:a05:600c:19d0:b0:4bb:5de1:e923 with SMTP id 5b1f17b1804b1-4bb7d6d1de3mr52114915e9.4.1795011387053;
        Wed, 18 Nov 2026 06:16:27 -0800 (PST)
Received: from [192.168.50.22] (windsurfer1001.plus.com. [81.174.251.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d28ec3asm76304525e9.0.2026.11.18.06.16.26
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 06:16:26 -0800 (PST)
Message-ID: <e416b334-a364-4289-b90d-6ff189c33e29@gmail.com>
Date: Wed, 18 Nov 2026 14:16:26 +0000
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] acer_wmi: Aspire A16-61M reports KEY_TOUCHPAD_OFF for both
 toggle states
Content-Language: en-GB
From: mike <mike.sapsard@gmail.com>
To: platform-driver-x86@vger.kernel.org
References: <f74ce9e7-34f6-4dec-bfc1-4e65941365d3@gmail.com>
In-Reply-To: <f74ce9e7-34f6-4dec-bfc1-4e65941365d3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

> Hello,
>
> I would like to report a possible Acer WMI firmware/driver 
> compatibility issue affecting the touchpad Fn key on my Acer Aspire 16 
> AI laptop.
>
> *System details*
>
>  *
>
>    Manufacturer: Acer
>
>  *
>
>    Model: Aspire A16-61M
>
>  *
>
>    BIOS: V1.20
>
>  *
>
>    OS: Linux Mint 22.3
>
>  *
>
>    Kernel: 7.0.0-43-generic
>
>  *
>
>    Desktop: Cinnamon 6.6.9 (X11)
>
>  *
>
>    Touchpad: PixArt PIXA382A:00 093A:382A
>
>  *
>
>    Kernel module: acer_wmi (in-tree)
>
> *Problem*
>
> The Acer touchpad Fn key correctly alternates between enabling and 
> disabling the physical touchpad.
>
> However, the Acer WMI hotkeys input device reports |KEY_TOUCHPAD_OFF 
> (532)|on both presses, regardless of the resulting touchpad state.
>
> Consequently, Cinnamon always displays a "Disabled" notification, even 
> when the touchpad has just been enabled.
>
> *Steps to reproduce*
>
> 1.
>
>    Start with the touchpad enabled.
>
> 2.
>
>    Run |sudo libinput debug-events --show-keycodes|.
>
> 3.
>
>    Press the touchpad Fn key to disable the touchpad.
>
> 4.
>
>    Press it again to re-enable the touchpad.
>
> 5.
>
>    Observe the reported events.
>
> *Actual diagnostic output*
>
> |event13 KEYBOARD_KEY +0.000s KEY_TOUCHPAD_OFF (532) pressed event13 
> KEYBOARD_KEY +0.000s KEY_TOUCHPAD_OFF (532) released event13 
> KEYBOARD_KEY +9.430s KEY_TOUCHPAD_OFF (532) pressed event13 
> KEYBOARD_KEY +9.430s KEY_TOUCHPAD_OFF (532) released|
>
> Both events originate from the |Acer WMI hotkeys|device.
>
> *Additional findings*
>
>  *
>
>    The Fn key correctly toggles the physical touchpad.
>
>  *
>
>    Both PixArt X11 devices retain |Device Enabled: 1|in either state.
>
>  *
>
>    Cinnamon's touchpad |send-events|setting remains
>    |disabled-on-external-mouse|in both states.
>
>  *
>
>    Libinput's disable-while-typing function works correctly.
>
>  *
>
>    The problem is reproducible with BIOS V1.20 and kernel 
> 7.0.0-43-generic.
>
>  *
>
>    An earlier invalid local libinput quirks override has been disabled,
>    and libinput now loads without that configuration error.
>
> *Possible explanation*
>
> The |acer_wmi|driver appears to determine whether to emit 
> |KEY_TOUCHPAD_ON|or |KEY_TOUCHPAD_OFF|from a firmware-reported device 
> state.
>
> I wonder whether the A16-61M firmware reports that state incorrectly, 
> or whether the driver requires a model-specific workaround.
>
> This is only a hypothesis; I have not established whether the issue 
> originates in the firmware or driver.
>
> *Expected behaviour*
>
> The system should report the correct touchpad state, or an appropriate 
> toggle event, allowing desktop environments to display an accurate 
> notification.
>
> I would be grateful if this could be investigated. I am happy to 
> perform further diagnostic tests if required.
>
> Kind regards
>

-- 
*Mike Sapsard*

