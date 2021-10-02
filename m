Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC3C9C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  2 Oct 2021 09:33:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AFA2661A81
	for <platform-driver-x86@archiver.kernel.org>; Sat,  2 Oct 2021 09:33:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232742AbhJBJez (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 2 Oct 2021 05:34:55 -0400
Received: from mail-co1nam11on2058.outbound.protection.outlook.com ([40.107.220.58]:12161
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232691AbhJBJez (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 2 Oct 2021 05:34:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GT47vrO7Sbvfirw5psvzehxb9pUzQuPEcBdZEo4rKEjxrPnj+qkP7lbOjyVfrPYGB6VUI3SLDMe5Q8e+QEtm+2RtPBF16wy5xVYIkoaE2qSA2Et1q9RLW6Awh5fmI71xZ0oRVfXPSRAuI8y5O3Hu5kOS9EUM9MMmMiCVhUvZbj35/Ojyp0TUfYIzHI+Ch8f6fvVIoJ9yON5VoiZKMMISLsfsjjpXmNqeO6oIbpb6/nT+LszA1F7+wzbm7MndfbvejG5ODIU5arTXbowEdiB5Zpn9SMPHQHTQHW6/ztrrh3Zzvl7W+/Z1kiiOVMnYwNbPR/WMTNYB4c5cmdyXoo/PXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uk9Cf1NBy9bKVA/0SP3co5tVfRiwrKXHc0wzTKyo/Ps=;
 b=LlSf5yphR9TQZKPo5UfiBlCyyfuVV3f7Vm8OHjDs5HNz5ODU2zHt4kmOcJRk6Pco3N3JBAD6ynDG9zZSF9oxXZ5dCcK5dprPHn209emKvrz2Kv1pCySsTfKM7xOyISyFgWiQmRwonsPiH2HjmmVBng4qFHKpfAh1X5/K2DO73A6hz/xJW5cBwFH2l4hsD1I2UOLoxcq///QjAxL+lnq1Kaj4h/iGAiyBcKBQj9bM/MSCPDidujBmDZzFNra0jRoeYc0DMNoqDiTMueKcnTQyd8D/wXw/Dfv1NMT+z5V4orx1u/RnM+AqIhfFOKMLtVaT16qT1dBe+8m9mE1XknQsdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uk9Cf1NBy9bKVA/0SP3co5tVfRiwrKXHc0wzTKyo/Ps=;
 b=t7Vu2gcme5xtE/YAMQTXSakJ7DcHTH0Wtd+tii9r0pHqTO5FLdy/816Ahgm3XIx1iw7zAq8ClNPK/HDGGSCT+j5C8LnFIDhL28p+ODpzQVxNhE+achIO7jX/1+c0zFXazYg7twMC4I0e0ufsSmgZ6L+IIC+hgk2jV8fIGWpG1qgQ9Vu2UqFLFD5TrWZi5kKuDTJxLh77JHSHkH7w73nOMywnfH2nue//OZydWli/hZn8bPQFDKjv1xRddCOyLYXl9csIedMMub++oWaQPo8f/bE8NPniJRFjas+Lxd0wTeur4WQWFvXXJCVTpN+fwZMORmVEO1P/8mDWRNYyaCl3vw==
Received: from MW4PR04CA0154.namprd04.prod.outlook.com (2603:10b6:303:85::9)
 by SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Sat, 2 Oct
 2021 09:33:07 +0000
Received: from CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::62) by MW4PR04CA0154.outlook.office365.com
 (2603:10b6:303:85::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Sat, 2 Oct 2021 09:33:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT055.mail.protection.outlook.com (10.13.175.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4566.14 via Frontend Transport; Sat, 2 Oct 2021 09:33:06 +0000
Received: from dev-r-vrt-156.mtr.labs.mlnx (172.20.187.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.18; Sat, 2 Oct 2021 09:33:05 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <hdegoede@redhat.com>
CC:     <platform-driver-x86@vger.kernel.org>, <michaelsh@nvidia.com>,
        "Vadim Pasternak" <vadimp@nvidia.com>
Subject: [PATCH platform-next 04/10] platform/x86: mlx-platform: Configure notifier callbacks for modular system
Date:   Sat, 2 Oct 2021 12:32:33 +0300
Message-ID: <20211002093238.3771419-5-vadimp@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211002093238.3771419-1-vadimp@nvidia.com>
References: <20211002093238.3771419-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5107409d-a6ba-42d8-265b-08d98587a42b
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:
X-Microsoft-Antispam-PRVS: <SA0PR12MB4367B616621104CBFCBC81DBAFAC9@SA0PR12MB4367.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kO6u7M6qXdja3ATizuFkdApdmSkYXpEMs9MyPs3ffAPnrrUtkUztLbFIG0QpahF5BVVPyoucwb3Y+ZhhFGM8AiQYCVIlyVFsIHqgz4r7+Lk21p8LVl/iU9SJCv25WWKHBpQ0jukB/WxMH7V7+CsJLPFR6QTGBuvLPl4GfSC6brLo5sletH26p4XsgZq9vIXgt8+rVxpCv5HsPQD06TSSZEgd0vAMeLbVAl2qnMZ4nD65OEO7uAXM9vRYu+612sbq265UTYjxoF5Pow/gtr6fMZDu1U5b1wDqYRVBpH8VPkWiAMbeUvkT+ffVjKQaLpLr6BqWnal4mRVqP/KtSLoIUP2QTALAeB3VtjIkE/vyzdG5sPLHxqMT2gP/B9uZRuHSrEuk1DZXzr7GVo0PR8HEaCwAne+p3d2FIrp3t4RABtlIrowjFvjm48yBTpzZ97jHHfggJL1DYzbZzzowPP9Elkmc6eO1l1keBldDiA6FPqKT2A8bIZcgjJLT4/LFArX7Ahza9KDjuLVo36x0tR4AmTMjl+qbAcIK/+LEeRO48E0GJtd5IfM46TA6+cj63I0eD7fDYAnyhNga+xs1aRCgls1R8yPAVoY4Z4ls4AdvQUBC4cj9b8gZI5g7CtR9fWALvwzIAdXKHCkQtedZV0vVh4feqpxmirb4HQyuEt7HdAlf3eEmzbm4guegLYMwWybJ7ITjG56th4ZjZFpwHn6e0Q==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(508600001)(426003)(2616005)(6916009)(16526019)(1076003)(2906002)(26005)(36860700001)(186003)(107886003)(86362001)(7636003)(336012)(82310400003)(30864003)(70586007)(8936002)(47076005)(8676002)(54906003)(6666004)(356005)(316002)(70206006)(5660300002)(4326008)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2021 09:33:06.9986
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5107409d-a6ba-42d8-265b-08d98587a42b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4367
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add event notifier callbacks for modular system line cards. These
callbacks are to be passed to "mlxreg-hotplug" driver by line card
driver during probing. Then, when any line card related hotplug event
is received (insertion ,power, synch, ready), hotplug driver will
invoke callback for the relevant line card.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 83 +++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index a30af1fc5c75..2ab499686564 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -1171,6 +1171,33 @@ static struct i2c_board_info mlxplat_mlxcpld_lc_i2c_dev[] = {
 	},
 };
 
+static struct mlxreg_core_hotplug_notifier mlxplat_mlxcpld_modular_lc_notifier[] = {
+	{
+		.identity = "lc1",
+	},
+	{
+		.identity = "lc2",
+	},
+	{
+		.identity = "lc3",
+	},
+	{
+		.identity = "lc4",
+	},
+	{
+		.identity = "lc5",
+	},
+	{
+		.identity = "lc6",
+	},
+	{
+		.identity = "lc7",
+	},
+	{
+		.identity = "lc8",
+	},
+};
+
 static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_pr_items_data[] = {
 	{
 		.label = "lc1_present",
@@ -1179,6 +1206,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_pr_items_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[0],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(0),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[0],
 		.slot = 1,
 	},
 	{
@@ -1188,6 +1216,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_pr_items_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[1],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(1),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[1],
 		.slot = 2,
 	},
 	{
@@ -1197,6 +1226,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_pr_items_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[2],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(2),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[2],
 		.slot = 3,
 	},
 	{
@@ -1206,6 +1236,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_pr_items_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[3],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(3),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[3],
 		.slot = 4,
 	},
 	{
@@ -1215,6 +1246,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_pr_items_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[4],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(4),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[4],
 		.slot = 5,
 	},
 	{
@@ -1224,6 +1256,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_pr_items_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[5],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(5),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[5],
 		.slot = 6,
 	},
 	{
@@ -1233,6 +1266,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_pr_items_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[6],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(6),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[6],
 		.slot = 7,
 	},
 	{
@@ -1242,6 +1276,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_pr_items_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[7],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(7),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[7],
 		.slot = 8,
 	},
 };
@@ -1258,6 +1293,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_ver_items_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[0],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(0),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_PLATFORM_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[0],
 		.slot = 1,
 	},
 	{
@@ -1271,6 +1307,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_ver_items_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[1],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(1),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_PLATFORM_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[1],
 		.slot = 2,
 	},
 	{
@@ -1284,6 +1321,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_ver_items_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[2],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(2),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_PLATFORM_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[2],
 		.slot = 3,
 	},
 	{
@@ -1297,6 +1335,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_ver_items_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[3],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(3),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_PLATFORM_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[3],
 		.slot = 4,
 	},
 	{
@@ -1310,6 +1349,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_ver_items_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[4],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(4),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_PLATFORM_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[4],
 		.slot = 5,
 	},
 	{
@@ -1323,6 +1363,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_ver_items_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[5],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(5),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_PLATFORM_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[5],
 		.slot = 6,
 	},
 	{
@@ -1336,6 +1377,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_ver_items_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[6],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(6),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_PLATFORM_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[6],
 		.slot = 7,
 	},
 	{
@@ -1349,6 +1391,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_ver_items_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[7],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(7),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_PLATFORM_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[7],
 		.slot = 8,
 	},
 };
@@ -1361,6 +1404,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_pg_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[0],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(0),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[0],
 		.slot = 1,
 	},
 	{
@@ -1370,6 +1414,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_pg_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[1],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(1),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[1],
 		.slot = 2,
 	},
 	{
@@ -1379,6 +1424,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_pg_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[2],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(2),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[2],
 		.slot = 3,
 	},
 	{
@@ -1388,6 +1434,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_pg_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[3],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(3),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[3],
 		.slot = 4,
 	},
 	{
@@ -1397,6 +1444,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_pg_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[4],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(4),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[4],
 		.slot = 5,
 	},
 	{
@@ -1406,6 +1454,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_pg_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[5],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(5),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[5],
 		.slot = 6,
 	},
 	{
@@ -1415,6 +1464,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_pg_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[6],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(6),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[6],
 		.slot = 7,
 	},
 	{
@@ -1424,6 +1474,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_pg_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[7],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(7),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[7],
 		.slot = 8,
 	},
 };
