Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013062.outbound.protection.outlook.com [40.93.201.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA4C40E8DE;
	Tue, 16 Jun 2026 08:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781598545; cv=fail; b=nVkeZ8AOk3DTZ2BwMTK7EkAtmRjnHNhFPfeOzjQuu2NSbAEXiF+p77Wt67LhTDnTJ7QOVdJS4oCvQ7mgVnfD2mEvrraK2kOOBni1iTojZjfX4OTS684MSLmkoG4oz0ODB1yf0/OKxORzN/iOvfxKe/uuwoumQecybY6A387/LWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781598545; c=relaxed/simple;
	bh=ihQimR++JXcjNYkL9BZK6/Lc+NmERum3f/OSB4Bd3pA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WXCDlaUQt7zgolKxTofeI9AvDkZimiVDzar3Ra9cjcA1QBQPxjAyMZvkfjiOhEV2zNDgItiZDjcczqBJ4mahrP2uNMDcBfLzxctiwBDiiRkX7FvBHmHp+tqGF2Bxp9YLaD2wjpMznDAJFnkaLvHjp+XxJUnciaZ12Ej9qOr38iA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=p3G4koWt; arc=fail smtp.client-ip=40.93.201.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="p3G4koWt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q6iYJyJBjFPNWONwyo3+O5cgWGN061J6+5ptm9hPtlkkEUOWK0qYndJ/nrsjAHPtTkahSCToKt178z7RF6g9npccblSTXUWBnEASKzHvmv2YE9IHB+bnoFDVZD/+bYZSiXruLtgeeuKepQApWCRNqu7TyOexSsaVAI1FsaNbMNqCwiqqxMMoziNHrRtxVj/VEzmqZ419DchHaaYhPF+A3Val63dsl78hUbfZE0pDDsqGHr4chbybdS5+ri74LTPwFnGf3aFZRGThuFUfe++8QeqyjRBeH/VXsP3CBFi7++Z3oHSl+TuxRKN6wzhAd1XfpKK1SQlGuYrCsB+HbYCleQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nX1/Y/wVCi/F9Q9O/un1W6TYR1JXV4/XoRh+Ut4Dht0=;
 b=rV++LDXvvJwSGdiSrOkdBCsGmqJl9BNYSIT5uSwhNMaYvV/TqqJMHcZ05SbqHO55FvGBrGHmusOsfeSFaigth3CKpxt3pxA+9MMQgf7LNzIwIyR0vl1dZ2YuCPNc2RwBLab27g7NmyAGgJ7ByMCW7ytyldVjqBTFw2mqGeZ08LJ/el5sCrxnSxt0dWe1kIyFlrJsGAYCQ79xj3ywQsZq1QthBfn7sfSMQkDAkhcqkaxwBJqE0TTnqwEUEYOE1nxPDKx4pS90zd8zbu7PBl8vxuni7EriSc4QCadQqFhnC965DYpebSlb8ZYMG7kdLiWR8eRAapr0qPv29Y851o9cbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nX1/Y/wVCi/F9Q9O/un1W6TYR1JXV4/XoRh+Ut4Dht0=;
 b=p3G4koWtImntcxlV1kKbiUEISZ/vBjSYLaBePBH8Vr/P5SohAL3BAcXDPV13aDnaeP62nDlROUaExx/Pwv6QqT8w8PbQx62jkwwTKbK7PAFyqMJYM07snH+hLTXREq+e9J6JlURP8Uk61dF156SxNeauOh42NQJli9mwWnXpMqI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by SN7PR12MB6912.namprd12.prod.outlook.com (2603:10b6:806:26d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 08:29:00 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 08:29:00 +0000
Message-ID: <8b8ab5dd-3f9c-4f1e-b853-97c381c885da@amd.com>
Date: Tue, 16 Jun 2026 13:58:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] platform/x86/amd/hsmp: Harden ACPI probe, metric
 DRAM, and socket teardown
To: Muralidhara M K <muralidhara.mk@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260613191755.2358969-1-muralidhara.mk@amd.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <20260613191755.2358969-1-muralidhara.mk@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0042.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::10) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|SN7PR12MB6912:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f7e4ee7-f198-44ad-b351-08decb8150a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	b3bfaxPjBX5Yd9l6xFrLkK7URkGvE//6vkZCaTOX+/qLPsKqPeOy8K9ThAQBevF8snjNFgStUeq13FYgGe85OUnLhLBdneSlUMsbpKJ7VibSNKj3FLwhIdRGifC0JRfGG8L6upsnB8Nh3E35/k+F74bW9nO9ocQuiTelmuo7mCrpjnr9oPcyaA4AlFzoKgAKtctzBdrLcLkU4VJ6G8oIPIGRFxnpipdRQLboBFMn5k/ivA/GPaXWNQoNzZuin5cq//kxlLqrSQ5U/Kx9mwtl9bOXN2rrxrWoGTsbMep6SFW1nvSvOmOYXy4WWC/PRa6xWo7WfA6JUFfVqnCXsN0lZ/8aNZ/m9qcjJSsdpVcQLiJitFdJOJu/r3MXUrVOwc6g1ELERUje1wFotY/BKHL8Jsn0iCvpBN220TdwXiXN/bCWwPjR3qweKxJsHJxC3/k5PRraStSGwnGPxDsuVUyWzgwUqWKVie6bsYf2IL00iDXo7dDSjTxWoQ5cbvPHtr2Rl8pIj1lkejTvHagZH0ccXIHP916ePKhjbAi3nA7zEFkQOTPo5V73vf8mp20Q8tZERnIajFo2hRCb88rgZW2UrjVOmovsAjMp9SmZwUkAEZ9E+bWIlG//aML9WbpZCHXCDlioGKwOcLBLFmCuyNMnZ3y8gmfLy3/kV4s/aaIWZADo1mw70EFvyrC50NvKP9D8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnM1K1NUREdxZjhEYjZsMDc4ODdhdnhuQ1lJUzJvUGZ3K0pDbHRRb2RTNTZi?=
 =?utf-8?B?WmZPeURlOWxjN21ET1l6S3J2bTdNOTBjaHhOTm9HVEErbCsyMHAvYjBzd1dH?=
 =?utf-8?B?T2t1NVRXOW04RW12V3RyL2xYU2ZUd0hNNnFYZmdkRFB5ekNlUWdOekl0RVNB?=
 =?utf-8?B?aHdvaENGVWJTQ1hGSmtsMUdvdFc2c1JSRGdpVmNMMzlRV3JrekIwUjdkVE9a?=
 =?utf-8?B?TmV2YlZwNVB3MkxYTk5YcHVQeGNaUnVGUXRQd3g0K0JtZHpqZXY2TS9wRFhG?=
 =?utf-8?B?ZHpFYmRqcG1OR3FBVlE0K2IxUjlQR29Qdi9YYk5EZEI1Wm1JUU9ibEdUejcz?=
 =?utf-8?B?bWNZS2ZBbkVBOVNPLzV6NDN4aDJCdWg0dE9IZjJ5ZFpNRmR5Y3dRdkp5WGRv?=
 =?utf-8?B?cE95elluWndhRXVMTmZNQkRjZkpMRlpQOW9waGhKUVhyeUZ0YzFZd0FSOHY2?=
 =?utf-8?B?anFOTk16OUNEb1BKRTlQekd3L0pDQUJMNHFNNHkxdjgrbm4vdG9hdzIweTR2?=
 =?utf-8?B?T0wzR01aNENTeEdINGF0OGVUS1VReGlINVBlQzNWWUQybWNtVHNlVTBuUmJU?=
 =?utf-8?B?YlV4ZThHNGMzQmEvblZGUmhOdFRJRjh4ekU2QXlwelpIdmdIdSt2WVNpYTFx?=
 =?utf-8?B?YWtyNGJ3cTFxMlh2MDlKQ0tyWU5PRGRvRVgxSUdseXh5ZlRpV2NUcDJaeUhs?=
 =?utf-8?B?WnJRTVo5WHRIaXMrdFJZNHNDWVBDbDhCUjRHMllsbkQzSGtkVUMyQ1JJK09L?=
 =?utf-8?B?YVBtSUxidzhYTDM5dENpWjRycncrOUdQQnpLTVllcEdzTVQrV1dRcUFrS2dk?=
 =?utf-8?B?elRFOGs5ckdnS0pZcU5YK1NzMGhGOG15eUhjTkliVnFmTFNkbTFyeEVnNUVP?=
 =?utf-8?B?c2p3Z0VwZHpTTnF6MTNNb3F5a2Rleno2OTlyelBKNWlNL0lUYndhK1Q5djZk?=
 =?utf-8?B?OVZDcDFpODhZS1lOT1NremdwUDE5SFlyc21UaG5iUjZ3d2RIMkNtam5vN09x?=
 =?utf-8?B?MndTSVpuTUdTVUthYUZYK01jVi9kVUdWN1BoR1VJZFVheS84L1o5M3VFMmxO?=
 =?utf-8?B?ZFNNVlM0ZWxpUGJyTmNaU1VKWFUzSWpTWkdkNUdsRDd4cFU2VVJxcU5JNmdK?=
 =?utf-8?B?Z0xKUzVoU0ZiQm5TbGNlWjdHVWw5UERWVFR2cVVoazVUQmpZbzRVNWRSQ3hN?=
 =?utf-8?B?SjhlMy9OYTVwSjg2QW8zV01XNjZsMUhDRVFSY3c4dktScE5ZK3ArMTRYN01p?=
 =?utf-8?B?b3VIOVpMVE45TzlRcWh1K2lFNTFJYkxyUzU1eUpXTjZ1VlBJckpXK01OM01m?=
 =?utf-8?B?ZjdOVC9ORGxCdzBicjdwNFlYcU1jMk9MYURTVzFObE54SEtSY2ZSaCtKaWtJ?=
 =?utf-8?B?Q2dkKzJHNnU4WFV0VXh0SEVNUXJIeVlZcWZNUXNSblJESG1oaW41WkdCbFdm?=
 =?utf-8?B?aTVDY2toZ0lrQ3IxMnFWcktjekNSTEZKQm42UytKSENSVmZPdldpb1NUSWtj?=
 =?utf-8?B?NUFKdFRWNmlOWitjZ1JXNzlHSDJubDg4eVdzRSs1YmFSVUFBcGtPZ1E3cE9W?=
 =?utf-8?B?K2hKT2QyNFJiZCtaRCtTeitqMTIvb1hodXBhMTQ1WGFEcVZSbUlmN2U0N1gy?=
 =?utf-8?B?UUx6UFViSStnbjc0QkhBSHEyVlZWRHIwZVd5RC82Q3g3b3VhTC9OQzdJTjJI?=
 =?utf-8?B?U1JaeFgrRDFsYWtrbzBPV3dkb2Q3L1N4OWJpWVdmalhQK0pCM09VRjJWdGpV?=
 =?utf-8?B?M1loUDlQeG56WEZhZUx6cFRJRUhWazY1M2RNWGFibTVRemlvZndJMDBXZnpy?=
 =?utf-8?B?c1JIM0p5Mnk1UE9lOGIwcXJoZ0djOGhydGt4VmhwSmovTVVIeHpMNW9VNVNL?=
 =?utf-8?B?UHE5OXRpa1JvWWRKcFlGblBCMGp4MVBHckF5dW9QWmNqZDgrdTk1OVBnTWFr?=
 =?utf-8?B?eWNqdUF2cHorTGgzVHlFZGx6RUdLMnY5MG5QZmZrcE94M3g5VVN6NjJBRWJy?=
 =?utf-8?B?ZmFEejkxZ3owSXRjNlcrV1kzMXFGaHlnL1dZQ3FNWVNYUHQreis2ODJlQmVR?=
 =?utf-8?B?d3FUUmR1QmFDK3RSei90MFhKZ3JkYXBNNGt2UEV2QmZFWUY2TDZDNmNMUHY2?=
 =?utf-8?B?S0o3OVd5bnZNTGJlUnRTYlZaTzdERDFFMmwxcHBneGtuR0NJRkpZQ2RIUzJu?=
 =?utf-8?B?N0FBU01vdXhqc0dqYVJ1a0pnQ1gzY0p2S0I1NFZ3S0lZUytEK3lNekpXbHlM?=
 =?utf-8?B?aXdjMzlvTFNWQ1lYcXBzMC9hOEY2VUR5USszOXJxWmt4QWptL1JiekE4akVG?=
 =?utf-8?B?clMrejNRRGNjRHN2Q3poU0RONklZMG8rYjV0cUlkUDBGM1ZJWFJtUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7e4ee7-f198-44ad-b351-08decb8150a8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 08:29:00.2804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PXlxmgnxzD4VOqxdwuXRLxgkgdNYQitmQTEZGsGPYDf6bijHSGmVZr6z6eakQrpmOLjoqz/XilXyBiux383wBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6912

