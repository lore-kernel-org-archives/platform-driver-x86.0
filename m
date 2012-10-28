From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH] sony-laptop: fix SNC buffer calls when SN06 returns Integers
Date: Sun, 28 Oct 2012 09:05:50 +0900
Message-ID: <1351382750-712-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:33468 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752528Ab2J1AGE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 27 Oct 2012 20:06:04 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>, Fabrizio Narni <shibotto@gmail.com>, mus.svz@gmail.com

SN06 in some cases returns an Integer instead of a buffer. While the
code handling the return value was trying to cope with the difference,
the memcpy call was not making any difference between the two types of
acpi_object union.
While there also rework the return value logic to improve readability.

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=48671
Cc: Fabrizio Narni <shibotto@gmail.com>
Cc: <mus.svz@gmail.com>
Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |   20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 42125df..a58e0dd 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -904,28 +904,34 @@ static int sony_nc_int_call(acpi_handle handle, char *name, int *value,
 static int sony_nc_buffer_call(acpi_handle handle, char *name, u64 *value,
 		void *buffer, size_t buflen)
 {
+	int ret = 0;
 	size_t len = len;
 	union acpi_object *object = __call_snc_method(handle, name, value);
 
 	if (!object)
 		return -EINVAL;
 
-	if (object->type == ACPI_TYPE_BUFFER)
+	if (object->type == ACPI_TYPE_BUFFER) {
 		len = MIN(buflen, object->buffer.length);
+		memcpy(buffer, object->buffer.pointer, len);
 
-	else if (object->type == ACPI_TYPE_INTEGER)
+	} else if (object->type == ACPI_TYPE_INTEGER) {
 		len = MIN(buflen, sizeof(object->integer.value));
+		dprintk("%s call returned an Integer (0x%.8x%.8x len:%zu)\n",
+				name,
+				(unsigned int)(object->integer.value >> 32),
+				(unsigned int)object->integer.value & 0xffffffff,
+				len);
+		memcpy(buffer, &object->integer.value, len);
 
-	else {
+	} else {
 		pr_warn("Invalid acpi_object: expected 0x%x got 0x%x\n",
 				ACPI_TYPE_BUFFER, object->type);
-		kfree(object);
-		return -EINVAL;
+		ret = -EINVAL;
 	}
 
-	memcpy(buffer, object->buffer.pointer, len);
 	kfree(object);
-	return 0;
+	return ret;
 }
 
 struct sony_nc_handles {
-- 
1.7.10.4
