From: "=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?=" <jprvita@gmail.com>
Subject: [PATCH] platform/x86: asus-wireless: Fix format specifier
Date: Tue, 22 May 2018 14:29:56 -0700
Message-ID: <20180522212956.5433-1-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: linux@endlessm.com, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: João Paulo Rechi Vita <jprvita@gmail.com>

u64 should be printed with %llx instead of %x and cast to uint.

Signed-off-by: João Paulo Rechi Vita <jprvita@gmail.com>
---
 drivers/platform/x86/asus-wireless.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/x86/asus-wireless.c
index f086469ea740..6afd011de9e5 100644
--- a/drivers/platform/x86/asus-wireless.c
+++ b/drivers/platform/x86/asus-wireless.c
@@ -72,7 +72,7 @@ static u64 asus_wireless_method(acpi_handle handle, const char *method,
 		acpi_handle_err(handle,
 				"Failed to eval method %s, param %#x (%d)\n",
 				method, param, s);
-	acpi_handle_debug(handle, "%s returned %#x\n", method, (uint) ret);
+	acpi_handle_debug(handle, "%s returned %#llx\n", method, ret);
 	return ret;
 }
 
-- 
2.17.0