Hi Ilpo,
Could you please check and review.

On 6/14/2026 12:47 AM, Muralidhara M K wrote:
> This series tightens concurrency and lifetime management in the ACPI-backed
> AMD HSMP platform path so probe/remove races cannot corrupt global probe state,
> leak metric-table DRAM mappings, or tear down shared resources while readers
> might still be active.
> 
> Patch 1 introduces a dedicated probe mutex around ACPI probe, remove, and
> init_acpi(), replacing ad-hoc synchronization on the global is_probed handshake.
> lockdep_assert_held() documents the locking contract for init_acpi().
> 
> Patch 2 switches metric table DRAM from devm_ioremap() to ioremap() with
> explicit init/teardown helpers, and embeds a per-socket mutex for metric reads.
> The legacy platform driver wires the same helpers so non-ACPI builds stay
> consistent.
> 
> Patch 3 replaces the global is_probed flag with miscdevice registration state,
> refcounts ACPI socket platform devices with kref, and runs coordinated release
> on the final put: misc deregistration when appropriate, metric unmap, and socket
> array free. Socket storage uses kcalloc() with careful failure cleanup before
> any kref is published.
> 
> Muralidhara M K (3):
>    platform/x86/amd/hsmp: Serialize ACPI HSMP is_probed with a probe
>      mutex
>    platform/x86/amd/hsmp: Add explicit metric DRAM mapping and per-socket
>      mutexes
>    platform/x86/amd/hsmp: ACPI HSMP refcounted sockets and coordinated
>      release
> 
>   drivers/platform/x86/amd/hsmp/acpi.c | 87 +++++++++++++++++++++++-----
>   drivers/platform/x86/amd/hsmp/hsmp.c | 38 +++++++++++-
>   drivers/platform/x86/amd/hsmp/hsmp.h |  9 ++-
>   drivers/platform/x86/amd/hsmp/plat.c |  3 +
>   4 files changed, 119 insertions(+), 18 deletions(-)
> 

