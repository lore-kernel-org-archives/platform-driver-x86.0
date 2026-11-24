Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795543455;
	b=uA0E8kF0KT4eF55CkeYcWil1y7oZ72iAvyE68RZTfhrFauZv0Jcxze+LML8rrWKHdcIj
	 SSah7koHKsVMCLCOtSFEjBrTuBIvVkcQAasnf2p7d6biBHeY5uFeq7h1q02eMEChcmUmh
	 8r7/1lgZNzSpbfZgBh9W2aJgq4ipoKH6DazaCDhVea0tGJBmnfbAmZlSfowHyhq9YMKuL
	 kBsVBOeMQIc2bGjiD233se+NbzRrGkk7YxNgyWGl2WCMTrYTPWaEjC734GW9BaH4OBnR5
	 VdOXJKq7I5ljIEpPuiA+VMKNDlEyqHPrsbmzUa0CHxXqQFE2Sh1tQcBWTUA+EFlvigw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543455;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=NekCC2dclXQ8PJQIMZLlLrY955nw5ukykfunJBVelA0=;
	b=qAyuoSD1t7uyQD3At1FJ0SmZHVjm60SPv+iOL1uevaVwIoFdpU4YiGdYC6pqJ3mczmwO
	 dZKOUZ48I66bU0ZKP9Y6gjMc3z9AdWnxANgznrt0hfjpdORkFie0voNcVbBcZLaboxxfh
	 ljyj4/8P+Zu36UqoDZDhV1q/U32StayYoO+A+op5Ydx95UUHBa+o4bny3ck5MZSDKDKrz
	 IqI+8cKZWBJSiNRQniMGeLfyOWLzEYQySjs5OfJrQVCop7AxoyjmO38RAwH6fMx8R73cW
	 znqndFq7O3KyTA0xjhBrm33GhIWVa2besphFSPsjJn4W+qiOBT3ygggqsFYf2J9tL8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b="IJIdi/Tm";
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
Received: from sender5-pp-f112.zoho.com (sender5-pp-f112.zoho.com [165.173.182.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22018606A332;
	Tue, 24 Nov 2026 18:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22018606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=IJIdi/Tm
ARC-Seal: i=1; a=rsa-sha256; t=1795543386; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AyDo7GalBJR3Gjgzdhy7RVJyGGxNj9QPZwEMdjnWu54HNyySEJs6uT46I6qJdw1UKzbLcTPw5nT71hO43krFQu0gJiT/yVzPHLZ5QYO2dhEse7i1l8iWgU02eE58Sebgr9KGYLDw9TD7IagUW3e1rn5cgqQhliLRYseKKICZcNo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795543386; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NekCC2dclXQ8PJQIMZLlLrY955nw5ukykfunJBVelA0=; 
	b=ZaCbcR2TrWN3TZoLf3lw3yv8RwTiFvC/o6zsUKZAfjgXY/c7bnz6KO54+CMFMTp8oj/h6t2zX3jXNfAru3gD5VUZrYGCmlU35PsmH+GSG9cRYAn+Vx8hu9oHA9yvFTtN3o7lh9pkdZ0BZcC5VT7J5izMZKIjawIc0t+Rrmd0gXE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=IJIdi/Tm5KdrvnNn0HE35flCdZhOZbrZ8o9ktvJzWjI09CxFi88t8cPdCQWrDWyFoPgy7lE89Ef+g7C0tepwao1Pz2oJ1OhRymRFXGVBZ+1SquOO5LPm4LSedZeRuy63a7GiZs76BBJD1xF3B2p7dOR3eZlhjlgDkXLCG+HiQgksYd95waRAFiOkzsIhkz02cskqeZxMrq09QJfwiFggAGscpVjShPovNfDldeHOqQefE44Sk2Rmsd4+TsenoCLQuHEMN9kVMugu28I7JN7iYYKMFx98jINOvUcoC5cI9h89Qx8W9mfoWdWjOuhR8FnPPwc8fk2R+snKbdNTNI9V6Q==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=NekCC2dclXQ8PJQIMZLlLrY955nw5ukykfunJBVelA0=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795543383885815.1105829224456;
	Tue, 24 Nov 2026 10:03:03 -0800 (PST)
From: Rong Zhang <i@rong.moe>
Date: Wed, 25 Nov 2026 02:02:41 +0800
Subject: [PATCH v2 3/5] platform/x86: lenovo-wmi-other: Factor out
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
Message-Id: <20261125-lwmi-no-singleton-v2-3-37611a7b2fc4@rong.moe>
References: <20261125-lwmi-no-singleton-v2-0-37611a7b2fc4@rong.moe>
In-Reply-To: <20261125-lwmi-no-singleton-v2-0-37611a7b2fc4@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
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
changes can reference the former as needed. Also swap device_id and
feature_id in the definition of tunable_attr_01 to make the order the
same as elsewhere.

No functional change intended.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v2:
- Swap device_id and feature_id in tunable_attr_01 (thanks Mark Pearson)
---
 drivers/platform/x86/lenovo/wmi-other.c | 178 +++++++-------------------------
 1 file changed, 38 insertions(+), 140 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 4d51b05a5acf..b451facf5846 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -130,6 +130,44 @@ struct lwmi_fan_info {
 	long max_rpm;
 };
 
+struct tunable_attr_01 {
+	u8 device_id;
+	u8 feature_id;
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

