Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880604C63C
	for <platform-driver-x86@vger.kernel.org>; Tue, 26 Dec 2023 08:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uxiYm0f5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LUGU/Du5gKTTm73aQi7qWnKQqeyPZumAtBz2qhh1rGJaGQFrqkSJisY0Ow/PoaVSzwitjDIaQE6vLws5GpELqJX7XfZ1SInXuoe8Cqp37kttlBPAXCCoT9/aAtwiirzSl7hYxdM+PTOU4xZw86k0N6pE7qCfcDzDU3LxHWbSWvZFolNxjuNSC/oU5HXPflpb9NUOZLpzNlH9DFXsAimYYoe0QmHeN9FvotvAkN867Q8O2Mc8m8Z6oqWwXr/vi58j8sWYb+0RYIBmyyD0zPYcoPWVXvl6790mVLiAt1TRhCOtI6PXIPEj5TjDJ6graUAGUShR7j34x0aufoLniGsdsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRLlr7Zk/8O9Qo2XY40Tw+Qvc+vLBhFuC+VHu6VopAs=;
 b=Pfr9/xd8zbC8CmF7XnVpm7T2gzCO6xWf9xHEHVGuGoi6eobo+ekf2Apm44SIWHX7Qo76coo1VXFaLaTD4sDTzZ8OzAgBf43DtEmW3ggpH7FmdGkHHqIjWMkTBVX+Po/tkoGmPM3n1wHM5cPpYhC8AsQiJ/iWy3lzidrcoOw+ymbbw02Lx8Zl/ZyvtJAl6qyn2flbVbhrB99yLfsWJ1iBNcp0ZtjplZ5BEesYEetunuKV0qlZ/hTGNL6zz8+KTvwF95Dk7espk8c3kDhmt++W0gLbOuPE9/vFgmjUaW+3uG3XDYLP74Pi1JX6wEYxMQA9T9+dwPzwFSGjUpd34I5pHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRLlr7Zk/8O9Qo2XY40Tw+Qvc+vLBhFuC+VHu6VopAs=;
 b=uxiYm0f56f80xy2A6AfVPC6t+UM2AIuUwoMJEBRjq/LbUNRlsWhZMhy3BSta0N2Va7i/9whvJeD0FfzbR481Jl6X711yZKPwW5FCGQWPQNcLMyW+Oj6vxoIzmEsVowBdI/EkWhYVvl/7ElSWZCDo5BZRduGN0RyIaU/3njTHZtk=
Received: from BL0PR0102CA0022.prod.exchangelabs.com (2603:10b6:207:18::35) by
 DS7PR12MB6238.namprd12.prod.outlook.com (2603:10b6:8:96::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.27; Tue, 26 Dec 2023 08:20:34 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:207:18:cafe::ca) by BL0PR0102CA0022.outlook.office365.com
 (2603:10b6:207:18::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27 via Frontend
 Transport; Tue, 26 Dec 2023 08:20:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7135.14 via Frontend Transport; Tue, 26 Dec 2023 08:20:34 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 26 Dec
 2023 02:20:32 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<markgross@kernel.org>
CC: <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH 0/6] platform/x86/amd/pmc: Updates to amd-pmc driver
Date: Tue, 26 Dec 2023 13:49:56 +0530
Message-ID: <20231226082002.1778545-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|DS7PR12MB6238:EE_
X-MS-Office365-Filtering-Correlation-Id: 908bbbf3-9529-47fd-77a2-08dc05eb886e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IXJdMmNbznTowcFkPbdYuct3sB6o66Tvma8gQ3fU2Ur3Qxt1XJmE7U0MmTbM/3rAjLaz0/QKmPZgvRuzqJlI9yFlJWoyzov5Lc980N+164b8OdxL3DHODL1HjVFhmzRvMqKwpO3A//z/l0UvZnfryGneAlj5gOPtLDMyN+KT+npQkI4HsSMGd/1N0Uf347WgEWzNXJjUloDI0z1SUiXpctKetccwGVjqXY3j74rFhl4T4Us+l1pAKXkjIgIXAudS2qi5DpxnX40NXZMqhEhdKUUYR0AIC3cIVsdelY6QdDxURjaITEiRwrzX+TI0dP1hFv8lbPER74o+Pk0JHaMjVZWsc1SOlAjqXs6jpaBxYI8dQ+41su6sVK3155QAj+Q7TzaTQQpUIYcrxaZxnHgazE2Ex47D45IHb6eUXL7A99X0XZz0zGORgqlbz2PfTHehfmJkbituedG9m7SOIJIPXX4czmRcv5Dd8sACGiavKykfHSbaNMuukqmm5fIXIuP13YEE/bNWwQqn706zeQImSb+E5+bjpGTRMO0L82PAbQw0liqc5981X1jVzKx2gcinn2n9l96qT4xrvzRdjF3RCoy3gsYL2uu6nz6kxAxUN4e3rhQfmQ/cVMmdjdQ9OEUokvPH/k4TtKkVzIE7xypxICzOXbxUwfvIGc1ttmXJQUM/dV6KIhBDY+MKxBn4CTgGDpw5EO71vIuahE8UGtrxD/lS/J5fdD6QZ3OHXyB/iOy8mFu5rbZWd34j8O5xIH1mah72V2kAvZV3oj5C61PtpA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(376002)(346002)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(82310400011)(40470700004)(36840700001)(46966006)(110136005)(1076003)(83380400001)(6666004)(336012)(426003)(70206006)(70586007)(16526019)(316002)(54906003)(26005)(7696005)(5660300002)(8936002)(47076005)(36860700001)(8676002)(4326008)(40480700001)(2616005)(40460700003)(478600001)(82740400003)(2906002)(15650500001)(81166007)(356005)(4744005)(86362001)(41300700001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2023 08:20:34.3693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 908bbbf3-9529-47fd-77a2-08dc05eb886e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6238

This series is focused on adding support for AMD family 20h series (or 
with platforms that support AMDI000A) that adds support for s2idle, VPE
IP block information, STB and idlemask.

Shyam Sundar S K (6):
  platform/x86/amd/pmc: Send OS_HINT command for AMDI000A platform
  platform/x86/amd/pmc: Add VPE information for AMDI000A platform
  platform/x86/amd/pmc: call amd_pmc_get_ip_info() during driver probe
  platform/x86/amd/pmc: Add idlemask support for 20h family
  platform/x86/amd/pmc: Add 20h family series to STB support list
  platform/x86/amd/pmc: Modify SMU message port for latest AMD platform

 drivers/platform/x86/amd/pmc/pmc.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

-- 
2.25.1

