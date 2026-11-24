Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.34.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541283;
	b=bWxcXbvzrWzU9zPZ4u2/KNGM8UGG4fFNVExPL7lQIVhIhQQBVgz32pTjhx4GH73Z309O
	 RP1ksNdNfgZtK5Z63bBk9GNCmeX+Vd06vT25ydfGatF1HcCs9wn66hbhekkK15UDyBq4Q
	 xLx2rSPrdmc/2ltWlD8XkocsvJlQCnZJP4zYS/Vu4a0+pNcxyySzFNwpnk/duiFFr5GMu
	 qwOZmQ0P0xyB4ITOTdqoll+a+k3X1+vMuaTG8BHiARYV++fJY8Drg35NiOAz4rFYNbJyu
	 SQ0zQ4AX4n8u3pGfpXREpkvaSk1iaxHDsoQj9iD5fK2U8eHOKI7avUfOGBxLa7buElg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541283;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=XDPue297Z7phT3YK13k7pD563oe2avvfX9y7NzMqnKY=;
	b=TTEEsUm6LjB7DQj8ah1Ew/UgPL1FP7KIL4AgBIAYdESgHCRqSvHVK5T8eixofOoPItNe
	 ATcJpB8XVXsDJ3rXjmYs0ThXXTeTqpIayLFjrLjpHpwmROy8K/lLGF+18sKrIpI2br7cf
	 4rRw/thbHAT5nlVVVXiBYbDyMJvb5jm749mQNX2Q1Ya1HLQZxfsrzrvzgul32qRUcT6LV
	 iCHg2ODw8JyVSdF6nUme28N82lzQzEVSj2ElI3rSqEsfVsKp4hEl1e1r7ZA7OahvyFls8
	 kVr8ulKKi+TUKDUxOILumwK2Q6Cm0osC+duEaYwCeBWTHktgweI/nmWKHWUBwgPiQtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sustech.edu.cn;
	spf=pass smtp.mailfrom=mail.sustech.edu.cn;
	dkim=pass header.d=mail.sustech.edu.cn header.i=@mail.sustech.edu.cn header.a=rsa-sha256 header.s=oemc2211 header.b="HCnqcdx/";
	arc=none smtp.remote-ip=54.206.34.216
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F871606A321;
	Tue, 24 Nov 2026 17:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F871606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sustech.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sustech.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sustech.edu.cn header.i=@mail.sustech.edu.cn header.a=rsa-sha256 header.s=oemc2211 header.b=HCnqcdx/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mail.sustech.edu.cn;
	s=oemc2211; t=1795541227;
	bh=XDPue297Z7phT3YK13k7pD563oe2avvfX9y7NzMqnKY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=HCnqcdx/SMI4g4WGbTzAJBcg+fAm6ZxGPjOT1OoggfwNR9XU3SpiDn0HyokHBbIfE
	 tx5+BvVfCv/bZSQwHdz+4dYpq67mc86a1qjtAxqxPZcOfTPLBw1Ytz8Yw1Pd616WON
	 uAf80YzPgMUO2qt7tor4COFFnxcZuBuqeD54+9JY=
X-QQ-mid: zesmtpgz9t1795541222tc493f853
X-QQ-Originating-IP: qs0zQbqD06Mj85/MKw5YEEG1PmYKiZr3ZVyKcLknd5M=
Received: from sakura-NbF-XX.sustech.edu.cn ( [116.7.234.244])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 25 Nov 2026 01:27:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12639114203277216364
EX-QQ-RecipientCnt: 7
From: Fuwei Xie <12313607@mail.sustech.edu.cn>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Fuwei Xie <12313607@mail.sustech.edu.cn>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Eren=20=C3=96zen?= <erenozen@protonmail.com>,
	Zheng Shuyang <yhshzh0@gmail.com>
