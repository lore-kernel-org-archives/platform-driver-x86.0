Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C365B2F7469
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Sep 2025 23:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758582524; cv=none; b=l16fmLVOlYq4gGaxugexxsE+pjL36fGYib59wZ9qgmeLLybmP+lOKoNDzpsCHdryVER6cmSwSr5TGoETIJC1dcLR6qS2c7sMNzlcIp6/RYxKi55UN1/tAmGdm5dt53nurZhZXPVllfx5Mo2nQVqq7sa3lPn2iUQjIIWpZo7S254=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758582524; c=relaxed/simple;
	bh=HlWw/vskfQ+uMPIywOQ7wDsPxPnUaosyW+eMOvDeHCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kZ7zBralQbTgv1r2Pk1t+J8h+gID5aijDaBZFIV3oJquBsNp4P+FagnzC2evbzSDaH0IVBRpOfFuULxXmXsjRhe56vbRWg6/gn1Of+VvCl9rRKwsSuktN0R57czt5p1qsWRHwvBL9Kw2sL/HsmAhp4QY73eXjeIv0Nn5r2GXVbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=fUblaG2b; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="fUblaG2b"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=+ynCm1comapG0AjJnC88/u7m7XbYU0/Uu1C3m9EVAcU=; b=fUblaG2bQOqtHXeDS+nFTOjIqZ
	fRS4KkrJXir835SLoGFImORqomf2SGGgTfG0O6UlsLFQnSnZqJ3E6OMMKcc4SDS84MFU5KLed1Bi9
	I1w0Vqt0bsWyni7jpz5xVplm5NWKuIhHFPMNUzDP6cNKNy2H4D+8yYaNs6ChJgwATVSL5O0M0wuwo
	XJxEDms0bnq1KkSX3upCgDtTTCbpfm6bXxPl4fuWQ+9DRX8SixNydbQZYIySnUvgnRpCWQFS0fM/E
	paSA2FUGnutVH/1csjcrtTB0lMIq3+VIPZZdjjQi0wIUEvoTkFI21z4G6DWe3ov5KXVgoCvGDJMWR
	JNH7yhgg==;
Received: from 201-27-133-184.dsl.telesp.net.br ([201.27.133.184] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1v0pe9-00Fwtw-Ut; Tue, 23 Sep 2025 01:08:39 +0200
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: platform-driver-x86@vger.kernel.org
Cc: irenic.rajneesh@gmail.com,
	david.e.box@intel.com,
	xi.pardee@linux.intel.com,
	kernel-dev@igalia.com,
	kernel@gpiccoli.net,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: [PATCH 3/4] platform/x86/intel/pmc: Always dump LPM status regs on unsuccessful paths
Date: Mon, 22 Sep 2025 19:52:34 -0300
Message-ID: <20250922230812.1584253-4-gpiccoli@igalia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250922230812.1584253-1-gpiccoli@igalia.com>
References: <20250922230812.1584253-1-gpiccoli@igalia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Right now, there are 2 fail paths on pmc_core_resume_common(): either
after (some) package(s) didn't enter Cx state, or after s0ix was
not successfully entered.

The code has a debug output, dumping LPM registers, but *only*
on s0ix fail path, not when packages fail to enter some Cx state.

Let's make it output the LPM registers in both fail cases, in order to
help debugging issues.

Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---
 drivers/platform/x86/intel/pmc/core.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index c8ce5d6ec30c..aeb5e47cf5bb 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -1882,16 +1882,22 @@ int pmc_core_resume_common(struct pmc_dev *pmcdev)
 					 msr_map[i].name, pc_cnt);
 			}
 		}
-		return 0;
+	} else {
+		/* The real interesting case - S0ix failed - lets ask PMC why. */
+		dev_warn(dev, "CPU did not enter SLP_S0!!! (S0ix cnt=%llu)\n",
+			 pmcdev->s0ix_counter);
+
+		/*
+		 * Notice that SLP_S0_DBG regs are captured on C10 entry,
+		 * according to the spec. So if we didn't enter C10 (i.e.,
+		 * the  above if-block was executed) seems to make no sense
+		 * in dumping them.
+		 */
+		if (pmc->map->slps0_dbg_maps)
+			pmc_core_slps0_display(pmc, dev, NULL);
+
 	}
 
-	/* The real interesting case - S0ix failed - lets ask PMC why. */
-	dev_warn(dev, "CPU did not enter SLP_S0!!! (S0ix cnt=%llu)\n",
-		 pmcdev->s0ix_counter);
-
-	if (pmc->map->slps0_dbg_maps)
-		pmc_core_slps0_display(pmc, dev, NULL);
-
 	for (i = 0; i < ARRAY_SIZE(pmcdev->pmcs); ++i) {
 		struct pmc *pmc = pmcdev->pmcs[i];
 
-- 
2.50.1

