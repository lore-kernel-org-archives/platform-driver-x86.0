Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BA1276046
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Dec 2025 13:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766497844; cv=none; b=PvqV6PvBtPq7FZvTEE+dLjfLkH3oENmi9+KSMgHGTBBvdHliHFX1vA3DlmtZIMbHGEUdr0xXTG4jfSnWwPYiuzlXZ1m5L0SRMMyH6p4EBT9ZAbfOMxTceIzW98VLmVwzy4LP2ObGvlPT/05e25q+7S29K29EMaCq37Dvv8OrgcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766497844; c=relaxed/simple;
	bh=JQTXS/wYMzvek+4ggAsosG0VXdWLW1tbpUHCZl693sk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oP28adCEB4TVCXu3m5FFrWrQrrHu4hDF8KI0arkBJfGf9DqWS6a5ca3IhxWQClwv1YkrF549J34yW4Kj+NSfThfMArR1mFzBS/AmYSnVqLJlLYFWTULOzY2yrkCgZ9fBN+g+vjQrYUprZk06v2VlfQjt9KBooIQIu3xZFoFwbUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXJ5CAmr; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXJ5CAmr"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso41836525e9.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Dec 2025 05:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766497841; x=1767102641; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GqeoU932E3jkcWropIRFkLF7YQVKeZWJseuKYTCW02o=;
        b=FXJ5CAmrPPp8x6CUz3PkkkzMXkCHTCIKTwWnTV1vK4+wXHaV7hagJn7ubgYlHZNYFn
         tIq59oJsdYLQM8AtiebtL00jJgww51vo94zRSsP+forXTGMGM16j6wDoJessSc3x4Q18
         HC6CK1z30/w0ILrcErfJ1CLV7idlZnbtlae7xzLHLYMYI+BtjWanaUJO/65hyi+9Do3l
         Q+juMEEwN3A+FsamMTiEaMSdZHqJe5MIWntTNGLw46zGSRJBqP3b6zvI/7NNLjWMBte3
         vfoAvxSrrqFz5ra/LcHnlltNk/tPVULhflCKbdG1+wMPiJaaXfO3uaK1aFpgOgser8AU
         D/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766497841; x=1767102641;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GqeoU932E3jkcWropIRFkLF7YQVKeZWJseuKYTCW02o=;
        b=UwVVwCoLHAmKCBleHjmm7/8yJ5fUShh255MU2ZbDypKldqw5lb1TMKbkX8ybZzBOij
         pgOr/S/jovhEzsgaUWNhMOT25iFLCNfSe+EaQJ9hl34DnDl8F+bbwFYwPYmvS4vfQh8h
         HlcdYw0EMYCDGx8aDRIOo/7ViCj6f3SyAaa2srzK13c9fvfAliRa8gAwblMWzbRK44HS
         whmEdnqXwOhgz6tErVMHBBPcNr66v5OOmXkXWNHUwUB0XAam1lMxNNSLKXbzHMM8Q3o/
         Y+xTTm6+3qLyNmVKb+B/c5fFl80OoENZgpRlNUx0IOUVW/ZGLNsIzu4maEEz4ADlx0t0
         1oeA==
X-Forwarded-Encrypted: i=1; AJvYcCXwLjpX1F4WvlJP4yndP7AyoqvkzbUtHfTFH/i/3T3oucrgB0nhoMAP36VWABk/+/YSTF6rw2dhs0Mwo288Ga+3prZj@vger.kernel.org
X-Gm-Message-State: AOJu0Yyou5otna9AHTPwN1tXcptlezIf47l+uy6Eos4tVNsl8rQdTnRH
	tWRhL4tM0zFE+nJrhuQ0h8rdXaJkEHenFwl+dHYPEPV9dXs5wGwbm/KQ
X-Gm-Gg: AY/fxX5n9Lf2HnFSkqI4/x5y38t0IBaBfi7xBSs9R36BTyMobeH8iFCHTYYBTa9wJgd
	bqtdHhrXanbkullwgAcBPvGdjHS3fdxY6HZnU7wGib1k5DAj2Mf1Ru6xP95pwzqxtazKGSYOJqO
	QtYRxDGcfEOEIAuD6rnRYScEbUpIdP1TJBaBL7iS14wMgIJvy0vVFZ49/g7hzzmRwek+FXiS+GS
	FlDK3OhcRJRBT6CbsBYZJL8q4GHApYdZFEjDSyGyMkL4nwrC2F1ct6kUnlEstPPC720Ua4eN0E/
	FjeZjvNZIaTXzogltNKt3MZsIb6SrWEnS3cpnhP28bOmc4GLApLeh7tgxplazaZugPeTOSrULsC
	OjEwFzikrRgRISARdjqm4d3AvgjljNITNkt0UWV749/uGi+bmTQ2B7XFO4ntCMqDnyjxyWhiu3H
	DTtg8lWOQ9Bm3qBI8VU/iqu18=
