Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4609D13A88A
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Mar 2025 08:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742114513; cv=none; b=OO3M8FcZyHdyLw52G808paoAI/NcHR2U/zmXLh/yB3a7gTm2dsF4MAHxGOOquTPCJNeSpQQeuO/kuKV7B5k5qni9sWsbPFK1zEsIa5O+S3+EaXhmIi2AOfiHwDN+uvLSS5OSgZONZLLLIAVD2Elu++XddmGPL2uFyvDoxCTy18Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742114513; c=relaxed/simple;
	bh=FXNTqTjcp1gbuFVFMTbVol3ohNl5oNHJOTQW4nYx83g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l4INXgVMCH/cdJbijE7UknprJBItfNwg7x25sHSe1loeQDro1bJ/HguMqi9TYJ+DJYM33rgQRcpN7d75c8T5VuqiunyWOaEgq1udXOmcbqPFWudsCLG1jxTp3RwemrazRnyUgLUANZLLCaNidYxsAV4vEgyIHIxGJVPZ54OTq9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LeAPskd6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LeAPskd6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742114510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+abFIsd/ddurdu/l0D//7eGFOOC4wSQYe9kijyVlV9c=;
	b=LeAPskd6XoxPUPJv/q2l2GNy7ohE7INsLdqICQCRI7Y81LxGrhjzep0WHtv4Z9f20Ce7Di
	jsDdRO4SCYMWGYfy8mvzREvzQ8B05PK7sRl/VbifB605zK/0KB0JCDSKVwOxpbUrel9eID
	d/a7pJbJYTZYQvdRa3cMb+KPEgUG1v4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-0POfIwYBNHC5InhFgu4cNA-1; Sun, 16 Mar 2025 04:41:48 -0400
X-MC-Unique: 0POfIwYBNHC5InhFgu4cNA-1
X-Mimecast-MFC-AGG-ID: 0POfIwYBNHC5InhFgu4cNA_1742114507
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac293748694so321077266b.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 16 Mar 2025 01:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742114507; x=1742719307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+abFIsd/ddurdu/l0D//7eGFOOC4wSQYe9kijyVlV9c=;
        b=CalCiIfUkj2TZlz5zKttuVRlNsYceVl1FhlBcvpwdPYRSt7xypG6fnPrfM4qBW5rYa
         DCbcrDfKuZgFNtwN5PTqczc9nMa04bDOTvfJkSzZdgrTE0/15qyWu+2WVJTjCx24KLQr
         +sSy3mjRIu4iv0diXp4oZt2ESP3w6COt+CabNacBdbJwVIg4o6KyfXnBFW5NWx0S1oCC
         WqrEcDP+HnK4jd4pNBGGdkZfSssE9gT0IS9AkXSMih1O/hvB5iSauf+yl0X9HWHJJM6P
         0E1s0SrHalceOmDcCXCPgxO7KlX6ByjdhimF2z01tfuV47hFwId1vWt/XdbqQ/X96a+9
         0TVw==
X-Forwarded-Encrypted: i=1; AJvYcCWUUi3bIIq029fhLGtnEgbZO1MPWQXNY8Kp9O9H2WuvkmQK31dwoMnnnzWlSy1f7L8GYJyCzHoJgZzenTHv11XUUgQL@vger.kernel.org
X-Gm-Message-State: AOJu0YyOHauU5g8JPL2aGSgx3RKeenh25L9T70iDYnYEhmTf42Ao3t5H
	msQhVzEFUfmSXZKQzWjqoZzQWYDqDaHJXRkZXUdS0Wo7osWDSV+dyA+/GS19HnZfrcBRT9IBePE
	lForvnR1FR7sLGlwb92aYkjoMsVqX9VWGIQ1/vkca5HKXH5Ff2qrycTxyRhf0iRBZgI90EXU=
