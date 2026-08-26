Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012018.outbound.protection.outlook.com [40.107.200.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A717474245;
	Wed, 26 Aug 2026 16:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762222; cv=fail; b=Q8G+RVJ+TYX6RZskjvDdtCbi7KTBCIPl9Ly5qnoVhW2b+/W+DY7xWjJs868SXByg4Egpva934zxjnkok6CldVbxoWrqFcBufmk69g7xW7dzycBw1eulc9sC7Iw3xlCvnMtVPC8lpH9O7j9hb+a1vBPMID+ypDyqqExOgCpgST9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762222; c=relaxed/simple;
	bh=2WRSl2ymd38RGpzY7YLErZ8ZVGUcmBBfe5CowhAvtRA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q1neuSwuUIgcDj+KzZfXpHLQjQfQ4odV4MLjA+5r+bg3JIhmo22mqkFXiihim3Wb9R/BHQAZpotelpecQOF5bGn9/NmWIyivUyH9wSKB3aZ7aoNpOKo55c+CvWtjD5VvsA2EifjEyRz+opcNg48+L4TsHDj7yXQpxcmrQG9fbeY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lu9an3ld; arc=fail smtp.client-ip=40.107.200.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lu9an3ld"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kdjAWdpc2vTyB02rbnt8ChNJnfwImWtOW38JANdcAE+0gkF17KzC1qQ0fiRGo+hsV53e0iC+7so/hqveU6zf4i5bzDD0m2pCnZd77I71gZPHhocZOtPXCK+SzeWHPu1IRDyEb64KPxhcH4z17V+r5CaQeYXs4pQfRe2y4fGdSRl4EKb/y4RCJoFbdvrFcA6ejlMSd7Q4LuE+RbihoRbPzPCaFNULaZwEVr74iRzU9hZ6pphw15nKXj7BfxMPKMf7dq4SATdjVc7IREy3cITrfgE9PhE7M0o6tcpq95U3ApQTZSprqklgfx1sBNsx55noILbscKNXYuMc/5XsL3yeRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfZcEzvXqlfM/r+1M0PvtR1kcBKiHfN+UkD713+CmRw=;
 b=bSZfL5v+OrxDKwwOe/NyVMZCXi6tLqQSHw874BxmWQ9pH8A2HvLTZJiXsIyfFTWqwhoKDkdJBzD9KUIAYxHCbD/4lCgdQ1Qbm5XLLWhGZ8LMqb3ROzVawVaR5NiJfsEcokzj3Pp7vtAz1fimcykvalOi0nYde6BVsfFtL9ghBJIJOvMRSgK+EAOgt7M8y18TVJSUqvtW304qbJ3emSkfXUrUWo0IIRuz3gtb3kebe/LLse0ST33i6TJestTNoLlbWERv/IXNy5zJ6wo/TjmX6azKieoVFHq0rn85+KHH78HWSQJ6iV90PKiy5akkG/4CGr6NWMZmuY2gC0rLRbGa3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfZcEzvXqlfM/r+1M0PvtR1kcBKiHfN+UkD713+CmRw=;
 b=lu9an3ldsrgTUxB34cs+HJHph68TUZpADf1hvwDIMBtSFKB4i2rc4HqSpw6dCYM1smncJy4QLdBviByXjz/MSYj60YlUpAcGfDftE+bd6K1TlbCqiARMwk8wb77re9l8GoOEPEwk5LYKq445WzJeImqB4YnGMz8PPsz3uRR/vSs=
Received: from CY8P222CA0001.NAMP222.PROD.OUTLOOK.COM (2603:10b6:930:6b::28)
 by PH0PR12MB7790.namprd12.prod.outlook.com (2603:10b6:510:289::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Wed, 26 Aug
 2026 16:36:46 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:930:6b:cafe::79) by CY8P222CA0001.outlook.office365.com
 (2603:10b6:930:6b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Wed,
 26 Aug 2026 16:36:44 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb07.amd.com (149.199.90.133) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 16:36:43 +0000
Received: from dogwood-dvt-marlim.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 11:36:41 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hansg@kernel.org>, open list
	<linux-kernel@vger.kernel.org>, "open list:X86 PLATFORM DRIVERS"
	<platform-driver-x86@vger.kernel.org>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH] platform/x86/amd/pmf: Add AMDI0112 ACPI ID
Date: Wed, 26 Aug 2026 11:36:11 -0500
Message-ID: <20260826163611.2268377-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|PH0PR12MB7790:EE_
X-MS-Office365-Filtering-Correlation-Id: 2770aae5-1203-4b98-1860-08df039036da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|10067099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	wFQvpSQ5a7luO4tpbtqYY1znC+mDCET2SJJB1cr+qTZYWL5Xrq5lNWa86XIQIrrUlUOSPv4F4pm+vIvETP+FXGxPHMIvYrfwHHX/xEmtXLWg8y6rc4sorouzsMoSUChiMvQ6MvI449AKvocJFm20AqO3J+P10gmyQdoPL488Nz+AqM2f90JTa/OBMQAALFqh9M8jGWmgPIcYeSVlTPWqqjHi/BtWR/o+CeSrV4wp56RHiTkqLXxWBfmW6PiXy0lKCdnvj+ewqzuL4pihBNBE1lLd828LavE8yKrvOKPLBIEu6xeGf7KjUPj3hCsfvuPuZeasYzv71lF0sIoJyzbbZffogfb/lrif4rIv/XuZRYXUpwb0rap553mCnI0a6UpAkb5fDWxsoF+Frq0eZdLVWQvnLvJOEokCim8emVjBwA784SSErMN2bEhRGKUdOqMS9kYfWvx6T2DiHUb4if8RwkzT1c7p8NURr2TZxyDI/XkP3MNzeEL4ELJsXSERRAiRK0MmGc9cuRKp2qo3PL1DTvJ78zrReivbhDPJjkzZ2ecU2IyxEMkzYk59vxkEw4RxFfxrKj7KdbwmbUf8AXEj8a+Mx59EniOVZBcwTg60VNBDRsG8EPf8Vmhk9a/k66l1A128rKzWjwaFck9xwrRcbFcCv1aJAB2nKpIYT9GUZ7YHkzG/pdmcmaOeunwyCJMSG3M3gwnjbH5V8uWfQQ6bdg==
X-Forefront-Antispam-Report:
	CIP:149.199.90.133;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:unknown-90-133.xilinx.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(10067099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yyKHazsUkGgznZk+VeeSt+4vCgjnuVm5KXWSAycr/GzsmY5I/AbUdqrWESdCrnCBPiXGCrv6mSlyjotPPKctIG8OAvpbMx5Bq1IEaJ2xHorCLzuX7fXzuRs/tRY3vQY1iAdwdZGW9D4Fkh9uY2OaYMQ6bzn3YE0JHgZAv7P/SIttVDOF8Rhl3Q35FujdLfFkASXqwzoaAQy/syqwQjja5D1dbSoVaAm0NJljBtfmzBuBD5CWlKWnfoaAwCJDeQjELOr+RrbUAfm5Hp/3qXiFb8VPy8h0FZrfJCQOuWB+4qyUBLO5MiUxoTBit0M3El+Go1mTWKugC3pJBlkkshOT4e0WhlBP7geeuBd4vkFMQSi0q/R4LOsxV+ViNcixBARHATgxsPEKwHK5keRPWbxCIlg0n2fviRJjMsEgJalROB6kREYmFuIsjIASMG0A24GD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 16:36:43.9451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2770aae5-1203-4b98-1860-08df039036da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[149.199.90.133];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7790

The AMDI0112 ID is used to bind the PMF driver to some platforms.
It doesn't have any Linux side code changes relative to the most
similar AMDI0105.

Cc: stable@vger.kernel.org
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index b4eae65e675b8..5966190d1496b 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -454,6 +454,7 @@ static const struct acpi_device_id amd_pmf_acpi_ids[] = {
 	{"AMDI0107", 0},
 	{"AMDI0108", 0},
 	{"AMDI0109", 0},
+	{"AMDI0112", 0},
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, amd_pmf_acpi_ids);

base-commit: 5b05bb3f6c5716fab6911e12d60dd1f43ad9806a
-- 
2.43.0

