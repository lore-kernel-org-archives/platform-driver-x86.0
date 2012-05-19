From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 06/19] sony-laptop: additional debug statements
Date: Sat, 19 May 2012 22:35:49 +0900
Message-ID: <1337434562-12283-7-git-send-email-malattia@linux.it>
References: <1337434562-12283-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:47653 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757854Ab2ESNpO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 19 May 2012 09:45:14 -0400
In-Reply-To: <1337434562-12283-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 4420353..89e5cf9 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -713,8 +713,13 @@ static union acpi_object *__call_snc_method(acpi_handle handle, char *method,
 		params.count = 1;
 		params.pointer = &in;
 		status = acpi_evaluate_object(handle, method, &params, &output);
-	} else
+		dprintk("__call_snc_method: [%s:0x%.8x%.8x]\n", method,
+				(unsigned int)(*value >> 32),
+				(unsigned int)*value & 0xffffffff);
+	} else {
 		status = acpi_evaluate_object(handle, method, NULL, &output);
+		dprintk("__call_snc_method: [%s]\n", method);
+	}
 
 	if (ACPI_FAILURE(status)) {
 		pr_err("Failed to evaluate [%s]\n", method);
-- 
1.7.10
