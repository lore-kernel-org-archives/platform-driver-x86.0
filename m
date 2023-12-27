Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405C45250
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Dec 2023 06:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QhTJM8Fe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQB0FOhkpMYGpq2iqiLO0HqbL3ETtGP2Teo/v4ISP17dW3cWFw3hgaosExNqVIF2PA294s3pj4xdVtce7zjdvu5sdtP7jlo+DFWiURNN1MwGE2sYk0znoXXaKEl9YdyK2qSD9edSIZned6pf4Ctj/6bVYrHE1O7MZgFgSXum9LdfqZsceLEquNoFH/pvNmbui/3Md/L7dow7Bbce3slFP5T2ubn8W4IWYPUClvgsiv/aXMSMvHaHja6mF+ur64Jt1fiPknURjLyL+jyroyvwkqvoKaMjqSV6T19r8RPI96IN9oPLkrUBu79kkA9hQEYHCmBRFVZTzGWWlpJiDO2V0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylHz6nQALhA1TPlP3OzzG7ZVVbCtZTtOg/3ZkGxs8pM=;
 b=VZceSH84GTilJ3yOloNWMF7LZRlVAWjkkDmL70zK3jLxcd6j5iBh9K8BCJeA5gd/kLj5m0csprz88hFcak8uDX+fwjy2lKpSjLiQ8M0KqdQjbfInyIEQRtfFHHBUnhyF2qljQbmk1+xHbvUY7uE7E6htjaw1NWjWYhbnxaDDZ1caraeIFNr5K5xsv0YweFzuqOIniba8obE+uNkr3PYbw9RJ1IdV6KzQnxguVzcuZJ/xem7YiGwy+e+yg0kGNEZpHReQ9cORxUh90BouXjXXtJ3hmxo5KqSyTKLImA63fV2JETpXmSklPs9oUU6vjRmbWAJCp1PjjGsCx4U0wuQfsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylHz6nQALhA1TPlP3OzzG7ZVVbCtZTtOg/3ZkGxs8pM=;
 b=QhTJM8Fedb9sNC1vUgqeZSKSprvtM1PRqv6SgxnM5N5E7AwDdXyekDxV8pTXxTD6/RFr7AZpBz88OzgYXCQNMk9ey/npDbq2HrfSdrhfDau8NocrbdvyLwDXMPIWN2upO0MsHFLLSO302af2fvF4utWYfNQwuWGfpJcdhRFVxT8=
Received: from BL1PR13CA0339.namprd13.prod.outlook.com (2603:10b6:208:2c6::14)
 by PH7PR12MB8780.namprd12.prod.outlook.com (2603:10b6:510:26b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Wed, 27 Dec
 2023 06:38:46 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:208:2c6:cafe::5f) by BL1PR13CA0339.outlook.office365.com
 (2603:10b6:208:2c6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.19 via Frontend
 Transport; Wed, 27 Dec 2023 06:38:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7135.14 via Frontend Transport; Wed, 27 Dec 2023 06:38:45 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 27 Dec
 2023 00:38:43 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<markgross@kernel.org>
CC: <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH RESEND 4/6] platform/x86/amd/pmc: Add idlemask support for 1Ah family
Date: Wed, 27 Dec 2023 12:07:47 +0530
Message-ID: <20231227063749.1780900-5-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|PH7PR12MB8780:EE_
X-MS-Office365-Filtering-Correlation-Id: a6b6d51c-1695-42fa-3cad-08dc06a679e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LsDs8zmTFFJpLLTmSaKS78H+1qvRIjw3pG8NWucRqf3Fkj715RS+rwI5OMgn0gYBALegN6C9on2AiLVXrWLCbooqsvxzlEqEK3EGz+prohRCKV5P+5SI+Sm7hQJNMrQN/yCYvwbbqNd7RUjkNPwBv/PZhGZAhjM34rlw3T9tXfCpepx6aFPfXM1HsjQsDa21fQUvWqKCfZ9CooG0hUA81/KdzHAqBSmIIqY4BIHvmbiNYBVKTATWxRRTHvsTQoJ9gHTjYleLebWxez7AXo5j2qip5YeboH6ILlvRudSYBd7t5yKgeHhR9wezHLWPs/WPKzT/reB2VZf5eFN78j++2r2Y6FoDxXjCX7sWwNwOcKIi/+F2oudGxxH8sQW2TkzXKX0KPcvRg6OgZsvWzLu57W9iqButvrJoWH1NjEafWYTreodZXSvBSTpO2UpltjZmPqjj/5CqnTcEfRiRga0tvQcEEMBTAAr7NdOFY9fWlDd0Jezgdrr1NraimK6rhCsr1m4NhRlpxE8+u5Snp8SPUoCQrvlSR5IENw4Ihe3U1hOCNG9GlL+Z8Git+vMqubvekfHI7om8skEZz89gTfmRc/wimFmKiBgn5TvNtx2J+gFxxLMQ/faLeEvU060nAe2GyXTN/VfBwnmdMGmB5E/yA6PZRkUeLdbix3vNej7fUXYUGPMn+LZHuO+Ebp0Pic5xeoKMq8rv8Znk5/R7go2HAquWdv850U+jSonBL2ska7PUymAGBGdD0sDzdykRbUKfWH6Yj29VW6v5Iy90TT5N/A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(376002)(346002)(230922051799003)(451199024)(64100799003)(82310400011)(186009)(1800799012)(40470700004)(36840700001)(46966006)(47076005)(83380400001)(41300700001)(2616005)(82740400003)(26005)(1076003)(81166007)(356005)(316002)(4326008)(36860700001)(8676002)(110136005)(336012)(54906003)(16526019)(426003)(5660300002)(2906002)(478600001)(8936002)(70206006)(70586007)(7696005)(86362001)(36756003)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2023 06:38:45.8637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6b6d51c-1695-42fa-3cad-08dc06a679e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8780

Idlemask is an indication of each IP block current state (i.e. whether it
is running or idle) during s2idle transistion. The newer 1Ah family
supports this feature, add it to the support list.

Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 6d6e5b9e56d8..60c95ba5a831 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -38,6 +38,7 @@
 /* PMC Scratch Registers */
 #define AMD_PMC_SCRATCH_REG_CZN		0x94
 #define AMD_PMC_SCRATCH_REG_YC		0xD14
+#define AMD_PMC_SCRATCH_REG_1AH		0xF14
 
 /* STB Registers */
 #define AMD_PMC_STB_PMI_0		0x03E30600
@@ -603,6 +604,9 @@ static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
 	case AMD_CPU_ID_PS:
 		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_YC);
 		break;
+	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
+		val = amd_pmc_reg_read(pdev, AMD_PMC_SCRATCH_REG_1AH);
+		break;
 	default:
 		return -EINVAL;
 	}
-- 
2.25.1

