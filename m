From: =?UTF-8?q?Giedrius=20Statkevi=C4=8Dius?=
	<giedrius.statkevicius@gmail.com>
Subject: [PATCH 2/2] asus-laptop: remove unused variable
Date: Thu,  7 Apr 2016 23:20:01 +0300
Message-ID: <1460060401-20742-2-git-send-email-giedrius.statkevicius@gmail.com>
References: <1460060401-20742-1-git-send-email-giedrius.statkevicius@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460060401-20742-1-git-send-email-giedrius.statkevicius@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: corentin.chary@gmail.com, dvhart@infradead.org
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Giedrius=20Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

`out' was assigned value but it was never used so remove it

Signed-off-by: Giedrius Statkevi=C4=8Dius <giedrius.statkevicius@gmail.=
com>
---
 drivers/platform/x86/asus-laptop.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/=
asus-laptop.c
index d86d42e..39ddcee 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -946,11 +946,8 @@ static ssize_t sysfs_acpi_set(struct asus_laptop *=
asus,
 			      const char *method)
 {
 	int rv, value;
-	int out =3D 0;
=20
 	rv =3D parse_arg(buf, count, &value);
-	if (rv > 0)
-		out =3D value ? 1 : 0;
=20
 	if (write_acpi_int(asus->handle, method, value))
 		return -ENODEV;
--=20
2.8.0
