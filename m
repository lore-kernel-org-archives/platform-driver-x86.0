From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH 1/4] platform/x86: mxm-wmi: Evaluate wmi method with instance number 0x0
Date: Sat, 12 Aug 2017 09:44:15 +0200
Message-ID: <1502523858-25716-2-git-send-email-pali.rohar@gmail.com>
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

According to MXM 2.1 specification, there is the only one instance of the
WMI GUID F6CB5C3C-9CAE-4EBD-B577-931EA32A2CC0 and so it is instance 0x0.

MXM 2.1 specification:
https://lekensteyn.nl/files/docs/mxm-2.1-software-spec.pdf

_WDG dump:
// Methods GUID {F6CB5C3C-9CAE-4EBD-B577-931EA32A2CC0}
0x3C, 0x5C, 0xCB, 0xF6, 0xAE, 0x9C, 0xBD, 0x4E, 0xB5, 0x77, 0x93,
0x1E, 0xA3, 0x2A, 0x2C, 0xC0,
0x4D, 0x58,    // Object ID "MX" = method "WMMX"
1,             // Instance Count
0x02,          // Flags (WMIACPI_REGFLAG_METHOD)

Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
---
 drivers/platform/x86/mxm-wmi.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/mxm-wmi.c b/drivers/platform/x86/mxm-wmi.c
index f4bad83..35d8b9a 100644
--- a/drivers/platform/x86/mxm-wmi.c
+++ b/drivers/platform/x86/mxm-wmi.c
@@ -53,7 +53,7 @@ int mxm_wmi_call_mxds(int adapter)
 
 	printk("calling mux switch %d\n", adapter);
 
-	status = wmi_evaluate_method(MXM_WMMX_GUID, 0x1, adapter, &input,
+	status = wmi_evaluate_method(MXM_WMMX_GUID, 0x0, adapter, &input,
 				     &output);
 
 	if (ACPI_FAILURE(status))
@@ -78,7 +78,7 @@ int mxm_wmi_call_mxmx(int adapter)
 
 	printk("calling mux switch %d\n", adapter);
 
-	status = wmi_evaluate_method(MXM_WMMX_GUID, 0x1, adapter, &input,
+	status = wmi_evaluate_method(MXM_WMMX_GUID, 0x0, adapter, &input,
 				     &output);
 
 	if (ACPI_FAILURE(status))
-- 
1.7.9.5
