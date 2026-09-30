Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013070.outbound.protection.outlook.com [40.107.159.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3EF39479C;
	Wed, 30 Sep 2026 07:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790755088; cv=fail; b=B1kxLXHbCIdXwEoiPGPgS8TvsUDrlFIpM/wIfrAbvHUgADZqj06ltL4lbNJmppMhuAXgCGjEc56n7DbEfv2l4tdjAmI4QXcOmxJs3Xq68NU6e+vZy5B+zHF84o+tSpAFqSq2d2qIR9DAGRB9eJrIqBWhFXGakw1OZCosUvVt7yU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790755088; c=relaxed/simple;
	bh=ldGJmfUhutZbBzimE9d3xRhGvrHtZBjUKBIf62tDusY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KZTQGu/NNeDkuLoM++qt5GnUe5oWE85sScQ7mYDHdrkS/s8r7f0uJcuuvz1tpu86XR532idaJWvRC3e5WajdZ0uzhecaoj8duKDMUbFEUnFM0yiEYUlvCd3oDslCx8AaUI1+RClK4RSz38P0XvCCK+lwJH9OpAvdyxGlXptVhyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=FfVVgp5i; arc=fail smtp.client-ip=40.107.159.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="FfVVgp5i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wo5O5KGNfAJedCXRxt8I/SLZNHhfyUgLSj1Sm+H5y3y8HbYGwMFtzrpxr6aUi7JSWKbNhly4ZkZG7XuPI0Fr65aulTV27qKCayQgtP9k8U9Csc9bpFlHwt/9XUNldC6QTKjC7lQEaNAXrqWGjse+0cae/3t9zS+mtzQBvYJtRl/vaSP5P0n/GJWcqrmxIM8+Mu5ZnnkxWLtnT2w11Zl6w3MKOIHj9zccwauidH6EG1FHV/66KW7T1OkvwyxaY+GnbbrTuxsAoAferH925W0lmMcC4DkPLsWFzA+6kZp0BtQnrwB8xiokt1YsADrFeeu9Uunt0+6wDWPNm+jpBGXiTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XAhC4etgUAGivvgwVqrNzBrIprByWRRJyytIsfuridI=;
 b=Odb9hkgp1A87mOYQtVWLDixBe6vVABTL3iJHVx8BGg6b0Pj8C13z6ymA4ghi5aPhwETiKp6fP+k79ZWZBjSyOX88OIYxEGb1TERHxzH2SZC0Rf5RJtwIxrAdUwtax5JpaIU9ZCdvKT7A4oq+oldBqvyb9Bxsj82DvlI+/Q0YznneMfmhrPsQLS+Uc0jGxKWCqTuhSgevnCuH63QjkzQVGymKjoCftC0jPNX6/K1APUHRRKXHjTBJZLbs7kGjzEmIjWXlPkdLT2QgYtw0WYjctaEIo21CT9MKoH8zDg28MnGmq7LoHrjH2mHVhqjSzO1CyrinlZwwOoM3oFrHRcMJ2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XAhC4etgUAGivvgwVqrNzBrIprByWRRJyytIsfuridI=;
 b=FfVVgp5iW5Z6Fr9SUflHcA7fUP5oWiWCXtHBotWyCsKhvnVd1dVZdv/XKKroqfYr48UrYsvsdo/M0vD4lv27x4iM88YquB7FpLKBzgsb4oQvyK4UBP6xazDZOnzWJwtPXIJTTUkdfRP5+t/JqRq2sbjUuT06NYMzOWpWy/vA/Y7X/E6dljFnDcPV2aoRLlL/KwbzcuVEBhG7J/mlBWYu+dLBejZWgsz20PHdlOx7L5BKgwhqypIs2+EEnjV41muIW1s0nlF0jBJ20pDdp2yd7cc1L2SkOaWfB0z9onHpAEeULbbJ16YtF1LWhA7AUiz1M9uptCZ24d6TSwkI4vSheA==
Received: from VIUP296CA0044.AUTP296.PROD.OUTLOOK.COM (2603:10a6:800:34b::15)
 by AMCPR10MB992241.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:783::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 07:58:01 +0000
Received: from MI3PEPF00008483.eurprd02.prod.outlook.com
 (2603:10a6:800:34b:cafe::65) by VIUP296CA0044.outlook.office365.com
 (2603:10a6:800:34b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 07:58:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF00008483.mail.protection.outlook.com (10.167.240.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 07:58:01 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 10:03:10 +0200
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 09:57:16 +0200
Message-ID: <90b9c787-af3e-48d1-b9d2-4cec807f6e28@foss.st.com>
Date: Wed, 30 Sep 2026 09:57:16 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] media: i2c: vd55g1: Return the endpoint parser's
 error code
To: Ruslan Koreev <koreev.r@gmail.com>, <sakari.ailus@linux.intel.com>,
	<sylvain.petinot@foss.st.com>, <dan.scally@ideasonboard.com>
CC: <mchehab@kernel.org>, <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<linux-media@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Peter Marshall <pm@petermarshall.ca>
References: <20260929092700.1776966-1-koreev.r@gmail.com>
 <20260929092700.1776966-5-koreev.r@gmail.com>
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20260929092700.1776966-5-koreev.r@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008483:EE_|AMCPR10MB992241:EE_
X-MS-Office365-Filtering-Correlation-Id: a836b5fb-bf44-453a-2e31-08df1ec88cbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700016|23010399003|82310400026|11063799006|4143699003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	03cJ21B1hS/j4rBHyBdKo1DXhLXBfOE1Rohrah413KexMvY2nQG77XwWtQr2gM6IBTCfC+My4c6PjgPKU5j2KJkI7VUgkldMdsRChzZsNKHaCkdPzNZUr6tzLvThM33BgE8TLf3jBVZN9PLfS+QLNDU/nhlF9ksgx0SowH2MxWtti+xUsA2dGTv+puDEfJB1EmMr5m/1OcMtBh1PV39YAEASMJHzWCnjpycfmauxuXDjmQIXuHkM8HCImO86OzglShK1AKR9wGlgOwLrcqUy9a5WUswTd8zbzIvoBzSdT8CzV6OuemYZWsj75vHcYCuhoWM6qsbrvVqy6ref6MbceNVFQIqAtoe6PejKzrsUX6Tg2tb1sSlh2WVtbbB0nt3qqAVBmhU9h8464EjVBzW8ADzz4Iiz4k9bpsFhFLgPgMiGBQt1j45KOuYOh9UxC9JSEEjv+Iswg96TIWQlEo7evAaMuUIXvYsvzovJuH1I/Bmkeo9W63fuaH9kimNnTIG6fKxrdZ3avvPmm7aRiZ7Q7HGT3ZhDmDJAZiFtIWdtvDd3lMuu5lxx/FGLTOREc/LcyaBw7KLMefxkb7wa6pD9OrJkxfntYXENBOlcbJKEnqDhcdTwj3JtjYKndzUI0It1d4T43FqejaFiFV2FE1gRJu5HpEzLrNSQGbiKqqTe3wHuk0waTNssYWfREJnAIILm1AGIdYiOfzQm+30vDoM8WQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700016)(23010399003)(82310400026)(11063799006)(4143699003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dKOTrIh7z1K11OW6fo278zTJm5CmAURyfJ/EefQ8qonZuUu1vZg+KrXT4+Xqp3wXbx+xaFY+agSjJOINivHl4dYkvIOL5ubDpTgSBoLAcKpuHErmn1nrckJl5oE5i18WuBhQFSt8QI54vc/vjBCUov7DHjEwooJvVdOTpyjMh0HvC7I9qESWNzVU0UGy+DT9s8P2RSoUGkPEOqXID7qD9hjwGNso2PIBwWbaFBOcqHAP80F69jE2PVD7M6S9yE7VkLXiGVy83luaQ+14pnyTAFfNNdzpIIwnYwk0yU3nKuCXeRf5ekRwMr07uUr//2ZJ8/djU5ybrUYyyTKpEz6tt2OuDo9Bupk6sfQgt8qMC8/4seZwTEkQdXm+YbMDoZ36UM0k+c0d9NWGhTxcBWQaiNa5e9O+7BWTHZtxrJlvireU+6nqIKLISl4CvBCoavL3
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 07:58:01.2682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a836b5fb-bf44-453a-2e31-08df1ec88cbd
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008483.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMCPR10MB992241

Hi Ruslan,

Le 29/09/2026 à 11:27, Ruslan Koreev a écrit :
> Pass the endpoint to v4l2_fwnode_endpoint_alloc_parse() without checking
> it first and return the parser's error code instead of -EINVAL. The
> parser returns -EPROBE_DEFER for a missing endpoint, which is what a
> sensor on an ACPI system needs: there the endpoint is a software node
> that the IPU bridge attaches when the IPU driver probes, possibly after
> this driver. On OF systems a missing endpoint now defers the probe as
> well instead of failing it, as in other sensor drivers that leave this
> check to the parser.
> 
> Signed-off-by: Ruslan Koreev <koreev.r@gmail.com>

Reviewed-By: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

> ---
>  drivers/media/i2c/vd55g1.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
> index 22b1497e8..8043eaa50 100644
> --- a/drivers/media/i2c/vd55g1.c
> +++ b/drivers/media/i2c/vd55g1.c
> @@ -1801,7 +1801,7 @@ static int vd55g1_check_csi_conf(struct vd55g1 *sensor,
>  
>  	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep);
>  	if (ret)
> -		return -EINVAL;
> +		return ret;
>  
>  	/* Check lanes number */
>  	n_lanes = ep.bus.mipi_csi2.num_data_lanes;
> @@ -1905,11 +1905,6 @@ static int vd55g1_parse_dt(struct vd55g1 *sensor)
>  
>  	endpoint = fwnode_graph_get_endpoint_by_id(dev_fwnode(sensor->dev),
>  						   0, 0, 0);
> -	if (!endpoint) {
> -		dev_err(sensor->dev, "Endpoint node not found\n");
> -		return -EINVAL;
> -	}
> -
>  	ret = vd55g1_check_csi_conf(sensor, endpoint);
>  	fwnode_handle_put(endpoint);
>  	if (ret)

-- 
Regards,
Benjamin

