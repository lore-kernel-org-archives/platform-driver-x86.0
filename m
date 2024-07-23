Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2041.outbound.protection.outlook.com [40.107.96.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B181527BE
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jul 2024 13:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721741116; cv=fail; b=B8rhbu/hsK6eUa2IKlNjLm2zmIxtUL4R30FS5an13dBGSPFOvBIZ04KNkpk+ZC3sQAeqCmxH1dB41XbVICXedQjn+UkBvGPkq+bLObe7xDv/BMX5lSJvLZzSqyn2W0yuiJskP+gqGb176gpjovEzKB8CCcw6SZxCTBwh/svST8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721741116; c=relaxed/simple;
	bh=Rpjo7SJOqOHmUAOvq7QrLxctT3c2uXI5G5OEY4S4iHQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nNK0XMysczvz4E3+uqkeYsUFfvlDi+lQhad3onr9rHtKEeADLj65AzaqEnINadl5vfSxEFT8qai0G6jN9F5iM0Q30XI2zYGLrTadXkdx9pom6xtHysoMLWTxRmwZExXB5PCBC8Zk0yZhv2vvKxcLcV3NgyrVsXgLKXxcIz93h5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Bu54HvL9; arc=fail smtp.client-ip=40.107.96.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Bu54HvL9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KKbaGHYPFkX4r3vQZwbSZIUrbT8dXH0H2kQhj2gKcqDOS+AteOd7srfkpBTgkBdfuuamXPByuhSUCiODcpWjLnGPUfub3mc6WWrXCxWeO64CJ4gi4BJx45brBBZRKFtEn65T/rrFSZD7B7UQiKR75jIRbrNH1w5gDPhLxVAnmO4jUlwF71tJOELuGtWx26rdLRHCBHLN34gDSRzVb/TEDJN6HFzPB8l97FiNtkP4pcDepNRUpitvHInymyK1dpYknyAt72NBR/LVb7It2p8xlPD6ArRfevOHi1iRgNR/KKBIzC2l9a8PcDFnTTicDR+xjHs8LrYhpK+HBzwZdBBDgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7tl3A9QymwEf5uaYsBiQ1Gmzlp60rciQb6zoIRBcHE=;
 b=rQ4uW8NRyJjU571AGoPxEmiXD8CxHz55BxBgCn6STkgjg+b3dOojrHo+kMP4SKNCvx5fbujHKePaXX+4DxMEih2dGd/fo5kGNRCa4tnq+DHN9Kh2eQHgLWH5rZHK+UnVRja2qloCSEIxLMKtij5090JTuH9EaCOT4g8Gluo2Lp9lE+5bjHhLl9NwKw8KAQ/iccXoXV0DeNe3NSI8Y3a1GyT9QBaCuxYQ1gEPOOQAakhr3L/TUp+FpWsTafd06eCwT+Ik48KrROxGn80yI1X8ICZzq0VN5FbmfNTClNQ9z2hUwzssNav9FMtuDuShisBn0BiQoxigXFunnahLZbETGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7tl3A9QymwEf5uaYsBiQ1Gmzlp60rciQb6zoIRBcHE=;
 b=Bu54HvL9s9e+GJ1wJGW4jvd6xfl8sJ+mTyIwycrO4Kc+JRViXlzYNaWvveajXWJY/MYc75pbhorSABVDu7EthxgsacIkGILXTexDF94mHA4equ+eADvk63/9DWc27S+DRWO4U2snjWzWwkCrW/l25BbdheEHon23s4s3H4M1xdQ=
Received: from MW3PR06CA0012.namprd06.prod.outlook.com (2603:10b6:303:2a::17)
 by IA1PR12MB6330.namprd12.prod.outlook.com (2603:10b6:208:3e4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Tue, 23 Jul
 2024 13:25:11 +0000
Received: from CO1PEPF000044F7.namprd21.prod.outlook.com
 (2603:10b6:303:2a:cafe::f3) by MW3PR06CA0012.outlook.office365.com
 (2603:10b6:303:2a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Tue, 23 Jul 2024 13:25:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.5 via Frontend Transport; Tue, 23 Jul 2024 13:25:10 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 23 Jul
 2024 08:25:08 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 2/2] platform/x86/amd/pmf: Fix to Update HPD Data When ALS is Disabled
Date: Tue, 23 Jul 2024 18:54:51 +0530
Message-ID: <20240723132451.3488326-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240723132451.3488326-1-Shyam-sundar.S-k@amd.com>
References: <20240723132451.3488326-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F7:EE_|IA1PR12MB6330:EE_
X-MS-Office365-Filtering-Correlation-Id: 70dc00e1-f1c3-4853-da75-08dcab1ae0e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AjyrxB4dZVTzKJ99XQj8SgsvhhoMAzH4RJ4aje7SQ3Qd+e/m+kJ8QrqDQLi4?=
 =?us-ascii?Q?RltEdb0aNqCd8uHK8sBEEZPpzq9caztwL/CcpfKLufGFlBA0cb7gs/C8jND9?=
 =?us-ascii?Q?AtTVafH/9t31JzHvUdpan5lfPBGXzma3tC0gi14q66S0hfzf0PBLjw05Vzde?=
 =?us-ascii?Q?S4T8J4kpBsmQI+K0FWo8tXktgVqrYfP4ijqysXkFhklHh1DzIL5Tk0/tdOEQ?=
 =?us-ascii?Q?u+XlmrslOFoHKxvJfUjEqo1NABHbp2tLvW5FPftfKMm8DKSBGQOfXoLHtBbr?=
 =?us-ascii?Q?53+CVey4RNKk6ivYfztYrVqxOgryZfjfDxu/wjmS1xRuRsaqd00ANy+XYYme?=
 =?us-ascii?Q?UUisrkxMXv8/+fsKD9nQ+GIjzhqHSpcli3ucLPtCCQdtIKM9tjXaLFBooYPp?=
 =?us-ascii?Q?xlrRU8a+UcsMhUwjNnsIdxsSqFAHFW4aweeaRsUkuPZjW1i2j5lSGGScDyOl?=
 =?us-ascii?Q?82IUc9ZLQ2j0/TEoxRHuBfMLW4lww3uPXYRgYpnhmmGAMmT8VYTVccna7DGK?=
 =?us-ascii?Q?hTB7CF8Uqkst9INmq6fiMEydcR60To0frqDEVk3OryS1Og1mNkgbGF2OlqMB?=
 =?us-ascii?Q?jjGvUApKRI90B135VbBiZUTfRGo9KTM2sPo4DuDF6L5sn8srKBYm3VSmYg+8?=
 =?us-ascii?Q?+/N+9DlJyyMXEdRwcTc6wEuycVWqB/IIxtNMLGKqCdpckUptN4nocxn6UMVO?=
 =?us-ascii?Q?ojKP3LW2mAtJMHzvNlOaJCQ0vLjR1xf+apWW+jnwnQUw1d3wG2xIOn6qc8NJ?=
 =?us-ascii?Q?dZTMh0DpduHGV0EJEVdvHbJju5zoKdWRkLbtF5DDk7ifP8702lV5jOQSorC7?=
 =?us-ascii?Q?vLqnWCwwWS8tSkL1+8M/MQKRaPEeHHSdwlzeespBH6rB04OnyCtfQtHXmH2P?=
 =?us-ascii?Q?lPsNgLqtYsu6vpdoJsIKHcr6wOcInrLhJ2yapEwVUN6vDxAGva595qlRny4X?=
 =?us-ascii?Q?fTwUu6SfH9zhZp2tBPN2nsFSOWiA8ctkYzaS0DcwIEskgc/EV2YhUKb/fhvf?=
 =?us-ascii?Q?JzNf377v5QU2Lq3A3J0ab2n/r2E4G26aovmmlEX2Aqh99b3b756MEfmwcEVr?=
 =?us-ascii?Q?pLOw/4dNnu+KhpxIqS4RNnvd2Q9K4PW6mPj6OVgK46bwwaAOHwpSI+btd8Rb?=
 =?us-ascii?Q?DN+Yh7Dw89ghoJAdt/obDvJgxeqpGaUJBRyZpDIwOTqT2mdrecJ+4Dp6jx7J?=
 =?us-ascii?Q?H7EIHOdrsBsyqZ+IEUy9dDGJ+4eqIFmiVsah8kT/kaIFb4lA0qc036l259fx?=
 =?us-ascii?Q?lCODJ3cfY9MGCvYLSOibO+y996ii6FcFPIDnqmY3G+M5F4ldlNi4PHnplsa8?=
 =?us-ascii?Q?SDzku6aKoMYoLQboQC3styba52wcEfnjRUFqtpNlHoOgCCRD1PR/uQcrhnOk?=
 =?us-ascii?Q?NwIcd8JtFMpb/3bu65c4cxGtQtxOyva5rWe4uWby5lq94Jz2utV3w7cc2S0X?=
 =?us-ascii?Q?fXPuVNLuuvRjUYyAoE88bFZaOs/YrH5p?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 13:25:10.8693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70dc00e1-f1c3-4853-da75-08dcab1ae0e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6330

If the Ambient Light Sensor (ALS) is disabled, the current code in the PMF
driver does not query for Human Presence Detection (HPD) data in
amd_pmf_get_sensor_info(). As a result, stale HPD data is used by PMF-TA
to evaluate policy conditions, leading to unexpected behavior in the policy
output actions.

To resolve this issue, modify the PMF driver to query HPD data
independently of ALS.

With this change, amd_pmf_get_sensor_info() now returns void instead of
int.

Fixes: cedecdba60f4 ("platform/x86/amd/pmf: Get ambient light information from AMD SFH driver")
Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/spc.c | 33 +++++++++++++++---------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index a3dec14c3004..d9e60d63553c 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -150,7 +150,7 @@ static int amd_pmf_get_slider_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 	return 0;
 }
 
-static int amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
+static void amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
 {
 	struct amd_sfh_info sfh_info;
 	int ret;
@@ -160,26 +160,25 @@ static int amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 	if (!ret)
 		in->ev_info.ambient_light = sfh_info.ambient_light;
 	else
-		return ret;
+		dev_dbg(dev->dev, "ALS is not enabled\n");
 
 	/* get HPD data */
 	ret = amd_get_sfh_info(&sfh_info, MT_HPD);
-	if (ret)
-		return ret;
-
-	switch (sfh_info.user_present) {
-	case SFH_NOT_DETECTED:
-		in->ev_info.user_present = 0xff; /* assume no sensors connected */
-		break;
-	case SFH_USER_PRESENT:
-		in->ev_info.user_present = 1;
-		break;
-	case SFH_USER_AWAY:
-		in->ev_info.user_present = 0;
-		break;
+	if (!ret) {
+		switch (sfh_info.user_present) {
+		case SFH_NOT_DETECTED:
+			in->ev_info.user_present = 0xff; /* assume no sensors connected */
+			break;
+		case SFH_USER_PRESENT:
+			in->ev_info.user_present = 1;
+			break;
+		case SFH_USER_AWAY:
+			in->ev_info.user_present = 0;
+			break;
+		}
+	} else {
+		dev_dbg(dev->dev, "HPD is not enabled\n");
 	}
-
-	return 0;
 }
 
 void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
-- 
2.25.1