Subject: [RFC PATCH v3 3/5] platform/x86: huawei-wmi: use the sized WMI method interface
Date: Wed, 25 Nov 2026 01:25:30 +0800
Message-ID: <4A5D129D738884E9+20261124172651.37716-4-12313607@mail.sustech.edu.cn>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124172651.37716-1-12313607@mail.sustech.edu.cn>
References: <20261124172651.37716-1-12313607@mail.sustech.edu.cn>
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
Feedback-ID: zesmtpgz:mail.sustech.edu.cn:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NUn4eCFdhkFQqDqbSyfPqIZjft4aPfKQsd89318NaEuYIMfgMIjADvEY
	4e4wjoB1ksX2exgHXOnh2i6ZkLq1f+piw5A6Zd+8oCXXlBewEl5XW22o/eaTrge/OOZXlMD
	lAi0w1sJa8bZ6ILlnNDa/OZy58tjnYL5OftCF7h31nw8iH2TzrlKTTyYwZzPpQw3UPBbDPb
	1kvcsTwzuqMFRA0YioF3rLq/YikmEDaYgHwmaqe2aYWSeRGjlmFrCs+xI0TRmY/ScJVl/la
	eacgd17HG254GLc5j/uSZQ3KXfkXY7DZos1MID+dFmtYiyb516YQCPoW/TSpP0bfUrEYIE0
	66fCNUIggbNo/yV7bW2cXobOpgB8iG8eubmm1HO9CqoV8a55zvKT0RboDRpQMSbpgz/SRtr
	MmXm7C6sQA0xPAx9RLIqkRbB1SAuxqGRdfXWxX062QXeeyAulSz2PmJJHimmBWSyu4daeM5
	t17Ns0SiiOjSFdglkDrFD1bomHtRJvEv9+NTb79IEACYwEbhHTu730qBiHzdDmTa2awxkRo
	Uqph3aEI6+mV6nUnsIGvK4iC4eD6V5JAVCzqlNA26vnTzCWD1fzPjC7hWtlEANIPHbIEeCr
	Nr/76yaElv8dfgT41f1Goe0r1HBGXhyZYDTDcfZxHOD01/ENaB5V/NKqOv5vx94G8558gOM
	WonGfJ7dJF0vCIwU+8w1ar7clCn4Z0WdFm4e7HqBFFfZob5MQv2KsMinBf9E6JHe3JK790M
	riRIUVJAd+Q/3Y1nJyhPbXBlvA5DwdWRb2lg+9SbMNp5GJEfp5IZd0mhQIOsVu4Oo+vJBpm
	JKkigmEPbnQTVbtT0AEElFVMEBtHA36GNNyLYg/a1O7sELo69LyYRvtdPfBon7K+iiRg+QE
	k+w6AhEFJgWM2qO2jAZnU/5WMq3CmXbcxJjMrHOGotBYaHyN48G6l9aurvo0c9UWArWFfWu
	4Q34CupU/zA0VIGIrmqvI/bm39hGpwHMBvE9bp11cXv17nuzRPT7FlZKqijZs10UhXIU/3I
	/vk5UFphlfvBkD677atRz1cPEVl41c8gkSiPsar1w8st2j7w2WIwfdzOL1cBd28w53IvFEm
	EFwlb1lRq2X
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

Let the WMI core unpack method replies and require enough bytes for
the common header. Hold the mutex across both attempts. A retry status
may arrive without any command data, so validate each successful query
against the fields its caller needs. Scan only bytes actually returned.

Keep the raw debugfs dump on the device-based ACPI interface so it can
display the original object types.

Signed-off-by: Fuwei Xie <12313607@mail.sustech.edu.cn>
---
 drivers/platform/x86/huawei-wmi.c | 170 +++++++++++-------------------
 1 file changed, 59 insertions(+), 111 deletions(-)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index 690bd0abc..209066260 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -151,101 +151,42 @@ static const struct dmi_system_id huawei_quirks[] = {
 
 /* Utils */
 
-static int huawei_wmi_call(struct huawei_wmi *huawei,
-			   struct acpi_buffer *in, struct acpi_buffer *out)
-{
-	acpi_status status;
-
-	mutex_lock(&huawei->wmi_lock);
-	status = wmidev_evaluate_method(huawei->wdev, 0, 1, in, out);
-	mutex_unlock(&huawei->wmi_lock);
-	if (ACPI_FAILURE(status)) {
-		dev_err(huawei->dev, "Failed to evaluate wmi method\n");
-		return -ENODEV;
-	}
-
-	return 0;
-}
+/* Both HWMI reply formats start with four reserved bytes and a status. */
+struct hwmi_reply {
+	u8 reserved[4];
+	u8 status;
+	u8 data[];
+};
 
-/* HWMI takes a 64 bit input and returns either a package with 2 buffers, one of
- * 4 bytes and the other of 256 bytes, or one buffer of size 0x104 (260) bytes.
- * The first 4 bytes are ignored, we ignore the first 4 bytes buffer if we got a
- * package, or skip the first 4 if a buffer of 0x104 is used. The first byte of
- * the remaining 0x100 sized buffer has the return status of every call. In case
- * the return status is non-zero, we return -ENODEV but still copy the returned
- * buffer to the given buffer parameter (buf).
- */
+/* Return the number of command data bytes copied, or a negative errno. */
 static int huawei_wmi_cmd(u64 arg, u8 *buf, size_t buflen)
 {
 	struct huawei_wmi *huawei = huawei_wmi;
-	struct acpi_buffer in;
-	size_t len;
-	int err, i;
-
-	in.length = sizeof(arg);
-	in.pointer = &arg;
+	struct wmi_buffer in = { .length = sizeof(arg), .data = &arg };
+	int i;
 
-	/* Some models require calling HWMI twice to execute a command. We evaluate
-	 * HWMI and if we get a non-zero return status we evaluate it again.
-	 */
+	guard(mutex)(&huawei->wmi_lock);
 	for (i = 0; i < 2; i++) {
-		struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
+		struct wmi_buffer out;
+		size_t len;
+		int err;
 
-		err = huawei_wmi_call(huawei, &in, &out);
+		err = wmidev_invoke_method(huawei->wdev, 0, 1, &in, &out,
+					   sizeof(struct hwmi_reply));
 		if (err)
 			return err;
 
-		union acpi_object *allocation __free(kfree) = out.pointer;
-		union acpi_object *obj = allocation;
-
-		if (!obj)
-			return -EIO;
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
-				return -EIO;
-			}
-
-			break;
-		/* HWMI returns a package with 2 buffer elements, one of 4 bytes and the
-		 * other is 256 bytes.
-		 */
-		case ACPI_TYPE_PACKAGE:
-			if (obj->package.count != 2) {
-				dev_err(huawei->dev, "Bad package count, got %d\n", obj->package.count);
-				return -EIO;
-			}
-
-			obj = &obj->package.elements[1];
-			if (obj->type != ACPI_TYPE_BUFFER) {
-				dev_err(huawei->dev, "Bad package element type, got %d\n", obj->type);
-				return -EIO;
-			}
-			len = obj->buffer.length;
-
-			break;
-		/* Shouldn't get here! */
-		default:
-			dev_err(huawei->dev, "Unexpected obj type, got: %d\n", obj->type);
-			return -EIO;
-		}
+		struct hwmi_reply *reply __free(kfree) = out.data;
 
-		if (*obj->buffer.pointer && !i)
+		/* Some machines require a second call after a nonzero status. */
+		if (reply->status)
 			continue;
 
-		if (buf)
-			memcpy(buf, obj->buffer.pointer, min(buflen, len));
+		len = min(buflen, out.length - sizeof(*reply));
+		if (len)
+			memcpy(buf, reply->data, len);
 
-		return *obj->buffer.pointer ? -ENODEV : 0;
+		return len;
 	}
 
 	return -ENODEV;
