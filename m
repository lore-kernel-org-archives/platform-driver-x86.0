Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9624CB3C
	for <platform-driver-x86@vger.kernel.org>; Tue, 26 Dec 2023 08:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Cy5gkgq+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MgJfVlUVXs0l50VLCHHayjvtrKMc0WO+8ew3DbRI5oo68hDQWJtqZGFocI9e/UVdWzwWQq4kmyE6yI4Ii4lZSfHYuBQ4WDWBQqMETbHIv+UGhvhKtrrSGUEbMnC+iMQbHyI0ehwtkuYbqa6xQVkelgDC9NDgIddXX7/m8y+SsD+B6JD/PyCctv/MHuyp8ARP8gSliwmGhU/XE25YS/2vNDDtW4CH4vkxZb14u5X8f5mUvjF2hvEPlv7OZGxLjYFKtpvcdy9tfpu3B10RRASDDcw6bHEYXTEzdtBinlyBcdyyhWtly4+Z8Fq8x3puBDYLSnAm8QCrRXP/fSIU7rvRbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9d7v3G+jNUwkQiFovFO/9PzwFlJKfJTETZg38eyFlNA=;
 b=EewEPPOJuVtCpBNUa1E/PtawJlu6+wvYY6jphaGB1p7Wxu5raoztsrgNkIngkzZP4h8uvoeYlGtV5WnEhVoNvX40+EalkkP7u3Q9/ZnVVa3M89bfFmyZBBN9PMZu/g6qPJdYrliwFxM2saZ2PkBCha8ZaGZk+0TUoH0AhYqutX8cf10Sq7ZJ04OdecChV0QDHQd/Mgdas0NF5P1F2J3Qs+aMXqAisIXIMtWYLbA8xjA+hON8K7TqlYZSOBt4pmnxh+YoSgtWhMpLTZwarxeqY6oj74vt7chKXIjvAVvb0SOFEMvEf5rbZTazs/hoo/VIenEQFHmr6fU0PsQ3O5hdBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9d7v3G+jNUwkQiFovFO/9PzwFlJKfJTETZg38eyFlNA=;
 b=Cy5gkgq+qUG77AMMJ0mcUyGmXCfol1vUg/MRq4QHKPX7pT4SFCxje60yUP7lRTOHAnWddT3m6wCoiTAbIwqxo+5vXcMNIYI8wKUlA+YvADtAqzIccunFyuy2abdhiJnNEb8koUHlkQeqOD6iVWiEHFgdRqSl9LrI3GuvkMnByfs=
Received: from MN2PR07CA0003.namprd07.prod.outlook.com (2603:10b6:208:1a0::13)
 by PH7PR12MB7889.namprd12.prod.outlook.com (2603:10b6:510:27f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Tue, 26 Dec
 2023 08:20:41 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:1a0:cafe::bf) by MN2PR07CA0003.outlook.office365.com
 (2603:10b6:208:1a0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.26 via Frontend
 Transport; Tue, 26 Dec 2023 08:20:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7135.14 via Frontend Transport; Tue, 26 Dec 2023 08:20:41 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 26 Dec
 2023 02:20:38 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<markgross@kernel.org>
CC: <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH 3/6] platform/x86/amd/pmc: call amd_pmc_get_ip_info() during driver probe
Date: Tue, 26 Dec 2023 13:49:59 +0530
Message-ID: <20231226082002.1778545-4-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|PH7PR12MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: 306eca15-192e-4d95-e360-08dc05eb8c8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XecYqY/TGsGhy+bh2rhFgA4AHmtrOys3zUV/HZqOgam13unb/OZKwJHwvvinz4tDP9TLQEpLhmMubbgMZLfWy3RmacKHtmDbX7drhejWoTAwjlP4HrtqOK/qqyG+0RsTdGWIYdlkJBdEVhuC2xJQ/UhF3XpGnCj8/APLM5b8LzeW+kGvyZ4JQS6NfT/MkUdrybZ90PRUzwCJTE5VIXXNR/cQWWZiZa0g9p2lBUW9KeKycbjLSvaNAFkHSYnBJfLsr3VkmI4qMNxhPi6i9eb/dUpdgGU8iVjZxqv/SpreHnyWlYV6Ap7lkp7GfNJEhmMdb8+p70yrToyE/Xeh3BdKbM6H5PGT0cgjEzzIvnP4PXgKv0EEZ0z4R6sikUmOUecO0pKvN3D0qF3jpBNmA4bh7Pond/PGLJ40ATJbdr9S5J4a745gOr2+mZH/UHHJuDzI6oE6eA5UOKWFCmm1XeoxFdB0nWYERbFtTnVZvWCJoTfZS/n8AbdqbXZ34HZeKL8uzp1X2wvMkkG+zUyrk8/ZRxUzvCjFexMDcqSgZNkliOTW9vUzpGxpk8zC1+I0X9xdqZ3D0JIXMHnNpwPZ/bPKvgUJZqaka7gcBYdq05AQVFeKnnYYMnGbzAHrHRaqdutCPjlibhlO6NY8PbtughjZPa4IIRETzGir+NrTNYaJpYkPIKmsSU32A95chgWTXTR+z79mrLZZARxsz/rpqP/9LKqLSZ/EVFt2CPIlHxJx7XqHB59bhNfaNNo/rQ5G/GywXEYK56M/v7W2y+xxv54OOA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(396003)(376002)(39860400002)(230922051799003)(451199024)(82310400011)(186009)(64100799003)(1800799012)(40470700004)(36840700001)(46966006)(110136005)(54906003)(70586007)(70206006)(6666004)(7696005)(478600001)(16526019)(336012)(426003)(83380400001)(36756003)(2616005)(1076003)(26005)(86362001)(82740400003)(5660300002)(2906002)(356005)(81166007)(41300700001)(8676002)(47076005)(8936002)(316002)(40460700003)(36860700001)(4326008)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2023 08:20:41.2795
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 306eca15-192e-4d95-e360-08dc05eb8c8c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7889

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

