From: Wen Yang <wen.yang99@zte.com.cn>
Subject: [PATCH] platform/x86: intel_ips: Remove unnecessary NULL check before debugfs_remove_recursive
Date: Thu, 6 Dec 2018 09:09:14 +0800
Message-ID: <20181206010914.21964-1-wen.yang99@zte.com.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, zhong.weidong@zte.com.cn, Wen Yang <wen.yang99@zte.com.cn>
List-Id: platform-driver-x86.vger.kernel.org

debugfs=5Fremove=5Frecursive() accepts a NULL parameter and returns
immediately, there's no need for a NULL check in the caller.

This issue was detected with the help of Coccinelle.

Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
CC: Darren Hart <dvhart@infradead.org>
CC: Andy Shevchenko <andy@infradead.org>
CC: platform-driver-x86@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 drivers/platform/x86/intel=5Fips.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel=5Fips.c b/drivers/platform/x86/inte=
l=5Fips.c
index 225638a1b09e..f8175b972537 100644
--- a/drivers/platform/x86/intel=5Fips.c
+++ b/drivers/platform/x86/intel=5Fips.c
@@ -1300,9 +1300,7 @@ static const struct file=5Foperations ips=5Fdebugfs=
=5Fops =3D {
=20
 static void ips=5Fdebugfs=5Fcleanup(struct ips=5Fdriver *ips)
 {
-	if (ips->debug=5Froot)
-		debugfs=5Fremove=5Frecursive(ips->debug=5Froot);
-	return;
+	debugfs=5Fremove=5Frecursive(ips->debug=5Froot);
 }
=20
 static void ips=5Fdebugfs=5Finit(struct ips=5Fdriver *ips)
--=20
2.19.1
