Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3227215687D
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 Jul 2026 15:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783870772; cv=none; b=ey/IxlLKRh0oAWZSPLUj+afl4/mbPHa+gDSvyDM4NpsYeBv9AArtPiheqTx0VDJq3rx4u0NzcZV5XLKlZTOnnCNfv07AGXdKWQ0/KMA0LGYDVEeYB1zqVbWK8eg2cdSREqdl4kjmG/SpEvzWXD4AYwRoCho48SbwUFBot5PxWoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783870772; c=relaxed/simple;
	bh=lCsXvhVYvNSIT6Ek2viHIdjF3c9TaXK7KhBIXZyP+kM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SJFffbqQXwbaYH0+Fk1oKLsCuELIFPq05vcOth9I7rSlLvuMUiHKzD1mNWnaH9567G4d/qP1YHBHmNiyYj63bibLKHQRVOqTw+JX7DVWLftsMWDQ6R5ooQxYONM99ASE9WWb7rG+COj/FLwBoQTUQQLdgJmSXPoYMDHAu+IZsnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=CgKsJGRs; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="CgKsJGRs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=3j
	gWjrU1N9SZoTlJTlXwVKHg7bD4vU29kPuYUdVIbU0=; b=CgKsJGRs4e/3EbGyX4
	ZphEe83cvR8UUlWdEANntSw5jyYhGj5CKBOarDXm05c3st/z7gy0L3HlK1JP2mGt
	XcnGWjbB5jF/JfSU0r4x3IUVetMstdmarFtPgnq2wnBOMqGZOiSbAlMhj+Vi0Dgx
	d+34LcuJ9p/DkqWJ8YeYDqnmo=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3F8z_tFNq93XVIg--.47072S2;
	Sun, 12 Jul 2026 23:38:40 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: platform-driver-x86@vger.kernel.org
Cc: herton@canonical.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	Jiale Yao <yaojiale02@163.com>
Subject: [PATCH] platform/x86: topstar-laptop:  Check ACPI_COMPANION() against NULL
Date: Sun, 12 Jul 2026 23:38:38 +0800
Message-Id: <20260712153838.3338173-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3F8z_tFNq93XVIg--.47072S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFWkGw13ur4rAFyfGw1kuFg_yoW3Cwc_Z3
	W8uFyrJr1kG34vkr10yr4fZry2yr9FqFn7WrnrtasIvw13tF17Xrn0kFyDJF4Uua47AFyD
	u39IqryIkryagjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRiHq27UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8ADcF2pTtQC+UQAA3Y

Add a requisite ACPI_COMPANION() check against NULL to the
topstar-laptop driver, aligning with the fix applied to
asus-wireless driver.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/platform/x86/topstar-laptop.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/topstar-laptop.c b/drivers/platform/x86/topstar-laptop.c
index e09d7f8ce45f..f6fafa345f93 100644
--- a/drivers/platform/x86/topstar-laptop.c
+++ b/drivers/platform/x86/topstar-laptop.c
@@ -291,6 +291,9 @@ static int topstar_acpi_probe(struct platform_device *pdev)
 	struct topstar_laptop *topstar;
 	int err;
 
+	if (!device)
+		return -ENODEV;
+
 	dmi_check_system(topstar_dmi_ids);
 
 	topstar = kzalloc_obj(struct topstar_laptop);
-- 
2.34.1

