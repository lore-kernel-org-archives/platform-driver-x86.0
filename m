Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706131;
	b=Wh1N8e9bf32rZ8alaB6SUVVK4QeuSPJV7UNjxx+B+WOXYitiRHkeNLmlnIG5qitEEzq5
	 8CDnA45Q+vNaJoq22IUqWccDKGAs63kVZUrqoIFU90IlgFR9y07RCsoUG21dg+FZhdhrP
	 XuQq1TfQXTyGC64YigzJXiwL8g3/Jo7BrGhfn3xF47NVvGtTvlmWcoK7F6d8uvAN4N78k
	 gJvLrAmUNLD42b8p/PPCLsqSVixUPi+VjJJda5sEH/g+Vwu9eRpE6zCU9+CYh2n7M0ZIs
	 LSELFgubUrW0DKHTwypa0yCZoAltXKY/HvyI7hcBrxNUv1H86KdmLqX4mEml9CX8R4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706131;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-QQ-SENDSIZE:
	 Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=nw5fLRj7RL+2syLOMMA7tyljQ2HjZvVTME4BUc9E8ps=;
	b=wrHk+2C4FhLslPP1eKFRGlibIno2ghpbESeZelInRGWe6SDpcvP7BejvD4Xp34K7pfcY
	 pVRoL00dJwKn+48fsCkxWvv+FPSDI35kk/wfY/6bv4HdRKKskyo8gHE8HkwgF8jeh1knf
	 JoBE6irxF9SvhsKG7dPHZ7iOMWEgZ//L2ht9e0oaZsBlSRre7wY887nLeQnYGfxelqKlY
	 kHiUGkZ5dvpIGCeYLw1HN25YRra6xZUDE0WZRBaknIGF6s7UygF9B73MjYmwyyGY/O3ej
	 zce8Is/VKfm3Oe1f/2ZPLug/xJ1IbxfnidM9Z/XIUwVtPqxvmA4nVdZS4v64BMmcfKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=smail.nju.edu.cn;
	spf=pass smtp.mailfrom=smail.nju.edu.cn;
	dkim=pass header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.a=rsa-sha256 header.s=iohv2404 header.b=DPJ9vv+j;
	arc=none smtp.remote-ip=54.254.200.128
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA0A606A32E;
	Tue,  3 Nov 2026 11:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AA0A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.a=rsa-sha256 header.s=iohv2404 header.b=DPJ9vv+j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smail.nju.edu.cn;
	s=iohv2404; t=1793706100;
	bh=nw5fLRj7RL+2syLOMMA7tyljQ2HjZvVTME4BUc9E8ps=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=DPJ9vv+jijG/LAtI+NIvTTLHBqalbk/mJ96OezSzpwE8owMGJqR1/CSUUwPSEL037
	 1vNlJbxlaZpZjMSYpdKAgTn9rpFjRrIH4KsMHtiBxgU2bRH7POKube3UWsghfdYvna
	 M4TVRWhPlTxEtbK1IhqGhu9D3jRQdS9gSY5PrK7Q=
