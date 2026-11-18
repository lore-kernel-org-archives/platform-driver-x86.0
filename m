Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795012380;
	b=vF+pDEqWRODsAYWz62zvdgnD2NoxzaRg3iH0b3lrP7NJqRF6/aZH/HvpbMsmz+iOY97D
	 hP46CwFBGd3fNBIXOwDljRGFLfkbnnX3+LSE9ldKcz5jk4XifvMpsjjl0G1kQIObNQfXZ
	 g7nCs7Y5cLT+i3Ymb3PfnocTQxAmKtT/st6rx+UOIVBG36Rhd9XQXYNuzlpUpINIKscno
	 BheCvlPxOrw0cdD6VhqKn6E5EelPhxOTFiJKtSXQ89dTEwSdKyoUFD9x/RSBJ2e4kmhRS
	 CZqyheW98LcKE4rE74QZQTMebbAODcKq0CnM6TxZC/qXByQLTIgw+pDtnzouMnF7Ang==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012380;
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
	bh=76n0Mad/CMDpcfXwi/MMlbhZLCUvQEbQOJ26Ae8E1eg=;
	b=xx/OgttcfwtSKF/lfYTp/fjLdVRl4g5s42qLdGVyaoX1d+fbmE9YFfYl7BjvZU4u7WeJ
	 y1bBX1IsZIM8Vit2mVfZpxowau7O+bxohOsysBSP3389J14tCcl861rL4XcSRKrDmRiTx
	 XbTM90+5857HuFWTrXaaWd9JiZ5fbwY3AidJBqWzIUcrt0kNRh6GrLSYDKrhOcL34ni5I
	 slAqjWnEFhioG7OFjur0Cz94Cm9IQk7zrxq7HdV6rtrB+5MGjaDrBUjn7EtaR0eqXORt8
	 O6DvUaW2x4L1cCtzU8X8zBDbq0QfN6LKk+XU2tT8df/5xQvN48gYzd/vKMSf+c94Lqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=h3+yzCG4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.57
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012057.outbound.protection.outlook.com [40.107.209.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6567B606A32C
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 14:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6567B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=h3+yzCG4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhcl9dSilC20Q2vCmkbIV2ZzyQk3LlRx7j8pvnddm7jewJpsPuRjCS0wojUmQr77izVD02733d6xSZEzuBiVtkn88FMoIZ7awEbzVs90lSt/OCMYinNMQZEZWafHvWOnzEN20q1DTdITuOgiscu6392x4BmRj3Ih4/fSdu9M/8wmFGZHW9b2KaxfZnPajBl1mc1Ic9txZQEZSFBHQg6Wra6nkgGjsbe5bXFtG9X1TGtjMle6gOFdBTFZdMV6qSlv22v8gS1drC5CFSsin7psR70YtmBA8/grN/nEvdVVqGzcydYw+snA9jA4jRLhbB3Ljs2QZwlDj+boqoINj1V8/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76n0Mad/CMDpcfXwi/MMlbhZLCUvQEbQOJ26Ae8E1eg=;
 b=w7LWkTPJliU/SFMqogilr0Owv+u0NcRlHpfcI8vnPS1hQYITSVFuOa23+99lVmXMlXanDCjeGwzgTSxFszmkY2iv9QHCr8EHbUcfY4DRsYYHiBuhx6kWnH/juDTpLYf/LMLcaBTgamkSL5FTw3XFj/uZPGK7gg7YQgKx2oV8cr/lu/kon7Lvae3RetBAwJHMnOBMKx8sLNOb2wmFunEr3sJHhqMRliSfIgCs7wgYy8r9miRm+BPwRAtJiZbfzDSPJ2lqUFUhT164SnAlHzvyge6xM1xhfEy7TgJ9oKaXsGFXEk+9fsFJbw3TwrDBGmiJxCKPs3ODZJUwVH/ujh5Bbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76n0Mad/CMDpcfXwi/MMlbhZLCUvQEbQOJ26Ae8E1eg=;
 b=h3+yzCG4IGPdvMhETEgDhXb4fGbanEZcGAEOfT8H+DOBHOBbY1QBSm2MNoi0fWOuQmoVEQWMfS8KazaQlRcyRgCw4hwBxYYte1WekmXadxj3OGCeyyQ3cGmmVsBdcB0MQ4PZvxgvMdJbarurBVX4UrFHnbkBt7OKHWU0LBlwFhs=
Received: from CYZPR14CA0012.namprd14.prod.outlook.com (2603:10b6:930:8f::7)
 by BY1PR12MB8445.namprd12.prod.outlook.com (2603:10b6:a03:523::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 14:32:51 +0000
Received: from PH3PEPF0005961A.namprd05.prod.outlook.com
 (2603:10b6:930:8f:cafe::ab) by CYZPR14CA0012.outlook.office365.com
 (2603:10b6:930:8f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Wed,
 18 Nov 2026 14:32:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH3PEPF0005961A.mail.protection.outlook.com (10.167.243.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 14:32:48 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 08:32:44 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v3 08/10] platform/x86/amd/pmf: Add custom BIOS input support for 1AH_M80H
Date: Wed, 18 Nov 2026 20:00:32 +0530
Message-ID: <20261118143034.3566684-9-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118143034.3566684-1-Shyam-sundar.S-k@amd.com>
References: <20261118143034.3566684-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: PH3PEPF0005961A:EE_|BY1PR12MB8445:EE_
X-MS-Office365-Filtering-Correlation-Id: 5419befc-5217-448b-4004-08df4580d1b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|23010399003|36860700016|261102123227099003|10067099003|11063799006|56012099006|261021121427099003|261026121527099003|261026140227099003|261022105027099003|261022075727099003|261028144727099003|261009223027099003|22082099003|6133799003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	mIDeV52maRVC5Xq5/RDckTlW7z/TwDT8dLwh4r2cs0OOwkfE1vvHNSN2Atz2plU1XeprphySwStgxfvwqUvndm4u3nBq5xi+Jed3EGPblaZz8sSMtJS1hyZZrQ4gY1n7udk6KKG6aQNulzp+8ObSATxfc5KAmeFpU0s0cTULR8PBF60G7SWl85lhoFouwzZJ16q7fworwrfBQcv2a7CR/3r2jVKcRm0ukk0Hx5edmyvimgCU2FbfUdj21F0b4+89fF0bzujayFF/tbTBhkP7mSYNUU7EpFeapS9vNAgmV/vqnIXPWTamaJt6ko3zdG8AOQ6vCxNiCv77e+XzDe+39mKEPxFtovNDr+ZuwTnIdcssGbp/tMR1/ZUg2Ci+16lkSBfqSCm7xpitlARpiwLCHpPxwsaGC89i9R48sgXy6ziY5ZKkMK9OhmsTGmfQK0YX/Lx5UFENKf1gZCVgh50zU8e+D6j9TsCnCO162TOVx+jW/gBoSP82Het2dIgftq0EVNjrX0VGs07OBLwLIefknbpuJ7/5Aug0OIRmnFUWd2w6IWgKPEO9Kr4qCIvtKnQcU3Fp21hKF3LfBJ/TcNBpbtB4LahfYgo8IH7h1/4leaJ+AVDWVZV7fbXfMd/U1CFe9aQxhJHJXbEmiBh1TNa2zmCZbNRjxtHqWVwO8mK8/GotWTWw8DsLpSFFFaG1QnFvDdxMDcdXNKYtjXZ2hVx8mQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(23010399003)(36860700016)(261102123227099003)(10067099003)(11063799006)(56012099006)(261021121427099003)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003)(261028144727099003)(261009223027099003)(22082099003)(6133799003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pGeFbX4Jc9VJLrjtfu39NbgPfhFhdavnjBiWJo3SuB0AHS9APCrNMiEw1BFiC7+1ovFA9Bt9fqNAm7g+YJPCSlbjhY7orp4z5zhtIWskVzbyXh4vMsmfPjhvy0u+ejB4EoZMpP8qIveCNfWflhtyuyz7Ry+K2EW/5wS4GJvLptr35O/q0cpRlDMTq4yAzo7ozLEnMVk7Ha3V3kY+nVXdWn5G3YnF515ZNJ2q12szBxVuUnbnfEaO9D3FmKjh0A5CzW0srlHJ/FaZnt3jSpJeKJdWaaY3/b6Gj/JHU+EUfxtN4n8YDPuA2B97gtQgPbjIYeFap3pRXayaVe/lift22T3RBgnJdi1CEwDQUDzxrngn+xyDSz0VIMyHBk/zArDQKbueGO1ZBUYkEtS62AFjbFl0BTl81QJEdKoohSH5dMs2rs64ut6qOsrM/AuM6jtw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 14:32:48.4930
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5419befc-5217-448b-4004-08df4580d1b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH3PEPF0005961A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR12MB8445

Custom BIOS inputs 1-10 are reported through the APMF SBIOS requests
function in the same way as on 1AH_M20H and 1AH_M60H, but on 1AH_M80H
they are not passed to the TA yet.

Store the inputs in the existing ring buffer on 1AH_M80H and fill them
into the v2 TA condition table. Also report them through the util
interface. The SBIOS request layout up to the custom inputs is the
same, so the existing structure is used.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c |  1 +
 drivers/platform/x86/amd/pmf/pmf.h  | 12 ++++++
 drivers/platform/x86/amd/pmf/spc.c  | 61 +++++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/util.c |  5 +++
 4 files changed, 79 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 24e6dffc608f..20e9603d5c08 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -288,6 +288,7 @@ static void amd_pmf_custom_bios_inputs_rb(struct amd_pmf_dev *pmf_dev)
 		break;
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
 	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
+	case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
 		for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
 			rb->data[rb->head].val[i] = pmf_dev->req.custom_policy[i];
 		rb->data[rb->head].preq = pmf_dev->req.pending_req;
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 9a34a63ba7ab..fda06100826c 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -1474,6 +1474,18 @@ static inline u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *i
 	}
 }
 
+static inline u32 amd_pmf_get_ta_custom_bios_inputs_v2(struct ta_pmf_enact_table_v2 *in, int index)
+{
+	switch (index) {
+	case 0 ... 1:
+		return in->ev_info.bios_input_1[index];
+	case 2 ... 9:
+		return in->ev_info.bios_input_2[index - 2];
+	default:
+		return 0;
+	}
+}
+
 #ifdef CONFIG_AMD_PMF_DEBUG
 void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
 void amd_pmf_dump_ta_inputs_v2(struct amd_pmf_dev *dev, struct ta_pmf_enact_table_v2 *in);
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 6c82ce011d79..35538732259a 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -31,6 +31,8 @@ static const u8 core_type_to_ccx[AMD_PMF_METRIC_CORE_TYPE_MAX] = { 0, 0, 0, 1 };
 #ifdef CONFIG_AMD_PMF_DEBUG
 void amd_pmf_dump_ta_inputs_v2(struct amd_pmf_dev *dev, struct ta_pmf_enact_table_v2 *in)
 {
+	int i;
+
 	dev_dbg(dev->dev, "==== TA v2 inputs START ====\n");
 	dev_dbg(dev->dev, "Slider State: %s\n",
 		amd_pmf_get_slider_position(in->ev_info.power_slider));
@@ -51,6 +53,9 @@ void amd_pmf_dump_ta_inputs_v2(struct amd_pmf_dev *dev, struct ta_pmf_enact_tabl
 		amd_pmf_get_platform_type(in->ev_info.platform_type));
 	dev_dbg(dev->dev, "Laptop placement: %s\n",
 		amd_pmf_get_laptop_placement(in->ev_info.device_state));
+	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
+		dev_dbg(dev->dev, "Custom BIOS input%d: %u\n", i + 1,
+			amd_pmf_get_ta_custom_bios_inputs_v2(in, i));
 	dev_dbg(dev->dev, "==== TA v2 inputs END ====\n");
 }
 
@@ -85,6 +90,19 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 }
 #endif
 
