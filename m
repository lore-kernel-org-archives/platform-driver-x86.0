Received: from mail.unwrap.rs (mail.unwrap.rs [172.232.15.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FC83DAABE;
	Sun, 18 Oct 2026 16:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.232.15.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792341673; cv=none; b=np2L29pPJ+YANBZ9iSleBOkzJb7Pul2Eg7JBu4RtHyznbLUuYA/PyMEdCaBrnFpHL9clbyNCwaV+arUuEJ+MMkYCHQFNNjArlr9R2ZhMehaqK1muSBQlmcEpFACR66xQXP8Oc39pBIy1NPolwem4E2GJben4rSGqBzjUq6B6NQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792341673; c=relaxed/simple;
	bh=ydvN3PlsKC8oXbxREuSXI3lcG5cLoRme38WyZ6rg7+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m53uvfCvDUfS78elB8+n/Hdqhvc3a07TWTxfwifwLQmmEypZw5pdEyfY76iuTdTnofAH6FFidfE/VvzmJbAQHaZ5W2BLyFfZNJ3T/JonazIVKmtWfEMdF6igHCrY/WTCb9v6ly/FI+30ei1ybrqfmbCH8971ku0bD454HTu7fHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=unwrap.rs; spf=pass smtp.mailfrom=unwrap.rs; dkim=pass (2048-bit key) header.d=unwrap.rs header.i=@unwrap.rs header.b=MIsN8fOc; dkim=permerror (0-bit key) header.d=unwrap.rs header.i=@unwrap.rs header.b=xgDGwZ7n; arc=none smtp.client-ip=172.232.15.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=unwrap.rs
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unwrap.rs
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=unwrap.rs header.i=@unwrap.rs header.b="MIsN8fOc";
	dkim=permerror (0-bit key) header.d=unwrap.rs header.i=@unwrap.rs header.b="xgDGwZ7n"
DKIM-Signature: v=1; a=rsa-sha256; s=202503r; d=unwrap.rs; c=relaxed/relaxed; r=y;
	h=Message-ID:Date:Subject:To:From:Content-Type; t=1792341662; bh=MPZG4N7buI
	LAzPPxKEDxebTmaWduaWrYzB891bPpNe0=; b=MIsN8fOc4QcTy9yS8NxYRzbuZQBx/xxZ73m4i
	KwWW/R4jP+9xlZGy+bqjsYTdEbXhJyUSHJx0ztRtBEn6kLibm5JTwHVWHebMKHQJ4WEbKUQd+j/
	E0h9BskyUqbCv3+gWrHfslrxF+heGExIeihC867S9F/gS7TbWTSlJkuf2jPXTReQyBuoerjh88q
	htuvf5qfTeCLzz/Gpjt/+GGJAUg5sqnBjVnz8d3nU/AWTbT/RTLiPZVyQrzxWRQn6Bx+pO/zgZl
	jI6QQCwh+1qLeNMydiKzLxNbJ4iH8owDxdPBUnTbQiKLP91SWmf1WFpRd9tGpxVWiqBOwFnFTie
	pMUGw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202503e; d=unwrap.rs; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From:Content-Type; t=1792341662; bh=MPZG4N7buI
	LAzPPxKEDxebTmaWduaWrYzB891bPpNe0=; b=xgDGwZ7nICqUGUhwnjA7Ag8pO0whaV7BBfuNp
	gGZvX3mhhIouldfsQ52Gzv0G7q/DQF+oEimZkmzuh2imChQCw==;
From: Cole Leavitt <cole@unwrap.rs>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Cole Leavitt <cole@unwrap.rs>,
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	Xi Pardee <xi.pardee@linux.intel.com>,
	Rajvi Jingar <rajvi.jingar@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86/intel/pmc: Use each PMC's own status map on S0ix failure
Date: Sun, 18 Oct 2026 12:40:32 -0400
Message-ID: <20261018164037.133658-1-cole@unwrap.rs>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When S0ix entry fails and warn_on_s0ix_failures is set,
pmc_core_resume_common() dumps the latched LPM status registers of every
PMC.  The loop over pmcdev->pmcs[] however passes the register offset and
bit maps of the main PMC to pmc_core_lpm_display() for all of them, so
the registers of the secondary PMCs are read at the main PMC's offset
and decoded with the main PMC's bit names.  On platforms with more than
one PMC, such as Arrow Lake-HX with an 800 series PCH, the dump
attributes the PCH's power gating state to the wrong IP blocks, which
makes it useless for finding the device that blocks S0ix.

Use the status offset and maps of the PMC being displayed.

Fixes: 2bcef4529222 ("platform/x86:intel/pmc: Enable debugfs multiple PMC support")
Signed-off-by: Cole Leavitt <cole@unwrap.rs>
---

Notes:
    Tested on a Lenovo ThinkPad P16 Gen 3 (Core Ultra 9 275HX, JHL9580
    Barlow Ridge host, I226 Ethernet), in daily use since 2026-09-17.

 drivers/platform/x86/intel/pmc/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index 9f77c0716e59..3fd72e6a08ce 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -2068,8 +2068,6 @@ int pmc_core_resume_common(struct pmc_dev *pmcdev)
 {
 	struct device *dev = &pmcdev->pdev->dev;
 	struct pmc *pmc = pmcdev->pmcs[PMC_IDX_MAIN];
-	const struct pmc_bit_map **maps = pmc->map->lpm_sts;
-	int offset = pmc->map->lpm_status_offset;
 	unsigned int pmc_idx, i;
 
 	/* Check if the syspend used S0ix */
@@ -2114,7 +2112,9 @@ int pmc_core_resume_common(struct pmc_dev *pmcdev)
 		if (!pmc)
 			continue;
 		if (pmc->map->lpm_sts)
-			pmc_core_lpm_display(pmc, dev, NULL, offset, pmc_idx, "STATUS", maps);
+			pmc_core_lpm_display(pmc, dev, NULL,
+					     pmc->map->lpm_status_offset,
+					     pmc_idx, "STATUS", pmc->map->lpm_sts);
 	}
 
 	return 0;

base-commit: 32c52ec87d6245ee2d12ed5dd509e40062939b50
-- 
2.54.0

