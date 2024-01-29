Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B018E6166D
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jan 2024 12:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706533043; cv=none; b=MLwoJuLh4FUeCX3quMppV6PvkiM/hxrcgTk500lMzSjwR8mJUuRhE3mJXwWfYLTZtY1zL4sixVaICFa0O4yowQH1ShgbTs862tcWZbOnBTIT2V0c2ri785HOivllVWXrBBA/AW5qV0a7nZuNDjeqPgRkEafPdnLTJvN2JntIg9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706533043; c=relaxed/simple;
	bh=i8p1zJdTBC1P/L5D5aZbmu0oin16MtT1TPTCnmr3V40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YGOH7Yd0GHIaSfryXZqC0MtdV0Y0DHCiPEpGSBo5DQfPNwn6er0/Fu1lfZ9Gs/I4pzse98wtLjVEUw8vxYJKzqcXQVaQ2ghNzFm8IuKq93aqC2s6YammEeBZtcV8akb6BGJpU6OupgMXjJPleBefVd1RkgRi8zCdu3DSGJjJ7Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MkRdqYpP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MkRdqYpP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706533040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bVvQkw+5u0kb/hxD8s9ZoTQHI64YrcX65L3ChgNi67M=;
	b=MkRdqYpP3b3ihi/Zvp7NpDrimHflVzbcSNcIzWStVwMur4jBRzsQB9U5li3oykRR/5P460
	g+duMK+F+SE6JnFxUdu6+PljKXJpDnrppCKVz/z4J/3vfMc6egkzywgzZzq0d+zDoeSdEv
	emYztX5/MTSj0D7O2P5YSreyWMRleV0=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-PGMrziDeNWW0lw7GzWBGVw-1; Mon, 29 Jan 2024 07:57:18 -0500
X-MC-Unique: PGMrziDeNWW0lw7GzWBGVw-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-51032b2fb9fso1466370e87.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jan 2024 04:57:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706533037; x=1707137837;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bVvQkw+5u0kb/hxD8s9ZoTQHI64YrcX65L3ChgNi67M=;
        b=Ul92F4X/Y8gc8ZNLUfagQrozm3S8ylxnoFa7T6M9GO9fotN0omR6AfJ4LXb+SDOLNi
         /87B9QydWiPKS7igbH/mgh0EuqrOWb7h131k3GWb9dmmR6rO05fVOEdV68GmMo2kKHuy
         dli17IHJVFzhdvcHv7l8nULPSdly2tvU6Ag1SL/2vtI2Cl76C//JJyH9b8EBaOltrQqp
         CV2PCM5G20TKJrfjt61TLM+KaKBhk+zw0WNeQYpuS37XjXVATHXEa46vDyDzL5mIWibH
         ugf0uoVTsc2UMP2KY5/J6uMNrkFhIwhO65RWkEK8Sw34S5xEG3l0hURZi+mfj1TM19Jx
         Js4Q==
X-Gm-Message-State: AOJu0Yz5JccwnIWuPiN/pVe3Xvr7fpaNQbbasmhYA4JzDnaFGJYqOOV2
	WJm69FrXMzPJrI/xcaGuZIVc7ohZzLbdCMweVKmJbhd2a+byhZe7F/p9o3Jhr5eyllsbftV9OZy
	KPN0UtALr9+mxfNATtRSRR6uQ+K7wvhJlw4W6CDHS3hPMhqXWHqu1dsgNUTo+lxPdKJ8Gh48=
X-Received: by 2002:a05:6512:3ac:b0:511:10fa:2cc0 with SMTP id v12-20020a05651203ac00b0051110fa2cc0mr1296823lfp.36.1706533037282;
        Mon, 29 Jan 2024 04:57:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdmDtj8CwujM66467FNBdTyAVzRgxDLkukCfe92LiPAs649WiyrdyjYeUaTi7NiHJPsQQsNw==
X-Received: by 2002:a05:6512:3ac:b0:511:10fa:2cc0 with SMTP id v12-20020a05651203ac00b0051110fa2cc0mr1296811lfp.36.1706533036912;
        Mon, 29 Jan 2024 04:57:16 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id vh11-20020a170907d38b00b00a35e6802bdfsm427254ejc.183.2024.01.29.04.57.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 04:57:16 -0800 (PST)
