Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013053.outbound.protection.outlook.com [52.101.72.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC7C4A3418;
	Tue,  8 Sep 2026 08:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788857332; cv=fail; b=FoqDTdJ/SIAe9kLwgFrn34Md024RUs3CRW28YYLjruurG4MzRsUZkXalUi4jA1tuwjXgl4+mmoyCyYhO4NPvi6yhXaKVEAypa1fXZ/bWIM6qQsU20x0FLtOpA4nvVK5afilPXVupYdr1deRQqRgGetY6pB6vg5DuuKAFyOiTAJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788857332; c=relaxed/simple;
	bh=uE3PHg4/+mRuTvk6eBiU2IP8GnT87xEyKepR9zZi33o=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:CC:From:
	 In-Reply-To:Content-Type; b=LVkrVcPZT8djZlC+vCc9mjgWUr5HMekWfodRaeNEPgozL0TaouSBSmjmOFdvPQQG20vf/nAsISjV6pfDVgzlnFFwES2ehfhZwMoMu11K/wYvp8Dm5lkypmbSXKdCsJzXuiGjsZuX6nHqiLzAwA/WF7SrQTtYZXY4/jLd83OHOeU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=foX7b25W; arc=fail smtp.client-ip=52.101.72.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="foX7b25W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K9Bh3LeQ10Ykf2opjtxk2NKs4PAAHAuf+SZZnQILCMi+hfJmBL3c7FrD4YoR/XiXVHJIWOSQwTjbXbe2fCo7MSe5XeFRuVwIB9CPg5mI18WqLdrHziFoMd1cwTs/sK7AA20kFQpDanVovuZWamN+kETTeEWds5OPAWMhQVKMW3X5OKxRNthgnAZJUuHD+jvg9+ZcS2BxpIL3fjFNrmDopcX+hshgHkpk0ejtTzGYGjD+br0RiTd/mzsbQnoj75hS1l9uqyMJh88qCddJISlWYydIrBTo6aFvOoHV20YFHmbpATXVNPZ+eWclkh+veyeS0lNGDmGVky11R9rMEyFgdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1rl3xiiubpg1uQ6fpFsTfO5RSpGsZgiuff1lS0Lw8+k=;
 b=GDiR9eM4nGw4tHwOWNLUhf/JBV2OTzvSRqZ3ksD+RkT2nCwng6WLVXUTVmQXNeqAGvrL9Pjds6foqntGxq5WoflLkQ6owQ7LziBg61YOnKQG6Zrs0+6iSDMlFyC2o6BhvfepZL5CcK5nLoFzR8NEMj19pK3LP6goe6hiVi3+5yx5BgvTF2BT7osCjKbtquV6utnIsKHTTvlwTHIyXIwTgs/geJtZxJ0qkIXQHlXVfOVpWdrJFqmrDro7wAnnQ1pRP8lrUW9D09Ffw38Vmlr6DIrZfMY7Zx3UwDm/dZAyeONwd9GDqO2Ju/yZvXKDbbEu1UlEQWzEBhLT1HJCZedmBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=petermarshall.ca smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1rl3xiiubpg1uQ6fpFsTfO5RSpGsZgiuff1lS0Lw8+k=;
 b=foX7b25WSp6jAyotPLo7/yzUQHAlluS0K2Nej8TPQH6orWYUDZOnDdeneSEbp8Dghp9KC+3B6xzO/rOAwtB2mRV5HqIroZ4aGo80ZpkZIfHk64kK5oldl8Wt27J3qf3KV/H0MpH9OY9Srw3ks3eJjhexiSPjlCaN9wxJeWV33BBe29yjp4cgzbgwlEpdxofb7FQ8eAvcOuZhTHjGVdpRJXXGoaemWz5+KdxAYfcflAPzyCm1KHN8DUxcbAmrz4HYEwcPPAkyWy6SkDwHNDjsqqish5jExFsppUCmdMJPf8eTXSikd4P0Vo6j7sYVktkfMIto8JAZ8EeTbbhr2hS9Bg==
Received: from PR3P195CA0004.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:b6::9) by
 DB3PR10MB6857.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:439::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.15; Tue, 8 Sep 2026 08:48:30 +0000
Received: from AM7PEPF00000055.EURPRD83.prod.outlook.com
 (2603:10a6:102:b6:cafe::3e) by PR3P195CA0004.outlook.office365.com
 (2603:10a6:102:b6::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Tue, 8
 Sep 2026 08:48:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM7PEPF00000055.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.0 via Frontend Transport; Tue, 8 Sep 2026 08:48:30 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 8 Sep
 2026 10:53:56 +0200
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 8 Sep
 2026 10:48:29 +0200
Message-ID: <28b04ac3-6e52-4475-8c67-a52ff77fd223@foss.st.com>
Date: Tue, 8 Sep 2026 10:48:29 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] media: i2c: st-vd55g1: Genericize driver and add
 VD55G0 support
To: Peter Marshall <pm@petermarshall.ca>
References: <20260902204549.657228-1-pm@petermarshall.ca>
 <b7e8939f-646a-417b-b4ad-1785359c3343@foss.st.com>
 <DL6TUYCM6AE9.3SFNKPI5T7CVS@petermarshall.ca>
