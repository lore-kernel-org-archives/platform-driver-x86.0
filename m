Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011057.outbound.protection.outlook.com [52.101.52.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8EB31064A
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Oct 2025 10:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760696784; cv=fail; b=qZ8JFJdYc27MKCrqh2iDrptsfMniax9p7kg2f39kfaNJTwrOg6TZxRd0OFcrlKLM9aw0h8eKuNwYa9H+Wv8kFPCSFKNMQIn95Ql2NLw65l16xfhP+qrTNQWp6Tjaa21UQfTf7tYX2Fcf7LyVG0ZYQTloj2txaYLVomID+kyoTOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760696784; c=relaxed/simple;
	bh=m43vJEp47bzZ5/DpFTE279afwClrBrJv7fc+I8LQQIg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s3x8DyhZqocFRkVOyCK8qIivn9vOeAvmVCiTnPpC3TauOnl69p3jIfML5AwVsn39e5RBKhCnhZAegKQccttvz/5ej2fa2ogQkB4viWs0RvlQdZvOemdgE+aWSlLllc4Q8MTTYjmcVBj6UZ2nXPj8MsELzewkZYffExp6aUqPQNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fBP/iDkd; arc=fail smtp.client-ip=52.101.52.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fBP/iDkd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQP16bQVcMPAq5mDDUzuEfLIbyjgPH95wdKZv85RbGSHu7Aur6mPj5FQfqY0jNvLlM/8Gp3tlzcT6Eis5r+NCelK+vEfQhWFD2TY0oNr5GXuMpqqyRw4MrPTQZmlZonqjLVMH68hVRp6nQfz2Fqt3HMN8IIXMruYFG5fUmlJeJkYDxzHYFbpoBGU2pgSP7o25L7J/mvb9lOryS3f4yObfQHNRBQQcV5aLGh08v9LmWCIoUXFXZXbeeLtnCvxrvSz5CjABz/fS+TJEkOsDelr20mlGOM3a5qhbfbJqROtTj2GGiqFFcifuwO2zucC9vPPR4IxKQH6e19wEVC1DnN2Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6NF7ViurUyEm9qoMaFops1YyaogQuHlnXYArMDbZKVs=;
 b=p9p06Osp742iRUtBRA3OosDAv8RqxS77jgPwkgVtD7xkbNfJ1aMFGBX1znxQhbOiG0Q2xm3rlBAP1ClyMmDF2fzBNwpDRNl/NfMEskb3eW9iz5pBwWRMgeYe4PcTZtN8htfGlaLyxwVovZZLCOHy6aEkiRVZy5c2LwdKxBKwK7m/FWPAmRli12FQf3ZSRthwmmr1ieJbGwm0ui9KFEyJEKuKUjc+kNPr5qAWZ0g+t2jqi/t7gLawx0pgmGNvz/Yu/S4ynWM74vvcmJ8oFJKYPCABJRAq+a1ehB2+XSDQ+1SkI/O6FbD+bMvDz/H1k6PE/GfTxURUdYkIwA5CgzrFKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6NF7ViurUyEm9qoMaFops1YyaogQuHlnXYArMDbZKVs=;
 b=fBP/iDkd0xH315x3kUlhLs5i/6Ie3aT96pq8UZ4qCblxRmTiR5GyLNu3fubyOMd8B1lM50k+p4VY63xWYTm0pXI5wiGGdjPIu/WTfLtdM6a1kkqAYbmK1Gl5HpJrS53BNEfbEqlPdO/2/U6M1pAqVFVf7vuGKX0GTHTRrDHUmf8=
Received: from SN6PR01CA0013.prod.exchangelabs.com (2603:10b6:805:b6::26) by
 CH3PR12MB7667.namprd12.prod.outlook.com (2603:10b6:610:14f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 10:26:17 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10b6:805:b6:cafe::61) by SN6PR01CA0013.outlook.office365.com
 (2603:10b6:805:b6::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.13 via Frontend Transport; Fri,
 17 Oct 2025 10:26:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 17 Oct 2025 10:26:16 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 17 Oct
 2025 03:26:13 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@Dell.com>, <Sanket.Goswami@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 2/3] platform/x86/amd/pmf: cache BIOS output values for user-space telemetry via util IOCTL
Date: Fri, 17 Oct 2025 15:55:43 +0530
Message-ID: <20251017102544.1470934-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251017102544.1470934-1-Shyam-sundar.S-k@amd.com>
References: <20251017102544.1470934-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|CH3PR12MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a815f8a-6d7e-4aba-b27c-08de0d679b1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Y6zuJ4mtUp1SX9xhP2eQONf6RPx4BfUvuJktlbpIBW5gq+IyIHk03rlt2ZPw?=
 =?us-ascii?Q?yk3Y4v39oWgBG9k+LTKZ2XyB+yZn+hCdhri2bgyhKiLlQnrTJy3BT6KvTmIG?=
 =?us-ascii?Q?C1imi+uajWlTuyCC5kWQhRD+IN2snaTH7j6CeWVGd8dDRD8EuqBLqr/6NOHv?=
 =?us-ascii?Q?6PLD1l/HAyKyVwfXsR4N/uQ56WFgej0P0H9p3KIEThYlvfDZ+UI1th9/z6JD?=
 =?us-ascii?Q?06Y0l6q6CjXqdZFYdI/DOB86MN+IF6h2EpImVtX9IbMZjYXDBqF6RrsdFEin?=
 =?us-ascii?Q?/hbKbY/AzQ/QN1KEP+hThwPiz20tGSRAyo//F2gXEeWiwcjZTFnFSWF3Gmwr?=
 =?us-ascii?Q?n8WIb04Inl5mTxtNbv/3JcAHrMYJqOly0+mlFTj+N0xlbWQFAKSxKyVSW8Xt?=
 =?us-ascii?Q?QjI0t9HS0cmHi/J1Svl2cWLfqp+Hv/B1tiypuiFTearhVRdtaiw0uPX51w0l?=
 =?us-ascii?Q?myfOcivUrsyHuP+lej4GcCk0dKjo+Q3+nxYPaGKDktw9rT1vVQIz3IGYDShE?=
 =?us-ascii?Q?4CdOhYGdPptjuQhsushCzy2rbj2emnrvx3ULQiE7NrHX4G3bahP0w01K1e0N?=
 =?us-ascii?Q?gFG1B9DKYtbUjyPCIuxU2q163HXscB6y+RAE6eSucEWZmj8pvEuay9585rDO?=
 =?us-ascii?Q?VUi4xUdcNEsh7G2xeKrfBgsjFEl9sht0jmG9HTCdHcE4VKxkclBErwW9N6R0?=
 =?us-ascii?Q?RxjgftIBRQtV7KlIfS/4vMfRaRmlH0h03j7jkBPNfbSSne6/LPf/XHqaIHiz?=
 =?us-ascii?Q?/qN3xPiao+YGeB7ZQwSrjWRnVdqOR3fJWpcj0UzZKSMysn8DKO5EcCD1Asmz?=
 =?us-ascii?Q?7zFKcMOSVmx9W5V5htwCxZqajiD9T3eXb2dB40BmxKUtA02fYdZmucqV1GN8?=
 =?us-ascii?Q?7b/UbewGWraghO87tVLK+dy9wkXqvOiMmzdoT9H8qXwu7hg664NYE//GeW52?=
 =?us-ascii?Q?JQZ+44cSQg3Owwhww9HZ+J1JllhSw604jyYcOEFejBZQtUKGLX/w1UTjIDRK?=
 =?us-ascii?Q?nUwIrdbbqCZ7uV+wgxmwVwwOmkyqhcpLk85v0ZsJj+DuXF+2GNe1EpCTQ+fh?=
 =?us-ascii?Q?e4P0r1tFYclInFXHsqVGgV/ktxB4O9UkDZAjV7KpNz7zQTDCQIpRiBysqKfS?=
 =?us-ascii?Q?cueO/Yf33Ka/zacKZ6OJe0PWGw/3NGkWlya43gsCZscKX1THyGtMODRNY1A8?=
 =?us-ascii?Q?T+nhwGznhezMoSrFFQ3U4GX4g87KuSWlNX1O4bVN0F4EZ7Sk9zUTP3xVJuNi?=
 =?us-ascii?Q?QiHCtHeJXt8iQTbsIhClL9q9Vvq0e8WiZRFAp0UWK/YMaHuO5rU9Ik04wSYM?=
 =?us-ascii?Q?p/Rfv0caKBKopP4xSRPl50Aale5e67oBnZh2PbWkaYvqXRJ6Pz8aSC4YUYBU?=
 =?us-ascii?Q?eBSTL+rXFiN4CBHkGs11JW0ITHYJ/vBh0QsliTQcyRNeK46MzLwbS1YwnfKu?=
 =?us-ascii?Q?+siyT5u1HS7nPFAS1EcgESMUD1neiJvL1tOPvw8zuKesgooqVy1JYECAqI/8?=
 =?us-ascii?Q?KcNGsIAC6HIQ7D6UJzjKfKbS/Lvj8+3BopsGtMVedZKxY0G3x2K5Jcw/NHrn?=
 =?us-ascii?Q?Ecyc8wparge6RvNAX/M=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 10:26:16.7747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a815f8a-6d7e-4aba-b27c-08de0d679b1d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7667

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
 drivers/platform/x86/amd/pmf/util.c   | 190 ++++++++++++++++++++++++++
 3 files changed, 201 insertions(+)

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
index 483e4531535e..307c22791a07 100644
--- a/drivers/platform/x86/amd/pmf/util.c
+++ b/drivers/platform/x86/amd/pmf/util.c
@@ -15,6 +15,7 @@
 #include "pmf.h"
 
 #define IOCTL_PMF_QUERY_FEATURE_SUPPORT		0
+#define IOCTL_PMF_GET_METRICS_DATA			38
 
 /* AMD PMF Feature IDs */
 #define PMF_FEATURE_AUTO_MODE		0
@@ -25,12 +26,197 @@
 
 #define AMD_PMF_FEATURE_VERSION         0x02
 
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
+	IOCTL_MAX,
+};
+
+struct amd_pmf_metrics_key {
+	enum pmf_metrics_id control_code;
+	long long val;
+};
+
 struct amd_pmf_feature_support {
 	bool feature_supported;
 	unsigned long feature_version;
 	unsigned long feature_id;
 };
 
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
 	struct amd_pmf_feature_support info;
@@ -70,6 +256,7 @@ static int amd_pmf_get_feature_status(void __user *argp, unsigned long feat_id)
 
 static long amd_pmf_set_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
+	struct device *dev = filp->private_data;
 	void __user *argp = (void __user *)arg;
 	struct amd_pmf_feature_support output;
 	int ret = -ENOTTY;
@@ -82,6 +269,9 @@ static long amd_pmf_set_ioctl(struct file *filp, unsigned int cmd, unsigned long
 	case IOCTL_PMF_QUERY_FEATURE_SUPPORT:
 		ret = amd_pmf_get_feature_status(argp, output.feature_id);
 		break;
+	case IOCTL_PMF_GET_METRICS_DATA:
+		ret = amd_pmf_get_metrics_data(dev, argp);
+		break;
 	default:
 		return -EINVAL;
 	}
-- 
2.34.1

