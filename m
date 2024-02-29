Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4DC6CDB1
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Feb 2024 11:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709204506; cv=fail; b=ltHfyqA51jNOMWRAZQJpynqXkaJrG29IHdSAcStYV0qpR6F3YjaBtf7oxxp7gl7mLAf3Arx2YiAEw5PbbE6aQ4i4ah6fOuPcRAwekif8+ZnQka71/Z0r/anBu1T/wuYwm7N3EJCbgQQRXG1BxXMrW/mMbYkr4iHy+CjPC7mKUdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709204506; c=relaxed/simple;
	bh=8V3fXgXbT/T0ICUDbSTNhdHWs3g8EZeClVZRVZsj1cA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bMog8lZYp1yD4vd0/+TgVPwjXqgHubJEqiCp823HROsKo0PVGWdbz0s2p2fyninj2Qs+C9240ns/Answ9HAJNouMdzPhzjrfbuuAriAVI8HNJ2RyJ5jLXq/Jyjunq75g0QP5C/jPptFuybvlJjgf3A5G+zyjzJJsju//bC+dq1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oiBbeg4R; arc=fail smtp.client-ip=40.107.223.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oiBbeg4R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RjdYBm0TJcVdrdIoa4rIVOntvXkIJXtATp4mnE6EcmtWoHslRVLCLLtZARWH6bfKR1Yab5j8m9bt5RLXU+/kfw/Quyx4WaNwjshNmO+GSXuNzo7C8BC40ru+Lc9/HKn01wxsDdZwN14mokPYYao9tYadYJYmUAAxHJTE+qJRNm28YwOf8D85A4S1YbnMMp+jk3+bR7LsZuqeFU5SCyaHzGaxDWaBYHNuz0HBC71BjBI3+Q5IfV07BM172lV7J4C0cHUdIdQ3gpPejn5MqJAGIe3JpwbfLWeQCxgaet3pOz7DFKrAv2av0V0MuOL0e8Wa+eohtTAyzht7P+O0WuCudw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJ7TgIvdxZXl1VCK+DkZpiDvM+RqS89YB066pLZvKFs=;
 b=MzOJ3MsKOPKR+jHSHjQD2T0gMzkviL5UHgOgMavoowHsgoJAMbC60BmYkqFHqn6P33ZcobEs/hbQTBI5usaDUOrwZ3OaNGVhP8utyGWLhKNGLy+IAFRKWK6hQzyOGnZnVSx7qL9cKtllS2/EfdTUyuqBTM/sB+Y/UxL8HrGG4hZESUtfEEYecwnhr6kbQu84QpIl6ubefKH1zCpDCfH73q/u+YODHkJPFwN2xL3ihvlCfaVTc4Prpv23qfLjFM+VoJ1o63P83A9Zl4Qk5V+3jCD/mD9KT1191ENPZDEOrtv62Oy7zqw44g4ZFQNwEtAIW+YvSCJ0SMuvcvr2UzW4og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJ7TgIvdxZXl1VCK+DkZpiDvM+RqS89YB066pLZvKFs=;
 b=oiBbeg4RxySFxwIZo6nV/MBrkPO5/RRF3390wgLmT06ofH2hhXHBEI6ZAQdi0AapA7Trl7gi2d3orm64bVeO8HFTKLNFMLmU5NRk8B0+jAfOlDEwm3IAY9Z7QOHn4AkUkqDeQVuuguHlOhoxHaUQJyWzDmhzkXsDuDfQ2bITA5k=
