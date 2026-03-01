Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9619F2BD0B;
	Sun,  1 Mar 2026 01:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328061; cv=none; b=ccdm3+ZSzOBFibwlf0791fE+fukW6s/biPFQ8lnZPempxbBNeQzKQBd4xDp+mT7+Kh1mFly5iZjqwojaviLExEs09y3kJgmFz6bQc25RFYuK5VlyQIZy9hnSmSnzbziq4T0kzkp3iwl16QgNVpM7kqK9mQ0zFbSFZt1JhpbU1b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328061; c=relaxed/simple;
	bh=QPBUOxooTXjc7BFLpaWWMhkY29tmLr0IGVWr7sH6sUo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iEoMTNfSYsviAjJBYLuP/DmjdW2X+eOd/fL1XZA0uV4Zyj2x4lmAOhRXnYijuBD05vZKpqDATcxiUnEGtgpIuFMfZTXYr2UrJ4P1q1vhMNa2zL3UQNFvv/z2Oyp1asmal1e6v+WLIscwR6k/lI1QhLqBaX7P5RsLR5CzUCbOA3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t7NmNbb6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t7NmNbb6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 062FCC19421;
	Sun,  1 Mar 2026 01:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328061;
	bh=QPBUOxooTXjc7BFLpaWWMhkY29tmLr0IGVWr7sH6sUo=;
	h=From:To:Cc:Subject:Date:From;
	b=t7NmNbb6TC1yzLGa+4P1spj1mgjrNyKdgoE/n9B5kj74oA605NewiJmlOF1hYEnlE
	 yPxQkOwhb5cB6q0BMngHDUhwMFnFxSAvmvkhkW0F5kwr1rK2tUaGSOjsubYtoP8TGB
	 i+UmC8TCvIIAqjsVchxBA0kSWfOz4M9QZeiTbEjsiLb33aVPDZ7DF/yqKZ5GDre0oL
	 s0YTMXW1KuVXAapbf6NOl5Vas6sbaVzkGw5WpenvW47vulwkWABCFX5n7rG7vl+mju
	 Qi2qubetOs+tcWGC9kpv6YK62tkMMjQsaf70QxHAngM/g+lXZU1NkAthMqFQ03HMQa
	 sZPHvCZmRTPfg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Subject: FAILED: Patch "platform/x86: ISST: Store and restore all domains data" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:20:59 -0500
Message-ID: <20260301012059.1676781-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From dc7901b5a1563a9c9eb29b3b0b0dac3162065cd8 Mon Sep 17 00:00:00 2001
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Date: Tue, 6 Jan 2026 22:02:56 -0800
Subject: [PATCH] platform/x86: ISST: Store and restore all domains data
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The suspend/resume callbacks currently only store and restore the
configuration for power domain 0. However, other power domains may also
have modified configurations that need to be preserved across suspend/
resume cycles.

Extend the store/restore functionality to handle all power domains.

Fixes: 91576acab020 ("platform/x86: ISST: Add suspend/resume callbacks")
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
CC: stable@vger.kernel.org
Link: https://patch.msgid.link/20260107060256.1634188-3-srinivas.pandruvada@linux.intel.com
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 .../intel/speed_select_if/isst_tpmi_core.c    | 54 +++++++++++--------
 1 file changed, 33 insertions(+), 21 deletions(-)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
