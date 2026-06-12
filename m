Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011047.outbound.protection.outlook.com [52.101.57.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECD23921C7;
	Fri, 12 Jun 2026 04:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781238412; cv=fail; b=Nl0IoShXGIhygTkW7h/2t8kp5GjcBeWi30wtTKTXE+dIZ6b1gr6Vvuq0GaopilF31qgdbnMn+PGjfTzzN6+2uDjMamNvnK+Fd/W6akp3HGeel/ePD00jlu2KyTRJ0e3d+Sn/2X6Ueqku7iYg7yYPWYzwscuDQhrZf7X/aTVZELw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781238412; c=relaxed/simple;
	bh=TaARYwlmZ4SUWR7NkCyjVAjeMQHop+CKHWLQkbgI+TM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BhLBKci/pcwcGYwE6UAAbJ+1QUHXXYCjcjsIedTUocNWjmSS2LTCy77Y2qH55T/ORdWuHZoyxp3OFVP4PDFjO2Wu4kew/mf3Rh1cEOd9jFetRV08w3mMrgZpwbL47t+TLEHO0Q8BqoSwvqIiZh34/vBOOuELOsPlIKHDnp29e+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Nid2YcPK; arc=fail smtp.client-ip=52.101.57.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Nid2YcPK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZoeYdIh/ozI8z9bybgQoBOZS3jztiCJ490K9TnryXojThjUiehKvGxm4/RXK8Vca00rFKTkYDNEu/PGlcE0RixjKWUV6WM+s1DWjVsj11gFGUrlphnwKF/neG+orSplHn1t1+eRt7B3YOSspldYvuRz7YasEfi18yece4h9pHXH20xHa5mjizZWJIPw7azR7Z4w7/FSRtXyd46GlKnMD5qAqWDKP1pifDUmsZIj5MtFYbY4B3OqIy5yYw6xJ9yKPXPdsengYM2n86D416tj5EEehj9b4EYMg4ZIqumhOgHqvGMF5QXxNcjwP8UHyLSdodA1dU+fS5yg+GeQbw9v3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dp1a8aDu4EDA//9zzdro4hRygg7k00XjeYbqyf5AByE=;
 b=UlIq8OunvM2SWzRaIn8ZKlv3qxLzG+k1r/mElRlBuC4HVAohwiidQauPs737CxeJ4EV5264Dn8Za3U5WGu1XA7hie2OZ8y9YpGj0XlxsmIOWYk0snAbITn4q4TRL1IVamdzrXGt8UmuxhUfSzD5wpogzc3Rp65LEk+2negjxesbGELxo/KSSqM4a3O9HMPCa1PZl4oGOzpgLNE2UvlWlQ5Kaz8dAchTjn//qRr35JoE4v1ohik02+fQ4Sjxq5Q8wd0hSje8ojNSagJ2V4jnwbpsebmVRGLaVPaf1YfPsX9arIFwsz9dCqkOg/f3TbBe2LxGfKotoj75cOETYsuIFEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dp1a8aDu4EDA//9zzdro4hRygg7k00XjeYbqyf5AByE=;
 b=Nid2YcPKLxVz0i2D5vLIBOa6JZovjnIZF7VSPJC3BaOZJwMDUs/gXWripcRpFu/t23cxghrtJEoPqaOocs5+EN9pdESYriiz4brbrXvFw5926yuMPPz6PweVJcHZm0BfOGo8PSkfA0h68TyXiGmyiaUHgLDg2iD3+2LEIigk//k=
Received: from SJ0PR03CA0237.namprd03.prod.outlook.com (2603:10b6:a03:39f::32)
 by MN0PR12MB6079.namprd12.prod.outlook.com (2603:10b6:208:3c9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Fri, 12 Jun
 2026 04:26:46 +0000
Received: from SJ1PEPF00001CE7.namprd03.prod.outlook.com
 (2603:10b6:a03:39f:cafe::b) by SJ0PR03CA0237.outlook.office365.com
 (2603:10b6:a03:39f::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.14 via Frontend Transport; Fri,
 12 Jun 2026 04:26:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE7.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Fri, 12 Jun 2026 04:26:45 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 23:26:42 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Muthusamy Ramalingam
	<muthusamy.ramalingam@amd.com>
Subject: [PATCH v6 6/8] platform/x86/amd/hsmp: Clamp ioctl/send_message indices (Spectre v1)
Date: Fri, 12 Jun 2026 09:56:08 +0530
Message-ID: <20260612042610.1629037-7-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260612042610.1629037-1-muralidhara.mk@amd.com>
References: <20260612042610.1629037-1-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE7:EE_|MN0PR12MB6079:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c776cb1-5382-451e-b4bc-08dec83ad028
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Y9uvQLojug0GV9lrnhDjgm3m9oM74dJLsP4wOR497WpsN1lvgTL/kKutD0COW26Aaq1CXqa2X84M3hV0xb7G8QVeNF8kwvpYd/Ba1/TqB6pdRTnZkCkk7pEwZ3Rev1cNFpmDEvIG/Tqy4sxj63U2af/mn9b9m3pioXp9HNYNKlQw/Xs5up3IuwwGZFNHjg7/oe5iYD7yVmSz4J6pFa3koW3pUaQcwRATvMG3Q7sK20iUn84+QfK2rzljlavNOo/hMGDPva5Qp0EjCFhd9XqlXh2TAXRlCHbOl0x6nEN2U90H207+Eia1o/eH/rIULQUkp0ex/wnKYaJV8i+eY/T9aobCoXjAxEVok89UiCKRpWbh26JysbVlYCLzip3ZADPLVTwT2fjn/EX9/LtkvVlxdMKNnhJKGXeEADYyFaHzGSEIWlXO76Uv1GqtpCcF7XJhyPprMcXxsUQZTdHfyW9yzyASZPUaxy3EvIDtgtz4Ttoa0h6PXtUPtQUXFP+77CdFCocXVEPy2STPKWwR/U5IE7+OV5ag+mtcicx7YS0MrXqcelJ9C36sqSyV+0msRm21pg+fe1s6Dgbalxk9qGE6g1927Op2r04gP2crqhGueaj88MCv1KHDxXc/dE83albJg1HOjq1XT11f9ul+m45TCZYg4R7XRW9ME6OqsowXC3OqjCn8xC2q93eDyWLH2VYPfgv10ebhq9MD+N2wU69bPtKt8duQQHeDVdIfQgpqUUQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	t8qwNSsV+ScNXdQE69jyF05zJdIGb50lU7Ej+GCn/AEj5th76thgiKT+dHKjzYpNJ45swDjD7PPfj4mnWR6d25cpulbyzCoWJKHgPkEQ/sqDxs8osrR6fFo8LHSghh6xDMxyMUWcTTwdvcfsPLjZzHCrLMfIzd+AMNorOKhXyNchj1KAm1i7RTJpTCyTZID8vmb2SgVDOXjFqAG4wmI3apboZb46rZpoVcO2Eo+R72dW7QXFEa/ZS9NdIJrCYpVBSq9UavDmieEYmuPJlZsfj3zsSxYSuXWQfCoJ6dx3AWY/RZbXiM+kfXSp07tmiupmfGPlWawxR0bSTfegujKR+EiLgunEnKavngwyw7nbydJwXKxZKLEJ1S9GD5PcvPyaSCtQzEM0bjzcRMFWmsvwKDfYzz1r2zMd5j/PIYCFLSbGZbkMGSz4pOT+GPVQXE0U
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 04:26:45.7780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c776cb1-5382-451e-b4bc-08dec83ad028
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6079

Although validate_message() checks msg_id, a mispredicted branch can
still allow speculative indexing into hsmp_msg_desc_table[]. Clamp
msg.msg_id with array_index_nospec() at entry to hsmp_ioctl_msg() so
downstream dereferences (including via is_get_msg() and
hsmp_send_message()) see a bounded index.

Similarly, hsmp_send_message() bounds-checks msg->sock_ind before
indexing hsmp_pdev.sock[], but a mispredicted branch can still
speculatively use the raw index (Spectre v1, CVE-2017-5753). Apply
array_index_nospec() after the check so every caller that reaches
hsmp_pdev.sock[] through this helper sees a clamped socket
index—including hsmp_ioctl_msg() and any other path that hands a
user-derived struct hsmp_message to hsmp_send_message().

Reviewed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
 drivers/platform/x86/amd/hsmp/hsmp.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 36ff83744684..9f7a5fb67728 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -200,6 +200,7 @@ static int validate_message(struct hsmp_message *msg)
 int hsmp_send_message(struct hsmp_message *msg)
 {
 	struct hsmp_socket *sock;
+	unsigned int sock_ind;
 	int ret;
 
 	if (!msg)
@@ -210,7 +211,15 @@ int hsmp_send_message(struct hsmp_message *msg)
 
 	if (!hsmp_pdev.sock || msg->sock_ind >= hsmp_pdev.num_sockets)
 		return -ENODEV;
-	sock = &hsmp_pdev.sock[msg->sock_ind];
+
+	/*
+	 * Sanitize sock_ind after the bounds check.  A mispredicted branch can
+	 * still let the CPU speculatively use msg->sock_ind as an index into
+	 * hsmp_pdev.sock[] (Spectre v1, CVE-2017-5753), including for callers
+	 * other than hsmp_ioctl_msg() that pass a user-derived socket index.
+	 */
+	sock_ind = array_index_nospec(msg->sock_ind, hsmp_pdev.num_sockets);
+	sock = &hsmp_pdev.sock[sock_ind];
 
 	ret = down_interruptible(&sock->hsmp_sem);
 	if (ret < 0)
@@ -306,6 +315,19 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
 	if (msg.msg_id < HSMP_TEST || msg.msg_id >= HSMP_MSG_ID_MAX)
 		return -ENOMSG;
 
+	/*
+	 * Sanitize the user-controlled msg_id against speculative
+	 * execution.  The bounds check above retires the out-of-range
+	 * case with -ENOMSG, but a mispredicted branch can still let the
+	 * CPU speculatively use msg_id as an index into
+	 * hsmp_msg_desc_table[] (here and in validate_message() /
+	 * is_get_msg() called downstream via hsmp_send_message()), and
+	 * pull arbitrary kernel memory into the cache (Spectre v1,
+	 * CVE-2017-5753).  Clamp once into msg.msg_id so every downstream
+	 * dereference sees the sanitized value.
+	 */
+	msg.msg_id = array_index_nospec(msg.msg_id, HSMP_MSG_ID_MAX);
+
 	switch (fp->f_mode & (FMODE_WRITE | FMODE_READ)) {
 	case FMODE_WRITE:
 		/*
-- 
2.34.1

