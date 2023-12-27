Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30315238
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Dec 2023 06:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="m+dC97iI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OwDdbLEBSrBGJ92JZKXvJO0jELJTQQkSeYqiY2vvNW+kjjW7p0Ffr1DgYbYE+RZSdJL8fzB7TuNGmNmMl/F3wLG0QDv4EphYpFcgfWSe7gR3hWOl6I79vZohnURsi0wI5xhZDH8Cbs9tzvHSBNSBNAiFmw8Vk50EAuauDZUltMFTGMdaKtKQWj+niAjdyLLzquPHU9gReL8M+Nsdm4Ju0zAe/wKuSBf/bHDmUbQt0sf6P0XGQFa6OVwE7tc/CtylVqLMIypBLX+hP7M/SbdXppghUEyBkFnUhb6liEdHXM6DOwnWs/ZhVq29VpyC9t0CasoaF34R32IN8s45R8mkgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KTTOYk8Dm+5wncqplbu3BFL47K3No0SRilcjHfUr+Ak=;
 b=mRK/Czl7NEfIYaaaoBUbVin54sldNqCAMOiZSxAIu8zdUvK5H+1NuJ7O2lor+S3ixlJLBUhRyq2FZsmjUJ29DzHdrDxMtABXBcqZtvbe23en1fXrNo5px98bmnGvPMIIGbc+2qyZNkBwAa05zJtKQNyIOQijI8z/ytzSTtXB0RFrS8jAII+BAg64fdW1wxhoVcnZYnJYG8GlneXZXLQnr6duhju9pKQ7fVhha+BO+UKoJfQtog1ebdBVQQ7ab2X6FWwZwHX05wdrXgJv/HVKYQFxkLbrGS5GMQ8VvXEpzq2F7gfvTM2xzwOHfS0oT5LMq78q6lIg4SriJ5hnR2Dqdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTTOYk8Dm+5wncqplbu3BFL47K3No0SRilcjHfUr+Ak=;
 b=m+dC97iIY2uuN0enIkP5yKXAJt3/sC+GqBxU+HrJ/QaoZSwEUWyQmxiCPGCcCRa9O8dFraciwqxCJSiaXbeTofycoXY/d2qG4/UL6q4LW8fO3CJyesv3Cx71N+BBMYWd8HFPZigrHm4sWahn3mx60LCFl4FFkBa8hd+qhiCO7qc=
Received: from MN2PR20CA0005.namprd20.prod.outlook.com (2603:10b6:208:e8::18)
 by CH3PR12MB9169.namprd12.prod.outlook.com (2603:10b6:610:1a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Wed, 27 Dec
 2023 06:38:48 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:e8:cafe::f4) by MN2PR20CA0005.outlook.office365.com
 (2603:10b6:208:e8::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27 via Frontend
 Transport; Wed, 27 Dec 2023 06:38:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7135.14 via Frontend Transport; Wed, 27 Dec 2023 06:38:48 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 27 Dec
 2023 00:38:45 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<markgross@kernel.org>
CC: <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH RESEND 5/6] platform/x86/amd/pmc: Add 1Ah family series to STB support list
Date: Wed, 27 Dec 2023 12:07:48 +0530
Message-ID: <20231227063749.1780900-6-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|CH3PR12MB9169:EE_
X-MS-Office365-Filtering-Correlation-Id: 13af2586-5c7c-415d-18af-08dc06a67b4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N265lR1hD69PFGFr/BIPOMgo5vWPDCjh11+ZAKEK9u0Aq76ScKIYnwKDyMbXnPm2bMC1sPVbFUvT91QdlXSItzn1/qBKZSw2mLORYjYeTX/OzRS2L5ygqYQO7JiGGTCviLLZo8XVf+CKS2i5GoCqJAshrnJcWDXy2L6CivKp043IBUfrm9D45GurvoYwVEgiwqMI0NSdna5WCoC9Q31sQw8CKxXZqnzkyhuFk2X6cRbF6t4CieBLOZ3T56TyrMq0s+TwBNDuCF1BTRr2njJLeWEMviYw+uMMKhdELARnl991Uct1rBLpJVZRnZmmOT1UhUCkRKNtWtn1cwY8x+x1tcfwNk2zquoP/s2Cz1FMjYjvMyO5NgpBfRXN+moUXjGXGT8BcsvdL54P/QCyqzdACxkz4t05tdqu5wTwJ162NsNSYgPfeZRC1zZ1HdAqezCcGo0/MYUui80jVNhTSLP8M1qOu1nivoopI2UjDRWlZYI1z6aO0rt2QE3oMp36TCT736aAiIeu6p0eIaYiESz/5O1LJw99lUIv4RkA7GE0yGvvGB4UxbgcyaMpO4EScGo30uUrbNHQln1UVdIwfXGCiSSIX+gewbJe20FhbFhJd4CxGwt615zv+GRyYRjRCXDJFcOwARPUE21B8eIsNGVLvvmQGUNg4FFzcDB7aevj91xi6TOATvOYU4b1Pja0eAP5oqigcnmWIE3FrCVHepLXfW77CA5IPw4ssQIdtNGQzcQ1HZ2uqkzanBrRTJ98s2orZdsX5QgcqRWaVjxHTykjbA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(39860400002)(396003)(376002)(230922051799003)(1800799012)(451199024)(82310400011)(64100799003)(186009)(46966006)(40470700004)(36840700001)(41300700001)(47076005)(2616005)(356005)(26005)(1076003)(81166007)(82740400003)(36860700001)(316002)(4326008)(54906003)(110136005)(336012)(16526019)(8936002)(426003)(8676002)(5660300002)(4744005)(2906002)(478600001)(70206006)(70586007)(7696005)(86362001)(36756003)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2023 06:38:48.2155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13af2586-5c7c-415d-18af-08dc06a67b4b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9169

AMD newer platforms, (AMDI000A or family 1Ah series) also supports the STB
functionality. Add this to amd_pmc_is_stb_supported().

Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 60c95ba5a831..c8d86dd392ce 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -637,6 +637,7 @@ static bool amd_pmc_is_stb_supported(struct amd_pmc_dev *dev)
 	case AMD_CPU_ID_YC:
 	case AMD_CPU_ID_CB:
 	case AMD_CPU_ID_PS:
+	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
 		return true;
 	default:
 		return false;
-- 
2.25.1