Message-ID: <66e0100d-dc65-4598-9def-d04a8cdfa067@redhat.com>
Date: Mon, 29 Jan 2024 13:57:15 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hp-wmi: info hotkey has no keycode or scancode
Content-Language: en-US, nl
To: Armin Wolf <W_Armin@gmx.de>, Dennis Nezic <dennisn@dennisn.mooo.com>
Cc: platform-driver-x86@vger.kernel.org
References: <ZawX2mquuTCv0tuF@panther>
 <a8fa0308-0998-48e4-a104-c2b57ee9bd8e@gmx.de> <Zaw9mnfEL65B5r4O@panther>
 <e97ae805-d006-4f0c-96c0-976385772bb7@gmx.de> <Za4T0RwClHOoCPCy@panther>
 <cd86386a-653e-401c-9b70-0860d2e1906a@gmx.de> <Za8xL39m1X22f2Bb@panther>
 <Za9DQdLg2d_CnrZG@panther> <3e574768-8d5b-465b-9860-567d0845d3fb@gmx.de>
 <3e517aa3-4020-4b29-b7b3-85271503d03d@gmx.de> <Za_Xss52DlydJOOO@panther>
 <e53a660b-f766-479c-8507-ffe25ca0e26e@redhat.com>
 <57df06ee-3aa1-4501-9dc6-a7bc57d770be@gmx.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <57df06ee-3aa1-4501-9dc6-a7bc57d770be@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Armin,

