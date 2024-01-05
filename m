Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2062.outbound.protection.outlook.com [40.107.94.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4011EA77
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jan 2024 07:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="t9/S1z3w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MyH8Hs9gE/X2SAk+BGsLMKqdtdtsfjkOI+EDloKc9x7+rvBnwe1S6oZTxCY5Dag2bYXIxLpNkfC/UWuApIMs5B/QbeKySHXjbMEpgKXAvFMn1oFMtaR3ebV2FYsQ8YKlN1T9gTuVqVSiV0KDDhR38COxG5FWwFq+2N5SD9uJMIu2dT7/k0UcUHgBI2uy8vOT+EYg4ZTrJ8mcX7hry+gzLJTyPpYTa3Zolj6Tplwu6A83AEZeTTgEOXkyLJyP66iANCKjmicPqps1J7uo+Ll+jQZxjxBu9pcLwbwQVVE9zGAZNK+GXZaOXbYrK95Wk1xg/a881+VWb/g+f8JXNSPHBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlBB74pMuCDLhouSOu1VS9wbArBG/cRjfpC3d8bJsmE=;
 b=In91UHrYzTM5xkPh+2e69AG6iEGxs3FicMfyphR4MN/NhvuDdY84qUvB8ixmQA67n/N/IKl+hgLgKGwwN6FK5gS4LV02eFNIQgcuXsMLj/mgdRGErLOjbTHFzSXoThx8+26Dv+49OlOZwp3l+8qkBN31LiIHiDdYWdybeyJork+Hr+0OH4mkqDIYL/lCjjfb18ptpWNPD70wNAfcM0bRp4EAx0v1U+88HrA5rcXZX3a/NgMKpwcBOX/1QyP9A5RdPGV6iv29lP7gCOg78uZkY6sv+W2koxRYylzgmVDp9lXfh7jjcG2Wss67J9QXyH1BcTiFNUCXJgkKyw3KIj+I9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlBB74pMuCDLhouSOu1VS9wbArBG/cRjfpC3d8bJsmE=;
 b=t9/S1z3wYxNxOuY6Yn7wWrob8l65a1YgjM8b2ncwpfSTXHgrSJ/JvM1CTSI7roqpaaLQ7PPRVRnaYYOkik/rPb8O1WjCiIjMzwsC6UpQaXfV/wWFtSbz3NnePIamA2YB5ZRXX15zSCLaQhmvyXa2Kfj+mrzBwwXAN4MLmLWNIus=
Received: from BL1PR13CA0239.namprd13.prod.outlook.com (2603:10b6:208:2bf::34)
 by CH3PR12MB7764.namprd12.prod.outlook.com (2603:10b6:610:14e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.17; Fri, 5 Jan
 2024 07:47:04 +0000
Received: from BL02EPF0001A0F9.namprd03.prod.outlook.com
 (2603:10b6:208:2bf:cafe::fb) by BL1PR13CA0239.outlook.office365.com
 (2603:10b6:208:2bf::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.14 via Frontend
 Transport; Fri, 5 Jan 2024 07:47:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0F9.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Fri, 5 Jan 2024 07:47:04 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 5 Jan
 2024 01:46:59 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v4 9/9] platform/x86/amd/hsmp: Change devm_kzalloc() to devm_kcalloc()
Date: Fri, 5 Jan 2024 07:46:18 +0000
Message-ID: <20240105074618.1667898-10-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240105074618.1667898-1-suma.hegde@amd.com>
References: <20240105074618.1667898-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0F9:EE_|CH3PR12MB7764:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a9b8208-1938-4e48-9a88-08dc0dc2826c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qfqP2Jz86b865aayOLZd0YqL3nObRqDCuuSdA0okZtVZcYXeDFF620Y2rmnaveDIqA6q0hN5TM0xCSkGR8MRXRhzKtbFOS9GjQg36h2clIDKo9kAig5qLZ76Wp2+M9IwCE3IlD/Ueuche7KLjGHToQoIsAaKnziQmxJnS9LZ+XfkTKZSbzsFm08vIZCVijt5kYV7S1rrPnr1l0XLwo6uFpMA6HVQQfpXdYd9liE7Am4IHCT+2fp/SZbyQWmZQvdC0RVbqui+g9NeZJsHXVVouIkwkvxAxf6cGRWqczQo/s+XzVrDSikHlIMT8OfwUHDoDOeELys6Ue3YP3mesMwcn2QCbkmMaHG0btbbn1NSdLzN/TstDPwzK0HBzwPPFdm8w46690nv/nPAPDHRUoC713HpklNKGscmhEWgcwT02VHuhfnwRudzdddtPMcaJ7gD1WMvBIKVzx/zxm//+JMscKQhdbz5XdOar8kryVAUn62F6z2Oq+rEJmrj+0vuFAetK1IdzdNe5GbEy7+oAoeIXaRkniJtLta7PL6DIwYrDTKfm7dSjwgYkL9kZhgg8KdehcswCjPxsKpZn4sNmyC0n95TJGrmazVhD3TnWKSVxhgi/hK70pYAutE7uiayCn8hY7Htj9/LYVOx4S9f29tkpzDggB6ZtWQB7F0Ury0VqAUUbMuCxDfDDJa6QFS1sY6Wn+ONGyJwFqKuLKLPuxUJ9CNyS7m1k7xOeC0azF1oKW3Eap32XGvn7UVyCKCx/GJqX6STcsIwu2fO42CrizhLUw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(451199024)(64100799003)(82310400011)(186009)(1800799012)(36840700001)(46966006)(40470700004)(356005)(8936002)(8676002)(6916009)(70206006)(70586007)(316002)(54906003)(81166007)(5660300002)(86362001)(2906002)(41300700001)(36756003)(4326008)(44832011)(82740400003)(7696005)(83380400001)(6666004)(2616005)(40460700003)(40480700001)(16526019)(36860700001)(26005)(1076003)(426003)(47076005)(336012)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 07:47:04.2114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a9b8208-1938-4e48-9a88-08dc0dc2826c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0F9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7764

Use the standard array allocation variant of devm memory allocation
APIs.

Also remove extra parenthesis around hsmp_get_tbl_dram_base()
and add a space in a comment.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes since v3:
New patch, based on Ilpos review comments and additional cosmetic changes.

 drivers/platform/x86/amd/hsmp.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index 99bebb0ca5a9..f2247885c547 100644
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
@@ -657,8 +657,9 @@ static int hsmp_create_attr_list(struct attribute_group *attr_grp,
 	struct bin_attribute **hsmp_bin_attrs;
 
 	/* Null terminated list of attributes */
-	hsmp_bin_attrs = devm_kzalloc(dev, sizeof(struct bin_attribute *) *
-				      (NUM_HSMP_ATTRS + 1), GFP_KERNEL);
+	hsmp_bin_attrs = devm_kcalloc(dev, NUM_HSMP_ATTRS + 1,
+				      sizeof(struct bin_attribute *),
+				      GFP_KERNEL);
 	if (!hsmp_bin_attrs)
 		return -ENOMEM;
 
@@ -673,8 +674,9 @@ static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
 	struct attribute_group *attr_grp;
 	u16 i;
 
-	hsmp_attr_grps = devm_kzalloc(dev, sizeof(struct attribute_group *) *
-				      (plat_dev.num_sockets + 1), GFP_KERNEL);
+	hsmp_attr_grps = devm_kcalloc(dev, plat_dev.num_sockets + 1,
+				      sizeof(struct attribute_group *),
+				      GFP_KERNEL);
 	if (!hsmp_attr_grps)
 		return -ENOMEM;
 
@@ -804,8 +806,8 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 	 * on each probe.
 	 */
 	if (!plat_dev.is_probed) {
-		plat_dev.sock = devm_kzalloc(&pdev->dev,
-					     (plat_dev.num_sockets * sizeof(struct hsmp_socket)),
+		plat_dev.sock = devm_kcalloc(&pdev->dev, plat_dev.num_sockets,
+					     sizeof(struct hsmp_socket),
 					     GFP_KERNEL);
 		if (!plat_dev.sock)
 			return -ENOMEM;
-- 
2.25.1

