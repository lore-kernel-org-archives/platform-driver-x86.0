Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9AD657AF
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Feb 2024 11:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709204744; cv=fail; b=C9dK7unCVCM0iK96hdwxW+Uj+gbf2aWjaoV8Cs1L6e0qIztSnJq5ahTrKrMqr6E+oalrQ/16Y+SU3E26dBVTYW3Cdw7hZWnxPZV5RdZQnE3AkOgd5nPqyQ9Yu++wy/+1H8ER9kvzKceadz/pr39+s8GWNYE65AH+SLgD6MZfYIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709204744; c=relaxed/simple;
	bh=26ACTk9NcfzxVDqlj6063mVDureJ/p+HqhHWaXggf0E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tk22gRhl+Gs71niov1gLrgnObmz2UnZcukM1xqHFs7Mgal+mLWp5YqGsuDkgIESFs0EYWi4NYRfiPtSgG6eB5pfnVW4KgZnUHhfpOG4mvx8rgYf+y9MxjiHe2DPLFIRoI7KpuouROgIayVhXaUvvSbZTKZI5IS2Zb+sx3YhkYMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=c+M+O6CI; arc=fail smtp.client-ip=40.107.243.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="c+M+O6CI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zt8s5pUK5m/Kt3PzW9sKRqap1SzchGBbSFtVlbjggJi7AUanWJH7FmG7DEO1wG7drvgUwwj2m0KAZg0Y+DV7afySkJBMh5aLSskFT31JAX/4//mb2AZIUHXbq5k/DD0fTU8A3+aIO3p4ebNblpxLZ7EKHHjdgoHIt6WtiVbCBc9wWtfnh0X6TL5qVGekZ4NNlwuwoRpnB0AaRj8U7id0zwFA/H1eu4ddyEdObjrPPn5DeBevSiQTN9u3HMFjJ8+9QHmqWrGAe/g+J9bG3BdUmfKjZybvJW1sYkGHt/Xvbc2Y5aBiOTeAEuEzwOJCtbfrOWvXZ4lWc/prxZdZ+ohD3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CilBI0bLq49Hqj4hmafNb1M8+EBJGyXdbPt36yiEqII=;
 b=G9VoFN7QFKtV3KH6ZzO5wwZEBD4PGk2YABnfT0Q0p9zBxRkJ1tgNzoy7TsKu1BvW28p7VnvGBBXveZ9lkUwDyZF109fMOdjAvT77r6FShAweMU9z1yXOckMF0nUe6oMT3EGSbQSpe8owbg+6124zA0QRNigusOpuoovsOBcAwRcKIp5myhJesfeoAuTq7LRHFp/Y5kJKAJYZ1q2DSevPfeTqsiJg9mhY5/00l9SAcisvCXSOpajtfW2LX4UR08db7XTG9XUB3af1Dk5heApWD6GYq7ABLFJwnSjRkVghKn7sbPs4nBS674cfTknu9zzGjCfP0lrFJe0rr8GSAuncDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CilBI0bLq49Hqj4hmafNb1M8+EBJGyXdbPt36yiEqII=;
 b=c+M+O6CIWR5W30cE8YQQ2aOWoFUiqmqIA1L8QApwUxYR+L3Wh/tuSjhkliqCX4KyK4BY8LK6xSP4v06zfrZIFDGczph0Y9TG81ZbNhfpclI9EtAR1ftAcEr2NIsrX2WIEOfC/nd2pCbma3gHL8clii+y/Nhh0tZPd+90mg5hvqM=
