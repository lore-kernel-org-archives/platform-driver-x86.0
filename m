From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 2/2] sony-laptop: fix SNC buffer calls when SN06 returns Integers
Date: Sat, 10 Nov 2012 07:56:01 +0900
Message-ID: <1352501761-7299-3-git-send-email-malattia@linux.it>
References: <1352501761-7299-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:53240 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756076Ab2KIW4F (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 9 Nov 2012 17:56:05 -0500
In-Reply-To: <1352501761-7299-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>, stable@vger.kernel.org, Fabrizio Narni <shibotto@gmail.com>, mus.svz@gmail.com

SN06 in some cases returns an Integer instead of a buffer. While the
code handling the return value was trying to cope with the difference,
the memcpy call was not making any difference between the two types of
acpi_object union. This regression was introduced in 3.5.
While there also rework the return value logic to improve readability.

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=48671
Cc: <stable@vger.kernel.org>
Cc: Fabrizio Narni <shibotto@gmail.com>
Cc: <mus.svz@gmail.com>
Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |   20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index b0e1180..505b0a7 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -786,28 +786,34 @@ static int sony_nc_int_call(acpi_handle handle, char *name, int *value,
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
