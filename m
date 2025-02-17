Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C36A383A5
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Feb 2025 06:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739775018; cv=fail; b=RuvMUoZDXre8AWcgtxiV1Q9SeEt1ZpDRJ6hEHkiVmIRQ42AzOCCLWbXFjXqjuWwN/iUK2x30/E6APcSvk2h9fTfN2GEof9B/QBzVRscRBo/BDxHd//B/evF1wct+B1ayM1nqi3Jo/Fl0ehVkzHM0w8t7apcUH8N6bpxfuQQ49+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739775018; c=relaxed/simple;
	bh=nBvotF4lThriEflHTLO7tH3q6rPevfcB4A+kt257APU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i6FDIltAv2OGurjvHcIdC4JTVA/HotU/mUm+mw0E0mAwXCoUAfWLdm7t8YaKPTmL5/oUlFyhzFz5Hw7GwGOhJ5ca5mS4UOg5jZAH7EnFrrBj9//8l0b4n9xTUnFd1Tb4PdrfYLZ5iR+ohwLS59y3GW1fHXs69zRCxFkRQXOdSvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PRl9VZVD; arc=fail smtp.client-ip=40.107.237.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PRl9VZVD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1/9JYVCcqNsVXwATzQlyfOry8yOXCHXDU/jpQZfSoXMyiAXvMdKVAieMS/h02llyqxaf1GiVWmzaOWVe85nNQ2iUFw6CKAF7DDaULP1NsWbdRq0rAF4tql2BxbJfwOz6kD6eiVF1cwrjO1cvzqg9phkZCrR7FN11zik0Jsvs3eJqInT68eX9B2+qNMH/Zjgi8CH95/WSmpir+MWADt6Zo62gIydZ96Y7aaWl9wH6e1Qlkw/Go+0tBfA6smCNun9VMW30TptoRrXRIDxRVGrmMlTFq5C9XvQf7p7Ys52Gr4a3BRJ+/PyeK1kSwDrEueGpy0bBrzkr/i3b7SVpNQVsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9HsKIabyYCr78xoS3h5Uh4o43sWoalZ/xgaFD976D4=;
 b=oin6BBpun7J+Rdj2MGB6WSxNHuu/hpGtefe/QlkZs9iAPYRGWQKocn7F6rn3QwRcYkVB80eCl294IErErqB0RX/ko9WaHAZ2bPyg76jufyZj5TAh8pUGTS+DdPmSpB3lGkMZW2JaAtMVYkNO/vkJtGrVJ2g6dM0p0b3MR3WhRbI+fOIPQyrWwyg3vyizyo00S0O3K66VWQN7zG4fl4PqgEqSvhlH1GgmlFFfCjDyuB57oNeBfugvNNTKk9EhmcYtAzmhbWMVs0SWMTikJRjN0RJV2Zs8LWHwXOoCvdEc4F6h1D44oc3Fm4i9r2X9JuTLwkF6qWTaGEy1rIqJvD52ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9HsKIabyYCr78xoS3h5Uh4o43sWoalZ/xgaFD976D4=;
 b=PRl9VZVDgTMUOOytCirnriv1qqCSxNvA2xq+hbleCJZsSI68RVLNyG5NdjhVqzMSyTAaEHnN9jWb7EqERn4hOey/vlopDVWuHE/nCPsH1qKme8a21kdDhyaSGtrrn4CPMaUcS/vrlOtSCgXGLiRF+fpX970pe6ebwMX0qthE+gQ=
Received: from SJ0PR05CA0186.namprd05.prod.outlook.com (2603:10b6:a03:330::11)
 by DM6PR12MB4482.namprd12.prod.outlook.com (2603:10b6:5:2a8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 06:50:12 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:330:cafe::d0) by SJ0PR05CA0186.outlook.office365.com
 (2603:10b6:a03:330::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.9 via Frontend Transport; Mon,
 17 Feb 2025 06:50:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Mon, 17 Feb 2025 06:50:12 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Feb
 2025 00:50:09 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 2/2] platform/x86/amd/pmf: Update PMF Driver for Compatibility with new PMF-TA
