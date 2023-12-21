Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CAB59925
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Dec 2023 17:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="f+WhgrXb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VqNR0QqZKkHOVAI7dTPb/AvHvdy8LCVHY5m1brSlhm8DN51Al0vraY7w/7oODa+FKVI9sUZD4JhlpkMBlCRaKQfB8K99fGyur1P+kmjGGQI8e13xJmRZ6ydeyTXHBv1hlzL/sPr/+ALNOjf5ljcB0nz3ljIuPCmWJ59Lw7CbzENIGiJkg6igYCNR1V/ZWrPCfkrK6jynBy8KNF8OawUa2tTyFhjFKhscn6bpHCZCKkIPvQil3z6PR6dQ/GSFFZiBAA5YDSH/xd3nF94/yT4uxq3UUkq8dRqJ5D5Am1dsKl5GAUxxN/HjvDhbSueGGeUQnV3gbDKppb7YUEwx+Fe1lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2PpLbuvpIQLm9jo+pCGKe/5/VhQNPZgCPJyE3dCq7hU=;
 b=nmduuXDk0QLRo9ywBTDeg/0NYrthUeuFIYiwJzdRzsfEHVkcI/ZtCTYhmONOnbg2G+DJXQlHhNst9qBZnVQDM0m2cei0znckXjvfpeYKvHRjS0oaQDeaX8x4jtZniOS0LQ7gceR9dRjOcAgsYrnvoe2gXTkS4OIp60MyqnfeCiv/K+90pfOe7/alN0chvy6ZS05ouJZj8Z7tcRPzW/w6onIJxUl407I4oToLt65ZgJ09xcVDbLnEAYQIDJz6y67o/wikQhq8enYggVe1v04sfTp+uRochNvXMaLZ2Q0Ghve4a6sUWECzpd2Ffu9XI2R9dE93rojMzLv+3Aibf767RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2PpLbuvpIQLm9jo+pCGKe/5/VhQNPZgCPJyE3dCq7hU=;
 b=f+WhgrXbPW2VhDUFKdrZV9EIEnDoIs5t1wh9W+v3ET+igKy+vliS1svna7jrjhsjQm1OppWcQJamGuhivZVIS9rdRe+kOc3vmWwpiwEBK1EFO7FLG5jvs4pB/bIzH9A+oiWjkC2ln9D9lLGFWF+2o1u2y3fX52ofQPYnVqIiD/0=
Received: from BL1PR13CA0447.namprd13.prod.outlook.com (2603:10b6:208:2c3::32)
 by MW4PR12MB6952.namprd12.prod.outlook.com (2603:10b6:303:207::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Thu, 21 Dec
 2023 17:21:42 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:2c3:cafe::b1) by BL1PR13CA0447.outlook.office365.com
 (2603:10b6:208:2c3::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.19 via Frontend
 Transport; Thu, 21 Dec 2023 17:21:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Thu, 21 Dec 2023 17:21:42 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 21 Dec
 2023 11:21:40 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v3 3/7] platform/x86: Create static func to handle platdev