Content-Language: en-GB
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Sylvain Petinot <sylvain.petinot@foss.st.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
	"Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <DL6TUYCM6AE9.3SFNKPI5T7CVS@petermarshall.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PEPF00000055:EE_|DB3PR10MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: ce3cd8c2-be0a-49db-6814-08df0d85f4ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|10067099003|6133799003|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	3wSWuHlSPUHYZrFesRzmBjaXj4ouDgtyVsLz0Rk2miWu5p7Co8WhtFTjC5UQksjjelMzP+bgND4SPvVV8dqAwXW1FWZkNJcXHkZPsAmTY+3052wzvcU2VAqZ/tizPqR1k1aJZPce21fm3jBqk+viPVbN8FDhUBa//m1cZPiDyMX9RcmNsUGsrDyEjqb7H36v9/TL4vlRXnkmu8KZdQ3taoEanWTj4HOVsIy7UZ7CqHefNjYiGwwZG2kZt7bgBScc9osmZqU7iRzMi5seyVIXDk2DB5VPLLJYyuFb9DkrmmRvDgDhBrnayjwhfA3rKF+FER3n72Imp3FvIqTKoWE3zUbrymOFC9LpPOp5MqgDurKjTRXkn9r7GYpQgcDPOFgyyXZf0y9g/3oejXJPFskAP1JSkFCxVGwPmogjB/N/fCSU6DoyPTvkHjeItssgkXl+imguK5w2C+VBvq3Vx6eRa+h4t6sUHxW0NPi/o7uOrmy1UUeB8PmonYklxvcGOkcVMO6ePjVYeKX9pkHmXW+bNRWUIYY8Ida0UWaqKYbpGi3pJNnC48X6fvn7GCvlyzt1wTOvZt/C2+FozyypzXpHsutkB+mBqdABsLJ8AIaeDvRU9bfhMzUcS1ars1pMoP3BuqKWetd2DvA7YCLZFSd1bYgaCNFjbykifSuoGXJxW0g=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	j3UxlBXOPpTY+QQ9+KxLD9ZOXp0e3+8wAlH7bgMVLX7RfOuXKsBYF/UKJ4rG7eKCQsu5RsM9+f3rxBdqdSPqBc9n+Z/e8gmiEEwRpC3q4Ie8lEmlIVZXt1JEK6ePwDeAZd8Rl0elwPmV2r5g2vUnGKwfAbg90DamRB7zQiuBgsQS60xGGQgTeG3OhZwVgObTAM6m/ohRBG5I0GswAkCeS1eMlpl13EgFsU638THIqg6o08M/s7K/a0vm1D4ZYnpD/ZvN7TwciHjT86KP+C8Y8oo6uEXnL36pRw0CiOO/Zhbn8NpcNBdESFJGFYlndlwU/EDkfOfs5PrxcIFPrhodMzXjbiE7Fcbg2UzXJjHV7lr7Sl6njtwHMWZDu6my0gU7gd9U58Rh3dA3N8R8oke1auVxH2mgk4k3OXeDKOjOsPhhbs+Sy0sCvky8NxvKTyv7
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 08:48:30.0057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce3cd8c2-be0a-49db-6814-08df0d85f4ec
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7PEPF00000055.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR10MB6857

Hi Peter,

Adding back everyone to the CC list so they can see our discussion ;)

Le 04/09/2026 à 22:51, Peter Marshall a écrit :
> Hi Benjamin,
> 
> Thanks for your initial review.
> 
> I chose to merge the new hardware support into the existing driver to avoid code
> duplication and improve long-term maintainability. It looks like mainline is
> moving toward generic interfaces, and away from the "copy-and-modify" status quo
> common in vendor kernel trees.

I'm not aware of such thing in the mainline tree, we can take for
example imx sensors and every sensor tends to have it's own driver, but
I may be wrong.

> 
> The vd55g1 appears to be a generational successor of the vd55g0 and the two are
> similar enough that the driver only needs a few feature flags passed through
> the ACPI/OF match table to support both of them. The added abstraction does not
> obscure operational logic, although it might make it harder to verify according
> to the datasheets.

I tend to disagree, I still think it adds complexity and slowdown code
iteration as we will have to test both drivers at the same time to see
any regressions, which is not ideal.

I'd like to have an advice from Sakari and or Laurent on this matter,
what do you think ?

> 
> Patches 3 and 4 add the required identifiers for the Microsoft Surface Pro 9 to
> use its embedded vd55g0. The sensor isn't quite usable yet because of remaining
> issues in the IPU6 subsystem. Most notably the stream fails to start if the
> sensor sends less than a certain number of bytes per line (384 bytes or less
> on my hardware), and the frame gets cut off causing flickering when the CPU is
> idle. The latter issue was already documented by Hans de Goede on linux-media
> (Oct 2025).

Gotcha.

> 
> libcamera comes with generic defaults for unknown sensors and doesn't require
> any modifications to stream successfully.

Well yeah, the sensor will stream but will lack its medata to make it
stream cleanly. Please note that for Raspberry Pi this is a hard
requirement and it won't stream at without a cam_helper. Honestly that's
not that big of a deal and I consider it a side effect, we could fix
that easilly. I'm more concerned about the huge refactoring part.

> 
> Unfortunately, patch 5 in my series is not split into logical steps and does
> way too much at once. The renaming from vd55g1 to vd55g was unnecessary, and the
> following patches 6 and 7 should have been squashed into it as they represent
> cleanup steps instead of isolated logical changes. That makes this series
> completely unbisectable and not suitable for merging. The next version will

Indeed.

> focus on abstracting vd55g1.c in logical steps before supporting
> the vd55g0 revision.

Thank you for your work. I'm eager to see this.

> 
> Best regards,
> Peter Marshall

-- 
Regards,
Benjamin

