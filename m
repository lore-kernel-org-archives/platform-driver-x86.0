Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDFF13A258
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Feb 2024 12:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709038574; cv=fail; b=sf5IerEKvnUiJPvY7t8F+ZTI8FIzMP1xrIKTxyRcQyE06D9f1NBE5nkZRkLM/0/TeniL+6oVqpik24UYYeR2arRdK0b/LxKr4u7CztdTD/DHVhUIduQLD+k9BRTs/yhGfoCKtCyxqTg6hexQMdFyljvyNtWoaJWf0vTwVXIr03c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709038574; c=relaxed/simple;
	bh=NwoxSWVVvJpwxTWaiBu2ROZpd29wKjLDAKmX/kfJL4k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IQG8WOwnLKnCiR/COcrvCcRltIwWCg1pvp6Sm3xyDw4tBRXhKamhUqcx31H7DRS573zRb2qw2ty+9TKsrUraheiJPNCmCsx0pn+SY4JWjqFz3W1ipnA0BMPR3WTThOp6BjtLAy5OMPm4oiyPpvEpM6DCaj9i2LvniidJlz8OStg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aJS4zCDx; arc=fail smtp.client-ip=40.107.94.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aJS4zCDx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lgn90MfWJo1zqWyTFpy0Hr7958baI3g3/nb6FO92QQ3IQDT3cQd7DPXNjFUsYldJIxLPblVJ8Fw03sdMCxpp/jS264gLQaXfrJsmkP1E9UTaqMESbvaQj5j9Lm0Dd5eA8OVvA/EAk3ukuJLXQErtuVApNvuK3ADnAcx3tK2OGZ4ktOu0qyhZD6k/X+Q21acwGno5ZbNMnrCxUbD5jBADLcyk+OFYAoRlXxm3XjGyJoeaunrA7aRgQ3ord27hSbzO+tHNs6U4JXdq+ITg5Y2Nt+Wsq1Xpl7BsJox4B4t/G6esLS/Q0RW+X7Mx/RXaqG9gVepAqm6eOGWuKwPPZwWVJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOavwb04dwK6piHXQ5JHRdCfTXIDiROEplOmg0P+cOM=;
 b=ktFhRB5RTmNLdQ0uXyVtk28U4ySpwJvXOm3+vSYxl5V6XWCkWGge/sRg1S7jAXhthypqZpSMPCx+hS6RfYNgBfdz5gkYQqeUPkJqMUUZ+mF4NTp+8iY0Gj6l+QWTjuK0JrRfPj55Sgvzj7oervtrPqzHVoJv4tKODx2OEe4PEPlGl5mDphlXQRzfUTL7/tg6oQSgS3GvpuTD2tVCMvMiNGPPvT1lmBk0ORt/n3gFOvPwjfUEqP3H8sdnIwovuMoVqaZB1JsQ0GmvapK9lTpp0MCWXi3SxaJLH8fmiR756kMIC99nq9T/gh5KhcghElylw0BUJj3O2a+YgMuPoc94bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOavwb04dwK6piHXQ5JHRdCfTXIDiROEplOmg0P+cOM=;
 b=aJS4zCDx0cJUY2NfpLtBI6SS5jEnHbmzI81RKg1GYgv/d9he/9B7luRb2pA0HitYhIWpnU66fcZBXTavDrfDrkmATwEXVAracemppU0CotOYGxugHs7xJ+QU0/gA16jGuWD2q2VvPlzAeyA3UiDjMQrrK4U+QR7EfVbxm6uq4C4=
Received: from CY8PR10CA0038.namprd10.prod.outlook.com (2603:10b6:930:4b::22)
 by SA1PR12MB8886.namprd12.prod.outlook.com (2603:10b6:806:375::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Tue, 27 Feb
 2024 12:56:08 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:930:4b:cafe::73) by CY8PR10CA0038.outlook.office365.com
 (2603:10b6:930:4b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.50 via Frontend
 Transport; Tue, 27 Feb 2024 12:56:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 27 Feb 2024 12:56:08 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 27 Feb
 2024 06:56:05 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 6/7] platform/x86/amd/pmf: Add support to get sps default APTS index values