X-Google-Smtp-Source: AGHT+IG8AsTo+t9sk0hU0othTg5pT8jTi5K0OjCjX+h2p6P+SMnZ3sYYS1W7tDwW8jnyO6+O/9AZsQ==
X-Received: by 2002:a05:6000:611:b0:42f:b690:6788 with SMTP id ffacd0b85a97d-4324e4c1264mr16049308f8f.10.1766497840775;
        Tue, 23 Dec 2025 05:50:40 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa08d9sm28704414f8f.30.2025.12.23.05.50.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 05:50:40 -0800 (PST)
Message-ID: <74f1a53d-3556-4e67-8dc2-2a86d6c52365@gmail.com>
Date: Tue, 23 Dec 2025 14:50:39 +0100
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
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <CAD4HHcVKCL-9CV5kWH_6oz0jmh=+eXP-xU7cm2FvAHHucrPF7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 12/22/25 11:44, Tim Wassink wrote:
> On Sun, Dec 21, 2025 at 10:01 PM Denis Benato <denis.benato@somemail.com> wrote:
>> On 12/21/25 22:01, Tim Wassink wrote:
>>> The ASUS Zenbook 14 (UX3405MA) uses a newer WMI interface for thermal
>>> management that does not support the legacy WMI fan control methods.
>>> Currently, this results in ENODEV (-19) errors in dmesg when the driver
>>> attempts to fetch factory fan curve defaults.
>>>
>>> Add a quirk to use quirk_asus_ignore_fan to silence these errors and
>>> signal that legacy fan control is intentionally unsupported, as thermal
>>> policies are handled through the platform_profile interface.
>> It is my understanding that this patch suppresses the error,
>> while maintaining the current behavior in every other aspect,
>> correct?
> I am actually not sure anymore if this patch is ok, as it introduces a
> trade-off regarding telemetry.
>
> While the patch successfully silences the ENODEV (-19) errors, I have
> verified locally that it also inhibits the registration of the fan
> telemetry in hwmon. This means the read-only 'fan1_input' (RPM) is no
> longer available to the user.
>
> I initially followed the precedent of commit 82cc5c6c624c ("platform/x86:
> asus-wmi: Ignore fan on E410MA"), which can be found here:
> https://lore.kernel.org/all/20221221-asus-fan-v1-2-e07f3949725b@weissschuh.net/
>
> Now I realize that case was specifically for a fanless system. The
> UX3405MA does have a physical fan
> which remains functional via the platform_profile (AIPT) interface
> after this patch, as confirmed by stress testing.
>
> I thought this quirk was the standard way to handle it, but I am not
> so sure anymore.
Hi,

I think what's happening is that asus-nb-wmi is binding multiple devices: for those
that are unsupported the driver returns -ENODEV and the kernel, as a result,
probes successive drivers for those devices that can't be bound.

It's very likely that using that quirk prevents asus-nb-wmi to bind all devices,
and this can very well result in what you are seeing...

The only runtime problem is that an error appears in dmesg, right? The rest is
working from what I can understand from your messages. 
> Best regards,
> Tim
>
> On Mon, Dec 22, 2025 at 3:54 AM Denis Benato <benato.denis96@gmail.com> wrote:
>>
>> On 12/21/25 22:01, Tim Wassink wrote:
>>> The ASUS Zenbook 14 (UX3405MA) uses a newer WMI interface for thermal
>>> management that does not support the legacy WMI fan control methods.
>>> Currently, this results in ENODEV (-19) errors in dmesg when the driver
>>> attempts to fetch factory fan curve defaults.
>>>
>>> Add a quirk to use quirk_asus_ignore_fan to silence these errors and
>>> signal that legacy fan control is intentionally unsupported, as thermal
>>> policies are handled through the platform_profile interface.
>> It is my understanding that this patch suppresses the error,
>> while maintaining the current behavior in every other aspect,
>> correct?
>>> Signed-off-by: Tim Wassink <timwassink.dev@gmail.com>
>>> ---
>>>  drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
>>>  1 file changed, 9 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
>>> index 6a62bc5b02fd..eaa8abe506cb 100644
>>> --- a/drivers/platform/x86/asus-nb-wmi.c
>>> +++ b/drivers/platform/x86/asus-nb-wmi.c
>>> @@ -544,6 +544,15 @@ static const struct dmi_system_id asus_quirks[] = {
>>>               },
>>>               .driver_data = &quirk_asus_zenbook_duo_kbd,
>>>       },
>>> +     {
>>> +             .callback = dmi_matched,
>>> +             .ident = "ASUS Zenbook 14 UX3405MA",
>>> +             .matches = {
>>> +                     DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "UX3405MA"),
>>> +             },
>>> +             .driver_data = &quirk_asus_ignore_fan,
>>> +     },
>>>       {
>>>               .callback = dmi_matched,
>>>               .ident = "ASUS ROG Z13",