X-Gm-Gg: ASbGncskPDKXWxUj9sUrIOrxGyNXkdoEeo67oDmT/vPtlUB06jpSkqkMVZWHZPiUun0
	xFOlb7icF9RmsawAbEdX4FYASklic7eu3MhDZmMk7o2q3Zwq6PCCjOFbSc4VV8KodMrp7xliCui
	kq4fjk7nrtXwUGU/BU3eu4rvQsJrWmDoF+8t1tdhnDg9AnVakW+9ZZTI4Ab1gTQgFMPyQkBxVIy
	XsYxd58AT2nCDJ/IlHQYgvGJLjmJDWG1Q+1+2ITuJNlBF0OPsgoZ7vXSuvoAZ0LEqL8XCLGajY7
	YE1M0MuLUUZe/pmHyVMmkqLMikJy0XKXOL8pxyHet1DOdy6n/zShfyMjGTG05CqgW1beeTaYpJ2
	Og9kdPW3vz1iPUghO8lPWdGR1sdhPB3iNhAZmWMUgcd4DZPL4qAsb2bz7/hRVNOvgwQ==
X-Received: by 2002:a17:907:3e06:b0:ac2:b826:1e6b with SMTP id a640c23a62f3a-ac330105cbemr1076249166b.4.1742114506916;
        Sun, 16 Mar 2025 01:41:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE33YlQqNmH4jvbzbJ7ozvEL3hCYyB04n7PW+mxK2t8dycmjnMyRpY0fPDepE0udYWxCIJVvg==
X-Received: by 2002:a17:907:3e06:b0:ac2:b826:1e6b with SMTP id a640c23a62f3a-ac330105cbemr1076247866b.4.1742114506497;
        Sun, 16 Mar 2025 01:41:46 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3147e9fd1sm482160966b.51.2025.03.16.01.41.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Mar 2025 01:41:45 -0700 (PDT)
Message-ID: <a6c79155-daac-4c2a-9b91-5c8480dc14b1@redhat.com>
Date: Sun, 16 Mar 2025 09:41:44 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fixed ideapad-laptop driver to support Yoga 9 2 in 1
 14imh9 unknown keys
To: =?UTF-8?Q?Ga=C5=A1per_Nemgar?= <gasper.nemgar@gmail.com>
Cc: ike.pan@canonical.com, linux-kernel@vger.kernel.org,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <20250313151744.34010-1-gasper.nemgar@gmail.com>
 <4970c2cd-9637-460a-8e85-bc44f7b0a550@redhat.com>
 <CAKi4K-hFHy4_F+fQghFNNR8cnkojPcE0uXQWsf5+5dbqjXGs0g@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAKi4K-hFHy4_F+fQghFNNR8cnkojPcE0uXQWsf5+5dbqjXGs0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Gašper,

On 14-Mar-25 12:35 PM, Gašper Nemgar wrote:
> Thanks for the feedback, 
> 
> I will go over your notes here and explain things.
> The Eye button on windows triggeres "Eye Care mode" https://download.lenovo.com/consumer/mobiles_pub/yoga_9i_2-in-1_14_9_ug_en.pdf#page=50 <https://download.lenovo.com/consumer/mobiles_pub/yoga_9i_2-in-1_14_9_ug_en.pdf#page=50>,  does linux have a keycode as something like this, i didn't found any, should we jus assign it to one of the programmable keys?

Yes that sounds like the best solution.

> I will handle the performance as you have suggested, thanks

You're welcome.

> The shift + prtSc i have made a mistake here, i meant the Fn + prtSc. 
> Just PrtSc is handled by a different device ("AT Translated Set 2 keyboard") and is not managed by this module. evtest told me it sends SysRq code which is intended and it triggers the selective screenshot.

Right, e.g. GNOME does not really differentiate between sysrq/printscreen
and KEY_SELECTIVE_SCREENSHOT and always uses the dialog instead of making
printscreen directly take a full screen screenshot. Still making this
the Fn + printscreen comboe send KEY_SELECTIVE_SCREENSHOT is the right thing
todo and is also done on other laptop models with the same icon.

