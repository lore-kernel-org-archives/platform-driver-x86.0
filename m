From: Peter Meiser <meiser@gmx-topmail.de>
Subject: Re: Dell Vostro V131: special hotkey not working
Date: Sat, 20 Jul 2013 07:03:03 +0200
Message-ID: <51EA1A07.10105@gmx-topmail.de>
References: <4F97FA4C.9040201@gmx-topmail.de> <20120425135328.GA13385@srcf.ucam.org> <4F980807.6000705@gmx-topmail.de> <20120425142205.GA14322@srcf.ucam.org> <50FA77C0.4060808@gmx-topmail.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010904050000020700000105"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.22]:51131 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751074Ab3GTFC7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 20 Jul 2013 01:02:59 -0400
Received: from [192.168.1.170] ([188.14.17.142]) by mail.gmx.com (mrgmx103)
 with ESMTPSA (Nemesis) id 0MOwY7-1V5cO63hxv-006Qn6 for
 <platform-driver-x86@vger.kernel.org>; Sat, 20 Jul 2013 07:02:58 +0200
In-Reply-To: <50FA77C0.4060808@gmx-topmail.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

This is a multi-part message in MIME format.
--------------010904050000020700000105
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi again,

I found a solution for the 1st issue. It needs a udev quirk to force_release. Please find attached a patch against current udev in Ubuntu 12.04.

For the 2nd issue, I still can't find a way to generate a keycode.

Thanks for your help!
Best regards,
Peter

Am 19.01.2013 11:38, schrieb Peter Meiser:
> Hi Matthew,
> 
> this topic is still valid. Could you help me debugging the hotkeys?
> 
> There're two issues:
> 1. The "Dell support center" hotkey generates keycode 0xEE, but this is done forever. That means that I don't see a release event.
> 2. The "Dell instant launch manager" hotkey doesn't generate anything.
> 
> Thanks a lot in advance,
> Peter
> 
> Am 25.04.2012 16:22, schrieb Matthew Garrett:
>> On Wed, Apr 25, 2012 at 04:19:51PM +0200, Peter Meiser wrote:
>>> Hello Matthew,
>>>
>>> Am 25.04.2012 15:53, schrieb Matthew Garrett:
>>>> watch -n 0.1 cat /proc/interrupts
>>>
>>> When running "watch -n 0,1 cat /proc/interrupts" (watch -n 0.1 errors out, maybe because of German environment???), the following row increases after each press:
>>>
>>>   9:          5          0          0          0   IO-APIC-fasteoi   acpi
>>
>> Ok, so it's definitely being handled by ACPI somehow - probably via WMI, 
>> but unsure. Rez, any chance you can look at the original message and let 
>> us know if this is expected to work with the current driver?
>>

--------------010904050000020700000105
Content-Type: text/x-patch;
 name="udev-keymaps-dell.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="udev-keymaps-dell.patch"

--- a/extras/keymap/keymaps/dell
+++ b/extras/keymap/keymaps/dell
@@ -25,5 +25,6 @@
 0xA2 playpause # Front panel play/pause
 0xA4 stopcd # Front panel stop
 0xED media # MediaDirect button
+0xEE screenlock # FIXME: Dell Support Center button
 0xD8 screenlock # FIXME: Tablet lock button
 0xD9 f21 # touchpad toggle
diff -Naur a/extras/keymap/95-keyboard-force-release.rules b/extras/keymap/95-keyboard-force-release.rules
--- a/extras/keymap/95-keyboard-force-release.rules	2013-07-20 06:59:13.626208521 +0200
+++ b/extras/keymap/95-keyboard-force-release.rules	2013-07-20 07:00:30.166211692 +0200
@@ -24,6 +24,7 @@
 ENV{DMI_VENDOR}=="Dell Inc.", ATTR{[dmi/id]product_name}=="Studio 1557|Studio 1558", RUN+="keyboard-force-release.sh $devpath common-volume-keys"
 ENV{DMI_VENDOR}=="Dell Inc.", ATTR{[dmi/id]product_name}=="*Latitude*|*Precision*", RUN+="keyboard-force-release.sh $devpath dell-touchpad"
 ENV{DMI_VENDOR}=="Dell Inc.", ATTR{[dmi/id]product_name}=="XPS*", RUN+="keyboard-force-release.sh $devpath dell-xps"
+ENV{DMI_VENDOR}=="Dell Inc.", ATTR{[dmi/id]product_name}=="*Vostro*", RUN+="keyboard-force-release.sh $devpath dell-vostro"
 
 ENV{DMI_VENDOR}=="FUJITSU SIEMENS", ATTR{[dmi/id]product_name}=="AMILO*", RUN+="keyboard-force-release.sh $devpath common-volume-keys"
 
diff -Naur a/extras/keymap/force-release-maps/dell-vostro b/extras/keymap/force-release-maps/dell-vostro
--- a/extras/keymap/force-release-maps/dell-vostro	1970-01-01 01:00:00.000000000 +0100
+++ b/extras/keymap/force-release-maps/dell-vostro	2013-07-20 06:59:45.086209823 +0200
@@ -0,0 +1 @@
+0xEE # Dell Support Center button

--------------010904050000020700000105--
