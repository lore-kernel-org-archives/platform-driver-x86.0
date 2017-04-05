From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 1/3] platform/x86: fujitsu-laptop: clean up local variables in call_fext_func()
Date: Wed,  5 Apr 2017 08:50:21 +0200
Message-ID: <20170405065023.3267-2-kernel@kempniu.pl>
References: <20170405065023.3267-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:34075 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754695AbdDEGum (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 Apr 2017 02:50:42 -0400
Received: by mail-lf0-f68.google.com with SMTP id x137so358834lff.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 04 Apr 2017 23:50:42 -0700 (PDT)
In-Reply-To: <20170405065023.3267-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Set values of FUNC call parameters in a designated initializer.  Do not
initialize status and handle variables as the values these are
initialized to have no influence on execution flow.  Use an array
variable instead of the address of the first element of that array.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index f66da4b0c31a..ca1491ff659e 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -219,16 +219,16 @@ static u32 dbg_level = 0x03;
 
 static int call_fext_func(int cmd, int arg0, int arg1, int arg2)
 {
-	acpi_status status = AE_OK;
 	union acpi_object params[4] = {
-	{ .type = ACPI_TYPE_INTEGER },
-	{ .type = ACPI_TYPE_INTEGER },
-	{ .type = ACPI_TYPE_INTEGER },
-	{ .type = ACPI_TYPE_INTEGER }
+		{ .integer.type = ACPI_TYPE_INTEGER, .integer.value = cmd },
+		{ .integer.type = ACPI_TYPE_INTEGER, .integer.value = arg0 },
+		{ .integer.type = ACPI_TYPE_INTEGER, .integer.value = arg1 },
+		{ .integer.type = ACPI_TYPE_INTEGER, .integer.value = arg2 }
 	};
-	struct acpi_object_list arg_list = { 4, &params[0] };
+	struct acpi_object_list arg_list = { 4, params };
 	unsigned long long value;
-	acpi_handle handle = NULL;
+	acpi_status status;
+	acpi_handle handle;
 
 	status = acpi_get_handle(fujitsu_laptop->acpi_handle, "FUNC", &handle);
 	if (ACPI_FAILURE(status)) {
@@ -237,11 +237,6 @@ static int call_fext_func(int cmd, int arg0, int arg1, int arg2)
 		return -ENODEV;
 	}
 
-	params[0].integer.value = cmd;
-	params[1].integer.value = arg0;
-	params[2].integer.value = arg1;
-	params[3].integer.value = arg2;
-
 	status = acpi_evaluate_integer(handle, NULL, &arg_list, &value);
 	if (ACPI_FAILURE(status)) {
 		vdbg_printk(FUJLAPTOP_DBG_WARN,
-- 
2.12.2
