Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2079.outbound.protection.outlook.com [40.107.237.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E40F5392
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Dec 2023 06:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wVqGFDy/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8SgYGvE4jhre7g0Y86QeoeFBSzLz0Bys2Ovf60IDiiacKpD3/mvkkV2CjgIsTz7JSjo5xcbYpMq6WnjoLnkYmWRyJvdXeBDErc1juGFrz8XYeSnjx7llPj8JCJ+p1atO0yS9h/n2T8hqF4rmFIob67VbdPcfcvPXeJbcMIaAnIJPfuWr1elMZHHpJINpsmWE0gccXlBepyraFy2EyhDOd+CcEFiX17rSl9vpFN+vFLfdGRbMwxUKaQqYVVqx0hYzm6PMjUBdARVn6hEyOHQ6yYGxQYvkTCQPQkbPtgVJBAjoQ4vmWW2+Cdk9G98MdS1Z3zO/V0v+a530GXcDyJTIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y1KsvxaquzTNXAmDrWMjX1hX4ZkBSpIZip8WcQfbgTw=;
 b=CwxDzeUwrJiGrgcXWzo+dB0udRWVWP/X9m9JPfQdsxLa2Rd5+14h6neR8UFj1JgPzBH3XDwsY4+XXWWqV/l4zCZqy7WsqpdXb/6GeuHViAZZvN1ToRLDg50IIGEiB/FjdJG38zo77h9P9agwZp3jR1y7NkmdLMowSLB9gAQBfVTkUPPSO3SWlDcwXIVNOHo4uI/+r93PyQVvjg5Su9ZlkpqA38R+u150yhm5clN3Y/sDDR8hPFux54ForEK+Zx4gSVoZyEj0NPt/WlpShnCH2lnAtchiHE1Ydt5WGdRjMA4x2Nw2ee0hgQg8zY2p/WEFu/sUz8Y4Kp+C+qdLgl0xGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y1KsvxaquzTNXAmDrWMjX1hX4ZkBSpIZip8WcQfbgTw=;
 b=wVqGFDy/H2TrR5509RFZTPVvw6ZQnBrdSSDT9JSYjMBR6o/1Lag8lsT2S4GPfS9BYCSTwYOfG4KZsXgaMKKGSmtXDOHe2jwR7i+DO1DLEb4NJtI8zEmt4KwtdHgtV1r1rgesXC3OECMKFiWnhjV84YmiiMlW96jYbUnm70l2RAA=
Received: from MN2PR19CA0043.namprd19.prod.outlook.com (2603:10b6:208:19b::20)
 by PH7PR12MB9255.namprd12.prod.outlook.com (2603:10b6:510:30c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Wed, 27 Dec
 2023 06:38:51 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:19b:cafe::3a) by MN2PR19CA0043.outlook.office365.com
 (2603:10b6:208:19b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.18 via Frontend
 Transport; Wed, 27 Dec 2023 06:38:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7135.14 via Frontend Transport; Wed, 27 Dec 2023 06:38:50 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 27 Dec
 2023 00:38:48 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<markgross@kernel.org>
CC: <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH RESEND 6/6] platform/x86/amd/pmc: Modify SMU message port for latest AMD platform
Date: Wed, 27 Dec 2023 12:07:49 +0530
Message-ID: <20231227063749.1780900-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231227063749.1780900-1-Shyam-sundar.S-k@amd.com>
References: <20231227063749.1780900-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|PH7PR12MB9255:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b8888ea-e247-4528-2bc4-08dc06a67cb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H/TYEopl96R8BALEpY+1/pULMw+G35pZrMUy0r4NZh9HE6At80EnJuHPVtgGjWuYr2cH1oKx/oHaxVg6d7dyjTBi8hZsxrycP3wJf7WLWHWadNrYJ4EdolWKp54ojDKj7Y77rPgoa9tNXSwgnCH7sqGOnA8pkT8JPjNS2adjR8kqr/4X+QVXmm80JLNh9KR4oXa2PGEc+ARuTvKYmOtp9hTMcB4qd55a0APeBNcOZcWubvm7KpTFbP1kxXGz6LOLgh+C07L/+GCHxURw+mxxUHBCLmz5wAuoPhzQwdApt1s5/THYhHK9HDWYsLXFvy0+AY2bHURcaS8NY3tYvH5YIHXsE0Jew5wOq1G3TiRd8xPmg43+GYpzjquDS0T5NyML0+iccLw3O8mcc1mxrwc97enDH9WNpmPx2Eb6egfpH/5ggtSFQrwztKVfmaDzIWiv2/9N82epwdai5Vxwe2a/oEkWnr+EyJ/V6o7cJF+lA+H8sATKzSpxrKaB2g96yxJu0hm7GdA38sq3IjAEftsUeU4o4IeDuP6jFDjSx8gRTKaQrtaUoRSQoIlcvioksXxLyAeDfuxpgo4omw+ZTeVMKIZqkabCpAspEv5mmvj/hZEO676z5NN03dBD0aUH15GxarxesFfPA1GMVTiCFOnrG4du1lPp1KeYatJ8a2a7SBfGzrdQQsR7BMasNn0v3WdF+DYd68DeDo8y+xJiaqgXdKE6i09dMpXDpmov3wE5P6OGIaTridZGUViC6BMyjPbouzF2FnLHUqVuirUfKjLeRA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(376002)(39860400002)(230922051799003)(64100799003)(451199024)(82310400011)(186009)(1800799012)(40470700004)(36840700001)(46966006)(83380400001)(47076005)(41300700001)(2616005)(16526019)(26005)(1076003)(356005)(81166007)(82740400003)(54906003)(4326008)(316002)(36860700001)(110136005)(336012)(426003)(8676002)(5660300002)(15650500001)(2906002)(478600001)(8936002)(70206006)(70586007)(7696005)(86362001)(36756003)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2023 06:38:50.5910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b8888ea-e247-4528-2bc4-08dc06a67cb3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9255

The latest platforms use a different SMU message port(0x938) from the one
currently being used (0x538). Make code changes to adapt to this new
information.

Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

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
-- 
2.25.1

