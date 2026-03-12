Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011008.outbound.protection.outlook.com [40.93.194.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5BF1E1C02;
	Thu, 12 Mar 2026 13:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322002; cv=fail; b=KLGz62MdPWY3gql088qd4GQuXs6ETelzIEQTCQ1uaLUavPiRaQJ2sT7/CtU8153qe7dV7xA3VvFFu72t/0f3dJ0Kxf6c4DYwnD2dCs6JkFZbMJc4RqejWrw68nSUY+DAO6wTZ5Kpw5Q1Rk+HkC8L+fJJYCKZvZ9K9G+ccm520GQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322002; c=relaxed/simple;
	bh=TpUMBSkYFHK6uPAjDm0xEfUwWAOl8z3gAg0Wat8I2cg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ODXn/ueZvUNsmgA4URY1HMd/CDxGJQJ6wSPRnaQDqb12QlUSIdmsx392K9vGSIMocMbtiaUdBtoGMT5BS0XfVZE+lgowZYeu65uG6+eslzuarm1awCO/LcwCqFSOz25N7Z9m8U9km76ZoV6G12uwS2o8FTtdi2WP3ai29t6hbFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nf1uTuKA; arc=fail smtp.client-ip=40.93.194.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nf1uTuKA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aOKlRSovQx8vKwxKcbZLhdxujMpSjspEFrWZosD/gMqFvI8i0Jf8pUBFKV8LB70/b29n3b1wuKZBku7qvfLvfA8efYYhcthIy3u+TflrI9siHsFCzP3h14Gt6c8zUzkld0Z4OlAI3sxKAgDxH1nZncUM5aNJ7xKGPCAfbbFUsUU1RvMzJVdFrrBpjAaGOHboWsn+SB87OeTefmQ8bxDJGt1yMPUFGaJRKLAyGufG6+jrCmHEHzvy6h/rDBbwZwIsFfsOoKbmDG20Mb6Myet2pz1Kzl6S0XbN85cbBzhZALXrEJbcGZ2vd58IeSXPXMpwnjrAeG8VaEMoI7MiBpld0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZeWsOCVG3YrSav9qruv+63Ro9j9cCDLta4Ej87Qdymw=;
 b=GX2+C4VExJlDXwCUylv2FHrcHfp3uhlhBjkBqra0en0KIGCMLAhpkUruclCybRKxr7a7R/ow3dUPKhXolUh8AMjQ3zlymJqdkEalin/0sdUW5YhdVL/CbGWJjRnFt9RbMx9JmL0ZlE+UTAD2CHlQb+xIXlChXxCNi1lqk8sgAk1j9anTT6LKylzXHufzbxOj+cCGfxzriGCTgo60CYQ2KjX0ujmurpTRor2xJl1qysYt5ePaKy/jQNshIJZFrfZ27bp6LLf2Xy5Zq4TNreMyqKWSl97ESOgCEOd2g757e1HSUi5r28i0cGtAvhGKDmVa6VO/He/WY4YLKEWH/Oa47w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZeWsOCVG3YrSav9qruv+63Ro9j9cCDLta4Ej87Qdymw=;
 b=nf1uTuKAm5bdiz9RiGsFnOWTjV3totjJ81txN5zQdW03gGuKHJpY+kyRyD1dQlw27NPO4gFG6XP8H+lEulhHHPMsQ7W3HaVRcEGmS2XLPKWTHKA3bmdL4DTAuLTjioWBRUcSA0CQTpzp4A2/rmR8j2Jv/bsbWWOTWSh/HhzsO10=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by DS2PR12MB9568.namprd12.prod.outlook.com (2603:10b6:8:27c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Thu, 12 Mar
 2026 13:26:37 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 13:26:37 +0000
Message-ID: <a3c34018-78fb-4652-b31e-3870a51ee35e@amd.com>
Date: Thu, 12 Mar 2026 08:26:36 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 4/4] platform/x86/amd: dptc: Add device entries for
 handheld PCs
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: W_Armin@gmx.de, sashal@kernel.org, Shyam-Sundar.S-k@amd.com,
 derekjohn.clark@gmail.com, denis.benato@linux.dev, i@rong.moe,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260309205125.293148-1-lkml@antheas.dev>
 <20260309205125.293148-5-lkml@antheas.dev>
 <d5c2a4e0-1263-42ac-a64a-c6218e91bc09@amd.com>
 <CAGwozwFpgGV96YjaZbVfBosBL8TqXTtYJ=Av5tHSi24zV_-SMw@mail.gmail.com>
 <6545b671-6e51-4899-af28-354e7e423056@amd.com>
 <CAGwozwF2ZxN5UF-rLP0zwyqO81P6UxY=TQ2XRby8hRdxoSRpYg@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAGwozwF2ZxN5UF-rLP0zwyqO81P6UxY=TQ2XRby8hRdxoSRpYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0213.namprd04.prod.outlook.com
 (2603:10b6:806:127::8) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|DS2PR12MB9568:EE_
X-MS-Office365-Filtering-Correlation-Id: d025dcfb-2813-4c34-954a-08de803afcfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	lauWCsP7dbKu9tytADgzfS7Z/TFgzk0i6VgEBrqF1/i6RW04RTploa7ROGjfxMw8Vm0GMzk/Wycgq4xO0Oo8GMUp25asJ/z4MGsPLQFJySyVQsUEbOT3/q1aB9Ns33AVveYgsIGW+y3PMSHY4eEN4JiDH+x6xMNhGirPmuO71FKcP536ctrfFI/WUnPXZmN+6rCoR+JcfVM9cnP/UTugwThjvkOmnX8uys2gh1EzXhDUsWbQOeg/OO9MLPDlFwHK0TLXB1EWEzTIYifpiGmjiETkQmwN3hL1o1y3lDnew0M5p/N/aL7gPxtKaJjeJI6S91wcoKbZ8iai1ee56EQao6+9rhOQoJ0viK8GVkWR8BSBzHnO6m8MYE9N7h5V+4zdcEeMty8GI4HG7SeVU3NgkKXTko4cbtvsFtqQDNgz90g83fKYW01KQ0Paa207e2+8smS9J3vigkYPqsMgXOVSRfSH47nsTjXxUSqV61DGfB7684djPDeVc/Rcp3X230s4PRoqj+L42v7UfAqTzbracJBvfssv0OxJGfKQ6aqw/XAfzq+9hS6u6NOPuCZgHFgxiBxvrA33U5uRtSMRD4aja24DC3MrmxvJHRfbWyv4qvLDUr95Wdt+YD00NhtlcMMn041tSk5Xl8WpZMch5BV30CTYLpxK3xA2+BUaLNBUzDQ/13vKAV+gY0MOOcBeSmw2IqQSz0FTV4IH6LqHTmMT2J0CpUFTxt8RzlHPU9MRXDk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnVWRDhQbWNYWU9mdnkzdmNEN3RaTnZpcXVYZ253UW1sVnFhRHVZZG1nWmRT?=
 =?utf-8?B?UjlwWHJYUHlzTW52MDI2NXBsTlRlcUQvUkxsSTRaQTZXa0tvT0VObDFhZXhK?=
 =?utf-8?B?K2NyM01yK0lYbnUvSHVwckFhWVRMc3N6enVyTjVLcXIrN1RvdmJjTm00Wmpq?=
 =?utf-8?B?aEJNQ0s5ZzNCdnppTUhmQ2VBVmVIMlpjOGpFeFgrN2FtdDZnaU82WlRXVDZL?=
 =?utf-8?B?ZFBMSWJPaEFRajIzeGQ2YzVydXI3RG95cjlUTW5sZEhQZG5VbDZGZmNqcnBF?=
 =?utf-8?B?bzJzT3ZvWTlYSWNiMGh4bFZnQStYS2FNTXZWeHNZZFlNMGdmbzBNK2wyVnhM?=
 =?utf-8?B?QUNRTjRrczVyYW5Mb2N2ODNwMTFtVkZnUUpBTm1iY0xNR2dLSDR0NXFGRkZH?=
 =?utf-8?B?MmNZL1BDcnI5UG5yQlcvakJ5T3JVWThqWEFqaDlTalR0NHVGRXBKNFlzcFEw?=
 =?utf-8?B?SUNoOXRIT2FuOHVnSWZFamppbVdhYnhmaC9PSHI2bVFmbXlmUzR1NUFxK2N1?=
 =?utf-8?B?YnpWMjlrK25DQjZLM2QrZ0VkdGtHNVNudy9iZzdLVU4ydTFTQ1ZMNm5IV0Rw?=
 =?utf-8?B?em14aTRpVXkxQlVwS1lzYmhEZVJuN1l5eXM4Skx6dmNJM0ZUZjc5ZCtlMnl0?=
 =?utf-8?B?eDVIcjRNUFNNaENrcnlxU3VzYlY1SEUxTHUxVXROSi9taGJGNUFkanRwZ08r?=
 =?utf-8?B?S2JJckdzaUwxTzZjUklNVlB1d0NVVjluc0VKZGNDZnRpOTdEQUw0OUJNYVM4?=
 =?utf-8?B?ZnNFN0FSR2ZmeDZrbStJSnFhWVlhT0xHaUJXK0pjMG9CYnpTMlk0eUNWOHdZ?=
 =?utf-8?B?bDZZR1VLSUZZQWVMeGl1NVJleVZaSWZRWnREOFk1SklOYTRzMnkyVlpIVkJu?=
 =?utf-8?B?UjI2N1ZKK3M3MmlwNjFLS2RiaEs1ZmhjMGlFUEhrZHJaYlVUclZVSExoRkpH?=
 =?utf-8?B?YlM1TnVnZnJpSDJ0TVc5QmNMbjMySWdEcUFwREg1L3ZXRis4b24yYzhoNzdJ?=
 =?utf-8?B?RG45eWVSUGJzWHpQOThLU0g3N1ptWVNZREU2eFlNeWJ2WTRpL0Ixb1JUUW5V?=
 =?utf-8?B?ZFB1ZEMwSjBKbHFyNkc2KzVNZmc2TmhEOWtVZWN5bTdiaFlvSEdIWWlQYVQz?=
 =?utf-8?B?K2lIQkxJVmdDTHN1YktQSnJCMksrODVHZUI2NnFyMlE0VW1lNWgrbUpEclZT?=
 =?utf-8?B?UVZNeUZjUUJYUEdESVF4aVVzOW54bkNvdTVrdFczZ0VMYzJkcFV1Zit4b1d6?=
 =?utf-8?B?T1RkbnBpTDJOZHRxb3J0aGNxS0FyNGtCYWc1ZjJkeFM0UzFyT29DMUs0akh0?=
 =?utf-8?B?amkxa2Z6TFozR2F5WWZZZDhEY0tVN09QcEpuVUxPRjlua1hsSkZYdUs4MXFp?=
 =?utf-8?B?dWtGbmxwbDlTNFUxZ0RSS2t4M1AzRTZZSGZXMlBRMlBVU2txU3hqUWRRSnF2?=
 =?utf-8?B?MjYwellTYkFOb1NnTE93L1BpLzlkRjI1eHVOYzVuNHlub0NlM2Rxa25NUGR1?=
 =?utf-8?B?OVVLQkREblgzNkMweTFINDZ0VnpELzdSWjAzOGZUemc1VVZHNno5L1JLRXk4?=
 =?utf-8?B?eWtFUGRSVUU0K1U4NHcrcjY3bHFvODBuaG5MYk1qNGhwa1ZOeDdZdjVGOTlP?=
 =?utf-8?B?bG5DaGd3L3MxdzNSSll1OGxtZmlsQVBRQm0zZlltWnZCZk4zbjhRK0lQdjMr?=
 =?utf-8?B?QjN1OWI2MnpIblRGSUxud2NRdUxLWDJwRGNzZFl1WHNKT28ybzIxdEVrbXpy?=
 =?utf-8?B?UHRjbEsweExJQUNxRmFTOS9jT2hQRk1zYUhzcStVM2E0S3NyNzRNYmx5L0ZJ?=
 =?utf-8?B?UlZZbFFIYitrdjlienRiMitieS9BbDlHZ1hXTTdCL3hCZzROYktBUjlOWEhJ?=
 =?utf-8?B?NVNMSXdjWWxrUWVYOEdmcENzT0dlQ2hpYXpnbkYzSElpeU5DWTBLMzZOU25h?=
 =?utf-8?B?b3dXRnRPeERuSC9SdVlPQ2diWWgxTXpXa0dGenVRNG9DRE9tamVKbzVHOTFs?=
 =?utf-8?B?SlhjRlowbEVXMDkxNWRNTTVCNHFGYWJ2YVR1QWxhdkFwR3dPazFsclZsSkw4?=
 =?utf-8?B?Y1dNVHkyVVVHY1dBcWgwQ21TMGdhUEtQNUllenRUblU5Q1NIV0ZwUXBJWHhD?=
 =?utf-8?B?VEZwVjVObkRReVlIVXNrZzVORE5yQUp2Mno2bG5Ga2RKK1phbVJzNnBDTDkr?=
 =?utf-8?B?dUFTZGorQzAzSGNXZUZuTzFBRU1NcWsxQ0FUWjczbUhaQjZCcTBiaUtkNDJO?=
 =?utf-8?B?SFN0bkM4OWhKVHVCVEFlM2NqanZhQitpdG9hbmpkbnFyNDJiL0RHd0JYVkpW?=
 =?utf-8?B?aXp1ODZ5czdNdjhJazJyS0tqNXl1OUhDTTZJMFJxN1B0MzFtMWNiQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d025dcfb-2813-4c34-954a-08de803afcfc
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 13:26:37.5290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0D8WSb8ClCPzeVDe8kq2S+9M700BeyYXCD2qPJCoDrPDo224yGrKLkVP1SB3+jL9psWiMwR+oSsEsWfS25GMXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9568



On 3/11/26 14:13, Antheas Kapenekakis wrote:
> On Tue, 10 Mar 2026 at 17:35, Mario Limonciello
> <mario.limonciello@amd.com> wrote:
>>
>> On 3/10/26 3:13 AM, Antheas Kapenekakis wrote:
>>> On Tue, 10 Mar 2026 at 05:11, Mario Limonciello
>>> <mario.limonciello@amd.com> wrote:
>>>>
>>>>
>>>>
>>>> On 3/9/2026 3:51 PM, Antheas Kapenekakis wrote:
>>>>> Add limit tables and DMI entries for AMD APU-based handheld devices:
>>>>>
>>>>>     - 15W class: AYANEO AIR
>>>>>     - 18W class: AYANEO AIR Plus/Pro
>>>>>     - 25W class: AYANEO AIR 1S, NEXT/KUN
>>>>>     - 28W class: GPD Win Mini/4/Max 2, GPD Duo, GPD Pocket 4, AYANEO 2,
>>>>>                   OrangePi NEO-01, SuiPlay0X1
>>>>>     - 30W class: AYANEO FLIP/GEEK/SLIDE/3, AOKZOE A1/A1X/A2,
>>>>>                   OneXPlayer F1Pro/2/X1/G1, AYN Loki Max, Zeenix Pro
>>>>>
>>>>> Also add SoC strings for Ryzen AI, Ryzen 8000/7040/6000/5000
>>>>> families, extending support beyond the initial AI MAX series.
>>>>
>>>> There are a lot of numbers here.  Where did they all come from?  What
>>>> are guesses?  What came from RE?  What came from documentation?
>>>> How do you know these are good for the thermal design of the platform?
>>>>
>>>> I appreciate some of them could be cargo culted from another codebase,
>>>> but I think it would be a good idea to document which ones are more
>>>> likely to be accurate and why.
>>>
>>> Ok, here is the logic behind the limits.
>>>
>>> 15/18/25 are manufacturer claims by Ayaneo. Ayaneo is the only
>>> manufacturer that made devices prior to the new ones that support 30W
>>> limits.
>>>
>>> 28W is used for GPD because their devices are very portable and 30W
>>> makes e.g. the bottom pan of Win Minis too hot. It is also used for
>>> the Ayaneo 2/Sui/OPI, because these devices have a fullwidth glass
>>> front that is used for heat dissipation. So the screen gets very hot.
>>>
>>> The rest of the devices use 30W.
>>>
>>> As for which software each OEM has. GPD: GPD does not ship first party
>>> software for TDP controls. They collaborate with an independent
>>> developer developing "Motion Assistant", which they also ship with
>>> their devices and features a TDP slider. Ayaneo uses Ayaspace, which
>>> is backed by Ryzenadj, and they give slider control to users,
>>> typically with a 30W limit. They also use userspace customizable
>>> presets for some default e.g. 20W profiles. Onexplayer has oxpconsole
>>> with a slider as well that does 30W usually. Ayn exited the market on
>>> WIndows handhelds, no software. OPI, you'd need to ask Phil but this
>>> would be the primary driver for it. There is no alternative that can
>>> also go to SteamOS.
>>>
>>> The reasoning behind the profiles is simple. 8W is power savings
>>> territory. Going below can yield around 1W more, but the performance
>>> degradation is not worth it. 15W is a good sweetspot for 30W
>>> processors. Then, 25W is good for these devices as they saturate above
>>> 22ish Watts. We could even go lower to 20W, as Lenovo did on the
>>> original Go. But their newer devices use higher AC values.
>>>
>>> For their boost clocks, sPPT is set to around 2W higher than spl (what
>>> is it called now?) to give a small boost. fPPT is set to a reasonable
>>> amount for that device class and interpolated vs spl. The exception is
>>> low-power where we do not want boost
>>>
>>> Antheas
>>
>> OK, each and every one of these cases needs to be documented.
>>
>> I suggest that they each go in their own patches, and then if there is
>> any disagreement it's a single patch to revert or drop from the rest of
>> the series.
> 
> Ok, so here is what I suggest going forward.
> 
> We keep the last patch while this is an RFC and annotate it as planned
> to be dropped so the series can still be tested. Then, once we exit
> RFC we merge initially for Win 5 to reduce email bloat. After merge, I
> go through the DMIs and group them by device type, adding information
> about the devices on the commit message. Then, these go to for-fixes
> with a cc stable.
> 
> While doing that, I will drop all non EXACT matches. Specifically, the
> Ayaneo 1S had a few variants with different DMIs (1S Limited being one
> of them if I recall).
> 
> This will allow us to drop the CPU match with high certainty. I will
> replace it with just an is AMD check with no logs or perhaps a debug
> log, to avoid polluting Intel variant's dmesg if any.

I suggest using X86_FEATURE_ZEN if you need a check to prove it's AMD.

> 
> Best,
> Antheas
> 
>>>
>>>>>
>>>>> Assisted-by: Claude:claude-opus-4-6
>>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>>>> ---
>>>>>     drivers/platform/x86/amd/dptc.c | 420 ++++++++++++++++++++++++++++++++
>>>>>     1 file changed, 420 insertions(+)
>>>>>
>>>>> diff --git a/drivers/platform/x86/amd/dptc.c b/drivers/platform/x86/amd/dptc.c
>>>>> index f4db95affb1b..b2820f8652f1 100644
>>>>> --- a/drivers/platform/x86/amd/dptc.c
>>>>> +++ b/drivers/platform/x86/amd/dptc.c
>>>>> @@ -86,6 +86,81 @@ static const struct dptc_param_desc dptc_params[DPTC_NUM_PARAMS] = {
>>>>>                                  1, ALIB_ID_TEMP_TARGET },
>>>>>     };
>>>>>
>>>>> +/* 15W class: AYANEO AIR (Ryzen 5 5560U) */
>>>>> +static const struct dptc_device_limits limits_15w = {
>>>>> +     .params = {
>>>>> +             [DPTC_PPT_PL1_SPL]  = {  1,  5, 10, 15,  18 },
>>>>> +             [DPTC_PPT_PL2_SPPT] = {  1,  5, 10, 15,  18 },
>>>>> +             [DPTC_PPT_PL3_FPPT] = {  1,  5, 12, 18,  22 },
>>>>> +             [DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
>>>>> +     },
>>>>> +     .profiles = {
>>>>> +             [PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  5,  5,  8, 0 } },
>>>>> +             [PLATFORM_PROFILE_BALANCED]    = { .vals = { 10, 12, 15, 0 } },
>>>>> +             [PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 15, 15, 18, 0 } },
>>>>> +     },
>>>>> +};
>>>>> +
>>>>> +/* 18W class: AYANEO AIR Plus/Pro (Ryzen 5 5560U, Ryzen 7 5825U) */
>>>>> +static const struct dptc_device_limits limits_18w = {
>>>>> +     .params = {
>>>>> +             [DPTC_PPT_PL1_SPL]  = {  1,  5, 15, 18,  22 },
>>>>> +             [DPTC_PPT_PL2_SPPT] = {  1,  5, 15, 18,  22 },
>>>>> +             [DPTC_PPT_PL3_FPPT] = {  1,  5, 15, 20,  25 },
>>>>> +             [DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
>>>>> +     },
>>>>> +     .profiles = {
>>>>> +             [PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  5,  5,  8, 0 } },
>>>>> +             [PLATFORM_PROFILE_BALANCED]    = { .vals = { 12, 14, 15, 0 } },
>>>>> +             [PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 18, 18, 20, 0 } },
>>>>> +     },
>>>>> +};
>>>>> +
>>>>> +/* 25W class: Ryzen 5000 handhelds (AYANEO NEXT, KUN) */
>>>>> +static const struct dptc_device_limits limits_25w = {
>>>>> +     .params = {
>>>>> +             [DPTC_PPT_PL1_SPL]  = {  1,  4, 15, 25,  32 },
>>>>> +             [DPTC_PPT_PL2_SPPT] = {  1,  4, 20, 27,  35 },
>>>>> +             [DPTC_PPT_PL3_FPPT] = {  1,  4, 25, 30,  37 },
>>>>> +             [DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
>>>>> +     },
>>>>> +     .profiles = {
>>>>> +             [PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  8,  8, 12, 0 } },
>>>>> +             [PLATFORM_PROFILE_BALANCED]    = { .vals = { 15, 17, 20, 0 } },
>>>>> +             [PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 25, 27, 30, 0 } },
>>>>> +     },
>>>>> +};
>>>>> +
>>>>> +/* 28W class: GPD Win series, AYANEO 2, OrangePi NEO-01 */
>>>>> +static const struct dptc_device_limits limits_28w = {
>>>>> +     .params = {
>>>>> +             [DPTC_PPT_PL1_SPL]  = {  1,  4, 15, 28,  32 },
>>>>> +             [DPTC_PPT_PL2_SPPT] = {  1,  4, 20, 30,  35 },
>>>>> +             [DPTC_PPT_PL3_FPPT] = {  1,  4, 25, 32,  37 },
>>>>> +             [DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
>>>>> +     },
>>>>> +     .profiles = {
>>>>> +             [PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  8,  8, 12, 0 } },
>>>>> +             [PLATFORM_PROFILE_BALANCED]    = { .vals = { 15, 17, 22, 0 } },
>>>>> +             [PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 25, 28, 32, 0 } },
>>>>> +     },
>>>>> +};
>>>>> +
>>>>> +/* 30W class: OneXPlayer, AYANEO FLIP/GEEK/SLIDE/3, AOKZOE */
>>>>> +static const struct dptc_device_limits limits_30w = {
>>>>> +     .params = {
>>>>> +             [DPTC_PPT_PL1_SPL]  = {  1,  4, 15, 30,  40 },
>>>>> +             [DPTC_PPT_PL2_SPPT] = {  1,  4, 20, 32,  43 },
>>>>> +             [DPTC_PPT_PL3_FPPT] = {  1,  4, 25, 41,  50 },
>>>>> +             [DPTC_CPU_TEMP]     = { 60, 70, 85, 90, 100 },
>>>>> +     },
>>>>> +     .profiles = {
>>>>> +             [PLATFORM_PROFILE_LOW_POWER]   = { .vals = {  8,  8, 12, 0 } },
>>>>> +             [PLATFORM_PROFILE_BALANCED]    = { .vals = { 15, 17, 25, 0 } },
>>>>> +             [PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 25, 28, 41, 0 } },
>>>>> +     },
>>>>> +};
>>>>> +
>>>>>     /* AI MAX Handheld class: GPD Win 5 */
>>>>>     static const struct dptc_device_limits limits_maxhh = {
>>>>>         .params = {
>>>>> @@ -107,11 +182,56 @@ static const char * const dptc_soc_table[] = {
>>>>>         "AMD RYZEN AI MAX+ 395",
>>>>>         "AMD RYZEN AI MAX+ 385",
>>>>>         "AMD RYZEN AI MAX 380",
>>>>> +     /* Ryzen AI */
>>>>> +     "AMD Ryzen AI 9 HX 370",
>>>>> +     /* Ryzen 8000 */
>>>>> +     "AMD Ryzen 7 8840U",
>>>>> +     /* Ryzen 7040 */
>>>>> +     "AMD Ryzen 7 7840U",
>>>>> +     /* Ryzen 6000 */
>>>>> +     "AMD Ryzen 7 6800U",
>>>>> +     "AMD Ryzen 7 6600U",
>>>>> +     /* Ryzen 5000 */
>>>>> +     "AMD Ryzen 7 5800U",
>>>>> +     "AMD Ryzen 7 5700U",
>>>>> +     "AMD Ryzen 5 5560U",
>>>>
>>>> Still don't understand the point of this list.
>>>
>>> Parallel reply.
>>>
>>>>>         NULL,
>>>>>     };
>>>>>
>>>>>     static const struct dmi_system_id dptc_dmi_table[] = {
>>>>>         /* GPD */
>>>>> +     {
>>>>> +             .ident = "GPD Win Mini",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
>>>>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1617-01"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_28w,
>>>>> +     },
>>>>> +     {
>>>>> +             .ident = "GPD Win Mini 2024",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
>>>>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1617-02"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_28w,
>>>>> +     },
>>>>> +     {
>>>>> +             .ident = "GPD Win Mini 2024",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
>>>>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1617-02-L"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_28w,
>>>>> +     },
>>>>> +     {
>>>>> +             .ident = "GPD Win 4",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
>>>>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1618-04"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_28w,
>>>>> +     },
>>>>>         {
>>>>>                 .ident = "GPD Win 5",
>>>>>                 .matches = {
>>>>> @@ -120,6 +240,306 @@ static const struct dmi_system_id dptc_dmi_table[] = {
>>>>>                 },
>>>>>                 .driver_data = (void *)&limits_maxhh,
>>>>>         },
>>>>> +     {
>>>>> +             .ident = "GPD Win Max 2",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
>>>>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1619-04"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_28w,
>>>>> +     },
>>>>> +     {
>>>>> +             .ident = "GPD Win Max 2 2024",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
>>>>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1619-05"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_28w,
>>>>> +     },
>>>>> +     {
>>>>> +             .ident = "GPD Duo",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
>>>>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1622-01"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_28w,
>>>>> +     },
>>>>> +     {
>>>>> +             .ident = "GPD Duo",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
>>>>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1622-01-L"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_28w,
>>>>> +     },
>>>>> +     {
>>>>> +             .ident = "GPD Pocket 4",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
>>>>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1628-04"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_28w,
>>>>> +     },
>>>>> +     {
>>>>> +             .ident = "GPD Pocket 4",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_SYS_VENDOR, "GPD"),
>>>>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "G1628-04-L"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_28w,
>>>>> +     },
>>>>> +     /* OrangePi */
>>>>> +     {
>>>>> +             .ident = "OrangePi NEO-01",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "OrangePi"),
>>>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEO-01"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_28w,
>>>>> +     },
>>>>> +     /* AYN */
>>>>> +     {
>>>>> +             .ident = "AYN Loki Max",
>>>>> +             .matches = {
>>>>> +                     DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ayn"),
>>>>> +                     DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Loki Max"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_30w,
>>>>> +     },
>>>>> +     /* Tectoy (Zeenix Pro = Loki Max) */
>>>>> +     {
>>>>> +             .ident = "Zeenix Pro",
>>>>> +             .matches = {
>>>>> +                     DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Tectoy"),
>>>>> +                     DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Zeenix Pro"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_30w,
>>>>> +     },
>>>>> +     /* AOKZOE */
>>>>> +     {
>>>>> +             .ident = "AOKZOE A1 AR07",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
>>>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1 AR07"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_30w,
>>>>> +     },
>>>>> +     {
>>>>> +             .ident = "AOKZOE A1 Pro",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
>>>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1 Pro"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_30w,
>>>>> +     },
>>>>> +     {
>>>>> +             .ident = "AOKZOE A1X",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
>>>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1X"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_30w,
>>>>> +     },
>>>>> +     {
>>>>> +             .ident = "AOKZOE A2 Pro",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
>>>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A2 Pro"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_30w,
>>>>> +     },
>>>>> +     /* OneXPlayer (Intel variants filtered by SoC table) */
>>>>
>>>> Are you telling me the Intel variants actually have the same ACPI
>>>> methods this series looks for?
>>>
>>> They do not.
>>
>> OK then this comment appears wrong.
> 
> Ack See above.
> 
>>>
>>>>> +     {
>>>>> +             .ident = "ONEXPLAYER F1Pro",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
>>>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER F1Pro"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_30w,
>>>>> +     },
>>>>> +     {
>>>>> +             .ident = "ONEXPLAYER F1 EVA-02",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
>>>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER F1 EVA-02"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_30w,
>>>>> +     },
>>>>> +     {
>>>>> +             .ident = "ONEXPLAYER 2",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
>>>>> +                     DMI_MATCH(DMI_BOARD_NAME, "ONEXPLAYER 2"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_30w,
>>>>> +     },
>>>>> +     {
>>>>> +             .ident = "ONEXPLAYER X1 A",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
>>>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1 A"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_30w,
>>>>> +     },
>>>>> +     {
>>>>> +             .ident = "ONEXPLAYER X1z",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
>>>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1z"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_30w,
>>>>> +     },
>>>>> +     {
>>>>> +             .ident = "ONEXPLAYER X1Pro",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
>>>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1Pro"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_30w,
>>>>> +     },
>>>>> +     {
>>>>> +             .ident = "ONEXPLAYER G1 A",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
>>>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER G1 A"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_30w,
>>>>> +     },
>>>>> +     /* AYANEO - 15W */
>>>>> +     {
>>>>> +             .ident = "AYANEO AIR",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_15w,
>>>>> +     },
>>>>> +     /* AYANEO - 18W */
>>>>> +     {
>>>>> +             .ident = "AYANEO AIR Plus",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR Plus"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_18w,
>>>>> +     },
>>>>> +     {
>>>>> +             .ident = "AYANEO AIR Pro",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AIR Pro"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_18w,
>>>>> +     },
>>>>> +     /* AYANEO - 25W */
>>>>> +     {
>>>>> +             .ident = "AYANEO AIR 1S",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>>>> +                     DMI_MATCH(DMI_BOARD_NAME, "AIR 1S"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_25w,
>>>>> +     },
>>>>> +     {
>>>>> +             .ident = "AYANEO NEXT Advance",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Advance"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_25w,
>>>>> +     },
>>>>> +     {
>>>>> +             .ident = "AYANEO NEXT Lite",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Lite"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_25w,
>>>>> +     },
>>>>> +     {
>>>>> +             .ident = "AYANEO NEXT Pro",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Pro"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_25w,
>>>>> +     },
>>>>> +     {
>>>>> +             .ident = "AYANEO NEXT",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_25w,
>>>>> +     },
>>>>> +     {
>>>>> +             .ident = "AYANEO KUN",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "KUN"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_25w,
>>>>> +     },
>>>>> +     {
>>>>> +             .ident = "AYANEO KUN",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO KUN"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_25w,
>>>>> +     },
>>>>> +     /* AYANEO - 28W */
>>>>> +     {
>>>>> +             .ident = "AYANEO 2",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>>>> +                     DMI_MATCH(DMI_BOARD_NAME, "AYANEO 2"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_28w,
>>>>> +     },
>>>>> +     {
>>>>> +             .ident = "SuiPlay0X1",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_SYS_VENDOR, "Mysten Labs, Inc."),
>>>>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "SuiPlay0X1"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_28w,
>>>>> +     },
>>>>> +     /* AYANEO - 30W */
>>>>> +     {
>>>>> +             /* DMI_MATCH catches all FLIP variants (DS, KB, 1S DS, 1S KB) */
>>>>> +             .ident = "AYANEO FLIP",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>>>> +                     DMI_MATCH(DMI_BOARD_NAME, "FLIP"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_30w,
>>>>> +     },
>>>>> +     {
>>>>> +             /* DMI_MATCH catches GEEK and GEEK 1S */
>>>>> +             .ident = "AYANEO GEEK",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>>>> +                     DMI_MATCH(DMI_BOARD_NAME, "GEEK"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_30w,
>>>>> +     },
>>>>> +     {
>>>>> +             .ident = "AYANEO SLIDE",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "SLIDE"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_30w,
>>>>> +     },
>>>>> +     {
>>>>> +             .ident = "AYANEO 3",
>>>>> +             .matches = {
>>>>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>>>> +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO 3"),
>>>>> +             },
>>>>> +             .driver_data = (void *)&limits_30w,
>>>>> +     },
>>>>>         { }
>>>>>     };
>>>>>     MODULE_DEVICE_TABLE(dmi, dptc_dmi_table);
>>>>
>>>>
>>>
>>
>>
> 

