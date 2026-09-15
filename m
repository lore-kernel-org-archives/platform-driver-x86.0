Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010053.outbound.protection.outlook.com [52.101.69.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7125247ACC6;
	Tue, 15 Sep 2026 09:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464552; cv=fail; b=DttPHIw1fLio2NYSNmFc+Qre6z9ynOoz0/ZCbwhYBihKl5G3u3/IdOArq0xmxfCoetMynqHrxDjWNaNIZX4u+TFp8ksL2Ayu6DpEBWLnQkhzk7RgobDMAyRXJFQAA8df1Ydm9e8ijUdFDa+q64QL6+0fqEr8lON0cU/kHOaXZgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464552; c=relaxed/simple;
	bh=/Rm/lqOGex6+3ifuvH20N6zIpzZPtgDkQ1X4Qsg6Fm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LQfbsXdQS0SYTVjyOhTciBYzkU+gbnsy7Rms6JB+cIIZbyCn5ttgdbXSPsGnedtzSi2gHH2tpRDP9zIWlFGCUQSEJGM0e1IJVtUdlC2nfmqKjHEUbY3MrmWGYQH42Oaqjs7Df5GktZJJos/YgYEdZqk3a94fOviiSo9UznWaZEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=crZUzuBx; arc=fail smtp.client-ip=52.101.69.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="crZUzuBx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dhTVC8a5NdFX5QYgsex9GET3pTjCIi3yuGAYoS/OnkS9uDz/HXfcADEAC31dYuV1YDZE6A4kkThOov+s+4QKpzUwCJ/TjC1rf2R/bfATDyWHbjn7+ollvlUqG89sO4euxyrXs9QEt8Af67liheXnGK/uzEX7eqWvgN61VV49eCFIul4MLJusSVhnx6VZsU2T5ty7d2JbckPXPSfK9tw+IDXVzNZhUw8kNWZl0AFou7EYA1QZ1HbXs/Eah6DERt0Cbtxt0GxuDZGrhXriMpuW2aqUhGfZAvTVskPrCujY1sLfDCAyvW1HXaY9GpYOMoqR9Q88Xfw8TTXpW8qC0Qe1aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTmvkfuY8i1LcGMOM0Cr7c5RCN6zQz/jx7Rc/JO9Juo=;
 b=M6b1RS3Ocbqb1O2efOfquoE3mhJQAW4JOin/LkMwGiLGmnsgRYrzBK6BT+Z9R2HEm2LRH6b0uV4o9XTeTBNrLNFru6v7Nunf/vYtxrAgEWoPlJIITnWXmFjybMV26gz1rmx2/TRzxuGqZ2tuJxDnW6AFsBev32LkSW0g42SR0NK+mhNDG/g43fkNcOnG3/QsZ7MxN/SIqhYVoxKdjmQCQWIMemexYBrCQH0GtjDeYXrGUyIi0BYrL16tRN9PYEZNonFlJ+GYCtSFNA+CY4TMFoudge4P4lGOU5xF88t/jQ79giCciON9OvzoDUoGQC1VTXO2FWx1CgUorP9ErEYWGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=pm.me smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VTmvkfuY8i1LcGMOM0Cr7c5RCN6zQz/jx7Rc/JO9Juo=;
 b=crZUzuBxwWrVrxuwDMa/ptKt2UHzcj+f4PI7bzIjmUE7YErvX9qHnLHc40ANV9TtOEgsQhlKtCdQ/V2XwDVpWHijxBanuMzJyNc8FZSB+2LpZBNjcDy5jRMB6Fy9nkoNnnLWhJ+bZ8MkkMigUhUvNKMM6uciw8wkNSfKzYybKwm1G9wLnthBiKeGOhPxIyNW33+5/aUm+GRA6Rh/dOb5YNgY1GF8BtPfgwrIargamqHCPWNPHIWFYxjh6Jfsbdnr2H2j3VsQKOLqjg2VFpKi6DwyunPGNhRLgxiJVSHXp2NZka7lS18XD7+DVz03vEBdgg75Pbi3oleqANnDh6TfhQ==
Received: from WA0P291CA0001.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::27) by
 DB8PR10MB3178.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:113::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.12; Tue, 15 Sep 2026 09:29:02 +0000
Received: from WA1PEPF00009B39.eurprd05.prod.outlook.com
 (2603:10a6:1d0:1:cafe::b) by WA0P291CA0001.outlook.office365.com
 (2603:10a6:1d0:1::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.13 via Frontend Transport; Tue,
 15 Sep 2026 09:29:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 WA1PEPF00009B39.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 09:29:01 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 15 Sep
 2026 11:35:05 +0200
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 15 Sep
 2026 11:29:00 +0200
Message-ID: <1070f707-8a23-419e-a0a2-a6f295ceb5a0@foss.st.com>
Date: Tue, 15 Sep 2026 11:29:05 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] media: i2c: st-vd55g1: Genericize driver and add
 VD55G0 support
