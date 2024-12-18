Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EC37F477
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Dec 2024 14:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734531858; cv=none; b=PZc0Ip6lu3wYTwrZ1tnnMk+swiZ2VBWc0HiH0zum7VGky748RzFeRO6dDMeABBPhjWfJKrc9AzUPoA0E6KhQh37SzgUrLcEf7e0tePWV5tUETOHiiRoUH6Z2eu/2lBDpHiyp+Nn3T1maU2CjsWJVXqqPp8Lsih+7q51Ua0cU5mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734531858; c=relaxed/simple;
	bh=fxq5WPhXvFyAK+buBZe3FD3w5xOl2nrTCisD3TZj8AA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PuQsJKyMabUGCdIC42HqIe1SXLBxGRC9qp6v8vTSQz9iciHaQDnb/gU+S+JuCtDCwmmssEprfIU/gPrs3WEeZnwNFxW4SokemEBGeRWZTXDhaA+0HpNRF7/G6rSLm7AyTQn4gulzg8fYixK6QNZAL7lwQLQJxzrkx39w4W7tFis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gYjMzyHY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gYjMzyHY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734531855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wYDfdm4rHVwC2HrRooT1qxFxAJepkEO0lOVD/zIJr0U=;
	b=gYjMzyHYiTlHqoEoATbxOo83IFpLKpQLQF3FZ5/QJdXYroy+XIsjtImBOoZKMgG5thYmkc
	EpQS/nMIBU5BP6jOBLJQSod5xu+KLRoVsCFGXr7Nh0K5x6KZLuBo8qkkqEICyY127LA3Ir
	6VVJP9/0VVrZA3uRILLZGN3DLMf8vwg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-pDhpSfUMONSR0DuG0dehlA-1; Wed, 18 Dec 2024 09:24:14 -0500
X-MC-Unique: pDhpSfUMONSR0DuG0dehlA-1
X-Mimecast-MFC-AGG-ID: pDhpSfUMONSR0DuG0dehlA
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5d3f4cbbbbcso4280623a12.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Dec 2024 06:24:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734531853; x=1735136653;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wYDfdm4rHVwC2HrRooT1qxFxAJepkEO0lOVD/zIJr0U=;
        b=aCxclkqaSzwb/wpXa8B6FSRJu1XWl0EDYPIkjZJYd5bLg9tYKp3b8YE/xtWKzuf2HE
         J23CWpW6wIXtAc8c0Lbmk2lTTvSiFxZeY/WgO5b2EZcrKvoVfZVNtMX57wfEoc44kqlH
         b0QHahxJ692y80zPO6OLZEo5gh9W1TRM9tTVijWMnT15seywNPJthwn2JbPx+8Wt1s3O
         KdPeIuQS9b1JlP1Ku3/m9OIRysU6G8gJi8mexvi/f03oUlbqrCJb1dtwDdr+Fri2ihf1
         emCpi9xQyywuqUoypCGwh7AbidPgjS2mwPHelNzbpUda4K0+xjMC1TwXSrjIjM8Nu1GC
         1JEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJEyDjFFURYWwp3dy32bPbC3TLypuRipeIO7irf0kO4DoG2wuxeaBbjcwsY6bHzs8VtklDovvyR+60I8XoeD6lkvzx@vger.kernel.org
X-Gm-Message-State: AOJu0YzI4yY2tB5hA0V7aJJzZhuzSSJ8vPEWI6HGajRk0YiQ8qRwYVva
	FFdd6IjIeTmmzqnAZMrVvEiOxq4M6eBkN0Nh5lt+R65rVfqZNKVO21ggm8Lwo3GbjwWraqm4e6z
	klRj0j/OFoxDSjxCrghKfgaZrUy/8bnPC9XOMTzNJArRO7Lvn58rV36Uh+EqHlD5zbNMSW6k=
