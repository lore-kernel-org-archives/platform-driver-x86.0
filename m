Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527F1171CD
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Dec 2024 22:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733350751; cv=none; b=qAyzjMIMBKs4lL4qy+pVc396C7WHxPGNbLRxddghjAHzXB4Izlok4+ZXp3M2TH636BX7HIltoBsd8igIqg4tGK2jWyNhwx1gbm8Z0v684fKih8Z/OE/bvm8HlJuh94ziSBRY8kgKFArGF9nRGtKxswqon0QgBNJXzKoNU5xpG2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733350751; c=relaxed/simple;
	bh=ZWig3HboGj2Proqr8U3PF2+ErQf0BKwt+ha0cueJfFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iG+TlZ1K2WRsDYLe0uT7CYJrctZdxo9WBVRB+UiwjQUDv4MtMeKnJxrLN7zcqe+v4uMMMj3yNw3ccVrEvOZyKCoompfGhxCRg/cMKsItsNpgeN0hd0jY9uAPA+xAQSCnOyvfC/nKw7hrra7HFwxIvM2p8KPqCf6OdUUV/nXia1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=GHqCill1; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="GHqCill1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1733350733; x=1733955533; i=w_armin@gmx.de;
	bh=qwi92wIALfGo1zPE7VzzxyhilbnfgrDAM2PPNwJYWOo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=GHqCill1EulFohXhAtrP6Tx7cXG80S/6y158x7ijMgK0C02iNjVvaKhyCPsZXZIy
	 NFC2eWQMLxN0L3y5MWJ+Jmi+H7inf/W3jARiLl9Xdou+MD6trMU1OEZtGuYukcl4X
	 Pbf6X4rhvr+cWfckbOibgoJP3o4edLq+SuO1j1tflbFjNKNTIo2LmJ5oYXXsP+nhh
	 66N6hXI1GJSXBAR4MwNGo4dCOxGwOg75M926iOn973E9Aal7rD/B5pfYMxOw0nzMT
	 XItiqT+GAnDH86rj4+yW75kTNvbcUCfGsNozlSalikl9XiWqRiFa8b3ZaNtcFPXGh
	 8S+QvpiirCyX+7Vvbw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([93.202.247.107]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJmKX-1t3mCb37gP-00SDpZ; Wed, 04
 Dec 2024 23:18:52 +0100
Message-ID: <121f408b-bf43-4ad4-baa3-ae47068d8f40@gmx.de>
Date: Wed, 4 Dec 2024 23:18:50 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Adding a new platform driver samsung-galaxybook
To: Hans de Goede <hdegoede@redhat.com>,
 Joshua Grisham <josh@joshuagrisham.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>
References: <CAMF+KeYus9dW00WNJMLVxLLHdG9JgCfrGJ491fu7NM8GAEqqCg@mail.gmail.com>
 <40b82b39-3bba-4eac-8eb0-b4cee4868737@redhat.com>
 <CAMF+KeYKxiG0h4K39Fzbeoa30VZsvN68XMcQ5382YdfRDgeUdQ@mail.gmail.com>
 <d84a8908-543e-4537-86d0-ce3089ba481f@redhat.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <d84a8908-543e-4537-86d0-ce3089ba481f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:rUXDlbix+HngXsvHhRFzVr/vjvbBVt51OwH6dxwjBVp8J4kw+VG
 Uy1phps1DhZa6KVeTfesO1ZgLG63QgU+nDBkOjc+Aym6izvOsIcPZqtCDdngvSur+H5JHxo
 iZcBvVqzqNvVECFICRVmsEm87J7Pae3m3i9+c9YzfR2KJLVyidmSLurD94dZTZA7tNOP9AH
 mnlglR7OWLnOJdosZxOsg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wmVrbr+z1O0=;daQYKv0Laf2XG5D9T+AVXoJogUF
 xUQvB97ZpfFl/T3euSbwS2epufPc5DceJ0YvtCkzzWdzqV7b+3DI37Tna76oQTPJlNopBpb6K
 HcXvb8inuX+OUiv5uabIioRjifnCS/6EAlF6YEBdOTH7xXsbfdg9gVZqAYj5PZznWqxEqIxvO
 JzCjAMhPIFByXcS12sI0w2bn+NTIajGSpqCa8VVSeoSs5d6rRLQq19t7JCsiJKHEWbQIFjPFQ
 RZBUqN/dHjnZNvS1MdP090dyKHOHRbZ8vdk8v3hjY/hDfv1pK+4DvCdm0VXgSB1ol7wI/9DBY
 5CkCTrZTg7ij+1mIM79/9ftP0tNN+/btg1qlkTYZrYdO1ojAvWZvdOz0XvVnpUPMHWJnDUDAk
 xTTW9JSeNE9NcGQuBTtf4If1KBSjPtRhVnVI7b0YTV0TFt/v82ki8Xi7INKsO2IXcABdvSfrE
 vCUjy4loNgTDKzrF8RQZaaFFVXZS7LR3ySz1DfWAeSg/KgAKWX5wu8/9hHSQ98kgvMFNZHdvL
 uHv2K1CeNzAFs2hWbzB+9W229w6FJmwBbtocU0BG9UgaJpcI8Ltyt4CFupgEASwSfqOhd7mNn
 kZncG/PAjXUcr5Dhs4J7qXWJOVkzkahqUG0rynvXrFv1VL4zRsJSeTJK1GRc7C2bke6NdkxBB
 z2G6wSBFePU7D4eK9y2RBmC8rFtulzr/1tOpEQIviCN5ZZfv2wvVkYWcmtWT3/rDN8kQffOgW
 Ufz66eguFnY1vmUQlSnqLWbftkhJn1t/5FuawgTle6rTSDMgI0zw35jvZYPonB4vnAW0lxLvf
 c4F4ib22Uno3atzBaooRoBfJSJN4h5CoJA7g/cCmeCOraql2WJo0+XsnPo60Jpeij2fdvu5GQ
 OA0k54DdG7Z+/Cl1Zw1FTknxo5Iu2uWqNet7vqnEWknbpBKJlxuyWq5hQb1KWADqbtOi71X0w
 ZuDbustP+XcQDKNkIpFrWFqeAwS6kENK9q8xGTKKTv32pYY1a2OOjZs0QBim5mxUH6yfjzJGL
 kEZesBTxnlPlUQ5ljIQXrJdva1Zd7q+AkOEqUsI/3Q3mMnBrB1zKmSmwfwjhwAjXYdsnkz6hE
 Ii8JkmSJF7yKGYH0b/UC7UDIGx08l+

Am 04.12.24 um 23:00 schrieb Hans de Goede:

> Hi Joshua,
>
> On 4-Dec-24 9:33 PM, Joshua Grisham wrote:
>> Hi Hans, thank you so much for taking the time to read through the
>> questions and get back to me!
>>
>> Den ons 4 dec. 2024 kl 18:31 skrev Hans de Goede <hdegoede@redhat.com>:
>>> So I think it is best to just emulate what the laptops where
>>> the cycling is directly done by the embedded-control do.
>>>
>>> That is:
>>>
>>> 1. Add LED_BRIGHT_HW_CHANGED to the flags of the led_classdev
>>> for the "xxx:kbd_backlight" led class device you expose
>>>
>>> 2. Filter out kbd-backlight-cycle keypresses and on such
>>> a keypress:
>>>
>>> 2.1 Determine new brightness level
>>> 2.2 Apply new brightness level
>>> 2.3 Call:
>>>
>>> led_classdev_notify_brightness_hw_changed(&kbd_backlight_led_classdev, new_brightness_level);
>>>
>> This is actually exactly what I have already implemented with the one
>> exception: I am executing exactly the same kind of logic you mentioned
>> (via schedule_work()) but I have NOT filtered out the keypress;
>> instead, it is just scheduling this logic to run in a workqueue and
>> then going ahead and passing along the keypress as well, just in case
>> anyone wanted to trigger any other kind of event from this hotkey.
>>
>> I have actually submitted a patch to the keyboard hwdb which was
>> merged in to systemd that maps this particular key to "unknown" with
>> the idea that someone who has this model would also likely have this
>> platform driver module loaded, so by default the kernel-space action
>> to actually change the brightness level would be executed (the
>> "EC-like" behavior as you mentioned that they could not change), but
>> the user would also have the option of remapping the key and
>> triggering additional actions on top of this if they wanted.  Does
>> that sound appropriate or is it better to just filter out the keypress
>> entirely once the above actions are scheduled/executed?
> In my experience it is best to pick one approach of
>
> 1. Deliver event to userspace and let userspace handle everything
> 2. Handle everything in kernel and stick with that
>
> We actually have what you are suggesting for display brightness
> up/down presses in the drivers/acpi/acpi_video.c driver
> which exposes both a /sys/class/backlight device and an evdev
> device delivering key-press events and which automatically
> increases the brightness of the /sys/class/backlight device on
> brightness up/down hotkey presses.
>
> And that combination is a hot mess. GNOME/KDE see the keypress
> and then race with the kernel increasing the brightness. Typically
> they loose the race reading the new brigthness increasing the
> brightness by 2 steps on one keypress. And some older laptops
> have only 8 steps, so that is a problem.
>
> I disabled the in kernel handling of the brightness up/down
> keypresses in the ACPI video bus driver because of this, but
> some users complained about this breaking old X11 setups using
> e.g. Window Maker of fvwm. Linus Torvalds ended up "fixing"
> this by instead of having the kernel immediately react giving
> userspace like 0.25 seconds or something to respond and if
> it does not, then handle it in the kernel. Which of course
> is racy so sometimes users still hit the 2 steps for one
> keypress issue if the laptop is under load.
>
> Note this is meant as an example of what NOT to do.
>
> As for the hwdb mapping of they keypress to unknown I predict
> that at some point a well intending user is going to notice
> this, map it to KEY_KBDILLUMTOGGLE and submit a PR to systemd
> upstream.  Then the systemd upstream maintainers will trust
> this user, who actually has such a laptop which they don't to
> be doing the right thing and merge it.
>
> And then if GNOME/KDE/xxxx grow support for actually acting
> on KEY_KBDILLUMTOGGLE (if they do not do so already) we have
> the kernel hotkey and userspace hotkey handling fighting
> each other just like the example above.
>
> So based on this I would strongly advice you to filter out
> the key event completely at the kernel level.
>
> If someone ever really needs / wants that event then my
> suggestion would be to add a module option which *completely*
> disables all in kernel handling for the key in kernelspace
> and instead delivers the events to userspace.
>
> TL;DR: IMHO mixing in kernel handling with keypress reporting
> is a bad idea. Please chose one model and stick with it.

I agree with this viewpoint. Also the user still sees the event when you filter out
the special keypress, since calling led_classdev_notify_brightness_hw_changed() sends a
poll notification to the led class device. So when using poll(), select(), etc. the user
can still react to this event.

>> Also as an aside, I have had a few users who have mentioned that if
>> they have compiled and loaded i8042 as a module (which is then marked
>> as "used by" samsung_galaxybook due to the i8042 filter), if they
>> execute a modprobe -r then it also removes i8042 and their keyboard
>> stops working. Is this known/expected behavior and/or is there
>> anything that can be done in this driver itself to try and help
>> prevent this from happening? Otherwise I guess a "fix" for this would
>> be if users compile their kernel with CONFIG_SERIO_I8042=y then they
>> would not have this problem?
> IMHO, the best way to solve this issue is to tell users to do
> "rmmod samsung_galaxybook" instead of modprobe -r. And you can do
> the same in any Makefiles / scripts you may have.
>
> Regards,
>
> Hans
>
Same problem with any driver which registers a acpi_battery_hook, if you unload the driver you also unload
the ACPI battery driver itself :( The reason for this seems to be that modprobe assumes that the ACPI battery
driver is a pure dependency of the first driver and can be unloaded if no other module depend on it.

I think this problem could be fixable, but i have no experience when it comes to the kernel modules infrastructure.

For now using rmmmod instead of modprobe -r should indeed do the job.

Thanks,
Armin Wolf

