Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2069.outbound.protection.outlook.com [40.107.101.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A759522C
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Dec 2023 06:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vOG7Ua21"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TybJN/1TgWz283M1PDS3UaoAmFG82rnd0swTUwMh6CWlbUfOe+qDFAowhd4K0fyOlHZMWl1N3xLvdBDSQDAAptH/+KyfZ7L/RAcfID8pyGPJ4ObSAGYDtJUB/zh4HonOYxZbyIogYQIlSR2nN04D49FQTbACc38o1fMk+2mIh1Cy86S5xAneBhWeX+8ClfZOdrnCaptt0JPRiUU6hEO5u2SqwZeYWOhShON/PTnMecpNgtH2ZKHY6AeYxmZtyjPfANCGu0BydMOU4LBs68yLtBffgOT8wE5H1k4bC2JLQgE6NSSRlxotzlKd4sgusC/V7VIrPpnfMbGuthUloCkT0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FvxlRNoNRCTlRqlfkRtcn8JqhXrEuK+reZslSZGEy/4=;
 b=oEu6zk/gW3v7YQpCovRy5SFN/S0ooQB2vn+vh4IANBoFKeM+0Q6QqR2O5dhsymRlHijcI7xA349rpczWPJZofteiYsRLj7VTWXUtKJmvMz0nCscyenQp7RV6cpPYAoJnY7fdJOfATXDKrTtjcAZMay2CVO/Ngh2hsjmwS7NnN08gZ65+LNLktJh0ZCyKj0Zk72+KS0YQ4+YBTx62VhIJ5Vz9UWSrFgk4HYNd71cr7ZJlTtx5jP9GSHicAyscZvX64JKEJGIv9b2YqUrn2M7OqfQ7ewqJV1do9Zjopu7bXuM9NzsS3OO6+O6ciEflm3XtkND76Kfz5yAwn8Eo49Kquw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FvxlRNoNRCTlRqlfkRtcn8JqhXrEuK+reZslSZGEy/4=;
 b=vOG7Ua21TJltIdW13iElI3sGFdsTEkPH6qezVMQSdrr5+FHYDTU+Va0GJuCsdhyh5L20fbPnYCxaZ1aEWI2/sR19kZEymkV++EdxiM+jdJXTt9mYzzcXQyDWgd9qh7yKSQqF9uPpIbshH1+XPSqy1kXSdHm8vJ4t7mVAnkW5G5A=
Received: from MN2PR06CA0018.namprd06.prod.outlook.com (2603:10b6:208:23d::23)
 by MW4PR12MB7016.namprd12.prod.outlook.com (2603:10b6:303:218::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.18; Wed, 27 Dec
 2023 06:38:42 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:23d:cafe::aa) by MN2PR06CA0018.outlook.office365.com
 (2603:10b6:208:23d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27 via Frontend
 Transport; Wed, 27 Dec 2023 06:38:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7135.14 via Frontend Transport; Wed, 27 Dec 2023 06:38:42 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 27 Dec
 2023 00:38:38 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<markgross@kernel.org>
CC: <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH RESEND 2/6] platform/x86/amd/pmc: Add VPE information for AMDI000A platform
Date: Wed, 27 Dec 2023 12:07:45 +0530
Message-ID: <20231227063749.1780900-3-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|MW4PR12MB7016:EE_
X-MS-Office365-Filtering-Correlation-Id: 58184817-5094-42fe-acb6-08dc06a677af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c28hnaHgDvVgjQ3lLO33tto18HLhYsVAGz82e2ZfjkQKaefh2X0jJze8dnBahxtVMkTsmvLbGCsCzPx+gaSQLDRjYsbRfedw7jBSfweg4yyhvWl9EhT09tBY7Xzjwd2oCLpJD4biJX+rNZ3jwFpMkB6izU066tJz9mRmgKlpkTbT8oYJfF7kVQiQNfeg2Le+l6fRAVuUCtkIY2Uv/BrXMo67Tamwj3oNhRwmf9iaJsuBdA7kh61Pe2Xvzc46kWA4LQQpTssF4BD8A3hKSOkv4K1Uw+cNP5hIHc3G0Ts9pmtizExOXfn438PlR719tc7MoB1at+q7fMKhhL1wnpOuTw7Fmfi4WlYufaiG2ttl3sLGC3i66NLB7ADWbFqXWlfur0qldfEfyoPGfZHQD413pjNbEAh+QnVznrvpWdjHtuegTTc9DKZ0Q5JgHfZp74mSexKy8IiLJ8lG4cU4zMe7+Css29wPbSsjS3OoeNPyjiTMx4sQFKA+AQl4C6t7kCpQdJIuCfSCcnC7YLsEKoUr8wF2Pp4g62F9frSFfTYNgQN49pZ8KeSfEHKgijAUy7mM3p1frBV7ULYRHXEGUIn9nMyjajiks9i/+bsnNpS8XalpLMqkwDDaLEVrWxj4y+M5tP0QvuP9BK2Dr3Qj1V7a65iZD0cf6E/s0aTfdELXV7W+vf1Yy7j8oapyXxTLsQJAk5MTFVIqp1GGrkVLCUwh0F1EzOSjivy2aNjJvVjbbL63MNloa2N+84v6OkJ/0yLTQetLccrJD2uEPvv4jYTYCg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(39860400002)(136003)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(82310400011)(186009)(40470700004)(46966006)(36840700001)(316002)(8936002)(8676002)(6666004)(7696005)(478600001)(36756003)(86362001)(26005)(2616005)(1076003)(36860700001)(356005)(81166007)(82740400003)(426003)(83380400001)(16526019)(336012)(41300700001)(110136005)(54906003)(47076005)(70586007)(70206006)(5660300002)(40480700001)(2906002)(4326008)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2023 06:38:42.1638
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58184817-5094-42fe-acb6-08dc06a677af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7016

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

