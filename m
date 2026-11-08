Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.243.244.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794111476;
	b=Lt6IB/b7NglhS2Hu7ps8Q9fXqZW0lCZlDhlQAXSiKlFiXmWAEpXuBKwcSr5USRUkDbjj
	 31R+xckoBCSDu5HdpxmutfHalR7RBuzxsWu59f7wRQ3sDl0h2Nt3k9bjUiCVG33sFcrE3
	 XdpoBiOeP/HG4w2dIzncLod9SicTIEOiz+JXhAQs2S9RvjOGha5T/C5IzdU4Ss1jAvBUz
	 kgFLw3Y9ZrxefWArI6JSNmbTla7ENic9hkQyklf8Bd1BEIJq2CXxZmALgkFDCH/FWhcQQ
	 TzBb7S82ZLK65CX12OxfM+k1Xq1isYBbWmwtMxV3K9d4zI8e8aB5t7vM3epIhX9AmLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794111476;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=6xWbqKaBi4TTvwCyrzn7Tti12+Y+wbqvWW8h2d5Rdks=;
	b=qIj82flAG1qqY5IrETuzSrhru/uFyJSSR9ynjS6xEKFhZ29GRIr0vFqMzatLU7pw3OmH
	 ATMN9N53YC4FPFqU62VzDUKK4aNaYL2QGRWpEBt/FHroCFkVFzEi5/TxHL7EQCMfAcZCv
	 wCCTAcrBLNqaS51wYRcMPvRBUfjsv6+2aQuIUomrSgUXV/CRH8Z61570FHlqHAi41wFgJ
	 qH0zleW6CeoEGZGdkbwwnm+8e50+r79Bd6LeDKjd7m7fS315MEJXQtH+hjcULSo1PWDVJ
	 srb6rbf1X2EpPt+PSgrpoRhZv1+XqZbZ//thxVhtrBIXZinqXXs/EUZD59rnwt7Sb1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sustech.edu.cn;
	spf=pass smtp.mailfrom=mail.sustech.edu.cn;
	dkim=pass header.d=mail.sustech.edu.cn header.i=@mail.sustech.edu.cn header.a=rsa-sha256 header.s=oemc2211 header.b=xdCOafoh;
	arc=none smtp.remote-ip=54.243.244.52
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EE3606A31A;
	Sun,  8 Nov 2026 04:17:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4EE3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sustech.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sustech.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sustech.edu.cn header.i=@mail.sustech.edu.cn header.a=rsa-sha256 header.s=oemc2211 header.b=xdCOafoh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mail.sustech.edu.cn;
	s=oemc2211; t=1794111446;
	bh=6xWbqKaBi4TTvwCyrzn7Tti12+Y+wbqvWW8h2d5Rdks=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=xdCOafohGPhbOkBlM0pt8MGsXnqgIUfzYM3VC1HrAZuhEquwal/6axuuG9OuBO53t
	 xaEtTWE6CmZ9WmW6yR50CUEJPGaBPat7LhUaceNKOFlyNVY614GY3EBGl6sF8986JN
	 P6nEEUtMoXuNiePtouhy7vlOTlGNNRWavEqB1IN4=
