From: Jan-Marek Glogowski <glogow@fbihome.de>
Subject: Re: Brightness and "touchpad dis-/enable" keys not working for
 Fujitsu e7x6
Date: Wed, 22 Jun 2016 13:23:05 +0200
Message-ID: <576A7519.9040703@fbihome.de>
References: <575FC4E0.7080501@fbihome.de>
 <20160616234630.GB4764@marvin.atrad.com.au> <5763C0DF.3030302@fbihome.de>
 <20160621081229.GE19735@marvin.atrad.com.au>
 <20160622073213.GD3056@eudyptula.hq.kempniu.pl> <576A6604.8010907@fbihome.de>
 <20160622105333.GD25599@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ironman.h-da.de ([141.100.10.250]:58613 "EHLO ironman.h-da.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751671AbcFVLaL (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Jun 2016 07:30:11 -0400
In-Reply-To: <20160622105333.GD25599@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Micha?? K??pie?? <kernel@kempniu.pl>, platform-driver-x86@vger.kernel.org

Am 22.06.2016 um 12:53 schrieb Jonathan Woithe:
> On Wed, Jun 22, 2016 at 12:18:44PM +0200, Jan-Marek Glogowski wrote:
>> Am 22.06.2016 um 09:32 schrieb Micha?? K??pie??:
>>> Is implementing this in the kernel really worth the effort?  I ended up
>>> using xbacklight bound (in my window manager) to the brightness hotkeys
>>> for both my Lifebook E744 and my Vostro V131, which has a royally borked
>>> ACPI backlight control implementation.  It seems using userspace helpers
>>> for backlight control is the new normal [1].  Yes, you lose console
>>> brightness control; I can live with that, YMMV.
>>>
>>> [1] https://www.spinics.net/lists/platform-driver-x86/msg07902.html
>>
>> The e7x6's DSTD misses the ACPI brightness control device (FUJ02B1), so
>> the brightness part of the fujitsu-laptop driver isn't used and
>> therefore - in addition to the direct brightness adjustment - generates
>> no keycodes for the keys.
>>
>> A userspace keycode handling solution would be totally sufficient. Would
>> be nice, if it worked in kernel but that's clearly optional for me.
> 
> Since the newer hardware lacks an ACPI brightness controller and it is
> possible to have userspace deal with the brightness in these cases, it seems
> to me that the solution to the issue lies outside of the fujitsu-laptop
> module (which is focussed on the custom devices in the laptops).  I am more
> than willing to be convinced otherwise, but at present this seems to be the
> prevailing line of thought.

Someone / Something has to generate the keycodes, even if we skip all
brightness control. And I get an ACPI event for the FUJ02E3 when I press
the keys, but I don't know what to do with it (AKA which DSTD function
to call).

> Regards

Jan-Marek
