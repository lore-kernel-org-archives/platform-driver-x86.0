Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794243671;
	b=3n/n7vjx2eJj9HqDmUfx1bmpBrjfCKRf4u1OD1emMJkyWE4yaqLuMZHkF/S1D2Ax4ary
	 ydlJDGLxvI2SvN9Pe3sK/UWjxHGlnuboP2uYQ4TJ2VdjjjngLJ7iiJ3G6AHJ+Gq8q+iQH
	 UQwunzgIRxs9C/7mzR6cI7eHevkScHoPeb+BNjIDOIjrKvi6KoeIgfE+oH48O4XCtZddh
	 R10UCMKQWUn+wIxx92qNSAOgISlZMiQkClXwDDJtUg9TKe4YxjQriGKak3GxmtmV3BaNh
	 xcnkHx5eEA/qRVLxkITIbbbFyAEXWH2BsNepCEsLCknvJMuAkkyv4oTgFUinyMAl9rg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243671;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=LJ1U52DdBCvLLJ8wdVbTsvFTgOVwBMiG8DGALGgtz6A=;
	b=b1rlbvn4V4FyPezswGzkOPQe6I+2kUJBg8QJK6S/vEmz/9vlqhE8KNKo93lWTUlwWg9O
	 NwQa51L0dtoqGA6mqTxd280+p6ByHb8Q01mtioX8wvO7YltTY3iQ8MWJXuyC4yHU1nQg6
	 S/TOBN56CsmJqhlr7IjId861xwI+Tjml/ATsfsRoF2xaPenuLY1Wapab5vHEukxOYEWTt
	 KLm3oZF0rBw/9Pbr3ZC7dXKddnWV2uAdBS5wyx/Egt/8p1/fyIrwmYn0JBzSlL4zyCd6D
	 8whvPpNhOHlpNOaHBO54C9jO9l3DaNqAVDOOFj1DUeKu3wmin3Hn4fwtfYKEfWMClkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=agy830NN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.16
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010016.outbound.protection.outlook.com [52.101.46.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A17606A321
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Nov 2026 17:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9A17606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=agy830NN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XhNu7hrwZxyyO3lPzYtYwAdNKzEuBwEIAJRVxfshF4YJtYjeSKORdULy9Fxic22K/xBhgIi/ovdQW6uhsKeE9XyzOzk6lTTw/iVJSs5zltQ/oPKwg2hlpj10XcUCNpworRdq2cBOEtu9yizIgZ3ginW7ZOC5wyhUnFeS23GPrV0S5fGpqurI4uaLnsHMTDht0q0UqReEQfOKnemCjKi1BHSRV3FtLzMgcZIuZ/CjKw2bCG/xYsXh47IMMQjKHZYIpo0sBURs7+tu5vw/3HYPmq3m7AsA4SPbRNHnddx20QMgmHO0uC+8LU1NFxEIIrb+lv9lOnQ8kqA8/Vkcj4xNCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJ1U52DdBCvLLJ8wdVbTsvFTgOVwBMiG8DGALGgtz6A=;
 b=dmAQCNgq0rBQNCM4gBcooDC5dQCYYLmACrOOiVcXxgoI4zjmkZM54FqMZCsZFrlCPvQWI0zq298WHgHjKjS+Yne6PDgbmIQZp89PmYH2vX2TWi0qNdGjCNXMz3Qei6uIIs/BNqo/V3I51sgYDHmHdmWo3/NKDnJpV1YapYtk/Cd6HVC4zCdgrjurGd5K8m6gk2hIkOVBqbY+R8HcKoUNunkM8ScURKPOutBhHa3lBMzu8ka7qtIEDQRuvoz9a7SbNR39x59vATIQZd3eYMNZkFgkhQTI3xufHl6hsp3xBDmlcC+thas/0JVKqKziqVAC19KT7uT+sZTIyvAwdhVFUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJ1U52DdBCvLLJ8wdVbTsvFTgOVwBMiG8DGALGgtz6A=;
 b=agy830NNfOMjFjsnU2W00kTJUVRcw0diB1ZAwMafwl+mzoKnQghFbz89lk5EMuSQY8fKOyzBXmgfnWE4ZwL+citUdpabPmoXf63UQ5m391AAr4VC0TX5nee6Q61DBU6xBaxvNrFxOhiY0x4Vlkis4m+WYxQVLFeCcpJUlHZGlf0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB9174.namprd12.prod.outlook.com (2603:10b6:510:2ed::9)
 by BN5PR12MB9463.namprd12.prod.outlook.com (2603:10b6:408:2a9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 17:01:08 +0000
Received: from PH7PR12MB9174.namprd12.prod.outlook.com
 ([fe80::eaaa:b430:ba9:5dc]) by PH7PR12MB9174.namprd12.prod.outlook.com
 ([fe80::eaaa:b430:ba9:5dc%7]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 17:01:08 +0000
Message-ID: <6f654783-a7d5-489f-8740-c6c441a14155@amd.com>
Date: Mon, 9 Nov 2026 11:01:06 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] platform/x86/amd/pmf: Add extended custom BIOS
 inputs for 1AH_M80H
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20261106164429.30738-1-Shyam-sundar.S-k@amd.com>
 <20261106164429.30738-11-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20261106164429.30738-11-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::12) To PH7PR12MB9174.namprd12.prod.outlook.com
 (2603:10b6:510:2ed::9)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB9174:EE_|BN5PR12MB9463:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f63692a-9c1c-4677-e030-08df3e830c9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|4143699003|11063799006|261021121427099003|261026140227099003|56012099006|261021123027099003|261009223027099003|261021135927099003|261022075727099003|261022105027099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	UiKmHdr+MNm+5AWhX5lFzs3uiUzN9vB/kep0FEjiz2z32oFIUWcE19I5oHqUqmThrbeq4ZcHtc2MbbHDnjZYxf2r020EXiNxR3ymJjZ4fwMMsPORqmBSH26tn0AXEBIsNm/YLmPuv/i1VVZ6DUvqgyflZbA/UOltjxq1U/+nkJZpo30HOS2m7lPxjZc7lQC85VAL923klLJTgB6TY4T2YZEPBaRThJGypOOyIkVFWAR2e+TTQAwsMFhUbFR7ltBa1lOo5z6xvijXcJp8gmirBP2mCbuOqKCj8lZ0qE4gUO5uCL8wFskwdlSJfsKuN0OYJ0AGliq1sWuuQ5rKoDAugeNsgiCgdm0TqokN+pYLUteR2FO0zT1HupFdIYwiKux9zRrR+WaYBCPvttM2XnHPa1387YPjK+VKJtW9x3XVNtSgHMp39BOsR5dan7tHSqIGKGS9hTBlzPr1OxdZQnY1t1e7HjFLwX+LNZFro7URl2S/nVYLH63LeKUC4VLrmBTZYyG7VOa5EZxI8S469K92NEMeKWBmZOEwRtAejKwBtxlW5CSy6Tk2Ib4zFTzntHw0TeoiqmYe71TtSVhkabBpGKmjCrY6xvumace66b/hXkY/faiHtLMdijWGeAr6RvvuQ1C+zWsCs/IaNJDIqIHJZASoV8XtE5PRrFLJSgqPIXs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB9174.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(11063799006)(261021121427099003)(261026140227099003)(56012099006)(261021123027099003)(261009223027099003)(261021135927099003)(261022075727099003)(261022105027099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aklFdHJYaFV3a0RCNVVhaGg5N0tkZzdhQlFSbmtQbmpzN3N1Q2JRNTc2VFFT?=
 =?utf-8?B?b1B0QmVYWEVRMW5XZENTV25lSGRyQzRkZ2xkbEdycTV1RUs5TVRnanZNRUVI?=
 =?utf-8?B?R1d0Tngwb0NvWW5obmtOSlFlK21Lb3c4RXNxWENIbHBFL3U4VXl5RVpkbndK?=
 =?utf-8?B?TWtpanp5aHZpejhXUjMwZXJwS1lySzhRU1c1dFhYLzhmVmpUNUtYMlk1eEtj?=
 =?utf-8?B?eFVGaGNPVS9zUFVoUDE0M0FaNzc2MWRWQndSQVBEeXpZd3BOSldoM3BicWcv?=
 =?utf-8?B?RVI1N0Vka2kzRDVjZ0FuekFhdDI3WlZzbDA0aDV0UEIvUjdtREQzbWNHc05E?=
 =?utf-8?B?N1loQ0JLajlZU2pqdFQ5SVhTbmtlb1YxbWtPMDJzbVp6UVBuR1k1bmhvU2ty?=
 =?utf-8?B?USswRXNqcVNoR3gzMkZ4RCtmREhRN2NuSUJLZzlwZW9LSXhPaDhtNTJTNzda?=
 =?utf-8?B?M3owK2tGMEU2bjBQQWd2YXpPamcrdjYwanJvMDlzeGkyazhIVzhxZHZOVTY5?=
 =?utf-8?B?WmNUc3gxNGFNTEZheTBFWXFPbm5BZXR5aU93ZzJ5S2NycFB6N2gvcHA2d1V4?=
 =?utf-8?B?Ri96Y3NkbkROSUJmRzgzVFdoblYrbmU0TkI5REdBZHB4aWVjUHdpOFFudkI0?=
 =?utf-8?B?ZEpySlBDVnNLQmNxdEpIRUdUMkU1c2N5OTlSU3dGU1RRWUkxeVgyY2MvRTBN?=
 =?utf-8?B?cFM0V3E0OTkxb2NaY3J0d0RhaU1ST2lSWnY2bE1FV3JVa0NoL2wrZFdlZGlC?=
 =?utf-8?B?VWx6VElxRUh5QkpXYjIya1d0T3M1T0xvblpEaWlGSnRlWkxoZmRsN0NyMWZ4?=
 =?utf-8?B?SmF6dEZDTjcrc0hBMFY1eHdNR051dzRmY2duTVlEWGwzQ1RXUGNmV21vQjln?=
 =?utf-8?B?ak9iSFZ2M2tlcmd4bHE5ZWlvWXVMS05rRTBxVks2Q3VIQXd5VzczblFUY3Vl?=
 =?utf-8?B?bWVMOTI0NURpdG9sNmFyN1ovVGNiRms0bG1zcGJDNUExcDM3VDBKZjNJWE9J?=
 =?utf-8?B?OXl4ekNZbEh0cXZ1MEt6RHFHVnk4bUJpV0lIVGhsWGlZYk10S1g4RXNZOE1x?=
 =?utf-8?B?b3JMREJFSGJGZk5lVjlwRVdMajNkd0JpaTB1Si9xV0FycnZ5QmJWbFVMa29V?=
 =?utf-8?B?K0R2Rys4a1NKOVM1OUkzaVZwZGNIT2lGbTgwMjg2QjZBcDdDRlhlVXpHZzQ4?=
 =?utf-8?B?ZUkxZlA2eEpqR0tnM2x0V3pDNjRRdWJzbmo2L0ZoZll6NEVrU250VktJZFkv?=
 =?utf-8?B?ZjdZYVEzM2o5dUpscGdpQUlmYkhTUUNndlJ0OU9nZzJlME9OZVpOazdHQnBO?=
 =?utf-8?B?Z0l0UHdianQyWXhlU2NXRllvT3dWT2ZGWnVIL2NoU3ptcGNsZEUvY00rOVhG?=
 =?utf-8?B?Q041RnNnZmZrM2xOcDZMZDA1aVZmQ3dzaHVqSjZSYkxJbkVqYlZoNnlEdVRY?=
 =?utf-8?B?OTNuaGVYSnhsWlRUT1JQbS93UW1SNTZmMUpiYmZWVmV5c3c5Qk5ObHc2WXRl?=
 =?utf-8?B?dU1ENldsWTNWNkRrQXoxTGU0S0JSWkNiYkgwZ3BUMFl4VkVUb1B6N0tyRFQx?=
 =?utf-8?B?NnBSVEZXenkrZlNraWI0TytXZmcxZmdyUUdqSlArblZqRWhiakhHdVJrbElj?=
 =?utf-8?B?dFA0cmZTN0FKUlJaSlR3QTMrcHllMG5mcDExWWZFbnF4TCtjUHNwNXJXZ2w5?=
 =?utf-8?B?ZjQzVDk5TDIwN0lsQitRbkgrSzF6OTlaNnRtNW8rZ29OS01QNFNNNVl5NVMr?=
 =?utf-8?B?L3lWMWZTeGVFTksyTFI2R2hJWktrZ1kxbjQ0OHd6YWpTWGZvak1hdWtiZGVw?=
 =?utf-8?B?eHMvTDBMYlNJRml5TWc4WWJLdzM1TU5DS1REL0syR1V0akw1YjI2STFocmpE?=
 =?utf-8?B?YXFvVVFHbExiL3V0THVHM0NPZDU3VC9yZFY0Wk1QcHdjVVkwbDVjVjZJTk5C?=
 =?utf-8?B?c1M3SXFSUFVHUjN1SXQ3dklueVNDbGZpc1ZTK0pDTWNtRGFMNkdhRnhzWTg3?=
 =?utf-8?B?UVV3VmJhMGthdXE4VUNQZXFnV1FFcDQydUgzN3BnbkI3S2VzWHRicTVWQ1RI?=
 =?utf-8?B?TlpJcE5UekJqeGVYQms4SmRDZnlrQ1BmQjBKVlNlU0VUMEg1dE5tWitSSEp5?=
 =?utf-8?B?OE4zK1E4c2NhT1p5djcveFc1eklrSVNMd3gvOUgzVTFWQWFmT1p0dUYxTU9B?=
 =?utf-8?B?NmFhaTdiQVgzWFNIeTNLVGVBbzE5VE92R09BS1lyNVVyc3JSRmhHZFI2YTNS?=
 =?utf-8?B?dE1IWjJMNnVuZUZzVnh6ZWJHU2wwdGFzUm5wSWljVzlHN3BRUGJMeThEK3lp?=
 =?utf-8?Q?0qiPNEHGDeqc6JguzZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f63692a-9c1c-4677-e030-08df3e830c9c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB9174.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 17:01:08.5362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D/WqUEtXNOxUCCGJuAMyhrf254JLBEjs8UFcRUmp2UfBBVhmvmHUJ/56XMwf0YcQ39HasgC6/O4zIulzpLTyWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9463



On 11/6/26 10:44, Shyam Sundar S K wrote:
> Earlier platforms support up to 10 custom BIOS inputs through the APMF
> SBIOS requests function. APMF 2.03 extends this to 20 inputs on
> 1AH_M80H: the SBIOS request structure gets a second set of 10 values,
> and inputs 11-20 have their own notification bits (16-25).
> 
> Add the APMF 2.03 SBIOS request structure and use it on 1AH_M80H. Size
> the ring buffer entries and the saved values for 20 inputs. Older
> platforms keep filling only the first 10 entries. Pass inputs 11-20 to
> the TA in the bios_input_3 fields of the v2 condition table, which were
> reserved until now.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>


> ---
>   drivers/platform/x86/amd/pmf/acpi.c | 32 +++++++++++++----
>   drivers/platform/x86/amd/pmf/pmf.h  | 54 +++++++++++++++++++++++++++--
>   drivers/platform/x86/amd/pmf/spc.c  | 11 +++---
>   3 files changed, 83 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 20e9603d5c08..4305dfe81c11 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -288,11 +288,18 @@ static void amd_pmf_custom_bios_inputs_rb(struct amd_pmf_dev *pmf_dev)
>   		break;
>   	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>   	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> -	case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
>   		for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
>   			rb->data[rb->head].val[i] = pmf_dev->req.custom_policy[i];
>   		rb->data[rb->head].preq = pmf_dev->req.pending_req;
>   		break;
> +	case PCI_DEVICE_ID_AMD_1AH_M80H_ROOT:
> +		for (i = 0; i < ARRAY_SIZE(custom_bios_inputs_ext); i++)
> +			rb->data[rb->head].val[i] =
> +				(i < BIOS_INPUTS_MAX) ?
> +				pmf_dev->req_ext.custom_policy[i] :
> +				pmf_dev->req_ext.custom_policy_ext[i - BIOS_INPUTS_MAX];
> +		rb->data[rb->head].preq = pmf_dev->req_ext.pending_req;
> +		break;
>   	default:
>   		return;
>   	}
> @@ -322,13 +329,24 @@ static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
>   
>   	guard(mutex)(&pmf_dev->cb_mutex);
>   
> -	ret = apmf_get_sbios_requests_v2(pmf_dev, &pmf_dev->req);
> -	if (ret) {
> -		dev_err(pmf_dev->dev, "Failed to get v2 SBIOS requests: %d\n", ret);
> -		return;
> -	}
> +	if (is_amd_pmf_1ah_m80h(pmf_dev)) {
> +		ret = apmf_get_sbios_requests_v2_ext(pmf_dev, &pmf_dev->req_ext);
> +		if (ret) {
> +			dev_err(pmf_dev->dev, "Failed to get v2 ext SBIOS requests: %d\n", ret);
> +			return;
> +		}
>   
> -	dev_dbg(pmf_dev->dev, "Pending request (preq): 0x%x\n", pmf_dev->req.pending_req);
> +		dev_dbg(pmf_dev->dev, "Pending request v2 ext (preq): 0x%x\n",
> +			pmf_dev->req_ext.pending_req);
> +	} else {
> +		ret = apmf_get_sbios_requests_v2(pmf_dev, &pmf_dev->req);
> +		if (ret) {
> +			dev_err(pmf_dev->dev, "Failed to get v2 SBIOS requests: %d\n", ret);
> +			return;
> +		}
> +
> +		dev_dbg(pmf_dev->dev, "Pending request (preq): 0x%x\n", pmf_dev->req.pending_req);
> +	}
>   
>   	amd_pmf_handle_early_preq(pmf_dev);
>   
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 24933da9b3cd..f6c2a9aac00f 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -163,6 +163,7 @@ struct cookie_header {
>   #define APTS_MAX_STATES		16
>   #define CUSTOM_BIOS_INPUT_BITS	GENMASK(16, 7)
>   #define BIOS_INPUTS_MAX		10
> +#define BIOS_INPUTS_EXT_MAX	20
>   #define CUSTOM_BIOS_INPUT_RING_ENTRIES	64	/* Must be power of two for CIRC_* macros */
>   
>   /* amd_pmf_send_cmd() set/get */
> @@ -312,6 +313,21 @@ struct apmf_sbios_req_v2 {
>   	u32 custom_policy[BIOS_INPUTS_MAX];
>   } __packed;
>   
> +/* As per APMF 2.03 */
> +struct apmf_sbios_req_v2_ext {
> +	u16 size;
> +	u32 pending_req;
> +	u8 rsvd;
> +	u32 ppt_pmf;
> +	u32 ppt_pmf_apu_only;
> +	u32 stt_min_limit;
> +	u8 skin_temp_apu;
> +	u8 skin_temp_hs2;
> +	u32 custom_policy[BIOS_INPUTS_MAX];	/* inputs 1-10 */
> +	u8 asm_lite_ctrl;
> +	u32 custom_policy_ext[BIOS_INPUTS_MAX];	/* inputs 11-20 */
> +} __packed;
> +
>   struct apmf_fan_idx {
>   	u16 size;
>   	u8 fan_ctl_mode;
> @@ -641,7 +657,7 @@ enum power_modes_v2 {
>   };
>   
>   struct pmf_bios_inputs_prev {
> -	u32 custom_bios_inputs[BIOS_INPUTS_MAX];
> +	u32 custom_bios_inputs[BIOS_INPUTS_EXT_MAX];
>   };
>   
>   /**
> @@ -650,7 +666,7 @@ struct pmf_bios_inputs_prev {
>    * @preq: Pending request value associated with this event
>    */
>   struct pmf_bios_input_entry {
> -	u32 val[BIOS_INPUTS_MAX];
> +	u32 val[BIOS_INPUTS_EXT_MAX];
>   	u32 preq;
>   };
>   
> @@ -748,6 +764,7 @@ struct amd_pmf_dev {
>   	const struct amd_pmf_ta_ops *ta_ops;
>   	struct amd_pmf_metrics_v3 smartpc_prev_metrics;	/* Smart PC delta baseline */
>   	bool smartpc_metrics_have_prev;
> +	struct apmf_sbios_req_v2_ext req_ext;
>   };
>   
>   struct apmf_sps_prop_granular_v2 {
> @@ -1017,6 +1034,29 @@ static const struct amd_pmf_pb_bitmap custom_bios_inputs_v1[] __used = {
>   	{"NOTIFY_CUSTOM_BIOS_INPUT10",    BIT(16)},
>   };
>   
> +static const struct amd_pmf_pb_bitmap custom_bios_inputs_ext[] __used = {
> +	{"NOTIFY_CUSTOM_BIOS_INPUT1",  BIT(5)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT2",  BIT(6)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT3",  BIT(7)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT4",  BIT(8)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT5",  BIT(9)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT6",  BIT(10)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT7",  BIT(11)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT8",  BIT(12)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT9",  BIT(13)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT10", BIT(14)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT11", BIT(16)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT12", BIT(17)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT13", BIT(18)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT14", BIT(19)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT15", BIT(20)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT16", BIT(21)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT17", BIT(22)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT18", BIT(23)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT19", BIT(24)},
> +	{"NOTIFY_CUSTOM_BIOS_INPUT20", BIT(25)},
> +};
> +
>   /* Command ids for TA communication */
>   enum ta_pmf_command {
>   	TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE,
> @@ -1206,7 +1246,7 @@ struct ta_pmf_condition_info_v2 {
>   	u32 workload_class;
>   	u32 video_enc_sessions;
>   	u32 video_dec_sessions;
> -	u32 rsvd[10];
> +	u32 bios_input_3[10];
>   };
>   
>   struct ta_pmf_enact_table_v2 {
> @@ -1414,6 +1454,12 @@ static inline int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_a
>   	return apmf_if_call_store_buffer(pdev, APMF_FUNC_AUTO_MODE, data, sizeof(*data));
>   }
>   
> +static inline int apmf_get_sbios_requests_v2_ext(struct amd_pmf_dev *pdev,
> +						 struct apmf_sbios_req_v2_ext *req)
> +{
> +	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS, req, sizeof(*req));
> +}
> +
>   static inline int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev,
>   					     struct apmf_sbios_req_v2 *req)
>   {
> @@ -1482,6 +1528,8 @@ static inline u32 amd_pmf_get_ta_custom_bios_inputs_v2(struct ta_pmf_enact_table
>   		return in->ev_info.bios_input_1[index];
>   	case 2 ... 9:
>   		return in->ev_info.bios_input_2[index - 2];
> +	case 10 ... 19:
> +		return in->ev_info.bios_input_3[index - 10];
>   	default:
>   		return 0;
>   	}
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index 35538732259a..ff80ee9048b7 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -53,7 +53,7 @@ void amd_pmf_dump_ta_inputs_v2(struct amd_pmf_dev *dev, struct ta_pmf_enact_tabl
>   		amd_pmf_get_platform_type(in->ev_info.platform_type));
>   	dev_dbg(dev->dev, "Laptop placement: %s\n",
>   		amd_pmf_get_laptop_placement(in->ev_info.device_state));
> -	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
> +	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs_ext); i++)
>   		dev_dbg(dev->dev, "Custom BIOS input%d: %u\n", i + 1,
>   			amd_pmf_get_ta_custom_bios_inputs_v2(in, i));
>   	dev_dbg(dev->dev, "==== TA v2 inputs END ====\n");
> @@ -100,6 +100,9 @@ static void amd_pmf_set_ta_custom_bios_input_v2(struct ta_pmf_enact_table_v2 *in
>   	case 2 ... 9:
>   		in->ev_info.bios_input_2[index - 2] = value;
>   		break;
> +	case 10 ... 19:
> +		in->ev_info.bios_input_3[index - 10] = value;
> +		break;
>   	}
>   }
>   
> @@ -128,8 +131,8 @@ static void amd_pmf_update_bios_inputs_v2(struct amd_pmf_dev *pdev,
>   {
>   	unsigned int i;
>   
> -	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++) {
> -		if (!(data->preq & custom_bios_inputs[i].bit_mask))
> +	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs_ext); i++) {
> +		if (!(data->preq & custom_bios_inputs_ext[i].bit_mask))
>   			continue;
>   		amd_pmf_set_ta_custom_bios_input_v2(in, i, data->val[i]);
>   		pdev->cb_prev.custom_bios_inputs[i] = data->val[i];
> @@ -160,7 +163,7 @@ static void amd_pmf_get_custom_bios_inputs_v2(struct amd_pmf_dev *pdev,
>   
>   	guard(mutex)(&pdev->cbi_mutex);
>   
> -	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++)
> +	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs_ext); i++)
>   		amd_pmf_set_ta_custom_bios_input_v2(in, i, pdev->cb_prev.custom_bios_inputs[i]);
>   
>   	if (CIRC_CNT(rb->head, rb->tail, CUSTOM_BIOS_INPUT_RING_ENTRIES) == 0)

