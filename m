Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AC01E2619
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Nov 2024 17:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730828287; cv=fail; b=E5Dc+LFl7bHBi1qpx235Zqp/9rPbmzLvD96qBBwYJ0KqfBlcLgpQOPnTr7U29DupGiFWZeF4hZ+Sm/OrXNwfD4N0SzObZ81R1wa4dlJEz94G53sCvTCD3DQGBPUqxbpokbFtXBBAbs4H+okTXGJD/Ufcnrwrgc3HHyxIMlYLk6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730828287; c=relaxed/simple;
	bh=f/xg+NNHqUWO1GdugOvYBz8iXqVxmY/M5uhSj1c60kE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n12CmB8+M++3cFG/Pf4VIhuKs2tmj3MN/3t+DngsorPttiZ3wqsx2iWcxOb6QtpOaKogdIPXpKeilhHM+q1nDj599ce2R5AE9ErHd8l1N/P2VbS4X3GpGuaI14yuEmccKzpgC4i90Ir7bzb0MX0U2SWtyQe1BBrAmOTPbsJ/lH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RQPuR5m6; arc=fail smtp.client-ip=40.107.223.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RQPuR5m6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FQcXHEZFBCOOAxgtpB9vniNEVCK+nyq6sJOZ9WeMQPwH+DtcCGR/eggcX3EDIm4g+KxsFvuLdVD8mAvQIyubcYlBPlpcea2aIG1OsNdoF/kSruYlZ9s7IxO7O7Sb0IYcsM4TzrdVxcCqDVSnZLHm932Lx4DyKM+Ons/hUCG/rxXVXI1cyAqMSno1ZNbeuXRx35vj/oMDoMfAGhs8amNJP5DmZxWwkffqrCXAhRg1rWzaDTAdk0Koa8S7Rs6E2YmMXJih6st6zsJK1JHKI2+U/j2dCFrTfWWLdGWt/NG6T6aM/gAiMfptr3bEA1y8bL76rvFvv1lNMSbsnb4uF3JtKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sgB4g1fMRB56wZZlh8xycx8LyZTekfQOvX8IaaM2Pic=;
 b=Lwl20mKdi1csowfG4u7JHfD8QxEY9oKiiyYfbdqtGrp9opzG72RtWotAFV/Yz1IkF/rlt9QnAAhQwiY7M/HShKJZm+qe+Ej6DchQFIZVeQn6g3cEaSI4K78ot9g7jK25b5xgt7vDemsxIWGoxAKHGP6zBpSxpPZ7dZJuX6IVqfvhBliCQ/mGuVqtCWZQwGLeXvVT2BvZf19WDizw5P7j5WiDOdPFjY0sXbOo4/sZcF0mTOtpm5irsHewMpEFae4tnvGjlk67zzUdXQQYEcwJoVKWWgOJFnPvgC2mPEIxhrE+O5n35A17P8F5R/HEQI8zsahq+yCRDiLRlyAkAyPLEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sgB4g1fMRB56wZZlh8xycx8LyZTekfQOvX8IaaM2Pic=;
 b=RQPuR5m63mFiqkpOP+IyELnA7IAW9nDvX0RYHJ1ttsonwOAQc7WWR2uWCCx1hyPX54F70RB5W0P9Zo296rKROAHZA7WBRbpIKNchuX6Vc6uEhNfLIezRZALV98xPBiaPJLvYc5E36g/mrF/+9An7l0Y7jVMh2sAdUQZMh6SHHgs=
