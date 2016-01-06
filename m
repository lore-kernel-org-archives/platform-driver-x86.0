From: "=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?=" <jprvita@gmail.com>
Subject: [PATCH 0/2] asus-wireless: Drive airplane mode LED
Date: Tue,  5 Jan 2016 21:19:26 -0500
Message-ID: <1452046768-6291-1-git-send-email-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qg0-f42.google.com ([209.85.192.42]:36111 "EHLO
	mail-qg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751636AbcAFCTl (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 5 Jan 2016 21:19:41 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Corentin Chary <corentin.chary@gmail.com>, andy.shevchenko@gmail.com, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, =?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@endlessm.com>

This series adds code to drive the airplane mode indicator LED present =
in some
of the Asus laptops that have an airplane mode hotkey. It depends on a =
new LED
trigger created in the RFKill subsystem, which is currently pending rev=
iew on
linux-wireless.

It also creates a new DMI quirk on asus-wmi because it also tries to dr=
ive the
same LED on laptops where the BIOS reports it does not save the WLAN LE=
D state.

Jo=C3=A3o Paulo Rechi Vita (2):
  asus-wireless: Toggle airplane mode LED
  asus-wmi: Create quirk for airplane_mode LED

 drivers/platform/x86/Kconfig         |  2 +
 drivers/platform/x86/asus-nb-wmi.c   | 31 ++++++++++++
 drivers/platform/x86/asus-wireless.c | 92 ++++++++++++++++++++++++++++=
+++++++-
 drivers/platform/x86/asus-wmi.c      |  8 ++--
 drivers/platform/x86/asus-wmi.h      |  1 +
 5 files changed, 130 insertions(+), 4 deletions(-)

--=20
2.5.0
