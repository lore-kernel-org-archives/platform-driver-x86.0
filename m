Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011037.outbound.protection.outlook.com [52.101.62.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE47311592
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Oct 2025 10:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760696784; cv=fail; b=fY4FNt2gI0XFo+S7edvIMvjYiJ2HOu7XmNOMi2SCfBZp7MHU6mJ7dyKsbRZZ5zuvQf2JvDSzzVGr7LEBPlX1yD1ahGW56SiMWz8k/1qpCO9ObIpk0n5Z3iq9GTNbn1BA5JL5/6DI0fbH7i+Cj46+jdaXtInIyL+klHDPSM4LZoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760696784; c=relaxed/simple;
	bh=d8ST3g+f+0aimpUQHzju8wE87ffJxHxYn7POm92s7s0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bzgGzOETz4XiFSGTAFQoSRarWP/aAWphL3PJNxvUsFaZCXrKuikGLwX5Ox0fu/6Ok5fWMHCl0CUx738aJy+vpAH+yMmlN8WYYe0WU3sp9/Xk/G0RveLrUtmhL2oCqE0FkiYa3gYWBdPdHWfoeKYjYj2LSxgVycfu5lNMVDslAAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qcfvgaYX; arc=fail smtp.client-ip=52.101.62.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qcfvgaYX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TKwufNqqXc2mwBhC3PzW1sXCIoggAbtoc8ROi/I+9XEZtazTXsG8/5Oh16X5Q9aAs9cMpn/r8w5Aqj0BlKX9ZH02N7FGhU/j8PS4dWQOlwLXScswH6jw6+k3qg53yDp2bGXGqEhsrh3GeyLI5vQLaeqSqO4dtSAT8N3SM71LPN2KvEMu+5IlgTNOm7SYGl+vBbyeAIp6yrHCThFfcjFfU8lOGYSPu6UsMk3GmLQxnfNZjVr+Xh/Pn7Cmdyj1OtdrwsJSTwKSQ8Vsw6P9vRugQDQb+oceIFq3Nzqw8l6FcInGQ1uQ63x0xok+dKaYmnUHwDuDyyJwjJwFFJw3ULq9Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6VdWQM6gOxkImCxHBC/hhB3/YvcehpJSEG1h/QV27F8=;
 b=lEtmONMMb1P0r4z/NwB1RfVMxHElnnEVRMGt97CzJIwnDUQoZ6eNgg4evFxk8dtEJUIqgddl64mlPPlUp+7VLNxnqiBT3hnFs49+QREZjeeP4ieeqOkEwLnHiLgHvjSiPDLB/fwFr7nKtwJ/VV0egr9vnoIKLzFHy4fzkqoIKxNyoAsLs8ZspC/7qw0H+9PsmQQ6WV/K0HwvzlUWMsxgUBiKdhF9TcC7V6p8g5xAKeInd4v+L9zcihMyN9cQwspubB3w7Gv07d3DZ8ATTnOEcgWawp08C1yWD9MqBq1zDzagdfk7rFuSyjTIG9igMJ0aSY+yhFC4fGcbuzXjNZTbaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6VdWQM6gOxkImCxHBC/hhB3/YvcehpJSEG1h/QV27F8=;
 b=qcfvgaYXkE+KTg8mEKZqVFT0LFeLUgTJjL5/nTD1fjSI8pLqL+3TXa1htm6FvXE30GH5cxujCWRL9ER/+GtntXdAeNa03lNgZDfEq7BWT7qLlO6UHJ6wy2zZnHuWvW8J9dZOZARoaL9ytwyJHeFMfMac7qdRy/7eX9Utbu3nvt0=
Received: from PH5P222CA0001.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:34b::12)
 by BL4PR12MB9533.namprd12.prod.outlook.com (2603:10b6:208:58f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 10:26:19 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:510:34b:cafe::f3) by PH5P222CA0001.outlook.office365.com
 (2603:10b6:510:34b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.13 via Frontend Transport; Fri,
 17 Oct 2025 10:26:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Fri, 17 Oct 2025 10:26:19 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 17 Oct
 2025 03:26:16 -0700
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, <Yijun.Shen@Dell.com>, <Sanket.Goswami@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 3/3] Documentation/ABI: add testing entry for AMD PMF misc device interface
Date: Fri, 17 Oct 2025 15:55:44 +0530
Message-ID: <20251017102544.1470934-4-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251017102544.1470934-1-Shyam-sundar.S-k@amd.com>
References: <20251017102544.1470934-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|BL4PR12MB9533:EE_
X-MS-Office365-Filtering-Correlation-Id: 0657ad91-6386-488b-215b-08de0d679cc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rQSVzoQjIPe6piHhk9O+kxTxJzv5CD/0RsVb6w+qf9XpjqCEcEjQM2LyM49s?=
 =?us-ascii?Q?cp0/FB9ftJlmN9zr8QPXbi80DPtWHaqkbP7B/k5kz/5wG60hHFrWJXIuCMtg?=
 =?us-ascii?Q?5AKbe9ANWCk5OKDG5+Y7zLu08gX0drMx8uAKUi1kVui2O1/4gj6dHCwMAHS2?=
 =?us-ascii?Q?x1G8HWE6/boAYSVgTGYqBn6+OLO/meTvXeEYJ1P+oYiG9+2GuqxUY1vTZ6xK?=
 =?us-ascii?Q?XFBJKTNDwrE7G0RRvwg/U6IZTK+3eAn2mGshUeMLeK49iPOfEr5+946fysXb?=
 =?us-ascii?Q?Y21C4zle7Bp4IJ1StIYz5+zBkI5nw2ICyLPg3m3GvcGzX7Jb9RJ+VXsRIeZb?=
 =?us-ascii?Q?w2OeXzE0w3YCGHlrKyXZumgwzZnIXLut6x0VNcDbBB5ETk0YOgkb1eYypcDb?=
 =?us-ascii?Q?1yeq+jjrgUazrRrmpc+ZqCMV2dV1eehG0nk3+m88K0UMLZaWZhLDAUwSXfyU?=
 =?us-ascii?Q?fdcbXeKuyjMRWtwImyDWa7sh/FdlXxrrZwZybCXTpxrhQfM6lk/p566TidFO?=
 =?us-ascii?Q?cWkwg85tN8bqbKnzxc6JeRkmnfNJdy3MYLY+G1dhbEF4eqWAbSugFJPp3MtX?=
 =?us-ascii?Q?KY1U8/Cj2XQ7sYvP8Nko0GvO0bBf0EWcoPIpte5z5PV83ATsryhFRxa75Ocf?=
 =?us-ascii?Q?7tmGjwRemMSRoIjkJc7LdeJWbUHt/rkrGtc95G29owlYzrZirPthAEUSGSxj?=
 =?us-ascii?Q?Lczv6A9+1u7lWOsgrMFp7imbBMvDHFQYUBwpgZfl5SzS/yYgulWeiuKY0tMi?=
 =?us-ascii?Q?kBaCc7zpRsrelFrZWzZve8+WnV5o6qVyKv/XuCAUbe6onyKJrUNO8kK3B1Fv?=
 =?us-ascii?Q?PqVb+YgsElGNV7r3XkQXoOTKRJ9mClNaPML2jRz3ewQDLsIPzHHsMxGeUrq7?=
 =?us-ascii?Q?Wr6Yij3HB4oMJl7NkptkBHOvVImEjDCOH+1njDm5PQtnUUx3FAq0xfWlVGsf?=
 =?us-ascii?Q?hpeoyBRfRR/e/6CrhAggK5trBdex1q3f2YVOwnRqEUKMEQqz2wXv4zMHj2KB?=
 =?us-ascii?Q?niRG01fhw0obnPuKrzK/sVec2rBSYW6ttG/hGb9SgAehdz1iw+IA2vvFQtpJ?=
 =?us-ascii?Q?nKzS3r8OGpsXMVz5nSgPahGGh0cahW8CrWLEQ8oirapzZA8bWEXmVy0TnwNd?=
 =?us-ascii?Q?0mwK2Zbxec97rjhrzcjQRcaDXJdrHodaQIgm8Hbl3fd2oiQWjBqk4x5vCF3q?=
 =?us-ascii?Q?iUFsvMzLGNfdnZ5yhx+FnTLjtLLS0k9ywova9OOGbkyGGWutLjAHdBNKjMcy?=
 =?us-ascii?Q?4D58ag+cGYeYGYI+iHgOqi88Qjr6Pb2Xen9TXDXmVbx4DJB3KuEwtfbZWvkb?=
 =?us-ascii?Q?FUByQ9bKZRtcRwr2Np8KJm4b1Y3jxmV9wl0tv7Q4N7qpnQGmKRyxh8gt207r?=
 =?us-ascii?Q?QkqzUqou07Hzmsibu4viG/v8BAxX8okIf8rUo7AjJMIbJuUko7wg2UFyVsTc?=
 =?us-ascii?Q?6nklQQjk8qBCD9506rjwxI7Ua754t4gz8VoxNx0SUUg+fdVICS1/flZTf8Rh?=
 =?us-ascii?Q?m40fPv4IUsEcKUkXkGDi6LX4Fk3Rg8/hlAb1/xrYliXl5VdcfbJ+1NTkN3JC?=
 =?us-ascii?Q?/O7C46IdfuKWc6j3tgc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 10:26:19.5232
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0657ad91-6386-488b-215b-08de0d679cc1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9533