Received: from MW4PR04CA0131.namprd04.prod.outlook.com (2603:10b6:303:84::16)
 by BY5PR12MB4212.namprd12.prod.outlook.com (2603:10b6:a03:202::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Tue, 5 Nov
 2024 17:38:01 +0000
Received: from SJ1PEPF00002316.namprd03.prod.outlook.com
 (2603:10b6:303:84:cafe::9f) by MW4PR04CA0131.outlook.office365.com
 (2603:10b6:303:84::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30 via Frontend
 Transport; Tue, 5 Nov 2024 17:38:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002316.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Tue, 5 Nov 2024 17:38:00 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 5 Nov
 2024 11:37:57 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <Sanket.Goswami@amd.com>, <platform-driver-x86@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 08/13] platform/x86/amd/pmc: Introduce helper function to set proper string
Date: Tue, 5 Nov 2024 23:06:32 +0530
Message-ID: <20241105173637.733589-9-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241105173637.733589-1-Shyam-sundar.S-k@amd.com>
References: <20241105173637.733589-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002316:EE_|BY5PR12MB4212:EE_
X-MS-Office365-Filtering-Correlation-Id: 8234521c-b6d4-4cd9-15a4-08dcfdc09840
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QtTw01KzIEsJomxals6FmM4EF4S2FXTWlEXQNwGp/txBhDTSHAx44QcauuXh?=
 =?us-ascii?Q?niRbLngZMbwvz32AAhD8rpmY99zscgH5N3aZsHmi11OAuj1q4Y/s66zLyuRw?=
 =?us-ascii?Q?seLBwq/NXUrPbEhwVeU4wlk7UFSxepQJ7jo0y1KZUHqR4I/lqv+fvQJFlMwN?=
 =?us-ascii?Q?5FexeqUFygLbkb9ldFaSRM7cFIlxwQsDNEi2dCqtA2NnDMh7DFFYQ09G4My6?=
 =?us-ascii?Q?sSAP3wKOrLLqLJmz37bNc9FpSBfohHNMFrAM5aSHyVXU5mAEVX7JGBLmL6Hj?=
 =?us-ascii?Q?6o0JLvEFHzLIGtR0INRD8CzGDOWUHQ2gPQgdrz//Z7CFPA/z8Qp+yZJhpeY7?=
 =?us-ascii?Q?spAQZ+uBt9kEO7/aTxBehqOA1C/nUNZ6zQtsPK4GDNVwXmskF9WMNCYRmwC5?=
 =?us-ascii?Q?p61XvPRTBL0t4ZilAaY9WXUH3//MTzu0mm2JevMfUGqyyZpdje3e1RqUYey6?=
 =?us-ascii?Q?n3eu7+8ahbxkgKv40IOwJ4l8/ZIj1flYCvmt2W4vjGBgpbFu0qFYHRsdclZt?=
 =?us-ascii?Q?CWI/5AcBSh6UveEmBxOekDkmizxyIBSE2dZq9QnRBaqOCmxx8oSyc/3xiHzY?=
 =?us-ascii?Q?WAlGgqfr++ShT8bqR1z5b452He0T+tIgl5F4D8GsVeJLcCPbasu+Xor6ITWZ?=
 =?us-ascii?Q?d0L3+NbtDow36+iCDcivnzrB+8J+Q4neqz/Hp6ja8G9yFdJ6+fEbrbiCu22q?=
 =?us-ascii?Q?WaPIed5VuAvD3TI+zr0HhvUl9tmVzT0LYS6jaHGWnPQ0fyliCexfMzSOIZ3x?=
 =?us-ascii?Q?kBkHXQy+9UGFcaZZARJ36LJCsNJ4LG0Eh1Ds3V+BCb4mzBgOueWDp/dzyv8y?=
 =?us-ascii?Q?mnKj7kJ4PIfHyQUpNisoaYF65YN9TscpUXCWmoo3FwOi5xDfmnK7nY1MzCmk?=
 =?us-ascii?Q?d7lbjd6WDXeY/VyHDsDCXTsJNQ+WhveSRbG1FlrrwYGGifOVtGM6Ga7kdyq4?=
 =?us-ascii?Q?lguQn1i4bVYVZlC/FsC5hotwZsyGGNnZTHhrteC1NP4FN7Lgvr9p5PZhApsz?=
 =?us-ascii?Q?LS71hNUWMWtnDfTenZ1Z64FFEJvgT5uCY+qaysqg2KVpA6F7C6eZuZLhpn7w?=
 =?us-ascii?Q?tAPcR1WMz50RY2l58y3ihmYSif4crxGNwaqlgL/w3lL0xXYcLQg4S9FL6qwp?=
 =?us-ascii?Q?UJWRRAU+zMiGePMBMMXizwJrHAMw6e9K8/cRacE83i6bsXoIv6BembApLKDe?=
 =?us-ascii?Q?lnmPjP+ZrunOqga3Hhs5iv1UoYRPnRKM2ih1rdorUCahrrWNpzjZtVbRJuLI?=
 =?us-ascii?Q?qC4n/TB6GDNkzO0hqkj6GHOXdPKacOegMntk6eYHuWpsxEaD5Jv6aUf+Ycbs?=
 =?us-ascii?Q?KAQ8ytiFPUJ0wKip8vhSRAX0SqgHKbU6HFN6AsLr9O1vsn5d4xl/uhgryMnt?=
 =?us-ascii?Q?jEVhtCpko6tj5RR0A7CezdHRE47tD4kG6n/3PBbNqSNdsT0X2A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 17:38:00.8090
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8234521c-b6d4-4cd9-15a4-08dcfdc09840
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002316.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4212

To avoid printing the S2D or PMC port multiple times in debug print,
add new routine to retrieve the message port information, which can be
used to print the right msg_port getting used.

Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index 90a7983d510f..1f0ddf5440c3 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -444,6 +444,11 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
 			    &amd_pmc_idlemask_fops);
 }
 
+static char *amd_pmc_print_msg_port(struct amd_pmc_dev *dev)
+{
+	return dev->msg_port ? "S2D" : "PMC";
+}
+
 static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
 {
 	u32 value, message, argument, response;
@@ -459,13 +464,13 @@ static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
 	}
 
 	value = amd_pmc_reg_read(dev, response);
-	dev_dbg(dev->dev, "AMD_%s_REGISTER_RESPONSE:%x\n", dev->msg_port ? "S2D" : "PMC", value);
+	dev_dbg(dev->dev, "AMD_%s_REGISTER_RESPONSE:%x\n", amd_pmc_print_msg_port(dev), value);
 
 	value = amd_pmc_reg_read(dev, argument);
-	dev_dbg(dev->dev, "AMD_%s_REGISTER_ARGUMENT:%x\n", dev->msg_port ? "S2D" : "PMC", value);
+	dev_dbg(dev->dev, "AMD_%s_REGISTER_ARGUMENT:%x\n", amd_pmc_print_msg_port(dev), value);
 
 	value = amd_pmc_reg_read(dev, message);
-	dev_dbg(dev->dev, "AMD_%s_REGISTER_MESSAGE:%x\n", dev->msg_port ? "S2D" : "PMC", value);
+	dev_dbg(dev->dev, "AMD_%s_REGISTER_MESSAGE:%x\n", amd_pmc_print_msg_port(dev), value);
 }
 
 int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret)
-- 
2.34.1

