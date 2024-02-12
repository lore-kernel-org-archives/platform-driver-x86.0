Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2A95680
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Feb 2024 09:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707729912; cv=fail; b=VNKTdtOL3dXN7/uqu6pEkUqniJ4XVXYZrsbm8diLYvSOHivMMoxSn+Q4PQdEbMnAxarP+gUgTqYR8b+UoFaQsYLmyeTY4al8TMBaT+/h/m9T7Cgv0mcAAXMUsPhtL1/BqhwSE8ZzCegmO0oVuldhk1fcbbB9vIvWuHblqgIhxVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707729912; c=relaxed/simple;
	bh=MezR/+vHoXQoUjwW1Aqx/L4l1wvrPJ8I885osbACv1A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bvFOoVBPiieXGs+wBuLLeqEVfRFpVRQDzDedo8CU6krOfT677SoVSoGhhRKIPFGFqKhV7OTCExCawiJ16GDvwtkxoN5+RL1VwsdPeO6yZ6K9YRgX01Hvjx7ONuOHABINAQdaDt27OhDX4yW8lheENkE/ZTlDnEFC7iRSK9SROMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OBJuobWJ; arc=fail smtp.client-ip=40.107.236.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OBJuobWJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TI/Btgzag3uO2QWxTdUHxOwGBodLHda/M5hfKBMhcrDzyG+nWt+TDKUrvMmLJu9U6hCTU/TOSTvA9eN7Hbk/1kx5Ywq2P3tbRXqvYRh6RDja9j26A90xL27GCaXNJiUksI7cl5pAHC+/dYvG+VPDQJauPPbCcD3PO6CY7a4jF5wZQ+xE2wf29krlErDqUs80rDgh3lYoreZHid8GY64F/HoAaUB4NQQuDzUg3p8bkRjVXG27gfYwaIlZV8mvmdl/o9Q4TjWP5HIW/urDNjzMgs4SRoEIqR4UQpFtp9j2wVUtMBFYIs65jvCuyfpBdGGPn4tvomy4ELFdE88CzyBodg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9wYJJJXyBhyyNumEi90gRj1xx3IPZWkSE2sobJ6GIcY=;
 b=QaEvWkIOfC+vLkffL3fpSqksYhlUgA2Id/t1TosGkTPA1RQ85aCQt2Iqf5npdSHvz91R/WDbiTN1WlvoEUeeq0DMsQZd2ApSTtyynshdrvprMB6+EOviRb0J6oiwBsbrFe9ItCKhfDyxvOgUnZ3tYRiEX/i9Jrpms9vX4GIUKA+fV58gIl7WRJiWP36KDnONRLK7yEG01HqJ9GTVoY6joMqhMpyG6EUqKjD+NnF+iqWc5PMS+PMDEfD7kxTFhuiyaGe7G3B8n7p4Is88FJ41bBBA3nGUKuzsR1GKGFSAf/zznxJfQaSCc6uFW0/qyKbiQJCLE/uwUwasLhmu+txf3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wYJJJXyBhyyNumEi90gRj1xx3IPZWkSE2sobJ6GIcY=;
 b=OBJuobWJmXhZuwi1mQ//0gzwH2CDdW+OgoXnhMbdlwU09ctMine2iRP7LDfB5nJyKWCkIoNO/Zf87HiHwaIgfamOASV+jgnI6FvzfUMTyQlGbgoqhmrjbp/JdIMCSvcr6EqzoAlq2qd/7njzBDjPtDeQYtU5+DAlm/1a3xixlC8=
