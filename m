Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2079.outbound.protection.outlook.com [40.107.243.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9583815A8
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jan 2024 02:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="q0Bs+LRN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+7MG62OTAHHZULZlb+3mQajqHdN0FDGQeHmQGM7Gq5tAZbgrK2xnE8AAGBpljIlt45cMr5QPZYD0NSkPw3M8sN8gQ5IGxWjPwT0LhW09PCfbb03CGt1MNhVhP+fHMVl51rNJ0LYmtF0U+Urux0s0h2VOVjmD+FdT8KYXdQiut93k2evV730v249jbT9xAPlvYcWme7hryC3t7LtcEk5ykWhBqZTmmASJjUcoYmi/p7BSKJ/xTUzfcW4oMha7gZBoccTC8P9xUGpP24MuZb0CIqdDpibsER8hemgPveGtAWn/FmE+osWy2sy5AYkhd/ywxTcAnlDGMYUPPM96+EAMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nKSI7O00tbADC6aIeiRZpsMRk14IN1sBAtV449z9D2U=;
 b=drph8DdFanNFl5gMa4K5eFrVywFI2ePkbixlPT2kGTQLG1g5nGbTfDT3p9c0HX4QSncm3JvFKRujdB4lLBR8rkmLOQjgLAXCf5aEIbsPiyAAIdqdZdDaL9Ssb4W/nLpqeAvMV18dHvQZXWrQ8XpcYNJd00RR9tQvCklGVSKLHtLSwMA0cPVUgIL/d8ObZ+7k1B/VrtZIcPvcugu1cocC0iMpZLV4kXJCrc3cVFR0WmD9w2F9V5INg/PARne/jz6wm/TJpWXOPVfwC0BRbNODRR/tfo76N7zHNAuqyquYuTPvEEvmNkqBZ8lC5y2szOlLY7HLKo0xITVC/aO0rOmLWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKSI7O00tbADC6aIeiRZpsMRk14IN1sBAtV449z9D2U=;
 b=q0Bs+LRNx4xeG+OejKfuI1z4HtJIALHMSSjvKqf9/2MnYb8c9K7jTQgps0xwS+K8dO+hlWxeJwXTxgNHhmyHNLzac/y2Ggykvqw0x/tblmJnnP+fOPUBJXWxxfVRRrpylhDITFA7Qvo6WGD5LUN+PnoqcQ4yTbpx/ko2dCQjyr4=
Received: from PH0PR07CA0030.namprd07.prod.outlook.com (2603:10b6:510:5::35)
 by CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.17; Sat, 6 Jan
 2024 02:26:28 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:510:5:cafe::c1) by PH0PR07CA0030.outlook.office365.com
 (2603:10b6:510:5::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.17 via Frontend
 Transport; Sat, 6 Jan 2024 02:26:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Sat, 6 Jan 2024 02:26:28 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 5 Jan
 2024 20:26:25 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v5 11/11] platform/x86/amd/hsmp: Remove extra parenthesis and add a space
Date: Sat, 6 Jan 2024 02:25:32 +0000
Message-ID: <20240106022532.1746932-11-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240106022532.1746932-1-suma.hegde@amd.com>
References: <20240106022532.1746932-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|CO6PR12MB5489:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dbb222d-8c3c-4346-4ff7-08dc0e5ee336
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SDmCzHoghceJHdMoPPWpb07pFChhzMQ1sjcTywRUAFyjv9SrflEOnOoGcCFwAxbwJakrq16u9n7cvGmWOQ2BcL2ojoZOlpF1+PerDlmchNLSaXEYcyt4rIKuNQVTCH7bctm7FDhVfTUriCPEK+oYvXQzD3HgTOItoQtuDX2gFcSV+OaW5DDiPq/4015XVWSQKsn9Pnc3okZL2/4mjonL4kziF+ipSTG0HIU04ZoPR99punH6Ioksj7/jTvZRKxqWPT6BaSpc+8OzqOILO1eJkJYP6rDoHZkd1lw5KI3mTAFqow2vi0gRP0lSWvGG8rLRPOfdWGdAFHvyjcmDisRRn84EuHUG/inJVfp/vaQahZrP8jS2P0q5fz3GeWA8bW96NS/n/kz/0OTYEnxJF4lKNRhyLvcgGzFRdwf2WNeh0r47RUIe46Uw8LXvvG+/046QCKT9W7uh74g3yXP05SaC9knB0UwqIW4bbwwJJEO9aADPVHD3rzdY4kb08q9V5M1oDfweU1nAqFNxPuVkH5kjsnLzuIej+cPFBAeJ8fDhXoEY0a5n5wl+IO2EMqMSrJ7r+ou7b6as9eJG6XpbJBL+UanDNLngRDxO+AoDX3824p9TXjhrF8qIgMLpS96BFTYl0Mj2y6zuL1/zsM2J3Eap4Tw8nro/WQLv9qOn6m3ypio/Ynr6gWSt4FBywb6K+yIx7TwTA4RPBEcayv0GBFmnL8x9sI3Uxu/gL9PhYXdiZgSWEf/uJInotW+1aPX9M4mnkXPTuFsqRhfcaeRHRV6W9g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(346002)(39860400002)(136003)(230922051799003)(82310400011)(186009)(451199024)(1800799012)(64100799003)(36840700001)(46966006)(40470700004)(426003)(2616005)(336012)(26005)(1076003)(7696005)(6666004)(16526019)(44832011)(83380400001)(8676002)(316002)(8936002)(54906003)(36756003)(2906002)(4744005)(5660300002)(4326008)(478600001)(70206006)(70586007)(6916009)(82740400003)(356005)(81166007)(47076005)(86362001)(36860700001)(41300700001)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2024 02:26:28.0532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dbb222d-8c3c-4346-4ff7-08dc0e5ee336
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5489

Remove unnecessary parenthesis around hsmp_get_tbl_dram_base().

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes since v4:
New patch, generated after splitting the 9th patch in v4 series

 drivers/platform/x86/amd/hsmp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index ccf7cd8f98f6..99a34b48f78f 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp.c
@@ -643,12 +643,12 @@ static int hsmp_init_metric_tbl_bin_attr(struct bin_attribute **hattrs, u16 sock
 	hattrs[0]		= hattr;
 
 	if (plat_dev.proto_ver == HSMP_PROTO_VER6)
-		return (hsmp_get_tbl_dram_base(sock_ind));
+		return hsmp_get_tbl_dram_base(sock_ind);
 	else
 		return 0;
 }
 
-/* One bin sysfs for metrics table*/
+/* One bin sysfs for metrics table */
 #define NUM_HSMP_ATTRS		1
 
 static int hsmp_create_attr_list(struct attribute_group *attr_grp,
-- 
2.25.1