X-QQ-mid: zesmtpip2t1793706095t0010be25
X-QQ-Originating-IP: yLTLrJJZJ5yQF+/M6zgCbAkA0E144ZNRNRnSj1TNW+M=
Received: from workstation-Precision-7920-Towe ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 03 Nov 2026 19:41:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6715613712380591380
From: Kang Chen <k.chen@smail.nju.edu.cn>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Patil Rajesh Reddy <Patil.Reddy@amd.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86/amd/pmf: check APTS buffer before reading header
Date: Tue,  3 Nov 2026 19:41:34 +0800
Message-Id: <20261103114134.75395-1-k.chen@smail.nju.edu.cn>
X-Mailer: git-send-email 2.34.1
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
Feedback-ID: zesmtpip:smail.nju.edu.cn:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: MkhAA4qIuU0pXalTEwAhbIyjkSFXfk8Cgp6b6AqL376hRAxaVWJV0uN+
	SWw/vT/ujTB0nVtD8I8uoS/XpUU4IyQl29AJs1MimmmdAp1Iqdbtc7+oj9mLA7fXDPRUakO
	5pUEir6I23jPckjbiFfWE1uP0XlK2E9XfVtGSqoFni+c7o8X3naJj8Q4Abj0jbbY5OHC4bU
	N63Gp4iiXqDP7OAuun8EuBss/9PWvFGf5UrEJ0vcS4saTWRHJrzAhSG5HSVwryRpEmxSVy9
	E1ubEMCn5tUinYaMWLpFHRYIDFSRH+DE4vynznn9zQIa6NNbQJ+3PXN6uHS5/3FShZtndji
	jFzI5djJex7B1pa3yAlFsqJlcMqzzm83+kUSEwKh6kh2qv8DBJB1VUqw/WfRAyJHQ4i6+cY
	atwtIUMj823AjKWaWFe8b0WYe6U8hyJdKcQnmAzZcQSoMuTRyRWUCRIZNB94k3QkZsZgBt2
	pelQGcmP8QD1/Q6ROzxxphyX12HYrPb6tkSQjsu+eNq/LKhETcermDJe27+9DPhj9smnhtO
	M4crB655YoEn+uxfu+Kt83ePmk0CGOqPJRUc/M8JwJrcm6y8EPIQ0aVB1miCo4Nh87Mhhgf
	caAKISu1S7JqM+kvIQhrDpdbPWpM8VtsVGvcPWnTrIGwImadNN0xEs3VmtrL8Q5i+rdGp5x
	RNQI3ESr+g7PL23YLSaiYzOi6CZM4fsyQgaFXEDCPEfDf1s837EJZ/StmGz7ByIG1zUFePP
	2Wowfcw8h6Od0HgvLqKH2cRePeJvIb8sTVBOzZIf4eRmVKnASlRCrFYe/1C3pXTYG7yyzXZ
	6cExeMuAzRw6U+W9wwJoMxZp9nFLsLhr4nywA4h3g1O9QZZt+VnEOCQ+ulaKL0AMbyNPaS8
	/siAt+QmGj47IjTsTgcp/XNXUWXFG+3uhgpfuJYwodQxDwUPgZaAaXwNwWghDxFnd93y+DS
	SI8igSMIFu5DjhuyFC2Uc1Jjc7G9GtnOtQZk3Bk7mdQrbSsdublaA+gvAMNY+c2ZO2zrIZM
	RHjVw/Eg0ac1q47TBy8EWm6I1P18yH/1zMJP2V3xAEzh1NK5Y60hFi6IK4EbA6OZzQ58M8N
	Q==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

apts_if_call_store_buffer() reads a u16 length from the APTS buffer
without checking that the buffer has at least two bytes.  The sibling
apmf_if_call_store_buffer() performs this check.  A Buffer(0) reply
from the APTS method makes the driver read two bytes past the ACPI
allocation.

Add the missing length check.

Fixes: 3eecb434d7f2 ("platform/x86/amd/pmf: Add support to get sps default APTS index values")
Signed-off-by: Kang Chen <k.chen@smail.nju.edu.cn>
---
 drivers/platform/x86/amd/pmf/acpi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 4392bf0bc0bf..8e0d9be8c042 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -137,6 +137,12 @@ int apts_if_call_store_buffer(struct amd_pmf_dev *pdev, u32 index, void *data, s
 		goto out;
 	}
 
+	if (info->buffer.length < sizeof(u16)) {
+		dev_err(pdev->dev, "buffer too small\n");
+		err = -EINVAL;
+		goto out;
+	}
+
 	size = *(u16 *)info->buffer.pointer;
 	if (info->buffer.length < size) {
 		dev_err(pdev->dev, "buffer smaller than header size %u < %zu\n",
-- 
2.34.1

