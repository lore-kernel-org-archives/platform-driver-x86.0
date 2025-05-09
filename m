Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524C426C39F
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 May 2025 07:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746775686; cv=fail; b=cWLtAHj1t47JrU1E/W0Jvi1rYOj/QhLWwOa3lf7jMYa3eFQTBv7s1W3GdqcP1cdKzFSNDFCAANB2/kso+WXwcscKGNI7Nq5lZYoyN45XAdv9inZMKwM/c1cokBxQPyKFf+Zh/36Bz3d0NYTezMFJq0qnSQP+Oa0VjiNQKIO2vcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746775686; c=relaxed/simple;
	bh=GGABt8+rQ2Y5AIn53qGBwuNseEdcJl3LMoOq0Y4JojQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZFp69yc7tiv5CKk9XVSLe9UMDL5jqPxu5eLRCDSTVTYKL/u6uAeWykQ/ZumIqpL1tO1/K8gRg6S2PQonQr4SFgoKmals7Fv7ot1k31J8hHThgN52IgohOZtIGwTkhIE8hn+CMflKtfUK0nB1zmKSKT8MZ0t7LOohEXC3+P3+QBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZEbKR6El; arc=fail smtp.client-ip=40.107.220.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZEbKR6El"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B+WE5+yh6jppAwQb5oet8YvwX9O/Cp4lXMlw3IZaHw0zwZxTR2w46JVngTtg93Z6apyrbzZ+Q53ABGnVShoaS3sKERj7tm4itAp+C+8O3lJ1ouY8/OaUTkwZ+XQXenlwS9dDupd+6yt8s7jPv2pDco55lERe+ahpkXRqQN3QwYSJOODXU2K+Jm8Xd9AJ4t79CP8nS0hvepyCA3ZAbbbsGYoYAq8rEwOc0cGlFg+FQuMxcAVd1ADgySH76rCxHJvg5GJ4G+qz/Is95WJb6eZkxxoCAVDpCksEJDA5Clxc+gGjgclTfctv7XJ0jExC6EsDfQno/LqQSrBRlB7CSQ8ZPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ged4oQDGJ9+bmyld3nlVWCZi2dHKvZx5HtC7jK9cT3I=;
 b=FUP+BV3Wi1FPpOC7fHkFXA9rVyIaqDjXlYz0QjFVamgyVL7PXefEs5a/JMbcow3Jko8Sv7EWHx50kJV+l9IqSzYbLTKP/uy+Dcsi27xjiE7yPrq9QPDfjFJd5bfPRk+HrUGe0kKmU7+Ru5uydcdRE78UFHhsksw8H4a0qnj4OdeOsSqyObjvdVjH9ucLJCY0u+TMjzPTB+5lvy3uC43VoGJwybR2WPDa2h3FwZqoKCnJT9/wBAIMSUTVzVtyHdgYfUrShaiGi+w1a+ZkYybTPUEElrKJOCP0ZeVdJD3HsHcCYtA5PRctFmYEKPNJbeerzNnAx2djV1UaKfKIT3Hw9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ged4oQDGJ9+bmyld3nlVWCZi2dHKvZx5HtC7jK9cT3I=;
 b=ZEbKR6ElFE0wr1m7ec4mdQW39xt5WLgJrtqxLROK9KLQpDFCoslie8Zx/uula0885DZKo+rb5BsAlSpncfq/G/hDgiBY6No2HisHl8KNtx/rdSVGonHvCtk6yhUShxOdoZQjyefJgurPQ6RYVfm/bCI3d6N+HGndVeyThsSLmkw=
Received: from CH2PR08CA0012.namprd08.prod.outlook.com (2603:10b6:610:5a::22)
 by DM4PR12MB5939.namprd12.prod.outlook.com (2603:10b6:8:6a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 07:27:54 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::a4) by CH2PR08CA0012.outlook.office365.com
 (2603:10b6:610:5a::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.27 via Frontend Transport; Fri,
 9 May 2025 07:27:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 07:27:54 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 02:27:51 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH 06/10] platform/x86/amd/pmf: Add custom BIOS input support for AMD_CPU_ID_PS
