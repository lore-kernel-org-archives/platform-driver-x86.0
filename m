Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012013.outbound.protection.outlook.com [52.101.66.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB7B457E7D;
	Wed, 30 Sep 2026 07:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790755091; cv=fail; b=ZMjVmsS0F2eXIZhgYOUdLfRuAzd+otMD6C+GhjVSX61qqF16A/PSgh0vBZt/YwDfHyYMvr+PZz4zA8i9hVF9VrQ2Xhze1jfR0m+qd++KnvsQRHCsJ4ovuWjuLyL+G5ARgTigEeWbilzYRtYrtP9kw48uCC+VOakwdgSCx0ugN8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790755091; c=relaxed/simple;
	bh=0iO4/CHx7cB+ULrTsx/Zh6rUpY8st1E6xCArivtXt9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=sa4YYXEqkw8I8Nk77Ypc4OSyGaB9rV6bo5I2e57CNF5zQ/P33ZUdI7LtU3Di2t7Qg+cVdEU9CS5GRy1TvYaXR/Ed2IunAIHUIxYmUaPJlLBja8pVS+lFtoINlxhtc+Xo+Y2kTgv79dAkpIAuh/8o7UlKJrCWGClVnBNnfNae6Xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=B9QZcJX0; arc=fail smtp.client-ip=52.101.66.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="B9QZcJX0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MLAWHFeNsD3Hl4uW4zemUR/cJETXik9BUFKIspFlyxhd7vmeooak7eezwjOHTYwBp7VwEE4QGZ4C29IPRfySnkx0crZv0Og6tG32lerHuBnTWuLQJUapV3cJhYI1v1PD6qVzz0MFl49VGdGA1ijRZcXDKjdwOlcwWX9mqT8JorKPVOJuiny/DV9DJ1uFULKPJm4FXkC3mPI+UxrnH6GJ5CoGczTznsyBy/+fhO0eqa7UYJJ07k/NXdNbofC4qZRCGv13GivN5mIdphMWrhqlhkxQJTgRj/Eq+Y+jM/Jdoh78ef+9qE9uz1+U3mtm9NMEjPfdBkFJ1jjwAnANvQ7Okw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBIyYAlE15HZaoHT9vpCMJ/pyHjaVFlI+aVf0Ukn7F8=;
 b=jkkbl5MJYc7yanP78mTpYtTN0IrCBF+QC68k+lBpNje5ApF1altv8yY8sAOwDU2QJ6fPbctOs3mDTXsAe2F0a/QW5bQj+4mv2J9JTCXLjBJILC7SAcs1VCIBD8jjpnVq5dD+R6Svf3l/7aeHYBxIAveiLmULOCfwFOxrenzCMn/pbvb2cntuX45iyUtjGIkxOMbNpXkf04x8hPTTFxOOmCB26nrP1da3RhTiZwM9Zr6lVEzpfaMx6LmZoXUPOq3KVqdf2dfE/7rzXpTS4/h4EAuPusDp4oQF32YP4zLm42Sz6adcd3A+qBtPqX+K6HnMjDcRXdKBRFs6g02nfdqFLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBIyYAlE15HZaoHT9vpCMJ/pyHjaVFlI+aVf0Ukn7F8=;
 b=B9QZcJX0SQSkntFe7v8XtbH7dubifiNCn34kmasoWB74ZwBsndmmnSM0S608PfEnvTh0EoXfpDMctizVd20zkoGUS9y7YGZjvNM0WcEXGvEkWpN12zYRl7w1Ji8afFbs/qHY9ufSEXUq+4eaXeZui0aliFA6S2ZiBwoGWGg8qwsLEy2Y4TnktajxcZg/1ywEO4LFHA/eecKyLjFxLMZJ8cGqn3rut9CAeUOTdr+JZQgnpoO1TTwDf/tkC8FVxGHmaub5A9jWx1r8VuH7to6e0vQwqG9onZAIvYB2L/h5gFURwdnhL1Ot8Z/ABBoicLQ80ZX22aLicMMxl9dMYFRCBw==
Received: from LO4P302CA0023.GBRP302.PROD.OUTLOOK.COM (2603:10a6:600:2c1::15)
 by AS8PR10MB6843.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 07:58:03 +0000
Received: from MI3PEPF0000847E.eurprd02.prod.outlook.com
 (2603:10a6:600:2c1:cafe::a0) by LO4P302CA0023.outlook.office365.com
 (2603:10a6:600:2c1::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 07:58:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF0000847E.mail.protection.outlook.com (10.167.240.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 07:58:02 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 10:03:56 +0200
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 09:58:02 +0200
Message-ID: <b0e2f1d3-b22a-458e-9316-636b7dbcca79@foss.st.com>
Date: Wed, 30 Sep 2026 09:58:01 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] media: i2c: vd55g1: Add ACPI support
To: Ruslan Koreev <koreev.r@gmail.com>, <sakari.ailus@linux.intel.com>,
	<sylvain.petinot@foss.st.com>, <dan.scally@ideasonboard.com>
CC: <mchehab@kernel.org>, <hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<linux-media@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Peter Marshall <pm@petermarshall.ca>
References: <20260929092700.1776966-1-koreev.r@gmail.com>
 <20260929092700.1776966-6-koreev.r@gmail.com>
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20260929092700.1776966-6-koreev.r@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000847E:EE_|AS8PR10MB6843:EE_
X-MS-Office365-Filtering-Correlation-Id: 5673b8e7-0d96-4e1b-012f-08df1ec88dc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|23010399003|1800799024|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	eUvZKCqAwDmuCMbAyygDHQs2ZyJc44AzW/T0mZ3Yxq/O8XWS4/w5TkuL5iK0zSAHBZfxaxyBIUOtmdZGLTG7vOfF8HTuzIiQ5QpYSv9VuQtw7Kk7ICyXDqBuEDjqmHjB+vskdYOLMkuXWnZA03DgA9XlLxjL69PMvuBaawDYmSYA3F+kZCk2YwjS8SqaPfdTBbY3X8205P1v4GvgBZ6n+y/E8TkAkxcTqdSlJO1ty6r1SlYCReD0CgRZWkZaE7Gz+6G0yOB09D8uFMf6kfr5Tz3+56MToBaDhb8FZGhRX+9lofuGgCrVDxoiOCZtKGd03EoXjZvx/eMZrFIpilBaCVtaInnvGjytTcVGgZyykwa1jmzcPGON92xIaOTVhkawX9uGx+eOdLl0jQdhAYTm0IRgJp4H/Jf5LpqSItE+JMfMH5qJ0/t6kK2IVvWZaV0xBpcayDdUmNnSDvcm0NmGWmG3rrb2TxrCiks+RrBDg/qoUtf9p8ZTEf/Gr4s0J2gYKFtQVU5RCMtv692FyXv1gAkRkRX6cJmTOVc0wnt3cmZAS+Qakh0o7N1v5FZEacf6pLjuYJXl1abU75u7cOACnr85O4Zh25lI6FWwbVf4YWPJYeWGvoc6be8gvJFkJc2jaSF+vGgdA/8vbrdQFiflKp2TlYapyzHaRSo7QBtGt4lFAv2i2YEhMCB8E5eiZpMRlvVvuZFuBAhcyyYnkdCVcA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zKNb/4EqpHeXdr6uxCqkfVkH91fHhZQxEznuvVeWfB6wBk7Io50q3anwSC0JGpnBdYBPKvthsrnA/Sa5lGl7IHJlr0jS8wK0wOVmETf3++WWCbOLNcuByX1r+ldWT0B6UKGNqJcpxKRNm6rXqyyDaCQGBFcrfmIJZcJQ97a3bI+Ti0W/+CaNfH4QnLnGCvS8G9hY+IYfPnsyoW4Vnvf10qjktfG98CJkBGik9tc6QK6jX+LrR4+s5KIfAHkDeT3FRgczhqsZMyUlo96utielZ8KkdaA0YOI8giFDMo+IGIw7OLBGtI+gIYnxIEY0X4pEECvxGCVVeI2QKViuv9E9Q1uzp82drboCtiQl04x8OlfDKojWDVBg0dSYESBF3LugQvgPo0sa84b44Awxd6yTZquy81qrgxb6PXjwooXHCvJM+yUZmlomCEwz1hvTqpHZ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 07:58:02.9594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5673b8e7-0d96-4e1b-012f-08df1ec88dc1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF0000847E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6843

Hi Ruslan,

Le 29/09/2026 à 11:27, Ruslan Koreev a écrit :
> Add an ACPI match table with the TBE20A1 HID that Lenovo uses for the
> VD55G1, with the same match data as the st,vd55g1 compatible.
> 
> Signed-off-by: Ruslan Koreev <koreev.r@gmail.com>

Again, can't test but :

Acked-By: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

> ---
>  drivers/media/i2c/vd55g1.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
> index 8043eaa50..e3939bb9b 100644
> --- a/drivers/media/i2c/vd55g1.c
> +++ b/drivers/media/i2c/vd55g1.c
> @@ -2081,6 +2081,12 @@ static const struct of_device_id vd55g1_dt_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(of, vd55g1_dt_ids);
>  
> +static const struct acpi_device_id vd55g1_acpi_ids[] = {
> +	{ .id = "TBE20A1", .driver_data = (kernel_ulong_t)&vd55g1_versions[0] },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(acpi, vd55g1_acpi_ids);
> +
>  static const struct dev_pm_ops vd55g1_pm_ops = {
>  	SET_RUNTIME_PM_OPS(vd55g1_power_off, vd55g1_power_on, NULL)
>  };
> @@ -2089,6 +2095,7 @@ static struct i2c_driver vd55g1_i2c_driver = {
>  	.driver = {
>  		.name  = "vd55g1",
>  		.of_match_table = vd55g1_dt_ids,
> +		.acpi_match_table = vd55g1_acpi_ids,
>  		.pm = &vd55g1_pm_ops,
>  	},
>  	.probe = vd55g1_probe,

-- 
Regards,
Benjamin