Received: from SA0PR11CA0031.namprd11.prod.outlook.com (2603:10b6:806:d0::6)
 by SN7PR12MB8026.namprd12.prod.outlook.com (2603:10b6:806:34b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Thu, 29 Feb
 2024 11:05:40 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com
 (2603:10b6:806:d0:cafe::90) by SA0PR11CA0031.outlook.office365.com
 (2603:10b6:806:d0::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39 via Frontend
 Transport; Thu, 29 Feb 2024 11:05:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 29 Feb 2024 11:05:40 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 29 Feb
 2024 05:00:05 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH RESEND v2 6/7] platform/x86/amd/pmf: Add support to get sps default APTS index values
Date: Thu, 29 Feb 2024 16:29:00 +0530
Message-ID: <20240229105901.455467-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240229105901.455467-1-Shyam-sundar.S-k@amd.com>
References: <20240229105901.455467-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|SN7PR12MB8026:EE_
X-MS-Office365-Filtering-Correlation-Id: 88392e7f-3878-4ca3-4abd-08dc39165de5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ljmFFqKGrZIRXQiJjqpc8CorbuCwBcvjHn3Hem4XEJF+hGnKstCjSsOURD0RgMo5DooCC6XyAUs9u4IkvAUiI3prPP+kDn8aMRo3ThrUlvuq/q6wyava9p06pCvybGwhzrxy6vP1uHOjZN/yW7lJWF0iNf6L5cZRw2dX/Mlu7uc+lE/Fgq3Rkz6qSXr3ISLHXmQ1c/9MEooZ1xUMJJsBCneNz+EH1JYjDugM4aky6dKjGPLIwfN8GuU4aN1Inqljrj8/D4a2XfUS1lJUvOP+NEOeSNiUncUIDyWDGmgPmZ7KEGfgkmedXMqebE1GfJddnwQbRRLo1gtdLuuK1qr4xQsIIm6H4/lIjHd3IXnasOM7GawqVxn6jPy8BWhU3hfS6Ce4AySqP1JlZPvJKyzf9JnNfdDwepsKAg+jnYOAcZqM15fKMoVMkm1yJNCvo3Rh9mgC+LbWdKIsFc/rvEK4PemHADuXUIIFfvJvBVRGMQaXVwrE7/SHD75B0Nch21e7sizAC40RMEnYOyygwj6QiYLzNtesw118iB/ePZRfaD8FpD8x6r809REEtckVYqMCaHWiXetCyoXkYFTktFzZW+lH+R1jHDI4UOrViSe+Q3TWBHXotoOr+JUP5V9iEjVZzkzGzhANfjVm93fI5bbOrstVtEid6cxTGN9rLUFlqmTi04b42gm9BaUhq6Tx+QMv2daX5nNiLRxQiZaJXwD+II3eXwUVPTp7qrH0HoOkfMPmvVx/M/4nEqNaRwITjStU
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 11:05:40.5420
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88392e7f-3878-4ca3-4abd-08dc39165de5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8026

During the driver probe, the default cache values for the static slider
would be obtained by evaluating the APTS method. Add support to use
these values as the thermal settings to be updated on the system based
on the changing platform-profiles.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c | 74 +++++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h  | 25 ++++++++++
 drivers/platform/x86/amd/pmf/sps.c  | 51 +++++++++++++++++++-
 3 files changed, 148 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 82dafe74fc6d..d0cf46e2fc8e 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -90,12 +90,86 @@ static int apmf_if_call_store_buffer(struct amd_pmf_dev *pdev, int fn, void *des
 	return err;
 }
 
+static union acpi_object *apts_if_call(struct amd_pmf_dev *pdev, u32 state_index)
+{
+	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
+	acpi_handle ahandle = ACPI_HANDLE(pdev->dev);
+	struct acpi_object_list apts_if_arg_list;
+	union acpi_object apts_if_args[3];
+	acpi_status status;
+
+	apts_if_arg_list.count = 3;
+	apts_if_arg_list.pointer = &apts_if_args[0];
+
+	apts_if_args[0].type = ACPI_TYPE_INTEGER;
+	apts_if_args[0].integer.value = 1;
+	apts_if_args[1].type = ACPI_TYPE_INTEGER;
+	apts_if_args[1].integer.value = state_index;
+	apts_if_args[2].type = ACPI_TYPE_INTEGER;
+	apts_if_args[2].integer.value = 0;
+
+	status = acpi_evaluate_object(ahandle, "APTS", &apts_if_arg_list, &buffer);
+	if (ACPI_FAILURE(status)) {
+		dev_err(pdev->dev, "APTS state_idx:%u call failed\n", state_index);
+		kfree(buffer.pointer);
+		return NULL;
+	}
+
+	return buffer.pointer;
+}
+
+static int apts_if_call_store_buffer(struct amd_pmf_dev *pdev,
+				     u32 index, void *data, size_t out_sz)
+{
+	union acpi_object *info;
+	size_t size;
+	int err = 0;
+
+	info = apts_if_call(pdev, index);
+	if (!info)
+		return -EIO;
+
+	if (info->type != ACPI_TYPE_BUFFER) {
+		dev_err(pdev->dev, "object is not a buffer\n");
+		err = -EINVAL;
+		goto out;
+	}
+
+	size = *(u16 *)info->buffer.pointer;
+	if (info->buffer.length < size) {
+		dev_err(pdev->dev, "buffer smaller than header size %u < %zu\n",
+			info->buffer.length, size);
+		err = -EINVAL;
+		goto out;
+	}
+
+	if (size < out_sz) {
+		dev_err(pdev->dev, "buffer too small %zu\n", size);
+		err = -EINVAL;
+		goto out;
+	}
+
+	memcpy(data, info->buffer.pointer, out_sz);
+out:
+	kfree(info);
+	return err;
+}
+
 int is_apmf_func_supported(struct amd_pmf_dev *pdev, unsigned long index)
 {
 	/* If bit-n is set, that indicates function n+1 is supported */
 	return !!(pdev->supported_func & BIT(index - 1));
 }
 
+int apts_get_static_slider_granular_v2(struct amd_pmf_dev *pdev,
+				       struct amd_pmf_apts_granular_output *data, u32 apts_idx)
+{
+	if (!is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
+		return -EINVAL;
+
+	return apts_if_call_store_buffer(pdev, apts_idx, data, sizeof(*data));
+}
+
 int apmf_get_static_slider_granular_v2(struct amd_pmf_dev *pdev,
 				       struct apmf_static_slider_granular_output_v2 *data)
 {
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index e1bcd9e80ab9..2d0601897f4a 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -87,6 +87,29 @@
 #define PMF_IF_V1		1
 #define PMF_IF_V2		2
 
+#define APTS_MAX_STATES		16
+
+/* APTS PMF BIOS Interface */
+struct amd_pmf_apts_output {
+	u16 table_version;
+	u32 fan_table_idx;
+	u32 pmf_ppt;
+	u32 ppt_pmf_apu_only;
+	u32 stt_min_limit;
+	u8 stt_skin_temp_limit_apu;
+	u8 stt_skin_temp_limit_hs2;
+} __packed;
+
+struct amd_pmf_apts_granular_output {
+	u16 size;
+	struct amd_pmf_apts_output val;
+} __packed;
+
+struct amd_pmf_apts_granular {
+	u16 size;
+	struct amd_pmf_apts_output val[APTS_MAX_STATES];
+};
+
 struct sbios_hb_event_v2 {
 	u16 size;
 	u8 load;
@@ -659,6 +682,8 @@ int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx);
 int amd_pmf_set_sps_power_limits(struct amd_pmf_dev *pmf);
 int apmf_get_static_slider_granular_v2(struct amd_pmf_dev *dev,
 				       struct apmf_static_slider_granular_output_v2 *data);
+int apts_get_static_slider_granular_v2(struct amd_pmf_dev *pdev,
+				       struct amd_pmf_apts_granular_output *data, u32 apts_idx);
 
 /* Auto Mode Layer */
 int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_auto_mode *data);
diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
index 0cf38bdae7a4..96bd2140302c 100644
--- a/drivers/platform/x86/amd/pmf/sps.c
+++ b/drivers/platform/x86/amd/pmf/sps.c
@@ -12,6 +12,7 @@
 
 static struct amd_pmf_static_slider_granular_v2 config_store_v2;
 static struct amd_pmf_static_slider_granular config_store;
+static struct amd_pmf_apts_granular apts_config_store;
 
 #ifdef CONFIG_AMD_PMF_DEBUG
 static const char *slider_v2_as_str(unsigned int state)
@@ -95,11 +96,55 @@ static void amd_pmf_dump_sps_defaults_v2(struct amd_pmf_static_slider_granular_v
 
 	pr_debug("Static Slider APTS state index data - END\n");
 }
+
+static void amd_pmf_dump_apts_sps_defaults(struct amd_pmf_apts_granular *info)
+{
+	int i;
+
+	pr_debug("Static Slider APTS index default values data - BEGIN");
+
+	for (i = 0; i < APTS_MAX_STATES; i++) {
+		pr_debug("Table Version[%d] = %u\n", i, info->val[i].table_version);
+		pr_debug("Fan Index[%d] = %u\n", i, info->val[i].fan_table_idx);
+		pr_debug("PPT[%d] = %u\n", i, info->val[i].pmf_ppt);
+		pr_debug("PPT APU[%d] = %u\n", i, info->val[i].ppt_pmf_apu_only);
+		pr_debug("STT Min[%d] = %u\n", i, info->val[i].stt_min_limit);
+		pr_debug("STT APU[%d] = %u\n", i, info->val[i].stt_skin_temp_limit_apu);
+		pr_debug("STT HS2[%d] = %u\n", i, info->val[i].stt_skin_temp_limit_hs2);
+	}
+
+	pr_debug("Static Slider APTS index default values data - END");
+}
 #else
 static void amd_pmf_dump_sps_defaults(struct amd_pmf_static_slider_granular *data) {}
 static void amd_pmf_dump_sps_defaults_v2(struct amd_pmf_static_slider_granular_v2 *data) {}
+static void amd_pmf_dump_apts_sps_defaults(struct amd_pmf_apts_granular *info) {}
 #endif
 
+static void amd_pmf_load_apts_defaults_sps_v2(struct amd_pmf_dev *pdev)
+{
+	struct amd_pmf_apts_granular_output output;
+	struct amd_pmf_apts_output *ps;
+	int i;
+
+	memset(&apts_config_store, 0, sizeof(apts_config_store));
+
+	ps = apts_config_store.val;
+
+	for (i = 0; i < APTS_MAX_STATES; i++) {
+		apts_get_static_slider_granular_v2(pdev, &output, i);
+		ps[i].table_version = output.val.table_version;
+		ps[i].fan_table_idx = output.val.fan_table_idx;
+		ps[i].pmf_ppt = output.val.pmf_ppt;
+		ps[i].ppt_pmf_apu_only = output.val.ppt_pmf_apu_only;
+		ps[i].stt_min_limit = output.val.stt_min_limit;
+		ps[i].stt_skin_temp_limit_apu = output.val.stt_skin_temp_limit_apu;
+		ps[i].stt_skin_temp_limit_hs2 = output.val.stt_skin_temp_limit_hs2;
+	}
+
+	amd_pmf_dump_apts_sps_defaults(&apts_config_store);
+}
+
 static void amd_pmf_load_defaults_sps_v2(struct amd_pmf_dev *dev)
 {
 	struct apmf_static_slider_granular_output_v2 output;
@@ -307,10 +352,12 @@ int amd_pmf_init_sps(struct amd_pmf_dev *dev)
 	dev->current_profile = PLATFORM_PROFILE_BALANCED;
 
 	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
-		if (dev->pmf_if_version == PMF_IF_V2)
+		if (dev->pmf_if_version == PMF_IF_V2) {
 			amd_pmf_load_defaults_sps_v2(dev);
-		else
+			amd_pmf_load_apts_defaults_sps_v2(dev);
+		} else {
 			amd_pmf_load_defaults_sps(dev);
+		}
 
 		/* update SPS balanced power mode thermals */
 		amd_pmf_set_sps_power_limits(dev);
-- 
2.25.1

