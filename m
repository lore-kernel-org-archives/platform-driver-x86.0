Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5E626E6FD
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Jul 2025 06:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753252935; cv=fail; b=jLydrWTqjBkAU6ND2xJ0lfxnJg0q2UMw46ekCXrviDzrvfrlb1FRtIDncbz2eVtWsD+TxMLjpnSH5s8igjoQdEqMPwtR/jyoRwi1Yo2fiyAO90N31Jg36nF6wxFfVdHw2hofD5k9KuQAZ4OgNfUB653+OiBVqagC32Vhu6lzKgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753252935; c=relaxed/simple;
	bh=5PW0i4WE6WBUfnhrYxRRzZ/p11aNqXjZe+IUWjf19HE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hSNKMQV4mU2OkbOqMde0u4Kh5nKUEWdllxzGtBB/shtEiKqiIUXrpv+okLv/FtvpXjypCiEk8Uq6NSN5bsQt+UskTBMadvDSg/9MsSdtNlnBo4hLY83j2GaE8yigJVWD15vtm4UvvAPAq3mLKzo6v0heeb4ZrssX/C1FQRNwfE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VSK/k4GN; arc=fail smtp.client-ip=40.107.237.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VSK/k4GN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H5/m+zjXzUZZ0DXDg0tQGfAAxeLbm2OtCPriwJethZ9jFNsOkBPB9AgxIEfQ2o9ftUXeBZrHw1FPdksDhP+/1U4dbApdoXFrfcfw3RQdEk/3Cy05R5EISGyw8VGdsrbD4tgj4b845OzbHjn8DK9yrLxIdQ6gM8/5LS/Eky+AKPd0mZBnmcY2OjHiTe49/4GLnzA2QaaUZrbXsca1+oNJFtxx05aml1LxIyRGnFIylPwozXwm3z02i0Q99oTUn63Bfu0DtnvNo64wgHLQx8vSvtfKojJYSfvRdCLsNwSSOglVpkM/Lkgs6EWraeVpudNJnHDlDJ5Y4YHeJILD0ewtpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WBUfhJmevz1q/2ci20h9T2xSVQPndC6y+eECfz64HWs=;
 b=QLV8DWH0Lm6mfL4RYhnxARl555rQLmNGb3E2+n1EbNfguwrscPU2+C9i72ZONuXDwtgG5M0C/nQ7lEZuAPMFFvgznXjgb1E0AKpiHSkPAPyDBPCrFGsZAwsSeLv0HMm6+7vjtyQb4OoC6hOlcT08MlsZq+ujRuvwYTWi9cGz/grSSObPIhc0fxGA85pXNfohlvpO/Sjtz2pZwGkK3a7j6oC229XyT5S01j0h1QZVM/R65PbqDO3dAkZXMtiqz9pp8QvFf/IM3VifGoIYMdLQWdSnCKvNGOBpRPSCTh2hqNzCppdn4JSoyGZSD7I6tD6kv0bPKE23GV8bgHzU/pILJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WBUfhJmevz1q/2ci20h9T2xSVQPndC6y+eECfz64HWs=;
 b=VSK/k4GN/0gLaYBFwg1lShO9Gi/bK3byfZNi9/z3WGa+7f7JNX7yq8Hs4HeQIsBayruBFzK+jNeDsg7GJX9kevoWaJjGN+Rni7nNtQy0GkHWkImgPdUGwj2ZxgCv0hpeNCMJVkQyIDgcnVreCUD1T6UQdthSK8MnQCicenWoFGM=
Received: from MW4PR04CA0069.namprd04.prod.outlook.com (2603:10b6:303:6b::14)
 by SA1PR12MB7441.namprd12.prod.outlook.com (2603:10b6:806:2b9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 06:42:11 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:303:6b:cafe::d8) by MW4PR04CA0069.outlook.office365.com
 (2603:10b6:303:6b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Wed,
 23 Jul 2025 06:42:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 06:42:10 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 01:42:03 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 7/9] platform/x86/amd/pmf: Preserve custom BIOS inputs for evaluating the policies
