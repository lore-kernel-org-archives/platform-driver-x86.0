Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5FC4CB3A
	for <platform-driver-x86@vger.kernel.org>; Tue, 26 Dec 2023 08:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4Rg2GtRL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=frKZDrXKnJkfzC5P8yHFHLifgbRUXIG5t35JaHmXcxyjawqyxJR1zpgDUdozTCQpm8aI6pUie6PImH1P1k2pAmvGoIlD08rMKY/x72TfOMWWXdwqq85ymFtNOnxr58j1CsUZlgnaIU7wm8WUIt+nbsy8crW9j15mWLpi8X9zzzK3hDX6oxtuvJxguhgQMTCsQpw8RC8cWzF/XicPdSuL2dJAdgJsL/t/1sBLndWRIuOMReMMsBhQvahgyNR6QQ092CSmMcjpTa4C9h87hOlA3dXqehS8FjAhJpk2EItwlazsc8UcntGwmoQmrciDwlLIsnxhz/mZVsBEF2W5qCbOog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vI7+krpxorc5JAFNMYgV3LK77JAsNYdAH29wq0lPt7M=;
 b=J9WRL+nTPi18wsGGQeHAryeBXk9jzdT3LaZNcSsWWAqM/GcT8v/csYMLUWrgKg/Rwkmtui6akaZNh7G7mpIWhaGcfUu64SyqcfS2thhz5GL9Vbc80xhC+8xyqZN3pEA8hWq85jmJkpnF9DzfP7X62Mwx8cTwyxDEgVEAgawd2qtQYzd2ZHMG1z3srAePRM3lCj9UY6xkW5PN/SHzpUzqBDFwmRuCU9CYMu4iNN8F1m3Gd75rPogrvq7P6EwuJFo+USGvMtYb7656aGwLuP8s3tOmr2Ta1aXfTH6ImyANvakRLDocRJQtYbx9FtPe0jkElr/m7pT08BnHpZd+HXZbOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vI7+krpxorc5JAFNMYgV3LK77JAsNYdAH29wq0lPt7M=;
 b=4Rg2GtRLuS3kikDpq1Qe6IcOwWnu+i+OCiylUrdMwlzMwRG6Eapon3O0yf73qrFYopq4jDDFtKAEpi/ijOVnzvbsyyl11tKFaQz5X7LoyuMMBSEuX03Sl3U4Vs0B0kla6L7ZFLbe0P862L52IH0jIaZFN6j8qVaF7RT+mbjJKpY=
Received: from BL0PR0102CA0019.prod.exchangelabs.com (2603:10b6:207:18::32) by
 CO6PR12MB5442.namprd12.prod.outlook.com (2603:10b6:5:35b::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.27; Tue, 26 Dec 2023 08:20:44 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:207:18:cafe::4c) by BL0PR0102CA0019.outlook.office365.com
 (2603:10b6:207:18::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27 via Frontend
 Transport; Tue, 26 Dec 2023 08:20:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7135.14 via Frontend Transport; Tue, 26 Dec 2023 08:20:43 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 26 Dec
 2023 02:20:41 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<markgross@kernel.org>
CC: <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH 4/6] platform/x86/amd/pmc: Add idlemask support for 20h family
Date: Tue, 26 Dec 2023 13:50:00 +0530
Message-ID: <20231226082002.1778545-5-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|CO6PR12MB5442:EE_
X-MS-Office365-Filtering-Correlation-Id: ffa74dcd-3082-4b76-2689-08dc05eb8e2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x6eKSdTAP8ivHEPDpfWpgjq4xpN8ctjV+PxLxPF14XXO3ZeSxjkRRqcjK3Hwm79Qsa9RsmDGsoT+wuL1YlCaJ+kauEQOKosb/eotaVkQtAjTISjqhu1JIAjf+sGsmvfG6lLELV2LO7Q4xWs5OPcyZsrmH9ZIePOLEOPwcEKsOg0tvk6HpoxSG/swqfjM66uhFzvTd38fpUSu9CysBLv+m0aCT53ktgrHiiwfEyOzz4JMJFOtVhZfsfKsA6har6SNVl0jDgtKm8vl5e1XFqDkssTZCSvWpWCd0VPAwp2NTiHzhLwWLLusJOXuQy76J42cQMG1AVmEDhRJLZkypOYRXEof0Io+mPLLTxSwTM1VA0V7sSnzFUcGjeS+81+8vCdJrPSYUEIRiwVNDmw0dBIlrGWd7uKwfs97SuK5GGUb1HTY+Ncuj8Je4YhOsD2Q6/GmJuV3buQIvQUr3viCuaEJeJLm49QEWSUeNC7zT7laST2g1I3Sns4RsJ/ggsfDhRxhH1fheWjbzpm3rggNPA/v289BYDmNDrkZXPmOHGphe2TVGMivoG703iUJcRipUQkEcssx1ZaTX0jbIl4bQr8tTjEa24TzpMcmeRa2gakxcpiz1tMGM3lDKDmUyhiJ7Cm+RFQzcArsvlBmy/UNWr7cQxEsDDHPt07CnNe6Xu/RO9QWNTdPYv/eGk7Xz5zfuHMJmVrAymzA64qW2Ar3kHdOLUYfSbbBcPmOn1HUGDANxa+lgJlpAkwtRccb51/+gIRK9dlmWEMxSG0LC2nkskVmhQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(136003)(396003)(346002)(230922051799003)(82310400011)(64100799003)(186009)(451199024)(1800799012)(46966006)(40470700004)(36840700001)(40480700001)(40460700003)(36756003)(6666004)(7696005)(70586007)(70206006)(86362001)(16526019)(1076003)(81166007)(356005)(82740400003)(26005)(83380400001)(2616005)(47076005)(41300700001)(2906002)(5660300002)(8936002)(426003)(8676002)(336012)(478600001)(36860700001)(316002)(54906003)(4326008)(110136005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2023 08:20:43.9945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffa74dcd-3082-4b76-2689-08dc05eb8e2b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5442

Idlemask is an indication of each IP block current state (i.e. whether it
is running or idle) during s2idle transistion. The newer 20h family
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

