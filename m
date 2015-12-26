From: "=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?=" <jprvita@gmail.com>
Subject: [PATCH 2/4] asus-wireless: Add ACPI HID ATK4001
Date: Sat, 26 Dec 2015 09:56:35 -0500
Message-ID: <1451141797-1066-3-git-send-email-jprvita@endlessm.com>
References: <1451141797-1066-1-git-send-email-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1451141797-1066-1-git-send-email-jprvita@endlessm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, =?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

As reported in https://bugzilla.kernel.org/show_bug.cgi?id=3D98931#c22 =
in
the Asus UX31A the Asus Wireless Radio Control device (ASHS) uses the
HID "ATK4001".

Signed-off-by: Jo=C3=A3o Paulo Rechi Vita <jprvita@endlessm.com>
Reported-by: Tasev Nikola <tasev.stefanoska@skynet.be>
---
 drivers/platform/x86/asus-wireless.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/x8=
6/asus-wireless.c
index ef7dba5..7928efd 100644
--- a/drivers/platform/x86/asus-wireless.c
+++ b/drivers/platform/x86/asus-wireless.c
@@ -83,6 +83,7 @@ static int asus_wireless_remove(struct acpi_device *d=
evice)
 }
=20
 static const struct acpi_device_id device_ids[] =3D {
+	{"ATK4001", 0},
 	{"ATK4002", 0},
 	{"", 0},
 };
--=20
2.5.0
