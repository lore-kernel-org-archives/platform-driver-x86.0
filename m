Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9972FD1CF
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Sep 2025 23:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758582531; cv=none; b=YXXLEkSddqYoWZPiSIJiAhsQQ+gzXQmnDgA+1/eWp2IZd4BjcjZDXi7SloH5yd/R6wipAFVKG1iJf21ziJOpY4sY08j0GKbNRC8j5kG1kkrvV5PGtWw3D04TvgD/onVPOn9LonyofM4X8FWFUt/K/Z4jZVHnWN5hxIoFsC6DJ0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758582531; c=relaxed/simple;
	bh=6WZmnP6Xbx7OIw97eeZ045HgFTMWo8aV+QjnpOOaqCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YjhpEamwnUZNeL06bT8ZbWRFXxOk4vIKM5O72/xRJrlBjELjcOCQtsw04IfBm9fy9ZPzGCz7cXzd6TQgWS+HVeotTIfsIYBtYEiWj/VhLaFM/Vr7XjWdKFebm9VzhZX5hTHtYz7S/19ge0zZJLhxgeuxeORKHvfuKnF5h1mOB6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=pvvSqZ1S; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="pvvSqZ1S"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=9SlPNO+q0L6DxpL02yW6DvYFd93i+XIiFKx+gwY10f0=; b=pvvSqZ1SyIrIhloGx8uWkTPvHU
	o9YFpQIz/2EJF/nLmiixeq5CKM33WuLCdQBoGHur5UcuEfor3nwXQU70824AjPGNX3O5AFZ12fiux
	yAEtUcFAwKULmG88RTom4dhmYUCctUbYx7blWI4XF0OBIBU75hDBZgUv59LFEw3d6X3ejSy+E84va
	iggm/tLaapsggyoW4U+bn5jjUIk4A6mgWs0KXdsPvoofiG/JW07NVOxTX1Zlmh/lc5pRXVtezxhG9
	2dwWGIXX9q+eY8tbsXVhzmMB3LP4q0hBQ+585eDj4mMO9jV9goy6xt+m1dm3bls9Gfx2MAk8PWb15
	iJ4qS0aw==;
