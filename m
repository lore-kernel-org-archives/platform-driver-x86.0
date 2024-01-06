Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0864715AB
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jan 2024 02:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="t3J2K5su"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NlHTVQmz4un3Yf7L7tYrg2SdHXkxz8xsLRpZ3O5e9sNc3mzL/Cx18EouSNfVNX5fhas6dE+GMbFSeH1zs+e+IFtShWYxnkbietI4B27PiNL/8mVg7XPm25vmNVih6nCRQUEkF/+X/PzsnShZrUznm8CxnwKs7HYhUoVYxOgKz/AXB4ZJC1VmSDO49cNsNhoReCKonZ7WtncdqCF798YIFKByu93Lc0FCX4cVjWgpNL5IoKlbdao5r1FEhSRVgvDwrYQz+VixRTvcJEtjM8c1P6E+0VfoN1kNzBTHROYOW/HT0gAgruDXeitr/jnaJfDHs8bZp5FXb7T2Thb1ksiVzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y5zoM/nvw/CdaSL3AQrSqSRY+HNDa9mGiyhElilJiUw=;
 b=bf9q6tsLz8JK2NmYxSMcSF4BZwDRSo/lGTYouoRO6vmQFl/2iJeHmm2k85pTH64KKKMuc4oVOYbIMkYT7w4QrjcLH7yZtzmWcirIdYrg/1fMBVlk+seI732bmrR+EADgApvSRMrriNFLfH+Q+Ns3rV0IfxZW8kbZMQkRXRkPuVzKr1476AIAe9vFntEORQQXIUVqFVHs3lzX9OY0pqnuNdmH8Eer7xq2lptOY0NY2d2jR0ZTZsVd/5NiN4g1/yCGQR77GEiQvyDKr4UdhqctlfinQs4etueIIW+mB5VFk4fyX1ofsyL5SoWdFdYz9BnXjbm7AV6wT17UfZcFTXXX5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y5zoM/nvw/CdaSL3AQrSqSRY+HNDa9mGiyhElilJiUw=;
 b=t3J2K5su9CGfsR6P6G5GQVLGJT3Ly2y6tfWlK6iew9naVIU90yJ3zxeYxYsknR9ohdLumlZf4jSmDFAqso+q6GaaUzAwsWSApgM2mvxseOP4QDEkqi30XpdSLQCqo+jg2V8+xhWVOzGUXFBvt+wWrwwgnFYG2lDUMLwpKWK7g0I=
