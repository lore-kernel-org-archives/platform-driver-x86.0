Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2045.outbound.protection.outlook.com [40.107.100.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCFD220686
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jun 2025 17:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750354067; cv=fail; b=rcWcXblu89Lw3OnjeaSrPq0FXEkB/OVonOMt2PwmuDMSwf0VlptKvvdrKvpuKfWgZ5J7ypWjIvnxvsiAwu0IGp2GSL/sPutPQfDipVzJk6mm1xINobLPF2neUc4KKJWMMwK7fBhspZU6WjZHCLcwdzMWLcjjmLB3n4QKeJ3C72I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750354067; c=relaxed/simple;
	bh=c70F7ZUW9oyQSwO87xzuwn+dEjLvtb3AvgDKam3gEMQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cyxTkVNiXHluV0pkGQuOFnXuaKUqRLI0iMLHufiGc1f1Ga5Y0++obdr00pkqQxb/J3JK6RutetPDcym4qUFaIo3sHDBrPMGpLswVbOviO9kkDf9SDwAkd8VP5l2ABS6eyIXGOWcIikbrym7UtdEQqFzzCAjN5Yv1CBXEiF981wo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ToOwGIrL; arc=fail smtp.client-ip=40.107.100.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ToOwGIrL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hs6WPZSDx8Bd5ydHJrCplOZXXi5m72+ZNeecDY492vpfax9LWMuvGSQ7+boP83JqoVO1vKjzBRG6W1PxLKUQ25VC2OlxoEElWLRDFMGctPUlrT5PCzEM42baabCnZFQxveSwC8pzhbZ9bF7kIJSQK9PoJIOpgNPYWFzvlnIrKZEJ+/of2cQO1LghwZxDQilFGXHJi5sa03Dx6EybGkOFSEI1sj9VCczPBGFXDRdCUBh0r0Vw39UF5ji7V/0YLQIaVlIZ1/WRcEW9fPaAq62Bvdl8Dr2GoKmLEohYJnZvQALwMfrhdw0vhx99kS2J9s2DoeQbTp0ELDtI2DmdW/2iXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnrZRd/WOOX0HdSF4qWnoY0ys2qn+uDl3nHeslknNS0=;
 b=OgktH2Hk6WG0Ij0lTROmLt+i7CkDqspi2YQJyv4nzFhOMPgkm89NDZrVeulpkhBni0uXf0tNXPc8fSkj5qqM6qRbKGKizFUxtV6Si4v+5vZqPN8YHUy9TRE53FJLo8CdAxNDaXTtGDnRWQn/VclUM91pc6B4/AyuqWnzZrYoAHal0TOP3HzWKP9Bi+gKmjjybFdCdxkwLoJBBfy5LQhMSMD8N6KuomTcfps/eRN98fchhpR/Era46erzu9TXdxdp9PGIXZ2VzQpgvUsssfoxr8YfFrlwb3M3H79X3MuFWvXVZomzsTBYEl0VL1hVswjxjIz/AJgDMj17hW/vHk93vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnrZRd/WOOX0HdSF4qWnoY0ys2qn+uDl3nHeslknNS0=;
 b=ToOwGIrLzMDabzoo8aPB2Yj/JGSCBewPZEuiEwyjJ/q5GStiK4NqAf30hNSQ4p7gqWEPN7WuGtjXUQ6v/1TPy9/IYi6qqGdoljSBsGMiANP2l0xZ2dJdtrfo6tw1UrGBSMwZJTazgFtWNT1coy02NJzbM9fYXz01ToUJ1PpVl/VO9lNHiSY2ysjdQsaupLH9JdM81GDxhFurnYCd/b99r4IF3IiIy5ca5LsegFrjg/JuIiuGVbUuTKir2wAvomcbAy2JI/9kdhLxqxhz17sx3GOtFgTxQ5rNTthofMzQeLfdwitDvWEo6CW2ynVlShbXkGLoFFvdVVE6Jvbabpi/sQ==
Received: from PH7PR12MB5902.namprd12.prod.outlook.com (2603:10b6:510:1d6::8)
 by DS4PR12MB9585.namprd12.prod.outlook.com (2603:10b6:8:27e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Thu, 19 Jun
 2025 17:27:41 +0000
Received: from PH7PR12MB5902.namprd12.prod.outlook.com
 ([fe80::f62:33c5:301d:edf0]) by PH7PR12MB5902.namprd12.prod.outlook.com
 ([fe80::f62:33c5:301d:edf0%7]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 17:27:41 +0000
From: David Thompson <davthompson@nvidia.com>
To: Alok Tiwari <alok.a.tiwari@oracle.com>, "hdegoede@redhat.com"
	<hdegoede@redhat.com>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>, Vadim Pasternak <vadimp@nvidia.com>, Shravan
 Ramani <shravankr@nvidia.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH] platform/mellanox: mlxbf-pmc: Fix duplicate event ID for
 CACHE_DATA1
Thread-Topic: [PATCH] platform/mellanox: mlxbf-pmc: Fix duplicate event ID for
 CACHE_DATA1
Thread-Index: AQHb4OAuNBxFGhouMkCrfgo6N+T9yLQKu9+A
Date: Thu, 19 Jun 2025 17:27:41 +0000
Message-ID:
 <PH7PR12MB590262FD5D49E483BD664C63C77DA@PH7PR12MB5902.namprd12.prod.outlook.com>
References: <20250619060502.3594350-1-alok.a.tiwari@oracle.com>
In-Reply-To: <20250619060502.3594350-1-alok.a.tiwari@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5902:EE_|DS4PR12MB9585:EE_
x-ms-office365-filtering-correlation-id: f90ed901-c69b-4b1f-3125-08ddaf569858
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?XL8NCevay0Q0uGyusejXXpixjQrUec6pFoa4xohw8AyXVfMhjv0auqxUszLU?=
 =?us-ascii?Q?2myi0/kx4Ino0oVnuZ25UWrmkBcRrul2VDoOBnEc+aSrvRg4pQojLurSJHRI?=
 =?us-ascii?Q?Ik180inHppJLlNsOCXA6gFrrM8mllecKFQhcZvTbNXXQXxJEmWYg/vov/bti?=
 =?us-ascii?Q?6LjPn+M8R9pmHpCTSJjlVqwgpQAAjz5J+Wcii3CeWbRHrDsJ23g9JyOtsa4D?=
 =?us-ascii?Q?elQhxcaHrJFoS3OWPOhmwhr60yX3XCRYidcAF17sz8pE3q9qCUImqnSng4Jw?=
 =?us-ascii?Q?7m22VfYgIi5sOX6hJ+Pa6IKKgyQGVzsKUPV1XQQrh8vQdbxzVslNWL48I6SV?=
 =?us-ascii?Q?2L4XNYMMXMToOXXv42erkWe5ck3MXPuF3RN8rFc/478WVpItGxr/yiIBfn9C?=
 =?us-ascii?Q?2Honq1TeK3KH+LLsCewfzXX1DPFP+z40yzvYIq82R4GzYQIeL9Cv6Gkgk0+5?=
 =?us-ascii?Q?NaOcr85AXeCXnur9wrVFcmg9dPpZs16+463IouQrfIzwM2KIgbz63qmyUsJX?=
 =?us-ascii?Q?QIh0A+7WDdx1nTTSsuems6ZkBhRNHHLKQ6FW/4srIY/4+svCU3gX9Y6OPhw0?=
 =?us-ascii?Q?d34tDK8Wh/OS63VOTTBTg7j/hFa4x8C/q1tQJnNQqMqiWUyB/wSmYO9ynjXR?=
 =?us-ascii?Q?ywo4crKa8ehOyDaPvDFlc/1b+WYa7FDnMJFBE9N7ap1AtrnsrU3nAfmWsKNw?=
 =?us-ascii?Q?YbZQUIyV5++VhUwqI7vYXczt3qoVsuObca+wM95ng7Q7w2XnIAavEE+wMctl?=
 =?us-ascii?Q?f+oUWocq/wn305WdjSb9XHjj1t8d4v7N9QEBy+icbHfTkTYIOmi3MIJPqZjA?=
 =?us-ascii?Q?eAPy4+nfC0u1Prn6hIdjGFWww1Y8tvJk1yheh4aWfZVPBYWwy864brz54l5Q?=
 =?us-ascii?Q?w6Ult9CWyIg48xcXK1RNrIWHCT6Znf4Rj6WUGW9k4YBRC5NmCMeDC8iYgKFs?=
 =?us-ascii?Q?TB13mdiz3b1WXEW42JXYqnxmOilK6ogxe1X2SWHWRiDOCrDancIjTAwfBXtk?=
 =?us-ascii?Q?V3qWChEBPU2ARorgZ0Ir84w8KlKYNeZeT+tqygvCjOybr6QNd6teZwodpPTC?=
 =?us-ascii?Q?POSDNAD/W+wlHqvJqEv7VY0muu0JtcHKeZFupWp8mD6udyi/pLIuoWA7cTWH?=
 =?us-ascii?Q?wsP7o5liqqSlYSJKTEpXDB8ltqcjTeeWcqZRy6Ey0N39E5dJJWM3vUM32QqZ?=
 =?us-ascii?Q?Ttz6uUTvhrb/bKfRWs6ZWTT5GrjQ2Pi7e1dflFV/ipYn8EJKpInuBJc0EOfL?=
 =?us-ascii?Q?G7q1wr6enx4cBQR26b7NXkl4JLPlh/KFlR+Zj6ZWxAElzyzEDTgMo5Zinbfo?=
 =?us-ascii?Q?KaGy6qjGWWycuYYN8SsYnwT2pjjn8yge+vnVh7xQEmZnNBdvKVN07V8+Duf2?=
 =?us-ascii?Q?9e0WKz5UI0S+CpHr0zQLZYHYlLGUtaTiDkpS8oULdr87zZiZJQDeVEHEMVns?=
 =?us-ascii?Q?sFyqgdFR6Twn/4HysGef6OQiYQISCPp7WB3kHMDnHcc6asKsLBEEqWDCYm9S?=
 =?us-ascii?Q?VaDma1yAgBGTntg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5902.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?PrYFwZ41Z+bDycQLL3VIsxIAMBd3ZCoPrwzrKFLBXnOEjbB0NN/y7pCMh7ej?=
 =?us-ascii?Q?A/XFmmv2eBf7hxZXypFsAC+/Y/sfwAENsRbrqecCW2kvxGnUDsHXCmbAzt/O?=
 =?us-ascii?Q?3KSo8UDgq3DGRxl7K6BG+8VAX6qBwHuLYkThoRz9IJo62N18kaq9heM+Z+t5?=
 =?us-ascii?Q?s8cAqIjzp3C0D5O36jo3fhyugUb645IMumTvvFjwHkGUU04jlY1udaxCW9ub?=
 =?us-ascii?Q?PzG1+KIlDwopLMZX+dWzW/LlX5iPnW69pkSOJl0nJ2kB2BGzXmMpJ/Tuy8A3?=
 =?us-ascii?Q?+W2OediW2yN9mIyZad+LmBKj+BdmC8HtNjpo42jnLJPbuvEh69TLoyoWFr4B?=
 =?us-ascii?Q?U9/MsZ8xa2JygRw1OxxeiLgrg27Ux0grZTfOTNgo4yXxFz9ee6oq3S4H/d57?=
 =?us-ascii?Q?cJYBWf5heDSQHkHbu4cg/bqr3f0Iinq8l0a25Bb9dn/dKPeG5OgcQXCJhKLH?=
 =?us-ascii?Q?H8yAb6sQh4Q0YNSUfWJLpR7MZCXzBJG6xpH3igH9gliuhYL+CIJIsZbtWIUt?=
 =?us-ascii?Q?LCkVpzamPDuHZ7zG1peMDnNHmxGjbe1RT0r1j0222KCLX+mZ/9AkJpPkQa18?=
 =?us-ascii?Q?rJJFbMH3nR168HvIXvcosBxU7wJaXCz4zCJ5i2git6MQbNDcWE30xKQuNQAw?=
 =?us-ascii?Q?SVPHqGvKfpcy6pqyyiwm4T6Lvs28YyO/Kwb9vLXMI8Lza55RDng9MFkPSMdO?=
 =?us-ascii?Q?cour3iDfC3mLM7VUxWWeXCHoV/XttcOwDsf87OXztBKtBsSFy/x7x3j3+0Gk?=
 =?us-ascii?Q?e3W+RuPfmaIiIxRoZAlI1sQ+dYy7wKONEt7Tc/SzwKje3MFYICt6xo7D5cyL?=
 =?us-ascii?Q?zdkzqc9aiKHVm1EBG5qzlnQbfXPB1fL4xZZLU70JLOw3TD8eCV+mtwATvq98?=
 =?us-ascii?Q?jhN6p9WsB6G//GJNSJTpjws5D1QzgnQu4h1buJVftsGRFPEIO6yo7ctcF0Cd?=
 =?us-ascii?Q?/BZz/HMlV65QsEK0+SQeNj7RO2l0mARFgLrf4yKvCFITzN/lOSxWkPLJG/NE?=
 =?us-ascii?Q?qjgZizBqVXp42Xa/xds+ztuh03h9/aCJvDYIQovl3zhrNCx8lsq4jTro6ILs?=
 =?us-ascii?Q?zlEi5wPVEixCBWo4B3sSeBucaYK1M02PwdKWtjg0weciWH5OcPlQLgl7QvYt?=
 =?us-ascii?Q?3YlXhB0hk1iuoLSa+E+9pJo5Oa+NNSsgfS69me61W+ByrOnupR/t3C90hWK3?=
 =?us-ascii?Q?nQiThZ66YmoOlJVj/i/6UnCrUs6wkz2wZTmQqEyXxBFkZL5jPYcBHERWL49U?=
 =?us-ascii?Q?eEy7RQywL/ntNQMNGBozCEqDYGgjN57vaS63M1uFPsXyxys3yq4Da0jtuL8B?=
 =?us-ascii?Q?mGkYCwMFlqP3Td/6cIA17FwdK0Exl2Y7uNPfeoM+hTPQ8lwqJVwkGyR5Bl9V?=
 =?us-ascii?Q?1mvspSwilCMIJxGjyghgzriSIT7NsYg5Hh5r6vCa93mrlBTppXJZPc6rf7jC?=
 =?us-ascii?Q?hpVLftRF4aetzLfv8jGpy/o6aIY9bEnGNL9gZFQkXRsK4Ra8FaRDnxGzDE3b?=
 =?us-ascii?Q?OhGfLVG1C5Di3Upr4v2Id5lglFAcmyzqDbopzd40aPuz6gwtfewvixRres2t?=
 =?us-ascii?Q?1nawPvREJiMEvR3BtJwLY+/s1nSkteBab0DTrYSU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5902.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f90ed901-c69b-4b1f-3125-08ddaf569858
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 17:27:41.4230
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tXQptR+gRQLbSh4z6izL9CP/nvj1bHvt7dq75kdg7L3CCSmZ8dybvti385EEhD1JdmiwbNwqZqdQ7gtwXJry/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9585

> -----Original Message-----
> From: Alok Tiwari <alok.a.tiwari@oracle.com>
> Sent: Thursday, June 19, 2025 2:05 AM
> To: hdegoede@redhat.com; ilpo.jarvinen@linux.intel.com; Vadim Pasternak
> <vadimp@nvidia.com>; Shravan Ramani <shravankr@nvidia.com>; David
> Thompson <davthompson@nvidia.com>
> Cc: alok.a.tiwari@oracle.com; platform-driver-x86@vger.kernel.org
> Subject: [PATCH] platform/mellanox: mlxbf-pmc: Fix duplicate event ID for
> CACHE_DATA1
>=20
> same ID (103) was assigned to both GDC_BANK0_G_RSE_PIPE_CACHE_DATA0
> and GDC_BANK0_G_RSE_PIPE_CACHE_DATA1. This could lead to incorrect event
> mapping.
> Updated the ID to 104 to ensure uniqueness.
>=20
> Fixes: 423c3361855c ("platform/mellanox: mlxbf-pmc: Add support for BlueF=
ield-
> 3")
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---
>  drivers/platform/mellanox/mlxbf-pmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/mellanox/mlxbf-pmc.c
> b/drivers/platform/mellanox/mlxbf-pmc.c
> index 900069eb186eb..a1c529f1ff1a4 100644
> --- a/drivers/platform/mellanox/mlxbf-pmc.c
> +++ b/drivers/platform/mellanox/mlxbf-pmc.c
> @@ -715,7 +715,7 @@ static const struct mlxbf_pmc_events
> mlxbf_pmc_llt_events[] =3D {
>  	{101, "GDC_BANK0_HIT_DCL_PARTIAL"},
>  	{102, "GDC_BANK0_EVICT_DCL"},
>  	{103, "GDC_BANK0_G_RSE_PIPE_CACHE_DATA0"},
> -	{103, "GDC_BANK0_G_RSE_PIPE_CACHE_DATA1"},
> +	{104, "GDC_BANK0_G_RSE_PIPE_CACHE_DATA1"},
>  	{105, "GDC_BANK0_ARB_STRB"},
>  	{106, "GDC_BANK0_ARB_WAIT"},
>  	{107, "GDC_BANK0_GGA_STRB"},
> --
> 2.46.0

Reviewed-by: David Thompson <davthompson@nvidia.com>
