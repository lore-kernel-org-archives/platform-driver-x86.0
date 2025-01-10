Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA6520E6F3
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jan 2025 13:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736516957; cv=fail; b=WjnWoyAozDTrgGpRAZV2uFhyHDHJkfENBfIhBx/TjwLoUsNcg0LhutH7o4pmsJuibv2li1DIg9BsAnOAkNs5Bm9eDK2CavPELT81RaOjYxSXp8qprqs0vsPE8WP+sGW5To4t6UdeUJ8UIbPkTN/vXoP+6DkSrNjg84tYd/x3msY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736516957; c=relaxed/simple;
	bh=exmMwRMtJj014WxCShgxtrzsU69oSxGoO3Q/ASDhV/c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nHbqZVMtzlpe310rIF6S/ihI+x/P2m+IULieu1TjXqothHmAgZJOr0Ur8V+mtScKm+0jajyySLuw5nTFYmPttizNVQKvu3DrsJX+cr6wJon/GxW1atVbwDK3mjxdClfx2ATjNm3MqPe2wi10CREg+XQ9L1n08x5WplZC6cMRMX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KQH9lxNR; arc=fail smtp.client-ip=40.107.244.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KQH9lxNR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OoF/+Crd5sswnjqjZkUmnRZSpwdsafWbKfO3hXL8c+H3nPSgQLC7kCHTraGfzAPMtWnhsYHUQmKqB1YmjYAnd9xzkDHWg1HnP1Ecwxu9juZfbF/iHyPxbpBmFK/fkg4JWN0MRvFV4trvtiok8yf+5rMYDP9Baf/3QIwNb+poa2YfH4mgRO4GA++l4AKV+SFOCLmvvtHlJUk8uv0U1e36J6aLNAR/8fV63T398CPj8Z443LE1Ny23c37Mk0+o78bT/oi6BrJ3z1n/n3Pv5XgCzgSUASzFk6mb5NPeACKYdMqGrVxNt0joYKnpg4xIi7ZtnZeVuD9vLnHRD3vRNvQeAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWRGAimQrkm/n8ucQDPsK88qIBVD1QLR5r9MSTtGyGs=;
 b=LHqaWUdNNWVNoW5sr/8Mwid8nDiU95FmDwEV8ZNuFJid56wjI+E//O2QGdiUZ3hr1YclW7+IsYI2m47sBoGlgiakXJ6qkow3Op/L6ZL/77bJHiiyfSlgd5TUlNMRFgJA/WcXr0I8O8q0qxr5Vd2fLqeGXS3oZvHR8lrqC85bwHjR9z6Nu/Yf3EdoDKa751qXSRGM7td7DIFvAIZI5trBvC6T3GGkfmETDXnqRw6OBTi3SKnhQsV0LrctQkio0XWpzwo+FfdyZNEc2lInpNIdGAs3Jq7xtHVqg/OhU93frCaj99W1KRxnhGpgg4sP33QLI4DTrF3FQaNnMGZwynkbaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWRGAimQrkm/n8ucQDPsK88qIBVD1QLR5r9MSTtGyGs=;
 b=KQH9lxNREm776i6OgU5R42V6WZlYXFNjRy61zBXKdfkBhOzK9WiJhC5JvN+i9AODzufikekC35pDEbdFvt55zM8x7rQX0VFtEmG9NtkxZLd5/Pc8ZPm/j2O4xhX9OZ/ewQjKkpxzxsbirkYtSwtZxBocuAa9OO1LsYEBjz0Gp+JppAOPTF0WZO+L640O4crfPgTaS/6RcCsbYOjtYya4k8Bj8BB5k1yMazDDxLSswi86QVP4vaPy/MjVT9ybgP3AQdZmjaThHciwuj+wvD+Z2o3gyeRITXpWQmyYsXXoXvJ4E+2hwFw51y9j7S3C4/SfFErgjhsl4MjBbh+GyxzQEA==
