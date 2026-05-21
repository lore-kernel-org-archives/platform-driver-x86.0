Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688103CA49C;
	Thu, 21 May 2026 13:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779369000; cv=none; b=FfK9DqpJiYUOTlGN4tYV3p2VhI1O+8NZehN6h/o6EqFnQfpimr2I89TGiGQ9ZBp14vaQ9BD8DRGIt/5lmx7zfvf8uDJMZcV9e5gTOFBkwM7NuJgpBgQula0MHIw+i0NvxxFmkqeI3siXeoH8WY0YKtjNSmd/JTHyXCYkCyXZtWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779369000; c=relaxed/simple;
	bh=ANcRbFRRfIQ6MyaIsMkvBPqh1PsFM/Jle8keAtEn/jU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qdMGP56UeVdYNH+h8e9Rx2PDVhtJmxnkIPZ5sgtDOqajSqQ5JJktdR5AWT7R7QMvEVwFcPoH2NwmPSHNmm3TB0CYw8dsAYXWbxnQUOgAjIKt3+oEGKAypB4QaC1HPpmTH3vReLAA+uqtv2MTTAUcYLFgvYtmyUYcOCeqxA5q/og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=h0XngtwZ; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="h0XngtwZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1779368972;
	bh=TaUEwpABj2b0NtaTcqqmHA3hPXORN6AcCtjsf7GzHXI=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=h0XngtwZ8aWyF/qRp9wZ0Jul5oxLhY6b361X0Pp5aqHidbETCAEYXh5WxoKcLk+7h
	 4cSpXazUZ+LIsoBay7LfXQIcUMooEaXPEbOmR6h1EB4Wdq5x82ded2fhz4YeN86TyP
	 jRLTOfHxpYjDsg4neeSGPWOTE27WqH58tzxIiLF8=
X-QQ-mid: esmtpgz13t1779368956t208fd6a3
X-QQ-Originating-IP: iSejc1Xmdk1M6K9a9tRy8CagIQzhImDXdr2XGTCLayQ=
Received: from localhost.localdomain ( [124.126.19.250])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 21 May 2026 21:09:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14350753827032613774
EX-QQ-RecipientCnt: 6
From: ZhaoJinming <zhaojinming@uniontech.com>
To: ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com
Cc: hansg@kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ZhaoJinming <zhaojinming@uniontech.com>
Subject: [PATCH v4 2/2] platform/x86/intel/tpmi: convert mutex in mem_write() to guard
Date: Thu, 21 May 2026 21:08:48 +0800
Message-Id: <20260521130848.2860219-2-zhaojinming@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260521130848.2860219-1-zhaojinming@uniontech.com>
References: <20260521130848.2860219-1-zhaojinming@uniontech.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: M75I2DDAzREFtyHnOpHlH9Ho+AYa4YSQmjh1YaGfOz4rWY4YZ+UGa6SH
	rng9eKErFr6RjVTeDmqaQ4m/rWDJsMe0JG9sQxp4rF1e/FNPLR90RYLrJbdGQ+iQeMhMvp+
	iUIRy4Rcwo4Rr1jptb7+kHsOsBeigAEtDn6Ksf/dzfB5JuRraAK7bj6AZQ5HJS2NPz4mLh7
	VGSxtC/UQKVLYnr4TTxY8qApK03UkWaUP0QUCulkWkMTDbbTbTRR31f6ROIiuhbQOz86rqc
	4MlGB/O2ldeODVxRA67TBY8aWGBeLCsOGGuD6zj1CvFflcmUW1BgaweVKLNKImHn6VKxf+D
	q7BYfGX/SqriMzlxg96DCdf+8/ZXqB/juUCZlPOCWBcGObz2LgIwWmDl5f+IOLCXL4q1RBN
	x2GvxIpHuJK0QzCB036d3WwV0VM6LpkBFSHlLiNWfgvvci7ED9hbGea/w6nw1hfVqNheFFv
	0jalwbtoEI/yxAh+KCt1WF93C0IMVWikJ+4ICNKSo/Xn/2yU3FT57PHRUf22dRYHM22IHfY
	WE37Nr61RBJVGdf+NYPTzSDTX3yWwk0EKUpCQBGO7jl3BEeQQaBb+aJtWe84Oy1Ig467qb7
	OrgJqdNqeuVgqErSKl+P8+YkO6efCo+++cQCYJGKWIfnbTJqvp5PLVQOoLOfdCVrFuWRd6L
	Jp+2ttizOhPSDmASXQPqK/ES+qUU7o0j6dUAM7XFA4u9y3yaa8Tr2BQ6OGW1PxKgale7NsS
	nk2AwzpzrWY0c7DDPNwjFgEpEQ/JpChyewA2xBhXq1OD/DuUFd/M61mdl9E7EoiKnN0NpMM
	uMz78mPDoWP95qpC4tGSh7s39BIiTVqRMjBgWkpFKAdjm0ewrpb5wA+xCXENee4tNKN3Z7S
	cmjihQcYwdr1lSF15iBEUSzwXE6HjmLBk3d5jpSkiRk08jHm/il4+KuxVXFcsaTIybeTYJ+
	nN7tL3LM/IkXpjBzpj9JUWvbE16J3JdH5UNVUkxwpq40V/DMoHASR+ZmCWL+9WClRaNRrPo
	gnJENLdfXQy0bH7g75k3qrDeCklGj22Qd97yrlc/OyM+vSwobIQltSUw0b2nYUFnRfnLiaf
	g==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
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

