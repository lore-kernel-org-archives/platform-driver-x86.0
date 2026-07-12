Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C3CCA52
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 Jul 2026 15:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783871763; cv=none; b=plD2ys6JIwp8cMG4lgyYincNEYPB3NVuTIS5ZPyrQkXGyamPTqGsJorKK0bAn998VWxQU8oSmXVcCcCVLAQyyHqit6iTqDHl5yJueADjPxZLOy3YvTmoAcm0OAibYgOGzR8blBiv5zalrBr0cafuYWcfoOSFDTujkTufyTFz52k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783871763; c=relaxed/simple;
	bh=2atnWqQKazdtH5RaPbP0CG6SnYNYGz5IPseUjWpqMDo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LxqWMQWeVp0k67osZpcWMZW2Dj7Cit65k8ofzSzXcnVp/1Lplld7ahAynjq+5BBa6VwYRGxBEZZ0PILrBs2eTTeSg16RTuLOkwS7PlGwJzGt9mds9FC5J+kWMr96UK25m5gmfnUNlunOlOS7j+wNFcnDDAM4dv8qVjPLm8wfFWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=VCD0BDHL; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="VCD0BDHL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=4r
	u8prm9gnyiCpGFwewAqYNad8D2sZLeCx7U6exbHJY=; b=VCD0BDHLsoDVyb7r7S
	TTTlNxOy5WKygXeQ1oW+vIiqaUIKv442EYHKxw3Znz7qSOq8v393WBHvxjKjWJgu
	94MTb05Enl20PkJwWynHH+H6znx4hsIh3n6QbB0W17VZgMACDg6x2Iy2DP6I44Vd
	AdSGfOtNDrYZ+xVS2LMmoYNjQ=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3X1fvuFNq0cLSIw--.10279S2;
	Sun, 12 Jul 2026 23:55:28 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: naveenkrishna.chatradhi@amd.com
Cc: carlos.bilbao@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	Jiale Yao <yaojiale02@163.com>
Subject: [PATCH] platform/x86: hsmp:  Check ACPI_COMPANION() against NULL
Date: Sun, 12 Jul 2026 23:55:25 +0800
Message-Id: <20260712155525.3355770-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3X1fvuFNq0cLSIw--.10279S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFyxurykKrWftw1fAF47urg_yoW3ZFX_G3
	Wvka4xJr18A34vyr18Cr1fZrWav3s2qr4vqwsIqFnIvw1ruayavryYkrZ8XF47urWUCFn5
	C398u3yFk34a9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRiHq27UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzhDZFGpTuPBxVQAA3G

Add a requisite ACPI_COMPANION() check against NULL to the
AMD HSMP acpi probe, aligning with the fix applied to
asus-wireless driver.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 97ed71593bdf..615b3ebe66e7 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -71,6 +71,8 @@ static inline int hsmp_get_uid(struct device *dev, u16 *sock_ind)
 {
 	char *uid;
 
+	if (!ACPI_COMPANION(dev))
+		return -ENODEV;
 	/*
 	 * UID (ID00, ID01..IDXX) is used for differentiating sockets,
 	 * read it and strip the "ID" part of it and convert the remaining
-- 
2.34.1