Date: Fri, 9 May 2025 12:56:50 +0530
Message-ID: <20250509072654.713629-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509072654.713629-1-Shyam-sundar.S-k@amd.com>
References: <20250509072654.713629-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|DM4PR12MB5939:EE_
X-MS-Office365-Filtering-Correlation-Id: d515ff28-da59-4602-63da-08dd8ecb0393
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jb60turzb3/bRR0WIwT+XgCZbC8ax+HwUTut/uDxZ2U9vMndsUImp7AuAaYC?=
 =?us-ascii?Q?+MMsWzaV91CcqalMDqRu5YklwJbObR0XOtt9OJDU2qU7DPP1HF5xUpJ1rj7N?=
 =?us-ascii?Q?CCBc0TWn16LAwlavs6D7MfBXRyuiWLj3WyfpvS80ySSc9izdVwsD0CQ6Vj7z?=
 =?us-ascii?Q?KoO17/gFBtB8FYUXE3uzxmVii1ng7+NEXhinTLnqNr4oteoJduRR8L28PLUv?=
 =?us-ascii?Q?DWGK77nm/Kx+XXdEGSOJdN6n+ZnLSdZH4MIbhDmgmvIndsRwIPnDG+e5IY2h?=
 =?us-ascii?Q?Uf5otNfmavLilc+mntgZQVBsph08PDeKFrrYsL4GUouuTcaAli7YXjso01VM?=
 =?us-ascii?Q?ybvVkpqYsEQ/DoDi72tfy5vN+dXVNUwM08nsOjVqAt8wFnm5bb3tiU4UwxT4?=
 =?us-ascii?Q?qbmN62gyug9kULdQjirkYZe8SpKX7TzJmcr32QZV4LWkHed5LYmMifWtfO8j?=
 =?us-ascii?Q?qzSPj2NfRl7Qkyp8KfFbgIrMF1yrceJ8ujISAHkAfweduqHqesIv/8QDOr2L?=
 =?us-ascii?Q?J2j6NW0JsS+t3mn7L+RjF8eT527fDVYzuo/9lId/Lrcpd3axL2bde/EjQp3V?=
 =?us-ascii?Q?36b8kpLI/2kCV0wapMAB0pomVOZSOU/Eo194dzEcYEbAsVYeYM2bgutuFPu9?=
 =?us-ascii?Q?Z1pgWr0vU+je0odyWLrWoXiOTdnzgysHGyGQ47gZ37bHv6DnmjYBYGVF/knu?=
 =?us-ascii?Q?9bdABvyjwgHTdSXV5L4GRJsZZX4acLAUxmZn7yG7Ar4GlM1b6BOisVE7b+pE?=
 =?us-ascii?Q?E9Wlh5MLMwAisxgULewDT6eulLRlFYN7lw+La3L9Kf4Hu6UN818rHQcnM5K7?=
 =?us-ascii?Q?G1suieZbFTh+50KKABYO/3pk6AV9SD0y9bDR9Rut+sPftUojegmB+3t/Whic?=
 =?us-ascii?Q?CjRtnSe3IwOx97XaJYODzyHGvYXAQuwHTFWSe0CRGnC9CaHUGNrHvtK53RRd?=
 =?us-ascii?Q?DIKeZRXpsAIMmxDjDSWe2iUrP2Xuq/LCo7k0atO9cT1GPcGB/YoIX2Svoosd?=
 =?us-ascii?Q?q3EGnMCuCq5riztjOAxYiUKoBXg/UWCiWUimxC1db93dsL/gSGzy1vw4HIsB?=
 =?us-ascii?Q?8iVfhdnEV/MaxM4vFZqdtFX6hs0QJUr42jsxDES+Jm5IS3nnwwAWCTg+pvFj?=
 =?us-ascii?Q?zZX6SSCg2bDNcD0eOtp/sM4lKxXpoCxKr5AVMKlzQbLQ1q6jNmuMO+WUa6dE?=
 =?us-ascii?Q?vjzdGACg1xeFdReJQMorGYVFWjgkbN6/NgG/G09c1Y5IyLb6YIJILavPNu5V?=
 =?us-ascii?Q?iAQH5Rst5o5q2eUAOvdOQ+QzYZMBBU+AmxGLU6xWZ7yA1MxfQgYQSH0+mcE9?=
 =?us-ascii?Q?cmLvjkWhKenxOX1BdvOJlDmLCxy+vHBM5r8AJoOfH6sdkMhgOJjVfgRx6XH/?=
 =?us-ascii?Q?4kcJ3j7ZwmeO0kLTlwMhMDgO2wZsZHMT63EHtBc/jGTlZTHBWBlJgC+2+joy?=
 =?us-ascii?Q?7vuSAMTixItXoc0lTNuYIb9qxcO1tKAxsMkn1Mt+hk+F7JuEgXJCgFEFnGDv?=
 =?us-ascii?Q?BoWkzKjZ/+R6yWFw1h6Yl+QveiKD9fcMkHXM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 07:27:54.5441
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d515ff28-da59-4602-63da-08dd8ecb0393
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5939

