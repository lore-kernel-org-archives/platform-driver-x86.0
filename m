Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA53524AC
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jan 2024 07:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706600085; cv=fail; b=hl7cOFzMWtexPWcPjd8lHxaym20IUw0J2v4JA7uiOLo67imcqqS7mz0bMyp127Tqr6gLxsr7T2BDCW2r0zszz5AKqQctGFEA5cI+Yr5xm3uGVbvjaIeIWK63beLfuIpIj6SHa8uab5Nq08azYMV4W03yXdaMkSiiFL6EMkQoy4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706600085; c=relaxed/simple;
	bh=J8uf2CnWKT+W9wGda1BRGY25KDosDpG8HHo1tBKm4q8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XuocSxDoJNGafwRbTRCDbo3+hPBgzUjol9J4vhVDKPrW36hN7jLjRvnRYz8LBsTLwhhj6tmF46rcSwW+icM6mQ84EdYstNvSK4DzqhHbEx5lqrL6uQaJ3+rLphDqKyEzorkZBEl9l10YtXGuVNrf3p7Kc8kptrm7zLbzS92J0Ig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Txdb3QMa; arc=fail smtp.client-ip=40.107.243.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Txdb3QMa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMPg0rBqUWUoFyRJAHCbGjJCsMSbgbN/36IbP0MPzAAvE5X5neGiS82F3TbJnGAX9HucKYj5LwbXoWjbrGbxJVu16hTi0nCkfzrVlGY8kDPl1by3dfnJU/OdMrvChrl+z6kdWTyWbfRWzo0CtsS5L70H05sWLzcPEkYiDqexokwFr3eK7HmzSB+qIc6iVC2qRUdbHJDt+ugzolQwTlKD83ZgxDbjPtYDAGoDI1Bsjw2C0sjacwJQstZJRYjTUSNcwykZp0JwmXiRfXU8ULHVRsj06jlIV1RZPNbMaRh+mJ4bzNLBoJtOwNbwBuU9rF225aZZapKWGcB32TpTcDg2MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SZEwDtE6jLzFVO/v0+Jju+bh2FnHpZTbHRjD4x21O7Q=;
 b=Ir0pVF21XC2Vp3UFSWppJWW5YacXechLF2Y0YtO3Vu1GKAFLhKia/jeh1T8cqgpy21tY7FEosRyOJ+JovsIJDXHsF79ywD0qbf+6mNd78w76GvxSIXv4QMrssIobuQqCA9Wl8k7Klo3I3FlaiO3PFXGBDBWhR6QZdOcmrdnXRXPO63kQPEsfIWHx9vDMrWkk5BesIEm1QspOluQgEYqiUBNzgo89VP502JlbYhp2Pcu90r5GveRMMIzb08ZtGsC2+wM0zW6PYRkQcHPz44wyUJkIi1TiboE+QxHgkz1Br3HxmBbYeBr8FgTV2+hQ9E/7HGR2+l9sKWaLmMFnukfqZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZEwDtE6jLzFVO/v0+Jju+bh2FnHpZTbHRjD4x21O7Q=;
 b=Txdb3QMarfiRw6lRu7eVAg9tELhSg1t0vbclAat3Y14+9KaaHyE1dMtK9NNw4Hy9VGHjZbEX4fZcI0B7J8WybUpIWkKYGNV6MWeMaAaB0zBN0RTLwwwu2rPUx1GDpgaKid7dgwAJt/c0PFL9qCfeaYRHo0J3Yq07WmTPqOlIadU=
