Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3771463D1
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 Dec 2023 10:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IU296SNa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6c0upKShAU7LtX2jFcsUbw1QwDU2Z0A4WrFcf0ik0zXgZ6vBwnAfjR/iO8qXJRgpk3YMV5NgTmpZxKImkt71UneDeb7FSMZ73JR0B0iCml3Xb+bShWaWJ46MBoPEa2qS26HgVECubGmjUGQ3XrncqbDcK6ctweRjOQP5snwV05b14qpdB0JleHHyGrYgodrFtO4fMqa9KWzdYz5vYurXqVHw9LmYg6vQ9fqDvAADqplfhcSL7DFZ4x9cYmtrIaOQ0os/jPe0jN6Ywz8yxK/3Ocy8u1lluOeQIshv6TfJNWBGSldFPxTI5jlO8sK8ZmRK3QGjX4z1A19ZntUWdKZjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FkXhISlrfU/yD6o1HneCfy5VRWowgObVDV/UijCzq9M=;
 b=A0c49ngpTRBNj23OSr8AaGAR8iW55O68iqulEkG3d9H5sVDajTp/+/mvWaf1wQ9qx1pmJz6PiaU2+Q7o3oDeWYgSHr80aunBYk7z2gFSd8N2Sjg3XFet/QP0AdNWWnrkAKPNd+z6WNgfPu7mCND87isFN82rWWOzDehFxzcGS/hrHkZJM3dcPFrT6+I38U2XLwtcoY1wdWLXONJ29k8Iw3GA0iqh+jyV3GoUN3UegaksBXHPdt+SI9Akno8oriOtdBZkkRAnwODBTmCTpTgvYj9zDHSPLOeqRjD0luAW12ctiL5tAp0RxE4ERx4KIpVOEONusjLwtw91qF0RnL0m7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FkXhISlrfU/yD6o1HneCfy5VRWowgObVDV/UijCzq9M=;
 b=IU296SNaUhcr+u/weXa9jZMFG1oiT1eIdXe8xRHNzctH+eePPGPMPgXX8/e83viBYaWizFgP5vYPHHLvf45M7NODVFFzDN96tBp6NVPTVKzf86k5hqu0hyf5jWX7C2aqenxcUNNXpWc/ksU7l30eV1ofCAdjFHg21tsd13k5y7c=
