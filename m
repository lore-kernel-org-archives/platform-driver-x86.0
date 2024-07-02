Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179EE14883E
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jul 2024 08:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719907629; cv=fail; b=qp0oq5+K+HAMlHDz01+gCUL3ZPyCwILH64zuj3OT89FPkHpqGEdjFJj3pC88okkY7gjr3xgRBEIg1Z/5Dn+8mp3GRvjAafbg3G7Ng824c20G0d2nFSSvFVlclxN8CV0GecKMpa8QoJjXN+uI8g2lew9liju9JmrF24ZznJ+Fdeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719907629; c=relaxed/simple;
	bh=wTFqX7+rT8LpM0aCzutROl4em+duSeU+LGsgaiN0KWU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CaLl4isjTOUdwhNL9HvUoyIXf1N+Q1b0d4wKNuUksKhBAI96RQH33t/0u7Cub+0nbZ6P8g34+KiSGmVVPOyTNUuRAy7rExz2wTyaqaZO/wu+HVi0zjS8XT4l9vIjxWPaAkaU73oS06npLshYYRPxWaT+DcZaTPudnPtpybv1wu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=g5Tt4Tn/; arc=fail smtp.client-ip=40.107.243.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="g5Tt4Tn/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dhPguPskz064ddBcwPINfl7kQf2cQCE2qGTQExZBI4i6TZPkvE5CGemoN9GGLslkrh2TXzHKYKZxs8zKJ+oiQHPJ1/u5sDgFd1GOBsn/ZjgCu4zkfq+emhUeyd8hvU1QTQCI1QvBCMV4c11TIa9/GMCTb5z1Af2uvUEjCq62Ubyc5xroOe66BtmELWV/WMZI1qr0psDpZ93lyAOUaPaZwFH0upOuvFb0P+cGnKabIBJzWNnQcYoe/4jA+SHPlRNoWcP2cGBLQy15VQGOjXsdenA92Cfvd+b7H38g5i7w0An+J4tpZMNnKYiZlSnx5atyqJYg3MiyyQNQrQX+ij/iJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FymmmJnoMkKbIT6A8sZX2hRQAo17GLX3Kzk+vf4cj7c=;
 b=G69PhM+FYeMJ7mOTiZTUdP+sW2aw/82cmXeMKyvsw4ohlWbINQLTmQE3sxbvXFPSEIW6ctMZ/wKiUQilJU11f+A5L+Qdov4Fd9agw1vXkzGuNxk7Y92XbEN+TtMh3MKTym068u+srjIExpPlfo2NCm6tZBa45VuxtOABWZx2vtlgc/k/BoqZtuk9O8N//0TkooywhdJULDvoL8KSF1AeoOjUUIa0wt77BdzuzRofu6I9UvXtOVKL7kHIxmtJevtM61IVGfF9MDOgACIPVgyfsrv6ThZQyy/HbZi5YAEhYyNBkl2FCsrLpSazP0QjE9w3MLC+EtlGNuWeyd0+Ljk21Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FymmmJnoMkKbIT6A8sZX2hRQAo17GLX3Kzk+vf4cj7c=;
 b=g5Tt4Tn/4pHbyrMFOknUTslRvVBrfGU1Nd5nshI7Gyrz9GJaw10CzbDBTYNSMBRxk6rQxCzxEHENK0fSmwRjeI8duYBWav4/PSj2vZdUXJYytHmo2IoclvCWDVHxKlL0zve28go+KS/NciF4r3aPC44NYTqDKzNxDUAtAho00ZU=
Received: from SN1PR12CA0108.namprd12.prod.outlook.com (2603:10b6:802:21::43)
 by DS7PR12MB6214.namprd12.prod.outlook.com (2603:10b6:8:96::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Tue, 2 Jul
 2024 08:07:03 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:802:21:cafe::47) by SN1PR12CA0108.outlook.office365.com
 (2603:10b6:802:21::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33 via Frontend
 Transport; Tue, 2 Jul 2024 08:07:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7741.18 via Frontend Transport; Tue, 2 Jul 2024 08:07:03 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Jul
 2024 03:07:00 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <Patil.Reddy@amd.com>,
	<mario.limonciello@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v1 2/2] platform/x86/amd/pmf: Remove update system state document