To: Sergey Lebedev <lsa.uz@pm.me>, Peter Marshall <pm@petermarshall.ca>
CC: Sylvain Petinot <sylvain.petinot@foss.st.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>, Daniel Scally
	<dan.scally@ideasonboard.com>, <linux-media@vger.kernel.org>,
	<platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260910213308.53429-1-lsa.uz@pm.me>
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20260910213308.53429-1-lsa.uz@pm.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF00009B39:EE_|DB8PR10MB3178:EE_
X-MS-Office365-Filtering-Correlation-Id: a11f17a1-c6de-4297-5e26-08df130bc71b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|376014|82310400026|56012099006|11063799006|10067099003|18002099003|22082099003|13003099007|6133799003;
X-Microsoft-Antispam-Message-Info:
	AcKAokcdAmXVqahVrNDVtJZ6EY5QfJL8xvVrxeDBtspTNnu6PZOctbN1mzj0i0DOpsGbo+L0Wm1eJdCOiLv25YI4FKGyFKsKAGXnHuTD40I8k6s1YDrj9ED30mkmH7pgGatKG+S1BxXq7YDseKvX0es7wkLr6wNEzQ+Ve/mG1MdA9zrptoKGeIcexTCUDNImeYVOn0NhRGX/7W4BYK01WVWv+hVnOg5YFQeGaBZr4J2KKSEz8Z7U+WDHmYzZJrIyfNJYnODmuC4TjplAiKjD6pK+lz432N75J1VIgbN8nVyklM6h2E0dJb0Kb6OUq9vhYje3BYoHH7UrcaIBvN2T7zpvH3VOmeAmcUJUCzTuKloJ4s0ZSLYDKzAx0hqAPNdxTF66v/AvVkSN0tTWYco9LspUwrqLzYwYF9AeD90K13R0QKx5QStMc9/A+BRXMp/upQ0RCL0qiMfAawpbGcNBhzsi8Aj3GS1SUpJDslX1f2zmO4GjA4NmyiB8svhKClZHDgypvcI9nQI6vHCRfdN9v0Ho99+OKCoxXXyhXNs0dlICK3HYypkVNK+krJzqdHQ9jQPI1V5aYTYRTbJN4bu8o6RKqyjq8XFFVwZjcOiE32OHOoB8w94X26je6i6/T4LVQFVrjRWLjhRta9NmqrzsXAKm1DdCxzEFM0/s/eaB95InXyiSCHXsybY8F8bdZk0UPJL7k3KLPUlmaN+wcnNJTA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(376014)(82310400026)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(13003099007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	653U3V6xB8uSjo51ejDvUBGMY5FYbWMVp6gtfYsd+GPe49knF0aSetnoAatuzq+h9ILbGEFwY6ELlTsgyKDHUYhWKLp6F+FUHqlTbhTrhsf8R2tf5kc0X8ZKNtjQlBRXOTCfRZojArnztn66Ndv8JN8ATmeiChqEawYpJJe3M3LK1mebyELOcA0nQ1TjkQ1AISpV2awZBquaIF3Tk65B/SqAUH913Uiuik9I6HPlJsfcK6XfnokjQf1u5ZknnH4pueWUgOVRIrobnMMygrUYJlKkMKSr0RiMs7PsMmGYp64DhRQvBm0jJn1kxjoYktDZ9g4qkHtOkflBFJM/MnWF9mNW1iHMOl3N7Asen/FVvwzPOJsEI3DIl7I8CI/adFAnpMhDde4q7T39e5VRsjL2N14BxkL2aPe0+D4inmq3Zr5jZstGUDVxvbpRva03vO6b
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 09:29:01.4853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a11f17a1-c6de-4297-5e26-08df130bc71b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF00009B39.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3178

Hi Sergey,

Le 10/09/2026 à 23:33, Sergey Lebedev a écrit :
> Following up on the firmware blocker I raised on 7 September, since it is
> still the thing that stops anyone but the author from using VD55G0. Relayed
> with Peter Marshall's agreement.
> 
> Peter sourced the firmware the same way I did for testing: the version 2.11
> patch array in Andre Gilerson's out-of-tree VD55G0 driver, which he reports is
> identical to the one in ST's standalone driver. He has published the extracted
> blobs for testing at
> 
>   https://github.com/petm5/vd55g-firmware
> 
> and would prefer submission to linux-firmware over a built-in array, so that
> firmware can be updated independently of the kernel version. I agree that is
> the better end state.
> 
> Worth adding, because it may lower the bar for getting there: the built-in
> arrangement is already in the tree, from ST, for the sibling part.
> drivers/media/i2c/vd55g1.c is Copyright (C) 2025 STMicroelectronics SA under
> SPDX-License-Identifier: GPL-2.0, and it carries vd55g1_patch_array[] - 3512
> bytes, firmware revision 2.9 by its own defines. That file has no
> request_firmware path at all; the built-in array is its only mechanism.

We initially thought of using linux-firmware, and we didn't for several
reasons :
- The firmware is reasonably small.
- The driver source code is directly dependant on the firmware, as some
behaviors may be altered by the firmware. Keeping it in the source code
allows easy synchronisation.
- A lot of mainline sensor do the same thing, with exception for only 4
drivers (ccs included) that use request-firmware.

It has been discussed with maintainers back to the vgxy61.

Unless I'm proven moving to the request_firmware API allows more upsides
than the above points, unfortunately I will not ack a serie that moves
from the builtin patch to the request_firmware API.

> 
> Different sensor and a different binary from the VD55G0 one, which measures
> 6868 bytes at revision 2.11, so it is precedent for the arrangement rather
> than for the blob. But it does mean a built-in for VD55G0 would not be asking
> ST for something they have not already done one part number over, whereas
> linux-firmware needs an explicit redistribution grant in WHENCE from the
> copyright holder.

I'm not sure I get you. Is this a licence problem of some sort ? Could
you rephrase ?

Anyway if we don't move to request_firmware I guess this is a non issue ?

By the way we didn't upstream the vd55g0 because it requires a bit of
cleaning, but this is something that could also be done.

> 
> So the two routes are not equally hard today, and they are not exclusive: a
> built-in now and linux-firmware when ST are ready is not a wasted step.
> 
> Whether GPL-2.0 on the surrounding code carries the blob with it is a licence
> question and not one I will answer.
> 
> Benjamin, Sylvain - this is the one blocker on the series that nobody outside
> ST can clear.
> 
> Sergey
> 

-- 
Regards,
Benjamin

