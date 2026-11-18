Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795028476;
	b=1dDkuAPP+vKj4J8F8EdmPZDBP5nTwd+wbQndAxQNSgmNceG2bkHeoXqGI5DpTgwvDS+f
	 +5fH1StqjRHznqjA7nYSxEJx2IUNhmDL6lJUotradQsYymG81pQGlmDABlOSDFtYSgMrW
	 qdTbzMdd/bY1uSWAIqSAJqLD1KcpM2l4b/0aAnNjS+Lpq3FdB9gRe0MJYdyxDRDNmVPdp
	 uTi0ixWn1/qqHF0uD7tzeN61RjgLe5fNsKTBk6bnxI7NXLjoygY1lL5ra4TG+MJ52JkHB
	 NpuhGjQebukKkjUmOtbZYrVplF4L6lSC1fHS+KrxK4WMt26sIXlbxdNI/neJquGb2RQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028476;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=nYPWjaPBO7quuT9FqR1Q5KG/W9mmCpffEhERVdwNsDY=;
	b=41OdzN0hLoEnCBqkLGwLV/Dq3VdP9GmboMBOt6J9LE7K8m6Pwtx3VhCtunpq4O4loWyK
	 tt8Ol8fto6+2oc8x81DdQdwdU48byJ/+zGXnDo5kA8yoEZXcF1kRKBJDu1IUq+Di4bVMs
	 ldnqd/FUVG11bgW5BngVIm5w9TLtMYP18zwvw9/Ybp/IfyGNI0178t0C0Ete9iDvurvLF
	 XdO+h3grh4wtusECSjpflkUtMXd5PJZAFNu+EbTI64zFrlGJqyFkUdDfSBfMtw1UpdSfd
	 pqonei2eoOl7c0ga2+hWd4VaMwRkHUHPGCTpGsJ7k9dlgilcex+9yxNPcQGiJjkrl0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=IatTcqdP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BD7606A325;
	Wed, 18 Nov 2026 19:01:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8BD7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=IatTcqdP
ARC-Seal: i=1; a=rsa-sha256; t=1795028448; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mrccswhW5EEmenv8zGxyvB9e9ZWL+H99AfCE6faVY8KC61K144HNE8N/sxqBfbckrw4FMs5YHiflK1nycrXA62xv65RtSzANR++k82B0smIfXVsgJTrwJK6OJ24UqLCDdyXYJX5QlS68bhN2opIdmBjU9kjU5G+F+0hCOpDSccg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795028448; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nYPWjaPBO7quuT9FqR1Q5KG/W9mmCpffEhERVdwNsDY=; 
	b=VveIuxoAzTsOA2nRyFcMH8bFjfPBo3nTqc9YPNy4EIuRZnZc5W+VtkjWQKrXfc62xL3h3QiAn/VMEnYH2yG2eiuyWqAU8cvktrbr+X83snR5h07qSEs8Mb3sy1IpzuHEIvIp0JQCAxKugQrRoBLbFoQHs3stFldQ48JO8ghXLwQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=IatTcqdPkAjDWFsFZ9qQP4fPKrQLyLg25+2fwm79U0Nr3H3dty3OQqzx4hJ7Gqo9ft0DjoG2BeVhFEwA2F/KclQOegCOzBWVHkqTcfzWDy8RRV6rApZA9V/juGyYgWAt8jAq8EH7YJL+6rpxO2wYLtK31UpHB5PDDfAVHT82o4XbwwtJIZbwEtU2w5q+SPZaRiTBaXW9RFw3qWe8MiGxZLlRHvVkQg+IJPLjvRLygIUB7eYSSLrCLfl7q110L3ljkRODjgfFJOt3vSaCNC7LRDzveWOuPV6P7t+y4BY0+jnr2Kg/rwD2oEDFcfvCwb2BitT984TPSzLfpjjwQeqgsw==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=nYPWjaPBO7quuT9FqR1Q5KG/W9mmCpffEhERVdwNsDY=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179502844355977.20074405531386;
	Wed, 18 Nov 2026 11:00:43 -0800 (PST)
