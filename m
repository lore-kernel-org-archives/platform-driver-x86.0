From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH 2/4] platform/x86: asus-wmi: Evaluate wmi method with instance number 0x0
Date: Sat, 12 Aug 2017 09:44:16 +0200
Message-ID: <1502523858-25716-3-git-send-email-pali.rohar@gmail.com>
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

According to available DSDT dump from Asus machine, there is the only one
instance of the WMI GUID 97845ED0-4E6D-11DE-8A39-0800200C9A66 and so it is
0x0. Moreover corresponding method WMBC does not check Arg0 (instance
number) at all.

DSDT dump is available at:
https://lwn.net/Articles/391249/

_WDG dump:
0xD0, 0x5E, 0x84, 0x97, 0x6D, 0x4E, 0xDE, 0x11, 0x8A, 0x39, 0x08,
0x00, 0x20, 0x0C, 0x9A, 0x66,
0x42, 0x43,    // Object ID "BC" = method "WMBC"
0x01,          // Instance count
0x02,          // Flags

Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
---
 drivers/platform/x86/asus-wmi.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 709e3a6..48e1541 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -299,7 +299,7 @@ static int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
 	union acpi_object *obj;
 	u32 tmp = 0;
 
-	status = wmi_evaluate_method(ASUS_WMI_MGMT_GUID, 1, method_id,
+	status = wmi_evaluate_method(ASUS_WMI_MGMT_GUID, 0, method_id,
 				     &input, &output);
 
 	if (ACPI_FAILURE(status))
@@ -1946,7 +1946,7 @@ static int show_call(struct seq_file *m, void *data)
 	acpi_status status;
 
 	status = wmi_evaluate_method(ASUS_WMI_MGMT_GUID,
-				     1, asus->debug.method_id,
+				     0, asus->debug.method_id,
 				     &input, &output);
 
 	if (ACPI_FAILURE(status))
-- 
1.7.9.5
