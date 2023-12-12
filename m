Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mZI5HexL"
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C54B5F7
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Dec 2023 07:13:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ho9DLjlHCXNbQ3LVe64DtoiWyfdehdxwD0sfki5wN0HQB+Dw7it6aFp05IkNSWgJOlmrZuaDq/frjMJSAwf3lP5aczVZopxnZlRRAVh+jaOPYFhNAVlHRof8Uxn3D9+2wSY9/DGeXCp8Um2ry0s88ODkEVw7L0txKVKefcYb78NavxwB6usOf1x4AIeVOytkoKdgO/an8nJ2ElHXqHZ4H6Z5b6a/lflhBpHgBkA84dWq0t205BwHfFuUohVYvSTYLcAfTK7kqQkHc4XdLM4Hq819LYVtZEfH/S2eVj/JbscWk+8COLS/6l2uYhSxsp4HzhBGQTrkoZXKiLYD6TL3xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=52Qp6EB7nrrdMNtAwzaTG73U7IK+GT4u0KuwGpGvI4w=;
 b=JAg3R4eaXT8u6SF2ZjMpg4AfSVubgVT65HdqIB1o9eJjMmkNLN6+dm39veL8oI0VuJzbeyVezLZOBJXDaBJXKjXga1p5Fnco1UNteTX6MJFKU8nmV0cOeK5SBPlw22V0WigtqTXKsqvRFZk4y479U1P3jEmsCqWk7tSgmd21I/CIpS/vWhOi54KYgBkUIQq6/Xa8t4Kw2+aPFpB0ph6qgkBNyGNXOfyMIHwNOlhzF7F5MhojUeRKDVt96KRgnhkTuO7reidbPOq73Z1OLzpYw+eIhAYEzdYKbf78ggs1YPlQPBlkumNEKu7LmAJz3PIwc6UyYbK3Rukpl+sDJp9MvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52Qp6EB7nrrdMNtAwzaTG73U7IK+GT4u0KuwGpGvI4w=;
 b=mZI5HexLIS/2GUG+VvAg3n1slDjQ0SqBQxpgSqpmYbzGmflLapYeWKFSq9sdHWDZOzPEOrZTm5s/YNyUAtmB++HxsEwUwXDBbZN/g4Ni19pf7VjZt+c1tXv/KH3jiJeytaZVDlAy/vsoJE0GyOaver1wzMnoqhBZGgGTRzk+s+U=
