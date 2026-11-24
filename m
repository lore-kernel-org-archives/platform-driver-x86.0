Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795506784;
	b=IaR8oJqAlfDjlEM7W0qTXexNp84rl7evOL6iZ7ay9HBqq3fh+A74PaEABT5Vi5FX3ZOZ
	 /K3u303N06RqpJzkTTHG4L9MpN5k4egMmWsjcboi14JxPWDzegoa/vgPy11zeI6bRG/8a
	 Sq7trLLqpyeUlYNWNGY527a2pHkztCsdmRoeke7Ol4XxlP3vMpG4I9/eA8CMjoMThF5gX
	 8pS0bh+TpiDHg0IM+UsAlUeVJo7nehRouzxO2g/JdbBJ3wfgY/FVQCaAEsE8gOtlHzWhZ
	 SWMsJxH7WPxvFKWJ9vLVJmrK6AkLon/gbmoEAv3USmKT0TOFF4Y0zqwbGV/HX5zs/ew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506784;
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
	bh=f+shybXIJdUEqvDn7y2a03yLlhWwif/S9a+8cgaLniM=;
	b=TKWtLcd0MJ7m+tf7v054oz1XVH8q80gRZn8J9LGMx7l0CgQ8u0HWCMPeEJWDlB9oHF9C
	 QuHQ52E1vDeBz72BnHR/TSLnVYkdX20g/TwYFgeHJNRFSQ/6W1+LUJbPpHgw+VHQsF8RD
	 ZsGYXHFXgeAxo0BTT6SmLp10oWO2XvXFr7NsHL9Mb51cYdWEggm0RIUFw2AihxuEA//pc
	 EWk43QNQ27D7kYB6+0lVVA+I3kdF8Jwfttf8+4Nk1Im7lPlshxOSr3xajRaZ1GIlFseDy
	 yNYRAEbVwCcPCULM9LRf+DkhkpgMfXq3LgnC7yK9PvFdl1TOc0bVHVf+6g5EnCNVseA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rQASDPpx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.5
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010005.outbound.protection.outlook.com [52.101.56.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFF0606A322
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 07:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CFF0606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rQASDPpx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nuz9aHz3lIUM83rIE4iXvcijoVFZI8yfUMSBsACK+qFNIQpMi8Y4HVG3ZqYvzTjfOEHKSf/gSDDYfZNJ/piOlDau2UpbA4IbC+YVHNBBbh6kl5RVoaTYvDWED5P8L6sFa7fD/Noi/zW/FwnKo/xlSZrpiQPg25d9XyGMZKPPpYZ5rUtNoZxU4GJRg998y2whGmfEDI75Uy8NRJwc1UfjTi/7ONLeSWVAlXMv4mM9JDweEphdtV2xDd8uw/Z+JjKuRm2k3htxLAnyRt4/0fH7elqhuV6H6mf65MWfFlFebNQzhEv81UDHFmTqpT56Ha624nD263ilXTNCo/N0wiSYLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+shybXIJdUEqvDn7y2a03yLlhWwif/S9a+8cgaLniM=;
 b=kQVy2D2BfAdvW6wOIDx89HRpYEiVx5yfkeXCJshqad+CeSbtgegkVMpBxFd43qv3B66Uh+Cjy3Os2E+9Bz5fnL55A3R1NFU27aES+1ABfO/BBGWAQgEHC26kk7iYQZ0RTNF4pXrjoQIWFEDX7VrPaZgVd0pSstQoqxi/p3kbNWrONfYNSz9RKZe9+ky577xVg5JMKfMDaSssVDqKXKkpcBg0Y1ubusMQEwxCIXRGOpgwR4Ds/rMn6fr6suVPlF1NdfP5e8fgEyxgk1voXIbeGINPFg26BHm7fVztDz0ZjwkO02Rmh230i1q2LoxIHYOTqeN6XJ0tiTvzvG+Aoz8JcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+shybXIJdUEqvDn7y2a03yLlhWwif/S9a+8cgaLniM=;
 b=rQASDPpxWeKQGWX0KnoMd/U6YcfDmMHeYW2Z/gko2q0vNSSdAOoedPIJO5vFSLkMUQA7dExdZwhv1+uU/9+ZMkNZg5c8V++2yeAnYsdvJCrwl+6lSiF/sFVjHu0mwjHprgKgjfW8QaKdxRx4asHzg1IPHAcSuAHBrtj+nqWffNQ=
Received: from PH8PR07CA0002.namprd07.prod.outlook.com (2603:10b6:510:2cd::9)
 by CH8PR12MB720963.namprd12.prod.outlook.com (2603:10b6:610:702::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 07:53:00 +0000
Received: from SJ5PEPF000001D3.namprd05.prod.outlook.com
 (2603:10b6:510:2cd:cafe::35) by PH8PR07CA0002.outlook.office365.com
 (2603:10b6:510:2cd::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 07:53:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D3.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 07:52:59 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 01:52:57 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <superm1@kernel.org>
Subject: [PATCH v4 09/11] platform/x86/amd/pmf: Add custom BIOS input support for 1AH_M80H
Date: Tue, 24 Nov 2026 13:22:11 +0530
Message-ID: <20261124075213.2317127-10-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D3:EE_|CH8PR12MB720963:EE_
X-MS-Office365-Filtering-Correlation-Id: 4abc3d62-02fe-4271-9bb5-08df49fff5d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|261026140227099003|261102123227099003|261026121527099003|261022075727099003|261022105027099003|261028144727099003|261021121427099003|11063799006|56012099006|10067099003|261009223027099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	kkcyFg9gL80h6lgZsKj10L3XHu4fKu37eQiQPHx4gbKW9t0sd/FtU3TAZxDENCCLyqACBs4uXZ6T8agNrCnKgKvUcvkgBRh+a7UNX6w8lcmTOCJrirz1z3zIyBjb2lvZG0uOSJ/Nwsvh8op9te9VY8b7rPpZ8ADVABnD3l1HxkpB29fSsLYKcUMG91J9mCBpH4zjCpIzVfXARChNaxKs2gfcNuPTyRkhLUkVtxVvm5PG71tpFt65BE6JRTLXvKttcONlPILg7ksUaqpVrgs6z7XVVk4mc2MkRQUjzIVHBi9VfbiGGFPQOc1gf3CE4wt0h155bRFK2TrNIca+fT7yHS0pdExB0/Txz5vG4OL1U26QAk1GnneNbQTvQU5zVu1+vKs8IvLdXrlyACg51oxH1bp9EUnW5LsnEuOsiEMSWLo2VaNA2zm36rKK/3znD18aLjahT1+sxiRSgWRCsCAxpHX4VBqOOmOziQZeZ54Ei2VZzh8KLojJNEUzQwJm+E3fThBx0h0fL0olYaee6BJLv2iqBFugx/ZgmcD9iKJ0AMThwbqzS+9LBsbI0DY2rEgwbxJOR2vrgSu4ZyV/gB3H8IuBL2TuSCZp8g7+5+fYFozkbHILolwO6DRI+IbwTXixkIZpcBqoLE+OOaakN2FsoPcWyedcQUccW/CaBt5Fy2oQfQBFclwk3MhDScnB6TS4iDDheAe+3e30kzfquKvxWg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(261026140227099003)(261102123227099003)(261026121527099003)(261022075727099003)(261022105027099003)(261028144727099003)(261021121427099003)(11063799006)(56012099006)(10067099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RdLwQBnxReWk+3uhOM3ZyAge4aEnAPliqvv1gcLiLiv3UTedwnwOdChAt4k+RtdQe2zYsEloWn/bI0XmDvB8TSH9vH4FM876HZgtF2yokvMUVNo+hLE/tDR/15C7OvRSSut1mdPGq1uBfb8HC5AhVm7AdNlzt2dQCCm/qkHx+DBSzF56zWnMB9fu3888i4VVBTpW4d2EeLU+zErxoa6k7iMsHCUssyBv7Rv+ManhMjlcS839t6IV4tfzVIlsHaACxQY1RRCUVT7wY6HvF+tPUCX/8EoA0lsqMAJlRJl0x0auo2/gfun4+tOaBe7hvAGlhb6sShSzD+zKmNh5+Hqc+c7OAnNTYfR6XAjPoCjB4+KUYHDsKalah448NKTTgExQ46+tORdxm8DVa9y5rB6zdoCTNLHnf21FrjCb990sFb+7srlradJXg8IF4SKEYEIf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 07:52:59.8357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4abc3d62-02fe-4271-9bb5-08df49fff5d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB720963

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
index 11df1b74bb18..d2462ad7695d 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -278,6 +278,7 @@ static void amd_pmf_custom_bios_inputs_rb(struct amd_pmf_dev *pmf_dev)
 		break;
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
 	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
+	case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
 		for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
 			rb->data[rb->head].val[i] = pmf_dev->req.custom_policy[i];
 		rb->data[rb->head].preq = pmf_dev->req.pending_req;
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 733bc518ddec..dcd468864074 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -1489,6 +1489,18 @@ static inline u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *i
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

