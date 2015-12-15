From: "=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?=" <jprvita@gmail.com>
Subject: [RFC 0/4] Asus Wireless Radio Control driver
Date: Tue, 15 Dec 2015 10:30:38 -0500
Message-ID: <1450193442-7930-1-git-send-email-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f171.google.com ([209.85.220.171]:34798 "EHLO
	mail-qk0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964829AbbLOPaq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 15 Dec 2015 10:30:46 -0500
Received: by mail-qk0-f171.google.com with SMTP id p187so18007532qkd.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Dec 2015 07:30:46 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, jprvita@gmail.com, =?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@endlessm.com>

This series is a request for comments on the driver for the "Asus Wirel=
ess
Radio Control" device, as named on the vendor website, which handles
notifications from the airplane mode hotkey and drives the airplane mod=
e
indicator LED. This device appears in the DSDT as "ASHS".

When the airplane mode hotkey is pressed a query 0x0B is started in the
Embedded Controller, and all this query does is a notify ASHS with the =
value
0x88. ASHS also has one method HSWC, which can drive the airplane mode =
LED and
query its status, according to its parameter.

To properly drive the LED a new RFKill trigger was implemented, to trac=
k the
global state of all RFKill switches in the system, and turn the LED ON =
when all
are blocked, and OFF otherwise. This code will have to go through revie=
w on
linux-wireless, but first I wanted to get feedback on the WRC driver it=
self.

There is one known issue: the airplane mode LED uses the same ID as the=
 WLAN
LED in asus-wmi, so at the moment to have the LED being driven correctl=
y by
asus-wrc I have to disable asus-wmi. Even with wapf=3D0, which does not=
 register
a WLAN LED in asus-wmi, the conflict still occurs because
ASUS_WMI_DSTS_USER_BIT is set. Please advise on what is the best way to=
 solve
this problem.

I've chosen to make this a separate module because this is a separate e=
ntry in
the DSDT, and checkpatch told me to add an entry in MAINTAINERS in this=
 case.
Please let me know if any of this should have been done differently.

I have access to two Asus laptops which need this driver for the airpla=
ne mode
hotkey to work: E202SA (which does not have a LED) and X555UB (which ha=
ve a
LED), and on https://bugzilla.kernel.org/show_bug.cgi?id=3D98931#c22 th=
ere is
report of a 3rd laptop that gets fixed with this driver. This should al=
so fix
the mentioned bug report.

Regards,

Joao Paulo.

Jo=C3=A3o Paulo Rechi Vita (4):
  platform/x86: Add Asus Wireless Radio Control driver
  asus-wrc: Add ACPI HID ATK4001
  net/rfkill: Create "airplane mode" LED trigger
  asus-wrc: Toggle airplane mode LED

 MAINTAINERS                     |   6 ++
 drivers/platform/x86/Kconfig    |  15 +++
 drivers/platform/x86/Makefile   |   1 +
 drivers/platform/x86/asus-wrc.c | 200 ++++++++++++++++++++++++++++++++=
++++++++
 net/rfkill/core.c               |  30 ++++++
 5 files changed, 252 insertions(+)
 create mode 100644 drivers/platform/x86/asus-wrc.c

--=20
2.5.0
