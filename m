Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3E5244685
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Sep 2025 11:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756724544; cv=fail; b=WDg9Cmm9TWfxr1y3SNvrazeaWv15k1v90lGJtgkoYug6iZfSesgWYF4OvmPifHHeri6OVqAcOSTMe7TEcloO5R2YBQOxssifsL2JmgliaH2avtV4P7GIjG/Fx2Cj6d8egdME6fZL84r0MSbflWem5umSEsc+3x4vgy+95diDa+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756724544; c=relaxed/simple;
	bh=+wjKfHVG6aUYgjJsX6OwmVSagDe9Lu4gnLoh3iHwRXo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tE9R17Mf+usZb1AX/rBb1MOriuCIbD+k76g9IHwXhsG/vUfoFFNWtxXsSDbLWi9xoLNSc78MinFxqMXgkkE1bZk/jaUojIxPtI8rcn4KTtclZg/lDxPMP3VGiDSxuQHv/N1jb/rzLmPslMIRZx1jSooYQNQme0Vh05Tkne3V3q0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CQUZHO3/; arc=fail smtp.client-ip=40.107.94.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CQUZHO3/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HcpYErp3Svq+tnHIUudxO3sVrvbPvuZ+3sDPfCGykOhpZNiLZG4U18vGapu9kN0VCE+Yyi8mDd8ntICFzOb5Pk03365q5KO8Y0A4A184iBa5B5MAjjSH1op8XOKoN5bqyfZa5+epnD10y6iBFbD4YWpe4dDS1r+jb9IfwovYzLOoUF0XOPeKHRDmwQykUxPUvRfqb0iYwC22YeBMftthRIwTYIKWowiNp4uS3CCKxbRp1lP5sPUWsZ4jtKZO7j8JTN26FjbTQXGv1RNeke4wzzekUhTHSgfGfKTXTol4fzjAkoDlpJFo47cu9nqHzyLd7KLEWZ+l72Y4clXDBvQj4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C7VOuKk7oq4ixWs6hEvv7sFcjlOvYdRP8A7UingKiVA=;
 b=qrsUND5rEzF/dWKtPFT8TkTdIHONPIx540eauqS9g1buC43RV5O73RNkJDOLcGdrhhpCytuBoNmkkBRubMyr0jGJzIhSLhFfeWBt757J4eHOzbtWx2edGWliTV4aAn3q4+inKaiQdXArINi+1Dzmhk1CRr3x2IYfZbcBnx5j302HuVBjLLDBqZr1VwXgYrVXIsTfkhU8J1L7tG33Jje5N6t3mbDhcsaskvYjwavwqtisX9DXPaVY+GsWpr+zRehpafxnOR4KiZH/QRVXCb5OaZj4pwD21/El5vx3bO0ZXPL186/5oT5AQ63smswsn3OPgYE7zPoYbZ9Gpkl+HsHoyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7VOuKk7oq4ixWs6hEvv7sFcjlOvYdRP8A7UingKiVA=;
 b=CQUZHO3/DdaWTpAlgYt04d242fQbHNVbu99gqzg3IxmOs6XbX9IVkA+1L95rZlUByjab99933/ubJ01PerEqbqN/ziFlz3o3Mt139JPdu7np4L/ifwX2bCu1ySK6MZ6urqK/zSA1KzWqV6++WOVvnrdexUUgbPZ101dvTrb71D8=
