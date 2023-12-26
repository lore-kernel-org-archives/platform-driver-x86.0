Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2073.outbound.protection.outlook.com [40.107.100.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D660E4C63F
	for <platform-driver-x86@vger.kernel.org>; Tue, 26 Dec 2023 08:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wivquZIr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AaqCxT4txA2LmlkgJGMz9Kuj7zQmB2BtG26Iy5fTbuNXxjZ4Cy6Tp0P786X+TooiBIp1SGRX4W+i/3o3J/dcI4Hwdis1P7narUn6GYYaK+yFv5F51n+O+m/WT8vWZAlw5MBwCi7PwHCudaX7FeTS7T5wDfE5ThlpcV7tFyoQDdIH23Safq8V1ysQOsI/Kw7NWtCblrwPXhAC7nHeK1s7OpQdmkavced7NnBcMz7I6LpQDLrawWIM39UFuvOrCnHqyvWrelC8Uc9P+s94Vw8Rg0uZvqpNasmR1JImpeVwt0YAgplTyf+CmVM6cj9FbDwaiMjSJaaRDwR3jlR12ebMBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bg469faW58btf+fa4OKizfoZ8Lo+DN7WcmIDX1EGJPg=;
 b=C5r1JS090uJ1+335RsvA0E6k/Z/SgyKCHOwnrBwfM35zL2vysyC/WcUZtREOy16PLKp/NC56njRjx3Fo1T6WCd5PVTYebgUH8OzIVo62kDqI5VvEPDny1BvSFZSQtkwKI06yIe1u1KDbJCT7XB8MxEaesxVoux8ILCB5leIsqQIHF2UVNxw+9U+OEQ5dvBJvY2n/IfQFTj2G2b1fKXvcrAe3t5VLL9qNmF3rQmX+YWD/89F26E+8x4RzTIYLEDnX8i6oNvQHiTZ08rAZD0HoltCCpViDz6bYt2eyTVxE9Go+nhKf4rpBGbC2VQbwAsXBO6cnyHUH8VqSOQDrGb7kRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bg469faW58btf+fa4OKizfoZ8Lo+DN7WcmIDX1EGJPg=;
 b=wivquZIry8lOCiJ+sWdKnqa4xJK4p0lVidMo0LvIXS500m58eLcSgD6ISbRAT5FoaCtkSS7no5I20KtQtfxhA4W3EKXeFbmCJSIzj/VEA8JXTO2og5Timfuyq6yJshrEkRW5u741S6QfroTlnWAgS9t9k5zvZOTwjtvyEhb8Mms=
Received: from MN2PR07CA0003.namprd07.prod.outlook.com (2603:10b6:208:1a0::13)
 by SA1PR12MB8598.namprd12.prod.outlook.com (2603:10b6:806:253::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Tue, 26 Dec
 2023 08:20:36 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:1a0:cafe::bf) by MN2PR07CA0003.outlook.office365.com
 (2603:10b6:208:1a0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.26 via Frontend
 Transport; Tue, 26 Dec 2023 08:20:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7135.14 via Frontend Transport; Tue, 26 Dec 2023 08:20:36 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 26 Dec
 2023 02:20:34 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<markgross@kernel.org>
CC: <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH 1/6] platform/x86/amd/pmc: Send OS_HINT command for AMDI000A platform
Date: Tue, 26 Dec 2023 13:49:57 +0530
Message-ID: <20231226082002.1778545-2-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|SA1PR12MB8598:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c255caf-f50f-4abc-f16b-08dc05eb89cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	52KtDvD6gRixDeEkK2xZotPnMGxPIc8LtwBQ//d8aPgaLAkGx0+vNIhR0dFuUon4oeYkEhdtIYhtmamjtODGgQHFpuRW/2VtSYYKS/ea7GlW0ZUREImGpu4U+C9nva9limpCgvUiArOWFDI8SVejbazqGmw0XZV2SVbEN6UEgAlkJHtzzoTFf7WM5aj/rVUMKrJ/HPzbxSvUXO3JxclNL+d8u0h3WVJEgr7h/0DF8QIBIoVH1NbMl5rbAstoE16cQD4byQyzA9q9t4otZf+wiQxMM7ZXtnkpr3Y0w/cVuPHq6kMInZsZ6M2NXSEpkaUCA+34wWifz1QrTnGEyxBGDBYp3xbp9LTH0/U+E/zk3dUl3RKr5LOjWXLUD+lVYOUDjcpp2SfTvNMjWybLr6XtimWZRFhCfXM7GVsdGNDfd+LJgDLBdRhxxxMAmRChsfSB7M5M3eNrrXReYgh6rq9Q5ULpdDi41EFS/LIPJNgFUW6gnI5NO7I87d6tebCJWHUwDDYbEMAmHfZFSXe9ZepP2gG/V7HwOjzEzcOW+1hwJQsjrjD9RG3FCWBre8c9w9bNWYwkYofG6C5OWj7lqz4W9EDGdZpnG8GdZWE17GO/3nvs+7RSGT4tCSdyohOHbKd/2hammEpKgRTdwWgXzUq8gJc0WuuftNq/r+dkJ0jmI3cy7CcwrbW35cAnT9AjKBIy5FY/DuiWV+42Eg19hMyBLY9ZOIAfS3tdxm7lOjrqcbyoiTpnBGX63lgxV9LGyVEcPgg7N5DrKJ0L4faFMnQhmQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(39860400002)(396003)(346002)(230922051799003)(82310400011)(186009)(64100799003)(451199024)(1800799012)(36840700001)(46966006)(40470700004)(40480700001)(2906002)(70206006)(70586007)(5660300002)(40460700003)(4744005)(4326008)(8676002)(8936002)(316002)(54906003)(110136005)(41300700001)(47076005)(1076003)(7696005)(478600001)(36756003)(6666004)(2616005)(26005)(86362001)(336012)(426003)(16526019)(36860700001)(82740400003)(356005)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2023 08:20:36.6858
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c255caf-f50f-4abc-f16b-08dc05eb89cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8598

To initiate the HW deep state transistion the OS_HINT command has to be
sent the PMFW. Add this support to the platforms that has AMDI000A
support.

Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index c3104714b480..bad95d3ce2a1 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -761,6 +761,7 @@ static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
 	case AMD_CPU_ID_YC:
 	case AMD_CPU_ID_CB:
 	case AMD_CPU_ID_PS:
+	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
 		return MSG_OS_HINT_RN;
 	}
 	return -EINVAL;
-- 
2.25.1

