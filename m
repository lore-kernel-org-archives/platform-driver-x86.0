From: Jan-Marek Glogowski <glogow@fbihome.de>
Subject: Brightness and "touchpad dis-/enable" keys not working for Fujitsu
 e7x6
Date: Tue, 14 Jun 2016 10:48:32 +0200
Message-ID: <575FC4E0.7080501@fbihome.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ironman.h-da.de ([141.100.10.250]:4215 "EHLO ironman.h-da.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750942AbcFNIym (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 14 Jun 2016 04:54:42 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: platform-driver-x86@vger.kernel.org

Hi

I recently got new Skylake hardware (e7x6) from Fujitsu. Compared to
previous Haswell generation (e7x4), some of the Fn+X key combination
stopped working. This includes the brightness and "touchpad dis-/enable"
key combinations.

For the brightness control it's understandable, as this was handled by a
ACPI device FUJ02B1, which is no longer available. I don't know how the
touchpad disable key was actually working, as I don't get any scan codes
or ACPI events in userspace - probably I'm missing something here.

I've installed Windows on the Notebook and the brightness keys are
working there. The device manager - as on Linux - just lists the FUJ02E3
ACPI device.

I compiled the git fujitsu-notebook driver with debugging and can see
ACPI notifications when any of the non-working combination is pressed like:

[  408.997023] FUJ02B1: call_fext_func: FUNC 0x1000 (args 0x4, 0x0, 0x0)
returned 0x100
[  408.997072] FUJ02B1: call_fext_func: FUNC 0x1002 (args 0x1, 0x0, 0x0)
returned 0x0

so these button states seems to be handled differently then all the
other buttons. (FUNC 0x1002 is used to check the special button states).

BTW: the debug message is a little misleading, as all of them are
prefixed 'FUJ02B1', even if the ACPI event is handled by the FUJ02E3 device.

I tried to read Windows ACPI events via ETW, but there wasn't any event,
which could be associated with a key press, but brightness was changing
(it seems I just got some error handling events).

I checked the DSTD from the old and new HW. The size has more then
duplicated (414k => 955k) with a 43k diff. The diff for the FUJ02E3
device is just 356 lines, but I couldn't identify anything, which might
relate to the keys.

Any help would be appreciated to get this fixed.

ATB

Jan-Marek Glogowski
