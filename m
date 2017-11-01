From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH v2 1/3] Sony-laptop: Fix exception handling in
 sony_nc_setup_rfkill()
Date: Wed, 1 Nov 2017 19:46:45 +0100
Message-ID: <354baacc-58dd-7012-de2c-11042604826e@users.sourceforge.net>
References: <f33d9aa0-1a8e-f702-7513-5c0d5b464529@users.sourceforge.net>
 <CAHp75VcMkXCioCzmLE0+BTmkqc5RSOx9yPO0ectVHMrMvewgwg@mail.gmail.com>
 <17ee534c-9fe6-19c4-0522-76cd3cbe5f88@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.14]:60943 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754821AbdKASrR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Nov 2017 14:47:17 -0400
In-Reply-To: <17ee534c-9fe6-19c4-0522-76cd3cbe5f88@users.sourceforge.net>
Content-Language: en-GB
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, Darren Hart <dvhart@infradead.org>, Marco Chiappero <marco@absence.it>, Matthew Garrett <mjg@redhat.com>, Mattia Dongili <malattia@linux.it>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Andy Shevchenko <andy@infradead.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 1 Nov 2017 18:42:45 +0100

Source code review for a specific software refactoring showed the need
for another correction because the error code "-1" was returned so far
if a call of the function "sony_call_snc_handle" failed here.
Thus assign the return value from these two function calls also to
the variable "err" and provide it in case of a failure.

Fixes: d6f15ed876b83a1a0eba1d0473eef58acc95444a ("sony-laptop: use soft rfkill status stored in hw")
Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Link: https://lkml.org/lkml/2017/10/31/463
Link: https://lkml.kernel.org/r/<CAHp75VcMkXCioCzmLE0+BTmkqc5RSOx9yPO0ectVHMrMvewgwg@mail.gmail.com>
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/platform/x86/sony-laptop.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index a16cea2be9c3..4332cc982ce0 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -1660,17 +1660,19 @@ static int sony_nc_setup_rfkill(struct acpi_device *device,
 	if (!rfk)
 		return -ENOMEM;
 
-	if (sony_call_snc_handle(sony_rfkill_handle, 0x200, &result) < 0) {
+	err = sony_call_snc_handle(sony_rfkill_handle, 0x200, &result);
+	if (err < 0) {
 		rfkill_destroy(rfk);
-		return -1;
+		return err;
 	}
 	hwblock = !(result & 0x1);
 
-	if (sony_call_snc_handle(sony_rfkill_handle,
-				sony_rfkill_address[nc_type],
-				&result) < 0) {
+	err = sony_call_snc_handle(sony_rfkill_handle,
+				   sony_rfkill_address[nc_type],
+				   &result);
+	if (err < 0) {
 		rfkill_destroy(rfk);
-		return -1;
+		return err;
 	}
 	swblock = !(result & 0x2);
 
-- 
2.14.3
