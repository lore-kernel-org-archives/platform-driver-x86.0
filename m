Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2042.outbound.protection.outlook.com [40.107.237.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AA5156960
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Oct 2024 07:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730099123; cv=fail; b=hx5Ms1Ikz8zDme/X75tKJpR1jI3/G14c6+gtoI2aLXhkSwRAbqJq6TdzIfz4oU8Dt6gBbct7dVhomG+WEOA/QYCUO1bkc3OaTF7I5lV0GVhXLeRG8l/JNVO42CPYh1OJxudPVLLNSS6V0hYFdBgpcEyNTRAKhO3dalcm7x4kIus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730099123; c=relaxed/simple;
	bh=RBasAwcO7KYIBnStDh/HzqeEmib0tQ9p4gjURaOuNX4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HJtoyf0Z4ecHPjwjZ1bO9YGJA5W4qTNCIroz87nb6ieAddD7g8lyFEXUkjCbM0a52kjZC9mcFKz3PN/RMViKWnzWilNOR2emwPG4fyGOv64OmRcLTgXFHd3ETN5pzyuBJIJzcH/T7c59o4LFFjwggyQxd0yUzJC1wVSRzZ+KPO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KMx9GHP+; arc=fail smtp.client-ip=40.107.237.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KMx9GHP+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AopUs68Zg45NSQk/vda8YgHWnwOXWCfIxvMtU2u/6ta0zIWQDyIDwUpSOBmSrRIHRCNRmh5AsXbcJp7jrvIv0ZocXWp/ePOC1Lyv4X//ha9RspTuGB+Nu6MPl9TrL16oMX0yLlSK/o0NpOq90VVQut4fLiwWb/eno238EAUbhySf0+pSt7dSvGSDfRXNfYXNzGRHyFfNJf/Ruep1rALjEY/zn6k4jnsvcw9aXNdXBxiFYj3NyjNLl7k9JAVJi3X6a0VHFHx/ekeY34+47jr4S+mfdbkKWgilavCTZN3KwyEMuPsMhNdhS6WIUNfX/91W/Wg+FdjFAvEtInnp+C+O/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e55zHM3rTtHub8poD34n+yZQppYUVRXg65PSv0saZrg=;
 b=ICwM3/G5MtIVRtHWkJva2vaFHBVYgJ2ocJWbC0kBvFU6uKXqoM0AN4rvOw13POTfCn89rA4MwhhqATtjik1+xEsT2BVFLifv7z8OdojjmozDNMn7+Zi/HYmirF52ngarJI+uQbo2jeJIpxKzReJ5QHuxgXrX8+yo30zkl6QwtOMWE4kWZzrE+W19L5sK7pWfyXc6J5Lr2Abn94M/pOvJ3CqBGlh+692pXt7tw+XpSbjiWH5iATm8Kt8YUIIQ9wZg98uEu7IddfhZk8OI96iM5ZgNjR9C/J80OqtUcvE6TunU7tnVlMjaWkGUnd0ye8ARBaNKFjO7Kk4chudp761fww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e55zHM3rTtHub8poD34n+yZQppYUVRXg65PSv0saZrg=;
 b=KMx9GHP+nMXOGRJJfefayHxwZ4YWaOQDJrzQyl0/C8hxhdGxsq4fRyS9zc+H5hY5xx4Bj475roTlv0AQVXcYPjLG9yRJfhXQQiUG0Mj8GMI53imNckSF/XxQyVcYO3APHtHX6+2tJdl04PwGJReqMEApqqXdlpY5ihN0aroBKKI=
Received: from SJ0PR03CA0145.namprd03.prod.outlook.com (2603:10b6:a03:33c::30)
 by SJ1PR12MB6364.namprd12.prod.outlook.com (2603:10b6:a03:452::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 07:05:18 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:a03:33c:cafe::1e) by SJ0PR03CA0145.outlook.office365.com
 (2603:10b6:a03:33c::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20 via Frontend
 Transport; Mon, 28 Oct 2024 07:05:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Mon, 28 Oct 2024 07:05:18 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Oct
 2024 02:05:16 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 8/8] MAINTAINERS: Change AMD PMF driver status to "Supported"
Date: Mon, 28 Oct 2024 12:34:38 +0530
Message-ID: <20241028070438.1548737-9-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028070438.1548737-1-Shyam-sundar.S-k@amd.com>
References: <20241028070438.1548737-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|SJ1PR12MB6364:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aaf2f7a-1496-40b4-ae19-08dcf71ee181
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x2QScQZ1hzSBbfjFJKq7DWzRgX0uAWZSaO+pesCweW59hPcF/2qebUBu4ZAQ?=
 =?us-ascii?Q?TlsnZpXlGO/MTfYec0bvC+LNir3N0Luj326Kw3F6ihFPg7RbY7o4brbOa5rW?=
 =?us-ascii?Q?7OGqVTT/TABTPFHkckXJkp2I3jCF6WMveHT4+V7oQa2/kfEk6zJjCWxAbLzS?=
 =?us-ascii?Q?xyFwOsIQsN6tCO2pgy2tir2T4WILZZoBtxKdTHwxxe5ibIms3dUEx/i0J8C8?=
 =?us-ascii?Q?tCjVhf3KsLg+fHz4vbXIMYM3Cu3tQvjKmD3lfcMEsx7RlFwFFsp0W4ccejmG?=
 =?us-ascii?Q?O8szTHSfApB6b/6XTGMxYyMjWBN9V79ctjT8DpfIEGnWlQlyMQZaRxOvl8RD?=
 =?us-ascii?Q?y8DOGs3xy742jDbTTFoVqoYwmqt5duu9B2dfBLwn8nUtpTQTRoQ9uyet7ezn?=
 =?us-ascii?Q?wl/NEVFwkXz00y0Vk1KWFbmLZR8YsLeNkZtQwUKxiTEL2DwEgHYtZkUCLLPV?=
 =?us-ascii?Q?diZU5yfBzL7AXynJNqHoEXS/9KIgQzSU6PtfNXb7ZfBu6ZHtOQ9FAU6dfzlo?=
 =?us-ascii?Q?vGm37Oc+bOh04pbh3V6gRe1/1W/9rwWdk3YpDORgIcBDmbN7sAMOHGOpGfMY?=
 =?us-ascii?Q?1v+RkK4Q2yqd5rngiP2XkSJYC3pCv7lMSZhcqd8e7xDJZEyHmxtEMNrHokB0?=
 =?us-ascii?Q?wFsHrFCqDSJqtjRwmMuIZ/ZlhNf0ZsS9N1BFNfEMIEsarXCKbioNk+7N3f1d?=
 =?us-ascii?Q?TrsmTADIEiX6SU25pjNjbV8vlQjTnc4pqzG34v3oq+OAHxuZ1ERaQKL4dz5Q?=
 =?us-ascii?Q?mnl1tXmPdLikePo1LZqPm2x+4g2QGv5y+i4FAnsPH/19L7DdlHme9KgcMYcd?=
 =?us-ascii?Q?Yk2oKWI+CCDmAIycsum7J0gorNfRj3FfNoxVxp7wInrQjqG7IiEbLUd/cppB?=
 =?us-ascii?Q?e8V3i1BXjLfUKmFScMYLjYRjfnUuSTJrHtJoqEkzKwNOkCW89zNerHri8NF7?=
 =?us-ascii?Q?A6T/DPTtoYGZDGBVLrq9kzAciStd7/XXXC2zANTEiFtCsydA6hzKS/jUnd6Q?=
 =?us-ascii?Q?nLXOwxNRkIu7Ws8vJ0On+b4ZtAQXzQ2eZKjzsAbMXHuEFObqsVMfRBC4VR0B?=
 =?us-ascii?Q?aWfcxTaAkKJSYRtl8wbX5+Y5BjAXtByvHzlja/LIvjLzNj/XQXEbrEp65KED?=
 =?us-ascii?Q?aq8EIRuDsRZVcJ+BuXtuMkQ92b3FXuArmGN8pFYQH3BsjoHybTdmUiiuPKuq?=
 =?us-ascii?Q?8QdJd8prOqcnoPKh4Y/0UwbuJEafTj2vLeiNiipgE+M2NtzU4zqLshpt/y2E?=
 =?us-ascii?Q?ArmOyAuNu/HmeCzBMSE0k/7VVU4kO6q3WRqFqRdDN1oFXhVZLgW4RX9fSHBc?=
 =?us-ascii?Q?BJ+t8Kd8jjd9Hvbg70RpdH9jdmCRa3T6nU1HSK3bRutJjI5G8ZFoNFmNmjao?=
 =?us-ascii?Q?QUZId1+tJ2E4HIO4nRM6TP3PfA7BWszxvmLJggP5WUeiMnnbWw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 07:05:18.3125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aaf2f7a-1496-40b4-ae19-08dcf71ee181
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6364

The AMD PMC driver is actively being developed, so the MAINTAINERS record
should reflect "Supported" instead of "Maintained." Update the MAINTAINERS
database to reflect this change.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a27407950242..6594a74b3d11 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1118,7 +1118,7 @@ F:	include/linux/pds/
 AMD PMC DRIVER
 M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
 L:	platform-driver-x86@vger.kernel.org
-S:	Maintained
+S:	Supported
 F:	drivers/platform/x86/amd/pmc/
 
 AMD PMF DRIVER
-- 
2.34.1

