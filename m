Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2057.outbound.protection.outlook.com [40.107.102.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AE07F7FC
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 11:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709725495; cv=fail; b=YP654zy/n/z5/feIPUtrvoAmWsl5cXsyqwBuhRvO/YO5rFVTG/jN6NkRQ30Zq5mfZiTe2hkL2cuotS42e8EVAj9dnz8IvFNsSMo6mZFvAWRjww+qLKli1/3hWtRdh+1sR2a6X/felfSGSXikOzIUNfdGPm+4SfyY8YAXzuA5ZiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709725495; c=relaxed/simple;
	bh=gZ9cnY6mocY3R1Lt4kbjkvz3N+58zRCENipgTaWbFxI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QARYBtjxxEzA+OoL/Fj5N07jVqCgYktS7EYP88oErt9WmGlXb/Ad82zqjYLJE0TyZS4XROzYz5ohJurT3DfFMHFmWVM4RpjO101fUOKV5XDj3kFa4bFwPdz+IK25/lsP9RWRJIr9u606eXkVGrVs2KMEo7N65hEPYFbnLPfA2gU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jIeol4VE; arc=fail smtp.client-ip=40.107.102.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jIeol4VE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IA4X8W0iAH7HLubsor8br6XFb5DKPL+R4d0yYKhgDkct3NmzSm5ZamwW3XQ3wLp2HCKukhqAs6OyrC2LvLf4LAvmPW7+FVTM8uUV8UhfPkFzl5PDaE/cVxs3tgxr2inZi4LuZF/Kj/+LAjMUPosHi/jI553BcY60bzahAOIMA+tRjXCp4seAHWqddVXslyG9iL/ByNXqn3AmCbSVJ8VRWz6GLZzsPmdIlx51VnlVu4UgPKG7Q7BXcSfQWQ8QLJi+T5cbMWrVXPNo/FDpvqOK+f3tikSyhKIqVHXnROAZZLelfOXeAr8ifCVVdfX7YoTLEaof/+ORGusmAORo/Ja4KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Glv+WKqnyE4YULH1UJKIl0tgwUSxJCJxRF084CNQaJU=;
 b=in//FzpWbWK+l3YwjaPZmiRZNIu3KOJmS6fhIb6eVrcfIynbhhd8lUHIZR1/RaYI89Hc3CmomUrXGU70KvLnilt2L9qxANj8dKj1R8UbX3hHSoTqNRvw62/1G81situMWO8S0x/9aM6/rUt4Lo/y8YohCvi3UfptkafsAj2ae1a0BMlt0YPJ7x7WtuMaYxCxxEIVojHXaVjIkK3lvld7fZmrTt2dUeyeqkiyUds+ajx6oEdoswNpHLsI1vlnfRkUzbeVPpUfFmFAcXhRcXtKNDXRAySSF+XY+rzZK6SK8bOBSJYAS79Oqe3jtC1F5IElCgsdXiyNwMxLZLHWdRlIhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Glv+WKqnyE4YULH1UJKIl0tgwUSxJCJxRF084CNQaJU=;
 b=jIeol4VEFHHkr4YG8jiQG5VNGbVOl5lNX9b1+nFVNGOuTbCNokn5WP4Qr2vQXH2tGc0ixUtVDRdFx+Vfh7K2LV3cD34ITi1lnAAMwtnrfqSDRoVF6Yk8MZW6xd9QrmYHwuyzuW3EfueSW+UFxeVAYR71sD4yqy6Hrunff/hz42M=
Received: from SJ0PR13CA0232.namprd13.prod.outlook.com (2603:10b6:a03:2c1::27)
 by DS0PR12MB8561.namprd12.prod.outlook.com (2603:10b6:8:166::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 11:44:51 +0000
Received: from MWH0EPF000989E6.namprd02.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::e9) by SJ0PR13CA0232.outlook.office365.com
 (2603:10b6:a03:2c1::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23 via Frontend
 Transport; Wed, 6 Mar 2024 11:44:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E6.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Wed, 6 Mar 2024 11:44:51 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 6 Mar
 2024 05:44:48 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 6/7] platform/x86/amd/pmf: Add support to get sps default APTS index values
Date: Wed, 6 Mar 2024 17:14:14 +0530
Message-ID: <20240306114415.3267603-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240306114415.3267603-1-Shyam-sundar.S-k@amd.com>
References: <20240306114415.3267603-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E6:EE_|DS0PR12MB8561:EE_
X-MS-Office365-Filtering-Correlation-Id: ad005ab0-750e-4188-5a4c-08dc3dd2d566
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AnHu3vm2YPUx8UvzGxpLB9blFMPsJ3f1A8kx+/ie9/YBaIwCN+n6y/0Jm8+HReGuksZflod5OD7Lw5Q5uDIeZ0MwnpTKaLUHUtkzu01DFLW2fdTcm7WxlsSiZ5tcbimlW+ccNMVLbwtA45ve3BIfK+UUarvcQlfS0BeNtLl8umf78wGo2uV9Uh5iNp0rksMj2IoYqxPLxz2cF8a15GnFdkR68CQQqBrbNP/SugGDZwzFt+wU03teEXtiKCK16Je5w68Xn7LhrQWz1+x/0mfbhjkUSajg1JAP40emJb4oWEsI/5hB/AJcP4xWHfNeIoCiEAUEoIfhjC0XaJufAPT00gsuh9DdULLuX8U+zI7XBLHvH2izxrt4yFJSFc5Ya5b4cnxox6XajyiD0IEDCf/spx7R+uSndzKRJ5s1bC1G20fJswuovd1zyB6tNMlL8dcEXklyUSPYojRaRmGeyEPeRvT/R7yE3bMgtVn+mnDNiI/oL0pKitrgJnMUjwzX8MBAmL9vcN4dmJEany/tM59+4vm/gkVO3H5GXQ3ODSFLakwTMPiWw0YmQHfiTZoxcMg28uzv/uLvN785AuDdiW691LDCmPBvpn1AMACdyvBZn1TZOh93xHFURjxtAySb0RE87+C5/TcOpsrv/OXTs+/jCacP/F/E3IiWGf2sEVDUSo9skc5jxd8sgd0wDZ/vNB7N49Z5U32lJuhW3kGXRHjRlJjExEjm/Fi0n5e65aURH/yIiCQmfmqj+eUAPXcY1hEd
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 11:44:51.0730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad005ab0-750e-4188-5a4c-08dc3dd2d566
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8561

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
index 44ac22098d79..10d5f8cef27e 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -91,6 +91,29 @@ struct cookie_header {
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
@@ -668,6 +691,8 @@ int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx);
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

