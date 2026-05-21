Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA99632B115;
	Thu, 21 May 2026 03:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779335868; cv=none; b=tYbjhwqbGNiNQmOtTHXUfh9XhMEmviD9kH8BSMMCj5IXCYoWBvEIfiozWLVw1B3bTrFZ0J5NjdzlRx+tRfUiG7/tlBT/ZpGcLwGaodOktLWrel8sZgO7umab+6cUY3MOOx2RuajExQONU1SopEOf6BuB4PbyaFJ053Juxdloiwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779335868; c=relaxed/simple;
	bh=ANcRbFRRfIQ6MyaIsMkvBPqh1PsFM/Jle8keAtEn/jU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g6qlB3nzPmvhzV3pgjHEuL1qRiQ1wIGgV9WazVnQaK8Cjo/v8v6UwKSjn3Dis6R7T2aPMMO0+0I4wN19qO9UMo9Y76tioXCvGXcD9SlYcsXOOe14NENsLCop0jlEHrA7GzE6sPFe8PEAUWxLg/S11Xr5J1A1wTjDPT5AdLzB5ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=iWFkQLJv; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="iWFkQLJv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1779335842;
	bh=TaUEwpABj2b0NtaTcqqmHA3hPXORN6AcCtjsf7GzHXI=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=iWFkQLJvAOubXepEanWqpRubNXlH1cepFGNTPK0h86mU5ajJ2ry6yRmp0NDELSuBW
	 rma2Jgkm4uriDxs31qq84T+seLVzRROZNoioi8q8rs0dPogleVyYOJRVLd5aHM0zmU
	 n6W1o02mr7AmQd+fkCPZmZ07XSi8xtBmGCyYEojE=
X-QQ-mid: zesmtpsz8t1779335824t1856eaeb
X-QQ-Originating-IP: y7xUbSJy+TtaPikFP/ZvMye5A06qtWHbF6ydfXppzyU=
Received: from localhost.localdomain ( [1.202.39.170])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 21 May 2026 11:56:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14978308730696407695
EX-QQ-RecipientCnt: 6
From: ZhaoJinming <zhaojinming@uniontech.com>
To: ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com
Cc: hansg@kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ZhaoJinming <zhaojinming@uniontech.com>
Subject: [PATCH 2/2] platform/x86/intel/tpmi: convert mutex in mem_write() to guard
Date: Thu, 21 May 2026 11:56:23 +0800
Message-Id: <20260521035623.1426374-3-zhaojinming@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260521035623.1426374-1-zhaojinming@uniontech.com>
References: <9de7a91f-2dfa-7a99-9580-378c7a044bce@linux.intel.com>
 <20260521035623.1426374-1-zhaojinming@uniontech.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: MdoRYM9mYrydCQOIXSFzN9GnOmopwzyjJ1S2DzG0A9EwNwxVEmUwRUVY
	lsPRkapStZEf9AgOalQiD90JVXXaGCouJBW2JxTT39RvJ8dEPO9JlwrBpbGyCzWDGPXDA2B
	FcLR5ofY49pEDo5kz5HnkXaxBUgmb8zS4JDEPABg22QC9AmcRaEyDCRrXEqzRv1cgbdpk4x
	nCAjOYe8Obt7nVnHUQoDbXkIL7m38faGJzSwcmBMEY8R8x31zPETWz3cHpjLU3fIlvuKq1O
	0n7Ej6MpWHNd1CgYq7mfaGmYH0nMhfcJrg8WSYBohk+8D43ghxLR3RpLGSx2vqv6p1OblfV
	KGJbFVXI6ZL8yxSlQFTdPRv7Btg+rNHqR7XTngvqBQXrqv7k0rbYn2sQmR36jPi7RJSiHyH
	idNnE2xitG2Ggd4w8nGoftjIK3/dqTAsjpHn4Z4AVEFc7HMO2OrulAC3D4agGmpCDa6VrBg
	NHZrHkiQ7Mjc+oiAdSeiCbUo6uFMP+DqYyIRjYvehTN0GGO2Lnvq3/d+pkbfrLZaGocDFj4
	jetaW7uijX8w5Hh2oqnCnnsdmOk98UoUSMSfi+KN7mtAdU7dtTjTfyQCjimYtxC15+lCoFw
	7xGVX4givX6+t9hsGbeXdJepqLpsrbrQoUr6lUBAi9ys+Fwb0XvACZPA3byUzGZOpfkK+iz
	n4Aht0HxrfhnlKp7xKExTdnkSrEOC8pRHgoK0vUBTwqnZPVcLkXHGfG+HWhOIyAZPN77unD
	q/JaO2HTYxrw6YZBsxJFzx3liIv3hL3ydwyZqvP1FKBkY4HQ2my9OLWPOCmI8nc8Dm6blyU
	qZc3OZKwAjQHAzuQ77ZQ1ObiGnn4JlFc02Edzt/5/7cTLTadlCbMFw8XaEYYQOOIzs2guMd
	10uRO9rU05VUD1QYLAZS9rTOaFWjH4eVsnTp1Weij3cMo8U+LNnXFjlIvPN0bTA4QqOk0V4
	H2qD5gLw7/Ghm2kSG4NQUEWOIa4pCIF0Jw5cRW061LF+elnwcc7KBbrLGNwcBT+RRzGslEY
	dUarZjxoWdfpal5llx3+9IrUhtF7rHWqi+fn/eStRR/wwGznAYS4AVUO0yU4Q=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

Convert the explicit mutex_lock/mutex_unlock pair in
mem_write() into a cleanup.h guard(mutex)() scope-based
lock acquisition. This removes the remaining goto-based
cleanup path and keeps the lock held until the end of the
mem_write() scope.

Signed-off-by: ZhaoJinming <zhaojinming@uniontech.com>
---
 drivers/platform/x86/intel/vsec_tpmi.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec_tpmi.c b/drivers/platform/x86/intel/vsec_tpmi.c
index 88f14d0ad410..9bfd05eaa002 100644
--- a/drivers/platform/x86/intel/vsec_tpmi.c
+++ b/drivers/platform/x86/intel/vsec_tpmi.c
@@ -504,24 +504,17 @@ static ssize_t mem_write(struct file *file, const char __user *userbuf, size_t l
 	if (addr >= size)
 		return -EINVAL;
 
-	mutex_lock(&tpmi_dev_lock);
+	guard(mutex)(&tpmi_dev_lock);
 
 	mem = ioremap(pfs->vsec_offset + punit * size, size);
-	if (!mem) {
-		ret = -ENOMEM;
-		goto unlock_mem_write;
-	}
+	if (!mem)
+		return -ENOMEM;
 
 	writel(value, mem + addr);
 
 	iounmap(mem);
 
-	ret = len;
-
-unlock_mem_write:
-	mutex_unlock(&tpmi_dev_lock);
-
-	return ret;
+	return len;
 }
 
 static int mem_write_show(struct seq_file *s, void *unused)
-- 
2.20.1