From: Rong Zhang <i@rong.moe>
Date: Thu, 19 Nov 2026 02:58:46 +0800
Subject: [PATCH 3/5] platform/x86: lenovo-wmi-other: Factor out
 tunable_attr_01 definition into a macro
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-lwmi-no-singleton-v1-3-6b06fcfb5126@rong.moe>
References: <20261119-lwmi-no-singleton-v1-0-6b06fcfb5126@rong.moe>
In-Reply-To: <20261119-lwmi-no-singleton-v1-0-6b06fcfb5126@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Alok Tiwari <alok.a.tiwari@oracle.com>, Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-ce4c1
X-ZohoMailClient: External

Currently, all definitions of statically allocated tunable_attr_01
variables are open-coded, making them hard to refactor.

Add a macro to define statically allocated tunable_attr_01 variables so
that further refactoring only touches the macro itself.

Meanwhile, move the definition of statically allocated tunable_attr_01
variables before the definition of struct lwmi_om_priv, so that upcoming
changes can reference the former as needed.

No functional change intended.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/wmi-other.c | 178 +++++++-------------------------
 1 file changed, 38 insertions(+), 140 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 4d51b05a5acf..252ef775f300 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -130,6 +130,44 @@ struct lwmi_fan_info {
 	long max_rpm;
 };
 
