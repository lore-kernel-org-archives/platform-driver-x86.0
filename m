Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.16.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541283;
	b=pZP38yOnCpZZB+24fSQTXia+KKVFZB1z0ukiCH0Ldwt+1hmG37M64hK5ohoJnUcKVvk8
	 acPjz4C37m6eCyDIZNkhNpSHGNAmTSDKgpohXft1WGVQRtW7ZeCdylNdJcxh74KhM0wIv
	 884WwiXJn43LCqPH0YTzHuetQllHvkA9yb/9itiGiQeNLcAFUzUvgyEdRwaoVLpiK2Oq7
	 axt65Mu9WiQj35Y7N5bZqkusB27xvdVao4qoU4b4+pg5z6uXCO9VbFoGgWuOeXAXosfpa
	 RXO3Z0pxz/IdWKvdEXmV22Z/LbwpOoXY9w3LdoCnA9mg4z0j0BzMQiETnPsFJTfPdDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541283;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=tZM1u14LTPc/UonuLehf8zS0uVlSz1+MtBNWVvOUSC0=;
	b=weYa6eh9mh2hZa+4C2xWiEr5njNLD6rOsG/oq7jR4DPKe7rtCB2GbkjeMvNzhByo1p+c
	 VRZkY8pyDrHj9xmFQmZE4nXJ6Wh+IKfuxySa4NxIoE8R+Yh6/5nmqbdJPSIkLyFo2dnGe
	 044NQ5lvi0+0TNoK26Isc3oN2n4PbF9Rf5UHOTbaO8EpqrhkBkhgJo8P9QNO6bnrsvdHd
	 Q0o1reoG4amg/gXoqI/KGJk9BKikZaG9c0/fS74l8OjJWaiZ+ff4n5HPaPxihObygyvdW
	 CNHe5VdO191CYkty62axjP6x/r5Of30bgF7YEEF1SJDVVzhv8kBJwGXBFYkZ7vCNXMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sustech.edu.cn;
	spf=pass smtp.mailfrom=mail.sustech.edu.cn;
	dkim=pass header.d=mail.sustech.edu.cn header.i=@mail.sustech.edu.cn header.a=rsa-sha256 header.s=oemc2211 header.b=STFfU4+2;
	arc=none smtp.remote-ip=54.206.16.166
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6D1606A323;
	Tue, 24 Nov 2026 17:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A6D1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sustech.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sustech.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sustech.edu.cn header.i=@mail.sustech.edu.cn header.a=rsa-sha256 header.s=oemc2211 header.b=STFfU4+2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mail.sustech.edu.cn;
	s=oemc2211; t=1795541223;
	bh=tZM1u14LTPc/UonuLehf8zS0uVlSz1+MtBNWVvOUSC0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=STFfU4+25YuTJ79NQm6yngfNIibS78rTrHf+m4+6BkHrwMTOfSjPG2AsnDeHsa0l6
	 nwMiOxzXh6V/u6p1KFKe875eehD2+RPRPIEa7fn2pDb2fpsuF2w28grl7eLu60yX1x
	 GNi9tDeHpkUE6EHG48tEgHeUV4vkCX8mCWtUNU1o=
X-QQ-mid: zesmtpgz9t1795541218t77e056d4
X-QQ-Originating-IP: AWkdI6DI2K+mTponPegtwFKaU1+86ZDZlRNoBIBFCbk=
Received: from sakura-NbF-XX.sustech.edu.cn ( [116.7.234.244])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 25 Nov 2026 01:26:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5848384891573786241
EX-QQ-RecipientCnt: 7
From: Fuwei Xie <12313607@mail.sustech.edu.cn>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Fuwei Xie <12313607@mail.sustech.edu.cn>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Eren=20=C3=96zen?= <erenozen@protonmail.com>,
	Zheng Shuyang <yhshzh0@gmail.com>