Received: from CY5PR04CA0005.namprd04.prod.outlook.com (2603:10b6:930:1e::32)
 by DM6PR12MB4091.namprd12.prod.outlook.com (2603:10b6:5:222::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Thu, 29 Feb
 2024 11:01:40 +0000
Received: from CY4PEPF0000E9D7.namprd05.prod.outlook.com
 (2603:10b6:930:1e:cafe::c0) by CY5PR04CA0005.outlook.office365.com
 (2603:10b6:930:1e::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.30 via Frontend
 Transport; Thu, 29 Feb 2024 11:01:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D7.mail.protection.outlook.com (10.167.241.78) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 29 Feb 2024 11:01:38 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 29 Feb
 2024 05:00:07 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH RESEND v2 7/7] platform/x86/amd/pmf: Update sps power thermals according to the platform-profiles
Date: Thu, 29 Feb 2024 16:29:01 +0530
Message-ID: <20240229105901.455467-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240229105901.455467-1-Shyam-sundar.S-k@amd.com>
References: <20240229105901.455467-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|DM6PR12MB4091:EE_
X-MS-Office365-Filtering-Correlation-Id: 3306a913-fc77-4250-6039-08dc3915cecd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ipX7B1zaOJwx+pD1hEK3SFyzlRD7mcLl46Yh5pZ1UdTqCWg0YdyhSjaniYsQRHwGGAjDg7h9ZOflUmihLTIx4jWhPxCS6wxfd+Wxq9uqH8QidUpJuyx0M5aFeCLSa/U9x4yHSY55Cr8+4p6lkyD/Bu9SJRd4jySO8ZizQUIQObRx/Z3FcsY5Y2sq3rzulu5MPC9UwMsKH70RdAG+0Cdrho/PzSCr93kh1Yiu6UOL84tXvvVhtKBeRStfRfzZoA3orSGQMoBwdmaUvnxii39LYiW8zwHmtwywMNQLjuSfU/hiX0N3DHfaxzMPuocZydLIA3cj11qu+wl8jVAJQC7KLS+yUKsbpt4ZE7zHsm4gEHqRlwHcLjgQ0mpw16T5XCcDj3W+c3NLE9hTf5TXBuNKUCZw+1972SK0b6KM3TVH5vpyt5HcCCSS3o9kjCBQNknkcrakNBLlYmCp7QG3A/jQ4aNrYfAv+8lHK8c/c3ZqDYAabGafMcxFb8HtZWF9m09+FCUHuAVrV937FSVENeqtmR4rqSUtiZmDRlYBeem6r3nCsJrgS5Vb2V6VlKJoJlHBtHY8/3PIJ27V4Ou/N+CXnEkmjK6YauRLo8jd50MS+lJxCpzuRQ6MYIr0YsaOJdZ1KjacOyh9psTZxgWBdhsU9C/OuA+eaqbM8yDAeXW/yD7yrbzRSwiGOU5JQfucg43nllYPxO/2K2VqVS/ke5C0YHwD7gDmwipB13CRQk1U9B/6O1r1vc/HYTNQnHrGgXad
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 11:01:38.6586
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3306a913-fc77-4250-6039-08dc3915cecd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4091

Update power thermals according to the platform-profiles selected by the
user.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h |  2 ++
 drivers/platform/x86/amd/pmf/sps.c | 42 ++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 2d0601897f4a..c95e43077c03 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -51,6 +51,8 @@
 #define GET_STT_LIMIT_APU	0x20
 #define GET_STT_LIMIT_HS2	0x21
 #define SET_P3T				0x23 /* P3T: Peak Package Power Limit */
+#define SET_PMF_PPT            0x25
+#define SET_PMF_PPT_APU_ONLY   0x26
 
 /* OS slider update notification */
 #define DC_BEST_PERF		0
diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
index 96bd2140302c..92f7fb22277d 100644
--- a/drivers/platform/x86/amd/pmf/sps.c
+++ b/drivers/platform/x86/amd/pmf/sps.c
@@ -190,6 +190,19 @@ static void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev)
 	amd_pmf_dump_sps_defaults(&config_store);
 }
 
+static void amd_pmf_update_slider_v2(struct amd_pmf_dev *dev, int idx)
+{
+	amd_pmf_send_cmd(dev, SET_PMF_PPT, false, apts_config_store.val[idx].pmf_ppt, NULL);
+	amd_pmf_send_cmd(dev, SET_PMF_PPT_APU_ONLY, false,
+			 apts_config_store.val[idx].ppt_pmf_apu_only, NULL);
+	amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false,
+			 apts_config_store.val[idx].stt_min_limit, NULL);
+	amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
+			 apts_config_store.val[idx].stt_skin_temp_limit_apu, NULL);
+	amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
+			 apts_config_store.val[idx].stt_skin_temp_limit_hs2, NULL);
+}
+
 void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
 			   struct amd_pmf_static_slider_granular *table)
 {
@@ -222,6 +235,32 @@ void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
 	}
 }
 
+static int amd_pmf_update_sps_power_limits_v2(struct amd_pmf_dev *pdev, int pwr_mode)
+{
+	int src, index;
+
+	src = amd_pmf_get_power_source();
+
+	switch (pwr_mode) {
+	case POWER_MODE_PERFORMANCE:
+		index = config_store_v2.sps_idx.power_states[src][POWER_MODE_BEST_PERFORMANCE];
+		amd_pmf_update_slider_v2(pdev, index);
+		break;
+	case POWER_MODE_BALANCED_POWER:
+		index = config_store_v2.sps_idx.power_states[src][POWER_MODE_BALANCED];
+		amd_pmf_update_slider_v2(pdev, index);
+		break;
+	case POWER_MODE_POWER_SAVER:
+		index = config_store_v2.sps_idx.power_states[src][POWER_MODE_BEST_POWER_EFFICIENCY];
+		amd_pmf_update_slider_v2(pdev, index);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 int amd_pmf_set_sps_power_limits(struct amd_pmf_dev *pmf)
 {
 	int mode;
@@ -230,6 +269,9 @@ int amd_pmf_set_sps_power_limits(struct amd_pmf_dev *pmf)
 	if (mode < 0)
 		return mode;
 
+	if (pmf->pmf_if_version == PMF_IF_V2)
+		return amd_pmf_update_sps_power_limits_v2(pmf, mode);
+
 	amd_pmf_update_slider(pmf, SLIDER_OP_SET, mode, NULL);
 
 	return 0;
-- 
2.25.1

