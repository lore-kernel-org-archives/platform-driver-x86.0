Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010031.outbound.protection.outlook.com [52.101.201.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4C83B4E88;
	Sun, 17 May 2026 15:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779030770; cv=fail; b=mKjRKahLRKknq2KPlzAcuOdvRd1OR3VcdCKyPjbdepiUVhH2QPXfmMzzrykgBmwcJBlQeHSb5/tJEKQM+9bWvXi8VkYqJhs6nNu8Zt8zDKrK0WwglXUbKuMtVHd9enU2ZlzrTvPfYnG3yinniovLa/4UIcXlj4pVMFRYfm+cLN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779030770; c=relaxed/simple;
	bh=fbGja9l4xpwETjLM9ssSev+PJj+kDQspG8QFmx7uPvc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KOu9cWplKbLQzwlFMFSDWX7j0Mkzsq2/CIt88I3vXqwoIIpC8723tuLJyfimH6xqeIE9odZEbeEKj1jfMB/H56N8SK8RW/wAIISZvxkOlSHmXK3oP8Eo1LYcsjVBv/X3GsbAp310eaiPpkAuRhWWZrw1J2ZyOPHTKmLHB+yWG7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bBJ06lNL; arc=fail smtp.client-ip=52.101.201.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bBJ06lNL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RtzBMmH6tDA7Qo5yvdyhuO1ICdgtLtTvR9OzUkEXkDr6LB103PtT+hJKFX2WVvXcDgGTb9jzVX0bzL09IbFpg8hPrH2qJRcfG36ha7/NzBeHl2vv9wQCuaC42gj8T7obZQoXVkd7adPo+IF4zGnwLcEZ2uludgMskRV2tHnDFNsCh6JAPgiiFLq+eFa+Hh1BJi1biW5tjI7lJjAuoYYvWh7xs8Gft7VnBW9ass8sV6WRk+folrhHOlrKsVzxAGeXAH9OWeWMtLG/x/m2HD5TVYO290zY2c1JPMhDOotc8bodnbN9PgpyMJOVQf+pK5fwFP5gENJbB1VmJtWd91ahFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mhst37EG5Yd/6D3gSVvZzMNi668AXSGlV4lzE9d4ZM0=;
 b=n6cRFHBmC9B+EB58bjbgiEriDPpdEEBURNMRYiMAP2RMEyFeR3eTibSe9KdakwlwmzXoEC5kDCDpX9FU9Hf4wksTqZhbCID1HzHJkW9OnuEGhV2ejxvb8d4Hzg0Oj0w17BMVur2YWp/AWyjz1BF3rhkoykYx9Ghf30j8FzBMJPIL4OCEhNga876Si+giyo8/ltEa9RIUckt2QYjwapfw7q2O0aZm4t7g/MH+xdNfIq0AoAD8/b2rcyqLV5And0X84/xlBIDK/IAEw8136d15e+EJkChmOWddcqL/Av2UDujzwVX8gGyeKKLi3uLwXnmXxzBidoOCy8X/RxwSTZAyYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhst37EG5Yd/6D3gSVvZzMNi668AXSGlV4lzE9d4ZM0=;
 b=bBJ06lNLngTsLUEQszmcoxU70akSVGBlT8B2POn+nUjX4BU0JxoIXzEj5LOM2S7fdMrnPzGnlinDh6rkJ+NQ6IpD0GgbDp7dMNyK4ZNGsQMVgYOsJ28npDj9TZmgJ5c65BApOLNr/ilWBgo4IEJkvJqgB7IhIGjoU7aXLifttss=
Received: from SJ0PR13CA0028.namprd13.prod.outlook.com (2603:10b6:a03:2c0::33)
 by SA3PR12MB9226.namprd12.prod.outlook.com (2603:10b6:806:396::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.19; Sun, 17 May
 2026 15:12:44 +0000
Received: from CO1PEPF000075EE.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::69) by SJ0PR13CA0028.outlook.office365.com
 (2603:10b6:a03:2c0::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.13 via Frontend Transport; Sun, 17
 May 2026 15:12:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075EE.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Sun, 17 May 2026 15:12:43 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 17 May
 2026 10:12:41 -0500
From: Muralidhara M K <muralidhara.mk@amd.com>
To: <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Muralidhara M K <muralidhara.mk@amd.com>, Suma Hegde <suma.hegde@amd.com>,
	Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Subject: [PATCH v3 3/7] platform/x86/amd/hsmp: Unify response_sz validation to an upper-bound check
Date: Sun, 17 May 2026 20:42:07 +0530
Message-ID: <20260517151211.415627-4-muralidhara.mk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260517151211.415627-1-muralidhara.mk@amd.com>
References: <20260517151211.415627-1-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EE:EE_|SA3PR12MB9226:EE_
X-MS-Office365-Filtering-Correlation-Id: 1672178e-f9d6-4c89-1d0d-08deb426bedf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|11063799003|22082099003|56012099003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	C0NTJlnrMCn57Idgm7GwNEWf+DNGUhb2jZTYv7VwSg32nztiEotgLY+7UYUyTkAbrUGlvPXYOkBUgaU3nLe9DdUGUMdeWzT3RG5FR45pjLraFO/yXgC1BOjr/LggkjblFqtTvo3NUA/zjTs9+4JC3mhs+A+1rHymWb20RmSSvSLsf8CIi4sJgYPvav44kZX7/7ctqsIXVvJVAtXm6c5Fkd8sfpBXeO6zmxGSzln0uJyjGTUvVuyX38kj5JXD/KLrtlwt9NAosZU0ha3+bUNyxLOiilT+NPvm0oLpITyeal7/yY+mD9l6oVY1lpPtA15RSyj+H2DH+Er2n+rRde90OWi07kB6qfAquzCTIHvKONNq50y1974SkibIINt+FN/Dw/sdV3hvi2sS/BteMBCWx1Clp6iNjZGHRpi3DXUGWlpliplBuZ+bzK2o+edZqL9OQMN5IR3QNH/m6QLp6Tl4dxf6urLMQldir4JLD1pg/QySiroJOWV0D0eSsQkPKHkmG5Sn7fpD1hiZnOJrddbLY+lj7vT7T+kmYFjqsev6jqQFHo4vRNRznBGKgUa7Sg6SyVpo7JIN+/+l7UDBVKbnbzIplSTgfR6J85O/5wYZQN61JLB3OQCWBm6o1rpraX0QbDMCUMN3DAnIDM0z/jT5E2U3UJWHY54KKp0XJq5D+ScfNxA1mDFSi76vVyce6JyR2wXzLdnQHzBr68j/wbAtzsY2rwIrNOuTKvRTqtsz3Os=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(11063799003)(22082099003)(56012099003)(18002099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	I3uLLblJ6RiVBlfRvHD6OOWHlm0v6FWmCQeoTDEaS0lDGHFbGg+JGk1SoaHhXH887Z1dsiqJer1Y/u4nV3MXyKE5nR8op8i6VbL3vHs0+doaL5mQ7sNaeMM6m3KRljjnewncW+UX5MOpauVNKo9jU7qjSL/e+Z85UrOeFe/UNK6m1UXzyj8ZYIsUSaq3yXPoMACNx0yE24vCreT+6RIFqMnsUyhxdmapwvBTltRV0Gi5ThZBawLc9VPz0JYNfSTmyHAZjbrs0+7Q3eCZZS9jo9KkaDeqGUNx3A8gOqLnOZdv94Onmfuv9gyNfzNHbzoTCq8mxH73YsjG2WnfIy1/vi6gQtWxkvsCs4T6hY3DkvnwkkPdwarM2y6jnKz+2widzYMA4KwTxK0rWKoodvOOKZYfxVM4tQuSnscVFJ0aOSZSab5v1qrS6urEFzsttNxw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2026 15:12:43.5898
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1672178e-f9d6-4c89-1d0d-08deb426bedf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9226

The original validate_message() enforced a strict equality check
(response_sz != table.response_sz) for HSMP_SET and HSMP_GET messages,
while only HSMP_SET_GET messages used a relaxed upper-bound check.

As HSMP protocol versions increase, existing message IDs may gain
additional response arguments on newer platforms.  The strict equality
check rejects older userspace callers that were compiled against an
earlier hsmp_msg_desc_table[] and request fewer response words than the
current table defines, breaking backward compatibility unnecessarily.

Replace the per-type branching with a single upper-bound check for all
message types.  This allows older userspace to request fewer response
words while still rejecting any request that exceeds the hardware
capability defined in the descriptor table.

Reviewed-by: Suma Hegde <suma.hegde@amd.com>
Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
---
Changes:
v1->v2: New
v2->v3: None

 drivers/platform/x86/amd/hsmp/hsmp.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 631ffc0978d1..9bad58fef304 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -182,20 +182,15 @@ static int validate_message(struct hsmp_message *msg)
 		return -EINVAL;
 
 	/*
-	 * Some older HSMP SET messages are updated to add GET in the same message.
-	 * In these messages, GET returns the current value and SET also returns
-	 * the successfully set value. To support this GET and SET in same message
-	 * while maintaining backward compatibility for the HSMP users,
-	 * hsmp_msg_desc_table[] indicates only maximum allowed response_sz.
+	 * As the HSMP protocol evolves, newer platforms may define more
+	 * response arguments for existing messages.  Use an upper-bound
+	 * check so that older userspace callers requesting fewer response
+	 * words than what the current hsmp_msg_desc_table[] defines are
+	 * still accepted, while rejecting requests that exceed the
+	 * hardware capability.
 	 */
-	if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_SET_GET) {
-		if (msg->response_sz > hsmp_msg_desc_table[msg->msg_id].response_sz)
-			return -EINVAL;
-	} else {
-		/* only HSMP_SET or HSMP_GET messages go through this strict check */
-		if (msg->response_sz != hsmp_msg_desc_table[msg->msg_id].response_sz)
-			return -EINVAL;
-	}
+	if (msg->response_sz > hsmp_msg_desc_table[msg->msg_id].response_sz)
+		return -EINVAL;
 	return 0;
 }
 
-- 
2.34.1

