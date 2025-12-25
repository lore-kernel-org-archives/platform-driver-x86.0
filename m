Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F160927F754
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Dec 2025 17:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766682843; cv=none; b=WUDZJNyoeEAskPqOfjKdTukXGuBbdJyRFOu4CdY34KRcd+qcVj9GI2Uel8+KnbHY7/UCjVe25V49bx9+W3uDbUzG7DsSzQs46kE+0tnIqHChGMQ+5pBoqI7yclpa/rpauDEzT7Ws0goZIB/Ed+8mLKi/jkXihNM0NRQxAMHhxzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766682843; c=relaxed/simple;
	bh=JyqiU+nSIoi30u5aBUuzbePbJQaUZjsH/VU6JqQh40w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZcZA/ouaHQ9S/vw+35/Gxp24Poyf9BeBAaYtCjqcnDLWRkpN6NqdYfSCKt0n0EgVRDOrzADU7IGRovCHsSyoR5rO1RPlLAq8oTNb6wjF5F7xd7TnP4nitSgOHM8EHX8ogepjMxMtUhi84FJy3LW8Y6owOEJf9XuNPLIgZahs91I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PaWpZv3y; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PaWpZv3y"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47d3ffa6720so10626025e9.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Dec 2025 09:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766682837; x=1767287637; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J02DSARA50fLgHgJBNysiJn5LkYB29lpMUN/ojmuv5g=;
        b=PaWpZv3yRMgtW0qlKQIJb9cbf3nRt9oNK1EUFRncFnajMn98U2VzE3LPDW7dgclWcJ
         t9l/qbGPLvtIjqih/Y+4KLesjH/QwJ8XAvdNVG44asV6OTUq8T9gohtSGXiOCBOMrMba
         k6g3NXYDegX05UIjKpBOkRxRuC3oo5XOEmyA1M7lrD2BhzmrCDfon24ZAF55zMrmj3N9
         c4h2+/G2RBkT6HfX6WoDOcLz3npidmXlx9ZX1NJHRX54bz+CF1LOs8pShqIe4uuSKjxd
         qro0h8GFyTSgAYdS9PO9iylF4Wju8Kq1UGEXeo+NZc98Pwi3yUHwl2vkJ+Hf98RxEbtC
         evYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766682837; x=1767287637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J02DSARA50fLgHgJBNysiJn5LkYB29lpMUN/ojmuv5g=;
        b=fe7BX4entqo1BicroC+uWg+8Du70KB26BB8PljAxEf/hTbhrJHXfLr/m2CtNkt7fBG
         EJYOoS6I8uP3HMN+d0gegfILK9vQ2J6XxufGrFUlbUKGE5Feg4y16ivs1CjWc1trbNK6
         M42BWhk6wa63U0tJEbuYizLD0TrEtaFRFlvGiUpgbs5XdQThLatPFVh6ujKkpTmdZmQ4
         qNFjs5Z/P+xxnEjqaQBLNmFwoddFFjao0ilB7axOrdZ/QtAMB4NPEugjq3uaani9MyF6
         0ysFFeyscRqwCFZMwzaWLOAbmcyw12m8wpyI3TucbxTBPWLBnRe0w7vPiUApkogSiEKL
         7syA==
X-Forwarded-Encrypted: i=1; AJvYcCXdJWkzFY2dOJv6AncJ3yKt1CknBGiRGpNHwPc5CV5ewdPKE5CBbor1jVZ4OqqIGXuuiMK2T0BmiAGdPcns7GoNoxLz@vger.kernel.org
X-Gm-Message-State: AOJu0Yye3LEUc/m14S2lxvDCl47GJQ57TMIy0llKZghjX+zvjm/S+9aH
	djZwVVoCI23f9yrIkFodHoiSrN2LG7AZqOCtZNG3D5wGGWXpvp6eboXo
X-Gm-Gg: AY/fxX41taGvCYiTTNIOVN2DWKo7ZJqlhLoiE4q3OpyF+mgyeK208U25jGran+p0z8T
	RNK0TJU7piSv1UmPGeQPVeto0KhJS93lkkm21sj9aYA0ORFDY6/wZHcfTH0uopj/EtBIt717x4N
	xD+YRPjIZNU3jlevtms6hF1n+v3mRvBFKxYAVqCA7KMBFRvi6FWW0yDiB4QE1070qzzs9Hn5hjd
	L0RzLxZ9tqQMf2bH0IadI81cgLig4Ek3JGWqPBT0cXK5eaRbpJyb+AS4eT09YrVB+j/YR9bNQXQ
	XidHiwIGdwSGQRfCx2QfpPeV1H+RmZTuek/EPdTM2BLFWb1skY+Df7gVsF+jmZKaXTKTVFFAZdL
	KpwUFimYEbCx+e1V+nnCtyMb5aT1ZCaFkMpc+E0Za8QK5SNMWeMGi5ivx4qjgIFqwJRS2PY2kM9
	nS6BNWjE4IZXQ/ibFOqX5IDN0=
X-Google-Smtp-Source: AGHT+IHoZhq8SVAipdNH7xE9wyhQnfuq3z56aGjMvtz7PZ/zOPLpecF3r2gK41lOG6sx9jcWcULjGw==
X-Received: by 2002:a05:600c:1d1d:b0:477:abea:9023 with SMTP id 5b1f17b1804b1-47d19577fb8mr217809585e9.9.1766682836550;
        Thu, 25 Dec 2025 09:13:56 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be2723d19sm434751195e9.2.2025.12.25.09.13.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Dec 2025 09:13:56 -0800 (PST)
Message-ID: <e2bf55e6-b5ec-4865-bd67-54183a65c14e@gmail.com>
Date: Thu, 25 Dec 2025 18:13:55 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: add quirk_asus_ignore_fan for
 UX3405MA
