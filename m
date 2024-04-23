Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2067.outbound.protection.outlook.com [40.107.212.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A1513C81E
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Apr 2024 17:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713892420; cv=fail; b=nTLxXmQDtpaUtumedWR3euFqAzzaPBYRu1+RcHJmYNbuxZ+uE3Xyx7qCO5CMxRUT433B+/YskEzBv6xcOkZI3kzhIY+4yXzZxPsLwFuJotxsMST9nZxAksL7Qk4oet8+3wArZZ723c4PCTT7yhzyFe7DQa1uytv7JNFW+X/p4hA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713892420; c=relaxed/simple;
	bh=7QjPGTPisZtp124SRLKDl7izVIrQJRvKuoOVurPuJDM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=M/Fs5S/58lY4DEswRioCvwF0nMxNHUPz9M9fKXg50/PeCEPT7eGjYXso6zoSv3KzncYxYVYh3WjGcvMDRLQKM1aqBC0jdtzkXM2CzqZbTP0mVS6h2Fu7YvYJshHI4W9Kf5YHiXwRtaaNTc3nF/sabb1UsT+NZV8M7D10CsMyT48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wolm74cd; arc=fail smtp.client-ip=40.107.212.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wolm74cd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFNhPh5glCEFVUq/F7z9/HSqCTjcMZoy6BAN/39lVUsXdrXA3D4llh3XWc6kfay9lxgvUDit8ZjAVSI/EoyaogytZxLLsWU+Mv+jOt4mGxyyqGxSARgK5npYieHa1jwguvl3vCJlmuv9UeRIzyOkFDnrf9Mzt++xDf6TQjy51gKSysI0fA5AiIQUVSQFgWi2PlkZUbJVKXIsIquvXEw2THXemjgrrTv1bTvpDFP6D9X0/glEznQhNb3jS1ez/cbZPcXhJM7c0EIQjLreMXHwZskiC5YY3PM3NfVAuipoVVMZ5aEl7EGjCbRxEIPF8Cn9XOPuPHgqSqXl9Ub8Cm/oOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfvumV+rdEe4okRQCdMq1KglcRl0Z8J0dYwjizg8Pf4=;
 b=AVSz7OtV7KRelD33Fq3C1e/qiHI/r+PzYZ0IxkR4gTMBvnY3gIt7ohh5rXdPA6e/xcMZ2qRsdTPQvJ1fLke5iN7sfekiny7rpW9dL/p/SN6Aqs9Er6Z4vrPtiyX0e6UUitYQZtWejwPkB4jVNUzwRqxw99PUOPsSciry9XQ4H3cwuwuPqTY9Vy39L8cCoWeGQKh1TUvwCUSihcXieBwzjdSW95mO5kMSXkDgVGmKvSJvBz+k6c4mfyUSC8hGYKE+TqL38bpwnNhCp7NlJjKO7BHhi5C3eH8+hPwYdPBQwn7iAOd7iImwBYZJDHbGqqORwyjvK+jdcTISe52E7fzOGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfvumV+rdEe4okRQCdMq1KglcRl0Z8J0dYwjizg8Pf4=;
 b=wolm74cdBeniCvjo8Y8ct/OCAcUBTOZTiHTogbA0sKIEdP6ml+7awxYXc5kbeiY6TfHrhhdthC4t9cNQ+m9WkfshrdeFOmxeHsP2vuRpMFSrlWId3uZba+nAsmhje+/Y2R6SOsBJMGOPBPiYIOGKBjoWrc6BO/IarkbFYyom8ns=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ2PR12MB8876.namprd12.prod.outlook.com (2603:10b6:a03:539::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 17:13:34 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::d9b0:364f:335d:bb5b]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::d9b0:364f:335d:bb5b%4]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 17:13:34 +0000
Message-ID: <f9729073-311e-455c-9b2e-4e9eb48be2a4@amd.com>
Date: Tue, 23 Apr 2024 12:13:32 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] platform/x86/amd/hsmp: Split the ACPI and non-ACPI
 code
To: Suma Hegde <suma.hegde@amd.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20240423091434.2063246-1-suma.hegde@amd.com>
 <20240423091434.2063246-3-suma.hegde@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240423091434.2063246-3-suma.hegde@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR04CA0105.namprd04.prod.outlook.com
 (2603:10b6:805:f2::46) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ2PR12MB8876:EE_
