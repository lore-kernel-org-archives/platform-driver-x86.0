Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BE9241136
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Feb 2025 12:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739880417; cv=fail; b=Cn6DUSOjTpVlnBBK+vlcsu6wruXmc8ivLU4HjIl2iPamvdjrK7JZy2HdZo/b/q9rbFQWRgVtMXzNAbkDrwscrSmDr8TQwjwnRdwkl1xO+N1elVZn+HJ7aeY+76sFCtPK6X2ADBMtBfd5TamxYLsiBLIncqgYHRj6LPkCR5v1fi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739880417; c=relaxed/simple;
	bh=LfqepmlFQB6WJ9DGW4Wdq1t7Lf8y3QguR1luUPC44jU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=opxilyVhQ6NUNcG25+FV5vF9yTIC55P0ZaKA24PlTZmgMVEfOqjy70Gu825G690R6yPmRcR270ldf84zjK6RgV7zGN9pm8fyc1zzxzL1W8sCLOej81yji47nOU5dWqa3iGvCuKpI4gx3rVWMTTwJgzKMuhdNlYin0y0L2TAzHqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zsIYeRZp; arc=fail smtp.client-ip=40.107.237.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zsIYeRZp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pv6jnHAPbMTdmoklrdXck3ctoxC2BwZcThuBK7dR677C7HTEuqEZdb8gPBkAqFBogg/tfIGTNfUUo6bHAL82SOdZ/Jvs8zykUmc6Cv4iStQZ5YKNDDfO17DdyPnLyTkG/CxS9lgYc+qENKOXE3qcvdFYxQGHr/ADAcLeyUqj7nW6mBu9LHlp4LJcx3GozQ+c1TZp8xyjvB/Xw3vc9h9bSAvp2NvL2TpOYktBCCH16iDqGUQ+f5ODCmNKUcMczxoiu0xl8thz+lvtiRSx7ZQIyn8w4ANFMuGPEv76G6tXV6wPaaxclgblqh8ppF+cg+5gNbS7SYAKVUaDowcxBGgpLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zqti3IzlkxrmXw9tiXGHSq1ErM9ASQUxfUBycB10+pc=;
 b=Vdg/72z2nfvBDjW31rTmN+csQso9jVrEuWKD6xHUnC1SRiu/dSLtsqUZnYw50jS/2FPjLkosZr1muIySqIme0wlf5N72GA/T+WUdZD/pocXTKtsqUNJ1dTJbj7fk9c24aDOUPv2hp3T52h3K46R1B9XOpsuCLUCqBXgmy1yOcmmQhT1osZwVTKM6D+w5zjK4oV32zIlv7SgOZ8Q6QDCoLuwPX9t5Eij4oVlXZwtu26KwhDVQBIyZr67S4umEeAhvNUKqMUSmZNbggu1gAA+33VFrKOSLTF2Q3WQ/7Ga6Flf+vt5xF4y9B3Kgr2W5NEK1NeEO2crEg6BVfF7wgi8tog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zqti3IzlkxrmXw9tiXGHSq1ErM9ASQUxfUBycB10+pc=;
 b=zsIYeRZp1OVZZJxGuahin3bHhnPCRLEXEQ3usnTbjuUyipW4p8+Lzhv/tbTf30+qxiPdpX/R0V6mAAfW66Nt/BKyr1H/smHT51imnZmt8X4HrQJrUTQEIx1wNLQ7+CTrClKxnuZbe0XZ2IjzWKJ+8+77LK93rZTDWUTL297dybg=
Received: from PH7PR13CA0006.namprd13.prod.outlook.com (2603:10b6:510:174::19)
 by CH3PR12MB8187.namprd12.prod.outlook.com (2603:10b6:610:125::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Tue, 18 Feb
 2025 12:06:53 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:510:174:cafe::a2) by PH7PR13CA0006.outlook.office365.com
 (2603:10b6:510:174::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.8 via Frontend Transport; Tue,
 18 Feb 2025 12:06:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Tue, 18 Feb 2025 12:06:50 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Feb
 2025 06:06:48 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 2/2] platform/x86/amd/pmf: Update PMF Driver for Compatibility with new PMF-TA