On 1/23/24 20:58, Armin Wolf wrote:
> Am 23.01.24 um 16:34 schrieb Hans de Goede:
> 
>> Hi,
>>
>> On 1/23/24 16:13, Dennis Nezic wrote:
>>> On 23 Jan 15:22, Armin Wolf wrote:
>>>> Am 23.01.24 um 09:58 schrieb Armin Wolf:
>>>>
>>>>> Am 23.01.24 um 05:40 schrieb Dennis Nezic:
>>>>>
>>>>>> On 22 Jan 22:23, Dennis Nezic wrote:
>>>>>>> On 22 Jan 11:44, Armin Wolf wrote:
>>>>>>>> Am 22.01.24 um 08:05 schrieb Dennis Nezic:
>>>>>>>>
>>>>>>>>> On 21 Jan 16:16, Armin Wolf wrote:
>>>>>>>>>> Am 20.01.24 um 22:39 schrieb Dennis Nezic:
>>>>>>>>>>
>>>>>>>>>>> On 20 Jan 21:52, Armin Wolf wrote:
>>>>>>>>>>>> Am 20.01.24 um 19:58 schrieb Dennis Nezic:
>>>>>>>>>>>>
>>>>>>>>>>>>> Guys, the "info" illuminated touch-key (hotkey?) on my laptop
>>>>>>>>>>>>> "doesn't
>>>>>>>>>>>>> work", showkey doesn't report any keycode or scancode. I don't
>>>>>>>>>>>>> see any
>>>>>>>>>>>>> wmi related error messages from dmesg. All the other illuminated
>>>>>>>>>>>>> "hotkeys" work fine, although confusingly evtest and "libinput
>>>>>>>>>>>>> debug-events" report that they're coming through the event
>>>>>>>>>>>>> interface
>>>>>>>>>>>>> associated with "AT Translated Set 2 keyboard" instead of "HP WMI
>>>>>>>>>>>>> hotkeys", but hey, as long as I receive them I'm okay :p.
>>>>>>>>>>>>>
>>>>>>>>>>>>> hp-wmi.c does seem to reference it:
>>>>>>>>>>>>>
>>>>>>>>>>>>> How can I go about troubleshooting this? (I'm using kernel 6.6.8)
>>>>>>>>>>>> it can be possible that your machine does not use hp-wmi to
>>>>>>>>>>>> deliver keycodes
>>>>>>>>>>>> to the operating system, but instead emulates a standard
>>>>>>>>>>>> keyboard controller.
>>>>>>>>>>>>
>>>>>>>>>>>> Can you check with "kacpimon" that events concerning a PNP0C14
>>>>>>>>>>>> device are being
>>>>>>>>>>>> received?
>>>>>>>>>>> Very possible indeed. "kacpimon" doesn't show anything when I
>>>>>>>>>>> press that
>>>>>>>>>>> touchkey, but it does when I press all the other touchkeys. (I
>>>>>>>>>>> do get
>>>>>>>>>>> lots of accelerometer noise.)
>>>>>>>>>>>
>>>>>>>>>> Interesting, can you please share the output of:
>>>>>>>>>> - "kacpimon" while you where pressing the buttons
>>>>>>>>>> - "acpidump"
>>>>>>>>> ...
>>>>>>>> Those events are touchscreen events, maybe your mouse is
>>>>>>>> responsible for them.
>>>>>>> Right, of course, woops, these must have been the touchpad press
>>>>>>> events,
>>>>>>> as I was moving the mouse around :P
>>>>>>>
>>>>>>>> Instead they look like this:
>>>>>>>>
>>>>>>> I'm definitely not seeing anything like that, just "^Input Layer:
>>>>>>> Type"'s
>>>>>>>
>>>>>>>> Can you try to use kacpimon again but without root privileges? This
>>>>>>>> way only netlink events show up.
>>>>>>>> You might also stop acpid while you are using kacpimon.
>>>>>>> 0 output from/with netlink, even though kacpimon said:
>>>>>>>
>>>>>>> Netlink ACPI Family ID: 24
>>>>>>> Netlink ACPI Multicast Group ID: 5
>>>>>>> netlink opened successfully
>>>>>>>
>>>>>>> Remember all my other fancy hotkeys "work", but they appear as regular
>>>>>>> keypress events from an "AT Translated Set 2 keyboard".
>>>>>>>
>>>>>>>> If you still cannot receive any netlink events, then i might need
>>>>>>>> to take a look at your ACPI tables
>>>>>>>> via acpidump.
>>>>>>> https://dennisn.mooo.com/stuff/dump.txt
>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Armin Wolf
>>>>>>> Thank you again sir!
>>>>>> A1799AC3-9429-4529-927E-DFE13736EEBA has zero instances
>>>>>> 8232DE3D-663D-4327-A8F4-E293ADB9BF05 has zero instances
>>>>>> 8F1F6436-9F42-42C8-BADC-0E9424F20C9A has zero instances
>>>>>> 8F1F6435-9F42-42C8-BADC-0E9424F20C9A has zero instances
>>>>>>
>>>>>> (Btw that "info" key does get illuminated when I touch/press it, even
>>>>>> though no codes are seen.)
>>>>> These warnings in dmesg are harmless, they are informing you that some
>>>>> WMI devices are unavailable.
>>>>>
>>>>> I took a look at your ACPI tables and it seems that the WMI device
>>>>> used by hp-wmi is indeed unused.
>>>>> What is the model name of your HP notebook?
>>> HP Compaq 8710p
>>>
>>>> Also i just noted that your notebook might contain a PNP0C32 quickstart button device.
>>>> Can you tell me the output of "cat /sys/bus/acpi/devices/PNP0C32\:00/status"?
>>> 15
>> Interesting.
>>
>> There have been several attempts to add support for this
>> in the past. The last one being:
>>
>> https://lore.kernel.org/platform-driver-x86/20220922182424.934340-1-lkml@vorpal.se/
>>
>> Note that in this case this also required some vender
>> specific poking in toshiba_acpi to get things to work.
>>
>> I see that the HP Compaq 8710p is about the same vintage
>> as the Toshiba Z830 on which the last attempt to do
>> something about the quick start buttons was done.
>>
>> So this might very well explain the missing button issue.
>>
>> Regards,
>>
>> Hans
>>
> I can try to upstream the necessary changes.

If you can work on this that would be great.

> But i cannot test the changes concerning the toshiba_acpi driver.

I think that just compile testing them is fine.

> Would it be ok if i omit those changes?

I have a slight preference for keeping the Toshiba changes.

As discussed below these "quick start" buttons
normally are only intended to wake up the laptop
and then immediately on wakeup start a specific app
tied to the button (IIRC). But at least on the Toshiba
the toshiba_acpi driver's special "poke" of the firmware
makes the button also send events normally, so that it
can actually be used as a normal button.

IMHO the Toshiba code is helpful in documenting the need
for such a special code (maybe extend it with a comment?).

With all that said if you don't want to submit
the Toshiba part compile-tested only, then I understand
and you can omit it.

> Dennis, can you check that your device runs the latest BIOS? And if this is not the case, could you do a BIOS
> update and send me an updated acpidump?
> 
> The reason for this is that currently, the button device receives only system wake events, but no button press
> events during runtime. Maybe this is a BIOS bug, although this could also be intentional (fancy power button).

See above IIRC what was discussed last time this is
an intentional (mis)feature of these buttons. Chances
are there might be some workaround for this for HP too,
but that will likely be tricky to find.

Regards,

Hans