Received: from DM5PR07CA0088.namprd07.prod.outlook.com (2603:10b6:4:ae::17) by
 CH0PR12MB5121.namprd12.prod.outlook.com (2603:10b6:610:bc::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.33; Tue, 12 Dec 2023 15:13:38 +0000
Received: from DS1PEPF00017093.namprd03.prod.outlook.com
 (2603:10b6:4:ae:cafe::b5) by DM5PR07CA0088.outlook.office365.com
 (2603:10b6:4:ae::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33 via Frontend
 Transport; Tue, 12 Dec 2023 15:13:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017093.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.26 via Frontend Transport; Tue, 12 Dec 2023 15:13:38 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 12 Dec
 2023 09:13:35 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Hans de Goede <hdegoede@redhat.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>
CC: "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Goswami Sanket
	<Sanket.Goswami@amd.com>, Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 1/4] platform/x86/amd/pmc: Move platform defines to header
Date: Mon, 11 Dec 2023 22:50:03 -0600
Message-ID: <20231212045006.97581-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231212045006.97581-1-mario.limonciello@amd.com>
References: <20231212045006.97581-1-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017093:EE_|CH0PR12MB5121:EE_
X-MS-Office365-Filtering-Correlation-Id: 600f4f8b-c064-4641-af76-08dbfb24eae0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gQRIPYcpiO9GZlOK6IgyerDB4HNjFx6t49fTFG5WgAC/Rw3hGr7tuPX94eNxOegwhz3P+Hv7cItN0lUC9X4lKi0ooYN9QYPZcBQ1TGNSu+Xr7y/qu7esahMU2F63O/T8v4FraibWKrOBSHhMh6+f4tnU0f5gsvFacRSuo9cDe+fLklx93s2BQIr3p2J4wQ/lgEJl8mF4GKXL37Dp8W+vqVPnPHcAr5z3bayaUzZohcXeRb9H92IUsLpL5jmFT3npUWseGz1I5lqFzr/icvc6wBe/+YM/uFo+a7KhllogYVGrFp7Aq1woL+d43lh8LDGrgFPhCnzNoLqMnsKnTx3mCe4Mz1ru7EUG8ZcNuLiAA9YPNGX3kFwRobjhnLm0Oa/LobZIgLCLfmzGqjGeGk0aR6MQ7UaI2oBJIp/ujudiCP1a+2AH4IBbk3/LnaYRgsma1ugP7GftxJtV4GlttQGO8IFlQaYi697Pohwxgi1j8UGUGAY9kjRa/zBpNF6HOMGtFJ99DZqmFvC7i2b7BvLmWYhPtyBAZmtR8fJr09y3rvaKOYf/wW7ZEwBfiKxweC2BJ8BcYo6E278mqJsdeoitNB6ZsSRg6MGWqk15nOhMyXj2xz4QDHO0BhO1ezOwe4erabTiVOm3e6LW866F7YdrtU2OANQa4it5R8WtbErAkDHMnsI9L/gLFoG5ugCZWQl48DGd7FK29FBMiFdWuZMFT0OiHr27sOWKwZagsfjFZZQxVLvZ0faiL0Z5DYTI0HsoBwFcagCJjvh0eFJESffgdQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(396003)(39860400002)(346002)(230922051799003)(451199024)(186009)(82310400011)(64100799003)(1800799012)(40470700004)(46966006)(36840700001)(40460700003)(16526019)(426003)(83380400001)(7696005)(2616005)(1076003)(47076005)(36860700001)(8676002)(44832011)(5660300002)(8936002)(41300700001)(4326008)(2906002)(478600001)(336012)(26005)(6666004)(110136005)(316002)(54906003)(70206006)(70586007)(86362001)(36756003)(82740400003)(356005)(81166007)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 15:13:38.0263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 600f4f8b-c064-4641-af76-08dbfb24eae0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5121

The platform defines will be used by the quirks in the future,
so move them to the common header to allow use by both source
files.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 10 ----------
 drivers/platform/x86/amd/pmc/pmc.h | 11 +++++++++++
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index c3104714b480..666cc6e98267 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -91,16 +91,6 @@
 #define SMU_MSG_LOG_RESET		0x07
 #define SMU_MSG_LOG_DUMP_DATA		0x08
 #define SMU_MSG_GET_SUP_CONSTRAINTS	0x09
-/* List of supported CPU ids */
-#define AMD_CPU_ID_RV			0x15D0
-#define AMD_CPU_ID_RN			0x1630
-#define AMD_CPU_ID_PCO			AMD_CPU_ID_RV
-#define AMD_CPU_ID_CZN			AMD_CPU_ID_RN
-#define AMD_CPU_ID_YC			0x14B5
-#define AMD_CPU_ID_CB			0x14D8
-#define AMD_CPU_ID_PS			0x14E8
-#define AMD_CPU_ID_SP			0x14A4
-#define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT 0x1507
 
 #define PMC_MSG_DELAY_MIN_US		50
 #define RESPONSE_REGISTER_LOOP_MAX	20000
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index c27bd6a5642f..a85c235247d3 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -41,4 +41,15 @@ struct amd_pmc_dev {
 void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev);
 void amd_pmc_quirks_init(struct amd_pmc_dev *dev);
 
+/* List of supported CPU ids */
+#define AMD_CPU_ID_RV			0x15D0
+#define AMD_CPU_ID_RN			0x1630
+#define AMD_CPU_ID_PCO			AMD_CPU_ID_RV
+#define AMD_CPU_ID_CZN			AMD_CPU_ID_RN
+#define AMD_CPU_ID_YC			0x14B5
+#define AMD_CPU_ID_CB			0x14D8
+#define AMD_CPU_ID_PS			0x14E8
+#define AMD_CPU_ID_SP			0x14A4
+#define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT 0x1507
+
 #endif /* PMC_H */
-- 
2.34.1

