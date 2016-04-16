From: =?UTF-8?q?Giedrius=20Statkevi=C4=8Dius?=
	<giedrius.statkevicius@gmail.com>
Subject: [PATCH v2 2/2] asus-laptop: correct error handling in sysfs_acpi_set
Date: Sat, 16 Apr 2016 03:01:57 +0300
Message-ID: <1460764917-1042-2-git-send-email-giedrius.statkevicius@gmail.com>
References: <1460764917-1042-1-git-send-email-giedrius.statkevicius@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460764917-1042-1-git-send-email-giedrius.statkevicius@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: corentin.chary@gmail.com, dvhart@infradead.org
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Giedrius=20Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Properly return rv back to the caller in the case of an error in
parse_arg. In the process remove a unused variable 'out'.

Signed-off-by: Giedrius Statkevi=C4=8Dius <giedrius.statkevicius@gmail.=
com>
---
 drivers/platform/x86/asus-laptop.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/=
asus-laptop.c
index d86d42e..9a69734 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -946,11 +946,10 @@ static ssize_t sysfs_acpi_set(struct asus_laptop =
*asus,
 			      const char *method)
 {
 	int rv, value;
-	int out =3D 0;
=20
 	rv =3D parse_arg(buf, count, &value);
-	if (rv > 0)
-		out =3D value ? 1 : 0;
+	if (rv <=3D 0)
+		return rv;
=20
 	if (write_acpi_int(asus->handle, method, value))
 		return -ENODEV;
--=20
2.8.0