X-MS-Office365-Filtering-Correlation-Id: ece5b21b-4772-4b51-25b9-08dc63b8b4f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?KzV3VFI1Y21GaGUwOG9JU3AxOU11ZmJyOUJCKzNENDdSc1l0aXg3WEIyMlk2?=
 =?utf-8?B?NVYrOVY5cnVrQVYvRzZ3UEljQ00yU1c0WFJ2L3VtTm9XKzY4eTBTRmY5SElM?=
 =?utf-8?B?MTBET2hxbFRMRDNmSld5NzIrd3hmL201c0kzSDZ6WFRNUi9WTjdRWjQ1eGlp?=
 =?utf-8?B?UzRXL09WM0ZXQkhRaFhBMFpJM29QQkdYdE9hcWdHYWlKRzIzc1RYY1pReEV0?=
 =?utf-8?B?aWllZTgwUkdKR0ZFY1VkQTROcHRJMHZXNnZEMVJBSXBnNHc1UkZ4Y2xTS05E?=
 =?utf-8?B?QlNTZHFwMFd3WCt2dmRrZnhab3daaEg4cEdqeTBuQjVMOVpoRTd4SGNoL3pQ?=
 =?utf-8?B?eW1Ya0phMnlNYWFtTndFZmhMdFF2eDB6WTZRbFlGV2txdFQyTlZQVmc1b1hH?=
 =?utf-8?B?dlFwZ0phU1lidWhsR05la2NQUTdXbTl0ZUlHQjdCOGswdzBZYzlua1hzSXox?=
 =?utf-8?B?SElrQlNCeFkyU2JnVGFhREdBNE1TQjFzUGp3SEJzVEdCSjV1aHpJMXhMUE9j?=
 =?utf-8?B?UXBWSkh3VjVHNCtwZ1NNT0Z1Qmd0b1NWdkhCQys2MTdEa0t4OUZUSkV1TUJ0?=
 =?utf-8?B?Yi9CTkY4NFJPdXZNTE12akNWYzZYaXkxcXFiKzFBNmVwRWpPNXJNSFZpd0o0?=
 =?utf-8?B?U2F1UjN0U0ZRcXYvbEN1Rkg1UDdzdXFHZzg4S0dQNGVQMW4xd1h0QlBHdFgv?=
 =?utf-8?B?TlRrL283aVVZRnpFSDB6UWxXR2JWOXRWNDJBMzBzR2VlQjRDTDJFdGl4c0Z4?=
 =?utf-8?B?MjlKcmtwNVJBU2Z4TlZBTUE1M21FY1RLMSs2b2xEdlFlVHVVM1dqbGNpVktY?=
 =?utf-8?B?aXJrWDIwV1ZUV1Z6dktodDRUZUI2YXRXY0MrYTF6bUJiQXh1QVUvWEZ6TE9s?=
 =?utf-8?B?STJqRVlieFFDUFVSQWFENHBoREZDeDIvMGVpelByb2U5dHBscnNGWjM5NUJ0?=
 =?utf-8?B?bWtPNGhRQ2RqMkxHR1VpMzczQUw2YXpHcGYwMnNHUC91RUg2VXFUVTFITXk2?=
 =?utf-8?B?M2wrOWNsVm1VbmM2SWxNd1NzK0UzNGt5WWtwamNybHUyU3JWVExhdVYvdTk1?=
 =?utf-8?B?MGJITTdQeU1rNDNRdTEyMHFaTktFbjJkK1dtT3RDSi8vN3V0L1EvMWFWVTVp?=
 =?utf-8?B?T2c2SkZyb2piQWFmM1NPUFRxZHQwbTk0eEZUQXR4WXdOOXR5b0VwY3BmUEJs?=
 =?utf-8?B?MlFDNG1kd0xCcDQvTkd6cHJlM3dwL1ZxY2RDaTVOb3NUMkNDMCt1bTIrK1Bx?=
 =?utf-8?B?UUczcGtQd2lMVnp3SUltdlE0eDJuV3pZRmZvYzZuMFROU0llaHVNNXpyMWpp?=
 =?utf-8?B?VFY3RWtlYTk5ejNjWnMxR2JRL1hJeWkwMFYxeVlOSUpReDhwYUdMM01KazVo?=
 =?utf-8?B?T1JqV1dtNVQrM2xaOGZMWURNQW1MdDBkUzBkNGxFS2VKTmFUL0dCVXdGM3R3?=
 =?utf-8?B?b0pZZG5CZDVPd2tSYVdGU21qOG96T1JLV09wTEozUXdudm9FTHRGSVBBb0hF?=
 =?utf-8?B?OENyb0E3Nld3UUc4UGU0cWtFOXRaTWFIS3p4SU9GN0hWNjZSVlNiUjJtTDFl?=
 =?utf-8?B?U2ZTMzI5SDBJWXlIclJQb0kwVFBqZGM3SXhvM1cxOVFONWhsYUtUbU9LL201?=
 =?utf-8?B?MHV5anc1WmtFNktrbHRwdWdaZG5Gb0dQcGVBaGhOd2F6amt4ME5RWHdxTVlD?=
 =?utf-8?B?czcrWURqY1VMMDFMblNDUm14RjZWRHlCbS9OZ2hLUU5sY0ZudDdBWkJnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGNVVGo3Tzg4TXdHSmVIMEt1bEdiaXR6ZmpFYzdHNG5zcWlZYTVrUlRBb1Zi?=
 =?utf-8?B?dzBlMlBIQ2lPeU52OXluTHhDZ1VlSU9MMXNjL3IxNUZ3Mjl0RzNjQVJ1Z05n?=
 =?utf-8?B?czFXWmcwbjI2WFRPZlprbGkrMTRGd2gvY3A5bEV6SUFFeTZMRStzZGM5V0ph?=
 =?utf-8?B?Z2RJbHlDVUUzejF1WmZLcmdhKzJ1OFBTVVpZTkowb0RzRll2d0xDamFOcm9h?=
 =?utf-8?B?T3ZRQ0VxeEhqNVdFc3JHTCtTRmpnQU1xVWFNempuUEkxMEdjcERoTlNHYU5q?=
 =?utf-8?B?TVFwNy9CUzUwcm10dllIanN2dTNLRFdMMm5UU2NzZlFMT2NEbVFCaEJ6eGZa?=
 =?utf-8?B?RzQ0emhPSHFIVy9XYXQyMWtnMk95QTl5ak5UY1JzcWdNOWtjNm1ja2hzVEJp?=
 =?utf-8?B?RWlQMjh5TjhQOWFQVDdsOHg4eVkwc1Z2T2tuTTdKZ2J1WSs5YzZMcWVqRzla?=
 =?utf-8?B?SnYvSDNBY2lSTzVpd3RGVUxkdFhPdnRiKzZsVFRsaGZoSExoMm5GNzdkUWdo?=
 =?utf-8?B?RzJxQUsxVU5uL0E3SEFWVFExMXZUV3ExTHY4MkpqdGJNWU1Zbm4yOElJMEhT?=
 =?utf-8?B?amJMekNuSVc1UlVZTGR1WDR6Vi9RZXBkRHNBOW5oT2xEUkFFVzluQ0lweU9V?=
 =?utf-8?B?RjNPeHBGL0kwWkRMTUJCaGdCaTlyNnFwdGNQWnI5UzBpeDZYZFF6eFFTYko4?=
 =?utf-8?B?bWxlZ3VReDhEb084SG5jbUE2WGxpWGZlOGlsbTBhTWp5WWN4d1V0ZjNiODR2?=
 =?utf-8?B?Qkhid0t0Qk5pSTl3Zld3Vm4ydTF1VHhaa1N6YTJxVXdId1F0OTAvdVUvcHgw?=
 =?utf-8?B?RmNKZ1VvbmF2NFZhUE5qaEQzWDFmdkpGWlNwckhjbGdJOTRJZVdmallTeXZ0?=
 =?utf-8?B?Mm1rR0xOT3FNdWxpbTFkQ3VUV2hQZUFSb3JTK0RIOGFGaW9SOFlvdVlMNlR6?=
 =?utf-8?B?MFZ4YVBROUpZa1pOZmRyQVNpMVRNcGU1RUwyUVpoYmdHWVJuZW8rUTJIQXV3?=
 =?utf-8?B?VW5yaTdrdUVsYU00bWxZZFF0T1RUUzNqQ0dqR0U3V3MrMG5ySkYxL1c1dGo1?=
 =?utf-8?B?KzhSVHZCK0lQeHVCTlNJRC9uZkpGc0tZZmNXNzJQOEV0R3NVVWplM1ZGWjhR?=
 =?utf-8?B?ei83cnBDQ0RKd0RjZFg2UUdVMFlXNnlGZjZUUUtFSHF1YXZ3U0U0TDBMYlJJ?=
 =?utf-8?B?K2NMLytCRzJwcGE2MWxoblBNMklBK0V4cHVacmoybkdFZGdpeTh1UXZWU0lM?=
 =?utf-8?B?YnlKdEdKVURwSEV4WXQrcGZvUnFrTXBXeENmRHJtTEs4aTl3a0R3emdnbHZJ?=
 =?utf-8?B?L3ZmV3hVZ2RLRko0cElZSm5lNTJsSzJ4TStnZ0dscTVyZElld2tpeno5Q2JU?=
 =?utf-8?B?L1VXY2p2N3A3aTRFVzRYUUJZK2tnY2RDcnROTWdkKzFuMXo3YjNnbTl2VU14?=
 =?utf-8?B?MVpEOTAvUWlkOC9rNFBveDMvSDUxUUptQW9RWG5RNEFVWlNGUUJWSWNDcnZJ?=
 =?utf-8?B?UVYzNDlCVWU4aFA2b3BLWUdoRW5meC9uNnNKMys1VzlWNGNFMWVSc3Bwbzlp?=
 =?utf-8?B?RzUzcSs3cGRYTmJnQ2xuTnZ2WjFQc2l4M0VOZDRtcWxxcjVYTkthekQyWE16?=
 =?utf-8?B?dE1qS2gvdHZObWVKQ2J3MzhzUVNCc2w5K1RvbFFydGNCN29JcmVKeFg4bEd2?=
 =?utf-8?B?QnBoUDhiSVY4aTdqZGlvTlhnTVlDV2tDL3dmWG8valFSamlNY3JFNFJIRXZX?=
 =?utf-8?B?MWhGeDMrTEl6bWdpQWFpeE8yY1BhOG1pZG9NNzg0bC9wN29iV1puSTB6WjQr?=
 =?utf-8?B?c3JHcTV4UGxOYUdheHUvNm0yN3dseUc4WGVnN2szNnRFNFh6ZEJJUDhoTUJD?=
 =?utf-8?B?dVQ4eDdsWGZwV1RuN3I3YzBEc0hnMEpGZjkzSUZWZXBCK0FKdWQxNjlERDZj?=
 =?utf-8?B?NlhzeDZVNy9BMDY2MmFkWUlhM1NFN2R4d0tZVHU3ZW80c05TeXdGWi9tbFNt?=
 =?utf-8?B?Tng4MXQrU0t0dk9rRCswQnI3cEhGSWRaTzY5YVFBSmRhRVpSanBFTnowLzN3?=
 =?utf-8?B?S013SGlsWW9oUVJ6clMzQzg1VjBtVGIxNkpaMmR3MFVXSHV1eERSbWJhdGZr?=
 =?utf-8?Q?mhJcETPe3SSdhATfKJa4IefsV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ece5b21b-4772-4b51-25b9-08dc63b8b4f3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 17:13:34.2204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nB2f91G6KH9yaC8JF+vlx5tfUcvja/iMBt+/Bjl2zyhyw4ROC285oLeGsN6MWkXQhSv/Nb6kbdV1B9UaXGY3RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8876

