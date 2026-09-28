Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011025.outbound.protection.outlook.com [40.107.130.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD67748164A;
	Mon, 28 Sep 2026 08:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584782; cv=fail; b=j+/WshRTCVEhskVp3/1omvYwCwPpoBkZYqgGpIZ0a08AXSTLFTyZMZ3xI7qVxEbmjOdympG/SAsR9wZZjD5RzhAGRUjdofiSj0kIZ6+bj5PyAdeRuACQkFhHS1M7Y5HJkigTz1Z/48f0xD8HjelBS8fz6krdGK0K7axNJkl1Dpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584782; c=relaxed/simple;
	bh=OEAzwmlrGVByIXuDuDDaeHQGoqCXB1eSduL8bwJyhVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kG/ydvupyJVT/w3AR9YD+FifMzK8Vz+f+eebp8TjapypumTvYxpgXwQjDD+cSIObc92bbqPPI7plcgbqtldC4DYu1pfhcoWcYYt9RCEaiCKLDvJQEt2zTQ5S2sOcF0Tz9li0iDMKaHJngjnAyAOSb+CbebbXupYaak1757iBBIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=okl7HTLM; arc=fail smtp.client-ip=40.107.130.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="okl7HTLM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=so6Iv2OO55kLMj8iz9eeJShwWxey3iDgWKGLoVZ5PcPG+5p+zkIjJSWG/B9MZ7EqBhzgOLE15MO9jFtWmCMlXrkjTmO4Ea8DZCOXnYs1YYWBMluqA/yt12LW3Mq238uFZj65OZraYeCNJ8abtNAGz0J8wPmNYq3/X0qgFI4eg/2lFrQ3cW1Sxu8OCHJGAux3hqYiKSo+4BPmXDNA3VofGHtNIs1DPeot7WsPs2RXy5eHsp4gK2dpXN/b8i/Na1eLqwJW94KpQv4f6avwY57hm9ORpX1IfmvNVnx2R1z5dhyBwtQMfWKqpuovjWLNh15d/Gdclmi2b4Xcy9Og9PFw8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qqfftR89fUsq/AC2B82z0hn26LB+lKPeBLimsUkZiM=;
 b=Fif1m83MSdqmFzywzZkgq1CflTznFE7iAOXQUyqIR2zrlcjGDZTSMMNBEiYKj+aDRpTe8aHu6bLyrbfRDYGhDdibMfnNxyI1jH1JR+oFPcskuG3VVcTdfszpjyyYoGY+iUuGwjcyU+H0aM0NCD8vJNAJlMYrxZ42pgtlWX5dtcgMBYdLhV83IF4jePOjgSBYxsnT22e1+4xKv6rgCvUHMxRg1dwgKg14fcn5WZ/X5KDyq6j3q3cQ5O9iGYXoVKxZAdUGRb/n0DOmAlpT90T7YmnUd/Nx9ql0/3g3vZVE3VQooU7qiqexmJMSsXZKZzYVxpDiUhJl8FZnUIeZbbczeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qqfftR89fUsq/AC2B82z0hn26LB+lKPeBLimsUkZiM=;
 b=okl7HTLMCJw4SEXnWAqHKwn+T3cU3FGsG/ebp5SQGMOQYlKZnB+EOwLeiPRx3TD8EfId07srvXft+4PETbYACtvhABlg6yhwwlWSQ1sFmsHBkvgvhPJEXizqvNyj82lKf9k0DzEzr+kap4OCRqw/DwnZw+wqti4Bohc3BgaN9yWZmkkcbB06qZR7UeHvjhWzMDB0tCV+qT0El53rqDR2RVwDLyumGqHkPuiXCbZ3+WtWleXxgNGJFK75Iy/lI/AqM5ej52H1h0nUbSSnLH1dil+Df6WuSJYmpaI0W0335beC10m0bEkhPPxIEXNAklTNcp7t20gmnRxvC/6O44TpgA==
Received: from AS9PR06CA0011.eurprd06.prod.outlook.com (2603:10a6:20b:462::10)
 by MI3PR10MB067125.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:290:9a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 08:39:37 +0000
Received: from CPH1EPF00000528.eurprd05.prod.outlook.com
 (2603:10a6:20b:462:cafe::7e) by AS9PR06CA0011.outlook.office365.com
 (2603:10a6:20b:462::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 08:39:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 CPH1EPF00000528.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 08:39:36 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 28 Sep
 2026 10:46:07 +0200
Received: from [10.252.7.114] (10.252.7.114) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 28 Sep
 2026 10:39:35 +0200
Message-ID: <8204251c-de5b-4cd2-ad3d-e04375f77f1a@foss.st.com>
Date: Mon, 28 Sep 2026 10:39:34 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] platform/x86: int3472: Map the VD55G1 power enable
 GPIO to "vana"
To: Ruslan Koreev <koreev.r@gmail.com>, <sakari.ailus@linux.intel.com>,
	<sylvain.petinot@foss.st.com>, <dan.scally@ideasonboard.com>
CC: <mchehab@kernel.org>, <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
	<platform-driver-x86@vger.kernel.org>, <linux-staging@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Peter Marshall <pm@petermarshall.ca>
References: <20260924171820.1179823-1-koreev.r@gmail.com>
 <20260924171820.1179823-2-koreev.r@gmail.com>
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20260924171820.1179823-2-koreev.r@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF00000528:EE_|MI3PR10MB067125:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c62d20b-70f2-4c6d-446f-08df1d3c072a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|7416014|376014|82310400026|4143699003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RtufK/ND5HgzAADj02YSivdr0U90inPOGGxMqic5O4icEkwd4zTFXOhX/946lCcpKj0xHrKZeF0XSSDs3+7Cllbyq3JUUry2CNwNnR5IbtTYZpGz2DL15/TUH25MTwzHn2Vo1zqvpVoYfQPJg1qtKbq72W4HgB8EvJtrODRf5D9yacygAO3Of1JLJUwa8b4U1FxoPRFct7UD1bFjT0imUv6dIo62gjKorXMLWHIuLjSo3jxmvmDNPs8zroN8+NUuw62rGYdnM2vKrFw4IyPjl2wQYDoIniaHvoV1+JhBzatyhkRJcTMUEqnwnLZBa8tJccH18L423elMtz6VlRULmoInwHtTcKl+xWxQLPQ68UP4fcPFf6gTUIc68tqnYVkveKlhq4X1EPbAuxZhN5ZY4Lj+X1O5z+WUA/VzAiB1J2wHjVPfuR3uKznjZKZiRo4qDsAIa9NqkEH1AU7lMNKK1Ue+VPJZ4U3O/0pFoSDyfzlkkkHK5kZjyR2NUXPDGqTnrF4c6fpE8pA+7sgCMn+n4ZENLybH5garhtCi8ORrU/37QTNcOXl4wo3ypEtpz76cz+RnkVFrzvv2N5lQ6Rpy7jbCriwWezx9h/lks/Mgw3dR1emtESr0bNWwrfMLEoO1STAM6pspsUsQax0NzO+7yzdTsR1AU5k9dTkVVXxn8V0Q2YsK77uARVsVPqEXgAdXwi9xrAeE0PWbKK5qVvKb6A==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(7416014)(376014)(82310400026)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	G8CElib5uKHRBu3Itbhp+hZdLSUn3VUUdj5mED5tu4+GE0dJz/1mrGQUn77lysXvqgt5ySzYg2JlprO6BDPmdZ9ZS2/9vNadYTjim1bnQtQpsVRrHlKy5R66RGgu4yZj/bup0pnGpwBU/0CkQgH8kkIRY0TgP0GK10ymu6AxmvZAQlTeN4EfGBK5UhOogBj18Ir/ljkO79+oUFIqXWunwHytmM+vjbVtuInJdel1eqK420I7J9aH+ORusTjDS9d0qFuiRGxHHzAbLbVLoNOKdPaA8WOIvkkxCkhYuWQEXKfhm7uT3aR6yxlZ6l5nhjNV47QkgaaI+TEx9Chk+3sLtNcR2mVnFHyVMz/KAemP16oXL0lRXXwyYCP3YB/lXTQ4fQqrDkigg8xQI764kd2mb+p0r/wuTPEr11OS8BlQP67qe0/2KfUR7Pakq3tPizED
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 08:39:36.4476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c62d20b-70f2-4c6d-446f-08df1d3c072a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF00000528.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR10MB067125

Hi Ruslan,

Thank you for your patch.

Le 24/09/2026 à 19:18, Ruslan Koreev a écrit :
> The Lenovo ThinkPad X1 Carbon Gen 14 has an ST VD55G1 IR camera, ACPI
> HID TBE20A1, behind an INT3472 discrete device that provides a power
> enable GPIO, a reset GPIO and a privacy LED. The vd55g1 driver names its

About the privacy LED, the driver powers on the device at probe to
detect its version, so the privacy led might flash at boot. This is a
problem we could handle latter on.

> analog supply "vana", so map the power enable regulator to that name, as
> is already done for the imx471 on the same laptop.
> 
> Signed-off-by: Ruslan Koreev <koreev.r@gmail.com>

I'm not comfortable enough on ACPI to do a proper review. If it works
for you then :

Acked-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

> ---
>  drivers/platform/x86/intel/int3472/discrete.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index 6c729fcfc..d005595ba 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -130,6 +130,7 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
>  static const char * const power_enable_hids_vana[] = {
>  	"SONY471A", /* imx471 on Lenovo X9-14 and X9-15 */
>  	"TBE20A0", /* imx471 on Lenovo X1 Carbon G14 */
> +	"TBE20A1", /* vd55g1 on Lenovo X1 Carbon G14 */
>  	NULL
>  };
>  

-- 
Regards,
Benjamin

