Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793983598;
	b=sQXkwOQQopConOIfdUsnr/eQ66w+YOEqM88xevWXun63JQoivfzsLNJsdQFMN1Svgz39
	 CU3Kd57QdxGVIupwokTPcqlxsuZPxXMxi3TyYjpnowqxlvSNJAFeYqZEX6r1jaXbTuIWP
	 tirkj5/nfnAQnVKEG7nvPTamamzfLOsB9Nw/Rfiz2QHv6CE8YuCaBDZOSgU//MsCOpzOH
	 Xyb72ZMf+gtgjKQuh+kbTMkpQdhr7HHrXQalhwBhRrbvDxMCIHDB+zi+QW3Ehaen/kiLY
	 HCajxRPXeKfi8oRbH4kyAnT1i8sX3iVUxtxK4nj0gYiP36KRHurK4adCxPjw/BBO8Pg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793983598;
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
	bh=1J25+ZjPW0fOYjX+GPy6x9tSUgzNFoTV0RW9S9lWEwo=;
	b=2GCr4hSfAYCq5/05hK7jGnSqGkIP1SyFfCHy8FHDMbHf2US9cBMB4MvV0wWJxDmrX6ka
	 nImEwH2sI3BANX9Z+ioZLqE6uADXJuyjK1XU3193UdCrXr3y8PrebpNRt9oGG3vMKrwAv
	 ieOMdC+e0KB0OMSTlgTP6hoMDBGqbbxsf6fyK0PDOHOQv6QFpcYJ6mPxfIWFAXRVWRlRw
	 R1IN7uOMp/s+1WshZZoV+F9AgZfrYcyIZ9O+dsp676JgC8r3smgi/Hvnq+aMXjBWKRvUA
	 MfZFEddTEHjNs72o1LjY2WUpMxX1WKNfLkcpb9+L0dto94YodEzr/b8IHQVJFE4RGFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fBssDHiH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.70
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011070.outbound.protection.outlook.com [40.93.194.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA50606A33A
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 16:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EA50606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fBssDHiH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQMOmhwRTCtCR50xoUJK8uW2ApEJMTfzial8ikMblWHM/8DsXRBvnZGTvXK7NN7yfYcrHHtLv9c+JxACeHPCCKWR2mmMI4Aq+HKw9JrGymSB5lfaAOeEohLiEbC0Xf0Y9qOy+8PDw/IAxGjmB0POrYZEITjIFzt25+XMUrvi2zzS2dGWLaJV78f1D9pHP4VHUf9S62x4tkSQBhZER+eBgT+lXyfBGS3xKpqsLc2PJ/F/71pHd+Ezhfid4Ste3a1oZMIKLXo1gtfX3PNx81WuIYEkeg/YUrFr5IenKbP3qFXcJId5zUnLgZGK/yDqDTFzQMyLws50pUYMf44GreI7ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1J25+ZjPW0fOYjX+GPy6x9tSUgzNFoTV0RW9S9lWEwo=;
 b=R8NhGI5wUe3MELAsOZqDtGNzPekRiUWcZ9G5dVpVRjeGEoJqlQEBHchBXlF3TRuoxeEIZzWczKfKQv7VxvIJ2eOiKTx3tQohyttGa2zY0HNvYR4gLJvGWo0rzuQEJEs6159cqi3P5Ucnkk25jRkU1mp7Q4HJeXkJWfMeWrj+9vTtmFzClf1k9Uaji9nYZAfw8rRlPVCm/gjUg0PLtFl3j3PxIBtc2zXmuyIbWzRa/txmMapN0qlvYYaLo1GCbbU+n7wgdZgvtauoLcYYYrmPIevcOXYsqP90bbT80R9X/OzCw3op7msKLgq13Hb8h54DrfEFJeWccbK5gNocxa5t6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1J25+ZjPW0fOYjX+GPy6x9tSUgzNFoTV0RW9S9lWEwo=;
 b=fBssDHiH6XH90o6g2ux5Yi5YSCDPxovwP7LbakdI9H+4G26PwWIobYDDOI2sCUN9GDByrAjvVuLR8Q8ZqYbmioXOn3oObIuRop8t7IeNkkJkSmdcYytwb9dU/mmRknJfDKChFhDR8jiVJtaqepXyjhhz6GejXxO4GhZC55FODG4=
Received: from MW4PR04CA0380.namprd04.prod.outlook.com (2603:10b6:303:81::25)
 by IA1PR12MB6260.namprd12.prod.outlook.com (2603:10b6:208:3e4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 16:46:32 +0000
Received: from BY1PEPF0002695A.namprd05.prod.outlook.com
 (2603:10b6:303:81:cafe::84) by MW4PR04CA0380.outlook.office365.com
 (2603:10b6:303:81::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 16:46:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0002695A.mail.protection.outlook.com (10.167.244.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 16:46:32 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 10:46:29 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v2 08/10] platform/x86/amd/pmf: Add custom BIOS input support for 1AH_M80H
Date: Fri, 6 Nov 2026 22:14:27 +0530
Message-ID: <20261106164429.30738-9-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0002695A:EE_|IA1PR12MB6260:EE_
X-MS-Office365-Filtering-Correlation-Id: 138a6106-c53f-48f0-802b-08df3c258336
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|36860700016|82310400026|10067099003|261102123227099003|11063799006|56012099006|261009223027099003|261022105027099003|261022075727099003|261021121427099003|261028144727099003|261026121527099003|261026140227099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	37fhFdSYQjL59CIazeVOKohzGoAL1NjfwoRKZcXHw2uS5jlihcwOgq99Lse2jp3BMSrBTqzqpuVqSG+REjyCcu4S0ivcBy8Co+jwJWP86lMwzLAYE5xuXNw+/BQbkffp/Ml6RdZ6LY+O9ysfLNESHAAyNC/1fD8dwkenyGDCFwK2Cm28W330NHRsNvoXQLtrhWQbpQ22ONPCdjAXAgKfQcTpztWoAR8zobXOKN0UTyzuUsfrP0j6bMin/WMROIvYpk0aATphWviFNe34ysqyKXIUooOrvMv8fcLQwdCkbVPR6pAV1EJPR2qGkdvuNgHNp0gODI2JjQCbl4NY+nFArx9NrNrR/MtUCAJny8UUsU7yWTKsyIWeuOmALTzg+w+rQo5ZSaBpjsSxyabs7z7z4JkabhBe8w4xw6t1ctWigoR1Y+PSyVlhlHaSplIp0DwBFxIWQNLpnhrNHUezPDvynEpudcXT7KXIS6OauktNNrNI/Y6cjEVeJNghnEegeLEG8DH4cbIjOmv32tBuZuoM8XgKLXTxmDu+WLD68NqxMIX9VQC0lI9lOW9ds/whMwdHlseUe7B+1LXWPTMV1H8N5XV/h1sGdFBNyPufZF2TAzGDpLTjDP7U879GxBFopqvpOc+GejPVtYGLziqloKAElmOXQIB0nT+Mth+M9gm3uDEEK4zTPG/Cj5K4qVhfaT1CsS+ENWKEqS2N50y1ag/j0g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(82310400026)(10067099003)(261102123227099003)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261022075727099003)(261021121427099003)(261028144727099003)(261026121527099003)(261026140227099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8ujY3amfelPt4hr+de36wWV6wIpi/tv8GgTrwbsVREBshI+rRWnxBdO0u5w0XrDpPPpAunU+sfHTaUYpKSYYKdiRwbjZBh9hvfdXPKi+H6jc1pApTXhrLWGyl6InJxRjcYkXF87YGoV7Py5vXTxhqUqUM+z43EC1zi8TRnY2hulqX0QhQjZpl/uQr+SIKrCn1PK2aPB9zLz2r+vglHFgyTxYV35TZcY4oBm0V7Atwc21VBomRSMpFftICLUOQdDH7VzRIZnctC4WUmAzDJO9bKbMPgEkKqi2xoHh5yEwddxA7TDc401xuHbIg5eJ2S6qGFLFWUwdR1a231ClDXvRpDAFwYmSs31mNARhSw9+fCLF6xuDiKBGKGxAxRHpHlE4r/lLFQnIzEB9b2P8fX95D5KTd7yvmKjRAcxSLQe3+Uq0kidrVsUwPUxItIj9fLjn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:46:32.1486
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 138a6106-c53f-48f0-802b-08df3c258336
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0002695A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6260

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
index d19d877d9ab5..216a21649ef9 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -1472,6 +1472,18 @@ static inline u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *i
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

