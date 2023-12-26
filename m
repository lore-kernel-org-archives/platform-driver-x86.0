Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262104CB26
	for <platform-driver-x86@vger.kernel.org>; Tue, 26 Dec 2023 08:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SXoscKjw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jdBfBF/LFSN1l/Bx3D0zdaxGyeRV2otPU+zjfpojZPtc+L6RjxoKyl7Hq8MFDDd+OBBdhLxR+lhrdN9PKGzXhD4kmKbi80zxxy5FDNloQyz8bFUpkgV5s09MstWIXamMxlCLBh1zxI8OIBid+PZ2AGSq0+a0h1OA96bfGMxMJnuBCwZBJfunM3k6ocjDfPw4yf9Rgiat7G+d51QS/0ehEnG3bV7JNJ2rLbkZWfbgv7uVkOt25U4TmCvwlUE3D83XDCmDA26BcflFoztBhTONv/rK1PrsroTGbqiFApwhmO0nMyMlYN249p4HtsmBPmW9zWSVrGaP7CJ8kjD2oMyUCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y1KsvxaquzTNXAmDrWMjX1hX4ZkBSpIZip8WcQfbgTw=;
 b=gwEPzZRPPNoV0zR7WiqFLBZpL40VtIeKjyctYJsxGGu4M2as4BwIyBt5Z+23yg8aHyDk0tXA1Srkiq2sCdOm/lNcnz/57KXsfEr4P4o+Ue+lw0dHqnh2MD9l6fRNfmt+C+2+DXgOrysp2E7Yy48XHpev7TJIkbioSzzKckK+B2B6beABzX5XsZRmsHjA/glcwNBIGED2L2U50V9oA3LPWj2JDVz3a6H7hxgYJqPs5dlO9n3p5G+3YkyhSJ6V3FzgYK7EjkIQRrgvvcEQxFc1TSpBAM1gBKN6/Uw65TMnsATPKEeSBzTnug5Oh9aAP504/6IpqIMpef44pthVgV3rCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y1KsvxaquzTNXAmDrWMjX1hX4ZkBSpIZip8WcQfbgTw=;
 b=SXoscKjw0+rp+Ff8R6acVsA3vBvolyRroJdTlavsIWrXPSl8tVtff9xTogYZi+I6DXtK4G1GbN4zIOiCtgrVIAY1+pXRWHJMOe4fWyHHuoPEosESTkn2l1Z6YRd+7kAVZb3SgR0Ism3KHjcVd+V5BQ5AChFbDxnKZwD8QUHDJmA=
Received: from MN2PR03CA0019.namprd03.prod.outlook.com (2603:10b6:208:23a::24)
 by SJ0PR12MB8140.namprd12.prod.outlook.com (2603:10b6:a03:4e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.26; Tue, 26 Dec
 2023 08:20:57 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:23a:cafe::e1) by MN2PR03CA0019.outlook.office365.com
 (2603:10b6:208:23a::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27 via Frontend
 Transport; Tue, 26 Dec 2023 08:20:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7135.14 via Frontend Transport; Tue, 26 Dec 2023 08:20:57 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 26 Dec
 2023 02:20:45 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<markgross@kernel.org>
CC: <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH 6/6] platform/x86/amd/pmc: Modify SMU message port for latest AMD platform
Date: Tue, 26 Dec 2023 13:50:02 +0530
Message-ID: <20231226082002.1778545-7-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231226082002.1778545-1-Shyam-sundar.S-k@amd.com>
References: <20231226082002.1778545-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|SJ0PR12MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: b07a280f-0923-41f4-4444-08dc05eb960c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iECGCIbHcnx9j/t7oc0UkNouJ2aTbM0DK7rvDEwpzLExvHO+ilfJdoJqxq6/FXpyITtAIDrd+YM3BJFlI+fa56b44jUECT1CaUT8JdOnVakAP8OS/UuWCPbTU7+pBlaiu5O1g9j7U3NmnKKuztSMXkbmVmckVGqu/O4AdBZzNqEYdfNTxmpGMWql4sVEBK29KdFQIwktFDL9vKX6QHXDiYJxzxNPNoCsU0f2y+Gz/I6Ui8ezLoeOfazHS8Q+T9NTwv0n+5Xfk7OZOiAmjQjHHpiRIjOl7BiYQq0d5s6bfAfMCg59wpZA8cip7yIadMOzS7lh4aPYru5oBiGr/FNMWTP6/fyH4K3r/v+gLH2Z1zHGtDW9fHxQnlgsXrjZvnGQJeLR54SSOmsMohUcBFbFmGkZgmYm0g6i8ClkqS6N1KlGCHNeKXh0nBhjJPgx/i49RAl21B+vzfUnWrz41H7dw4G4eDQas/bN8oyNy0DDB73STmGvb7NP2wq02jV0xVhPmggwu02znrNYY8UDLc4NYY3maT5K54roofOmZWnwv73pNtfr3x55Dl4GKfBybHzf1q0uuAOgBHZE+KXGabF44WvACbBKwkU8lVvXsxWYqc0pKcWeZ8rd/1Hg8KcRFRv2CohWSQiUXa+E/Pa1A7CduFTxhUWy48iy81IqIr/vSlq2bRPljdBvhcZxU2KQu7Jh6rlCmA0gzftYIoE4/xfJxjHdp8dtWpkvQq+GHzWLvo8eq6FRqz30a4KtiC2/L/HUf+iqUsp/5+iwyQJUPT8rmg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(82310400011)(451199024)(64100799003)(186009)(1800799012)(36840700001)(46966006)(40470700004)(40460700003)(16526019)(336012)(426003)(26005)(1076003)(7696005)(2616005)(6666004)(36860700001)(83380400001)(47076005)(5660300002)(15650500001)(4326008)(8676002)(41300700001)(8936002)(2906002)(478600001)(110136005)(54906003)(70206006)(70586007)(316002)(86362001)(36756003)(82740400003)(356005)(81166007)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2023 08:20:57.2295
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b07a280f-0923-41f4-4444-08dc05eb960c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8140

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

