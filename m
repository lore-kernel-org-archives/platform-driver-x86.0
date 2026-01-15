Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011011.outbound.protection.outlook.com [40.93.194.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422D632ABE1;
	Thu, 15 Jan 2026 07:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768463371; cv=fail; b=iI36S069b5jwB8azR/fKiM8T1iArdl5aEUU13Ybl2h/vQdRRqreHIBZ13znV88QqkMtwaYX9qEtxC38evkhQDLIaRQOAsvVhuf7CVnQnMZMHlHPvn9/k1xw1TJM5NF1iFP0F5siCX0PKFZ8TTsbEAVbwJiGx0xM5Xkt2w9e0noQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768463371; c=relaxed/simple;
	bh=VXoYdLvHUGZvoFeH9IvaZpIcTRjZOOdCgxt2lJ1Rsmg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fx8kKO2//wISLu8pYckZVNPlHBWX3Iy4QULYUigMvD8dw/EN0WHTutQHVrLCWHKRfeZ2Gbls0hn2YnLqqBCbuN0nevLn6UzDkO8o11vL9G2BZzyd/VPF7bz+yGzILqL86PqCP+fG1XOfWSJUhy/XcqtVijqveAbh2dHuWJgNmHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YJlWvkRX; arc=fail smtp.client-ip=40.93.194.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YJlWvkRX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KaCY3iTattyay+fG/i0SktJTVqomJFVvl+X0cUb/nZR31ysOGCZXVxiPcr//AaQO0FOVIzedIASPyF3I59Cob0fWyb0iVqG/nivtocxlDylqEkO9b8ks4E6EiCNFm0h87r/OpeYCKP42lNXtqraErsmFJYmfczO/Jd4v/7AiklgLjhfxSZlBKJNli9IV4FTYYs+Yq9FOv6zqz/Eexi5HmBRT5zAgVG7v/ejKOYe7Gpe4GT/LQYKIqSR5kQK9EHHJYZ0PVf3tonsAeSWSxw2a1ruykKpb036rJzB8C0Ue49wE9h2YaD23//4pUc+V7BmiY0y1jtf4qvPLrIF5yrQeBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bf3/s7EjnNewB+eGgsCmwRYuQdIAdqnfWB888lHxB9Q=;
 b=Wk2SY6mD9hpjT1hbK4z7vjmCl+maaueMGh9LHIvEK5w15r5naI2QtRDhAoxmAeSdF3/eezEFXS/IATfM8qSi6pzT0Ev2uYESJ1RPb3TEeBt7UMKlm4grm7+QcqWywfza1gzkEgcbEcvNiZpynLVJaZqnvtbielkmiPn10v3gbIkpRwFA4PvV3osVqshEfOG9pGWRT/FHl/do8K5rj3+WZn+Kn9CuNQZaSUKM3rLjrrzS03K26GYmG4Jz/DRiMpe2WmUmtmZfbPffL0XwJPTCzDLAztAzYuciRAQTUNXQDQXZHfhQNjHCWU7EJrLEnvYZ43xi/RKLCijXBAwtTiBl3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bf3/s7EjnNewB+eGgsCmwRYuQdIAdqnfWB888lHxB9Q=;
 b=YJlWvkRXPsRCI/8XySc9sKrtBZvrhXtotySmT/mmnSA6YWCxAGV/a0EW58Fy9XDynOoSuP5SWqnxyB0fC2OAsKAZwjxrASdBVHVtCHvQ1SiSNRU0tmrLQut+4MCDm/g+qY6qeywWj5ZfSMVir3ncaaP5LF+S4orwmMohbfPiQl3esjiP4mRierrWAQXf5/euPbmAagR2aJ7vygcP6jeFK8y/wAzhn10QLBsRlp4obca+HwEnNFm6RI32sWH6Ii+AmTC/4igEu94OWqN/8oBYsuy4cMKE9MrKneb+Kv532WxsbiO0EWfu2lZs9GjawZQyNXmg/tfXFa0XpJst0mynMA==
Received: from SJ0PR05CA0098.namprd05.prod.outlook.com (2603:10b6:a03:334::13)
 by IA1PR12MB8191.namprd12.prod.outlook.com (2603:10b6:208:3f3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 07:49:25 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::8e) by SJ0PR05CA0098.outlook.office365.com
 (2603:10b6:a03:334::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Thu,
 15 Jan 2026 07:49:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Thu, 15 Jan 2026 07:49:25 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 23:49:15 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 14 Jan 2026 23:49:14 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.127.8.9) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 14 Jan 2026 23:49:12 -0800
From: Ciju Rajan K <crajank@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<tglx@linutronix.de>
CC: <christophe.jaillet@wanadoo.fr>, <andriy.shevchenko@linux.intel.com>,
	<vadimp@nvidia.com>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Ciju Rajan K <crajank@nvidia.com>
Subject: [PATCH platform-next v4 0/2] Interrupt storm detection
Date: Thu, 15 Jan 2026 09:49:07 +0200
Message-ID: <20260115074909.245852-1-crajank@nvidia.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|IA1PR12MB8191:EE_
X-MS-Office365-Filtering-Correlation-Id: f39d5695-e392-4994-43a6-08de540a9a95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MyEjjhAZ0vw8deKWSaJHAIUKv79E45hX2+2HMqOlyQ7hcnMsbqc6ltb7CQzL?=
 =?us-ascii?Q?ZhTQzcbNM9WQ7r7EX7/aq8vIwDDPRGer1kWpwkTjZc1UGcoH0ecGnZxgwKuf?=
 =?us-ascii?Q?OHPFsF82xgcK/sWpI7Y4qgSzycRqM8i2XLtGrimtWcqoqTP97KF/l7JON/KW?=
 =?us-ascii?Q?fV+tPgpvJ+Pm2/G6okaKcRcnpbyHacTxChjMrDxv2aANWYPzxr3cK0OwffnI?=
 =?us-ascii?Q?FvI4rZ8Me5XwmsmQTaxd66emJvCU32kseLh8L/K09K3+mgiExdlIbhYvxMqu?=
 =?us-ascii?Q?T7hburvTthNTVmsKVgpHMi0akgS8jCE4x9CkX+kaoa9RIFJw1giXSn77IRSf?=
 =?us-ascii?Q?FFW/uyE6mvlf6Hbh5TDIMMVDMCljsWPFxBN/PITbJ6U8QnFlCVnxvDpenmTj?=
 =?us-ascii?Q?6LR0Q8zt/5r5/QGbRgZ6RsqwLUOG69OC7JzB/mr0uk40JVYkVZf2yighGBgG?=
 =?us-ascii?Q?whRqYzLiriGtvhIfqlZOM/7UMlgXq8dWz7QQp1IF2x/gsT/Rys51+ZYebs0e?=
 =?us-ascii?Q?kihhoknCcTzclRBy0TWhsPb+sFFa10wPOc2dceGsgcSv4fbYilgIUEYbNsFQ?=
 =?us-ascii?Q?5IdkpLtoRioUvrI5wyYbCe6Pc05TMFIiuFOdhLKgK1hOL0Mb02u7ovVamwad?=
 =?us-ascii?Q?HqYxXcALv97l3CR191xzRfnhYoDe6YvDJaPCyRsiyVagsw5FCXMmNk7BSdG3?=
 =?us-ascii?Q?27WXEN/5GRZ27bV1PrAMiFlB931hzxRB/vsbFkpjuGC6kWbwYucNouXkCa07?=
 =?us-ascii?Q?BdZQpGciRSN59ZzECDZBFq6xIhKR/jiZTOhyLNrNxXIivWehJr7eHiK1XfqP?=
 =?us-ascii?Q?3wtrmb7RuUNACWjVfZtOYiBL7KARuwwSZjiP5ubxpQe8SQXG3yLr8k4WCFLT?=
 =?us-ascii?Q?EpTdNwdNg2CWLQqKvZWwOSkqomrDPi2ugb2ID36nf0vUii1JPFeQdv+4eTY9?=
 =?us-ascii?Q?Mr49vvJt60QBBD8ApjFdzeTvoKuPK8TNFy1V03v/OeCla5xt1rMp2KAwUnM1?=
 =?us-ascii?Q?tEv4OHjr9KZ5Z9SpKiBUGzX/LRaq1sPWA020dDCJd38qqW+3I5LO8V7GeeO8?=
 =?us-ascii?Q?HphWibZr6na9F9dfeCCPgYA8Oegyvq7zKd6eRGnkVF7/AcntHm5cdwDMKYHo?=
 =?us-ascii?Q?ETdBET9VlJNfOQhOTRa1fATFsG7B/kknkSYJlJxc+7Qqq48pT0jFGRoI5pOp?=
 =?us-ascii?Q?dz6GJc0pDdrY843fUh+JkuIT2YAaAlN6Au7qpkxg5/1KlCxOO6Gn8oADxL+k?=
 =?us-ascii?Q?XlODMHD0nTbEy/EAeYqwoylwlGkMJ1oZvRo7IEKOQrwgjp28niEZ8S7l7f2N?=
 =?us-ascii?Q?OZXvGSu5+YTJ82jM8UPLnuYkbRn0NU/V0U2jJkNng9q4g8k5iuMurSzzCGpC?=
 =?us-ascii?Q?2BbjWbh2rz2Bv2XDC9S+/dnLsECcaayW0OFPL/pJfwJ4ZSWKuVZnjS3WUoGC?=
 =?us-ascii?Q?CJhqtmiySsdqjmWXmYkcuoKNabYfwlqtWzVj5GOGf6r3Yu4ZCZxajxQdpPOK?=
 =?us-ascii?Q?L+mCkwOIKX+s+uVhpwnzZRZCm/T9uxYk3lTCw8fq4dYf7FkIzhQDUESgcvIh?=
 =?us-ascii?Q?Wkw4BHWl+9L6Cz+ArvVbSyjIgAbw5gWVG+QKVZaCZ0qOCu8nnkM9VwFL4CVl?=
 =?us-ascii?Q?fM8BfAYkLnprm1edair9U4xa6V0puUcdGTM0DaT5T5t7J6M7taeSn6riMotn?=
 =?us-ascii?Q?0hzUjA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 07:49:25.2867
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f39d5695-e392-4994-43a6-08de540a9a95
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8191

This patcheset contain:
 Patch #1 Add generic interrupt storm detection mechanism
 Patch #2 Enabling interrupt storm detection for mlxreg-hotplug driver 

v0->v4

- Impletemented generic interrupt storm detection as suggested
   by Thomas Gleixner.
- Updated the mlxreg-hotplug driver to make use of generic interrupt
   storm detection.
- Modified the logic in mlxreg-hotplug driver to track per device
   interrupts for the the shared IRQ based on the call back function
   provided by generic interrupt storm detection.
- Addressed the comments pointed out by Ilpo on earlier versions.


Ciju Rajan K (2):
  kernel/irq: Add generic interrupt storm detection mechanism
  platform/mellanox: mlxreg-hotplug: Enabling interrupt storm detection

 drivers/platform/mellanox/mlxreg-hotplug.c | 74 +++++++++++++++++-
 include/linux/interrupt.h                  | 13 ++++
 include/linux/irqdesc.h                    | 20 +++++
 include/linux/platform_data/mlxreg.h       |  4 +
 kernel/irq/manage.c                        |  4 +
 kernel/irq/spurious.c                      | 87 ++++++++++++++++++++++
 6 files changed, 200 insertions(+), 2 deletions(-)

-- 
2.47.3

