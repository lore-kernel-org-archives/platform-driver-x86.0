Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7647E5FF1D
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jan 2024 15:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706024074; cv=none; b=tf8ZrbCAOP18fztXaPB/BVVgjTJ27vB9eddXG8x0Gfoj59QCEaBHO6wNkehVnijfa9WbwJ5BLADmwwrpyLP8Q/OQ7tsv15cB6c22JzmlZOkEBoVgxqCs0yFgxWKvt/4TRfWM0DrB50P8sj7h+Iax1oIaZPiPFbjlqyGunxAZBNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706024074; c=relaxed/simple;
	bh=hJMIUVEb9JwIRQUczNI4K2wfvMU7mTptHQM/kLHw4dM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=APmi3fr+hQeDsEKQIWECjk3uxWQ5NOe8xtJX2PK/y2xaYxsT6sO/u/F9rsxBz+MkvnRUrTAmV29PQWvzWfTzKzfn3/vvxt9PJCZ62kcmui9Tp5z9e46GdJhp98qSD1rQeKqnzxPang8IL+/Z5CkEHzRTH3swcMfcVNWUSxWgE/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NJSjuKr2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NJSjuKr2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706024071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z+u4z/IaFPQGJ4ja5SP5MhSaD8AQ60YH8LvWPVXEnxE=;
	b=NJSjuKr2BCr6kPsah0jxYRP2vh8aowfMcMKJdiaCXnlxKMcUrg2VlRJGO0mAvDxQ7/X5YM
	CcDPTpqBvj9d8/FA3AE2/WQfqbA5uNOPxrt58fAKU53wgXohYCwmyLqaxmRA+rtJvn/NCn
	AxBQTUJ9guAgoVkIiwnGxisjoSIwmoU=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-Eqf7DaB0NOmVq_TzKxV5QQ-1; Tue, 23 Jan 2024 10:34:30 -0500
X-MC-Unique: Eqf7DaB0NOmVq_TzKxV5QQ-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-50e7bfc47fdso3036260e87.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jan 2024 07:34:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706024065; x=1706628865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+u4z/IaFPQGJ4ja5SP5MhSaD8AQ60YH8LvWPVXEnxE=;
        b=XJyUAytM/IUzrdJFUjf0IwIXucFv65R6323zbT5RhW8/ngAeAcNdqC2hOIkPEl2rNH
         X7fs984fTnMfJLILFd/HgKKqaDWLyRN6DGovlXEKLLOmh1Ym1UOQg6QCa7rZeLIOYJOS
         rcNnKHJktTSsRYQ/4pO+CJpOVhd1qAaazATAufuriwEnJrUrozHISCkgzmw9VKgmQVx/
         xYR+pkzpwWwC0xOiCN04IGagsqMGfqXst9ZzzHTWMNOc9yXTMU6U5ymxRz7b3+/A/SVo
         /brs82N0Tl92+4kD/XGrficHPXcAA/+edLpS+STTWFI8a3WJGbSXNiKwVNh2dB8uldTw
         CjTw==
X-Gm-Message-State: AOJu0YzUcHpRTnuvzApwDupEFTkjZsg9R2nNcsSV4o6gMkVyjAOnkx9d
	9+y7FY30Q6WyTZ0zXnA4o4bL4GBfJkC7qKGzYXEnmahJWrw8X9EjzGAFrZZ+5uznAjSkQ2YlpdR
	WSPWJwZFNdiif/XSHKjlU94uA2lbJjDJAyuqRWkCkbpawj6ORBUsaUg1H3OUw3MY3K0p4scXQLe
	gXfoc=
X-Received: by 2002:a05:6512:312d:b0:510:ca9:b228 with SMTP id p13-20020a056512312d00b005100ca9b228mr103702lfd.172.1706024064840;
        Tue, 23 Jan 2024 07:34:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGv0CJJe7zDJu5StIPELvToi0CSE5oLQOcq9KzN27ziFaYgtidoR4oapC7kvgXKCWKbAfi9HA==
X-Received: by 2002:a05:6512:312d:b0:510:ca9:b228 with SMTP id p13-20020a056512312d00b005100ca9b228mr103695lfd.172.1706024064447;
        Tue, 23 Jan 2024 07:34:24 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id h12-20020a0564020e8c00b00557aa8d72c9sm15386633eda.25.2024.01.23.07.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 07:34:24 -0800 (PST)
Message-ID: <e53a660b-f766-479c-8507-ffe25ca0e26e@redhat.com>
Date: Tue, 23 Jan 2024 16:34:23 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hp-wmi: info hotkey has no keycode or scancode
To: Dennis Nezic <dennisn@dennisn.mooo.com>, Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
References: <ZawX2mquuTCv0tuF@panther>
 <a8fa0308-0998-48e4-a104-c2b57ee9bd8e@gmx.de> <Zaw9mnfEL65B5r4O@panther>
 <e97ae805-d006-4f0c-96c0-976385772bb7@gmx.de> <Za4T0RwClHOoCPCy@panther>
 <cd86386a-653e-401c-9b70-0860d2e1906a@gmx.de> <Za8xL39m1X22f2Bb@panther>
 <Za9DQdLg2d_CnrZG@panther> <3e574768-8d5b-465b-9860-567d0845d3fb@gmx.de>
 <3e517aa3-4020-4b29-b7b3-85271503d03d@gmx.de> <Za_Xss52DlydJOOO@panther>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Za_Xss52DlydJOOO@panther>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/23/24 16:13, Dennis Nezic wrote:
> On 23 Jan 15:22, Armin Wolf wrote:
>> Am 23.01.24 um 09:58 schrieb Armin Wolf:
>>
>>> Am 23.01.24 um 05:40 schrieb Dennis Nezic:
>>>
>>>> On 22 Jan 22:23, Dennis Nezic wrote:
>>>>> On 22 Jan 11:44, Armin Wolf wrote:
>>>>>> Am 22.01.24 um 08:05 schrieb Dennis Nezic:
>>>>>>
>>>>>>> On 21 Jan 16:16, Armin Wolf wrote:
>>>>>>>> Am 20.01.24 um 22:39 schrieb Dennis Nezic:
>>>>>>>>
>>>>>>>>> On 20 Jan 21:52, Armin Wolf wrote:
>>>>>>>>>> Am 20.01.24 um 19:58 schrieb Dennis Nezic:
>>>>>>>>>>
>>>>>>>>>>> Guys, the "info" illuminated touch-key (hotkey?) on my laptop
>>>>>>>>>>> "doesn't
>>>>>>>>>>> work", showkey doesn't report any keycode or scancode. I don't
>>>>>>>>>>> see any
>>>>>>>>>>> wmi related error messages from dmesg. All the other illuminated
>>>>>>>>>>> "hotkeys" work fine, although confusingly evtest and "libinput
>>>>>>>>>>> debug-events" report that they're coming through the event
>>>>>>>>>>> interface
>>>>>>>>>>> associated with "AT Translated Set 2 keyboard" instead of "HP WMI
>>>>>>>>>>> hotkeys", but hey, as long as I receive them I'm okay :p.
>>>>>>>>>>>
>>>>>>>>>>> hp-wmi.c does seem to reference it:
>>>>>>>>>>>
>>>>>>>>>>> How can I go about troubleshooting this? (I'm using kernel 6.6.8)
>>>>>>>>>> it can be possible that your machine does not use hp-wmi to
>>>>>>>>>> deliver keycodes
>>>>>>>>>> to the operating system, but instead emulates a standard
>>>>>>>>>> keyboard controller.
>>>>>>>>>>
>>>>>>>>>> Can you check with "kacpimon" that events concerning a PNP0C14
>>>>>>>>>> device are being
>>>>>>>>>> received?
>>>>>>>>> Very possible indeed. "kacpimon" doesn't show anything when I
>>>>>>>>> press that
>>>>>>>>> touchkey, but it does when I press all the other touchkeys. (I
>>>>>>>>> do get
>>>>>>>>> lots of accelerometer noise.)
>>>>>>>>>
>>>>>>>> Interesting, can you please share the output of:
>>>>>>>> - "kacpimon" while you where pressing the buttons
>>>>>>>> - "acpidump"
>>>>>>> ...
>>>>>> Those events are touchscreen events, maybe your mouse is
>>>>>> responsible for them.
>>>>> Right, of course, woops, these must have been the touchpad press
>>>>> events,
>>>>> as I was moving the mouse around :P
>>>>>
>>>>>> Instead they look like this:
>>>>>>
>>>>> I'm definitely not seeing anything like that, just "^Input Layer:
>>>>> Type"'s
>>>>>
>>>>>> Can you try to use kacpimon again but without root privileges? This
>>>>>> way only netlink events show up.
>>>>>> You might also stop acpid while you are using kacpimon.
>>>>> 0 output from/with netlink, even though kacpimon said:
>>>>>
>>>>> Netlink ACPI Family ID: 24
>>>>> Netlink ACPI Multicast Group ID: 5
>>>>> netlink opened successfully
>>>>>
>>>>> Remember all my other fancy hotkeys "work", but they appear as regular
>>>>> keypress events from an "AT Translated Set 2 keyboard".
>>>>>
>>>>>> If you still cannot receive any netlink events, then i might need
>>>>>> to take a look at your ACPI tables
>>>>>> via acpidump.
>>>>> https://dennisn.mooo.com/stuff/dump.txt
>>>>>
>>>>>> Thanks,
>>>>>> Armin Wolf
>>>>> Thank you again sir!
>>>>
>>>> A1799AC3-9429-4529-927E-DFE13736EEBA has zero instances
>>>> 8232DE3D-663D-4327-A8F4-E293ADB9BF05 has zero instances
>>>> 8F1F6436-9F42-42C8-BADC-0E9424F20C9A has zero instances
>>>> 8F1F6435-9F42-42C8-BADC-0E9424F20C9A has zero instances
>>>>
>>>> (Btw that "info" key does get illuminated when I touch/press it, even
>>>> though no codes are seen.)
>>>
>>> These warnings in dmesg are harmless, they are informing you that some
>>> WMI devices are unavailable.
>>>
>>> I took a look at your ACPI tables and it seems that the WMI device
>>> used by hp-wmi is indeed unused.
>>> What is the model name of your HP notebook?
> 
> HP Compaq 8710p
> 
>> Also i just noted that your notebook might contain a PNP0C32 quickstart button device.
>> Can you tell me the output of "cat /sys/bus/acpi/devices/PNP0C32\:00/status"?
> 
> 15

Interesting.

There have been several attempts to add support for this
in the past. The last one being:

https://lore.kernel.org/platform-driver-x86/20220922182424.934340-1-lkml@vorpal.se/

Note that in this case this also required some vender
specific poking in toshiba_acpi to get things to work.

I see that the HP Compaq 8710p is about the same vintage
as the Toshiba Z830 on which the last attempt to do
something about the quick start buttons was done.

So this might very well explain the missing button issue.

Regards,

Hans


