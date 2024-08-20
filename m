Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7463E18C01D
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Aug 2024 10:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724149816; cv=fail; b=I/krwf0P2l4PTcIaTUXUI/uUKZmzdR6nQcrQwTNvHw2rhMSoSaWYs9VRqO4RN+nASVvZkpoSjIXsEOqoW/ipWQuGz+as/2sLC1Y7aZjKUlmokyyTbeW9US3Uffez+9huspMxH7HuvYWeFaO92hapB2KP99NMvF5K5Sa40x9J9RI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724149816; c=relaxed/simple;
	bh=0pOAOaHPt6vlUA9JFP1rREfIrTybBwMPE06k3VZo2rM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pgncSPCy7QDGtZOWTWG0XZa8Bc4XVm84s62bgsVs/SlMnJh98YEVbGrTaSiVb2y6pAxAsf/qt8oiIEMvdTGJKcTAra6v6tJWkMb/HfMcda6SbGb2brWOa5SBChqPMWeLII23zDLHns8fZSmERNH1wSVM1rrsLbOCUaDUVrQH29k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WHMh+ZQ0; arc=fail smtp.client-ip=40.107.93.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WHMh+ZQ0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f5UhNd+wFyw2HbWQ0evOYAtjcLuoPedNSr7Xfr9g8oOIaCpuORDTsathCFnKvNsp3k3SP8Jjjc9Rp0vv9yiZN8P1dw0qEL7Co6uxP6SBePJ7IbICd5YrSfF5L6WL//xB4/aVoaEuYiDTtBgUkdZMOoegSJSxwx5nYFJOXsv3KG32PF4j0d/AvP3bbgV5ywBDFyKjhnkOBuTcDxYrpmFNSUp1CkImcPHt4ZsbX0UvpFliBe/lUy28jdDT6+GSLS6ACo8SJQQWOsuYCHEFeLulgn+AjRAlfDl1IY107tWKXcaDElh+12KYrGoC6cioXi/jwdQChndk1YnMx2dIEfpbxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a9yTjI8CsmZGh5ac9M5Md9utexHfVhPaiMYFEu+Ouy4=;
 b=JrKK0eyI7yRrYhUe8ZPsE2FJuqQK/9dw6SrEQTEfvYNd/5OGqc89mOAk9gNzvGf3fy+vVvD/zk2zwzAt0cfe+FbSrapjNlSZctGtSNZr1OCMod5OVh4b+N83azAMVSAxuOaLvcHTYCs/fuIwU0pbfTmVNbzxqdjDYpsk5d1wdCsLO60ad5l7OMqRWOVx6jnUDvEzaLSZthV13bulWNHkgbIkglmI/a4qzJjnDn5bsBkcX4kUhN883R0e5E+Fy6eSFqjq1woBIqntL+WLQF7CSzIpe9C15oJbiFjgrTcyHPHdqDA+vAdR5Y1NeGoVVi0eHwPs8M96VBzjlFmx3gGgEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9yTjI8CsmZGh5ac9M5Md9utexHfVhPaiMYFEu+Ouy4=;
 b=WHMh+ZQ0x2vzKSspiRPgJHIoKuimyZ8rLsSf1ghw2o5RHERCcLvcWGIryCOg4j3ofNGLag94KIcJ2S0OsmDO/lELIfeHdh0cPEco3zt6jyszSDqQlRSIKuUccAg9WpzANfqyjsaMFsysyR+vB2GwqHU5g9XgND3uDjzVP9rf1sk=
Received: from BY5PR04CA0012.namprd04.prod.outlook.com (2603:10b6:a03:1d0::22)
 by IA1PR12MB7639.namprd12.prod.outlook.com (2603:10b6:208:425::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 10:30:10 +0000
Received: from SJ1PEPF00001CE3.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::61) by BY5PR04CA0012.outlook.office365.com
 (2603:10b6:a03:1d0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.22 via Frontend
 Transport; Tue, 20 Aug 2024 10:30:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE3.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Tue, 20 Aug 2024 10:30:09 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 Aug
 2024 05:30:05 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v4 03/11] platform/x86/amd/hsmp: Convert amd_hsmp_rdwr() to a function pointer
