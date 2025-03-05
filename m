Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C834D192D97
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Mar 2025 05:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741150813; cv=fail; b=OplT9XUH2U/6iJbCOcdWfLnZ3mUQt/K6bUov7BTRn9rxrQeoTZ6BPR4FonW5FC9NhV8e+jwZVuBPmdAsxF24q59/bnA+ibv5PT3Zh/HZLOPoBBcIym9rnvWQW/amZTvt5hq2ctzifmybIeHprxhHWbmq2QoVvOOjeK2Ak+TNTgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741150813; c=relaxed/simple;
	bh=e12pxcHQu8hG5ggyb8cImVGQeX4pXPfoU1usZEpK0kQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jq0PwXkaquUQ3UiG4OfEXBwCyQiYXVyhqKcoq8HumX8UNXCRnEw9ILt+EH/QjBYlsNVTn58KA8hIT7wxKNpGgtDMg3hJ10QPu46c23qK1HjjEYlwjXyz6S8jwjz7KAuseaWWDg32UfDlDbV7hPCBV62BF0ADvQ8v+0591+Ou4CE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GPPgkz9f; arc=fail smtp.client-ip=40.107.220.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GPPgkz9f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y39Ooo1pjeZAcKoj4+u9MJkblBp76KQWwgle3yWdMsVebOLx2MV0oEGaXm8wjrOCuxl2JAAGPrRlfq06n7h/SkFue3xAS+nxbJjDJHMheMdymWpWtMuY9A2c5SReIlt45uQ9XOEIC+F6CKbyBU7Atd+Qx2K3sXvM1IqcbQlq8QcL6/MEgU4/iZgfpiq2BTRWN5jaEIDaP/EvoazLRLSOsHHWNLTl/VQZ6CbEIX9hLCsgT6zA9TCkkkkee+eZxRGK53hsZ+q11PKMVG8N29/jZ8by/X69E5Xm5YlTMVeZtPIADCi0hmSHyOpArtXBEaZs3eanAeXDsRclpGzzti1Fng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qp3k5vjTtajlwEQBiYgBx5Mf296g6fJO/F1khTbshI4=;
 b=vx+uazissY29pctgWdmlMGtVGPCzJfpozLza7xEF6LhJBm4C0uicYoeSsO5OlkAdoGXgHd2am7yK0D9gRMT/CMW8POoqpYBxO26/Hfv3wgvGvUhqvEPewkagHHM364mFbbMgR+eC9WfKCncE4EXxaIP+bx8TnMvYqd9baGxbVTFUSP3IR669CuJM/YPzbXPFjSP6XL+H/hErn/ZIrODGyCYbz5aL83io2Dc3lUp32JfjiHV2c5oRcs44VFBMQSteFL4aJk15faJkZDuAGcRqaLo/C8yU3Mpq2V61NfkXsgE1LVAK3rENp8EGAhiewi76my6p6o+qXAx3BDiaOT34xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qp3k5vjTtajlwEQBiYgBx5Mf296g6fJO/F1khTbshI4=;
 b=GPPgkz9fsvLX08wJn4PMVJrdzpyp9UexUrk4iMwrIUOhuz1Zruy1NhoBqBRNAFWUcV9XNz6/Kj4lZn6Bkkipx8EczKUb5njKVfGpbqt29E20YSxhg6hbkm4v//Xm8wtdCV5v8S7c5WguZMKE4Nx2KuNydaZnoS9rwTXmJd2Yn+c=
