Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377CF2F9DA1;
	Wed, 20 May 2026 05:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779256664; cv=none; b=bcVqvqzCYmcxrldSP+I2IgfK5RAE5aaa8C4uCHrPz5yVk8h1NzQae3bWvi1ggxuUp8HCpk/6aLrFg/3qTDC0FBIKHpkWww5i1GtOmLGV1IW3f/icLjHvLbJiAsgTlUv8Tzph54v1ik6B0WDa9uaKUMMxzIITLoSeaOKIBtFm2U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779256664; c=relaxed/simple;
	bh=L9krmIzn0WTwO6HiID7UFmGZDr29LAn6FeMk+d8Wyx0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qCZKYCO2Kmd0nsA14UkU9RTSof/lb+l2VwJILfd1RDYG2wh8kZBvEEYVsc6qEFAMYW3hDAhWIuhfm/dW5iwMvSP81an0ExFIWkD7GmzxJq72G2aIIbJWQKmkJSPxVC8/+RAykjGTvQNKKjRrmOiKQP9fWv2nFmeIDdXP2LoVKcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Kv4t3dj9; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Kv4t3dj9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1779256637;
	bh=9laOre5RlGQoYgGcXrnqBl3TMbqGWlgFEw5N+IhpOec=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Kv4t3dj9URBWIUk0ptkCdCWrzHsD4XaCJYjBmJQetPJKr80H2YdLBocOH1p1WLUSi
	 Klx2R+SxXZ4ghzWiDjnfEmXAeWaZghRCxch0BXNfl+WyFMP1uVeXg+VQc1XO3ExlI/
	 fzQaqFb3ojZ5DIfNa6FoEdwgz2cW4oqzbjw/K5Qs=
X-QQ-mid: zesmtpgz8t1779256621t9153eb3c
X-QQ-Originating-IP: QSN0wLSENlHg0J+/r9zXGhbdPU9Z2l4t1IKDdTscHnA=
Received: from localhost.localdomain ( [124.126.19.250])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 20 May 2026 13:56:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13421465371474428763
EX-QQ-RecipientCnt: 7
From: ZhaoJinming <zhaojinming@uniontech.com>
To: ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com
Cc: hansg@kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	ZhaoJinming <zhaojinming@uniontech.com>
Subject: [PATCH 2/2] platform/x86/intel/tpmi: convert mutex lock/unlock in mem_write() to guard
Date: Wed, 20 May 2026 13:54:43 +0800
Message-Id: <20260520055443.1681904-2-zhaojinming@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260520055443.1681904-1-zhaojinming@uniontech.com>
References: <b1006ce4-f596-b2aa-421a-518fe3cfe1f0@linux.intel.com>
 <20260520055443.1681904-1-zhaojinming@uniontech.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: NZER9JwiPloojal8l8nMJmTb/nIhu0nUqFGVdzu8ybeLTSHtAQpt5KHa
	nmGW6GLy1CzxXa4qhIZxZDJdtakOxzbmEkuJ+lHwUJe4lL6cp90saBFE9EuLAARiEOE9UEl
	UEvQRDJHvUlCHb+/3dNeiD37z7WvpMVcGcn4QjB1bJNCi75vRyZPMkziE2c4lwyFhzp6BJ0
	k4OWefOcWbunKflOS/I0lKSDPsRptlKksbToZk8SqgCiTs4UR1smc/R925mtMKqIRPsZsfO
	yCVP4WGXzRNpZmEftzsfiX+tHABS+8t1bGrSBsX3RtFuKzRDNGR1Jw+XVTGIrf2oFS6cKxV
	k4q/ufI9bYDSuiVvKUck/nev/naWmskJrJxxQzEowl9x5dUc8lhAPw0WqdQR3T/7Gk/wfXF
	CRnV7trc6uugmBe1BaIRX+3u5IF8lncKZXi0j6Aa9KvaQ28/EPjAFPPkjmwBq3ZMIGOQb7V
	ClOzFeio0lITH3SMcLYXHLpvPqAr1PSKei9kA1VLFwtNIaHFNPSI0im+GmnP5LsNO0nfKAE
	FvLPOH99xAkgJvmAGzAjPh2YyIJLmD5il2MzcCe1igQ1mdp7slRwSrzPFhHh/tfOcXNWj/i
	dwKZSo6KTC2M1IujTUCVq6TkmIhoHXK7HZUjpMj0WXigx/8bVH70i04Yu07DDeIuRvbpbbJ
	5jX56EpF/84Kqmptu+1UVq2gzPeIp3ITpgPQmfqtRlJHUezre+MWObFcI9yGW9Dj1hysi93
	YG0U8KveaxOxSmH+PZikq4vZx+GDKNlG46IlzBtt6kKzi05hr4YV/rqUjnidKm5gPuoeYdz
	kVWUmRtjFPVsNKnOKKT9M7lWoET9I4rCgOizltf+9KKitFrliIDJRlxvghBmNwJoOIMZnCy
	GXZ0LTVtv2y/1uRJyjZ+qF7cir8p01Q64nttYlyRZzoUPg9wYZCFWvGuymj+ll47EELiyja
	ybkgG7z0ePseA9GIp3qS2dOBAPLqvfnjqemgowDstfAt8MvvhqvulQDKER6TVyfnfjRdZJG
	JfofVNycNgt3G9rT9pIonu85SmgfkfieTcBS2reUwwJFfNWLPq/emXCqX0vXAnO6sU6jJhY
	xjrcEPGiM8LDthQqzOwgK+vF8ahKWWfd82l2HnM581OWcGFnAq/JDw=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

Convert the explicit mutex_lock/mutex_unlock pair in mem_write() into a cleanup.h guard(mutex)() scope-based lock acquisition. This removes the remaining goto-based cleanup path and keeps the lock held until the end of the mem_write() scope.

Signed-off-by: ZhaoJinming <zhaojinming@uniontech.com>
---
 drivers/platform/x86/intel/vsec_tpmi.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec_tpmi.c b/drivers/platform/x86/intel/vsec_tpmi.c
index e7bc3474c7aa..72b78b505e03 100644
--- a/drivers/platform/x86/intel/vsec_tpmi.c
+++ b/drivers/platform/x86/intel/vsec_tpmi.c
@@ -504,23 +504,17 @@ static ssize_t mem_write(struct file *file, const char __user *userbuf, size_t l
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
-	mutex_unlock(&tpmi_dev_lock);
-
-	return ret;
+	return len;
 }
 
 static int mem_write_show(struct seq_file *s, void *unused)
-- 
2.20.1

