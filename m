Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795506774;
	b=XrmzXrHR8udvbQTzqbLrt942nwO0ri+2kmyxjjuuDuNRLR3nsrtf5vqmWyJ3BmFBETuW
	 LPEYMcb9Ad/Pb1Puxkr171cx6eqjMwEK3a7zbX9h4n/+ugSjEqgt7w1i/gIjPNveXQ2Cy
	 M26q9SDFj/on//i/D38Q1CDyJoIBBHjl+SsVjcHUqqYoGTjfQR1kXWmLfcKjhDpn8nBz1
	 SFUQgJRpPnyimTDWZD4reDJ9egqsz8xnMUEqjh0x1X4XMLXHwPiwK0/qoX+x+3y9qm/57
	 JaOQ1cSODTruf2XTiLgxm4QSZBvbEqt7RrBEpSJWn9+COA5jc0r5jXmcjBY2E7Dh42A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506774;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
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
	bh=ehkeFO2EJDLsrgKvVPc77p3sZO/3cGGRSSSWeHBkvPw=;
	b=ZvLEtYMNDs0mSEieYkUJk5IODWdgxMR1rrnhB5adb9p5q09AzXUD/XsUIF4Z/N1qaEu2
	 dFbtad7QXx4G5owk0BvTwzLKFnbgq8OSsxeg4JZvXDRXcbZat8NB9+vhi8robhOyPLvoa
	 xPFsvtkqTC0QiSOx5mHcbnYLLLsdLu+S6OtAuw472ZxFFph67pe+kD27R1s4UUtqthvEY
	 EH0T8bBwuBHR4LUmCRawHrwTJJVu/u7F4+lD+qAI1U/p4NKwqPSFG/KJ62hsO+Yshi5RZ
	 3xsYDTB6IJdXNcPAd4V7YiqYG8pUBQkkgNnFoqFlB8JCCyB217tys1hKywY5sjd1WQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=n37oI9OV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.35
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012035.outbound.protection.outlook.com [40.107.209.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8925606A33A
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 07:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8925606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=n37oI9OV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4skCOFUo4nwIA3zx1n0294Cg1V39jaDtYAz8OXq9ZC5NKsHganqkoorB8PuA1MFTa01uZafNdgM4O2n+nkWD1VFaumvXhaV5rdm+Dv5YdS6hm5R5DAOm6yjhUGFlCamYGjB9NpX7VQAp9U+aRZkP/abDeLW0DPDcEe2I+Ga3Iw9tov8ByZx5Yz+yF0cObaDQODv0UnFAdyni431T+xJ3e8jpBOkSYa3ZzOWZGt9Nw/HVxCoLmvqc2YqOTfocdQ3NYzbMfyu11ZJh2fRQpTcyj4ptNnfaD1OZ4+DIB1gBBD7jw5dFaI34+J+qX2Ar7Nli+CpOhgeDu/ynOThUy0c7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehkeFO2EJDLsrgKvVPc77p3sZO/3cGGRSSSWeHBkvPw=;
 b=ksRrQL+EExEZO+4vxaUKLvZ788PYjLTRTSqC9rqFRFID/2DyEBcemLB07mIEcgTKoKu+RPPmP2EYOYgz//ZcYYyi8VPVVFjhbRU3L9Gilej8YJ5Gz8sa/e3dFxn+otk3pmaKEbJ44MuagtJqAW3lmj9cVBOKjwMwaQIJjQZRS+koWUxoOsz1sYYcZVUVHYAQFoNY3YV0AickKTE5qtZDu6dI0Jcj1QYNCss3IEQzHh583UNxtrxC6D0VIixt7/ePGNJ+x5rqHH40sPKoQUnNAJoPZMlua5DfPaIKEClPdSL/0miQiSWwGrW4RS+Q1jKVgPAn90OdPFmBStC0wDmKpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehkeFO2EJDLsrgKvVPc77p3sZO/3cGGRSSSWeHBkvPw=;
 b=n37oI9OV8A4dAyvJbFxuDZ99n/zFxGj4bBv7DXODADtk6dsJmtn6CfxszhJty89h9Be3cZ8u5sakdzFxMYc9cAPAwbOlBgyb58gSlwgARRs5PdrVkaixI2Pi2K8PYD/3r38PRkdJWQeR+q48Jxagqr+bTwqsVufmw6jt/+goN0Y=
Received: from MW4PR04CA0390.namprd04.prod.outlook.com (2603:10b6:303:81::35)
 by CH1PPF5EBD457EF.namprd12.prod.outlook.com (2603:10b6:61f:fc00::610) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Tue, 24 Nov
 2026 07:52:48 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:303:81:cafe::98) by MW4PR04CA0390.outlook.office365.com
 (2603:10b6:303:81::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 07:52:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 07:52:48 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 01:52:44 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v4 04/11] platform/x86/amd/pmf: Abstract TA dispatch through ta_ops table
