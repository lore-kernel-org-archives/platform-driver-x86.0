Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013049.outbound.protection.outlook.com [40.107.159.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1870F342510;
	Mon, 21 Sep 2026 09:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982454; cv=fail; b=O6Uq/p6DR+N4kXzy5e6bq7lnREWn/Zp6EKH19Z5Spv+J9yZa2MSFQfsUHKPX8KmZO8LUtfZ2IysGWO/9/RwBcbAlntYzFukaZuJqdhavV/rwH6Rslb5vCznuaz1kVaEHXsb63JrqSctB1RZpoFNhvLtqia1KmFA5TDoEORwOLhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982454; c=relaxed/simple;
	bh=7GwmM5cPBLTo+N65myFjInKOEFVUXD1vmns9F7XYeLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VsauVnztvMXYrt7t4aUKFkCabiS7mVej2DVv1+isr3fRHIA4v6Fj4mLdAXNPB65rHHblfbLfC26lmp9Xy+XQ4C4aVrqchnFXdfb0Sh/1D70MYx/w8SqmQv9m3hM81VBOB/O95e4bMjc1kHVI56fBAgzTv9xkAGUV2d7Ukkavumc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=RCPIZGp7; arc=fail smtp.client-ip=40.107.159.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="RCPIZGp7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CbvurdRTOmN6uo5AIGtL3Ljusb//SgYeb5J2piouYoM80YuX/iwCDay5XLaf180DecXswRVyLoCs5l7tj9cGlJUCvcSzkO4YLLfTTNhc1soz2tpGJS06x6ObTU447RFCb9DO+WGs8PjMVw2l7Og83GgCbDBKZzvzU0CmvxesTdtPXLBlblFuORzcuwLuAwsEZ3Z9sH0bW4BGpFsLOCywn98cpteKbUyDHf8S6xtBfFjORqkbw1DxN8hX9wpDJ28XIRqxluE8tgYAhm914RJvNdHQjwUJp7Up9bYVbdC4tET/ecNPysHaM3SBitc7d6ZXGs8x6UR323Wif6O0BbZZBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=My5lgTSy9n5Td+RlMXuK3Bw4gUPuIKXOpb94zt63xZY=;
 b=BqmQ5CiRqLpQfqNWNmnjuUZ/YQg0sQFDqSdFqFXeSNENpWQY5J74TkIDmJKlWYXoJmaGx3omR2FtLEhoqrIAjCFdbOhQcBpNBaAdFqznSjXl43HQFKgzM/geFNP6IKyYKDAH5gjoX6woVtUdOvXh8+oG+Xnz6dUhLl2qSTnlYJhtt/gSsGNGlwq21rd8rIJDRE0uVcPC+QX1ObGL9vcYB/4sbi1ntyRUH2c3NZONPknjaw068Mx1iT6lPegD69Z8cAXr6F2pPk2fA4mxMVX4vap+RYNdzKq6MgKTxTJIyVPD84GJptWRNbjCyadS9pQK2GrXgusj7UqGuoirMIqjjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=petermarshall.ca smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=My5lgTSy9n5Td+RlMXuK3Bw4gUPuIKXOpb94zt63xZY=;
 b=RCPIZGp7A5WT8JXI5wc5R4ZSd1xGCAm1Dind/zFBBEfNCYZavF6B/I55ZQ7VNYHdxaceLlXAKOE2i2ppNoAjjJVza9Eegn6egzzcDAmobF2ST8da4VDJjPFj1x9dlHwe6URqMv/6hzqxkTYvOq6I8BK2Jf244bhHgA661PCUyPsRZXsfBVTjQs0STAKcnGmUVAHg/6quIBYzKkbCGfhCmoLKMsGZHFwvTqA7gjsbMbjz1bs135hvFAyh0Rs0Qc4Pspd2O8dIh5PTZp4mQIhrv97qUEhEWnQGCepUKqSK/b+9JbCYjKYJnI0B5jpADPf1UUtJ8DG1zVi3t8sE1zJ7lA==
Received: from GV3P280CA0034.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:9::31) by
 AS4PR10MB6112.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:584::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.15; Mon, 21 Sep 2026 09:20:48 +0000
Received: from WA1PEPF00009B3E.eurprd05.prod.outlook.com
 (2603:10a6:150:9:cafe::6f) by GV3P280CA0034.outlook.office365.com
 (2603:10a6:150:9::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 09:20:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 WA1PEPF00009B3E.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 09:20:47 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 21 Sep
 2026 11:26:35 +0200
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 21 Sep
 2026 11:20:46 +0200
Message-ID: <0bb08d07-bd06-4adb-851b-6b45d296b328@foss.st.com>
Date: Mon, 21 Sep 2026 11:20:50 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] media: i2c: st-vd55g1: Genericize driver and add
 VD55G0 support
To: Peter Marshall <pm@petermarshall.ca>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>,
	"Hans de Goede" <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>