X-Gm-Gg: ASbGnct5Od8JuasOj1UORmW9lQ6gMxzx/QLwi3CO3rE0TtOB13oz2aZLpqVovlVgZpf
	KJ/IfYs/AEnRKMQKZgEFHPt6fDDxaU/9ZUW0XLDiNSNsf8rMko28wH4M/0wtCjsYGJm/Wm8lu8g
	JAe9HCbSkoVs0H35PIB+u5ck4BsGqD4lL5y01N+B8ansvGFQo8sl2tQGd2YqnKKnKJcdDtI29nc
	cijbyE5aNW9dYJqAEt4U01SUkDf0SzS54eEao/9RfKWwvkSVdz+xf6bCr6zsehV0UHX4JANQDip
	vjM9hM8mrYsQYcjyvyvpIOV6WWDAwLTCuREpCVkKyNO7ctRkAzvxz2P8RMPO2+8V/9pdVBZQzPD
	MexpP37kArrIn+yMv2ms9WZk+svJFtQ4=
X-Received: by 2002:a05:6402:34cb:b0:5d0:e826:f0da with SMTP id 4fb4d7f45d1cf-5d7ee3b4ce0mr2712541a12.16.1734531852726;
        Wed, 18 Dec 2024 06:24:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFtRdU6T9fjczyDU36xPulMKDITuG4yX5oo84uMCHGFDo5XudrAQybG+dnV4bd1kStWZRLnQ==
X-Received: by 2002:a05:6402:34cb:b0:5d0:e826:f0da with SMTP id 4fb4d7f45d1cf-5d7ee3b4ce0mr2712521a12.16.1734531852288;
        Wed, 18 Dec 2024 06:24:12 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652ab5109sm5407494a12.16.2024.12.18.06.24.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 06:24:11 -0800 (PST)
Message-ID: <6d2e175f-0a84-4a6f-9484-c2c299bcc3c5@redhat.com>
Date: Wed, 18 Dec 2024 15:24:10 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
To: Armin Wolf <W_Armin@gmx.de>, Joshua Grisham <josh@joshuagrisham.com>,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org
References: <20241216103855.18457-1-josh@joshuagrisham.com>
 <c23c4c88-786a-4662-a448-deb006b7a03c@gmx.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <c23c4c88-786a-4662-a448-deb006b7a03c@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Armin,

Thank you for reviewing this new driver.

On 17-Dec-24 10:31 PM, Armin Wolf wrote:
> Am 16.12.24 um 11:38 schrieb Joshua Grisham:

<snip>

>> +/*
>> + * Hotkey work and filters
>> + */
>> +
>> +static void galaxybook_kbd_backlight_hotkey_work(struct work_struct *work)
>> +{
>> +    struct samsung_galaxybook *galaxybook =
>> +        container_of(work, struct samsung_galaxybook, kbd_backlight_hotkey_work);
>> +
>> +    if (galaxybook->kbd_backlight.brightness < galaxybook->kbd_backlight.max_brightness)
>> +        kbd_backlight_acpi_set(galaxybook, galaxybook->kbd_backlight.brightness + 1);
>> +    else
>> +        kbd_backlight_acpi_set(galaxybook, 0);
>> +
>> +    led_classdev_notify_brightness_hw_changed(
>> +        &galaxybook->kbd_backlight,
>> +        galaxybook->kbd_backlight.brightness);
> 
> This is the exact reason why i think this should be done in userspace. You can replace this code
> with a simple input event submission using the KBDILLUM* key codes. This would also allow you to
> avoid any special locking in this case.
> 
> This would also allow userspace to configure the step with of the brightness changes.

As discussed in an earlier thread, there is really no good way to let
userspace handle this atm. KEY_KBDILLUMTOGGLE gets mapped to XF86KbdLightOnOff
while we really want Cycle, as we have in e.g. XF86MonBrightnessCycle.

I just checked gnome-settings-daemon and it does handle XF86KbdLightOnOff
but it only toggles on/off. In most laptops the cycle key is handled by
the embedded controller and this simply emulates that common setup to
match what userspace currently expects.

Handling this in userspace would require adding a new KEY_KBDILLUMCYCLE
and then adding support for that to xkb and maybe also upower and
gnome-settings-daemon and KDE and then wait for that all to land before
things start to work.

As for your argument about allowing to set the percentage to step,
note that this in kernel handling only increaeses the level by 1 on
the hotkey press that make sense because typically these kbds backlights
only have 2 - 4 levels.

So IMHO handling this in the kernel is an acceptable compromise,
(yes I do realize that this is a compromise).

If some need arises later to do move this to userspace we can always
add a module parameter to completely disable the in kernel handling and
instead send out a new KEY_KBDILLUMCYCLE key-code when this now
module parameter is set.

Regards,

Hans