X-QQ-mid: zesmtpgz6t1794111441tff6a2164
X-QQ-Originating-IP: 6XGKFTW8J+wZK0MvdDW9+Hh+TUotJx2Z7VNHXjNFPT4=
Received: from sakura-NbF-XX.sustech.edu.cn ( [116.7.234.244])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 08 Nov 2026 12:17:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14812342779989873084
EX-QQ-RecipientCnt: 5
From: Fuwei Xie <12313607@mail.sustech.edu.cn>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fuwei Xie <12313607@mail.sustech.edu.cn>
Subject: [RFC PATCH 1/2] platform/x86: huawei-wmi: serialize WMI retries and validate responses
Date: Sun,  8 Nov 2026 12:17:12 +0800
Message-ID: <966F159F0693FC36+20261108041714.328986-2-12313607@mail.sustech.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108041714.328986-1-12313607@mail.sustech.edu.cn>
References: <20261108041714.328986-1-12313607@mail.sustech.edu.cn>
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
X-QQ-XMAILINFO: NsZBc+7DoEMQMbnrxp/Qrmd42FGlJasrTzUyLa8m77jZ8Lxpx0VR6it8
	plKZIHUvcK5zMqC2Ix61dYEvdXw3SG2aPb8n7PoGumGjDi36CNtwMnz44diCgFdxXkTmXMn
	2q84slomKdu1JNChmzsE9w2exjzPrbZlAin1oyK0biAszypxE4VyT7mvMeRu3SKYZCXiiyW
	j3up7EwuZTstmOawmVA9DqS7nD+OqS0A/F+bGPYBR/DKlixBlrvjpE2G9Bznd+uw6gTmPgb
	Um2msOMJGXrbXi6kYf+Qs3zJowDcFKZEKirhaD3CkTKr7h/t7eIUwrTxmVj4psP6du81N3f
	Z+r9HYJodRt0NkekrihU0o4/Q3bMZkm+FoEXitCgFcQk0th5ECRvhPsyVRCDrO/PfhYUOLZ
	0KJjKzGuEP2mcVRHWJZDn3EtfxBc/WKHljJZ2uGJ/BOVKGrPQWh2sopoMgJ2dF4WlEe60Qe
	BufExOdlyMfrTSDisboYJiwY2eHfc7J5pOOjJTiil3KfUnszXIJnke5aGqTHaLv2h5yufjA
	NlAhF7KcDYh5aDJCayCCLDkYz1HaIhnHV11J+vIYAsZmDBmrprVD5Ei8+LuD/WYvch9vIR/
	gAEPHJm8ZEgIHCaOwiRXYVDI8B/M7pDBFZYg0Z/mItLW4ExxJc0CwfgzOZU328S5vbEwPXk
	mYeO0Oi357KUgrz2Mor/1uavwxBWY6d8Ebo0p6nWOuaaI6bx81zhVYZlmLJWTyQUc71rbWx
	Euu5Ut0I13s0ZrLDx+PJXTyndzDeNLrJ0tstGmrGnDcVufpgM1z2jRJioSvLRuIZvWMWrpb
	qEBtvSU3yqrSIxcjxG+yDZeP4d/tTZfSIulP7zx9zllP9Tfno4I26Y28+5RT9WPLWsBPYeD
	rQddMVb96vGnD75RBtRpypQnO62kZnNLNllu6/XzrRRr8+m2YsP9QmsG2UuseEFny62hizl
	Sva/RZHutwH2NL2BWTSk+s6WBdxu1kVtDCLgu/QGDvyXe9uzpVE4f0c4O4E8r4k3Nx28l76
	DfkexOsTDQxHciexeiueSu3QwuKLrkxGJTfL2w4s83yHahGPw5bP0OzM34HBQHQqa69F6hP
	Xd26Kg0UmTBui0fcU57/ysBGeXhheu5P3HjQHm/keEiTn1f3+0iQ6ZJeH74d4OsK/PLd83N
	+Xzx
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

The two-call firmware handshake can be re-entered and each retry leaked the
previous response. Hold the transaction under the driver mutex, free the
response before retrying, validate the returned payload shape, and reject
short responses instead of letting callers read incomplete data.

The borrowed payload points into the ACPI allocation and is not modified.

Signed-off-by: Fuwei Xie <12313607@mail.sustech.edu.cn>
---
 drivers/platform/x86/huawei-wmi.c | 119 +++++++++++++++---------------
 1 file changed, 60 insertions(+), 59 deletions(-)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index 96ee9a97c..504ee2737 100644
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
@@ -166,6 +164,45 @@ static int huawei_wmi_call(struct huawei_wmi *huawei,
 	return 0;
 }
 
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
 /* HWMI takes a 64 bit input and returns either a package with 2 buffers, one of
  * 4 bytes and the other of 256 bytes, or one buffer of size 0x104 (260) bytes.
  * The first 4 bytes are ignored, we ignore the first 4 bytes buffer if we got a
@@ -179,82 +216,46 @@ static int huawei_wmi_cmd(u64 arg, u8 *buf, size_t buflen)
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
+				if (len < buflen) {
+					err = -ENODATA;
+					goto fail_cmd;
+				}
+				memcpy(buf, data, buflen);
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
 
-- 
2.53.0

