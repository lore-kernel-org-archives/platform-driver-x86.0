Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E6015B1
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jan 2024 02:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rbfJonn4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVV3wm8cF/ItpTOP5h/rMOD4Oe7+vdj2mymToG1Y2L6NKZr5wZbNXXi8scSnhHmtpgfbRYHV+/8GxOaILmiXo1w+bh1l9JCikspZpyAcM1JlytLRQTe7adI6vaF4K4p1uodU25cr0XFqGlObIyjePG5ofgG4eoIC+KadKNRWKuWIHrJ/8g9R03xf1dvS0jpD/fpOhLFmM5D5v0rxHUD6dKsHxqSP6V7Ml4z3Bl3BjGu0qjPQB8eGFNQ7fnPiEnIX6nxCvStX4gNyJDPrHx9z52xTp9bqV376y1lzVUvRfgf5dJs46dlFUnXa3iiqTYY2xUmbDhXfNMqZWP22Ck+eXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TV7M241vojAtARgXeV6Ykw78so8GviOTVDdgifFYKWE=;
 b=N0ALSM4Erq0vl21uI+DWOZlrELXa19JNmhfgc7FpMSQHGtX5QneSHL7Bs42wNZTjhXe4kYxx9V7t0CI2XT86mP/8v1NhrbZA8mL5MVmT/xb1UrGUPNYa/RwiMYdl96kx53uPpJ5SF5Ls5RipnUUwLC3nsg5ooD6m1mfrCfBJJc80KWlvkz4vHaA1FpFGCx4lIq1iOaBLWcPY7L4kcPtZHmyU8ejF8OxJU1gWslvFts4ZJ7G88WQztLOHeVVGuCK5lHIuieat7tIfITjg+xNXrfpP/bJDIK7FzfHk4vi8edHfwP+Ndz7gTwiAutUlnhjc+dPDDIvVg2RzitM7RcJh5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TV7M241vojAtARgXeV6Ykw78so8GviOTVDdgifFYKWE=;
 b=rbfJonn4hdUGqOPE6ZLA7Fg7GD3UlEmDrjkvhIK7c7PCjvF9DLQn/UGQUBAbpehyY2z/Z8nfmZN/D3OcYojDoIH+VvNv5VwT4qeLVR/NUIEen93GH0QyOQz9xbaQzGvImiiiIrze4rovp9MrIJzSwLXCb4gGtcKDGn94Q09b/Nw=
Received: from SA9PR13CA0108.namprd13.prod.outlook.com (2603:10b6:806:24::23)
 by SA1PR12MB7365.namprd12.prod.outlook.com (2603:10b6:806:2ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.18; Sat, 6 Jan
 2024 02:26:12 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:806:24:cafe::ac) by SA9PR13CA0108.outlook.office365.com
 (2603:10b6:806:24::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.9 via Frontend
 Transport; Sat, 6 Jan 2024 02:26:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Sat, 6 Jan 2024 02:26:12 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 5 Jan
 2024 20:26:10 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v5 03/11] platform/x86/amd/hsmp: Create static func to handle platdev
Date: Sat, 6 Jan 2024 02:25:24 +0000
Message-ID: <20240106022532.1746932-3-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240106022532.1746932-1-suma.hegde@amd.com>
References: <20240106022532.1746932-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|SA1PR12MB7365:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ea2a81d-7e53-48cf-a888-08dc0e5eda0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b2hkK0i4dblQCMSjoE37KgMwjmCJd1hY+LUivteY3raDxkq43v3gODTv53SX5Z8++Dho62bcdQr0qS2vPyBZuToJ1hB4FrS2pjMhlRme7ab58c7pL644lFb4vWcENLSdhlPe9FRHbumxHPpx0M9EDmkcjG+2FGkgSpxzPM5SRJpku8YkqowMdPfs9CUK6OBEQoirGL4+LeYxfm6iBm7V/nICSvmEaQDFHsKnCvN6nBgPtOUnaCI/Yp5PrqdHG33+qR1VZKu9qCWGD0L/ntEb/dOInEJizQiG//QoDEQV+XHZEAOhr4l1Zf4/uUCug1Y46J94lXSWrJiT4QAHqpaAFsDDyd2TVqyQQQFs7VyzxCN1h/Wrf7Zy972lvh+W8/jeLOOvTY7A0YkfVjO/6imj9Pp4I3ai7rp03iG4HiYztTLz8+ctiARFSAc6gY/Ps9JqVW9CGlDUdd7IsPFC9k7RoJXrm6Ja01SyHQpjaiB8EBQzGt6AdS4LFKw1NFMVU3BBZCc7HOyFrf3HkzoT2N4Fls0c0nDAmIQhwpqV8nzO4C7xuKHFXbzCKevZxQn+9AkX8OPYs8DkNtcr7myi8MdsXFAuMQw2OXB9Kfn6gZxwSxeVcng+PjvLT3FyhNV8dJSMfAccB/brLCsyqDppXG2kxznPhMO4UIV1ZAxM1hVF60dxIQbRNNfVF6XHSZTls9YN4oE1aHqRjdJlVG4FQvd455ZwVFvGQkgdjhWRjvLelu5qBqVKYnVuVpJapFQV+MZ1bvK0YQeGyZ0KTWZBG3infw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(396003)(39860400002)(346002)(230922051799003)(451199024)(1800799012)(82310400011)(64100799003)(186009)(36840700001)(46966006)(40470700004)(336012)(426003)(1076003)(2616005)(26005)(7696005)(478600001)(6666004)(47076005)(83380400001)(16526019)(5660300002)(2906002)(41300700001)(70206006)(70586007)(54906003)(316002)(6916009)(8936002)(44832011)(8676002)(4326008)(82740400003)(36860700001)(36756003)(86362001)(356005)(81166007)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2024 02:26:12.6651
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ea2a81d-7e53-48cf-a888-08dc0e5eda0c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7365

Create a static function and call platform device alloc and add device,
which will simplify handling acpi and plat device probing.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
Changes since v4:
None
Changes since v3:
None
Changes since v2:
1. Add "Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>"
Changes since v1:
1. Replace -1 with PLATFORM_DEVID_NONE in platform_device_alloc()
2. Add "Reviewed-by: Hans de Goede <hdegoede@redhat.com>"
 
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

