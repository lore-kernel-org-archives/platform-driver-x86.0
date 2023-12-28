Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2043.outbound.protection.outlook.com [40.107.102.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D4563D2
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 Dec 2023 10:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xlvrFMzj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+qVoh36I/EhjaXmt0bZU9MiiPP2nG0Yx1CTZxqFhCpzmCykY0zjU45EDnIpU1yNj9nX83Uggh0BCF4OVomnj+67tkrpda/4smaJegwSfhFjEhBRofwddbm00y1CCQUqG30TWOYUpB2aulAKCcx7NeOPNFAho0HkBCpaEAct8Nd1+HTe43i1KHFknjCHfPjo/dCfKtm/70GolA/ef7yfJ4JYA3XK3AyZNo28ouT7KaEtQHzJj94zKDhvACefj79NXeCCGAz6+SJclM0avK2izVq61fzDJ/IPz9aD+4SS/wxCePU0A/HcMv1fxeWIAQDzc0PMNO38XVp7v1xAlefftw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bg469faW58btf+fa4OKizfoZ8Lo+DN7WcmIDX1EGJPg=;
 b=iQ6ktu27zDFG1EYbv7KBsl9ReOBW9AE6mY9MLrjgtkbeK3+h/uQiKbJMenk8Ks3HzXMcKd//k+Vx/GvGOX2eENn2dOFMPnViAU5zXs6rLSeok52Q85rqdQwPASiPwoVo7CqpzF40dUeXqe1GVQzYDl9kYgY+sJ3QMI2r1gUP/Ko+l3wd0BZ9OQT8FYExQjvYeelihbohuX7W+p7r26cBsI9Z/7kjDw2XtexMaGwOLlW4EGWbB71fCCfLDLcH+uKrbmQupTWTgYiez8vTsRFeEsdXbNiwvDLpBXbKzWHsruD298slYVs5nz9DAMIPbyX5J8+EPBguJ7iGoMZVih2gjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bg469faW58btf+fa4OKizfoZ8Lo+DN7WcmIDX1EGJPg=;
 b=xlvrFMzjNbQcgghdi3KZkZnaCMkrr4Lc7Mo+zMtxKAk1lvrHXnpC/Ifqw+DYMFG1HCvEvhUK3JSpjrv4EahEJCnZPD4LahfpZTnuINHWtJyd00CrkQbogRZALsbmN0EgpjFzC6Y62qY+czxophDhU1sVlS7VgAReuH5WDq/T+60=
Received: from CY8P220CA0047.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:47::6) by
 CH0PR12MB8578.namprd12.prod.outlook.com (2603:10b6:610:18e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.20; Thu, 28 Dec
 2023 10:21:27 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:930:47:cafe::1f) by CY8P220CA0047.outlook.office365.com
 (2603:10b6:930:47::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.20 via Frontend
 Transport; Thu, 28 Dec 2023 10:21:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7135.14 via Frontend Transport; Thu, 28 Dec 2023 10:21:27 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 28 Dec
 2023 04:21:24 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<markgross@kernel.org>
CC: <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 1/6] platform/x86/amd/pmc: Send OS_HINT command for AMDI000A platform
Date: Thu, 28 Dec 2023 15:50:59 +0530
Message-ID: <20231228102104.1785383-2-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|CH0PR12MB8578:EE_
X-MS-Office365-Filtering-Correlation-Id: d69c0c82-00ed-4660-cd91-08dc078ec041
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fnAOxYba9qfPbH5OwmFPHMCnIh02QywtqDVJngcgHCNV/Rgofr7m5aTXRomGvkzCARmogZeH1CDZ8qLFYkybcS6mYWi+2z6OHUwD1PrK6pVYI4hbnzKGIaXncAS5KgGFNUH4rKYpahZEiIYeVpZghOisJwPP/jXyY2fJpYnxQDpNSWBkMshEuwBtrnxOqFm21VKPRuIznFCKZf4dXTEXUU5qQu8gNsfwhZrbKja7Mq9BhWpM6Jw9uPGMXSvaIc2UZaxJynHMrh4b9RIyW6AtjddlJm8xY7ShKCB2ky2i2dt4IGsX4ps9HjM5Pk2jqQJAffqEfs2wfQu4nCCHrlKuHzCUCTn8fVGCO2hU/+P6nl+P5hjtMTW9+LCGL5gOdz04oFLyObJmykvSA8RA8RkTdQivnRFpm+f0CBjJ0USGEf2yE4q1k/L8mKFGa8n+hLLovDcCJQJqgEU5HuQ3GC2Fxk1Nw6X9+x5D8KXk8LeL8d4fftRLO1h0duuiExLBEuRdA/40Mitwma4EkiBFWPkPXSo0x/Zm+3RtoVVH1Mh9pUuESZ6/0f7vasmTZDiG7Biv/GKs1W/7roI1gA5KEocOBaaZMxQr6j9ATuUo3mtRRURt2Dmt0C+/j9Mg1kGX18icMLyiW5rf52y2Vina4e8/D0L6QMkCm0xhl9o/5WJcajOh08rIMbnJy2ZHjr7mg2xaP9tIYMrKk5gaqX0osoqtc9AJncjfUywwob8eseuqSksiIDFkQIBT8hvIfkpRYcbdcOtcQoto+94mXn/drvkOeQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(136003)(39860400002)(346002)(230922051799003)(82310400011)(186009)(451199024)(64100799003)(1800799012)(40470700004)(36840700001)(46966006)(70206006)(70586007)(36860700001)(4326008)(110136005)(54906003)(316002)(8936002)(8676002)(2616005)(26005)(16526019)(1076003)(426003)(336012)(478600001)(47076005)(6666004)(7696005)(4744005)(5660300002)(2906002)(41300700001)(36756003)(82740400003)(81166007)(356005)(86362001)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 10:21:27.1118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d69c0c82-00ed-4660-cd91-08dc078ec041
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8578

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

