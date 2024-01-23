Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00F35F861
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jan 2024 14:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706019346; cv=fail; b=uP/kXUax+oy+bc006MmAZzoJhbAjzWHuAngkYdwkl5J0Vdqs7NK2Tqo7TCkf/GI2Dg/ni8AoFS0+lUY5PQtJ2VINblKwpYmAyoMw/NEE6AYOCV0A72icmhXlzTjunushoS4r4CHY1beA6pstfJGB+KgMET2BmNDqJ63Y8AJof8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706019346; c=relaxed/simple;
	bh=7YXSBUjQ3dMUT1Ptkt+nyxzmgIu/zduGrUGp5Hme6+g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lgWanz0SEefAuPSjf0zwLMwSR/cy8UvS7GvW3ZVodazIiDv2EcT+mad+KonRC8LsjyD0taqm0yVySLsnz8LmRfoNdBAbcwx5jS7GHfwuPYq8A8MzSki+WVWChPK3NzQBVSMCq2RnIWK05E4WIsjyQ1Ehg0LCrPvIwY41XRGGyJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=af1nx1xe; arc=fail smtp.client-ip=40.107.220.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="af1nx1xe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=johNJeU1mcEYx+l38Ow4/EPdnwZrYTFC+7MFgFHn8qChqV5GykjnXir63cr5zt0tSyZZAWJGteokgDd2Cxf4ey5QFaVAuTQMcU01zVIFRblePRhsdjT9jWoQZrsz32YXb2wyjRr3GeTwuphuYe+cRL15R6Ab31Tpsy3jzMkJb0RHDuhcMpz2/gCW8qldk9PGqFymLhVFXBKWwIVa0y9IhqYgLWQofbSP3l4p56DpsduqyyEpVF0car8/LTUrsmJp0qCCKtYZAlzeZDlY+Q8bHBOzFRZRJw3Ixb61myOiTwj+pabDEgKpyrz8gL8Rq0fYppPgJ4y27CixTaEXOahTBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91wY/S1vR0sT+f0kqK2WRdOjII3S23732r2mtV4Nd28=;
 b=BIZxmTLXRCLeiERrQCz/Q1vgQyntPm3CpW5ziDJuZte08DphvWpOlgtB03WsikFjJYYZvcV6JSob/+HaW2V1TCeAvEVztrFCtdbSM19n13ATLWpb7Evcaxwh7ggyisEhYOIYE8kI916abvfI7XM5nqET8AuRIk3K/9ol6jRAO6QC4AA9xmchlMbLf8GG5uB7uCstHtwVfJcJVDIBEmJQGmg0st8mpBseXCEyTAmaUT29iwhX6LzQtT3Oaw/NNfGAthVs9MMWgac1901FCZmD5MqjDpMRbQbagS/MHF+6VavB4ns1eYF4vQOHuadMW1b9HXFoLNpo8i4E7ByG2jMrJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91wY/S1vR0sT+f0kqK2WRdOjII3S23732r2mtV4Nd28=;
 b=af1nx1xeQ2BVWEjjNjVBLTodzvqaUBJszTjsIcjYMArsPT+HAqovPCXN5exjfqHjO4xTY7Mq/DNbebWAjusn9igITfyVkmLd/1Do0UsTQUAKNJBv4/B06SE/Zk+guScR6ahy3jEb8rZDwqxiiET1cF2XFyfJ6yNaOn1zixfXG+Q=
Received: from CYXPR02CA0040.namprd02.prod.outlook.com (2603:10b6:930:cc::25)
 by SA0PR12MB4511.namprd12.prod.outlook.com (2603:10b6:806:95::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Tue, 23 Jan
 2024 14:15:42 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:930:cc:cafe::ce) by CYXPR02CA0040.outlook.office365.com
 (2603:10b6:930:cc::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22 via Frontend
 Transport; Tue, 23 Jan 2024 14:15:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Tue, 23 Jan 2024 14:15:42 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 23 Jan
 2024 08:15:39 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 2/2] platform/x86/amd/pmf: Get Human presence information from AMD SFH driver
