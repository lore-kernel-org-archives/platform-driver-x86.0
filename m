Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD65E63D1
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 Dec 2023 10:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="czSXbNjz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B3BVdk4dqzNx6W2w8FNAP83fqJg7PwoTsMKqxSj/sJu0JMIFo1hFR5MN8iseDy7L53LcRivetTQ2mc22byTmDNqakmmZU49sgY94gJfqAOyq7iQxeaVbVUtboUK6pQeiOblRoAwIC28ns8W/34rQQsu5dkiYQG7kcpZPB1GbeZvHBSuYm1iiKlUiUVyOsW+ZT7JadbLgZo4kroOlSQAkiWosyk+Uu/b4BkwMvLh46ispvXhN3vX7HluKaXxphClpSlOcT6jLSy8zFFt6uhg18iY/z0TACnDK3FemV0cW6rrwx0SuT8jwQo9SmtT/md5UU7NRtsk+D2eymv60xu9b8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FvxlRNoNRCTlRqlfkRtcn8JqhXrEuK+reZslSZGEy/4=;
 b=D+31MBWA0prF7if5yCgElluxdagEZGh+fbOhbVJW6LA1VXnpV09reWKnbZxkCb2dqV3e87XWd4kJvhNehDVOOudLObf90zsllaZcxXTvn1cQTAEG5fAFoCxwPIiLmlKfeuV5e4bc/HWzrZtFuxJmBhaU9kF+Is4k9EYxRWj1KEbxCt+DiMdLz5c708iAWRPbBMHa9CljJghjevtxxqN+LAft1PiLM1ZJd/e/fgSoPZd0mZ0rkqL1++5TWuDMFpb91sCqnIxW7dQI+NTgjK6EXADv6TtVYy2lAwcMnkaMr4clhDGAR0AOJXYILC80hi+B+dfMCgu5f9+RuSH+IW98qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FvxlRNoNRCTlRqlfkRtcn8JqhXrEuK+reZslSZGEy/4=;
 b=czSXbNjzqE2UJU4JXkFWkfrdijKSzq5ufVX8QgYOVQxy9OhMcvPUG/QdCd/KMhZFbTwTIKSml7Y8Y4RKO/ZV1SogxehhD3tAw/DFgGPUsPv0UsJSv8ItrebRoLg3itfkw4ZCKQIAea8RBXhTh5aZ+qukHaKvPAdZc8qmGYifV+I=
Received: from CYXPR03CA0048.namprd03.prod.outlook.com (2603:10b6:930:d2::6)
 by MN2PR12MB4536.namprd12.prod.outlook.com (2603:10b6:208:263::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.28; Thu, 28 Dec
 2023 10:21:29 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:930:d2:cafe::53) by CYXPR03CA0048.outlook.office365.com
 (2603:10b6:930:d2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.20 via Frontend
 Transport; Thu, 28 Dec 2023 10:21:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7135.14 via Frontend Transport; Thu, 28 Dec 2023 10:21:29 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 28 Dec
 2023 04:21:26 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<markgross@kernel.org>
CC: <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 2/6] platform/x86/amd/pmc: Add VPE information for AMDI000A platform
Date: Thu, 28 Dec 2023 15:51:00 +0530
Message-ID: <20231228102104.1785383-3-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|MN2PR12MB4536:EE_
X-MS-Office365-Filtering-Correlation-Id: 941a2af9-d878-4642-d6fe-08dc078ec195
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	96/bAjSXoyw+Vc1VL/LVrvVdwBzyb70u7RktNVWyeRKrKJn4uiALGUJ0x+VxpeJs5+LWYT4EGrlPsyZPpT42soK88tw45tgmhEdhsq4xLiIJOGudTsvnnLyTlxIWRnVBJ/RlEiT0vwapdRSn3lA1Agpu84qBmef/n577Sh/7fwTowCX1PFuAkxHbKEv+ZUUWV+L3WI40FyjnJQtl4givi0daieO2q3MGdkc8kJHM2e9xbiSbCbEFQUduj+Cqls7caWgZZl6SFZeVPjzNb+Cw+l86flp99Yw0Smi19lSjN95ypnQ+HptoWwFPZ8HSWhNak7N0KEz8N3fRXsjEQRN7fAh9/xiA0TaL8SueRqGCgZwD9uyE1fnOvSMQ3kG97lRUCcDChwF3dA6Dyn48nE5kVRup7vQZ+K8hS8eQZwag35cXSV4jgjbuNsKLMsYS2nirzxPIFXsfuDevrYCi2bePVF2dOQqkowq+ByWGVM5ckrI6fkGiZHaZIlIUW9JGoh7+4fxPVJQ+SCkqheEJ5c2ETNakLtXFjF7ZgQ90XFRsWpFz7zZfKyA4MyKH2i88EmnQVOQqnhN1ettGfUcub3zXDP6WYBhmzwj43Ba2qPqGy7fObZyrteeyiRb5NeWIArpPHUCcopbRouwo3h/fsg4VXHnpScamkNc2s4oPjPMEOj8ff4qO9TTkPFEhj8rmFycXBl0PKB7vYzMQ6sOt3c/9RurrErVku4003hiIZnecBOXhNxkKsponTAKRY11irqP3MVEhnfzrFCJNZ9yyytTQyg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(396003)(376002)(230922051799003)(82310400011)(1800799012)(64100799003)(186009)(451199024)(40470700004)(46966006)(36840700001)(40460700003)(40480700001)(6666004)(2616005)(81166007)(478600001)(36860700001)(82740400003)(110136005)(86362001)(7696005)(70206006)(70586007)(41300700001)(316002)(54906003)(47076005)(36756003)(8936002)(8676002)(83380400001)(2906002)(4326008)(426003)(356005)(336012)(16526019)(1076003)(26005)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 10:21:29.3403
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 941a2af9-d878-4642-d6fe-08dc078ec195
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4536

Latest AMD SoCs has VPE (Video Processing Engine) IP block and the
statistics related to this IP can be obtained as a part of metrics table
information that the PMFW propogates. Add this support for 1Ah family
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

