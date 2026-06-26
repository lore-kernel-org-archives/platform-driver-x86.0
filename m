Received: from smtp-8fa9.mail.infomaniak.ch (smtp-8fa9.mail.infomaniak.ch [83.166.143.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EB234F259
	for <platform-driver-x86@vger.kernel.org>; Fri, 26 Jun 2026 22:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782511340; cv=none; b=LP1iKbZdptumcCii81Nu+68bTgEsEyBOQjr8/Uoh9udNTGGJUXfd+Xlav1SrWodqBuhFrCdtDHaKYdGFdK/Orqe8EhFIZmsfYxc/LZaWdM5jHLIGUJndnjNb+w5rEeGhrGXY6PeP7yUmun+4IDiSWciJ0FhTSem14VLLL5Y3e48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782511340; c=relaxed/simple;
	bh=gLY0NrjvjFI11oIc7bu/ijrV6g/z8cg8wC7N5PUl6i8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pf/jz2UZdvaXJuqkayLht+K3dCECbuX9ZNA7PQhi0UqHCjNcL6WbyUktYLpFRB0rkPiO/e796zGD5caPLo3LGlolmW9z/itikTM9qBwXy4ukcCBc2AsUc/gAKzulfNXz38GRaK4YXIJUZ7x+hLUsfUYN4MafdZQdclir5a2HOA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=AMnljzAZ; arc=none smtp.client-ip=83.166.143.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="AMnljzAZ"
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gn8m805HNz75n
	for <platform-driver-x86@vger.kernel.org>; Sat, 27 Jun 2026 00:02:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1782511335;
	bh=545M/W6B4T37AsHw8ww2WkU9OeMCGrS34alIPSJsUD0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AMnljzAZk7sLHl8r2X5qs+6KlTTUdzXnPSo0DAE9zyJMJ4PzqEaCJuAkqMHNxUkPF
	 qH85AhHEu+aWwB3rH8/AzLCoMwjHKiomAmvT4pA1vfuNrCQP1+Y0QGVcHftrIOskxJ
	 5DGsOP+8kFdR1baag2MSh3/lVQVGrFme4qk8p1U3xoGIi4w2M6MWc+jj6mAAS5htgo
	 esYSKLzc7TstLDX44bnCTXs2N4OGb3stfnwqZX9rqjuNbO5MPb2237UUu0o2O8eTEm
	 yhYmVMw/8dKOLOFqSXff9sU6xVPE+mn2sPWJ8GZV37lwcJbCoGJ7lIRidQi/PDyW0l
	 o+0bqPUyGrLAg==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4gn8m74662zgc6
	for <platform-driver-x86@vger.kernel.org>; Sat, 27 Jun 2026 00:02:15 +0200 (CEST)
Received: from unknown by spiderdemon.horst.lan (DragonFly Mail Agent v0.13);
	Sat, 27 Jun 2026 00:02:15 +0200
From: Daniel Gibson <daniel@gibson.sh>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Daniel Gibson <daniel@gibson.sh>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 1/1] platform/x86/amd/pmc: Avoid logging "(null)" for DMI values
Date: Sat, 27 Jun 2026 00:02:10 +0200
Message-ID: <20260626220210.1761783-2-daniel@gibson.sh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260626220210.1761783-1-daniel@gibson.sh>
References: <20260626220210.1761783-1-daniel@gibson.sh>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

dmi_get_system_info(...) can return NULL. Using that as %s arguments
of dev_info() would log "(null)" (as part of a message like
'... System Vendor: "(null)", Product Name: "(null)" ...'), which may
be confusing for users.

Use Elvis operator to print "(Unknown)" instead.

Fixes: 428b9fd2dce5 ("platform/x86/amd/pmc: Add delay_suspend module parameter")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202606251540.Nr2BtaNu-lkp@intel.com/
Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Daniel Gibson <daniel@gibson.sh>
---
 drivers/platform/x86/amd/pmc/pmc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index b2eb9909f6a4..26ddaa1c2e7f 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -732,11 +732,11 @@ static bool amd_pmc_want_suspend_delay(struct amd_pmc_dev *pdev)
 	} else if (delay_suspend == 1) {
 		if (!intermediate_wakeup)
 			dev_info(pdev->dev, "Delaying suspend by 2.5s because delay_suspend=1. If this solves problems on your machine, please report this whole line to: platform-driver-x86@vger.kernel.org so it can be automatically detected as affected in the future. System Vendor: \"%s\" Product Name: \"%s\" Product Family: \"%s\" Board Vendor: \"%s\" Board Name: \"%s\"\n",
-				 dmi_get_system_info(DMI_SYS_VENDOR),
-				 dmi_get_system_info(DMI_PRODUCT_NAME),
-				 dmi_get_system_info(DMI_PRODUCT_FAMILY),
-				 dmi_get_system_info(DMI_BOARD_VENDOR),
-				 dmi_get_system_info(DMI_BOARD_NAME));
+				 dmi_get_system_info(DMI_SYS_VENDOR) ?: "(Unknown)",
+				 dmi_get_system_info(DMI_PRODUCT_NAME) ?: "(Unknown)",
+				 dmi_get_system_info(DMI_PRODUCT_FAMILY) ?: "(Unknown)",
+				 dmi_get_system_info(DMI_BOARD_VENDOR) ?: "(Unknown)",
+				 dmi_get_system_info(DMI_BOARD_NAME) ?: "(Unknown)");
 		return true;
 	}
 	return false;
-- 
2.48.1