Date: Mon, 17 Feb 2025 12:19:37 +0530
Message-ID: <20250217064937.98702-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217064937.98702-1-Shyam-sundar.S-k@amd.com>
References: <20250217064937.98702-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|DM6PR12MB4482:EE_
X-MS-Office365-Filtering-Correlation-Id: e2a38bf2-0a08-4bde-441f-08dd4f1f53ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AGUmf45l36+g77an3fVnX332DrqCoj5XguIGLUu0c5+CEfLwnflYftTfgyjT?=
 =?us-ascii?Q?zerlKriIaHzLfu+M1HFlhJKwlzQTgt1plbZlGhYb4TFFlDwcTNzw5vOJrBUK?=
 =?us-ascii?Q?OYbf6vttoamHu7TEs1Wf+01lGgkQlrAspvbapY5mk7HUW319lCFzZUg++PrD?=
 =?us-ascii?Q?gA1VH170fzm0Gdp6gKeECBy7rndrFLN8WEm80fjbqS87wjAnT8sbjfaHko3f?=
 =?us-ascii?Q?7P0a4pAmKnFl8vHN2CnWALbVI3TRXzPJ1QImUl8V1nVHuHwPooZCFA5yDQy3?=
 =?us-ascii?Q?8A7ntduKXzQ+EnU5cXyIIZVlrJZJT5fcdwqSQplgnoaWAQQIBmXrh3JO5jno?=
 =?us-ascii?Q?Ll59e0LzlVNNlTfH25Tk4pQ98sSxbgx2Qins0fBkmmz4BXN5YW8I6RLCCqpg?=
 =?us-ascii?Q?OrmH6J1qVQ9X8EgOHb1S1IaH/tcDTbXjbEUXdIQxPWdmYsYMaG+6sbvoE4Wz?=
 =?us-ascii?Q?xWZVCNrE6BwDJuklHSWSW70zliGv7GkAa00JBPs89vVY+/Qw0PgmDHxrMfak?=
 =?us-ascii?Q?Sr0ecjfm8rFWkz1OC5fcLdguBvpjTJgLBOa0iReSONuc9J/lq5oNH0K0VR0W?=
 =?us-ascii?Q?YnAFV6tg2+ajksL6T50OipS0JF4dyA0QLg+6AmY2W/9W3Xtj9jSceytqdD9o?=
 =?us-ascii?Q?D121YdpX66hq4wIPFRr4eJ9WuOAWVQHp3IsIdV/81YRdgHtSIvNYK+FQRdiG?=
 =?us-ascii?Q?3v4JZ1i9eDMkfN6mJWspmCnleIjQuGtq6Yi6pFlnnsXg0y3sRBi7GyMrWOfr?=
 =?us-ascii?Q?KinUD8AsLDUKJz0JnSYqa7VgC8MjDHVEyMP4ADVMIAiSsKWUm/M47aeCyp5q?=
 =?us-ascii?Q?2ELtJomixWyk4tkkHkYr4/Dy/Ct8q4mHrTml3zipunX6kTaHp3R+4S6CA9xO?=
 =?us-ascii?Q?P2WvBfoIpxchlNPM0pNAykakZx6K50JEZAteoWzp0Uhq3bn2/7YckzhHcNcf?=
 =?us-ascii?Q?HA9Gc8Gh7b+kTFAL45jjlOUiWEY1wOBOa048uJx9TGYix+b9seNOtYK/5Z4C?=
 =?us-ascii?Q?zljsjrQXqZmpkkqRZ4nlZHEMeb8Pv7CvpneMmY4m6GCNef6CTnyTJ/tYFNHO?=
 =?us-ascii?Q?LoIY9UHRwEy2ZcMHVnjgnbZQgalnKTxP7161oqopWBiQJCpDe+ErWabuqxds?=
 =?us-ascii?Q?u6cLU4IDA59iCJNpH3eBp5OK6+LCR3m7oB4dxtMvt/KQN2pZOiTBsWCyM7ei?=
 =?us-ascii?Q?mWuxANDt8GBcezp31giOTicYcpx8Tu3PpG7tkZpAWjrAA6KCQkY2GGHiBvME?=
 =?us-ascii?Q?QPC+e24EsyFco0k2J6SgVRNp5hSuT46LcP+6Cwd02u3BLM2ts3ovEM6SFIKa?=
 =?us-ascii?Q?tiFYKs2UV1gbPn6QguU6RghKa15blCqlHQU+a5KBg04qgHeHatuMshwJA5Fc?=
 =?us-ascii?Q?1KTLdeRAVvcQyODt1DP9020QNP0ySnr1t40/6QMz2BN/T/fH2ZSAWdM5VVJr?=
 =?us-ascii?Q?qSlvQjZ8iwYlK7lRCTrmVxMgM6CsHmQA1najCH2cKCblhacCl5vdupSjl9sJ?=
 =?us-ascii?Q?f7jp3vmLqZBSjJo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 06:50:12.2212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a38bf2-0a08-4bde-441f-08dd4f1f53ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4482

The PMF driver allocates a shared memory buffer using
tee_shm_alloc_kernel_buf() for communication with the PMF-TA.

The latest PMF-TA version introduces new structures with OEM debug
information and additional policy input conditions for evaluating the
policy binary. Consequently, the shared memory size must be increased to
ensure compatibility between the PMF driver and the updated PMF-TA.

To do so, Introduce the new PMF-TA UUID and update the PMF shared memory
configuration to ensure compatibility with the latest PMF-TA version.
Additionally, export the TA UUID.

These updates will result in modifications to the prototypes of
amd_pmf_tee_init() and amd_pmf_ta_open_session().

