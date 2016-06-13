From: "=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?=" <jprvita@gmail.com>
Subject: [PATCH 0/7] asus-wireless: LED control
Date: Mon, 13 Jun 2016 16:57:29 -0400
Message-ID: <1465851456-1421-1-git-send-email-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux@endlessm.com, =?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

This series adds support for controlling the airplane-mode indicator LE=
D
present in some Asus laptops. It also creates a quirk in asus-wmi so it=
 does not
create RFKill devices for platforms that use asus-wireless and where th=
ere is a
competition for the LED control (see "asus-wmi: Create quirk for airpla=
ne_mode
LED" for more details).

Jo=C3=A3o Paulo Rechi Vita (7):
  asus-wireless: Toggle airplane mode LED
  asus-wmi: Create quirk for airplane_mode LED
  asus-wmi: Add quirk_no_rfkill for the Asus N552VW
  asus-wmi: Add quirk_no_rfkill for the Asus U303LB
  asus-wmi: Add quirk_no_rfkill for the Asus Z550MA
  asus-wmi: Add quirk_no_rfkill_wapf4 for the Asus X456UF
  asus-wmi: Add quirk_no_rfkill_wapf4 for the Asus X456UA

 drivers/platform/x86/Kconfig         |  2 +
 drivers/platform/x86/asus-nb-wmi.c   | 49 ++++++++++++++++++-
 drivers/platform/x86/asus-wireless.c | 91 ++++++++++++++++++++++++++++=
+++++++-
 drivers/platform/x86/asus-wmi.c      |  8 ++--
 drivers/platform/x86/asus-wmi.h      |  1 +
 5 files changed, 145 insertions(+), 6 deletions(-)

--=20
2.5.0
