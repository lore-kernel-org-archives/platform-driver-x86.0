Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5F567A05
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Feb 2024 11:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708430055; cv=fail; b=p1YCK4X8TwwKxkMycQsJtNSS5Hk5/TInAGdDnFclY14d7m+Mk95293frEH7MEFrX/AajVLtux7aFhS882cXS/liFDAgBIHJ1HtdM8B88RMu/WgUIEw1vpEopfQuDAvFr8tMyLC/wyC7LY+axqilkcoBap4E9RHHQanZuwjaukCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708430055; c=relaxed/simple;
	bh=+g/iU4J+gaCDqPl+/hqOFCQK7Av1g6/nyworpLx4zhc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QYVhIiCYN/naxjkCztat4FxNYd9+JEaGQp9YIbU1fBF1jDJ99JJWMku0rrsKBjJiplTm+KNTLGrJWVvDSaXPtF3Oo9rncnpSHYXNtzDnN7jmJXxsO4sCWME3iXU+qqH5l63ep4gexq1NfvK+/u8nep8I5/Hf9ruzl6dWAI9k1HE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GvpsfPv+; arc=fail smtp.client-ip=40.107.243.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GvpsfPv+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ak4cANJVPJZ4acKG4yroHnVHCPl0fgKeaHXLtf2DZ2PBS7YsrVQsai2GWfmdYFkgaf1O2XvIFEmAtrOmcXE1ExoJXmQWLTX5Gddha86Pgw5YnD6TC9K4/aRC2yeiS7PiFog/XConZ7BTdmUbqhbDcZYbIIOXGPq5vqdkCXZfaNzclJTbnY5xixQxvMWT/LSUDA8YC5vFQZ6xTWZxR+Yag9PY50Fkpjd0LTR7wbtZgH/C/GJcYfIqpROYcGqO2aaZ6Pz3odyYWhPyjMyZMwvDI7a6QIdO99H/ZHzajNrfV5VV2SQO7fb+/bROpRcOOoYlH5ETqNV4X4deY++0L06Ong==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DAHF8pUH9ErEcbdysUfYX2VfZ8s2Grli71LPtpx3bBg=;
 b=KQCGM0421YnCIftG0HMKSU0by3GhtaEBfsrBbkJ8K2O4gywtwCsqTl+ns2hLtN+i6rskeA/+jFjTgVjp+GxKxXM2k8erjDxzkGVg0gaFgTjf77N3N5KZWCOJQ5+k+TUz17QcITPCA8AISdCcdv6//n5fzjzfMPMAifbkb63+UOfGiiV3rVu4R0KlzSN/WQYzT3mCVf7FbrHfJ3UjZh8JvgX5ZvvUcqn0BzvBpHvvukufvhAnvlZI17fz4p+x4CLitAjolVw9C3wZQ/B17KdQqAw1r1pvaPdbxgaTg3SZli32Ik1T777alhDtKv5wjQEL5oz7+Yu5pkSYrZAczCZgaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DAHF8pUH9ErEcbdysUfYX2VfZ8s2Grli71LPtpx3bBg=;
 b=GvpsfPv+AcIaQ8qcpQcUWAawkj6yc13svUXKpabOMrLZn9soTFOhmyzQM+woF+6M9djkRt8ZgxDt1L6og6R7hQyobkzf0nzNcveOCDeTxZmd42G50MJlNVfdoX3w6quGGzyujK8PzHcoUc7t5zp0YhRE8JLFpKHCp+ugDZM8vRg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by DM4PR12MB6375.namprd12.prod.outlook.com (2603:10b6:8:a2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.20; Tue, 20 Feb
 2024 11:54:11 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::f84f:ef3e:cbb1:9c6c]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::f84f:ef3e:cbb1:9c6c%4]) with mapi id 15.20.7316.018; Tue, 20 Feb 2024
 11:54:10 +0000
Message-ID: <64d36beb-0123-4f00-b1e2-692f1f54064d@amd.com>
Date: Tue, 20 Feb 2024 17:24:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86/amd/hsmp: Add CONFIG_ACPI dependency
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, kernel test robot <lkp@intel.com>,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20240130073415.3391685-1-suma.hegde@amd.com>
 <297e679c-a05e-4d02-bde4-53697ff9f4a7@redhat.com>
