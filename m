Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012031.outbound.protection.outlook.com [40.107.209.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2733B8D7B;
	Sat, 17 Oct 2026 16:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792255939; cv=fail; b=Y+qGl48MwtSYXgGxXGPYZhIYlEFTn1Krp0YZqpIFp928W4TsDMA7+VO+FY5Fygx8dbQAJaKqHQlVhi6B8ZEVeJ1CyCrCjTe7MJRqhY/qkD8z3RNY3M7zMkGSMw25yhH0bImUDM5UnVJYqhAVMPrVyOcZfYJlarLC2Y9cR5wyRNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792255939; c=relaxed/simple;
	bh=bshTh/tRffGJWiiW83qDUPCparX+1HHBue/Y+d7njzA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D0bKmG3089xO/dsZyVhuzMdv9QPJK4ugV9UowKu5D4Vio8frBqaKG4XxQw+w5skH9WIx5eqHlqKEGOhPbawj0aQmJwJxpNI7+Bq3a6xC4ZEIyevsg84xSUTrECpeZd8Q8WqTTd78dqNXuZBqOImRtnTkY13k+JISk5LhjuX2OIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mqNpL5d5; arc=fail smtp.client-ip=40.107.209.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mqNpL5d5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EM5GtgDjteSdSb4oj12Mscg832n2PvsGkoRFbREjsDFmxnBFWGlJpe70psuDxhtgJw88OS+Q/54JDgrjW5BFnI55Fa/3eIUJ/wOWSrySU7aOCezz3qk8sEEPoVjFv9A1kSvy5oiohXEw0pu3/dcOpk20HUM2cp46MsfzAiVePAnoHIqjOgMk6x4MWqO6DI0DVfovBNu+rZ/0hdXFkkNb9p00DpnZ4kRM8Vf4x7jYIMqfD4FHqPwXcmxEwKkn401MnCCIlPPCO3Kk9+SVhk72dz5YMq2mL50Q95IYAVWZKViLLEtlYchQpvEDTAWnF1zS6R+doaXzMR2qku3fl7olCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1uRQDqnt94oJkCaBATAWHohQZHL8K1tf7CreLe3/Xw=;
 b=HREKRwPKqBowXapBqsDt/vtG2E1hAAeeVYfhnu+PVah7GO/AwloN7San+gN7KWX7axSOL7FJ7eacaEccFM0iYnJ419cxlF1esvW5/sYaTdJimQENyNnVsx1bjtcSeik+Suni/RyjLAdk+UAPYao1gh0yEhqU+Koz3AYtyTVQVaQ+/18onWKAlkxbZX3ffjplxJrqkDdbEIzXsYFK0kk5dpnH44PgFz/DusNxmzSDxv+/O093Nv854j/kd0M2RYfRgkd9CNA5Lsy7KMOUmkVfGnfAs3kbGsbMNga37pdJd144uyBYNMT+eymOGLfEZkKWz4eHGjsnNuqTqgqlSbCrTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1uRQDqnt94oJkCaBATAWHohQZHL8K1tf7CreLe3/Xw=;
 b=mqNpL5d58QfqAW2PZMnLAeslauKmaE+GWEEGrbrT26TtzTYJx7wO0RBnfWhMue+Q7AyP7wghCFIlCLouaiqzLPq5fkQ0+JvhGoQXLgEjH+o/2bzVtXifQRFlmvQ+EOscbkHRBCm0QDVQXMu6F2uUD2L4hurt9PVeWlObSxusTpA=
Received: from MW4PR03CA0242.namprd03.prod.outlook.com (2603:10b6:303:b4::7)
 by CH3PR12MB9729.namprd12.prod.outlook.com (2603:10b6:610:253::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Sat, 17 Oct
 2026 16:52:13 +0000
Received: from MWH0EPF000C6188.namprd02.prod.outlook.com
 (2603:10b6:303:b4:cafe::47) by MW4PR03CA0242.outlook.office365.com
 (2603:10b6:303:b4::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Sat, 17
 Oct 2026 16:52:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6188.mail.protection.outlook.com (10.167.249.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sat, 17 Oct 2026 16:52:12 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 17 Oct
 2026 11:52:03 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Sashiko
	<sashiko-reviews@lists.linux.dev>
Subject: [PATCH 1/2] platform/x86/amd/hsmp: Validate num_args before the fd-mode gate in hsmp_ioctl_msg()
Date: Sat, 17 Oct 2026 22:21:52 +0530
Message-ID: <20261017165153.3748458-2-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261017165153.3748458-1-muralidhara.mk@amd.com>
References: <20261017165153.3748458-1-muralidhara.mk@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6188:EE_|CH3PR12MB9729:EE_
X-MS-Office365-Filtering-Correlation-Id: da1b346d-fcb3-4461-8016-08df2c6efdf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|23010399003|36860700016|11063799006|261009223027099003|56012099006|22082099003|18002099003|10067099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	c4H1ewQuQVi8GTZY3S+ncAS3CsrMaUjAwTqprwKASU9amKB1qeButYEHZ3shY7yXoMbUhDPu90vkjBLCGczN7Ka6Focnr8kjzIktP8/eUMt5koiAivdnAgYIFjygG/Sx19aBbl1VKCQyp3yClLg8TP6J95dReNq+mY1ZyP1yZ7kNo6/OjmNgbmo3hS8F7x9+mCKUXcJ0XZ2W0o+4ZXHA8HlUB0yc/+804mZ8WWcr11wg+w+wP342C/Ary5Wz6SKJbkwum6sFNFxOuxgCoCkzTfTkBzOp3QwmCyeXA/awPGIQEXsNX2NcdAZReUGz6ZDzqiFmTcDmtMKNMfJaGH50svxCeoV5C3s4TZZKloGltsjdCfxo3cI79lN8gqLa4rKjCDhLlj6mxZC1yUOxgaUNDUO01zd29y7tD3Fi9qnhA6mb7yv4Tu/G52wQSjZC1y0pWdDqw1kbtm/5apsvZ1GkTo//AL4ZeB0Llue58MIr5IPZkdKm13bRlHPhCHUFMU3ih4xHwmNX0mAgeiLZnUxP5lVqwxZfBZfGRak33fQFHJBsLEoux5H/7bcegwdbi6sbLF5ckJLu8PT9Bvcl/YDtkKIVXqIbx5SKidzW7yrEsLUS2uQhSDZ3+E3GkW3DuSleDBEtqaogk6Lk6JLIIbLl9g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(23010399003)(36860700016)(11063799006)(261009223027099003)(56012099006)(22082099003)(18002099003)(10067099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Y23J3jz+JEBwvMyD7ThhWR5JnfmiHdMBKM/l7Tv+ivLg1XlAEU8MUM+cRxILx0tPJbNZTRCyEd70hPUkHejUhaaHEUOTtSX7pTs++1Jx3Qa6dbYWYwUjyp3QEQbuSJ2zJtJPGdJ4Dc2CtK16Mp1VtFnQIQtEOK43hnBf4R6isdh4yaJUsi6hfVs+qh74znWn2V6HKcUmUrsJQi5NR/uZEeEEkLfjHco73eAfoYOace02ekZ+7Bxi2c8zR7jxmQbVfkO7HjWKaJqqrQf8cjQizTVh7JFd9aXV/nhJomSFTI+WiGmiLdZi6yxPV4Do0OUpEjv4hK38fKTm3+SPtMaILQot+Odh8STY8SnS4vzzalaoQQLEBcUF0kli5plxGqaSOpkyxOpuEKDThV3moXQVqqT8OdBRC75oqYaLVJMW/klXovz+803ToLCP5y2FG2uB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 16:52:12.7297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da1b346d-fcb3-4461-8016-08df2c6efdf2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6188.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9729

is_get_msg() reads msg.args[0]'s CHECK_GET_BIT to tell GET and SET apart
for HSMP_SET_GET messages, but hsmp_ioctl_msg() calls it before
validate_message() (reached later through hsmp_send_message()) checks
that msg.num_args matches desc->num_args. A request with num_args = 0
for such a message reaches is_get_msg() anyway, so args[0] is read even
though the request does not carry it.

Check msg.num_args against desc->num_args before the fd-mode switch, so
a num_args mismatch is rejected with -EINVAL before is_get_msg() reads
args[0], rather than surfacing as -EPERM from the fd-mode gate.

Reported-by: Sashiko <sashiko-reviews@lists.linux.dev>
Link: https://sashiko.dev/#/patchset/20261012085407.1202295-1-muralidhara.mk@amd.com
Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/hsmp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 45d20beda946..635e6d5723ac 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -485,6 +485,16 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
 		if (!desc)
 			return -ENOMSG;
 
+		/*
+		 * is_get_msg() below reads msg.args[0] for HSMP_SET_GET
+		 * messages. Reject a num_args mismatch here first, so a
+		 * malformed request fails with -EINVAL instead of letting
+		 * the fd-mode gate read an argument slot the request does
+		 * not actually carry.
+		 */
+		if (msg.num_args != desc->num_args)
+			return -EINVAL;
+
 		switch (fp->f_mode & (FMODE_WRITE | FMODE_READ)) {
 		case FMODE_WRITE:
 			/*
-- 
2.34.1