Received: from SA0PR11CA0143.namprd11.prod.outlook.com (2603:10b6:806:131::28)
 by MN0PR12MB6247.namprd12.prod.outlook.com (2603:10b6:208:3c1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.17; Sat, 6 Jan
 2024 02:26:18 +0000
Received: from SN1PEPF0002BA51.namprd03.prod.outlook.com
 (2603:10b6:806:131:cafe::40) by SA0PR11CA0143.outlook.office365.com
 (2603:10b6:806:131::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.17 via Frontend
 Transport; Sat, 6 Jan 2024 02:26:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA51.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Sat, 6 Jan 2024 02:26:18 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 5 Jan
 2024 20:26:16 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v5 06/11] platform/x86/amd/hsmp: Restructure sysfs group creation
Date: Sat, 6 Jan 2024 02:25:27 +0000
Message-ID: <20240106022532.1746932-6-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA51:EE_|MN0PR12MB6247:EE_
X-MS-Office365-Filtering-Correlation-Id: 46dd90dd-cb2b-43a5-b082-08dc0e5edd6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2N0nrgZ5ZcuMluUg0viMqNLJ8+a07Tu5DKnPzY4VN0iwg5yF2lYnfrQ2c5OyznDLn3OWjNxOaO21hrBmWjNxhMtxsFv/OVsbIwYKAw26zNZ+T1nrclAdYOSXYHAFQ9vvSfpTFN2HGzvnv0aIpw7oBUQCxccTf1S/QPl4OSKa7yAZo9zpD4IwXIfNbKkDPni/W8hEbGC4jv6w4ENr8Gzu5KVP90Qkp246pPsvGfRS9P3FKFU+AATI8vsuXent5rTTocjy9pQx+cSC4cdlhp7TN0Da05/+BzBCLwhT2Y9neWYILRdxmM9x+Yj3yOKofy/ldsINprP7dL/gUma8V71fNGGWlMc71VKIsNXu22laYTj581JsTYLzq8DsemIdatj4euDu8ROnpjKd+mlULJYmTn6A8I1RPx19uIq5xiuTH7fEsd5JzNC0yEimKuKYlV6yUV3O0kmir4S+RMGnGupS9ig18FFcNDQtRRgKt6mQfK+p8Sw2mXsJy+RN6XyFL2lKCGkMHWsPHc1ASj1B2IpUv4EERPKYwvwXJIDeGzu+s7oerjEKNJPLWe6FucZL+PQ+jWKOiDGFk5ZelYI9jpJaP2Su5JnCcZ/q+Nk8xQFJxt5DMEM0duERFM93/rQGSD8FXLWYZUDY+I9IXElZyxrUtTocbB1/H/e5m2qGwgqpQLiOZeQrN17OHJpn+kckB6it8I2BcjPjPUorRce+6BKXpsaJ8VPdTwBOwryn/RPws0Ei5XUrZiWsFrld5nNOLXUgd5f+yOYba+X0Fp4WRo0m3g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(39860400002)(136003)(346002)(230922051799003)(64100799003)(186009)(82310400011)(451199024)(1800799012)(40470700004)(36840700001)(46966006)(82740400003)(356005)(6916009)(70206006)(316002)(54906003)(70586007)(36860700001)(81166007)(47076005)(6666004)(86362001)(336012)(2616005)(1076003)(26005)(7696005)(426003)(16526019)(5660300002)(478600001)(2906002)(4326008)(36756003)(83380400001)(8676002)(44832011)(8936002)(40480700001)(40460700003)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2024 02:26:18.3785
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46dd90dd-cb2b-43a5-b082-08dc0e5edd6f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA51.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6247

Split the creation of array of attribute groups and array of attributes
into different functions. This will ease the ACPI support.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes since v4:
New patch, generated after splitting 6th patch in v4 series

 drivers/platform/x86/amd/hsmp.c | 44 ++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index 0bf94e2bd022..cf8e8d155155 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp.c
@@ -442,49 +442,53 @@ static int hsmp_init_metric_tbl_bin_attr(struct bin_attribute **hattrs, u16 sock
 /* One bin sysfs for metrics table*/
 #define NUM_HSMP_ATTRS		1
 
-static int hsmp_create_sysfs_interface(void)
+static int hsmp_create_attr_list(struct attribute_group *attr_grp,
+				 struct device *dev, u16 sock_ind)
 {
-	const struct attribute_group **hsmp_attr_grps;
 	struct bin_attribute **hsmp_bin_attrs;
+
+	/* Null terminated list of attributes */
+	hsmp_bin_attrs = devm_kzalloc(dev, sizeof(struct bin_attribute *) *
+				      (NUM_HSMP_ATTRS + 1), GFP_KERNEL);
+	if (!hsmp_bin_attrs)
+		return -ENOMEM;
+
+	attr_grp->bin_attrs = hsmp_bin_attrs;
+
+	return hsmp_init_metric_tbl_bin_attr(hsmp_bin_attrs, sock_ind);
+}
+
+static int hsmp_create_sysfs_interface(struct device *dev)
+{
+	const struct attribute_group **hsmp_attr_grps;
 	struct attribute_group *attr_grp;
-	int ret;
 	u16 i;
 
 	/* String formatting is currently limited to u8 sockets */
 	if (WARN_ON(plat_dev.num_sockets > U8_MAX))
 		return -ERANGE;
 
-	hsmp_attr_grps = devm_kzalloc(plat_dev.sock[0].dev, sizeof(struct attribute_group *) *
+	hsmp_attr_grps = devm_kzalloc(dev, sizeof(struct attribute_group *) *
 				      (plat_dev.num_sockets + 1), GFP_KERNEL);
 	if (!hsmp_attr_grps)
 		return -ENOMEM;
 
 	/* Create a sysfs directory for each socket */
 	for (i = 0; i < plat_dev.num_sockets; i++) {
-		attr_grp = devm_kzalloc(plat_dev.sock[i].dev, sizeof(struct attribute_group),
+		attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group),
 					GFP_KERNEL);
 		if (!attr_grp)
 			return -ENOMEM;
 
 		snprintf(plat_dev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE, "socket%u", (u8)i);
-		attr_grp->name = plat_dev.sock[i].name;
-
-		/* Null terminated list of attributes */
-		hsmp_bin_attrs = devm_kzalloc(plat_dev.sock[i].dev, sizeof(struct bin_attribute *) *
-					      (NUM_HSMP_ATTRS + 1), GFP_KERNEL);
-		if (!hsmp_bin_attrs)
-			return -ENOMEM;
-
-		attr_grp->bin_attrs		= hsmp_bin_attrs;
+		attr_grp->name			= plat_dev.sock[i].name;
 		attr_grp->is_bin_visible	= hsmp_is_sock_attr_visible;
 		hsmp_attr_grps[i]		= attr_grp;
 
-		/* Now create the leaf nodes */
-		ret = hsmp_init_metric_tbl_bin_attr(hsmp_bin_attrs, i);
-		if (ret)
-			return ret;
+		hsmp_create_attr_list(attr_grp, dev, i);
 	}
-	return devm_device_add_groups(plat_dev.sock[0].dev, hsmp_attr_grps);
+
+	return devm_device_add_groups(dev, hsmp_attr_grps);
 }
 
 static int hsmp_cache_proto_ver(void)
@@ -561,7 +565,7 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = hsmp_create_sysfs_interface();
+	ret = hsmp_create_sysfs_interface(&pdev->dev);
 	if (ret)
 		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
 
-- 
2.25.1

