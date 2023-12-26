Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0774CB2E
	for <platform-driver-x86@vger.kernel.org>; Tue, 26 Dec 2023 08:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0MtO3dJK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jv4OGsmBHEKoNDYSg9OQ03fHOV2y3ncaZN01ZtYM0S+hQ8DzHehIUn47+j8XEcJ68CNtt3QNtSm27rj0TwWI0AGrcUG8N/KQc+vC2oWT0yrYYV1O5BQOeeB3ZGlEoxHL+y/xohzHgp7pVBQw9OvEqRwjxlRvv5W9zkjndNd09a2xz2nfm1vCee+MRZ6YmtuV56dhbWuNjp74RXdX7H92ehQC/Nt9vRk1oKbKdfi2IHSDDMmETFhg1bG6rmCXeO0RET63eo6AA8wc/42Lu5ldysrp/PyyNb3Och60H2qhlNN+vQJDivLjOaiR6naNhdRzSbW70SE9ukzGcgpQlGz+PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DmLD0ugfoqqOpQ8yTaQfJ0XRZhBT6+gCCyHnJ4bNmnA=;
 b=IOhqwTVJrUp8VUax81xh/PUadQYr35u48Td3rVwLoHh+2cbhR9AZODOk1FsVxr/aPTXn/8+GZ6NdEZQcCPRzCvKxcFk1ickWGNcld+pQKWiI7uNCMBGiQ/dHL1Va0XoXn1h+m6aEsyQ2uhKlC9+4KccaFvj/zNAeXSsMuI8Fw5kjppq2GchIvjvop4qRtSjJAzC8HLOkUnmMfFxSx2VVl6O2GIe/SS51t89swcPT4CbI4TmZzqVAyvTXaSYC5gBj8NqnphZyJcStgtqo26AMJEhgdbXQx15B05ZwF9NsQ2XNkuWBug02sEcEgdlR2cvtPmQlNI/VhHCNYkp7FzzEJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DmLD0ugfoqqOpQ8yTaQfJ0XRZhBT6+gCCyHnJ4bNmnA=;
 b=0MtO3dJKmaGdGmMUSls7lNoWzLbxusO0+i5Ogq5N4h3pT/COZ4wAFiO9xEyZCr7qdqL3UHQGVMrGtKEI911bGPauoqENaBAhMolZgr0CJpS0J5xQ0DB+NUiAI2eDX0GkwnW9CX/aBI1hGhq6NQJqc8sk0VZpd7j0J0rOfTkOqpg=
Received: from MN2PR04CA0005.namprd04.prod.outlook.com (2603:10b6:208:d4::18)
 by SA3PR12MB9092.namprd12.prod.outlook.com (2603:10b6:806:37f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.26; Tue, 26 Dec
 2023 08:20:46 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:208:d4:cafe::66) by MN2PR04CA0005.outlook.office365.com
 (2603:10b6:208:d4::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27 via Frontend
 Transport; Tue, 26 Dec 2023 08:20:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7135.14 via Frontend Transport; Tue, 26 Dec 2023 08:20:45 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 26 Dec
 2023 02:20:43 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<markgross@kernel.org>
CC: <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH 5/6] platform/x86/amd/pmc: Add 20h family series to STB support list
Date: Tue, 26 Dec 2023 13:50:01 +0530
Message-ID: <20231226082002.1778545-6-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|SA3PR12MB9092:EE_
X-MS-Office365-Filtering-Correlation-Id: ce767d47-a121-4f7f-c33c-08dc05eb8f54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sDMzVmy/mkA16ENGVpMywsEzXCu88A/DybhBqrvxB1gEBIPqrz/zxb67dIwuoCsZHcn5mhW5taM06QFSvHdbMIH6CjB5EHe1M009IyPV5XKxG6BeGwCy8G93SgFRIoJs94rKFLMb9D6/V+sTYXc3400iw1GJZy/l9GqfysUnYTxGtMaIzQMPU0lT0tyhxcUCi+pGrB6998p7H4+/1SycfyJG3PP66A51HHw2elgigrJBVa+KiOci8/obQUKDAMdrIKloTWmoHDeaD26OVCYglOgepusGudH/xZZyEqt0giC6jVLjW0/M2pbfUyBaU6zj2j6nj5Y22mj/VikKZF40oZ4IQzBsABcHzZQ2xR38PHp59Zdfil+2K/KMo1jwzGSM0XO1ByW6Sn/aXhCUx441aJwGRh+GTVh33RLyNEh22kjLeWwVvxAyceqPI57UX4KtZ6AJPtvlGIgE0ZKERAnPE178MGhWrSB+NDVF7fW/yRc+2xMxjh62g/hiAUzsxD69v3c9zFKep/ifANbC8kuowMwDVsXFPm6C9NazFwApNz2HdIS6ZBchaPDY+mCxv+acfXhgfBNdGIQ07OFKBoQE9MifoKLMl/Qcm/H2cTjZCN5EBYGiafwtTvZ06Gvs6feRsYAp63MQM5WDei4OnvP8b3NdzJ8lu20I1ElYXPH4ZP4EIN9wv46Cywn8/PmL686LHpvw2oXOi6eVSSsXSnFlvUz4B3OgJdsnmOJNxfJ2KEXADS61FS5FNtSWBy0I43QISlaGkMvPRnrUS43rEWXMjg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(396003)(136003)(346002)(230922051799003)(451199024)(1800799012)(82310400011)(186009)(64100799003)(46966006)(40470700004)(36840700001)(47076005)(81166007)(356005)(36860700001)(41300700001)(86362001)(1076003)(26005)(336012)(426003)(16526019)(36756003)(2616005)(40480700001)(40460700003)(82740400003)(478600001)(70206006)(316002)(70586007)(6666004)(7696005)(110136005)(54906003)(8676002)(8936002)(4744005)(5660300002)(2906002)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2023 08:20:45.9605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce767d47-a121-4f7f-c33c-08dc05eb8f54
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9092

AMD newer platforms, (AMDI000A or family 20h series) also supports the STB
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