References: <20260918221705.323510-1-pm@petermarshall.ca>
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20260918221705.323510-1-pm@petermarshall.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF00009B3E:EE_|AS4PR10MB6112:EE_
X-MS-Office365-Filtering-Correlation-Id: d2624fe8-8579-4a55-2d5e-08df17c19f4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|23010399003|1800799024|10067099003|56012099006|6133799003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	vyAA2Im70NKqoMVlcIxtvWdmIkwExbWpbkzoqVFqN/3EY9FcBfusXcUsfFR7Wx6zGHO+/qPvXVawtVKQEMRG++B/6TEaHvbUleBBCxojPp1uHOQopBnPHeBUvGjg5dmVV7J/RAHtuY+ArmAQT55G0vGUHc1AUTSBCxLXbb/LOlUZsMW/lCU26IcsNzrUBCG/OXKPW3KlwBLobb+9Tk4C+jOaRDheZ6eyoWAvpFyzxuBRm6K5xZrV3rU5FRhO92oD7qfrdba9ji3Xjy6/IU1MVbc6kr7RO3Y5FY8rKD2cczVwGE4AHpwedCnEJ52chWWh7271OwqGCEZIqFdC0uH6W7/s2Z4GDj5pqT4Vg36prkIcZA/bGgwyoea5o6GSXD4wrK9kqEtXVbsNJN89BGlkKA28m7aBD0qmJUmW1GBlurASnEKfLAuE/h68K81sDG2RUX4krPRiHotN40DzK+t96Q2FQbkNlY9yVNz3ruVk+Zgm4qxYkiZuB2kOt7gK/hRhPqJE7eEPlDKVjIT387WFm9yqOAuNEjL+3eXZgeKU1XvSf72qosxmJPYpBBIkGLHB77XTHwgsQwlR3P0mu0nGzrip6ZtIophYmFBkHO+L0UBIwKEbthek5XMS/Rf9c1cfqQ4Klwzp/FepSmzJDoiF90IjNtJvsbKTrCzCUDjE5s+GDpMtuuq26UvnIQdbDPqbClTvPlk+wLJ1ichAzOF46g==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(23010399003)(1800799024)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	p7rytmSyaKXTpPJZUKkBKBiKL3QtucUpNWH7NsFSEnwoltnIUCMyun/gmf6/sIEirCF0cTrVkl+/NNzSb533G4iZKkoq0M9zYoDB88Yu5evwVBQA7NejaWxh7++wqqKBwjs+FB5Eyl947DbtWHPBNWpViK5Cvu6nNljhecNP9nTkKm+VKBir3ejLjOgcUREpJtvSeQdgGM/PfpWXhuLVx8xNAxH7mr/GycAFpZcuvqhPsrrLvuqrWxTwF93R29yTrRNs01WQ4wsFmCQugkCHPTidcQGxRcyrwlW/8s1smEyWYMuHJJCBDBCKTTL7q9yk9mHsmGQAoM+oMAGa+P7GNyuI1B/z2//ihRZaWfIYehIGr8pqiaXScs9dZnIlmELN0HWVlMr1WvbScfFKCw6ikw7+Fe7AWsbnnp4R7xeZ5sNtnoajMassEft2VjyCV7RX
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 09:20:47.7415
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2624fe8-8579-4a55-2d5e-08df17c19f4b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF00009B3E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB6112

Hi Peter,

Thank you for your work.

Le 19/09/2026 à 00:16, Peter Marshall a écrit :
> This patch series refactors the STMicroelectronics VD55G1 and VD65G4 image
> sensor driver (vd55g1) to abstract sensor differences and adds support for
> the VD55G0 monochrome sensor.

I read through your patches more closely, and I still think this is not
the best approach. So for the driver refactoring this will be a NAK for
me. I'll gladly take the ACPI parts though.

Sergey is currently working on bringing the vd55g0 downstream driver in
upstream, which I find a better approach. Not sure if you're working
together, if not I recommend getting in touch as it may suit your needs ?

> 
> The VD55G0 is used as the IR face ID sensor in devices such as the
> Microsoft Surface Pro 9, where it is found under ACPI HID `SMO55F0`. It
> features a native resolution of 644 x 604 pixels and differs from later
> variants in the family in several ways:
> 
> * It uses a different native resolution and register addresses mapping,
>   requiring specification of generational feature differences.
> * It lacks support for spatial and temporal HDR.
> * It requires an exposure duty cycle limit to keep the illuminator current
>   within safe levels.
> 
> Tested on a Microsoft Surface Pro 9 (an Intel IPU6 platform with ACPI
> HID "SMO55F0") running kernel 7.2.0 (changes cherry-picked) and libcamera
> 0.7.0. Builds successfully on linux-media next.
> 
> Key changes from the previous series:
> * The vd55g1 module is grown to support the extra hardware instead of
>   replacing it with a completely new driver.
> * The driver now includes a builtin patch array. External firmware loading
>   is no longer required.
> * Lower-level error messages are demoted to the debug level to keep kernel
>   logs clean and actionable.
> * Hardware registers are now fully abstracted, so operational logic never
>   needs to touch a raw CCI address.
> * Changes are broken into logical steps to improve clarity and make
>   bisection possible.
> * Rebased against linux-media next.
> 
> Peter Marshall (11):
>   dt-bindings: media: i2c: st,vd55g1: Move allOf: after required:
>   media: dt-bindings: i2c: vd55g1: Add vd55g0 compatible
>   media: ipu-bridge: Add VD55G0 to the list of supported sensors
>   platform/x86: int3472: Add VD55G0 supply GPIO mapping
>   media: i2c: st-vd55g1: Default to illuminator on GPIO 1
>   media: i2c: st,vd55g1: Handle virtual firmware graph endpoints
>   media: i2c: st-vd55g1: Clean up module error reporting
>   media: i2c: st-vd55g1: Unify frame timing calculations
>   media: i2c: st-vd55g1: Abstract sensor models, revisions, and features
>   media: i2c: st-vd55g1: Use indirect hardware register addressing
>   media: i2c: st-vd55g1: Support VD55G0 global-shutter image sensor
> 
>  .../bindings/media/i2c/st,vd55g1.yaml         |   34 +-
>  MAINTAINERS                                   |    1 +
>  drivers/media/i2c/vd55g1.c                    | 1667 +++++++++++++----
>  drivers/media/pci/intel/ipu-bridge.c          |    2 +
>  drivers/platform/x86/intel/int3472/discrete.c |   18 +
>  5 files changed, 1394 insertions(+), 328 deletions(-)
> 

-- 
Regards,
Benjamin

