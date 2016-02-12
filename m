From: Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: [PATCH] asus-nb-wmi: add wapf=4 quirk for ASUS X75VD
Date: Fri, 12 Feb 2016 15:35:21 +0200
Message-ID: <0cbfffd61495fe8bc060c53b424d9391@natalenko.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Chary <corentin.chary@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Wi-Fi on ASUS X75VD laptop does not work unless asus_nb_wmi module
is loaded with wapf=4 option. Add quirk for this.

---
  drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
  1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c 
b/drivers/platform/x86/asus-nb-wmi.c
index 131fee2..091ca7a 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -272,6 +272,15 @@ static const struct dmi_system_id asus_quirks[] = {
         },
         {
                 .callback = dmi_matched,
+               .ident = "ASUSTeK COMPUTER INC. X75VD",
+               .matches = {
+                       DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER 
INC."),
+                       DMI_MATCH(DMI_PRODUCT_NAME, "X75VD"),
+               },
+               .driver_data = &quirk_asus_wapf4,
+       },
+       {
+               .callback = dmi_matched,
                 .ident = "ASUSTeK COMPUTER INC. 1015E",
                 .matches = {
                         DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER 
INC."),
-- 
2.7.1
