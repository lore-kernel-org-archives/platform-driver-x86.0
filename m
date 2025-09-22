Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24F928B415
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Sep 2025 23:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758582517; cv=none; b=i53np6kKB0bK05glUqq/stBEYXmi52XwCm8syAx3dWLtmgEfWkHSR+pLJNDVzC0TG7hiPK/Sdxame+Dh07WIGGbn/YS/Bl3TWy+fc01FQcGXIq3aHjNaJIympS8gsbdN1Z4w58JxmDL7EwCfXYALKUrWrCbBCecqt3Uc92uptPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758582517; c=relaxed/simple;
	bh=pBTgnKjuHfzkmlMhXthTF8PU5jY8ccrygieQwQbK9fE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gichLUbds1YCAS/C4acqnZXnZRwWZdh8rpBAjDNb+VdTnZmxi3lEoLXaDZ+5U57ivTN3xccDjXx/prFmGXUGainrCAKLkEfXfvlUqPRW6+zJ8PapG/6IP6EyKFBGodPbx/kf7OKQv8kIqjbZ7oIHBMVDhngqE9LJylFyG2RCJ/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=i6LE1DnB; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="i6LE1DnB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=w7jqnS7OBTA+d4QuKrNT8Pd7dlS3a5Xff/AbP3BuozM=; b=i6LE1DnB6mLAlLWrtb/VCrLmj6
	pCj7WtAOP75P+8/OrzdHZgx10P8fenaZc3ehZ5oObAw1fJwy8lV5iU9AjzJ3vFIswE6HHpNqcWooE
	wFRRWY/P/QWF0qKWrNky0oEtDDICSLfrq8hMAYnvrDIElsscAMqBmasYq1uWT/U8DDsMrTAj624SP
	GCjbQK5JA5hj7Ht3Jxq12c8bKYEXTaLnRpp3ddQ1pSckID3G57lac7ROQX6pS2hZ1JciKVCisxC1k
	grY5DWrxrPe7cUYStv8yVoNh/QCuoyh1HA106AHYFYMWgLNDhEjIJXD56lyv0XQZL0HT3ehNPTNBX
	+JzTuJBw==;
Received: from 201-27-133-184.dsl.telesp.net.br ([201.27.133.184] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1v0pe3-00Fwtc-PO; Tue, 23 Sep 2025 01:08:32 +0200
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: platform-driver-x86@vger.kernel.org
Cc: irenic.rajneesh@gmail.com,
	david.e.box@intel.com,
	xi.pardee@linux.intel.com,
	kernel-dev@igalia.com,
	kernel@gpiccoli.net,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: [PATCH 2/4] platform/x86/intel/pmc: Dump raw SLP_Sx_DBG registers and distinguish between them
Date: Mon, 22 Sep 2025 19:52:33 -0300
Message-ID: <20250922230812.1584253-3-gpiccoli@igalia.com>
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

Right now, SLP_Sx_DBG registers output only show matching bits according
to the register maps and do not distinguish between the different offsets
(SLP_S0_DBG, SLP_S1_DBG, etc).

Let's dump the full register read (like the LPM output does), and
show the id of register to help matching with specs.

This should bring no functional change, the goal is only to improve
reading and allow full comparison between raw register values.

Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---
 drivers/platform/x86/intel/pmc/core.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index d040290e80ff..c8ce5d6ec30c 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -226,24 +226,31 @@ static void pmc_core_slps0_display(struct pmc *pmc, struct device *dev,
 	const struct pmc_bit_map **maps = pmc->map->slps0_dbg_maps;
 	const struct pmc_bit_map *map;
 	int offset = pmc->map->slps0_dbg_offset;
+	u8 cnt = 0;
 	u32 data;
 
 	while (*maps) {
 		map = *maps;
 		data = pmc_core_reg_read(pmc, offset);
 		offset += 4;
+
+		if (dev)
+			dev_info(dev, "\nSLP_S%u_DBG:\t0x%x\n", cnt, data);
+		if (s)
+			seq_printf(s, "\nSLP_S%u_DBG:\t0x%x\n", cnt, data);
 		while (map->name) {
 			if (dev)
-				dev_info(dev, "SLP_S0_DBG: %-32s\tState: %s\n",
-					map->name,
+				dev_info(dev, "SLP_S%u_DBG: %-32s\tState: %s\n",
+					cnt, map->name,
 					data & map->bit_mask ? "Yes" : "No");
 			if (s)
-				seq_printf(s, "SLP_S0_DBG: %-32s\tState: %s\n",
-					   map->name,
+				seq_printf(s, "SLP_S%u_DBG: %-32s\tState: %s\n",
+					   cnt, map->name,
 					   data & map->bit_mask ? "Yes" : "No");
 			++map;
 		}
 		++maps;
+		++cnt;
 	}
 }
 
-- 
2.50.1

