Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793604029;
	b=0Bo8OIaYa4RwuCHDrmN3B+tLkI4Qf3eNMdKfP5OXf0Gr1ENDe5HEvC4QxVOIPGAHgsY8
	 v35OQasGbnQ87YE6eOfCmApSlcoEAT2Ohu2WjNNMmMFRxgCjElD46RN5RqU5HPLMS0ciC
	 67H0RLRxiDT8KczybyqGpxVYSEilL32z0EpN3lLwjgd7ZDOglv4Q0gZ5LrSsohcUe07kg
	 zrn8cxwbcEO+YxvT91fqbQATLBvL6/C+WwPcu1yQ2X6Bs0shtUErVCIl0ZUbX19FpeDNE
	 8X37y7I7GxXmFlUeziq+XgMwmukUqbl/SqjJJSpfH90vemzS6IjAaCW988OCOk+HzNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604029;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=X6QuTbd+7Te/BPFFLOydfmGfBK1S2Y84OPtkaJM6+W8=;
	b=z6v+cs9KCDh3S/7/Smgat2JMw5yn6kAy8Zjwv5BDpSF73+k0D9y/SvFqiOutK6RZhAFB
	 /RjQDS9vL0JAKSSb13m3Om5tuXamAr68FXfgua+caX8Qx289azfkjOOlv5OhqnLsgRGSo
	 O0p2AcG30KM/ynw2H/GwpBHCj+6aAJi0QjfQtj2bJkWtTOr79pMoaDlSSj3ZHLteoPCGc
	 U045e/dpLERYCMySFDW7SZdlUTPN2rG+I5S8yzHlBWNG3ACP9wBCr/qV9sBoJNPKzbn08
	 sHx+P3mIZ1Ai6B2ihqa4mYTkki4w1C3C+jnWa41SPpqfQ/Q/KZCjfJ6ZPPsgG+Gy4sg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=HeT+m1YN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.10
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012010.outbound.protection.outlook.com [52.101.43.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AC3606A324
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 07:20:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74AC3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=HeT+m1YN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HiBn0ytxsVWYRrwoxCoQNjNdune3yB613H1Tv925YwCnAjJxWNacvcvYq4kFc1bzyi8hDSCGhNSYF2jfhy+TXwd8ASPU2DQ4Zd3aDajge4ABOY1GzMlM1PLBwx6VL6a/nYAHgsXMWfkF8BqbyaO3vYVlgnCTB0GrtuEKp1lsbvMQU/pRC1ffQDRejb15P6eBg2d6qdNIBAVC/qSFXHZqGHDlYGybCTBTDwY+bq2fsGkDoLP/xurO0EIOnRoAmDMZrdgngbdNRn+m+w6v1ClT4SNMgZJPcpg+Ja4bDRTvVoElUtAKb9R8pva2DUTJwhkprIUg3Ywhcr9MToKS7NlGuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6QuTbd+7Te/BPFFLOydfmGfBK1S2Y84OPtkaJM6+W8=;
 b=DZQ5vNEGywk+iTyhr7I3I2AGE5RYT1o0E7PSzQ3HXEf0QUcMslJGSZ2LxWtwQVVLzIvwd7Uv4Qfxgg4R0nEqUAPrsJdCMSN0KpGekzG9IrpHsdQ71LAT/zB0JrliMijpcaOgyzShOk8eBOMhNJRqjevwSD0NxUTXtpfUrOSIhDS5KmA7G8JVf8q0Y21YmtPxsT4T22DbMbXwsC12cpts/rmQYEAJBRnUmkd/0cbKgCeBS9/2aBC7cTw2CuI6eEvDmkqVcl6C1C1wJsooWou6Klxu/pt2T8nngEBlHRYYQB5PXll3b3mmhk3UTxuNFwZZ+QUa6IL+kt6XQGeylalAPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6QuTbd+7Te/BPFFLOydfmGfBK1S2Y84OPtkaJM6+W8=;
 b=HeT+m1YNgk49Tmj2yxM0RfuPHFFfQmVbA90qXRPgGoVIWnbmylTNT9piC98lmcOCzMDCU+dL/Lce9kUYTvrdqag27XTRxt65J6E7SHsXKQyxaHcAgxogWB2Xs8d6pKC4tkdYZaDN3u9oTEgQnCJLaoK6f7gSOw+ut6QyKGUOFyo=
Received: from SJ0PR05CA0166.namprd05.prod.outlook.com (2603:10b6:a03:339::21)
 by BY5PR12MB4289.namprd12.prod.outlook.com (2603:10b6:a03:204::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 07:20:24 +0000
Received: from SJ1PEPF000037A7.namprd04.prod.outlook.com
 (2603:10b6:a03:339:cafe::88) by SJ0PR05CA0166.outlook.office365.com
 (2603:10b6:a03:339::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Mon, 2
 Nov 2026 07:20:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A7.mail.protection.outlook.com (10.167.244.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 07:20:24 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 2 Nov
 2026 01:20:22 -0600
From: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Suma.Hegde@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, Muthusamy Ramalingam
	<Muthusamy.Ramalingam@amd.com>
Subject: [PATCH 06/26] platform/x86/amd/hsmp: Add sdps_limit sysfs file
Date: Mon, 2 Nov 2026 07:19:04 +0000
Message-ID: <6f2d944db032009390ad2d47ef78c1d1b02e7fe5.1793602633.git.Muthusamy.Ramalingam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1793602633.git.Muthusamy.Ramalingam@amd.com>
References: <cover.1793602633.git.Muthusamy.Ramalingam@amd.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A7:EE_|BY5PR12MB4289:EE_
X-MS-Office365-Filtering-Correlation-Id: 36211790-570a-484b-3137-08df38b1c369
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|23010399003|6133799003|10067099003|18002099003|22082099003|56012099006|11063799006|261021121427099003|261021123027099003|261026121527099003|261009223027099003|260925022911599003|260925021311599003|260925021911599003;
X-Microsoft-Antispam-Message-Info:
	OFBDUL7xOgBDOPxI6nTIiJOSa5Md3wVvGHLBZ4wKAB7rP9OVQJqOuGI7D8CR17EvKNX881wb6sNFf2S3pmcsUoJJmuiMhcvYxXBO4UwM/IldpZdjTy3+A02Ji/2r9YiQYZ+WRHUvXmtVm54+39WsF7Aaj4GtOy2iKP9Q4msSMmVtR0SvIy5DYNPEsOgi7U3rg2cO/4M9/zCK3t8nL7pFumD6/wsDPFrbmU305rdbl9VbT083kykp6lG3EEp/MzVncPNnQkARvsmD6qgobWnOpdyLBhy3yR7KglZEeZVVt8ue71+a2NaGfrFg5aDhCU3hAPpOyab7iloKByPWHV920PZtMKHVKT85PIhJTHWGuvrbVvw9w+QvVNv7FF/KfKfRd95TjPlhga0BuqU/BaHFqSsYuikJ84LGdVL/8XtHQxBFfVZrQRv8noBEEULFgFs0D7O572LMHRwGx5G2O/CzFNkasei1i4GfGFekkzjvUd6DCQuV6iIGO5mN3noy78gbaJ1KmsL4dr1z208I9H2eUnXTfs2i4iaI6pRAaZstkKafYOaeKJ0FUmgMFRp+yIaw62cti85kWxZDm2x11NBH4+aVJ4AQzhjHNf1GXZaY8jgBav3eVl2QczlKOST+Y1iYYzXjgLhXl4l3UW8NjBA8pSw5IHivBDDbhRnWBKXrhiKNqgt1NcOiVAOddybWeKBPKlHLffrHAJ/4PEYI0j2ACg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(6133799003)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(261021121427099003)(261021123027099003)(261026121527099003)(261009223027099003)(260925022911599003)(260925021311599003)(260925021911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ywtdW9kJRi8O3jqusfTq2iPFtvAWQGhAUPWL2VWwQxmeRqE7vtouvdXv0Q9VvCGrulcNgJvUtHysoruq4GUlbOLbeOBQdM1dUA3S9OTBFFL4v7Rr9g1FSZNMI2Kk9us5Y+YX4I9fJlr825LhbjgBJOF7Wb9pVEpOLigBhLLRR8cNDM0VELvYVT87+rKXB+zqmtsNxZd2qKlp95kQbLA1+f99RxUO63WG8tsTfAzmFtgdZI11hQfiC+t3D50ZWoG/1NoqR+hfoPvObn4/qBij1GSyo6PjV4aAJGypHQoAPvi2CGO/6FvDlEjAHNWqvU4B8vUOgCBisRUQncVXQwE6nL12fKytw4kSYIaZMXz6vZT1UiZbRfFK+PVYVIERasZLJEft8VPv78AGVE+u4PAfeGDNCC3EKP+D1qzQkcUZdpeU31wFdp0IxhchMwryFpa3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 07:20:24.7692
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36211790-570a-484b-3137-08df38b1c369
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4289

Expose HSMP_SDPS_LIMIT as a read/write socket file on both the ACPI
and platform drivers. For a read, set bit 31. For a write, reset bit
31 and store the limit in bits [30:0]. A write accepts any value that
fits in that field. Firmware clamps it to the platform range.

Co-developed-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
---
 Documentation/arch/x86/amd_hsmp.rst   |  2 +
 drivers/platform/x86/amd/hsmp/acpi.c  |  3 ++
 drivers/platform/x86/amd/hsmp/plat.c  |  3 ++
 drivers/platform/x86/amd/hsmp/sysfs.c | 67 +++++++++++++++++++++++++++
 drivers/platform/x86/amd/hsmp/sysfs.h |  4 ++
 5 files changed, 79 insertions(+)

diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
index 44a7da87e5907..1fc4727b48726 100644
--- a/Documentation/arch/x86/amd_hsmp.rst
+++ b/Documentation/arch/x86/amd_hsmp.rst
@@ -117,6 +117,8 @@ write-only when the platform enables only that direction of the message.
 * socket_power: Average package power in mWatts (read only).
 * socket_power_limit: Current socket power limit in mWatts. A write is a
   32-bit value. Firmware clamps it to the platform range.
+* sdps_limit: Read/write SDPS limit in mWatts. A write uses bits [30:0].
+  Firmware clamps it to the platform range.
 * socket_power_limit_max: Maximum socket power limit in mWatts (read only).
 * cclk_boost_limit: Socket boost limit in MHz (write only). Accepted range
   is 100-10000 MHz.
diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 6bbcc2f7e6a30..4c9f6c6843304 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -537,6 +537,8 @@ HSMP_DEV_ATTR(tdelta, HSMP_READ_TDELTA, hsmp_msg_resp32_show, 0444);
 HSMP_DEV_ATTR_RW(socket_power_limit, HSMP_GET_SOCKET_POWER_LIMIT,
 		 HSMP_SET_SOCKET_POWER_LIMIT,
 		 hsmp_socket_power_limit_show, hsmp_socket_power_limit_store, 0644);
+HSMP_DEV_ATTR_RW(sdps_limit, HSMP_SDPS_LIMIT, HSMP_SDPS_LIMIT,
+		 hsmp_sdps_limit_show, hsmp_sdps_limit_store, 0644);
 HSMP_DEV_ATTR_W(cclk_boost_limit, HSMP_SET_BOOST_LIMIT_SOCKET,
 		hsmp_cclk_boost_limit_store, 0200);
 HSMP_DEV_ATTR_RW(apb_disable, HSMP_SET_DF_PSTATE, HSMP_SET_DF_PSTATE,
@@ -568,6 +570,7 @@ static struct attribute *hsmp_dev_attr_list[] = {
 	&hattr_pwr_current_active_freq_limit_source.dattr.attr,
 	&hattr_socket_power_limit_max.dattr.attr,
 	&hattr_socket_power_limit.dattr.attr,
+	&hattr_sdps_limit.dattr.attr,
 	&hattr_socket_power.dattr.attr,
 	&hattr_cclk_boost_limit.dattr.attr,
 	&hattr_tdelta.dattr.attr,
diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
index ba8274e5bfb4a..6f4250cfc1f4a 100644
--- a/drivers/platform/x86/amd/hsmp/plat.c
+++ b/drivers/platform/x86/amd/hsmp/plat.c
@@ -371,6 +371,8 @@ HSMP_DEV_ATTR_RW_X8(socket_power_limit, HSMP_GET_SOCKET_POWER_LIMIT,
 		    HSMP_SET_SOCKET_POWER_LIMIT,
 		    hsmp_socket_power_limit_show,
 		    hsmp_socket_power_limit_store, 0644);
+HSMP_DEV_ATTR_RW_X8(sdps_limit, HSMP_SDPS_LIMIT, HSMP_SDPS_LIMIT,
+		    hsmp_sdps_limit_show, hsmp_sdps_limit_store, 0644);
 HSMP_DEV_ATTR_X8(socket_power, HSMP_GET_SOCKET_POWER, hsmp_msg_resp32_show,
 		 0444);
 HSMP_DEV_ATTR_W_X8(cclk_boost_limit, HSMP_SET_BOOST_LIMIT_SOCKET,
@@ -407,6 +409,7 @@ static struct attribute _name[] = {					       \
 	&hattr_pwr_current_active_freq_limit_source##_sock_ind.dattr.attr,     \
 	&hattr_socket_power_limit_max##_sock_ind.dattr.attr,		       \
 	&hattr_socket_power_limit##_sock_ind.dattr.attr,		       \
+	&hattr_sdps_limit##_sock_ind.dattr.attr,			       \
 	&hattr_socket_power##_sock_ind.dattr.attr,			       \
 	&hattr_cclk_boost_limit##_sock_ind.dattr.attr,		       \
 	&hattr_tdelta##_sock_ind.dattr.attr,				       \
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
index bc1b349468978..01363b0b92fd7 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.c
+++ b/drivers/platform/x86/amd/hsmp/sysfs.c
@@ -629,6 +629,73 @@ ssize_t hsmp_socket_power_limit_store(struct device *dev,
 	return count;
 }
 
+/* SDPS limit show function - reads current SDPS limit */
+ssize_t hsmp_sdps_limit_show(struct device *dev,
+			     struct device_attribute *attr,
+			     char *buf)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_message msg = {};
+	int ret;
+
+	/* Set bit 31 to indicate GET operation for HSMP_SET_GET type messages */
+	msg.msg_id = HSMP_SDPS_LIMIT;
+	msg.sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
+	msg.num_args = 1;
+	msg.response_sz = 1;
+	msg.args[0] = BIT(31);  /* GET operation */
+
+	ret = hsmp_send_message(&msg);
+	if (ret)
+		return ret;
+
+	/* Return current SDPS limit in mWatts (bits [30:0]) */
+	return sysfs_emit(buf, "%lu\n", msg.args[0] & GENMASK(30, 0));
+}
+
+/* SDPS limit store function - sets SDPS limit */
+ssize_t hsmp_sdps_limit_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
+	struct hsmp_message msg = {};
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul(buf, 10, &val);
+	if (ret) {
+		hsmp_err(dev, "sdps_limit", HSMP_ERR_PARSE, "unit=mW");
+		return ret;
+	}
+
+	/*
+	 * The SDPS limit occupies bits [30:0]. Firmware clamps it to the
+	 * platform minimum and maximum, so reject only a field overflow.
+	 */
+	if (val > GENMASK(30, 0)) {
+		hsmp_err(dev, "sdps_limit", HSMP_ERR_RANGE,
+			 "got=%lu valid=0-2147483647 unit=mW", val);
+		return -EINVAL;
+	}
+
+	/* Clear bit 31 for SET operation, set SDPS limit value in bits [30:0] */
+	msg.msg_id = HSMP_SDPS_LIMIT;
+	msg.sock_ind = hsmp_sysfs_sock_ind(dev, hattr);
+	msg.num_args = 1;
+	msg.response_sz = 1;
+	msg.args[0] = val & GENMASK(30, 0);
+
+	ret = hsmp_send_message(&msg);
+	if (ret) {
+		hsmp_err(dev, "sdps_limit", HSMP_ERR_HW,
+			 "val=%lu unit=mW rc=%d", val, ret);
+		return ret;
+	}
+
+	return count;
+}
+
 static ssize_t boost_limit_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 {
 	struct hsmp_cpu_info *cpu_info = NULL;
diff --git a/drivers/platform/x86/amd/hsmp/sysfs.h b/drivers/platform/x86/amd/hsmp/sysfs.h
index aae932079ab70..bf5bac77102d3 100644
--- a/drivers/platform/x86/amd/hsmp/sysfs.h
+++ b/drivers/platform/x86/amd/hsmp/sysfs.h
@@ -106,6 +106,10 @@ ssize_t hsmp_socket_power_limit_show(struct device *dev,
 ssize_t hsmp_socket_power_limit_store(struct device *dev,
 				      struct device_attribute *attr,
 				      const char *buf, size_t count);
+ssize_t hsmp_sdps_limit_show(struct device *dev, struct device_attribute *attr,
+			     char *buf);
+ssize_t hsmp_sdps_limit_store(struct device *dev, struct device_attribute *attr,
+			      const char *buf, size_t count);
 
 void hsmp_create_per_cpu_kobjects(struct device *dev, struct kobject *cpu_parent,
 				  struct hsmp_socket *sock);
-- 
2.34.1

