From: Jan-Marek Glogowski <glogow@fbihome.de>
Subject: Re: [PATCH][RfC] Some buttons on the Fujitsu u7[25]7 laptops are not
 working
Date: Fri, 9 Feb 2018 14:08:37 +0100
Message-ID: <91505258-9421-29b5-fc3d-b5d641dfd9ee@fbihome.de>
References: <69f33335-962b-f3be-da8e-2eeff1ae2a49@fbihome.de>
 <20180119234547.GB24590@marvin.atrad.com.au>
 <84b872ec-ba48-6423-cb7b-48f2c3ef30d2@fbihome.de>
 <e69cad3d-067b-5a22-0f4d-0c29691037c7@fbihome.de>
 <20180209113144.GC23589@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ironman.h-da.de ([141.100.10.250]:57931 "EHLO ironman.h-da.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751031AbeBINIk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Feb 2018 08:08:40 -0500
In-Reply-To: <20180209113144.GC23589@marvin.atrad.com.au>
Content-Language: en-GB
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, platform-driver-x86@vger.kernel.org

Am 09.02.2018 um 12:31 schrieb Jonathan Woithe:
> On Fri, Feb 09, 2018 at 12:02:57PM +0100, Jan-Marek Glogowski wrote:
>> Am 22.01.2018 um 11:16 schrieb Jan-Marek Glogowski:
>>> The main remaining problem is the missing release event for the ECO / KEY_PROG4.
>>> Like all buttons the ACPI events are generated on release.
>>> When releasing the button it, this results in:
>>>
>>> [Mo Jan 22 08:37:09 2018] ACPI: \_SB_.FEXT: fujitsu_laptop: FUNC 0x1000 (args 0x4, 0x0, 0x0) returned 0x320
>>> [Mo Jan 22 08:37:09 2018] ACPI: \_SB_.FEXT: fujitsu_laptop: Flags state     0x00000320
>>> [Mo Jan 22 08:37:09 2018] ACPI: \_SB_.FEXT: fujitsu_laptop: FUNC 0x1002 (args 0x1, 0x0, 0x0) returned 0x40000413
>>> [Mo Jan 22 08:37:09 2018] input input21: Push scancode into ringbuffer [0x413]
>>> [Mo Jan 22 08:37:09 2018] ACPI: \_SB_.FEXT: fujitsu_laptop: FUNC 0x1002 (args 0x1, 0x0, 0x0) returned 0x0
>>> [Mo Jan 22 08:37:09 2018] ACPI: \_SB_.FEXT: fujitsu_laptop: FUNC 0x1000 (args 0x1, 0x0, 0x0) returned 0x0
>>>
>>> I don't know yet how to distinguish between a separate ECO button and the Fn button here.
>>> Have to recheck with the old HW to see, if some support flags are different now. The button is definitely not in the BTNI mask:
>>
>> For the new u757 I get:
>>> [259964.060356] fujitsu_laptop: Flags supported: 0x26020320
>>> [259964.065143] fujitsu_laptop: BTNI: [0x10001]
The U model has the lid, the "fake ECO button as key" and a POWER button.

>> For the old e736 I get:
>>> [ 3030.845786] fujitsu_laptop: Flag supported: 0x6020320
>>> [ 3030.850631] fujitsu_laptop: BTNI: [0x1010001]
The E model has the same buttons then the U model and an additional RFKILL button

>> BTNI difference seems to be the change from an RFKILL button to function
>> key, but that is just a guess.  The difference is actually two "button to
>> key" changes, but since ECO still emits a button press event, maybe that's
>> the single bit.
> 
> I cannot be sure since I only have a single example of Fujitsu hardware to
> work with.  It seems entirely feasible that the bit change in BTNI is due to
> the loss of the RFKILL button as a dedicated button.
> 
>> And I realized we never use the value from BTNI, except when deciding to
>> register the "fujitsu::kblamps" led, FWIW.
> 
> It's useful for that purpose.
What I meant: the driver doesn't use the value returned by the function. I was hoping to find a way to distinguish the "fake ECO button" key from a real ECO button, so I could send a release immediately after a press event, which is already a release event, just like with the normal function keys.

I have just two different series E and U, so if you have other HW with other buttons, we can eventually decode the value. If the bit was the RFKILL button, then this doesn't help. If it was the ECO button, we can check that.

Currently I can just press the ECO key once, as its keycode is never removed from the ringbuffer.
From my POV we already have more buttons then bits in the BTNI value.

>>> And pressing the brightness-up or -down buttons doesn't change the backlight in KDE5.
>>> Guess I'm facing the "Xorg modeset = no backlight" problem everyone has (since 2016-06): https://bugs.freedesktop.org/show_bug.cgi?id=96572
>>
>> I fixed this for me (4.4 Ubuntu kernel) by using the old CADL patchset
>> backported for 4.4 from Jani Nikular.  The link is just an reference, as I
>> have four patches from the original development:
>> https://lists.freedesktop.org/archives/intel-gfx/2016-August/105351.html
>>
>> Then I need some additional HDA pin quirks for the headset microphone:
>> http://mailman.alsa-project.org/pipermail/alsa-devel/2018-January/131049.html
>>
>> And I'll hopefully get a "rfkill-any" backport into Ubuntu 4.4:
>> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1745130
> 
> So where does this leave us with fujitsu-laptop?  I *think* the backlight
> issue is beyond our control.  Is that your take on the subject?

This is just an information about the Linux state regarding the HW, if somebody wonders.
Nothing to do there for the fujitsu-laptop driver.

I still have two minor nuisances:
1. the "fake ECO button" key
2. the wrong /sys/devices/platform/fujitsu-laptop/radios state

fujitsu-laptop/radios is always "killed" for me, regardless of the rfkill state. Have to check, if this is eventually connected to the BIOS / EFI settings, which disables the HW.

> With the minor changes in place I do not think this patch will cause any
> regressions for other Fujitsu systems since it is only adding meaning to
> bits of the flags_supported field, and older system do not have those bits
> set.  Any comments Michel?
> 
> Reviewed-by: Jonathan Woithe <jwoithe@just42.net>
> 
> Regards
>   jonathan
