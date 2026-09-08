Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012008.outbound.protection.outlook.com [52.101.66.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E184C6EF8;
	Tue,  8 Sep 2026 08:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788857669; cv=fail; b=NKYDOMuuyHXkPOWLyQkbMlcurMj/RR0O+We1u9PAeJHHhTDhHQT1mGx0NvDgAG+xBg8tM2JIMUtOOvJZuPFsnJrlRI49WdcZaSS+/9sWlcKUU5vTYRwpXOeOdAAvdAvS98DoC38k7I/PaZe4bZhFpIfQE9AmphNWbPA3PfsGuNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788857669; c=relaxed/simple;
	bh=MCgO37gWrAgZjkMZjrG/vBEM5t5XEtEKYe3sG1pNrsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=joI7p0RRzi/qBHmOxg7ue2t+1VmK3bdYqWnN3M5cwOUUXuom3Un+cYb5rULFsm4s+Mi6hINNLAwyVgDc7QB77k9ky4dRce3w1E6FXZzMEf/OPIP5l2pqI9cfzgAsbw53Yy8Pa6+zZzIayPuYVzahlvBamtKAYCKqGt2+aY+uzk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=HqW46CY7; arc=fail smtp.client-ip=52.101.66.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="HqW46CY7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hgzbjl21FHVk6sDyfVvPcRZSorDaAHmQGaDclYCNwejD/SXRHZ9U9J+6vUnzENwXYRr0kxPR44EZsad6jS79E6pitacieusobPlNKqQ0XXgZRNtZJiDun1fuaY/+PMMU+0E4G/X46UcE5ZCBfBhojxZJREnsBnOf9j2uM6TeFKdE1nQ7kEL/DsbiG+ZIyRlwXzkITlctqjxlNvYys3hn3WQ9tiyZdpyv7R52XJN3EcVtaI+AVaNvRxvJP6wIcQUHKAsk42Bm0mw+lE+KB24SWQUoZc8BpNbpwOeniBjxjzTv/ULyma3+pzP156mLqITpCVIrv3L3vbfndKnuJrvkUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8wvm5RCf0lHTZDFq6U4kR6wCVrqodGcTB2AwB1KWRU=;
 b=wo6/QSRbZnqgFekipH60Ie+Ove6g9TdjcZzhDXjLh6vTM8wWzHudLOhEe22W3xF44pDlyyzEx2Fzbew9r8k9iEMS0rSiCHDD0j+8JYqQu1SZlnvyn7/lY2EQLKXS08QVUnrcvWZ3ZTH1j1V5thv13ElBeSIsksHsSfoqCccixaZfli5G8y2sdZzyHGospuQaLMGoVzIZOkUuEh9Cron99YmRbcZZbHb0xqOqlCYgEw6a5gChy3tjYIohmPF+fo/4dHkEnQoq7MWKPxAysYUmSCc+7UafBLM1yiXjk1JsHEtS6DeeADOQczDNzSCPWmWaHeeKUR5bFtzOcZ0XJBSx3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=pm.me smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8wvm5RCf0lHTZDFq6U4kR6wCVrqodGcTB2AwB1KWRU=;
 b=HqW46CY7lj4DK8Jt/NaFa8yViGJmhz2mYXAMsVd3dRzpjeuFcZFtfqvjhzNlsgxMnPpe2qhukld9XXTmrc11lpf7cqVlmP7we1m6PSjqv3w9GIOBJ7U/8jivTuUnq5SvsGoTTPnuYsTq2A1s4Um3Fc04Hsg6wH76IoUaXsno/XOTzLV4gIzRavRke52I2CjHFhorpDykv7ifujfT9KIBNnYNhdUK+6QFeTzHH5ExvM1iNFlT9WVH7+D968X4QFufv3Dkp7V+atOiX2wr0fP2wD6CwMjPBviwcvdy5zYgR24JHrmu8JymUZnzrr5YRwE2A2uK8D0i4zkEixBW+O3Ksw==
Received: from PR1P264CA0068.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2cc::6)
 by AM7PR10MB3269.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:106::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Tue, 8 Sep 2026
 08:54:11 +0000
