Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010042.outbound.protection.outlook.com [52.101.201.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EEA35B626;
	Tue, 10 Mar 2026 02:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773110613; cv=fail; b=Ykx9dvBuBGnuvSBYil//2XUIkK3+QIwLdJlNfmtpK2ACPalN0UKV+sV+0rTf1jjSwdMKdrpKci0HkFG+6xri00/Pab/HGQZy8JeQA0JcyO3TFkBwFV+fXql4vWMANTBB9SPWfRdXhBm5E4fzGj9syqUxaUCkDqB3LFZ79jjPguU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773110613; c=relaxed/simple;
	bh=d4qKKKEo+AZd07BZvAj+PuPfxAeSqw2zc0saOmcvSOs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TAs5C7HSu67Kp3gS/cvioxOagxaWUNOhsR7cBQeoOa9q7zG7qi7M9WMhOGkb6EJEqgTUVKLTSSiKtwTADBmTSZPWHjEwvGrTKrlAu2d1yxxEX/Sg/Z9cgrZb1wPo2wtO54MGQpVyi3Daw+IvnYSB4hMxUjSFq6Bcoz0FxYRx1+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=x0mMbjjq; arc=fail smtp.client-ip=52.101.201.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="x0mMbjjq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lh8CJZ1vLiJ8UEk9o5fNqquWdQc9Dbgb9ey/W3PcT3DvOxtTj2hEYGm2q5qLyTKdQbjYQjt75uIPiMItRjrafrf9IQeQYabBuz9h59GS/migqiQigcXq9WOjVd26pn23fr34EgrwO9NaszHOtrdN3ytDdNo2e7VHKtvzEgqrD+FyHjssoeyKnmdQ1ZY1dG5ByOwCuBDpzrNxje2fh8yVfs/laGPvhb9pzK/ceetjDu5JnJi4xoM3ksKtDQP01siV394RAxmj2IbiS2ahCAsvABO9lfxuLidgHVDMXz8KT9EF7otB19z3iRdQsCDgi1WHtffzbXpzh+gvqCWa6LHuGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZyY7rPZA+zUGOxkOtCShoNj3Y25AD7TNBtq3whXQXA=;
 b=Nb3kVakNnYn8s5+aQIEC24O/imHpdPOqxjmqhpV2Y9uqspUkwWEMS7HBvwRZlZ92v62Sl8n1DGtlozFzrOy+0SY0m0/UJPMSbUXC3fqR0Q3BaQ9AY93clTGl69qBFk6ZO2TmesmNL2f/MMsSbldtvtn3ipU6QoKtxNXZ0rPEmjQF+yb9kuaxLgb/C3xzDSJ9l8/6UrtURMoJyWmgxMpNng4hHikuiW2vZ5cceboEVq0wTXChyNAvw3oI+SZ+JL07WRdfmAAzPLp5KtYgIaYDOmsUCgGBXqKYcy2lqjk4p6DEGUO0hd7sHei28Tba0bQCg5nfYnLDHluKzxWBRVWi2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZyY7rPZA+zUGOxkOtCShoNj3Y25AD7TNBtq3whXQXA=;
 b=x0mMbjjqdy0G3TpUuCPdDaBDtHO68+5d0xQhkrWht6ca9OBHuRes8zZyzvFZYsa6Qe/kqNu6MRcHDgqrCh3q+vDDtJ+N8uaoD/EUhd51vOKmpGu4e0Mwev4BrVvgd6ZOlEzTR2FsNfw9+/DIeLSJ641JOOZLLN11pPSvMFnRIYQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by CH3PR12MB9080.namprd12.prod.outlook.com (2603:10b6:610:1a7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 02:43:25 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:43:25 +0000
Message-ID: <42275140-ecef-4878-b256-1061060d4958@amd.com>
Date: Mon, 9 Mar 2026 21:43:22 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 0/4] platform/x86/amd: Add AMD DPTCi driver for TDP
 control in devices without vendor-specific controls
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: W_Armin@gmx.de, sashal@kernel.org, Shyam-Sundar.S-k@amd.com,
 derekjohn.clark@gmail.com, denis.benato@linux.dev, i@rong.moe,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260309205125.293148-1-lkml@antheas.dev>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260309205125.293148-1-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR16CA0018.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::31) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|CH3PR12MB9080:EE_
