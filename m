Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2064.outbound.protection.outlook.com [40.107.101.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79ABB14885D
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jul 2024 07:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720683238; cv=fail; b=GfhMIZ56AkYVPHJ4Jv5WwBrCOXrZ2dN3fXgMSMnIIkreBZxaYJDVm89EGBWA6RyZKa6X+Lw8RzrPimPz/r+G7GFvP48bSf9nZJ0qPxNRwZl9O7i9gJcOJh8sz29VqAQwU5CHKik8i6Th5ArSh/C84r++FZyfbYPGKPXtULYRKy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720683238; c=relaxed/simple;
	bh=rgvmTjynZUVYpieE+S0kMs9vswDQ0oxP2s8YDgXRS2s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FeMHn+gpb7PaQETNHwX6W2Y1Hgw86Tl5T6OoPF5kTgqSWfnjtIbiIwHVtNEIushYlRcB8F6eIoguHDQD9DEHi/zUem+qoYLl08WH5/cjJf4UECkwf82weP1l3EJyoFoDDQ9ZUkS581Ki3Af7YcD4yi/kyh7dYJ/CAAI6OgWiZt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=H5vq4l4k; arc=fail smtp.client-ip=40.107.101.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="H5vq4l4k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D7KQ2q98BYrQmD4D1BFwVgFdJvVPodq2+1+F9DBer5pTnCHS2zXiY2IjcyNqXzL9S9D1Zy8FyFSYPJxuFf3JlToRuWvIrJzQ/YPjKYWFkVX4z/MpFmP332YoRVBtQiKkqvfHYJOf3q09o/hExQbgFiLppjO4FKZEUhl4KLnh3F4aDni6ppJCjEH+nPqeATN9F73t1ImPBrnsG6VR6NwKRtL7lA70CyZFpc7wz0F+VqgsIWeUR8pR/6Uz0xRDOzi2FYzkVEdlWzNTrUaaDhAEx25Ys2CzKq0kpZYbbLCpp8RVaBaI2zXdIY/k9UDOeSNLvasqTurh+wgGQ9Ait6UabA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hh55p/XrBwtfFVMDSwZHluJmIzVE3fGq6/tGtboTBFw=;
 b=wcZdqw9mN4u/XCrskP4iUYYjZ3THT5YmKyd+qaykNDnMJHaCyfqFl8/DT/X2a/LU0LdlJFh30vtax3AYVY+dEHU857/eTfqRoHNkuLRiomEwbtU9JvFvYvrPj1/Nr7mpE2NQpvcGqIE9nDZIlStBVVg8+2Z8mLGjl4YRsFgPhJUhF8JpkbR0R6wf9aBxAEc83ZSALCH9E8oeYLi2jsvhKVVCZbOeNDu+N9w2pKClz3JzkzN2TA4R6b69s5MXNJiKpKcF0gMFIqkKJaoK45VyiNpzBqgizh4MSk4fMeLvcRnqRzzZXtF7+olFE+97s0E1NgwwhPiwFDGd6vKTSSusOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hh55p/XrBwtfFVMDSwZHluJmIzVE3fGq6/tGtboTBFw=;
 b=H5vq4l4kZswkr02X0eDVbeIHnGcwDSLrCJ6RCiIPYB4FAz4ElvNyzzynmk4WVmHZDLyY7OUZZJecki2CZ49IyZfiZ7Px99PuV8FsKZ0h6bGHateQmrpbu0bBQCrlCm+0yxlR70wgvC0fH+AMadotFvT4bfwQtKpwAHQ+ARntfjc=
Received: from BLAPR03CA0127.namprd03.prod.outlook.com (2603:10b6:208:32e::12)
 by SJ1PR12MB6195.namprd12.prod.outlook.com (2603:10b6:a03:457::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 07:33:51 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:32e:cafe::14) by BLAPR03CA0127.outlook.office365.com
 (2603:10b6:208:32e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20 via Frontend
 Transport; Thu, 11 Jul 2024 07:33:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Thu, 11 Jul 2024 07:33:50 +0000
Received: from amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 11 Jul
 2024 02:33:48 -0500
From: Suma Hegde <suma.hegde@amd.com>
To: <platform-driver-x86@vger.kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <hdegoede@redhat.com>, Suma Hegde
	<suma.hegde@amd.com>, Naveen Krishna Chatradhi
	<naveenkrishna.chatradhi@amd.com>
Subject: [v2 08/11] platform/x86/amd/hsmp: Use name space while exporting module symbols
Date: Thu, 11 Jul 2024 07:33:11 +0000
Message-ID: <20240711073314.2704871-8-suma.hegde@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240711073314.2704871-1-suma.hegde@amd.com>
References: <20240711073314.2704871-1-suma.hegde@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|SJ1PR12MB6195:EE_
X-MS-Office365-Filtering-Correlation-Id: 4be1c061-cf56-4be8-4229-08dca17bcf41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YGjKn6hLcQ2AC9LwzdnK+qIP57kZAuu1sM87bVka6w5Gy+7+FL5oDtRvuuOr?=
 =?us-ascii?Q?hOxfiFSpJe0SfmcOYolLjBHdnHmKSLLP6bLMMxrQiDyUkh/sOgp7S/eu5l3x?=
 =?us-ascii?Q?Iz/uJCxfhY6zgcxT5Lr/B2ZrstZl7fO2fNH6FFtOt5LSfBkgb5OUMilzIgQ5?=
 =?us-ascii?Q?OeL468ygktof4iOBAHNFvRgScUkl6pL5bE0yflX7POeuSWme2TZtTBX5iEzw?=
 =?us-ascii?Q?BPEnDJ/BKVZCWbCW62nNorkdELQsG0K7Go8o03fNGCLuTR4t60ATkvj5fuHP?=
 =?us-ascii?Q?FYZ4lKDcO0KUG1fsAtDLpcFci9QG6C7c7bThWKHc00O4O5rHXinsbRtYc/eQ?=
 =?us-ascii?Q?1jFJG9KADI3ccWW1C8mOrpZLajpf/5wMhTiiDmVktAlUUIEeFiAXQMi7MuGC?=
 =?us-ascii?Q?VwbptRMlagGygMDfI1bAwCo7ie/x4mOONUCXqNC8+SR38XLdDtz434TV0GBd?=
 =?us-ascii?Q?Xaj+3Fc9HWbLMa2aDCZuFRgNNRg3U1rBj2Ebhl+btiyMvTUuqLt7yopkWu5w?=
 =?us-ascii?Q?w5broFcqOykfakLfc5wkuhk8GCLxoiUSYhswKQ2dSA3ZqHUVnz31SHoMo3gd?=
 =?us-ascii?Q?sPvW0OrfzSOEFKadGAPMsDA15l7FaOf/LPLphJD/+StS8Pu31VWUhq2R2iN2?=
 =?us-ascii?Q?Uu5yAg5j4Xg7pC6wO1bLPdLcw4FPUTI+EpItGfqap5YG/Dk8SrRghyNn8Wlt?=
 =?us-ascii?Q?7ooM8vPKCM46Mof2N8n6+07vEpBk/wNkfRT5uzznW+j6nrSX+CXY3nSzIcjj?=
 =?us-ascii?Q?7x2vfXNF9rWSzeGYp27FjePX3gJqrfa7oaCpx0aJF5HpjhLu6pUlh9FICy8J?=
 =?us-ascii?Q?/X2YfzEVPqKi75jPDHFJAVoOF8QC8Zz4G/BiRtrtXTJO5bu7tMuGBjNL+57f?=
 =?us-ascii?Q?NfW3OgKUERdGXQqioXeq8bOxFr4/TtF2DN8Qi6ctM+axppGlK1ZyMrwqnwUP?=
 =?us-ascii?Q?y8O85lbLA6S4ZEG5tsqeZMm4uDwx8f0QPMg+QePH9TqgtTO//glJIzIYlySk?=
 =?us-ascii?Q?kSBnNLKzVOERNlnh1UISOBXhode+IU4qVtAieordF88VE76L+fGf030WM9Jg?=
 =?us-ascii?Q?9l6GDELVgN9EHvXI3be3tNx4GqxyZ9H+AJv73W25YS/N4xWxM5SU9SLUJ2Uh?=
 =?us-ascii?Q?y3KzVMkq8P6oUEjRd8YE7ht1GXWCLAEuuYvLON80V8AndlmBBtopKOsGPbFo?=
 =?us-ascii?Q?UnXwenFeunsvVGuzeC5JPwZR6Kz7+m8d4dzSeWrP3Txhd/B62sW9mF7gVrz5?=
 =?us-ascii?Q?4VKzS+t8wMhbvjUqcF0ascAXnmlxp+Tx2u9JIEBzl3q9Mr+y01ZY0ShCo3UB?=
 =?us-ascii?Q?UnnwRBo57SVDI3h7KtOpR/oKg1HuaER0iK37esb9NwQzlTiAHEJuBUxhKTIR?=
 =?us-ascii?Q?1RGvSriQtefhhmPEKyOMiPH40Fm2tOB3VAcm4Dtwp311m11/q6caOe+viZom?=
 =?us-ascii?Q?kgbLWWpV/Fh83ZSYx3UobBQwDve/BFUo?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 07:33:50.9196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4be1c061-cf56-4be8-4229-08dca17bcf41
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6195

hsmp_send_message() is exported with AMD_HSMP name space.
The other modules who would like to use this symbol,
need to import AMD_HSMP namespace using MODULE_IMPORT_NS()
to get away with warning.

Signed-off-by: Suma Hegde <suma.hegde@amd.com>
Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
---
Changes since v1:
None

 drivers/platform/x86/amd/hsmp/hsmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
index 759ec1d4d60d..119a1f8895ca 100644
--- a/drivers/platform/x86/amd/hsmp/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp/hsmp.c
@@ -186,7 +186,7 @@ int hsmp_send_message(struct hsmp_message *msg)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(hsmp_send_message);
+EXPORT_SYMBOL_NS_GPL(hsmp_send_message, AMD_HSMP);
 
 int hsmp_test(u16 sock_ind, u32 value)
 {
-- 
2.25.1

