Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013004.outbound.protection.outlook.com [40.93.201.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D56317171
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Mar 2026 13:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772370724; cv=fail; b=inqFQIUeb2YmeCVzYKpfasYkmQbtLuSsltXgD7oQCchwUhwA5BCpyzn/KZdIVDtEnfF0oz8NsVQnbH9/4CzXJwSi7zEX/e0l7C2ayRLazSvpt5ydtbU8GplaCtDLEo/z1I1EQaAwErOMq+nCDPe9xfbLCp53p4UKSpxBXPoORck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772370724; c=relaxed/simple;
	bh=P9VcRqTRua6/Gu4aR6SSSga3tgCOaVqZRQQflccWUcs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Aj/czhozwcmbsD5Rx14IRRmnnDBKOC8vaYZm9W35B/cgy5p0iXta4FB0TT1QsJ/Ayb09ONlqqFhHrNId4sbCXKF2mF3CIBBtU9EMs0GB2I6pj4QIhVbfmG2+FOUqO5Qwt5LB1JYaWTg4YV/d3JGeuvJ1otYmw8KFoWF/qgtWBiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TQOsC2ZY; arc=fail smtp.client-ip=40.93.201.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TQOsC2ZY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xPC2pXQZOg9zsAh3drKaWMFaxslY+01NVOevR6EQq6P0ZX4Z0lUMIQhh+i93oIQAMI2E4Tev7PvDochDKuDKkfLcjLQ0r38R3nNYUt0QDxeT2/636/2oFzwxWvX3Pk4nxvq+bwYkYouyBEcWv5XYBv92BXPtL9uRZkXOaVhAjhHoD+XUWjdAv3Lv4HCvRs1JAQtauq/8GS2p+udCBFKINfBOBeOMZTGxa6DTd7U1AZvSrKWDifKlgfyvOIbbnQ6qmqmjxypuBQGFidwdLRbADRnZp6IiB2D026rvRSdaC4OMdCNcsZN3DeWy+3mTltI/TffaBXbuFcj2NYMZ3X9NmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1qPVEp2aHnN6XaGgjIl04NObUgOEsSpkavY89OG2Yo=;
 b=ig1ZiiFZYasQtwm4g64aym9YUvFLLNpvsblvyx6Xi2lo8mjkGUWfmpd2AU3Yplg5ILpi4DCPhziM+jfv+9J4b+9FhKxtHfFa52GY43swTabw8SCY7w5Uun8Raf1gdMB0ehpSTFQpT+5kjiOTtPhVE+/6A4QV3HmamUsfW1r/OXdZwLLAL1RDFsaSmDFqRFexeD9qfgHcIZBxkFfpTOx+jbmGzBG/+tM1QA9584p7GvG2JV4t57e3vWxww/0W31ASOyqX7usBwy2TbqtvAfl3LrNChS0IiWqofRALWzMyJcEqbTyi2W70dGtiUdLY53l73LmpSvahOBYUBcwKPg1WNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1qPVEp2aHnN6XaGgjIl04NObUgOEsSpkavY89OG2Yo=;
 b=TQOsC2ZYUkEc7reFRxHNQTlveZCOXTGmMg3Af0FaYucM7YuQmEVR+IUMs2L4co5bffN+buoGG23ac7KlgLJSZOuO9EHOHCZDV8TIB1ZyYsGgLkzEgsH6j8wnC7Y1LOk+Rmfk5kVMts1YiRVpXeiVHDqDDvmzXeLHl+QegFcpovA=
Received: from MN0P222CA0005.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::8)
 by CY5PR12MB6153.namprd12.prod.outlook.com (2603:10b6:930:27::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.19; Sun, 1 Mar
 2026 13:11:57 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:208:531:cafe::8d) by MN0P222CA0005.outlook.office365.com
 (2603:10b6:208:531::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.19 via Frontend Transport; Sun,
 1 Mar 2026 13:11:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Sun, 1 Mar 2026 13:11:56 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 1 Mar
 2026 07:11:54 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Yijun.Shen@Dell.com>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 3/7] platform/x86/amd/pmf: Add feature discovery support to util interface
