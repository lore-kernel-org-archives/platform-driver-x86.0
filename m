Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4250156960
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Oct 2024 07:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730099109; cv=fail; b=e/1z1n4iAtUGGJ9wbdooiLi/eaBNyPe+CisdqsHharw3YGPOSTDj3BYqHwExvOiwHJsZTdC4QIHv82j0ct7pZYTXQhEAXhL9LzOAvwbdQHyBv+36OUOW0gsIwPP9204tycdwDX3oS1sjyZN02KyquNPWZ2rDmKOyQCN+t/Z4ihg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730099109; c=relaxed/simple;
	bh=g/zJhyvAEPiPj576xwkemWyTauYMoXIB+VhV5az0gcE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KHhogo2wKKJZY2QSJtdFoAkAcJe1NE9joyQMyM8p55w500eEulRZij7adrDc5RfdFqAY++D0aRv+QTQZUN5V8mtfXueyE3ZMD8sOIkuYW5VQ7lfnCtKRRTiqqDnt4lp1cJX07B0tmr/vtqpWNqru/P+BvZuK3Ivde2Ck1EG7r+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WPDBvd2i; arc=fail smtp.client-ip=40.107.94.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WPDBvd2i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LHGq1ivbS+qaJLtOqBNsTMj3HSGIitM1jp4nTWIf68c27Yp+qg7qeDTo2moehIMmPD2Saeu5v5NQUek+YaJ8FVFuf/Em+ecWYY7I5U8VwobBnVjFHLNBtT7ZygtW6bQtmCJhM6CSygwgZS9vCi55XE5zEVxrIe16rNn3DO0e9qULNf8iA1IrVzk/wZzL3X14EaeP/tJw8yVQ7KOwqta3G3EvIrPDyPbxDBMDaTpTNM+x2V7H9vRthOVU9ptYLp/90HLYjqYO6sVdanAYnwp+yZ4SKuWqHChZWu/H3Iqy7ZbW7rafs58sY3wcf1rmpEcvxdZ6CSgJMnMD83AajZIngQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0GQrbrsQIQe0fAe1ZBzs6ZjF0VK7WNVltKo9tY0/jOg=;
 b=RXczbE2M7G63+ikEkjZon2JSSAOyVsAZjA7gXWWVrfITN4YyoZ3GxynN6Y3i8TGfUPACl0MMENLNarxbduaDCyYmGO/ls3nY8c3oCibzSnQvxNHmRrdC+EFkFq+5oEuOAz6dUb3UVUN8d/oRHdMny+tontoAkJnlnRigxOp3trdR1IEj5BtkmMu/62EU5IYZpaspKwWOhK35vTVADqS0cmCsMjM7zjj4vBmgkQnMvHvXxK+h1mhQ9T3+mPlYDu6mpz6TQdBX34suBU+ri9Ct1YXys36VJ6aSFvO2wgrhnMHyuemK9e0hkLIDQORnGM3ViZlk+v44aqzzS9h95xFO8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GQrbrsQIQe0fAe1ZBzs6ZjF0VK7WNVltKo9tY0/jOg=;
 b=WPDBvd2iLKyh9OmFFkySqgGtQn2/KzCjV3WAVIKJqZc/LxiR+RBpIubNj3icsxuhUobEISuilSm9Bt+9lTejswCPgP1FE2iJiPnb16JpU5vCcPNEr7d6uOHEJ5zEj8ektx4ebRkB5QM3yxmU7rxDB8lGAMYn9DJTHP0uBxuq64w=
Received: from BYAPR01CA0021.prod.exchangelabs.com (2603:10b6:a02:80::34) by
 CY8PR12MB8267.namprd12.prod.outlook.com (2603:10b6:930:7c::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.25; Mon, 28 Oct 2024 07:05:03 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:a02:80:cafe::6f) by BYAPR01CA0021.outlook.office365.com
 (2603:10b6:a02:80::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20 via Frontend
 Transport; Mon, 28 Oct 2024 07:05:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Mon, 28 Oct 2024 07:05:03 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Oct
 2024 02:05:00 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 0/8] platform/x86/amd/pmc: Updates to AMD PMC driver
