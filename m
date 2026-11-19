Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795078291;
	b=CzmC5j4t7CWuRXSkAuat9aLkVmPiAQZRi9dWQSd259lmYqnps/YHfIuGdcDDN2wcZO7n
	 IG8tDT7yNGEvCasLVAJQTTYTj6WUzgyIV6if8R1oO3eDuWqBGrMACeH3FNkAa2irCI35w
	 is2WK+lGIPNNu3D6X4C3WwRp0HLxh8btLjZ7K9Ms9Vm9xERM1K0LJITSWg3wQv1bE5DE0
	 u1QqaUclIYKlj2L4T6FCYOlx1oyev8JisyRO1UgrCGofYgs9X6BJzDxUuRq3ETTQ/g2e4
	 TRciykMGHMDtRFWx3KWAbNLjN9aLDi+GdIn9ywZllv5i7PkUQPRcG0Pf6EtZUZOaswA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078291;
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
	bh=wwFgWvBCd5UoANhrK1mL1iLQGDiBege3lW9Tc9FWslw=;
	b=Zads5OX1HJ3e9mC9MqXytWfF5ch9gsJUaqYA7wrvPXlf57gOsWyyrGChzGKely5z2C1M
	 VEmsZhRaFt2Hk72V2kpaQqdnIVTp6s00ldVT37gKQ594IDSqikIFWp1Gki9bRBIVnZT4t
	 93kzt3a+8RAqtvZvdurT8ONjYo1IpkEpvOzmTUDDqr2aAhNlyoCOcbolun0c4hGTY0X78
	 acF8+OrOqZashovpjP0I1MoVaiuaYtoHVDKiSdM8fjt5xVriaHear9+dLq83GZvO0Yh8M
	 3GSFFzV7Av9FSyENQspXhgIarXBJLAK9eb+LnjcJpw8N/6LZfhWWsZbgb5H6guIFD8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=IhtRGrBs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.42
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013042.outbound.protection.outlook.com [40.107.201.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E496606A320
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 08:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E496606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=IhtRGrBs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dl75NiqBDZNVkKJuc0jLKy3SAzGoRQuK2GsKpdyvelI2iHtwL4VKoWq5197ibDhBCr9mKP3AmC3U/9hxcmrGoR3mbnyWWHbQHM4SAimZyPkT0GwNCeyUDa6SPs/sLi2xQ8Pr6chSEeSNtWMOUI/3qAoEuIwZiAMikvNz6b/U7V6mEpkvPcAN+lRamwNHzU7XKOQ/WCOmr4chEuQOQktEx1M2cS3TVvHtl16qTG1vSn4GxsC6ebdO3/LD7KZzS3Z067760zqwr6hy0AJwCEnGjW0f0ywOZLI9zgD2SEeBA2VpmHW0gT6XkADDsvOgoFss9+Agu1eiJOmJNTuZCSiOtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwFgWvBCd5UoANhrK1mL1iLQGDiBege3lW9Tc9FWslw=;
 b=pNQVGVjbsQ7DGZBQ3gHJLsV+1Z7JZY1/rrfWlGNm6+EAy3qJ/e/6jXdbc5sGkFGvd5wAaC7PPgV2ECY9SwjJ1JTAHpDOf+SlyJMuuvqOrvqG0We6Q0FXXvqeVOmIWKjA5cuEzJJ1ssH9mn8vftdHohn8CICYT4MUYpe1bSCLcl8AEEGTWBPATKSg4WNySVS4TxVXUnzrY9fGX4vfKr7WcPr+lqJtorN8T8SnMFkAGKu+bUjTQ4zC5FT2086JPk5/NqY8CeIIR2EjnoO3EyjPMeh3eNsoQB/gr4UZAdKIw54tbGX3w8XJAlMkH967/vV+Yx0kwQg1NYbyyKkR3aWS2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwFgWvBCd5UoANhrK1mL1iLQGDiBege3lW9Tc9FWslw=;
 b=IhtRGrBsTCWVB+SolMMeMxLAv1Kf0bBpqw6k7KpVxy0IeZOT36bwGIi+bZ2uqsjv1C0g/F00rG09UYmA3RPea6mU1bZjvAQ3OMBWxKmhMbYp695LIQFsgkuCryc7iU0ezQGAhQCuHh0ucZgGf+f6tOUONnf2s7IrDuW8rgfB+Rs=
Received: from BN9P223CA0009.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::14)
 by CY1PR12MB9673.namprd12.prod.outlook.com (2603:10b6:930:104::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 19 Nov
 2026 08:51:27 +0000
Received: from MN1PEPF000793FC.namprd05.prod.outlook.com
 (2603:10b6:408:10b:cafe::5c) by BN9P223CA0009.outlook.office365.com
 (2603:10b6:408:10b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Thu,
 19 Nov 2026 08:51:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF000793FC.mail.protection.outlook.com (10.167.249.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 08:51:27 +0000
Received: from trento15c5.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 02:51:24 -0600
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <Muthusamy.Ramalingam@amd.com>,
	<NaveenKrishna.Chatradhi@amd.com>, <Anand.Umarji@amd.com>, Suma Hegde
	<Suma.Hegde@amd.com>
Subject: [PATCH v2 03/11] platform/x86/amd/hsmp: Null-check drvdata in hsmp_is_sock_attr_visible()
Date: Thu, 19 Nov 2026 08:50:37 +0000
Message-ID: <b1c7ccdffbd5753bab0ba31401fd1ad97c5db1bf.1795061419.git.Suma.Hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1795061419.git.Suma.Hegde@amd.com>
References: <cover.1795061419.git.Suma.Hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF000793FC:EE_|CY1PR12MB9673:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fbad81d-e491-426d-235c-08df461a4c5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xuCpBL7BKgVN7Js1ElYXRC4GvL/1JibQPo7OyU3eE9BS67WqTZfI0ReuQ/oymfUoEthYh5GNUHmYRiFa7axielTxSxD17FJdMJdY7usq0D8/u2QiR0WMcPN+2iHSeFcx4zfwOZk002vLrTLz0SFllfW4dc6V0/7huLMZK+Yo6N/7OIjrJOG/QxabvytsSRd5mbF7gWDw/UR294mtsQaOp/xUbAoG4SRNL4uMKhNV+qLrrpo9b9dDE98C3LpLN+p7Mm3fi0LYAK0SvbH9YogSn3hTyO1miWvupRT3l0UhUp97jwMpXeiCDS54A1aecModh8KTAsnN8LfRqeT/5SXVQhpaUosYQNqcTrDkiLuMISb1LOer3LB8qXD1FNYORTBOJ8lhWvHHM7GNTojsRY8WO2ylsExIYbJc3KmvnnOIpwsTiG+E4YGQ4vVHpUXVHCwlvWM/lYagHV92ALhO+7DDTtQkEddm3UBsiEw4M71EgBayqigrUSYBZAkWmnW0mgq4GcvPRFY35E6vDRuNgWSNcr5LuNZSop37BZFXTNvNwUT62BrIzcfRlE1XhuDCg/6JhGjJZ5Q+FQX96EbUWGrPY87WEoSemDHFBsuVEnku5YkPmPTypjC+YQvkbW7ZqGTbSRMDOh7DvwnBqQVrLsf8AHDrSuytXjzJA2JNYQWsHp0GcBjnSYGt8b3ckvOBVrPtaVERXhrJVRDSSiCMty6tcw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4FL1trKj4F7UWKJkqu339pg9jAgScgvMtpP8+Mnd1rsnt0gnGvnTyhwD6RJKYb1jIOQpapZtwGh4k4oR4z3N2zrsHbtA1K3zEjStP4SfFizre7WqpmtGZfc4FWtErMBqB6WW9naMBYuCtplK6F2D4oZyssm1j5jCLZ1ysdrk37SzYhHXDzd2mm+zDdM/6l78cNoGFk8/5phOWVKCq+aGesRiA6SMgGqqR2iuXHXytI/gXRgLKpYWqKSZk4wq8qN/9OkSpzz8C+n9OFxu7CIaMVCuxKJX9zOxft2dyIbU2o/PiSX+BTvkNwhD6S8IAEAMcyvhJh3YSfq1YrgZvKx1ECNpTR3B0h52yPJzxFIpUBp0lwpvznteA/uV2Kg2pqOGXNTyrtcBBp7RVKCMK+WHQcYajBS+Ji8NHDnfxz4WgiuuptB6MSFakyIrqK8Rh8lJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 08:51:27.3629
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fbad81d-e491-426d-235c-08df461a4c5c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF000793FC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9673

From: Suma Hegde <Suma.Hegde@amd.com>

dev_get_drvdata() is not expected to return NULL when this visibility
callback runs: the driver core evaluates it from really_probe() via
device_add_groups() after probe has set the socket pointer. Check for
NULL anyway before reading sock->proto_ver.

Co-developed-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <Muthusamy.Ramalingam@amd.com>
Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
---

Changes since v1:
- Align the commit message with the defensive null-check comment:
  note that drvdata is not expected to be NULL when the visibility
  callback runs from really_probe()/device_add_groups(), but still
  check it.
- Assign sock from dev_get_drvdata() next to the null check
  instead of in the declaration as per review comment.

 drivers/platform/x86/amd/hsmp/acpi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 44db76308ceb9..223dece3b91e0 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -303,7 +303,16 @@ static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
 	 * Hide metrics_bin on client platforms.
 	 */
 	struct device *dev = kobj_to_dev(kobj);
-	struct hsmp_socket *sock = dev_get_drvdata(dev);
+	struct hsmp_socket *sock;
+
+	/*
+	 * Defensive only: the driver core evaluates this callback from
+	 * really_probe() via device_add_groups(), after probe has already
+	 * set the driver data, so sock is never NULL here in practice.
+	 */
+	sock = dev_get_drvdata(dev);
+	if (!sock)
+		return 0;
 
 	if (!is_client_platform() && sock->proto_ver >= HSMP_PROTO_VER6)
 		return battr->attr.mode;
-- 
2.34.1