Date: Sun, 1 Mar 2026 18:41:20 +0530
Message-ID: <20260301131124.1370565-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260301131124.1370565-1-Shyam-sundar.S-k@amd.com>
References: <20260301131124.1370565-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|CY5PR12MB6153:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eb37ec0-3f23-4102-1999-08de77941d8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	ROvXDBnpFE72HVB+jixk3s+zjxYsLMRRf+lZRXTwwdPopbB6iWU3w57CqweiW0zCsYSb/tlMeYt52kcbUAA2sdLuaEPk0T/v1xRPXIQkwwKE56fCIStfO7TWYlkugZSwohV/Lmd8Lodjo2Z1Qi6g/BAcj09h9EFCVtzDccqTNkAFEkobrSL3SBMUeW4xf6sSBmIiq3mn5nT4hsWJwiFV7X68hR66Qzi9Ix1RYt1nLcFUjTIlAY4rFoJUA8B1f9fcBChDtTaGbN653PgPXvzAPl4+b7eb9G4doUYFUiMDEdcm+qsBiT+KrewH2iFfJkVoe2ZHIseqy9ZzjXrrpo1+tIdEmg8G+uLPj4CEY3N9l4AVBwlgUtljrJIxfuKn7G8g/IRybI2riptrwElbvTx4hhaneGCyMpVeEJSNFoVWJgUYudNSxqlSVuCwcdcyVzsNgBpWKUXfPfWi5ne8jXg/Ch/rYyrkkWngf38yLKE8wiMnlT012T+z1qA3YfRAdNzLKov9BQSwKsXl4RDyUAz0Gkey8VAvtsognldNQs1t5KP3TcWtsqmczWVoAkj2aYLp+/P4lb0CCU6MqOdCjMcYyzE4SuJjz2TwacfoecD7674XfWKSj+f+5mz8Ez8sTZIYoa859uYGbpdGKM4fKkJ5dDX3BtXIoFXbn5GNrUsBWXxcRdMWeW4h2f6E23Y3t9pLW7NLiqoj71hOhuyj1inK0ogMmwqVsB8EcIbdRsfdmpvtPXofCxHS1obuzOV5FR9sOjLxrmk6yZ9nsUuztthRFP4swC2szrpAFutVpVlN9tanqMpgKFmk5SGoJJ+KpSeZoDvxPSF/TWXS7fO9hqLRkA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Kq3dWFf9WCIrUfBkSVzzxyR51WG6mJTYpCwFSPT+Tgrumb2nHt2I/If5dGpyCpWWew/9PWPW5oxWUjK0PcBiYY3kkc+yEnlmKej65foaTdSUOAaU8p8Xg4N7FVfzXzsZ1FrAzj7RJ0mc899h80a0L+Fvf6Uv5FIbwngLGjXIda3QHtsPEPLtQAmWf3RxcCvGPkbMjRAsFXYecVAizNHEYkK8CXYOXVCeeFAsyNtOCimVwqvwH53nie6E4TFHt5UN5EBfK3KEkz5vN7cMV97ffrbPqyyjrGzhoyL0DDOBK2mv+Sacmm5CkUU0kzLVpmRUMPIGxq25UMVDAheUWc3zlK0/bbU2d045UZmqUei2pHh3uDUyhC2oh/0VJ0Xlmmg26mc/h9TOeP645eIfC8ecIy5/zxL5fSJFI/Ix1XfMHGvnbJpPMK5B9pbLSWeXV+pu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 13:11:56.7412
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb37ec0-3f23-4102-1999-08de77941d8d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6153

Add feature discovery capability to the util layer interface, allowing
userspace tools to query which PMF features are supported and enabled
on the current platform.

The following features can now be queried through the
/dev/amdpmf_interface ioctl:
*Auto Mode: Automatic power profile switching based on system activity
*Static Power Slider: User-selectable power profiles
*Policy Builder (Smart PC): Action based policy management
*Dynamic Power Slider AC: Adaptive power profiles when on AC power
*Dynamic Power Slider DC: Adaptive power profiles when on battery

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/util.c | 33 +++++++++++++++++++++++++++++
 include/uapi/linux/amd-pmf.h        | 12 ++++++++++-
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x86/amd/pmf/util.c
index 59a125deb6b6..9a14467f412c 100644
--- a/drivers/platform/x86/amd/pmf/util.c
+++ b/drivers/platform/x86/amd/pmf/util.c
@@ -16,6 +16,8 @@
 
 #include "pmf.h"
 