Date: Mon, 28 Oct 2024 12:34:30 +0530
Message-ID: <20241028070438.1548737-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|CY8PR12MB8267:EE_
X-MS-Office365-Filtering-Correlation-Id: b583f312-524b-45ef-068d-08dcf71ed8a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UnU6m8BefL4nCD3F1iIjK+fLATjiYKdEkUPx+sUWA4ItNqmZS7TDoUlVfsUi?=
 =?us-ascii?Q?IPk861WYB5M7Wgd4K+HFikzh67NUjA6XqI49qGZ4edkAObspThU9EUPf4KSh?=
 =?us-ascii?Q?gs7mf6H+ItmCo+IVuXgy7ec+Er8974kBueYklnOHcKgcSGCQeDwjxom8+0ob?=
 =?us-ascii?Q?lXa3FrJqp3BwOpoF9cu2UqWDDvTErle1yse91YIPL66V6aFo5Bqg73foPk/E?=
 =?us-ascii?Q?fD8/iTuwJgQO+7bEfQcX4210NpH28wANSe9ambr0R2d3myGaALXu3Z+aCsMy?=
 =?us-ascii?Q?d9wuAk/1ytVfczOl03I63DBheDy3+CQwxLl+Ulqkl/mO5MHymuZkJvJkVndE?=
 =?us-ascii?Q?2EIHQ67po//H4XoZM7F1l1nGk+KcO0CB4MpTBylCOdVQG2/J5kFcTrOLvVwt?=
 =?us-ascii?Q?i2XDuU2xRr4azwTnNlq2kfzf0qEKP1qB1YDvbmdovZVRyyvWSdeO9o6MODzM?=
 =?us-ascii?Q?BKr0Ea54glyxrnby5QJ4pQyqDniZeFZCPEZ4Plnn8htpMXXsaKJ6p/ITqfxF?=
 =?us-ascii?Q?L4ygEP5WJCpXldYj6s/oUAErIgmhU4B3Vl0aWDq2LuBRf0OTp+KIYMXGEEFu?=
 =?us-ascii?Q?xSs/+4xQadw10H8oKF1czAK6ctzmrfPd0Zs6CdlXN6HmJzBuButGrbTbRe8U?=
 =?us-ascii?Q?d+BD3VmUKBsD4/J2dmfszR0+GufDlLIIbyGG6mAEPpwIA7WsWwzWVeWnm44k?=
 =?us-ascii?Q?xIFdt3Mi9HVw/h0EEdtrZOwxGEGXV1ICvK185O1MLA+j2GWnCOukGURHqIRQ?=
 =?us-ascii?Q?L9MstqjTLA1zXupTl9tKtt8SuKGJxYIb0njMTjiyGtmWHjU7BdfxiC3Vy4dE?=
 =?us-ascii?Q?UHf3poikz9eqwWVSNpXRgBGzljAcrN24pvnff44qcLGwousw30J8opplig+a?=
 =?us-ascii?Q?X8i/AU51sTqCT1SEIT4cQbtd1nXPGWaYB2C39bth9Ohe9uvd3sxxIJkAdZCF?=
 =?us-ascii?Q?zA7t3uz8ksf75yj0odr7qqnWKjwwO/2Q11JnQCs1cts6IyLHlNT1d35xgORj?=
 =?us-ascii?Q?exBC+29XCDv7KoSDmD/BgRtGYGDYXA65JXHZ1F8tSQ2HSiAtXVO6r7KbUhnQ?=
 =?us-ascii?Q?rJb2n2Mbus/bLk3oC4fI9c9D1K4kXUD5wYOCO1YRFS0gw2b67qS0+hU5vYVT?=
 =?us-ascii?Q?xAOJZ2nZa8QK91EPNIjPMvfID1r3OopTcqaC+gu5smHkycEHqA7S+ATbXa4U?=
 =?us-ascii?Q?xrxevrhhD8mdQy5GmC89XBwP2i9ITfiq+YOyhvqompEW0/fxbGL8Io2ULKxV?=
 =?us-ascii?Q?YWxF8zVWM+GxkfZ6HvYgLnRL/GgVn8tPW0F+v3ddqtyXC+9t2Do1jIvOp1k2?=
 =?us-ascii?Q?vok662Jj69FvDWNQ5twFYEJOHRNQMsApXVCbBsP0/AbcVG4I7S8oswiy5lvQ?=
 =?us-ascii?Q?vIYNIoD/cdY5hXRixq50UDIrFzwbqqfh/6XYvV/q/+ivEM7xeQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 07:05:03.3782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b583f312-524b-45ef-068d-08dcf71ed8a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8267

Updates include:
- Rework STB code and move into a separate file
- Update the code with new IP block information for newer SoCs
- Add STB support for new generation
- Add STB support for Ryzen desktop variants
- Updates to MAINTAINERS record.

Shyam Sundar S K (8):
  platform/x86/amd/pmc: Move STB functionality to a new file for better
    code organization
  platform/x86/amd/pmc: Update function names to align with new STB file
  platform/x86/amd/pmc: Define enum for S2D/PMC msg_port
  platform/x86/amd/pmc: Isolate STB code changes to a new file
  platform/x86/amd/pmc: Update IP information structure for newer SoCs
  platform/x86/amd/pmc: Update S2D message id for 1Ah Family 70h model
  platform/x86/amd/pmc: Add STB support for AMD Desktop variants
  MAINTAINERS: Change AMD PMF driver status to "Supported"

 MAINTAINERS                            |   2 +-
 drivers/platform/x86/amd/pmc/Makefile  |   2 +-
 drivers/platform/x86/amd/pmc/mp1_stb.c | 325 +++++++++++++++++++++++
 drivers/platform/x86/amd/pmc/pmc.c     | 349 ++++---------------------
 drivers/platform/x86/amd/pmc/pmc.h     |  13 +-
 5 files changed, 393 insertions(+), 298 deletions(-)
 create mode 100644 drivers/platform/x86/amd/pmc/mp1_stb.c

-- 
2.34.1