+static void amd_pmf_set_ta_custom_bios_input_v2(struct ta_pmf_enact_table_v2 *in,
+						int index, u32 value)
+{
+	switch (index) {
+	case 0 ... 1:
+		in->ev_info.bios_input_1[index] = value;
+		break;
+	case 2 ... 9:
+		in->ev_info.bios_input_2[index - 2] = value;
+		break;
+	}
+}
+
 /*
  * This helper function sets the appropriate BIOS input value in the TA enact
  * table based on the provided index. We need this approach because the custom
@@ -104,6 +122,21 @@ static void amd_pmf_set_ta_custom_bios_input(struct ta_pmf_enact_table *in, int
 	}
 }
 
+static void amd_pmf_update_bios_inputs_v2(struct amd_pmf_dev *pdev,
+					  struct pmf_bios_input_entry *data,
+					  struct ta_pmf_enact_table_v2 *in)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++) {
+		if (!(data->preq & custom_bios_inputs[i].bit_mask))
+			continue;
+		amd_pmf_set_ta_custom_bios_input_v2(in, i, data->val[i]);
+		pdev->cb_prev.custom_bios_inputs[i] = data->val[i];
+		dev_dbg(pdev->dev, "Custom BIOS Input[%d]: %u\n", i, data->val[i]);
+	}
+}
+
 static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, struct pmf_bios_input_entry *data,
 				       const struct amd_pmf_pb_bitmap *inputs,
 				       struct ta_pmf_enact_table *in)
@@ -119,6 +152,33 @@ static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, struct pmf_bios
 	}
 }
 
+static void amd_pmf_get_custom_bios_inputs_v2(struct amd_pmf_dev *pdev,
+					      struct ta_pmf_enact_table_v2 *in)
+{
+	struct pmf_cbi_ring_buffer *rb = &pdev->cbi_buf;
+	unsigned int i;
+
+	guard(mutex)(&pdev->cbi_mutex);
+
+	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
+		amd_pmf_set_ta_custom_bios_input_v2(in, i, pdev->cb_prev.custom_bios_inputs[i]);
+
+	if (CIRC_CNT(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RING_ENTRIES) == 0)
+		return;
+
+	/* If no active custom BIOS input pending request, do not consume further work */
+	if (!rb->data[rb->tail].preq)
+		goto out_rbadvance;
+
+	if (!pdev->smart_pc_enabled)
+		return;
+
+	amd_pmf_update_bios_inputs_v2(pdev, &rb->data[rb->tail], in);
+
+out_rbadvance:
+	rb->tail = (rb->tail + 1) & (CUSTOM_BIOS_INPUT_RING_ENTRIES - 1);
+}
+
 static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
 					   struct ta_pmf_enact_table *in)
 {
@@ -412,6 +472,7 @@ void amd_pmf_populate_ta_inputs_v2(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 	in->ev_info.device_state = tmp.ev_info.device_state;
 
 	amd_pmf_get_smu_info_v2(dev, in);
+	amd_pmf_get_custom_bios_inputs_v2(dev, in);
 }
 
 void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x86/amd/pmf/util.c
index f6244d2f4c22..f8b716ad6d3a 100644
--- a/drivers/platform/x86/amd/pmf/util.c
+++ b/drivers/platform/x86/amd/pmf/util.c
@@ -54,6 +54,7 @@ static void amd_pmf_populate_ta_data_v2(struct amd_pmf_dev *pdev, struct amd_pmf
 {
 	struct ta_pmf_shared_memory_v2 *ta_sm = NULL;
 	struct ta_pmf_enact_table_v2 *in = NULL;
+	int idx;
 
 	ta_sm = pdev->shbuf;
 	in = &ta_sm->pmf_input.enact_table;
@@ -73,6 +74,10 @@ static void amd_pmf_populate_ta_data_v2(struct amd_pmf_dev *pdev, struct amd_pmf
 	info->avg_c0_residency = in->ev_info.avg_c0residency;
 	info->max_c0_residency = in->ev_info.max_c0residency;
 	info->socket_power = in->ev_info.socket_power;
+
+	/* Custom BIOS input parameters */
+	for (idx = 0; idx < AMD_PMF_BIOS_PARAMS_MAX; idx++)
+		info->bios_input[idx] = amd_pmf_get_ta_custom_bios_inputs_v2(in, idx);
 }
 
 static int amd_pmf_populate_data(struct amd_pmf_dev *pdev, struct amd_pmf_info *info)
-- 
2.34.1