The PMF ACPI Specification (APMF) has been revised to version 1.3 to allow
for additional custom BIOS inputs, enabling OEMs to have more precise
thermal management of the system. This update includes adding support to
the driver using the new data structure received from the BIOS through the
existing APMF interfaces.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c | 33 +++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h  | 35 +++++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/spc.c  | 21 ++++++++++++++++-
 3 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index ab63582c9d0b..1521988c1002 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -320,6 +320,11 @@ int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v
 	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS, req, sizeof(*req));
 }
 
+int apmf_get_sbios_requests_v1(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v1 *req)
+{
+	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS, req, sizeof(*req));
+}
+
 int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req)
 {
 	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS,
@@ -338,6 +343,18 @@ static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
 		dev_err(pmf_dev->dev, "Failed to get v2 SBIOS requests: %d\n", ret);
 }
 
+static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
+{
+	struct amd_pmf_dev *pmf_dev = data;
+	int ret;
+
+	guard(mutex)(&pmf_dev->cb_mutex);
+
+	ret = apmf_get_sbios_requests_v1(pmf_dev, &pmf_dev->req1);
+	if (ret)
+		dev_err(pmf_dev->dev, "Failed to get v1 SBIOS requests: %d\n", ret);
+}
+
 static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
 {
 	struct amd_pmf_dev *pmf_dev = data;
@@ -447,6 +464,17 @@ int apmf_install_handler(struct amd_pmf_dev *pmf_dev)
 		apmf_event_handler(ahandle, 0, pmf_dev);
 	}
 
