Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010036.outbound.protection.outlook.com [52.101.61.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A193DB313
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 17:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789579715; cv=fail; b=TzBQeWJE+PvBVIiQp0zNile3bdWH+dyce1AmxPcwvXBvX9JfvSPr3jYwj3VkwqKNXTlL7xhnRu9jipp/dGbwNz4ECU419ql3dzv74NZEbUEUWvi9KNlIBC/tBf5Cc7WQx5xFpaH+CrAdXXqOqYg7+qwLBiYOp+fL2caoj7hu1Gc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789579715; c=relaxed/simple;
	bh=+NEfDjErJWOLv9+dnYeReP+GuH10g91amQQ12U2oEi8=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=T3jvQ5QXUkV7pzxcNXSqx8KQVwKZIPX5sM4Fqkje/Jn0swHxsqE9ngN7YBvwSmoglixa2QLEh3HwyFfFKuwD6lwQLJEjdeo0RIKidBDrBvk/bqARFWsJqkA/BN8wG8pw+u1Tz8BiYe2OBRYPF/kTjMwM60cRnQibtH3km3bepEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UuHdEImp; arc=fail smtp.client-ip=52.101.61.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UuHdEImp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HLLGAlEDZEsTit0JTjEQkjVKN3xJEgvWvPUR99Ezsw4ai3aLFkfjXw5cdHx/AK8cV3AhwRjlm9e3U+59FMGVjgPFu1xnm80wqVLXF7L/HPH7dncejrUgi2jPAUCvKzDxIeVtlm4SokB2k38tzwlWLQnKSZPyU6D5EZX2VvUvO+ZPYhBqCc7Qpa2J5kNxymm0nL+7j/Zpi8o5nPp/lHFu1dmMuCUMqGdtVAuf3+/1ao1X7keH2eYhyzf4rjfAZM+SZEySIV67kxCBcepa7LE5TSMD9KuMM/91kJX+upIfSSLYd2kInCmTcBanHS/zUAPpuOcNJ56/vq1qGcGB31qmOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8MmgYGInMyfkfJvmNQzU5b3zhxg0LWX9V+NjWnzhxIQ=;
 b=G1AzsHVa2A8mtfQ4q3Rua7AjxDyu8U31tTMEOZb/LVhr79N4yh/2x9ts3cKZIU4ccEeFNJKWXuorsyeDzC3x5F+u3IlZwBUC+U4kZs5B9uZ/Sv4DTtyqkXr/r1JlwE8uB5zTKrZbc4JzV7mBbe8cwo8Kg1UMl/6beM7R/fD7UgqPuhwAVlWT1JoFso6VJxGBSYQLnZrpRBssi9RJGREullz8m2tHEpJt74G1qtAeZxsEihR8BBdzGaUXRLFHWyiBp5l3TZZMysgFz2A2UcOGfTuvb2vwldiQ8uCgnoG9F/LI4CwrAMtLBv6sgwRqPVplB0/Vc6jy2JWwYzDxUDbYog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8MmgYGInMyfkfJvmNQzU5b3zhxg0LWX9V+NjWnzhxIQ=;
 b=UuHdEImpjQc7xYsVGo4cF0ZK7QjyIDKY0hJbbj/E0t7of627YRXyrYvSTU+cthkUJYncn1/SpGXndCrZZi3rE0lWn1kw1XVxwsmdKiv9PPmulLDaAstGTEFFkZSlLpdWp6jFmPMc1modiRkjIW21OW2+C6hUMyvBD3FBFGUPekQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by BY5PR12MB4322.namprd12.prod.outlook.com (2603:10b6:a03:20a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 17:28:31 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0428.008; Wed, 16 Sep 2026
 17:28:31 +0000
Message-ID: <d8d7a246-00f4-42a5-881f-66839eb6b302@amd.com>
Date: Wed, 16 Sep 2026 12:28:28 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: amd/pmc
To: Karsten Wiese <fzuuzf@googlemail.com>, platform-driver-x86@vger.kernel.org
References: <CAM=nh0S9e1+_U4WGR92HwOrNC2h2xYb6eKvgN5_skg-vvbSbqQ@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAM=nh0S9e1+_U4WGR92HwOrNC2h2xYb6eKvgN5_skg-vvbSbqQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:1ef::13) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|BY5PR12MB4322:EE_
X-MS-Office365-Filtering-Correlation-Id: a388875f-c47e-46aa-770d-08df1417ed46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	rVH6CQgren0Ga5k8q9ba3IQuOp+Cs+1iFqYd702Jfj/lb9kBuPtUtUPPFDmicKRKfVpwZ4b3AkVLwpn5czYS8N2ymIjpM1PKtcX8+dcQmgm0Y942q/Vo4bQWYKlEtQv7M94Ohkls6rnM8U0doivfgrPkC0XQGEIM/DxnD4MVj4f0RI+7gLTJU2zBxEgy77s9c0bNTrGw2NSykHBrP02CppgJXYBk7GBMzRnur7tnIaQwkTqHJIS7od25iy/vBsBKvhTe6wzvP8c3/RIm7dwPFEFrkd5g/aJQQoOEcg8whj5/8CNnSEuZNqo2SO8GzuMj76r6yrpPXSFnrYJqiVUMAE1ULl2vg/W5QMbcvbK1IRmecy7qKWOHaOypgRMPR3vq2xRdX258ylhpObhW899DnaWRKe+as1sCYFsk1MoIx7RPrM9MB6vvLwnyh0TYNsZAr6HOKrwxmMwaPnZfFuyJqP3fj38sMTTccNn1imoY7tvuRqDpOqGfqh2F50pKJQYIFqcmYFmQt3b0o7LxrCieBea02IhLerDoX5fEPt3+7hLep5DHDt1ZtkB665fwcuUz9Oed4KHSsG7jCnH6LfRUnF7lolfw6I0jAl6BUk/1+v43vvuZS9U+mSGqrNANKYBgMOYq2uNS6VwQEWRTuoJu0rhULsOs1DR9f6RfD1jqOzo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajlLeVFSNGx2MUF5TjQzM3JSZWVuaXdldUp0ZkxzSE9OM2dnMnJvOCsxNFl4?=
 =?utf-8?B?OFRrRnh5NEMwUVdtRFZjNGh6WGhFOFpzR25BN1RJL2hyVFVmWWpZWS9iRVMz?=
 =?utf-8?B?Q1NLOEh3QW1ReURlZ21iL0NFSUJuYU84WUF5YTBjZWU5dS9SUFVlZXRLOXpX?=
 =?utf-8?B?TDVsTVNLVjZHTk4zdmpzeVRjMGlHZzZralVJRWVtQWYyVHBoSzdFaXRFV3ZL?=
 =?utf-8?B?ZFMrUWRLY21ZUi9Ia1NTMkQyQkR0RC9leFRwbjRCUCtLRGRpM0hxeGgyUE9D?=
 =?utf-8?B?YUphbUUrQlkrNFFiaFArRkdDWjFhZEVseTdYMWRMOTdLYmUyb1FqOUh6NkJv?=
 =?utf-8?B?d1VoWW51Y0Ric3RaUzhXRTdKdGVNS2t3SFo4RGtmS0JzelUwKzJ5QWZDMndH?=
 =?utf-8?B?MUxCaTZQYXlWWUZwbHp6YTZqUWJSd3M3WnZPNlJ1YSthbFVsZk1CNWdiQlJQ?=
 =?utf-8?B?UWtQQ1dybnBTSjRGM3VmVXhvRFRDbmcvVTNCQ0dqaXdUZTlVTHlDMGFPWnFY?=
 =?utf-8?B?c1Z4Ynd3aVFqNXRQNFVGSkUzRWJuYVN1NDBpSlRwUTJ6ZVNUeFQ5aWJSa0pz?=
 =?utf-8?B?NnlzRjV4TTVTMHF6WHBOL0dxVkVoNGY3U3lKbnlUNGJKZWc0U2hBRlFsTG5T?=
 =?utf-8?B?RDJzNlRUbmJoUlRNcDFrT0ZOT3RLSGw4QmhPOUo3akl4R2xjYUovVFUvVXBZ?=
 =?utf-8?B?clQ2L3ZYVmF1cTFHbkgwbytRUjBrNC9Sck5pZUI4b2tnZHdZT0Vxd1hZaDB1?=
 =?utf-8?B?bm5GSzVxY1lpeW1PUW15UExLY1ZxdGgyZzMxSFMwRTVFNVJhRy9aRWxyOCtN?=
 =?utf-8?B?MDI0RzJwdlIzOHBTQXhzL1NvYXRaOUJnU2wvc1ZIMHRxUGFPTVcrSjFWR1cy?=
 =?utf-8?B?NENIRksxZVpiaVltNE9lVnBPVkYxNlZGbDhwU1d6TE1qWU05dFNvR0RvWFNn?=
 =?utf-8?B?YVRsSzQ1cng1OW5ZcE1zbmhPbGRYK0JjblQyaEtRVnhWbUdoUU9kOFpOV1c2?=
 =?utf-8?B?eS9vTUwyRWxETjlqM1dKQnJOeGEwYjZsRHd4UVRKNHdrV0FiaWdTQzZpZUtp?=
 =?utf-8?B?NEh6QnZEeXVvY09SNTZpQVA4bmErc0lxVEJSaWZ5aDJ4akphdjhDYjN5cjRk?=
 =?utf-8?B?RUNsS09uU3J5M2NVRXZ0R00wZnJZaVVSa0NNZWtIYnBBOVJ3K2RsczB4dUlh?=
 =?utf-8?B?ZHEwSmFrcHk2RFNPUHRPV1dMR1hEUjY1b2lxam5LVnpybUwvc1ZuVzAzakZR?=
 =?utf-8?B?aEJGWlc5MUpJdUtiTFJZbnF3UTFkeFZJNEpldlkwWWluSm14K054TmFSMStm?=
 =?utf-8?B?SW9sMi93Q3lPM0dxTnJuY3J2L2NEVEsyeUgyQVFWNXpza3M1SnpwTmVaZEtD?=
 =?utf-8?B?VTZaODVEVzA2K0l6OFRWNTV5aldoOVJMVndRT1Mzd2VsOGZJQ1RpYmpWM3FS?=
 =?utf-8?B?MWRYRmxRdGNpMW9QcDNMNUxYTnNXSzdxOWF3TmdxL2FWOGw1T3lhYXRzM1VW?=
 =?utf-8?B?V2FheU1hOS9sZmtQQlpoRUp3U2tQcklsNDNaazBaSS9tRU1VOXRPa0NnK3V0?=
 =?utf-8?B?Mm14N3hGaGFQNjNkNzBVNXU3Ny9WU3JRa1BpSU5UeXhteWJ4cjF3bmZiTWFU?=
 =?utf-8?B?SFRMZGd2TDhia2JOeFZHOWVnY3VpMkFPYUlBMHYrODE1T2ZROG54M29DQm1j?=
 =?utf-8?B?Vlp3TGdSL1B3OThiWFpXNFlzdFp1YzVUSVJudGIwZjdzcHFYVU9mQzVlWkVM?=
 =?utf-8?B?SyttQ0QwcjdxaVA1S2lTNzNqQTZ0clpTb3lCcTM4ZHBLQ09xRFZ5NGJISUND?=
 =?utf-8?B?VTBDeWhrWG43M2VESVBuWWpJUUxUMjdCNnBBSVFjMFgrRCtYUHpqMEIyL0RG?=
 =?utf-8?B?amVKcGExSzZBbWYvVUF6OTJTZlI1NWFjQkttYlI4NUozUEpUVE56YWZIVExl?=
 =?utf-8?B?RjQ1TFZwMnhMcXllR2F4MWtQWFFiN3F5N3FJbk4yRlJLVjdJcFBVWVJLbFpH?=
 =?utf-8?B?Y1ppUGpjNTlWT3VCNmFtZlZOSExDL0RwZTkvNkc5ZVJHQUVvQzlldFFsUW5t?=
 =?utf-8?B?T1UyV3NVRlVTczE0N0tBM0JTMGRHWUUzNnREcGZNK1JrQTBxc29qUnNUVnQx?=
 =?utf-8?B?WVk3TGNzYXIwTy9XZ0IrS2RtUmk1ZUJHYzVBd0EwWWtOSHcxZFVzZGNjdnRo?=
 =?utf-8?B?TEZaZWx2MXhCYUN6alVYVlprU0hhc0xhYS9ZRHJvWjlhYU9md3ptcGlxRnU1?=
 =?utf-8?B?cHRqd3ZSM2R0Vk5obVVmMjI5VGRCR2FoWWd6VUxodGRVSzlHWTMvRlg4d2xK?=
 =?utf-8?Q?xPjmvgOZlHAurX1YOd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a388875f-c47e-46aa-770d-08df1417ed46
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 17:28:30.9533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CeUAxhfredg5i49zLlb1wx8ekUp9VrxvPTg6G8RqnMil0AjBfS6qBuodcz+44uDLRO5A6IZrNTFlvJuwfFSamA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4322



On 9/16/26 06:46, Karsten Wiese wrote:
> Hi,
> 
> your change makes a huge difference here, no more hangs suspending/resuming.
> 
> amd_pmc AMDI0009:00: Delaying suspend by 2.5s because delay_suspend=1.
> If this solves problems on your machine, please report this whole line
> to: platform-driver-x86@vger.kernel.org so it can be automatically
> detected as affected in the future. System Vendor: "LENOVO" Product
> Name: "83AR" Product Family: "IdeaPad Pro 5 16APH8" Board Vendor:
> "LENOVO" Board Name: "LNVNB161216"
> 
> Thanks,
> Karsten

Hi Karsten,

Can you give some more context so we can properly document this and turn 
it into a quirk.

* What issue were you having before?
* Was it a problem on every single time, or just sometimes?
* What is the new behavior with that module parameter in place?
* What BIOS version do you have?

Thanks!
