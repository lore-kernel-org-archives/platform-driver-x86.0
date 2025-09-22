Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D48028B415
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Sep 2025 23:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758582512; cv=none; b=MAyQ9NWu9x/AhtHe4f5PfNzqRFi28ZoJkjPaAAv2hW4OzOynqDpE7dM5qbX9ZWwmRihFTM2sYjt9GJeltAfPXPUlf8ACmMf9CQNh17S6p4SFgS3WpsM78lwbe+EBsiRpUWuw7IMg7bPh9H4fizFve7v+fa80tEpwbLgGgAWix5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758582512; c=relaxed/simple;
	bh=4mXWxqCiEoTiyEd1W3GqWC49VcrRKYQ5oYwYrhw+KPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YhR0rJSrADrWNVCehJexHtQxzvZtIXPta5edlqu3+/rGub+PYhC187hHyIRlqd78Kob/EfcJ4am+zzXIAGal0FJhcreEsBXLPAYG1HNZaiW2L96zozh0wUptvPOepvhasrCw7qY3PzVfuhTDtPtcW/ckdDzt+VOx6kQ9YYL3yCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=i0uIgiGl; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="i0uIgiGl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=CHRDczrgMFgXet/1IJDueLwj9EoyHXkwlUQe6mUT6TQ=; b=i0uIgiGlpxCWo6WAkG8h86SA8P
	2X29947/F/Xtu1KUefdZPJ+EDsESGa2SRDdt7h8nIP39UqaTEjo8zAdsQhQLqWM+0t55+V9RHFSWV
	B4sp/UZzO6ZXzAnPTC26z3R8mXldWSFCih1MX3CM1qQY5fP6qdPswcon0Hc+LG56cUqJ40zyI0eYj
	dCwbUlqpQPPc5KkWe/lYTJ7dRi+x3NvWGhjxMm6V2r1RpSrN5OAE+0U4oagPzq6ue8sPTflh0sGYJ
	fh++6hEc+MUOvyqDpeSRzutiq77fW0VemObd8whMMzSKTrHDTzufk5T+CjQMk5jv2CltPW4f+TTpI
	K2Op6rBA==;
Received: from 201-27-133-184.dsl.telesp.net.br ([201.27.133.184] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1v0pdx-00FwtS-RP; Tue, 23 Sep 2025 01:08:26 +0200
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: platform-driver-x86@vger.kernel.org
Cc: irenic.rajneesh@gmail.com,
	david.e.box@intel.com,
	xi.pardee@linux.intel.com,
	kernel-dev@igalia.com,
	kernel@gpiccoli.net,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: [PATCH 1/4] platform/x86/intel/pmc: Fix typo on CNP register name (and clarify comment)
Date: Mon, 22 Sep 2025 19:52:32 -0300
Message-ID: <20250922230812.1584253-2-gpiccoli@igalia.com>
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

On SLP_S0_DBG register mapping, s/ALST/ASLT, as in "Aggregated System
Latency" [0]. Also, just clarify that the PMC register offsets are not
only for Cannon Lake, since many other uarchs are using them.

[0] One can check in code, other places use ASLT, but also refer
to the following spec:
Intel 500 Series Chipset Family PCH datasheet - Vol 2
(Doc ID: 636174). Link (from Sep/2025):
www.intel.com/content/www/us/en/content-details/636174/intel-500-series-chipset-family-platform-controller-hub-pch-datasheet-volume-2-of-2.html

Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---
 drivers/platform/x86/intel/pmc/cnp.c  | 2 +-
 drivers/platform/x86/intel/pmc/core.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/cnp.c b/drivers/platform/x86/intel/pmc/cnp.c
index efea4e1ba52b..cf8927ed48db 100644
--- a/drivers/platform/x86/intel/pmc/cnp.c
+++ b/drivers/platform/x86/intel/pmc/cnp.c
@@ -142,7 +142,7 @@ static const struct pmc_bit_map cnp_slps0_dbg2_map[] = {
 	{"CNV_VNN_REQ_ACT",	BIT(10)},
 	{"NPK_VNNON_REQ_ACT",	BIT(11)},
 	{"PMSYNC_STATE_IDLE",	BIT(12)},
-	{"ALST_GT_THRES",	BIT(13)},
+	{"ASLT_GT_THRES",	BIT(13)},
 	{"PMC_ARC_PG_READY",	BIT(14)},
 	{}
 };
diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/intel/pmc/core.h
index 4a94a4ee031e..85677bdc3b1c 100644
--- a/drivers/platform/x86/intel/pmc/core.h
+++ b/drivers/platform/x86/intel/pmc/core.h
@@ -153,7 +153,7 @@ enum ppfear_regs {
 #define SPT_PMC_VRIC1_SLPS0LVEN			BIT(13)
 #define SPT_PMC_VRIC1_XTALSDQDIS		BIT(22)
 
-/* Cannonlake Power Management Controller register offsets */
+/* Cannonlake (and others) Power Management Controller register offsets */
 #define CNP_PMC_SLPS0_DBG_OFFSET		0x10B4
 #define CNP_PMC_PM_CFG_OFFSET			0x1818
 #define CNP_PMC_SLP_S0_RES_COUNTER_OFFSET	0x193C
-- 
2.50.1

