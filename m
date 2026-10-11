Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010003.outbound.protection.outlook.com [52.101.61.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DEA37CD47
	for <platform-driver-x86@vger.kernel.org>; Sun, 11 Oct 2026 10:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791713291; cv=fail; b=RJqYxKKpKGYhNnHme2Nx4gsgAGZzXBdLkBL6jnuwKi6PdbY0YYcvDo5ddunPrzh8wFJFcnzdVroZ6l5XmDOoSvhF0LJ34udBslPkGv99sI4aAq1JgGpTAsEGv8+r/uTp6/Q27uL4RpVzvRYoHl218weQCJoiSWujPu/j3x0m7W4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791713291; c=relaxed/simple;
	bh=BP2tAgSkC3Mo4+KD/lU/T4J5OdlrnqywS6jZcffz9fE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r851uC9pguYY/IJyQw+fyw+Gx9od7w2699Xob5guD/zKqWa7DxXM15IT9rlsuhK1uW0Cmme5w4tp5PGakP/0OAIv5sodCtpJL7bc7XIGlGchGzMwNlrqTK+1EeRgfM3HXK68kOnu8420NORR7gzjGuG2mHRO+mVtM/CCrm7Uw88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QWAmGX9z; arc=fail smtp.client-ip=52.101.61.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QWAmGX9z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H/65izd49DDTsuX7hUkk7wB3AQrciEPLSoRLcan1lw/cKfICh53NFIfGGJnVHC2kDTf1L0jgodaOu/eK1ea0A+4KbvkMZ7NovaoQnxxwWLBwji4lm6o5L+AusHJdmEOR4N2IiVKp2o6AaWIB+H+uSSNEnLo6+bprDuqM0nXsTjhfZpDSQH1yuxBkPDhiX2/uA0wuVoajRSx14OarpoN9ABWMNVK/LfP9HNFbHyJcyf6vh04O+VcEWcexKPHnVL3TSlhY7sVDjkfE5sEGV0zFOVNXc1KCy50I7d3TUd7MQ9qoRjItAPoJBiFMhWBHw713z8NAIPUvQewmoC0MP3S+jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sPDtwRHWXpLMxvTtEbI+VVvPDEUCbPdUWwTgTOaF4O4=;
 b=Ly3OH+gMZtnNlV10MtrJ0mW83t2gTIvouL6EcyaCUWNoRzQs5zxBcmQ0zz+Dqs1GiIIS/ogJKW6R4ywNxKu0TTOtboTBCD4xGj0lf90U2rRpiWgDu2ET3S+7LQXw8uMkyeVogWyc76WDnEmZleLnUZ7jcdjZT3QieyhfQTUelB+YuYXAMVMJU5aNk+rU/DcIhqjR3zjXEXuUKCUJ+4DlRAnNuj6NJTrCvHCR3BIWI13ybeINh1RnguDECgLnvm4VdyL8CMcpBz0Ts+axYlZ4a8ZW0xbrBdv6hCC0kY2ub0o1GvjFo9oPbNEFcbN9SZs6qHAyhI8Mp7vaGL/5Qrhgdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPDtwRHWXpLMxvTtEbI+VVvPDEUCbPdUWwTgTOaF4O4=;
 b=QWAmGX9zEqjtw9HZ+eP8ZmfHTP+N5CVp3GbB223zOzjgzuGTjl8ykqbO9JTCyZ/TgBFWwkkgqiHV8Kjk2ufmcGQOFbgmMjJQU5NQA5V9jTHZpQmk+KzLzkC7man6g/5H/sFBm83a8e/VjmX3/lu/JSsbwyI1jm6cFrx7lTSSqIg=
Received: from BN0PR04CA0174.namprd04.prod.outlook.com (2603:10b6:408:eb::29)
 by IA1PR12MB8408.namprd12.prod.outlook.com (2603:10b6:208:3db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Sun, 11 Oct
 2026 10:07:21 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:eb:cafe::8c) by BN0PR04CA0174.outlook.office365.com
 (2603:10b6:408:eb::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Sun, 11
 Oct 2026 10:07:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sun, 11 Oct 2026 10:07:21 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 11 Oct
 2026 05:07:14 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 8/8] platform/x86/amd/pmf: Share TA policy apply code between TA versions
Date: Sun, 11 Oct 2026 15:35:54 +0530
Message-ID: <20261011100554.1841309-9-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261011100554.1841309-1-Shyam-sundar.S-k@amd.com>
References: <20261011100554.1841309-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|IA1PR12MB8408:EE_
X-MS-Office365-Filtering-Correlation-Id: 743c4fc6-3d3e-4f21-7582-08df277f70b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|3023799007|6133799003|22082099003|18002099003|11063799006|56012099006|5023799004|260925021311599003|260925022911599003|10067099003|260925021911599003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	YwOSsnYu3kmUWcGGtyH3Rp+xXTih5Sl2gdbyY50CsyhBT5cgTwqhn6Rpi8LgKZ4TmlmWBtyLO9gMWjhe1rDcvqdcnnXKsEJBMLQwFxGg6rmKq67inxBNdBX3+yYGErY2ODp0b5lsEdxtpUph+vluXPOgnElVNkMo5Sw+4P+FVE1c9Tfqhbqe9E71ljm8MAdivJKEM787J2IubgxXnwD+r/tvqiBCVfkTIP9fwHZRFKQPnRhDxlAyKHlMfuNF7cex69MvCMK5XHGSgfw2gya+pyymb0mh0kbxdGjPJL1bj3n+aMCIMYhBVux/YVHRfsn5G+lH9fLtmbUJYcsl7kArpFCn268Cnq+6RE3tmaHGAlXqUDFrxGC1cV3qC/DPa0nNXMDLzBoWwyq6PJo2q7C4ms7OM4XCE103SIlIAmeEI4cPUhsLJIjuelIX9iRpZ6iDFw++KXOElMjWBnEAqPhcEfgakQcwy7OV1vyMjqxlqGaSaZ27K7oWz2HR5cPs9/rnqJujLO0+zz3NeZYWp5/i+vez7NBu5Bg5mRWnyaXcXvBHwJxwGwJCNcotPm+NmtoFwXn1ltY/GYyW3hsxU0GB26FZr8rtwk4z32DN85k5hXe3VCXwZagCzlDq9wXQxiTmxbrlpV8PRsZNkwnt+y7vPLt+igRxskg4UCrOPnvNYGwnrPkPmrTVNHjVkNGJSbfzDXEFkXApAHpKW/o4CY9bYA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(3023799007)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(5023799004)(260925021311599003)(260925022911599003)(10067099003)(260925021911599003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jCiaRIuaenzPYX1ZttBkXGM2N1jtUiWUhRJ5+7PgQHbXyIwcheJXa/IkHO+1n+HDLAVxqEvNwLuT4a1FIpwXC5IVbf75P+7RgsVP4yy6BLvyf3DzRK5Q5nN7FZY9qRIJFziV9uExX+E9WTTSwPLVeSwUOfc4hRObkzZb0Z8s6lAG5WNAseALKDZHTZq/D+87Z3KI9UYOCK9w9Rsfvg0shobOBsdmdyNIt1xc2co04qp+a94YXzz3g8gA57clNEWdcCFzkIzcCFDige16NnDZjVotdlgGUwao9EcXBTIqMB7rOyxJEIt+TfBMjPNW9MpfqvD7potHPrKWf9UB3gc2BRF02xbSgf/d2Xsygy2YTl5wnTANpq3dh8YLt9PU0IRx5reyozO5yAZHGzXieRu7J2ltBTGU5cDRiRqIPzJ6vQXr9RVbDfXLxGtVGz1dDL+N
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2026 10:07:21.4900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 743c4fc6-3d3e-4f21-7582-08df277f70b7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8408

amd_pmf_apply_policies() and amd_pmf_apply_policies_v2() handle the
same TA actions and differ only in the SMU message IDs used to program
the limits.

Add a table of SMU message IDs to ta_ops and use a single function for
both TA versions. Actions without a message ID on a platform are
ignored, as before. The check on the number of actions returned by
the TA now applies to all platforms.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h    |   3 +
 drivers/platform/x86/amd/pmf/tee-if.c | 197 +++++++++-----------------
 2 files changed, 73 insertions(+), 127 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 70ed0b07faae..ac9a99fd9449 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -674,10 +674,13 @@ struct amd_pmf_arg_data {
 
 struct amd_pmf_dev;
 
+struct amd_pmf_policy_msg_ids;
+
 struct amd_pmf_ta_ops {
 	const uuid_t *uuids;
 	int num_uuids;
 	size_t shm_size;
+	const struct amd_pmf_policy_msg_ids *msg_ids;
 	int (*invoke_init)(struct amd_pmf_dev *dev);
 	int (*invoke_enact)(struct amd_pmf_dev *dev);
 };
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 2ed9014cb7c4..1e9262764395 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -115,163 +115,102 @@ static void amd_pmf_update_bios_output(struct amd_pmf_dev *pdev, struct ta_pmf_a
 		pdev->bios_output[bios_idx] = action->value;
 }
 
-static void amd_pmf_apply_policies_v2(struct amd_pmf_dev *dev, struct ta_pmf_enact_result_v2 *out)
-{
-	struct ta_pmf_action *action;
-	u32 val;
-	int idx;
-
-	if (out->actions_count > TA_PMF_ACTION_MAX_V2) {
-		dev_err(dev->dev, "TA actions count %u exceeds max %u\n",
-			out->actions_count, TA_PMF_ACTION_MAX_V2);
-		return;
-	}
-
-	for (idx = 0; idx < out->actions_count; idx++) {
-		action = &out->actions_list[idx];
-		val = action->value;
-		switch (action->action_index) {
-		case PMF_POLICY_SPPT:
-			if (dev->prev_data->sppt != val) {
-				amd_pmf_send_cmd(dev, SET_1AH_M80H_PMF_SPPT_SPM,
-						 SET_CMD, val, NULL);
-				dev_dbg(dev->dev, "update SPPT: %u\n", val);
-				dev->prev_data->sppt = val;
-			}
-			break;
-
-		case PMF_POLICY_FPPT:
-			if (dev->prev_data->fppt != val) {
-				amd_pmf_send_cmd(dev, SET_1AH_M80H_PMF_FPPT_SPM,
-						 SET_CMD, val, NULL);
-				dev_dbg(dev->dev, "update FPPT: %u\n", val);
-				dev->prev_data->fppt = val;
-			}
-			break;
-
-		case PMF_POLICY_SPPT_APU_ONLY:
-			if (dev->prev_data->sppt_apuonly != val) {
-				amd_pmf_send_cmd(dev, SET_1AH_M80H_PMF_SPPT_APU_ONLY,
-						 SET_CMD, val, NULL);
-				dev_dbg(dev->dev, "update SPPT_APU_ONLY: %u\n", val);
-				dev->prev_data->sppt_apuonly = val;
-			}
-			break;
-
-		case PMF_POLICY_STT_MIN:
-			if (dev->prev_data->stt_minlimit != val) {
-				amd_pmf_send_cmd(dev, SET_1AH_M80H_STT_MIN_LIMIT,
-						 SET_CMD, val, NULL);
-				dev_dbg(dev->dev, "update STT_MIN: %u\n", val);
-				dev->prev_data->stt_minlimit = val;
-			}
-			break;
-
-		case PMF_POLICY_STT_SKINTEMP_APU:
-			if (dev->prev_data->stt_skintemp_apu != val) {
-				amd_pmf_send_cmd(dev, SET_1AH_M80H_STT_LIMIT_APU, SET_CMD,
-						 fixp_q88_fromint(val), NULL);
-				dev_dbg(dev->dev, "update STT_LIMIT_APU: %u\n", val);
-				dev->prev_data->stt_skintemp_apu = val;
-			}
-			break;
-
-		case PMF_POLICY_STT_SKINTEMP_HS2:
-			if (dev->prev_data->stt_skintemp_hs2 != val) {
-				amd_pmf_send_cmd(dev, SET_1AH_M80H_STT_LIMIT_HS2, SET_CMD,
-						 fixp_q88_fromint(val), NULL);
-				dev_dbg(dev->dev, "update STT_LIMIT_HS2: %u\n", val);
-				dev->prev_data->stt_skintemp_hs2 = val;
-			}
-			break;
-
-		case PMF_POLICY_SYSTEM_STATE:
-			switch (val) {
-			case 0:
-				amd_pmf_update_uevents(dev, KEY_SLEEP);
-				break;
-			case 1:
-				amd_pmf_update_uevents(dev, KEY_SUSPEND);
-				break;
-			case 2:
-				amd_pmf_update_uevents(dev, KEY_SCREENLOCK);
-				break;
-			default:
-				dev_err(dev->dev, "Invalid PMF policy system state: %u\n", val);
-			}
+/* SMU message IDs used to apply the TA policy actions, 0 if not supported */
+struct amd_pmf_policy_msg_ids {
+	u8 spl;
+	u8 sppt;
+	u8 fppt;
+	u8 sppt_apu_only;
+	u8 stt_min;
+	u8 stt_skintemp_apu;
+	u8 stt_skintemp_hs2;
+	u8 p3t;
+	u8 pmf_ppt;
+	u8 pmf_ppt_apu_only;
+};
 
-			dev_dbg(dev->dev, "update SYSTEM_STATE: %s\n", amd_pmf_uevent_as_str(val));
-			break;
+static const struct amd_pmf_policy_msg_ids amd_pmf_policy_default_msg_ids = {
+	.spl = SET_SPL,
+	.sppt = SET_SPPT,
+	.fppt = SET_FPPT,
+	.sppt_apu_only = SET_SPPT_APU_ONLY,
+	.stt_min = SET_STT_MIN_LIMIT,
+	.stt_skintemp_apu = SET_STT_LIMIT_APU,
+	.stt_skintemp_hs2 = SET_STT_LIMIT_HS2,
+	.p3t = SET_P3T,
+	.pmf_ppt = SET_PMF_PPT,
+	.pmf_ppt_apu_only = SET_PMF_PPT_APU_ONLY,
+};
 
-		case PMF_POLICY_BIOS_OUTPUT_1:
-		case PMF_POLICY_BIOS_OUTPUT_2:
-		case PMF_POLICY_BIOS_OUTPUT_3:
-		case PMF_POLICY_BIOS_OUTPUT_4:
-		case PMF_POLICY_BIOS_OUTPUT_5:
-		case PMF_POLICY_BIOS_OUTPUT_6:
-		case PMF_POLICY_BIOS_OUTPUT_7:
-		case PMF_POLICY_BIOS_OUTPUT_8:
-		case PMF_POLICY_BIOS_OUTPUT_9:
-		case PMF_POLICY_BIOS_OUTPUT_10:
-			amd_pmf_update_bios_output(dev, action);
-			break;
-		}
-	}
-}
+static const struct amd_pmf_policy_msg_ids amd_pmf_policy_msg_ids_v2 = {
+	.sppt = SET_1AH_M80H_PMF_SPPT_SPM,
+	.fppt = SET_1AH_M80H_PMF_FPPT_SPM,
+	.sppt_apu_only = SET_1AH_M80H_PMF_SPPT_APU_ONLY,
+	.stt_min = SET_1AH_M80H_STT_MIN_LIMIT,
+	.stt_skintemp_apu = SET_1AH_M80H_STT_LIMIT_APU,
+	.stt_skintemp_hs2 = SET_1AH_M80H_STT_LIMIT_HS2,
+};
 
-static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
+static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_action *actions,
+				   u32 count, u32 max)
 {
+	const struct amd_pmf_policy_msg_ids *ids = dev->ta_ops->msg_ids;
 	struct ta_pmf_action *action;
 	u32 val;
 	int idx;
 
-	for (idx = 0; idx < out->actions_count; idx++) {
-		action = &out->actions_list[idx];
+	if (count > max) {
+		dev_err(dev->dev, "TA actions count %u exceeds max %u\n", count, max);
+		return;
+	}
+
+	for (idx = 0; idx < count; idx++) {
+		action = &actions[idx];
 		val = action->value;
 		switch (action->action_index) {
 		case PMF_POLICY_SPL:
-			if (dev->prev_data->spl != val) {
-				amd_pmf_send_cmd(dev, SET_SPL, SET_CMD, val, NULL);
+			if (ids->spl && dev->prev_data->spl != val) {
+				amd_pmf_send_cmd(dev, ids->spl, SET_CMD, val, NULL);
 				dev_dbg(dev->dev, "update SPL: %u\n", val);
 				dev->prev_data->spl = val;
 			}
 			break;
 
 		case PMF_POLICY_SPPT:
-			if (dev->prev_data->sppt != val) {
-				amd_pmf_send_cmd(dev, SET_SPPT, SET_CMD, val, NULL);
+			if (ids->sppt && dev->prev_data->sppt != val) {
+				amd_pmf_send_cmd(dev, ids->sppt, SET_CMD, val, NULL);
 				dev_dbg(dev->dev, "update SPPT: %u\n", val);
 				dev->prev_data->sppt = val;
 			}
 			break;
 
 		case PMF_POLICY_FPPT:
-			if (dev->prev_data->fppt != val) {
-				amd_pmf_send_cmd(dev, SET_FPPT, SET_CMD, val, NULL);
+			if (ids->fppt && dev->prev_data->fppt != val) {
+				amd_pmf_send_cmd(dev, ids->fppt, SET_CMD, val, NULL);
 				dev_dbg(dev->dev, "update FPPT: %u\n", val);
 				dev->prev_data->fppt = val;
 			}
 			break;
 
 		case PMF_POLICY_SPPT_APU_ONLY:
-			if (dev->prev_data->sppt_apuonly != val) {
-				amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, SET_CMD, val, NULL);
+			if (ids->sppt_apu_only && dev->prev_data->sppt_apuonly != val) {
+				amd_pmf_send_cmd(dev, ids->sppt_apu_only, SET_CMD, val, NULL);
 				dev_dbg(dev->dev, "update SPPT_APU_ONLY: %u\n", val);
 				dev->prev_data->sppt_apuonly = val;
 			}
 			break;
 
 		case PMF_POLICY_STT_MIN:
-			if (dev->prev_data->stt_minlimit != val) {
-				amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, SET_CMD, val, NULL);
+			if (ids->stt_min && dev->prev_data->stt_minlimit != val) {
+				amd_pmf_send_cmd(dev, ids->stt_min, SET_CMD, val, NULL);
 				dev_dbg(dev->dev, "update STT_MIN: %u\n", val);
 				dev->prev_data->stt_minlimit = val;
 			}
 			break;
 
 		case PMF_POLICY_STT_SKINTEMP_APU:
-			if (dev->prev_data->stt_skintemp_apu != val) {
-				amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, SET_CMD,
+			if (ids->stt_skintemp_apu && dev->prev_data->stt_skintemp_apu != val) {
+				amd_pmf_send_cmd(dev, ids->stt_skintemp_apu, SET_CMD,
 						 fixp_q88_fromint(val), NULL);
 				dev_dbg(dev->dev, "update STT_SKINTEMP_APU: %u\n", val);
 				dev->prev_data->stt_skintemp_apu = val;
@@ -279,8 +218,8 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 			break;
 
 		case PMF_POLICY_STT_SKINTEMP_HS2:
-			if (dev->prev_data->stt_skintemp_hs2 != val) {
-				amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, SET_CMD,
+			if (ids->stt_skintemp_hs2 && dev->prev_data->stt_skintemp_hs2 != val) {
+				amd_pmf_send_cmd(dev, ids->stt_skintemp_hs2, SET_CMD,
 						 fixp_q88_fromint(val), NULL);
 				dev_dbg(dev->dev, "update STT_SKINTEMP_HS2: %u\n", val);
 				dev->prev_data->stt_skintemp_hs2 = val;
@@ -288,24 +227,24 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 			break;
 
 		case PMF_POLICY_P3T:
-			if (dev->prev_data->p3t_limit != val) {
-				amd_pmf_send_cmd(dev, SET_P3T, SET_CMD, val, NULL);
+			if (ids->p3t && dev->prev_data->p3t_limit != val) {
+				amd_pmf_send_cmd(dev, ids->p3t, SET_CMD, val, NULL);
 				dev_dbg(dev->dev, "update P3T: %u\n", val);
 				dev->prev_data->p3t_limit = val;
 			}
 			break;
 
 		case PMF_POLICY_PMF_PPT:
-			if (dev->prev_data->pmf_ppt != val) {
-				amd_pmf_send_cmd(dev, SET_PMF_PPT, SET_CMD, val, NULL);
+			if (ids->pmf_ppt && dev->prev_data->pmf_ppt != val) {
+				amd_pmf_send_cmd(dev, ids->pmf_ppt, SET_CMD, val, NULL);
 				dev_dbg(dev->dev, "update PMF PPT: %u\n", val);
 				dev->prev_data->pmf_ppt = val;
 			}
 			break;
 
 		case PMF_POLICY_PMF_PPT_APU_ONLY:
-			if (dev->prev_data->pmf_ppt_apu_only != val) {
-				amd_pmf_send_cmd(dev, SET_PMF_PPT_APU_ONLY, SET_CMD, val, NULL);
+			if (ids->pmf_ppt_apu_only && dev->prev_data->pmf_ppt_apu_only != val) {
+				amd_pmf_send_cmd(dev, ids->pmf_ppt_apu_only, SET_CMD, val, NULL);
 				dev_dbg(dev->dev, "update PMF PPT APU ONLY: %u\n", val);
 				dev->prev_data->pmf_ppt_apu_only = val;
 			}
@@ -323,7 +262,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 				amd_pmf_update_uevents(dev, KEY_SCREENLOCK);
 				break;
 			default:
-				dev_err(dev->dev, "Invalid PMF policy system state: %d\n", val);
+				dev_err(dev->dev, "Invalid PMF policy system state: %u\n", val);
 			}
 
 			dev_dbg(dev->dev, "update SYSTEM_STATE: %s\n",
@@ -380,7 +319,8 @@ int amd_pmf_invoke_cmd_enact_v2(struct amd_pmf_dev *dev)
 		amd_pmf_dump_ta_inputs_v2(dev, in);
 		dev_dbg(dev->dev, "TA v2 action count:%u result:%x\n", out->actions_count,
 			ta_sm->pmf_result);
-		amd_pmf_apply_policies_v2(dev, out);
+		amd_pmf_apply_policies(dev, out->actions_list, out->actions_count,
+				       ARRAY_SIZE(out->actions_list));
 	}
 
 	return 0;
@@ -420,7 +360,8 @@ int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
 		amd_pmf_dump_ta_inputs(dev, in);
 		dev_dbg(dev->dev, "action count:%u result:%x\n", out->actions_count,
 			ta_sm->pmf_result);
-		amd_pmf_apply_policies(dev, out);
+		amd_pmf_apply_policies(dev, out->actions_list, out->actions_count,
+				       ARRAY_SIZE(out->actions_list));
 	}
 
 	return 0;
@@ -758,6 +699,7 @@ static const struct amd_pmf_ta_ops amd_pmf_ta_default_ops = {
 	.uuids = amd_pmf_ta_uuid,
 	.num_uuids = ARRAY_SIZE(amd_pmf_ta_uuid),
 	.shm_size = sizeof(struct ta_pmf_shared_memory),
+	.msg_ids = &amd_pmf_policy_default_msg_ids,
 	.invoke_init = amd_pmf_invoke_cmd_init,
 	.invoke_enact = amd_pmf_invoke_cmd_enact,
 };
@@ -766,6 +708,7 @@ static const struct amd_pmf_ta_ops amd_pmf_ta_ops_v2 = {
 	.uuids = amd_pmf_ta_uuid_v2,
 	.num_uuids = ARRAY_SIZE(amd_pmf_ta_uuid_v2),
 	.shm_size = sizeof(struct ta_pmf_shared_memory_v2),
+	.msg_ids = &amd_pmf_policy_msg_ids_v2,
 	.invoke_enact = amd_pmf_invoke_cmd_enact_v2,
 	.invoke_init = amd_pmf_invoke_cmd_init_v2,
 };
-- 
2.34.1