Received: from 201-27-133-184.dsl.telesp.net.br ([201.27.133.184] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1v0peI-00FwuH-U3; Tue, 23 Sep 2025 01:08:47 +0200
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: platform-driver-x86@vger.kernel.org
Cc: irenic.rajneesh@gmail.com,
	david.e.box@intel.com,
	xi.pardee@linux.intel.com,
	kernel-dev@igalia.com,
	kernel@gpiccoli.net,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: [PATCH 4/4][RFC] platform/x86/intel/pmc: Re-add SLP_S0_DBG register dump on Tiger Lake
Date: Mon, 22 Sep 2025 19:52:35 -0300
Message-ID: <20250922230812.1584253-5-gpiccoli@igalia.com>
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

Commit a018e28f0880 ("platform/x86: intel_pmc_core: Remove slp_s0 attributes from tgl_reg_map")
removed the SLP_Sx_DBG register dump on suspend/resume s0ix-related failures
on Tiger Lake. The mentioned reason was related to potential sub-states.

Let's re-enable the SLP_Sx_DBG register dumping on failures, also fixing
the register mapping (according to the spec[0]) and adding it also to
Tiger Lake H, as a means to improve debug of suspend/resume failures .

If we do have the sub-states, but not in all cases, better to have some
platforms with more debug information than entirely suppress this info.

[0] Refer to: "Intel 500 Series Chipset Family PCH datasheet - Vol 2"
(Doc ID: 636174). Link (from Sep/2025):
www.intel.com/content/www/us/en/content-details/636174/intel-500-series-chipset-family-platform-controller-hub-pch-datasheet-volume-2-of-2.html

Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---
 drivers/platform/x86/intel/pmc/tgl.c | 48 ++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/platform/x86/intel/pmc/tgl.c b/drivers/platform/x86/intel/pmc/tgl.c
index 02e731ed3391..cdabe9b5c20b 100644
--- a/drivers/platform/x86/intel/pmc/tgl.c
+++ b/drivers/platform/x86/intel/pmc/tgl.c
@@ -185,12 +185,58 @@ static const struct pmc_bit_map *tgl_lpm_maps[] = {
 	NULL
 };
 
+/*
+ * The following SLP_S0_DBG register mappings are based on the
+ * "Intel 500 Series Chipset Family PCH datasheet - Vol 2"
+ * specification (Doc ID: 636174).
+ */
+
+static const struct pmc_bit_map tgl_slps0_dbg0_map[] = {
+	{"AUDIO_D3",		BIT(0)},
+	{"OTG_D3",		BIT(1)},
+	{"XHCI_D3",		BIT(2)},
+	{"LPIO_D3",		BIT(3)},
+	{"SATA_D3",		BIT(5)},
+	{}
+};
+
+static const struct pmc_bit_map tgl_slps0_dbg1_map[] = {
+	{"USB2_PLL_OFF",	BIT(1)},
+	{"AUDIO_PLL_OFF",	BIT(2)},
+	{"MAIN_PLL_OFF",	BIT(4)},
+	{"XOSC_OFF",		BIT(5)},
+	{"PCIE_CLKREQS_OFF",	BIT(7)},
+	{"AUDIO_ROSC_OFF",	BIT(8)},
+	{}
+};
+
+static const struct pmc_bit_map tgl_slps0_dbg2_map[] = {
+	{"HSIO_CORE_GATED",	BIT(0)},
+	{"CSME_GATED",		BIT(1)},
+	{"GBE_NO_LINK",		BIT(4)},
+	{"PCIE_LOW_POWER",	BIT(6)},
+	{"ISH_VNN_REQ_ACT",	BIT(8)},
+	{"CNV_VNN_REQ_ACT",	BIT(10)},
+	{"PMSYNC_STATE_IDLE",	BIT(12)},
+	{"ASLT_GT_THRES",	BIT(13)},
+	{}
+};
+
+const struct pmc_bit_map *tgl_slps0_dbg_maps[] = {
+	tgl_slps0_dbg0_map,
+	tgl_slps0_dbg1_map,
+	tgl_slps0_dbg2_map,
+	NULL
+};
+
 static const struct pmc_reg_map tgl_reg_map = {
 	.pfear_sts = ext_tgl_pfear_map,
 	.slp_s0_offset = CNP_PMC_SLP_S0_RES_COUNTER_OFFSET,
+	.slps0_dbg_maps = tgl_slps0_dbg_maps,
 	.slp_s0_res_counter_step = TGL_PMC_SLP_S0_RES_COUNTER_STEP,
 	.ltr_show_sts = cnp_ltr_show_map,
 	.msr_sts = msr_map,
+	.slps0_dbg_offset = CNP_PMC_SLPS0_DBG_OFFSET,
 	.ltr_ignore_offset = CNP_PMC_LTR_IGNORE_OFFSET,
 	.regmap_length = CNP_PMC_MMIO_REG_LEN,
 	.ppfear0_offset = CNP_PMC_HOST_PPFEAR0A,
@@ -213,9 +259,11 @@ static const struct pmc_reg_map tgl_reg_map = {
 static const struct pmc_reg_map tgl_h_reg_map = {
 	.pfear_sts = ext_tgl_pfear_map,
 	.slp_s0_offset = CNP_PMC_SLP_S0_RES_COUNTER_OFFSET,
+	.slps0_dbg_maps = tgl_slps0_dbg_maps,
 	.slp_s0_res_counter_step = TGL_PMC_SLP_S0_RES_COUNTER_STEP,
 	.ltr_show_sts = cnp_ltr_show_map,
 	.msr_sts = msr_map,
+	.slps0_dbg_offset = CNP_PMC_SLPS0_DBG_OFFSET,
 	.ltr_ignore_offset = CNP_PMC_LTR_IGNORE_OFFSET,
 	.regmap_length = CNP_PMC_MMIO_REG_LEN,
 	.ppfear0_offset = CNP_PMC_HOST_PPFEAR0A,
-- 
2.50.1

