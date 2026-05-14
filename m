Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012018.outbound.protection.outlook.com [52.101.43.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71327413241;
	Thu, 14 May 2026 14:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778768015; cv=fail; b=FwuhbPo7dS7SGplwb5f+6i0zQ+5FGDCC0AC7+WbwKnDie5JWvekcYNvtP75FIWmAHD9puKEND4yBPhWcxQu6gMv1jjYvU8IrXa6MAnaNHRKYQ15+cBblJ8EqC6GeE749C5iGfsotByuIDxJSGzjSm3IEIJ7IEtX0nCgM4Dz4afE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778768015; c=relaxed/simple;
	bh=E8jFkYPcO8kco3TOAFUTdMdKpJT17CdyfTB4hgwq/lo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gUVi4QUoxMcbPABl4s94a8kkxulqfI/+hkFEpboPDXDQr/How5phDGrvIvyFwe/T6UNyZOLLew+67kofWSmqIV65gd66tf1vFY3S4N1xDKbjQFBSUEgi/ai0ssk+fSreBmJ19Dk4JXk8XrmhwJ1zLyTVoWYUtl2RQJ8wSg3UGEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AFlCgKMD; arc=fail smtp.client-ip=52.101.43.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AFlCgKMD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RhUbew6C6vOjTBHA6i64Wjs/IOB/Aq0n9jbJnW+d5TrWcts5BEmXmkjz3aOkOpcG5B9jdE8sNojXnu4/C1xfDsGTfjuIqT8eeuSndD8WJYQpC4aEbIUXbIx36RiXkvp2e5G8P+kL1kT4P+rC9UnEk1xXL1Vf/6lXS5/3J+U2Cs7uoglqQG+CShLlU3DLb/MT+Fo+s+UN43YjHfL87yTY8OpFIi/g6mzNjGm628cPffNzuAfb3Sk5vfT0RBZV9HHN+9fhMVRBpRB+15sKOZj3B2nm2VixkikvtBptO6FNVLWTTyB9VCzAR/scX5xrlg7qbtpNFzJfC09T0ATKrq+fAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHKAxINRqfb0peObtD7HjR8gFOJrbuoc2vMZ1ba4rEA=;
 b=ucpPLikLWOHNjV2PZZXonUcFDzOgFgPf/AQSA0s20P9fmh/KSmJWkkoSxJn6u2+ys5atI4bfF1Jf9D2iCnwOfjQ0xK2tHmPTQrwXqF2uPPFZEMXlNfUEPLb+rS9wvPWGZ6Ba9dekpVuEbS5MoOV0cyG3NO4l8vHF79K3F4Vhya7/InlyvFSrlY1wB1RCtcbwwd2Sl/HQ1NNHE49NMX2zE+J5kafVbF8uO3eSQ75j5UGQ37EFzF4HDz1xXo9V/FNF4XIpJWkjfUiDmBKpAJQ0Dn68tPSRL+74JJPL8Rpl0CzJJ+VUQZOrZp4bMA1IxUXvvxrtyeA4kInzkxIg1Jnn7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHKAxINRqfb0peObtD7HjR8gFOJrbuoc2vMZ1ba4rEA=;
 b=AFlCgKMDxrOntFWppmsL46UbjjWd/e8/UOGfLTkFcOJ5AsrF0O6cyRF6JWbblRW9PCaBXgxJ2/u9eqm5B9tnBvDFQsT/VEblC+uMBpHRGNAe8Oa/TgkEBwKSb6FW6J/mByt343v4UmYBZLGmpKjCFvP48FciG2Cb6ocMImQqzKc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by PH7PR12MB6836.namprd12.prod.outlook.com (2603:10b6:510:1b6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 14:13:23 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.21.0025.012; Thu, 14 May 2026
 14:13:23 +0000
Message-ID: <d4cadf88-cfc6-486c-bd5a-8de277fc4874@amd.com>
Date: Thu, 14 May 2026 19:43:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] sysfs: Add SYSFS_HUGE_BIN_FILE flag for binary
 attributes larger than PAGE_SIZE
To: Greg KH <gregkh@linuxfoundation.org>,
 K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Muralidhara M K <muralidhara.mk@amd.com>, ilpo.jarvinen@linux.intel.com,
 rafael@kernel.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
References: <20260427155129.545327-1-muralidhara.mk@amd.com>
 <20260427155129.545327-5-muralidhara.mk@amd.com>
 <2026051214-getaway-mammary-debb@gregkh>
 <47c6134b-c0ed-44af-b77e-145bfceded74@amd.com>
 <2026051354-succulent-acting-e006@gregkh>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <2026051354-succulent-acting-e006@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0292.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:221::19) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|PH7PR12MB6836:EE_
