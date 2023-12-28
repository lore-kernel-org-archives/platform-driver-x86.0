Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5C663D2
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 Dec 2023 10:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nv5xSmrl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmbaTQ3ZX+QBKkJLrNamBZ+roWDqmrdNKdpSFh+DISmankKE4iXS7bL7CktgXaOhBNBd6H2VOpzw/1vZxUi8yjbm98620dvaPo/1rEt++hnEo7oPCy1VOaWtxdlaU617nZ1AyvUELSDBdx1teXV4x2IExl5n70E5DjeaXayZQnNLzopWHX9/+9VlOCx9x30p+5XSnUbqiqMVbUGbZG5DBOX90mEWZ1FPJcljboPNI3wRLhXCfjxqAzy1DIFDMrCDaUD2NWsjVMrEQMlbrFFEm93kxvBvN1y9DK2yl6Hpmxz8FKf9H7Ei1wvHe0n7veHvO67a9KKPQRp2dIxhKmjr0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylHz6nQALhA1TPlP3OzzG7ZVVbCtZTtOg/3ZkGxs8pM=;
 b=ddNezupkOp/y6NgagLUxNdQk9homndmpsrD7f2ukl/lRFzsTboazqh3P5VH4WnpzO+gpGQuZSGnCatLQJR7bVQL3V5+xF8EaN3JrUoFGjva/5GXL/iqGfs5cgx/sR5qqyeGA1O1VIRjg5t5Ru0USzKXH83YxwafkMvTGZTo12IC9HOKNctpMRRdxCLZU7tgruLtPP2P8R6Ps22FJTjKHY+/wyMPA3oQFImPjKEbOpgTiEoswkgbZ80RcWnIvKhAZ/8kqvhpFKv3XM+X3hTnygii+4tR0gPzM/VNkNM42Ldqjxcl7AeoLRZpymnkJUz3M0PL2g0+R4KJEj/ZftlFjMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylHz6nQALhA1TPlP3OzzG7ZVVbCtZTtOg/3ZkGxs8pM=;
 b=nv5xSmrlUCs6Poo79PqpAZiJX8Xqp8PAgS4jeREiiIMaUJKlddAX2MHwQxop87JVrvnI8wwiyWkmKZ1TV86U0M1ILfNvCgoPMEF2+NEe3bVIt7EEYHb2eD/E8lEKNebAfe87JkzYGN/WkIf27bbIW35Yp7JlzFhzPymZyi+1bjc=
Received: from CY5PR15CA0240.namprd15.prod.outlook.com (2603:10b6:930:66::12)
 by IA1PR12MB8468.namprd12.prod.outlook.com (2603:10b6:208:445::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Thu, 28 Dec
 2023 10:21:34 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:930:66:cafe::6b) by CY5PR15CA0240.outlook.office365.com
 (2603:10b6:930:66::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.20 via Frontend
 Transport; Thu, 28 Dec 2023 10:21:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7135.14 via Frontend Transport; Thu, 28 Dec 2023 10:21:33 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 28 Dec
 2023 04:21:31 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<markgross@kernel.org>
CC: <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 4/6] platform/x86/amd/pmc: Add idlemask support for 1Ah family
Date: Thu, 28 Dec 2023 15:51:02 +0530
Message-ID: <20231228102104.1785383-5-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|IA1PR12MB8468:EE_
X-MS-Office365-Filtering-Correlation-Id: 524c505d-f4f8-4d05-b51e-08dc078ec45c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VoQ5w7/dw0YyfU8Ke6hoLgg+ARVJeWm4l7f3WTW55xrfpXrl41CRg88K5C1yi2pV5/2JIOWoAfpLDaLo7WJYH5RExuEDdBi75r44exir1fQV0o5At0x5w2DADpTK5OptGXSuq2xVsZIvJWWWvurXjIQWT5sptqh83vnkcvg0Br5GjZrzBKYgrKqgqgG1N8nNWYX9a+r3T1ZxFBSpdVkQ9rlkls4erYMQiu3vaHVlJORuGYGWtNhNfi5oRSUFU8bEUEkPTDPnzkF+0EIlAH7KsGOyIEPen/DNbcmybw5bHh2inDNbIEmAyhCKWHR35Qcj7DGdwhJh6G3/CMOZCQTOQFCnkleG79MqDh6vVmGH/yyOV4kNAIbVJzPT3//k9+r2bpowMIwjBViTw19qn4owruNOg7RdDOCBp99ubaFioMVuLZuFVlJwDd1EBNsHG2N+qJijTIc4zZAkIcRX90uHO7qkBam6ZlpbtbSnzpBDiB1ecd3cs8w6lgDupC3Kol9/KUqxoenltauZDzIkneWFNwUmY47UPl+ZbddriUuYTfXxXFGMcWpHAJeXmYHXoFcFXA+PzprkW6l+ko+2x7PXonJrsv/KfNybGhc1mdcV+5KbpdWpXUd3TUMdppYQ7xEf2iaUkNs9qXpGHyEq6G0tuxWee0uNaYuC8iSlRfgHPuRwKKkxQSqpizZDTFmw6jMryWxL3ILP/5e7+x41knjCeVebqSKnK14eYhB4NVgCCiokEA/QeRQUSsUDWdBdGOKXGBUKGp0AbCVIzJM7pFpkcg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(346002)(39860400002)(136003)(230922051799003)(451199024)(82310400011)(1800799012)(186009)(64100799003)(36840700001)(40470700004)(46966006)(5660300002)(36860700001)(2906002)(26005)(2616005)(16526019)(336012)(426003)(1076003)(478600001)(41300700001)(86362001)(36756003)(40480700001)(40460700003)(110136005)(81166007)(356005)(82740400003)(316002)(70586007)(47076005)(70206006)(54906003)(6666004)(7696005)(8936002)(4326008)(8676002)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 10:21:33.9834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 524c505d-f4f8-4d05-b51e-08dc078ec45c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8468

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

