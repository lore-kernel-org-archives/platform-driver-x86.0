Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795506788;
	b=j4eZjAxrb5ofxPoH1lTWgwRoAqRp1bzk0WCT88ClML6X1DC6f0oCcQ97WF0gsBY6iNrE
	 As8BIvpHfHdCDpX/H9E25Mg5iBsyfFlZ77vEgg8GWtSpn1A47Bso2hfBXwAnAZOqu/Ygm
	 /P27wh+HVdOlTCoreXVJRN1tQZ6poDh2s13pkJAsQhsNCU/mqcSEmfeeqn7nHrUnsZDFQ
	 KG6bZ8aoXxGkfas1ZqEVLdPOFWVVIkx83zvEn0AXqIlnP4SozksRXFX3dYnqk9GjCpS9f
	 1uG63jvDyaYinEjafEVKX3mKsWDmUxYruET08znRSh5HUG/gfpDP8aJhEn5NW4r07NA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506788;
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
	bh=tpwA4CWKfrs+9ZYljZ9tWCyRPKRi68gfI8NMqu1lfbQ=;
	b=oNJN3J9LswE7vEDwJGxFiif4p3ImaOOJstldQxZKFspSx6z7Ca/NG5j7+791qv14zuzC
	 nsmck1zF8XqaWuXRRZx+mRkaV7IPEgRp180wnmkxKNDCUTe17d80ocQXdyHIdQjd+pjK3
	 3TaNdThpt02rQmh8ku4h5rRgYf7fitmv6rbs7qwlLAhL0gzGMYmh/06syOm2e0fttEXNL
	 Yqki/r2aBfgiL1vDKJcSwhY02stUcCXt50Z0VUA+taKwcqKaveOHZWtgf/KaWehYFHN6s
	 UTWJxmHilFrdA4cEUxHHQGpknlfHIZpzNNePXAqspMPjMm2hNY2lrFPlfj4h4eUTJTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=wDEsb9ZV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.0
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011000.outbound.protection.outlook.com [52.101.52.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684E3606A321
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 07:53:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 684E3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=wDEsb9ZV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p65relTLTm1UsLf/0TmWqHpJdmx7BEgzamX3/8tdLwKqvPhZxRmjJ+qQe1g/MCENCx2S29bUgMiLn1+lHi/IkUZNr6t1eai3ZqiTaGxYQINkazULZxw/nZxCCbUERNGkfFWIfFu3WMj/4j2q10yZd5NBTWyZbm1uiy0v7+qeLvNCDsRNzDu32zoR/1gocWRLsb89MrXPAeBD9S+iXA5T119mcSSTaPX3IZeHuYW3hfbzo6Mwf2W+2DW+q/ws+6ElUgxjSSngfNcF86L65QxqU+r/NLmgxNhUUGN3FYjccdRXilsk/69xuIo0IReLam0c9hsQPVFaSDBXa1YmkzXy6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpwA4CWKfrs+9ZYljZ9tWCyRPKRi68gfI8NMqu1lfbQ=;
 b=wkO2QA+Z0keIh69MEOY74NZdbRcsyvNexbHM0gyMAa6FCClMCrT93cvttuX6UIGGb6LoPGAS9m6wzqp7HjJAe0UTFfzb6zTqq9m+/1pwG6fbHXr9X8LEtaQX6IZA1mWYlBQ8PNynRKjTYMKB6y7XPYov46BZcVzGVtFkNu4QxTqGnHfFAKCjAfFifAW0KGgdOGs1XfJPeLU2iEaqkXgb4IzDRSEh85ss7dKcJO8QYX1+nKpWvH69QUy6Jn8m2TIJsRNL9j9A80/D/JEVhsU9tvwUjZFJmZQyPA/WjwNRxNcGa2g2St2hCW8u7B9zM5+iZ4yqQQdBfwfgz5csfIUc6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpwA4CWKfrs+9ZYljZ9tWCyRPKRi68gfI8NMqu1lfbQ=;
 b=wDEsb9ZVRrRp3l9wE5VdjrNY2nf5OUpHZb75huZ2WsSPSyNg2jnXIXLpz7vNARR/8Vw/ycne9CPSpC1jose+xAjTJtESKnSyHCUiI7/D5pKLl/ptvpOkWBp8jTzsaxc1BFRNRXteWbDXIwW6WC+eO/LYPqjD0n/B2ac/L9EtO0c=
Received: from PH8PR07CA0007.namprd07.prod.outlook.com (2603:10b6:510:2cd::23)
 by DM4PR12MB8559.namprd12.prod.outlook.com (2603:10b6:8:17d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 07:53:02 +0000
Received: from SJ5PEPF000001D3.namprd05.prod.outlook.com
 (2603:10b6:510:2cd:cafe::1b) by PH8PR07CA0007.outlook.office365.com
 (2603:10b6:510:2cd::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 07:53:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D3.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 07:53:02 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 01:52:59 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v4 10/11] platform/x86/amd/pmf: Share TA policy apply code between TA versions
Date: Tue, 24 Nov 2026 13:22:12 +0530
Message-ID: <20261124075213.2317127-11-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D3:EE_|DM4PR12MB8559:EE_
X-MS-Office365-Filtering-Correlation-Id: b415e70d-721b-475c-e255-08df49fff722
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|6133799003|22082099003|18002099003|3023799007|5023799004|11063799006|56012099006|261102123227099003|261022075727099003|261021123027099003|261021121427099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	sXFr8I8mWBpBICCe6+4PiuyUDmyC6kyWsPHHY54mCTX6+IYXS/UT3hEHBpLzDo+k3kw9+qizFd7zxKOGk8pju/FuC1mbklPwy1kci4e3hyEg+e0gjkRGyvJGPZhs/jlEGzhh6v8C4dyvEuswW7vWFGjHTRtHOOHl0AsO3akNc65NywMZTCWQ7Vp7DNcqc/w+RyNJ6E/fUgUMRYNPBZZu/P4SmADG+0Cl6F1zHBS6OeETvtZIIo5gy5BUoM4Lg1fddJeTwFGG7wD36mJX9fI8BWJPQAZ/mVxTbo6iX67/BMja2poTTO+VKbHYdauioqCTZfQ0tV9gcVVpxRzfVi2Y11cNrLXQsrj6dujhHnjtzqjTlHULLn9a1eAMHO9fov+rHE/kSeP1l47yhxk/SAsX97NCWmyYcqnUyRVEwBEDGLw+6IfZoZExvmpIQTMSgZhlJ2n3IeZx+syAbhUuH0EFv71h+cQOHuQuxwTnLEhbIAaHhjngmfXZKeR8Cp3lCHFGOJ74F50xjEnxhDDleQg8qoV/u81cK9OySQZLuOXOH6JK448NVkRHOfmdWihP0CHkDs2C7TzAX36OUCJEuavXISI4RagyskKTbDX9a4oPL0efrx1GwikGuaQtKNCRvMkJ/7/BwChRH4RgrU64J0B1OXHfpotkxW+uJLGGKKYvc7DhQU9me1xt88SLOu2BxbxMLDKsZgxVA/ESZGci10JHIQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(6133799003)(22082099003)(18002099003)(3023799007)(5023799004)(11063799006)(56012099006)(261102123227099003)(261022075727099003)(261021123027099003)(261021121427099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	S/0bSB9rY20ZpnANg4tbyDEu7qU8ainKcoNk3lak5wZrgjFMtSxooIOtMrXuunZlCijUqTnCfF+Frf9e4Gy5ht5Jp3cp4GwMTrTr+JjLpEVHqjuysOkEF1Yy0J7e+w9kOIz9YTCIck1kYPgVWUSEE+ofIsLvt8+m5v9ipFs7ujxONEQUDifFcmOiiROG+ZMEIdP3U2GlidKMedHgYkQjQC3PpQM0JEVxkQ1uCvxwrz6iluLEPRYXFZI6spUjm8q1DPCbYOMOAhEZdz2xuJLVn+WdfzKH/SzOiQ3+fwAfQUKij3NedBwHqWgKPC3wEz2v43abxuQFPCPEBSHCZPviY/IDZ0ueyMqoZlf2YZKg31vX7fu4l/VkTD33+zXGzuxNXcmGdhTnLF+sMLG7oBt/g7DMNL3rlTu8GeHgWo5jwIE0M4Syy39+hK4kEExLBr2Q
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 07:53:02.0637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b415e70d-721b-475c-e255-08df49fff722
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8559

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
index dcd468864074..00e2b161c4e5 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -677,6 +677,8 @@ struct amd_pmf_arg_data {
 
 struct amd_pmf_dev;
 
+struct amd_pmf_policy_msg_ids;
+
 /**
  * struct amd_pmf_sps_ops - Static slider operations
  * @load_defaults: Read the static slider defaults advertised by the BIOS
@@ -695,6 +697,7 @@ struct amd_pmf_ta_ops {
 	const uuid_t *uuids;
 	int num_uuids;
 	size_t shm_size;
+	const struct amd_pmf_policy_msg_ids *msg_ids;
 	int (*invoke_init)(struct amd_pmf_dev *dev);
 	int (*invoke_enact)(struct amd_pmf_dev *dev);
 };
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 7d876531bbe7..ed3aa150ec83 100644
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
@@ -761,6 +702,7 @@ static const struct amd_pmf_ta_ops amd_pmf_ta_default_ops = {
 	.uuids = amd_pmf_ta_uuid,
 	.num_uuids = ARRAY_SIZE(amd_pmf_ta_uuid),
 	.shm_size = sizeof(struct ta_pmf_shared_memory),
+	.msg_ids = &amd_pmf_policy_default_msg_ids,
 	.invoke_init = amd_pmf_invoke_cmd_init,
 	.invoke_enact = amd_pmf_invoke_cmd_enact,
 };
@@ -769,6 +711,7 @@ static const struct amd_pmf_ta_ops amd_pmf_ta_ops_v2 = {
 	.uuids = amd_pmf_ta_uuid_v2,
 	.num_uuids = ARRAY_SIZE(amd_pmf_ta_uuid_v2),
 	.shm_size = sizeof(struct ta_pmf_shared_memory_v2),
+	.msg_ids = &amd_pmf_policy_msg_ids_v2,
 	.invoke_enact = amd_pmf_invoke_cmd_enact_v2,
 	.invoke_init = amd_pmf_invoke_cmd_init_v2,
 };
-- 
2.34.1

