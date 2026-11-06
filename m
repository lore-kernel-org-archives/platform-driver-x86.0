Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793983597;
	b=pGMLlrWrDvRfUUvLgm7Pb+PnVJ7UI6ccCApWZn3D/TB08kdWNdrWkj+RB6B1eVT9Qobb
	 DmmySnoarSQMcbXDpiUW202Sg+A5GQO0+9o8vUppxknlM6i4NkDET8ayiF3v5Eh14rLjM
	 yThAG0LDDkvqon8bLKsGjvK6xGXKCcsge2BVbK7DfmU8tkqpKc6/mtzQjAjwaYim2eo9P
	 LyupHUzpaCYTgWnDHJ/Lj+543pwp49JhFtsUHGNMrEb5Ya2fZQsxyTiC04Ukuqsm8S0Jz
	 Cw4dqCsIJN64gdDl3jAcTn5Z9VOf83uy+MzRBRcaOvovhbms0jBIwnQ6TJ4mHT2QKjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793983597;
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
	bh=ha2oksyQVdAH3DAlbFRXzjZty6fPjML8UMp7mQD+MwQ=;
	b=yre0QpsUewg6bB2LHojH1XfsBIgNmHQo+WmYznM/P9ArmIXvdNJ3cqLtE/uulrDmOztt
	 aJC3QBL9rR3lpOwl9cfPP/twpKjVc/CpXvkJVB9R19HEcYM4BsW3Hs2uyeUXMBoy8tC/q
	 qpBftMQQUYniF7Csd6zuG6O7r1rA5MQAGzxYAj8v19i0axlPfviZPF+jyWF3Ww8iLkfNo
	 oEA924Y43Ahg7ojdE+t+tQSD3NwW4RPZULJ/PQ84JA9X1z6Ziy1XMZv2KLZlMej3odK4x
	 ECR2K2mkEeWke4Tzan8WVjA2sjeGChPz07MF7xxr5xc9xdSngIdME/1WWAGG5q9wjRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RkD3Cf0f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.12
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010012.outbound.protection.outlook.com [52.101.193.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8CD606A334
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 16:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B8CD606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RkD3Cf0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AC4yLMDvmyNJkK9aekvFIBdz80g/CVu4UqW6hFH1x4L58T3B44kaQFD00ICf5TuMImoCaWaAXp6RjGROehxVjHSf14or0uyRHsqMOCM44zrYRHoyXMPR6yJ4I7+o6g98BhL58A/UQjEUKw/bEfQkggKnc34CzBBT6VuqL+4CDlTS0wHyrXez8cjVUn3oHp7GDuiCjKtMCIHVZeHAZCoWLDpSO/3u1cCB7tuAJ0tyh8gCg6nOytLnTMrDg8+nslh1omskwedtDqYSglPaqMWwugwk9acwFYwWg8pvm4xGy5gNjTziKVsEklzuEWQ0bmPWyV1X+sz8Y2bkfbsYuH18Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ha2oksyQVdAH3DAlbFRXzjZty6fPjML8UMp7mQD+MwQ=;
 b=SzQWKXHkwMvhZMzNs3CzDJ9CsOyit8L0SteYZNP/ZoN/noot7iJTR516Z+ZZNXL+Bh6p7UhAKGXqHcmKtWkzWvDWYCYIa2Dua21g7L/cKrQUvQV7f6Jt8T2uaUMYaYX0iZaKwlaDWaFaBn3wqDZ4qd7dVp2nDCdDmWrgBHQT6cqaTfljTatOIZrf6C+1YER7ITIvGXCBYWM8BZHQbY+T7Ri1E1sNVewglmv3sEB4g89is+ovS3W5Wbhd+UtWueLe8BS4yJ7RSLw6f+20cpMjfRV2RXFMjOaONt5CzK4DBbOORvoW9SVbzrmJ0DGryJ63e6YrFY28AdZJMfZ/GBGVzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ha2oksyQVdAH3DAlbFRXzjZty6fPjML8UMp7mQD+MwQ=;
 b=RkD3Cf0f6p8hbA8gdEypnAt7M8Q1jvLn+DjN4brRbhfhtI2pB0ZnJieoegfbbXc4lBGYcetRJDcE9XgcNRGNgKb1FipPW3JKB3h8gcY4inuuhHpYZZ1Ej8OouPal+r4Gby5+8V4/cp17k5M/ubw0ZjYrOZOGiK7pleIm687i+UA=
Received: from MW4PR04CA0313.namprd04.prod.outlook.com (2603:10b6:303:82::18)
 by LV3PR12MB9268.namprd12.prod.outlook.com (2603:10b6:408:216::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 16:46:34 +0000
Received: from BY1PEPF00026959.namprd05.prod.outlook.com
 (2603:10b6:303:82:cafe::27) by MW4PR04CA0313.outlook.office365.com
 (2603:10b6:303:82::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 16:46:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026959.mail.protection.outlook.com (10.167.244.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 16:46:34 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 10:46:31 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v2 09/10] platform/x86/amd/pmf: Share TA policy apply code between TA versions
Date: Fri, 6 Nov 2026 22:14:28 +0530
Message-ID: <20261106164429.30738-10-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106164429.30738-1-Shyam-sundar.S-k@amd.com>
References: <20261106164429.30738-1-Shyam-sundar.S-k@amd.com>
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
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026959:EE_|LV3PR12MB9268:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f96fe67-a0ff-4aa9-6fa6-08df3c258459
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|376014|82310400026|22082099003|18002099003|11063799006|5023799004|56012099006|3023799007|261009223027099003|261102123227099003|261021123027099003|261022075727099003|261021121427099003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	CmqF9PFhwWGvxFpeZj+6iHvbiMTNdVV7RUQP1vfbcq6/AOA77ygrEg5GvLev7oy4nQdI1nzh3WkBa5E3vRuw3qx4yLiH7a9b6UfIO4jJsxURol4Ig5nZbBl1aySp2kyk/A4lYi9H9SNSBaMRPj/qy8/rPhQ6+9fiLWHOSLOkKpVidAYMZtZB8EvUY7r4HvcoOIPy42b5AOXRXlx73G/4horNDJEoGNDlbpXNf2BwifiYQF03aIfko9Lweu8sbmUd/0qo+Wp/vjWGJYgk3hDJ8eY9roPmsFOlGa/Zd46S57moEWQ+p9+LXkSKBdWxgUQFUkwVYnAVBQ7oT04JX1y23tZ/FXKrxIy3sy+LldTTvUBW1XesFempnn2XQoWgvQgQ/gJ4OAc1awlLCOIAN4f1wWGWsVVGYelytpbzokDuIc+C6yx0y+iMwvlRsG4l5ILmeu5scqTUXbsr3ygzCX+5hujKKcGGqcKPNU3z9u+/qhm6BMB/ACIJCQ4BJ9pgClZALp+lGC4gzZ6HEIQO1H2VbBF58iOIxADJJgFdrbtH3DORyHAYu2KYrz1OQZ+FEel7oY8/A9vv7SPLdPS6pOBS8ohh6pfkNRgdfv/h4jM/4CXlhD4apQG2pgW9UV84C4gLf6ksMZ1Fy6T3Y8wA6HfwJfsTCmOlo5wMpbQRt23++yKG8eC2srq1BV5zEDzkbde4JSqnjJtNskkpBac/UIJ/mg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(376014)(82310400026)(22082099003)(18002099003)(11063799006)(5023799004)(56012099006)(3023799007)(261009223027099003)(261102123227099003)(261021123027099003)(261022075727099003)(261021121427099003)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	T9YCARlWB73E/qK6XLRRIIsrVf7E9JiLjKtwKgmLTC0ueY95/AK5tIATNOeSUHhB+bXCb0qAwq5k9mAaUyU+gyjU815RTOMJs02gaSTNetGexAxdD+7/2yE1W3ApAZgmhuRBIUA2Fc/fUA/VBDKHTfCu6mUllALGeT3UkNGwoDYvCY+HclCCj753SGInJ5U1v34EzrdEFpB6myzDnbqCELmFYpB8BbGOocbQQFAYE8LB8AGWzhERClrH8l7xTmlOSXC4z1EXiW0fkRCnBGKFVpTC4Uvin9/DRAqe6+TFE4vZ+GE2p+c2om5kRoUC4lzIcEZ0GBh3Lezpx2syLw9MpLwl7+9qzQUiSWuiy5rA3Z3+qs2tB2+iscNZ1jXtUoSXZQeIr9RcWZyWX8CQYGunSmRN6FqGu8DDCLRzGxixtkZ2PjDaroPfu23PtL2ikGLi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:46:34.1120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f96fe67-a0ff-4aa9-6fa6-08df3c258459
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026959.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9268

amd_pmf_apply_policies() and amd_pmf_apply_policies_v2() handle the
same TA actions and differ only in the SMU message IDs used to program
the limits.

Add a table of SMU message IDs to ta_ops and use a single function for
both TA versions. Actions without a message ID on a platform are
ignored, as before. The check on the number of actions returned by
the TA now applies to all platforms.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h    |   3 +
 drivers/platform/x86/amd/pmf/tee-if.c | 197 +++++++++-----------------
 2 files changed, 73 insertions(+), 127 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 216a21649ef9..24933da9b3cd 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -675,10 +675,13 @@ struct amd_pmf_arg_data {
 
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
index 117f16a459bb..05297c486c29 100644
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
-			case SYSTEM_STATE_S0i3:
-				amd_pmf_update_uevents(dev, KEY_SLEEP);
-				break;
-			case SYSTEM_STATE_S4:
-				amd_pmf_update_uevents(dev, KEY_SUSPEND);
-				break;
-			case SYSTEM_STATE_SCREEN_LOCK:
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

