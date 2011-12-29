From: Xi Wang <xi.wang@gmail.com>
Subject: [PATCH] panasonic-laptop: avoid overflow in acpi_pcc_hotkey_add()
Date: Wed, 28 Dec 2011 23:49:06 -0500
Message-ID: <1325134146-20461-1-git-send-email-xi.wang@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:40515 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750829Ab1L2Euw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 28 Dec 2011 23:50:52 -0500
Received: by qadc12 with SMTP id c12so7587121qad.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Dec 2011 20:50:51 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>, Harald Welte <laforge@gnumonks.org>
Cc: platform-driver-x86@vger.kernel.org, Xi Wang <xi.wang@gmail.com>

num_sifr could go negative since acpi_pcc_get_sqty() returns -EINVAL
on error.  Then it could bypass the sanity check (num_sifr > 255).
The subsequent call to kzalloc() would allocate a small buffer, leading
to a memory corruption.

Signed-off-by: Xi Wang <xi.wang@gmail.com>
---
 drivers/platform/x86/panasonic-laptop.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index 05be30e..ffff8b4 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -562,8 +562,8 @@ static int acpi_pcc_hotkey_add(struct acpi_device *device)
 
 	num_sifr = acpi_pcc_get_sqty(device);
 
-	if (num_sifr > 255) {
-		ACPI_DEBUG_PRINT((ACPI_DB_ERROR, "num_sifr too large"));
+	if (num_sifr < 0 || num_sifr > 255) {
+		ACPI_DEBUG_PRINT((ACPI_DB_ERROR, "num_sifr out of range"));
 		return -ENODEV;
 	}
 
-- 
1.7.5.4
