Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011051.outbound.protection.outlook.com [52.101.57.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191C03BBFAC;
	Thu, 15 Oct 2026 14:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075069; cv=fail; b=R1hnjGXC1OEVamfUPqruUVBM69p6bwVoXvmtgnb0O19X1PQt3ovaMpSloLOMOp8uaVDNrhYAtYAQxzTBLth2tcvaF9QtrndAge5Ev29xrQHwK0bIU2B5jVhYYd8IEFSC7x5OnAjxU2wUlcyqLpwI+MzGSlGovlU6m4K8KvvHqSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075069; c=relaxed/simple;
	bh=CChz0+LnTbHTnEHpLc2YAtSPEdr0dMbGrFMzV+wUD18=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tCX+LiqXQAY7cvpUjpGiC773PxK79V4oowp9CfahJDUF0tHRU3cyLKXIrAv2ZQpfsGprgBMSWn6vNMxeuuCNb5bZjCYwsmiulnmnkxyhc9NP0j1bqxTSZcSmBwMIgSlMvuaQE4JJFknGXORNgt63yfUExtvGpsAUvpaNO2Ijydw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HCr9FDl9; arc=fail smtp.client-ip=52.101.57.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HCr9FDl9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gyS4DqjOIn/tefA90xVewdqpOuIk2NKNcSp3DzSyvLHG2MmEr2WzWZ3sq6OA7uf8aRvYU9s27CNFG9sV35d9Q+Bw8dFt2Kn8XmxFpX5BQLZfS8E8yjGYy0sSzCyUs3j1cmAa/1tSUWf0SDAiE/Fd0adyT1QfMxM/30xM1ZTeMOepGr3QEAABSmjFln9pUlubctx6H5JW6PsvAVE6m1miIX09oBWkIIKU//BlLxrTt3zl0SNlVHDiS8tR/mEGgiAs0qp58lLLrN99qeyYfrs1LhpkrRqGZny5mswyrhRke0sHQCMwff6e1Vx+Vd7TCTVgMz++D/cVZMiPonc9NlWYUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/F5woJq3XGIRQSJiqQTdmB/rgeOYpI12yo7kGOE4wQ=;
 b=pXeFQ1ZgEOAfo7CisNhLkRr8uvztwSOAlZoja9u7pqPgjom6ASE+oGBz4dC0qzSRna8wVrn9z0BWhnUMj+5GDNu1CzUSJJbTQXP8rkCPk444oz46Cxw02pcVju+0hvihOdKDuVpmZ5BS6dfdfd+aR8CKYr2P8ohvDEtvCgEXpA27K/JnbG2hgUcGrxgSiMgg8/v2JbJefCT68Eyijnrk9QFtjtuNcyK3CZJ9Hl6bVATkZ0YLB1YTE5Kp/b7lhSN2yqp4Y3fbz4FLj78HmK8EYkzWrmuBAC2XweparAR4ubUcAwCZc0TSLGYS9h6ekHa/AKZhTyU0zLJuvRQcUz68Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/F5woJq3XGIRQSJiqQTdmB/rgeOYpI12yo7kGOE4wQ=;
 b=HCr9FDl9BIuQAlQscodFTtUpva7TxBec3xThjCiFiA1Jyti8sQBEWU74E+L7qzkRXH3fcTxCWHscrz1Wekn3Lz22Umi+MGUv0gcmf7aSqy2DFz8c8ABXDpR03JPZVcqKMe9hWupwsosbX+CM/inbLrZvhyb2ZO7WDv4U0PC+7cc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by CH4PR12MB489481.namprd12.prod.outlook.com (2603:10b6:610:509::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 14:37:44 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 14:37:44 +0000
Message-ID: <f47b3c8e-74ce-4aa5-8a64-a4c9ef12a4a5@amd.com>
Date: Thu, 15 Oct 2026 09:37:40 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 0/4] platform/x86/amd: Add AMD DPTCi driver for TDP
 control in devices without vendor-specific controls
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: W_Armin@gmx.de, sashal@kernel.org, Shyam-Sundar.S-k@amd.com,
 derekjohn.clark@gmail.com, denis.benato@linux.dev, i@rong.moe,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260309205125.293148-1-lkml@antheas.dev>
 <42275140-ecef-4878-b256-1061060d4958@amd.com>
 <CAGwozwEmENx98qB51D89h59rb2qw66f_TJENd+W41onb5GYhfw@mail.gmail.com>
 <CAGwozwGD7JNuWz2D0AetacX=H95sB=mz0nnssQHs=pvmsEiKaA@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAGwozwGD7JNuWz2D0AetacX=H95sB=mz0nnssQHs=pvmsEiKaA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR18CA0013.namprd18.prod.outlook.com
 (2603:10b6:610:4f::23) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|CH4PR12MB489481:EE_
X-MS-Office365-Filtering-Correlation-Id: f4905c5c-f73d-4be6-fae8-08df2ac9df26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003|6133799003|8126099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	EFqpLrQ2RqSi3oQX4USOe3w05laB/DtPCtBZxxge4xM2qeI68Mn0dpGT94V4k4VgVVhiNaDAe6w+UMtWmvSj4FHe7jM61s0RBUZLiEtcm8lzB0srBMLtoRqFxZ2fEXJXpEmR8AZNMh8WpAb6ERi1Ck4r0U5p5NR/fy8yMzSzDRy8GUJY541XWQL+Oxp1YPvabD3lKH9ernCiFOvHDRTrJr5MMzLgpefWZ7AeQagS5rMspW8JiXZeMhp/xbR5vf4ccZ/9ZAL18ILIbxCEwu4t9+qM0FscKvz/zgL5O4gtWfz0pJvfKGVLLONJvAQWyU0QFPokY4Y7CBBVeQaC/Z8Od62KheYtP4eDmvNI8xlUSLhg6BxzWzmb66ImKxeY3z4krOeWLfi1FES3IEfT47CcqcqTDJ6bLjX/81iIVuLK9n3oYJXhHoaZtK8Fzz/VyJ6gyOpAL3rquiCGzO8ciSk4NPx7k4j8nlyIGq8V7wJeQvc000h0lSjIsfVo5G24U4kvD4Ahd5HjeTrUDb0KW4gT4rl9ts0263i/DNwIVnIoZ2G8g1fNLNAAnOVXkQ/AR7ueJ6M1F2R3LM7HJy0kQyiH9NpDOBa8zW3Ks4oQhBUOc0TEbAMIzmQAwpm46tcYy/ON
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003)(6133799003)(8126099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UitJNmc0Q21JZ2g2NnRibHE4WVJmRFNwdUpZQ2owTS93Qk9Uc240M2VyN1VT?=
 =?utf-8?B?OTl0VHFzWFd3VDZqTm5tREhEbHNROTNkZURQVDRRUVM3NmtjUjU4SG5zZGFy?=
 =?utf-8?B?bUhxS2h1RnpRMElqbGp1dnBtZ0wzZFBpRStrOVY2eWVjR0pKeWpRd3gwNFFz?=
 =?utf-8?B?amlIQUozOC9TbWorczJxQTlvUWZZdXZRWjV5ZWhFRXoyN285cnBmTDNYZnNC?=
 =?utf-8?B?RFIwSEhxTFRTMGR6bTN4V0RBQWkvR01LMmdGbVlhNkR1NUFDcEpXM0F3M2ZX?=
 =?utf-8?B?QmZrdVJ2eWNJZ2Y1ZjV5MVhtQXovYjJGU1ZNTkFwWXJXUHFVWnRueCtYbzVK?=
 =?utf-8?B?ZkdodUkrL0Y2dkY3UC9RZncyVDFyZlI3Zzd1L3E5RitpQXpxY3RBVnBac3c5?=
 =?utf-8?B?Vjk4MWJjWUs5MXRrRmhncCtCOHlJdVZSNHIvbEY2blVJRW1LdTB5ZE8rNSt2?=
 =?utf-8?B?czNUNnlBUW40S0V6cC9vb29ZWTZuNmM2VWZvMm5vbmo2NW5pWlRjNlRFWjMy?=
 =?utf-8?B?RkNBZklBYTRrdE5IekU3bE9nemkzSy92NklZSEJ1SlUzSHdObGowOUhVSDhT?=
 =?utf-8?B?Uk4wZG9xcnoxblRCcGJWVmFBekR2SXBpT1BheXRlUlJJZVZlR1llWkhGN04x?=
 =?utf-8?B?NjF6b2dJcGRobkFqUmN0bXg4d1dzbGRxVGZ3bW0zeVM2ZmhHbDRNTmtldnBT?=
 =?utf-8?B?SERmMFphaVIyTUtCQ2VwYzAwekZHMVBkQWYzamI1SVpEMEYwZ2NLc3RPb2M5?=
 =?utf-8?B?dFgvWS9HV0pZNk9YeHBDQmZHSGNRZjZ0T05sMzNqbHdJeTk5amt6K2ZWaUg0?=
 =?utf-8?B?b3BoR3g5S3ErRjVVS3RGR3dTTmRXZ2M3Zk5aVnFYR0NoU2g3WjBVaWcvZ21R?=
 =?utf-8?B?bVZQK3oxa1B3YjhIdW02ZE41dlN4VjdQNU9SbktVeXpzeVNGUjQ4L212Qzht?=
 =?utf-8?B?enJ6amJDK2xUSDN6aUlITklkTEtGd2txejFUSGdZNE5WYkpDRFJnNWNZNGlG?=
 =?utf-8?B?THRlOFdqd0ZFdEpDb1VYOG9iM3J1cGFNVkRpMzYxZ2I2bGxBRmx6RFVqYm5U?=
 =?utf-8?B?VktOMFUxeHpsQTJ4OFpHallrTVhMVzE2cjA0N24zRFhORGIxUDdQUU5TMnJO?=
 =?utf-8?B?ZjJVcStrQis3NWJJU1FIOGpxbG5xUG1VNkhpN1hnWEFVWFV0QnYrQ1BNc3gy?=
 =?utf-8?B?cFFYc25ZQkNYdDI3N00wYnVmMEw1UkRKVUsrYlhQdTJsbjlKY3VrWlVXWGtZ?=
 =?utf-8?B?WlFPWHBrM1VTZk1XT29hQXJieXhxbVRoZnhmVlpwMXRadzhFaUZDc3oxQjdl?=
 =?utf-8?B?NGsxYXdRWHNwQkkyU2lGQlcvN3ZSQjB3ZzhlWWJGTXU4NTNmSXBNWjhwM0x6?=
 =?utf-8?B?Q3pJTWErR09JTmpqaWhkQ0FqM0Y5WDR5QzI0Qzk2Q2NZQllwRzZLUmozOXJO?=
 =?utf-8?B?TGY2eDdEVXRxMnNMZWJOMHVXUTFIWGlndURpTHVWVzJ6cU9FZnc1SDUyUUFy?=
 =?utf-8?B?ZkFQVlRmZmNub3VMYlQvcFYvbTJCczEvWUtxMlYzQ0NPU2pnSjFlZVhtaEZI?=
 =?utf-8?B?M0UwZXBlZElKNHloUXRydnhkbVNTTG5EY1ZObmNPVC9Fdk0zNzlGRHUxQXRm?=
 =?utf-8?B?ay9KOXRSZDJzL2lPWjhPQVcyK1JEYWJMcWhTTFUvRVlvbXdGVEJnYjhVZHh5?=
 =?utf-8?B?NitlczIwenF1OGV2aUtFeXJQeTFMUDFqMDZvbTFtRFZEa1hCSTU4bHZzZ0ZI?=
 =?utf-8?B?ci9waGhwLzJ6N053VEpPSnZIZVpXUHJ2UW02bmRDU05hK1VlSmtZSW90aE1H?=
 =?utf-8?B?dXlMR0ZjMjB1SllKQlBCUUdKNEZ1aCt1VmR6U2N1RFRRcGcydVBRblhZdFhu?=
 =?utf-8?B?dVFJbUZwamxlMm5MZVY3b2lSRWFtZzcvOEpCdTlqc3dkNHpLY0ZzNDR4bDhl?=
 =?utf-8?B?djVsTFhrUDFDam11d1ExYWFlNjJLYTZRTW1yOHM1dUN3aDV6THNlTWFQZUxB?=
 =?utf-8?B?K3E3L080YldrVyt6OEJxdE4yQ2FPd1F2eEN0c3YyV3NWU3B3RXpKYjY2TEQ5?=
 =?utf-8?B?OVRBcUJaRG4ybFEzSXFwRnBsYk5PMWRBbE1VbnZPZXdvSkdOQ2lRR1FQNEVa?=
 =?utf-8?B?N3k0OFNYb2NWM3V0L2kvT04rQzJib3lUZkhkSk5hbktUYjhMQ0k3amNjdXV4?=
 =?utf-8?B?QkN1T2FxVG9ON3NjTkY4YTFueVMrcm5qSjZSNkNpY1R0VlM4anFLeGphVGFw?=
 =?utf-8?B?WU9TQk9Hem5KdzFNYjVZbDZWbTBxakZwN3A4eVF5S1Q0SHExNm5KTjRlZmZv?=
 =?utf-8?Q?QqwgOL3vkqxZEa2HiL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4905c5c-f73d-4be6-fae8-08df2ac9df26
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 14:37:43.2258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ZZEFCTUL3jmRwjg0/xYKWlwKNy4v8g1/j3rz22ob3+IEuKr9prKxuct/LED79Co2VtU3RrcnW6G1VkUoHk76g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR12MB489481



On 10/15/26 04:35, Antheas Kapenekakis wrote:
> On Tue, 10 Mar 2026 at 08:59, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>>
>> On Tue, 10 Mar 2026 at 03:43, Mario Limonciello
>> <mario.limonciello@amd.com> wrote:
>>>
>>>
>>>
>>> On 3/9/2026 3:51 PM, Antheas Kapenekakis wrote:
>>>> Many AMD-based handheld PCs (GPD, AYANEO, OneXPlayer, AOKZOE, OrangePi)
>>>> ship with the AGESA ALIB method at \_SB.ALIB, which accepts Function 0x0C
>>>> (the Dynamic Power and Thermal Configuration Interface, DPTCi). This
>>>> allows software to adjust APU power and thermal parameters at runtime:
>>>> sustained power limit (SPL/STAPM + skin), slow PPT, fast PPT, and the
>>>> thermal control target.
>>>>
>>>> Unlike mainstream AMD laptops, these devices do not implement vendor-
>>>> specific WMI or EC hooks for TDP control. The ones that do, use DPTCi
>>>> under the hood. For these devices, ALIB is the only viable mechanism for
>>>> the OS to adjust power limits, making a dedicated kernel driver the
>>>> correct approach rather than relying on the out-of-tree acpi_call module
>>>> or ryzenadj.
>>>>
>>>> The driver provides two layers of control:
>>>>
>>>>     * Platform profile integration (low-power / balanced / performance /
>>>>       custom), with per-device preset tunings derived from thermal envelope
>>>>       data. Selecting a non-custom profile applies values immediately and
>>>>       locks the individual tunables to read-only. The default profile is
>>>>       "custom", leaving the device at firmware defaults until userspace
>>>>       explicitly selects a profile.
>>>>
>>>>     * Four firmware-attributes tunables (ppt_pl1_spl, ppt_pl2_sppt,
>>>>       ppt_pl3_fppt, cpu_temp) that become writable in "custom" mode.
>>>>       Values are enforced against per-device limits (smin..smax), with an
>>>>       "expanded_limits" toggle that widens the range to the full hardware-
>>>>       validated envelope (min..max). A save_settings attribute controls
>>>>       whether writes commit immediately ("single") or are staged for an
>>>>       explicit bulk "save".
>>>>
>>>> On resume, the active profile or staged values are re-applied so that
>>>> suspend/resume cycles do not silently revert to firmware defaults unless
>>>> in custom and in bulk mode. In that case, defer to userspace.
>>>>
>>>> Device limits are supplied for GPD Win Mini / Win 4 / Win 5 / Win Max 2 /
>>>> Duo / Pocket 4, OrangePi NEO-01, AOKZOE A1/A2, OneXPlayer F1/2/X1/G1,
>>>> and numerous AYANEO models. The SoC table covers Ryzen 5000, 6000, 7040,
>>>> 8000, AI 9 HX 370, and the Ryzen AI MAX series.
>>>>
>>>> Tested on a GPD Win 5 (Ryzen AI MAX+ 395). Confirmed with ryzenadj -i
>>>> that committed values are applied to hardware, and that fast/slow PPT
>>>> limits are honoured under a full-CPU stress load.
>>>>
>>>> Responsible disclosure: The development of this driver is AI assisted.
>>>> This includes its writing, testing, reviewing, and readmes. The driver was
>>>> manually reviewed line by line, but there may still be small leftover
>>>> quirks. This is an RFC, not a final version. Let's push these tools to
>>>> their limits and see where it takes us.
>>>>
>>>
>>> I'll tell you where the most immediate limit is.  Humans can't review
>>> RFC changes that go in daily.
>>>
>>> Over my weekend I see multiple copies of the series in my inbox.  To me
>>> they must have obviously been garbage because you sent them so quickly
>>> instead of waiting for feedback.  So I'll delete those from my inbox and
>>> review the most recent one.
>>>
>>> That's somewhat tongue in cheek.  I know you're excited for this series,
>>> but please make sure you take time to gather and take feedback into
>>> account before posting another series.
>>
>> It's true, I've been having a bit of fun. But the series is stabilized
>> now, I don't plan to send another version soon unless I messed up
>> something.
>>
>> V3 incorporated your feedback/derek's and V4 incorporated rong's
>> feedback. V4 is minor, it is just nits.
>>
>>> Maybe you can pass this to a robot and it
>>> can give you actionable feedback, but a human sitting down and reviewing
>>> a patch series in a serious way takes time.
>>
>> I'm using this series as a testbed to make some tooling for this,
>> maybe I will post it soon.
> 
> Opus 4.6 was something. Anyway. @Mario v4 of this driver as it stands
> is pretty good for prod. Since then, I kept adding devices and
> adjusting devices based on user feedback but I did not have to touch
> the driver otherwise. It has been tested on most APUs and around 30
> device models now.
> 
> One thing this driver does not do is AC/DC limits and it would be good
> if it did. That way presets could be pushed higher for AC but that is
> only mildly necessary for AI Max platforms. 45W is more than enough
> for all of them anyway, but we could go to 55W e.g. (after that they
> saturate so it is unnecessary strain). But the updated limits I have
> are conservative enough where it is not an issue. I also found myself
> not using the commit option, so I think it can be removed.
> 
> The only issue with this driver is that steam maxes out TDP when you
> disable the TDP slider and as the custom limit is generic for both
> AC/DC it can strain the battery. This is an architectural issue with
> steamos manager as before steam used the _default tdp value in AMD
> sysfs but dropped the notion of default when transitioning to steamos
> manager. But this is a downstream problem unrelated to the driver
> where special DC limits could help a bit.
> 
> This is because I heard you might be working on something similar. So
> let's prevent some duplicative work. Should I repost a cleaned up V5?
> 
> Best,
> Antheas
By "something similar" do you mean the AMD overclocking driver posted 
recently [1]?

Does that happen to work on any of this hardware?

If it doesn't; sure please post your v5 that has incorporated feedback 
from this thread after the merge window at the start of the next kernel 
cycle and we can review it again.

BTW I think this version was last posted before Sashiko started 
reviewing patches too.  If you can; please run a local Sashiko review 
cycle on it before posting your v5.

https://lore.kernel.org/all/20261010190543.563161-1-Shyam-sundar.S-k@amd.com/ 
[1]