@@ -1436,6 +1487,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_ready_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[0],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(0),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[0],
 		.slot = 1,
 	},
 	{
@@ -1445,6 +1497,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_ready_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[1],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(1),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[1],
 		.slot = 2,
 	},
 	{
@@ -1454,6 +1507,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_ready_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[2],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(2),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[2],
 		.slot = 3,
 	},
 	{
@@ -1463,6 +1517,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_ready_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[3],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(3),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[3],
 		.slot = 4,
 	},
 	{
@@ -1472,6 +1527,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_ready_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[4],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(4),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[4],
 		.slot = 5,
 	},
 	{
@@ -1481,6 +1537,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_ready_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[5],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(5),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[5],
 		.slot = 6,
 	},
 	{
@@ -1490,6 +1547,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_ready_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[6],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(6),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[6],
 		.slot = 7,
 	},
 	{
@@ -1499,6 +1557,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_ready_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[7],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(7),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[7],
 		.slot = 8,
 	},
 };
@@ -1511,6 +1570,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_synced_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[0],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(0),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[0],
 		.slot = 1,
 	},
 	{
@@ -1520,6 +1580,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_synced_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[1],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(1),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[1],
 		.slot = 2,
 	},
 	{
@@ -1529,6 +1590,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_synced_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[2],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(2),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[2],
 		.slot = 3,
 	},
 	{
@@ -1538,6 +1600,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_synced_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[3],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(3),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[3],
 		.slot = 4,
 	},
 	{
@@ -1547,6 +1610,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_synced_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[4],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(4),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[4],
 		.slot = 5,
 	},
 	{
@@ -1556,6 +1620,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_synced_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[5],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(5),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[5],
 		.slot = 6,
 	},
 	{
@@ -1565,6 +1630,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_synced_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[6],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(6),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[6],
 		.slot = 7,
 	},
 	{
@@ -1574,6 +1640,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_synced_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[7],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(7),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[7],
 		.slot = 8,
 	},
 };
