Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795446924;
	b=lTTpr5GelvLxQRAPV008N4v/MrS6oeein9tB+SupLHlNxJZ1Yy+TvazaoiRzxxaAJ5zT
	 Ygmn8EzydF3eYWmp+093KVX2jSt3zL3zSthoOGR6z/Zo6VnmrcxISBIX0/F6hG+MjO7M8
	 LyICCiHqzSs6jBD0Z3nJ07WsbrzwKgCAzz9n8NIsxBTlh0klzkoSgmBSTgCvazBXvX92K
	 JPHO3vNeP2o0q47k82SlKP3OufWW68PgM6YlOpzeCTk7uBkRaiHSy1vnfTgETLa4aQg1v
	 TNLgyxR2pGEX8ObsKzVPnQnUoaznE2JUY3LOmQp13FHlwYOJIw3IPQt/Yt7Dp8nWYrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446924;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=l42YlKuqEjs2tRqcpKjp92NI3zf3jIm+D31OzuGNHYc=;
	b=U/7+0LATc8xUAVXpteuop6/7tA9HwCgtW2ZqvsYpH7vGqRvEP8TdCV+RcJZySVFu0qk1
	 t6xMALQs5BeZ+R5UU8DA4kXcysnOmo/zFcZUHONhiLWmb6/zadQdkTLosLpsTMiRc4s4N
	 nSl0Ix2vIKQ1I25pdtBfIU9IPb5zjKObw5IecaENmb8YiM30542L13GFftKBgPqJAqQx9
	 e1HExp/HJbOF1ioaILZxxe13emdIZ5TIaSAHFXW59bKkiUdJfYyh/QAuGu7Yewo6djfn1
	 jrYXlvnZMa3/ZTt7dAqAiWhwlTnfAq3VRQvJ9ceuBnvvA+Lf8Ox9ynMoTrnolB7yyzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NW4u1F8n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.45
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012045.outbound.protection.outlook.com [40.93.195.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09653606A32D
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 15:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09653606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NW4u1F8n
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ReFnQ19niC5WMKd86DoeUB7LJ/2LUgLHfjAFmNtv9/E80+PwAwtgqT7M1N9akD1jTHnLDoB9E9cFeggmPkt7xT0XCpxKibGvgUybDzmC0Qw7RHWQaze8M3OZXnKxtCYoKxLG8iWrZSAeHY4Wbed5mXJHVn/kT7ZaHFnhoaT7bWxL/dX89/m5dt1buI9n7iiUkNPQ+lPg6uGrXSITEOzHnyI3BNpIsZNRaLQZSt2m0x/vB9uaBMyeWCjXaHohTag0XGkMEyOjkrtTLvRbZjWSsz0iFOd42+1DVaBVQb5mkWZZhXNEiaHZ4s5lGYpxUCtaWhm4Gg09+cLVqv8E7hjPiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l42YlKuqEjs2tRqcpKjp92NI3zf3jIm+D31OzuGNHYc=;
 b=anZFlCeH/Cih+lk8EhpvwIfLheunHLUD1tAzV7W+aporrl1Tgzwz8GJL3CJuOSw7HoZtK4mjUPnla688NmWPcZkCdVPgUVE9ZMZ+JH75TUFEKuA6oBN+hfoG/G5bZ7TZlOQAG8iu/FpN1/5CgZLcE/aA8L50ssfMyU3YParoRG1lF+qcbsFKnLbv4AsU1E+bMTzv96jBv2PHWVALeZEAkn9yDX0CU2EJV4LV0/lUykh7Vz3xgDc5LMEJU4Mh3/PZWz4asFngDF6npc+UBgz3BcEvp3oRQMCy5ZZLFyybbqjHe4vzxdERU+0UQOdheI3d11AoRwiqF95n+iVaxV5o3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l42YlKuqEjs2tRqcpKjp92NI3zf3jIm+D31OzuGNHYc=;
 b=NW4u1F8nULS47EfOmgjUjyomd0t5tJ47XpbtZA1q1OPLp4JBMjCCY0bqb5viOve2iCJMe4QU8X9FBQ0qTN5axxHEsG/ynH9xnNGsI1RxumBhw0uqIit1C2LcKWnbv2Rq3ybi8FCf268nL7HYqPs+pexMe00SrC5YuLFS8NeXbP5BbWZ06TyRv9vGThDGFodefYQGlbt9sfb5VXlBGOwUTqjPmBwT3iCmEe87hmeYvN4ao/FQbIAlJwWmr7czdbAk9TG5sgvJKJT3CCTivjwUj8XSZeOFR8wEWGnuTJcicrttrIOfrZ92NsN92XJuvH+4JevDrxN7/7WQdrk+iwYk7g==
Received: from PH8PR05CA0022.namprd05.prod.outlook.com (2603:10b6:510:2cc::10)
 by CHBPR12MB319464.namprd12.prod.outlook.com (2603:10b6:610:409::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 15:15:19 +0000
Received: from PH4PEPF0000B610.namprd21.prod.outlook.com
 (2603:10b6:510:2cc:cafe::6b) by PH8PR05CA0022.outlook.office365.com
 (2603:10b6:510:2cc::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Mon, 23
 Nov 2026 15:15:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 PH4PEPF0000B610.mail.protection.outlook.com (10.167.243.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.0 via Frontend Transport; Mon, 23 Nov 2026 15:15:18 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 07:14:54 -0800
Received: from r-build-bsp-06.mtr.labs.mlnx (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 07:14:52 -0800
From: Felix Radensky <fradensky@nvidia.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hansg@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>,
	Felix Radensky <fradensky@nvidia.com>, <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH platform-next v3 3/3] platform/mellanox: nvsw-host-spc6: Add support for SPC6 air cooled switches
Date: Mon, 23 Nov 2026 17:14:25 +0200
Message-ID: <20261123151425.2617731-1-fradensky@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <7f7a0477-95b1-c2d8-a9ef-6b11b740a51c@linux.intel.com>
References: <20261020172756.4160946-1-fradensky@nvidia.com> <20261020172756.4160946-4-fradensky@nvidia.com> <7f7a0477-95b1-c2d8-a9ef-6b11b740a51c@linux.intel.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH4PEPF0000B610:EE_|CHBPR12MB319464:EE_
X-MS-Office365-Filtering-Correlation-Id: df08a17d-ef1c-4e04-fb42-08df497495ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|18002099003|22082099003|261009223027099003|261021121427099003|261026121527099003|261102123227099003|261022075727099003|56012099006|10067099003|4143699003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	UA7Odw9cp2BvcZRrBZFgeZ7Tvd+gVA+ddfPmTD+WgbX4FxgfJ7bHwv4RHySuNnDUZIRMUGraJh1ucC4INZFp8QgnoaIBY917uXss85pLcl3yUs3i9zrPlRrKEXgMn6X7oRQeRBcuysSsDAtEYlAlscDo/PSb6JYoEOJYQjMkRgtoJndLl20KrAZK7pGJM7ENzdbSTJpaSV3dEk8B7QIeSTcFx9cgSAvwMWDmU0dty2ixEsPu+Dyl4nAl1EbKhU/oiXmls5jMF55t2n2/EQ6Tm0XUcCipQzi2/yyadjCNpfVhIJfTvp71QxeI7ZzBJCiXBHjnKRXjPa63Z9rLbvyWptfYWmNxlk2DymYxOCZVOtIe96zAvbsyspnLUxTUciXUKc4dAYRafKhdHlLGQjS3hDCnD3hvrDBPygzOJpgilmvBX3El0NPtyrmDzc5OdbJTKHNCsI4VA2dTKkBuRAGdCQfAkUq01DfPMHXH+Mr6AChSZ0vcLs6HoFugazqCfy3zVaK53JsnWkD3TfwCzW6TdHaekNX9hN4az7C97phwFj78bTbZ9cF1RuY4yE95DtdUxiOOsyf1h6WLQVh5aC2f2wFC7cMf/taLlkn/iZcodDgqb5+jh+S4JmXKyfSD+u/qXOPOYeVCtcZBAlhTS1P58fpGXRd4o9ypn2/HIK9b0+Fw4lC41bqrTW1ShWZ3Uh7Q0FtzgTEbmXUif8G56GnVEg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(18002099003)(22082099003)(261009223027099003)(261021121427099003)(261026121527099003)(261102123227099003)(261022075727099003)(56012099006)(10067099003)(4143699003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6WWQM0kzHAcOY9xfS5pDnZ5WUzYxEAfF/Kgh3cjqhU3BdHI/3dZMlgqE066Xc2dYtSKcRSCBFHNJO05JCKzawo2Gi4zOEn9Y9Eoe9r7l6OkhfmPXRExRAG8nOTI4LYnEfaH6LyNZmPQuxt0tGuktZK3f2z6H1aAu4XuZS6wAMHn4teqJPRb+EkpnBHfo6D9/3cINdUA+0e7hV/MT1HSXc4c9g6tRGgZCDeUtUIDa3bPR6yaHpJkkWxJ11/aVOdH+3sxJpjogAo5C3xwyBYOVjDUHup02YjJjOyVbXEYB/vXWVsfhyHnsJnwMLmMhXA6PE8/AczyZpc6A4TOP051pT1xGDogTeRFfpFiP1AKict9Ow/F1axO7GC5WJxfyvK+QErIc8OrovmCK2C02FnRRCDf3H6peGZdP8cNYNM+rjqwD8R7+bb3p9KD32Bve8rjH
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 15:15:18.9620
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df08a17d-ef1c-4e04-fb42-08df497495ef
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH4PEPF0000B610.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHBPR12MB319464

On Mon, 23 Nov 2026, Ilpo Järvinen wrote:

> Please check if sashiko's comment this patch is valid or not.

It is valid, and it is already fixed, in the LED tree rather than here.

The finding is that the ten fan drawer LEDs this patch describes are
never registered, because mlxreg_led_config() decides whether a LED is
present by testing a bit of the capability register, and these entries
carry a slot index instead of a bit. The capability register of these
systems reports a count of the fan drawers present rather than a
bitmap, as the cover letter described.

Nothing in that is specific to this patch. The same description style
is used by mlxplat_mlxcpld_xdr_led_data[] in mlx-platform.c, which has
been losing all twenty of its fan LEDs since the table was introduced
in v6.16, so the gap is in leds-mlxreg and the fix belongs there. Lee
has applied it:

  68a2bfdf7b4d ("leds: mlxreg: Fix missing fan LEDs on systems
                 reporting a unit count")

currently in for-leds-next, so it is queued for the same merge window
as this series. It teaches mlxreg_led_config() the counter flavour of
the capability register, mirroring what mlxreg_fan_connect_verify()
has done since commit 1e11552ee54d ("hwmon: (mlxreg-fan) Add support
for new flavour of capability register").

There is no build or apply dependency between the two. They only have
to meet in the same release for the LEDs to appear, so this patch
needs no change for it and the LED table is unchanged in v4.

-- 
Felix
