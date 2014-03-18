From: Gaudenz Steinlin <gaudenz.steinlin@cirrax.com>
Subject: HP Compaq 6730b, wireless and bluetooth disabled on boot by hp-wmi
Date: Tue, 18 Mar 2014 23:49:39 +0100
Message-ID: <87fvmfyvek.fsf@meteor.durcheinandertal.bofh>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from vechigen.cirrax.com ([217.197.128.12]:60418 "EHLO
	mail.cirrax.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933543AbaCRWtn convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 18 Mar 2014 18:49:43 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Ronny Standtke <ronny.standtke@fhnw.ch>, Alex Hung <alex.hung@canonical.com>, Matthew Garrett <matthew.garrett@nebula.com>, =?utf-8?Q?Trep=C3=A1k?= Vilmos <trepo@netcomga.sk>


[ Resending this mail as it did not get through to the list and I did n=
ot
get any response so far. I have now uploaded all attachments to a
webserver to reduce the size of the message. ]

Hi

On a HP Compaq 6730b the wireless and bluetooth interface are blocked b=
y
rfkill on boot. It's possible to unblock them with the rfkill command,
but it can't be unblock on Windows without the HP Wireless Assistant
utility. This utility shows the device as "off" when in that state (as
opposed to "deactivated" when using the wireless "touch button").

Bisecting the kernel I found that the problem exists since commit:
commit 4fca7ce39f57517a31c911d8f66931355a39457e
Author: Trep=C3=A1k Vilmos <trepo@netcomga.sk>
Date:   Thu Oct 11 12:51:00 2012 +0200

    Platform: hp-wmi: add rfkill support for integrated GPS

    Add rfkill support for the GPS radio found in HP laptops (HP Eliteb=
ook 2170p and the like)
    using the Ericsson F5321/H5321 Mobile Broadband Module.

    Signed-off-by: Viliam Trep=C3=A1k <trepo@netcomga.sk>
    Signed-off-by: Matthew Garrett <matthew.garrett@nebula.com>

=46urther adding some debugging output to the kernel shows that the
bluetooth and wifi module are deactivated when the GPS module's rfkill
is initialized (around line 792 in hp-wmi.c). This is also confirmed by
the fact that "rfkill block gps" deactivates wifi and bluetooth and
"rfkill unblock gps" activates both but does not change the rfkill stat=
e
of the gps module itself. To my knowledge there is no gps or wwan modul=
e
in this notebook. [2]

My guess is that interpretation of the HPWMI_WIRELESS_QUERY for this
model is wrong. I tried to poke around a bit with acpidump, iasl and
wmidump[1], but did not find anything really obvious. My hope is that
someone more knowledgeable about this is able to further debug this.=20

acpidump output:=20
http://tmp.durcheinandertal.ch/hp-compaq-6730b/acpidump.out

decoded DSDT DSL:
http://tmp.durcheinandertal.ch/hp-compaq-6730b/dsdt.dsl

wmidump output:
http://tmp.durcheinandertal.ch/hp-compaq-6730b/wmidump.out

debugging patch:
http://tmp.durcheinandertal.ch/hp-compaq-6730b/hp-wmi_debug.patch

dmesg output of hp_wmi with my debugging patch:
http://tmp.durcheinandertal.ch/hp-compaq-6730b/hp_wmi.dmesg

Gaudenz

[1] https://github.com/iksaif/wmidump
[2] Output of rfkill list ; rfkill unblock gps ; rfkill list ; rfkill
block gps ; rfkill list:

0: phy0: Wireless LAN
    Soft blocked: no
    Hard blocked: yes
1: hp-wifi: Wireless LAN
    Soft blocked: yes
    Hard blocked: no
2: hp-bluetooth: Bluetooth
    Soft blocked: yes
    Hard blocked: no
3: hp-gps: GPS
    Soft blocked: yes
    Hard blocked: yes

0: phy0: Wireless LAN
    Soft blocked: no
    Hard blocked: no
1: hp-wifi: Wireless LAN
    Soft blocked: yes
    Hard blocked: no
2: hp-bluetooth: Bluetooth
    Soft blocked: yes
    Hard blocked: no
3: hp-gps: GPS
    Soft blocked: no
    Hard blocked: yes

0: phy0: Wireless LAN
    Soft blocked: no
    Hard blocked: yes
1: hp-wifi: Wireless LAN
    Soft blocked: yes
    Hard blocked: no
2: hp-bluetooth: Bluetooth
    Soft blocked: yes
    Hard blocked: no
3: hp-gps: GPS
    Soft blocked: yes
    Hard blocked: yes

--=20
Ever tried. Ever failed. No matter.
Try again. Fail again. Fail better.
~ Samuel Beckett ~
