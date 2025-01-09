Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2049.outbound.protection.outlook.com [40.107.95.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28FD21B90B;
	Thu,  9 Jan 2025 14:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736433589; cv=fail; b=Vvh69Z24hgTGMnb0KRlIRllDuWonEs7C5zjJEUhGcKYXFTs3rjFkGguvT71bDT/xYLuNVCkwrkBqio3n+Srwmis7jdf9rtU1okmbCJWqEsDhw4Jn/lQqv29uEeay9xKmouuPoLOM1EqVKDOfPVDG9/X4KdCexknv5e0SssQ4ne8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736433589; c=relaxed/simple;
	bh=ImaARv76ZkGWG/U5R/n/D81dSCsFTzAF010fXPlAKl0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LvSZuAsSGf9TpQlKBqMKdkfhnuAUYc1Ljy40blv1bRFitdDcdu48NVCXQd7zUJ7esm+LZ9F9f3Fd/bvDJd6+srJybe7D7dLrIQ9H4nMIZtEnIid/Jp86hQJNtkTy+XSizlQ5Evk7f+0oXFzODERXcbVSKdP/TbADsC7CtwFGtDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jMgX4+OA; arc=fail smtp.client-ip=40.107.95.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jMgX4+OA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ey8xrxQPH3RTZ5BLNUquH3A757CO22ul+LKtQWGQvpEOlK5vKr9XesUw0ca+1de6oJ+9KbhLMjzpzpUlqUDDu+gtOYlAdKskNZjAX7/Su0XMqO/xN/xeJrMy/afSZVXH4EdDMy9Tqyc7xkVqqOg7OsxsOVzuJiCtW4dWmEPxL4d9IYFywiCK03VzeqvatS51pxsH2LuOhiZXj73UjSICzMXP00Tx9UkXDiz1PhFW1bV7iD25TGKHcxD0GwcqVjSrnLjPfa/1kTyHQVkL96YE0qTIfDuqF2IOUvQ4mzzX8GV9kb43gbYkhwLWqvDQ8FH/Sz4TEG7gAVgji540cdbfLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujpBhQ4nxY9KRBdA4C5TzUlyMOpPsA/6d34VJTIcuZY=;
 b=e48q1UwHXpD5V+uIdY2MfDWqr1vIMJ8wo+l/znA/1kzEr87BlIq7NXZBh+JvdhwzDn1unVBLrTw+tM96ioD75fSu8kSHaTut7pPoe5Dz1SY8nuvDYxVnBSrI7dMSADy3a5YijR8tEGiBEsSvWy73GAUdkMFDRkUOdk9UwcpsE3Zw4iCokkvtjaoOPMyG9INCRSQnwm6Ri4ixLUqCF8mjxFQIHWY0vbBhQbwCTToLKA1QE2FxlwAEXHFSWfJ7nnAwW2KuETuHz3ITKdc7YVlzItQl0YufS94Ejy4ZfYfG8IkBHrMyXTTpXDf22z1+sFM/JFwG0un5gLgvtsRutdF80g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujpBhQ4nxY9KRBdA4C5TzUlyMOpPsA/6d34VJTIcuZY=;
 b=jMgX4+OA8h/CW0nH0UZoxN8RSTAGXoUXqsfCvYZJuSXgEbKM3ukEGYiYRoyDqbpqgLqgILLM0sKpUWrqantsNPQsMlPu2XWKS/FSnzud5JkhU7tk9NgWJveDgWcsBrmXs6ge1dOv8GKRtQowIJ1TTn1QgOCgYLOhQujoYRYLa9XeSyKrX36eBCRtBhxbdpTRjAQucKHj5SkBVwmOQeOAtuVxMPrP9KJ2OyT4YNdMIZBLFbT0k1nrdSlQxJliO3kNUNPZBo2nXMTd4+AHxyV+wJLB+Fnb9VznsSHIg5RXLRX0MVMPa8MrC2S2AKDOx5KYLX1mvcYW75zDC4J0jrgoig==
Received: from SJ0PR03CA0264.namprd03.prod.outlook.com (2603:10b6:a03:3a0::29)
 by MW6PR12MB8898.namprd12.prod.outlook.com (2603:10b6:303:246::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 14:39:44 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::de) by SJ0PR03CA0264.outlook.office365.com
 (2603:10b6:a03:3a0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.11 via Frontend Transport; Thu,
 9 Jan 2025 14:39:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Thu, 9 Jan 2025 14:39:44 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 9 Jan 2025
 06:39:34 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 9 Jan 2025
 06:39:33 -0800
Received: from vdi.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Thu, 9 Jan
 2025 06:39:32 -0800
From: Shravan Kumar Ramani <shravankr@nvidia.com>
To: Hans de Goede <hdegoede@redhat.com>, Ilpo Jarvinen
	<ilpo.jarvinen@linux.intel.com>, Vadim Pasternak <vadimp@nvidia.com>, "David
 Thompson" <davthompson@nvidia.com>
CC: Shravan Kumar Ramani <shravankr@nvidia.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 1/4] Documentation/ABI: Add document for Mellanox PMC driver
Date: Thu, 9 Jan 2025 09:39:20 -0500
Message-ID: <9a9e69bd99cad3ad8d1847a6e4e10aff80c6df50.1736413033.git.shravankr@nvidia.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <cover.1736413033.git.shravankr@nvidia.com>
References: <cover.1736413033.git.shravankr@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|MW6PR12MB8898:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cef7a26-cb60-4c21-13d5-08dd30bb7592
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RPIoWs4OqG+qo33R38LMIVKZBXL30bP491MueD4BU7AmxpCwJxVwnR9CWCdK?=
 =?us-ascii?Q?7D4/GF3z17wdNXBZc7IrgH+XVIzXh2OOKtynWvrROvPBoBZthRhDdFbaV4l7?=
 =?us-ascii?Q?O4pmP6dHo6XjN1y/JfAOpGTgz2+4MN9nJTkLoFsmOSem56zxkZy+4K2QlTTV?=
 =?us-ascii?Q?xDg8BmtbxXrw5BJrDwhQG50PbnlCPZODbXefismUsKSDM0001NL7zsd2j6Lk?=
 =?us-ascii?Q?rTIFfXbhydWYpbmZ028TAHbFVQBVpupMlQglpq9G5l3n8E6sollwhM9JYQnq?=
 =?us-ascii?Q?kGn21xPUoF0Jp3g6gGMAYOQhVwEKBvjUmxFfLH423ZSfzuSH0mqok72YNMPv?=
 =?us-ascii?Q?aOyJmIE58E5kCtzbjut+vuaSF3CxaXONCNTvYOqr7zAv+v82isCpuP53OK1r?=
 =?us-ascii?Q?5JH3JqAoCLiO12q3PZpXkhamrnQQ1RMO8VRD3YX6lA+RvIYbhctyQTs+1mAJ?=
 =?us-ascii?Q?0q9Y1XcZt3TfUol+IudtP7VXiQueMbTb3tvd7kIh233qAjxtle9MrQj7djVR?=
 =?us-ascii?Q?fV73IvQJqQU8kwjYduw/X+B69qmUByr1POE+e7V79745rs/VT6DAAHbykNPZ?=
 =?us-ascii?Q?3/5n3Xar3jTFjZP66wAYLRX7Uarq/Ly2va9IWno+oy3HyDhZrAuknrI50HwQ?=
 =?us-ascii?Q?VzleyHHa44Ax3SKrBwvnLPJnz3CjEZATPMafezmnhTRf2ouRvVji4L3cfFEg?=
 =?us-ascii?Q?Ag3ew9oa8V4Neq0ZlazyGSfOlfUkBLOZ2XoJgQs2b/6wgUA9voQH5vZnP5Nf?=
 =?us-ascii?Q?FJ1gwRg09Au8xk6iKtCnNqxjxjBL5rXtvkH5qwuRtgBL8tZrwfDm3qLDcAFo?=
 =?us-ascii?Q?X0BYaZAwEFiC5eGUlvyCxejq4fS/ZfYhud7kGHm12nZwUdtWklR2tycBg0PW?=
 =?us-ascii?Q?tE0cB4j1dgmOaJrfSpApStWayB1d0Md54fyOti40DB4S2VDGpc3NqL5ipFIS?=
 =?us-ascii?Q?lE8rdXEr9pN0CzMY+E0wY4M5D8ap34v08K6wmUheNJGWUKBdG8/sAYRFvMSv?=
 =?us-ascii?Q?5nCNh8I6B7B/QGKzfM5k5X8KpioKPijV4WnX3rhEl9hKGF9gHf8zuKjWr+mv?=
 =?us-ascii?Q?qVc9KWhkgfamszMRrNeDdPPvFj3NII0XWdyPUAXKZUcvbmee+RsjTriL/Xhq?=
 =?us-ascii?Q?gAIvRlxm7t+QxBBOAQLD5G81pMTQav+EbpBZe+TrIY8DjZYwf9Qcbx8KvA0z?=
 =?us-ascii?Q?cvptDTlS3EBelrik8tEFEHqDa1HvEdn2b/Gb1wkUVb/sMlGGLn7PZ/++YeAt?=
 =?us-ascii?Q?CNmPbPR1Lk4qmPpfKZrxoX1puhqjkvV1OFj508QITRNOMlyIpzTB0Alr9BS9?=
 =?us-ascii?Q?m44nFA+gm+OaaQvq12hVaA2LjXFpVdDv6um73nWHwXRkoTIN5UJtbYnjuEYb?=
 =?us-ascii?Q?Jig4Roeq2zyxWldZRMDry5uuewmd+LvstZL2pDaHe85sLFlp+bmRz9DKvFsx?=
 =?us-ascii?Q?ppok/6fcba3c+ve4Ol6aACHMHXHn8xruFcggZXExtOhMw9YJAh9rAHDhym1V?=
 =?us-ascii?Q?2SnmRg5tm6+BpjI=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 14:39:44.5534
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cef7a26-cb60-4c21-13d5-08dd30bb7592
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8898

Document the sysfs interface for programming and monitoring the
performance counters in various HW blocks of Mellanox BlueField-1,
BlueField-2 and BlueField-3.

Signed-off-by: Shravan Kumar Ramani <shravankr@nvidia.com>
Reviewed-by: David Thompson <davthompson@nvidia.com>
---
 .../ABI/testing/sysfs-platform-mellanox-pmc   | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-mellanox-pmc

diff --git a/Documentation/ABI/testing/sysfs-platform-mellanox-pmc b/Documentation/ABI/testing/sysfs-platform-mellanox-pmc
new file mode 100644
index 000000000000..9f987c6410da
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-platform-mellanox-pmc
@@ -0,0 +1,54 @@
+HID           Driver         Description
+MLNXBFD0      mlxbf-pmc      Performance counters (BlueField-1)
+MLNXBFD1      mlxbf-pmc      Performance counters (BlueField-2)
+MLNXBFD2      mlxbf-pmc      Performance counters (BlueField-3)
+
+What:		/sys/bus/platform/devices/<HID>/hwmon/hwmonX/<block>/event_list
+Date:		Dec 2020
+KernelVersion:	5.10
+Contact:	"Shravan Kumar Ramani <shravankr@nvidia.com>"
+Description:
+		List of events supported by the counters in the specific block.
+		It is used to extract the event number or ID associated with
+		each event.
+
+What:		/sys/bus/platform/devices/<HID>/hwmon/hwmonX/<block>/event<N>
+Date:		Dec 2020
+KernelVersion:	5.10
+Contact:	"Shravan Kumar Ramani <shravankr@nvidia.com>"
+Description:
+		Event monitored by corresponding counter. This is used to
+		program or read back the event that should be or is currently
+		being monitored by counter<N>.
+
+What:		/sys/bus/platform/devices/<HID>/hwmon/hwmonX/<block>/counter<N>
+Date:		Dec 2020
+KernelVersion:	5.10
+Contact:	"Shravan Kumar Ramani <shravankr@nvidia.com>"
+Description:
+		Counter value of the event being monitored. This is used to
+		read the counter value of the event which was programmed using
+		event<N>. This is also used to clear or reset the counter value
+		by writing 0 to the counter sysfs.
+
+What:		/sys/bus/platform/devices/<HID>/hwmon/hwmonX/<block>/enable
+Date:		Dec 2020
+KernelVersion:	5.10
+Contact:	"Shravan Kumar Ramani <shravankr@nvidia.com>"
+Description:
+		Start or stop counters. This is used to start the counters
+		for monitoring the programmed events and also to stop the
+		counters after the desired duration. Writing value 1 will
+		start all the counters in the block, and writing 0 will
+		stop all the counters together.
+
+What:		/sys/bus/platform/devices/<HID>/hwmon/hwmonX/<block>/<reg>
+Date:		Dec 2020
+KernelVersion:	5.10
+Contact:	"Shravan Kumar Ramani <shravankr@nvidia.com>"
+Description:
+		Value of register. This is used to read or reset the registers
+		where various performance statistics are counted for each block.
+		Writing 0 to the sysfs will clear the counter, writing any other
+		value is not allowed.
+
-- 
2.43.2

