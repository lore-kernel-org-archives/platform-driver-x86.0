Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795219699;
	b=VJyIVv/gK/zp71a7s1yakAy7FVeAeGcuB8/p+zAWIIuPgzcRgL6Hw2l4gk0HHY4F1JQ6
	 mNbWOeATlSguyDqRq48LTqk0MpgmE1bfyEdMn6S4L4n6MHdvRq6OzNYoVXL4J30mwyhfb
	 szcyHksqnKQydeGn/1qsRCMAyNQQJaUe8QwIQ0e+DDd3hErvIKp427G/GHqpbIc5RAv0i
	 RIwVGoUr0KV/U030HTA0/GR4BQyDsxssv+ccRBIE1JDFpbYzDt6Yv6xerHIJG4w8S+McJ
	 kzXutNQw4jbrinj0oNaG1Z5R1Xm/iZ8MTM+mjTLlUfOGlUtc8lFc+mmMtlBCTDlwC2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219699;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=gKk3vascc4jdNCvvWbqVBIkQ08kqYvqbC+GRr0Gldno=;
	b=BbYEvoPI19S84p9WxqNeNlvGYWC9kBFsDHj92EhjMei6QJlgaUvUnUDUxsrkxp8H8/ch
	 8fHejII7Yb6CdFU4QvkDZmPEVy6EncXbrPRk34lbCw3poNPyj+RgKSC2GDfpKoI56Y369
	 9nml7vhhQ94CK5iZ764fdrmC3TW4AzRo/x6HTK0GOcqLknapoFDclbUfCi+HhZttwvuNL
	 2e8fLjthkuX4Zjj87TyqpTy1Q9oX58GogNp3Jy0Djcg71w/IRfwdt2Z8xZY3+w/GB5jwZ
	 Xz+qwRDvML+gAWV3h6aX5LVaHn3mnloKWaTqCgs4tS5mO34AiqR8SFkv9up9ZspJ0pw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=uYOb92IN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.34
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010034.outbound.protection.outlook.com [52.101.61.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92A3606A336;
	Sat, 21 Nov 2026 00:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A92A3606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=uYOb92IN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f/R2Rh8fGm3U+rfv8uxa6C1oixJzXSSna5zuZp/iCULpcvPUvPj6I9hOMsMROIme7iBzsiHH6UITbrX7MbtxL539i3WPMHX4qfgZvNSOqWcV0h6EQeoQ5VV4c/qv6jnQ91RbYgmYC++CWVXzRMq+tC71/I4BY+TZbUaSklab/j7BIKVNUmmMtRU/3ampWZ3BuXqulfh1Hhey9QWREF6f1aaQ2TuqrK+yWizhsazY6BKAW6Eju7m0E9udPutAton7c1JXryeWh+z1y9XeZY8jFC48ePo/mz0/AGE9tVOCqXA/P0t0oYLInzjCZE6lUYkOPIoopBJo5pRGKlfpUO3hdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKk3vascc4jdNCvvWbqVBIkQ08kqYvqbC+GRr0Gldno=;
 b=Qa/vWC8Lt7sSEyc+Ni2E7ECZaNTb95ITQerrXVzFBgJQ7DwIoaI9kED1PkGvotqnbgrnnpS+OlRLMCyLPKDdAfZCJ5LPrp4rRLheiylIVWHv/zOko1ezRKt5vhYb7zHLfQnWRZfjajjmwXvB31P4R+9mtZojyR6rC3SYuzyQhga8YpomJRJTfWtXq/EY2Y+b8G8G7ihMyze17Pg6MPTd8tdXwn1VhjYQmCUtJrrqcVHI7aVABz1xcKOjp18G+E6kxT7IrepCV11C/QGJptZgjnb35t7dtxBs27csZqBbAK1qC3WTSehDHjEvZ28hLO/CAMVjZybW/G+LbUPtSRIqVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKk3vascc4jdNCvvWbqVBIkQ08kqYvqbC+GRr0Gldno=;
 b=uYOb92INmK0i5wC6d13FWOPp9t3qb2zilX4fcO42oRE+v0LeK4ydh+Ztg0zXnqga8vNsExAry9yN0T1IJT+XWEEZL2D/6XC+z2HwJc6FGf/s6o7Be4bKSm6OgCooBS0JaQ+hNhWVrRPTX/wAHQkVuGdjgf+eUmTC1exy+Z8CgBo1AW+EOGnj1FozbpfAOtLS3Coyl8wzyl9VwDIsVnEoicTqfM/V0yCVILwddMBLmu76T1ne5iq8fkUda6v1Hr4Xj5lRZgwQFv1smtVvwv062fQW8oMZL5vc8CjGQZcfboTEoIJBtN33k9kAoQNd05L3H1CfgKRuKDU/vpHOca1Ybg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 by SA0PR12MB4446.namprd12.prod.outlook.com (2603:10b6:806:71::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Sat, 21 Nov
 2026 00:07:43 +0000
Received: from MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854]) by MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854%5]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 00:07:43 +0000
From: Brian Mak <bmak@nvidia.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Kurt Borja <kuurtb@gmail.com>,
	Stuart Hayes <stuart.w.hayes@gmail.com>,
	Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Lyndon Sanche <lsanche@lyndeno.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Prasanth Ksr <prasanth.ksr@dell.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Brian Mak <bmak@nvidia.com>
