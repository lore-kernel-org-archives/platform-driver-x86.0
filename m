Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010054.outbound.protection.outlook.com [52.101.85.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5688434C81B
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Nov 2025 07:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762845039; cv=fail; b=iXZQqXPzyAy9FYh+3Mz5hVvuqNlkCJ2dGR35sZ+OgKnGyiTT5TtRnWig8G2qx1kIj6NZyCmh10p1M9AaJ0uk3GFaJpbTm8V8zWpDQbCl25jwf3UEca6hX0zr45viPTTL+R23GOhKhzKzvVomN50TPORkBY25vLR57uPqGezsONY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762845039; c=relaxed/simple;
	bh=FebTeKk2d8nMwzCJWcVr9sjFfZZftTYFOGbbtX9aVC0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MmJT8MiFNG1tiaHH+aWsJYRvbNxWcFu8Cpeb/QMrCE86UKnO46WTCewtsejFSq/iR4MmKTMYGM4j6Q8TzbuvuAwWc2mZk+4Ezju32NK3UluEZx4iNkoN35/j3InDQfHHtk5aFpZ/WJYnXCnKVoYRUJJz9zGET2s///PsLAetYBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2Ptenc92; arc=fail smtp.client-ip=52.101.85.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2Ptenc92"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pACo1l+XOXkTO8MuepyvShobdOIAtjM5iXqnNHaCLtE0D9o/JR6heXKpQUzHbSqaJ07PbZto1oWc0g9lTeOixDmzyzd1yPaaPo9joP+AJdaiYBNzYmcPTvgq6ucAd9+6kFD3wCdn20KAyZIBL6Xo2kXK75Rl7aOuU+fn9qDc7Ictthhh/pUr0uDZQFWA2931lqwvVMfmzhViZBdxHnj8Xb2VOPDZz6QKU8/gozPTV8m+yhVm6AWzbBc2XNnvGjOuZbzZPl3B5dA5URVk4T6YcQZv6t9QpGNbd6fs9fJQ0hegAV6AYRAVaK6jwR0RfNmgsUKajSaaSiDLI4tXjzdIvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UdJtjIT+5ZPt5rhc11qzGqmMpNzYhoN/auOcgR6v5kg=;
 b=aM9M+Or8CPpv2rdAkNBbgPbCTH9TxEI9NrrSApkSHGZy+M902fNPsMIYzX83MUkDd0zMKN3XKFU421QBWe7AMdY9N0gf06U436vTjPRK3MI3wel15srmrQF8J7iEPXIOuWe88ZVMauw13+Bds5/VpI2vIPNUhTcwlmf0V7XdyMlYFKDaI4q/YEzHdpdfP1L8BQH9T1im/roTP8y1TeOxvIMJk9ubI6ibBeI2/YbVh95v+wZEKXyRpP5Iy2N/9K1cQW5b3SNVdyo6FXlWlqVT2VKsyKonuLKjot37M/o/9vQfaTfQk0qyiLEQghSbt4fXxlFPtlEiBW9BIZlxKX7buQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UdJtjIT+5ZPt5rhc11qzGqmMpNzYhoN/auOcgR6v5kg=;
 b=2Ptenc926i7NBFz3DCY5CJ0gj2bOPTvcHkTflioN1hiJzJ1VvuTyu8ZPJY8Mc5P0hDhqZhF7p5o3YR3w2VZuiXM0bLmPEhgGlqYoGfT7BBZKapKrV/tB0Mv7WQQbm8W3ftqPQHDjyY5sYesXAtfWp1nH1fuxO8jS7VUjjVQT4aY=
Received: from MN0PR03CA0028.namprd03.prod.outlook.com (2603:10b6:208:52f::16)
 by IA1PR12MB6353.namprd12.prod.outlook.com (2603:10b6:208:3e3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 07:10:35 +0000
Received: from BL6PEPF00020E62.namprd04.prod.outlook.com
 (2603:10b6:208:52f:cafe::4b) by MN0PR03CA0028.outlook.office365.com
 (2603:10b6:208:52f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Tue,
 11 Nov 2025 07:10:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E62.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 07:10:35 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 10 Nov
 2025 23:10:32 -0800
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <mario.limonciello@amd.com>,
	<Yijun.Shen@Dell.com>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 3/5] Documentation/ABI: add testing entry for AMD PMF misc device interface
Date: Tue, 11 Nov 2025 12:40:08 +0530
Message-ID: <20251111071010.4179492-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251111071010.4179492-1-Shyam-sundar.S-k@amd.com>
References: <20251111071010.4179492-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E62:EE_|IA1PR12MB6353:EE_
X-MS-Office365-Filtering-Correlation-Id: 9be67795-5eda-497e-926f-08de20f168e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?282f3PjgZo0EQ3M81/luv1AXsao/PJimjXA7430FtZ+ONscX1RRtBOhCWU6i?=
 =?us-ascii?Q?BEBxEdCBr8qEGBknNiCOW64CNEaGWSbQBzf3WO2h1TJGZ9aOvOwOCRnHaqj0?=
 =?us-ascii?Q?kspEYBZPn3hfYrgDG/B0DlSH9iHv8x1p0Rvb8/EKqgHarlq+yYtG8WNI1W/P?=
 =?us-ascii?Q?WC00zqOJRTlik7XplGIZb+1sle6AmcCpUbZ+9EHT13JjEwreZXeLGgMqsvJE?=
 =?us-ascii?Q?xtjfijeDegOomTAl3ERZUnVDyjMz12b4rco/f0ffNQrMe/5Y7ksvwabe+d5S?=
 =?us-ascii?Q?ONSVK+21iAwQHj39JnE1agTK/Cx7kdcbv2e/3iySR+hGcXyejjXrL0Gd+V7A?=
 =?us-ascii?Q?NGv9ELJxCsLvfCg2IfUnoeSuOcKkrcNxzTbZWbYBka9ahUcoA/nJhXq/bbvL?=
 =?us-ascii?Q?g+yuvZnDEcecixoljeS98BMZmNrn0WTRuG0NPsbXk8eSlXnSPQQOL/wkXOyV?=
 =?us-ascii?Q?h1vDU3cH4ih9vB1d/4IzQSEbZaG9BZzb1I3HGwm+lMtmZ0uBIpxrKleJwUEj?=
 =?us-ascii?Q?IhOAreXOvOZn5BZy7sJuDK3Ue6HcS8YeSdpDGGkwFZz4IsWUYXopuw23iXqt?=
 =?us-ascii?Q?E/IVOnvg+RBhyBysLGLH+4wuxtSFwGaHztKbD6lzWslH0Fj+FqQLUufJ/8al?=
 =?us-ascii?Q?PPpG2echczAgRMkpksVn0jI62xHJns4JoXDGvjCQW5rPPTpQbboZfo1MeQro?=
 =?us-ascii?Q?pE7T1N7x9+Ph6z7hF5CrwMqXlatbV9kYvo/D9XrL3Ojh3USXU5v0ccXWsiGk?=
 =?us-ascii?Q?B3xRZtnZw4+73aYOmkz7lB4Z7nt5A2UKBbbUe/Rlby+rBIw32QsuLgGBy/X7?=
 =?us-ascii?Q?cQJhWf/HoPQ9xsDqLj18t9kAj/ZbZbP96HV47bITDPntzaKxFX5uQTCH9agn?=
 =?us-ascii?Q?A8UQ51iGJn1N4FJNID4P7OCLPBc8z/Jy+txfsoBUsoO2iH5AymUKlA9n+Uig?=
 =?us-ascii?Q?Quf0JkQzR1RtYxd3Ch0YAw2x57skbdr93Z6xkiGx5P2Khv73tITgH6a43jX4?=
 =?us-ascii?Q?ru3ae3ctb82pSz/iY/hQmXCNThv+b4QhmvoJy8fRIdQh+cr0Wh+znkngsm/h?=
 =?us-ascii?Q?VEmCUPRMeREa3TJiKpPZ4QbZttnyJakSOORZs/wnFj3DWlQVtdNURSV11SQJ?=
 =?us-ascii?Q?T6fZ4dCrL+GgkAmQ/NeyM3nhCXWFwhbtZebwLBzdDfXf45exRbklouvKkl8l?=
 =?us-ascii?Q?CJT89CxSCywXTY62EImpIwc60ynDS/2+o2gopXwREJuu3atn3ij0G+pYVkdq?=
 =?us-ascii?Q?m3798ewZlMnwA7hPnEinh3fTObAY3qGptb0iiiMe+Z1pQeQjBw/UhPxB/DOM?=
 =?us-ascii?Q?mlxwfWmAOfQsPotibM1808szfDVP3BXJaiqhcdEiq62+JAupYFscbzjlzwcL?=
 =?us-ascii?Q?/PLWY5Cu7HxzAG3vfo8hUQ1pfHWah3H703Axm48LXGWJIi0y8xmoYURdIUOE?=
 =?us-ascii?Q?PL/ILZCuyYxhdqcWnvxsYlNPj71sCXetb1vkycwM+2oTe7QntFG+eQ93n3TO?=
 =?us-ascii?Q?hljC+YtxmpOPNywh5F7HqXxv8ov1ci1EnXxrDMAw0U9U4KP65Z8LVk9q8cmR?=
 =?us-ascii?Q?oT35je97rntL9olQOe8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 07:10:35.1777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9be67795-5eda-497e-926f-08de20f168e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6353

Add a Documentation/ABI/testing entry describing the AMD PMF util layer
misc device (/dev/amdpmf_interface) and the initial ioctls used to query
feature support and metrics data information. This interface is available
when CONFIG_AMD_PMF_UTIL_SUPPORT=y.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 .../ABI/testing/misc-amdpmf_interface         | 49 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 Documentation/ABI/testing/misc-amdpmf_interface

diff --git a/Documentation/ABI/testing/misc-amdpmf_interface b/Documentation/ABI/testing/misc-amdpmf_interface
new file mode 100644
index 000000000000..2057f8e5bb1d
--- /dev/null
+++ b/Documentation/ABI/testing/misc-amdpmf_interface
@@ -0,0 +1,49 @@
+What:           /dev/amdpmf_interface
+Date:           November 2025
+KernelVersion:  6.20
+Contact:        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+Description:
+                The AMD Platform Management Framework (PMF) util layer exposes a
+                minimal user-space interface via a misc character device for
+                feature discovery and metrics monitoring.
+
+                When CONFIG_AMD_PMF_UTIL_SUPPORT is enabled, the driver creates
+                a misc device:
+
+		======================
+                /dev/amdpmf_interface
+		======================
+
+                The interface currently supports following ioctls:
+
+		========================================== =========================================
+		IOCTL						Usage
+                IOCTL_PMF_QUERY_FEATURE_SUPPORT (value: 0)	User passes a struct amd_pmf_feature_support with feature_id set.
+								The driver returns whether the feature is supported and a version.
+
+		IOCTL_PMF_GET_METRICS_DATA (value: 38)		User passes a struct amd_pmf_feature_support with feature_id set.
+								The driver returns the requested metrics data.
+		========================================== =========================================
+
+		Following are the IOCTL codes supported currently:
+
+		============ =========================================
+		Feature ID	IOCTL Support
+		0		PMF_FEATURE_AUTO_MODE
+		2		PMF_FEATURE_STATIC_POWER_SLIDER
+		4		PMF_FEATURE_POLICY_BUILDER (Smart PC)
+		5		PMF_FEATURE_DYNAMIC_POWER_SLIDER_AC
+		6		PMF_FEATURE_DYNAMIC_POWER_SLIDER_DC
+		============ =========================================
+
+		Following are the return codes:
+
+		============= =========================================
+		Return code	Description
+		0		success
+		EINVAL		feature_id is not recognized, or handle is not available
+		EFAULT		copy_to_user/copy_from_user failures
+		============= =========================================
+
+                User-space tools integrating with AMD PMF to discover capabilities
+                and monitor metrics data.
diff --git a/MAINTAINERS b/MAINTAINERS
index ddecf1ef3bed..4fd7dfa39e1d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1201,6 +1201,7 @@ AMD PMF DRIVER
 M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Supported
+F:	Documentation/ABI/testing/misc-amdpmf_interface
 F:	Documentation/ABI/testing/sysfs-amd-pmf
 F:	drivers/platform/x86/amd/pmf/
 
-- 
2.34.1