Date: Tue, 20 Aug 2024 10:29:33 +0000
Message-ID: <20240820102941.1813163-3-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240820102941.1813163-1-suma.hegde@amd.com>
References: <20240820102941.1813163-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE3:EE_|IA1PR12MB7639:EE_
X-MS-Office365-Filtering-Correlation-Id: 4177ca89-5b58-498a-d785-08dcc103111e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Nl9jMHI/5aV67jEk8zKxgEFSv4RIdksgJnPdD/e4GYqieXsZlDaoAlZaNlGa?=
 =?us-ascii?Q?YtgNnBHC0yWvBXSdIjtTN5vV7Tjk1LOwUzyfTHSl+p6zgYjeOQ0rZ+vrCA2o?=
 =?us-ascii?Q?9WGyNePyDJcwCeGNN6tI+O1V7Msxmr/3mnU4fMJVDmoHPBp/JxSoQeokBYOd?=
 =?us-ascii?Q?4S/0KetWC9gvj4faAKV1+3BUxuyVhJVYXGrZn7Pa0CC5VCM9I/HMB3Vr7fOv?=
 =?us-ascii?Q?3yXg4smDtUx9ZRjUJ/ZZcJ0W3/i7MslSnF7p/oUEWXWTMPplPZWT2jZQ0KB+?=
 =?us-ascii?Q?ypScAy1EAJieTvjMZ3oAmklGbGlS2jM2wh9MzlA0jZnyXM1ZWi4/V3MwVehA?=
 =?us-ascii?Q?pWVX3ONTAyxdOMXQm/L7yrGP7FGHqSDycxDxyITu/YalVLsK84RtdmQl6Pzl?=
 =?us-ascii?Q?B6icHpbWBowjH7Ld7dHi8TPScxHayofQLGNpvDbl+R1s1geU+uFpLS98cYe3?=
 =?us-ascii?Q?0QLAK5HhNfqP6u6xwNzkhTapYZvPMLOsTPCIqjFerfIjlXmfvnuHt46pfs4e?=
 =?us-ascii?Q?JO2V3wKC9g3VWBWFimtS2Sq9LDfHsT8Uub7zKz6rFF39tqJbG0DK3udwWJeI?=
 =?us-ascii?Q?1fioEGLAl2fqeybTpANmauHT97spRpMujFRBl2EY8oUpyla49dEFChU2l95d?=
 =?us-ascii?Q?ZsHoQT+85oVobnb9lL9HumGc0np6i4QUxokqJEqXznP6crZPjkY7pPeATewc?=
 =?us-ascii?Q?0UuBjxz7F2k4a4yih0SguksbOuo0KQbzXfr+fz2YklAn5JACBJKK0RJO9RUC?=
 =?us-ascii?Q?NahPfjkPNeYb5jAnOhAvkORdcUB13u39chOfucMf/LuKaTNJgTNw2NliMGxG?=
 =?us-ascii?Q?B2exe/10LPuP/VFmYjsmLN3EE75TFnzaY2HQFzuEvqS7q9/sz7NlQO4y7JP/?=
 =?us-ascii?Q?xraEc6QFQLlhC2Zt569PeE3auT9QljkOdSIPVrldxcdUuSirDTG9yp0TZ6iB?=
 =?us-ascii?Q?2HUP0vUjwZDzh3825FFoHGGf0TtECfjakgvHGPP12/0f7OVGEH/IlK6TnZof?=
 =?us-ascii?Q?o+SfoUo7mEmTNLw22c+K+zjYsJT9+/TKYsGFDRQCIZHlf4xImJAZxhPcj6O+?=
 =?us-ascii?Q?FfZdDDiGCgc3r6MOLQ8O2YndX0GmICX0omW0u+8p9Yo6EkCJSzgxl++f93fi?=
 =?us-ascii?Q?TbbKQFLEo5zHMHmbDKzmo71A3Yylvp9q0XmW6VZM3ESaaiERy+VBDBOhA7FM?=
 =?us-ascii?Q?5JxGu7ga5RH48kVbGQJ5LPfafsiVuKTj797hto3tOQAejGxpFjGD+jpB6ctY?=
 =?us-ascii?Q?mQRcUcq9fg4krCIMTaTZc4iKImfbtbQtJtki43hywVuP2rSyzsAdyh3Rr1mb?=
 =?us-ascii?Q?zHQ/4qtoFZgbhQynhOn33NN6SgvUDD0+BKS3c98tqdhjk10pOMuRx2qMKmNj?=
 =?us-ascii?Q?04zf0TWWRVjBGfV/YNnm5c+yYTOX5VMz29mVYwAYfSmdCRi/M8zKkYAPja4j?=
 =?us-ascii?Q?5qOsggcjq1C3xLou78M+rfTl4ViXEE/r?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 10:30:09.4658
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4177ca89-5b58-498a-d785-08dcc103111e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7639