Date: Tue, 27 Feb 2024 18:25:19 +0530
Message-ID: <20240227125520.3153140-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240227125520.3153140-1-Shyam-sundar.S-k@amd.com>
References: <20240227125520.3153140-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|SA1PR12MB8886:EE_
X-MS-Office365-Filtering-Correlation-Id: 4df26ddc-b8d4-46cc-0c8e-08dc3793778f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0S01AWdnF70KXQUXPzi8/mLTCwtDm58QSSDCEo88434/3BNaLhICtcxEH+V1tBAMYfI6ODnFHqnOuon2A63XoLDTR6eehl+HD7Z5vnF02iDuZnETgHRoJ5mbys85xnld4jhHXESko1TQFAwzgouZdA7ECI2/cIy6LMwvipHUL2p6sevNRProLUPQK8O8I0DB1yV2XvTMK7C4KSeY4dD7/osjQvt5XnVMlqLeUYv2JVop5TTf8xZmd/QHCX7Acjk0g9xwjMkOpZgzjn8B7jMhyFeIhiB2oaBvMzGyAVo0HR9Dhsewyrr9ogJdbjAp4xtn37tOIiLgIbtVOouLAK4qUEZJhy31UQBpZkQavBebPLlo7+pR0+L0wJaRIvEvbc+F/06MVM13RoFuWbvPAvThbGYCxN31QsVTt8rzG/a0cTaIfDtyQdYgCZ5M85U3IC6Jo7NCUmIhjoo8taUjX/5qmqXxQmpZE7dm26QnbbgZssxshH65710QS83cmCQslmrQcAZnY5co0XWv3rMjoDOFiHo9JRgaWQ5OdK54IPsRAA4moIqJ7BV+KzhV5FIHz5US59BlI6LTSGQUH92U9RtKT8zuj6k9ww7Q49XKpk7+ZSPSANEZN1DEj8Eso0wF2kuY5mdGNkHBVbpY26Z4l/o4ZdLgy8STgLlRbEcP1ru+9HNtaenOAPOURjRQ0nVTAgaoYc4OPDibEQm6qxECP7uPSahK8eNdGB9mAgaElshBwxEBkURFiPAP1unZULKE7T8h
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 12:56:08.4257
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df26ddc-b8d4-46cc-0c8e-08dc3793778f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8886

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
 drivers/platform/x86/amd/pmf/sps.c  | 52 +++++++++++++++++++-
 3 files changed, 149 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 28df45c058db..ea9b3871a374 100644
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
index b27e96aeac23..f99805827510 100644
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
@@ -658,6 +681,8 @@ int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx);
 int amd_pmf_set_sps_power_limits(struct amd_pmf_dev *pmf);
 int apmf_get_static_slider_granular_v2(struct amd_pmf_dev *dev,
 				       struct apmf_static_slider_granular_output_v2 *data);
+int apts_get_static_slider_granular_v2(struct amd_pmf_dev *pdev,
+				       struct amd_pmf_apts_granular_output *data, u32 apts_idx);
 
 /* Auto Mode Layer */
 int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_auto_mode *data);
diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
index dc4c7ccd4c43..067fabdaa503 100644
--- a/drivers/platform/x86/amd/pmf/sps.c
+++ b/drivers/platform/x86/amd/pmf/sps.c
@@ -12,6 +12,7 @@
 
 static struct amd_pmf_static_slider_granular_v2 config_store_v2;
 static struct amd_pmf_static_slider_granular config_store;
+static struct amd_pmf_apts_granular apts_config_store;
 
 #ifdef CONFIG_AMD_PMF_DEBUG
 static const char *slider_as_str(unsigned int state)
@@ -79,11 +80,56 @@ static void amd_pmf_dump_sps_defaults_v2(struct amd_pmf_static_slider_granular_v
 	pr_debug("dc_battery_saver: %u\n", data->sps_idx.dc_battery_saver);
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
+		pr_debug("index[%d]: table_version = %u\n", i, info->val[i].table_version);
+		pr_debug("index[%d]: fan_table_idx = %u\n", i, info->val[i].fan_table_idx);
+		pr_debug("index[%d]: pmf_ppt = %u\n", i, info->val[i].pmf_ppt);
+		pr_debug("index[%d]: ppt_pmf_apu_only = %u\n", i, info->val[i].ppt_pmf_apu_only);
+		pr_debug("index[%d]: stt_min_limit = %u\n", i, info->val[i].stt_min_limit);
+		pr_debug("index[%d]: stt_skin_temp_limit_apu = %u\n",
+			 i, info->val[i].stt_skin_temp_limit_apu);
+		pr_debug("index[%d]: stt_skin_temp_limit_hs2 = %u\n",
+			 i, info->val[i].stt_skin_temp_limit_hs2);
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
+	int i;
+
+	memset(&apts_config_store, 0, sizeof(apts_config_store));
+
+	for (i = 0; i < APTS_MAX_STATES; i++) {
+		apts_get_static_slider_granular_v2(pdev, &output, i);
+		apts_config_store.val[i].table_version = output.val.table_version;
+		apts_config_store.val[i].fan_table_idx = output.val.fan_table_idx;
+		apts_config_store.val[i].pmf_ppt = output.val.pmf_ppt;
+		apts_config_store.val[i].ppt_pmf_apu_only = output.val.ppt_pmf_apu_only;
+		apts_config_store.val[i].stt_min_limit = output.val.stt_min_limit;
+		apts_config_store.val[i].stt_skin_temp_limit_apu =
+							output.val.stt_skin_temp_limit_apu;
+		apts_config_store.val[i].stt_skin_temp_limit_hs2 =
+							output.val.stt_skin_temp_limit_hs2;
+	}
+
+	amd_pmf_dump_apts_sps_defaults(&apts_config_store);
+}
+
 static void amd_pmf_load_defaults_sps_v2(struct amd_pmf_dev *dev)
 {
 	struct apmf_static_slider_granular_output_v2 output;
@@ -293,10 +339,12 @@ int amd_pmf_init_sps(struct amd_pmf_dev *dev)
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

