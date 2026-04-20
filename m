Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013044.outbound.protection.outlook.com [40.107.201.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A45A382285;
	Mon, 20 Apr 2026 07:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776668450; cv=fail; b=cEAnTAXiFzeGEzwiegV7AG3zL/R6yZGpW5Jq+jRqRI+K82HtNF2fkN/3yLXRNTY+ihZyAymOsL5bKkaZTc2pZeAPwSt8a2/C0CnGqFUODGie90bi2q17kzJAYZdDZpN8ijUuQWilK5hFR9Mvir9TitJ4JNFU45HJVnx+Z03KwpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776668450; c=relaxed/simple;
	bh=WmVimfcfr3tv1+3Wt58Gfld/n56QuQ7+NVvjKxQEqq8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HN5zt+bQ+fJGHyvVMGI/LuxMffv9fL7XOOy6A4wvuLNASUToyzMnA+gd0KVIS73CEgKKQERaWqGvN91P+BcS00yPKOLeiYRC57N2tsyql3gj5q/1d2zMhHFwDzMWlP9dacpPtZvM/YqQnEbf6HrUUtwQr5yevuepixGE3U6yQQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=df6EcsyD; arc=fail smtp.client-ip=40.107.201.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="df6EcsyD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/rhCBdGvr6DaBd25JdR1B5utGTDnGBesQ7Ky1hRd836lge0KDYT8Wi8rjyl8olLVX8tB9TW/K2h0ShBdnDVz+W5ABgjpliTtHtVPGLaWqWuch8mSYj1FFc2YjMwnojv9O0VgXvhJBGUn5l7k3QQZFvEV+J2oyzdAvCR99PGc8mzWWqp9zMryyfFV6I1H5QXcVPm4uOrSP5TDix3X1IrnnJF7oZNluHDAsSnncH31kCwiaq0fpcDD27qVGTJ711/IEQ44Apns2N8a3e9EWHbSPikvX7wu+aMw2nLnlxFsn0jEsn9wT/dFfa42U6cedx+W+nt6cOwVKKB3KzKSmKROQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEcNGANyHIfcMn30wN9rRRh0dsUQyqLKH3l3nDVsjDM=;
 b=WWX2xcPoSZi9qmWlP9zV3ibYVkPgIL2Koco9S8XbbpqFmsYTOXWStAeKNPV2I0h7mamUWvJTG24tVQc5h+E7/sjLQSehbYvKbm18o1dByLeZLEonnoHFSJDMm/uQtTgAsayku5NMsvPF0mFvpYVgjpW0tK46inpLbLoA77k4c4fnSSFKaZOh1ReBjws3bW4TYy1OBauDqeFGwy1zLcOikb4w5N74bD58LgD0XeXjr1wH7MT0Y7JSb2Vi0P3PXv2ksnIxv62hA86vgkSnUMo1oGH70eB+T3fjl5Q2GRqRye+K2O+jUunQrXCjK4Y4SfHx0aSLikKaGMihB2pdZ0CFyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEcNGANyHIfcMn30wN9rRRh0dsUQyqLKH3l3nDVsjDM=;
 b=df6EcsyDcIZeDVjl89j87Kf8F2/sHnEkgcj55bOEIvN0lzHUXPnXEGceP4kDQAq3s1BnONaQFBIQHkgIjp8iPMI3lp6PMxiWdIfoynj99HW5TNcJ1HmfbXbRqwz/rKZjLpjhevT0x6YXx8tv0VZ8cxtuoELrEjMFrc6jNjF5ndY=
Received: from BLAPR03CA0061.namprd03.prod.outlook.com (2603:10b6:208:329::6)
 by CY8PR10MB7367.namprd10.prod.outlook.com (2603:10b6:930:7a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Mon, 20 Apr
 2026 07:00:39 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:329:cafe::16) by BLAPR03CA0061.outlook.office365.com
 (2603:10b6:208:329::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 07:00:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 07:00:37 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Apr
 2026 02:00:28 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Apr
 2026 02:00:28 -0500
Received: from DLEE209.ent.ti.com ([fe80::9756:3b42:e53b:3cbe]) by
 DLEE209.ent.ti.com ([fe80::9756:3b42:e53b:3cbe%7]) with mapi id
 15.02.2562.020; Mon, 20 Apr 2026 02:00:28 -0500
From: "Xu, Baojun" <baojun.xu@ti.com>
To: Eric Naim <dnaim@cachyos.org>, "tiwai@suse.de" <tiwai@suse.de>,
	"hansg@kernel.org" <hansg@kernel.org>
CC: "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"Ding, Shenghao" <shenghao-ding@ti.com>, "13916275206@139.com"
	<13916275206@139.com>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "letitia.tsai@hp.com" <letitia.tsai@hp.com>,
	"bill.yu@canonical.com" <bill.yu@canonical.com>
Subject: Re: [EXTERNAL] Re: [PATCH v1] ALSA: hda/tas2781: Fix sound abnormal
 issue on some SPI device
Thread-Topic: [EXTERNAL] Re: [PATCH v1] ALSA: hda/tas2781: Fix sound abnormal
 issue on some SPI device
Thread-Index: AQHczvdWtSfcKYm2QUO5UQbpgpuBQrXn174A//+uC3o=
Date: Mon, 20 Apr 2026 07:00:27 +0000
Message-ID: <819b32735b084ec881af42bd4e4e6347@ti.com>
References: <20260418055030.765-1-baojun.xu@ti.com>,<26976b47-8886-4f3c-bdbd-c15e6ac7c44c@cachyos.org>
In-Reply-To: <26976b47-8886-4f3c-bdbd-c15e6ac7c44c@cachyos.org>
Accept-Language: en-GB, zh-CN, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|CY8PR10MB7367:EE_
X-MS-Office365-Filtering-Correlation-Id: b1a6ed69-6585-4d1e-542d-08de9eaa8702
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|7416014|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	eS3emlI+ab4COigoGjUHz1lN5ww5d9rqjZeBChq5bWsxwvBzwHK2TUGMJrL/7QH6ge8ICH0KhYE8mBeS2ZvDuQiIoK4FFU/1705ak1AP4fwAOL/Qa3Flb6q7WBJauGAp9LV9kudfcNAaZBvq6CxnYkFELC0U2JRfYfy0u6DrxP0+HK/0Q7Xf236eVegyP4RL1mcIx3wck3bTSFgut3sw2c154+4eHHf6KNTU046tp2PDER95iysu8MmboDhB2gi1E9vyaizONFdEKbd337OMgzOFVrNf7+g/BYEaDFgh31+RSC/JlyHgLyKWmNYJaRzbqEEVpzkPegaWkRhbz8TtzAeQVZE+a0UVDFt/1GIYouBpQD/LEza6dTRklQ04wLvMsPGn0ew43uG+V8Srq/OUabUZ/8msq6oiB3+0ANILStUL9UKEtcX0YaUe08pgVgVIduadiZmm+ZRg9jPSpRbfEygYlQiyBhHSinq9iCy6rM9+Q0Fu/9ontBQq/+NnRFgRNiBIR8+T3CuTbHmD89sxOtGjx9zMrZpIb9UjSv/xJQcPHHBktSYsAroaUJUNWjxZ70lqGAuz0nX99FrCt4+lqsKgHDPBiskveLrkFRg0txRYYn7EvOXdQcxX0FDW87kTPOjLoYJvzEKomZoeDyLJMrzzwuyY6l/1x13PR4UL5hzVZnLlELjwikqUtE50OZkWATJnrZLaHU/b4fsyWJwwsb58RqQe8PTh3O9r4g2FxwcGoli3W7irLXSntQoh9mazdZTFhb+lMZ7as87lVlcPIA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(7416014)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JRhhNJQ1FpuFJGIjCQ+WoZZMt8Ek6YMsykW3x6YTZaJ5RjQiCASPT9bS2iD1xx8t9l8RLnPILzgwE5CJWNZHha7EWZLFy7y9uTKQS6YKu8g+zqPK6cuA0wmlMalSunvVaNhKXkUTC0Dh/ewD1r8WRubqrAGGbsAsaywu2s7Smoeid6HTx1i+GL8a/9HkEjLxQhar4J3c1JPS1GWRDr1ziwXG5D5tR8agCw4Q4vkiOI408KfU2wCs7ynDeWbSPhUxnsGtDRS5eX0zL3UTj0pde9XWSSzzGJw01blp+w/B8knBpL1xEcXP4mPIoxBax0TTJfe0OlN+LIl/9N5kkY4P0UWwK2lYGXISmeDZHSb56L3y6l1+oTz9rFZsZ3T7RfFsnEUev6W2xyHsnH34aWw7e0+KWxDeuzEXk3hgZOqCiuMIeuhjxeRGA02CzSW0zkfY
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 07:00:37.8631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1a6ed69-6585-4d1e-542d-08de9eaa8702
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7367

Hi Eric,

>=20
> ________________________________________
> From: Eric Naim <dnaim@cachyos.org>
> Sent: 20 April 2026 14:43
> To: Xu, Baojun; tiwai@suse.de; hansg@kernel.org
> Cc: ilpo.jarvinen@linux.intel.com; broonie@kernel.org; andriy.shevchenko@=
linux.intel.com; Ding, Shenghao; 13916275206@139.com; platform-driver-x86@v=
ger.kernel.org; linux-sound@vger.kernel.org; linux-kernel@vger.kernel.org; =
letitia.tsai@hp.com; bill.yu@canonical.com
> Subject: [EXTERNAL] Re: [PATCH v1] ALSA: hda/tas2781: Fix sound abnormal =
issue on some SPI device
>=20
> On 4/18/26 1:50 PM, Baojun Xu wrote:
> > In the SPI driver probe, the chip ID must be set to TAS2781. Without th=
is
> > initialization, calibration data fails to load correctly, causing audio
> > abnormalities on some devices.
> > And update the register bulk read API to handle the distinct requiremen=
ts
> > of SPI and I2C devices.
> >
> > Fixes: 05ac3846ffe5 ("ALSA: hda/tas2781: A workaround solution to lower=
-vol issue among lower calibrated-impedance micro-speaker on TAS2781")
>> Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> > ---
> Hi Baojun, will this fix
> https://urldefense.com/v3/__https://lore.kernel.org/linux-sound/202603151=
60939.191265-1-dnaim@cachyos.org/__;!!G3vK!X-jfopjNDyUV4Zt7eHbLDT79zxX8PrVA=
TeyHGzNtgCNvue6wSwqHWSaaVOuqjRfYbzZ5TQzNVhRq$ ?
>=20
> Similarly, I noticed that something like the above was merged upstream, c=
ommit
> 0bdf27abaf894.
>=20

To clarify: The patch mentioned earlier was designed to register the correc=
t project with the codec.
My patch specifically resolves the issue where calibration data fails to be=
 applied properly.

> --
> Regards,
>   Eric
>=20
>=20

Best Regards
Jim