Received: from SA9PR11CA0009.namprd11.prod.outlook.com (2603:10b6:806:6e::14)
 by IA1PR12MB6236.namprd12.prod.outlook.com (2603:10b6:208:3e4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 13:49:08 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:806:6e:cafe::15) by SA9PR11CA0009.outlook.office365.com
 (2603:10b6:806:6e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.13 via Frontend Transport; Fri,
 10 Jan 2025 13:49:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Fri, 10 Jan 2025 13:49:08 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 10 Jan
 2025 05:49:00 -0800
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 10 Jan 2025 05:48:58 -0800
From: Vadim Pasternak <vadimp@nvidia.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 11/11] MAINTAINERS: Remove MELLANOX PLATFORM DRIVER item
Date: Fri, 10 Jan 2025 15:45:09 +0200
Message-ID: <20250110134515.8164-12-vadimp@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250110134515.8164-1-vadimp@nvidia.com>
References: <20250110134515.8164-1-vadimp@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|IA1PR12MB6236:EE_
X-MS-Office365-Filtering-Correlation-Id: b056cee9-2a7d-438c-f6d4-08dd317d8e49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d1RSWGpkNE5ta1IyUzdaaVBCaTVkam1aclF1Z25hditMZjhaQTFVb0hsdmVt?=
 =?utf-8?B?YWFCdVNNZDZwUFRvZmF1eTdFdGpDeE5GVDU0cm8rUy9qR0NPb1FtTlc5T0Y4?=
 =?utf-8?B?VkFoR1pXZW9iMjFQcldibHZmeit6RGRnSU5WdXRueXZLVm1YV3Q5VjNUNmxu?=
 =?utf-8?B?UGpTYVI4NWhtanAvSHBhSEVCL0JLSWZxSHE1ZldGUnRsWG56bTZDSWE5aS9Q?=
 =?utf-8?B?b3RZQ0JSNEIwSzVmaHh3ZzVHcERCZDhVT2NhSXVOVER2UnhzaFFYbEMzOGJV?=
 =?utf-8?B?N29aNjlTeGs2Zkd2UVJBNExaOTRhVEpFanFxMXMwQnBRU3dHVEJ6NmpPWTcv?=
 =?utf-8?B?UDVCS0JuN1hyb1lKTm1YYmdKRi9JM3NkczB0VXZ1QzU3d3VTNkkrbEFvU3d6?=
 =?utf-8?B?RVVwVGNyaGFBdXVENkwwZDIzb3laSjhkRWxRdUJ2bGZjM2M4SEFvbXdkdDBR?=
 =?utf-8?B?SzhyWDdSbW9UVlZHcytzbnp4bjM5SXAvd29IREZkWnFLWWRnU0haZFl3RitO?=
 =?utf-8?B?blVvTEQzcDhWenBKdVFnZGpwNkkrUklYOVdWeTJ2bjZzYTNWRElPZGY4Zi9m?=
 =?utf-8?B?UG1JUUhoeklJbDE0Y0d1dlVwZXUrSUhBM0VhWTVjaTdkT0ZDTmF6cUFBQ0lp?=
 =?utf-8?B?MTJwNFRWbHYvVkkwL0F2RWxRRlFPZlJaMXo4WTViNUx5NktxQXdkN3JxTGhK?=
 =?utf-8?B?TVovTlFnNHdZWnF2M0RSWFhDNHB1Mkd2WHRqL2hWSWhOTkZIQzJuSmhUQ2ZD?=
 =?utf-8?B?dW1EaEhXU1k0eXBTV1hjTzl3L1RLblFmM0FhdFBPdWtoNG9oVWYyM21GbkxT?=
 =?utf-8?B?TGxobFNCY2RkR2JvZTRxOE4wbjhJLy9rUGM5eER1bGZsVnBLSUxORVA1bm5Z?=
 =?utf-8?B?KzhBcGtsQWNzSzMvZ29wRTFHNjgvWjBaK2VqTEk4YnB1cm8rUENKZUpjVkV4?=
 =?utf-8?B?ZGpzWUFSd2xnajRjTzIweEhRSVBmS3RFM21FakdaUHNNUXRDNnJTRFhYc2Ru?=
 =?utf-8?B?dUltRzdhaTRYT05qK2pHbXdCaldMeXd6OGJLNUxhSmtOZkNWbStpWmZRbnlP?=
 =?utf-8?B?WXg4dU5zQWdmbDIweWs4SWc5TW1sbDVTZzhMeVNpL3hBRzhJWkh1UVVqRnFj?=
 =?utf-8?B?R25zRXlycS9zWkRzRU1sLzA1YXpsMXYwM3JqcWdyTkVicWYxeHNCS3o0NlFC?=
 =?utf-8?B?RGI3Z1ZnLzlSMUhrTGtkNGRiWlE4cW5ocTYvNnlZTWJkNnUyQ3dXUUlQUTVx?=
 =?utf-8?B?akljS3JqZWNNSEgxVExnaCt4MkhLRHZFMVlaYVV1TitSS1lTSmZrS0NDcDhj?=
 =?utf-8?B?Yk0wbDFLWHBOT0NVSzlJeGNYQVBVeGEwMzJTeE9OY0g1L0FvM0FWTng0d3Vu?=
 =?utf-8?B?TlNnOUxhNVZ5STFqTGJZZzhTY1NndG4ya1NObU44cEJFNU5QUzJkdk5Zazh5?=
 =?utf-8?B?cFF3REhBeHR1RXJzTEhXcDNSTks4TVIzbjkrSFM5WkNGbU1paWI5cXRsci92?=
 =?utf-8?B?T08yejRoYmo4RVhHMjBtNjR3TGhtcnpGNjZTdkJLNisvek1lWERKZEtzdXlB?=
 =?utf-8?B?V2gvR2p4WHFGaG1SQ3VJZE5ucjE4TC9zOW9LYVpzM1pVK1Y5TnNBSEd0elgx?=
 =?utf-8?B?ZWdyMXNDS002WlVLY2VzYThqMnZBYW5lTWRTNlVGYXRQOW9pVndGZnpWWUps?=
 =?utf-8?B?U09BU1J3M09DYTZBK00rSFBRZ0xvRmNueW5EYzJUNUp4MkRzSmRkbTZpS1k0?=
 =?utf-8?B?Zkt4Q21CMDE5cHptQTNYNGVzc3FRZExLQktLSWowdkVHOVpqM1pHSVViNW1K?=
 =?utf-8?B?WTM3RmVhN2NpTjhNTVVnTkpzY1c4NDc4MTl4aVprQXloUjR2MzIxbjJWUWZT?=
 =?utf-8?B?ZjZxMjBnT1hUY2FWM2JNMFMrTVhKSnV4TURndFFmYW5sek1jMklLNm45LzFw?=
 =?utf-8?B?UG13c3g0V1ZmMlZBN3VTMHV2ZWhRcWtLdHR3R3J0L0QvUFF1Q2VrNXVwVTdK?=
 =?utf-8?Q?iL3ppzLCzM0dv8aDHthjrXSFVofjKQ=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 13:49:08.2957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b056cee9-2a7d-438c-f6d4-08dd317d8e49
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6236

