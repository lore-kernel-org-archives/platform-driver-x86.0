Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010011.outbound.protection.outlook.com [52.101.85.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6BE2FD69A
	for <platform-driver-x86@vger.kernel.org>; Sun, 11 Oct 2026 10:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791713244; cv=fail; b=E9cYtrVMll2nIItzRsNNmJcV2/88vNb3xgz19lOb6DTfTBwsATbGb4XDhKl9DlqnFOGCtBjlIgcuQLUMDGvhXOHPJTZzVY6tA+2Ct3JV2zwsMPxiQsIQ2jTcDr2thXwQpgseRSJCTD4fCXQmnZbg0A0SlnDMdToWQ1irX3oxrfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791713244; c=relaxed/simple;
	bh=lpqrGpjqTKOfDdDZn3Q8uyON42WrKvoXIoqXb1ibLzA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CPmjlJZjk4LEeOUUyhPbV6FUhnsbgmjxU7R7wfd6ThuSxYY1zIIqptBtU4arzZKpgqOS6zyKOZR5JgRJbxIHVvS0PWEmt9F6WnV46+usBs/T/HhXMr0cadUfQ63jqn9X2zvoXHWE/W7/ELOneYspFZ8JIrv5/FzTDGaiCyjNziw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tVrIMNHn; arc=fail smtp.client-ip=52.101.85.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tVrIMNHn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EVVyNIkYZBhm3n7sPZGbFc7HoMiXWhP0qGTAqpjYlSrHcZC/f6/Lt7pR8yjJFCkmQ+oE+rKJ/IpfCc3/8ANUw2qq4SNqFcFrY3nZIXlJilN1YwkMUAegLHZL43ylgGyWZulVOSU9pjaP1b9phul6Zj8ENCyI3V9XU1MaHyjkwYlCBFeGAI6AuRVuMkxmTidG+Epk/0GAR0EK2s44M5IXuoBnfWImjVs1N7vegycuj+MVntivwO8N27ic308drrqbTdEMuIbXJ2OF9NsOkkjcOYp+g0N5A1c34fwhBdGxiQ1JAebBnd7EDd3N/98DrM9ZZ3LpOd4Gb199IF5L/CUUTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Su/4vdi5d26vDn4mGKJOTqEAK/NAI2Z9wBEdvev37Ws=;
 b=QmKHVc0FBpbTKrka/bLpil8WOlGLTPvNkEaX4mwLmm6VqGlOERDxfDK6BbrV0LlNShlyo++bYqFB11hcRhZsQEmgciyDZWhYTWRHTp65iL4lWnBtIeY6k6IR1wDVbTf33rU/YJu8Y8w3B1qLy6N5wIgJyGrkxYN1XQrvMrIF+zqHJ7Y163LZqq2KsknFpOHD7r/sAoU9uBkvkdeKtUsxG9Wb147N16+XIv8wItJgAnE+OypngIpWRyrpXMD4QIhUDIvJSjbF0hxoWQmarbc8YlyANsHjvw+WbrSjpTXOslRaYjta+zS5cZSUaFOdb5mmOXMCbUTEA5j9mzvA3EEpzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Su/4vdi5d26vDn4mGKJOTqEAK/NAI2Z9wBEdvev37Ws=;
 b=tVrIMNHn+1hOK6bs6QC+4Rd+go8gIbMJSeJhINxiTKoKrRGz+4NMOvMX1/watWjfeWlgPpRkDdqDXvzb/XZ1XhoH6e2vAUQM/b8Vd6J13KyJAQ/Nx68ITEepgZSWz4kZ7MfrwxbUcHGbGvb7dOgd6KfjBmoDvA1xH2VIgNtwMxE=
Received: from BN9PR03CA0455.namprd03.prod.outlook.com (2603:10b6:408:139::10)
 by MW4PR12MB6804.namprd12.prod.outlook.com (2603:10b6:303:20d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sun, 11 Oct
 2026 10:07:19 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:408:139:cafe::62) by BN9PR03CA0455.outlook.office365.com
 (2603:10b6:408:139::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Sun,
 11 Oct 2026 10:07:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sun, 11 Oct 2026 10:07:19 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 11 Oct
 2026 05:07:12 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 7/8] platform/x86/amd/pmf: Add custom BIOS input support for 1AH_M80H
Date: Sun, 11 Oct 2026 15:35:53 +0530
Message-ID: <20261011100554.1841309-8-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|MW4PR12MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: 55902e03-3a02-422a-89fb-08df277f6f72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|6133799003|10067099003|18002099003|22082099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	dxHFKSF4NemDR29nhgrFMKOt3gp4e7FHU2fRbnZK3YyChI3FdtSTRtFI4RWNIKk3c/iy5ie7u6vhrZYe85AJRn5sybAeTogVAheTKr7kSGEN+ScZWRfXNN7n/Ne98IqPmm1/MIEwW0pOihNZbb6F1crsB4/YPX9t6nEFaEMB+JYdws/0KiVMFQmRmNRwdo9rWPsAtN9YHyUAsn52ehOnhcK7PJZNqRgvFJplEM9buhJdyEnJ/Vo3/oTWMqyTKNhWrNyrWvfPVRpVjAYAVuNye608jiek0QwSWghpilDfJ+7OL8eDSq/IXg1P/IjP78MGvyyi14nMUk7gGyqHN8uuNCtB9qZ6Ts7vCgRaGQiHBgkX0Aol+9+pPvTyqIymadK7TAsjL1Ychnkzte4XAU6CWQQqn86wEQW3lH+HK5RAwfeLlsf/XRKY20413FJNONoZ8TmZdgquiq4NCOCq+eGtw4v8oeMU+1nd/fPjiYDNTzbeseugSQnPGQo+z5vQAntvXirXzhzedTjSI2VBvpqxxSffnx5I65y901eYXcITZ55LI/3LOfEVJ58vvX81SrcBttTmEF3PyCdnVYx1BdeswCLVzE4uV1WMx6laTS16ZNuMNWj/y9TQ6+TAoRbQXWIiSg6qJ4l02syTIq+Mb22tOPhcKTW36EdehIj/zD7Cg2n2mpWa9yGRy1DOoarQFsiqpyNjGYW6uPaJNYLaeNhtQw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(6133799003)(10067099003)(18002099003)(22082099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	61OfnseIM/M74n+1kniGjN1Y+3OvI4zQtcsKvxDHrJ2H4lGkl30XpmOq9sz54ZXUmKN5sajtdqxJBVDPIHoHJPnpX3jmNajktH/C2mf83obGqaN5P2306hapH6iXpip6I2v5EKME2l8zOVRovMZRaG2bj1qvSptmccu2Hdi35aaQYr1wwdvsGj2RD6Cet9Uf+D6slPJ1Lqvvn7Dw5tH5s/54ejGcc3O60mMU8KyTU9o+YjtH08OfChrs97sO/ZSN6VP/I+rzh9uoLbGeG8V3bn//S9u5kQu90VSwF/wrY+NOsKVjX2l0pky5XXFf6+zCC8nIQjg+vkDCG5tEgNpc07H6HwtCaxIGdIPUW6mB51W4lnYEKpyklGJ8aeTpafCEBUir8BKFkBz/7EZeKj7tzgVMG8pT+Jxc9mFvRHytzQixdqq2WbrVWR1+GbTF5Mf/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2026 10:07:19.3573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55902e03-3a02-422a-89fb-08df277f6f72
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6804

Custom BIOS inputs 1-10 are reported through the APMF SBIOS requests
function in the same way as on 1AH_M20H and 1AH_M60H, but on 1AH_M80H
they are not passed to the TA yet.

Store the inputs in the existing ring buffer on 1AH_M80H and fill them
into the v2 TA condition table. The SBIOS request layout up to the
custom inputs is the same, so the existing structure is used.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c |  1 +
 drivers/platform/x86/amd/pmf/pmf.h  | 12 ++++++
 drivers/platform/x86/amd/pmf/spc.c  | 61 +++++++++++++++++++++++++++++
 3 files changed, 74 insertions(+)

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
index fff6fb3bf4e6..70ed0b07faae 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -1471,6 +1471,18 @@ static inline u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *i
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
index e1f2ea268d4e..4c6e32a50ab2 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -29,6 +29,8 @@ static const u8 core_type_to_ccx[AMD_PMF_METRIC_CORE_TYPE_MAX] = { 0, 0, 0, 1 };
 #ifdef CONFIG_AMD_PMF_DEBUG
 void amd_pmf_dump_ta_inputs_v2(struct amd_pmf_dev *dev, struct ta_pmf_enact_table_v2 *in)
 {
+	int i;
+
 	dev_dbg(dev->dev, "==== TA v2 inputs START ====\n");
 	dev_dbg(dev->dev, "Slider State: %s\n",
 		amd_pmf_get_slider_position(in->ev_info.power_slider));
@@ -49,6 +51,9 @@ void amd_pmf_dump_ta_inputs_v2(struct amd_pmf_dev *dev, struct ta_pmf_enact_tabl
 		amd_pmf_get_platform_type(in->ev_info.platform_type));
 	dev_dbg(dev->dev, "Laptop placement: %s\n",
 		amd_pmf_get_laptop_placement(in->ev_info.device_state));
+	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
+		dev_dbg(dev->dev, "Custom BIOS input%d: %u\n", i + 1,
+			amd_pmf_get_ta_custom_bios_inputs_v2(in, i));
 	dev_dbg(dev->dev, "==== TA v2 inputs END ====\n");
 }
 
@@ -83,6 +88,19 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
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
@@ -102,6 +120,21 @@ static void amd_pmf_set_ta_custom_bios_input(struct ta_pmf_enact_table *in, int
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
@@ -117,6 +150,33 @@ static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, struct pmf_bios
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
@@ -411,6 +471,7 @@ void amd_pmf_populate_ta_inputs_v2(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 	in->ev_info.device_state = tmp.ev_info.device_state;
 
 	amd_pmf_get_smu_info_v2(dev, in);
+	amd_pmf_get_custom_bios_inputs_v2(dev, in);
 }
 
 void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
-- 
2.34.1

