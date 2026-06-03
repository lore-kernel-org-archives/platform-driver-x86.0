Received: from smtp-190a.mail.infomaniak.ch (smtp-190a.mail.infomaniak.ch [185.125.25.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7055C3ED3BC
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Jun 2026 03:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780456597; cv=none; b=bEmjx8QsXFCXyP1pgJlVx0qNqgVnSP25QI5j1OtUZUBcT4MwNsMdfzn71BJyRQTWsI4OyKYkF9Rt8N34oD6eJtzkUeP8E2HgHfsjPbQFCzgvv/SZS57R2zRaWJ+8RzDw0cZOLKNjHnsUQxp43EiUDLPHhdv3sRU5ZzupB+d8Q1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780456597; c=relaxed/simple;
	bh=iEjA2MjKSCB7UYuBfpm7ZoN6u/xw2LXb42wJfvgR3/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SqvQdvabrxbljfYKTLOvy7DH4md0SELMwbKNuQkKZ66Qkcc4+v9tKziYrr1xAFeRrl9JY4zMskP6BXcpmV9TUYxATzvium+88qa+I73j++DD1EAwf38cu+I3mjMdmy/eO7CrQEwewSyTXmivoiOM32dN5cFVT+i5Yj5x8DBTCzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=B2kGzEDh; arc=none smtp.client-ip=185.125.25.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="B2kGzEDh"
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gVXls08mDzBt5
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Jun 2026 05:11:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1780456280;
	bh=Mx0oPR9bcP29fTc5WI0tJYSbBL/td4L1Mh46SbEbR5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B2kGzEDh/HIRFLpf+X19zTY7k3m3sQfei3dMulLLhaiqXNpfaZ+3uFGJHnYw/hUr3
	 i7wIM7f2Dq4lS9zr1kVhDkSAv9nB40WM2YmLgxOX9IJuHY4LPBplUxSl9WSA/QvG/W
	 13ApwIH5iz2pdLOncpId2LLelBSZtChoZrH5GQjUsZBjQZbbe/2lMe0KfSIv9dlKmE
	 XEsOjF6uqgRc2kW3uMInIirqm6yklVzO63/Ujkp92yk0gG0qgDzMRWEDJXLha2vyjF
	 lT785sDM0PS7i293uJbHMSOIfcsqgdGIBLIiADFTbq+B2qSRFT8cta7c5Efzqe1bQD
	 fQELIDHixWCPQ==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4gVXlr2B5Jz32b
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Jun 2026 05:11:20 +0200 (CEST)
Received: from unknown by spiderdemon.horst.lan (DragonFly Mail Agent v0.13);
	Wed, 03 Jun 2026 05:11:19 +0200
From: Daniel Gibson <daniel@gibson.sh>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mario Limonciello <superm1@kernel.org>
Cc: Daniel Gibson <daniel@gibson.sh>,
	stable@vger.kernel.org
Subject: [PATCH v3 RESEND 1/5] platform/x86/amd/pmc: Check for intermediate wakeup in function
Date: Wed,  3 Jun 2026 05:11:06 +0200
Message-ID: <20260603031110.345815-2-daniel@gibson.sh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260603031110.345815-1-daniel@gibson.sh>
References: <20260603031110.345815-1-daniel@gibson.sh>
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
index cae3fcafd4d7..2b9e5730170a 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -598,6 +598,19 @@ static int amd_pmc_verify_czn_rtc(struct amd_pmc_dev *pdev, u32 *arg)
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
@@ -632,11 +645,9 @@ static void amd_pmc_s2idle_prepare(void)
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