@@ -319,21 +260,22 @@ static void huawei_wmi_leds_setup(struct device *dev)
 
 static int huawei_wmi_battery_get(int *start, int *end)
 {
-	u8 ret[0x100];
-	int err, i;
+	u8 data[0xff];
+	int len;
 
-	err = huawei_wmi_cmd(BATTERY_THRESH_GET, ret, sizeof(ret));
-	if (err)
-		return err;
+	len = huawei_wmi_cmd(BATTERY_THRESH_GET, data, sizeof(data));
+	if (len < 0)
+		return len;
+	if (len < 2)
+		return -ENODATA;
 
-	/* Find the last two non-zero values. Return status is ignored. */
-	i = ARRAY_SIZE(ret) - 1;
-	do {
-		if (start)
-			*start = ret[i-1];
-		if (end)
-			*end = ret[i];
-	} while (i > 2 && !ret[i--]);
+	/* The threshold pair can be followed by zero padding. */
+	while (len > 2 && !data[len - 1])
+		len--;
+	if (start)
+		*start = data[len - 2];
+	if (end)
+		*end = data[len - 1];
 
 	return 0;
 }
@@ -612,24 +554,24 @@ static int huawei_acpi_fn_lock_set(int on)
 
 static int huawei_wmi_fn_lock_get(int *on)
 {
-	u8 ret[0x100] = { 0 };
-	int err, i;
+	u8 data[0xff];
+	int len;
 
-	/* Newer models: use direct ACPI \GFRS method */
 	if (acpi_has_method(NULL, "\\GFRS"))
 		return huawei_acpi_fn_lock_get(on);
 
-	/* WMI fallback */
-	err = huawei_wmi_cmd(FN_LOCK_GET, ret, 0x100);
-	if (err)
-		return err;
+	len = huawei_wmi_cmd(FN_LOCK_GET, data, sizeof(data));
+	if (len < 0)
+		return len;
+	if (!len)
+		return -ENODATA;
 
-	/* Find the first non-zero value. Return status is ignored. */
-	i = 1;
-	do {
-		if (on)
-			*on = ret[i] - 1; // -1 undefined, 0 off, 1 on.
-	} while (i < 0xff && !ret[i++]);
+	if (on) {
+		const u8 *state = memchr_inv(data, 0, len);
+
+		/* -1 undefined, 0 off, 1 on. */
+		*on = state ? *state - 1 : -1;
+	}
 
 	return 0;
 }
@@ -741,19 +683,25 @@ static void huawei_wmi_debugfs_call_dump(struct seq_file *m, void *data,
 	}
 }
 
+/* The raw debugfs dump also prints the original ACPI object types. */
+static acpi_status huawei_wmi_debugfs_call(struct huawei_wmi *huawei,
+					   struct acpi_buffer *in, struct acpi_buffer *out)
+{
+	guard(mutex)(&huawei->wmi_lock);
+	return wmidev_evaluate_method(huawei->wdev, 0, 1, in, out);
+}
+
 static int huawei_wmi_debugfs_call_show(struct seq_file *m, void *data)
 {
 	struct huawei_wmi *huawei = m->private;
 	struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
 	struct acpi_buffer in;
-	int err;
 
 	in.length = sizeof(u64);
 	in.pointer = &huawei->debug.arg;
 
-	err = huawei_wmi_call(huawei, &in, &out);
-	if (err)
-		return err;
+	if (ACPI_FAILURE(huawei_wmi_debugfs_call(huawei, &in, &out)))
+		return -ENODEV;
 
 	union acpi_object *obj __free(kfree) = out.pointer;
 
-- 
2.55.0