X-MS-Office365-Filtering-Correlation-Id: f9e54ecb-b1df-4e38-ab05-08deb1c2f57e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003|4143699003|11063799003;
X-Microsoft-Antispam-Message-Info:
	SOxS7qlsUHw7BDDE68pu1hagUdDUj5YCDAURuerZQotStvv37FAU41G8+KlmK8VyLuT5NghJ/1xdyJrdM3UpwJjdAo0nC21u8ke7z9UQS6b3/Ak9c6st9aqIdgYCnUl1WDhjbo/y30Tsdnq9MrvcAEuwSBOIxzoyKTOLDQPqUX7BqW0yds1n3pdBZpfAGFF1ejLAJ9gQuqDi53iUkw0Y8WJA5Q3ZSbaoL3X8g6e1tpxnzklx8l1miaKr5wC+GArK0bwsMXL6IZp1ReXnjpVQkhq450NopsvfY/tZsLkc8VZvc9yrvVDsVebdwfdEH7RDbSiLUkjw794XOU4IWuIZKZGacYz0U77QqaJ4v3rfh5c4u32w9unxRI4xRSiG0bOFuTDOPnBKg+54ivk85mnNGJ3Sa+j7twwB1J5o8l70qBJHNHe85FzgIvTzVCzz0k6ZPGTJ8Ze/W+X6PY8bgMpcXy9HX23u7CTKaK/SBWd2hQiUtN7LN2Uq8ec3dn1a6GqssiukDKOnGcvHOQFV6s20WawFpOPrpkyUQ5+thpRWB0WuGFOMfGkG1YOgGMWOs7nUvlXqv47/+HLJ0xLM3hnh4tK+viNYcMAPVEwkN5iGQ90WgVWG0HaOPqi3HUOuj1e5LVADtuRRVCYBC+t8g9UWSps4ogPhR1hqk7B5F137y3/s2jbm4aZXKRL3WrRqTI/x
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003)(4143699003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFJkM21xM3g2MUF4MGpraksvZmE2aUNyVXJBa3gwem9zRG5wTkVLYmpIWU5s?=
 =?utf-8?B?R3RCU1pMckU5TXVVaG9mY3dGVzZGNTQybDlCNWhjRnVQQVNEdEtTSHVtWUlx?=
 =?utf-8?B?V2dJUzR4V3lMSW9JT1lpTThyV3BnUUcyUEx1YmhKdmpPeWNqVlNuRW5lZW9I?=
 =?utf-8?B?S3M0K1ZvSnVQZHAxK0VBWnVYa1dQSnFLbWJ1N2RzSDBVS1ZpQWp5eGZkN2g0?=
 =?utf-8?B?L0ErSlBLWXFLTEJWM3lEYW0zajg5OFZ6clA2ZUxHL1pKQ3ZsZnBVZmgvdWZa?=
 =?utf-8?B?Sm5HY1lWTUhybGtEUU9XMnl1UnBXdEVMQ1ZkdW90aUtGQWlhUHBRMkJOSTR6?=
 =?utf-8?B?ZHpCL1RzcUlLNUlhMmJXVTIwcmtPZDVhNjhnaFJxQXVXbkl5b0NvRmRveENH?=
 =?utf-8?B?SHl1RXB6K2RyOEg3RjVSalVpT2ZLUGJiM3lzc0hMYUZZVmxYeXI0T0lnTHU4?=
 =?utf-8?B?TzVXSXNhVElldHFNMXI2TUJtODRReFhkcldFWXVxMkhrTVZDUlhqTzc1bVdy?=
 =?utf-8?B?empHMk45V3FvNmIyUldZUkE5SGhzK2lxRVhBaERNVThjMGR1Sy81UmdLUkJY?=
 =?utf-8?B?RXBtNzNrQklqVWo5dVdiN3JsVlZCa3JBdE5Xb3poKzdHUmFWaTVYUk1BdnNR?=
 =?utf-8?B?Z0xONTlvUjBsRGxnOGQzQkJlc2JqVWt2T21sR2ZsS3RhNDFCWkxrT1NLZWNZ?=
 =?utf-8?B?dU1tSVhnVWlEVEplWndOOGZweUpHQkpDRDFucTE3aUZKYWs2eFRRRVd0L0Nm?=
 =?utf-8?B?MytCN3ZRY0tmY1FSTGN0bGRHb01RN2NIcWNJOXB4YzhpekExRFBCL1VkWnlD?=
 =?utf-8?B?cVdLOGhFWHp4V3NyRTZRdXBibXcweHExY0VUVUlyQUFCZEM4NC9KcS9jcExL?=
 =?utf-8?B?T0VOZmdmN1RqejN3ZmpMa3g4QjJoMlpWUy8vUU02SU8rRC9IT0tzUTFsV2dx?=
 =?utf-8?B?TlplK0dEOGt6aExlUzRmcjRsYVNaeUtzNGpvYTA5QkE4bGdqOXhyTHpvUTUw?=
 =?utf-8?B?eGdDTGZtMHh0UTRRbnRsMzk3MlpLQWpuaXFmRy9od0FiTm1KZCtleHdydk5H?=
 =?utf-8?B?NjFjMmlrREtzVTlTbXFiSDFsV0IvVHN5ZFZHMWlVK1JNQXcxTFFZTHVoalBV?=
 =?utf-8?B?TDAvVnhmeE5PWi9kb0lVRWZqbUdRUGNZWnFsOUVhdC8xRnQ3NHhqODlWTUc2?=
 =?utf-8?B?ZVVTQ3JsTzRPWjR3b1FGTkNlTmJFRDBIVDhFTWFFdUd0bVhpMm9xRjZ0dDlp?=
 =?utf-8?B?dVlvZ0RVMWQzTUZDcDJEdUJlazJXYllZNzg0T282M0JWUGtSSmNHY0RTVFpx?=
 =?utf-8?B?c0UxNmtVbUk2RVhlS3NXRFpVekpOYUJWTEV1emhzYTdtWGZ2Y1owbU9wSkFw?=
 =?utf-8?B?YUlxQjQ0bU9MWDhrbzBUN1EzV3o0Y2hxNkpmcTk0OFpMa3B1Tlo3VUpBbGxh?=
 =?utf-8?B?RGVJdWtBYUVRc2VaR0lPTlZreTlTMEpYdmlyY0FqcGQ2RVpXckVrcDY5T0Vi?=
 =?utf-8?B?REJiSW5qR1hmYm9PcmVSSnMzbUpkSUdKV01zMWRBOU5SRFhDcmJ3WEMzUE5y?=
 =?utf-8?B?ZFBsUjZDaE9KTjZWSk8wRC9qYVk4andkeUpwMTIwNnlabzAyMnB4cnkxYlky?=
 =?utf-8?B?YVh0QlNCWDFsUm1taFVER3JxRGxaY3R5VlUwbDZjcEk3RUpwYUNHc3FkZXhz?=
 =?utf-8?B?dEVHNEliZDBlWmtQY0dDQURSZy9HaVk0UUxheWYrWnBkNkw2dWxxR0VoNmlX?=
 =?utf-8?B?Nk83eml2U0ZqUjIvNDBFeU4yUHVHaDZoT1dkMEpKeDVOT2VlRGVnWm5tRUFy?=
 =?utf-8?B?eSs0Y0JjSktiejd6bHAxdE9zMUFaSUJHWG40Q0NReFpwem45WFZUVlBOUkUv?=
 =?utf-8?B?Ni9xZEk4KzQxMGIzUnh3Zjc3eHFHSVdReXdVQVVtcjU5R0QzLzNsK2JCZ1lm?=
 =?utf-8?B?OCtMOURiaWVvb3M0RythQUlQck5aYTZPZmFXWFo4TGlSSjg3ZjhlblJBQitk?=
 =?utf-8?B?V1NsaTVxaGw5dHRvclNYK1ZjQVhlNWh2NVFWdkZkeDc4T0xBMi9PMnRRcVB0?=
 =?utf-8?B?VjZ1WHlpdmhnSFZWZ0RKa2I2OG5yTHFvemVnS1BQUEtJTWVsaFpQRytUMWUr?=
 =?utf-8?B?a0pOT0JGNWJEVUtlQUtheHVYVW9SbkcyOTJNa09DbEFidldtd2tWY3FnM0xm?=
 =?utf-8?B?MU9aT2psUXYyT1cyVk5ib0JDRzAwMzhUR3RqQmwydW1oRU1Obnh3Q0ppbTlG?=
 =?utf-8?B?NGo2dGd0aks4VWxZb3UzSUsrZUV0MFl4RUtJa1hPMjdZR0pZUlllem85bzBR?=
 =?utf-8?B?OUVpWXJSWEZUb05aMmU2cHloQ000b25jZldoeDA5OWF3NG1xb0FrUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e54ecb-b1df-4e38-ab05-08deb1c2f57e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 14:13:23.7474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PTqKY3LZ17z95FABAbd1izoFme8e7Pna4XxXT9BLjPrJ4di362LYcizu8iOKMfZ/aWphmxIWwVpNcztLrEuGjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6836



On 5/13/2026 11:54 AM, Greg KH wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Wed, May 13, 2026 at 09:43:57AM +0530, K Prateek Nayak wrote:
>> Hello Greg,
>>
>> On 5/12/2026 5:31 PM, Greg KH wrote:
>>> On Mon, Apr 27, 2026 at 09:21:26PM +0530, Muralidhara M K wrote:
>>>> Historically, sysfs read buffers were allocated with get_zeroed_page(),
>>>> limiting reads to PAGE_SIZE.  Commit 13c589d5b0ac ("sysfs: use seq_file
>>>> when reading regular files") transitioned regular (text) attribute reads
>>>> to seq_file, which can dynamically grow buffers beyond PAGE_SIZE.
>>>> However, the PAGE_SIZE limit was intentionally preserved for
>>>> compatibility.  When binary attribute handling was later unified into
>>>> the same codebase, the non-seq_file read path (kernfs_file_read_iter)
>>>> retained this PAGE_SIZE cap for binary files as well.
>>>>
>>>> Drivers that expose binary attributes larger than PAGE_SIZE — such as
>>>> the AMD HSMP metric table (~13 KB) — cannot deliver the full content
>>>> in a single read() call through the existing path.
>>>
>>> That's fine, userspace must be able to handle a "short" read, and will
>>> just continue on and read everything afterward, right?  You can't rely
>>> on userspace always asking for more data.
>>
>> I think this is complicated by the HSMP driver bits that requires the
>> read to issue a HSMP command to the hardware first to updates the
>> table before copying from the MMIO region.
> 
> Then you have bigger problems here :(
> 
>> If a concurrent reader arrives, they'll refresh the table for their
>> PAGE_SIZE chunk read and the prior user will see a torn value. For
>> most part it shouldn't be a problem but folks try to co-relate the
>> Temperature and Power data from the first chunk with the Throttle
>> Indicators in the second chunk and sometimes, they don't match the
>> expectations.
> 
> Again, this is a problem, perhaps do not use sysfs for this?  You can't
> control userspace, and to expect it to always work properly is not going
> to end well.  This change isn't going to fix your problems listed above
> at all.
> 
>> The table should never have grown this big but some folks decided it
>> was a good idea and we can't fix it for a while and have hit the
>> PAGE_SIZE limit now.
> 
> Just delete it and use a different interface to the kernel instead
> please.  If you need atomic read/writes, use an ioctl.  Don't try to fix
> sysfs into something that it was not designed for at all.
> 

Thank you for the suggestion, Greg. The IOCTL interface approach works 
well. I'll implement this, test and send the next version for review.

>> If there is a better alternate, we are all ears, and more than happy
>> to try out an alternative suggestion for the described problem.
> 
> A misc device sounds like the properly solution.
> 
>>>> Introduce a new opt-in flag SYSFS_HUGE_BIN_FILE (040000) that drivers
>>>> can OR into their bin_attribute mode.  When set, sysfs selects a new
>>>> kernfs_ops (sysfs_bin_kfops_huge_file_ro) whose .seq_show callback
>>>> pipes the bin_attribute ->read() result through seq_file, allowing
>>>> reads of arbitrary size in one shot.  Existing binary attributes
>>>> without the flag continue using the legacy capped path.
>>>
>>> If this is such a big issue, why not just do it always for binary files?
>>> What is the benefit of keeping two different code paths just for this
>>> "new" flag?
>>
>> We can do that! For bin attributes that specify .size or a size
>> function, we can use a flexible buffer and for the ones that don't, we
>> can enforce a PAGE_SIZE cap like today.
>>
>> Would that be okay?
> 
> Overall, yes, but again, I don't think this is going to fix your
> problem.
> 
> thanks,
> 
> greg k-h