To: Tim Wassink <timwassink.dev@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251221210218.12274-1-timwassink.dev@gmail.com>
 <b02a7c96-9653-4ab2-ac4a-86d365af1a2d@gmail.com>
 <CAD4HHcVKCL-9CV5kWH_6oz0jmh=+eXP-xU7cm2FvAHHucrPF7w@mail.gmail.com>
 <74f1a53d-3556-4e67-8dc2-2a86d6c52365@gmail.com>
 <CAD4HHcXvyC+xFGZ+PgFRv3F+tYwsfp6cxDh9ZOpquZOg29VOBQ@mail.gmail.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <CAD4HHcXvyC+xFGZ+PgFRv3F+tYwsfp6cxDh9ZOpquZOg29VOBQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 12/25/25 00:43, Tim Wassink wrote:
> Hi,
>  
> yes the only problem is the error in dmesg, the rest seems to work.
Then I think we can leave this as-is, unless there is a particular reason
to ensure no errors are being reported in this case.

This is not the only module that does things this way, so I don't think
it's going to be a problem.

Thank you for your time and looking into the matter :)
>
> On Tue, Dec 23, 2025 at 2:50 PM Denis Benato <benato.denis96@gmail.com> wrote:
>>
>> On 12/22/25 11:44, Tim Wassink wrote:
>>> On Sun, Dec 21, 2025 at 10:01 PM Denis Benato <denis.benato@somemail.com> wrote:
>>>> On 12/21/25 22:01, Tim Wassink wrote:
>>>>> The ASUS Zenbook 14 (UX3405MA) uses a newer WMI interface for thermal
>>>>> management that does not support the legacy WMI fan control methods.
>>>>> Currently, this results in ENODEV (-19) errors in dmesg when the driver
>>>>> attempts to fetch factory fan curve defaults.
>>>>>
>>>>> Add a quirk to use quirk_asus_ignore_fan to silence these errors and
>>>>> signal that legacy fan control is intentionally unsupported, as thermal
>>>>> policies are handled through the platform_profile interface.
>>>> It is my understanding that this patch suppresses the error,
>>>> while maintaining the current behavior in every other aspect,
>>>> correct?
>>> I am actually not sure anymore if this patch is ok, as it introduces a
>>> trade-off regarding telemetry.
>>>
>>> While the patch successfully silences the ENODEV (-19) errors, I have
>>> verified locally that it also inhibits the registration of the fan
>>> telemetry in hwmon. This means the read-only 'fan1_input' (RPM) is no
>>> longer available to the user.
>>>
>>> I initially followed the precedent of commit 82cc5c6c624c ("platform/x86:
>>> asus-wmi: Ignore fan on E410MA"), which can be found here:
>>> https://lore.kernel.org/all/20221221-asus-fan-v1-2-e07f3949725b@weissschuh.net/
>>>
>>> Now I realize that case was specifically for a fanless system. The
>>> UX3405MA does have a physical fan
>>> which remains functional via the platform_profile (AIPT) interface
>>> after this patch, as confirmed by stress testing.
>>>
>>> I thought this quirk was the standard way to handle it, but I am not
>>> so sure anymore.
>> Hi,
>>
>> I think what's happening is that asus-nb-wmi is binding multiple devices: for those
>> that are unsupported the driver returns -ENODEV and the kernel, as a result,
>> probes successive drivers for those devices that can't be bound.
>>
>> It's very likely that using that quirk prevents asus-nb-wmi to bind all devices,
>> and this can very well result in what you are seeing...
>>
>> The only runtime problem is that an error appears in dmesg, right? The rest is
>> working from what I can understand from your messages.
>>> Best regards,
>>> Tim
>>>
>>> On Mon, Dec 22, 2025 at 3:54 AM Denis Benato <benato.denis96@gmail.com> wrote:
>>>> On 12/21/25 22:01, Tim Wassink wrote:
>>>>> The ASUS Zenbook 14 (UX3405MA) uses a newer WMI interface for thermal
>>>>> management that does not support the legacy WMI fan control methods.
>>>>> Currently, this results in ENODEV (-19) errors in dmesg when the driver
>>>>> attempts to fetch factory fan curve defaults.
>>>>>
>>>>> Add a quirk to use quirk_asus_ignore_fan to silence these errors and
>>>>> signal that legacy fan control is intentionally unsupported, as thermal
>>>>> policies are handled through the platform_profile interface.
>>>> It is my understanding that this patch suppresses the error,
>>>> while maintaining the current behavior in every other aspect,
>>>> correct?
>>>>> Signed-off-by: Tim Wassink <timwassink.dev@gmail.com>
>>>>> ---
>>>>>  drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
>>>>>  1 file changed, 9 insertions(+)
>>>>>
>>>>> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
>>>>> index 6a62bc5b02fd..eaa8abe506cb 100644
>>>>> --- a/drivers/platform/x86/asus-nb-wmi.c
>>>>> +++ b/drivers/platform/x86/asus-nb-wmi.c
>>>>> @@ -544,6 +544,15 @@ static const struct dmi_system_id asus_quirks[] = {
>>>>>               },
>>>>>               .driver_data = &quirk_asus_zenbook_duo_kbd,
>>>>>       },
>>>>> +     {
>>>>> +             .callback = dmi_matched,
>>>>> +             .ident = "ASUS Zenbook 14 UX3405MA",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "UX3405MA"),
>>>>> +             },
>>>>> +             .driver_data = &quirk_asus_ignore_fan,
>>>>> +     },
>>>>>       {
>>>>>               .callback = dmi_matched,
>>>>>               .ident = "ASUS ROG Z13",