Link: https://lore.kernel.org/all/55ac865f-b1c7-fa81-51c4-d211c7963e7e@linux.intel.com/
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h    |  5 ++-
 drivers/platform/x86/amd/pmf/tee-if.c | 49 +++++++++++++++++++--------
 2 files changed, 38 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 41b2b91b8fdc..e6bdee68ccf3 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -106,9 +106,12 @@ struct cookie_header {
 #define PMF_TA_IF_VERSION_MAJOR				1
 #define TA_PMF_ACTION_MAX					32
 #define TA_PMF_UNDO_MAX						8
-#define TA_OUTPUT_RESERVED_MEM				906
+#define TA_OUTPUT_RESERVED_MEM				922
 #define MAX_OPERATION_PARAMS					4
 
+#define TA_ERROR_CRYPTO_INVALID_PARAM				0x20002
+#define TA_ERROR_CRYPTO_BIN_TOO_LARGE				0x2000d
+
 #define PMF_IF_V1		1
 #define PMF_IF_V2		2
 
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index b404764550c4..43bda6f98a11 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -27,8 +27,11 @@ module_param(pb_side_load, bool, 0444);
 MODULE_PARM_DESC(pb_side_load, "Sideload policy binaries debug policy failures");
 #endif
 
-static const uuid_t amd_pmf_ta_uuid = UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d,
-						0xb1, 0x2d, 0xc5, 0x29, 0xb1, 0x3d, 0x85, 0x43);
+static const uuid_t amd_pmf_ta_uuid[] = { UUID_INIT(0xd9b39bf2, 0x66bd, 0x4154, 0xaf, 0xb8, 0x8a,
+						    0xcc, 0x2b, 0x2b, 0x60, 0xd6),
+					  UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d, 0xb1, 0x2d, 0xc5,
+						    0x29, 0xb1, 0x3d, 0x85, 0x43),
+					};
 
 static const char *amd_pmf_uevent_as_str(unsigned int state)
 {
@@ -321,7 +324,7 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
 		 */
 		schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms * 3));
 	} else {
-		dev_err(dev->dev, "ta invoke cmd init failed err: %x\n", res);
+		dev_dbg(dev->dev, "ta invoke cmd init failed err: %x\n", res);
 		dev->smart_pc_enabled = false;
 		return res;
 	}
@@ -390,12 +393,12 @@ static int amd_pmf_amdtee_ta_match(struct tee_ioctl_version_data *ver, const voi
 	return ver->impl_id == TEE_IMPL_ID_AMDTEE;
 }
 
-static int amd_pmf_ta_open_session(struct tee_context *ctx, u32 *id)
+static int amd_pmf_ta_open_session(struct tee_context *ctx, u32 *id, int index)
 {
 	struct tee_ioctl_open_session_arg sess_arg = {};
 	int rc;
 
-	export_uuid(sess_arg.uuid, &amd_pmf_ta_uuid);
+	export_uuid(sess_arg.uuid, &amd_pmf_ta_uuid[index]);
 	sess_arg.clnt_login = TEE_IOCTL_LOGIN_PUBLIC;
 	sess_arg.num_params = 0;
 
@@ -434,7 +437,7 @@ static int amd_pmf_register_input_device(struct amd_pmf_dev *dev)
 	return 0;
 }
 
-static int amd_pmf_tee_init(struct amd_pmf_dev *dev)
+static int amd_pmf_tee_init(struct amd_pmf_dev *dev, int index)
 {
 	u32 size;
 	int ret;
@@ -445,7 +448,7 @@ static int amd_pmf_tee_init(struct amd_pmf_dev *dev)
 		return PTR_ERR(dev->tee_ctx);
 	}
 
-	ret = amd_pmf_ta_open_session(dev->tee_ctx, &dev->session_id);
+	ret = amd_pmf_ta_open_session(dev->tee_ctx, &dev->session_id, index);
 	if (ret) {
 		dev_err(dev->dev, "Failed to open TA session (%d)\n", ret);
 		ret = -EINVAL;
@@ -489,7 +492,8 @@ static void amd_pmf_tee_deinit(struct amd_pmf_dev *dev)
 
 int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 {
-	int ret;
+	bool status;
+	int ret, i;
 
 	ret = apmf_check_smart_pc(dev);
 	if (ret) {
@@ -502,10 +506,6 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 		return -ENODEV;
 	}
 
-	ret = amd_pmf_tee_init(dev);
-	if (ret)
-		return ret;
-
 	INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
 
 	ret = amd_pmf_set_dram_addr(dev, true);
@@ -534,9 +534,28 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 		goto error;
 	}
 
-	ret = amd_pmf_start_policy_engine(dev);
-	if (ret)
-		goto error;
+	for (i = 0; i < ARRAY_SIZE(amd_pmf_ta_uuid); i++) {
+		ret = amd_pmf_tee_init(dev, i);
+		if (ret)
+			return ret;
+
+		ret = amd_pmf_start_policy_engine(dev);
+		switch (ret) {
+		case TA_PMF_TYPE_SUCCESS:
+			status = true;
+			break;
+		case TA_ERROR_CRYPTO_INVALID_PARAM:
+		case TA_ERROR_CRYPTO_BIN_TOO_LARGE:
+			amd_pmf_tee_deinit(dev);
+			status = false;
+			break;
+		default:
+			goto error;
+		}
+
+		if (status)
+			break;
+	}
 
 	if (pb_side_load)
 		amd_pmf_open_pb(dev, dev->dbgfs_dir);
-- 
2.34.1