Subject: [PATCH 1/8] platform/x86: dell: Make uart-backlight x86 only
Date: Fri, 20 Nov 2026 16:05:47 -0800
Message-ID: <20261121000556.173028-2-bmak@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121000556.173028-1-bmak@nvidia.com>
References: <20261121000556.173028-1-bmak@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0058.namprd04.prod.outlook.com
 (2603:10b6:303:6a::33) To MN0PR12MB5786.namprd12.prod.outlook.com
 (2603:10b6:208:375::13)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5786:EE_|SA0PR12MB4446:EE_
X-MS-Office365-Filtering-Correlation-Id: 94038e55-33c6-4717-27c2-08df4763769e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|18002099003|22082099003|261009223027099003|261021121427099003|11063799006|56012099006|261028144727099003|261026140227099003|261021123027099003|261022105027099003|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	q1K3ZyrAQvQFIVUnWghQFdkgTs+Ep5numhxzboOlkgF+OR2fupJcFIacFpDLUP8WQFHTbkjHBlwXaVkwtiHECsvC7ED+SaLcizuLHAx42UgOvzpdAQUAZOhxus4ZfJyzY3hBV+xvYhn6SaDd5o5qnPCSyk5pYGw74cy8BMZ9wMbFn4z3qZvV6hYTve4QXZ1VYmzTHqGB0+8Wk83iL6twv8cktvjqRt7o2b4wg71T2og40p0lvGla3f+u4Miw68MH68+b7PxseJkbmqt0JBtak3T+OZtDejYjJfC0taacI62KdY1YaVrsf26png6C33EWthVqzFYdxF45R4BoAtYIUPHC27gg7BQwsui3SWlUGr0TCt1sWvy8zcOcJW+llICuWaauqy/wQpZUHe4lyK5C3M8OiIui/nnnb6lfJ0MzkpEre71wBMYrEGTc8jM5YnYWc5NOtueU+7KdZJlIzthFKOwILm797Y95GV66EIkYOxfz5Blzi5Tkfj3Jmpa6jCegiIKKGb88c5HXJsei1Zbo8C1HjlSV0Rm1vlPgIo6wsnFO/dPOJP10bcNnFWMdt1V3CgH7QrwZP4ic/yvJxae8PTx9Ni8t9r7z7cnSQUKtFKuAnlX4vBi9vFy6HmsiUXTJQt/FB444AqUPW5Gmwb0CxAfAttIndQGpofayLwIRY64=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5786.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(18002099003)(22082099003)(261009223027099003)(261021121427099003)(11063799006)(56012099006)(261028144727099003)(261026140227099003)(261021123027099003)(261022105027099003)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nfBRlvUxlpfGmPZzcFNG+Tac/u9Z0AQ75GffQBm7GBNHVuki6rNOo+X/Vw3L?=
 =?us-ascii?Q?uAiNg022wQgYdJIOCg57ppT/fyMRczMuJg6281MhmNaaYec5Jm2tKbEK4n/8?=
 =?us-ascii?Q?UkYT1E7p0//5qJWUDlEjG5RbYPO+OfgH9GhAgnVTj0rGeTor3AUKykB4KA00?=
 =?us-ascii?Q?aCH46tbRlptDpLUCrEY9E6Y9sPNiR4UNWB1vBxTbNcOniB7bE5GlYfkCNVaL?=
 =?us-ascii?Q?bE4zqAQzPQNIF6Go/iCZD1hzFxEQvC3nezl2vNclxykV59MqktRGkQWQpbZC?=
 =?us-ascii?Q?0giHuH4r+YV553ZPdXW9ETYadeqwGsmnlVUzNCYZyhD+0pI5/hSRTGFJUiNR?=
 =?us-ascii?Q?4mlarAKokq8qE4rbTsGVPvOaPH44Gp911HmjlXqU/U7g0auepkyfBRVbo/dz?=
 =?us-ascii?Q?mGAO5dSA1WTub+zpWLyZb7g1k3HmpJIM0IzzvLWSyFp7ZmeACgp7MiusAMW+?=
 =?us-ascii?Q?M3PRlhIF0b2ypRasyJvGDV7QIhv9dzps7/bIf8jsCyeaLVA+QH14Wc7byFtk?=
 =?us-ascii?Q?6BWdPdpW4gXQ7NFkyqvrhganUkAqaAlULzYgWcbyHb8cIXYlzh50aaSlYWfp?=
 =?us-ascii?Q?k6gZiWc/NKCuTcVbjt7cWsTSFjc4dF5bR8kDOA7iiqxhzs9L5AFKW7PWZEW4?=
 =?us-ascii?Q?ZqySPzbqm8BeGxrYeaJp7VVYVPkJLLfl4J36naOiECu/fba2XO7hVTqBjUKF?=
 =?us-ascii?Q?tJ3SCE6xXZZwnk8JiBK6U/LRbbahSEBh+LsWb75wzg7Czr4EkSj+dWS0BMjU?=
 =?us-ascii?Q?KEY6U60+8XVHMbBhYwkeMSLH38wTfOdFTStqODcSQ2RgPPrjE9PW99n0QM+e?=
 =?us-ascii?Q?ZGMJXgh2wPHDhAGZ3kbVXG5LR9X2BLISTnYzKOg7swWEIVoxhu+skqBFKk2O?=
 =?us-ascii?Q?5q7AwWEiupSWER6KsgHtuWiXe0veQIxwHB7e7MASX4Kot9hOplL6mvbHfofp?=
 =?us-ascii?Q?2Pp8BByJyLCXlLFvF2Ljo8HVryJgoYIwlP1iBR9OZtRcBExo+1vpHXwS6aqL?=
 =?us-ascii?Q?dzftVlC4hcRFHPscM+KS9/LkRDqHAbeCP4CU/M4VdFu76adfsQjRWbOfOcGe?=
 =?us-ascii?Q?T8WG4PTi+08MI96CIz9eVL8z001P7ZQlRkvbeXYt3scBmoGk6p38NRI+mOli?=
 =?us-ascii?Q?H4ZMhIF8fGIl5/XEzt6ZtzkxRKwga7u27wPVMwRoShe4FE6jXhqGa6HH8RjD?=
 =?us-ascii?Q?AXHJkp+UfDQfxiRl9aDA28rnwX+svPpzJyIAXZ/zpdbhFBC3q3R7D+tTeebt?=
 =?us-ascii?Q?WZWqQHPtTDlXOWn2E6Bvlpk4q/xQF7lsACto1DC3bPmESj82b/jZHYJorbnL?=
 =?us-ascii?Q?OSe/v7SLvBXVzxsSv+6LSpjiA+88+oCklnl0wIevD4/O43Tn62h+Gach3gz/?=
 =?us-ascii?Q?KvAqJ+3EeJ+qtcA6oUE3+LlQnoxHo1lmTqxah14zR1519kF73OUl9zgnhYVC?=
 =?us-ascii?Q?HUBzcRp0b3HNruNtuAINqt+rQl5u2QW2kfKiD7sMsCV9hvT5eIisLlkqzIhv?=
 =?us-ascii?Q?t5anE1jjQz470p+14g1781u5VrkdkjJzaHECGFvgZu82nfmUeu3cYadza/2y?=
 =?us-ascii?Q?Z80thRs5vVQ8bD6EzTPWhXg89Zc5oPMg9q8Kw5n4ZneueyPGxdxxxjvTjqH2?=
 =?us-ascii?Q?y7HmzOwa/uARGJsA2fCmM+DVq2H/sw0B+F50S7N0SaYJS6bSpRUvTpBunnd1?=
 =?us-ascii?Q?bzuSx8bZgxKYsdNi1jCa79LuuHmM7Tdpw2oM0UiFq6cAYr8ClrMNiod5Je6v?=
 =?us-ascii?Q?N3jYz9EhMg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94038e55-33c6-4717-27c2-08df4763769e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5786.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 00:07:43.1590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1TR4ZvkOzSahhU8dUtjxieolKTLtcL5H+ZoV5R9R/G5BJZdEPXp4tcRQw9csthvX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4446

Make dell-uart-backlight x86 only, as it uses some x86 helpers.

Signed-off-by: Brian Mak <bmak@nvidia.com>
---
 drivers/platform/x86/dell/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
index 9f0016056d7e..4c28d4c008fc 100644
--- a/drivers/platform/x86/dell/Kconfig
+++ b/drivers/platform/x86/dell/Kconfig
@@ -188,6 +188,7 @@ config DELL_UART_BACKLIGHT
 	depends on ACPI_VIDEO
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on SERIAL_DEV_BUS
+	depends on X86
 	help
 	  Say Y here if you want to support Dell AIO UART backlight interface.
 	  The Dell AIO machines released after 2017 come with a UART interface
-- 
2.53.0

