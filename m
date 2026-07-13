Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B23D3769F6;
	Mon, 13 Jul 2026 15:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955710; cv=none; b=nbWb4tw1trSGqGnGy/dl/Nd9jvRh6r4w0ikyOzd3WB2VqnaSiiD9+KMizFMaP2L/2qCIhnh2Lqsxf/+miChoFCX/BK/PF84c+xBpa6/EyTyS0euLMkoBsz87c41p3w2JKLREgKCx1bsqkfz5XywsegA0eZXDfGbk7iAC8rGPfwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955710; c=relaxed/simple;
	bh=j6pgyQKFdYyPXE1OOhIJyMzwy572z1lTJ/x0QYlh+GI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZuhhFuHM69vDClrfSi+uiRhcf0dguXtNdhsFOuUBf56WKG4CXOKbV1/AOqRbYReDoV/6vZO+sh2qsn6U+gvY9IHMPXLLECVMYvPlEqmlJQYd+WpivrXuq54PvQjdwGP/kl+rxII3euiF0w1JVA6FOzXEOsrtPc0CN4RkJyZl0Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=UOQzxqE+; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="UOQzxqE+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=1/
	WA6TqF78zIegBpiP9CObxer4csxvAFEiT+s4T2uk0=; b=UOQzxqE+BH6Sg0F0+Y
	7aL+ohosVigrghLMCpeAYgyYAYxXVwZlkG7W7INjt8pHUePwl4MVkcqJyVScTGZs
	o15vwxx2pCiymz0WI4NDOANfrTSNJDdmPnnKLBP7k0dEyMfSoxVN7HWGMTRyp8M8
	blPuMwYvAbjZsEIToqmzgw/fU=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wBHMPbQAFVqBx3nIA--.6087S4;
	Mon, 13 Jul 2026 23:14:28 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: platform-driver-x86@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>,
	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] platform/x86: hsmp: Check ACPI_COMPANION() against NULL
Date: Mon, 13 Jul 2026 23:14:21 +0800
Message-Id: <20260713151422.82947-3-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713151422.82947-1-yaojiale02@163.com>
References: <20260713151422.82947-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBHMPbQAFVqBx3nIA--.6087S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFy3Gr1xur15CFy8KrWUXFb_yoWfJrc_G3
	Wvka4xJr18A34qyr18Ar1fZrWSv34Iqr4vqwsaq3ZIvw1ruayavryY9rZ8XF47urWUCFn5
	C398u34Fk34a9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRLF4_UUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzhUlX2pVANX3jgAA3y

Add a requisite ACPI_COMPANION() check against NULL to the
AMD HSMP acpi probe, aligning with the fix applied to
asus-wireless driver.

Assisted-by: claude:deepseek-v4-pro
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

