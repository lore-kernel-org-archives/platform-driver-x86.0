Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011030.outbound.protection.outlook.com [52.101.62.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAFC3DC4D7;
	Thu, 15 Oct 2026 15:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792076667; cv=fail; b=B/8Z5MICiR6ycIb4zBFId4HDrMYk3du417I6TNawkM4nz/41CwXCsvJhdry6FNG1H8v0C2LWn0RYmTarqnSfPHk4UBozTZZRVHa+p3xGuzMQQP7eqdNz40jw9I+o8ZVgUk1/AeQZzP8M9dF/mvDwjhPyWA2YfcVJ/73vC5x6w5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792076667; c=relaxed/simple;
	bh=heFf8hIZeFUtJHRzUda0WtAm5mRo4Rw1nl/iCW4C7Lo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=i9S1ELVG2BDGVc6yBLE8ab+wenIqi5s/MnaqB0Ts8GrORMVqF0JO2uJVPwLxNsvlNMQLuKgatyppgkpMhS7DTm2WV5sXBzqn6sDQ2hHi9/cKhEYEU9D6Oz4D7sEcGsfzgqnNHKNkS6I3wjzTwlQqmrZt4T91T7Rj8hPzJuk0lXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Tck7ILSW; arc=fail smtp.client-ip=52.101.62.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Tck7ILSW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQ0R1ezt3Mihj5hFsUomkrvlMl5IZCYjhx+M3bHRBSaVdH39X4PBlg80R1KZ4J5ZczPUVDOJ8YzG+9gl8hAUXM0JE5cfdBeBbVr6aOnqs29p0yJI41YU3aICEjx/OWK0U4iddL68LA+xFb/Mqn5F2SP+FOx0dIcfl8HS4QxWJ5wmon9r9QAMlY47DArobLgyfTmI/hReouftV0El77yBBsQ3zSzlapF4cI7pxskSfFxa1W7TPFGT0V6w7CU9F1uZyv57Pc07+nCpLzm9DffjJfckGBqFkY2M3L8/OjuEsXvurEsoVS6JQHsiv97Aut3xU97xmu7nhj4q9KaxYtMV+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BGNwPKPM6GqJi1rz6QH96frA+h9k2hiY1YOaROAOrTA=;
 b=wI7U4KHXWpslijWOFEVS12NmxoBeWk2YPO9uipL3af7eWkh4QLFDivlxoaq0HMKZ7ipvtiPXHrxt/QiDEhmEPk/4p8VeExLbEgQZFUaK+ybdOp3Ad26b12+acgiYUrxuchyW1PKcyA/KAW0/hiU2FIqQWhL+wgmXQ/ZyBJAozWgkIwaL6v8Ks+C/FuF0hGRzGsguc84SKWGNR7pjLlA0mHZQSZnHYVa6e6BNV/spJr6/f81Lamma9XGgITM+r6H76c8svwukwWgnz/ArBXrk6FrWsbdhvpjthqVD7aVq4pjUjRnqEy2OK8gkDEMhn0Sr9gRxuaF6S/iVE0sKF8nnDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGNwPKPM6GqJi1rz6QH96frA+h9k2hiY1YOaROAOrTA=;
 b=Tck7ILSWeFf638GlUtyn8TKP7qNAFVUz3IqXdso+rOYaRBe0xrrpRhO3DxIRucFx3/rD/M1KSdip2CPeNWEi1MFHHiGHTOaQLvbCRAMOHdALOQ6Uyv+wSWDZIqibMjOp9kaWP4PWgjkRDHB2KGfsCso7/AE73296TITgZGx6eDs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by SJ2PR12MB8182.namprd12.prod.outlook.com (2603:10b6:a03:4fd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 15:03:38 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 15:03:38 +0000
Message-ID: <f95dec8e-3735-49d9-b6d0-4c1b88f3a318@amd.com>
Date: Thu, 15 Oct 2026 10:03:35 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 0/4] platform/x86/amd: Add AMD DPTCi driver for TDP
 control in devices without vendor-specific controls
Content-Language: en-US
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: W_Armin@gmx.de, sashal@kernel.org, Shyam-Sundar.S-k@amd.com,
 derekjohn.clark@gmail.com, denis.benato@linux.dev, i@rong.moe,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260309205125.293148-1-lkml@antheas.dev>
 <42275140-ecef-4878-b256-1061060d4958@amd.com>
 <CAGwozwEmENx98qB51D89h59rb2qw66f_TJENd+W41onb5GYhfw@mail.gmail.com>
 <CAGwozwGD7JNuWz2D0AetacX=H95sB=mz0nnssQHs=pvmsEiKaA@mail.gmail.com>
 <f47b3c8e-74ce-4aa5-8a64-a4c9ef12a4a5@amd.com>
 <CAGwozwGi_hTxRYUEfMGyT0OQtLTD1Dogp_NXXfBzRpT_hV3qFQ@mail.gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAGwozwGi_hTxRYUEfMGyT0OQtLTD1Dogp_NXXfBzRpT_hV3qFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS1PR02CA0017.namprd02.prod.outlook.com
 (2603:10b6:8:44a::12) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|SJ2PR12MB8182:EE_
X-MS-Office365-Filtering-Correlation-Id: f4118f03-4c51-44bf-e5b5-08df2acd7dd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|11063799006|5023799004|4143699003|261009223027099003|10067099003|18002099003|22082099003|6133799003|8126099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	lK0hpYnRSQrIJSmNXWgGoMyUv7TIxh2n9RwEGwmf3HAMDOyKgj6T+NEmMdq6NpNuu3Z/AFT9qBnwPAunf1mZPBECkwOjPlK/Nb+LHfSYn2ZY2hpghfIDxDqnSS1aXiIAfvODfBWlpZ68vWQO5oa6J9pWRhliRJnBQCczE8Hr2eolBBOWC3O2IUkNhTLi1Xa+7yWWYxbn8bw+CbZ5ksaUX2RCQFUy9KXNS6k4rtZqTim4FQlcls21CWedmG4bIfR7NQyP1qAAriLHgJPrwJgnQrNr9STZLHwqOULV01hAewa1b1MjDKXR8fYo6WiHFS1fs4+wCuM1rxP1QzsGqCyJEF3waLhL9TzIQIDCQJtC1vPyDcO5AKfYusrAe4kg6bvbVdt8jRixO0rQWxVjqkmlUCNMrNKxG/vrLNYN+iwPf7nj5r9+1Gg/+wq9mLCBLVmNlvq3bL6ommNO9b3kuZfZ7U6yvkZaXaGh81yrQ7EF/OlD9dJ6vWydQhOFdS7A3ldhF0PZvvFfgMkaOW5enyfit+X5hFsGapiTqnJwQ0CmPYq7RFvY550+/P7ds2fF/Mb4SIyJwOqnkOHg//OoVMS7HQ9uG4Czd1InIyjAsUI9WI9ICm5w7mUBqeJjDW1e3Vz7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(11063799006)(5023799004)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(8126099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0xnTDZSQ0ZqRmhDZmxhc0hROHExeStQdGhia21HQzZCOHVhQXJ1VVlpQTJM?=
 =?utf-8?B?ZVQwZzAra1BFNEJpbmh1clc1NEJ0RXJBTWhNQUcrREZGMEh3cUtaeWowMWoz?=
 =?utf-8?B?MDB3cTVDemJkSHhsai80Wk14dVZnSURhTEUyVkdqS1ZNSVBEU2FmV3h3ZWxr?=
 =?utf-8?B?TWtTSXMyL3lTc1NWUC9SellrWmh3Q3FpbVhhS3ZObEJWbGlrMGI2OE5udjFz?=
 =?utf-8?B?RTNBSE9MMU5FenhqaFZrZTZ6U1hJeU4yS0FYakJ3L2gxNzlzOEJxV09qZlZY?=
 =?utf-8?B?bEhoRm5WSXBoajhMYkRjYzBiZlRVNGlLaHdleU0xZ01DaldWUVRRZEkwdWc0?=
 =?utf-8?B?d1p2alBLWFlPS00zZXdnUHh2NExrbEt3a3NNVUd0Q1FteEJRa2ZEWGpvMUhk?=
 =?utf-8?B?dFpUc3QxUUVuQzFxS3VFaFQxZnphSElPZjdaaVVJVi9CY2V5TVVDUlZROWIv?=
 =?utf-8?B?eGM4M0pUR0oyQU1SaTdQZnVxWDVCQ2lEdVMrdVRya04zTXExMWUxQzlHRElE?=
 =?utf-8?B?d1dEV0cyTFJJTTJJNUJRcHNOSi9keEdlSmFoSVBDcXVHc2lxRU01Tm8xakda?=
 =?utf-8?B?OUovTXBrc0dpMnpzRDdDSEdXcTkyYkZ1S2pzdnltNFd5cDJNY1NXdUpWZ2FB?=
 =?utf-8?B?dHlKVkdhWmpsMDhjQkxMOTZra1hyclR1dE9TVjRQMmxMUzRIZk9WNFgydTdR?=
 =?utf-8?B?Y2t5Y1FOcDdBQytJNStJNHI4cnltc1hqVHhJS0Zlc0M3UGRYcnFXNzY2NElP?=
 =?utf-8?B?M2dOTVVMaXJ1TjNxUzYxUXZJcnFkL0lBM0VyZzlQdnFqYVlJYjNMS0RjT0t5?=
 =?utf-8?B?NHQ1d2ovUFZRMC9vK0RUbUJwNmJkUXFtTjM0aFJzVGg5Qlk5aFhSdnAzZEh6?=
 =?utf-8?B?QXhVY3ZodXJJeHVCM0VJLzhYY2dtNmtiODcxa2REbnpBLzFGcWFkZzlpczNJ?=
 =?utf-8?B?akFLRms1OElEclp2TDY1elBhUGVBb2V0d2xkV3RhaGRaQzNNTUZUUE84TGZU?=
 =?utf-8?B?TDBrTk8vdG4vK1JsUkl3MWlrNEczRXdXSk9XS2VYUy80Z01YQTNDMTlMdVEz?=
 =?utf-8?B?YnN0ODYycGNjSFA3emNkT0RLVUNwVWVFN2xyZ3BMVk4zN2ZjOFZIczIxekdi?=
 =?utf-8?B?RFJ6QVJVWVYwbnExUEJmYzZNaDkxNmVJOHRSdCtFLzREQlZ1cHcwNEthQUJZ?=
 =?utf-8?B?MjRhS1BYaHJCVGlWbEdBRWRSSEg0L0szZVVIRW00K2gwbjJ4MjVjV3l3RVdF?=
 =?utf-8?B?OWR6SFhrY2Iwb09vZWNzbXNmSlgyT3oxOXRSMGJrdHNuS1RtYkFMYTg0ZmVB?=
 =?utf-8?B?bGZIUjcrYVMzRlFzbHRrT2xRbzBxSlBiOHkzL3I0Rk5Kc3NKb1JDRDhjOXlO?=
 =?utf-8?B?V2dNcnpDaHIwelRLYWt4SFlRd0I5ZVoyWGxkWjR0dWlHdUk1ZUorSjlCMVp2?=
 =?utf-8?B?ditEcFBEc1NpcDRRcEE4WTEzWlhROXhZUEpqSTR0ZDkyNWRXcVowWEM0YVNm?=
 =?utf-8?B?aS9IaWtPM3RqTUpBT0JJK0ZhSG5rTnBTc3A5R1JVQ3A0dXl3emFsVWY1TUtr?=
 =?utf-8?B?U1pLOHc5NUlHNXM1OFVLTDdVWFlDblAzQkhFSFc1ZzRlNE9IVkwxcUh1eTJv?=
 =?utf-8?B?UnBlMXU1Tmc5SnBYajhhRDRmb3BDdFBneEpOcDJEUUkwdmhvck9zV2JIUnBh?=
 =?utf-8?B?eWJOT0VMZGJ1dHBPc3g3azNHMVdQK1E2WUlaU2pqUWJoaHQ0eDJPK2dtdzJh?=
 =?utf-8?B?OWU4QVpBeWU5b0JESmhrSnRqZUlzNHFIaC9IbXd0V3hGTWVDYWJhVUFZQUR5?=
 =?utf-8?B?aUQ3MktrRkI0ODJQeFZmMVZRRUU1NDRUaG1RKzFlOHZiSDFGMmxqMk1SVnVq?=
 =?utf-8?B?TEd3ZWgzMFlvNktTazJkWHg4dUdXYmJrOWtac1FKc1F0dTlTYTBjUlRKQWMw?=
 =?utf-8?B?TXBhYjRHb1dlUGFXUXJLMHFZK1ZtUGxKbVVDb1lWQVhEL2JRQXVMeTUwb1h2?=
 =?utf-8?B?WDBzYkVFdlNlZ0RQM3BBY2VReWFTMnRGMktaVXlVWHE1OTk0YWpiU01aTU42?=
 =?utf-8?B?d1hXa0wvUm1GNnZ6elU1RlNyL3JsYUEvaFNuQlZMQUU1ajRmUmdIRmdxVjlR?=
 =?utf-8?B?dWdiRm1lamZOVHorZUZ4Sjg4RzNqSUVIK2JPNnpFZEJ5eWd5UnlNUExUeGNY?=
 =?utf-8?B?ZGlxZWUwNjdpenBwNCtkQTZUVmJMbzZwMmV5SFJWSndlVWhqQUhMVkhUTzNG?=
 =?utf-8?B?SGl4M2w3NVJpOHU3SEtNRWF6NktkSWhRZVd2cldXdGRjbUZnMU5vdzVoL1Vv?=
 =?utf-8?B?aHdEV3MxZmQ0TmE3MlIrb1hXbnR5TzYwR2FRM09sTGhhdFpTQVZsdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4118f03-4c51-44bf-e5b5-08df2acd7dd5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 15:03:37.9438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6yWG6blwPO/Rgb/J3D7AXL/4dcLjmA3f+MWpRcJZuGn9dLKZfMLIEBh6puMFUwsvsif05wU9IvYGWCtVRZl+8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8182



On 10/15/26 09:55, Antheas Kapenekakis wrote:
> On Thu, 15 Oct 2026 at 16:37, Mario Limonciello
> <mario.limonciello@amd.com> wrote:
>>
>>
>>
>> On 10/15/26 04:35, Antheas Kapenekakis wrote:
>>> On Tue, 10 Mar 2026 at 08:59, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>>>>
>>>> On Tue, 10 Mar 2026 at 03:43, Mario Limonciello
>>>> <mario.limonciello@amd.com> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 3/9/2026 3:51 PM, Antheas Kapenekakis wrote:
>>>>>> Many AMD-based handheld PCs (GPD, AYANEO, OneXPlayer, AOKZOE, OrangePi)
>>>>>> ship with the AGESA ALIB method at \_SB.ALIB, which accepts Function 0x0C
>>>>>> (the Dynamic Power and Thermal Configuration Interface, DPTCi). This
>>>>>> allows software to adjust APU power and thermal parameters at runtime:
>>>>>> sustained power limit (SPL/STAPM + skin), slow PPT, fast PPT, and the
>>>>>> thermal control target.
>>>>>>
>>>>>> Unlike mainstream AMD laptops, these devices do not implement vendor-
>>>>>> specific WMI or EC hooks for TDP control. The ones that do, use DPTCi
>>>>>> under the hood. For these devices, ALIB is the only viable mechanism for
>>>>>> the OS to adjust power limits, making a dedicated kernel driver the
>>>>>> correct approach rather than relying on the out-of-tree acpi_call module
>>>>>> or ryzenadj.
>>>>>>
>>>>>> The driver provides two layers of control:
>>>>>>
>>>>>>      * Platform profile integration (low-power / balanced / performance /
>>>>>>        custom), with per-device preset tunings derived from thermal envelope
>>>>>>        data. Selecting a non-custom profile applies values immediately and
>>>>>>        locks the individual tunables to read-only. The default profile is
>>>>>>        "custom", leaving the device at firmware defaults until userspace
>>>>>>        explicitly selects a profile.
>>>>>>
>>>>>>      * Four firmware-attributes tunables (ppt_pl1_spl, ppt_pl2_sppt,
>>>>>>        ppt_pl3_fppt, cpu_temp) that become writable in "custom" mode.
>>>>>>        Values are enforced against per-device limits (smin..smax), with an
>>>>>>        "expanded_limits" toggle that widens the range to the full hardware-
>>>>>>        validated envelope (min..max). A save_settings attribute controls
>>>>>>        whether writes commit immediately ("single") or are staged for an
>>>>>>        explicit bulk "save".
>>>>>>
>>>>>> On resume, the active profile or staged values are re-applied so that
>>>>>> suspend/resume cycles do not silently revert to firmware defaults unless
>>>>>> in custom and in bulk mode. In that case, defer to userspace.
>>>>>>
>>>>>> Device limits are supplied for GPD Win Mini / Win 4 / Win 5 / Win Max 2 /
>>>>>> Duo / Pocket 4, OrangePi NEO-01, AOKZOE A1/A2, OneXPlayer F1/2/X1/G1,
>>>>>> and numerous AYANEO models. The SoC table covers Ryzen 5000, 6000, 7040,
>>>>>> 8000, AI 9 HX 370, and the Ryzen AI MAX series.
>>>>>>
>>>>>> Tested on a GPD Win 5 (Ryzen AI MAX+ 395). Confirmed with ryzenadj -i
>>>>>> that committed values are applied to hardware, and that fast/slow PPT
>>>>>> limits are honoured under a full-CPU stress load.
>>>>>>
>>>>>> Responsible disclosure: The development of this driver is AI assisted.
>>>>>> This includes its writing, testing, reviewing, and readmes. The driver was
>>>>>> manually reviewed line by line, but there may still be small leftover
>>>>>> quirks. This is an RFC, not a final version. Let's push these tools to
>>>>>> their limits and see where it takes us.
>>>>>>
>>>>>
>>>>> I'll tell you where the most immediate limit is.  Humans can't review
>>>>> RFC changes that go in daily.
>>>>>
>>>>> Over my weekend I see multiple copies of the series in my inbox.  To me
>>>>> they must have obviously been garbage because you sent them so quickly
>>>>> instead of waiting for feedback.  So I'll delete those from my inbox and
>>>>> review the most recent one.
>>>>>
>>>>> That's somewhat tongue in cheek.  I know you're excited for this series,
>>>>> but please make sure you take time to gather and take feedback into
>>>>> account before posting another series.
>>>>
>>>> It's true, I've been having a bit of fun. But the series is stabilized
>>>> now, I don't plan to send another version soon unless I messed up
>>>> something.
>>>>
>>>> V3 incorporated your feedback/derek's and V4 incorporated rong's
>>>> feedback. V4 is minor, it is just nits.
>>>>
>>>>> Maybe you can pass this to a robot and it
>>>>> can give you actionable feedback, but a human sitting down and reviewing
>>>>> a patch series in a serious way takes time.
>>>>
>>>> I'm using this series as a testbed to make some tooling for this,
>>>> maybe I will post it soon.
>>>
>>> Opus 4.6 was something. Anyway. @Mario v4 of this driver as it stands
>>> is pretty good for prod. Since then, I kept adding devices and
>>> adjusting devices based on user feedback but I did not have to touch
>>> the driver otherwise. It has been tested on most APUs and around 30
>>> device models now.
>>>
>>> One thing this driver does not do is AC/DC limits and it would be good
>>> if it did. That way presets could be pushed higher for AC but that is
>>> only mildly necessary for AI Max platforms. 45W is more than enough
>>> for all of them anyway, but we could go to 55W e.g. (after that they
>>> saturate so it is unnecessary strain). But the updated limits I have
>>> are conservative enough where it is not an issue. I also found myself
>>> not using the commit option, so I think it can be removed.
>>>
>>> The only issue with this driver is that steam maxes out TDP when you
>>> disable the TDP slider and as the custom limit is generic for both
>>> AC/DC it can strain the battery. This is an architectural issue with
>>> steamos manager as before steam used the _default tdp value in AMD
>>> sysfs but dropped the notion of default when transitioning to steamos
>>> manager. But this is a downstream problem unrelated to the driver
>>> where special DC limits could help a bit.
>>>
>>> This is because I heard you might be working on something similar. So
>>> let's prevent some duplicative work. Should I repost a cleaned up V5?
>>>
>>> Best,
>>> Antheas
>> By "something similar" do you mean the AMD overclocking driver posted
>> recently [1]?
>>
>> Does that happen to work on any of this hardware?
> 
> 95F20B61-3D44-41F8-87E1-03CBF94C4E8F returns nothing on my ACPI dumps.
> There are functions which contain the e.g., 0x00020026 on a lot of
> ssdts but no WMI with the GUID that series provides.
> 
> The WMI GUID of those functions is
> ABBC0F6A-8EA1-11D1-00A0-C90629100000. If the interface is the same,
> consider adding it to that driver.

OK - It shouldn't be the same.

> 
> You may reference to check yourself [2]
> 
> Here is what my LLM told me about that GUID:
> 
> | Dump | GUID present |
> |---|---|
> | Legion Go `N3CN26WW` | No |
> | Legion Go `N3CN28WW` / `28WW-beta` | No |
> | Legion Go `N3CN29WW` and later versions here | Yes |
> | ROG Ally | No |
> | Ally X | Yes |
> | GPD Win 4 / Win Mini | No |
> | One Xplayer / F1 Pro | Yes |
> 
> So very mixed, and perhaps not an alternative to what this series
> provides to these devices. Fine by me to go through
> 
>> If it doesn't; sure please post your v5 that has incorporated feedback
>> from this thread after the merge window at the start of the next kernel
>> cycle and we can review it again.
> 
> I was specifically asking about this interface. Not in a rush, just
> bumping this a bit so it does not end up getting re-implemented. I
> might not be able to fix all of the issues but I will try the best I
> can.
> 
> It seems this interface is so universal the CPU check might be bogus,
> but I managed to collect 99% of the CPUs, I only get a straggler
> reported every month or so. So it should be ok to stay.

I'll admit this series hasn't been top of mind for me in a while.  (So I 
might have some page faults while trying to remember things about it).

Earlier in the discussion for this series that as long as this is tied 
to SMBIOS strings to *only* load on intended hardware that should be 
sufficient.  If two systems use the same SMBIOS strings between 
generations then you'll have to add CPU disambiguation.

> 
>> BTW I think this version was last posted before Sashiko started
>> reviewing patches too.  If you can; please run a local Sashiko review
>> cycle on it before posting your v5.
> 
> Sigh, if I figure out I will

No worries if you can't.  I was just looking for an opportunity for less 
back and forth in case it flags something.
> 
> [2] https://github.com/hhd-dev/hwinfo
> 
>> https://lore.kernel.org/all/20261010190543.563161-1-Shyam-sundar.S-k@amd.com/
>> [1]
>>
>>
> 

