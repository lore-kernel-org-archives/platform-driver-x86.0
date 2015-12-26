From: "=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?=" <jprvita@gmail.com>
Subject: [RFCv2 0/4] Asus Wireless Radio Control driver
Date: Sat, 26 Dec 2015 09:56:33 -0500
Message-ID: <1451141797-1066-1-git-send-email-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pf0-f172.google.com ([209.85.192.172]:33690 "EHLO
	mail-pf0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751917AbbLZO47 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 26 Dec 2015 09:56:59 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, =?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@endlessm.com>

This is the 2nd RFC for the "Asus Wireless Radio Control" device, addre=
ssing
the comments on the previous RFC. The differences from the previous RFC=
 are:

 - Generate input events accessing the input layer directly instead of =
using
   sparse_keymap, as this was considered overkill for a device which ha=
s only
   one event type.

 - Set the input device vendor id.

 - Clean-up the driver to make a little shorter: now the only extra bit=
s
   comparing to Mousou's proposal is the "struct asus_wireless_data", w=
hich is
   used to keep all the driver's data (input device pointer, acpi devic=
e
   pointer and LEDs data).

 - Compile the driver as a module by default.

 - Select the necessary config options to compile the led_class subsyst=
em when
   this driver is selected.

 - Change the module name from asus-wrc to asus-wireless.

Since I am currently travelling I did not have a chance to test this ch=
anges,
but I'll do so as soon as I get back to my home office on Jan 1st. I de=
cided to
send this updated version anyway to get feedback since this can't be me=
rged
until we have the airplane mode RFKill LED trigger merged in the wirele=
ss tree.
I'll also send that patch to linux-wireless for feedback and integratio=
n later
today.

Regards,

Joao Paulo

Jo=C3=A3o Paulo Rechi Vita (4):
  platform/x86: Add Asus Wireless Radio Control driver
  asus-wireless: Add ACPI HID ATK4001
  net/rfkill: Create "airplane mode" LED trigger
  asus-wireless: Toggle airplane mode LED

 MAINTAINERS                          |   6 ++
 drivers/platform/x86/Kconfig         |  17 ++++
 drivers/platform/x86/Makefile        |   1 +
 drivers/platform/x86/asus-wireless.c | 187 +++++++++++++++++++++++++++=
++++++++
 net/rfkill/core.c                    |  30 ++++++
 5 files changed, 241 insertions(+)
 create mode 100644 drivers/platform/x86/asus-wireless.c

--=20
2.5.0
