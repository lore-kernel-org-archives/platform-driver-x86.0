From: "=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?=" <jprvita@gmail.com>
Subject: [PATCH 0/5] asus-wireless: LED control
Date: Mon,  8 Feb 2016 12:05:18 -0500
Message-ID: <1454951123-27470-1-git-send-email-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qg0-f49.google.com ([209.85.192.49]:34624 "EHLO
	mail-qg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753431AbcBHRFh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 8 Feb 2016 12:05:37 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux@endlessm.com, =?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@endlessm.com>

This series adds support for controlling the airplane-mode indicator LE=
D
present in some Asus laptops. It also creates a quirk in asus-wmi so it=
 does not
create RFKill devices for platforms that use asus-wireless and where th=
ere is a
competition for the LED control (see "asus-wmi: Create quirk for airpla=
ne_mode
LED" for more details).

Jo=C3=A3o Paulo Rechi Vita (5):
  asus-wireless: Toggle airplane mode LED
  asus-wmi: Create quirk for airplane_mode LED
  asus-wmi: Add quirk_no_rfkill for the Asus X552VW
  asus-wmi: Add quirk_no_rfkill for the Asus U303LB
  asus-wmi: Add quirk_no_rfkill for the Asus Z550MA

 drivers/platform/x86/Kconfig         |  2 +
 drivers/platform/x86/asus-nb-wmi.c   | 40 ++++++++++++++++
 drivers/platform/x86/asus-wireless.c | 92 ++++++++++++++++++++++++++++=
+++++++-
 drivers/platform/x86/asus-wmi.c      |  8 ++--
 drivers/platform/x86/asus-wmi.h      |  1 +
 5 files changed, 139 insertions(+), 4 deletions(-)

--=20
2.5.0
