From: Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH] classmate-laptop: fix sparse warning
Date: Thu,  5 Feb 2015 14:57:44 +0000
Message-ID: <1423148264-6877-1-git-send-email-prabhakar.csengg@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-we0-f172.google.com ([74.125.82.172]:63810 "EHLO
	mail-we0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757383AbbBEO6E (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 5 Feb 2015 09:58:04 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>, Daniel Oliveira Nascimento <don@syst.com.br>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>

From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>

this patch fixes following sparse warning:

classmate-laptop.c:523:61: warning: Using plain integer as NULL pointer

Signed-off-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>
---
 Found this issue on linux-next (gcc  version 4.9.2,
 sparse version  0.4.5-rc1) and applies on top linux-next.

 drivers/platform/x86/classmate-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/classmate-laptop.c b/drivers/platform/x86/classmate-laptop.c
index 70d355a..55cf10b 100644
--- a/drivers/platform/x86/classmate-laptop.c
+++ b/drivers/platform/x86/classmate-laptop.c
@@ -520,7 +520,7 @@ static acpi_status cmpc_get_accel(acpi_handle handle,
 {
 	union acpi_object param[2];
 	struct acpi_object_list input;
-	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, 0 };
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
 	unsigned char *locs;
 	acpi_status status;
 
-- 
1.9.1
