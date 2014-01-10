From: Colin King <colin.king@canonical.com>
Subject: [PATCH] sony-laptop: remove unnecessary assigment of len
Date: Fri, 10 Jan 2014 14:04:24 +0000
Message-ID: <1389362664-15612-1-git-send-email-colin.king@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:33926 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750910AbaAJOE2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 10 Jan 2014 09:04:28 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>, Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The assignment of len = len is unnecessary, so remove it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/platform/x86/sony-laptop.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index fb233ae..61fa755 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -791,7 +791,7 @@ static int sony_nc_buffer_call(acpi_handle handle, char *name, u64 *value,
 		void *buffer, size_t buflen)
 {
 	int ret = 0;
-	size_t len = len;
+	size_t len;
 	union acpi_object *object = __call_snc_method(handle, name, value);
 
 	if (!object)
-- 
1.7.9.5
