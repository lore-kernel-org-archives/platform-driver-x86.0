Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2044.outbound.protection.outlook.com [40.107.101.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7B411C85
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Feb 2024 06:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708065724; cv=fail; b=T/ZwbCxPi+Mbf91K4ZGMGAHL64o3+6p1rxY7fkC505HWxIlV/jfxvGHssXNao7dFENNdUCGNO5QNBBDZhHRzG+vQ5es9WPIFtbeJ9xDZ2AApmDcZ9kxOC5SzQqt+VGv/NtFpyth+qr22twsJynaS/ECe5YS80LdhpYl7E9vlVj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708065724; c=relaxed/simple;
	bh=2npcJ2E+CjdYh88MnSmU7l5vlx+nXNz6RWWjOozJIM0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=N+xXPecrOoV/DQRaiCfXNSnNt6XrvIJElUy/ghkWbUkmpI2vJ9ep3kuthEySfh0lhxAZsA5WAOKYbYGnaG4tvC2BoegPvfTqa3qnVdOg9ImBX+kKnIYgwYHgkrp+5u9G5V+U5m4Yop2NH+vvdQfAxu1aLxMegjbKRAUUHCpBQ1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jP3R0e1c; arc=fail smtp.client-ip=40.107.101.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jP3R0e1c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AcYPqvE8xDWNwkYDjt2T554++gtyx5faHuilIihSZzsTRaznhrhchZZCtLngmGIxzvqBOdtY3saGydc1Njps+7F600xH1ZbOVmTCnMibva/GuL63WK81A//eZ0pyrdhxLa1LY/SCBUWQltBIF7exSMzyMjmkv3XpzPsdWTPhZiDIWqwTVOPmoa+cwKxR+rV3I8vsyjVDikJJoIoHmSgLMSaCLIgl6X/52nHzdp5NZUtTQHZvG+wrizOJTnAgIqp6W88lkfhHccmoExYgR7AvpzFFHSBetmlp5Jf4VOPOfvgZn04TGU9fwL4Zvj74vlYGBhezXjQLBUqshrD16CdJ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+mhXdiEtIkXWVUPifRqLCc4I7yMm6cmT7Xxupi9t80=;
 b=XuYlGt4L6Kv2FC9WLkOrL6Et7XG9NINubWTNaA7V3/G9PL0gXUSCVSOGfWQwCbT66IIBXBfe58zdsAA59cGhCZLWBfxQjmYneMA3lwL4v7FDcvwp9K3ICLTMjX+Y/xikfulmMPAbvMj/c2Ow9Uu/TCyB2IaDciQrV5pswBGyA5TOcG2xAgjBZwa9gFwORe9zvw1zPbVkYKkCuW6LGTTywbnBTSwpRDNbKe1/tHs818VXGUxxwa5N86/6cHTq77HFwtR86flS9XOLwHe9zvMBRMprOfG8Mqljp6gYqmTg3tMGqOLQjyPgDOCloJp6NiT/73pwbF6cFyOWxomlioN+gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+mhXdiEtIkXWVUPifRqLCc4I7yMm6cmT7Xxupi9t80=;
 b=jP3R0e1c5cP7r91X8U1GtSwL/A/VX1eKs29kneFfvOdw97zJwhr4TqNA7MSUb4O0aAogDbezSMeKLZEFhiM10m1aFyz0EFIPW2pj6txbaIpN5s1KlFnQgTI972apG0dy+I7ifhAixhwIMbd9rNFLbs6ZfkcVOWjhszIEFP95GTY=
Received: from CH2PR02CA0020.namprd02.prod.outlook.com (2603:10b6:610:4e::30)
 by CH0PR12MB5252.namprd12.prod.outlook.com (2603:10b6:610:d3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.11; Fri, 16 Feb
 2024 06:41:58 +0000
Received: from CH2PEPF0000009D.namprd02.prod.outlook.com
 (2603:10b6:610:4e:cafe::c5) by CH2PR02CA0020.outlook.office365.com
 (2603:10b6:610:4e::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Fri, 16 Feb 2024 06:41:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000009D.mail.protection.outlook.com (10.167.244.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Fri, 16 Feb 2024 06:41:58 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 16 Feb
 2024 00:41:55 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 1/2] platform/x86/amd/pmf: remove smart_pc_status enum
Date: Fri, 16 Feb 2024 12:11:11 +0530
Message-ID: <20240216064112.962582-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009D:EE_|CH0PR12MB5252:EE_
X-MS-Office365-Filtering-Correlation-Id: 2db8ab5a-1f3d-42f0-3ec3-08dc2eba5fae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	syoUZpKTndgcgFWOrOMyHHLWwIp1md6YjAG46YNo+labwgWmnq8AbfTHhYaMdNLpJIg+bauJBHIGFurw4Eyz6sfNo7Ymt1WJWjojOatqlFQJ+CRlvKWLbw+CQ4mNoozVnDq3N91t4a3+fBTKgLFoD8ogiC4yXG1PmQRSISmilplVG/8d+rlfh5n8XEngRaOd1JrsmWe+AAARcVL1NLVh8QHF0GFn1T+mDtM1Rg+iToVxduns/sPcXDKt8EJtm6A855nF0+38BL4aaQ1vb0PuNH35W5dXFlRbS8hldrwzOu9l+1cFXb/D5o8eqVxYxO6KN8P/xeeawTpAV23oGoGo9/v9FFdiBHwUgKjNV/htZMb5i5oiIEj+G8mTXdoskaS6uqitUoYhm07IWvDu5OyAeQg+BUzpJDbVrNFPphLYZDuey6hrOw+zCjVQADu3JfEVZv9WPeggfnz4UeZdrI706syaMqkaEfe+JaCt5vStRFQVDHmLrj51F5mUcbnlU/mLBedAdKftMXCpvkjRQXBjK3B4bIFa8ygX3SThbjs5KHSTRXqfuzGbGabAj//tySMYISbeg7O5QEjF7zfD8do26JqDiFOLzi3ImCUs6VJCYrbudvZkxAfgDLNnX73Sg7eKN1Gl77QQSzk/8+rnrTn2SHTNdWLwLQSUX56/CaO7eLM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(376002)(396003)(230922051799003)(36860700004)(82310400011)(451199024)(64100799003)(186009)(1800799012)(46966006)(40470700004)(82740400003)(356005)(81166007)(5660300002)(2906002)(4326008)(110136005)(26005)(2616005)(1076003)(316002)(336012)(16526019)(70586007)(6666004)(8676002)(54906003)(70206006)(8936002)(478600001)(7696005)(83380400001)(86362001)(41300700001)(426003)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 06:41:58.3192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db8ab5a-1f3d-42f0-3ec3-08dc2eba5fae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5252

Improve code readability by removing smart_pc_status enum, as the same
can be done with a simple true/false check; Update the code checks
accordingly.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v2->v3:
- handle missing case for amd_pmf_init_smart_pc() after removing enum

v1->v2:
- remove enum smart_pc_status and adjust the code handling

 drivers/platform/x86/amd/pmf/core.c   | 11 ++++++++---
 drivers/platform/x86/amd/pmf/pmf.h    |  5 -----
 drivers/platform/x86/amd/pmf/tee-if.c |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index feaa09f5b35a..1d6dbd246d65 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -330,9 +330,14 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
 		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
 	}
 
-	if (!amd_pmf_init_smart_pc(dev)) {
+	amd_pmf_init_smart_pc(dev);
+	if (dev->smart_pc_enabled) {
 		dev_dbg(dev->dev, "Smart PC Solution Enabled\n");
-	} else if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
+		/* If Smart PC is enabled, no need to check for other features */
+		return;
+	}
+
+	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
 		amd_pmf_init_auto_mode(dev);
 		dev_dbg(dev->dev, "Auto Mode Init done\n");
 	} else if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC) ||
