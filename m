Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="h3ao1Xjt"
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1454AA0
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Dec 2023 02:38:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fKhwYrzo8FAo8y7kgvGn7ajnPIcuGz83rEql0zQt8j5a43oJdaM6YTVkQSO/yj6kAiKHPCotrkbwXIkwDVFAPkQur8/mWgh5m5OZl2/p4vUSD8vQeHBkQ2Fi5jS9NwIED4o2TFzM1EZPrdzomrYcMbKQLL1A3YHxE+pwdomhDcdH0qms57oWdjjMlAl7ntlPUQOqEQwnQeyvsIBkHZ+nstm2dU0Jq5kT6foyA+Mkp1ov53lVQTQVyqOKj0MVgAAel7dBgtXt209+ULchxz+VCVuV3zWtgSaIqON6JgaL687wyUWgxJO9V3MMBkbG54w8Q8KoHJRI9FEEobrEsn1lQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shd0/zDhJTyZvVbgs09L5nKRb3lzIDUPU8Xbl4Snxq0=;
 b=G9y8kCr7YvIS/T01MSIxdQMBRge7ZD9PMIDQ7eNria9skC8b77ADyW25O/G37t1g/ws1pBoU11FdDtWDZGGDM2kY0djSqz1Ivw9RN2F0Mbbyfsxbf/rLa/qhmqsORCP77TgKoIVglXxkCD0tnvMUDRXBPFmVWCsq7w7kafWa80XQVVcrBRdV0uZb0ms9wguFwyyBKDpAA2Ot0BZgNL2B0A+wXM1iWOq5FIuKp6ix7p6/nbvhY9AGE8LylWO4gk9CeadvEgpylYPSmZrQZL8Qx5uWLhoHWATDZAhNm7wXD0BaeT/j0ZOJ+v62A2Ca7XyUHc4ynH5D3Px1D6RRADROtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shd0/zDhJTyZvVbgs09L5nKRb3lzIDUPU8Xbl4Snxq0=;
 b=h3ao1Xjtjt0uBI4RYF6J9VtRWzGVzAXF/jFBkCNQEaFfnFMJqu49Y9n6s33i57VJhFTKhzLLBgks5ZZ8PkvbKOQy0o/gym8qOd9+TD871JU5OTEZcNs+Sgxg0jeXUUnJiXchVKK+q/bq4jXbzS5+FgI5gnUDrAlkegIP5O7RLE4=
Received: from DM5PR07CA0096.namprd07.prod.outlook.com (2603:10b6:4:ae::25) by
 DS0PR12MB8501.namprd12.prod.outlook.com (2603:10b6:8:15d::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.26; Tue, 12 Dec 2023 10:38:55 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:4:ae:cafe::e7) by DM5PR07CA0096.outlook.office365.com
 (2603:10b6:4:ae::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33 via Frontend
 Transport; Tue, 12 Dec 2023 10:38:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.26 via Frontend Transport; Tue, 12 Dec 2023 10:38:55 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 12 Dec
 2023 04:38:36 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [PATCH 3/7] platform/x86: Create static func to handle platdev
Date: Tue, 12 Dec 2023 10:36:40 +0000
Message-ID: <20231212103644.768460-4-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212103644.768460-1-suma.hegde@amd.com>
References: <20231212103644.768460-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|DS0PR12MB8501:EE_
X-MS-Office365-Filtering-Correlation-Id: d607ebfd-7839-4b7f-a09e-08dbfafe8a8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wcOyTzWNBmDJWwJ+PHlrnX4Cta9lhQxWt/O0vWZZl9NQqp3Bzh//t9plSfEx+MVO7Eo/tMHicfTA6jSbmCYompJyPOTOVCHNhreOUyxCRENSSk43EegO03ZSmVYQvjgaQGgKuNZtVLVfi9RUrQPeJUaNI/hY0mfThTlar2IGgB0OL8EIsmZ/lP/Q4/Lbvs5eDWT/HpKXfHnaWof17FXPwip/wXSeSkQ8M4AbhjOISQJ5QtVSBVbCFuIZwhJANt9IoHvR0rkLWKDwNzJLr+Txmwctbb6a5NeflGDhmmnQxQoKjJWHBteHYcgM7khscK3wuXe1vZlVAlvN4mUp8veNRJ2kRb9iY72XaMLnl2GDRs7Ehg+PEgMifrFI50AVSvBDkzAcEuzZBG6dmAbgSoRPiuwSooJ9Wyt1K9LAbhIx/+sEWy/Nz76gaCaPWkuLM0O7SFgIhIVUg/DXNvJujck9wHWrzR3hmLh86LCzYHOIrbynzPQ3mkejuhYb8op0Dhu93y1C8uqN/D9mL51x5/upl9SucgIjOGF0Ydl4NoefL4aaxEwjFEDzIrUBty7QLL6BMKsQhjQ8+tdrJUiPDKYPi2Qu5UYtHm8b/HFkbTjwRmt/HTlusWztS+Dkf9LX9Gp9v26B2zlcDJsaQHiMVCVtRQDb3YZyv0jFeYrsWh4xELFvZ2BXSXEopXkTEQ3zhNYdKvKOg0tZX9BfjiObkFClJ0y1OZv+g8N0ldLki+TiOrn3IyzOON3OxeAkP30DR0Ogpnxjju4YI/fimVFhWoc78Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(39860400002)(346002)(396003)(230922051799003)(186009)(64100799003)(82310400011)(451199024)(1800799012)(40470700004)(36840700001)(46966006)(40480700001)(40460700003)(70586007)(70206006)(6916009)(54906003)(82740400003)(81166007)(356005)(36756003)(86362001)(36860700001)(47076005)(83380400001)(426003)(16526019)(336012)(26005)(2616005)(1076003)(7696005)(2906002)(316002)(6666004)(5660300002)(4326008)(478600001)(44832011)(8936002)(8676002)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 10:38:55.5228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d607ebfd-7839-4b7f-a09e-08dbfafe8a8c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8501

Create a static function and call platform device alloc and add device,
which will simplify handling acpi and plat device probing.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Co-developed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Signed-off-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
 drivers/platform/x86/amd/hsmp.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index 62a274c84f25..f0db7a480ace 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp.c
@@ -552,6 +552,21 @@ static struct platform_driver amd_hsmp_driver = {
 
 static struct platform_device *amd_hsmp_platdev;
 
+static int hsmp_plat_dev_register(void)
+{
+	int ret;
+
+	amd_hsmp_platdev = platform_device_alloc(DRIVER_NAME, -1);
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
@@ -574,22 +589,10 @@ static int __init hsmp_plt_init(void)
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