Since drivers/platform/x86/mlx-platform.c is rellocated to folder
drivers/platform/x86/, remove "MELLANOX PLATFORM DRIVER" item.
This driver will be located under "MELLANOX HARDWARE PLATFORM SUPPORT"
item.

Add reference for Documentation/ABI/testing/sysfs-driver-mlxreg-io under
"MELLANOX HARDWARE PLATFORM SUPPORT".

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 MAINTAINERS | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 85c8a68d11d8..9b063c4fa305 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14894,6 +14894,7 @@ M:	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
 M:	Vadim Pasternak <vadimp@nvidia.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Supported
+F:	Documentation/ABI/testing/sysfs-driver-mlxreg-io
 F:	Documentation/ABI/testing/sysfs-platform-mellanox-bootctl
 F:	drivers/platform/mellanox/
 F:	include/linux/platform_data/mlxreg.h
@@ -14964,12 +14965,6 @@ F:	Documentation/leds/leds-mlxcpld.rst
 F:	drivers/leds/leds-mlxcpld.c
 F:	drivers/leds/leds-mlxreg.c
 
-MELLANOX PLATFORM DRIVER
-M:	Vadim Pasternak <vadimp@nvidia.com>
-L:	platform-driver-x86@vger.kernel.org
-S:	Supported
-F:	drivers/platform/x86/mlx-platform.c
-
 MEMBARRIER SUPPORT
 M:	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
 M:	"Paul E. McKenney" <paulmck@kernel.org>
-- 
2.44.0

