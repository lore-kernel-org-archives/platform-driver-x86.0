Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3CA17980
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Feb 2024 07:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707809868; cv=fail; b=ni41mB4yAgdb2XOmH3zgSKKwGyNeqCnBoEmVrMYbTz1gTu5w9LT0GqCtlCVvZOstYTU1Yy1PnxNJEAvlwfGnYV0gULhcuDXgX8w7ziZbz9BHlY4mQ3iuzbuyiLIj3dMUjSvOXpAK8mmZ3g6aRZGg/8kuP1jzT5r75vhDT2OxDsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707809868; c=relaxed/simple;
	bh=eTgdyEZhtzP4K2oBedCSooD1Uya7Kcomgh3yB/T7pvI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A+md4MXvAvdbVOhyZz+4TpcvoX9lw+AzRDw7HmPoJnl8xF+tpuQsaZ0MAkEkRuiGcPwZ0spoNNcHEoKV8AI4MM7x0BLhWpbEcdfEr9runj1Y38ycrZTei1fqIWnOgEC5YcQSmakfUePv7F/Sm04iWIScD1C6o5WkhGWN1KoCXdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=D8OTBzBh; arc=fail smtp.client-ip=40.107.93.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="D8OTBzBh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzp+TL6BcVeDXxVpy3QWmzQwivJp7qMgOrIpBMKL/k3uaF6dyQ45371pBT6N9jVewvarkG7MV94siwDsmEClW6YT8tUyYauW8mQE818kWGi7KfQouD+v8BjXx2szcNBEtbYWQx6UKYf/4OLpPiRrAUaMFlYJgti8pNaP+uUsLnvefaBazllcVBJvjyOwR1trY+y0X8wBY1GR3X8dfYM3OSvakgcpVsNoNDRmmyannwYtqGdNJoXSrpznrgE0tF1JJmt/cNAkkJ0We3p2VoChgp9UOfJTmHsnpHbKd5KJWUU65Y3/GpIUGcWABiXPQ98Mp/WSM38iE6HuYfLbKr1MPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TXnBhhhqPhuzAT39EC6iCnVyYsmoe5Ph8oSMWnf2m/Y=;
 b=gn6NIrTAG5I+N/V7N/Gedw7RfjQ1DjS1C4rj/Hpk2wetD6HeRxVaYmAHuFVIurMHbEJrJUcQA0+7NXfoDrJuRHu5JgKURC5DSBP8Cv1CFYujFx49c4bvuUht+VsOEPoZRbfoZAxAndnXtlM9RBh0oWdLvCZbmK4+Y9afgq5GduaLIy4oqX6ZbHAEtzlMe6BkT4XMMJXmYD2iDjTVLhbCpLQvKJENUyaij8lJHaxK910Ekmu9TkAuIJL04oewSXqxXYmpgH+4yNWcgSy9OuJzWAHJGwO1dpG91u9ScZ5WDAmUAzdzMUP3iNJPAZls2f2Y9NkDW9k7LQI3KhCJUaY5qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TXnBhhhqPhuzAT39EC6iCnVyYsmoe5Ph8oSMWnf2m/Y=;
 b=D8OTBzBh/heWPZWFxpYEHetilMBDHMF43u9r0tu/D5szeWLfUIpT9lpCjCQtviUMUFrK7BZ67o9bMp5SfARmsPlDR4i8IfnJ7eqb3SsvOiSJRu0rfAurEOkQLOYaDa6PE5O0wBLpMSWwXfG7qLe01ov0kUc1uUIowykzHLhuokw=
Received: from MW4PR04CA0129.namprd04.prod.outlook.com (2603:10b6:303:84::14)
 by CY5PR12MB6324.namprd12.prod.outlook.com (2603:10b6:930:f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.23; Tue, 13 Feb
 2024 07:37:44 +0000
Received: from MWH0EPF000971E3.namprd02.prod.outlook.com
 (2603:10b6:303:84:cafe::d3) by MW4PR04CA0129.outlook.office365.com
 (2603:10b6:303:84::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39 via Frontend
 Transport; Tue, 13 Feb 2024 07:37:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E3.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 13 Feb 2024 07:37:43 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 13 Feb
 2024 01:37:40 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 2/2] platform/x86/amd/pmf: Fix TEE enact command failure after suspend and resume
Date: Tue, 13 Feb 2024 13:06:51 +0530
Message-ID: <20240213073651.404220-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240213073651.404220-1-Shyam-sundar.S-k@amd.com>
References: <20240213073651.404220-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E3:EE_|CY5PR12MB6324:EE_
X-MS-Office365-Filtering-Correlation-Id: e5b74dba-492f-4905-b7d0-08dc2c66aa8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IRiBpCdocww9VuDN0m/xv8JkVAVea6nJApo8Z8qSt0UkEeE5FFn/b3y6pkEh7wq1n3CNn60GkcQSHDlhuyJfaSpnfkGdXiiE3EKd0Ve0O8YaYkO2mmfToAcBxQbZO4ElA5PlwwXJ8KqG8kDOg8iLUSLIJLV0TidDR0CoN++GKK5blIxLuvvcPMYMADx4m1i0KuPR9wMbibXBhPsgRqeyA6YehWTxjTanBjeQ2ys+lR8C2wOk1oCyPgd/qcV5bnTFT3777a6UHvSUUJku+vMxGFh/WRjOs//rU2K+JeVR9nog3vAUe8OzHg/e+XFwg9O0V4f7W7HE9jrFo/fHnZkUkaetORv0B6GUaopaGon+svf46iRrK4jq/Yq78gyDoD8JV/Rh0zi21lLvRwdaG9Fl7lzVrCvdygWE3FT7HM/g3CRixTANEVOjsHlAeBxI5c8pgoDOhDjXUVtZcW8SPotFl8VyLFYD9jQqHmHj+VbHDNNP/EP4UbXvvnAbzExB2RFocXgIIv92E1AZ7it6VKnjY2K7sCD40FjwakCcwqPYA7l3MvDQfVV5CO/cJawsNzJrNC8ikycAJGuAWvc51JyOb7ueDxuQKk8HUxP/0UMfs5k=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(136003)(39860400002)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(82310400011)(46966006)(36840700001)(40470700004)(82740400003)(356005)(81166007)(86362001)(70206006)(54906003)(110136005)(70586007)(316002)(15650500001)(478600001)(2906002)(5660300002)(4326008)(8676002)(8936002)(7696005)(16526019)(2616005)(83380400001)(26005)(1076003)(336012)(426003)(6666004)(36756003)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 07:37:43.7774
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5b74dba-492f-4905-b7d0-08dc2c66aa8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6324

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

v1->v2:
- remove enum smart_pc_status and adjust the code handling

 drivers/platform/x86/amd/pmf/core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index ff0d61a56484..0645164c25a0 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -296,6 +296,9 @@ static int amd_pmf_suspend_handler(struct device *dev)
 {
 	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
 
+	if (pdev->smart_pc_enabled)
+		cancel_delayed_work_sync(&pdev->pb_work);
+
 	kfree(pdev->buf);
 
 	return 0;
@@ -312,6 +315,9 @@ static int amd_pmf_resume_handler(struct device *dev)
 			return ret;
 	}
 
+	if (pdev->smart_pc_enabled)
+		schedule_delayed_work(&pdev->pb_work, msecs_to_jiffies(2000));
+
 	return 0;
 }
 
-- 
2.25.1