Date: Tue, 24 Nov 2026 13:22:06 +0530
Message-ID: <20261124075213.2317127-5-Shyam-sundar.S-k@amd.com>
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|CH1PPF5EBD457EF:EE_
X-MS-Office365-Filtering-Correlation-Id: 58734f38-dd8a-4c2a-da9f-08df49ffeeda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|6133799003|22082099003|261009223027099003|18002099003|261026140227099003|261021123027099003|261028144727099003|261021121427099003|261022075727099003|261022105027099003|261102123227099003|10067099003|56012099006|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	leSCFhciKJlRsd/NmxO3emAcdtlz/IF8O+SIt1mUj80z0aEgZyAJLN4JEUkiMqVJ4xU3JGeoDvYGjaow+DKNglxe77gIQap+3f364TW0VtNoqwIbJki2KFhzkoHKl/asNpSblLmL0o6EsxJYvlQMyL7wKOtstgLG6VgcQ9In8+Abdu/sIjG5vTQAreyYF/Q7oMPLJipr6Xfm0hFUFLUDGRdAicKd8fkPp5GyBezIBIbD+zd4YRB9O1dUSKz7zAgO287Z8fEbm1E3Lt7MQNGlEz2k/UqMNtF5htxqKtnGKvUAZDMP0A1fKO8o7bA3tqz8908Uc4s+/9Znyse8Xf8XKC+8B2p26tjsVbM9L/EsvVfaFJw+MJcIgtq3NRke/07DsJZEW2noRRrA2ItJSqK0Vf1/Pny7nQrDDL04vZsmbUutoh0QIr5+6Uoz1frALgmJHKMVudsnxNIRAfZKfMyvWyv1/aeaxI316ocD5bT4Cd3G/W1ErlAW2ZNjXCywmYHjxCrnOF7kVHVoXf02cTeZzgK34bOUdL/PPJ0Nzf4Wt+k65kWbHHmhgc9N9i9JKIbYXxpZ5fnGvU5qyLEt6eI+oKn2WTDDA5ZORyfmjjhsjexE53wGYBC6aO1XfMYA7vIiMgfQdfZ5LJTTfwjBAy9fL5MqWkGVjAMVY3lpICaj6KbzeXL4E7MQFay67Y3/ekzJz+R6bVzlHIRLNKKZAbHpIw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(6133799003)(22082099003)(261009223027099003)(18002099003)(261026140227099003)(261021123027099003)(261028144727099003)(261021121427099003)(261022075727099003)(261022105027099003)(261102123227099003)(10067099003)(56012099006)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pM+NJSBaWr0tY7tHjTLg2hjzL5oWXOGKSKwaK5pp1V9PeO49HgHckb6s6sx98mIRB5D4b8nB/5Pb64FzKOaFnU7djHo5ONeG3oLIXc8PKIKunsRoyWmjK7cWHN3xf6FZNzh1F1hHiPpMEWpPp0v7RuwlL3xY7VInAVeZIhhCciH0knvh62aMnwDqsWdUPFWL0UVtNXfRVlbF1qrrMc9Qkenx0LDK3sRVC6mMW3YgKJ3N11EYFtfkNO2EcdnvAtTsU08UgfIDqpSJAjTQEla1DO6AymjwksqJP14S55UqH6Dg60imBFaLgBPO5ddDHKLBk4NIUxfcsPSULQqGasiO7ltf5DqnzZOHtoRtVGHBwv6dSGz2DzJKS1HsGOiWPzuHJIqiAW/ws6aLs2yl7NoLAfRgK3IvRzoBr0HLusk/aHR1b00baeUhBhpt+8s0oiLH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 07:52:48.1452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58734f38-dd8a-4c2a-da9f-08df49ffeeda
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF5EBD457EF

The UUID list, the shared memory size and the init/enact calls of the
PMF Trusted Application (TA) are hardcoded in the driver. Upcoming
platforms use a different TA with its own shared memory layout, so
these need to be selected per platform.

Add struct amd_pmf_ta_ops to hold the per-platform TA details and use
it in place of the direct calls. All existing platforms use the
default ops, which point to the current functions.

No functional changes.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c   |  2 +-
 drivers/platform/x86/amd/pmf/core.c   |  4 ++--
 drivers/platform/x86/amd/pmf/pmf.h    |  9 +++++++++
 drivers/platform/x86/amd/pmf/tee-if.c | 27 +++++++++++++++++++++------
 4 files changed, 33 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index d71d592857c7..11df1b74bb18 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -300,7 +300,7 @@ static void amd_pmf_handle_early_preq(struct amd_pmf_dev *pdev)
 	if (!pdev->cb_flag)
 		return;
 
-	amd_pmf_invoke_cmd_enact(pdev);
+	pdev->ta_ops->invoke_enact(pdev);
 	pdev->cb_flag = false;
 }
 
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 19b75609f554..55c893552050 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -259,8 +259,8 @@ static int amd_pmf_reinit_ta(struct amd_pmf_dev *pdev)
 	bool status;
 	int ret, i;
 
