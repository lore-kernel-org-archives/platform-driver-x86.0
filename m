Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8791CF96
	for <platform-driver-x86@vger.kernel.org>; Sun,  6 Oct 2024 10:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728209786; cv=none; b=CR3EWOCkfY0lWjHLl3WDz/vwSM8P1REWQvicGcnP+NnnJ8vJu7b9UGoPYA5eO2yFHfM0/gWSPnrr1uqKiuul0WCU7uo0lcp+Oh4fVSSJB3Yp+U9e2CzI1FzplDsBIS6H2wW0jW3rnZa2Fd/TuOkiZEIzRUiuQ/wTNadRBXZbN7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728209786; c=relaxed/simple;
	bh=czdJFddf0lGiLijfqEYaodaKlernOaz5qOaANje/0yk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CLlXQeGF6xGEb1KVItIVMYP2loY/dtl0MM00kvEoLK/pnlba3AAF7LPjnc6TZhzcKgR4xj5HD9ywfAslILtRlV4L+Gpgv0bi7U00aM/uLYGS6pdyAL7SQMfiSYmcOgo2XZX7jj0nN6tYIv0Ymk4aqp8+N5tkM3AgnFnesR5ee7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HESx1eN3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HESx1eN3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728209783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ng9JIenGICGjXeL7hhRxhQDhU9dTLTqIS0nWkJBBNmI=;
	b=HESx1eN3uZlXxHxHAvjap1xf4y/PsObhP7RL2DIWBdEJqmvZ2GdwZ9j+2OXecvQcabCBs7
	2ZCqu7qOaRWGxh2kPeSmWAo2mXuRpsDerYMZYOf5Owz2esqh9TDixuuP48xwYAZ52qPcjk
	L3haGLFnup1uzRqvhXjWsNHdOKEs18A=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-othTXhiBPEef9zZF3puASQ-1; Sun, 06 Oct 2024 06:16:21 -0400
X-MC-Unique: othTXhiBPEef9zZF3puASQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a993fa36b2dso139533466b.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 06 Oct 2024 03:16:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728209780; x=1728814580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ng9JIenGICGjXeL7hhRxhQDhU9dTLTqIS0nWkJBBNmI=;
        b=wsQIGaWm/iwQNmez04V4V3s2d8dkeYCi31vqtcO8hwDX9adgKRBrIFPYPNpGUokEP1
         YrFsnHK6ygSnbsMBlxMUsYV//NZMa83qgXwP0723hauWFNCWOQEk8emwP5N0qaBLFBiv
         +zlhQYqe5ve1Zuiw9I0FXdDlsssV/w78G1/ezpUCrCmyskvREQBI8LIuvteaNwRHRIP6
         KQeZCf+dqhfJkf6wRSkJ4VDd2LfJGnv1qEPYZXeZ44gU/DgT3YaiYxrGlR4jNeQtEd8f
         FQWo1kmjtCLzUN/t6GCU6i+imXnzXtJXbVlVe2z6iUblfuSA2k1CrYTpdbncedWb5fLS
         PUUg==
X-Forwarded-Encrypted: i=1; AJvYcCWz+yr/ibd677/eEJlz1cdp0WH5xqAsnGDHSJMBxnO265BtsBsEkzwyN9tblZbXuhsINEKptonHy5GzVMquYvhj8fvV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Yc0Qze00a83qFd6XlKlNo5JGVMcbLhC9ENLVwa7jTtgtHhxm
	7Lopx5kIrb+to6P8aa0Q9+wrhliK8jh8h7uJh5KgxEE5nzF6FK7ZHJQrsmUmri8RswL4D0S2uwn
	S3N6gZBPGtM8KBK3dohuGCtjFx9f4nI+hmNPOpa1JNXmMZmdvZ3sQfnLWvUQZKOhSKS/E0Ig=
X-Received: by 2002:a17:907:1b88:b0:a99:35eb:1301 with SMTP id a640c23a62f3a-a9935eb1502mr303059266b.18.1728209780273;
        Sun, 06 Oct 2024 03:16:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHNBW5PIDMq0nN3WBBBDEYbdU6s/1ImewKuAcl7siV/9qjjP0LnyaWLPAhKCj/WCyiSv9dSA==
X-Received: by 2002:a17:907:1b88:b0:a99:35eb:1301 with SMTP id a640c23a62f3a-a9935eb1502mr303058666b.18.1728209779814;
        Sun, 06 Oct 2024 03:16:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99332a9bd7sm223931666b.212.2024.10.06.03.16.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Oct 2024 03:16:18 -0700 (PDT)