Subject: [RFC PATCH v3 1/5] platform/x86: huawei-wmi: scope method responses to each call
Date: Wed, 25 Nov 2026 01:25:28 +0800
Message-ID: <E3BDBB5E9304B11C+20261124172651.37716-2-12313607@mail.sustech.edu.cn>
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
X-QQ-XMAILINFO: MgYKvQLNvE4jtUwru2D+Ncuhyo1pwEsNKo+HKEBvpSdJTTt5pCMlU1Ff
	3eSUuYlhCnbqvPrZrn/8UUwYE6S+SuO3WU060M95wX55j0rUWrPKRP0J+vDpO1ix5yiX8Ef
	yJpns1myhQ5UpXg5cvEOKQcH3u7QvByMaXDdDmY+L4rJk3+JjeKpmnhUQajrCTQEhmI6+9k
	4ixG98TNa/BM4vFHXoPoUMo7vqFgzY8k4k0tMJzEV6F0a5c3gOIL5tm9RmVb5zdWYZisAL6
	CSUe96Adx8cgszwCpBoCNI3Y1q7kNFR1R9CmY78b2+wX4sM+nHkgRWLcyXXw5po4F0qrtuN
	L2KCOHslBSvxjELrU4wDtLxgb4iFrOnrsMx9Rg2lWsuk0cNAIc1PhWrX6XbzF2mrf+C/faD
	bCQwVlF86UIwyfDjfyaksn8I403yNVRiazXmkfTjKpVRJ799x3KKk637TGK3mg4E2d46o40
	zIxqJV7PR9vDRCNhoJ7+aNdnei/adMUk8VM63T8ZY907tBnr5Bh95U40q8TFS2Y5IIayT3R
	BR8pvwZxJe2rfiAVzvlU4TMgDrRdcxxT9/5if948iGJ6UjgQhV7opVV7CSkXmEykS1CwSla
	A034uBjHCj4gKY8Z8GWk4tLNOFcqodSrnYVsaRf7lGvGwg1msP0dM8056DxW+nZlTMB4+34
	bfUATj+12cg5vwg70Ey5vHHhNa5ciOzujGDRVrwRfe2HLQQF7imKFUc4EgazHiSD/FghUMh
	CqtRyNtPK2Ap+68cdhR1kmZaLqiClxpsO9S6bBTKNazyR0qywSLPL2+17trMVVr9GVfc5X9
	240r6qKyaWqBFbNHWt2bwAWlvnjFtyHt0yGoxNALqiUaWgwShwbzP73SyXhZJEcMYf4dWMI
	i3ysE3tMU8Wklp/6WqRN98WQg5he2w7TGymBBZ9Kr+kJXo5o2CsVIp05GNPhbDqYZ3Z32Yo
	EW338C0CGYb9FsBQ62xpKlP/ZDi7Xo0EjGgRfRXEhDNhB2cVm+nO6B5Q9sVYE8Jm+7uzylV
	i3kC79EO60zeXbbNxLqD9zYwZQgzLwUZOyFqUlmI9sEzyWhdVqkfs2bD0RQfnx3k4JZXqc+
	Q==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

Keep each ACPI allocation alive while decoding its response and release
it on every exit with __free(kfree). Give each handshake attempt a
fresh output descriptor so retrying cannot reuse the first allocation.

