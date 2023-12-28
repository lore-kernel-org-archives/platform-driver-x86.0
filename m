Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B536E6AA8
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 Dec 2023 10:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cR/dMO1N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nztWS2wUa80c0si4B/+bPXZWWCRZrm0RvcZEv0xH2GKLXEGNZvbIGDC8B+s5EpOL8mI0vVexGmd1EA8hbwc6Kps9iDpIZmCJ2IhT1VX1CBv+tbMnXFvJqQpi90675CAs9JFqFBEWAf3Xe/UH2tCHjQXqG5uc0VywMhlNmvee+Zx4daRzfZJ31yqAWyiczSbQSwKWOaXbhoNhuZ2ZNlxGS1ncnCWGc6M8JmckB1zO65xmgrz/ZLoScFqunCIo+vVMnb0i/ikCIyTAP7mQYnomJbRe89WD70OGtz0f8+zOzuFYPmY3CxHemA1jCJNK4sBTlFfb8fskvO4+8CLlGZdjDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDyYfdyuGZ21tKjcNXaoysltdkNhcUEgl6Udq+BQMCg=;
 b=ZMdG6ZIvgCfKdslatZ2+aBNWY3fJnM1aZ4ziEuIEnBAZKsB+I7rEQxw/pN8Xm4sgJR4y17WXuQt7cj/jhjnU6fjGNHpgMf7cROcX3p7FOvA5Nzqo0YCGAfNX44LjkQtHJSAQozAcsB0zJt+Oi2mh4JD3ICzWKVE4R3LLui3hXqoalPR9sv3QJ3KgL+gZdDdlSoN1Q3No0/OMldmwZAG0SxwF0bf7PiZ0D7NPEiFDhKbSkTmkUaoQUaf8qXh88bl/dV12nuIbaksX6lkmcVifezi8yEVZ2WpeKD4fvh6p2J+6TIOZt05TlEplZNA6EfX/jXa3RbDVIWNczFeXUVYuRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDyYfdyuGZ21tKjcNXaoysltdkNhcUEgl6Udq+BQMCg=;
 b=cR/dMO1NcRIK4/JpjcD54c0uK+CnYQ+THOMXG8CqIhJUhOSCIXeUuGsHddRzWPhrqjbdSw9Kk89cFEn/7QtjxafoJ1P6TQRKiUz9od4Xflukh4a9AORp1YbGIqg73G6MU8xb8sLC1a3X5W9qFsvejDBUrxq1z6VvLRRBDlhcGk0=
Received: from CY8P220CA0041.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:47::28)
 by CH0PR12MB5186.namprd12.prod.outlook.com (2603:10b6:610:b9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.18; Thu, 28 Dec
 2023 10:21:25 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:930:47:cafe::66) by CY8P220CA0041.outlook.office365.com
 (2603:10b6:930:47::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.20 via Frontend
 Transport; Thu, 28 Dec 2023 10:21:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7135.14 via Frontend Transport; Thu, 28 Dec 2023 10:21:24 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 28 Dec
 2023 04:21:22 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<markgross@kernel.org>
CC: <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 0/6] platform/x86/amd/pmc: Updates to amd-pmc driver
Date: Thu, 28 Dec 2023 15:50:58 +0530
Message-ID: <20231228102104.1785383-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|CH0PR12MB5186:EE_
X-MS-Office365-Filtering-Correlation-Id: af0ea120-ded9-4356-2bf7-08dc078ebedc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M6CpDYL3jQU/mAeTbTVw9V6tSozjJoeXNZ20uEqRuuuCbbABEVsiC5dQC07kbd/wdbFvuZAEKRMpjf95U2mvJ/885+54SxWlzPD1T7Q8BPK5ZytbtwOi69DfWvmYHlzwEjvc3M5F8Q0sT4CA4Y5qKVO1ec0wm1wJi7+QD7ugETGubPTuKqqzGuRHzFYKmIL1ipziMfH47IaskUyvvbndotfoVIF70HjzrAqW1o2RLlfYc7aMnnxI6A8kGtUKiiQvXPCpEJcva0zlatF7R86shH+XXgl7socCFjGzBAeWkXKM62usCw1hbwaco8/xpmFFVn4aJbeSsTnQE/wQOUqE4pFgcIWWQW0Yqc/3qUOtVf/Jjh5FvT8T7NVBzotgtgad8H/NJSjJlArM9deeYU3R94spEb0MfqxZPQOmDzLlOLkrqxYrWn+FMiqckS38grqtE7FmsBDmD3OBdsndh/5SG3mKckyolgerP7dBqBrdJ7ex++TX07R8UrB/Mjnah7dHVa1M0mfTZhbP3HFoFvhsgu+zXhoFyrvBmgFbUoNtB5lb+bl8AwYyZHExIA+EYjZHBhZWkMwQxJkLV2N7OVrCCSPJHEyvEysS0YPzVSf9jUfi47Jgco1FDncCTiaHlGbsSyFbn9kWXbkuQErtG+LZjiixaGCzUkZgSocR3qQed680KfSNh65hK6Fujafis69s3U1TBsfEhpQ2yjy9HEW0z6mUmCjrnFGvV3JEjOhaRLsBlCQvuqCg0sN1Y0qD2G/7Ok0grrRQ/Fl8UzdggEm8aA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(136003)(376002)(230922051799003)(1800799012)(64100799003)(186009)(82310400011)(451199024)(40470700004)(36840700001)(46966006)(82740400003)(70206006)(110136005)(70586007)(316002)(54906003)(47076005)(356005)(81166007)(7696005)(6666004)(16526019)(83380400001)(336012)(2616005)(426003)(1076003)(26005)(15650500001)(8936002)(4744005)(8676002)(5660300002)(4326008)(478600001)(40460700003)(36860700001)(40480700001)(36756003)(2906002)(86362001)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 10:21:24.7524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af0ea120-ded9-4356-2bf7-08dc078ebedc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5186

This series is focused on adding support for AMD family 1Ah series (or 
with platforms that support AMDI000A) that adds support for s2idle, VPE
IP block information, STB and idlemask.

(Series based on 'review-hans' branch with "4fd8b09f5bc1" as the tip.)

v1->v2:
-------
- Add missing smu_msg variable to amd_pmc_dev struct

Shyam Sundar S K (6):
  platform/x86/amd/pmc: Send OS_HINT command for AMDI000A platform
  platform/x86/amd/pmc: Add VPE information for AMDI000A platform
  platform/x86/amd/pmc: call amd_pmc_get_ip_info() during driver probe
  platform/x86/amd/pmc: Add idlemask support for 1Ah family
  platform/x86/amd/pmc: Add 1Ah family series to STB support list
  platform/x86/amd/pmc: Modify SMU message port for latest AMD platform

 drivers/platform/x86/amd/pmc/pmc.c | 25 +++++++++++++++++++------
 drivers/platform/x86/amd/pmc/pmc.h |  1 +
 2 files changed, 20 insertions(+), 6 deletions(-)

-- 
2.25.1

