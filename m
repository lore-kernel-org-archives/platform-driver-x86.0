From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH 4/4] platform/x86: wmi: Fix check for method instance number
Date: Sat, 12 Aug 2017 09:44:18 +0200
Message-ID: <1502523858-25716-5-git-send-email-pali.rohar@gmail.com>
References: <1502523858-25716-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502523858-25716-1-git-send-email-pali.rohar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

instance_count defines number of instances of data block and instance
itself is indexed from zero, which means first instance has number 0.
Therefore check for invalid instance should be non-strict inequality.

Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
---
 drivers/platform/x86/wmi.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index e32ba57..0765b17 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -218,7 +218,7 @@ acpi_status wmi_evaluate_method(const char *guid_string, u8 instance,
 	if (!(block->flags & ACPI_WMI_METHOD))
 		return AE_BAD_DATA;
 
-	if (block->instance_count < instance)
+	if (block->instance_count <= instance)
 		return AE_BAD_PARAMETER;
 
 	input.count = 2;
@@ -265,7 +265,7 @@ static acpi_status __query_block(struct wmi_block *wblock, u8 instance,
 	block = &wblock->gblock;
 	handle = wblock->acpi_device->handle;
 
-	if (block->instance_count < instance)
+	if (block->instance_count <= instance)
 		return AE_BAD_PARAMETER;
 
 	/* Check GUID is a data block */
@@ -392,7 +392,7 @@ acpi_status wmi_set_block(const char *guid_string, u8 instance,
 	block = &wblock->gblock;
 	handle = wblock->acpi_device->handle;
 
-	if (block->instance_count < instance)
+	if (block->instance_count <= instance)
 		return AE_BAD_PARAMETER;
 
 	/* Check GUID is a data block */
-- 
1.7.9.5
