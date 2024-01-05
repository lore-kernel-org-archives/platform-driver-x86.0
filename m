Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2085.outbound.protection.outlook.com [40.107.95.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEAE1EB3F
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jan 2024 07:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FRKG6b/N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmaiI67mc93ojZLjKTaqBQJM1rsTPfmdwdH0+AvHGmdItDLEXgBZiy4I3cUTS4iLvfT5S770N8baolt0dAEWvj+/cRVaxGgi6RUHX61j3XtHMQ1l4lQd7yWJvoYrn5qmo9T5BxmbfKHxPDJai5W2nktBj0VNlB67P0cttctFbE9QgAh6Xyf5lzb19+3zyrsmZ6KTeYtRriA2uoxvUwkvUPSiTYjcVWu/lEJfQAumeFFlO/Szby+wsbKl1Yy5Ai3yPZ8Q2HuxNx6ZA1RR269ZiispyvMisw3cxQXqAV3yVb1XtMYe29eDAl9gGEcQA+Jas4K4Cpiia/lmvW/xvMy7Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4tY0sCp0R0ggK8B7uxA9NCnJ/FPljSpIAth0l7TaeSg=;
 b=WjeRxFeaMGdsXRhZIsNongURbx8wUdXCCbMb36mJ25PLU4jBoeB1km6/t72L118YqeZsJBXYYZbSwCgO8Ieel3bTPb0nyPmtsPxm+8kNgGp6jaDkuBQccZ9JzMWd2KkLerWsqyLn/hzQo8yRsI6+2ZxinSFc1+sRiafaiqycvStXhBwPKvHZcJFcud2Vdc6olConPHdXsf2qid/j2A5G/36xZIf31f68e0HiyCzek9SAlmjj5wYx61AhmVOOWbSyVnNEEwnuDNHmpRpqT4AbtjONkFwfX7rGhfvnpQeMDhKbo8qI4VowOBpRpR64xRvOfgmN3gCtQbxYWlln/lAjRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4tY0sCp0R0ggK8B7uxA9NCnJ/FPljSpIAth0l7TaeSg=;
 b=FRKG6b/NzeBwopc1QLdUFbe8+TxNPzkLkDJBGcqjclqLUdpe9iM0sn1DsnhR/d/uyPH3nCxPerx2g0r8HXhO0QRExnUNz/VPsBpOYpsGQtZv5VoWGmTRlpfExHd7PPzEFXumx1R7N1HyPpDaEVZIjwhW8tOJ93QX9joJBRZbMRQ=
Received: from BL1P223CA0020.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::25)
 by BL1PR12MB5255.namprd12.prod.outlook.com (2603:10b6:208:315::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16; Fri, 5 Jan
 2024 07:46:49 +0000
Received: from BL02EPF0001A0FE.namprd03.prod.outlook.com
 (2603:10b6:208:2c4:cafe::36) by BL1P223CA0020.outlook.office365.com
 (2603:10b6:208:2c4::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13 via Frontend
 Transport; Fri, 5 Jan 2024 07:46:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FE.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Fri, 5 Jan 2024 07:46:49 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 5 Jan
 2024 01:46:47 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v4 3/9] platform/x86/amd/hsmp: Create static func to handle platdev
Date: Fri, 5 Jan 2024 07:46:12 +0000
Message-ID: <20240105074618.1667898-4-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240105074618.1667898-1-suma.hegde@amd.com>
References: <20240105074618.1667898-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|BL1PR12MB5255:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ec4ce14-ce2f-4bb3-64fd-08dc0dc279b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HuotTpPscit1PWXevWM55xRb4kjcnGQEKF5CZ2nThAEZYSiOznCcCl7kS4Ghhpux3Z2ZuJgzwEYVIzAjjQ3Ovns9YiLpsDJ6tarUyDm36+smFzby0YvRZkB61Rv8z1GlsPxTbHOu9UuJqd7+2rUwYB7DA7JoRfchNTDPUMmdS45Fqlv0FKIKHhsVE+f6CEebelNglkfLAM+7zYHgGt98ujtg5khvsaBUEdQISN3MeQgUN9Qt9dNXv3HxnUvbxY7TyeqiFytc+6COqnwaWoRYefrLDodx8rJOTfqQCU7Id8pVtxopPz6WL3Saze1AadFFL3RhgwoHRTLoZaM4lQq48XwjqOtwE5bjJwIxQQA+DdB0+E4tsjUvGPs8++BDhTVMcUJC7ad5veXt4+VSYLc5YrI2Np8iRkHndWYIhmCUK3buEBKBNVpH8+E5RBY+sJGJVxAM78QmsowkAY74BH24rLgvZA1FsJPUcwlOqFBjMF2By9tC8bO67Kub/2QfSMhngwj5XMuFirsKBkxFuEez0Dx2tYfwlIvbVWdhA2kl+zZqyt/c8ICC4dCQUliwUvOBt+gbjE6w6AKZ5DyMuiVv+9r2Lyij5e/P0d6db47KamVNpP+idTA6/OGn9yGmP6TNMVLxpwiaWNIAHHSXR4SPUY9TCRrPl4j72Uby6+q9nYUOvfTEuptKAgvQYhCLna5KybN1EF4zuHFNUbBKTrLZOWUtxs2YvtX1Z6UMzQFYl7CX4N582xaVKbygS81BX8ac2V5pc0IiOpsnWIAcE0bhxA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(396003)(136003)(230922051799003)(82310400011)(186009)(64100799003)(451199024)(1800799012)(36840700001)(46966006)(40470700004)(40480700001)(36756003)(40460700003)(70586007)(7696005)(70206006)(86362001)(81166007)(336012)(356005)(2616005)(83380400001)(1076003)(26005)(47076005)(2906002)(426003)(6666004)(5660300002)(316002)(6916009)(478600001)(4326008)(44832011)(8676002)(82740400003)(36860700001)(41300700001)(54906003)(8936002)(16526019)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 07:46:49.6464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec4ce14-ce2f-4bb3-64fd-08dc0dc279b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5255

Create a static function and call platform device alloc and add device,
which will simplify handling acpi and plat device probing.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
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