Date: Tue, 18 Feb 2025 17:36:25 +0530
Message-ID: <20250218120625.1718196-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250218120625.1718196-1-Shyam-sundar.S-k@amd.com>
References: <20250218120625.1718196-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|CH3PR12MB8187:EE_
X-MS-Office365-Filtering-Correlation-Id: 3406a01f-b6d8-489b-4656-08dd5014ba3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k7Ho9GCnuRkjTLKUxh99j38aI1sJRxOqzbGDfCp+mtAMxHZ8S+FXBN8wF8e7?=
 =?us-ascii?Q?lWUw+Nh0S9ipZS3DIzGDP2xqsJm2U10D8WO+C7TPD+3aqxBzgUVJRHGkqDfv?=
 =?us-ascii?Q?iehR3s7QUyub1FOB+1RRoCFHveqe3OQgjBEXZzqPpCzWwSzjzoVHrkC/J4Z2?=
 =?us-ascii?Q?3/xiBqdRr2s3JHDaUHKO6eRhpJBpY4BWW/VNwPfU1Cz1eGlqaAqaU/KjwMmc?=
 =?us-ascii?Q?yC9FBXKGBuw2w3wOShJM3MpRfx+GL/GA2H5qxVn0+Rs63WHqu3cK94Cm8/ZT?=
 =?us-ascii?Q?BYEgn61uZR0LTxw7OjdVuVMeY46D6hpBuvtdSoi1RS3Cwm9pQrSITNzqGdhn?=
 =?us-ascii?Q?7/If0yWRob6aomnCf6aGIUmqHEQnBKqhaLR/CUXwoY4uXeguT6CXPZ00XTgx?=
 =?us-ascii?Q?hNSU9uv2pdQQKucjkuoPee68T0h5BVM7808q1Z2ekbq+tpDDOK1DQOjMRZ/r?=
 =?us-ascii?Q?vTwqSPZin/7giQ9vLJJu4hZmxrqd8tW33Q3uWngiwHvfqv7Oty3IUwYrVS8+?=
 =?us-ascii?Q?g5vC3a8Xbhu6/HfMw/M7o1CpdWkX341/7DeJEvIzYun5kaBiTXQPS3sg+pF2?=
 =?us-ascii?Q?cHY3J+1hZ8ra7vfjdX7i6C5gc7SWBKV+bMWyApEBv4fsljDd9fy+Wy7zEfVp?=
 =?us-ascii?Q?i3TV0Kp7r61fdUkX2dBoKk5HsHmXoiDqEueMSixaNIypzGc2tg2MutEt2URj?=
 =?us-ascii?Q?Wb/hmuoSwdItdyHJ5P6TLx6pFbuw5Q2nAIpOXKEeQ3PcoGl+ahriCnI8y/B8?=
 =?us-ascii?Q?uVs8LULLcsL8YIDs8GrmOwJ1vyJIn+PhD3RIZbR5AFqy/MF6zOvwn9pJanMB?=
 =?us-ascii?Q?SbQjtdlhTAIMqTqlGwpS0eXWH9zQAOmTG4RUvzzygjXecMK1ID7YZG/XlfTN?=
 =?us-ascii?Q?cETUQbVSSFg8Ct+4Fmj+QUsSQvo7YzfDTL0dvJfYKRhyYqt6TTUqTkcL9JR+?=
 =?us-ascii?Q?WSmr7743PZVJ7sgA9v0SVbb7SSsYza2BSL/0IfcKcX0xj0UtbNwN839+uekM?=
 =?us-ascii?Q?f98ZvtwAWqILkrpXOfDxthJMOovyGyrG3NFHkf/WA08zFPs4W9v4j8pkj43j?=
 =?us-ascii?Q?SWIp/WTi9GtQjdrLBo4vUL9HfUJZq3UO5/KXKbhE2nADx1uSCoIEjJXxCAHE?=
 =?us-ascii?Q?UE4MHdqxdQaPvbto/e0nglmp8oHMPVGOY5BBtK9/QNgaP+lNUrq6RLvB/dk0?=
 =?us-ascii?Q?eXcG33AbCfpfVxV6end1KRuJ0TGLnJiaszVtu1iVZQ5flYLqHqD9g47edMLK?=
 =?us-ascii?Q?Lvajihf4AfvnHZ4kib0saX1NLhO0FEu6ope2Ll1MiJdp+BUOLuwVKseDpkIE?=
 =?us-ascii?Q?XgAbiuqUp8ygZPFxBCppKxSYo5rcGRRWXt4E0cHEi7yCmDMfhunPiWskHs5I?=
 =?us-ascii?Q?ZM8b/xc0BW6xXjLF50aJeFM30uR7PA9MxGSB3tdT+/SVKGatVPtzAVLRInwA?=
 =?us-ascii?Q?f5iMgQjirDCFhD1wZVnmZiUCHX2uqGVfTZNANWrVCD39/bccJOM5+BiqbzJa?=
 =?us-ascii?Q?10z1zHl5ZjvhxRQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 12:06:50.8865
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3406a01f-b6d8-489b-4656-08dd5014ba3a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8187

The PMF driver allocates a shared memory buffer using
tee_shm_alloc_kernel_buf() for communication with the PMF-TA.

The latest PMF-TA version introduces new structures with OEM debug
information and additional policy input conditions for evaluating the
policy binary. Consequently, the shared memory size must be increased to
ensure compatibility between the PMF driver and the updated PMF-TA.

To do so, introduce the new PMF-TA UUID and update the PMF shared memory
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
 drivers/platform/x86/amd/pmf/tee-if.c | 50 +++++++++++++++++++--------
 2 files changed, 40 insertions(+), 15 deletions(-)

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
index b404764550c4..a81c661abd7e 100644
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
@@ -534,8 +534,30 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 		goto error;
 	}
 
-	ret = amd_pmf_start_policy_engine(dev);
-	if (ret)
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
+
+	if (!status && !pb_side_load)
 		goto error;
 
 	if (pb_side_load)
-- 
2.34.1

