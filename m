Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C545691
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Dec 2023 06:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FiPPf00I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdsrRgcWIf0LHE3aoSVo2suj/4IPAglSkrSOvucDx7zKItYhSJvGc/Pei/8giT1Hog3flShgj2nPWlLjYTPnkiPtv8yljflJkXwVN7zYq4OH8afCc8tq9wR4n87PiVbFKMqar4zqg8KvZfIndA1Y7OSM6bzZBCAvR6sMZYGNzwOAo4yy9G6w5EpC+FpsMSHcDCKMpKLf24RCypnKcVMSatTa4qxYP9YQZ9a/GsWkzdmB/fTyaBR8JUbymGlIQygCU3Jcb7OQ/d3WobW6MWpvu24n/HdoM90FJ2hC0vGElq+ntsdQr1WC0J3v9rPQ2S4thvz/sFyouy8quRPcbIwHRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HlOyaDCn0tUHElaUVODrKgaPY+p5hVkr0OsJMwm+wPQ=;
 b=lBkBazDjkaAOIUP2gCnGmIIcL70dRfg36ckzLM8xzDBGs4bT9v/lLf+Yo8gj4pdjOz2MHbq94sNEvLvzPNG3s5Iv4F0h9crg4+XUabk0kTOzdwI6DMSgeDMpL3oU+g+iJaKu0l3QNp20WB6r5h0+ARvqcp9Dz94+VHuP1L7cnJ7p/6PBcfD2quRFsgB/GzfPeLbwEqwwy0uvsSc8vJeyYNkSD+eo4jgzg0q4NMDzMyfQFrG/lXBfK+oSkpVqqMMTY0PJP/FV32xVNRt1R1MJCijoYx2UpoKOXFtZP2L0KABB/eO2bYvGLdc9N0zzWpPpp4GN3zumIx3rYzj2L5QPlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HlOyaDCn0tUHElaUVODrKgaPY+p5hVkr0OsJMwm+wPQ=;
 b=FiPPf00I9GPcfTxH3ngZdNT/TYlucYWi/KKuqpVgIDHRwsjgDTuWosAO94NNdzg+EGGSr/pWLebMYknpGm8lrW1PrmLQVnTPTCt+x3uN1yEt06A/NJ9BEtnQ8kFnxfToR3YA14ITvjEyGwuvqJAn+NooOebgwXC+RVfO/jijCGo=
Received: from MN2PR20CA0038.namprd20.prod.outlook.com (2603:10b6:208:235::7)
 by CY8PR12MB7708.namprd12.prod.outlook.com (2603:10b6:930:87::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Wed, 27 Dec
 2023 06:38:37 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:235:cafe::6) by MN2PR20CA0038.outlook.office365.com
 (2603:10b6:208:235::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27 via Frontend
 Transport; Wed, 27 Dec 2023 06:38:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7135.14 via Frontend Transport; Wed, 27 Dec 2023 06:38:36 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 27 Dec
 2023 00:38:34 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<markgross@kernel.org>
CC: <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH RESEND 0/6] platform/x86/amd/pmc: Updates to amd-pmc driver
Date: Wed, 27 Dec 2023 12:07:43 +0530
Message-ID: <20231227063749.1780900-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|CY8PR12MB7708:EE_
X-MS-Office365-Filtering-Correlation-Id: 25af638e-eb82-4d3b-0d65-08dc06a67454
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WAMZKVY1gutDGwjjnEFglG/Cskm6HfsrPITmb3Iiq+ldRknXnu0P6PMCejrhQzgxjEtA+M/GbzxiIgaJ8MhDV9MgR+2nEactOTkav4YhFI6aH3PYsNUsTpkFjD65JDs0LqRZm/BdGnRnnqUGTcUUWwyHkK9Bv7JOQiwv41bDi3wi3zDW8hWGWZolNR9zWSPoE1yG+F85h2pvyGIccSbhn2OMcQOT1PupML+8fji41oL0fcxTfzU/64Up2cG56+Kmm1DksECMNFc40KKgnkTssXpLtg/x/KH6Xotdfn67HbqY0PQR7Wgt1MUS/er4v+hh6xvWoT0mhJZEh4Xv22Bszk14zuF0cG6ecF51SXEfZwmLMNDbjPtasIEBCZv3AE0Yy1yNd4K8E06+OPdpRMUrKe9UeLq4/QNqot9lVciCtIT0pxgHBZFf3m1Ehx4jpUiHGQ9pVkjCmKqYF5mmZPz7Q3+DpF5ZqqU0ZhTIgKXQVWVIJNHBCLU6RWwrtbgRd8gawLimHvUjvXn6Sgn0rGe6BGzRkTkJp4cc71UovlpPtTIj55dh6zO2+iKV0AyTbZQ8ZOK0SgobNu12mA9e4em8SLoG9ej5aLMr9AD6oCPlU7o/iRdaZRJ/EtBPqjdKpSvvxaIhBvDRYERFgvRzDd4GUaSly0ZjqPVXgMFTew9HH1jbB8YBmIPFFJgL2KnlICNdrYroR3SIUG0nysmDRQIXxTcT2b2Ihz1bmXJ5TrR5sVpNV1gRQoeTL/mSFB3auAKwZ6se6r9C716NDp3MsPlLhw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(64100799003)(82310400011)(186009)(451199024)(1800799012)(46966006)(40470700004)(36840700001)(40480700001)(36756003)(40460700003)(6666004)(70586007)(70206006)(86362001)(7696005)(16526019)(356005)(316002)(1076003)(82740400003)(81166007)(26005)(83380400001)(47076005)(41300700001)(2616005)(15650500001)(5660300002)(4744005)(2906002)(8676002)(336012)(426003)(478600001)(8936002)(36860700001)(110136005)(4326008)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2023 06:38:36.5302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25af638e-eb82-4d3b-0d65-08dc06a67454
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7708

This series is focused on adding support for AMD family 1Ah series (or 
with platforms that support AMDI000A) that adds support for s2idle, VPE
IP block information, STB and idlemask.

(Series based on 'review-hans' branch with "4fd8b09f5bc1" as the tip.)

Shyam Sundar S K (6):
  platform/x86/amd/pmc: Send OS_HINT command for AMDI000A platform
  platform/x86/amd/pmc: Add VPE information for AMDI000A platform
  platform/x86/amd/pmc: call amd_pmc_get_ip_info() during driver probe
  platform/x86/amd/pmc: Add idlemask support for 1Ah family
  platform/x86/amd/pmc: Add 1Ah family series to STB support list
  platform/x86/amd/pmc: Modify SMU message port for latest AMD platform

 drivers/platform/x86/amd/pmc/pmc.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

-- 
2.25.1

