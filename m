Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794608903;
	b=EBmhNhcr9MnJxaPWj74jMMXdmmWE07g7lNTfWO3HosKMVL9Cxca3FNq0xyFSNp0jVQyq
	 nhw2Q4stdmastOWMGOhyCQnhT3iOGUIMpqHfCAKa7eX6ILK70larT7s0c4mwklBrbkrkR
	 kB8UtMq8FTF9b/l478YLVHS2ZWSz9v78HoZ0LYUpVoqbEj8AKwKsurn0SSJPj4Y5DDMur
	 Ki0tvid7i85TM9Nozoh7zQfFnAEgLiu0bdhcNU99Oi5AEPq45foHbCHfm12A/ylJSmC1I
	 QIjnO+9lzJgHlWclouWUG5rp5GvcK9G3K+EQ7MmLhzSu1uvie4AKfdJh3tRJObSsoHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608903;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=GuWUdk2Gl/ilMhwkHl5PmVFqwIvyDVzlLFrHx/RcSZM=;
	b=JLIXTLaXnoCeZgPAvQHpmYbSWz4/IHjL18gumvjuWQmc098teMf9TCHsD7hZbWQLeckz
	 UgMHAiZWIDDf2P6cMDQ76EOZzlmNrU1upYOeL/wQEA/LFkXBqflwSE3lL3kQ9+3tvIMEd
	 ywVsRgPLWQmWSAN0t7BQpNU7hZBkrVtbEbaERVReCr8m+cZEoBI97Z+Ql5rwbQ8o83tpN
	 5tgxi3N9GzjVvIOTY1aIe2iDtnme/OkJvI8DI8DO3sB1hCucrOqbYsv8q5Fafu+23nSMK
	 g2uzZdoNZmpz2WD3lRSYOC6fW4ste7xORQ1v59+QreCU/kKcT1prhYXiZp+qgc+KprQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aE3aKgqC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.39
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011039.outbound.protection.outlook.com [40.93.194.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431E3606A33F;
	Fri, 13 Nov 2026 22:28:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 431E3606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aE3aKgqC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZs1MEjBHX6dIO+ZiKvB2dpys393ELei0JsgAcmrFm/op0EuzH2OAMFj4wjQECsQYJG4bHJzkC6W9FMmPJZw1Xm7LFKSclh/YwxFcJvwXCqPjkTV1ID/QEh5WxW6biD/IZ5kLx5IiyiJv0appcJvAFil/TnqnWK0tVkw2ap6DAse4V1lq430hZpfWvgvgPTmKNQCoFLcnTJGOvR4vrtUBgX4B0TUBGeTaAcMHm1QpCixuci47pZjSac7D4KLTjXHDLWqbNB0SzNbKVE99VWImLfaIH2ku8uiw/cQAXUYb03IuxUJiJx0VFoLhpGQwsyCOPK/Zcr+0KUzKoIm43ytzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GuWUdk2Gl/ilMhwkHl5PmVFqwIvyDVzlLFrHx/RcSZM=;
 b=oagRzbLHeJAHaro3+9scsgu9xZV1bMd1+F5t96VtUXvhIYZ0LiaVe/bhAi+uI72OPLtty9Bca2ONyZmG84v4S3OR8bALo6ZMnzRhtie/D2xocKCLyvWroP28YHJNO6h185pPr/aXOLTZ5BVoJE2ywIspVHaFwLDGwOMfOBrPmoDKW3zSBkYW+f1S8SPcs6aupdZLcovQmlzmTXDHfw4jfzyHZvcwSwYj0ga4Ai10UWj6L++3aiFhOjra0Kgj+i7YLlWeyfu5SYAPazvJ14OqYM+0sHDmzlqxO4Tj8poZQ8l7cl/1L4Z6QfcG7WIlv6pDhKkffWt2DXOj/a3Fo0DbLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GuWUdk2Gl/ilMhwkHl5PmVFqwIvyDVzlLFrHx/RcSZM=;
 b=aE3aKgqCn3HvwATPFQ16h7Po0UFbhhg2ZweEhLrdKQkv5N2wV8k/GFydChXSrnPEi4MC1dAv5T/iIJIXb4Vh6lOPcgwpRRgIAf37BJKDLN00YzhyBNIHYiSe3N1v3OwGk3lGRJcOTQhIiREkTdhco0XKt0ATp7BlP06/HGoVc4H8HcSQe0wYzEfItJmvQ9h6cXYhTTyTrH3aUptDS/ffdL8cBqOqFGGD0NB/b6h6K/RbuJsqPM7XBu6qjvZjIzdehm4XLnIF1voZgMkcC/tVzYM4g1UNh5SaSc10j8+T9RZqVOI8iKF5FwPMqjGsscumG0xQANxoplffp5QBf9tVjg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH0PR12MB5089.namprd12.prod.outlook.com (2603:10b6:610:bc::8)
 by IA3PR12MB660778.namprd12.prod.outlook.com (2603:10b6:208:61d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Fri, 13 Nov
 2026 22:28:03 +0000
Received: from CH0PR12MB5089.namprd12.prod.outlook.com
 ([fe80::cb31:7ebf:51e3:d9f6]) by CH0PR12MB5089.namprd12.prod.outlook.com
 ([fe80::cb31:7ebf:51e3:d9f6%4]) with mapi id 15.21.0615.008; Fri, 13 Nov 2026
 22:28:03 +0000
From: David Cemin <dcemin@nvidia.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	W_Armin@gmx.de
Cc: mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	xy-jackie@139.com,
	ikepanhc@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ldemarchi@nvidia.com
Subject: [RFC PATCH 1/3] platform: lenovo: move the architecture independent WMI drivers out of x86
Date: Fri, 13 Nov 2026 14:27:53 -0800
Message-ID: <20261113222755.1696567-2-dcemin@nvidia.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113222755.1696567-1-dcemin@nvidia.com>
References: <20261113222755.1696567-1-dcemin@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0191.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::16) To CH0PR12MB5089.namprd12.prod.outlook.com
 (2603:10b6:610:bc::8)
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
X-MS-TrafficTypeDiagnostic: CH0PR12MB5089:EE_|IA3PR12MB660778:EE_
X-MS-Office365-Filtering-Correlation-Id: 9da9cc9d-8a18-4324-3ec0-08df41d56175
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|6133799003|261009223027099003|11063799006|10067099003|56012099006|261022075727099003|261021123027099003|261021135927099003|261102123227099003|261028144727099003|261021121427099003|261026121527099003|261022105027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
 6FdN4efjEQTxJaE7hbPbEZ9A3yyO47VaB+4AXneUH96d55JNIFoRAC6oskaICLS/LpzE6TVy+7+DhswdSXRRcsLfDiZGekUVMcrx18EhtSDxoxRNivUvBjM3SkMjIJN7yWY0Rqy/uohGrTx7JkhK3cxTxJjcfnhjLhgCaGAYykQ/nD5M58KYzBQI5fWVNm7fOQ+AjHaZkQcrWdnd4EUKaIOlYo5CU+RmfpxFozBZx7dKCp34tgSZxBw3TlTpdxOgiCUbc6ORGUwRnbNz2+T5FjpLvDq0e6Vm7otuerIVg9Nk44LZEq47MN8aJoEsAikanpnJsZ/qjpOGLYq3gmqp5+/UIuQLiVkqmG5V75UJk6N0ugABx3Cz2lpqcY+YbyBxqjxGiNYubo/YroH4TmkBNgSlj9bjjDnhqo4b+M29gLrtS9bOQ+hEnLMLuu4Bqkkjn2N9gM6AaajJqm062Fw1KAPDIy3FaZRmEsZYQUb3McuzymGvB9gxGQi/ZrczZmskOaR/OXGEJN9nD0+x5ckTJs3uO/ra65/7K4KzmjzVewPqu6X7U0ra4f8OJpxIvxku6ix6HPIsVsboMFg0FPoiCi66SspRiXGrIn9CXWXMDP60O/qEnko0Pe8mFqLgv8febHnnIWIcRx+mAy0WsQPU+5AbDZdC18w6cOjkMCv+rZU=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5089.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(261009223027099003)(11063799006)(10067099003)(56012099006)(261022075727099003)(261021123027099003)(261021135927099003)(261102123227099003)(261028144727099003)(261021121427099003)(261026121527099003)(261022105027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?pAT3qtQdyQsMialEJVhGhN8j45tBP5Kw7kT8a09w6BVsV9Fifku9XEuUuf3H?=
 =?us-ascii?Q?TrmHK0zKKvDpE7SE0Rid44fkOsHfDQjr2ypEIOhrI8yQwGR2LKd5T2SmA3oY?=
 =?us-ascii?Q?j0RIAnoq6fX5G63FpQ5L6UKw9vj7MvccwuHeomsixx8SBZ99wBiyZTC2CJfp?=
 =?us-ascii?Q?HzshjUo/LOlsTM0GtqjpT66cm3mn2VE2WeiMJOutTf9pWQxagB+87B3Jp94K?=
 =?us-ascii?Q?54qbJHOaqL/bviSpICE2vZadZvmTISIZcylNWndzyc/Fk1zHGq6CwGTx7c9f?=
 =?us-ascii?Q?Pc75AtcqDAU9IL459aF07B45iFizLE8DheZT3Mks/Re9mCfAFAbsCCieMCkZ?=
 =?us-ascii?Q?LugnnyCvWGe8S0w3c0zLkciQVpPvX56sUmWQzBZZvLgK1Dyx4EVYU5ajZNKz?=
 =?us-ascii?Q?zCICHbkHR1Dndb4dKoX/6goWfw7AwfC3cRzeS7jL6RjnVp8UMPnxlt4H4qTj?=
 =?us-ascii?Q?1oxMttlvDpkExye3nyclENt2bD/+zdt1uFq51+u9DWZ8NA9GUakrneVxH3dW?=
 =?us-ascii?Q?ZPdveNGjn8SI33i/9U2zMlyAWNAX9txMEWbSt/Bqnv5KfdfUUZGidGonmB+y?=
 =?us-ascii?Q?jgwlbNtJD13wOxgcHkSwnd/uD75jJe3Tf65ysrcktSyfeHBkL1qfYyQLzpNU?=
 =?us-ascii?Q?LujoiCAS0VJSuXVuxB7HIknWcBIkNoZcsMIyUI1JG0SBj8hScwSrr7AF8KWU?=
 =?us-ascii?Q?3PvpvoTa2KozoLNC1qBdsuncagy1uBsm25buMfIR2zGU4uUO9JMY9JjPztmW?=
 =?us-ascii?Q?f53XLEupE4EpyJ/L0iXJFJ4hfQkdNbF5EEZQdSZmF8m+c6hIIlnZlkrWrRO5?=
 =?us-ascii?Q?cZr+oopImReltusxkB57thr7VnvoMiqIhzlMjrnBflm03PlvhT7lKwI3UiqH?=
 =?us-ascii?Q?QmXZCkwkXkImg+by1xyL97sebXMCpdmP3vTj/A/y4w1Y9Nvb73esjWRftnww?=
 =?us-ascii?Q?CpDATbKj7QlJq4eKQl/f44PT2hhzN9GSYiyl0XxUy4fj5D75DUYphTdxaCGc?=
 =?us-ascii?Q?Nw4nNoafX1whT1e8aJ8U5F+5Y2+vBcqseUEfTEJ+Og/OBwJAZbaRcQA9JNAt?=
 =?us-ascii?Q?/WVeXBvOBwrMqrJYC8GiFlLCZwf79syqEMN99IONo+5ajHPs8Pe8iPccdpXR?=
 =?us-ascii?Q?5gHzuZE8hIkCUjfomAaDzWvnKyGZdxREJ5dJtom6gGOyqgbYmVShlb9tmTI4?=
 =?us-ascii?Q?D5wVm02LrYtQrphdp5ATfsZW6Lxinc5+LtGY5WEt/1mw2LGvcX+3ymM3FzYS?=
 =?us-ascii?Q?SjvyUOUryPkQ587P9kGcC/sGDJIBtbplIoitnSMCKA4uZYIKYm712k/Mapul?=
 =?us-ascii?Q?p/bcFAfwYRmQ79MO6BGZKQg4wgF+s12oR2nqKH2/lBTllWjGWPBlLq7Z4/36?=
 =?us-ascii?Q?fPaomTE6bEEsi0NzufUoFloQvla7vJQBXsIMOqs3citcTf2+e+Ox8plRf6tO?=
 =?us-ascii?Q?H6b0dn+g2Q40H57Dhcl/rB93mv08zMsYXO/kJ+ha5hPrgjmWjLrTuHXGFgVN?=
 =?us-ascii?Q?3ZICXvH8y/K14bZVvgNkCt7yuY+HRQ2U5iTAZR1Qv+vblG5sF6VKrmO9pbyy?=
 =?us-ascii?Q?dcu3iq+OHNJSv14tNvSTXYtW97yNBIBDcXNiVWdEGJ6Ppz35VABaA3yThK5s?=
 =?us-ascii?Q?/+W9TYBeSZ1bWqJlie/KLXqaRSCPlqetkmqIEnlaPWV9wrx/AkGKdP8IF36I?=
 =?us-ascii?Q?McMt7RUSuHNGr8oKyqL376mNhIITM2vZ+lAfauxF61TcZuRci4s1oKHNkQvL?=
 =?us-ascii?Q?x07F0urYfQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9da9cc9d-8a18-4324-3ec0-08df41d56175
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5089.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 22:28:02.9819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ywR1TirUc1fhEwuaMq8pR+cvxf9ERbPZmYElIqv6X6QJ9kcMpjebMY33RF4IKOwQLM2y968gb+xvgyPl+Wyoag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR12MB660778
X-OriginatorOrg: Nvidia.com

The Lenovo WMI drivers (events, helpers, capability data, GameZone,
Other Mode, hotkey utilities and camera button) contain no x86 specific
code: they talk to firmware through the ACPI-WMI core only. They live
under drivers/platform/x86 because that is where Lenovo drivers were
collected, and X86_PLATFORM_DEVICES keeps them off every other
architecture.

Lenovo now ships ACPI based arm64 laptops whose firmware exposes the
same WMI GUIDs (the Fn key events, the mic mute LED method, GameZone and
Other Mode). Give these drivers an architecture independent home,
drivers/platform/lenovo, following the layout of drivers/platform/surface
which exists for the same reason, so they can be built wherever the WMI
core is available. ideapad-laptop, thinkpad_acpi, think-lmi, yogabook and
the Yoga Tablet drivers stay under x86: they depend on i8042, port I/O or
x86 only ACPI devices.

Pure code motion: the files, their Kconfig entries and the module naming
scheme are unchanged. MAINTAINERS entries are updated for the new paths.

Signed-off-by: David Cemin <dcemin@nvidia.com>
---
 MAINTAINERS                                   |  3 +-
 drivers/platform/Kconfig                      |  2 +
 drivers/platform/Makefile                     |  1 +
 drivers/platform/lenovo/Kconfig               | 87 +++++++++++++++++++
 drivers/platform/lenovo/Makefile              | 22 +++++
 .../platform/{x86 => }/lenovo/wmi-camera.c    |  0
 .../platform/{x86 => }/lenovo/wmi-capdata.c   |  0
 .../platform/{x86 => }/lenovo/wmi-capdata.h   |  0
 .../platform/{x86 => }/lenovo/wmi-events.c    |  0
 .../platform/{x86 => }/lenovo/wmi-events.h    |  0
 .../platform/{x86 => }/lenovo/wmi-gamezone.c  |  0
 .../platform/{x86 => }/lenovo/wmi-helpers.c   |  0
 .../platform/{x86 => }/lenovo/wmi-helpers.h   |  0
 .../{x86 => }/lenovo/wmi-hotkey-utilities.c   |  0
 drivers/platform/{x86 => }/lenovo/wmi-other.c |  0
 drivers/platform/x86/lenovo/Kconfig           | 67 --------------
 drivers/platform/x86/lenovo/Makefile          |  7 --
 17 files changed, 114 insertions(+), 75 deletions(-)
 create mode 100644 drivers/platform/lenovo/Kconfig
 create mode 100644 drivers/platform/lenovo/Makefile
 rename drivers/platform/{x86 => }/lenovo/wmi-camera.c (100%)
 rename drivers/platform/{x86 => }/lenovo/wmi-capdata.c (100%)
 rename drivers/platform/{x86 => }/lenovo/wmi-capdata.h (100%)
 rename drivers/platform/{x86 => }/lenovo/wmi-events.c (100%)
 rename drivers/platform/{x86 => }/lenovo/wmi-events.h (100%)
 rename drivers/platform/{x86 => }/lenovo/wmi-gamezone.c (100%)
 rename drivers/platform/{x86 => }/lenovo/wmi-helpers.c (100%)
 rename drivers/platform/{x86 => }/lenovo/wmi-helpers.h (100%)
 rename drivers/platform/{x86 => }/lenovo/wmi-hotkey-utilities.c (100%)
 rename drivers/platform/{x86 => }/lenovo/wmi-other.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 056408bc086e..3b0ad5a3debe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15170,13 +15170,14 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
 F:	Documentation/wmi/devices/lenovo-wmi-other.rst
+F:	drivers/platform/lenovo/
 F:	drivers/platform/x86/lenovo/*
 
 LENOVO WMI HOTKEY UTILITIES DRIVER
 M:	Jackie Dong <xy-jackie@139.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
-F:	drivers/platform/x86/lenovo/wmi-hotkey-utilities.c
+F:	drivers/platform/lenovo/wmi-hotkey-utilities.c
 
 LENOVO HID drivers
 M:	Derek J. Clark <derekjohn.clark@gmail.com>
diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
index 312788f249c9..80b2b83b69e5 100644
--- a/drivers/platform/Kconfig
+++ b/drivers/platform/Kconfig
@@ -15,6 +15,8 @@ source "drivers/platform/olpc/Kconfig"
 
 source "drivers/platform/surface/Kconfig"
 
+source "drivers/platform/lenovo/Kconfig"
+
 source "drivers/platform/x86/Kconfig"
 
 source "drivers/platform/arm64/Kconfig"
diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile
index fa322e7f8716..0144f88ff6db 100644
--- a/drivers/platform/Makefile
+++ b/drivers/platform/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_GOLDFISH)		+= goldfish/
 obj-$(CONFIG_CHROME_PLATFORMS)	+= chrome/
 obj-$(CONFIG_CZNIC_PLATFORMS)	+= cznic/
 obj-$(CONFIG_SURFACE_PLATFORMS)	+= surface/
+obj-$(CONFIG_LENOVO_PLATFORMS)	+= lenovo/
 obj-$(CONFIG_ARM64_PLATFORM_DEVICES)	+= arm64/
 obj-$(CONFIG_BCM2835_VCHIQ)	+= raspberrypi/
 obj-$(CONFIG_ACPI_WMI)		+= wmi/
diff --git a/drivers/platform/lenovo/Kconfig b/drivers/platform/lenovo/Kconfig
new file mode 100644
index 000000000000..8222322ca671
--- /dev/null
+++ b/drivers/platform/lenovo/Kconfig
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Lenovo Platform-Specific Drivers
+#
+
+menuconfig LENOVO_PLATFORMS
+	bool "Lenovo Platform-Specific Device Drivers"
+	depends on ARM64 || X86 || COMPILE_TEST
+	default y if ARM64 || X86
+	help
+	  Say Y here to get to see options for platform-specific device drivers
+	  for Lenovo devices that do not depend on the CPU architecture, such
+	  as the ACPI-WMI based drivers used on both x86 and arm64 laptops.
+	  This option alone does not add any kernel code.
+
+	  If you say N, all options in this submenu will be skipped and disabled.
+
+if LENOVO_PLATFORMS
+
+config LENOVO_WMI_HELPERS
+	tristate
+	depends on ACPI_WMI
+
+config LENOVO_WMI_EVENTS
+	tristate
+	depends on ACPI_WMI
+
+config LENOVO_WMI_CAPDATA
+	tristate
+	depends on ACPI_WMI
+	depends on LENOVO_WMI_HELPERS
+
+config LENOVO_WMI_HOTKEY_UTILITIES
+	tristate "Lenovo Hotkey Utility WMI extras driver"
+	depends on ACPI_WMI
+	select NEW_LEDS
+	select LEDS_CLASS
+	imply IDEAPAD_LAPTOP
+	help
+	  This driver provides WMI support for Lenovo customized hotkeys function,
+	  such as LED control for audio/mic mute event for Ideapad, YOGA, XiaoXin,
+	  Gaming, ThinkBook and so on.
+
+config LENOVO_WMI_CAMERA
+	tristate "Lenovo WMI Camera Button driver"
+	depends on ACPI_WMI
+	depends on INPUT
+	help
+	  This driver provides support for Lenovo camera button. The Camera
+	  button is a GPIO device. This driver receives ACPI notifications when
+	  the camera button is switched on/off.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called lenovo-wmi-camera.
+
+config LENOVO_WMI_GAMEZONE
+	tristate "Lenovo GameZone WMI Driver"
+	depends on ACPI_WMI
+	depends on DMI
+	select ACPI_PLATFORM_PROFILE
+	select LENOVO_WMI_EVENTS
+	select LENOVO_WMI_HELPERS
+	help
+	  Say Y here if you have a WMI aware Lenovo Legion device and would like to use the
+	  platform-profile firmware interface to manage power usage.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called lenovo-wmi-gamezone.
+
+config LENOVO_WMI_TUNING
+	tristate "Lenovo Other Mode WMI Driver"
+	depends on ACPI_WMI
+	depends on ACPI_BATTERY
+	select HWMON
+	select FW_ATTR_CLASS
+	select LENOVO_WMI_CAPDATA
+	select LENOVO_WMI_EVENTS
+	select LENOVO_WMI_HELPERS
+	help
+	  Say Y here if you have a WMI aware Lenovo Legion device and would like to use the
+	  firmware_attributes API to control various tunable settings typically exposed by
+	  Lenovo software in Windows.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called lenovo-wmi-other.
+
+endif # LENOVO_PLATFORMS
diff --git a/drivers/platform/lenovo/Makefile b/drivers/platform/lenovo/Makefile
new file mode 100644
index 000000000000..1cac115dd735
--- /dev/null
+++ b/drivers/platform/lenovo/Makefile
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for linux/drivers/platform/lenovo
+# Lenovo Platform Specific Drivers (architecture independent)
+#
+
+lenovo-target-$(CONFIG_LENOVO_WMI_HELPERS)	+= wmi-helpers.o
+lenovo-target-$(CONFIG_LENOVO_WMI_EVENTS)	+= wmi-events.o
+lenovo-target-$(CONFIG_LENOVO_WMI_CAPDATA)	+= wmi-capdata.o
+lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)	+= wmi-hotkey-utilities.o
+lenovo-target-$(CONFIG_LENOVO_WMI_CAMERA)	+= wmi-camera.o
+lenovo-target-$(CONFIG_LENOVO_WMI_GAMEZONE)	+= wmi-gamezone.o
+lenovo-target-$(CONFIG_LENOVO_WMI_TUNING)	+= wmi-other.o
+
+# Add 'lenovo' prefix to each module listed in lenovo-target-*
+define LENOVO_OBJ_TARGET
+lenovo-$(1)-y := $(1).o
+obj-$(2) += lenovo-$(1).o
+endef
+
+$(foreach target, $(basename $(lenovo-target-y)), $(eval $(call LENOVO_OBJ_TARGET,$(target),y)))
+$(foreach target, $(basename $(lenovo-target-m)), $(eval $(call LENOVO_OBJ_TARGET,$(target),m)))
diff --git a/drivers/platform/x86/lenovo/wmi-camera.c b/drivers/platform/lenovo/wmi-camera.c
similarity index 100%
rename from drivers/platform/x86/lenovo/wmi-camera.c
rename to drivers/platform/lenovo/wmi-camera.c
diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/lenovo/wmi-capdata.c
similarity index 100%
rename from drivers/platform/x86/lenovo/wmi-capdata.c
rename to drivers/platform/lenovo/wmi-capdata.c
diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform/lenovo/wmi-capdata.h
similarity index 100%
rename from drivers/platform/x86/lenovo/wmi-capdata.h
rename to drivers/platform/lenovo/wmi-capdata.h
diff --git a/drivers/platform/x86/lenovo/wmi-events.c b/drivers/platform/lenovo/wmi-events.c
similarity index 100%
rename from drivers/platform/x86/lenovo/wmi-events.c
rename to drivers/platform/lenovo/wmi-events.c
diff --git a/drivers/platform/x86/lenovo/wmi-events.h b/drivers/platform/lenovo/wmi-events.h
similarity index 100%
rename from drivers/platform/x86/lenovo/wmi-events.h
rename to drivers/platform/lenovo/wmi-events.h
diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.c b/drivers/platform/lenovo/wmi-gamezone.c
similarity index 100%
rename from drivers/platform/x86/lenovo/wmi-gamezone.c
rename to drivers/platform/lenovo/wmi-gamezone.c
diff --git a/drivers/platform/x86/lenovo/wmi-helpers.c b/drivers/platform/lenovo/wmi-helpers.c
similarity index 100%
rename from drivers/platform/x86/lenovo/wmi-helpers.c
rename to drivers/platform/lenovo/wmi-helpers.c
diff --git a/drivers/platform/x86/lenovo/wmi-helpers.h b/drivers/platform/lenovo/wmi-helpers.h
similarity index 100%
rename from drivers/platform/x86/lenovo/wmi-helpers.h
rename to drivers/platform/lenovo/wmi-helpers.h
diff --git a/drivers/platform/x86/lenovo/wmi-hotkey-utilities.c b/drivers/platform/lenovo/wmi-hotkey-utilities.c
similarity index 100%
rename from drivers/platform/x86/lenovo/wmi-hotkey-utilities.c
rename to drivers/platform/lenovo/wmi-hotkey-utilities.c
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/lenovo/wmi-other.c
similarity index 100%
rename from drivers/platform/x86/lenovo/wmi-other.c
rename to drivers/platform/lenovo/wmi-other.c
diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
index 516594993073..36bcefb61805 100644
--- a/drivers/platform/x86/lenovo/Kconfig
+++ b/drivers/platform/x86/lenovo/Kconfig
@@ -20,29 +20,6 @@ config IDEAPAD_LAPTOP
 	  This is a driver for Lenovo IdeaPad netbooks contains drivers for
 	  rfkill switch, hotkey, fan control and backlight control.
 
-config LENOVO_WMI_HOTKEY_UTILITIES
-	tristate "Lenovo Hotkey Utility WMI extras driver"
-	depends on ACPI_WMI
-	select NEW_LEDS
-	select LEDS_CLASS
-	imply IDEAPAD_LAPTOP
-	help
-	  This driver provides WMI support for Lenovo customized hotkeys function,
-	  such as LED control for audio/mic mute event for Ideapad, YOGA, XiaoXin,
-	  Gaming, ThinkBook and so on.
-
-config LENOVO_WMI_CAMERA
-	tristate "Lenovo WMI Camera Button driver"
-	depends on ACPI_WMI
-	depends on INPUT
-	help
-	  This driver provides support for Lenovo camera button. The Camera
-	  button is a GPIO device. This driver receives ACPI notifications when
-	  the camera button is switched on/off.
-
-	  To compile this driver as a module, choose M here: the module
-	  will be called lenovo-wmi-camera.
-
 config LENOVO_YB9_KBDOCK
 	tristate "Lenovo Yoga Book 9 keyboard dock detection"
 	depends on ACPI_WMI
@@ -246,47 +223,3 @@ config YT2_1380
 
 	  To compile this driver as a module, choose M here: the module will
 	  be called lenovo-yogabook.
-
-config LENOVO_WMI_CAPDATA
-	tristate
-	depends on ACPI_WMI
-	depends on LENOVO_WMI_HELPERS
-
-config LENOVO_WMI_EVENTS
-	tristate
-	depends on ACPI_WMI
-
-config LENOVO_WMI_HELPERS
-	tristate
-	depends on ACPI_WMI
-
-config LENOVO_WMI_GAMEZONE
-	tristate "Lenovo GameZone WMI Driver"
-	depends on ACPI_WMI
-	depends on DMI
-	select ACPI_PLATFORM_PROFILE
-	select LENOVO_WMI_EVENTS
-	select LENOVO_WMI_HELPERS
-	help
-	  Say Y here if you have a WMI aware Lenovo Legion device and would like to use the
-	  platform-profile firmware interface to manage power usage.
-
-	  To compile this driver as a module, choose M here: the module will
-	  be called lenovo-wmi-gamezone.
-
-config LENOVO_WMI_TUNING
-	tristate "Lenovo Other Mode WMI Driver"
-	depends on ACPI_WMI
-	depends on ACPI_BATTERY
-	select HWMON
-	select FW_ATTR_CLASS
-	select LENOVO_WMI_CAPDATA
-	select LENOVO_WMI_EVENTS
-	select LENOVO_WMI_HELPERS
-	help
-	  Say Y here if you have a WMI aware Lenovo Legion device and would like to use the
-	  firmware_attributes API to control various tunable settings typically exposed by
-	  Lenovo software in Windows.
-
-	  To compile this driver as a module, choose M here: the module will
-	  be called lenovo-wmi-other.
diff --git a/drivers/platform/x86/lenovo/Makefile b/drivers/platform/x86/lenovo/Makefile
index 12816d8d5e24..758c36cedee8 100644
--- a/drivers/platform/x86/lenovo/Makefile
+++ b/drivers/platform/x86/lenovo/Makefile
@@ -7,17 +7,10 @@ obj-$(CONFIG_IDEAPAD_LAPTOP)	+= ideapad-laptop.o
 obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
 obj-$(CONFIG_THINKPAD_ACPI)	+= thinkpad_acpi.o
 
-lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)	+= wmi-hotkey-utilities.o
 lenovo-target-$(CONFIG_LENOVO_YB9_KBDOCK)	+= yb9-kbdock.o
 lenovo-target-$(CONFIG_LENOVO_YMC)	+= ymc.o
 lenovo-target-$(CONFIG_YOGABOOK)	+= yogabook.o
 lenovo-target-$(CONFIG_YT2_1380)	+= yoga-tab2-pro-1380-fastcharger.o
-lenovo-target-$(CONFIG_LENOVO_WMI_CAMERA)	+= wmi-camera.o
-lenovo-target-$(CONFIG_LENOVO_WMI_CAPDATA)	+= wmi-capdata.o
-lenovo-target-$(CONFIG_LENOVO_WMI_EVENTS)	+= wmi-events.o
-lenovo-target-$(CONFIG_LENOVO_WMI_HELPERS)	+= wmi-helpers.o
-lenovo-target-$(CONFIG_LENOVO_WMI_GAMEZONE)	+= wmi-gamezone.o
-lenovo-target-$(CONFIG_LENOVO_WMI_TUNING)	+= wmi-other.o
 
 # Add 'lenovo' prefix to each module listed in lenovo-target-*
 define LENOVO_OBJ_TARGET
-- 
2.56.1

