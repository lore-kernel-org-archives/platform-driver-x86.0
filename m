Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2047.outbound.protection.outlook.com [40.107.95.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE3628C5D2
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Jun 2025 07:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750144495; cv=fail; b=SurUB+6gOofbPjMbCGlA2XKoXIgE7O3cxuman9zD2BNvto7R92oI5oNVbyvW53rGywJT8BLEQ+O0hf2fJQKQyEnnKbM/BAp6GN67nsFCvIHs9lYMW5TbDqczZ/K5/zT/D0uehXq7oQ8TzZbPW7ItREd1V809E5bMXq7Jnd9bwPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750144495; c=relaxed/simple;
	bh=w6monWD9qhWcr9LzQnGG3ec59nIk1zsuo8UQkJPJlnk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=efJbxnmW9UqiVgZUAIRxveWol8UUefv3g6sWHLx9wvnT2dYZ0YI7vmWlOEnMNhn+cGjiqlTQOL2FV76TB45R/iN7BZZTTMy5/WHJwpXVoaPL5RsN26n5yF0Hsbkvblm/7G/ZrWLRaQoABcsHsYV4NEoKXr+qw5jRo3ZjZxSTbRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PujtLug+; arc=fail smtp.client-ip=40.107.95.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PujtLug+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZFWS7ahGw8y9sJwQut5S9n9jGXSlXpNduuDchAs5PLz28XskZySKOmz5SJ8LWKPbEo5Y4/DQa5RFDyUm5CvwgPqmnrwkPQTxB5eTr+6M6CqZyPkpiVTzeMmOFBsRHsTkTM4e9bHOfWiNmyd+eI8slNENImSzlt5FqLTg1rbxiiGfagmFcOv7d7wBKD3PzVg0d8drvxImLMWl8007eYw38WO5d0BKkuczaaya7a09KK/lsVNasc9ODeZXal1VCPF59XcO66jVTBttYU7/lgNT2pYzleYvR/LX+OxY9IuH32EEkBltMUzKrM7GCctnPf3MGFTvZ3qSFcAfWlCnHl2Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=diCQtpKaXLcSV+D7lkTWXascU8m2DzpXZX7tlsjenpw=;
 b=ejqV5nEFvJw5q0IfWfO+8ulviUfixB0U9QBCosiQJ9HTkgJIQQ81g1P3iiXGoxQR0o+RkFcRC+VoYEmhxDM7ERimTGDQ2OD87udVomzQraSPBrNKu79+jEqyuQTJAvEBNI2s4JCkNiS+MRltkLGWKm5Ivggp8O71HhMLQ9ehDdMY351NWbInbX0uBwk4VSuNoAbwM4L8jeyY898WBvZBtRnvNGBcmhnb6/gTFJKI7fPt1lUT8Fz03lVV1e0DHOO9sESOxK1yYQ9tR6Y+EheFylE4eMRS/xFgpM/D2J3cNfNmmQ9aS4e+Ev77mhNV7xzpV6OGkTMDcbqSphlGroA8Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=diCQtpKaXLcSV+D7lkTWXascU8m2DzpXZX7tlsjenpw=;
 b=PujtLug+IOhi/sVOXu74GYFVpqy5+jt/WyVRxGmIhsY+/Pg+1asqxGK/EH/RoPpsgRcguIVGxTj32C02ZuHQQu6/oHKtOM5GVGowCb0r0gaqDMQmx18QKK85exzWgFrB22ZpP8q2D5tCrh65pPhPRElkEU8ixhM1YDmtSED2KX0=
Received: from DS7PR06CA0001.namprd06.prod.outlook.com (2603:10b6:8:2a::12) by
 CH1PR12MB9600.namprd12.prod.outlook.com (2603:10b6:610:2ae::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 07:14:48 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:8:2a:cafe::fe) by DS7PR06CA0001.outlook.office365.com
 (2603:10b6:8:2a::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.29 via Frontend Transport; Tue,
 17 Jun 2025 07:14:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 07:14:48 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 02:14:45 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@dell.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 7/9] platform/x86/amd/pmf: Preserve custom BIOS inputs for evaluating the policies
Date: Tue, 17 Jun 2025 12:44:10 +0530
Message-ID: <20250617071413.3906284-8-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250617071413.3906284-1-Shyam-sundar.S-k@amd.com>
References: <20250617071413.3906284-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|CH1PR12MB9600:EE_
X-MS-Office365-Filtering-Correlation-Id: 50d00b5f-869f-4dca-2209-08ddad6ea525
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XlrG7QynseAVUJ4nSQkgpsArdZrCowS+2O4WQashPQIrNa5P5axh4NVnzMkZ?=
 =?us-ascii?Q?oZArUaoJEApYOMiugkSYRs9kevMcRJglOlQ2DhAMUr82LMhFfb0GaCY/l3/i?=
 =?us-ascii?Q?rShhk61KcucCkQUL2SHcB23S0XoITY9BKeMv7KeCXKG0WruV1uh6CASwHNJh?=
 =?us-ascii?Q?NECqq1G4/p6ER86dqtxKBlMYSiLTegcfMG9j7/D6VqTHCn8t0pZ14g7Xxou7?=
 =?us-ascii?Q?Sxqzj02rBdamqDfM+dUSj7R3REgI5+Hhnq4sQx9YR97/epA/dDGWBaA0gXRv?=
 =?us-ascii?Q?AM4kACPy0d3iSsoTc2QwQqta7tNDTszQLHjBofiGKSLcueiumQqFsC4hQvsP?=
 =?us-ascii?Q?2uSjSfncgxDQnyfYB8HJgAYjYvI0LcVt3WX11WiHZ4g7O3tBrddj0sN/TrTY?=
 =?us-ascii?Q?ysfWtDniDmXdvUQN24hRRGvMjYWbKbipPGw4vjLrbVRjyq3fqUY09bJ6yJEg?=
 =?us-ascii?Q?j9r+wfEhqbwUCxGKLtpfqW7W9Q9kvFEjPqOV81oXYVcWZoPe8droQ0OK1B8b?=
 =?us-ascii?Q?zVR4MZjCxGjcW7brEbBaFndCAPElk2jw7a38CZrDBD3uVeBnAUZMwNmhYSTk?=
 =?us-ascii?Q?8h+Q+yl9mqquCDkoC6u2OGWWuxDR7HbKgkAI9vBGk/PMWsmrnSVlas4B0/Rh?=
 =?us-ascii?Q?P/HBfQBl+bKG53q63ZJCjTkFcZYFCU8pNoRiwep23PUpj4rDmJK4pc59rKt5?=
 =?us-ascii?Q?Y/vxavewBhX97vDBKGjg9q0/QMF9Z3XbrSbPrg5L7v3MV55bQtIJVoe9baBI?=
 =?us-ascii?Q?yySdrRuqurRznyaYLG1xcz9U4eXGtHz13IVqKzlipi8yGxBy0ewfKEHkk0WM?=
 =?us-ascii?Q?n/DKUEioL9lSjkSyyNgAaHJ3R4nnAwxdeaMykzSvpXcM8IQUxg3DGPGs95sC?=
 =?us-ascii?Q?ZOpFw/NdYU96YtSTjFzG7z+BS60xsLFftaIJCUsu50rTa6LzPkOz8vPmCYJZ?=
 =?us-ascii?Q?QFAngPo0mZQZI6IdN34X7OcZq0jELA4Wv9MA5PSbuoe3F65asFqBbQTDYlIp?=
 =?us-ascii?Q?erZ8A3n7vjm+CR33cUie8F6Sef4helcw+7DhqzR/LimT60JLPJrhnIbaMjMn?=
 =?us-ascii?Q?qpJRTyeLTIu++2hAai9cfeIX2RfNH8KSfbXD2EXphHzsntoWzgC92hquG92+?=
 =?us-ascii?Q?a6YmpDHHSKtXCIrqzIjX+28l10tZ5P3kdnwoXk3IUCvY8clzZmaMS/Hlmzci?=
 =?us-ascii?Q?q1KmIQOv2ttMV8fNyidG1YB/Ob1zJrW+nCAeiFjuNKCpC60fOTn1ONWyD6QE?=
 =?us-ascii?Q?2IADuTvVIlAIWBoem7kZnBdawI1sxQE5nYFXuIfbzwbscTvKip7KEW1udjRh?=
 =?us-ascii?Q?zfeyaNLTewV2W3oHwhxqEfbyTmPZtKuaOb9MtjkiSOUheYQhsWtqv3lyODFf?=
 =?us-ascii?Q?bGxK0r3FMa3Rt6CpER2wDBtJVzc8iUzGjupxQrmlw40KfTaosrS/OMAYYmc8?=
 =?us-ascii?Q?7WXPVfPM+wMt58+6efjzhBB0cbHTjxDVBdQs/qRCBIRxUqmdrY84iRVieU5+?=
 =?us-ascii?Q?4aqcO1lxSYPGbM0oVhKcdxqfL/X1z8256aOY?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 07:14:48.4614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50d00b5f-869f-4dca-2209-08ddad6ea525
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9600

The current code fails to send multiple BIOS input data to the PMF-TA
for policy condition evaluation. Only the most recent BIOS input data is
properly sent to the PMF-TA, while previous inputs are overwritten with
the zeros.

To address this issue, the BIOS input data should be stored and passed on
to the PMF-TA.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h | 5 +++++
 drivers/platform/x86/amd/pmf/spc.c | 9 ++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 6f8a275390f9..e10b8fe68e67 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -355,6 +355,10 @@ enum power_modes_v2 {
 	POWER_MODE_V2_MAX,
 };
 
+struct pmf_bios_inputs_prev {
+	u32 custom_bios_inputs[CUSTOM_BIOS_INPUT_MAX];
+};
+
 struct amd_pmf_dev {
 	void __iomem *regbase;
 	void __iomem *smu_virt_addr;
@@ -401,6 +405,7 @@ struct amd_pmf_dev {
 	struct mutex cb_mutex;
 	u32 notifications;
 	struct apmf_sbios_req_v1 req1;
+	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
 };
 
 struct apmf_sps_prop_granular_v2 {
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 7179c3cf6280..97dd6025b4dc 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -113,8 +113,10 @@ static void amd_pmf_update_bios_inputs(struct amd_pmf_dev *pdev, u32 *bios_input
 	int i;
 
 	for (i = 0; i < CUSTOM_BIOS_INPUT_MAX; i++) {
-		if (pending_req & inputs[i].bit_mask)
+		if (pending_req & inputs[i].bit_mask) {
 			*bios_inputs[i] = custom_policy[i];
+			pdev->cb_prev.custom_bios_inputs[i] = custom_policy[i];
+		}
 	}
 }
 
@@ -126,6 +128,11 @@ static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
 		&in->ev_info.bios_input[3], &in->ev_info.bios_input[4], &in->ev_info.bios_input[5],
 		&in->ev_info.bios_input[6], &in->ev_info.bios_input[7]};
 
+	int i;
+
+	for (i = 0; i < CUSTOM_BIOS_INPUT_MAX; i++)
+		*bios_inputs[i] = pdev->cb_prev.custom_bios_inputs[i];
+
 	if (!(pdev->req.pending_req || pdev->req1.pending_req))
 		return;
 
-- 
2.34.1

