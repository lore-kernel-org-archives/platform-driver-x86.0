Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2072.outbound.protection.outlook.com [40.107.100.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B5863D1
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 Dec 2023 10:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cw8ac9pK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5Idvv2AW9yuvTm6fe7nlGLYVjU89HbgEIbSYk3Vg2kNHsBCNx1lM5O3aMZeQvu/PyB0OJ0KECdSK62VAnLq6Er1hyLZG/4Ok6PVFGeG7OUs/f2dFWxrCsCyco5RjfpjzTbf+vyTD1et6gK+meLslnbZbXWarI7eJOG7UpJQC0tcss3wnozUYtippFQkX0QGaaklrM/B50InrUwVHiTtHA/Fp0MMsQjxJ0YFmygmXx37AEn4gnh5ZyGCbMvmlEzEkM8JfrAHSeyKt+4u+Uq4PgDSfUvs9A25X2pMMoMmW+faaFJqB/2TDXopnzuLtMht5dgEGDI+XY9yg75d+8/YMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KTTOYk8Dm+5wncqplbu3BFL47K3No0SRilcjHfUr+Ak=;
 b=cqraZP0bptXJrIPLzfbPVpPURFz4eiLmeeEzxwtf+6pkRXI3O/O0FTzyAuYVtg64hpbppkl+lhf2ccpJnS43lito+XrrDeeCuKLEGcbZENysbP59kDHVwblQa0wXsEMcdHYLskW8ERdH0aOlIhKSkVh2QyxgnPew5IxsxNp/cTPxnRtAwOMzo6lMWQKMb606bQEmfIol6JjvovdF5D/2CPIjOg6MTPo1op/OPCoI1tnLAhjAgQYyilCRPD6pjjcrFxN/8vwS+j6Jrz4V5fCxQ+p8GM8IQ8oZ8rv1uxoLVJsfnbdTz61Bgzx7eiBsVbdLiW+lDvJBh3/TCLU0O54VHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTTOYk8Dm+5wncqplbu3BFL47K3No0SRilcjHfUr+Ak=;
 b=cw8ac9pKtqJRXixUmy/veiKNoJLd/nxDSY7ekVaPSodWAn+PJEfIb5zLaQsa4pFyDM/aQV0IRB38mxgkuECWmoluvlEalKvlscPUgSyrwlW0kHLwpZzA0oM9JpBuIwEJNCx2WIw1Eo+vx4jvsuIgiDudfbTtWRnxqWFo9E5boV4=
Received: from CY8PR11CA0022.namprd11.prod.outlook.com (2603:10b6:930:48::6)
 by SA1PR12MB6918.namprd12.prod.outlook.com (2603:10b6:806:24d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Thu, 28 Dec
 2023 10:21:36 +0000
Received: from CY4PEPF0000FCC5.namprd03.prod.outlook.com
 (2603:10b6:930:48:cafe::b7) by CY8PR11CA0022.outlook.office365.com
 (2603:10b6:930:48::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.20 via Frontend
 Transport; Thu, 28 Dec 2023 10:21:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC5.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7135.14 via Frontend Transport; Thu, 28 Dec 2023 10:21:36 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 28 Dec
 2023 04:21:33 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<markgross@kernel.org>
CC: <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 5/6] platform/x86/amd/pmc: Add 1Ah family series to STB support list
Date: Thu, 28 Dec 2023 15:51:03 +0530
Message-ID: <20231228102104.1785383-6-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC5:EE_|SA1PR12MB6918:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e19dc49-eeed-4cf9-3c8f-08dc078ec5be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CkowkxxKZjEa9DRQ8YCsenujwEvYIaq/DIX/bullLZ9XhcrUCYWSwPkHx9OmiawoNX0fWAiDymgqFImKsQ0Q5EM1AyhQR1z+gBWzygQ11M8AMT7aIJuMIOu9eR/VNSPyq2K7oUFu6DvtjPKJ/LyuJYHz9eiMNOWTJxPLTMh3uVfko0+oTCQaSsFH+UatNC7N+nuU2TeWDwVXnlyv2xH9yo0S2gm8QOx+/s6PVaA8Qd521IGWLUZt2lSDisbYHjQSrP/9PxC4hD8yFI/VoaEne1XJxpCo2brQFJBOb+yuXktpnk6yUOTRRGGp5gEuE7SoKc5A8PK0ymYHXq/W+k9YuvtCzFZTj9jlSpe3x0WMRxFnmx31CbZkmnDL6oTMQPXiqsWJQYpBNb9jybPy2cWEifz5e/K8EqgZdQOecA214CnvN0X5zFtF3bX5IOrBhecuYCoDXI7Ui8VVIqk4uMXi3tVbIE5Tes2TkRYTMDjLj1mi/nwIbXcm7oZ+b1IYWbIWxLRDP6cKtm8MOb3RwoJel2H566qWJ5cAm/N2IRBHcziR8YYBG4ok75rkV0+/V7pW5m1LmTWki+TXZOQkxzvHM1y3S4bmAJDGvIwuWGfjdjH9Iv9Foc7zHOjNmhRk/fJ8xK4D+AbIX86XOxE/Ky+ulAVWqhBeJA9LW+8EvPUtTxAZEhzBWoaeO9neXUFyOHO8LMmQVm+IWy4DuTsPFhmH1KccBQfw4J5iJwA/TFbJbS1N9bnA2Y+VcTEU9UIK7p8loGsOlG9cALcjVDFDZRUHhw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(39860400002)(346002)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(82310400011)(46966006)(40470700004)(36840700001)(356005)(82740400003)(47076005)(81166007)(316002)(110136005)(54906003)(70206006)(6666004)(7696005)(70586007)(8936002)(4326008)(8676002)(1076003)(478600001)(2616005)(26005)(16526019)(336012)(426003)(41300700001)(2906002)(36860700001)(4744005)(5660300002)(40480700001)(40460700003)(86362001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 10:21:36.3159
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e19dc49-eeed-4cf9-3c8f-08dc078ec5be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6918

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