Received: from MN2PR17CA0022.namprd17.prod.outlook.com (2603:10b6:208:15e::35)
 by DM8PR12MB5445.namprd12.prod.outlook.com (2603:10b6:8:24::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.34; Tue, 30 Jan 2024 07:34:41 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:208:15e:cafe::60) by MN2PR17CA0022.outlook.office365.com
 (2603:10b6:208:15e::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34 via Frontend
 Transport; Tue, 30 Jan 2024 07:34:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Tue, 30 Jan 2024 07:34:40 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 30 Jan
 2024 01:34:38 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, kernel test robot <lkp@intel.com>, "Naveen Krishna
 Chatradhi" <naveenkrishna.chatradhi@amd.com>
Subject: [PATCH v2] platform/x86/amd/hsmp: Add CONFIG_ACPI dependency
Date: Tue, 30 Jan 2024 07:34:14 +0000
Message-ID: <20240130073415.3391685-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|DM8PR12MB5445:EE_
X-MS-Office365-Filtering-Correlation-Id: 9166f5ef-7b21-4270-edc2-08dc2165ebb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ffKSPcScsGtOM7NuykQxYPYBCgXBCjotUSjDaFAvhUM1/fm5NxgD8l0f4L97uTtsvW16h2VwFn50pVrupU1cBRN0jr8CcIcGlzJ2x2XX+m5f/t6nsOA2/ZR4njRt+zMJ3KYbcWw+oEdv4X6sKhc0YRj2prGr1kK2Kxv7GjYKRC9J+Aw4bkbkKptKw0IX67o5BxocLq1xhVEFBaG+wn2ROPzrWRktrZfaEP8ihM73F3T95MSYDbuhAnduqcVIH2CSiNBZn6/j9CkS2yqGjtSM9hfnQgcjYyiKQCYlsaRf7bfOoKNzSaWqSVnFE40/Af+zl6oJ+Ae/PwsWI+eyIV0zs7JOuGsNSGgARLawvs+hNgkRr4NYb6iFMrj6gFQO8dGrOXsByrqpVrX8IYXK3dgiDckbGk6U8DLdsq9np7G89UdiawsiUxVsdaI+FqQzViwvYxmzZmdrVn3cF2bHBjDtQeRAY5rNHuhDloAs8aXiYqDTj01RDWkmcUAnLoW7uuHxBile+XpdoflIqwXtsG0obhVz+vlzjuG9P/kBYBsa8h4pYrPZbHKqSzWwpNAAJyS+WRVdIy1SmtwJ0ocSrvTQx4eFql4R3hhQ3IgQWKCcTxiBmoc/pTJqEw5Ns5U5tVVVtevPu9EPxxDWPqbOep6Vl6Ce7dV7OyxMGiPB4e44h1EjumQY9d1lbLn1BIazODyrOHpVyY8hUqgZyHUZK9KZTScSJJcwlVZsk+Jp1MHLwcuOunrN9ixKe8QG4FRCSMKvOr+0Rhr9Thq1D4XYroe0ng==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(376002)(396003)(230922051799003)(186009)(64100799003)(82310400011)(451199024)(1800799012)(36840700001)(40470700004)(46966006)(40480700001)(40460700003)(16526019)(1076003)(83380400001)(426003)(26005)(336012)(7696005)(6666004)(36756003)(86362001)(82740400003)(356005)(5660300002)(81166007)(8936002)(4326008)(44832011)(41300700001)(8676002)(2616005)(36860700001)(47076005)(70586007)(54906003)(70206006)(966005)(316002)(6916009)(2906002)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 07:34:40.9084
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9166f5ef-7b21-4270-edc2-08dc2165ebb2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5445

HSMP interface is only supported on x86 based AMD EPYC line of
processors. Driver uses ACPI APIs, so make it dependent on CONFIG_ACPI.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202401281437.aus91srb-lkp@intel.com/
Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v1:
Correct the email id for Naveen Krishna Chatradhi and change it as
Reviewed-by.

 drivers/platform/x86/amd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
index 54753213cc61..f88682d36447 100644
--- a/drivers/platform/x86/amd/Kconfig
+++ b/drivers/platform/x86/amd/Kconfig
@@ -8,7 +8,7 @@ source "drivers/platform/x86/amd/pmc/Kconfig"
 
 config AMD_HSMP
 	tristate "AMD HSMP Driver"
-	depends on AMD_NB && X86_64
+	depends on AMD_NB && X86_64 && ACPI
 	help
 	  The driver provides a way for user space tools to monitor and manage
 	  system management functionality on EPYC server CPUs from AMD.
-- 
2.25.1