-	for (i = 0; i < ARRAY_SIZE(amd_pmf_ta_uuid); i++) {
-		ret = amd_pmf_tee_init(pdev, &amd_pmf_ta_uuid[i]);
+	for (i = 0; i < pdev->ta_ops->num_uuids; i++) {
+		ret = amd_pmf_tee_init(pdev, &pdev->ta_ops->uuids[i]);
 		if (ret) {
 			dev_err(pdev->dev, "TEE init failed for UUID[%d] ret: %d\n", i, ret);
 			return ret;
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index dcae081a4806..5de862187c4c 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -666,6 +666,14 @@ struct amd_pmf_sps_ops {
 	int (*set_power_limits)(struct amd_pmf_dev *dev, int pwr_mode);
 };
 
+struct amd_pmf_ta_ops {
+	const uuid_t *uuids;
+	int num_uuids;
+	size_t shm_size;
+	int (*invoke_init)(struct amd_pmf_dev *dev);
+	int (*invoke_enact)(struct amd_pmf_dev *dev);
+};
+
 struct amd_pmf_dev {
 	void __iomem *regbase;
 	void __iomem *smu_virt_addr;
@@ -726,6 +734,7 @@ struct amd_pmf_dev {
 	struct amd_pmf_arg_data dram_addr;
 	struct amd_pmf_metrics_v3 prev_metrics;	/* Previous metrics for delta calculation */
 	bool npu_metrics_have_prev;
+	const struct amd_pmf_ta_ops *ta_ops;
 };
 
 struct apmf_sps_prop_granular_v2 {
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 2ed2ea4abeb6..a0f2b4be1369 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -55,7 +55,7 @@ static void amd_pmf_prepare_args(struct amd_pmf_dev *dev, int cmd,
 	arg->num_params = MAX_TEE_PARAM;
 
 	/* Fill invoke cmd params */
-	param[0].u.memref.size = sizeof(struct ta_pmf_shared_memory);
+	param[0].u.memref.size = dev->ta_ops->shm_size;
 	param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT;
 	param[0].u.memref.shm = dev->fw_shm_pool;
 	param[0].u.memref.shm_offs = 0;
@@ -323,7 +323,7 @@ static void amd_pmf_invoke_cmd(struct work_struct *work)
 {
 	struct amd_pmf_dev *dev = container_of(work, struct amd_pmf_dev, pb_work.work);
 
-	amd_pmf_invoke_cmd_enact(dev);
+	dev->ta_ops->invoke_enact(dev);
 	schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms));
 }
 
@@ -347,7 +347,7 @@ int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
 
 	/* Update the actual length */
 	dev->policy_sz = header->length + 512;
-	res = amd_pmf_invoke_cmd_init(dev);
+	res = dev->ta_ops->invoke_init(dev);
 	if (res == TA_PMF_TYPE_SUCCESS) {
 		/* Now its safe to announce that smart pc is enabled */
 		dev->smart_pc_enabled = true;
@@ -503,7 +503,7 @@ int amd_pmf_tee_init(struct amd_pmf_dev *dev, const uuid_t *uuid)
 		goto out_ctx;
 	}
 
-	size = sizeof(struct ta_pmf_shared_memory) + dev->policy_sz;
+	size = dev->ta_ops->shm_size + dev->policy_sz;
 	dev->fw_shm_pool = tee_shm_alloc_kernel_buf(dev->tee_ctx, size);
 	if (IS_ERR(dev->fw_shm_pool)) {
 		dev_err(dev->dev, "Failed to alloc TEE shared memory\n");
@@ -541,6 +541,19 @@ void amd_pmf_tee_deinit(struct amd_pmf_dev *dev)
 	dev->tee_ctx = NULL;
 }
 
+static const struct amd_pmf_ta_ops amd_pmf_ta_default_ops = {
+	.uuids = amd_pmf_ta_uuid,
+	.num_uuids = ARRAY_SIZE(amd_pmf_ta_uuid),
+	.shm_size = sizeof(struct ta_pmf_shared_memory),
+	.invoke_init = amd_pmf_invoke_cmd_init,
+	.invoke_enact = amd_pmf_invoke_cmd_enact,
+};
+
+static void amd_pmf_select_ta_ops(struct amd_pmf_dev *dev)
+{
+	dev->ta_ops = &amd_pmf_ta_default_ops;
+}
+
 int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 {
 	bool status;
@@ -584,8 +597,10 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 	if (!dev->prev_data)
 		return -ENOMEM;
 
-	for (i = 0; i < ARRAY_SIZE(amd_pmf_ta_uuid); i++) {
-		ret = amd_pmf_tee_init(dev, &amd_pmf_ta_uuid[i]);
+	amd_pmf_select_ta_ops(dev);
+
+	for (i = 0; i < dev->ta_ops->num_uuids; i++) {
+		ret = amd_pmf_tee_init(dev, &dev->ta_ops->uuids[i]);
 		if (ret)
 			return ret;
 
-- 
2.34.1

