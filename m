Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFB51B87D0
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Dec 2024 20:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733431810; cv=none; b=h359mBfQYNtA53T1DhWd6QYO3Uf38pQXJpfAmJdD7tirjcU15CfyqL8z6GDT6itwHV5V98t+hUooJiL2XXDZgLemLGfMtt5FTKtXz+YZBtqOjZthxCrRDPdWpSOBUXBURmdEMwkkEw7u5w3yegVb08O5hSGdmRBrn13CYY3O6eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733431810; c=relaxed/simple;
	bh=y7Ci3rg1zMoHO4qFdRLajkZR9e4nf+yQP/YqIPaYWdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SCz4ru0TXEN2AH2Vp4CMlwgK3kWcKkiEHg+xvCTfSaMHttf4Jt8uJbvje7tI8sIGw4weimFEMdHgI1N6nJ9BlH3GWx99/WPgcV7NgnKUbT47QxLhB4KLyqsHQR8+TBPDpNhJ9Yl8a7h+JsxaqY4N4Lkcs50hgDGj4Tm5FCb7JGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=rLTXSGfG; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="rLTXSGfG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1733431785; x=1734036585; i=w_armin@gmx.de;
	bh=gCSGJUlNK5FLLEymiYQXm1xPuaPQY7MNF/aykGz8rJo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=rLTXSGfGbhjaaRkypaQvjSPE3szotn3l/HZYZ+lfaabmd9GA/aXj0A9gdFZ7U06R
	 FEETkUVsFJRD3fDwpKbzDOnQpuEv+6zMyHGBPdxuvqUO/T5lR012Rp+kNjhH6Yau3
	 ga6pwiW8dgvmKL8QpeM/TmaVUy7A3jwv8NMOY0ZYpb27MCgD3O4Pl3q5e4eOPR0Ou
	 QC87mC1I2lJ1gkPyt6jXzPOOggW6ov1zsrtaspAsWQ2xdZIkDXeVwClQtp5lEY2k6
	 PZ5zuI2slfA8aBvyldmRIMQ0cP3BsjmZllPV2+dvWlCh0iyU7X2p8XekxjysIn+2G
	 sPTpcIGDoa4NVS/weA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([93.202.247.107]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MDQeK-1tSgyl2aNK-000bEr; Thu, 05
 Dec 2024 21:49:45 +0100
Message-ID: <cc9f1a7d-1de6-4b2a-a2a6-e3137e0186b5@gmx.de>
Date: Thu, 5 Dec 2024 21:49:44 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Adding a new platform driver samsung-galaxybook
To: Joshua Grisham <josh@joshuagrisham.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 Kurt Borja <kuurtb@gmail.com>
References: <CAMF+KeYus9dW00WNJMLVxLLHdG9JgCfrGJ491fu7NM8GAEqqCg@mail.gmail.com>
 <40b82b39-3bba-4eac-8eb0-b4cee4868737@redhat.com>
 <CAMF+KeYKxiG0h4K39Fzbeoa30VZsvN68XMcQ5382YdfRDgeUdQ@mail.gmail.com>
 <d84a8908-543e-4537-86d0-ce3089ba481f@redhat.com>
 <121f408b-bf43-4ad4-baa3-ae47068d8f40@gmx.de>
 <CAMF+KebH8FqV-ZrvS6NeSOjtBDc08_Ei8M97XO727TX=4FrDgQ@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAMF+KebH8FqV-ZrvS6NeSOjtBDc08_Ei8M97XO727TX=4FrDgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:orwmQTJ0G2o4Akh9lzereqib58eYeIEOC93M3z/mWi37j9E2oSr
 g30FkoGdwHTLsRL+3gNcS7UL/UkdSiww84R3u8HTfJK//W+IplF48vxF2C7So8pAxKMFIzX
 F7bb9Jlrv7DsiJpIGg/M0Jxo5M2wL0EWelRpdoXlnvVH1U+JTZTVEP9SQLTUs04uXVoJS20
 4lVo9uAFqVlLBAMkGu2iQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pj7U4kJlQ6M=;hZZIrxYpuknF9ORA0YmfYfZ4Ppo
 JXS1gg1Low45EEWuyzXJfH/9xlw1MRppmGeU6fvb+jT7r9eHDcb2BoHj/tW5so1aE0PIv1pAY
 k9vV7ZDIqD9AGfxFhO3jTYIeOBF6/OPijnKKZmZ/QyROanv3sMR+Mcyd4ZtGvKz9fuRjGtAOM
 xQuiJPNEZp2kc26ATaILS7wUSJfiNfG7gHY0V4fGCdEMGcvbA5QyTHT+Wl5CQ0DPTsRfxAlsa
 tVGhuyHFckca8gRK2spV0PXkijrXDeuohhyrLMnzXNd7HxXWRgBZ1kEQndABX+AYkqmE9Pk0z
 bK/9Q6b3ScFiWbw8JP9N9uiuuMvRO68DEQtcleWOuapIdKsJA0g6pgLGX9DI5MxeLcaq73yop
 GS4hcuRR9JXQ9RtrH1IO9QanopMudb8S1agYdq3qUmRCqAxKfGgnEOEjmtRut9slo2AUc9E9q
 tNiRAPIVoW8BBy1/IHuz/SudV7n4NufYgjgZHKo/+/6/Fu2UMFerhbinanw5i68GTFYgFKyEF
 DTkzaBNuR8g1fAMZ2F+zr0JdMaW7LuaGr0wr+vnFZ+cDIwk92b7ollT9fdGy/OraMfZDW4rO/
 jwq26VJkl3vJdMbctOC6MN3XWNOr+JBRzlcsQu6e+Bcvv8z4BU6km0Ku1EzYkwzU0LPd67lsT
 AfAB4Eh/ocAdcZp+UslDnZAuaFLjjlvLepb/FxA61N/xVXpDp2/9SGVdTpSaJKQ5MghIAzzED
 0EDDsuCddmbZUw3VdYN17q3BtmPftTZlDaFU7Ka40RG/R/RnkIbR16y3F4n5me3KYv9JxvYzv
 wLOz96FD8h/Xh5Kgjc+ge7pxTLcAhFgj8stJw+2Td88h1a2ScqFvCFI2xzAUwYfzD5CDkep/y
 xjJ2ZNqG00ttCdtCgSIFV+kg6syvfI8Z4E0GXjg9BLjxchB9HYedomXqcLJyjcxOxgAXfsmJ1
 +lHTGwAYvr+3FRpacJS0YjkTUlZHRcTKERePJ8DobziaeDz1cIurQjxz72Ef9fukRf6NHBLf0
 dMzwf0S+/ZXcZunJfsLwIl5xOFXQOLyfYdHuxq7jpnigj+9kQGYnRazlXvirXzrBI5HrkxcmW
 aVvMu3TUWRsLR+7tONGponex3p4mJX

Am 05.12.24 um 21:40 schrieb Joshua Grisham:

> Den ons 4 dec. 2024 kl 23:19 skrev Armin Wolf <W_Armin@gmx.de>:
>> Am 04.12.24 um 23:00 schrieb Hans de Goede:
>>
>>> Hi Joshua,
>>>
>>> On 4-Dec-24 9:33 PM, Joshua Grisham wrote:
>>>> Hi Hans, thank you so much for taking the time to read through the
>>>> questions and get back to me!
>>>>
>>>> Den ons 4 dec. 2024 kl 18:31 skrev Hans de Goede <hdegoede@redhat.com>:
>>>>> So I think it is best to just emulate what the laptops where
>>>>> the cycling is directly done by the embedded-control do.
>>>>>
>>>>> That is:
>>>>>
>>>>> 1. Add LED_BRIGHT_HW_CHANGED to the flags of the led_classdev
>>>>> for the "xxx:kbd_backlight" led class device you expose
>>>>>
>>>>> 2. Filter out kbd-backlight-cycle keypresses and on such
>>>>> a keypress:
>>>>>
>>>>> 2.1 Determine new brightness level
>>>>> 2.2 Apply new brightness level
>>>>> 2.3 Call:
>>>>>
>>>>> led_classdev_notify_brightness_hw_changed(&kbd_backlight_led_classdev, new_brightness_level);
>>>>>
>>>> This is actually exactly what I have already implemented with the one
>>>> exception: I am executing exactly the same kind of logic you mentioned
>>>> (via schedule_work()) but I have NOT filtered out the keypress;
>>>> instead, it is just scheduling this logic to run in a workqueue and
>>>> then going ahead and passing along the keypress as well, just in case
>>>> anyone wanted to trigger any other kind of event from this hotkey.
>>>>
>>>> I have actually submitted a patch to the keyboard hwdb which was
>>>> merged in to systemd that maps this particular key to "unknown" with
>>>> the idea that someone who has this model would also likely have this
>>>> platform driver module loaded, so by default the kernel-space action
>>>> to actually change the brightness level would be executed (the
>>>> "EC-like" behavior as you mentioned that they could not change), but
>>>> the user would also have the option of remapping the key and
>>>> triggering additional actions on top of this if they wanted.  Does
>>>> that sound appropriate or is it better to just filter out the keypress
>>>> entirely once the above actions are scheduled/executed?
>>> In my experience it is best to pick one approach of
>>>
>>> 1. Deliver event to userspace and let userspace handle everything
>>> 2. Handle everything in kernel and stick with that
>>>
>>> We actually have what you are suggesting for display brightness
>>> up/down presses in the drivers/acpi/acpi_video.c driver
>>> which exposes both a /sys/class/backlight device and an evdev
>>> device delivering key-press events and which automatically
>>> increases the brightness of the /sys/class/backlight device on
>>> brightness up/down hotkey presses.
>>>
>>> And that combination is a hot mess. GNOME/KDE see the keypress
>>> and then race with the kernel increasing the brightness. Typically
>>> they loose the race reading the new brigthness increasing the
>>> brightness by 2 steps on one keypress. And some older laptops
>>> have only 8 steps, so that is a problem.
>>>
>>> I disabled the in kernel handling of the brightness up/down
>>> keypresses in the ACPI video bus driver because of this, but
>>> some users complained about this breaking old X11 setups using
>>> e.g. Window Maker of fvwm. Linus Torvalds ended up "fixing"
>>> this by instead of having the kernel immediately react giving
>>> userspace like 0.25 seconds or something to respond and if
>>> it does not, then handle it in the kernel. Which of course
>>> is racy so sometimes users still hit the 2 steps for one
>>> keypress issue if the laptop is under load.
>>>
>>> Note this is meant as an example of what NOT to do.
>>>
>>> As for the hwdb mapping of they keypress to unknown I predict
>>> that at some point a well intending user is going to notice
>>> this, map it to KEY_KBDILLUMTOGGLE and submit a PR to systemd
>>> upstream.  Then the systemd upstream maintainers will trust
>>> this user, who actually has such a laptop which they don't to
>>> be doing the right thing and merge it.
>>>
>>> And then if GNOME/KDE/xxxx grow support for actually acting
>>> on KEY_KBDILLUMTOGGLE (if they do not do so already) we have
>>> the kernel hotkey and userspace hotkey handling fighting
>>> each other just like the example above.
>>>
>>> So based on this I would strongly advice you to filter out
>>> the key event completely at the kernel level.
>>>
>>> If someone ever really needs / wants that event then my
>>> suggestion would be to add a module option which *completely*
>>> disables all in kernel handling for the key in kernelspace
>>> and instead delivers the events to userspace.
>>>
>>> TL;DR: IMHO mixing in kernel handling with keypress reporting
>>> is a bad idea. Please chose one model and stick with it.
>> I agree with this viewpoint. Also the user still sees the event when you filter out
>> the special keypress, since calling led_classdev_notify_brightness_hw_changed() sends a
>> poll notification to the led class device. So when using poll(), select(), etc. the user
>> can still react to this event.
>>
>>>> Also as an aside, I have had a few users who have mentioned that if
>>>> they have compiled and loaded i8042 as a module (which is then marked
>>>> as "used by" samsung_galaxybook due to the i8042 filter), if they
>>>> execute a modprobe -r then it also removes i8042 and their keyboard
>>>> stops working. Is this known/expected behavior and/or is there
>>>> anything that can be done in this driver itself to try and help
>>>> prevent this from happening? Otherwise I guess a "fix" for this would
>>>> be if users compile their kernel with CONFIG_SERIO_I8042=y then they
>>>> would not have this problem?
>>> IMHO, the best way to solve this issue is to tell users to do
>>> "rmmod samsung_galaxybook" instead of modprobe -r. And you can do
>>> the same in any Makefiles / scripts you may have.
>>>
>>> Regards,
>>>
>>> Hans
>>>
>> Same problem with any driver which registers a acpi_battery_hook, if you unload the driver you also unload
>> the ACPI battery driver itself :( The reason for this seems to be that modprobe assumes that the ACPI battery
>> driver is a pure dependency of the first driver and can be unloaded if no other module depend on it.
>>
>> I think this problem could be fixable, but i have no experience when it comes to the kernel modules infrastructure.
>>
>> For now using rmmmod instead of modprobe -r should indeed do the job.
>>
>> Thanks,
>> Armin Wolf
>>
> Perfect, thank you both! All of this makes perfect sense to me and I
> will make these suggested changes.
>
> I am planning to try and fix up some documentation which I will also
> add for this platform driver, plus add relevant KConfig/Makefile/etc
> entries, do some additional testing, and will try to get a patch
> submitted here hopefully sometime within the next few days.
>
> My plan was to take the latest commit at the time from the 'for-next'
> branch of pdx86/platform-drivers-x86.git and then submit it all
> together as a patch via a new thread here. Please let me know if there
> are any problems with that plan or anything else I might need to
> adjust before doing so.
>
> Thank you again!
>
> Best regards,
> Joshua

Sounds good to me, looking forward to review this patch :)

Thanks,
Armin Wolf

