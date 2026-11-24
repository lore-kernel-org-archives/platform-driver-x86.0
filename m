Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795506770;
	b=u92odiTBhI9m8nWjr6xqFl1i1htAkC58C178sfwiOzuJXnc9aP5kJGJTf5LIPPpPHm+F
	 xkD4tHXV4sHdFEtGSMJpvZGJdKfRu2fL5iPDtKCZpVMnL/hUdsV70HFH5v10qLb2hBb/8
	 7KlEie+PmTXTkUX0Ik9YMb1iTDSNsdi70UJKBHnW6tNY77XhqvF1I/KaJzBBupjsWIJML
	 cdmNdC3FpisrNWBlcpQvuO219E/dOm1oiFSBhwPnfcmrZrW4WTW6kZqDCiHzYUcJnrXZs
	 n5t4VD7laHI9mWFBzOZeim5NtsPMjmq291+LlgRB3bkgZKPPAskKG3XX/PcvJ8NLiDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506770;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=jCJDEbw7N2vFFeH4TgQ/BdBenIOsN7Ey1ZfYjLdIYUI=;
	b=kJosrc/lZYESrX1GZukHDXw/eYnsXQbnhh4r33pkqQnhVlhJ3oWKFGYTJOq0RpExSwe5
	 8TmUPzelYQKlWS6FTBMUvDTpgqBECLnQpON766zfOSGwrANenKO1orw0aIuYQ+1isSvHx
	 Pjfbtg6Q5VevZSgSwuD5WQzklE5x4gk/oaBvbQ1ev/Nq/p0ycDRAEDk/sxdROOhfvAdjC
	 gL61ZosIB4M1YXzQaE+ghCW+7zYhUFo14FSqf3Oi2hR+aj0vxPvrKOpY5ZGIJLAEg1HE2
	 uXc1FU07O8h5Enf2u4tsTzSgBoCL/BxLhTxD+589Gtv1A4tpm/sWADBvVopkAIy+y5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=263mDEWF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.28
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013028.outbound.protection.outlook.com [40.107.201.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7F8606A321
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 07:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A7F8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=263mDEWF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WTl4Q4E2WnjrMBzkOfaKCZBmwCvsIfDpHN+xQkgQ4h2TIqUPMO/wJ+olbp+4U8NVgdS4vjUsLCaSMSwN9FxI0QEyOPyiy89xeStI6qKRpM4mhMxZfORrK8wOUJi+Q4BYB3XmaUkujD9aZYK27zyoplYZzO9vjggW9M9uhk5kYug9mu0mcgl09u9NnI6mJ777zcFNTrUhHbhSrBSGL3YHnznJtOHKMRt1eO08auLSCjV3cCnokYuymlfdAKBF/zWKltwmrhXJNLFTcU9K5fgRgLK/Whl51ro6jRvn8m1K1WN7kO6XG99PnpnJ3RMWHZAK5k3AYqHz4C2Iv8X9+IgyvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCJDEbw7N2vFFeH4TgQ/BdBenIOsN7Ey1ZfYjLdIYUI=;
 b=vTJFx3fuHyUIcdYt7z8KAotSe02+TPlqDB5WzEONuG2fhWDFWFzsOxglSx4Cj7HMJ2OPWCrzkd5MKlPxb4uG7E+F1dvRqIiJ2UsSbNYNy2iowNEwGSH4vDEZiYhvCb9Ms7p58vVPk06pwwvwGqT/Z26gbmqhfnXqbL7ho59Q0BVgGFFTEGN3uFC20A+SFQ9HVB6KdnOe93gLp1fBuh7xtEfTT0CycwxVPb9cNkO95uQ3xsOiL9gRbXkAS1L/6XPLs/G8FCNDq/rKE+GAeTFl1QDqj2VaWagCooPyTcq2Z8Wr79ZYPSdglaXVJgkB37eN6wySH8IPnUMsrMhdqwlgfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCJDEbw7N2vFFeH4TgQ/BdBenIOsN7Ey1ZfYjLdIYUI=;
 b=263mDEWFofLagT0qTNNz/UIphJ/7XOrN/Mg0p0cniOkPzTiZZhv0b0cbktW9ZkLRR0eiz4DRHhEipTq4qsaorDnRxD/QwIr5FSyaJWBr0ZswVJQfyMLqrItOB0gSGOcta7pkLI2MN7ZzW5SKKIBkyUlrRiDQKQsn88U345hBc0s=
Received: from MW4PR04CA0385.namprd04.prod.outlook.com (2603:10b6:303:81::30)
 by SA5PPF80B25317E.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 07:52:44 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:303:81:cafe::95) by MW4PR04CA0385.outlook.office365.com
 (2603:10b6:303:81::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 07:52:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 07:52:44 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 01:52:39 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 02/11] platform/x86/amd/pmf: Abstract static slider handling through sps_ops
