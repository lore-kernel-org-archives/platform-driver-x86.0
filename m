Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013066.outbound.protection.outlook.com [40.93.196.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB972236E5
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Nov 2025 07:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762845037; cv=fail; b=hqW1gJ051UP+uSQrBjoU/3PJYRdUO1fkz2js66h8xBzRUYiSW7rIlCTtXHuNEn6noCN09TSFAjiSUdkKMvSRlXDIU74WCEOiWX1UdeLqhqmQyeS3uNTG0TN3sp5ECx3ynNxMUCSwJe2JdjURZnaiIQPjaQCx1W1iMSYEGGGn9uw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762845037; c=relaxed/simple;
	bh=Ff5Vp1tk+9+CKQ9VVj6enbtjbipzJL4XARzzWHSseZE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uBBDdRXV0mrj5aqpm7SRG4cjAtrrOBQwtNEvIeEBnANQcPdiWPD1IYIHIncYcjbpICQQI5u5dzR9bftGClJCgGBXfpjfgIAlekU6PjSs4sNm89PqjDHe6XD2ZJt/4fzbM5zN8Q2HCFdRAwYs3vjATwbzL6yP6ytKt+AY0kEfi3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HUU3n1PM; arc=fail smtp.client-ip=40.93.196.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HUU3n1PM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pykFmox8ElWMpgoeDr1Nyb2qiCwH+S2SISW9Fx3Q8eY7iWD3DyrOpGuITBJ1qHReIccIc3hvNZEbe8PP4OWA5pXqnwGhfBJdYDSJGGqHbnF633xgWgHhroSi9RTJ+Nxv7a/7u12WjhWSZuJN21tEikYupEzn/Y8yDlhu9KoxtuHvakO1gGsWAIiKaDmYntwj0hROhd+HMmFt749SqT4Kl5OWBlpvmDx3Oeykrp5c7P0uk3OIZAiEaIi5ksyXx7GKgFOHHG/3M+ynYyt9ldILPxRFJtjwmUSyLV9lzWmZ652Ke9C9Zs2qQeEBzBrqGw56R28ZNiQQ/NAvP9eEFLSqBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWtxwYxgSovKxEjM8BTwaOOwXWvnVAUviENKq7dgg70=;
 b=TKOJf1u7MfYGWTqIhvWNQK9zMfkcw/kiH1FWd/IBc8bseR02cmAavlHr5GfBjhQwA1xpsLoudknOMjZgGqm3AUpYGJmhVICsCkGEH/a7z8bC1fQXCFX5sKJsnMoAuZ5rUdvTSrnXmCsBKHxRFRKw/rAVpWL2pXYZa8hvlOqwSfK5tmoOe3iFxxtUC4AqK16Am6CSyhfpxQfBRf71p8plSDZvecxp/7xNBGeGJkcUd8gSH9U27gtvZRvcnH/Bu+flne6pkzJ7vsq4YnpUkRvl3+xldv1mIIwFsWyOFrvU1Knp9eIpnshoSX2BkrY1RzON+65iBLVlVu2ZWmy1uUsW2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWtxwYxgSovKxEjM8BTwaOOwXWvnVAUviENKq7dgg70=;
 b=HUU3n1PMePOiWr61UUTz8dRFIyI/b5TNTCzCod/rabi8XEn9neW6boyYbCFOTaOYSij5MfktkoVO/+0mDiwker1RkBdBdo94Zh5wYSAEsfrn8ed7eKfc+/itbjhhgoOLDC73xheVrPRrF0x0u/5eRlkPk9vtmjMEd+n07zlmU0E=
Received: from BL0PR02CA0144.namprd02.prod.outlook.com (2603:10b6:208:35::49)
 by CH1PPF93AB4E694.namprd12.prod.outlook.com (2603:10b6:61f:fc00::61b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 07:10:32 +0000
Received: from BL6PEPF00020E65.namprd04.prod.outlook.com
 (2603:10b6:208:35:cafe::a2) by BL0PR02CA0144.outlook.office365.com
 (2603:10b6:208:35::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Tue,
 11 Nov 2025 07:10:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E65.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 07:10:32 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 10 Nov
 2025 23:10:30 -0800
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Yijun.Shen@Dell.com>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 2/5] platform/x86/amd/pmf: cache BIOS output values for user-space telemetry via util IOCTL
Date: Tue, 11 Nov 2025 12:40:07 +0530
Message-ID: <20251111071010.4179492-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251111071010.4179492-1-Shyam-sundar.S-k@amd.com>
References: <20251111071010.4179492-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E65:EE_|CH1PPF93AB4E694:EE_
X-MS-Office365-Filtering-Correlation-Id: 32cde451-b308-4656-429a-08de20f16784
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tYBNyoLKIvyAATm7S9cXTxMh/HbQDeMYa/CLcXF+cWGBrZrTBSQzCcBOGb9U?=
 =?us-ascii?Q?9kCJEfXI1Lr0FyCn1tED1VNiFEGhz2B4X9xx4iWmSzpVg+1A7yCXpB3uSZOi?=
 =?us-ascii?Q?hJsflnbU3h0oUt4XNpdpHfsqtDCujU2lSjvNnu07+feLobp0/ERLTJoCNPr6?=
 =?us-ascii?Q?fb5z9zkV3WubPH+GEVgzMK9Tew6msD19cOENoUd1CZ8wD9NVjAcg+mj4c6Gs?=
 =?us-ascii?Q?D3lcmH0OR3bEjP/VV4yGYQydIXPzCB1CIZqVqgvOF86QnF62ufbNMXFvfqg2?=
 =?us-ascii?Q?3D424So657pjfHIg+pySYzcCJMAXG1s3mbuB/CnCnw6Hnl3DVuoxLIaX/mqS?=
 =?us-ascii?Q?oED5kWuIzWCwaKzfVqIBpjGC5mdTlEjkrL3iXyad2JCsO4sWtUBMof/yyG5k?=
 =?us-ascii?Q?yNtAOMb5gWcNQJuSmKDein9vxnSChHVWjcFTurCR5d2Il0GcQG6RFr/zX4nU?=
 =?us-ascii?Q?UFhfxdC2yeUg/dKKdK2qDqYe0MVhLYtlAai2wzXhEqo09YYXUaHAx5+fUyRJ?=
 =?us-ascii?Q?Y59s0zI2+Vi8cbvZ0CzSY+2wua/K2Zgkrep6CYJcTYCUbEsuANPaHR52eKZW?=
 =?us-ascii?Q?1JDd35MeUJJC2nSWuBT49SI9SDZOrxhoGhivX0c1TnGyZtwdYrJ3T8miTne4?=
 =?us-ascii?Q?D+e8uhBAuXUVZ8B9wrhpRkPB7n6ZeN85AWiKhf81paCdqztZ6sJ82Kx3UiWf?=
 =?us-ascii?Q?xeRx9N46/1us5WDrW8VgNrCwluNVki942bAFMkEQsT2Qy3D0G3yqejeVVHKS?=
 =?us-ascii?Q?aSqvevvRwsBFjx8XK6xffhEWEtVgBd3xuSNsWwBdixM1XuYWDd+drFlNVF4V?=
 =?us-ascii?Q?qlW6WEQIEL0tXpvxHfhL/O6l2n5VYcIikWb3q6YIMiZdiHG9Qtism9NcgEFN?=
 =?us-ascii?Q?6nOeEOTyfEwihjhU2AIF4RYLAKRn1HvwwVGTV6eO9gmzWMtX7cHXQRzKQj/p?=
 =?us-ascii?Q?lwC5M9NnnHcZkK0tr66FZb6KVKgUsjMKsERUwQse1OjTDKSkaIrHnacjmKXz?=
 =?us-ascii?Q?YAHMgx17Y1DESweD+FAllINx60kvm6kInK0wxhwzeE/H8un/4t9y27vNG/S/?=
 =?us-ascii?Q?Bd6TK/vwU24EcjRKEWPB5QyOKToz6syNbEd//XF1vT/0geBy+5Zr2G8w52oS?=
 =?us-ascii?Q?OkVeHjgGUp+OU+INJ+6w6NhYCqu7s6EPg2c7/7ynWa9ipGczNR5vBkuLWtf1?=
 =?us-ascii?Q?oGaFK2Tl7+2/PqDhm8mJN819DpUYmlUlNBrKy0JvKs1PfrLDZPxj1rhAm1Ce?=
 =?us-ascii?Q?ucKl66ktNO3knLQxupUZyqgGE/ubUN58gI2HfDIl0bbjKOHlj1m5OuAOLtua?=
 =?us-ascii?Q?2jTygAtf2MnoTJ2A3gwNQWl9HZJ+eJbdbtt4np2I0/N4oBlqximURxrV2FSj?=
 =?us-ascii?Q?FUc5ai6b2jjF6NNOU/AtWMoilJCEAE43mi7nC6IeOYsnNVg775GFPrCxih90?=
 =?us-ascii?Q?cEL0oiqD/uFkkHYiJZ4hU5Fr5NGNQYsOrwGk8CDG41L8K2YcYMZcrOIhpl5u?=
 =?us-ascii?Q?pO2CFLfHrJGSN7mBD5Ml+V7tCiUFuJgUAyRdZGflaT1MnvKpzgAINcWSIIGJ?=
 =?us-ascii?Q?hF18g4FvwVvVBXKdXZw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 07:10:32.8683
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32cde451-b308-4656-429a-08de20f16784
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF93AB4E694

Add a bios_output[] cache to amd_pmf_dev and store the latest values for
BIOS output policies when applying PMF policies. This enables the AMD PMF
util layer to expose these BIOS outputs alongside selected thermal and
power telemetry to user space via /dev/amdpmf_interface and a new IOCTL,
supporting real-time monitoring tools such as SystemDeck.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h    |   1 +
 drivers/platform/x86/amd/pmf/tee-if.c |  10 ++
 drivers/platform/x86/amd/pmf/util.c   | 140 ++++++++++++++++++++++++++
 include/uapi/linux/amd-pmf.h          |  48 +++++++++
 4 files changed, 199 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 3b1aae8a60a5..5880d6fc3afb 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -406,6 +406,7 @@ struct amd_pmf_dev {
 	struct apmf_sbios_req_v1 req1;
 	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
 	bool cb_flag;			     /* To handle first custom BIOS input */
+	u32 bios_output[10];
 };
 
 struct apmf_sps_prop_granular_v2 {
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 6e8116bef4f6..8ea309aade95 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -183,42 +183,52 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 			break;
 
 		case PMF_POLICY_BIOS_OUTPUT_1:
+			dev->bios_output[0] = val;
 			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(0), 0);
 			break;
 
 		case PMF_POLICY_BIOS_OUTPUT_2:
+			dev->bios_output[1] = val;
 			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(1), 1);
 			break;
 
 		case PMF_POLICY_BIOS_OUTPUT_3:
+			dev->bios_output[2] = val;
 			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(2), 2);
 			break;
 
 		case PMF_POLICY_BIOS_OUTPUT_4:
