Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011061.outbound.protection.outlook.com [52.101.65.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816C0378D8E;
	Mon, 28 Sep 2026 08:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584803; cv=fail; b=CEJZTsYR7GF8iWTWXIVIT7iVW0Q+4pmFIllNWtsiZV4KXczBs4ItDKEcTkKt9RygIgLOdIU6qBHw8HrgkjG8MSg7l/JIutyaONGX2q84eWW16DCiDsAm7gBvtydTS1TwWt0JIw5VgvSFHrtQNwQOULhGLxr+7s3kyUNv3xC8Q3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584803; c=relaxed/simple;
	bh=/o5n+XoGCMB2opa4YrX66RCPxGbeeAVcoV0fsdMl96Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=b1yRP28BcugvpuVk3zxcAQxx+JWe481biH40RzOOCn5FKNZ+Rir2HGv0Zf6JWNGCWJRS4qnAeWuzmZGCdTIvh49fTWHbfz0LOBmHdKkjU0cLyTIJ7aMoVp1WKnnvrF3NzlgI1MqqkUNlG8SEI4CAwjWvEue5/Gts/HjwqXrtAO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=gBSUfPEL; arc=fail smtp.client-ip=52.101.65.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="gBSUfPEL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VilYyowZAX/LP1GvoCVuWIxsFhwBLi3Vj48Xn/pHKtxaNXz7z9mjqRmseXeSRRPS/OfWXbKB7v6dFJ+2gEFyPTQ+7ZbcapJHpq4FYLDS+9o/M9rA+WBXrpb+kuXGPKRzajTZutXijYUwcgJZ1qWWMd+WbZj9HuTUkFZZPgws1n51qGyM5rJls+xcZ+g1onWLqewrZ2/TS1WT8sUfyVQm75n0lC83YpQR3Q1pmHqZ7X2atx08r5oVk1fgsBquG45+XbP8hZwstj69QLI4T7sm77DuNrXz7xT9DmoZ1eS9abS9f4wyzxuhNMkD12OpLJFUUrNx4ODgSZwaA0SOTo0+og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wak1EA0T1k0QisRAbtKv0el3bKeIhtli8OwjZK/KFaM=;
 b=MrMoeKMbNqLh3vXnw59wNX9y31rzrsj3o593N1UKDOlUaOe4zw/SrIYOXzJykrXE9zFIbijpIEinyRXaJIRehJdmcs8PMPUibvx4B255915U33Ob6+9E1jkxq9xSHT1z4kgZe4guHGWFbhj7jSLdDoAkQU2q8HjAoSfG5fWnPyKYD1MxGAjsSLwFa82h/K8PPcmafhBFtugq9prbkLzvN+ZkLwOe3LrBhsG/ADC23xSV4JR52XEvEZ/tMbND4gRNKceZ40XcKWLJ3+A/1UknoUna2Rv/eIFvqYP9mkOi1Dx85xq05tncQ2j1RZ3RZjHT89oL3Kccy840t7oXX4ILYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wak1EA0T1k0QisRAbtKv0el3bKeIhtli8OwjZK/KFaM=;
 b=gBSUfPELkMEye8o/FeEy1hacF/j4h9Ki72tko8Q4EQX1ijzDZ7s6Niaw3ndUDL9XPjJ/pvcHNMQx4U34M8juIpwvrN9yLInm9zgZgSoLV29OhmZLkkPdfAeqhrYhK62D5NzZc67LRlRMxcwsTP69bBaX2bazCOFRX8jcXs4ZdrHwqlAV8707zIdby+5derD/RSK2oUP9stNvyNtdmum3WhXBs2ORGkPKRy8jxZJqUWVKq6zyeUYhmKojDm2r+XdJQSFTf5oT//3ylJ2WaRf2FDofm5z7wx5H8a/4ldLGX//snD1O1LmP12uJX9Zr8fap5KMXHGSBwopUu40CJtLtdw==
Received: from DUZPR01CA0084.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::11) by PAXPR10MB5407.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:284::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 08:39:53 +0000
Received: from DB1PEPF000509E3.eurprd03.prod.outlook.com
 (2603:10a6:10:46a:cafe::2d) by DUZPR01CA0084.outlook.office365.com
 (2603:10a6:10:46a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 08:39:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509E3.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 08:39:53 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 28 Sep
 2026 10:45:45 +0200
Received: from [10.252.7.114] (10.252.7.114) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 28 Sep
 2026 10:39:51 +0200
Message-ID: <ca2297e9-0fa3-46dc-9814-29a3f349c38e@foss.st.com>
Date: Mon, 28 Sep 2026 10:39:50 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: ipu-bridge: Add the ST VD55G1 (TBE20A1)
To: Ruslan Koreev <koreev.r@gmail.com>, <sakari.ailus@linux.intel.com>,
	<sylvain.petinot@foss.st.com>, <dan.scally@ideasonboard.com>
CC: <mchehab@kernel.org>, <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
	<platform-driver-x86@vger.kernel.org>, <linux-staging@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Peter Marshall <pm@petermarshall.ca>
References: <20260924171820.1179823-1-koreev.r@gmail.com>
 <20260924171820.1179823-3-koreev.r@gmail.com>
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20260924171820.1179823-3-koreev.r@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E3:EE_|PAXPR10MB5407:EE_
X-MS-Office365-Filtering-Correlation-Id: a619d942-ee2f-4c50-b0e2-08df1d3c1136
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|82310400026|36860700016|1800799024|4143699003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	YeCGIQ/kGuYxCjYBCpo88UnpzcLFsj6KX+wh9GYT01RrWSJF5JthxJPl0lbGwte5qaWsbGStEsDT0w6MQuVK39/PtBf9/+4W9H+JtHIoGzgwF1Iny0Bz8M/t+KMp1dgO4jMVSK2rNcm6C+z04sflVd4WRY4XCENp/vZ6m1193i0SVjR1adRAe6hkwBHOgWhBbWiv0gDUdUdbHS43gK1FpaE9TUBCY7tt7xw9xRl0SFyTg+Pvrv91K5VvanzcWEXDWTe7F5BGmu25Uejjio529To0NnOIzFtwgJkJPGnPS6iYmbm+o3sUoCLqNZsJ6x+tRwZ+iiD1M7836v8+1quI+68pbE/SpVmh/fvfvZ4R+mIS+GU+tOH3dCVPcIUTErZNQvNFrEXOeu4RTobu0JEk9rzAqshqizDHMIXYwuCLk8/1sMSC0oVTNDOswNKA0z+c1fpNnhWhv7JwAIJ7galqcnF/vthmabXt4TAq65bdfkAodu5/u19K9C3uTG1irfXmm/HJYynL2bVZZxihZpoo4EVVeN1ecjpQQ01UjJrDH6zCpCKEETctUoM4UHeiEoO3diSp3dZdk6r8pxRLvLHkTDsGrbrf/t3fCY7vGC/y+M9d2BDHvJbUKFuPMtMcLAjkoDiKg+aTdwGjz5UdIszt1quJItQRWBwb11N0ETxhbtYR0yOBnfleYrKyMK5i2TsEA2J0Q+reJ2Tx6RyOfRtJ2Q==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(82310400026)(36860700016)(1800799024)(4143699003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5SKYVeFhCGA1ahCGbaA2liJjzgdBXoLwWfW0a2tPCb33NyqcyTT2pluDmXnrpS2IqKKs/6LPkaooutEC22eapzXkYmeTTf2NiYfEX8Ka6+pgQX4PqydKyY88IE3/QaJF7wvyzCQCoU7FIibXiZarY7UrWLFQ4h5ROHlGnvKOwp53o3wHI775Y/CNx0pdvV1ZJzhTnk92zz1VuH+9bXr3fuMbM2AtRgKgDSwd4p+QdyhUuLmjzkayAxlAYfTF4ipCwXA3lQoag4HFmImp08EaJ2eVcUH+X3S4wKhURGimOxZrrb1QNHbA/so2NPRFiM/0xlshO7GKCUGMb3hyCQS14ltd9TPnK44zEmIE2PNhT4skaZhQgD84gAF9hI7LTY4k5hnVr8zloYf49CxB9CdDfizdIIm+yZy2cBjsfePxSAtcPygEFJDooWOclyJ/Humd
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 08:39:53.2785
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a619d942-ee2f-4c50-b0e2-08df1d3c1136
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5407

Hi Ruslan,

Le 24/09/2026 à 19:18, Ruslan Koreev a écrit :
> Add the ACPI HID Lenovo uses for the ST VD55G1 IR camera of the ThinkPad
> X1 Carbon Gen 14. The firmware describes one CSI-2 data lane and, as
> usual, no link frequency, so the value has to come from this table; the
> vd55g1 driver requires exactly one.
> 
> Use 402 MHz (804 Mbps). The sensor derives its MIPI rate and clock tree
> from this value and the IPU7 CSI-2 receiver reads the same value back
> through V4L2_CID_LINK_FREQ, so both ends agree by construction. At
> 804 Mbps a full-width 10-bit line takes about 11 us on the link, which
> allows well over 100 fps at full resolution; lower rates lengthen every
> line proportionally. The rate is in the lower half of the 250 to
> 1200 Mbps range the sensor supports and is the one validated on the
> hardware, where 804x704 streams at 58 fps.
> 
> Signed-off-by: Ruslan Koreev <koreev.r@gmail.com>

Acked-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

> ---
>  drivers/media/pci/intel/ipu-bridge.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index bd64c0400..5941428ed 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -101,6 +101,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
>  	IPU_SENSOR_CONFIG("SONY471A", 1, 200000000),
>  	/* Sony IMX471 (found on Lenovo X1 Carbon G14) */
>  	IPU_SENSOR_CONFIG("TBE20A0", 1, 200000000),
> +	/* STMicroelectronics VD55G1 (found on Lenovo X1 Carbon G14) */
> +	IPU_SENSOR_CONFIG("TBE20A1", 1, 402000000),
>  	/* Toshiba T4KA3 */
>  	IPU_SENSOR_CONFIG("XMCC0003", 1, 321468000),
>  };

-- 
Regards,
Benjamin