Date: Tue, 24 Nov 2026 13:22:04 +0530
Message-ID: <20261124075213.2317127-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124075213.2317127-1-Shyam-sundar.S-k@amd.com>
References: <20261124075213.2317127-1-Shyam-sundar.S-k@amd.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|SA5PPF80B25317E:EE_
X-MS-Office365-Filtering-Correlation-Id: 68f0ef37-af17-4a65-4372-08df49ffecb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|23010399003|82310400026|10067099003|261021121427099003|11063799006|56012099006|261021123027099003|261009223027099003|261102123227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LQO1gxqjOKO0H30q6H37qMw/955vJSijI7S1r/9CBBL8b/Lj61PVan91ITu6bnKlKoiC2h/6uHZPL4Oo2Rk1CIEArwXH5quykh1VCgrb2h3CDDW7pvwkINRb6xlNVFo/2arUh5hJzyPbKQqx5sGc+dgwBV22kmbE7tBDOHrX8HIBCAkK4XLKL4ie4RKFQu0nVVJTuvfq9v/PNPpczI+m7tVixpZC8rNw1wQd8/ES8Hp3uDGVMhG29xhc1LYjwPx3aIie4S7KynkErDwjGirBfP1jWvg9/WEZ4VTZSQNwTZK7scZ35zcKC0C74N0ISV/5kVdQ/PqM5RQtCSi5Dth5mH4v+EvcnTQ0Ji7ljdZiW8Y4/jICBOODWImVgZ6mUlZcM7G86lrraZcQYWsBBx+4FhpQwRTx5TtA8rNYclW5/koJC3+q8Sl2PIPWH1y0WkyVpqWfwi8l43ztzwHQ4fd9LdXj5GW4AMnCQov2ZLu47Ivp1iQ9o/6vlHdWgfKxDaLNSawGFZscUfMKQEJnWdzdW1aITmOl93qwlvxihgN3CAJPpoNYctyQ/afZwa6H2+35/QphK9dbTZ9PuGA/tx/rQEzdryeC0lBcTe5BXwSDkcrF39+CWfxL+UPC3e3eDpos+q7Yx/fwVCc6Jg3vDTO/oASlj5JeBNPcjY7WmP2m+BhY5GjWyLGlSC+tRNsZ/MMrcMhix92Oi+Coc4678D1HIA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(23010399003)(82310400026)(10067099003)(261021121427099003)(11063799006)(56012099006)(261021123027099003)(261009223027099003)(261102123227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jEnVYXEe6By0tveGmn7Cqt1VolPeQ3ao/1YxYpSxwZOL5H6FGN4igse8pfTePkkg9V8YHVETOP6fu0BQZzMpol31ZRYSWtb1Hd5hPE/QTyPEdZHRmzPzIRoWhHEQ9rjVMH2VwMLqsKaLphCOIsdIm4y35WJrGevmRdh1zxGsILI3/Fl3j3sQig4peX0OXMkS3HuNnHc94UiaXXR0iP6ntm5S7xPAw3XZcc432F+QGndgha+13tI/Jq4re3NdrdaEd2sdMyRf9f+rFuskaOmvv1SnW8FzFUYgT4ptJ/YrTlkuirFyqiP0WeWYAR47NnhtPu7VPHtTqemPbMdtGRyCK4nNP801+2yG0IqM/XAydaAJGrvBqMGkLg8HZN3OLRiOtT5YUIUNoIKGFBslME2Bj2U0dUm/6RXmBwBrY7lQQGgrzocuT5oGA1Q+Xcm9H9kI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 07:52:44.5112
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68f0ef37-af17-4a65-4372-08df49ffecb0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF80B25317E

From: Patil Rajesh Reddy <Patil.Reddy@amd.com>

amd_pmf_init_sps() and amd_pmf_set_sps_power_limits() check the PMF
interface version to decide how to load the BIOS defaults and how to
program the static slider power limits.

Move these two operations into a per version struct amd_pmf_sps_ops and
select it once in amd_pmf_init_sps(). This makes it simple to add
platforms that have their own APTS table layout and SMU messages.

No functional changes.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h | 17 +++++++++
 drivers/platform/x86/amd/pmf/sps.c | 59 ++++++++++++++++++++++++------
 2 files changed, 64 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index b29c5192d878..215dedba5779 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -620,6 +620,22 @@ struct amd_pmf_arg_data {
 	u32 size;
 };
 
+struct amd_pmf_dev;
+
+/**
+ * struct amd_pmf_sps_ops - Static slider operations
+ * @load_defaults: Read the static slider defaults advertised by the BIOS
+ * @set_power_limits: Program the power limits of the given power mode
+ *
+ * The layout of the static slider tables and the SMU messages used to
+ * program them differ between the PMF interface versions, so the static
+ * slider handling is selected per version.
+ */
+struct amd_pmf_sps_ops {
+	int (*load_defaults)(struct amd_pmf_dev *dev);
+	int (*set_power_limits)(struct amd_pmf_dev *dev, int pwr_mode);
+};
+
 struct amd_pmf_dev {
 	void __iomem *regbase;
 	void __iomem *smu_virt_addr;
@@ -630,6 +646,7 @@ struct amd_pmf_dev {
 	struct mutex lock; /* protects the PMF interface */
 	u32 supported_func;
 	enum platform_profile_option current_profile;
+	const struct amd_pmf_sps_ops *sps_ops;
 	struct device *ppdev; /* platform profile class device */
 	struct dentry *dbgfs_dir;
 	int hb_interval; /* SBIOS heartbeat interval */
diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
index b0031afae33b..2006aca200c9 100644
--- a/drivers/platform/x86/amd/pmf/sps.c
+++ b/drivers/platform/x86/amd/pmf/sps.c
@@ -239,6 +239,13 @@ void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
 	}
 }
 
+static int amd_pmf_update_sps_power_limits_v1(struct amd_pmf_dev *pdev, int pwr_mode)
+{
+	amd_pmf_update_slider(pdev, SLIDER_OP_SET, pwr_mode, NULL);
+
+	return 0;
+}
+
 static int amd_pmf_update_sps_power_limits_v2(struct amd_pmf_dev *pdev, int pwr_mode)
 {
 	int src, index;
@@ -269,6 +276,39 @@ static int amd_pmf_update_sps_power_limits_v2(struct amd_pmf_dev *pdev, int pwr_
 	return 0;
 }
 
+static int amd_pmf_sps_load_defaults_v1(struct amd_pmf_dev *dev)
+{
+	amd_pmf_load_defaults_sps(dev);
+
+	return 0;
+}
+
+static int amd_pmf_sps_load_defaults_v2(struct amd_pmf_dev *dev)
+{
+	amd_pmf_load_defaults_sps_v2(dev);
+	amd_pmf_load_apts_defaults_sps_v2(dev);
+
+	return 0;
+}
+
+static const struct amd_pmf_sps_ops amd_pmf_sps_ops_v1 = {
+	.load_defaults = amd_pmf_sps_load_defaults_v1,
+	.set_power_limits = amd_pmf_update_sps_power_limits_v1,
+};
+
+static const struct amd_pmf_sps_ops amd_pmf_sps_ops_v2 = {
+	.load_defaults = amd_pmf_sps_load_defaults_v2,
+	.set_power_limits = amd_pmf_update_sps_power_limits_v2,
+};
+
+static void amd_pmf_select_sps_ops(struct amd_pmf_dev *dev)
+{
+	if (dev->pmf_if_version == PMF_IF_V2)
+		dev->sps_ops = &amd_pmf_sps_ops_v2;
+	else
+		dev->sps_ops = &amd_pmf_sps_ops_v1;
+}
+
 int amd_pmf_set_sps_power_limits(struct amd_pmf_dev *pmf)
 {
 	int mode;
@@ -277,12 +317,7 @@ int amd_pmf_set_sps_power_limits(struct amd_pmf_dev *pmf)
 	if (mode < 0)
 		return mode;
 
-	if (pmf->pmf_if_version == PMF_IF_V2)
-		return amd_pmf_update_sps_power_limits_v2(pmf, mode);
-
-	amd_pmf_update_slider(pmf, SLIDER_OP_SET, mode, NULL);
-
-	return 0;
+	return pmf->sps_ops->set_power_limits(pmf, mode);
 }
 
 static int amd_pmf_profile_get(struct device *dev,
@@ -418,15 +453,15 @@ static const struct platform_profile_ops amd_pmf_profile_ops = {
 
 int amd_pmf_init_sps(struct amd_pmf_dev *dev)
 {
+	int ret;
+
 	dev->current_profile = PLATFORM_PROFILE_BALANCED;
+	amd_pmf_select_sps_ops(dev);
 
 	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
-		if (dev->pmf_if_version == PMF_IF_V2) {
-			amd_pmf_load_defaults_sps_v2(dev);
-			amd_pmf_load_apts_defaults_sps_v2(dev);
-		} else {
-			amd_pmf_load_defaults_sps(dev);
-		}
+		ret = dev->sps_ops->load_defaults(dev);
+		if (ret)
+			return ret;
 
 		/* update SPS balanced power mode thermals */
 		amd_pmf_set_sps_power_limits(dev);
-- 
2.34.1