Signed-off-by: Fuwei Xie <12313607@mail.sustech.edu.cn>
---
 drivers/platform/x86/huawei-wmi.c | 59 ++++++++++++-------------------
 1 file changed, 23 insertions(+), 36 deletions(-)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index 96ee9a97c..559731d15 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -177,9 +177,7 @@ static int huawei_wmi_call(struct huawei_wmi *huawei,
 static int huawei_wmi_cmd(u64 arg, u8 *buf, size_t buflen)
 {
 	struct huawei_wmi *huawei = huawei_wmi;
-	struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
 	struct acpi_buffer in;
-	union acpi_object *obj;
 	size_t len;
 	int err, i;
 
@@ -190,15 +188,17 @@ static int huawei_wmi_cmd(u64 arg, u8 *buf, size_t buflen)
 	 * HWMI and if we get a non-zero return status we evaluate it again.
 	 */
 	for (i = 0; i < 2; i++) {
+		struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
+
 		err = huawei_wmi_call(huawei, &in, &out);
 		if (err)
-			goto fail_cmd;
+			return err;
 
-		obj = out.pointer;
-		if (!obj) {
-			err = -EIO;
-			goto fail_cmd;
-		}
+		union acpi_object *allocation __free(kfree) = out.pointer;
+		union acpi_object *obj = allocation;
+
+		if (!obj)
+			return -EIO;
 
 		switch (obj->type) {
 		/* Models that implement both "legacy" and HWMI tend to return a 0x104
@@ -211,8 +211,7 @@ static int huawei_wmi_cmd(u64 arg, u8 *buf, size_t buflen)
 				len = 0x100;
 			} else {
 				dev_err(huawei->dev, "Bad buffer length, got %d\n", obj->buffer.length);
-				err = -EIO;
-				goto fail_cmd;
+				return -EIO;
 			}
 
 			break;
@@ -222,15 +221,13 @@ static int huawei_wmi_cmd(u64 arg, u8 *buf, size_t buflen)
 		case ACPI_TYPE_PACKAGE:
 			if (obj->package.count != 2) {
 				dev_err(huawei->dev, "Bad package count, got %d\n", obj->package.count);
-				err = -EIO;
-				goto fail_cmd;
+				return -EIO;
 			}
 
 			obj = &obj->package.elements[1];
 			if (obj->type != ACPI_TYPE_BUFFER) {
 				dev_err(huawei->dev, "Bad package element type, got %d\n", obj->type);
-				err = -EIO;
-				goto fail_cmd;
+				return -EIO;
 			}
 			len = obj->buffer.length;
 
@@ -238,24 +235,19 @@ static int huawei_wmi_cmd(u64 arg, u8 *buf, size_t buflen)
 		/* Shouldn't get here! */
 		default:
 			dev_err(huawei->dev, "Unexpected obj type, got: %d\n", obj->type);
-			err = -EIO;
-			goto fail_cmd;
+			return -EIO;
 		}
 
-		if (!*obj->buffer.pointer)
-			break;
-	}
+		if (*obj->buffer.pointer && !i)
+			continue;
 
-	err = (*obj->buffer.pointer) ? -ENODEV : 0;
+		if (buf)
+			memcpy(buf, obj->buffer.pointer, min(buflen, len));
 
-	if (buf) {
-		len = min(buflen, len);
-		memcpy(buf, obj->buffer.pointer, len);
+		return *obj->buffer.pointer ? -ENODEV : 0;
 	}
 
-fail_cmd:
-	kfree(out.pointer);
-	return err;
+	return -ENODEV;
 }
 
 /* LEDs */
@@ -753,7 +745,6 @@ static int huawei_wmi_debugfs_call_show(struct seq_file *m, void *data)
 	struct huawei_wmi *huawei = m->private;
 	struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
 	struct acpi_buffer in;
-	union acpi_object *obj;
 	int err;
 
 	in.length = sizeof(u64);
@@ -763,17 +754,13 @@ static int huawei_wmi_debugfs_call_show(struct seq_file *m, void *data)
 	if (err)
 		return err;
 
-	obj = out.pointer;
-	if (!obj) {
-		err = -EIO;
-		goto fail_debugfs_call;
-	}
+	union acpi_object *obj __free(kfree) = out.pointer;
 
-	huawei_wmi_debugfs_call_dump(m, huawei, obj);
+	if (!obj)
+		return -EIO;
 
-fail_debugfs_call:
-	kfree(out.pointer);
-	return err;
+	huawei_wmi_debugfs_call_dump(m, huawei, obj);
+	return 0;
 }
 
 DEFINE_SHOW_ATTRIBUTE(huawei_wmi_debugfs_call);
-- 
2.55.0