Date: Tue, 2 Jul 2024 13:36:26 +0530
Message-ID: <20240702080626.2902171-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240702080626.2902171-1-Shyam-sundar.S-k@amd.com>
References: <20240702080626.2902171-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|DS7PR12MB6214:EE_
X-MS-Office365-Filtering-Correlation-Id: dbbc341c-634e-490c-1164-08dc9a6df534
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9NeME+ON791ArJZ8413E77Z6u5VMpPPprGFiewvcBifpHaxepy/3qCZ/xCt6?=
 =?us-ascii?Q?PvfiLLgtqTuPKT+123obFbESNSs3OMT4gSOcM8HwOCLxY/04qBaUgiDWauya?=
 =?us-ascii?Q?2d+olWJKZ6KHoKAUQjb5zPZ9IElbAmo7DHStJz/TRnFwSWCOnXz/AXkISEWy?=
 =?us-ascii?Q?KJJk9jsTR0+sI+smMsje20ZFTQ8bXDETKHSntQcu8d4PAcmERStMoY7mtt6O?=
 =?us-ascii?Q?0mrzY+qZ+YSAlpeTwKuSkk/iCaP6YZJztCB1oIrH4WyvZTEaEuaw+3ABvw9Y?=
 =?us-ascii?Q?5KaZTGZyJcRCBr+Jq2uFI2TCsMF1PV8KDrGZ6REvFGve/jfGDJ5WvPbcbSLd?=
 =?us-ascii?Q?R28KnP9swZYvp9+WKXpvDbvd7lIDDuodfzBSDUn1tdCPK4dktavWF10vUL3R?=
 =?us-ascii?Q?zRx11VohPIQVE2YdQjEXkqrNX6NF4YjX+FkaZLmBbt1uR42baHMA1+C8nMz4?=
 =?us-ascii?Q?bX/h6eXHgQROY7acnSMHhTTw1pDYpN8GpM5MQqif50AJE+WfT4ZnYYRwU7jf?=
 =?us-ascii?Q?yMNA7qeSeaDqKqQdBVoBF7TLtsEoCDVl7Ag2rvhx8ju3IdJZbgSnVSdbyCeK?=
 =?us-ascii?Q?m+nfO5+ciQGxHcIB1qPQHzSN3923mrqXpuzHWEEIZ04f4OyIvMM5MIQ9h7P6?=
 =?us-ascii?Q?n2OdTw5eG6HN3IZoHQS19StWl7FXdpzJDQo9E/7pue3yI3KDfswV0DA0tqT+?=
 =?us-ascii?Q?T19qd9kEnuF3ckIcFyERzSw8d9LwC48ZOUdKFZS8MN6EKRmv+QaqmeNf09lw?=
 =?us-ascii?Q?ZHNJIldLS9xzv8IxlPmAytdeLmOKagMI7xs8tN4KQ1fecmf5Kais6/SwCtTo?=
 =?us-ascii?Q?PsuGhKKNjDSrbk6FTD3MrjXY2GjFuH9ctwF2Emxp8qpppdr3x3SAjm+y2XtC?=
 =?us-ascii?Q?W67fXOQ31fdv7kZgcqVrkmNDQXvTqY9dRpxxYx2MGSB5/dPwaJLYBA54B63Y?=
 =?us-ascii?Q?RRggTOmPpp0t6ReBhea51AVWHDnFt7H+i1py6UeZaB/7jer1wRVVHGwg4xWV?=
 =?us-ascii?Q?mA2ZkGIrGu8Q7mtvMsWAZTfFGrYOfmbQY3LyMQ3yaY2ZR+ZTeoIkyUxTRve3?=
 =?us-ascii?Q?DgOpas+zf6mkfzquy7zZM0JzXrP6c0TfcImjJ/2yITBjElEBSjN7YVLjWRbx?=
 =?us-ascii?Q?7mMomWr9XmgTfsSBCA9UNo1hVyt59lPNFIZVTGx7t6s9l1GmaNiNCjBV5yn8?=
 =?us-ascii?Q?9c0Ybk97vEjhgzr8V3zohwoRcQe5R/mjUTdyUTGakkE8uIJvVtcEAjNo/X3f?=
 =?us-ascii?Q?255JPdyqfnxkdp2qWGJaR3LN4I9jRI4k3NjwsWdqNr7QAu+Cm9wYAQ5cgGj2?=
 =?us-ascii?Q?m3/dMRYYyiz9tJy9i5xdWwrqsN8I9VwEFS3shEvgaS1FGGTlgzRbyNIK7B9m?=
 =?us-ascii?Q?ZoIGwIVwkOrUUROKcTe5gNSGutJGNceJKV/3OHXUx4NvSlmie59tBhBiLyqE?=
 =?us-ascii?Q?qoTXvCxg781wnhhS4QZijsRmDje/cyDG?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 08:07:03.4773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbbc341c-634e-490c-1164-08dc9a6df534
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6214

This commit removes the "pmf.rst" document, which was associated with
the PMF driver that enabled system state updates based on TA output
actions.

The driver now uses existing input events (KEY_SCREENLOCK, KEY_SLEEP,
and KEY_SUSPEND) instead of defining new udev rules in the
"/etc/udev/rules.d/" directory. Consequently, the pmf.rst document is no
longer necessary. Therefore, the pmf.rst documentation is being removed.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 Documentation/admin-guide/pmf.rst | 24 ------------------------
 1 file changed, 24 deletions(-)
 delete mode 100644 Documentation/admin-guide/pmf.rst

diff --git a/Documentation/admin-guide/pmf.rst b/Documentation/admin-guide/pmf.rst
deleted file mode 100644
index 9ee729ffc19b..000000000000
--- a/Documentation/admin-guide/pmf.rst
+++ /dev/null
@@ -1,24 +0,0 @@
-.. SPDX-License-Identifier: GPL-2.0
-
-Set udev rules for PMF Smart PC Builder
----------------------------------------
-
-AMD PMF(Platform Management Framework) Smart PC Solution builder has to set the system states
-like S0i3, Screen lock, hibernate etc, based on the output actions provided by the PMF
-TA (Trusted Application).
-
-In order for this to work the PMF driver generates a uevent for userspace to react to. Below are
-sample udev rules that can facilitate this experience when a machine has PMF Smart PC solution builder
-enabled.
-
-Please add the following line(s) to
-``/etc/udev/rules.d/99-local.rules``::
-
-        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="0", RUN+="/usr/bin/systemctl suspend"
-        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="1", RUN+="/usr/bin/systemctl hibernate"
-        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="2", RUN+="/bin/loginctl lock-sessions"
-
-EVENT_ID values:
-0= Put the system to S0i3/S2Idle
-1= Put the system to hibernate
-2= Lock the screen
-- 
2.25.1