X-MS-Office365-Filtering-Correlation-Id: ccc32de3-8db3-4464-5ca9-08de7e4ecd74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	mRaH+eeG8AvAFOvjNmYAV2pg0EQG6FcZ5x05UoDu01dWbqxqxdT3cx0Pygy8IkZ2N8eYEKb5BMxkdNi1pOqVZA2rUUwRWcPNGDAJVW8N8BTyP8ZqU5voTd1U/EllZK1o1n3geRPzvY58++DCwXujvYLSz/9xg7k9JIcysY2s3yBnjQXVjvpQ1liMm+aTK4U9ae+GpSwLeig/I4g/+OdHmOHSlcV1jCrXRDNxnWBKeyJBCEzQGDnspgMVMSxsKkM4arkRLF0LGHWf6j6+TBuX+qOOk7QOf7D/4fmhZqddC9ZRWvvjJqZSTsFnp08QPdGv6YVkd7z2QKyvtnnfSKY0phu3DEOChS2PU51SM32HJtwUYzmoBRYn6IPuPFnLGi6Gg84Gs61hIh5kG5NxkLP8TjjAIEA3ETaRwOWeoZb9pyAWJPCHdrotFVoPYWOobBjhxO4JOTzMynS9wjpSRhBp96sD7yfEyw4m0SnHqqNtrHFo4h35yyYDHVacZ4IS/S5qYspyZcyx9qwfVOqTqLS3TZtsjgGPTfWsyHpoS3iO0KpTWsPByjIJ9uivMkzbui4Os8LoPzZUUQke+TZnJjjFWrS3VXYDg5qHe2SdmSvOOMr8BOnw7SkpS9gJsPNAaDZYB36yH3NqKiuzDsra2YE5eS7BXNlgsYoyspPIjxcBZ/jvoMZRbvOwCx/R84fItHNOQMKL44Ol/JHWNTY4ExvBcQE/hHUo5vHXj68s+nXEtFlrji7mZ+Hhi/66wY/X12Tq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUpIZTV5djllb1BJd2N5RjVlMDlSaHo5WVY5VHpmRkR5enNLWCs5aklmM1VW?=
 =?utf-8?B?cXFVNjRrZnZ5a2Y5MkNOYmpoblBUNjd5ajNvV2EyMXNpQW5Tbk1SdWpuS1or?=
 =?utf-8?B?VkR3aGNLTFR2ZGdKMTA4Z2V2TDVkdktJQzlPUmZXOTJxWnh5TlFaUzRyQ25z?=
 =?utf-8?B?SHZSeDZDUDNFRVpGajdUTU5ENU9kRGlhdmxZeWw2cGJYWWU1UmNML1U0UDlR?=
 =?utf-8?B?Y3lDeVkvMjUrMEwxNnE2anMyM253MTFFc09KM3RaUWVZME5YQlJSRmF6QUZZ?=
 =?utf-8?B?YUM2WHdPblp6ZUJMMko3YTZqYVE1MFFndElHYmVzY2tENDJuc244bEpXMVkv?=
 =?utf-8?B?RXg3SzlmNzBVRFBvVEVyVnBZMVE4elZ2Z2M1bVVuSzZCQVQ4L2tTYVU4U00r?=
 =?utf-8?B?V2RGVVljVU1iaEJuNE1vdGZYbWxOQ3BSbDY1UWpTNzYxZU1ZRkhyVUo2TFBB?=
 =?utf-8?B?Z0NNYkIzMFFiVVdBdEdxV3J2OEJIVEZSNml5eUpnanlUR3hiWEcrQmNoRlYx?=
 =?utf-8?B?cCtUNG5yN2RKb1daU0RZZ1VUd0tYaExoeG9Fbmc4SmNYSEtpblVDVUcxcTly?=
 =?utf-8?B?T013c0xuVkxmZUJXbTJQT1plS3JlenY5eWVFNHNzME92a0tqVVFsUkdFZ0hm?=
 =?utf-8?B?dktDZjNjS2wzcDhlemdMYmIzTm5MZkRkNlM0RnR3SE9hYnlrVzlLVEJlVzVr?=
 =?utf-8?B?ZFNFQkxyR1YxM3BUS1pRZ0RQdUR4S3BoYUcyOUxmL3dTb3FPTHNRdGFuUDl3?=
 =?utf-8?B?WDZFWTlOOTBtNkJMenNxMTNKMG51aUN2c3ZIcDhKdW9jdWJqLzBuUWd4RENE?=
 =?utf-8?B?OVhYaFBlR1lTV2ttSyt2TmR5eGh5TDRNNGxocXhLa3U5SGUwd3RWR0F3cVUx?=
 =?utf-8?B?dVlpdEhaVFZWeVA5d2daaVBhRTlEVjMrRkVvMVdEY0dIY1dOaUQzSDdvVkZH?=
 =?utf-8?B?Q1RmV3ZFSHltVmtsVTNxcnBLekdOWFhRd2pYN1RsSk5LMTVXMm83Y3BiYVhm?=
 =?utf-8?B?bVJNZ2l3MFhkQUlxRXJ1QWlBek9vSWoxUWFXTU4xcDdjcHlOLzVyR2FiV0xt?=
 =?utf-8?B?VDlIZnBTNDRsa2RSZXo4emdhN0gxYUY2aktTMEVXK2N5R24rMHZ0bXYxWUxI?=
 =?utf-8?B?RCszMzhZdGlxR2d6S24xN2xuSFZYQ1hkTllNelVudUpBQmdpa0hKUENUWGZW?=
 =?utf-8?B?MHgyZ3AybFltK1I2Smw1dnhNUEFYdXVSckdya2xHNmVsT1hqdmkyNHRzMmVt?=
 =?utf-8?B?OU8rREJuTzRFYzlxS2EyR2V1UWo5M1g2SnE0WmdzZ0lVeHdoU2FqRXVMak9S?=
 =?utf-8?B?U1Bac1BTTXVvb1pUa3gwcDQvRGtBTFZVTk1YK1d0cklTbEJmZ3Fzd24wd0hX?=
 =?utf-8?B?MlF0b3lOVnMxbDRaQUJjTDRpS3ZIaUV2TTcya0pQbGpxMW9WK2FWMVV5RGMy?=
 =?utf-8?B?M09Vdmp4ZE1GNU13UzVEU00wd2d5WVlKR2RScU5QWXNvVXAzc29aeGxPNHBN?=
 =?utf-8?B?b1lOSS9yVVZiaktocmp3Zk1hZHR5cEpNMHNTMngxdHhYUFgrOU1UVUEydTlG?=
 =?utf-8?B?WEsvWGV5QkFrT2c4bkJ2a0dvQ3VXbk0zODJlM09JZ0J0V2ZtTkV1d0xtYzd2?=
 =?utf-8?B?WUg2c1FmU0tQbU4rZzVZbzQ5bXZFL1B5NTdOUk9FTW5Zdkt6S1dPNjNkblY5?=
 =?utf-8?B?MHpnMzVlbEFFS1phdGw0QTY1UXhRdTFKV2JTeGpBYkQ3YnppbzdGa1hRRUl1?=
 =?utf-8?B?SmlnVmozV2tCWERyMDVpZHVkaExmdkM2MFRleFJHNE85Zjdicks4ZVBKOWRB?=
 =?utf-8?B?d1YvbEMxT1Z3eVdSK0dHenEzWExleUh0UWduQml0WU0vRnMrRC9xMXNNYXN5?=
 =?utf-8?B?RVNmRkxrbkxDQ0R1cUJKOXRGVmxZTkMwRStjQ3pTL1RpREVDcmdEVmlnd1dP?=
 =?utf-8?B?MWNudkJ3R1RVUTB5Y2o0UktoYmZRbjl0MTB2bUNxb3BERzFuSmZiSFMwMHFw?=
 =?utf-8?B?RG51UXcwRVhXc3VYaCs2TnJiWUhMMGhEQlpaRHNUbzVXVSt2R2RKZzhjKzk0?=
 =?utf-8?B?WmdYVGZMeXlQWmR0TXBMMW1JcHpIaE9nWVdMV1FZaFlpb3gzZFNhaVF1VWFY?=
 =?utf-8?B?ZkpTTlIvS0dkSEhWeldyUnRZV28yemdlWklqYzdPWmtXbGl0eGRtU3liV2tN?=
 =?utf-8?B?NmoyS05WYkNiOEl1QzZUM3djczExeGxpYUlDVHVtM3lPeERRT0tVUmVOYzdX?=
 =?utf-8?B?ZEQ5M2dzRWVmK3lSYkNtSDY4UnZoTFRrdW1OTGdIdHViR3hvVlBUZm94c0dU?=
 =?utf-8?B?bDNEWWdWaUdQeS9BQ21KUFN6SklROVluWFZ0Mkx1dlBCaVUwaVlOdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc32de3-8db3-4464-5ca9-08de7e4ecd74
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:43:25.4284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zWIbfMyVOU8QYGNIfbbBzc6SNQ9Dt+uAqWojp9DbbK9Q/qJY1J2wWWhn/ikoJymnl5Uzimgc1ya9hFZjfaz6oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9080



