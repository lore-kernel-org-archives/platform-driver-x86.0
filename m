From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] msi-wmi: remove unnecessary static in msi_wmi_notify()
Date: Tue, 18 Jul 2017 16:49:37 -0500
Message-ID: <20170718214937.GA27363@embeddedgus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: platform-driver-x86.vger.kernel.org

Remove unnecessary static on local variable _key_. Such variable is
initialized before being used, on every execution path throughout
the function. The static has no benefit and, removing it reduces
the object file size.

This issue was detected using Coccinelle and the following semantic patch:
https://github.com/GustavoARSilva/coccinelle/blob/master/static/static_unused.cocci

In the following log you can see a significant difference in the object
file size. Also, there is a significant difference in the bss segment.
This log is the output of the size command, before and after the code
change:

before:
   text    data     bss     dec     hex filename
   6530    3736     320   10586    295a drivers/platform/x86/msi-wmi.o

after:
   text    data     bss     dec     hex filename
   6494    3648     256   10398    289e drivers/platform/x86/msi-wmi.o

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/platform/x86/msi-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-wmi.c
index f6209b7..6201382 100644
--- a/drivers/platform/x86/msi-wmi.c
+++ b/drivers/platform/x86/msi-wmi.c
@@ -184,7 +184,7 @@ static const struct backlight_ops msi_backlight_ops = {
 static void msi_wmi_notify(u32 value, void *context)
 {
 	struct acpi_buffer response = { ACPI_ALLOCATE_BUFFER, NULL };
-	static struct key_entry *key;
+	struct key_entry *key;
 	union acpi_object *obj;
 	acpi_status status;
 
-- 
2.5.0