Message-ID: <fca2e4bd-10c6-462c-82a2-37627a797cb9@redhat.com>
Date: Sun, 6 Oct 2024 12:16:17 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] acpi/x86: s2idle: move Display off/on calls
 outside suspend (fixes ROG Ally suspend)
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 platform-driver-x86@vger.kernel.org,
 Mario Limonciello <mario.limonciello@amd.com>, luke@ljones.dev,
 me@kylegospodneti.ch, Denis Benato <benato.denis96@gmail.com>
References: <20240922172258.48435-1-lkml@antheas.dev>
 <134adbb7-06c5-4b6a-a8b9-abb973784f73@redhat.com>
 <CAGwozwG49xkWoFVybsVzpa=eG1U2YVCMdr8qc-HwRWSqEKCv0g@mail.gmail.com>
 <c19490b6-dc4b-47b3-b422-d244a6b87e5e@redhat.com>
 <ede128c0-46e7-4c94-ac7f-39db0efa612d@redhat.com>
 <CAGwozwESYc=znHvgJidjxoUskRuzxgoVGY7=fnmPQyYOLJP_0w@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAGwozwESYc=znHvgJidjxoUskRuzxgoVGY7=fnmPQyYOLJP_0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 6-Oct-24 12:15 AM, Antheas Kapenekakis wrote:
> <skip>
> 
>> Thinking some more about this I am having second doubts about
>> moving the LPS0 display power off call to before devices are suspended,
>> doing so would mean that the display might still be on when that call
>> is made and that call could disable power-resources which are necessary
>> for the display causing issues when the display driver's suspend method
>> runs.
> 
> Is there any device where that is used for display powersaving?

The problem is that we cannot rule out that the LPS0 display off
call relies on the displays actually being off.

I have seen ACPI AML code do all sort of crazy stuff.

So IMHO we really need to make sure that all physical displays
are off before we make the LPS0 display off call.

I have read what you wrote about this also applying to virtual
displays, I guess that means that there should be no rendering done
(so also no GPU non display tasks) when this is called.

IOW it might be best to tie this to all VGA class PCI devices
being in D3 as Mario suggested.

Regards,

Hans








>> So I think that we need something closer to Mario's POC from:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git/log/?h=superm1/dsm-screen-on-off
>>
>> here where the call is made when the last display is turned off.
>>
>> IOW have the drm modesetting core call this.
> 
> I can see two problems with this approach: 1) it would happen in a
> random point in the suspend sequence, introducing race conditions with
> sensitive modern standby devices (e.g., Ally). 2) It would not be
> gated and debounced properly, so a drm driver could call it 5 times
> when you e.g., plug in an HDMI cable.
> 
> And indeed that is the case, that PR horribly breaks the Ally even
> while any asus-wmi quirk was active. Perhaps DRM can be consulted
> though, see below.
> 
>> Maybe have something like a enabled_displays counter in the
>> drm-core which gets increased / decreased by helpers and
>> have the drm-core call platform_suspend_screen_off() /
>> platform_suspend_screen_on() when the counter goes from 1 -> 0
>> resp. 0 -> 1, ignoring the very first 0 -> 1 transition
>> which will be done when the first GPU with an enabled
>> output is found ?
> 
> To quote Microsoft [1], "This _DSM Function will be invoked when the
> operating system has entered a state where all displays—local and
> *remote*, if any—have been turned off."
> 
> Since it says remote, binding it to DRM could prove difficult. In
> addition, the call in Windows is made 5 seconds after the displays
> turn off due to inactivity. To mirror this behavior you would need
> userspace.
> 
> If there is strong indication that the Display On/Off calls interfere
> with the DRM subsystem, e.g., turn off a GPU in certain laptops, the
> call could be gated with a counter similar to Mario's PR and error
> out. In that way, it is still controllable by userspace while ensuring
> the device display is off. Is there such an indication/do we know of
> such a device?
> 
> The Ally and Legion Go which I tested happily had their display turn
> on after I yanked their display on and sleep exit callbacks. The
> Legion Go even had its suspend light blink while the screen was on.
> And both had disabled controllers. This behavior was sticky even after
> a reboot. I suppose this is due to the fact that the device might
> hibernate, so the EC would have to remember the last state before
> power off.
> 
>> The idea being that the first increase() call gets made when
>> a drm/kms driver probes a display and finds outputs which are
>> light up during probe() and then further increase / decrease
>> calls are made either when all displays go off; or maybe
>> per crtc when the crtc gets enabled / disabled.
>>
>> Anyways how best to do this at display off time should be
>> discussed with the drm/kms community on the dri-devel list.
> 
> I can cc on the next version.
> 
> Link: https://learn.microsoft.com/en-us/windows-hardware/design/device-experiences/modern-standby-firmware-notifications#display-off-notification-function-3
> [1]
> 
> Antheas
> 



