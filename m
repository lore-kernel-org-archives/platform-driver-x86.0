Received: from smtp-42ab.mail.infomaniak.ch (smtp-42ab.mail.infomaniak.ch [84.16.66.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3758727FB37
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 15:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781190833; cv=none; b=hJWc/9dFHVERDTeXoBs4/xTV94+rz0G9+ae+cm3H3wQPazH8KWACaGiI2FoZmIlFH8iSazDnrMMEFL4lX9zEfbwybo532oZsSEQeCFAxIxhiFc7buXlvXgwIJMzKVF7ezmdFnNkv0uu9W5bD+oFzasbxIeQNZA8v01K9f7G/zZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781190833; c=relaxed/simple;
	bh=ldEjmRTtGXtvqQM36rVtzfGUKHm6h3b8k6Yyh6EYEKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QPb+09NQCiTKPGsT46nuqEUk1qki39lpO4GtfhurSDoxodXqtJZPDPE65JeSQ+Ag2F+IV8o2h58wEr8Q7QKltI6qZhZHwWluDQ7h3h/hhNVv2MHElnT4ctrdtzMi8O22utntb+0apDSeaegOqTcQgfqY0GqNkhX9ODZwgfERdkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=gnfYbWkr; arc=none smtp.client-ip=84.16.66.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="gnfYbWkr"
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gbmC10Vmmzpyc
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 17:04:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1781190268;
	bh=ddd/C3MV0f6jniH/HHXw2Qim2MIZ2eDJT+LOTz2LunY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gnfYbWkrJJFYYW63jBZL0UpANyNmXmDC8rsv1jBoFIFTLmw8da0RGB3U6Lk9hGm5O
	 qPIKJHygEqus1PBvCwFzhPw+DXTvGvMkjSiG6POxUJ/L/aij5N5vKpVitCbIZf3SEw
	 JOhF2i5y4Z8RDmoaeuNVD+xyLDjctP91ZOPMj5jRi/nhiDJWNbIr0KNUvEhYm47yWi
	 ZdGqIbLI5L0S4jUh2r5q5N19uDdedPcsiIDwXTX5hyZV3/5DUx5Y+HkmzZ4UAp0bBM
	 RtmJTIrUbu9Kuu9qAreKANFPmdotPh3lXJZspK8L1g5lctnFJ3ibT5ivSnkE1yjXUU
	 lTOMfrHIdQaGw==
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4gbmC04DRFzB3
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 17:04:28 +0200 (CEST)
Received: from unknown by spiderdemon.horst.lan (DragonFly Mail Agent v0.13);
	Thu, 11 Jun 2026 17:04:28 +0200
From: Daniel Gibson <daniel@gibson.sh>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mario Limonciello <superm1@kernel.org>
Cc: Daniel Gibson <daniel@gibson.sh>,
	stable@vger.kernel.org
Subject: [PATCH v6 1/4] platform/x86/amd/pmc: Check for intermediate wakeup in function
Date: Thu, 11 Jun 2026 17:04:23 +0200
Message-ID: <20260611150426.3683372-2-daniel@gibson.sh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260611150426.3683372-1-daniel@gibson.sh>
References: <20260611150426.3683372-1-daniel@gibson.sh>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

Refactor code introduced by commit 9f5595d5f03f ("pmc: Require at
least 2.5 seconds between HW sleep cycles") to allow adding different
conditions for that delay in an upcoming change.

Signed-off-by: Daniel Gibson <daniel@gibson.sh>
Cc: stable@vger.kernel.org
---
 drivers/platform/x86/amd/pmc/pmc.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index ccb37383b337..25509099a958 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -670,6 +670,19 @@ static int amd_pmc_verify_czn_rtc(struct amd_pmc_dev *pdev, u32 *arg)
 	return rc;
 }
 
+static bool amd_pmc_intermediate_wakeup_need_delay(struct amd_pmc_dev *pdev)
+{
+	/*
+	 * Starting a new HW sleep cycle right after waking from one
+	 * can cause electrical problems triggering the over voltage protection.
+	 * That is avoided by delaying the next suspend a bit, see also
+	 * https://lore.kernel.org/all/20250414162446.3853194-1-superm1@kernel.org/
+	 */
+	struct smu_metrics table;
+
+	return get_metrics_table(pdev, &table) == 0 && table.s0i3_last_entry_status;
+}
+
 static void amd_pmc_s2idle_prepare(void)
 {
 	struct amd_pmc_dev *pdev = &pmc;
@@ -702,11 +715,9 @@ static void amd_pmc_s2idle_prepare(void)
 static void amd_pmc_s2idle_check(void)
 {
 	struct amd_pmc_dev *pdev = &pmc;
-	struct smu_metrics table;
 	int rc;
 
-	/* Avoid triggering OVP */
-	if (!get_metrics_table(pdev, &table) && table.s0i3_last_entry_status)
+	if (amd_pmc_intermediate_wakeup_need_delay(pdev))
 		msleep(2500);
 
 	/* Dump the IdleMask before we add to the STB */
-- 
2.48.1

