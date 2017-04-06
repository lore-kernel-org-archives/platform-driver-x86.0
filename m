From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH] platform/x86: fujitsu-laptop: update debug message logged by call_fext_func()
Date: Thu,  6 Apr 2017 08:46:10 +0200
Message-ID: <20170406064610.13984-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:34171 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756268AbdDFGqP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 6 Apr 2017 02:46:15 -0400
Received: by mail-lf0-f68.google.com with SMTP id x137so2826005lff.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 05 Apr 2017 23:46:14 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Update debug message logged when the acpi_evaluate_integer() call inside
call_fext_func() fails so that it covers a broader set of possible
errors.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
This patch is a follow-up to v1 of the call_fext_func() cleanup series
and as such, it should be applied to for-next.

 drivers/platform/x86/fujitsu-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 26149f58dba7..928778ccc4c1 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -232,7 +232,7 @@ static int call_fext_func(int func, int op, int feature, int state)
 	status = acpi_evaluate_integer(fujitsu_laptop->acpi_handle, "FUNC",
 				       &arg_list, &value);
 	if (ACPI_FAILURE(status)) {
-		vdbg_printk(FUJLAPTOP_DBG_ERROR, "FUNC interface is not present\n");
+		vdbg_printk(FUJLAPTOP_DBG_ERROR, "Failed to evaluate FUNC\n");
 		return -ENODEV;
 	}
 
-- 
2.12.2