Received: from MW2PR2101CA0011.namprd21.prod.outlook.com (2603:10b6:302:1::24)
 by PH0PR12MB5677.namprd12.prod.outlook.com (2603:10b6:510:14d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.25; Mon, 12 Feb
 2024 09:25:05 +0000
Received: from MWH0EPF000971E4.namprd02.prod.outlook.com
 (2603:10b6:302:1:cafe::f7) by MW2PR2101CA0011.outlook.office365.com
 (2603:10b6:302:1::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.0 via Frontend
 Transport; Mon, 12 Feb 2024 09:25:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E4.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Mon, 12 Feb 2024 09:25:04 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 12 Feb
 2024 03:25:02 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH] platform/x86/amd/pmf: Fix TEE enact command failure after suspend and resume
Date: Mon, 12 Feb 2024 14:54:40 +0530
Message-ID: <20240212092440.4135787-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E4:EE_|PH0PR12MB5677:EE_
X-MS-Office365-Filtering-Correlation-Id: e5ef0a9b-bf2d-41aa-6973-08dc2bac7f50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5aTVCBTSndys8I9N06ShPVL9VbCxJFHZy3yxeJKA8lvzz/6+yfDnARLR3RrDi75s8I/1XYtnROu/J7mailcwLgVSygkm6tGEDpyGLPAtUBMic7qj3r62YJPBv/qE6+vktvU0fbb+knVZL1H+A6mW8ad0JuOpsrJjGR3WObfDjbXE/rfbOHdlQiNJeQSAw76ezViJ7++vR/x5pyZVj1eX8qMphdLHPW9wpTal7mLDJ2bdnMCu/7cNacB0I+Eo58Xlj+hDPr+ebGYkegITgroNxET1OmObhIuFiT/kbldtde/kU0TPPr6QKsmTz4Za+Gd1kVAUaV8kbPutue/lokTco6Z9Zen60XUswbqvyWQSlRPMYDG9vgBahnW4hI8RsaiyHGgyfMJwmDEyRmnhXVMSS5+uIaZ3KqfCnIkUg7Or91EfDanbJbNHnaiUs+mqfW2/akHmRCHY9OfEuIApSos5T31wR0/a7mJg3z8HDmjAxqzdXpRhMaTacw3roU5w4paNQF7nV3MNAozcQrSV0oRQ1PI4mz7NQVXu29rQvzTTuPy2fu+floctuIkIFpqj+tbVKcjSgZuK7XcBP7UHJniF6UPdB0qkz1P7lTbArAMTWUo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(39860400002)(136003)(230922051799003)(1800799012)(64100799003)(82310400011)(451199024)(186009)(46966006)(36840700001)(40470700004)(4326008)(8676002)(2906002)(5660300002)(15650500001)(8936002)(336012)(426003)(2616005)(83380400001)(16526019)(26005)(36756003)(82740400003)(81166007)(86362001)(356005)(1076003)(70206006)(110136005)(7696005)(316002)(54906003)(6666004)(70586007)(478600001)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 09:25:04.8238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5ef0a9b-bf2d-41aa-6973-08dc2bac7f50
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5677

TEE enact command failures are seen after each suspend/resume cycle;
fix this by cancelling the policy builder workqueue before going into
suspend and reschedule the workqueue after resume.

[  629.516792] ccp 0000:c2:00.2: tee: command 0x5 timed out, disabling PSP
[  629.516835] amd-pmf AMDI0102:00: TEE enact cmd failed. err: ffff000e, ret:0
[  630.550464] amd-pmf AMDI0102:00: AMD_PMF_REGISTER_RESPONSE:1
[  630.550511] amd-pmf AMDI0102:00: AMD_PMF_REGISTER_ARGUMENT:7
[  630.550548] amd-pmf AMDI0102:00: AMD_PMF_REGISTER_MESSAGE:16

Fixes: ae82cef7d9c5 ("platform/x86/amd/pmf: Add support for PMF-TA interaction")
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index feaa09f5b35a..be9edb849006 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -296,6 +296,9 @@ static int amd_pmf_suspend_handler(struct device *dev)
 {
 	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
 
+	if (!pdev->smart_pc_enabled)
+		cancel_delayed_work_sync(&pdev->pb_work);
+
 	kfree(pdev->buf);
 
 	return 0;
@@ -312,6 +315,9 @@ static int amd_pmf_resume_handler(struct device *dev)
 			return ret;
 	}
 
+	if (!pdev->smart_pc_enabled)
+		schedule_delayed_work(&pdev->pb_work, msecs_to_jiffies(2000));
+
 	return 0;
 }
 
-- 
2.25.1