@@ -351,7 +356,7 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
 		amd_pmf_deinit_sps(dev);
 	}
 
-	if (!dev->smart_pc_enabled) {
+	if (dev->smart_pc_enabled) {
 		amd_pmf_deinit_smart_pc(dev);
 	} else if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
 		amd_pmf_deinit_auto_mode(dev);
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 16999c5b334f..66cae1cca73c 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -441,11 +441,6 @@ struct apmf_dyn_slider_output {
 	struct apmf_cnqf_power_set ps[APMF_CNQF_MAX];
 } __packed;
 
-enum smart_pc_status {
-	PMF_SMART_PC_ENABLED,
-	PMF_SMART_PC_DISABLED,
-};
-
 /* Smart PC - TA internals */
 enum system_state {
 	SYSTEM_STATE_S0i3,
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index f8c0177afb0d..8b7e3f87702e 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -260,7 +260,7 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
 	res = amd_pmf_invoke_cmd_init(dev);
 	if (res == TA_PMF_TYPE_SUCCESS) {
 		/* Now its safe to announce that smart pc is enabled */
-		dev->smart_pc_enabled = PMF_SMART_PC_ENABLED;
+		dev->smart_pc_enabled = true;
 		/*
 		 * Start collecting the data from TA FW after a small delay
 		 * or else, we might end up getting stale values.
@@ -268,7 +268,7 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
 		schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms * 3));
 	} else {
 		dev_err(dev->dev, "ta invoke cmd init failed err: %x\n", res);
-		dev->smart_pc_enabled = PMF_SMART_PC_DISABLED;
+		dev->smart_pc_enabled = false;
 		return res;
 	}
 
-- 
2.25.1

