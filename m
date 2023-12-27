Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A555238
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Dec 2023 06:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0AbSKrZI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpfKB2cYnqb/gRERIVAkCOZacWCoPcxI3vPxkbuuMQaB+MKodiVI0pZ0JkepAd2e5Iz2/sjw9tQvM7hyvIhhAy7b3nYjgHcq767JQmrBqgY0aRzUzC7OrT1rzY+QhxShduI2mCdc6Qm4dd4R2ZivHuPMBBt/zuDE88LgVOWXVxla3tyvfBtitWgSB9YGSoiL1l7DugKXhyXyxJyw2KrwbB8rU4Kh3co5nyBDixD3SROJ9x2FDIkPOWfcF1E0v1Uih+G8b6QoC8s7Mo3MEvysfbBsFkQaw8XsNa5pWQ292XVmRxazbTYGcebCE8eF6UvgC29sVjC8t+yX0u71E9uxYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9d7v3G+jNUwkQiFovFO/9PzwFlJKfJTETZg38eyFlNA=;
 b=FGjHq/fIDEL9qwZSHdHdYttYTW/dX3Dt/EZtyfwZI9D7/YITuEgt2W3uCYNUvfbi+jLvNHBk1pUuGUORKEg6+hlXIxzaee0WI0R1zQ5X4G+lwaHMW3uQ4VG7xfAKHrR0v3vKlKvNA5XR1vwekNOviv/Irun0H4ICUpO8veSNI4MW4ZCZCik8fSKqMoxQGdWeWYHLqftcBuNEOzvZCBoNubJJJAuuPQp0357Adx6Q0HE/+xzzSP/GTKEqneCpwXXPF/50vD8XCy7YfM/ES9cvIoxTbcaUrK2X8IlxVpmML4rW0KvnekF6eaia58ay2ZaLXucA8/4mavhkS8aKXCbMMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9d7v3G+jNUwkQiFovFO/9PzwFlJKfJTETZg38eyFlNA=;
 b=0AbSKrZIBNahfsZrlvF2lXNh69VsWLiixacT+Cwq7eX1LbIXJJVZl3/yziYxY/mBpDypgWwPU5prdrFGLFGGfN43/UMMYtggHWVVOZbug3ZFaDAwqRS2aHlZ0hMjLIReVGByav/6MiUKzIJSixorCqmxa+liEDvusNLWjwg7gTY=
Received: from MN2PR20CA0013.namprd20.prod.outlook.com (2603:10b6:208:e8::26)
 by CY5PR12MB6249.namprd12.prod.outlook.com (2603:10b6:930:23::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Wed, 27 Dec
 2023 06:38:44 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:e8:cafe::35) by MN2PR20CA0013.outlook.office365.com
 (2603:10b6:208:e8::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.28 via Frontend
 Transport; Wed, 27 Dec 2023 06:38:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7135.14 via Frontend Transport; Wed, 27 Dec 2023 06:38:43 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 27 Dec
 2023 00:38:41 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<markgross@kernel.org>
CC: <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH RESEND 3/6] platform/x86/amd/pmc: call amd_pmc_get_ip_info() during driver probe
Date: Wed, 27 Dec 2023 12:07:46 +0530
Message-ID: <20231227063749.1780900-4-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|CY5PR12MB6249:EE_
X-MS-Office365-Filtering-Correlation-Id: ef98b6c8-e2ca-4031-bff3-08dc06a6788b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c9tgeZ4KwruCMerYnhekC6TZhDpJNAvfcygudAL+cE67OHmyqCUYTeWpiBCr2Nw+cHmucaWNGXcNm6lVbN7aXmnulOglfZA1FnEXnTQxM+JsGJPlXfWX55J5sSpKfxpF10SjAchPYloM/nsSP/oAwbzKxxQW6WbdVGLBoiAW1wAO29X3hotvA1gUxaKWG5D1OAsnqJZTIWDvbCaPNsytaqewUahwHzhFHUjBV6P+DpI6NjPTQZmoqe7fdtOzEOynwKv88D5+Nmgm8F/70plwnOk1YsQTrH6b/ueMSGomRTM850mD3lHRounLgC9ZOF6dVeepV+Yj71P/B1yzgpqK9ENpxAAtrCzfRacYcB+DJWYKT7NQFJPXWUVBS3yZWqJBBvTBNpTY7XBFfe7JlD4VgNVcraJwesEueN0hakdwDauK8MYoh5d5mygzSeBUj1HqI/TLtL8NWReCeg+PxEcFeD4NLLL2EnNCRc+jhrjKZOTrA+KD6XKb0w7xSTZ437jIfbuw1db97up5ZNKudccpTlgM3QUQYUrQySuZgG+3+5bDSJIVVmCkAug9UoSsMcOWH0+vp0PI/pBvpoQWxpo4sM25zgd+zeF34oQQJmoiv1eRYQuoQpyYxcrzRYnp+7DQyu9obdorVQOHMl7RCdDManx2WUQOrlbAz9691/Vdn4Zh737NjSfULud9XZQCZwwaK7gWNnAGxSaZvp6MIY1LfOfCeY95BATlj1vphTvL5gc/W0GJf4jG4SjV4AFG1f9cibxbIFuFC9uAQHlOzF/dvQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(376002)(396003)(39860400002)(230922051799003)(1800799012)(186009)(82310400011)(451199024)(64100799003)(46966006)(36840700001)(40470700004)(83380400001)(356005)(110136005)(40480700001)(7696005)(36860700001)(426003)(336012)(70206006)(54906003)(70586007)(2616005)(316002)(81166007)(1076003)(82740400003)(478600001)(47076005)(86362001)(8936002)(40460700003)(8676002)(26005)(16526019)(4326008)(2906002)(5660300002)(41300700001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2023 06:38:43.6061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef98b6c8-e2ca-4031-bff3-08dc06a6788b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6249

In the current code, amd_pmc_get_ip_info() is being called from
amd_pmc_s2d_init() and that code block gets enabled only when the STB is
being enabled.

But the information from amd_pmc_get_ip_info() will be required outside of
STB usecase. Hence move this call into driver probe sequence.

Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 0511b7f3c2b7..6d6e5b9e56d8 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -980,9 +980,6 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
 	/* Spill to DRAM feature uses separate SMU message port */
 	dev->msg_port = 1;
 
-	/* Get num of IP blocks within the SoC */
-	amd_pmc_get_ip_info(dev);
-
 	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, dev->s2d_msg_id, true);
 	if (size != S2D_TELEMETRY_BYTES_MAX)
 		return -EIO;
@@ -1090,6 +1087,9 @@ static int amd_pmc_probe(struct platform_device *pdev)
 
 	mutex_init(&dev->lock);
 
+	/* Get num of IP blocks within the SoC */
+	amd_pmc_get_ip_info(dev);
+
 	if (enable_stb && amd_pmc_is_stb_supported(dev)) {
 		err = amd_pmc_s2d_init(dev);
 		if (err)
-- 
2.25.1

