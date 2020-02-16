From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] platform/x86: Kconfig: Fix a typo
Date: Sun, 16 Feb 2020 11:34:37 +0100
Message-ID: <20200216103437.19500-1-christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org, mchehab+samsung@kernel.org, dmitry.torokhov@gmail.com, gregkh@linuxfoundation.org, ayman.bagabas@gmail.com, srinivas.pandruvada@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
List-Id: platform-driver-x86.vger.kernel.org

'paramaters' should be 'parameters'

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/platform/x86/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 664ead09c7fb..ae75b19e8649 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1213,7 +1213,7 @@ config INTEL_RST
         tristate "Intel Rapid Start Technology Driver"
 	depends on ACPI
 	---help---
-	  This driver provides support for modifying paramaters on systems
+	  This driver provides support for modifying parameters on systems
 	  equipped with Intel's Rapid Start Technology. When put in an ACPI
 	  sleep state, these devices will wake after either a configured
 	  timeout or when the system battery reaches a critical state,
-- 
2.20.1
