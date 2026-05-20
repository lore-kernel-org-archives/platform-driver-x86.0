Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAB23002DD;
	Wed, 20 May 2026 05:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779255794; cv=none; b=m4/nVT18qtij6BCAazgenG4xRmcAdvuDt1rqtCLBH8hV94LQ1OSwQborbOYrVHPbuTjxJKPuoJlWXafmFBXBlBOR/JHxtBCW8MxmfHNDua+TbA/aFTr5ezy9aBcAYp2rckUPf5NLJAk4bgawndMlnzDdh17jqUp+O0FqwK5gie8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779255794; c=relaxed/simple;
	bh=L9krmIzn0WTwO6HiID7UFmGZDr29LAn6FeMk+d8Wyx0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EBDyUloUtAp2kT6yYFO1QGMsYOBD2kWeHW2ZoVpbOIW2rDbzwPWLIdU/M1DtFVjycW8QLmu7J1Uv7e50qaM/4K86Pl9YpCLnn5IjtT1Har69U67TvpK4hL1wLpmBnHP4H5ljwRnPRc6rRAjzI9E0bU97pRr+OnB0xmUov1WVOnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=PX0Zngpo; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="PX0Zngpo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1779255776;
	bh=9laOre5RlGQoYgGcXrnqBl3TMbqGWlgFEw5N+IhpOec=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=PX0Zngpoj0AayO+f5i3F71UwGmtOedYPZI6PaF95KkDHnmvI6AsFoIfwgYBHPTWFY
	 xoluXAFNXkkgTUxfHBIJjoMA73NDdxlu+qX50qEIG+mqQBkpzWRBnrwio8QmOpCnbU
	 ee9ZK/45NPTyN4ys3NEiHgURxggqcH2GRMyBpYMU=
X-QQ-mid: zesmtpsz3t1779255761t46ca397e
X-QQ-Originating-IP: 14NkitC7CU2hxgdSYp44vz1UX0xr/SqXdX72lMB6MAE=
Received: from localhost.localdomain ( [124.126.19.250])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 20 May 2026 13:42:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12850921483370201419
EX-QQ-RecipientCnt: 6
From: ZhaoJinming <zhaojinming@uniontech.com>
To: ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com
Cc: hansg@kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ZhaoJinming <zhaojinming@uniontech.com>
Subject: [PATCH 2/2] platform/x86/intel/tpmi: convert mutex lock/unlock in mem_write() to guard
Date: Wed, 20 May 2026 13:41:22 +0800
Message-Id: <20260520054122.1630021-3-zhaojinming@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260520054122.1630021-1-zhaojinming@uniontech.com>
References: <b1006ce4-f596-b2aa-421a-518fe3cfe1f0@linux.intel.com>
 <20260520054122.1630021-1-zhaojinming@uniontech.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: NQ1SesBsQjVtmZwkZDva8cB0+pD1CECBntiCPWxxm3KFJI9svAB+zjd2
	g0cSxqlwA+TNfGLTLOjVQx9pe53229x+cRjgcmFmXWHaF0pmB93EUgDDKvw6Wwh0mhmxqfB
	ZYVk/oJztcKhq9WYvc4PN3aqZpP2OGphop+hJO/pJFvfIa+wLMZpQ0V1gS2YN4/Go8EhlxE
	8NpGmuEHcLedIxS1PR6R1oq4l6dLHlPRF9IIT0b6GuZaWWoKP+DX90Z2WhrycaySbHNV/8C
	uFoPFOL7kkZZ4lIIlYXTA5einsS55gW7qHodWct5DdiuzIHorhHXWKRKQ13pZRhVulDxSpo
	Vyy9f3Y0DTGhNOU0XjaLimwHNcujqiatpSG/m8Ku7IXOYnIjxhSbMuVgidWjho2ZE8TwXXU
	dAeoYaoQgEa5xzqKQagbCDJhRP8kik/Hg5Y1+bQb20pOldEEV0TkFiOEvEgxX3+a9oHlXBf
	JkLvj5rroUMKHkjXfwbo4qZNdK3fdYterOA1D//93rHXXcNmnSB3s7T5/vpTbFiyBjb6JeR
	5Il9MJECB/D4rSheIZFzWGtpGvAF4jZK4pIPglfngUFW0ySJeFb9RmNBmxhbVwYt0xaLP9r
	u5bgxQdtMXzCh4a6qvShbOXWr1XhSvGp43FYVeZriE3FK1Yvv92KXkub8ZS+FbcZfx2F+u9
	xlFrZIAjeihQsMmFnGHGJudd7VG5H8GGhMQ9fZPsXXjW5OxJ2inFtqFD379slflaFzBfdgK
	675UNyrOfILm2JS/zJNZm+vK2bQtvKINPegRu3cW1ckB8GiSApFWk1eb2LakefvnFpr48E/
	tUBw8+JV3sll12wqYvyXax/wCbH6qhPhYkATrIuLUfa+mWvFxJSPwvto8tyoSRNyod33eRg
	W+cPFeA7ZlqdCo86RPs3gySk31eK8Zk8fXoFFexXuEIXPACiGazrTlzbCmrcMpOeycpetIa
	QzppJrR6VVIUJvc4NONZ2hsDHJWptLHkOJHQ0LCOsWV3ll/sWj+74QY9tB5p5FlokMZSxwN
	02+S7XsJfgPKHQ/d+DPClbTBXHOcfYxyuZ2tDwGnlqwV5MEday
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
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