> If I assign the Fn + PrtSc to KEY_SELECTIVE_SCREENSHOT the evtest shows
me it triggers code 634 and code name is "?". Is this correct behaviour?

This just means that your evtest is a bit old and does not know about
KEY_SELECTIVE_SCREENSHOT yet.

Regards,

Hans



> On Fri, 14 Mar 2025 at 10:34, Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>> wrote:
> 
>     Hi Gašper,
> 
>     Thank you for your patch.
> 
>     First if all a few generic notes:
> 
>     1. When sending out v2 of the patch please add
>        platform-driver-x86@vger.kernel.org <mailto:platform-driver-x86@vger.kernel.org> to the Cc
> 
>     2. The patch subject (first line of commit message) should have
>        a prefix describing the subsystem + driver, e.g. use:
>        "platform/x86: ideapad-laptop: Add a few new keymap entries"
> 
>     3. Your patch is missing a signed-off-by, see:
>     https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin <https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin>
> 
>     4. Your commit message / patch should also have a body, e.g.
>        the entirety of the commit message could look something like this:
> 
>     -- begin --
>     platform/x86: ideapad-laptop: Add a few new keymap entries
> 
>     The Yoga 9 2 in 1 14imh9 introduces 4 new hotkeys which are not
>     yet in ideapad_keymap[], add entries to map these keys.
> 
>     Signed-off-by: Gašper Nemgar <your-email-here>
>     -- end --
> 
>     A few more specific remarks below based on looking at
>     this picture of the keyboard:
> 
>     https://ardes.bg/uploads/original/lenovo-yoga-9-2-in-1-14-g9-550178.jpg <https://ardes.bg/uploads/original/lenovo-yoga-9-2-in-1-14-g9-550178.jpg>
> 
>     On 13-Mar-25 4:17 PM, Gašper Nemgar wrote:
>     > diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
>     > index 30bd366d7..af124aafe 100644
>     > --- a/drivers/platform/x86/ideapad-laptop.c
>     > +++ b/drivers/platform/x86/ideapad-laptop.c
>     > @@ -1308,6 +1308,14 @@ static const struct key_entry ideapad_keymap[] = {
>     >       /* Specific to some newer models */
>     >       { KE_KEY,       0x3e | IDEAPAD_WMI_KEY, { KEY_MICMUTE } },
>     >       { KE_KEY,       0x3f | IDEAPAD_WMI_KEY, { KEY_RFKILL } },
>     > +     /*Star- (User Asignable Key)*/
>     > +     { KE_KEY,       0x44 | IDEAPAD_WMI_KEY, { KEY_PROG1 } },
> 
>     Ack.
> 
>     > +     /*Eye*/
>     > +     { KE_KEY,       0x45 | IDEAPAD_WMI_KEY, { KEY_DISPLAYTOGGLE } },
> 
>     It looks like the laptop already does display-toggle as Fn-F7 although
>     it like sends super + P for this (AKA meta + P).
> 
>     So mapping this to KEY_DISPLAYTOGGLE seems wrong, what does this
>     do under Windows?
> 
>     Maybe KEY_ZOOM ?
> 
>     > +     /*Performance*/
>     > +     { KE_KEY,       0x3d | IDEAPAD_WMI_KEY, { KEY_SPORT } },
> 
>     I think that instead of mapping this it should be handled specially
>     and call platform_profile_cycle() instead of sending a key-press
>     to userspace
> 
>     > +     /*shift + prtsc*/
>     > +     { KE_KEY,       0x2d | IDEAPAD_WMI_KEY, { KEY_PROG3 } },
> 
>     Looking a the symbol on the keyboard this should send
>     KEY_SELECTIVE_SCREENSHOT
> 
>     > 
>     >       { KE_END },
>     >  };
>     >
> 
>     Regards,
> 
>     Hans
> 
> 