This is in preparation to ACPI, Non-ACPI split.
amd_hsmp_rdwr() is used to access HSMP protocol registers.
ACPI and Non-ACPI use different methods to access these registers.
Now that code is split and common functionality is kept in hsmp.c
we need to define a function pointer to handle these functions separately.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v3:
New patch created out of 7th patch in v3 series, to address the review comment.

 drivers/platform/x86/amd/hsmp/hsmp.c | 30 +++++++++++-----------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 10ab9b2437f1..6d0c58c6a82f 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -82,6 +82,7 @@ struct hsmp_socket {
 	struct pci_dev *root;
 	struct device *dev;
 	u16 sock_ind;
+	int (*amd_hsmp_rdwr)(struct hsmp_socket *sock, u32 off, u32 *val, bool rw);
 };
 
 struct hsmp_plat_device {
@@ -114,22 +115,13 @@ static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
 	return ret;
 }
 
-static void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
-			       u32 *value, bool write)
+static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
+			      u32 *value, bool write)
 {
 	if (write)
 		iowrite32(*value, sock->virt_base_addr + offset);
 	else
 		*value = ioread32(sock->virt_base_addr + offset);
-}
-
-static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
-			 u32 *value, bool write)
-{
-	if (plat_dev.is_acpi_device)
-		amd_hsmp_acpi_rdwr(sock, offset, value, write);
-	else
-		return amd_hsmp_pci_rdwr(sock, offset, value, write);
 
 	return 0;
 }
@@ -156,7 +148,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 
 	/* Clear the status register */
 	mbox_status = HSMP_STATUS_NOT_READY;
-	ret = amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_WR);
+	ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_WR);
 	if (ret) {
 		pr_err("Error %d clearing mailbox status register\n", ret);
 		return ret;
@@ -165,8 +157,8 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 	index = 0;
 	/* Write any message arguments */
 	while (index < msg->num_args) {
-		ret = amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
-				    &msg->args[index], HSMP_WR);
+		ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
+					  &msg->args[index], HSMP_WR);
 		if (ret) {
 			pr_err("Error %d writing message argument %d\n", ret, index);
 			return ret;
@@ -175,7 +167,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 	}
 
 	/* Write the message ID which starts the operation */
-	ret = amd_hsmp_rdwr(sock, mbinfo->msg_id_off, &msg->msg_id, HSMP_WR);
+	ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_id_off, &msg->msg_id, HSMP_WR);
 	if (ret) {
 		pr_err("Error %d writing message ID %u\n", ret, msg->msg_id);
 		return ret;
@@ -192,7 +184,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 	timeout	= jiffies + msecs_to_jiffies(HSMP_MSG_TIMEOUT);
 
 	while (time_before(jiffies, timeout)) {
-		ret = amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_RD);
+		ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_RD);
 		if (ret) {
 			pr_err("Error %d reading mailbox status\n", ret);
 			return ret;
@@ -227,8 +219,8 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
 	 */
 	index = 0;
 	while (index < msg->response_sz) {
-		ret = amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
-				    &msg->args[index], HSMP_RD);
+		ret = sock->amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
+					  &msg->args[index], HSMP_RD);
 		if (ret) {
 			pr_err("Error %d reading response %u for message ID:%u\n",
 			       ret, index, msg->msg_id);
@@ -545,6 +537,7 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
 
 	sock->sock_ind		= sock_ind;
 	sock->dev		= dev;
+	sock->amd_hsmp_rdwr	= amd_hsmp_acpi_rdwr;
 	plat_dev.is_acpi_device	= true;
 
 	sema_init(&sock->hsmp_sem, 1);
@@ -756,6 +749,7 @@ static int init_platform_device(struct device *dev)
 		sock->sock_ind			= i;
 		sock->dev			= dev;
 		sock->mbinfo.base_addr		= SMN_HSMP_BASE;
+		sock->amd_hsmp_rdwr		= amd_hsmp_pci_rdwr;
 
 		/*
 		 * This is a transitional change from non-ACPI to ACPI, only
-- 
2.25.1

