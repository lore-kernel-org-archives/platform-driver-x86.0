From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: [PATCH 9/9] platform: x86: get rid of a non-existent document
Date: Fri, 28 Jun 2019 09:12:31 -0300
Message-ID: <9472251c3ff159b832b4e82d77836c44f89b49b0.1561723736.git.mchehab+samsung@kernel.org>
References: <cover.1561723736.git.mchehab+samsung@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1561723736.git.mchehab+samsung@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Changeset 163ede97a9a2 ("Documentation: platform: Delete x86-laptop-drivers.txt")
removed the x86-laptop-drivers.txt file, but forgot to update its
Kconfig.

Fixes: 163ede97a9a2 ("Documentation: platform: Delete x86-laptop-drivers.txt")
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 drivers/platform/x86/Kconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index bd15b47abcb4..c318501773bc 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -433,9 +433,6 @@ config COMPAL_LAPTOP
 	  It adds support for rfkill, Bluetooth, WLAN, LCD brightness, hwmon
 	  and battery charging level control.
 
-	  For a (possibly incomplete) list of supported laptops, please refer
-	  to: Documentation/platform/x86-laptop-drivers.txt
-
 config SONY_LAPTOP
 	tristate "Sony Laptop Extras"
 	depends on ACPI
-- 
2.21.0
