From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH v2] platform/x86: acerhdf: Replace HTTP links with HTTPS ones
Date: Wed, 15 Jul 2020 20:57:44 +0200
Message-ID: <20200715185744.52335-1-grandmaster@al2klimov.de>
References: <CAHp75VcZ5f0xw9RbV0OZ0DuE6JqCfkTExqO=MJ9AE0TFdCV8Xg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VcZ5f0xw9RbV0OZ0DuE6JqCfkTExqO=MJ9AE0TFdCV8Xg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org, peter@piie.net, mika.westerberg@linux.intel.com, lee.jones@linaro.org, dmitry.torokhov@gmail.com, ayman.bagabas@gmail.com, masahiroy@kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
List-Id: platform-driver-x86.vger.kernel.org

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
            If both the HTTP and HTTPS versions
            return 200 OK and serve the same content:
              Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 v2: Combined all two patches for acerhdf.

 drivers/platform/x86/Kconfig   | 2 +-
 drivers/platform/x86/acerhdf.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 0581a54cf562..1d96e07b2a02 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -140,7 +140,7 @@ config ACERHDF
 	  in the same node directory will tell you if it is "acerhdf".
 
 	  For more information about this driver see
-	  <http://piie.net/files/acerhdf_README.txt>
+	  <https://piie.net/files/acerhdf_README.txt>
 
 	  If you have an Acer Aspire One netbook, say Y or M
 	  here.
diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
index 4df7609b4aa9..a7a0b2e0ceb9 100644
--- a/drivers/platform/x86/acerhdf.c
+++ b/drivers/platform/x86/acerhdf.c
@@ -5,7 +5,7 @@
  *           as soon as the upper/lower threshold is reached.
  *
  * (C) 2009 - Peter Kaestle     peter (a) piie.net
- *                              http://piie.net
+ *                              https://piie.net
  *     2009 Borislav Petkov	bp (a) alien8.de
  *
  * Inspired by and many thanks to:
-- 
2.27.0