Received: from MI3PEPF00008556.eurprd05.prod.outlook.com
 (2603:10a6:102:2cc:cafe::12) by PR1P264CA0068.outlook.office365.com
 (2603:10a6:102:2cc::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.6 via Frontend Transport; Tue, 8
 Sep 2026 08:54:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF00008556.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 08:54:09 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 8 Sep
 2026 11:00:09 +0200
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 8 Sep
 2026 10:54:08 +0200
Message-ID: <f164cbf4-04a6-449f-bec1-ea6bc40c4306@foss.st.com>
Date: Tue, 8 Sep 2026 10:54:08 +0200
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
References: <20260907205908.21303-1-lsa.uz@pm.me>
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20260907205908.21303-1-lsa.uz@pm.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008556:EE_|AM7PR10MB3269:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e64a778-a49a-493a-99a1-08df0d86bf3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|6133799003|13003099007|18002099003|22082099003|3023799007|5023799004|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	aKl/AKnd4YrxLasEMuEIEsd43okTrxqb2X6MobhQyV4DA1ABr8nyVxg3EfQ/RWi30dhsiwBhoWouUk9kFNlD7lTVzuL3djyn8Qzyojgt2yK4H0f6qkmFD5t3LCY1g+DoPw1rDmmRpthB3IoFFq5pEDghXNBXb/AhB1KZl0Re/HNT3s8YJ+BUMt+Wl0BR6Qhe3oQ5oosbl8K0Yd0QA7BNCzyVyM2e3lP8Vzypiz4AbegJdJ8hmk6L1uOu7p1akZOfBzZOI4TmouWSyN8tFbHgUC6YPhSyMGlNS9uw0Hft/M4SGcUF2RyUwq0Gwss9Xk29Fftbw+pPhsXM/vcDh5QL9HOS7kFA2ObuaQ19MJmFxaXH+YZCOmi6XSqe7YhDdZL0Db+WWX8AXO6GkIdvcYjaR3M97uNTga4VucimWucBf1WfpgRlTeN/p+4I8wKHpkxHqkcenKihHy7fekdaOcr22x5Mit+5e1wUMfr4ORdJ1sPIjjNxU227sVlyY4ipD7+J8iKUanJpoMzewZSFVWFrEIyoMd98iwHnKOH+g9rmvOdKWPhtQqU3EE0jU8mMpbqXIVU3Xaoe0IZ3KjW1KiWrAqHnEU/Q7JW3mWHn1DGe431ZHKmpRUfaoSwoIi8SWE9o0E+0+ZKybEOEO78l9zNGupo31cmaaYcTfKB1xGGTXXpCwHYWjaW9bTI+Ilj6fC8qpyLOJyS35EGnjq+wSc1XHQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(6133799003)(13003099007)(18002099003)(22082099003)(3023799007)(5023799004)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rFoPmxTtcBXl74gTg6dGOcJ3GDppKc7VxDT63jYtIdenO/IqOcu2Z4mUgJ0MozLQQhMRAPmrO1IpxB0oRSXveEuWlie2grzrnn2O9jHjvbu89pGFa6ukYP6o7f/CMgEfotFPK1+ubS1WsjBm4+ns7nFeS/q1jDs8qCEHwZQzPL9ZfZGa2yDbYH2jPUM1WEH0+az9K+Cpi+xbGwRHnpzuYWB0P+dyhhSqVwE95ysqsLQDBoK5khb7bZJYNTeZPwxG65zhoDajlSD3qecPCJmhDjLwaJWbKek3slWQ6SkI7Gw50kdf3eIGOqIfz3ictXIPu4Ac3bFrAitZUsIU1FosxZQEyDOfaCRMYCzF5cYZX/D3+fMXCKxFa4SwtB16Wuo1GUPBFwGgSyh8FRYBgB3Y5WPjGNN4u9tOb3Y5OQkpn7/Hf7XMhFRkIExOVCpIq8PJ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 08:54:09.4553
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e64a778-a49a-493a-99a1-08df0d86bf3f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008556.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3269

Hi Sergey,

Le 07/09/2026 à 22:59, Sergey Lebedev a écrit :
> Peter,
> 
> Tested on a second machine: Surface Pro 11 for Business, Intel Lunar Lake,
> IPU7 — same SMO55F0 HID as your Surface Pro 9, one IPU generation later.
> Two results worth having before you respin, one good and one blocking.
> 
> The good one: the series applies and builds clean, and the sensor works on
> IPU7. All seven patches applied in order to an Ubuntu 7.0.0 tree with no
> conflicts (its vd55g1.c is 2061 lines, exactly what your diffstat deletes),
> and media/i2c, media/pci/intel and int3472 rebuilt without a warning.
> With firmware present the driver probes, the bridge finds the sensor and
> the subdev registers:
> 
>   intel-ipu7: Found supported sensor SMO55F0:00
>   intel_ipu7_isys: bind vd55g 1-0060 nlanes is 1 port is 1
>   entity 233: vd55g 1-0060 (1 pad, 1 link, 0 routes)
> 
> So nothing here is IPU6-specific. That is the part I could add that you
> could not.
> 
> The blocking one: without that firmware nobody can use VD55G0 at all.
> 
>   vd55g i2c-SMO55F0:00: Direct firmware load for vd55g0-cut1.bin failed
>                         with error -2
>   vd55g i2c-SMO55F0:00: Failed to load required firmware vd55g0-cut1.bin: -2
> 
> Probe fails and the camera disappears. The driver has a fallback for
> exactly this case, but only the older part gets one:
> 
>   static const struct firmware vd55g1_builtin_fw = {
>           .data = vd55g1_patch_array, .size = ARRAY_SIZE(vd55g1_patch_array)
>   };
>   ...
>   if (ret == -ENOENT && fw_info->builtin_fw)
> 
> vd55g0_fw_maps[] sets fw_name and leaves builtin_fw NULL, and neither
> vd55g0-cut1.bin nor vd55g0-cut2.bin is in linux-firmware. So the series
> works for you and for nobody else, which I assume is not the intent. Either
> a built-in like VD55G1's, or the files submitted to linux-firmware, or at
> minimum a note in the cover letter saying where they come from.
> 
> To get past it I used the same ST patch arrays that André Gilerson's
> out-of-tree VD55G0 driver compiles in (vd55g0_patches.h, "Copyright (C)
> 2024 STMicroelectronics SA"), written out as a file. cut1 is 6868 bytes and

I'm not aware of André's work. Could you link it to me ?

The only vd55g0 out of tree driver I know is our own version on
Github[1]. Is it a fork of it ?

[1] https://github.com/STMicroelectronics/vd55g0-linux-driver

> its header parses correctly against struct vd55g_patch_header — 0x0681,
> version 2.11 — so the format is right. That is how I tested, not a
> distribution path I am proposing.
> 
> Second, and this one reaches further than this series. Benjamin's warning
> about libcamera is concrete and it is a regression for machines that work
> today. libcamera keys the sensor-properties database, the soft-ISP helper
> and the tuning file on the media entity name, which is the driver name:
> 
>   WARN  No static properties available for 'vd55g'
>   WARN  'vd55g 1-0060': No sensor delays found in static properties
>   WARN  Configuration file 'vd55g.yaml' not found for IPA module 'simple'
>   WARN  IPASoft: Failed to create camera sensor helper for vd55g
> 
> and the installed libcamera 0.7.0 does carry a vd55g1 entry — `strings
> libcamera.so.0.7 | grep -x vd55g1` finds it. So renaming the driver does
> not only fail to help VD55G0; it silently takes the properties and the
> helper away from VD55G1 users who have them now. Whatever is decided about
> one driver or two, that rename needs libcamera patches landing alongside,
> or the entity name keeping its old form.
> 
> Two smaller things, neither chased:
> 
>   - `supply vcore not found, using dummy regulator` persists here despite
>     4/7's SMO55F0 mapping. It was not the blocker, so I did not dig.
>   - 3/7 advertises 380 MHz for SMO55F0. This machine has been running 402 MHz
>     ("MIPI output freq is 804MHz / 2") from the out-of-tree driver. Your
>     driver takes the endpoint's value rather than validating against a list,
>     so it accepted 380 without complaint, and I have not established which is
>     correct for either model. Worth knowing that two people measured
>     different numbers for the same HID on different Surfaces.
> 
> Happy to run v2 here when you have one, and to report anything specific you
> would like measured on IPU7.
> 
> Sergey
> 

-- 
Regards,
Benjamin