Date: Thu, 21 Dec 2023 17:21:10 +0000
Message-ID: <20231221172114.1569559-3-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231221172114.1569559-1-suma.hegde@amd.com>
References: <20231221172114.1569559-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|MW4PR12MB6952:EE_
X-MS-Office365-Filtering-Correlation-Id: fcec515f-c48c-4f0b-8b67-08dc02494ca3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vL72wqdMOHXdNMtqvZ4tKfDjYFpuBHNx7K4fdqvuZYFQvrB8/iIGPMNfWhpVmf40UXlQb8V6qrt5yDHkc9cWAytfLw7Xli7OJGS5JsrskACVIwlsaKVLwze2+mVMINYuDc8ObSy/7QuGPaIxkg69ywUTadGJMwErS1AX9W3WOh2MFI5dMuCpTCHw93ZecuIoYR3/1KUDn7B2D1/r/5G/sjroFgK7HWzGWyyidau5RT67k1wbyahGlPHosO1E7gipA1UuuMvDXZsLrQJmn60DgOcuAshSBXua8papscIiOK7Lfel4n6aLDymuSo2JVjnAr4fCJiYBvreqcbVDPoU319nbK+oJKxJuCVlO8CMAEqfeO3LD3CTYxE4wfdtET+R7l1WG2mYyeHKU1hiWV2HGTbeIl1rtW+HN/BAobzsOBg/e/rSlPKjtZDladusUpBN+I6p+0rdBW7yVzkJudKn/f302w8cbSrDoMq4dJjjKXT3P7OAt++1cEP0QZvMRbmWoZZJD0HLZM1jumJeuWsabSvEvvKeYTaPDrKRPF6ygGfQtg+191ZyEHud6ss7WIZUv48KAkoj4/tzCK1fR80oX3Oevv1eQdQ8RIrEjrSa5NFF89CXw+UouRSULQB0auliKFc1nquJWP9S3VrppHWNMqBg5nBeOLB+0OnHNkxYoK/aPUefSbWnQ7zlwErLa0C3rE9hIDVHtz1IQa5V1QWU6ok0wU94HI3/efk/fVKvRolv9lLA/S8WQlBt/lE8oa+B17Rgj82P0ugmxH/MHjP6Nhg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(396003)(136003)(346002)(230922051799003)(451199024)(186009)(82310400011)(1800799012)(64100799003)(36840700001)(40470700004)(46966006)(47076005)(2906002)(356005)(82740400003)(36756003)(8676002)(8936002)(5660300002)(44832011)(4326008)(41300700001)(40480700001)(36860700001)(1076003)(2616005)(478600001)(26005)(336012)(426003)(16526019)(6666004)(86362001)(7696005)(316002)(83380400001)(81166007)(6916009)(40460700003)(70586007)(70206006)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 17:21:42.0953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcec515f-c48c-4f0b-8b67-08dc02494ca3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6952

Create a static function and call platform device alloc and add device,
which will simplify handling acpi and plat device probing.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
Changes since v1:
1. Replace -1 with PLATFORM_DEVID_NONE in platform_device_alloc()
2. Add "Reviewed-by: Hans de Goede <hdegoede@redhat.com>"
Changes since v2:
1. Add "Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>"

 drivers/platform/x86/amd/hsmp.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index 1a2abe4460f9..e3354683b138 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp.c
@@ -551,6 +551,21 @@ static struct platform_driver amd_hsmp_driver = {
 
 static struct platform_device *amd_hsmp_platdev;
 
+static int hsmp_plat_dev_register(void)
+{
+	int ret;
+
+	amd_hsmp_platdev = platform_device_alloc(DRIVER_NAME, PLATFORM_DEVID_NONE);
+	if (!amd_hsmp_platdev)
+		return -ENOMEM;
+
+	ret = platform_device_add(amd_hsmp_platdev);
+	if (ret)
+		platform_device_put(amd_hsmp_platdev);
+
+	return ret;
+}
+
 static int __init hsmp_plt_init(void)
 {
 	int ret = -ENODEV;
@@ -573,22 +588,10 @@ static int __init hsmp_plt_init(void)
 	if (ret)
 		return ret;
 
-	amd_hsmp_platdev = platform_device_alloc(DRIVER_NAME, PLATFORM_DEVID_NONE);
-	if (!amd_hsmp_platdev) {
-		ret = -ENOMEM;
-		goto drv_unregister;
-	}
-
-	ret = platform_device_add(amd_hsmp_platdev);
-	if (ret) {
-		platform_device_put(amd_hsmp_platdev);
-		goto drv_unregister;
-	}
-
-	return 0;
+	ret = hsmp_plat_dev_register();
+	if (ret)
+		platform_driver_unregister(&amd_hsmp_driver);
 
-drv_unregister:
-	platform_driver_unregister(&amd_hsmp_driver);
 	return ret;
 }
 
-- 
2.25.1