+			dev->bios_output[3] = val;
 			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(3), 3);
 			break;
 
 		case PMF_POLICY_BIOS_OUTPUT_5:
+			dev->bios_output[4] = val;
 			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(4), 4);
 			break;
 
 		case PMF_POLICY_BIOS_OUTPUT_6:
+			dev->bios_output[5] = val;
 			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(5), 5);
 			break;
 
 		case PMF_POLICY_BIOS_OUTPUT_7:
+			dev->bios_output[6] = val;
 			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(6), 6);
 			break;
 
 		case PMF_POLICY_BIOS_OUTPUT_8:
+			dev->bios_output[7] = val;
 			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(7), 7);
 			break;
 
 		case PMF_POLICY_BIOS_OUTPUT_9:
+			dev->bios_output[8] = val;
 			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(8), 8);
 			break;
 
 		case PMF_POLICY_BIOS_OUTPUT_10:
+			dev->bios_output[9] = val;
 			amd_pmf_smartpc_apply_bios_output(dev, val, BIT(9), 9);
 			break;
 		}
diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x86/amd/pmf/util.c
index 97a626bac034..bfb30117a5af 100644
--- a/drivers/platform/x86/amd/pmf/util.c
+++ b/drivers/platform/x86/amd/pmf/util.c
@@ -17,6 +17,143 @@
 
 #define AMD_PMF_FEATURE_VERSION         0x02
 