Date: Tue, 23 Jan 2024 19:44:58 +0530
Message-ID: <20240123141458.3715211-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240123141458.3715211-1-Shyam-sundar.S-k@amd.com>
References: <20240123141458.3715211-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|SA0PR12MB4511:EE_
X-MS-Office365-Filtering-Correlation-Id: 2015db3e-db82-4e4a-1858-08dc1c1dc8a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T2jS59SVG5iQkR/0TfK9J6vseb6TKBzz5DtmgEChSWfjseqyt+rX/SJJ9YUFaVYjAXBnMUh4ta9YYX4XKEnh0gAToidGxYspZyuTgt5Ldw+H2Hvn6Nt3nqiTJg6yK8Z499fkK9XT6LiOY/ZHhS5wL5V1HcRVIwFqfTd8PMh9uXKlwKF2sCS5u6lwc6sPgGYMZAB6C+0Z5vjLRmAMsUXG6XnfLIyuPPcTQuw1wsjp0ScbOC8X7tyBKnWRlAl8GXgyTJ2jkwsTBLLDlbpyIB1DVjGmN2KBcFkTQ9Zhx0riioh8hgnbh0n1FfKHCUzc2NS7krL2s6q+nbGQcwX5V1HhaKtYM1VQ5fdFrSVhHQy92AU/6PH+HZl8JTnOh/gcbnoMCzFF0ZCXHOQD87lEoE2RuOln9xbEHLSxrEsQ+EZRqFz8PA5HDuBbfYzRxpOEVd9MNUGV7w1WoqojWBpuPB7op/R4l+zfKAK8ueIpfRiYHyQSA74E8WA2N+9jQiX+x76UpCamHQFHXsex93CHKhdWaDx2gFKGoyhGZLpWUZvfMk9ZpfcAAKypGeJeZhVUusHJOf7Gzx4wwtp7AAYGXUcII4orPI4KLYoBvtX8aH4IeVHl9eLN2VRMjmj6RU+SiqOPNxJ9/8zQdaAdi2Lj+GsHTe80QyMx0pbHu/KSjyZ9jLiS9B7nhyvpb6VWn8VJXi2TW5eji45Z+JtJVHLTua5iYX3qy4YiDb4PhelLiYi4excOP36iK7HvTS2euYvToXBdJT2ssTvHeoFDVj7aQAhMdw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(346002)(376002)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(82310400011)(46966006)(40470700004)(36840700001)(26005)(16526019)(36860700001)(426003)(336012)(356005)(7696005)(6666004)(41300700001)(36756003)(2616005)(478600001)(110136005)(70586007)(5660300002)(54906003)(316002)(70206006)(8676002)(8936002)(4326008)(82740400003)(81166007)(2906002)(86362001)(1076003)(83380400001)(40460700003)(40480700001)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 14:15:42.4606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2015db3e-db82-4e4a-1858-08dc1c1dc8a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4511

AMD SFH driver has APIs defined to export the ambient light information;
use this within the PMF driver to send inputs to the PMF TA, so that PMF
driver can enact to the actions coming from the TA.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/spc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 87ae7c41c9f8..a3dec14c3004 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -46,6 +46,7 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 	dev_dbg(dev->dev, "GFX Busy: %u\n", in->ev_info.gfx_busy);
 	dev_dbg(dev->dev, "LID State: %s\n", in->ev_info.lid_state ? "close" : "open");
 	dev_dbg(dev->dev, "User Presence: %s\n", in->ev_info.user_present ? "Present" : "Away");
+	dev_dbg(dev->dev, "Ambient Light: %d\n", in->ev_info.ambient_light);
 	dev_dbg(dev->dev, "==== TA inputs END ====\n");
 }
 #else
@@ -154,6 +155,13 @@ static int amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 	struct amd_sfh_info sfh_info;
 	int ret;
 
+	/* Get ALS data */
+	ret = amd_get_sfh_info(&sfh_info, MT_ALS);
+	if (!ret)
+		in->ev_info.ambient_light = sfh_info.ambient_light;
+	else
+		return ret;
+
 	/* get HPD data */
 	ret = amd_get_sfh_info(&sfh_info, MT_HPD);
 	if (ret)
-- 
2.25.1