From: "Hegde, Suma" <Suma.Hegde@amd.com>
In-Reply-To: <297e679c-a05e-4d02-bde4-53697ff9f4a7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0142.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::27) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|DM4PR12MB6375:EE_
X-MS-Office365-Filtering-Correlation-Id: acf1731b-e952-4f83-71ed-08dc320aa69d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GwfuqkYozrUPYv6QPha2SPdcGv7bQzoDJy1RkMAvZ3Ms7Mfq44AvpgZO6bg9vwWT6JzPcz1jYGH7N4QeJWq3dzCDYShDtrpvJX5u2bl8LxYnuH/sedBm0Mt9YKEfO7BUG0XKhtdRERWGquwupFM0BknYiNT8QxU7ZiiEvEmt/hvirO+wT2lK1wky/75VvHLE/Hm6SqRLtE6kNShNVX5LojFA/C3yD4EY9o7PQDFSn5yCHhmhZSE2Cq+4NfPR9p6Hst60+rtec0niit+/OY85SfzjXT/DBRgcNCUkxS2W2OeJy1wufF8dJf1PqhSvaQRHOCsJD/JltyU+HsbQ5JK93+EV3gm4uXkHXzUhuNOaFjS7mv50g/FBClc6YqRCPg5d8qvsB2CqhEWsquzzZMi3Xa2Zr14WxIw9jb37B1hJEhCTjI9LyrpDrPT/HHp48fttzOLKfRRpC3/3vt3N2SsDjQy366pWZm57sI+tRtmGCBN1fZ5tPerlaTFjgvpA7wMf0VjP8VL6mryXs+p19d/G5G9bIMZO4cP3Bk2NZqeiLFgb/5ecXptYVK0bGOd5XmKD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230273577357003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1VhTHNubmdHMUEyMGVDOS82YmlpMVlJdVJHeitCNVdRNzBFL3JjN3NVa0RR?=
 =?utf-8?B?dEpEU3h5N3VrZ2VsZVlOUkN1bUp0b2JBa2Yxd2FTRVl3NkxSNnBxTGxwSk1i?=
 =?utf-8?B?cVgweHlYbks2YlhMU1JLZERZaEJNR0VNdlo1MDhEalZpSFVhZTRvbk5OQXlM?=
 =?utf-8?B?RVZMR2JZMXVCTlZNbElaM1NUcnRXYkh4Y1ZKekYzODRCVi9OMTlPWjJFQ1I1?=
 =?utf-8?B?T3pzak9tTmpyblJXRExsZVlJTitnRjVac1hRam9NakJWaCtXMHVLUXIwRnNa?=
 =?utf-8?B?Z2dWRW5PYjdBVmp4VDhLUjAyd1c2WGpGNmtpVlhWNTFtV3VOYThXSmhOaFpD?=
 =?utf-8?B?b1pGbk1kWmFyVm5PQVI4YTdvY1VFLytjUHRUYi9KSEtyZWt2cnV2SFdwUEhI?=
 =?utf-8?B?OVdnSHk5cmdNbnJ2M01iUXhoVjBFZTdwb2pKRU9LV2JrWW9xblhWOStKeHhX?=
 =?utf-8?B?UHJzTEJIYW4vUEtzQzA4d1lGdXl1NnRJSlNtSTEyS2taTDdCYkFlcWxmdEdF?=
 =?utf-8?B?dHE2QzM0dlJDanhiOWdHMXU0aVRaT2pja1B5dFAyblI1MkJsZFVzMFV5OE5X?=
 =?utf-8?B?bjlId3hSdlZVQ2J3aytNbzdXQTY1K2xpbjhpdTFPbEJBQmt5S0lETWRNOUVs?=
 =?utf-8?B?SXE4bXBWNzVCTSs3SUVtVW9VcHIwWlIyNVhoK2piNUM5c1dzV0dJd3JqczNj?=
 =?utf-8?B?Mkw0RWVMZUdSSmNtaEw5R25pZysyV2Z1NEoyaUJFNU5ENWxLSllJNU9OYVJW?=
 =?utf-8?B?MmJFaWRGeUoxWWZORDdIdSs2Ri9XcnJ2c2Q4MXdjWXRGMklWRTFoTGR4cG1B?=
 =?utf-8?B?NE5KMFZkR2ZPM2VhSGN5UVJWMWRPMHR3bUpZSkFLWmM2dHIrcGFndmxaTWNO?=
 =?utf-8?B?SllmZ2h5dkhFVmcycGZjMmh2akMzNkJhcWhndGs2ZVcrTERlVFpaZGVxYkJU?=
 =?utf-8?B?UnM1NDBIQ3BqMU9KVWF1TEFRZ0lsQ28zU2ZJVXV6cjhoeDFIMmhJMVNWYnlm?=
 =?utf-8?B?UFRzUmlBcnpycGJObTROYVlsU2Q2a0dvN1ByNlVPSThNeHJKRit3TDN6TVJu?=
 =?utf-8?B?VkYremxCMWU5MTlmOVFsajhXZjJ0bUROamMwUGdXVDl0OUlqWjVuZ240R2hY?=
 =?utf-8?B?Y1l6WktmNGpEem1iQmhQL3V3azFibThyU1Y1Yk9sWWt6YzVwTjJmczR5cDRt?=
 =?utf-8?B?U281d1VsNnJCMStraFdhN1c4S0MrcXZpRDRrQXVXZEN4YjN3Z3FvNTh1a29u?=
 =?utf-8?B?RUZKemhKSmZ3QVFsenlqMHFSbzJ5ZkNBVk9wcTc3bTd1S2tFQUVNY0lJSzRB?=
 =?utf-8?B?ZXQ3VGR5d0hUdXp2ejQ5L1h2aFlKNWx0YXdrQUxKRFkyTUhLR3RtcDJjZXRQ?=
 =?utf-8?B?RWpEaFVYZi9kOVdJdVNTY0g2bXhEK0lSZlFTSzlaZzIvS2psTENRTDFZRVlY?=
 =?utf-8?B?RG9nbG41SzFnRTlvUXdJMmdVQXd2aDRYdHNOcDhLTWtwV0krcmZKWE5rVHl3?=
 =?utf-8?B?SldaTmhqZ091OXU3Nnc4RVN0eDIvbzdwQ0JvdjdjUFBNUGxLUWU0YVQzMll3?=
 =?utf-8?B?QkRuZVhVdEpBWGdJd05EcFVPaXZ3VWN4d3NqRXZVbkJGRnJ3c0ZBVElLVFEz?=
 =?utf-8?B?cjBDMU1UaVptRE9iSGc1cTVZaXdlQThJTTczVVhhUEJBdE9iRlZ2cmFaMjlo?=
 =?utf-8?B?UUFrU1pkYkZzREtoRXhYeHRhb01tNzRENzVoL3NkTFlMSnVIdmJtVjQrNDlF?=
 =?utf-8?B?WmVlYzhMT0dUNGhIZWQ1Tm5TdXVlQ2JKK284SUxyclBDczFORzg1NWtOUTNR?=
 =?utf-8?B?MkJqbUZ4ZlBkcWlhK0VESjdINkpwM3ZuU21uMkZYRnl3NjJabzUydWNuUHFH?=
 =?utf-8?B?TnZaYUdJY1BFTlg3ZGwxRUtKWnFrUk12cHZxcGZYcmNYN0s2S2R5Ykt6bnBU?=
 =?utf-8?B?d0xyU2FnUHdTcVJubGlZYzVZUnVlZkpwMVd3c3RkMitZMC92czJFZzRHbUJ6?=
 =?utf-8?B?TWQ2bVJPNzBRV0F2NVpQSEc2VHBnS1BwbnZ1Uk9uTzVEemY5K2RtRDE4NW1h?=
 =?utf-8?B?aE9kd2ZHa2pmNUV5QmQvamZKY3pQWjlLUytnNVRYVjFvMnNxcHllOCtWTnM0?=
 =?utf-8?Q?II5FLg+zGfYS4zIEwC3vZI+QK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acf1731b-e952-4f83-71ed-08dc320aa69d
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 11:54:10.9051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Knes3sFZkUdH6Zc3ELM2tx0XLqmPqGThEtJfgXBh8UnxZYx21O/936OFFWXcOIHjCqYV8MucTsfSrachk24s+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6375

