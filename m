Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011039.outbound.protection.outlook.com [40.93.194.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E0B3E0725
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Oct 2026 09:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451824; cv=fail; b=QisbWsAFPfjUZFzX2SeSHozGK/gc48RB8muz/KA7POIQA2ZIgXwugSNlLY/h2Ldp9pvl+M2Z79jtl0pXdI/8cJiPD8LshYurqN/L/MStr9vAh4QcIGTFBckrd1bdlIYEakcOuW6VYp/MaHNJQquBrAaioLjGwuFXa/8bjflDnRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451824; c=relaxed/simple;
	bh=Sq8RvsAPMO6HmtRos00KkvDGvP7wHK0KTZlJFe2zPps=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iWitEO6wlv+F/i+5sqPT2uZjeS2I68cTgtCuA/ZooJTKbmA5eyFlQGNq/R6fO/mRHkpKfmOkXTKR+fF5a/mzkf2zw2k9vt0G8QvckEwXBrrPDzRpZzMf5DfJWL72AekgvxmmUGMngwWuPotxHOkNoae/7OmayZYzgsN3tIVIppA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HKsaiDZK; arc=fail smtp.client-ip=40.93.194.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HKsaiDZK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BuQH7XnUYAiBDgus+pJJSsO03zfdi/BIbuT3tfAzhxFn50FDbV/z/KUP5LTS05wbDC0uYzg/u73juA3FGJQOG78uDGLlgDbz6TavoQhgPLrULVHxLbz3wmdCr/m5EZ89jCy2SrCJBBae70RiTwl5A+z6fVuvpKkzg79npudZYpANoFwSMnWa1moRGqZU57umxSsagVOX2E/acjK26+2cW9VX61x7IYk+8xe87KODDR4Fgwql3UxsGhkKY21F1MXcsUuUQqhMcMRjSoDqeXsEDa3zxv3EWRUorcFvalIPnXwwHan/RxSYe6mCyyebCfcUZauasO9f+62pUTFhSa+JOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUcH3wufbpCjkwDAxfYed33YwcbdV6hsiis5GP5AZfM=;
 b=XNBZsc/ULcpxGmc4fxrvLWcZDf3ThwuNIeZOlMqaG+HYpZ6TTRmzffkfAUvfFH91biTRjk+bHHBuMmeJ2Z3W3YDVyuCpa2R04CDBnrBumAKsFoMdG6r10wwTD6taBfc1bWbFe65Gn/c1/wnL+WXJUki6YX5HtIgwstvcBVQFnr0owsa/KymUV86YFzSJHVIyi3BxGow/GTxML+zxLmrN0Fhv00YX6AoOoq5ZDZjyNkZozVmPouKwXEAh2U+m04NMUYner3ZNeC3BGVX8Wg5fosH+Ej2ivmRPFcwPKJ7fFAf7tapqHgXaumXGlZ7xeRk6z1TpVMMP/MZrQQLjs6vxhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUcH3wufbpCjkwDAxfYed33YwcbdV6hsiis5GP5AZfM=;
 b=HKsaiDZKo8DX5L6xc+wBpkrAbQFT3LvssK43eVgGD7+tu0++V1PGDN/L7Lur+sWcoQmkPk6ki8NYJ/TY8EK515jw068OBgp1OmVkmpIjp+GEj5ohqcC5Vw8xMvFokVu0UckpJwHOWNpVTLuhLv6sftEZ94C03YrA/Mu4WZHqHWo=
Received: from BLAPR03CA0032.namprd03.prod.outlook.com (2603:10b6:208:32d::7)
 by DM4PR12MB6349.namprd12.prod.outlook.com (2603:10b6:8:a4::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.15; Thu, 8 Oct 2026 09:30:15 +0000
Received: from BN1PEPF00018072.namprd04.prod.outlook.com
 (2603:10b6:208:32d:cafe::56) by BLAPR03CA0032.outlook.office365.com
 (2603:10b6:208:32d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Thu, 8
 Oct 2026 09:30:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00018072.mail.protection.outlook.com (10.167.245.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Thu, 8 Oct 2026 09:30:15 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 8 Oct
 2026 04:30:08 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>,
	<muthusamy.ramalingam@amd.com>, <NaveenKrishna.Chatradhi@amd.com>, Suma Hegde
	<Suma.Hegde@amd.com>, Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 05/11] platform/x86/amd/hsmp: Use local sock pointer in init_acpi()
Date: Thu, 8 Oct 2026 09:29:33 +0000
Message-ID: <145bf1f51ac60d3e975638e7368baa6c32dd543e.1791446401.git.Suma.Hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1791446401.git.Suma.Hegde@amd.com>
References: <cover.1791446401.git.Suma.Hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00018072:EE_|DM4PR12MB6349:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a390e1e-e49a-4b34-3ade-08df251ec2d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	yzGl2JJx5Ds0fCKw6zGFtF2dzFDMOpG5DAIWpKZd2Vb3xuzbFgGYspSwlwxQyWr1WIhLa0CBzHI8+9gyRk2AZOVLnBb/tHfJpxuxvGCaZwAEw/H+0r5Yk21gjjBVZqydQn7ACdeKxF2nDLkiC7WmnuNqvuYCcZ7z30GswkiCC2Pixp3vf9HOq2Uq8/cR7c5WYFWS65/DDakUPJdK7zsedcw1wo+s3gESvMhY5lfAgk7x3+dp5G/Kt45SCDghPUsXOmyOIgpNqN4Nk4aJ4sGp7kxKmNkfm1CaCrpCKU9EhLz08JozYchyP6R9JPSVKZmSDnHwXzTGPuLrd7hh/VTGTRi7RwCLYGFQtSIWJEujOSfAjyZGh+XFr0NSE5bWuLvbnYqIguYP86MbA0y4nluHd2lfwQAUvYfM68nefjjzKaq+fQoO5z2jlM4AKvhtnCUqnf0EqCsXjIXhmsBUxtq6wH+jget6WOkjP8Yawphw7CmKPNQNpZlh9QikG1jeb82KAHcRB+MuUelWSOpR2TN+Xl41kpH2FS2SFyrQJ5D/H3ZPFrSqt4Iu2wAJg60MYSBorL8K7XZRzceYnVqOhoPi/EQHZvUHW6QtlupgoEd/jR2pF+EzoQYZs4SaFCf3CuEDRyyJmd3njJH21smK/g7QdnF2qxIoBywZJewr0vbfT97s/ctoz6ACvNQ4GuMxKRZlRh7jewo+LMJwXMbeozEAgA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	paKME1dkCeAQARXHsRtgCqJTzSqIEpoOnjc1deuWrmV3Lgi2nJQSnejxOt63/ZpCKN/xBGAK3r1bypowvdk0F55jCmSFKEvPDN2SklTyTVIUInys33LvCIcXLMvPO8TjNjcqCSRnMFzA/W5eYJ4tPwoXLJ4TBaoIexBKveDlFyJXXSkbaGtlSYHZTPLshSA88JvSS4JQ22q5y7tKJU6JrYQu0feS54VjGrBXI3IN2d6uehNz6SKZsSzStK1z9bXF2jEASPUgzOMR+3itM2kvWg+zp8aZAkUr4ueSfc2kXgSeDtuTvGDGOUSlc2koaAt+G+dHVI5AYtLaLs4FG3IDN8nlrvcyno6H1yjsOnvmKAiZzBreYGwUnOEpAvf3FhCwqSlTpPMkhzZF19ZB1msDpPJnpNgC5WeRW4G6y+s8Vcb5xaMLR2eHPRlHypA7L9ij
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 09:30:15.7571
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a390e1e-e49a-4b34-3ade-08df251ec2d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6349

From: Suma Hegde <Suma.Hegde@amd.com>

Introduce a local struct hsmp_socket *sock pointer in init_acpi() to avoid
repeated use of &hsmp_pdev->sock[sock_ind]. The subsequent patch adds more
users of this pointer beyond dev_set_drvdata().

Co-developed-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 0e412c23c69c8..b6f54e8b91663 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -546,6 +546,7 @@ static ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_att
  */
 static int init_acpi(struct device *dev)
 {
+	struct hsmp_socket *sock;
 	u16 sock_ind;
 	int ret;
 
@@ -563,6 +564,8 @@ static int init_acpi(struct device *dev)
 		return ret;
 	}
 
+	sock = &hsmp_pdev->sock[sock_ind];
+
 	/* Test the hsmp interface */
 	ret = hsmp_test(sock_ind, 0xDEADBEEF);
 	if (ret) {
@@ -579,9 +582,9 @@ static int init_acpi(struct device *dev)
 	}
 
 	if ((is_client_platform() &&
-	     hsmp_pdev->sock[sock_ind].proto_ver >= RYZEN_MASTER_PROTO_VER1) ||
+	     sock->proto_ver >= RYZEN_MASTER_PROTO_VER1) ||
 	    (!is_client_platform() &&
-	     hsmp_pdev->sock[sock_ind].proto_ver >= HSMP_PROTO_VER6)) {
+	     sock->proto_ver >= HSMP_PROTO_VER6)) {
 		ret = hsmp_get_tbl_dram_base(sock_ind);
 		if (ret)
 			dev_info(dev, "Failed to init metric table\n");
@@ -597,7 +600,7 @@ static int init_acpi(struct device *dev)
 			dev_info(dev, "Failed to register HSMP sensors with hwmon\n");
 	}
 
-	dev_set_drvdata(dev, &hsmp_pdev->sock[sock_ind]);
+	dev_set_drvdata(dev, sock);
 
 	return 0;
 }
-- 
2.34.1