+#define AMD_PMF_IOCTL_VERSION		0x02
+
 /* Convert BIOS input control code to array index (0-9) */
 static int amd_pmf_get_bios_idx(u32 control_code)
 {
@@ -46,6 +48,33 @@ static long long amd_pmf_populate_bios_output(struct amd_pmf_dev *pdev, u32 cont
 	return pdev->bios_output[idx];
 }
 
+static bool amd_pmf_is_feature_supported(struct amd_pmf_dev *pdev, u32 control_code)
+{
+	bool feat;
+
+	switch (control_code) {
+	case IOCTL_FEATURE_AUTO_MODE:
+		feat = is_apmf_func_supported(pdev, APMF_FUNC_AUTO_MODE);
+		break;
+	case IOCTL_FEATURE_STATIC_POWER_SLIDER:
+		feat = is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR);
+		break;
+	case IOCTL_FEATURE_POLICY_BUILDER:
+		feat = pdev->smart_pc_enabled;
+		break;
+	case IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_AC:
+		feat = is_apmf_func_supported(pdev, APMF_FUNC_DYN_SLIDER_AC);
+		break;
+	case IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_DC:
+		feat = is_apmf_func_supported(pdev, APMF_FUNC_DYN_SLIDER_DC);
+		break;
+	default:
+		return false;
+	}
+
+	return feat;
+}
+
 static long long amd_pmf_device_state(struct ta_pmf_enact_table *in, u32 control_code)
 {
 	switch (control_code) {
@@ -116,6 +145,10 @@ static int amd_pmf_populate_data(struct device *dev, void __user *argp)
 	case IOCTL_BIOS_OUTPUT_1 ... IOCTL_BIOS_OUTPUT_10:
 		output.val = amd_pmf_populate_bios_output(pdev, output.control_code);
 		break;
+	case IOCTL_FEATURE_AUTO_MODE ... IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_DC:
+		output.feature_supported = amd_pmf_is_feature_supported(pdev, output.control_code);
+		output.feature_version = AMD_PMF_IOCTL_VERSION;
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
index f93767248169..f34c5d744039 100644
--- a/include/uapi/linux/amd-pmf.h
+++ b/include/uapi/linux/amd-pmf.h
@@ -70,6 +70,11 @@
  * @IOCTL_BIOS_OUTPUT_8: Query BIOS output parameter 8
  * @IOCTL_BIOS_OUTPUT_9: Query BIOS output parameter 9
  * @IOCTL_BIOS_OUTPUT_10: Query BIOS output parameter 10
+ * @IOCTL_FEATURE_AUTO_MODE: Query if Auto Mode feature is supported
+ * @IOCTL_FEATURE_STATIC_POWER_SLIDER: Query if Static Power Slider is supported
+ * @IOCTL_FEATURE_POLICY_BUILDER: Query if Policy Builder feature is supported
+ * @IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_AC: Query if Dynamic Power Slider (AC) is supported
+ * @IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_DC: Query if Dynamic Power Slider (DC) is supported
  *
  * These control codes are used with the IOCTL_PMF_POPULATE_DATA ioctl
  * to specify which metrics data to retrieve from the AMD PMF driver.
@@ -110,7 +115,12 @@ enum pmf_ioctl_id {
 	IOCTL_BIOS_OUTPUT_7,
 	IOCTL_BIOS_OUTPUT_8,
 	IOCTL_BIOS_OUTPUT_9,
-	IOCTL_BIOS_OUTPUT_10
+	IOCTL_BIOS_OUTPUT_10,
+	IOCTL_FEATURE_AUTO_MODE,
+	IOCTL_FEATURE_STATIC_POWER_SLIDER,
+	IOCTL_FEATURE_POLICY_BUILDER,
+	IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_AC,
+	IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_DC
 };
 
 /**
-- 
2.34.1

