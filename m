Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2055.outbound.protection.outlook.com [40.107.212.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1F54CB2C
	for <platform-driver-x86@vger.kernel.org>; Tue, 26 Dec 2023 08:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZUCuRGJK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E+bTPi3ikeUfNrhKvH7ZuAwSAHIP015TigsgkDyBkwFE1bCo8ceYF9vM2vONwaWSfnYViFZ011vlDbnwgqpJLRZwoEUgG6PLs6oDjfdl2JuqZyb4El0Gy2I6051uFbk4p4+3ixBtO3OY6o1TrOpYpqN3KxvWa5IWhCMiwtZ5PRRFZu/tLhOdKlibMFO2rWsjeIA9kf84ncQo/lzy4CrnJaEM13C0CR+hyhsFS+QYdOoWTf8nn5HlZDl7Cm9TdBouSoaask5woeilWfx9Rljhl5FtrG3I2O1knYs4ehR/zUOmA657C4my0xV+2QwHXnpUmE7ulZFtJT3Qtp3hEsOnhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zushPsj2sWQg4O6tqMGCAFl96bYCh/3c0Bz4A98xDUA=;
 b=CsLsuoMdLndw+iPv2CBJ+c1lQ2hrnQZuNOlksXzt5SuRpwYEPSMB+sr1UYA/AJN4qEgNmG0opehjgf5W9HGzM5RfQ8LeRgdVAhYkWGYJWjBRIuaMVl4P19Mob6ZZ0WRUvqpwZFNhA0lEmW5QhfH8XosBJbjZDxsYjUADlZidrVC6qzdx5kK9r7H+VxRQUIbUuePtV82NXZoGVxJ+KA4kH+Wie72rOKfz9sugto9dKvsUr1cKcO9jgOpXWnwkfbgS/7Fx3NLi5MTXOGR7XZn+92so1S0wqhttQPtHHrq4rq56CI28K3iYmTeb7b8bXbw2I2NnEUqdW/uJerSErCGPgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zushPsj2sWQg4O6tqMGCAFl96bYCh/3c0Bz4A98xDUA=;
 b=ZUCuRGJK1yHimMH4IehbLe64Yj/aaEjNvIog3WCi4Ju3ZqcgLqd7owsUZ1syfYv0A21E6XuGCb8OxGXiWavMrd2ZOd9XRRCFICI5qwThZWPj5zRCPeoB3ZjT+uKqhyCydmqvuX65hQ8wObDYDIjGiLzP/GgCNJOd4ljtk7JZo6g=
Received: from BL0PR0102CA0025.prod.exchangelabs.com (2603:10b6:207:18::38) by
 MW4PR12MB6753.namprd12.prod.outlook.com (2603:10b6:303:1ec::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Tue, 26 Dec
 2023 08:20:39 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:207:18:cafe::86) by BL0PR0102CA0025.outlook.office365.com
 (2603:10b6:207:18::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27 via Frontend
 Transport; Tue, 26 Dec 2023 08:20:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7135.14 via Frontend Transport; Tue, 26 Dec 2023 08:20:39 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 26 Dec
 2023 02:20:36 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<markgross@kernel.org>
CC: <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH 2/6] platform/x86/amd/pmc: Add VPE information for AMDI000A platform
Date: Tue, 26 Dec 2023 13:49:58 +0530
Message-ID: <20231226082002.1778545-3-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|MW4PR12MB6753:EE_
X-MS-Office365-Filtering-Correlation-Id: fbf04d94-bc1a-4d25-951e-08dc05eb8b32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m8YaPZ5MRr+vpDrg+N4J6imRWan75Y/oUXRjA4NUwfgI/50TZrDIlZzqk3DAaUTJ01RRdO0FIOhUWqzhYwZ/NSXpH8yv02aGjpADbj+UsYv0NLLaw58Z6VeBKPiPOk5xU5jZOuXJ4qmpXph/8SAg8crSTY3PsD1UCB6InPXLbV/cPiI8nj4qIkCE2U84IszEB64npna48DQkfQ+KtSZFpLb770ir9Ha3p2sDB5e4pplBFZ28rhqm0EiSH4vHQvlxy+Mg5vMl4l+EYG657lpXlU8xdtTbLVMt9yfsy8JGC6Tw8LdAji1msm+HHsHoCmxR4uQED0Fcf1wnqFt6ewc/5JK0evCJDWxKd5SHwzYXWkoNVMZy3Vsv9E43av9G4WuZ9tImZaFShH4L2Wp+b3xGE6k4mRKa3qsMzVKr4HW1d9/GHqdoWO1r1P6r1oAx14l0cTKBMaPu1mIx5rORG+Lh17wVm1tSP42b1FxAbgA/59h/sAqOQ74Uq/J5rs34GDlBIv+1VOVso2ascEG6vYa28KBqyKadXx+u1hqb2uRLxLMJbAITudsdx8CHE2fKV2F9Imyf0UW3A6+l/zG70rQDyRNossvgCTS8RKv+aFM5vRVSeLs/KzQ4nBtL/ClRU1DF2G4uCwvEpLoFaeGTmA2aFAGVZdGGObWOvZsgmujZsOU7qBHfQ3fzBMvsbmrKr+ORHxl3eGYcCYtBsFSeIfq8WNPkC++yvGcyieXyZ0miBlxhr/Qw99jou5QcYQV0epj7GsTS2ONwQC5QvVY1R+tSBA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(451199024)(82310400011)(64100799003)(186009)(1800799012)(36840700001)(46966006)(40470700004)(40460700003)(7696005)(16526019)(336012)(426003)(26005)(1076003)(2616005)(6666004)(36860700001)(83380400001)(47076005)(5660300002)(4326008)(8676002)(2906002)(41300700001)(8936002)(478600001)(110136005)(316002)(70586007)(54906003)(70206006)(86362001)(36756003)(81166007)(82740400003)(356005)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2023 08:20:39.0256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf04d94-bc1a-4d25-951e-08dc05eb8b32
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6753

Latest AMD SoCs has VPE (Video Processing Engine) IP block and the
statistics related to this IP can be obtained as a part of metrics table
information that the PMFW propogates. Add this support for 20h family
series.

Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index bad95d3ce2a1..0511b7f3c2b7 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -155,6 +155,7 @@ static const struct amd_pmc_bit_map soc15_ip_blk[] = {
 	{"JPEG",	BIT(18)},
 	{"IPU",		BIT(19)},
 	{"UMSCH",	BIT(20)},
+	{"VPE",		BIT(21)},
 	{}
 };
 
@@ -365,6 +366,10 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
 		dev->num_ips = 21;
 		dev->s2d_msg_id = 0x85;
 		break;
+	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
+		dev->num_ips = 22;
+		dev->s2d_msg_id = 0xDE;
+		break;
 	}
 }
 
-- 
2.25.1

