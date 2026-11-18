Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795038504;
	b=ePecpZ/eqY0bjS8FRWx3Nq+6FeycYpPohaFPM29/3N5qvi2RcwqJhVVjBGdFBwBdSn1Q
	 qmYdNbOrq79zr8LKV0y0WFiH4RGjx7u/En6G7H7RZJBFZOt+Iwd1yzbriDhVSL67G2DBn
	 TVYsrNYM0wVK7Lx0/oKD4VTB+V021W2YpBkK07lypuJhUxor5YDaWKs4zZ0pR+Hlq6Rci
	 doiG1Vt2MCaY0dluHRYxXw5HlaeRQ6uZnjVRzmcBcMfji4cRIADqQb2IJIQ6k8xkuCYaL
	 7lUkBnqCie5ASUqeX4TE+OU3lHVBIAGLKC9poy1vlhSnXOM4snb/d5DpjIrNENh+1vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795038504;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=St5MdENNCFcWUVKuAFqEirQyEEEyxwKVjqFS3xJm34M=;
	b=vJc+Hbdu3i+4oZHOWckDLKYn9mwCN+ozEAApMULcedoraM+9guaBkHA0kJYZ7Lm6BNJd
	 k73gbgjTWFqEzBo5iT5b1kL5+aenp4ruvAuApz3KFeC5OZ1hy2kDzUvxEqoiPZyrXqEPB
	 xh1+9ghd8ES5hDXB8wK7eQG7WIx9cbcpGxrUTgHm0bjQkiwMWpsigBmrs4CqWio/TNjlc
	 4dH5TXcGzOGq+rnVNDOLNDh7hcsmM1C6YSb5a/F05Tks2QEuf8fb7MVmXkA2/DyjC3YGc
	 J7y86T6veumdg96HYyGM7nM4FNtzx8BFcCgIVk5AKeqczR6Shpvd7vUydXdoD4a7SXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sustech.edu.cn;
	spf=pass smtp.mailfrom=mail.sustech.edu.cn;
	arc=none smtp.remote-ip=54.204.34.130
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D251B606A331;
	Wed, 18 Nov 2026 21:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D251B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sustech.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sustech.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mail.sustech.edu.cn;
	s=oemc2211; t=1795038456;
	bh=St5MdENNCFcWUVKuAFqEirQyEEEyxwKVjqFS3xJm34M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=3DRVLVyL6p6xvbb68t1uEBuEfBmvCnMUCIKG70lK6tWQBEgFrtmxE6B/fYUbJdTP0
	 8RQf3lpb75ZXepHt1/ir+BgrH6eurvfNoV4toG7gFIciFidXv8MynRD56bqPnqGoH+
	 jFOWjutUKPyUdKeIlql/0ihWbCL5es+8XJ0j/iXA=
X-QQ-mid: zesmtpsz2t1795038451t33687f4c
X-QQ-Originating-IP: Hyb9dL6ithX70TD5b7D7s7YwJ047D/JddMm+YCUDYJw=
Received: from sakura-NbF-XX.sustech.edu.cn ( [116.7.234.242])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 19 Nov 2026 05:47:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15444619097910276890
EX-QQ-RecipientCnt: 6
From: Fuwei Xie <12313607@mail.sustech.edu.cn>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	erenozen@protonmail.com,
	Fuwei Xie <12313607@mail.sustech.edu.cn>
Subject: [RFC PATCH v2 1/2] platform/x86: huawei-wmi: serialize WMI retries and validate responses
Date: Thu, 19 Nov 2026 00:13:10 +0800
Message-ID: <B27C5CB9EBA10EE0+20261118161311.17252-2-12313607@mail.sustech.edu.cn>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261118161311.17252-1-12313607@mail.sustech.edu.cn>
References: <20261118161311.17252-1-12313607@mail.sustech.edu.cn>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:mail.sustech.edu.cn:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M5znx2hx04lbDGFU9UC5So7KS3HiQxXsDQsHvkAGo31RLNXW6DtQ4L6X
	7HP4VAJuQhnn8Uz7v0lWr23uShPXKygQrKD0hXsHXqSKujvWXP+T03vU+x/Wk9FmDoRbAUa
	FmLylVWEqLzpZikurmXdQj0XfvQAc2VFNgdyjdEzvM5+irFKJePghrIga9lAPPqrPYzDYxy
	hlSvEnmYHYLO9+szsWVEUAEuISEs9VjfAqHBSzqlY/ksdwgcLvoIlWqmQKI7wtJzOAzfGO4
	RnY4N3YhwK8ZuIn7YwHcYlD7PDvHexdR3Sw0J4YmjOTjt8KxN+Jj9LQsEBR9tXWBjYq1Y6D
	AofBntmXWiiFZJs+o+DYf86U5Qtb1agfmuNria7VlNpzvLwgAx24sQctVnyyulOQIEQ8vlr
	HoU+M1dYGtSbFhV9m2/cflaDaT2OGCzDUAWt42YsNqRdf2Tg8nP4hdy6tplxNUut91vwrpo
	5+uHWkLZFWgeb72hUuRU3FcOifXpZu+Czy9TizWHMJOoIOveDvJ71w7BJ3I+oqR6lR1Iqdm
	kElHoe0EDfLJoss1mPGOfIYoatwysD6tABxm9C3caGxRiYzNX9SUd3nViNJTU8W63pOj60Y
	lnOP/3kO6/ocjHUrBta5ao6shtJzrmxnCM5nm5Fs/zJkC40uJU+LZhhmq3fIHDKSuDVGbwh
	Mi4V922FdWKQyU2FbOzKitXIgcZoVXivjijPoSwm3Se5ROJ5DCWNDch62wb/3/thWtDRxCd
	Sh4kjNvohiQ3EKpT7Ifw0rWxQLmWTsElFWpHlwM6o7+QBzv2VUkc/ju1zBEO1BrEcQ/Xf5j
	vLM5KzwgnQWfHmwaZDSzwBH/sJ8ZuOyP89H0l0fNnM6Y9LwvysV5qcP8edW6pAqTUqsxCYy
	c1Yjj8Z0xVbV1aWUbCo3xQf3sYsie9pumx17SCCs/XwytYTPSfU0QJUnTHRnYvcrulh2ewN
	5jeVhi1iDemdKrKXaqEKojvUU9Q7xYi4jmTf8sBeZjU2pGH1IFjyG+J7q7s9x6b7NxyLlxL
	bERL1ZxBWS/Cvt3ha11vfopDUQlbFcgMHzTc+6ag==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