+struct tunable_attr_01 {
+	u8 feature_id;
+	u8 device_id;
+	u8 type_id;
+	u8 cd_mode_id; /* mode arg for searching capdata */
+	u8 cv_mode_id; /* mode arg for set/get current_value */
+};
+
+#define DEFINE_TUNABLE_ATTR_01(_name, _device, _feature, _type)	\
+	static struct tunable_attr_01 _name = {			\
+		.device_id = LWMI_DEVICE_ID_##_device,		\
+		.feature_id = LWMI_FEATURE_ID_##_feature,	\
+		.type_id = LWMI_TYPE_ID_##_type,		\
+	}
+
+DEFINE_TUNABLE_ATTR_01(ppt_pl1_spl, CPU, CPU_SPL, NONE);
+DEFINE_TUNABLE_ATTR_01(ppt_pl1_spl_cl, CPU, CPU_SPL, CROSSLOAD);
+DEFINE_TUNABLE_ATTR_01(ppt_pl2_sppt, CPU, CPU_SPPT, NONE);
+DEFINE_TUNABLE_ATTR_01(ppt_pl2_sppt_cl, CPU, CPU_SPPT, CROSSLOAD);
+DEFINE_TUNABLE_ATTR_01(ppt_pl3_fppt, CPU, CPU_FPPT, NONE);
+DEFINE_TUNABLE_ATTR_01(ppt_pl3_fppt_cl, CPU, CPU_FPPT, CROSSLOAD);
+DEFINE_TUNABLE_ATTR_01(cpu_temp, CPU, CPU_TEMP, NONE);
+DEFINE_TUNABLE_ATTR_01(ppt_pl1_apu_spl, CPU, CPU_APU, NONE);
+DEFINE_TUNABLE_ATTR_01(ppt_cpu_cl, CPU, CPU_CL, NONE);
+DEFINE_TUNABLE_ATTR_01(ppt_pl1_tau, CPU, CPU_TAU, NONE);
+DEFINE_TUNABLE_ATTR_01(ppt_pl4_ipl, CPU, CPU_IPL, NONE);
+DEFINE_TUNABLE_ATTR_01(ppt_pl4_ipl_cl, CPU, CPU_IPL, CROSSLOAD);
+DEFINE_TUNABLE_ATTR_01(gpu_nv_ppab, GPU, GPU_NV_PPAB, NONE);
+DEFINE_TUNABLE_ATTR_01(gpu_nv_ctgp, GPU, GPU_NV_CTGP, NONE);
+DEFINE_TUNABLE_ATTR_01(gpu_temp, GPU, GPU_TEMP, NONE);
+DEFINE_TUNABLE_ATTR_01(gpu_nv_ac_offset, GPU, GPU_AC_OFFSET, NONE);
+DEFINE_TUNABLE_ATTR_01(dgpu_boost_clk, GPU, DGPU_BOOST_CLK, NONE);
+DEFINE_TUNABLE_ATTR_01(dgpu_enable, GPU, DGPU_EN, NONE);
+DEFINE_TUNABLE_ATTR_01(gpu_mode, GPU, GPU_MODE, NONE);
+DEFINE_TUNABLE_ATTR_01(dgpu_didvid, GPU, DGPU_DIDVID, NONE);
+DEFINE_TUNABLE_ATTR_01(gpu_nv_bpl, GPU, GPU_NV_BPL, NONE);
+DEFINE_TUNABLE_ATTR_01(gpu_nv_cpu_boost, GPU, GPU_NV_CPU_BOOST, NONE);
+
 struct lwmi_om_priv {
 	struct component_master_ops *ops;
 
@@ -966,14 +1004,6 @@ static void lwmi_om_psy_remove(struct lwmi_om_priv *priv)
 
 /* ======== fw_attributes (component: lenovo-wmi-capdata 01) ======== */
 
-struct tunable_attr_01 {
-	u8 feature_id;
-	u8 device_id;
-	u8 type_id;
-	u8 cd_mode_id; /* mode arg for searching capdata */
-	u8 cv_mode_id; /* mode arg for set/get current_value */
-};
-
 /**
  * tunable_attr_01_id() - Formats a tunable_attr_01 to a capdata attribute ID
  * @attr: The tunable_attr_01 to format.
@@ -986,138 +1016,6 @@ static u32 tunable_attr_01_id(const struct tunable_attr_01 *attr, u8 mode)
 	return lwmi_attr_id(attr->device_id, attr->feature_id, mode, attr->type_id);
 }
 
-static struct tunable_attr_01 ppt_pl1_spl = {
-	.device_id = LWMI_DEVICE_ID_CPU,
-	.feature_id = LWMI_FEATURE_ID_CPU_SPL,
-	.type_id = LWMI_TYPE_ID_NONE,
-};
-
-static struct tunable_attr_01 ppt_pl1_spl_cl = {
-	.device_id = LWMI_DEVICE_ID_CPU,
-	.feature_id = LWMI_FEATURE_ID_CPU_SPL,
-	.type_id = LWMI_TYPE_ID_CROSSLOAD,
-};
-
-static struct tunable_attr_01 ppt_pl2_sppt = {
-	.device_id = LWMI_DEVICE_ID_CPU,
-	.feature_id = LWMI_FEATURE_ID_CPU_SPPT,
-	.type_id = LWMI_TYPE_ID_NONE,
-};
-
-static struct tunable_attr_01 ppt_pl2_sppt_cl = {
-	.device_id = LWMI_DEVICE_ID_CPU,
-	.feature_id = LWMI_FEATURE_ID_CPU_SPPT,
-	.type_id = LWMI_TYPE_ID_CROSSLOAD,
-};
-
-static struct tunable_attr_01 ppt_pl3_fppt = {
-	.device_id = LWMI_DEVICE_ID_CPU,
-	.feature_id = LWMI_FEATURE_ID_CPU_FPPT,
-	.type_id = LWMI_TYPE_ID_NONE,
-};
-
-static struct tunable_attr_01 ppt_pl3_fppt_cl = {
-	.device_id = LWMI_DEVICE_ID_CPU,
-	.feature_id = LWMI_FEATURE_ID_CPU_FPPT,
-	.type_id = LWMI_TYPE_ID_CROSSLOAD,
-};
-
-static struct tunable_attr_01 cpu_temp = {
-	.device_id = LWMI_DEVICE_ID_CPU,
-	.feature_id = LWMI_FEATURE_ID_CPU_TEMP,
-	.type_id = LWMI_TYPE_ID_NONE,
-};
-
-static struct tunable_attr_01 ppt_pl1_apu_spl = {
-	.device_id = LWMI_DEVICE_ID_CPU,
-	.feature_id = LWMI_FEATURE_ID_CPU_APU,
-	.type_id = LWMI_TYPE_ID_NONE,
-};
-
-static struct tunable_attr_01 ppt_cpu_cl = {
-	.device_id = LWMI_DEVICE_ID_CPU,
-	.feature_id = LWMI_FEATURE_ID_CPU_CL,
-	.type_id = LWMI_TYPE_ID_NONE,
-};
-
-static struct tunable_attr_01 ppt_pl1_tau = {
-	.device_id = LWMI_DEVICE_ID_CPU,
-	.feature_id = LWMI_FEATURE_ID_CPU_TAU,
-	.type_id = LWMI_TYPE_ID_NONE,
-};
-
-static struct tunable_attr_01 ppt_pl4_ipl = {
-	.device_id = LWMI_DEVICE_ID_CPU,
-	.feature_id = LWMI_FEATURE_ID_CPU_IPL,
-	.type_id = LWMI_TYPE_ID_NONE,
-};
-
-static struct tunable_attr_01 ppt_pl4_ipl_cl = {
-	.device_id = LWMI_DEVICE_ID_CPU,
-	.feature_id = LWMI_FEATURE_ID_CPU_IPL,
-	.type_id = LWMI_TYPE_ID_CROSSLOAD,
-};
-
-static struct tunable_attr_01 gpu_nv_ppab = {
-	.device_id = LWMI_DEVICE_ID_GPU,
-	.feature_id = LWMI_FEATURE_ID_GPU_NV_PPAB,
-	.type_id = LWMI_TYPE_ID_NONE,
-};
-
-static struct tunable_attr_01 gpu_nv_ctgp = {
-	.device_id = LWMI_DEVICE_ID_GPU,
-	.feature_id = LWMI_FEATURE_ID_GPU_NV_CTGP,
-	.type_id = LWMI_TYPE_ID_NONE,
-};
-
-static struct tunable_attr_01 gpu_temp = {
-	.device_id = LWMI_DEVICE_ID_GPU,
-	.feature_id = LWMI_FEATURE_ID_GPU_TEMP,
-	.type_id = LWMI_TYPE_ID_NONE,
-};
-
-static struct tunable_attr_01 gpu_nv_ac_offset = {
-	.device_id = LWMI_DEVICE_ID_GPU,
-	.feature_id = LWMI_FEATURE_ID_GPU_AC_OFFSET,
-	.type_id = LWMI_TYPE_ID_NONE,
-};
-
-static struct tunable_attr_01 dgpu_boost_clk = {
-	.device_id = LWMI_DEVICE_ID_GPU,
-	.feature_id = LWMI_FEATURE_ID_DGPU_BOOST_CLK,
-	.type_id = LWMI_TYPE_ID_NONE,
-};
-
-static struct tunable_attr_01 dgpu_enable = {
-	.device_id = LWMI_DEVICE_ID_GPU,
-	.feature_id = LWMI_FEATURE_ID_DGPU_EN,
-	.type_id = LWMI_TYPE_ID_NONE,
-};
-
-static struct tunable_attr_01 gpu_mode = {
-	.device_id = LWMI_DEVICE_ID_GPU,
-	.feature_id = LWMI_FEATURE_ID_GPU_MODE,
-	.type_id = LWMI_TYPE_ID_NONE,
-};
-
-static struct tunable_attr_01 dgpu_didvid = {
-	.device_id = LWMI_DEVICE_ID_GPU,
-	.feature_id = LWMI_FEATURE_ID_DGPU_DIDVID,
-	.type_id = LWMI_TYPE_ID_NONE,
-};
-
-static struct tunable_attr_01 gpu_nv_bpl = {
-	.device_id = LWMI_DEVICE_ID_GPU,
-	.feature_id = LWMI_FEATURE_ID_GPU_NV_BPL,
-	.type_id = LWMI_TYPE_ID_NONE,
-};
-
-static struct tunable_attr_01 gpu_nv_cpu_boost = {
-	.device_id = LWMI_DEVICE_ID_GPU,
-	.feature_id = LWMI_FEATURE_ID_GPU_NV_CPU_BOOST,
-	.type_id = LWMI_TYPE_ID_NONE,
-};
-
 struct capdata01_attr {
 	struct kobj_attribute kobj_attr;
 	struct tunable_attr_01 *tunable_attr;

-- 
2.55.0