Received: from DS7PR03CA0006.namprd03.prod.outlook.com (2603:10b6:5:3b8::11)
 by PH7PR12MB7818.namprd12.prod.outlook.com (2603:10b6:510:269::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Thu, 28 Dec
 2023 10:21:39 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com
 (2603:10b6:5:3b8:cafe::b3) by DS7PR03CA0006.outlook.office365.com
 (2603:10b6:5:3b8::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.18 via Frontend
 Transport; Thu, 28 Dec 2023 10:21:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7135.14 via Frontend Transport; Thu, 28 Dec 2023 10:21:38 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 28 Dec
 2023 04:21:36 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<markgross@kernel.org>
CC: <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 6/6] platform/x86/amd/pmc: Modify SMU message port for latest AMD platform
Date: Thu, 28 Dec 2023 15:51:04 +0530
Message-ID: <20231228102104.1785383-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231228102104.1785383-1-Shyam-sundar.S-k@amd.com>
References: <20231228102104.1785383-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|PH7PR12MB7818:EE_
X-MS-Office365-Filtering-Correlation-Id: 3988ac1a-a375-4ff2-87e3-08dc078ec725
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wANpakUt4zBkfIS/HcYidyALThU3DuV+RTksSw8YHK4zYFbzivyqL4qaFDBakgDsa6aMRQfCgtmZxP5+RLRBSSgrcUxq+8dhOQ9+Y6GU8FCAZ3n3NagZDeQiAs0Iwr/r4YRQtKX7nNEXvy+MAv7LpPt2f651UquRmsIcuQ3yOqKwcrpZaGjxEeViGLxfTP/zV8Fx6Kk0aYBLU5VJqF5GMBt8DI/+BceBW6SHW9AIHXmawQq2MnYFq3JH6fzgchA3X/LsUGsQrmx0U2Pfdksh1G+xDdjTh1BcOl5HC/lpZt5LPbznVZPSXCRCe/bT+AYG8sR3jb61sbvJmh01ek7L7jDcBDnWBm2qCpBN8oz4cT8RTeKOLN2IOzDlQvO4O/Dz6imvlFrGivK2Kz4hkmEf5k1npdDdZ5H0N8WutK5mlwrKXL73djhrKPXyt1XPGbHgdekzP75lMB7JO4kcxmpR6qdr3yxFcxk3nEq51LYFhsJOslQxb2dpkO58FiJBYQAH1MuAP9pnCDgEzNqUU9/bv6/iu2whuwqTAipObfd5e4gYFyoAgjZmcgiU3RjXAEEe0ev+gauFcvm6wdWM0tXfkay7/K8Rl9wmgSIpe3B2O1ok+zdKfK9wiFDZtW++zwvhbi6cPFVjo3mpXe/yiwvJPsQKtbtm6TswQYgCYCgBhqGlNTERs1cxkfR76BEvZTx19Eh4zOz3noOuSKq0/QaJkZ7UYZEL40XSi0uTtM1N7AKnyPDSQp0JemDHl5ARfHbrHART6Q/4Fa+BFgXcmiI9RA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(136003)(39860400002)(376002)(230922051799003)(451199024)(82310400011)(186009)(64100799003)(1800799012)(40470700004)(36840700001)(46966006)(110136005)(54906003)(70206006)(70586007)(7696005)(478600001)(6666004)(16526019)(36756003)(336012)(426003)(2616005)(83380400001)(26005)(1076003)(4326008)(86362001)(82740400003)(5660300002)(15650500001)(356005)(2906002)(81166007)(41300700001)(316002)(8676002)(8936002)(47076005)(40460700003)(36860700001)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 10:21:38.6550
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3988ac1a-a375-4ff2-87e3-08dc078ec725
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7818

The latest platforms use a different SMU message port(0x938) from the one
currently being used (0x538). Make code changes to adapt to this new
information.

Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 8 +++++---
 drivers/platform/x86/amd/pmc/pmc.h | 1 +
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index c8d86dd392ce..acac2a4194d4 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -31,7 +31,6 @@
 #include "pmc.h"
 
 /* SMU communication registers */
-#define AMD_PMC_REGISTER_MESSAGE	0x538
 #define AMD_PMC_REGISTER_RESPONSE	0x980
 #define AMD_PMC_REGISTER_ARGUMENT	0x9BC
 
@@ -362,14 +361,17 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
 	case AMD_CPU_ID_CB:
 		dev->num_ips = 12;
 		dev->s2d_msg_id = 0xBE;
+		dev->smu_msg = 0x538;
 		break;
 	case AMD_CPU_ID_PS:
 		dev->num_ips = 21;
 		dev->s2d_msg_id = 0x85;
+		dev->smu_msg = 0x538;
 		break;
 	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
 		dev->num_ips = 22;
 		dev->s2d_msg_id = 0xDE;
+		dev->smu_msg = 0x938;
 		break;
 	}
 }
@@ -673,7 +675,7 @@ static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
 		argument = AMD_S2D_REGISTER_ARGUMENT;
 		response = AMD_S2D_REGISTER_RESPONSE;
 	} else {
-		message = AMD_PMC_REGISTER_MESSAGE;
+		message = dev->smu_msg;
 		argument = AMD_PMC_REGISTER_ARGUMENT;
 		response = AMD_PMC_REGISTER_RESPONSE;
 	}
@@ -700,7 +702,7 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg,
 		argument = AMD_S2D_REGISTER_ARGUMENT;
 		response = AMD_S2D_REGISTER_RESPONSE;
 	} else {
-		message = AMD_PMC_REGISTER_MESSAGE;
+		message = dev->smu_msg;
 		argument = AMD_PMC_REGISTER_ARGUMENT;
 		response = AMD_PMC_REGISTER_RESPONSE;
 	}
diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
index c27bd6a5642f..e5b25d27ad78 100644
--- a/drivers/platform/x86/amd/pmc/pmc.h
+++ b/drivers/platform/x86/amd/pmc/pmc.h
@@ -26,6 +26,7 @@ struct amd_pmc_dev {
 	u32 dram_size;
 	u32 num_ips;
 	u32 s2d_msg_id;
+	u32 smu_msg;
 /* SMU version information */
 	u8 smu_program;
 	u8 major;
-- 
2.25.1