Received: from MN2PR05CA0062.namprd05.prod.outlook.com (2603:10b6:208:236::31)
 by SA1PR12MB5615.namprd12.prod.outlook.com (2603:10b6:806:229::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.25; Mon, 1 Sep
 2025 11:02:17 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:208:236:cafe::c4) by MN2PR05CA0062.outlook.office365.com
 (2603:10b6:208:236::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.15 via Frontend Transport; Mon,
 1 Sep 2025 11:02:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Mon, 1 Sep 2025 11:02:17 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 06:02:16 -0500
Received: from airavat.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Mon, 1 Sep
 2025 04:02:14 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, Yijun Shen <Yijun.Shen@Dell.com>
Subject: [PATCH v5 RESEND 5/9] platform/x86/amd/pmf: Add helper to verify BIOS input notifications are enable/disable
Date: Mon, 1 Sep 2025 16:31:36 +0530
Message-ID: <20250901110140.2519072-6-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250901110140.2519072-1-Shyam-sundar.S-k@amd.com>
References: <20250901110140.2519072-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|SA1PR12MB5615:EE_
X-MS-Office365-Filtering-Correlation-Id: ca66c8c1-b193-4cce-b079-08dde94703cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jt4bi9Pq0ZZ7xmoD/6Wv139WS4RFwGqZw7ULXbs1SRNCnwVKGkEnhL4j34bK?=
 =?us-ascii?Q?p1mNg9i5QX2RpA4/+BA7DXnJDPxdd1o6EYmMIfxci65gC3C7O12SI6/k1cBz?=
 =?us-ascii?Q?V18Fz9s7GITnYu8NYYQAdvsQMBp3pgN4pQYw13/ByRu1VQ4BjnFfa1KQDLFh?=
 =?us-ascii?Q?7OMama2i3h3jxcHwYs/aRC/l9vadqFQeEhNbAr0SULipFoSoV5cIQP/IHCDu?=
 =?us-ascii?Q?sBx8oujZ2BRTf6ZA0pISMim0Z+B+VtJvJS9qGRQesaIq58W3LCn/AQzPtMpy?=
 =?us-ascii?Q?2Pm3/rlx2JZ01gLQjK7VfEGRcC+h6JfbJsxUB8ANBogF+6hm55kIOg+3I7rS?=
 =?us-ascii?Q?Y380Rc0QifyQPdSoMmhQ8OSHLSkA5LnOAagCvVTMtGzPPSxAWV0fpCdlZP/S?=
 =?us-ascii?Q?nm27bGvC71FZoavadKjx/CEnc/Wuji7dqbYJJ1z392NW/yUfZSwF7HB5s26n?=
 =?us-ascii?Q?LsJoealasuGS1ZudlSV0fvAgBxsyih91THMSR3VwM0rh2F1TjLaku8w77IEI?=
 =?us-ascii?Q?f62JXIQ+n34kRUR/ZAzibnHrvWGOpxjCMboj9ZLTowxA6D7D92KA9e69x49y?=
 =?us-ascii?Q?avXyKezVb0uL2mFFIXHYAJjFizmAy2aRMLIILvrtoEPY6eMLtbwyyJkl92fB?=
 =?us-ascii?Q?Sbsri7ozU35FjAFQJOrl15LMxWxlABMA0AapxW05ltNDjJ3Kty4JyVP4kgFZ?=
 =?us-ascii?Q?bsq9QQ7mzVlGfuJ8ynRLyzwomYSCtNgBTapHCvYXEh5UMYazZXYWegHgT7GV?=
 =?us-ascii?Q?K0Pt+7ThC1uk5e2ubbsxpC70x/GrTIoJx4RdVy6n0IDXBOCMYlRJf2zIQaUF?=
 =?us-ascii?Q?7wbLphVVyBt+q73JPOObSQCjZVMrmBL9IeVgjX8QS9e9I1OZ+nExPQ2jTMoB?=
 =?us-ascii?Q?6snZejXpwb9BA1VrTLvPuxdtrl/AS15tScsq7WXgrcbGfwmcoqnb8KPbaiEK?=
 =?us-ascii?Q?WHYYoQH3mwIcwado4PlJ5i+/vStx7E40fbQidCvjR0x7aBdpvB4AcSflJzx0?=
 =?us-ascii?Q?18E2FUBT1ro61uP0J0H754/XPWHA7wHwujgqS6ze3v1i+MoWkJVQOhqqtdeD?=
 =?us-ascii?Q?lEgKLpVGXxUqwjLI4uJL0vc3EcqQbVNyXfJmVS5MlnEAt7PlOEdRMPo+Fb9t?=
 =?us-ascii?Q?BiNAu1raVnbAuLQ4fj4fIVNOHdsKnGFuUKmQhpZE9uFmcoIIlg6aibvBcHDg?=
 =?us-ascii?Q?2gxeYOya36lQxP9sRME9bu4juyYWICwBYKKlw7a2T+XT/LuWbNg0ea8rgZOV?=
 =?us-ascii?Q?fQuUuMjQv1NwKIv08PW5E4r7GBTtT2XnneWB2u1h1Q03pE/6PHJZQK83CE2Y?=
 =?us-ascii?Q?NeOyAWhjnaDJRa4rnCBxDJapcJOUsaZn/gqogyR3tiAatCI++7wjoaNs/cDU?=
 =?us-ascii?Q?Vfm/B73Hufpbf9qBs2xi+zS/jpjg0bzxhieR4bgvJ/1Uyxu0/PFsdIQIH5Pm?=
 =?us-ascii?Q?I14Ug7GC+7vrBHt/z5ThbfYi2qfH/lFR6ItJf0njWlmAhsTStZWwCRv0VRz2?=
 =?us-ascii?Q?6k78Q2JQPVUNQORufS2tb+zrwcJEbuoyRpVG?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 11:02:17.1673
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca66c8c1-b193-4cce-b079-08dde94703cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5615

Implement a helper function to check if BIOS input notifications are
enabled or disabled.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/acpi.c |  6 ++++++
 drivers/platform/x86/amd/pmf/pmf.h  | 16 ++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index f75f7ecd8cd9..4982311ac045 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -161,6 +161,11 @@ int is_apmf_func_supported(struct amd_pmf_dev *pdev, unsigned long index)
 	return !!(pdev->supported_func & BIT(index - 1));
 }
 