Add a Documentation/ABI/testing entry describing the AMD PMF util layer
misc device (/dev/amdpmf_interface) and the initial ioctls used to query
feature support and metrics data information. This interface is available
when CONFIG_AMD_PMF_UTIL_SUPPORT=y.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 .../ABI/testing/misc-amdpmf_interface         | 55 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 Documentation/ABI/testing/misc-amdpmf_interface

diff --git a/Documentation/ABI/testing/misc-amdpmf_interface b/Documentation/ABI/testing/misc-amdpmf_interface
new file mode 100644
index 000000000000..c4c7ea68c008
--- /dev/null
+++ b/Documentation/ABI/testing/misc-amdpmf_interface
@@ -0,0 +1,55 @@
+What:           /dev/amdpmf_interface
+Date:           October 2025
+KernelVersion:  6.x
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
+		ENOTTY		unsupported ioctl commands
+		============= =========================================
+
+                User-space tools integrating with AMD PMF to discover capabilities
+                and monitor metrics data.
+
+Notes:
+                - The ABI is currently considered "testing" and subject to change.
+                - Feature version in the response is currently 0x02.
+                - This interface is only present when CONFIG_AMD_PMF_UTIL_SUPPORT=y.
diff --git a/MAINTAINERS b/MAINTAINERS
index 46126ce2f968..590766bbb10e 100644
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

