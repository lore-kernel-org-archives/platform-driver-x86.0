Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D337963D1
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 Dec 2023 10:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="og49aV2Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XorCVJb4OMvuvDARkX5tSdGJ1VbQPPdBS/xuj++wDvmS9XCNiAAv8J4+6ySXhirIHr+QH/7q9PtmO4eeoQuEkvKsLRaslwBHmwsfu93TjlgqDHI78+79IbyV0XqeNvzMYO6gQSl/X2MUNTErAOJwS5cvVd6o/cKU4izhSUbiXJ+3alvjYXOfHj5CIKc7cwJ/3mcXFHXXitp2ACXVAdp87F2O/JKtFy4hceSDWzUd4yHL5pDAOguX5NSoQqOGNR6kRHWhu874gHUEPJ9Fd8REOmO4zFFwBXIWuFgSE3EmPKbEZjZ42sjJMJhNiYLgQ37gesDdLrMF9+fn/FX7D9bUnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9d7v3G+jNUwkQiFovFO/9PzwFlJKfJTETZg38eyFlNA=;
 b=MefZXrgsBdszL5P/XSMTyU/7qASTMvMH8YdASWTNO4wrdbSIo04VkgaeWT/3Z7BoVTQtf/M2D5UxYmBC47IcaIZCV6SCCPrGSvrbAtzVOVtq9YB6RtmnZakLVM0w0ei2HnZRi9JbpMHSZkDOI2JSP+MsgoWBsBnSCobGfXoDW/1yh5CAWepiWDSoZEK2e4ftdX9SN8/ZRYEz2X+iciZZQMGO+AT+YDCwX3vK4R2YqigD4l13SGhNgBPDHaCx5SorgU8zrx1DbrFG1j8z5rQcLFAXemHhO27uxl0V9uApUdMq2/bONHbyJVD602GbxnjtNbrtbn7xYv4EZvVpdT9G7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9d7v3G+jNUwkQiFovFO/9PzwFlJKfJTETZg38eyFlNA=;
 b=og49aV2ZAuRfZcedQJjJUiHzWjGYZLxxLVI9qjpzi+TS7YjiIqf2sDvOFXCN3RsR5HuitA+GRXQo5csRimwlw80DzHfEa75/RuCTYKAhFTfW2D9u16LjhxE9YCt6D2GetRLNdVSjRgMCHiziL1RxT2fyTDJr/pyNxqP/y1Z4XRU=
Received: from CYXPR03CA0046.namprd03.prod.outlook.com (2603:10b6:930:d2::19)
 by LV8PR12MB9231.namprd12.prod.outlook.com (2603:10b6:408:192::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.21; Thu, 28 Dec
 2023 10:21:31 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:930:d2:cafe::30) by CYXPR03CA0046.outlook.office365.com
 (2603:10b6:930:d2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.20 via Frontend
 Transport; Thu, 28 Dec 2023 10:21:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7135.14 via Frontend Transport; Thu, 28 Dec 2023 10:21:31 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 28 Dec
 2023 04:21:29 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<markgross@kernel.org>
CC: <Sanket.Goswami@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 3/6] platform/x86/amd/pmc: call amd_pmc_get_ip_info() during driver probe
Date: Thu, 28 Dec 2023 15:51:01 +0530
Message-ID: <20231228102104.1785383-4-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|LV8PR12MB9231:EE_
X-MS-Office365-Filtering-Correlation-Id: 261b103d-26b4-423b-3b9a-08dc078ec300
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zlUYMz0lMrUSd8XAMjBxG8V/WY/ExhqrUNj68nCaqMXmqYUVE4OvdQZvuxoIi9mLvqtsfYeOucVaTCSp4SayST5LsWqVBFa52SBEnoRfEV4w0rPU5Hm47nfsh5AvberTEJfMA1yOoznKCkKjYjRZL+5m7hubwcl+9oQRR6kGMH9EPPttiHcr9VQs8Z2thos8tqzym9xIJjZAICNicAxqf+R+KzHvbA79JCkorq2f3LdtfCDBH6N7FrQguDRrSKs/70S9Qm2w95qQBA41LX5uGbD3xczZaWmUC746nsara75XflvtXP50XSs2iAJmLxh3GLcXBo6pAJ12ZVFEULzmxHPtuRsMjvEvppubmiFTw7DiIMAzq1wii1YZRrAdJKOteaN589kCQ2xENApT3skJF0JXsPbmonD//rioNvKUBlO2ZKsbazynlVI4Lbr9S9vkNFYdywAx0vIwg1OiqyFoBIX1unLle4kKsNjnr7nljFP6OjKviKAwdWQ6yrpxNPM1ZykxKlEAKdpZCQksGSgb9Y0rMxbyTHT3cU1q4lUp9sPqSo0cULknD7FpLmiCbvHtuHb4hmVV6eapMQjPLxmi4SBHzSTVnYsn2Mh6zkuemUjKp6p/0oIw50rjjvLOx+tX1Taxle610XoTkIXHkLPxm4uLOu9K/EDQA4KX9iPeNwJSYX53/Tu35k9VQSpx8iJNWU+MeNUvXg6kump6z97G3JUrBw8hXnnDv/ZbBsdTbMPN4x2r/uDtBn0Uf65P9gtj6e25kdodYbQstcKwB3PTWQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(39860400002)(346002)(396003)(230922051799003)(82310400011)(1800799012)(186009)(64100799003)(451199024)(36840700001)(46966006)(40470700004)(36756003)(40480700001)(40460700003)(6666004)(7696005)(70586007)(70206006)(86362001)(16526019)(426003)(81166007)(356005)(82740400003)(2616005)(1076003)(26005)(41300700001)(83380400001)(47076005)(2906002)(5660300002)(4326008)(478600001)(36860700001)(336012)(54906003)(110136005)(316002)(8676002)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 10:21:31.6996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 261b103d-26b4-423b-3b9a-08dc078ec300
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9231

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