Received: from BN7PR06CA0061.namprd06.prod.outlook.com (2603:10b6:408:34::38)
 by SN7PR12MB7370.namprd12.prod.outlook.com (2603:10b6:806:299::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Wed, 5 Mar
 2025 05:00:06 +0000
Received: from BL02EPF00021F6D.namprd02.prod.outlook.com
 (2603:10b6:408:34:cafe::ec) by BN7PR06CA0061.outlook.office365.com
 (2603:10b6:408:34::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.16 via Frontend Transport; Wed,
 5 Mar 2025 05:00:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F6D.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Wed, 5 Mar 2025 05:00:06 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Mar
 2025 22:59:58 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 2/2] platform/x86/amd/pmf: Update PMF Driver for Compatibility with new PMF-TA
Date: Wed, 5 Mar 2025 10:28:42 +0530
Message-ID: <20250305045842.4117767-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305045842.4117767-1-Shyam-sundar.S-k@amd.com>
References: <20250305045842.4117767-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6D:EE_|SN7PR12MB7370:EE_
X-MS-Office365-Filtering-Correlation-Id: c1c1f5d8-12e1-486c-df41-08dd5ba29900
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lYOsWDUwJrjIJ94nJcbgkfUNrUFTfA9JMRfO7g/N1fjLJhirVAkdLHa0cxXQ?=
 =?us-ascii?Q?tK0j0MTNUoyi/7hWxqqidiT2Ct+qbylWEfGzI5VfTIQ09sQXKSLzTgYiMCx9?=
 =?us-ascii?Q?ydSXRU5nb7bPtWF76b0vS4AGx0rPkGPWrza9PX7lu1/F3tBQ/ucy/2JdQKh/?=
 =?us-ascii?Q?RHZlc5vNTjyKCtIdBqz1D2oR9iWhWZDovSAXFmZGqceqdksparZ3LGunJgJo?=
 =?us-ascii?Q?tQQ0Xzd3/Wj9KKJjn6KdpKmH/dXVZLimn1fV8nm1pCgrhNvJPWTNGXzjpn1K?=
 =?us-ascii?Q?PTFbkDakzckIzSJrxNJWKUJsqo8H9Vvy+1QFYxiaax1Z5Rhp+JIug3j3DCIt?=
 =?us-ascii?Q?sk9Icd+DCKPdOrdM/u9V6FRn/HNZW+W2oO84YXK53MtXwsDrIBZQjGUDquFy?=
 =?us-ascii?Q?rA/GME5c3KnMKeW8ZtERhgAkmOzYIVLy57CrkRgojwjiSYzOer7AyJTLpF/6?=
 =?us-ascii?Q?T7kQMU4irYyTUI0a2IVjlFNpSWlxALeWsz5bmf04uDqKSWDrhyZ1+yDkS10h?=
 =?us-ascii?Q?W3AAyvz8MbyIBlpKEukACJ7KelApF8R4/eUFXKLZZJ3ZkioVarHxtvUgyPfH?=
 =?us-ascii?Q?CZCwzGNfJ3QPB/iprecm734AApt1TIWeYYK81Vf+ZfGvm5i1xBXYk31JrqZd?=
 =?us-ascii?Q?BgAL5bTEJf2dlIVNodUmDmxnc2jYcvj99MiE466vCqPYC6JPtejBdbaw/ANX?=
 =?us-ascii?Q?ggaM45nXF3RM5LHNQ+zcCsvKFhOYByCkB6Kzglk26Dip1+4ijmFVLZ5zoOBC?=
 =?us-ascii?Q?LJiL7v/firrFxrD1XmmrbUA6nyszTxFDYe65gCSPuTCLtt6ncu/esTbHNjIr?=
 =?us-ascii?Q?QGU2loP+Vlz9LKJCFQbtevGVOChmDupGXcotyjzyvyKAPUX6yUC7ZR2vul1V?=
 =?us-ascii?Q?yiQNbqF8q7cjkWP28+yiHWN8YlRSRVBlHZQF2Zs2sOqfAEirgXxSE6kb3o6t?=
 =?us-ascii?Q?Kk0lk/iWAmqT8ik8HPygMkZjSsz8Hvitmm1KaecqtpwDmP5msD1B+82MKq6u?=
 =?us-ascii?Q?1GklkebQ2JrgPgoFf/BiubRXt/ksMja8lj1fFx9H/Lguy+K4UPXstdxhmsxw?=
 =?us-ascii?Q?R0QhuQAos5NIYFSPPwPuNIobuErCZmqlhbrfjZrr2XI27Ocdi4cFghD9Bjn/?=
 =?us-ascii?Q?ft8PGr75sbsOcVloelrHGQ25cVyMwHsL7qjPQ9H62Cc1fT+WMPEpVY/Il7Sa?=
 =?us-ascii?Q?9lA56fYoa1TAGReSNhPIliyj4zUcdTeusXfZ95O9NaiPQwzkWcNXjBKpl4+j?=
 =?us-ascii?Q?WKtUSTZiMBmNsOuXtwsy2JTHF0icJQ+S+rzjuJWQpGtL/aicbhSMIKtJiQGA?=
 =?us-ascii?Q?dO8tz4y6C3GrLvkMRZe5IzZXU17LYdNqA3MC2fWigHe2Whf9IjivwlJkgUS+?=
 =?us-ascii?Q?ZaSDowHYdql9Ok2rptLu/1+p+n4gs06gxM/4eJxssm/eICktSXWmBhGC4T92?=
 =?us-ascii?Q?o20F7MDDHo++w9xXgOT3uP+8vjiPASpX+TyhuuOlDiDeglCRBmH+HkIdBFjF?=
 =?us-ascii?Q?c8SDs7yu24xSZfU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 05:00:06.5185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c1f5d8-12e1-486c-df41-08dd5ba29900
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7370

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
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
based on mainline with tip commit 48a5eed9ad58

v3:
 - Add tags
 - Pass UUID directly instead of the index to amd_pmf_tee_init()

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
index b404764550c4..ceaff1ebb7b9 100644
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
+static int amd_pmf_ta_open_session(struct tee_context *ctx, u32 *id, const uuid_t *uuid)
 {
 	struct tee_ioctl_open_session_arg sess_arg = {};
 	int rc;
 
-	export_uuid(sess_arg.uuid, &amd_pmf_ta_uuid);
+	export_uuid(sess_arg.uuid, uuid);
 	sess_arg.clnt_login = TEE_IOCTL_LOGIN_PUBLIC;
 	sess_arg.num_params = 0;
 
@@ -434,7 +437,7 @@ static int amd_pmf_register_input_device(struct amd_pmf_dev *dev)
 	return 0;
 }
 
-static int amd_pmf_tee_init(struct amd_pmf_dev *dev)
+static int amd_pmf_tee_init(struct amd_pmf_dev *dev, const uuid_t *uuid)
 {
 	u32 size;
 	int ret;
@@ -445,7 +448,7 @@ static int amd_pmf_tee_init(struct amd_pmf_dev *dev)
 		return PTR_ERR(dev->tee_ctx);
 	}
 
-	ret = amd_pmf_ta_open_session(dev->tee_ctx, &dev->session_id);
+	ret = amd_pmf_ta_open_session(dev->tee_ctx, &dev->session_id, uuid);
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
+		ret = amd_pmf_tee_init(dev, &amd_pmf_ta_uuid[i]);
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

