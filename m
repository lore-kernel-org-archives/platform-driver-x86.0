Received: from smtp-8fac.mail.infomaniak.ch (smtp-8fac.mail.infomaniak.ch [83.166.143.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909602475CF
	for <platform-driver-x86@vger.kernel.org>; Sat,  9 May 2026 01:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778290278; cv=none; b=sKk3J1UJ5oFDwY/D4aEnObhZVJi3gx7vva+V2btXiOr12ombaWigtI5DIrVJoWFMaJpsrQTlnD0K65r++Ab4xz8W7L78po7uZAtHaoQBz3wNX4wa8HUR0S9jUmkbdu5P8brZ7lVCjObIRd2xzbgY1TYi03SNKMs0309HD82AST4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778290278; c=relaxed/simple;
	bh=D9UXndHF/UwVLuiI0rKpnyiwtptt5MZ/YvPeMoXLZZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oCzSbkAzq7drNc4qI+otSXX0eKIHBYCkl43xIfC/MfpV49+lwAqZG1G5OcafRCys+tgeQlEwOjdFAoaZFh6LBAbLgC79TwI7LOH6LKhZmTkxx2NA1ug9OO5hk11GQQp7NsqjsXPoKz+/XFHgxnSzeeDX6FsRPXJzFYG2+PP2ADE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=PsxAZAHf; arc=none smtp.client-ip=83.166.143.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="PsxAZAHf"
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gC7jn3jnbz5yc
	for <platform-driver-x86@vger.kernel.org>; Sat,  9 May 2026 03:31:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1778290269;
	bh=WZfkKrkFfW2y6joVDAkKUKO6s0ptkI5sHCXMJuL/gN8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PsxAZAHfi8nlnfSRuTe2czfuHTXTAj2wjAzZVtVHB+RNYeF6CAZM31EacobvNukU7
	 2SiIWx7VOIFWjFVBwoucGK2YVnCJCo94RxE0znfyJlR+013TbRQp88ie3i5/bcCZLv
	 GL+TqIbywZYIdBICa+pI3b8UTILNhsJvGwr28JVkN5DtKxEfa7WBEU9KgFHRvmWiZN
	 WSG/kiP5S5RL6zNlPj+6dv3gNy8b5rVVXpAPmEoW6Fje10P33TPbCZBpmQZ3jQs1jA
	 j9MVJ6+g3nsqtH/uy9ZAttYmnXq8U4wK/MdQfymQ59RfElW6SPhL2cFz12JbFu2sO1
	 2WN7b3SvRNQ4Q==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4gC7jn0VxqzN58
	for <platform-driver-x86@vger.kernel.org>; Sat,  9 May 2026 03:31:09 +0200 (CEST)
Received: from unknown by spiderdemon.horst.lan (DragonFly Mail Agent v0.13);
	Sat, 09 May 2026 03:31:08 +0200
From: Daniel Gibson <daniel@gibson.sh>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Daniel Gibson <daniel@gibson.sh>
Subject: [PATCH v2 1/5] platform/x86/amd/pmc: Check for intermediate wakeup in function
Date: Sat,  9 May 2026 03:31:00 +0200
Message-ID: <20260509013105.816339-2-daniel@gibson.sh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260509013105.816339-1-daniel@gibson.sh>
References: <20260509013105.816339-1-daniel@gibson.sh>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

This slightly refactors code introduced by the
"pmc: Require at least 2.5 seconds between HW sleep cycles" commit
to allow adding different conditions for that delay later.

References: 9f5595d5f03f ("platform/x86/amd: pmc: Require at least 2.5 seconds between HW sleep cycles")
Signed-off-by: Daniel Gibson <daniel@gibson.sh>
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