+static int amd_pmf_get_metrics_data(struct device *dev, void __user *argp)
+{
+	struct ta_pmf_shared_memory *ta_sm = NULL;
+	struct ta_pmf_enact_table *in = NULL;
+	struct amd_pmf_metrics_key output;
+	struct amd_pmf_dev *pdev;
+
+	pdev = amd_pmf_get_handle();
+	if (!pdev)
+		return -EINVAL;
+
+	memset(pdev->shbuf, 0, pdev->policy_sz);
+	ta_sm = pdev->shbuf;
+	in = &ta_sm->pmf_input.enact_table;
+
+	if (copy_from_user(&output, argp, sizeof(output)))
+		return -EFAULT;
+
+	switch (output.control_code) {
+	case IOCTL_POWER_SOURCE:
+		output.val = in->ev_info.power_source;
+		break;
+	case IOCTL_POWER_SLIDER_POSITION:
+		output.val = in->ev_info.power_slider;
+		break;
+	case IOCTL_PLATFORM_TYPE:
+		output.val = in->ev_info.platform_type;
+		break;
+	case IOCTL_LAPTOP_PLACEMENT:
+		output.val = in->ev_info.device_state;
+		break;
+	case IOCTL_LID_STATE:
+		output.val = in->ev_info.lid_state;
+		break;
+	case IOCTL_SKIN_TEMP:
+		output.val = in->ev_info.skin_temperature / 100;
+		break;
+	case IOCTL_USER_PRESENCE:
+		output.val = in->ev_info.user_present;
+		break;
+	case IOCTL_BATTERY_PERCENTAGE:
+		output.val = in->ev_info.bat_percentage;
+		break;
+	case IOCTL_BIOS_INPUT_1:
+		output.val = in->ev_info.bios_input_1[0];
+		break;
+	case IOCTL_BIOS_INPUT_2:
+		output.val = in->ev_info.bios_input_1[1];
+		break;
+	case IOCTL_BIOS_INPUT_3:
+		output.val = in->ev_info.bios_input_2[0];
+		break;
+	case IOCTL_BIOS_INPUT_4:
+		output.val = in->ev_info.bios_input_2[1];
+		break;
+	case IOCTL_BIOS_INPUT_5:
+		output.val = in->ev_info.bios_input_2[2];
+		break;
+	case IOCTL_BIOS_INPUT_6:
+		output.val = in->ev_info.bios_input_2[3];
+		break;
+	case IOCTL_BIOS_INPUT_7:
+		output.val = in->ev_info.bios_input_2[4];
+		break;
+	case IOCTL_BIOS_INPUT_8:
+		output.val = in->ev_info.bios_input_2[5];
+		break;
+	case IOCTL_BIOS_INPUT_9:
+		output.val = in->ev_info.bios_input_2[6];
+		break;
+	case IOCTL_BIOS_INPUT_10:
+		output.val = in->ev_info.bios_input_2[7];
+		break;
+	case IOCTL_GFX_WORKLOAD:
+		output.val = in->ev_info.gfx_busy;
+		break;
+	case IOCTL_DESIGNED_BATTERY_CAPACITY:
+		output.val = in->ev_info.bat_design;
+		break;
+	case IOCTL_FULLY_CHARGED_BATTERY_CAPACITY:
+		output.val = in->ev_info.full_charge_capacity;
+		break;
+	case IOCTL_BATTERY_DRAIN_RATE:
+		output.val = in->ev_info.drain_rate;
+		break;
+	case IOCTL_AMBIENT_LIGHT:
+		output.val = in->ev_info.ambient_light;
+		break;
+	case IOCTL_AVG_C0_RES:
+		output.val = in->ev_info.avg_c0residency;
+		break;
+	case IOCTL_MAX_C0_RES:
+		output.val = in->ev_info.max_c0residency;
+		break;
+	case IOCTL_SOCKET_POWER:
+		output.val = in->ev_info.socket_power;
+		break;
+	case IOCTL_BIOS_OUTPUT_1:
+		output.val = pdev->bios_output[0];
+		break;
+	case IOCTL_BIOS_OUTPUT_2:
+		output.val = pdev->bios_output[1];
+		break;
+	case IOCTL_BIOS_OUTPUT_3:
+		output.val = pdev->bios_output[2];
+		break;
+	case IOCTL_BIOS_OUTPUT_4:
+		output.val = pdev->bios_output[3];
+		break;
+	case IOCTL_BIOS_OUTPUT_5:
+		output.val = pdev->bios_output[4];
+		break;
+	case IOCTL_BIOS_OUTPUT_6:
+		output.val = pdev->bios_output[5];
+		break;
+	case IOCTL_BIOS_OUTPUT_7:
+		output.val = pdev->bios_output[6];
+		break;
+	case IOCTL_BIOS_OUTPUT_8:
+		output.val = pdev->bios_output[7];
+		break;
+	case IOCTL_BIOS_OUTPUT_9:
+		output.val = pdev->bios_output[8];
+		break;
+	case IOCTL_BIOS_OUTPUT_10:
+		output.val = pdev->bios_output[9];
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (copy_to_user(argp, &output, sizeof(output)))
+		return -EFAULT;
+
+	return 0;
+}
+
 static int amd_pmf_get_feature_status(void __user *argp, unsigned long feat_id)
 {
 	struct amd_pmf_feature_support info = {0};
@@ -56,6 +193,7 @@ static int amd_pmf_get_feature_status(void __user *argp, unsigned long feat_id)
 
 static long amd_pmf_set_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
+	struct device *dev = filp->private_data;
 	void __user *argp = (void __user *)arg;
 	struct amd_pmf_feature_support output;
 
@@ -65,6 +203,8 @@ static long amd_pmf_set_ioctl(struct file *filp, unsigned int cmd, unsigned long
 	switch (cmd) {
 	case IOCTL_PMF_QUERY_FEATURE_SUPPORT:
 		return amd_pmf_get_feature_status(argp, output.feature_id);
+	case IOCTL_PMF_GET_METRICS_DATA:
+		return amd_pmf_get_metrics_data(dev, argp);
 	default:
 		return -EINVAL;
 	}
diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
index 2147240c2bb1..bbc45c6fc113 100644
--- a/include/uapi/linux/amd-pmf.h
+++ b/include/uapi/linux/amd-pmf.h
@@ -9,6 +9,7 @@
 
 #define IOCTL_PMF_QUERY_FEATURE_SUPPORT  _IOWR(AMD_PMF_IOC_MAGIC, 0x00, \
 					       struct amd_pmf_feature_support)
+#define IOCTL_PMF_GET_METRICS_DATA	_IOWR(AMD_PMF_IOC_MAGIC, 0x26, struct amd_pmf_metrics_key)
 
 /* AMD PMF Feature IDs */
 #define PMF_FEATURE_AUTO_MODE			0
@@ -17,6 +18,53 @@
 #define PMF_FEATURE_DYNAMIC_POWER_SLIDER_AC	5
 #define PMF_FEATURE_DYNAMIC_POWER_SLIDER_DC	6
 
+enum pmf_metrics_id {
+	IOCTL_POWER_SOURCE,
+	IOCTL_POWER_SLIDER_POSITION,
+	IOCTL_PLATFORM_TYPE,
+	IOCTL_LAPTOP_PLACEMENT,
+	IOCTL_LID_STATE,
+	IOCTL_HETERO_STATE,
+	IOCTL_SKIN_TEMP,
+	IOCTL_USER_PRESENCE,
+	IOCTL_DISPLAY_NUM,
+	IOCTL_BATTERY_PERCENTAGE,
+	IOCTL_BIOS_INPUT_1,
+	IOCTL_BIOS_INPUT_2,
+	IOCTL_BIOS_INPUT_3,
+	IOCTL_BIOS_INPUT_4,
+	IOCTL_BIOS_INPUT_5,
+	IOCTL_BIOS_INPUT_6,
+	IOCTL_BIOS_INPUT_7,
+	IOCTL_BIOS_INPUT_8,
+	IOCTL_BIOS_INPUT_9,
+	IOCTL_BIOS_INPUT_10,
+	IOCTL_GFX_WORKLOAD,
+	IOCTL_DESIGNED_BATTERY_CAPACITY = 24,
+	IOCTL_FULLY_CHARGED_BATTERY_CAPACITY,
+	IOCTL_BATTERY_DRAIN_RATE,
+	IOCTL_AMBIENT_LIGHT = 29,
+	IOCTL_AVG_C0_RES = 36,
+	IOCTL_MAX_C0_RES,
+	IOCTL_SOCKET_POWER = 50,
+	IOCTL_TA_BIN_VER,
+	IOCTL_BIOS_OUTPUT_1,
+	IOCTL_BIOS_OUTPUT_2,
+	IOCTL_BIOS_OUTPUT_3,
+	IOCTL_BIOS_OUTPUT_4,
+	IOCTL_BIOS_OUTPUT_5,
+	IOCTL_BIOS_OUTPUT_6,
+	IOCTL_BIOS_OUTPUT_7,
+	IOCTL_BIOS_OUTPUT_8,
+	IOCTL_BIOS_OUTPUT_9,
+	IOCTL_BIOS_OUTPUT_10,
+};
+
+struct amd_pmf_metrics_key {
+	enum pmf_metrics_id control_code; /* In */
+	long long val; /* Out */
+};
+
 struct amd_pmf_feature_support {
 	bool feature_supported; /* Out */
 	unsigned long feature_version; /* Out */
-- 
2.34.1