Hi Hans,

On 2/19/2024 6:15 PM, Hans de Goede wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> Hi,
>
> On 1/30/24 08:34, Suma Hegde wrote:
>> HSMP interface is only supported on x86 based AMD EPYC line of
>> processors. Driver uses ACPI APIs, so make it dependent on CONFIG_ACPI.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202401281437.aus91srb-lkp@intel.com/
>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> Thank you for your patch, I've applied this patch to my review-hans
> branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>
> Note it will show up in my review-hans branch once I've pushed my
> local branch there, which might take a while.
>
> I will include this patch in my next fixes pull-req to Linus
> for the current kernel development cycle.
>
> Regards,
>
> Hans

This change was merged by Ilpo in review-ilpo branch into commit: 
platform/x86/amd/hsmp: Add support for ACPI based probing.

>
>
>> ---
>> Changes since v1:
>> Correct the email id for Naveen Krishna Chatradhi and change it as
>> Reviewed-by.
>>
>>   drivers/platform/x86/amd/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
>> index 54753213cc61..f88682d36447 100644
>> --- a/drivers/platform/x86/amd/Kconfig
>> +++ b/drivers/platform/x86/amd/Kconfig
>> @@ -8,7 +8,7 @@ source "drivers/platform/x86/amd/pmc/Kconfig"
>>
>>   config AMD_HSMP
>>        tristate "AMD HSMP Driver"
>> -     depends on AMD_NB && X86_64
>> +     depends on AMD_NB && X86_64 && ACPI
>>        help
>>          The driver provides a way for user space tools to monitor and manage
>>          system management functionality on EPYC server CPUs from AMD.
