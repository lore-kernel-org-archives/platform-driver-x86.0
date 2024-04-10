Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB30715EFD0
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 14:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712758242; cv=fail; b=ufem2yuG9Gl5NwyU4U3ifmjuW7e4hqA/CS8r9+7GCGwrO+6NqiCaeYmMXXx0zaCA8zz4T553c4pkZ+Lx+aUOPZpnqietJWPKw8h0h+I/cE2TXfJcSY4te52CsIB1MOj86xm1f6znlPfbBLxxhLHfatqX6tpmOhBTuNCl3Crzn+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712758242; c=relaxed/simple;
	bh=Y8g6b3js5TPI2DR4Ez4KDf73sM2jZDJKW6Obwm0hNcg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jITxyanufv9R/pMj9Er+z00++0cz/6KYmTNFZdCUR3JpVrS+wbqZSpIR/HIjP3uxZcea9cHgH+9xHdY4n3Nm2Y7i3WnX5koDarS7fyO4KQex4huQaF33Q4/WoU2zbR+7Mw9jTwXpAkcxAVlQHMXihynRu3wb8khp7WBtIMQzDiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CLsyp5SD; arc=fail smtp.client-ip=40.107.92.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CLsyp5SD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E70Cf4S3JmDuzdPpqO39ifQXgeyIFPKaQ5p2lGAf9bDUVkBIaGyuVzpreoIOVwr1dJIfKT5l7DM5V6eCQTH/kz9QDMs17mwQauz7pgid1M5FCjp13dfFXuyVNgzDxbe0BQOAbqA4Gh0sFLhOiL+x34mI1kQfhlqaTIGIDGOCc3p4qf0qJOudhxXK9017OUNCym/5Eq3M8mg7BD8veS9FZ3tL4/VZ2jq+Sy7ySgq4F6VIdokW1BBuRN02FAtPk2T0eavqOVb76oH2XMQHc6kHa7ikYjxEVsJx97kkykeUyQ96Q7ocfpEzs5BTuHj2zJ0itnUqgqG5z/3q+8GIP4zsWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQlfILKJow77rcn1jaZuWTR2XfOymyW8woG9gqZXwpc=;
 b=cdM83WweMH6rFffU24wNY2oZD04MjX+G+ILx4sYsm/6BBapHlVc0ynlCWID5GgTHjPqhWN+2mG7c7Y8wzRDt6WH/BH/mPKCMFAkAOOjf1/U2Tco/b2wqcxGj9kKCD+A3Aki/Gj4wJ1Br34BmzrBzCgcLG5UI9Vh2fKsvx+OsLLC6r+woJd/Hh/wGpHhAvu2de5/ZRiC/mYbfeqWv3qmz0Xd8WPzh+ROHrvWHtkzJGQ0qE5JmqokGVxtY+0hXlstlb4Ba5Yl/5ImAul9kVnJLXPqO/KRtJHwFK3Lg7f7CR39N43vePXVt4JHuvd9Kzt1OHvU53hJFFZtLsVsufxEGtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQlfILKJow77rcn1jaZuWTR2XfOymyW8woG9gqZXwpc=;
 b=CLsyp5SDYLU5g45nsFMCQSF/P1guXj9fPbr4yw8SLz8/65pCxt/c+TiKMmxOVnTrJCsm9yK28l9i7lI26vF64M0g6h8/slMGJ5RaihZW39OWyod7CuhTuDH9ztWKRFCnNnd6/YnlT/qWFXhqqWW2Y/KAmorlksiqbTyKgpV86OI=
Received: from CH2PR14CA0032.namprd14.prod.outlook.com (2603:10b6:610:56::12)
 by IA1PR12MB6162.namprd12.prod.outlook.com (2603:10b6:208:3ea::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 14:10:36 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:56:cafe::d8) by CH2PR14CA0032.outlook.office365.com
 (2603:10b6:610:56::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.28 via Frontend
 Transport; Wed, 10 Apr 2024 14:10:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 10 Apr 2024 14:10:36 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 09:10:35 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: Hans de Goede <hdegoede@redhat.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>
CC: "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>
Subject: [PATCH] platform/x86/amd: Don't allow HSMP=y and PMC to be enabled together
Date: Wed, 10 Apr 2024 09:10:25 -0500
Message-ID: <20240410141025.410-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|IA1PR12MB6162:EE_
X-MS-Office365-Filtering-Correlation-Id: 60e4f6cf-6da7-474e-e703-08dc5967fe4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HOeuN6pKrG1PUjXAREQ2l98/jlnlyHnkFbR7MSjl/y2bE70tIKKY3y1Js5L1WCobBGreac7T/Rd9BPX2/n89YsQcBIC/tMkKQrrrJ/I4LIFcK+ZsUZk+Sn0LBnMDYYHApgGddoJm5LnfPWiZOK7lsOEW8Xpl33+v/lmqQC7Eg35hHJwqTeKLEii61QtPOXKRS+0P8tVwOAJ+PkpiiucVG1GAks2kDf504QS5VAyQC2ataiaTiD22xeFt8RK+yPEtcmsf/qOrKW/DSQ0JYmtYOzHBYBPCR0SdABHqEE1DRy+vzO3r8m74VVFBcsOC8q0822cXf9dcHEDaqHiyfz5to6kKZaqq2lIEl1R1GAIpTb8B5m/pW54pH6eGm7vVWJhu1xJX8YKHjMzMuY12ynr93f54KPe/vTnIVqNT1R1NexP/fgmRIQX4lpQMVT7Q6K8u8QLv5DR1RxsucTgQBFgySIoIzD3NE0V46To3tx6g9nNxMkpLsUEOPo0e86SOTgwehJGKw3KXNxrauAVLSNUmaK44nNlxgZiZUxppG8oWNdZRl7qQHQ5wldVKBAK8kbhJvFkxF7gl1+VGsVTJwVz6gUytx/2utRXjJGSxwiDqjRaXwBKHJFTzC4dlS0Vo9nJroMvVv4rDrVmPnM/GrzrB3jHIGTTzWKjjT1eUJohDuLpkmHRWjHT0VejFvcVz+G3f6DopXvZkTZi9d5zM1M5FPQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(1800799015)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 14:10:36.2099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60e4f6cf-6da7-474e-e703-08dc5967fe4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6162

If the HSMP driver is compiled into the kernel it can cause problems
on systems that support PMC since it probes hardware it shouldn't.

Prevent users from compiling HSMP as built-in when PMC is enabled.

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2414
Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3285
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/amd/pmc/Kconfig b/drivers/platform/x86/amd/pmc/Kconfig
index 883c0a95ac0c..d734f6698f97 100644
--- a/drivers/platform/x86/amd/pmc/Kconfig
+++ b/drivers/platform/x86/amd/pmc/Kconfig
@@ -7,6 +7,7 @@ config AMD_PMC
 	tristate "AMD SoC PMC driver"
 	depends on ACPI && PCI && RTC_CLASS && AMD_NB
 	depends on SUSPEND
+	depends on (AMD_HSMP = n) || (AMD_HSMP = m)
 	select SERIO
 	help
 	  The driver provides support for AMD Power Management Controller
-- 
2.34.1

