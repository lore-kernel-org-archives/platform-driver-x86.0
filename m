Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603B87F7FC
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 11:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709725498; cv=fail; b=smfZZx++aj398XYPoobBHdF59SUlRZj+5VIEhAa4gX/lKrgpyGujZ5sm+e5BKZcM0V8uT1FkBk3gJZtP78n2tEUuiHg8POk2mqozqv8JdT36jZ4VS1wJ6lIww/ZLgIkP+5K1mm1SiJkp+tgWl+JSkdHJL2XgZcNg7tXm18/DgdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709725498; c=relaxed/simple;
	bh=Z9iRPIdy/NAVVwWcCW1qijo7a8gtUtoAp2oDkbAkTeA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XdILGBYd/IwwBL+8R2aM1R0eknSp5wZybjKd/pGABUCSVJv7OBfxHG/+hQI4pif8i2v+MAEJKr0brFk71Agwz8CNv77+ArhKjUze5l7ju5d7JzmoeBC45sHlVWrydzDj8zuWgTPdjNvqlUVjNA32p60dx6B70scVLXOfId9LGpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=p5T+Ae6E; arc=fail smtp.client-ip=40.107.92.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="p5T+Ae6E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kkpYK9ot1jE7IaFHMcuU4rCIIuAjFN9mXiHQaxo5OIt3spXTJ711WXs/S3jPQwFqePNorPgMBceJDo116DR6ZKwlD7jiwh40ulbnmtCxBE9opUEDFADhoJQrE+josoT2NhMG7LnwKMQaXVhtDJuqJoFInmkA7FgCys3PP85yVQyDho3yyBPNHIy0OwPA2tswAfU4c0jVJy1u3ySPgOvTBzgJI8ZiptBqdEvTobYd1pRd8XUikuc9d2PbWQRRN0VRdI3W/FIAuEXZ9ZCn8/1BeJZ5zhKKzqamH2DBw1wBtuptgqPgSOZX4hi1FTY5E4pN3JzoqGr72XFamSn//xzgiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2cSVgjYU8H9IHLMijfdL8mGInnrpihKEiQp66Ee+Nk=;
 b=VYIc/HTaMEzXUe6uoVeevuPucnT3xUy2HdKWQnaUBhftca1qFqSOMoaH+1ley8tkmw6Igcmwhe9c7RXauDkscAs+FivKSzo/cJnBuGzGoSIHnNOcoIZ7eKgzDnDwB0g0jN7iIZg5G72fbUhaK9vM064n+K93Fw9GH4YsIAWaaSb/8tYc2K5kMsTKinZp16A89MaNKasnK5dRJYI8SRGvSRdMN7ZsgHAotHy10jE4MALhwoLNSfsQAnscFbYiKpCpHJmfGlKjVSk542HqSo7GZ+MoPdx78XBEWF41YswNzWc718mV7zNnEHkBtG4l0dnhsrBVKYX2WQ6dtMnR1Jl8Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s2cSVgjYU8H9IHLMijfdL8mGInnrpihKEiQp66Ee+Nk=;
 b=p5T+Ae6E19vJpH/KEBQmIFw3BlpgKUN83RnXZ5KoDFKO8B0RyjbbxpjTvirln84bTYZofHJXo3h6Ca7m0L/sEWeLsSzxjU16SnZL+YUKzYOyAFp1rrlBVmWOZ5AMUXWSMKpAf+RbBoXpCTrY75+D1znVdGPlBWt7YsfFpOpEIDk=
Received: from SJ0PR13CA0230.namprd13.prod.outlook.com (2603:10b6:a03:2c1::25)
 by DM4PR12MB6424.namprd12.prod.outlook.com (2603:10b6:8:be::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 11:44:53 +0000
Received: from MWH0EPF000989E6.namprd02.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::a7) by SJ0PR13CA0230.outlook.office365.com
 (2603:10b6:a03:2c1::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23 via Frontend
 Transport; Wed, 6 Mar 2024 11:44:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E6.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Wed, 6 Mar 2024 11:44:53 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 6 Mar
 2024 05:44:50 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 7/7] platform/x86/amd/pmf: Update sps power thermals according to the platform-profiles
Date: Wed, 6 Mar 2024 17:14:15 +0530
Message-ID: <20240306114415.3267603-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240306114415.3267603-1-Shyam-sundar.S-k@amd.com>
References: <20240306114415.3267603-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E6:EE_|DM4PR12MB6424:EE_
X-MS-Office365-Filtering-Correlation-Id: 924e0d1a-a743-497a-d4a0-08dc3dd2d6a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vk2ELKAQH+T29NSxk0+FpmBHurunpVfz5MzLWaddbFwmUww2+/kl/ou5pwLmiFaiH0WHGpTwSH8MGl16mlOHg3WzLvI+xq+M6IL8ulehW6cNXxemoGaF3/jbeLcGQqGRGiNh1er0HT4D81aciC3Hl57p66Ftwl3kRIQzoE15REHnbPmNa4h77PW7YXUVoJfkyP+Tu+9LhPhvoGBOre9ozwZh7pipT77m8n0CdD/egL2Bq99kUVm631bgIu1zzmJUnQqGl1rtboABqyBjLn0LdvjRrLKF/Lwt43IKpB350FwPO9bACdgpoY5j0RhgrqDAS/2Gz2nBIlOBihXmSn49JuwoWMl29zs+8wORGmN1QJKwvqeDHHnMmr/AJ9kvJdydHgI8SAO+coC0BEaPIC3cVKYuN20wFT3vFenKQhK9WQttfzr3SaJB2HtgQ2JiYNatwohrDRIii/WjDnp18ETkImtax6CJRJVGV0QYq0QqeCEZeqM/AG3Iim7dOCs5wdl7ffNyhkVEqXV1Y/ETYMJHRZpkiw4MiBh+Yw8fmMdGILigJPV57MmirZYL4+RG2e5bySluWnq4QrjxfDMO0x4mdPZJYrXRU57sso0rbNL/D1C/TKLk0vc5aGuw1jDufIpuLrpt+epyr87PByd+iuWuYajTpVxqYgmIIYBunTVxag5HF46rW4AgFNVmq4dDx3gWOoWFbYkQtDsa8bzAAROROJjWxV/CcNAi7lhj2WUU9OwmfwaT8Kv6RovKF8Auq/qZ
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 11:44:53.1667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 924e0d1a-a743-497a-d4a0-08dc3dd2d6a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6424

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
index 10d5f8cef27e..907e046c3c96 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -55,6 +55,8 @@ struct cookie_header {
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

