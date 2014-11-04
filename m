From: Giedrius Statkevicius <giedriuswork@gmail.com>
Subject: [PATCH] platform: x86: remove redundant variable in hp-wireless.c
Date: Wed,  5 Nov 2014 01:47:19 +0200
Message-ID: <1415144839-2035-1-git-send-email-giedriuswork@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Giedrius=20Statkevi=C4=8Dius?= <giedriuswork@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Remove a variable because it only holds the results of a function call
and then gets returned so instead just return the result of a function
call.

Signed-off-by: Giedrius Statkevi=C4=8Dius <giedriuswork@gmail.com>
---
 drivers/platform/x86/hp-wireless.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/platform/x86/hp-wireless.c b/drivers/platform/x86/=
hp-wireless.c
index 415348f..670c62b 100644
--- a/drivers/platform/x86/hp-wireless.c
+++ b/drivers/platform/x86/hp-wireless.c
@@ -82,10 +82,7 @@ static void hpwl_notify(struct acpi_device *acpi_dev=
, u32 event)
=20
 static int hpwl_add(struct acpi_device *device)
 {
-	int err;
-
-	err =3D hp_wireless_input_setup();
-	return err;
+	return hp_wireless_input_setup();
 }
=20
 static int hpwl_remove(struct acpi_device *device)
--=20
2.1.3