+int is_apmf_bios_input_notifications_supported(struct amd_pmf_dev *pdev)
+{
+	return !!(pdev->notifications & CUSTOM_BIOS_INPUT_BITS);
+}
+
 int apts_get_static_slider_granular_v2(struct amd_pmf_dev *pdev,
 				       struct amd_pmf_apts_granular_output *data, u32 apts_idx)
 {
@@ -385,6 +390,7 @@ static int apmf_if_verify_interface(struct amd_pmf_dev *pdev)
 
 	pdev->pmf_if_version = output.version;
 
+	pdev->notifications =  output.notification_mask;
 	return 0;
 }
 
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index f5e874b10f0f..6ddd1a6e9115 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -118,6 +118,7 @@ struct cookie_header {
 #define PMF_IF_V2		2
 
 #define APTS_MAX_STATES		16
+#define CUSTOM_BIOS_INPUT_BITS	GENMASK(16, 7)
 
 /* APTS PMF BIOS Interface */
 struct amd_pmf_apts_output {
@@ -377,6 +378,7 @@ struct amd_pmf_dev {
 	struct resource *res;
 	struct apmf_sbios_req_v2 req; /* To get custom bios pending request */
 	struct mutex cb_mutex;
+	u32 notifications;
 };
 
 struct apmf_sps_prop_granular_v2 {
@@ -641,6 +643,19 @@ static const struct amd_pmf_pb_bitmap custom_bios_inputs[] __used = {
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
@@ -792,6 +807,7 @@ int apmf_os_power_slider_update(struct amd_pmf_dev *dev, u8 flag);
 int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer);
 int amd_pmf_notify_sbios_heartbeat_event_v2(struct amd_pmf_dev *dev, u8 flag);
 u32 fixp_q88_fromint(u32 val);
+int is_apmf_bios_input_notifications_supported(struct amd_pmf_dev *pdev);
 
 /* SPS Layer */
 int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
-- 
2.34.1

