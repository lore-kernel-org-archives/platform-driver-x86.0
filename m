From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH v2 3/3] Sony-laptop: Use common error handling code in
 sony_nc_setup_rfkill()
Date: Wed, 1 Nov 2017 19:49:19 +0100
Message-ID: <522fa39e-4aad-3a18-f63f-bed36f30ee0a@users.sourceforge.net>
References: <f33d9aa0-1a8e-f702-7513-5c0d5b464529@users.sourceforge.net>
 <CAHp75VcMkXCioCzmLE0+BTmkqc5RSOx9yPO0ectVHMrMvewgwg@mail.gmail.com>
 <17ee534c-9fe6-19c4-0522-76cd3cbe5f88@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <17ee534c-9fe6-19c4-0522-76cd3cbe5f88@users.sourceforge.net>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, Darren Hart <dvhart@infradead.org>, Marco Chiappero <marco@absence.it>, Matthew Garrett <mjg@redhat.com>, Mattia Dongili <malattia@linux.it>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 1 Nov 2017 19:17:01 +0100

Add a jump target so that a bit of exception handling can be better reused
at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---

v2:
This software refactoring was repeated after the error code handling was
adjusted for two function calls.

 drivers/platform/x86/sony-laptop.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 62aa2c37b8d2..8e2ee1e221fe 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -1661,31 +1661,32 @@ static int sony_nc_setup_rfkill(struct acpi_device *device,
 		return -ENOMEM;
 
 	err = sony_call_snc_handle(sony_rfkill_handle, 0x200, &result);
-	if (err < 0) {
-		rfkill_destroy(rfk);
-		return err;
-	}
+	if (err < 0)
+		goto destroy_rfk;
+
 	hwblock = !(result & 0x1);
 
 	err = sony_call_snc_handle(sony_rfkill_handle,
 				   sony_rfkill_address[nc_type],
 				   &result);
-	if (err < 0) {
-		rfkill_destroy(rfk);
-		return err;
-	}
+	if (err < 0)
+		goto destroy_rfk;
+
 	swblock = !(result & 0x2);
 
 	rfkill_init_sw_state(rfk, swblock);
 	rfkill_set_hw_state(rfk, hwblock);
 
 	err = rfkill_register(rfk);
-	if (err) {
-		rfkill_destroy(rfk);
-		return err;
-	}
+	if (err)
+		goto destroy_rfk;
+
 	sony_rfkill_devices[nc_type] = rfk;
 	return err;
+
+destroy_rfk:
+	rfkill_destroy(rfk);
+	return err;
 }
 
 static void sony_nc_rfkill_update(void)
-- 
2.14.3