On 3/9/2026 3:51 PM, Antheas Kapenekakis wrote:
> Many AMD-based handheld PCs (GPD, AYANEO, OneXPlayer, AOKZOE, OrangePi)
> ship with the AGESA ALIB method at \_SB.ALIB, which accepts Function 0x0C
> (the Dynamic Power and Thermal Configuration Interface, DPTCi). This
> allows software to adjust APU power and thermal parameters at runtime:
> sustained power limit (SPL/STAPM + skin), slow PPT, fast PPT, and the
> thermal control target.
> 
> Unlike mainstream AMD laptops, these devices do not implement vendor-
> specific WMI or EC hooks for TDP control. The ones that do, use DPTCi
> under the hood. For these devices, ALIB is the only viable mechanism for
> the OS to adjust power limits, making a dedicated kernel driver the
> correct approach rather than relying on the out-of-tree acpi_call module
> or ryzenadj.
> 
> The driver provides two layers of control:
> 
>    * Platform profile integration (low-power / balanced / performance /
>      custom), with per-device preset tunings derived from thermal envelope
>      data. Selecting a non-custom profile applies values immediately and
>      locks the individual tunables to read-only. The default profile is
>      "custom", leaving the device at firmware defaults until userspace
>      explicitly selects a profile.
> 
>    * Four firmware-attributes tunables (ppt_pl1_spl, ppt_pl2_sppt,
>      ppt_pl3_fppt, cpu_temp) that become writable in "custom" mode.
>      Values are enforced against per-device limits (smin..smax), with an
>      "expanded_limits" toggle that widens the range to the full hardware-
>      validated envelope (min..max). A save_settings attribute controls
>      whether writes commit immediately ("single") or are staged for an
>      explicit bulk "save".
> 
> On resume, the active profile or staged values are re-applied so that
> suspend/resume cycles do not silently revert to firmware defaults unless
> in custom and in bulk mode. In that case, defer to userspace.
> 
> Device limits are supplied for GPD Win Mini / Win 4 / Win 5 / Win Max 2 /
> Duo / Pocket 4, OrangePi NEO-01, AOKZOE A1/A2, OneXPlayer F1/2/X1/G1,
> and numerous AYANEO models. The SoC table covers Ryzen 5000, 6000, 7040,
> 8000, AI 9 HX 370, and the Ryzen AI MAX series.
> 
> Tested on a GPD Win 5 (Ryzen AI MAX+ 395). Confirmed with ryzenadj -i
> that committed values are applied to hardware, and that fast/slow PPT
> limits are honoured under a full-CPU stress load.
> 
> Responsible disclosure: The development of this driver is AI assisted.
> This includes its writing, testing, reviewing, and readmes. The driver was
> manually reviewed line by line, but there may still be small leftover
> quirks. This is an RFC, not a final version. Let's push these tools to
> their limits and see where it takes us.
> 