+	if (pmf_dev->smart_pc_enabled && pmf_dev->pmf_if_version == PMF_IF_V1 &&
+	    is_apmf_bios_input_notifications_supported(pmf_dev)) {
+		status = acpi_install_notify_handler(ahandle, ACPI_ALL_NOTIFY,
+						     apmf_event_handler_v1, pmf_dev);
+		if (ACPI_FAILURE(status)) {
+			dev_err(pmf_dev->dev,
+				"failed to install notify handler v1 for custom BIOS inputs\n");
+			return -ENODEV;
+		}
+	}
+
 	if (pmf_dev->smart_pc_enabled && pmf_dev->pmf_if_version == PMF_IF_V2) {
 		status = acpi_install_notify_handler(ahandle, ACPI_ALL_NOTIFY,
 						     apmf_event_handler_v2, pmf_dev);
@@ -509,6 +537,11 @@ void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
 
 	if (pmf_dev->smart_pc_enabled && pmf_dev->pmf_if_version == PMF_IF_V2)
 		acpi_remove_notify_handler(ahandle, ACPI_ALL_NOTIFY, apmf_event_handler_v2);
+
+	if (pmf_dev->smart_pc_enabled && pmf_dev->pmf_if_version == PMF_IF_V1 &&
+	    is_apmf_bios_input_notifications_supported(pmf_dev)) {
+		acpi_remove_notify_handler(ahandle, ACPI_ALL_NOTIFY, apmf_event_handler_v1);
+	}
 }
 
 int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 2deae43aca63..de095b434d32 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -119,6 +119,8 @@ struct cookie_header {
 
 #define APTS_MAX_STATES		16
 
+#define CUSTOM_BIOS_INPUT_MAX  10
+
 /* APTS PMF BIOS Interface */
 struct amd_pmf_apts_output {
 	u16 table_version;
@@ -186,6 +188,24 @@ struct apmf_sbios_req {
 	u8 skin_temp_hs2;
 } __packed;
 
+/* As per APMF spec 1.3 */
+struct apmf_sbios_req_v1 {
+	u16 size;
+	u32 pending_req;
+	u8 rsvd;
+	u8 cql_event;
+	u8 amt_event;
+	u32 fppt;
+	u32 sppt;
+	u32 sppt_apu_only;
+	u32 spl;
+	u32 stt_min_limit;
+	u8 skin_temp_apu;
+	u8 skin_temp_hs2;
+	u8 enable_cnqf;
+	u32 custom_policy[10];
+} __packed;
+
 struct apmf_sbios_req_v2 {
 	u16 size;
 	u32 pending_req;
@@ -378,6 +398,7 @@ struct amd_pmf_dev {
 	struct apmf_sbios_req_v2 req; /* To get custom bios pending request */
 	struct mutex cb_mutex;
 	u32 notifications;
+	struct apmf_sbios_req_v1 req1;
 };
 
 struct apmf_sps_prop_granular_v2 {
@@ -642,6 +663,19 @@ static const struct amd_pmf_pb_bitmap custom_bios_inputs[] __used = {
 	{"NOTIFY_CUSTOM_BIOS_INPUT10",    BIT(14)},
 };
 
+static const struct amd_pmf_pb_bitmap custom_bios_inputs_v1[] __used = {
+	{"NOTIFY_CUSTOM_BIOS_INPUT1",     BIT(7)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT2",     BIT(8)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT3",     BIT(9)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT4",     BIT(10)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT5",     BIT(11)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT6",     BIT(12)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT7",     BIT(13)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT8",     BIT(14)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT9",     BIT(15)},
+	{"NOTIFY_CUSTOM_BIOS_INPUT10",    BIT(16)},
+};
+
 enum platform_type {
 	PTYPE_UNKNOWN = 0,
 	LID_CLOSE,
@@ -828,6 +862,7 @@ void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev);
 void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev);
 void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms);
 int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req);
+int apmf_get_sbios_requests_v1(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v1 *req);
 int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v2 *req);
 
 void amd_pmf_update_2_cql(struct amd_pmf_dev *dev, bool is_cql_event);
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index dfb8036671a0..be6ffb823efc 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -106,6 +106,18 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in) {}
 #endif
 
+static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, u32 *bios_inputs[],
+				       const struct amd_pmf_pb_bitmap *inputs, u32 pending_req,
+				       const u32 *custom_policy)
+{
+	int i;
+
+	for (i = 0; i < CUSTOM_BIOS_INPUT_MAX; i++) {
+		if (pending_req & inputs[i].bit_mask)
+			*bios_inputs[i] = custom_policy[i];
+	}
+}
+
 static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
 					   struct ta_pmf_enact_table *in)
 {
@@ -115,7 +127,7 @@ static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
 		&in->ev_info.bios_input9, &in->ev_info.bios_input10};
 	int i;
 
-	if (!pdev->req.pending_req)
+	if (!(pdev->req.pending_req || pdev->req1.pending_req))
 		return;
 
 	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++) {
@@ -123,8 +135,15 @@ static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
 			*bios_inputs[i] = pdev->req.custom_policy[i];
 	}
 
+	if (pdev->smart_pc_enabled && pdev->pmf_if_version == PMF_IF_V1 &&
+	    is_apmf_bios_input_notifications_supported(pdev)) {
+		amd_pmf_update_bios_inputs(pdev, bios_inputs, custom_bios_inputs_v1,
+					   pdev->req1.pending_req,  pdev->req1.custom_policy);
+	}
+
 	/* Clear pending requests after handling */
 	memset(&pdev->req, 0, sizeof(pdev->req));
+	memset(&pdev->req1, 0, sizeof(pdev->req1));
 }
 
 static void amd_pmf_get_c0_residency(u16 *core_res, size_t size, struct ta_pmf_enact_table *in)
-- 
2.34.1

