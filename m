From: Jan-Marek Glogowski <glogow@fbihome.de>
Subject: Re: Brightness and "touchpad dis-/enable" keys not working for
 Fujitsu e7x6
Date: Fri, 17 Jun 2016 11:20:31 +0200
Message-ID: <5763C0DF.3030302@fbihome.de>
References: <575FC4E0.7080501@fbihome.de>
 <20160616234630.GB4764@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ironchief.h-da.de ([141.100.10.235]:1781 "EHLO
	ironchief.h-da.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754453AbcFQJUj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 17 Jun 2016 05:20:39 -0400
In-Reply-To: <20160616234630.GB4764@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: platform-driver-x86@vger.kernel.org

Hi Jonathan

Am 17.06.2016 um 01:46 schrieb Jonathan Woithe:
> On Tue, Jun 14, 2016 at 10:48:32AM +0200, Jan-Marek Glogowski wrote:
>> I recently got new Skylake hardware (e7x6) from Fujitsu. Compared to
>> previous Haswell generation (e7x4), some of the Fn+X key combination
>> stopped working. This includes the brightness and "touchpad dis-/enable"
>> key combinations.
>>
>> For the brightness control it's understandable, as this was handled by a
>> ACPI device FUJ02B1, which is no longer available.
> 
> I see.  Perhaps they've rolled this functionality into FUJ02E3 (which
> previously has handled everything except brightness control).
> 
>> I don't know how the touchpad disable key was actually working, as I don't
>> get any scan codes or ACPI events in userspace - probably I'm missing
>> something here.
> 
> Maybe on the previous hardware generation the touchpad keys were controlled
> solely in hardware, and for some reason they've moved them to software in
> the latest generation.

Just to make this clear. It's not "touchpad keys" but the "Fn + F4",
which should toggle the touchpad functionality (is broken on Windows too).

>> I compiled the git fujitsu-notebook driver ...
> 
> I assume this was "fujitsu-laptop".

Yup

>> ... can see ACPI notifications when any of the non-working combination is
>> pressed like:
>>
>> [  408.997023] FUJ02B1: call_fext_func: FUNC 0x1000 (args 0x4, 0x0, 0x0)
>> returned 0x100
>> [  408.997072] FUJ02B1: call_fext_func: FUNC 0x1002 (args 0x1, 0x0, 0x0)
>> returned 0x0
>>
>> so these button states seems to be handled differently then all the
>> other buttons. (FUNC 0x1002 is used to check the special button states).
> 
> For clarity, which buttons are the "non-working combinations"?  Is it just
> the brightness/touchpad buttons, or are there others which are behaving
> similarly?

I'm just talking about Fn + Brightness (Fn + (F6|F7)) and "touchpad
dis-/enable" (Fn + F4) key events.
Not those real extra buttons, like ECO, RFkill, etc.

>> BTW: the debug message is a little misleading, as all of them are prefixed
>> 'FUJ02B1', even if the ACPI event is handled by the FUJ02E3 device.
> 
> Yes, good point.  The use of "FUJ02B1" (via ACPI_FUJITSU_HID) would have
> been for convenience and possibly dates from before FUJ02E3 support was
> included in the driver.  A case can certainly be made for a more generic
> descriptor.
> 
>> I checked the DSTD from the old and new HW. The size has more then
>> duplicated (414k => 955k) with a 43k diff. The diff for the FUJ02E3
>> device is just 356 lines, but I couldn't identify anything, which might
>> relate to the keys.

43k = lines. (I didn't find a way to normalize the DSTD to catch moved
objects).

> Perhaps they've introduced a new backlight control device with a different
> HID (except you mentioned that only FUJ02E3 was listed even on other OSes,
> so I guess this is unlikely).

The diff of the sorted device list is also 230 lines. I checked the
devices, which start with F, but these don't seem interesting.

>> Any help would be appreciated to get this fixed.
> 
> I don't have access to any of the newer Fujitsu hardware so I can't do much
> in relation to debugging the problem.  Obviously the buttons concerned
> generate ACPI notifications.  Without a FUJ02B1 and any obvious extension 
> to FUJ02E3, my only thought at present is that they've taken backlight
> control out of ACPI (that is, based on the ACPI button notification they
> poke other hardware to effect the brightness control).  It does seem a bit
> odd though.
> 
> In any case, we'd have to identify what is meant to be done (and what is
> done under other OSes) in reponse to these buttons.
> 
> I assume that the brightness buttons don't do anything when fujitsu-laptop
> is unloaded?  I'm wondering whether the standard backlight driver might be
> operational on this hardware.

Unloading doesn't help.

A backlight device is available via /sys/class/backlight/intel_backlight
and you can change brightness manually. AFAIK this device is provided by
the i915 driver.

We'll use the KDE battery applet as a workaround, so users have a way to
change the backlight.

OTOH a colleague told me our vendor has opened a service call with
Fujitsu and was told Fujitsu is working on a fix - at least for the
Touchpad button (quite probably a BIOS update).

If you don't have an additional ideas for me to check, I'll wait for a
reply from Fujitsu.

Thanks for your input

Regards,

Jan-Marek