On 4/23/2024 04:14, Suma Hegde wrote:
> HSMP driver is supported on ACPI as well as non-ACPI based platforms.
> Making it dependent on ACPI in Kconfig, causes it to be compiled only on
> systems which have ACPI enabled.
> Remove this dependency by seggregating acpi specific code into
segregating
> hsmp-acpi.c file.
> This ensures that HSMP can be compiled with or without
> ACPI enabled.
> 
> Also create hsmp/ directory with Kconfig and Makefile
> to keep hsmp related files.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
>   MAINTAINERS                                |   2 +-
>   drivers/platform/x86/amd/Kconfig           |  14 +-
>   drivers/platform/x86/amd/Makefile          |   3 +-
>   drivers/platform/x86/amd/hsmp/Kconfig      |  17 ++
>   drivers/platform/x86/amd/hsmp/Makefile     |   9 +
>   drivers/platform/x86/amd/hsmp/hsmp-acpi.c  | 219 ++++++++++++++
>   drivers/platform/x86/amd/{ => hsmp}/hsmp.c | 324 +++------------------
>   drivers/platform/x86/amd/hsmp/hsmp.h       |  82 ++++++
>   8 files changed, 377 insertions(+), 293 deletions(-)
>   create mode 100644 drivers/platform/x86/amd/hsmp/Kconfig
>   create mode 100644 drivers/platform/x86/amd/hsmp/Makefile
>   create mode 100644 drivers/platform/x86/amd/hsmp/hsmp-acpi.c
>   rename drivers/platform/x86/amd/{ => hsmp}/hsmp.c (72%)
>   create mode 100644 drivers/platform/x86/amd/hsmp/hsmp.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ebf03f5f0619..bdc390ddcc4b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -999,7 +999,7 @@ S:	Maintained
>   F:	Documentation/arch/x86/amd_hsmp.rst
>   F:	arch/x86/include/asm/amd_hsmp.h
>   F:	arch/x86/include/uapi/asm/amd_hsmp.h
> -F:	drivers/platform/x86/amd/hsmp.c
> +F:	drivers/platform/x86/amd/hsmp/
>   
>   AMD IOMMU (AMD-VI)
>   M:	Joerg Roedel <joro@8bytes.org>
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
> index f88682d36447..c2f16ccebec4 100644
> --- a/drivers/platform/x86/amd/Kconfig
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -5,19 +5,7 @@
>   
>   source "drivers/platform/x86/amd/pmf/Kconfig"
>   source "drivers/platform/x86/amd/pmc/Kconfig"
> -
> -config AMD_HSMP
> -	tristate "AMD HSMP Driver"
> -	depends on AMD_NB && X86_64 && ACPI
> -	help
> -	  The driver provides a way for user space tools to monitor and manage
> -	  system management functionality on EPYC server CPUs from AMD.
> -
> -	  Host System Management Port (HSMP) interface is a mailbox interface
> -	  between the x86 core and the System Management Unit (SMU) firmware.
> -
> -	  If you choose to compile this driver as a module the module will be
> -	  called amd_hsmp.
> +source "drivers/platform/x86/amd/hsmp/Kconfig"
>   
>   config AMD_WBRF
>   	bool "AMD Wifi RF Band mitigations (WBRF)"
> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
> index dcec0a46f8af..f0b2fe81c685 100644
> --- a/drivers/platform/x86/amd/Makefile
> +++ b/drivers/platform/x86/amd/Makefile
> @@ -5,7 +5,6 @@
>   #
>   
>   obj-$(CONFIG_AMD_PMC)		+= pmc/
> -amd_hsmp-y			:= hsmp.o
> -obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
> +obj-$(CONFIG_AMD_HSMP)		+= hsmp/
>   obj-$(CONFIG_AMD_PMF)		+= pmf/
>   obj-$(CONFIG_AMD_WBRF)		+= wbrf.o
> diff --git a/drivers/platform/x86/amd/hsmp/Kconfig b/drivers/platform/x86/amd/hsmp/Kconfig
> new file mode 100644
> index 000000000000..26096f901c22
> --- /dev/null
> +++ b/drivers/platform/x86/amd/hsmp/Kconfig
> @@ -0,0 +1,17 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# AMD HSMP driver
> +#
> +
> +config AMD_HSMP
> +	tristate "AMD HSMP Driver"
> +	depends on AMD_NB && X86_64
> +	help
> +	  The driver provides a way for user space tools to monitor and manage
> +	  system management functionality on EPYC server CPUs from AMD.
> +
> +	  Host System Management Port (HSMP) interface is a mailbox interface
> +	  between the x86 core and the System Management Unit (SMU) firmware.
> +
> +	  If you choose to compile this driver as a module the module will be
> +	  called amd_hsmp.
> diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x86/amd/hsmp/Makefile
> new file mode 100644
> index 000000000000..0e5e4cc68145
> --- /dev/null
> +++ b/drivers/platform/x86/amd/hsmp/Makefile
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Makefile for linux/drivers/platform/x86/amd/hsmp
> +# AMD Host System Management Port
> +#
> +
> +amd_hsmp-y			:= hsmp.o
> +amd_hsmp-$(CONFIG_ACPI)		+= hsmp-acpi.o
> +obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp-acpi.c b/drivers/platform/x86/amd/hsmp/hsmp-acpi.c
> new file mode 100644
> index 000000000000..90aa1bdbf7f1
> --- /dev/null
> +++ b/drivers/platform/x86/amd/hsmp/hsmp-acpi.c
> @@ -0,0 +1,219 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AMD HSMP Platform Driver
> + * Copyright (c) 2024, AMD.
> + * All Rights Reserved.
> + *
> + * This file provides ACPI parsing implementation for HSMP interface
> + */
> +
> +#include "hsmp.h"
> +
> +/* These are the strings specified in ACPI table */
> +#define MSG_IDOFF_STR           "MsgIdOffset"
> +#define MSG_ARGOFF_STR          "MsgArgOffset"
> +#define MSG_RESPOFF_STR         "MsgRspOffset"
> +
> +/* This is the UUID used for HSMP */
> +static const guid_t acpi_hsmp_uuid = GUID_INIT(0xb74d619d, 0x5707, 0x48bd,
> +						0xa6, 0x9f, 0x4e, 0xa2,
> +						0x87, 0x1f, 0xc2, 0xf6);
> +
> +static inline bool is_acpi_hsmp_uuid(union acpi_object *obj)
> +{
> +	if (obj->type == ACPI_TYPE_BUFFER && obj->buffer.length == UUID_SIZE)
> +		return guid_equal((guid_t *)obj->buffer.pointer, &acpi_hsmp_uuid);
> +
> +	return false;
> +}
> +
> +static acpi_status hsmp_resource(struct acpi_resource *res, void *data)
> +{
> +	struct hsmp_socket *sock = data;
> +	struct resource r;
> +
> +	switch (res->type) {
> +	case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
> +		if (!acpi_dev_resource_memory(res, &r))
> +			return AE_ERROR;
> +		if (!r.start || r.end < r.start || !(r.flags & IORESOURCE_MEM_WRITEABLE))
> +			return AE_ERROR;
> +		sock->mbinfo.base_addr = r.start;
> +		sock->mbinfo.size = resource_size(&r);
> +		break;
> +	case ACPI_RESOURCE_TYPE_END_TAG:
> +		break;
> +	default:
> +		return AE_ERROR;
> +	}
> +
> +	return AE_OK;
> +}
> +
> +static int hsmp_read_acpi_crs(struct hsmp_socket *sock)
> +{
> +	acpi_status status;
> +
> +	status = acpi_walk_resources(ACPI_HANDLE(sock->dev), METHOD_NAME__CRS,
> +				     hsmp_resource, sock);
> +	if (ACPI_FAILURE(status)) {
> +		dev_err(sock->dev, "Failed to look up MP1 base address from CRS method, err: %s\n",
> +			acpi_format_exception(status));
> +		return -EINVAL;
> +	}
> +	if (!sock->mbinfo.base_addr || !sock->mbinfo.size)
> +		return -EINVAL;
> +
> +	/* The mapped region should be un cached */
> +	sock->virt_base_addr = devm_ioremap_uc(sock->dev, sock->mbinfo.base_addr,
> +					       sock->mbinfo.size);
> +	if (!sock->virt_base_addr) {
> +		dev_err(sock->dev, "Failed to ioremap MP1 base address\n");
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
> +{
> +	struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *guid, *mailbox_package;
> +	union acpi_object *dsd;
> +	acpi_status status;
> +	int ret = 0;
> +	int j;
> +
> +	status = acpi_evaluate_object_typed(ACPI_HANDLE(sock->dev), "_DSD", NULL,
> +					    &buf, ACPI_TYPE_PACKAGE);
> +	if (ACPI_FAILURE(status)) {
> +		dev_err(sock->dev, "Failed to read mailbox reg offsets from DSD table, err: %s\n",
> +			acpi_format_exception(status));
> +		return -ENODEV;
> +	}
> +
> +	dsd = buf.pointer;
> +
> +	/* HSMP _DSD property should contain 2 objects.
> +	 * 1. guid which is an acpi object of type ACPI_TYPE_BUFFER
> +	 * 2. mailbox which is an acpi object of type ACPI_TYPE_PACKAGE
> +	 *    This mailbox object contains 3 more acpi objects of type
> +	 *    ACPI_TYPE_PACKAGE for holding msgid, msgresp, msgarg offsets
> +	 *    these packages inturn contain 2 acpi objects of type
> +	 *    ACPI_TYPE_STRING and ACPI_TYPE_INTEGER
> +	 */
> +	if (!dsd || dsd->type != ACPI_TYPE_PACKAGE || dsd->package.count != 2) {
> +		ret = -EINVAL;
> +		goto free_buf;
> +	}
> +
> +	guid = &dsd->package.elements[0];
> +	mailbox_package = &dsd->package.elements[1];
> +	if (!is_acpi_hsmp_uuid(guid) || mailbox_package->type != ACPI_TYPE_PACKAGE) {
> +		dev_err(sock->dev, "Invalid hsmp _DSD table data\n");
> +		ret = -EINVAL;
> +		goto free_buf;
> +	}
> +
> +	for (j = 0; j < mailbox_package->package.count; j++) {
> +		union acpi_object *msgobj, *msgstr, *msgint;
> +
> +		msgobj	= &mailbox_package->package.elements[j];
> +		msgstr	= &msgobj->package.elements[0];
> +		msgint	= &msgobj->package.elements[1];
> +
> +		/* package should have 1 string and 1 integer object */
> +		if (msgobj->type != ACPI_TYPE_PACKAGE ||
> +		    msgstr->type != ACPI_TYPE_STRING ||
> +		    msgint->type != ACPI_TYPE_INTEGER) {
> +			ret = -EINVAL;
> +			goto free_buf;
> +		}
> +
> +		if (!strncmp(msgstr->string.pointer, MSG_IDOFF_STR,
> +			     msgstr->string.length)) {
> +			sock->mbinfo.msg_id_off = msgint->integer.value;
> +		} else if (!strncmp(msgstr->string.pointer, MSG_RESPOFF_STR,
> +				    msgstr->string.length)) {
> +			sock->mbinfo.msg_resp_off =  msgint->integer.value;
> +		} else if (!strncmp(msgstr->string.pointer, MSG_ARGOFF_STR,
> +				    msgstr->string.length)) {
> +			sock->mbinfo.msg_arg_off = msgint->integer.value;
> +		} else {
> +			ret = -ENOENT;
> +			goto free_buf;
> +		}
> +	}
> +
> +	if (!sock->mbinfo.msg_id_off || !sock->mbinfo.msg_resp_off ||
> +	    !sock->mbinfo.msg_arg_off)
> +		ret = -EINVAL;
> +
> +free_buf:
> +	ACPI_FREE(buf.pointer);
> +	return ret;
> +}
> +
> +int init_acpi(struct hsmp_plat_device *plat_dev, struct device *dev)
> +{
> +	struct hsmp_socket *sock;
> +	u16 sock_ind;
> +	int ret;
> +
> +	plat_dev->is_acpi_device = true;
> +
> +	ret = hsmp_get_uid(dev, &sock_ind);
> +	if (ret)
> +		return ret;
> +	if (sock_ind >= plat_dev->num_sockets)
> +		return -EINVAL;
> +
> +	sock = &plat_dev->sock[sock_ind];
> +
> +	sock->sock_ind		= sock_ind;
> +	sock->dev		= dev;
> +
> +	sema_init(&sock->hsmp_sem, 1);
> +
> +	/* Read MP1 base address from CRS method */
> +	ret = hsmp_read_acpi_crs(sock);
> +	if (ret)
> +		return ret;
> +
> +	/* Read mailbox offsets from DSD table */
> +	return hsmp_read_acpi_dsd(sock);
> +}
> +
> +int check_acpi_support(struct device *dev, const struct acpi_device_id *amd_hsmp_acpi_ids)
> +{
> +	struct acpi_device *adev;
> +
> +	adev = ACPI_COMPANION(dev);
> +	if (adev && !acpi_match_device_ids(adev, amd_hsmp_acpi_ids))
> +		return 0;
> +
> +	return -ENODEV;
> +}
> +
> +int hsmp_get_uid(struct device *dev, u16 *sock_ind)
> +{
> +	char *uid;
> +
> +	/*
> +	 * UID (ID00, ID01..IDXX) is used for differentiating sockets,
> +	 * read it and strip the "ID" part of it and convert the remaining
> +	 * bytes to integer.
> +	 */
> +	uid = acpi_device_uid(ACPI_COMPANION(dev));
> +
> +	return kstrtou16(uid + 2, 10, sock_ind);
> +}
> +
> +void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
> +			u32 *value, bool write)
> +{
> +	if (write)
> +		iowrite32(*value, sock->virt_base_addr + offset);
> +	else
> +		*value = ioread32(sock->virt_base_addr + offset);
> +}
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> similarity index 72%
> rename from drivers/platform/x86/amd/hsmp.c
> rename to drivers/platform/x86/amd/hsmp/hsmp.c
> index 807a5066dacc..1df2b34ddbbd 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -10,18 +10,10 @@
>   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>   
>   #include <asm/amd_hsmp.h>
> -#include <asm/amd_nb.h>
> -#include <linux/delay.h>
> -#include <linux/io.h>
> -#include <linux/miscdevice.h>
> -#include <linux/module.h>
> -#include <linux/pci.h>
> -#include <linux/platform_device.h>
> -#include <linux/semaphore.h>
> -#include <linux/acpi.h>
> +#include "hsmp.h"
>   
>   #define DRIVER_NAME		"amd_hsmp"
> -#define DRIVER_VERSION		"2.2"
> +#define DRIVER_VERSION		"2.3"
>   #define ACPI_HSMP_DEVICE_HID	"AMDI0097"
>   
>   /* HSMP Status / Error codes */
> @@ -55,44 +47,8 @@
>   #define HSMP_DEVNODE_NAME	"hsmp"
>   #define HSMP_METRICS_TABLE_NAME	"metrics_bin"
>   
> -#define HSMP_ATTR_GRP_NAME_SIZE	10
> -
> -/* These are the strings specified in ACPI table */
> -#define MSG_IDOFF_STR		"MsgIdOffset"
> -#define MSG_ARGOFF_STR		"MsgArgOffset"
> -#define MSG_RESPOFF_STR		"MsgRspOffset"
> -
>   #define MAX_AMD_SOCKETS 8
>   
> -struct hsmp_mbaddr_info {
> -	u32 base_addr;
> -	u32 msg_id_off;
> -	u32 msg_resp_off;
> -	u32 msg_arg_off;
> -	u32 size;
> -};
> -
> -struct hsmp_socket {
> -	struct bin_attribute hsmp_attr;
> -	struct hsmp_mbaddr_info mbinfo;
> -	void __iomem *metric_tbl_addr;
> -	void __iomem *virt_base_addr;
> -	struct semaphore hsmp_sem;
> -	char name[HSMP_ATTR_GRP_NAME_SIZE];
> -	struct pci_dev *root;
> -	struct device *dev;
> -	u16 sock_ind;
> -};
> -
> -struct hsmp_plat_device {
> -	struct miscdevice hsmp_device;
> -	struct hsmp_socket *sock;
> -	u32 proto_ver;
> -	u16 num_sockets;
> -	bool is_acpi_device;
> -	bool is_probed;
> -};
> -
>   static struct hsmp_plat_device plat_dev;
>   
>   static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
> @@ -114,15 +70,6 @@ static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
>   	return ret;
>   }
>   
> -static void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
> -			       u32 *value, bool write)
> -{
> -	if (write)
> -		iowrite32(*value, sock->virt_base_addr + offset);
> -	else
> -		*value = ioread32(sock->virt_base_addr + offset);
> -}
> -
>   static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
>   			 u32 *value, bool write)
>   {
> @@ -321,6 +268,22 @@ static int hsmp_test(u16 sock_ind, u32 value)
>   	return ret;
>   }
>   
> +static int hsmp_cache_proto_ver(u16 sock_ind)
> +{
> +	struct hsmp_message msg = { 0 };
> +	int ret;
> +
> +	msg.msg_id	= HSMP_GET_PROTO_VER;
> +	msg.sock_ind	= sock_ind;
> +	msg.response_sz = hsmp_msg_desc_table[HSMP_GET_PROTO_VER].response_sz;
> +
> +	ret = hsmp_send_message(&msg);
> +	if (!ret)
> +		plat_dev.proto_ver = msg.args[0];
> +
> +	return ret;
> +}
> +
>   static long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>   {
>   	int __user *arguser = (int  __user *)arg;
> @@ -383,181 +346,6 @@ static const struct file_operations hsmp_fops = {
>   	.compat_ioctl	= hsmp_ioctl,
>   };
>   
> -/* This is the UUID used for HSMP */
> -static const guid_t acpi_hsmp_uuid = GUID_INIT(0xb74d619d, 0x5707, 0x48bd,
> -						0xa6, 0x9f, 0x4e, 0xa2,
> -						0x87, 0x1f, 0xc2, 0xf6);
> -
> -static inline bool is_acpi_hsmp_uuid(union acpi_object *obj)
> -{
> -	if (obj->type == ACPI_TYPE_BUFFER && obj->buffer.length == UUID_SIZE)
> -		return guid_equal((guid_t *)obj->buffer.pointer, &acpi_hsmp_uuid);
> -
> -	return false;
> -}
> -
> -static inline int hsmp_get_uid(struct device *dev, u16 *sock_ind)
> -{
> -	char *uid;
> -
> -	/*
> -	 * UID (ID00, ID01..IDXX) is used for differentiating sockets,
> -	 * read it and strip the "ID" part of it and convert the remaining
> -	 * bytes to integer.
> -	 */
> -	uid = acpi_device_uid(ACPI_COMPANION(dev));
> -
> -	return kstrtou16(uid + 2, 10, sock_ind);
> -}
> -
> -static acpi_status hsmp_resource(struct acpi_resource *res, void *data)
> -{
> -	struct hsmp_socket *sock = data;
> -	struct resource r;
> -
> -	switch (res->type) {
> -	case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
> -		if (!acpi_dev_resource_memory(res, &r))
> -			return AE_ERROR;
> -		if (!r.start || r.end < r.start || !(r.flags & IORESOURCE_MEM_WRITEABLE))
> -			return AE_ERROR;
> -		sock->mbinfo.base_addr = r.start;
> -		sock->mbinfo.size = resource_size(&r);
> -		break;
> -	case ACPI_RESOURCE_TYPE_END_TAG:
> -		break;
> -	default:
> -		return AE_ERROR;
> -	}
> -
> -	return AE_OK;
> -}
> -
> -static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
> -{
> -	struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
> -	union acpi_object *guid, *mailbox_package;
> -	union acpi_object *dsd;
> -	acpi_status status;
> -	int ret = 0;
> -	int j;
> -
> -	status = acpi_evaluate_object_typed(ACPI_HANDLE(sock->dev), "_DSD", NULL,
> -					    &buf, ACPI_TYPE_PACKAGE);
> -	if (ACPI_FAILURE(status)) {
> -		dev_err(sock->dev, "Failed to read mailbox reg offsets from DSD table, err: %s\n",
> -			acpi_format_exception(status));
> -		return -ENODEV;
> -	}
> -
> -	dsd = buf.pointer;
> -
> -	/* HSMP _DSD property should contain 2 objects.
> -	 * 1. guid which is an acpi object of type ACPI_TYPE_BUFFER
> -	 * 2. mailbox which is an acpi object of type ACPI_TYPE_PACKAGE
> -	 *    This mailbox object contains 3 more acpi objects of type
> -	 *    ACPI_TYPE_PACKAGE for holding msgid, msgresp, msgarg offsets
> -	 *    these packages inturn contain 2 acpi objects of type
> -	 *    ACPI_TYPE_STRING and ACPI_TYPE_INTEGER
> -	 */
> -	if (!dsd || dsd->type != ACPI_TYPE_PACKAGE || dsd->package.count != 2) {
> -		ret = -EINVAL;
> -		goto free_buf;
> -	}
> -
> -	guid = &dsd->package.elements[0];
> -	mailbox_package = &dsd->package.elements[1];
> -	if (!is_acpi_hsmp_uuid(guid) || mailbox_package->type != ACPI_TYPE_PACKAGE) {
> -		dev_err(sock->dev, "Invalid hsmp _DSD table data\n");
> -		ret = -EINVAL;
> -		goto free_buf;
> -	}
> -
> -	for (j = 0; j < mailbox_package->package.count; j++) {
> -		union acpi_object *msgobj, *msgstr, *msgint;
> -
> -		msgobj	= &mailbox_package->package.elements[j];
> -		msgstr	= &msgobj->package.elements[0];
> -		msgint	= &msgobj->package.elements[1];
> -
> -		/* package should have 1 string and 1 integer object */
> -		if (msgobj->type != ACPI_TYPE_PACKAGE ||
> -		    msgstr->type != ACPI_TYPE_STRING ||
> -		    msgint->type != ACPI_TYPE_INTEGER) {
> -			ret = -EINVAL;
> -			goto free_buf;
> -		}
> -
> -		if (!strncmp(msgstr->string.pointer, MSG_IDOFF_STR,
> -			     msgstr->string.length)) {
> -			sock->mbinfo.msg_id_off = msgint->integer.value;
> -		} else if (!strncmp(msgstr->string.pointer, MSG_RESPOFF_STR,
> -				    msgstr->string.length)) {
> -			sock->mbinfo.msg_resp_off =  msgint->integer.value;
> -		} else if (!strncmp(msgstr->string.pointer, MSG_ARGOFF_STR,
> -				    msgstr->string.length)) {
> -			sock->mbinfo.msg_arg_off = msgint->integer.value;
> -		} else {
> -			ret = -ENOENT;
> -			goto free_buf;
> -		}
> -	}
> -
> -	if (!sock->mbinfo.msg_id_off || !sock->mbinfo.msg_resp_off ||
> -	    !sock->mbinfo.msg_arg_off)
> -		ret = -EINVAL;
> -
> -free_buf:
> -	ACPI_FREE(buf.pointer);
> -	return ret;
> -}
> -
> -static int hsmp_read_acpi_crs(struct hsmp_socket *sock)
> -{
> -	acpi_status status;
> -
> -	status = acpi_walk_resources(ACPI_HANDLE(sock->dev), METHOD_NAME__CRS,
> -				     hsmp_resource, sock);
> -	if (ACPI_FAILURE(status)) {
> -		dev_err(sock->dev, "Failed to look up MP1 base address from CRS method, err: %s\n",
> -			acpi_format_exception(status));
> -		return -EINVAL;
> -	}
> -	if (!sock->mbinfo.base_addr || !sock->mbinfo.size)
> -		return -EINVAL;
> -
> -	/* The mapped region should be un cached */
> -	sock->virt_base_addr = devm_ioremap_uc(sock->dev, sock->mbinfo.base_addr,
> -					       sock->mbinfo.size);
> -	if (!sock->virt_base_addr) {
> -		dev_err(sock->dev, "Failed to ioremap MP1 base address\n");
> -		return -ENOMEM;
> -	}
> -
> -	return 0;
> -}
> -
> -/* Parse the ACPI table to read the data */
> -static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
> -{
> -	struct hsmp_socket *sock = &plat_dev.sock[sock_ind];
> -	int ret;
> -
> -	sock->sock_ind		= sock_ind;
> -	sock->dev		= dev;
> -	plat_dev.is_acpi_device	= true;
> -
> -	sema_init(&sock->hsmp_sem, 1);
> -
> -	/* Read MP1 base address from CRS method */
> -	ret = hsmp_read_acpi_crs(sock);
> -	if (ret)
> -		return ret;
> -
> -	/* Read mailbox offsets from DSD table */
> -	return hsmp_read_acpi_dsd(sock);
> -}
> -
>   static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
>   				    struct bin_attribute *bin_attr, char *buf,
>   				    loff_t off, size_t count)
> @@ -670,8 +458,15 @@ static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
>   {
>   	const struct attribute_group **hsmp_attr_grps;
>   	struct attribute_group *attr_grp;
> +	int ret;
>   	u16 i;
>   
> +	ret = hsmp_cache_proto_ver(0);
> +	if (ret) {
> +		dev_err(dev, "Failed to read HSMP protocol version\n");
> +		return ret;
> +	}
> +
>   	hsmp_attr_grps = devm_kcalloc(dev, plat_dev.num_sockets + 1,
>   				      sizeof(*hsmp_attr_grps),
>   				      GFP_KERNEL);
> @@ -706,12 +501,18 @@ static int hsmp_create_acpi_sysfs_if(struct device *dev)
>   	if (!attr_grp)
>   		return -ENOMEM;
>   
> -	attr_grp->is_bin_visible = hsmp_is_sock_attr_visible;
> -
>   	ret = hsmp_get_uid(dev, &sock_ind);
>   	if (ret)
>   		return ret;
>   
> +	ret = hsmp_cache_proto_ver(sock_ind);
> +	if (ret) {
> +		dev_err(dev, "Failed to read HSMP protocol version\n");
> +		return ret;
> +	}
> +
> +	attr_grp->is_bin_visible = hsmp_is_sock_attr_visible;
> +
>   	ret = hsmp_create_attr_list(attr_grp, dev, sock_ind);
>   	if (ret)
>   		return ret;
> @@ -719,22 +520,6 @@ static int hsmp_create_acpi_sysfs_if(struct device *dev)
>   	return devm_device_add_group(dev, attr_grp);
>   }
>   
> -static int hsmp_cache_proto_ver(u16 sock_ind)
> -{
> -	struct hsmp_message msg = { 0 };
> -	int ret;
> -
> -	msg.msg_id	= HSMP_GET_PROTO_VER;
> -	msg.sock_ind	= sock_ind;
> -	msg.response_sz = hsmp_msg_desc_table[HSMP_GET_PROTO_VER].response_sz;
> -
> -	ret = hsmp_send_message(&msg);
> -	if (!ret)
> -		plat_dev.proto_ver = msg.args[0];
> -
> -	return ret;
> -}
> -
>   static inline bool is_f1a_m0h(void)
>   {
>   	if (boot_cpu_data.x86 == 0x1A && boot_cpu_data.x86_model <= 0x0F)
> @@ -791,8 +576,6 @@ MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
>   
>   static int hsmp_pltdrv_probe(struct platform_device *pdev)
>   {
> -	struct acpi_device *adev;
> -	u16 sock_ind = 0;
>   	int ret;
>   
>   	/*
> @@ -809,46 +592,33 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>   		if (!plat_dev.sock)
>   			return -ENOMEM;
>   	}
> -	adev = ACPI_COMPANION(&pdev->dev);
> -	if (adev && !acpi_match_device_ids(adev, amd_hsmp_acpi_ids)) {
> -		ret = hsmp_get_uid(&pdev->dev, &sock_ind);
> -		if (ret)
> -			return ret;
> -		if (sock_ind >= plat_dev.num_sockets)
> -			return -EINVAL;
> -		ret = hsmp_parse_acpi_table(&pdev->dev, sock_ind);
> +
> +	ret = check_acpi_support(&pdev->dev, amd_hsmp_acpi_ids);
> +	if (!ret) {
> +		ret = init_acpi(&plat_dev, &pdev->dev);
>   		if (ret) {
> -			dev_err(&pdev->dev, "Failed to parse ACPI table\n");
> +			dev_err(&pdev->dev, "Failed to initialize HSMP interface.\n");
>   			return ret;
>   		}
> -		/* Test the hsmp interface */
> -		ret = hsmp_test(sock_ind, 0xDEADBEEF);
> +
> +		ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
>   		if (ret) {
> -			dev_err(&pdev->dev, "HSMP test message failed on Fam:%x model:%x\n",
> -				boot_cpu_data.x86, boot_cpu_data.x86_model);
> -			dev_err(&pdev->dev, "Is HSMP disabled in BIOS ?\n");
> +			dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
>   			return ret;
>   		}
>   	} else {
>   		ret = init_platform_device(&pdev->dev);
>   		if (ret) {
> -			dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
> +			dev_err(&pdev->dev, "Failed to initialize HSMP interface.\n");
>   			return ret;
>   		}
> -	}
> -
> -	ret = hsmp_cache_proto_ver(sock_ind);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Failed to read HSMP protocol version\n");
> -		return ret;
> -	}
>   
> -	if (plat_dev.is_acpi_device)
> -		ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
> -	else
>   		ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
> -	if (ret)
> -		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
> +		if (ret) {
> +			dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
> +			return ret;
> +		}
> +	}
>   
>   	if (!plat_dev.is_probed) {
>   		plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> new file mode 100644
> index 000000000000..23629ccb1fb0
> --- /dev/null
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -0,0 +1,82 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * AMD HSMP Platform Driver
> + * Copyright (c) 2024, AMD.
> + * All Rights Reserved.
> + *
> + * This file provides a header implementation for HSMP interface
> + */
> +
> +#ifndef _HSMP_H
> +#define _HSMP_H
> +
> +#include <asm/amd_nb.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/platform_device.h>
> +#include <linux/semaphore.h>
> +#include <linux/acpi.h>
> +#include <linux/miscdevice.h>
> +
> +#define HSMP_ATTR_GRP_NAME_SIZE 10
> +
> +struct hsmp_mbaddr_info {
> +	u32 base_addr;
> +	u32 msg_id_off;
> +	u32 msg_resp_off;
> +	u32 msg_arg_off;
> +	u32 size;
> +};
> +
> +struct hsmp_socket {
> +	struct bin_attribute hsmp_attr;
> +	struct hsmp_mbaddr_info mbinfo;
> +	void __iomem *metric_tbl_addr;
> +	void __iomem *virt_base_addr;
> +	struct semaphore hsmp_sem;
> +	char name[HSMP_ATTR_GRP_NAME_SIZE];
> +	struct pci_dev *root;
> +	struct device *dev;
> +	u16 sock_ind;
> +};
> +
> +struct hsmp_plat_device {
> +	struct miscdevice hsmp_device;
> +	struct hsmp_socket *sock;
> +	u32 proto_ver;
> +	u16 num_sockets;
> +	bool is_acpi_device;
> +	bool is_probed;
> +};
> +
> +#ifdef CONFIG_ACPI
> +int hsmp_get_uid(struct device *dev, u16 *sock_ind);
> +void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
> +			u32 *value, bool write);
> +int check_acpi_support(struct device *dev, const struct acpi_device_id *amd_hsmp_acpi_ids);
> +int init_acpi(struct hsmp_plat_device *plat_dev, struct device *dev);
> +#else
> +static inline void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
> +				      u32 *value, bool write)
> +{
> +}
> +
> +static inline int hsmp_get_uid(struct device *dev, u16 *sock_ind)
> +{
> +	return -ENODEV;
> +}
> +
> +static inline int check_acpi_support(struct device *dev,
> +				     const struct acpi_device_id *amd_hsmp_acpi_ids)
> +{
> +	return -ENODEV;
> +}
> +
> +static inline int init_acpi(struct hsmp_plat_device *plat_dev, struct device *dev)
> +{
> +	return -ENODEV;
> +}
> +#endif
> +#endif