index f587709ddd473..13b11c3a2ec4e 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
@@ -1723,55 +1723,67 @@ EXPORT_SYMBOL_NS_GPL(tpmi_sst_dev_remove, "INTEL_TPMI_SST");
 void tpmi_sst_dev_suspend(struct auxiliary_device *auxdev)
 {
 	struct tpmi_sst_struct *tpmi_sst = auxiliary_get_drvdata(auxdev);
-	struct tpmi_per_power_domain_info *power_domain_info;
+	struct tpmi_per_power_domain_info *power_domain_info, *pd_info;
 	struct oobmsm_plat_info *plat_info;
 	void __iomem *cp_base;
+	int num_resources, i;
 
 	plat_info = tpmi_get_platform_data(auxdev);
 	if (!plat_info)
 		return;
 
 	power_domain_info = tpmi_sst->power_domain_info[plat_info->partition];
+	num_resources = tpmi_sst->number_of_power_domains[plat_info->partition];
 
-	cp_base = power_domain_info->sst_base + power_domain_info->sst_header.cp_offset;
-	power_domain_info->saved_sst_cp_control = readq(cp_base + SST_CP_CONTROL_OFFSET);
-
-	memcpy_fromio(power_domain_info->saved_clos_configs, cp_base + SST_CLOS_CONFIG_0_OFFSET,
-		      sizeof(power_domain_info->saved_clos_configs));
+	for (i = 0; i < num_resources; i++) {
+		pd_info = &power_domain_info[i];
+		if (!pd_info || !pd_info->sst_base)
+			continue;
 
-	memcpy_fromio(power_domain_info->saved_clos_assocs, cp_base + SST_CLOS_ASSOC_0_OFFSET,
-		      sizeof(power_domain_info->saved_clos_assocs));
+		cp_base = pd_info->sst_base + pd_info->sst_header.cp_offset;
+		pd_info->saved_sst_cp_control = readq(cp_base + SST_CP_CONTROL_OFFSET);
+		memcpy_fromio(pd_info->saved_clos_configs, cp_base + SST_CLOS_CONFIG_0_OFFSET,
+			      sizeof(pd_info->saved_clos_configs));
+		memcpy_fromio(pd_info->saved_clos_assocs, cp_base + SST_CLOS_ASSOC_0_OFFSET,
+			      sizeof(pd_info->saved_clos_assocs));
 
-	power_domain_info->saved_pp_control = readq(power_domain_info->sst_base +
-						    power_domain_info->sst_header.pp_offset +
-						    SST_PP_CONTROL_OFFSET);
+		pd_info->saved_pp_control = readq(pd_info->sst_base +
+						  pd_info->sst_header.pp_offset +
+						  SST_PP_CONTROL_OFFSET);
+	}
 }
 EXPORT_SYMBOL_NS_GPL(tpmi_sst_dev_suspend, "INTEL_TPMI_SST");
 
 void tpmi_sst_dev_resume(struct auxiliary_device *auxdev)
 {
 	struct tpmi_sst_struct *tpmi_sst = auxiliary_get_drvdata(auxdev);
-	struct tpmi_per_power_domain_info *power_domain_info;
+	struct tpmi_per_power_domain_info *power_domain_info, *pd_info;
 	struct oobmsm_plat_info *plat_info;
 	void __iomem *cp_base;
+	int num_resources, i;
 
 	plat_info = tpmi_get_platform_data(auxdev);
 	if (!plat_info)
 		return;
 
 	power_domain_info = tpmi_sst->power_domain_info[plat_info->partition];
+	num_resources = tpmi_sst->number_of_power_domains[plat_info->partition];
 
-	cp_base = power_domain_info->sst_base + power_domain_info->sst_header.cp_offset;
-	writeq(power_domain_info->saved_sst_cp_control, cp_base + SST_CP_CONTROL_OFFSET);
-
-	memcpy_toio(cp_base + SST_CLOS_CONFIG_0_OFFSET, power_domain_info->saved_clos_configs,
-		    sizeof(power_domain_info->saved_clos_configs));
+	for (i = 0; i < num_resources; i++) {
+		pd_info = &power_domain_info[i];
+		if (!pd_info || !pd_info->sst_base)
+			continue;
 
-	memcpy_toio(cp_base + SST_CLOS_ASSOC_0_OFFSET, power_domain_info->saved_clos_assocs,
-		    sizeof(power_domain_info->saved_clos_assocs));
+		cp_base = pd_info->sst_base + pd_info->sst_header.cp_offset;
+		writeq(pd_info->saved_sst_cp_control, cp_base + SST_CP_CONTROL_OFFSET);
+		memcpy_toio(cp_base + SST_CLOS_CONFIG_0_OFFSET, pd_info->saved_clos_configs,
+			    sizeof(pd_info->saved_clos_configs));
+		memcpy_toio(cp_base + SST_CLOS_ASSOC_0_OFFSET, pd_info->saved_clos_assocs,
+			    sizeof(pd_info->saved_clos_assocs));
 
-	writeq(power_domain_info->saved_pp_control, power_domain_info->sst_base +
-				power_domain_info->sst_header.pp_offset + SST_PP_CONTROL_OFFSET);
+		writeq(pd_info->saved_pp_control, power_domain_info->sst_base +
+		       pd_info->sst_header.pp_offset + SST_PP_CONTROL_OFFSET);
+	}
 }
 EXPORT_SYMBOL_NS_GPL(tpmi_sst_dev_resume, "INTEL_TPMI_SST");
 
-- 
2.51.0




