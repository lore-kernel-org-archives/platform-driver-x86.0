Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010038.outbound.protection.outlook.com [52.101.84.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BC847CA79;
	Fri,  4 Sep 2026 12:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523581; cv=fail; b=bLE4/vG3aLFnAOzxcRkfll3GvbJNiH0FAiGU+MPxhp+OxbyOHfR7vTqthth40LBNXpIFhAC0cuRleFoWpYm/w+dec6OoTF73Bak887U7uMEZIRjZP42xhkw8qgr6Td2/se/HTYwGTi1bGZsg0KfIFkjdECQN/1Ur7Zp0MRMDqSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523581; c=relaxed/simple;
	bh=iFsn6XDiHgr097z54ZqpY7hmp43F2R4aKGZh0/gIRhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BccNdSoWpJstCer1T3xH0cDNO2bNPOW+s8vDMTMnS0iTEdoHMP7F0wT4TxtxUVwghUTfh+GnEpSQgDoORJ63gCt0sMa0vID+ls+skYgCcZloKOpjuIaSCl24EWSIdPe79rQYD5idy08iKffdhS/HRmYeyKWWx0dLLA9wiRwhAyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=OfgbReBQ; arc=fail smtp.client-ip=52.101.84.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="OfgbReBQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q7Coggf9wGowJNsSKLR3GN4tB9Tlu7C4Lh9i9I33bx870FoaDtXnFwSowO93/X6vVsixAEV2gjBCy76GEuSne2mmXgD0X94eImLOno159Upt0dkzxyaWVCwKmA5DjkPQKYqsDDBGHduiMGj1UzGAe9mOjRBW8NbYzGLKdooP5WU5wkI7IV5Is1+fuiBDFmsYelGzps0FCqHCsXrAPEDY/7H41i7doCaP9kZIdGfxNM1r0x3tSkh0xTqdyHP0f4HxmLqb0s8BDVtH1m7lwjbedC2Vp1g+dDbgwomXTCmYdWJTtmurCkVKMM4U1BEdlUy7fxltGKAyPYpb1VWXY5KnOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cu63453tnlNgodKSz6fxRHOGKcS1siGmfk1sqPQcOBg=;
 b=JFgC/trTFtVM0XdXxqEPIZzHAMcTWjWmILp2ttQLl5lRltRfjY+etieYXVMqXdkQMfVpouHFSXxAl9iILuVkGgbIDwZfrLVgPf4WSBjbfMke+If8z1jgZW+NjBefrocCVP2SIfWTsfIda0Nos/nX9boztLfnsWYTCVoSZ0pfGUHd9CZLFO1IdY0+KVtJ7/3jkSqoyXHFAkKDVx7xM1V/1vF3gTT/ChP3MAeXFWhwbvkQXcSkE1/ZHsA1eE0lEgoMpk72chVW5WzY5HAg07InuC3wJ0ig0x10xb54hg9bFBPu1BW6G/wMuJjo7TfAtdnYjDCalL+3klchmH9eKAslTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.87) smtp.rcpttodomain=petermarshall.ca smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cu63453tnlNgodKSz6fxRHOGKcS1siGmfk1sqPQcOBg=;
 b=OfgbReBQra6jHg9egvf0Hsez5NFiMk+8B3Ln97ZcmuqJxkkgmYuB/uI3cRkGcvXZQKhYJqXolNPRbdgEAJLRXm3xpS9qDShmfvbw7AW1s/gxcty4rurQkURO46CgYfReiXSDPZEOffPuZSZZRum/Niq47j8YVMPu8lrCw18EVBptcJEs5swSql4dryNDfUDc4Mg9ODKdK0AOkXZLi+11Fj9bguNVtFDg99XqIdh5NCc3NzoUQrE7Zs9eGLF3aYbGL5/RN69oxJd+NU399vbJ1JVhFTVEZowJIeymOZL7MaKGrpIzwGZ0sk7f+nnB6VM2J3Agg3xsE9EgdbZ747wVAA==
Received: from AS9PR07CA0056.eurprd07.prod.outlook.com (2603:10a6:20b:46b::32)
 by AM7PR10MB3608.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:134::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 12:06:14 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:20b:46b:cafe::6b) by AS9PR07CA0056.outlook.office365.com
 (2603:10a6:20b:46b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.3 via Frontend Transport; Fri, 4
 Sep 2026 12:06:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.87)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.87 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.87; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.87) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 12:06:14 +0000
