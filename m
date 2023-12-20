Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2064.outbound.protection.outlook.com [40.107.102.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69904645E
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Dec 2023 16:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="byXy2wCY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kI9k2YvpEK6yPESI94ayPIumlKOOFGPGUkBHb692ZEQeHRztq+s9pJCkQ0AEzu1N0HmIDXk/1ohA3vLxK/KoM/2MlXLyJ+GZF4SSfRKvXulFu5joS0YZOl0TjOlAJ/3XhX4DOvb9nGe7amXo/yqZuFFsgQCrRVlYgXMsPyvuRStmCNG/Gbk997CccClK/GA241/Zd3ocZ689XJk/N6j7EfE2x/jRBJDaJLDAr80QUmjbDmP2qRYsM4SyoeuexxWDubBmLS554fapX92UfBw/qkWb8fPMpegMKdcU7VxhOgetsR0A7mMP+Ln1bQBNP7WbAQxGixO9+sXZkuHzIUbX4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8TR/y8LuRdMAMCLUQH8vvX2RU+/oz23TfVXwkZ2Z+8=;
 b=nG+5HzDSFEnvogUPxTdHNyWmFGQDj6LivNJG+q0bJYFJm1hMT19f03J2NqUmdaW5bN/Mt4FXxD+IIikNN69/CjOM+m0e/0jnVDy48lEh/OF9Qh1vpQ+z6FokWyYADh+iCKOGi+Qz2TeZO3Hhp9fvoGhZ8NkwjE6MU4kJMYktiP6nmTJsDhDSCpa58VD9Pn07Lr2F9ixFy+IIiTXC+J5qJfWBqYGqvmb4a3p/wVW/u98ypIQvB5sex57qyH8nclYYfExHjWKUySqbvCMShp90WuJyNPJR4pViBMJyO4y7sORmVNCAl3aYQ1qS/Q8Xv8s+fpSHk1wk6vdLZguYt/SC1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T8TR/y8LuRdMAMCLUQH8vvX2RU+/oz23TfVXwkZ2Z+8=;
 b=byXy2wCYRwZniVQM5gnt8AEmcDBNU6JgPE/tg3JNGD1PueoojHlu2BowmlVlYtOFyYTYWU52XYv4fJlYCg9tOv3Cie6kpoJpxpgTqGt0acpFPzD7uwp8I0XdGOjeBq04Styw0V9QuXxFDWbai94znqf49e3sqUsX95cENykxNr0=
Received: from BL0PR02CA0109.namprd02.prod.outlook.com (2603:10b6:208:35::14)
 by BL0PR12MB4849.namprd12.prod.outlook.com (2603:10b6:208:1c2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 16:55:52 +0000
Received: from BL6PEPF0001AB58.namprd02.prod.outlook.com
 (2603:10b6:208:35:cafe::21) by BL0PR02CA0109.outlook.office365.com
 (2603:10b6:208:35::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38 via Frontend
 Transport; Wed, 20 Dec 2023 16:55:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB58.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Wed, 20 Dec 2023 16:55:52 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 20 Dec
 2023 10:55:50 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v2 3/7] platform/x86: Create static func to handle platdev
Date: Wed, 20 Dec 2023 16:55:24 +0000
Message-ID: <20231220165528.1351200-4-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231220165528.1351200-1-suma.hegde@amd.com>
References: <20231220165528.1351200-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB58:EE_|BL0PR12MB4849:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d07ed89-2a19-4597-c7b0-08dc017c8672
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rSW0ilyLI/nzksk0nURItGofgObOiNQXf8oEdNaSDJZ/HOZzMqY5P7EgvfhX/V0KtHkcLvnKhxr0H1QYUF9BT1t7KccoUcmHiP/Jf/bSZCioFjQQIoThZ2FKk2Pt85UpbOXTZ3T9ldZaKdoUgveaQ+tvpk/rbjl8RlFrQRzCm6PFZ8kFZ3pqXkbBJ53zwjq0Xgsb6QTNUaWB+1MSzo5Nk394Wb7oHlB75v1Pqx5otb4iAmLAk8HL8p8RbRCjXUPD/9RceP0rz/UAmp8BlGkk3GF7u/X+ZeN8gsEaYmsMRxfQcXx5DGPR/8zmzwHHg9GHhMGyk5zJtruSaDWWQLMYEkl82kLJ4iBDrFcDBhd+H44OGG306LB5/GOFOsjflOse+Q/wXLhR6oFdID+A1KTrFFJppJosItiLYeP6js0eP19rBFRWAFvrZol9CqcH4HXZsthq8neQzQ/tc0J4D61xB60l0oI2UxX6he/89nwAHEV8GFR+T9v0x7y3GO6BndPacJjm5iDPDr7sQmBnIbdwhbljTxVV9cXzEbYx/dhbhqQ1kpK83oq86GUB7WuPbgWomWNNVfp31Yieffyi0zJIGN2npzjCLhnsBCxwc7Iry4rEF0TNXT+/hyN4pDClyBqW3QV5hfsfLttbseOUua3cXWc5KbP39CiwSLGFMRnv8EoC1C+5MNwZwmplIojYFs5nzu1+n0Vzmzsw0I3HSRSZxQD+J3UfZucIUaVe/0xPLwEoqwvk5gRUWjzP+tUv5VAeY3gv3ZdXuvn2DK4X3885Wg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(396003)(136003)(346002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(82310400011)(46966006)(40470700004)(36840700001)(40480700001)(36860700001)(356005)(47076005)(40460700003)(426003)(16526019)(83380400001)(336012)(2616005)(1076003)(26005)(86362001)(36756003)(82740400003)(81166007)(478600001)(44832011)(6666004)(316002)(7696005)(6916009)(54906003)(70586007)(70206006)(4326008)(8676002)(8936002)(5660300002)(2906002)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 16:55:52.2540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d07ed89-2a19-4597-c7b0-08dc017c8672
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB58.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4849

Create a static function and call platform device alloc and add device,
which will simplify handling acpi and plat device probing.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Changes since v1:
1. Replace -1 with PLATFORM_DEVID_NONE in platform_device_alloc()
2. Add "Reviewed-by: Hans de Goede <hdegoede@redhat.com>"

---
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

