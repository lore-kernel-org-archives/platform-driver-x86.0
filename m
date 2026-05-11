Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013010.outbound.protection.outlook.com [40.93.196.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D5036E494;
	Mon, 11 May 2026 11:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778498433; cv=fail; b=FIvC8eNBOmXasvAlWpwtklLQa3xl/enkJl5Anhrd3hZSskADMqqxHY1aUrCzikCOwOf6nT68louQsN3qEN3uztN3zhC58/8oY367223j5fdMRYj2z3vR4cmmVW3cbIFz5Ud/IWaeFhk5RByE9TX5z+W1GpdIEgxpXonbceSCVfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778498433; c=relaxed/simple;
	bh=7jGmI3Vu5Tg9+daggFnhtrnirN8bIbcKdCXGv59j8Q4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SegWC620pSZXxqBZsTBh5sRraVNx+kkgvw57wu+gmQKfIFNST8V6AcVJgap9F8iGMd8h6+puYuUcisyccHTNuXKhQ+w+l6m1eR1LAilq5vCK8uxcTjqYdqFkfAAC9dPZydZTivrqt9m9lBD4XwUrHVQgX1aevo3XXaPeBD2Zjv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Qc+2qR8s; arc=fail smtp.client-ip=40.93.196.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Qc+2qR8s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qUkSSnNDSyGYYNoACiPatUKZZJuYy3tzSv38UkOapz6XX+TGtsde6dumxjHr6iz4HCjpLkPTkUYKn4xoBfm7qKxtYfRdzVjFGIX8Q/WWez4ktrVKMNWe1oZW22fDuSi4O7HfdXOerD+SZg3kOia0TDBCqJUGLNn/wVmAigkYgwlVD6anH1dObaqaM131W9O34XR4WodfaTyQX48LlRbYuLRyfuWr7XuY4wPURJIr5hAhg8B/YTCFNcZ/Y7fuL/IZmtQQeE0A0t/tPdzw7vnP+e5JHsJBk5wG1jxiyNSZezOaxNZ2uyU8MGTf663e6Bz42W45qRxjMDwtIDltinlTCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5vEyQ9hqpnLXAEbizicIc/pa2uDDZUm7AjhE5IEJ0Lk=;
 b=kb6PKreLou59cP1lgsZKGN4JYOq2xvZCGZI+7qTsVyS+74vNiqrlLO1F2qioWN+DKBTxY5lTp6jUr88ewDjuJ4quNkzsfhpKAEV55PSstDvMb0SaKcYvqLaLf94N8FDhB9yK4v7gNXzhGeWpECTJ58V3fQup8JG2rv3PaUxXjVSqmps9I3tKLrEJbVaBSoEAdz/SGiEzhCz7I4LeR1IJx9DWxPnc8fDTgp1VrrcjmN2pIIeq5Kq6UrIllMUMtdP6ijT8LFRw2/YRRPiTdAga/u5XlQy87zxLOyMmAD1PjAl1YbTPeq6IXD+aqi5Bb1cw91DmKRvIhR9FijVyIkLUiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vEyQ9hqpnLXAEbizicIc/pa2uDDZUm7AjhE5IEJ0Lk=;
 b=Qc+2qR8s+fROzhfHlFru8iLgvaogdpANLVDGyjOwqoZ7vb+ge/DcW+3fluX/UgtgZij2lm/cHKCq9aKQlS+0Yj5cm0hehYajDslx02qrHZz7ubRUcPbA1rGRIlWJFDBmiHPS/jW4bDTg2mD+4p7g+u7XW3OlTnfPppD28EHXgh0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by DS7PR12MB6047.namprd12.prod.outlook.com (2603:10b6:8:84::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 11:20:29 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 11:20:28 +0000
Message-ID: <0fbf4355-4ba0-4cc9-908d-001747bcfc67@amd.com>
Date: Mon, 11 May 2026 16:50:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] AMD HSMP: metrics table improvements and Family
 1Ah Model 50h-5Fh support
To: Muralidhara M K <muralidhara.mk@amd.com>, ilpo.jarvinen@linux.intel.com,
 gregkh@linuxfoundation.org, rafael@kernel.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev
References: <20260427155129.545327-1-muralidhara.mk@amd.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <20260427155129.545327-1-muralidhara.mk@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0249.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::15) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|DS7PR12MB6047:EE_
X-MS-Office365-Filtering-Correlation-Id: cebcac0f-8a3c-42f7-d840-08deaf4f4e3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|3023799003|11063799002|56012099003|18002099003|18092099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	Z8JVBNJ2PoiWXQJUyiiUU8naCrMksSp0y70i+Uz2Qrnj/HOv8/UvayrdZzpd6sKOdHptuSvIil8EXeEmTBx+FrY5IO1HVv0jP/hRpCj6SP25VE0LtLeB+KCQVLcYHWzrxLSTV2nPcQxQjl2NaQPgSw5nYlRLEq0WU+DNqULHo17yYbWPZUdHppVi8lUPOicB7KfG0xzKJccqZu0WghhiWck1g2QnY8tC+Ncr6a9Rt4g4fZAO3i4BtRvg+eRUnFp2yc5nnVhxAho8Nghwm/yxeQ6uX4n5adsD7i2crugfaMwBwGksJS6KW4xc5KC0Rnu3QGHZPslMu8PqbFqBZxRfV5FFlXcKXf79EhNenCxais4AJ356qA57qpkbJKuS4XlNPtGtwldk7AErmGTuZsRtr5w8EfD6rk7ZPGqfDl4SQXUiErzzhocr+1cAodfvV0xKnTt2+35UIc9NXUL0kSXhPS1e3gVQFmbBXjsEQYZgNn7pDUpvaSHg4Am9enn+phmDTIihPr/KmkDbrRZkPdrx+IDC869u2s5KRMABRBPsBs/sTPhLj2fHX0RW9wXRN01LnO/HwTDVmYEVfKrXzUM7QVHLMnziPjRkb0XbPqhbeyh0Nihkd9EeGjqrnI82iwJqqQ9dxHLSNkKpyeYrDLUUa8AYjHAJ9e0HKB/dcmyqGPH4zeCVLMYzx7wG10OXlpeMC0GZb1uPfrq4RLFpagyvwA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(3023799003)(11063799002)(56012099003)(18002099003)(18092099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eW1idW1LLysvZHdTbkRzbmxnL0hic1RYOG1QeFQzakxGZ2tabDFiaXdFRUNa?=
 =?utf-8?B?cVFkK2s3Sk5iZ2hOc1VVMlBhQWFETlhrQnJ0eEx0U29razhQSG4yeHFldkE3?=
 =?utf-8?B?WWRzMkt0RTZpSC9TR2pRb2JLSHZGcGpZTFNPa0tuS29BenV0QlRPK21rN1dh?=
 =?utf-8?B?V0gzRExFUlc3ellxNEUxNlIxTGZVREErN001R1FZZi9FS2VJK0VVaWt5VWUv?=
 =?utf-8?B?WE9vaXFqUC9hbXYzRkhidlV2dXZ4Sm9RWUZhUERrakhWanhIZHZZVHI1UUI5?=
 =?utf-8?B?WHpCYnRLN2Y4YkVGSG9sZkdGNjZ2TFJoS0tFTzBxcFVhVFdyMjBWQWsrTWpp?=
 =?utf-8?B?NnJGdGs3U0pYa2NFNCtSK0dqTmJBbnM3NEZHZkVVS01GMitRVHhrdjhqMFdG?=
 =?utf-8?B?RzNhMzRmMWh6SjlNeS9KbTZybm9pYUQwQklWSmFIYTJHZjM1WlVBaXk4dDVk?=
 =?utf-8?B?eVlIaDhqZzVRU01JaGhRMklqZyt4bGg1V2t5QyswUmx4WW9tZ2VraHRFZEdE?=
 =?utf-8?B?T3h1czFLMmk1TnNwbzdxQzgzOHRaMldWMjNENVJic3l5YTJ6cVhPV01qV0hv?=
 =?utf-8?B?Mld2TFJSL3djdElBQ1JoTXNYbUtKV0JLNXZTU0dqVkpkVWdSaDE2TGhwU2Vv?=
 =?utf-8?B?V1hzUVI2eUVOOFZzaCsyUXlXRXowNWczdFVDT3VhRzVoUmxUeTdOZ3FwZjhS?=
 =?utf-8?B?cDhFWXNyMUxiRkdaaTRHdFppQ24yTkJoN1phcExKNnVLbVYzdUZMdFBhMk85?=
 =?utf-8?B?bU1yb0YrOUJuSW5LK0gyQU10bWNaRWVOOGVMMkdFc1lSU2FaL09OUXgyWTB3?=
 =?utf-8?B?R0ErdDRnWlBaTUpuMDBQZUVQMHltbFoxMWM4WWtmQzh3Q25Od3RrT0ZBQ3RP?=
 =?utf-8?B?MnBNUlNKdU9ZWXVISUZRdkhhdG8wMGNpSnE3UkhPb091L3I0bjlnbjlyeU8y?=
 =?utf-8?B?SVJWWERMZS9MdzVRZGFvcjI3MVlGTGUxUGlkQVlMN3RRUkxHMzJIWXFwcWRt?=
 =?utf-8?B?cFpmQzgyNnFyWTBQcDR0RWxyQzFMUmdYZ213WDRSL1llb2h6SzMwSlNxeWd2?=
 =?utf-8?B?U1NzUEEyRElKSy9yYkJrdFlRc0hXU29lSjNHeFhqRU5BWHpGSXJCQ1VXcU1Q?=
 =?utf-8?B?QWpJTFhiNHBYWCs5OXRoMUtGRktxTHdsUU01SWcxQUpWZGZpU2o2NmhteXYr?=
 =?utf-8?B?Zk5Yd1IrYTMyeW9lbDgybXo1YjNWUE0wREVZWktwNUlkNExGRTNOekl6V080?=
 =?utf-8?B?Q25LenFQVzZYdkxxamhFZ0E5ZG44bmNyY3FXWnd2NTg5bzUxTGd4MmNHMmxI?=
 =?utf-8?B?aDNjS2xQcDNHRVMyYm51Z1hqS3dweGpZcHJORGFpYzdVUDl1Mm9FRXN4VThB?=
 =?utf-8?B?bUpnTEJBb0w4bmZjcGhvcTVKNWVXTnRiYVY0NGZXZkQ4YjlMNW9FZ2dBaWEr?=
 =?utf-8?B?Ykh2L3o5QmtISUFJdmxYczR2TENvOFgycTNvOTBqYW5INlpWQjV3ampFckxX?=
 =?utf-8?B?RE1FeUtaeDI1U253dW1ZbWhTNXR0STd0TUlFUm1LbEdQZEp6bnFKV01ZbjVt?=
 =?utf-8?B?NEtnY2U5ckRWcXpmbXJQOStwWWo3SE1SR3hVUVhZdE1FMDBpOU9JV3gxQWpu?=
 =?utf-8?B?ZTF5Sy8rZm1DelAwMWhZenlhQ0RXTUk4SW5rTG8zQ2FSK1lUMVNPOUtZNm9i?=
 =?utf-8?B?L3hLc09NNlBPaDNFK0p6Nk9IR09kS2l0Sm4xNEUxL1lPS0NhMGRXYUZHK1pt?=
 =?utf-8?B?M0MrK0hLSlBUY0V4cFZrMnMrRlgrUWpmeTdTazVTZDZOWGtSN25QMnhWMnV0?=
 =?utf-8?B?OHFJUEt5elAwcVowZ1RHTUIySEJzbEJ6NWs5d1pSUnFIMVFpUEJOa3lPMkFI?=
 =?utf-8?B?ZVZkdERpZUl5Tk9tN3lmSTBVRStWaXhaSjVsdlNHVW90a2U5NG9uUkgvQ3ZP?=
 =?utf-8?B?ZklQZ2M0SEhTeFl3eUFuZGE3T28xa0tQa2o0ZS93dUNXbHR2M1BLUGN3N0Jp?=
 =?utf-8?B?YmFLNVVxa3czc3ExU2piTVppZXAwWTNZNWdMQ0o4ejlSVHp3cTdoRjJhZExC?=
 =?utf-8?B?RDNmM3JDOTFSaUErTmtoeWRYT2tyS0Y3TWxQV2Y1MUd2cFczcExGYitNQVlx?=
 =?utf-8?B?bFpBWmV4blk2aTBJb0FBeHg2RVNzZ0h2L3U1dEJFTkUrN3l5RzJVMWVIcCtV?=
 =?utf-8?B?NHJhaklTODk5L1lWUkZIaTQrQTJPbko1R0R5VTV4VGJOT3Z1RTRZQ21vVUJt?=
 =?utf-8?B?QnJZTlVTOFhKd0JaZ3U4cStQUkNtbGdTWGdjbkQzZVFqZERLaS9HTVh6OUN1?=
 =?utf-8?B?cjBXYWN6NWdzSGdKODVEQUNOZU9rd3dtaWdnN252UklQM0NaODZsdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cebcac0f-8a3c-42f7-d840-08deaf4f4e3a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 11:20:28.6419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: reEjRKt8paLW0hPy5yUfsarPdFfbcglEAfsBepHKs6eSZWM+JafmvAR6oYwQM+QLoug5xeLPMgaR/XonpaPd9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6047

Hi ilpo,

I submitted this patch series and wanted to check if you had
a chance to review it. Please let me know if there's anything I can
do to help move this forward.


On 4/27/2026 9:21 PM, Muralidhara M K wrote:
> This series adds HSMP protocol version 7 support for AMD Family 1Ah
> Model 50h-5Fh processors and replaces offset-based chunked reading
> with a single read method for variable-sized metrics data larger than
> 4 KB, and addresses locking to allow concurrent reads safely.
> 
> The zen6 metric table (~13 KB) exceeds the PAGE_SIZE (4096 bytes) read
> cap imposed by kernfs_file_read_iter().  Commit 3124eb1679b2 ("sysfs:
> remove bin_attribute.size") cleared i_size for sysfs binary files,
> which made kernfs_file_read_iter() fall back to PAGE_SIZE as the
> maximum single-read length.  This means userspace gets a silently
> truncated snapshot when reading the metric table via sysfs.
> 
> To solve this, the series introduces SYSFS_HUGE_BIN_FILE, a new sysfs
> mode flag that routes binary attribute reads through the seq_file path
> (seq_read_iter) instead of kernfs_file_read_iter().  The seq_file
> buffer grows dynamically (doubling from PAGE_SIZE) and has no built-in
> size cap, so it can serve arbitrarily large binary attributes in a
> single read.
> 
> Additionally, the series retrieves the actual metric table size from
> the SMU at init time (via args[2] of HSMP_GET_METRIC_TABLE_DRAM_ADDR)
> rather than relying on a compiled-in sizeof(), and adds per-socket
> mutex serialization for metric table reads using the scoped guard(mutex)
> API.
> 
> Link: https://lore.kernel.org/platform-driver-x86/81915669-87e0-f06d-7a91-eaec41ecc0e1@linux.intel.com/T/#m28341c51bcf27862ef6615414b1970d3db279fd7
> 
> Patch breakdown:
> 
>    1/7  HSMP messages    - Define HSMP protocol v7 message IDs and
>                            response sizes in the UAPI header.
>    2/7  UAPI structs     - Add hsmp_metric_table_zen6 UAPI structures
>                            and widen acpi.c proto_ver checks to >= VER6.
>    3/7  response_sz      - Unify response_sz validation to an upper-bound
>                            check, allowing HSMP_GET_METRIC_TABLE_DRAM_ADDR
>                            to return 3 dwords (including table size).
>    4/7  SYSFS_HUGE_BIN_FILE - Add the sysfs infrastructure: new flag,
>                            seq_show callback, and kernfs_ops for binary
>                            files larger than PAGE_SIZE.
>    5/7  Dynamic size     - Read actual table size from SMU args[2] at
>                            init time; use bin_size callback to report it
>                            to sysfs.
>    6/7  Read locking     - Add per-socket guard(mutex) serialization for
>                            metric table reads to prevent torn snapshots.
>    7/7  Wire it up       - Set SYSFS_HUGE_BIN_FILE mode on metric table
>                            bin_attributes in both acpi.c and plat.c.
> 
> Build-tested each patch individually with W=1, zero warnings.
> Tested on AMD Family 1Ah Model 50h platform with HSMP protocol v7.
> 
> Muralidhara M K (6):
>    platform/x86/amd/hsmp: Add metrics table support for Family 1Ah Model
>      50h-5Fh
>    platform/x86/amd/hsmp: Unify response_sz validation to an upper-bound
>      check
>    sysfs: Add SYSFS_HUGE_BIN_FILE flag for binary attributes larger than
>      PAGE_SIZE
>    platform/x86/amd/hsmp: Add dynamic table size for metric table
>    platform/x86/amd/hsmp: Make metric table read locking use guard(mutex)
>    platform/x86/amd/hsmp: Support SYSFS_HUGE_BIN_FILE for metric table
>      reads
> 
> Suma Hegde (1):
>    platform/x86/amd/hsmp: Add new HSMP messages for Family 1Ah, Model
>      50h-5Fh
> 
>   arch/x86/include/uapi/asm/amd_hsmp.h | 235 ++++++++++++++++++++++++---
>   drivers/platform/x86/amd/hsmp/acpi.c |  14 +-
>   drivers/platform/x86/amd/hsmp/hsmp.c |  36 ++--
>   drivers/platform/x86/amd/hsmp/hsmp.h |   6 +-
>   drivers/platform/x86/amd/hsmp/plat.c |  13 +-
>   fs/sysfs/file.c                      |  45 +++++
>   fs/sysfs/group.c                     |   8 +-
>   include/linux/sysfs.h                |   1 +
>   8 files changed, 312 insertions(+), 46 deletions(-)
> 