Date: Wed, 23 Jul 2025 12:11:19 +0530
Message-ID: <20250723064121.2051232-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250723064121.2051232-1-Shyam-sundar.S-k@amd.com>
References: <20250723064121.2051232-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|SA1PR12MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: db2034e0-c26f-434c-3c98-08ddc9b40d42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?I8Ca/O6tl3Tf3FNrsetE8CSx8q4QWrzDQ++28cN/nrAgzD7HQU1ewld21lV1?=
 =?us-ascii?Q?/uY3g0+wrL+akCsvEiHlpov8fpgbd2HUcxg4SU5D0/TaF+JV5DuROiZfa1Mv?=
 =?us-ascii?Q?9zAudyIqEXXFJEc07ZpU0hqefMmjIeVvJ4PA9lDyKCUbLCFk3jBsRPbsuVp7?=
 =?us-ascii?Q?B0/cbk2aw7BjDMKRWIVsrfPi5B3+JOuHEMF5/d8ykK0n+TG7MH4oyiYjGxwG?=
 =?us-ascii?Q?GbDJ9kDMDNryuKevpPPKtyTGlCvPKgvxirGnZfbD8cjIH+faUc7OlBrus/mo?=
 =?us-ascii?Q?JBIVSHGILDWF9aEF1iwtIuXKrbeHhX2BekCidJfLWc+h87zRXxpbLCZXB6U1?=
 =?us-ascii?Q?RctHsFBBUZo7JBi43e+zmVaMhXPe3GR/a59ewL3orCBC9q4BK0+p4ItP+MQ2?=
 =?us-ascii?Q?gCyCCrIlvbVakUsUfXxLFqtSpUgX+ogGwaNkTFSZ7lpjw14KUD+IqOKxmSd+?=
 =?us-ascii?Q?Dp8fyGCSMjkktnZE0ndXCeh4L/dgzgvLfXS6LySRzOJIldpIdmragYak3q1+?=
 =?us-ascii?Q?mj/Sv6U4hUdrT82a7uFH0B03mzR4V4l2cRZ20NkBDj52J71Nd3ePMFoZVR8h?=
 =?us-ascii?Q?6dEZ4uPc4XdIkpDDNw0fHqnEV/YMgMDGNopOe0EWrlvZFdsnc4jkJ9yQer3P?=
 =?us-ascii?Q?vjhNYBct/ECGRn9kkj7PabYC7vUy8bqeZJjR8If/OsSD+DtKU859cY0CAiTJ?=
 =?us-ascii?Q?DHxj5gTM8bX7xlBpLtkptjC60B+Nke4eRnTgH8jvt+ZPHiX5NPiePegUSOpJ?=
 =?us-ascii?Q?Skd/q9UJXo+1EfIunS7QdZTjkfDhog1Z06K02H9cvv1dqEZ1YSkJp0fUdfJ6?=
 =?us-ascii?Q?VoePuFbRL1AtZhrUKHj2uovoRxwSusWppZGgwCYwAXpGV2P67kkqSjc8jO8y?=
 =?us-ascii?Q?gP88C8sXRP2FdwfG3vDXuMryiTdRxJVQZRjFOPnn/IO9Ki8MT3883+pu6ra2?=
 =?us-ascii?Q?EYJOMxco9y3mh4zQmdcsJ6/ij2H/9hNX6V9bdhPXMQSEbWdkI1KJwwhQi4jU?=
 =?us-ascii?Q?ZVta57MIF5LJpbMqQakrEergfTl4Mt1aU2wMCPEmWpChiBKC7zHe0Fhxv7Wa?=
 =?us-ascii?Q?HkqnT4gavweAprCwApUqNNv/6UKZEcpJ1RcZwLZA+o49gy3LEsHGax3B+ueS?=
 =?us-ascii?Q?AuNKupJ2QV6AVDVH/lO5Yn6AAS/ry6ZkbikC/SPB7t5HBMZtp9sAdWzBGkY6?=
 =?us-ascii?Q?KZ+v+7b9+zuoUHaQruQM1+0FtNgR5TB1jEEZB37YIJ+fPdqN/H6U1Cdttmsa?=
 =?us-ascii?Q?uy1HSG4EeV4A+ZmwAwLFcy2LkdTMIhIAfzVyg03tAwSUj+S6FOIxWrSoqMiJ?=
 =?us-ascii?Q?EhGNm0HOOo16LWh/mH5Hs0uI65LR/kgzgptraeDqMe/Y0dbO3ftxwm5HhQMI?=
 =?us-ascii?Q?izp2bU9THSr8K1dOO+4lL9FVc64GEtS7imc3nj8wCzsKo3LpUHIcOaFPZdf0?=
 =?us-ascii?Q?KlHmuHoNRA7JCTDkG5PG6IDeVIdoxngEIASiA012geGo2M1e/rtQGWoQM0Wx?=
 =?us-ascii?Q?ytfxr2WtddTxyniPpHbRb9GRjebodybJE44d?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 06:42:10.8889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db2034e0-c26f-434c-3c98-08ddc9b40d42
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7441

The current code fails to send multiple BIOS input data to the PMF-TA
for policy condition evaluation. Only the most recent BIOS input data is
properly sent to the PMF-TA, while previous inputs are overwritten with
the zeros.

To address this issue, the BIOS input data should be stored and passed on
to the PMF-TA.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h |  5 +++++
 drivers/platform/x86/amd/pmf/spc.c | 11 +++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 0af7629ee713..c1b2bcc22acf 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -355,6 +355,10 @@ enum power_modes_v2 {
 	POWER_MODE_V2_MAX,
 };
 
+struct pmf_bios_inputs_prev {
+	u32 custom_bios_inputs[CUSTOM_BIOS_INPUT_MAX];
+};
+
 struct amd_pmf_dev {
 	void __iomem *regbase;
 	void __iomem *smu_virt_addr;
@@ -401,6 +405,7 @@ struct amd_pmf_dev {
 	struct mutex cb_mutex;
 	u32 notifications;
 	struct apmf_sbios_req_v1 req1;
+	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
 };
 
 struct apmf_sps_prop_granular_v2 {
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index ce13b8cb85fb..6cf179c9ae8c 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -144,14 +144,21 @@ static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, u32 pending_req
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++) {
-		if (pending_req & inputs[i].bit_mask)
-			amd_pmf_set_ta_custom_bios_input(in, i, pdev->req.custom_policy[i]);
+		if (pending_req & inputs[i].bit_mask) {
+			amd_pmf_set_ta_custom_bios_input(in, i, custom_policy[i]);
+			pdev->cb_prev.custom_bios_inputs[i] = custom_policy[i];
+		}
 	}
 }
 
 static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
 					   struct ta_pmf_enact_table *in)
 {
+	int i;
+
+	for (i = 0; i < CUSTOM_BIOS_INPUT_MAX; i++)
+		amd_pmf_set_ta_custom_bios_input(in, i, pdev->cb_prev.custom_bios_inputs[i]);
+
 	if (!(pdev->req.pending_req || pdev->req1.pending_req))
 		return;
 
-- 
2.34.1