Received: from ENXDAG1NODE4.st.com (10.75.129.197) by smtpo365.st.com
 (10.250.44.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 4 Sep
 2026 14:08:10 +0200
Received: from [10.130.78.67] (10.130.78.67) by ENXDAG1NODE4.st.com
 (10.75.129.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 4 Sep
 2026 14:06:13 +0200
Message-ID: <b7e8939f-646a-417b-b4ad-1785359c3343@foss.st.com>
Date: Fri, 4 Sep 2026 14:06:02 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] media: i2c: st-vd55g1: Genericize driver and add
 VD55G0 support
To: Peter Marshall <pm@petermarshall.ca>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
References: <20260902204549.657228-1-pm@petermarshall.ca>
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20260902204549.657228-1-pm@petermarshall.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To ENXDAG1NODE4.st.com
 (10.75.129.197)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000040:EE_|AM7PR10MB3608:EE_
X-MS-Office365-Filtering-Correlation-Id: 006f9d33-cf00-42c5-4d9d-08df0a7ceaf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|82310400026|36860700016|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	t22xT+5wVe/JPtLzVIFwUb8ecQtYha24LbTJYFjZyZAqOjIRZYjQrlTdBK9k7oKEUQvgyoCOdPjOyP3U9N/MhxCDV2aXFO4bMzi/clrlR2Om0k9LJuQEK/sscbbU3pjdLBKTcpb39artpU1DJvRprXnnLxgfT2A3LvGH01Dg0HJVbJW1AW2Aw256uPa13XYgrGIMcQp94zind0UXzCzS/kIH1eUZQWHYCT7YFd7hr2KifUn6pZZbzcUTG7UOsPIwB0iJSrT2WsnvaKzzQhEfNB+oJrn5uffqbKIiinqpifY6XcMfNbMKdWo2T1i5T5aLGTGJIymAgWE8tz+Qh/8IP72+Y+KPckNNL2iWUd72+N3dcSArphxcunTJeiU/dv4jRjEoQDEvWcVOZzeeDIXi95QELmKNWOcgJVE71KDahKpNflqCka3mLouebF129QiTI0CeCQjfeZMrR+KN3Tq98yJYpPdf4asiMOwcaXrvp+1Yh8Rkix+MNqcrhtyGaHZ6CI8nGIeKi94gR0+9m62P98uHbNeI5J7+3Hy5PUks0veLWuDrt2oTiZnoT+aPI2duu8snRg5jHM3ueWztYujlO7MtNQNw9zvJ2b8RWFvoj448e2BFjkc5jieMnmAaUSNJ0s9lVUpeNFs12mIX1aOpmbsCBTwkCg10UPSp4qQ0d3U=
X-Forefront-Antispam-Report:
	CIP:164.130.1.87;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jUOkGh4dXOeUHxu+3iilDn4ukrWqychr/a2KMB02dim5QNK5OpqTfOCVvrlXNC+x5h9SMy6d95zZjCR0bd1FAGkClla6qPkRnWZnckbS2Wz7J8b4769++Yj2UDVuXqOflCfi44Cqmg04l1iKPeUzpGLvPCtq6On/HWVZ8PS3eSnMsxG5FGJRSq1voqM4n8okoWeOAVrPYjRvlc7d8Ey7NqOoZbGWnww6BHPHTV7d8O0vlF4hI/IS2TQQK8NpozgOxgIHElouRBMaUjTyS1AOlT9HuC85Gdc+9YhXkyKxqG9SytcrY3uGrzsB2ntzPeaNYZzB+nISlmAwkLnGB0cmUH4bsZ2eQHSSJGrUpITorFCOdAob4+ul3gRSkXhlFaJ3AFMQaO6FO/Dyo0dBPuL2nP8iAbto8aqYBpXGN69K8Spj9F7TqsrXrabWSukQoJmv
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 12:06:14.2913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 006f9d33-cf00-42c5-4d9d-08df0a7ceaf0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.87];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3608

Hi Peter,

Le 02/09/2026 à 22:45, Peter Marshall a écrit :
> This patch series refactors the STMicroelectronics VD55G1 and VD65G4 image
> sensor driver (vd55g1) into a generic VD55G family driver (vd55g) and adds
> support for the VD55G0 monochrome sensor.
> 
> The VD55G0 sensor is found in devices such as the Microsoft Surface Pro 9 under
> ACPI HID `SMO55F0`. It features a native resolution of 644 x 604 pixels and
> differs from later variants in the family in several ways:
> 
> * It uses a different native resolution and register addresses mapping,
>   requiring specification of generational feature differences.
> * It lacks support for spatial and temporal HDR.
> * It requires an exposure duty cycle limit to keep the illuminator current safe.
> 
> Tested on a Microsoft Surface Pro 9 (an Intel IPU6 platform with ACPI
> HID "SMO55F0") running libcamera.

I'm sorry I haven't read through your whole serie yet.

First thing first what is the point in refactoring both drivers into the
same one ? I guess it should be addressed in your commit messages. To be
fair it even looks to add complexity because even if the sensors share
some IPs you might have notice they are in fact very different. I could
even argue that the vd56g3 is closer to the vd55g1 than the vd55g0 is.

Plus having your commits merged will also require changes in libcamera.

Otherwise I'm interested in your patches 3 and 4. If I read it correctly
they allow the Microsoft Surface Pro 9 to use the embedded vd55g0 right ?

> 
> Peter Marshall (7):
>   media: i2c: vd55g: move patch array to a separate firmware header
>   dt-bindings: media: i2c: st,vd55g: rename and add VD55G0 variant
>   media: ipu-bridge: Add VD55G0 to the list of supported sensors
>   platform/x86: int3472: Add VD55G0 supply GPIO mapping
>   media: i2c: st-vd55g: Add generic driver and VD55G0 support
>   media: i2c: st-vd55g: Remove legacy vd55g1 remnants
>   MAINTAINERS: Update ST VD55G camera driver entry
> 
>  .../i2c/{st,vd55g1.yaml => st,vd55g.yaml}     |   30 +-
>  MAINTAINERS                                   |    7 +-
>  drivers/media/i2c/Kconfig                     |   11 +
>  drivers/media/i2c/Makefile                    |    2 +-
>  drivers/media/i2c/vd55g-fw.h                  |  305 +++
>  drivers/media/i2c/vd55g.c                     | 2166 +++++++++++++++++
>  drivers/media/i2c/vd55g1.c                    | 2061 ----------------
>  drivers/media/pci/intel/ipu-bridge.c          |    2 +
>  drivers/platform/x86/intel/int3472/discrete.c |   18 +
>  9 files changed, 2531 insertions(+), 2071 deletions(-)
>  rename Documentation/devicetree/bindings/media/i2c/{st,vd55g1.yaml => st,vd55g.yaml} (76%)
>  create mode 100644 drivers/media/i2c/vd55g-fw.h
>  create mode 100644 drivers/media/i2c/vd55g.c
>  delete mode 100644 drivers/media/i2c/vd55g1.c
> 

-- 
Regards,
Benjamin