Serialize the two-call firmware handshake and release the first
ACPI allocation before retrying. Check the response shape before
reading the firmware status.

Accept short package payloads for Fn lock and battery thresholds
when they contain the required fields. Zero-fill the rest of the
destination so the legacy parsers can scan their buffers safely.

Signed-off-by: Fuwei Xie <12313607@mail.sustech.edu.cn>
---
 drivers/platform/x86/huawei-wmi.c | 144 ++++++++++++++++--------------
 1 file changed, 75 insertions(+), 69 deletions(-)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index 96ee9a97c..9894424e7 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -150,14 +150,12 @@ static const struct dmi_system_id huawei_quirks[] = {
 
 /* Utils */
 
-static int huawei_wmi_call(struct huawei_wmi *huawei,
-			   struct acpi_buffer *in, struct acpi_buffer *out)
+static int __huawei_wmi_call(struct huawei_wmi *huawei,
+			     struct acpi_buffer *in, struct acpi_buffer *out)
 {
 	acpi_status status;
 
-	mutex_lock(&huawei->wmi_lock);
 	status = wmi_evaluate_method(HWMI_METHOD_GUID, 0, 1, in, out);
-	mutex_unlock(&huawei->wmi_lock);
 	if (ACPI_FAILURE(status)) {
 		dev_err(huawei->dev, "Failed to evaluate wmi method\n");
 		return -ENODEV;
@@ -166,98 +164,106 @@ static int huawei_wmi_call(struct huawei_wmi *huawei,
 	return 0;
 }
 
-/* HWMI takes a 64 bit input and returns either a package with 2 buffers, one of
- * 4 bytes and the other of 256 bytes, or one buffer of size 0x104 (260) bytes.
- * The first 4 bytes are ignored, we ignore the first 4 bytes buffer if we got a
- * package, or skip the first 4 if a buffer of 0x104 is used. The first byte of
- * the remaining 0x100 sized buffer has the return status of every call. In case
- * the return status is non-zero, we return -ENODEV but still copy the returned
- * buffer to the given buffer parameter (buf).
+static int huawei_wmi_call(struct huawei_wmi *huawei,
+			   struct acpi_buffer *in, struct acpi_buffer *out)
+{
+	int ret;
+
+	mutex_lock(&huawei->wmi_lock);
+	ret = __huawei_wmi_call(huawei, in, out);
+	mutex_unlock(&huawei->wmi_lock);
+	return ret;
+}
+
+/* Return a borrowed payload without modifying the ACPI allocation. */
+static int huawei_wmi_response(const union acpi_object *obj,
+			       const u8 **data, size_t *len)
+{
+	if (!obj)
+		return -EIO;
+
+	if (obj->type == ACPI_TYPE_BUFFER) {
+		if (obj->buffer.length != 0x104 || !obj->buffer.pointer)
+			return -EIO;
+		*data = obj->buffer.pointer + 4;
+		*len = 0x100;
+	} else if (obj->type == ACPI_TYPE_PACKAGE) {
+		if (obj->package.count != 2 || !obj->package.elements)
+			return -EIO;
+		obj = &obj->package.elements[1];
+		if (obj->type != ACPI_TYPE_BUFFER || !obj->buffer.length ||
+		    !obj->buffer.pointer)
+			return -EIO;
+		*data = obj->buffer.pointer;
+		*len = obj->buffer.length;
+	} else {
+		return -EIO;
+	}
+
+	return 0;
+}
+
+/*
+ * The payload starts with the firmware status byte. Legacy variable-length
+ * replies may omit trailing zeroes. Require the fields used by the caller
+ * and zero-fill any unused part of its destination.
  */
-static int huawei_wmi_cmd(u64 arg, u8 *buf, size_t buflen)
+static int huawei_wmi_cmd_min(u64 arg, u8 *buf, size_t buflen, size_t minlen)
 {
 	struct huawei_wmi *huawei = huawei_wmi;
 	struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
 	struct acpi_buffer in;
-	union acpi_object *obj;
+	const u8 *data;
 	size_t len;
 	int err, i;
 
 	in.length = sizeof(arg);
 	in.pointer = &arg;
+	/* Keep both halves of the firmware handshake in one transaction. */
+	mutex_lock(&huawei->wmi_lock);
 
 	/* Some models require calling HWMI twice to execute a command. We evaluate
 	 * HWMI and if we get a non-zero return status we evaluate it again.
 	 */
 	for (i = 0; i < 2; i++) {
-		err = huawei_wmi_call(huawei, &in, &out);
+		out.length = ACPI_ALLOCATE_BUFFER;
+		out.pointer = NULL;
+		err = __huawei_wmi_call(huawei, &in, &out);
 		if (err)
 			goto fail_cmd;
 
-		obj = out.pointer;
-		if (!obj) {
-			err = -EIO;
+		err = huawei_wmi_response(out.pointer, &data, &len);
+		if (err)
 			goto fail_cmd;
-		}
-
-		switch (obj->type) {
-		/* Models that implement both "legacy" and HWMI tend to return a 0x104
-		 * sized buffer instead of a package of 0x4 and 0x100 buffers.
-		 */
-		case ACPI_TYPE_BUFFER:
-			if (obj->buffer.length == 0x104) {
-				// Skip the first 4 bytes.
-				obj->buffer.pointer += 4;
-				len = 0x100;
-			} else {
-				dev_err(huawei->dev, "Bad buffer length, got %d\n", obj->buffer.length);
-				err = -EIO;
-				goto fail_cmd;
-			}
-
-			break;
-		/* HWMI returns a package with 2 buffer elements, one of 4 bytes and the
-		 * other is 256 bytes.
-		 */
-		case ACPI_TYPE_PACKAGE:
-			if (obj->package.count != 2) {
-				dev_err(huawei->dev, "Bad package count, got %d\n", obj->package.count);
-				err = -EIO;
-				goto fail_cmd;
-			}
-
-			obj = &obj->package.elements[1];
-			if (obj->type != ACPI_TYPE_BUFFER) {
-				dev_err(huawei->dev, "Bad package element type, got %d\n", obj->type);
-				err = -EIO;
-				goto fail_cmd;
+		if (!data[0] || i == 1) {
+			err = data[0] ? -ENODEV : 0;
+			if (buf) {
+				if (len < minlen) {
+					if (!err)
+						err = -ENODATA;
+					goto fail_cmd;
+				}
+				len = min(len, buflen);
+				memcpy(buf, data, len);
+				memset(buf + len, 0, buflen - len);
 			}
-			len = obj->buffer.length;
-
-			break;
-		/* Shouldn't get here! */
-		default:
-			dev_err(huawei->dev, "Unexpected obj type, got: %d\n", obj->type);
-			err = -EIO;
 			goto fail_cmd;
 		}
-
-		if (!*obj->buffer.pointer)
-			break;
-	}
-
-	err = (*obj->buffer.pointer) ? -ENODEV : 0;
-
-	if (buf) {
-		len = min(buflen, len);
-		memcpy(buf, obj->buffer.pointer, len);
+		kfree(out.pointer);
+		out.pointer = NULL;
 	}
 
 fail_cmd:
 	kfree(out.pointer);
+	mutex_unlock(&huawei->wmi_lock);
 	return err;
 }
 
+static int huawei_wmi_cmd(u64 arg, u8 *buf, size_t buflen)
+{
+	return huawei_wmi_cmd_min(arg, buf, buflen, buflen);
+}
+
 /* LEDs */
 
 static int huawei_wmi_micmute_led_set(struct led_classdev *led_cdev,
@@ -329,7 +335,7 @@ static int huawei_wmi_battery_get(int *start, int *end)
 	u8 ret[0x100];
 	int err, i;
 
-	err = huawei_wmi_cmd(BATTERY_THRESH_GET, ret, sizeof(ret));
+	err = huawei_wmi_cmd_min(BATTERY_THRESH_GET, ret, sizeof(ret), 3);
 	if (err)
 		return err;
 
@@ -627,7 +633,7 @@ static int huawei_wmi_fn_lock_get(int *on)
 		return huawei_acpi_fn_lock_get(on);
 
 	/* WMI fallback */
-	err = huawei_wmi_cmd(FN_LOCK_GET, ret, 0x100);
+	err = huawei_wmi_cmd_min(FN_LOCK_GET, ret, sizeof(ret), 2);
 	if (err)
 		return err;
 
-- 
2.55.0

