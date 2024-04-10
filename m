Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2084.outbound.protection.outlook.com [40.107.236.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52D615FA61
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 14:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712758223; cv=fail; b=qmHQ2oKRJSZIKESFLyn6ByRXDVzyRfblqVMuMQ4T8awZJcq04YFY/WtRQd7xAwXQU02oaoKTnmyHOvzZCgWe37mQF3SawwI02azmL609QoDh4oECW8sxfq4dHXhJM5W86YzjaY0j3sRa8JBwszVZVKwmbNzT5RHiNDLEVQZJdmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712758223; c=relaxed/simple;
	bh=raNXm6jDLj2l/vcnp4IAVrVyjFbfGoLZbw2T3NYSCR0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tbuAl9g2qCBTnlK5QxGCZyBljpLGl2khHnoDElIWDbXCj6sXr5bOKnSc5xJ4B1776nXOGD3YsD7epowkZ4wSuKUj8rzCuUozxePUbYvavVVhRXY9I0uSyoQ3mq7j0yfkuOY/m4ZbNEpgzN3UhoSaLzLoBbE53qzt3phF4Oe5Vo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5WEPLXW4; arc=fail smtp.client-ip=40.107.236.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5WEPLXW4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/nMkV8eoRhokpxaMqOayf5JqDL7SeVWg1pFURAYgnpo+eTPKfiffEzWpcOGtQI/H4cGFvpt0auQFKpITfFSPeQH/SLNL+vuiCp8jLaTcohYm1KvC35Ew+9bQVrYuyNqou3GvVe7sPp5yqYg6q8s+7YOC1Owm92dKkMzlEqA8I7TEOfjpUjUiBy/VYWAsYuKVHh6uDfIEAs5BNcHgMpadpLOrsmQA4xQSeKaNJDLWB2hLgRhntFlbfGLbE2SLqRAkoAYkMPPV+0WR9nzRNL94SKtiyaF03c8JXSrEoGbBccNJUPXBbcFJT90JukezgWFzyy1eXXWdPFAH6jzScrMfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FETWJEU5JErB+zNSVjp9MjUrZD0KydkJptt2frHiLF8=;
 b=IB2rrAAuK7hWlMBa6Sq1mfL8xGvrWNowD040V8igIfsZpLEFZlGD6L7BvFiihyQqkClJZgCamn1Qw77hEzwL3StNhuiHwmMQOcXsWCm2N0CXQnQVJnItpx7DTO8ckiMGcXFBkuF+RWeca3NtoajZkOeTF9X1NzLEEoFbC0p4+39KiGAyP6vs6hP5p2/w+nZL5l+R7ce3oi/AwClTEbv78QdZpJGupIU8a5g5TquoFKbVkrictBPVVPKosJDAQ3OVvR3wIPmBFPytdnwvsrtwZC+mAyhGpm1BJ2HJI+fWl61fDxFqjUC6zq4LgfeNMKxCamunKx0jKSX4/8D2v742gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FETWJEU5JErB+zNSVjp9MjUrZD0KydkJptt2frHiLF8=;
 b=5WEPLXW4SiBjnd/tTSh7BOGhnlSAhIZO3aEY/F1cGoiQonFd+qvdBdlO/JqQbbhY6Yrm5he+sPGNuRc627fI3FLWeJpB8UOEkftsTH5Y+mqokWWKuzOX9m+nu+h0tV3MC8CvCJMDr+yVn31hp6El0vFtVX6i2WRm2q4BpUB6bK8=
Received: from BYAPR21CA0020.namprd21.prod.outlook.com (2603:10b6:a03:114::30)
 by SA1PR12MB8164.namprd12.prod.outlook.com (2603:10b6:806:338::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 14:10:17 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::67) by BYAPR21CA0020.outlook.office365.com
 (2603:10b6:a03:114::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.9 via Frontend
 Transport; Wed, 10 Apr 2024 14:10:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 10 Apr 2024 14:10:17 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 09:10:12 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Hans de Goede <hdegoede@redhat.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>
CC: "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, <al0uette@outlook.com>, "Mario
 Limonciello" <mario.limonciello@amd.com>
Subject: [PATCH 3/3] platform/x86/amd: pmf: Add quirk for ROG Zephyrus G14
Date: Wed, 10 Apr 2024 09:09:56 -0500
Message-ID: <20240410140956.385-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240410140956.385-1-mario.limonciello@amd.com>
References: <20240410140956.385-1-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|SA1PR12MB8164:EE_
X-MS-Office365-Filtering-Correlation-Id: 93a583cd-4183-40ab-1199-08dc5967f2e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AeDBXLKsN0a/fV4Vb/zI+6qhAesqj6l2USAtbxKF+w50omMLsvRAB/gSE7hYs8570IOBAyrXMLLGzDYGqS9+OmLgUaUBnjtagnVLBFq4Sa2a8Atlvjd7c5P9bm1rEVXGtMNRoy2ILT6ndZD2lK+9WYMDRiKZIkTCLzqra6oT0n9fecrBNPRBjfzTbxOhZtWUbXs7MPRh4hmFEeIZfRIYoModw3QP0Kp8fVkK0HdzkknBT9Ex00P0BkU3dREEA5A8Bblu8ZomXcBCUElkT+nHbaU17DGPEdnXuPhWJ22Z1tyuU3PpaKNNQtWLk5haWKGGSFrCdzl2HMWAx0M6szF8oJtW4Zt1eDfhKn1cTlCX6HKvJhup7tTjvdRZiDVgZNTa2tf1dvQOUwYD+Usl6GNNo6uJSo1M2EBy558xYZBvh6uZ3MZBA/uACSbceYc2AVPQez13VN2oNmAVhkNHCF6txqWgp1H86jaxT1amBtonqF9/ZKzXhhF/CD8PX/v492oVf0Yh+KST/QEkVATGV7w9tGLiTNsxo8wtQbuJFiXlZK2f32rX7ufHWEpnuU5kscrtZoQkIKsctnOP2Q+s3pve2dUIwvRNuOmRGiTfvgb+PRzXaojeSDim+p+lH2d2ZXRlzRIITkXdm9YkNbK/rmRLFvrt6mB2nPnHZEQ3alAtHncot9EWOp9vLUlY2xB7A9Z6BZMIfGrohOeXx+WAi8TQ1XVpOWQXKHNebun2ugadtFJPEOTFIvwBi67g0DUqpWrwcbavCJDbCV6FzNA1hrUgKbxw0Egp3sGtMEaEOv9C7uI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(376005)(32650700005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 14:10:17.0225
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93a583cd-4183-40ab-1199-08dc5967f2e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8164

ROG Zephyrus G14 advertises support for SPS notifications to the
BIOS but doesn't actually use them. Instead the asus-nb-wmi driver
utilizes such events.

Add a quirk to prevent the system from registering for ACPI platform
profile when this system is found to avoid conflicts.

Reported-by: al0uette@outlook.com
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218685
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf-quirks.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/pmf-quirks.c b/drivers/platform/x86/amd/pmf/pmf-quirks.c
index 9f3790eaaa30..0b2eb0ae85fe 100644
--- a/drivers/platform/x86/amd/pmf/pmf-quirks.c
+++ b/drivers/platform/x86/amd/pmf/pmf-quirks.c
@@ -21,6 +21,14 @@ static struct quirk_entry quirk_no_sps_bug = {
 };
 
 static const struct dmi_system_id fwbug_list[] = {
+	{
+		.ident = "ROG Zephyrus G14",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "GA403UV"),
+		},
+		.driver_data = &quirk_no_sps_bug,
+	},
 	{}
 };
 
-- 
2.34.1