@@ -1586,6 +1653,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_act_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[0],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(0),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[0],
 		.slot = 1,
 	},
 	{
@@ -1595,6 +1663,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_act_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[1],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(1),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[1],
 		.slot = 2,
 	},
 	{
@@ -1604,6 +1673,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_act_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[2],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(2),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[2],
 		.slot = 3,
 	},
 	{
@@ -1613,6 +1683,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_act_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[3],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(3),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[3],
 		.slot = 4,
 	},
 	{
@@ -1622,6 +1693,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_act_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[4],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(4),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[4],
 		.slot = 5,
 	},
 	{
@@ -1631,6 +1703,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_act_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[5],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(5),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[5],
 		.slot = 6,
 	},
 	{
@@ -1640,6 +1713,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_act_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[6],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(6),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[6],
 		.slot = 7,
 	},
 	{
@@ -1649,6 +1723,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_act_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[7],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(7),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[7],
 		.slot = 8,
 	},
 };
@@ -1661,6 +1736,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_sd_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[0],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(0),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[0],
 		.slot = 1,
 	},
 	{
@@ -1670,6 +1746,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_sd_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[1],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(1),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[1],
 		.slot = 2,
 	},
 	{
@@ -1679,6 +1756,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_sd_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[2],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(2),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[2],
 		.slot = 3,
 	},
 	{
@@ -1688,6 +1766,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_sd_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[3],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(3),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[3],
 		.slot = 4,
 	},
 	{
@@ -1697,6 +1776,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_sd_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[4],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(4),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[4],
 		.slot = 5,
 	},
 	{
@@ -1706,6 +1786,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_sd_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[5],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(5),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[5],
 		.slot = 6,
 	},
 	{
@@ -1715,6 +1796,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_sd_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[6],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(6),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[6],
 		.slot = 7,
 	},
 	{
@@ -1724,6 +1806,7 @@ static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_sd_data[] = {
 		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[7],
 		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(7),
 		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.hpdev.notifier = &mlxplat_mlxcpld_modular_lc_notifier[7],
 		.slot = 8,
 	},
 };
-- 
2.20.1

