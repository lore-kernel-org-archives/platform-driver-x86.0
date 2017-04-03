From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 2/3] platform/x86: fujitsu-laptop: simplify call_fext_func()
Date: Mon,  3 Apr 2017 11:38:58 +0200
Message-ID: <20170403093859.6685-3-kernel@kempniu.pl>
References: <20170403093859.6685-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:36288 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751829AbdDCJjL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Apr 2017 05:39:11 -0400
Received: by mail-lf0-f65.google.com with SMTP id n78so12309874lfi.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Apr 2017 02:39:11 -0700 (PDT)
In-Reply-To: <20170403093859.6685-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

acpi_evaluate_integer() takes a pathname parameter which contains the
name of the entity to evaluate underneath the given handle, so calling
acpi_get_handle() beforehand is redundant.  Replace the call to
acpi_get_handle() with a call to acpi_evaluate_integer(), thus
eliminating the need for a local variable storing the handle.  Adjust
whitespace to make checkpatch happy.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index ca1491ff659e..e5413d268b24 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -228,20 +228,11 @@ static int call_fext_func(int cmd, int arg0, int arg1, int arg2)
 	struct acpi_object_list arg_list = { 4, params };
 	unsigned long long value;
 	acpi_status status;
-	acpi_handle handle;
 
-	status = acpi_get_handle(fujitsu_laptop->acpi_handle, "FUNC", &handle);
+	status = acpi_evaluate_integer(fujitsu_laptop->acpi_handle, "FUNC",
+				       &arg_list, &value);
 	if (ACPI_FAILURE(status)) {
-		vdbg_printk(FUJLAPTOP_DBG_ERROR,
-				"FUNC interface is not present\n");
-		return -ENODEV;
-	}
-
-	status = acpi_evaluate_integer(handle, NULL, &arg_list, &value);
-	if (ACPI_FAILURE(status)) {
-		vdbg_printk(FUJLAPTOP_DBG_WARN,
-			"FUNC 0x%x (args 0x%x, 0x%x, 0x%x) call failed\n",
-				cmd, arg0, arg1, arg2);
+		vdbg_printk(FUJLAPTOP_DBG_ERROR, "FUNC interface is not present\n");
 		return -ENODEV;
 	}
 
-- 
2.12.1
