Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2055.outbound.protection.outlook.com [40.107.94.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEB81F4165
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Aug 2025 06:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754462318; cv=fail; b=IZR2uoy4LlclG9IMoUIPuZC/HcQfAFGgCJrSlAvSaUjIXmF3NuMlf/Xc/RzhB4nU8taEoeBBW1VLvG3wErHuYbKOLnMSL5ZP12RFCNdYDTnEyKjSbc1JMqk0xbIo2iDK5stnRnZllUGx07IIPP5PeECrduyOROgo252s1YKo1iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754462318; c=relaxed/simple;
	bh=qiQh9p4DoNFKDGhhlOjdBHpEfWFayciW3MZgcOt4aKo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EkQMCRyviW7Nj7WJ40RXVu9pCCS6LelWOWXX5At4j1b0apYuKHDlkTgvM5uLkrXFxFqUO+ZoBl0goFqEkUl8F5sxOgEePfbx3PeXaPSUVC40uHg8s1Q/kOuPO0IratjVgzMfrihvmbW+KpRf5xnzcgPCu0QNOmG+j0HPXGE81Bg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PcrgrbKO; arc=fail smtp.client-ip=40.107.94.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PcrgrbKO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mjsElVWnwt8WP7y+LYOImFyUDwXCFa9y9J2lFA183/ei5vZcCjUNDs+Z3kpr6Pg9EpUKS7luoel+v6ky6akmA+YYWLZIXha9MTzE0WYE1N8NBTIJhs3dkbR9b2Ia6PuxvO4YiQ6Zy7FIEqRg3Yqi/6ATylJO6jZlqRG7DV24vHRWOxx8aN0ClSoORm1SESyO20Sj7AoM321g/f1QdcMtIO8cBI/EvEmJJpRv9/yZEl7X0Y7Js4p7bo8Qag3ekiBKW5TpTxtAMxrAOnUJZGzYKFyWbfSMK4mySdvvCMNpycYSz9bjDyHwGMvrtkWwGfl9NZkyH0aXmPmsbz5+W0ttKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7l1vEsMiGzG7/N65yZymLO3gbFMkt7f82Ct5+s5O+s=;
 b=Kjq6Iu3pL3BYKa1qUF8akLLAfiYSgZsVtT5InpG/j4Lk8Kio6EbzdaPTx/tKtb/GlekDW8Au55olo9N6H2DuPKuIxgI0ZPBKQlHC5A3gvJQspz2Y7rWEw976aNHcmi+o0Mcx3L85H+ZdldtsWLScp8ZrtbM7LvpnH6ajQvBVQUMB8XqAAK50UTIjXSuh2Db3g/ulcI6aeV27/xbU7pDGjVeamBcq/UMI3y67zBHMIxeukso3MPCxMdemQsM11JKjaIh8pFxhs75JHN4wYXChmGXliIfWVWZNoqLWKnrgiAEHm1r1mBSrfAZF716Uo6vsvyDVos++IejfSt5HhJArlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7l1vEsMiGzG7/N65yZymLO3gbFMkt7f82Ct5+s5O+s=;
 b=PcrgrbKO5c7FyG2sQ2mDal0kmloxb/+3+YuOaAtONQGOP+c2P6lCtRup6DOJMl2q6Gt2MbA5OO7w3BXE8G9LCPl3IOP+hmTr9rLlOKJdq4DWxyDO7y58uDd9+1HqJQMM7qILS8cPFqGtVoxpmyXSezmSk8HOWoGy0HY/8Q60fbg=
Received: from BN0PR04CA0177.namprd04.prod.outlook.com (2603:10b6:408:eb::32)
 by BY5PR12MB4193.namprd12.prod.outlook.com (2603:10b6:a03:20c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Wed, 6 Aug
 2025 06:38:33 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:eb:cafe::e0) by BN0PR04CA0177.outlook.office365.com
 (2603:10b6:408:eb::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.18 via Frontend Transport; Wed,
 6 Aug 2025 06:38:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Wed, 6 Aug 2025 06:38:33 +0000
Received: from trento15c5.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Aug
 2025 01:38:31 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>
Subject: [PATCH 0/2] Add sysfs files to plat device based driver
Date: Wed, 6 Aug 2025 06:38:02 +0000
Message-ID: <20250806063804.693481-1-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|BY5PR12MB4193:EE_
X-MS-Office365-Filtering-Correlation-Id: 012c635c-b834-4244-30ac-08ddd4b3dd5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P9P3T0srcJW8T3gsY11KDhHDTRMpxAKuurt+RSy8xqL7cSHpZV6flUOH1bVw?=
 =?us-ascii?Q?UnSVaiwI9nsumsCX2OTJh0DxO5aliDLN273gLIaEJo97XjVYwLv6F3HVdysv?=
 =?us-ascii?Q?4A1Om8TJNcRhUkEVXUeQslEBSTsDyZ1FFX70fvcKOyN5m3vSaryGLx/+dRM7?=
 =?us-ascii?Q?MHXvSqm2XmUKLtbXB7Zbzv1I9J9p1CqaN32GvhaeCrarE3wQPU20ymjQtGhz?=
 =?us-ascii?Q?a5DntGJ4lQWdlk1SctFkNRL8jEjmrFbtGW6EKOsfrXx8wkPVnWNFidBEMLu7?=
 =?us-ascii?Q?mRkQOc367jo1kEFn8CzhgFYRctOuv6D/bS8ghrIEQICoPQjwV/K3YzIDISJm?=
 =?us-ascii?Q?sf/r3HKCXiXSzvvHbr0mTArFNSDfBGOL+Egl/hh49sxzAo34ELvBdLm9rr/q?=
 =?us-ascii?Q?5pc2vmqQ+U2/g2xYvC59km9Wq7Dq1GaL80yULdZ6rzEy7yxbxYO90KdCfsxS?=
 =?us-ascii?Q?B/Gj7H3Vsymn4ZH5oWPKRSD0I78AN4CyULE43US/Bb32HEznYqsgpk4jMiSE?=
 =?us-ascii?Q?431Rl196wPyqI6wslLKkKXpw2F5CN/me+dtqH+pyIpPgFuD7mNcqNh4JZUNs?=
 =?us-ascii?Q?bYOoN29uiKH/Y2zudgyDHHd/g/ZGiChOd0ejrxDvksgZMtRkcIaNDEVEp44q?=
 =?us-ascii?Q?NkqwxADaw9uj4l3Ox3sGdeEFGDwYRArMAVcYrhHj9JrizqdH+PuHHqLy0EOV?=
 =?us-ascii?Q?PWYeDuc5/7sTt8kl+XdX+cDDf9h+Qc8AyBlxaNLnoafcOlLWNLawv0VbRkSu?=
 =?us-ascii?Q?whdGVNu5xupTdgFclL+vdDx03kD00SdJkGt4SnosZGWYNE8aCbeNvxfjvPib?=
 =?us-ascii?Q?/ZU4lBg5OxTYB2lR3+Cw+mebwShgXhifYE3seq2jL4mjLh9lpgnUP4lteH3x?=
 =?us-ascii?Q?yU5v/DrnpOdTTq5H2tZ52ktgZNwNU1Gm+BSaPKkClIFg4z3Qz6EKBFmzBcFg?=
 =?us-ascii?Q?rxWef202q8O83ICS9QDkFltrtqi2n9mOhd7AU2tsRnEnojGxkMhZVqz/jiQF?=
 =?us-ascii?Q?TPPCyRUwJ0Y5SModtUhAFzE0kcEtkl6SjZMsBjhrUyExe0SnjR5APS3g4quk?=
 =?us-ascii?Q?94/9Yu+tPZxEICjuniFL2HfdJFiY2vPdCDU9At3QZH5BdZ+DEhHexNom8GAx?=
 =?us-ascii?Q?tpXAU2KvnTNR0Y3ko6q9o47HXpB/XCHQnH9YQs0wDhY0BR+Z5ETvXyxZSsxy?=
 =?us-ascii?Q?IV0bdo0KUsYR4d7vbo1SeTWcDMiPM/ksww6xOi+BL3qNSJjLsCw8o7RdP7aj?=
 =?us-ascii?Q?qdY7Zyx/TKwTBF7G0EbGAlFXxcBTnxlg++h6h27qEUwAp62YKyencpoRNif2?=
 =?us-ascii?Q?IRBXDOI5kuTZQy1JonxGRH9jdCAesHmb+c/JSBLdvwIufgOskWYKhifFVfCd?=
 =?us-ascii?Q?HEDtlrxWJsUBvcmYwsEtgnikl9ZB3Ih4FcqE5gGAnWPOqBj64cZZmsaAVpcC?=
 =?us-ascii?Q?hWZlDS0+69sqt+57Pbc6gZ0RurxIl8f42k3pFc4jM79hgW4cpfdgGQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 06:38:33.3976
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 012c635c-b834-4244-30ac-08ddd4b3dd5a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4193

This series has two patches.

* The first one renames the macro to make it a generic name. This is
  in preparation to the second patch.

* The second patch adds sysfs files to the platform device based driver.
  Basic system telemetry is reported through sysfs files similar to ACPI
  based driver in 511a4a5ea2b6f1d4e0c719f27db6b627b2b52e49.

This series is rebased on review-ilpo-next + below two patches
https://lore.kernel.org/platform-driver-x86/20250804101551.89866-1-suma.hegde@amd.com/T/#u
https://lore.kernel.org/platform-driver-x86/20250805091911.483825-1-suma.hegde@amd.com/T/#u

Suma Hegde (2):
  platform/x86/amd/hsmp: Rename the HSMP_BIN_ATTR_GRP macro
  platform/x86/amd/hsmp: plat: Add sysfs files to display HSMP telemetry

 Documentation/arch/x86/amd_hsmp.rst   |   4 +-
 drivers/platform/x86/amd/hsmp/acpi.c  |  33 +--
 drivers/platform/x86/amd/hsmp/plat.c  | 388 +++++++++++++++++++++++++-
 drivers/platform/x86/amd/hsmp/sysfs.h |  48 ++++
 4 files changed, 433 insertions(+), 40 deletions(-)
 create mode 100644 drivers/platform/x86/amd/hsmp/sysfs.h

-- 
2.25.1

