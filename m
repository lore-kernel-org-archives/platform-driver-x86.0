Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EF25238
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Dec 2023 06:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="24WzywhD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDiEQrpI9kqz37T9PhjgOJFdjIMjg2H+r6B7NlQFKu91HGw8L2jWoNEbfHHCnRMqQcR/m6cs9V3SiLCiP3ix/aCoTG4G/uO5D+ch5Ox27PMRswBJTE6e6YVCQTaNKuRWEhdueZKhvse1ssuFjGuHrLgLY1W6xy2Bni4ZVnanaTqzaUi9lReXloebOu8rqIinn2moR7FZSF/3Rpo46DcU8+hw/ECfxSUvhsW5oVYLxWdz7pUiryiSNmGhPSrFfiirwFdgu5H0Zg0QZvwLDNVKPer7a/J+jd70T6x2TPoFhCo77NoqBtvZkdA2yRt45ruYIoRX5Jdi0l1mhfSisRM9VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bg469faW58btf+fa4OKizfoZ8Lo+DN7WcmIDX1EGJPg=;
 b=FAYRoA6PVEHgRprwQma/0DFX1GwaULQtNRxNbd93l8ZRZkt7OXF+p545ikX4L/I7ZNgWSXmfIszkS3viMA/cDOJiXSTEIc0hVw8zMHMelru/xWLOyAedL8t21bczWgTicMoD508oNYFSqmw+nYxJUW07KMJOHP0kircyTg1jFM+5n5H2qD1jpJlZN5WUvSVTBE+NszmBpPnSrIeyegVr1BzxfEmIwgbM/v4G9ysjojZNkvcIK+9UIGb/6YljCSaCNjzebOf0dIik0gKuvijw06f//aLkNEeRcXpAKqgH2BXuHdgn//QjQYUUYAPlztRd6ODEBYJCCqkL3J5Nj7i1/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bg469faW58btf+fa4OKizfoZ8Lo+DN7WcmIDX1EGJPg=;
 b=24WzywhD2a9wNsjuv/iJ+3X0d68BwbAs9fvFnilWxzxW0xxjdT46cW1xsDfFYR0awcFc7Bqgp4dqeCH/t59x8IsV/E0GnqSCd5O9gLcs4Mejy9zfM/6xNrL/O9mmSqbIo+nCwwxjHDonVjM7437+HT56QLNVeygmqYZY4M2/sLQ=
Received: from MN2PR06CA0018.namprd06.prod.outlook.com (2603:10b6:208:23d::23)
 by DS7PR12MB6333.namprd12.prod.outlook.com (2603:10b6:8:96::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.28; Wed, 27 Dec
 2023 06:38:39 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:23d:cafe::aa) by MN2PR06CA0018.outlook.office365.com
 (2603:10b6:208:23d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27 via Frontend
 Transport; Wed, 27 Dec 2023 06:38:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7135.14 via Frontend Transport; Wed, 27 Dec 2023 06:38:38 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 27 Dec
 2023 00:38:36 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<markgross@kernel.org>
CC: <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH RESEND 1/6] platform/x86/amd/pmc: Send OS_HINT command for AMDI000A platform
Date: Wed, 27 Dec 2023 12:07:44 +0530
Message-ID: <20231227063749.1780900-2-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|DS7PR12MB6333:EE_
X-MS-Office365-Filtering-Correlation-Id: 72f0368a-cc3e-4e02-600e-08dc06a675bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kx2HXh4KgQD8c1RO/WEnU89q6flFgedrB2xMCOdPXmSIwkNUweBMQsSPqTosqJdjiyE/dUMree1B/GvPy7zQkYn2KvWQI96r8q4SUY91tz2bbTxmrQckY2oPYgL1rcIwTcQTJ7YfaCHI0LHSfYtdrg8enw32l0bNyENnAFe7iqe/y7jRR8tk1DKOUuZ/+K7aeohdJPhF2R5TdJMOUaF+x9a69BMWz1+5xe747yANsIAu8AROqfY2UvkOKaE5mAQ+7T/5qwWUAOA6vGEcVkIJS6NXofhatUzDrA1qkDsecVZvJeEk7nIE8/slQfkSMVmuKsWbRRJ9EMo98Rj+uVOjMLEyhe2TVEv2yoWsEszKzz4BkG4VfPHILHbclI0sNqPAX3zc5kFZ86ZHxWQHUDu544ocaErYoyTdNuhtQ10wt5zWazLnDgcNmcRl4dGGLtvkOWgJYJQJojQ1rhQLLMhpcHUOCyNVhq7uyNDbTofyTGt0tk7Hjekp/WswPZHpCvZDPtt/pMX+S2iZXiRDWa0wRT/XgrQXfRh9U4AKhEsK/idsPZFMmXNZGYg2QKe/duFtSy7cF0He41V9FCae3n5hTYERZ9xgXj8bItrpa1hr/BRAomwPIxHliPu0YNxVWaSxw/2NulN1ExzZuSq0MAUGibCthMn8cUU8/exDf25DqzIsIqrV6f9sXMK0Vq/k1vfCUC8bcd0erJTBd8ivulP5Vt8aNxMsvqtnGc4NcIONAmjWnHaRv+P4d3qzMaT8/moKzWDRNDoTJDKBCfkvKKjdjg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(39860400002)(136003)(396003)(230922051799003)(82310400011)(451199024)(64100799003)(186009)(1800799012)(36840700001)(46966006)(40470700004)(40460700003)(7696005)(16526019)(336012)(426003)(26005)(1076003)(2616005)(6666004)(36860700001)(47076005)(5660300002)(4326008)(8676002)(2906002)(4744005)(41300700001)(8936002)(478600001)(110136005)(316002)(54906003)(70206006)(70586007)(86362001)(36756003)(356005)(81166007)(82740400003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2023 06:38:38.8981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f0368a-cc3e-4e02-600e-08dc06a675bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6333

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

