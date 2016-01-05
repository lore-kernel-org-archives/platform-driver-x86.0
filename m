From: "=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?=" <jprvita@gmail.com>
Subject: [PATCH 0/2] Asus Wireless Radio Control driver
Date: Tue,  5 Jan 2016 08:25:59 -0500
Message-ID: <1452000361-13640-1-git-send-email-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f181.google.com ([209.85.220.181]:35234 "EHLO
	mail-qk0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751188AbcAEN0M (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 5 Jan 2016 08:26:12 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Corentin Chary <corentin.chary@gmail.com>, andy.shevchenko@gmail.com, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, =?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@endlessm.com>

This series implements the driver for the "Asus Wireless Radio Control"=
 device,
as named on the vendor website, which handles notifications from the ai=
rplane
mode hotkey and drives the airplane mode indicator LED. This device app=
ears in
the DSDT as "ASHS".

I decided to split the series and move the commits that drive the LED t=
o a
separate series, so this part can be merged without waiting for feedbac=
k on the
new airplane mode RFKill LED trigger.

Regards,

Joao Paulo

Jo=C3=A3o Paulo Rechi Vita (2):
  platform/x86: Add Asus Wireless Radio Control driver
  asus-wireless: Add ACPI HID ATK4001

 MAINTAINERS                          |  6 +++
 drivers/platform/x86/Kconfig         | 15 +++++++
 drivers/platform/x86/Makefile        |  1 +
 drivers/platform/x86/asus-wireless.c | 84 ++++++++++++++++++++++++++++=
++++++++
 4 files changed, 106 insertions(+)
 create mode 100644 drivers/platform/x86/asus-wireless.c

--=20
2.5.0
