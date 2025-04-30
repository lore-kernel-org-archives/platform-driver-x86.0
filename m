Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2076.outbound.protection.outlook.com [40.107.100.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576C625DAF0
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Apr 2025 15:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746028656; cv=fail; b=HbLbJsNjkFkIVW2Zc61R6zCLpKjcps8NjXhJ1UWgZonP7OTccm0syfjFkFPnyxfRCEEzML1XM/18HjDyggH0fRNUFJQvepO2A+vPB+esLgLvjJQ21ho+p11UodCYQtWqlo+Sv1c0SYHe4FhECO40DOvL3fEcZAhggBVGrwdTdUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746028656; c=relaxed/simple;
	bh=hj/pMwye7tcEKA71yFMv+9CcnxlLVTA1d+5/ObyNEl0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NmIabLrfEkgtUQ2tEAXOcbkPL+QPKg2AzRFMyQPdzqA36Wp8HrzXu6+fO66rzWGmV+kCIbq5BdiBhZLr/mxEVQ2sHKvViKPe9A6U1MWSHqwPzol8eqABxTpIWZYVq2rlf06YejJ4K4hTF9nPi124Sfclug+aqbRwybPJlwtGCAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dRl+cjz2; arc=fail smtp.client-ip=40.107.100.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dRl+cjz2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y+5VqgYfWPMB/dNBy43tE94Hd16BkfjFcjlnfUGbZf7lIXEJINyZ1Jdd3mbY2VEJ9Tzqrx1IA/9ggOsOk29xbGzyGUE18Dv/cCGUQjjOc+y4klebCxLzPVmmyZsBE1rhZ6qGvxEdIafzuEbHMA7tYj5satMRCZ+HxgrCqxZcp9ebdlMv1Uk0YxDB6oGifI0XgttKn06oR9W49ZA0Crb8vdDgWGc/HL1jgErIAHuwyzkeLBthlhGJN22EJ6Q7whSBoLGPmT8Kd2Zkcr0Sxe6/52yAyKln0nw5wT1pDWB5YVcsdwC8OtpHaLs6e8blP6odeu2MzrcKkJj8waBRk4xLrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXyMPmlj+3pQ8iIGI+d9qkneJGiXRyrD9m5yUoZgAuI=;
 b=lvkqEpmVBJ9DtcMsoL3JdL14neOj9VpQn38t1M1oLBu/LJnlO5G65FtF6GkgShVpCMY616Sm2RSCLtSXRsYxO9i3plGJ33GGw03jQllKQsfGE7xKsOARVVl0CO40uhogsxSjd7hghrSKwCvIGxL+cV9mhnKTNNeJwidbYpSqTv1xQMOvIhxu5TsQa4ujV6QUFhZ6iHVhYzGBtAUZt4Bi+DNlNmEOpfJv90iBoRhFqUpLPBtJXGRQZlARH3UZ6B0jN57PaaIdDCNq/UuJbWssCI1HBRfiJk0Uir1xgk4BtnSoKJE2u9g58cmWMwkVhcA46r2Iu/4sqjW5z/xbXPAMHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXyMPmlj+3pQ8iIGI+d9qkneJGiXRyrD9m5yUoZgAuI=;
 b=dRl+cjz2gnrWY+z+DwU/RNdBRrGwF67G3QFRd0O4HMf1I4mL9raah/dadMUHEkJ50BI5+DccqRHpM94rYs0PGSNxrx5/I4W0hhqw2b1wesl/ih4jJUiPuN3VnrQNMxz5l+pfWE1hM2rqIcW9jIcJbuq5wK6EGnTRRwfOfev9RYwX9f/gMod5mK81mFyG/fe2oEtJFoWIMY28kMhHxWNd0VOfIYTdDb7Wz+5tLDEaZ6q9W/PmWzR1k1/HzjDaul5tssbep7ztsMLBrbjdjF7USii+Zv9va89jq+eYgOyCT10qkt7JEx0DH1TO7GcOfn6zv7aUNUL3wyYPR2Ovhm7G7w==
Received: from BL1PR13CA0074.namprd13.prod.outlook.com (2603:10b6:208:2b8::19)
 by CY5PR12MB6084.namprd12.prod.outlook.com (2603:10b6:930:28::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 15:57:30 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:208:2b8:cafe::a8) by BL1PR13CA0074.outlook.office365.com
 (2603:10b6:208:2b8::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.18 via Frontend Transport; Wed,
 30 Apr 2025 15:57:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.2 via Frontend Transport; Wed, 30 Apr 2025 15:57:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 30 Apr
 2025 08:57:10 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 30 Apr 2025 08:57:08 -0700
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <michaelsh@nvidia.com>, <platform-driver-x86@vger.kernel.org>, "Vadim
 Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next v10 0/2] Add support for new systems, documentation
Date: Wed, 30 Apr 2025 18:56:49 +0300
Message-ID: <20250430155651.49732-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|CY5PR12MB6084:EE_
X-MS-Office365-Filtering-Correlation-Id: 3da125b8-1a74-4cf6-d988-08dd87ffb6a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wwxap2863Y5sL0txGwQJI1+ZvLTef7fqSSSw0XXZXBxgU35UX2lNaSkdiSf+?=
 =?us-ascii?Q?+gmJTiObUz7+EY2qF573S0gtApH/rbgaYUIpm2bKZlxIZw7wZ1WIteseNwBz?=
 =?us-ascii?Q?0r0zJLDJKWby1VfiIlqedxkCKxrRMlJ2iyYrorikclTIIOLq5yxza9l4QK8p?=
 =?us-ascii?Q?FrupN+/+/30HKs41Q9iBgQp7yy9h5QvLRu1q6b0BhYKT8l//5DhkRclyzTec?=
 =?us-ascii?Q?NOBt69eoRBKZARwb+54R/SD/dV+cYZmhsHZlzutxsRFpFFdlysRE4078UzqO?=
 =?us-ascii?Q?SIOH1sxEa3UuX0GPr/s47cFQ63M+AU6fgCEep7zfv2IIR+0cWDP9+VAs55wI?=
 =?us-ascii?Q?iE7p9QmX2YQooUxY+PehDDvwlGY/EXnXnricLXg+VKCeoqkp5jPRCkfEXyol?=
 =?us-ascii?Q?Sb3weLJP20IFG0FMH20X7lGZxsoB3QkWjI/HY20aRBeiC6aFf3SHQATEFqiH?=
 =?us-ascii?Q?wXz2FAV3HG3fvBmDTtYXrjxm9Df1jmXHJu+z2C8ulQZy3mVjGUXdA5l+EDEv?=
 =?us-ascii?Q?I4rdjK+ZY49wpS15sNupmOFAC6YxxDUjLJxPR7Bil5K0sB7+Xk+OIKg/Ye+j?=
 =?us-ascii?Q?yyzDUrNAxo3IMS72V/corGdlPHt+osN0FS0PoiRssfn2yoI1gkXbnB59IHvG?=
 =?us-ascii?Q?TVrYVsl5cT3E757vgQD3GjEBghHOc48vy3NQg4LYB2l56pGkUbglpfZa/6Qb?=
 =?us-ascii?Q?tOdDeGfO+gjQmoQpgzGW2JRuu0zp/340PiS3V+dpK+5insEBZtEMdgY+meBB?=
 =?us-ascii?Q?hqxhoTg/eLwFXIcsiPUX/xyBWfGcL9RxPySyqu2I3TK5DmrqIiq07meXE8ck?=
 =?us-ascii?Q?1gbqQTt+ya87LoIvfX5+gGYkSuKZzddZjRkM5czV9FOViPUIJLzue9etyrbu?=
 =?us-ascii?Q?dD1/M+ut7W1GK0FSoqDqgzW6Vl+Cn/lVBoCvhaGzzyt7GtnUjfhpNMYUKG6P?=
 =?us-ascii?Q?zLEtJercc5runGBXnSYf+xIHFj7cq8f6+ZQaupblOyfc2QL5NdsyzAshriD1?=
 =?us-ascii?Q?l6QkxV+3I7bJ9E9ymDPFKxwqGt909PY/icE0zgeJXuYo3XukgDxjdsMwo7T2?=
 =?us-ascii?Q?ksn4gsnBwrUpMdLEPxK0Hgz2g5glBIa01F3MV/oDhDUTu/yy+K1viCJjLT3q?=
 =?us-ascii?Q?dIKQPvXaICsynqfh6mGvYGQwS1Q9Zblq822J+mjL2/cMjcnHJXzb8h0Wb39I?=
 =?us-ascii?Q?XzLcAdfP1pUoXbjWFMlQsmajMp/LjEuHz/1gH+C6CJ2RGSM+jSSNNxZ7M3D8?=
 =?us-ascii?Q?Qn2jU+oiuwT6V53ZJhBmZSzuADGtXLArPV1b9QRqX3y5crxVJa8FygnbFX60?=
 =?us-ascii?Q?GTOuGa11a2KhcIKtBRbyCwQ8RuZGyk2WCibZFoFRqKTuC+0XxHG7K/89bSIx?=
 =?us-ascii?Q?G1aGjauz1zLtU2niSlqCHbbUX/ki9TF96BkAWOLaCM3gKvoZyAZVKe2Mp5b1?=
 =?us-ascii?Q?Tij1HFOaQi6Tcnrs7FuzGsbQmkpd4jAEPgQe0jiuOu6qogJ9+7ahYkJHOB+l?=
 =?us-ascii?Q?8ligy7P48V8Qyz9DIPkQt/7d49sUG2cto7hS?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 15:57:30.4860
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3da125b8-1a74-4cf6-d988-08dd87ffb6a1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6084

Patch #1 - new compact system SN2200 OCP rack complained.
Patch #2 - Adds documentation.

Vadim Pasternak (2):
  platform: mellanox: nvsw-sn2200: Add support for new system flavour
  Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces

 .../ABI/stable/sysfs-driver-mlxreg-io         |  96 +++++++++++++++
 drivers/platform/mellanox/nvsw-sn2201.c       | 110 +++++++++++++++++-
 2 files changed, 203 insertions(+), 3 deletions(-)

-- 
2.44.0