I'll tell you where the most immediate limit is.  Humans can't review 
RFC changes that go in daily.  Maybe you can pass this to a robot and it 
can give you actionable feedback, but a human sitting down and reviewing 
a patch series in a serious way takes time.

Over my weekend I see multiple copies of the series in my inbox.  To me 
they must have obviously been garbage because you sent them so quickly 
instead of waiting for feedback.  So I'll delete those from my inbox and 
review the most recent one.

That's somewhat tongue in cheek.  I know you're excited for this series, 
but please make sure you take time to gather and take feedback into 
account before posting another series.

> Assisted-by: Claude:claude-opus-4-6
> 
> ---
> 
> Changes in v4:
>    - Align dptc_params continuation lines to opening brace
>    - Reflow all dptc_device_limits structs: expand zipped braces into
>      separate .params and .profiles blocks with proper indentation
>    - Extract enum dptc_save_mode from struct dptc_priv to a standalone
>      declaration
>    - Replace vague mutex comment with explicit list of protected members
>    - Use &buf[off + 1] form for put_unaligned_le32
>    - Fix misaligned '=' in ACPI in_params block
>    - Factor out dptc_alib_fill_param() helper to deduplicate ALIB buffer
>      construction in dptc_alib_send_one() and dptc_alib_save(); use int
>      instead of size_t for element counts throughout
>    - Consolidate dptc_current_value_store: single guard(mutex) instead of
>      two, eliminating duplicated profile check
>    - Return -EBUSY instead of -EPERM when profile is not custom
>    - Add blank line after early returns for readability
>    - Consolidate dptc_alib_save() call into dptc_apply_profile(), which
>      now returns int; simplify dptc_pp_set() and dptc_resume() callers
>    - Squash device_create formatting fix into the patch that introduced it
>    - Remove bogus "AMD Ryzen AI HX 360" SoC entry (no such model exists)
>    - Return -ENOENT instead of -EINVAL from dptc_alib_call() when no
>      parameters are staged, matching think-lmi save_settings semantics
>    - Remove bool has_staged[] array: use staged[i] == 0 as the "not
>      staged" sentinel, raise expanded_min from 0 to 1 W to ensure 0 is
>      never a valid user value
>    - Remove unnecessary braces from if/else if/else chain in dptc_resume()
>    - Drop Ryzen Z1 SoC entries: Z1 devices (Lenovo/Asus) use vendor EC/PMF
>      drivers, not ALIB DPTCi
> 
> Changes in v3:
>    - Split single driver patch into 3: core driver, platform profile,
>      device entries
>    - Rename DRIVER_NAME from "amd_dptc" to "amd-dptc" (match subsystem
>      convention for platform drivers and firmware-attributes devices)
>    - Add scale field to dptc_param_desc: sysfs values in user units (W, C),
>      driver multiplies by scale (1000 for mW) before sending to ALIB
>    - Rename struct fields: min/smin/smax/max ->
>      expanded_min/device_min/device_max/expanded_max
>    - Remove comment "ALIB parameter IDs (AGESA spec Appendix E.5, Table
>      E-52)"
>    - Move ALIB method check after SoC/DMI validation, change pr_debug to
>      pr_warn
>    - Reorder local variable declaration in dptc_init (dptc after other vars)
>    - Add commit subject prefix "dptc:" to all driver patches
>    - Remove early-return for empty save in dptc_alib_save; let
>      dptc_alib_call handle the empty case
>    - Remove max_power as we do not do DC/AC validation in the driver
>    - Fix Ayaneo AIR device matches to reflect their wattage, add 15W profile
>      for original AIR. Cheers to the AIR Plus user who had helped tune the
>      AIR Plus profile so it was correct.
> 
> Changes in v2:
>    - Use a platform_device base instead of raw inits + exit, hook into devm
>      helpers referencing samsung-galaxybook
>    - Add platform_profile support (low-power / balanced / performance /
>      custom) with per-device energy presets; non-custom profiles lock
>      tunables to read-only. We default to custom to avoid writing values
>    - Reduce exposed parameters from seven to four (ppt_pl1_spl,
>      ppt_pl2_sppt, ppt_pl3_fppt, cpu_temp); drop time constants and
>      separate skin/STAPM limits in favour of a single SPL that sets both.
>      For devices where the max tdp offers thermals that are not suitable
>      for day to day use (e.g., excessive fan noise), MAX_POWER is added
>    - Remove CONFIG_AMD_DPTC_EXTENDED and the "soc"/"unbound" limit tiers;
>      keep only device (smin..smax) and expanded (min..max) and soc match
>      (certain devices ship multiple SoCs on the same motherboard/thermal
>      envelope, make sure we only hook into validated SoCs)
>    - Rename "commit" attribute to "save_settings" per firmware-attributes
>      ABI; rename limit_mode to expanded_limits
>    - Change expanded_limits attribute type from "enumeration" to "integer"
>      (min=0, max=1) since firmware-attributes has no bool type
>    - Remove all global vars, limit _dev access to init and exit
>    - Use u32 accessors to set values for ALIB call
>    - Clean up verbose comments throughout
>    - Add Ayn Loki Max / Tectoy Zeenix Pro
> 
> V3: https://lore.kernel.org/all/20260307115516.26892-1-lkml@antheas.dev/
> V2: https://lore.kernel.org/all/20260305181751.3642846-1-lkml@antheas.dev/
> V1: https://lore.kernel.org/all/20260303181707.2920261-1-lkml@antheas.dev/
> 
> Antheas Kapenekakis (4):
>    Documentation: firmware-attributes: generalize save_settings entry
>    platform/x86/amd: dptc: Add AMD DPTCi driver
>    platform/x86/amd: dptc: Add platform profile support
>    platform/x86/amd: dptc: Add device entries for handheld PCs
> 
>   .../testing/sysfs-class-firmware-attributes   |   41 +-
>   MAINTAINERS                                   |    6 +
>   drivers/platform/x86/amd/Kconfig              |   15 +
>   drivers/platform/x86/amd/Makefile             |    2 +
>   drivers/platform/x86/amd/dptc.c               | 1271 +++++++++++++++++
>   5 files changed, 1320 insertions(+), 15 deletions(-)
>   create mode 100644 drivers/platform/x86/amd/dptc.c
> 
> 
> base-commit: 4ae12d8bd9a830799db335ee661d6cbc6597f838

