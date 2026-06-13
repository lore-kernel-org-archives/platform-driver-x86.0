Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010064.outbound.protection.outlook.com [52.101.85.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9390F1A6817;
	Sat, 13 Jun 2026 18:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781377145; cv=fail; b=PckU9R5M4tym8I2iUn6Ovh5yeNdCAUVg4TQz8JbM6bknbYaXDnVrIKgdZebKn7y8RzgAQHn957SZzUR2pzNTE4GSz1D2zkuAUNO8LTH+j3kLGAjoE9vLUxsaoZeJQlqDq02K/+Qu0q+fPTRObj0XGYsdWqmOSqP0tBXNqPCGWzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781377145; c=relaxed/simple;
	bh=tBW46Lm5Mx91LTMakCrXU5OKR0oXgysfhUaOYq0kwkA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=U7Qf8J/B8MT+I/yovbs4BZ7zmFc8S3CFBLbHamCTMjw/ICJ1ygR9js+40LmqzYlkXwIHyiXIrXuzfcatBi3h7CXJ7VGU3AFgEW18mLwXpXpHLqinjIbAJhHfvMhYeFgBoOmzcz0v23HjNnoNe4an31CuJAaz1Hdu69It6ribV5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WD7yR4Ds; arc=fail smtp.client-ip=52.101.85.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WD7yR4Ds"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zS22bADAZmF7N4bjslimzibIjRB+YM998IYp7fSP7fnK+epR9Mlt1zJ7oJK+jkP/QMgsj+CqWUTkBYD+EvGUzvS7u7pT1UwOUNBuOdAHSRd4sHUFAdY1SQoQbV0twxBwMYnibh/oqbYuYWeJPBiG9WdYF/zxy4CW+FnaHZNz+EAOeLX6HLlFxXhhFmg06BbQj9XR5H+6AigHQC6x0KtjfaMLUPaLoGSLoP9zd7StZXDmQg0sqWc5FIU5e4xx/bDVJZNnD5y4+qFPaIrMARLPNBrKKxI/e+a9j7tgYGIq97caOruNsXMwDy9m8xljT4zw99YC74z7xvI4Njl7hsFpDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u2eZiyJQkJnVeJQA0sAA2wjEK664m5PdbTSPXgrtWro=;
 b=b/h58YNIJYRimxlGuIZBvYUGoZl0aeKdHQoN1UcYqMrcmjBkEMEaaPuSj468vymOn33Xxd406ktxNCyCuWilImxeZ8UFoKsBEzzsPwz7R+dfjbGOp0rUuMOqtZSDqALA2ILKSBJgIVZqg/j79egLdlAa/bFH0+ulgRQCvv+w/2gl9yGkXI/e5UGldqsw5isijVmWWiaLqm6xm92eaGbde5CXp6e5hPm0AGTKKJxZZlmHJ3bD3XEprH2JXYumL9QyWMCY36wKnFhLleRZrATP0UtUXno+WzsaipHogokCkNmFuUVr5n5yFsFv7kjzpdSFXD50c0lY6Pa74elG+eJHWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u2eZiyJQkJnVeJQA0sAA2wjEK664m5PdbTSPXgrtWro=;
 b=WD7yR4DsXSvaxOKrf1bftFiOIIg/5PzbshEJiIouue/k8pOSeDcxP3nbwSab27RXo9Ux2DnwFRahpFSN9OOhkvDvvx/1bxg6/DJOPgA81pr0iF7zlLw8miZsPZ1jRwtAExXBBc969s2f+emgin60Hbc/qsAk4DDhfurIZ35JzXQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by LV3PR12MB9410.namprd12.prod.outlook.com (2603:10b6:408:212::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Sat, 13 Jun
 2026 18:59:00 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.21.0113.015; Sat, 13 Jun 2026
 18:58:59 +0000
Message-ID: <f22c3ded-cbfb-454b-a273-cef6d603856a@amd.com>
Date: Sun, 14 Jun 2026 00:28:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/8] platform/x86/amd/hsmp: Serialize metric table
 access and ACPI HSMP teardown
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Muralidhara M K <muralidhara.mk@amd.com>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
References: <20260612042610.1629037-1-muralidhara.mk@amd.com>
 <20260612042610.1629037-9-muralidhara.mk@amd.com>
 <d24358bb-e6e4-6046-4da7-5709ca543726@linux.intel.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <d24358bb-e6e4-6046-4da7-5709ca543726@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::8) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|LV3PR12MB9410:EE_
X-MS-Office365-Filtering-Correlation-Id: 352f4d31-e605-4165-d629-08dec97dd389
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|18002099003|22082099003|5023799004|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	+sSeyOEpmQYseESZNGvujBJJQTKP7X+5SotXfY3ybYG/yIBFtK1kJJU7MIywYbrbIo/ZaAhz7xOCY/QIK4kfbaN/YbPHaHW1U9xUXxFVdHo+lfcqvmUNJOqvvQHMtbvmyGB7ehJzZF//GPWclFRx4k1sXUYVMtnfrVOSid9eEl7tNe580gPDPAi3ajoDgcwUnYa1B+wqCjoZlTjEe0k7qt7PMPZeP46SlKT4KBWQiRAd/HmD+Se9l0EE4PArnzzbxLUL69HkxL/pG8QudkAxHloysL9J+njNcuiMIg7ZO+/1J5pG1KoGIEvH2njwRbhqORUSZnqWqrFYEc0eBPsXdYopbHN7inb0MJVfKJlZnOxYKBO8iiBM/xf8UeG03FZYfCxh1P0tx42Vzzj1/WreEYKfrEVngjlyQ63Xf/1LsnLVCofkSk0l/aNINV5cgyOgB7fzVBwsjmfjc9h+3WaiaxInKtRyI7JDH8YXIaBuv3spI+UgwxMqfVbaY+Tqk36rMN2EFVbBjkq3gs0GHRjJi2zs8Xb3/x3Ay8essC1gDHOfav1iPYclcoHSiPiIgyueIKOuOnbzNEDODk8p4aJdhyObGqTtIXOkqB0Xlf928uDFGyhozx/SJwvLmLAgjIE88IVMft3TstaP23Y+zSRX6CAzT+jC7BiaEPtcxuZL2mMmrwOHRknHHKItc8EeH3zm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(22082099003)(5023799004)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDEzYklNNWZuMlBiU2daOXRYSDY1T0NJTTJ3RkVhcHBsSmNadjdZcCtRWkRs?=
 =?utf-8?B?cXlMY2lJN2IyR0FOSk93d3RDUzU3NUM3ZUYzYTd0S3A1UkxUc2VXQUs1aFFZ?=
 =?utf-8?B?ampvbWcxcUE5Rm5JTkFsenFlSEFXKzQ3Qnp6MUgwS2JEeGZOVUpGRU0xQ0h5?=
 =?utf-8?B?YTROZGM2aC82NHpCV0hya2d6L1k0KzF3ZkZ1TVZUN0NXTm8yYXFNcDlmcHhH?=
 =?utf-8?B?ME9ZMGg3NzYrT0dhTmRzbW9qUVBscnViUURuSXdRYS9UL3dQb3F0aVZtMmhL?=
 =?utf-8?B?Ykxzc3h6OWt1b2E1SitvWlRFT2kvVlAyaE4yMFZUUkw1SVg1dWZhd2hzdlo0?=
 =?utf-8?B?dE5rMlpFUkVob3Yram1iTHF2aVpKbVg2NnBLVVBrUmtPeURXa1hicGV3Q3J4?=
 =?utf-8?B?K20zTFAzOExublgrelkrTlU3MkZsTUFJR0VxZU41TVBWNFhHbDQ4NVRxSEQ5?=
 =?utf-8?B?YVBBaEVuMUdwVUxaeWtzZG9mYUhaWFEvaXEzbTdHMlQzNXVVNExGY1Q0NzJH?=
 =?utf-8?B?dFNQQ2tYUzdFOUorN0p3RnJwOUtYZXRhSm1JZDFJVWtoRncwOUgxZHdZRzBt?=
 =?utf-8?B?UGJoczdZekRwNk5IdWxabXlwNlFwNmdoUm5TaHZkek5HbmhhRTJGdnV2eE82?=
 =?utf-8?B?TXQ5UzY4RUtCNFhidVlOc3gxcWxueTFKMk8xdStFUnJndnpnaW9GbVlEYUh0?=
 =?utf-8?B?SHJPc25vcjh3Z2JwOHZJcW5vWE5YTThmZTl2eTIzMXJpRTFmMlc0N2dMMSs5?=
 =?utf-8?B?bWd3Vm4zQ2h1bUVlNzhGZUMvMHdIeUVmcW13N2FPWGUvRzgydmpEd29VakJu?=
 =?utf-8?B?YlJ1eGdoYmlPQzZxejloeDFWRE5tUCtYWXhsNkxIdklIb0NjckJGSW1vL1dr?=
 =?utf-8?B?Y3VZbThDVkhyMnFXaTBNUVlQU21BSmNYWXZPb3JpVHZWNFVDK1NURU9qZ0d0?=
 =?utf-8?B?WDA4dmp6RGRKRGovTWQrb09pZjdKNWtuaGRaSTd4Y0xqUG1mVnlTVFpaR2s4?=
 =?utf-8?B?L0RtQ29oS09zWnJsVE8xVVQ4TVBFblppZnVlVjIyczJybXNaeW5Ea2ZmSkho?=
 =?utf-8?B?c1ZSK1ZTUmprQWJvaFJvekkxWHpBcVdlZjQzK2lpQVFBajd2djBoVkRxYkRn?=
 =?utf-8?B?cU1FUG9SNTZxQy8vVjFadFNvZjMxUFpxUEFhYkxtTWZlYytrczNCL0x0VTY0?=
 =?utf-8?B?bnpoM2NSNlJTWUw5cUpnclFpZnpYWmIvQ0h5UFNSRnRaWGMzM3ZnUnlBdmJj?=
 =?utf-8?B?UmJjWUFlYk0xekwzeVpObHdEU3Jjb0hZUWJJUWErSGRBaUMxOTJISzJSMDho?=
 =?utf-8?B?MFJsakhycy83eE1NOTZYK2VEQlZqR2dORldVSjFqY0hSV0xTTnlXK1FmMXRT?=
 =?utf-8?B?alBudW1NZVBHNmN6aHJ1ZWJBTHlBckU3OHp0REFYS283TmdObktWRGp1eEZa?=
 =?utf-8?B?NEFGaUw0aGNPajUvWFdGeDFsaGFYVzZNeHAxbHdXbXF2Q0FncVl1WldMUDFN?=
 =?utf-8?B?N1RYTGFlZ1BubUlvWThqMlRSN2dySmNLb0tRUlpZTVMwekxnMS9XZ3NMNTI5?=
 =?utf-8?B?YWRmQ09qcVVNbzZIc0hwNTNzRER4L3VNN2tWZURVQUhjVTR4NENMM0k0Vmpm?=
 =?utf-8?B?YTRNUldFRFJVUENkSEQ1ekU4LyszK1UvNmhkL0t6UVhIbm83cU9qaWZpbUVi?=
 =?utf-8?B?QTk1MUk1cnZ6YTUyQzNlOUIxa2k5VGxNaktrbmlwdFdKY3lOalM2aDVMWTg3?=
 =?utf-8?B?bUo4QTcxWEpCZEg4elNwdmVkYzNZQ0xjVWxtS1F1Z2p0TzAvVEZNeVZTWVFp?=
 =?utf-8?B?QWNoTTlTNEpJcnhieW1hcWxVam5XUmVXWjdzak1OTmsySjFWcmVVQ1YvdXBZ?=
 =?utf-8?B?WmcyRlJKT2IzdDdzdGR2ZlFUVnJXTFJqaHFmZXFBbFJISHE4WkRrNHYvODV4?=
 =?utf-8?B?aWZMeEJpakxkTkswSkRVUUNWb2ZYOVJlajdITnR3YTdpNVV4eHpmb21TcGRU?=
 =?utf-8?B?N1ZYWjQ5bEh3dEEwaVlKa3Z1MFJSaTFUcmJLSURwRjBxbUJtMWVnZS9vMHN3?=
 =?utf-8?B?OFdSRFFiMFMzTmxFK2xWYnFzdjVWYlR1eGRva1JmeGkzbElGQmNTZjZETUk5?=
 =?utf-8?B?b1VUU0JzbXoxZWxqMTAxUFV0dUtlcmVQbHNqeXZNa093UXh4QW1NelB3M1ZI?=
 =?utf-8?B?b2hYVTNiVE9hZEhwT3l2RE8rdW1ZSGF2OENmbmJOaWoyTEYvd0w3VCtpZHk0?=
 =?utf-8?B?QXUxVDBmTWIydDB1M29remIyNExLWWUvMkYwRGI1ZWxFN1VyNXN5K1dvK3k0?=
 =?utf-8?B?WHo1SFBTUS9KRzFKK1Z4bmhEejVhMm94SHpDYXpIRjZjQyt0emlDZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 352f4d31-e605-4165-d629-08dec97dd389
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2026 18:58:59.7824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u20MjCtNxTAyvaWossvl5TagJpGQoSdpZd6hubYLfCof84wJ4Li5n1wbjIDb/GwEDPqileU0K2kkxgiYTUUPYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9410



On 6/12/2026 6:27 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Fri, 12 Jun 2026, Muralidhara M K wrote:
> 
>> Each ACPI HSMP socket bumps acpi_sock_refcnt after a successful probe;
>> the last socket to remove runs refcount_dec_and_test() and tears down
>> shared state once. If init_acpi() or misc_register() fails before
>> refcount_inc(), call hsmp_acpi_free_sock_alloc_if_idle() to free
>> hsmp_pdev->sock so a concurrent probe cannot follow a dangling pointer.
>>
>> 1) Metric table sysfs reads ask the SMU to refresh the table, then
>>     memcpy_fromio() from the mmio mapping.  Concurrent readers could
>>     interleave those steps and return inconsistent data.  Serialize with
>>     per-socket metric_tbl_lock and guard(mutex) around
>>     hsmp_send_message() and memcpy_fromio() so each read() observes one
>>     coherent snapshot.
>> 2) Every ACPI AMDI0097 device shares hsmp_pdev->sock[].  The driver used
>>     devm_kcalloc() from whichever device probed first, an unlocked probe
>>     flag, and misc_register() from the first successful path.  Parallel
>>     probes could race, and devm tied the array lifetime to one device
>>     while others (and devm hwmon paths) still called hsmp_send_message(),
>>     which could use-after-free the array on remove.
>> 3) Metric DRAM used devm_ioremap() and devm_mutex_init() per ACPI device
>>     while the socket table is global, so devm teardown order did not
>>     match shared storage.  Switch to ioremap(), one-time mutex_init()
>>     (metric_lock_inited), and hsmp_metric_tbl_unmap_all() on the last
>>     ACPI remove together with the rest of global teardown.
>> 4) After kcalloc(sock) but before refcount_inc(), one failing probe
>>     could kfree() the array while another probe still ran init_acpi() on
>>     the same pointer.  Hold hsmp_acpi_probe_mutex across init_acpi(),
>>     misc_register(), and refcount_inc() so setup does not overlap
>>     teardown or a concurrent probe.
>> 5) On the legacy platform driver, call hsmp_misc_deregister() before
>>     hsmp_metric_tbl_unmap_all() so /dev/hsmp is gone before metric mmio
>>     is unmapped, matching the ACPI remove path.
> 
> Thanks. To me it would look better to have the concurrency fixes done
> first. You could actually send them in own series and once that work is
> done, I'll process the ver7 series on top of that.

Sure. I will send concurrency fixes in own series first.

> 
> I took patch 6 nospec change into the review-ilpo-next already as it seems
> independent of the ver7 changes.
> 
Thanks.

> Many comments below.
> 
>> Tested-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
>> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
>> ---
>>   drivers/platform/x86/amd/hsmp/acpi.c | 58 +++++++++++++++++++++-------
>>   drivers/platform/x86/amd/hsmp/hsmp.c | 56 +++++++++++++++++++++++++--
>>   drivers/platform/x86/amd/hsmp/hsmp.h |  9 ++++-
>>   drivers/platform/x86/amd/hsmp/plat.c |  1 +
>>   4 files changed, 106 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
>> index 8dc6b4a8bd27..e526e2cea3e2 100644
>> --- a/drivers/platform/x86/amd/hsmp/acpi.c
>> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
>> @@ -20,7 +20,10 @@
>>   #include <linux/ioport.h>
>>   #include <linux/kstrtox.h>
>>   #include <linux/module.h>
>> +#include <linux/mutex.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/refcount.h>
>> +#include <linux/slab.h>
>>   #include <linux/sysfs.h>
>>   #include <linux/topology.h>
>>   #include <linux/uuid.h>
>> @@ -595,6 +598,19 @@ static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
>>   };
>>   MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
>>
>> +static DEFINE_MUTEX(hsmp_acpi_probe_mutex);
>> +
>> +/* Caller holds hsmp_acpi_probe_mutex. */
> 
> Please use lockdep_assert() to enforce any context requirement.
> 
Thanks for suggestion. I will use.

> For comments, the kerneldoc compatible formatting should be used (even if
> not writing a full kerneldoc comment):
> 
> * Context: caller must hold hsmp_acpi_probe_mutex.
> 
>> +static void hsmp_acpi_free_sock_alloc_if_idle(void)
>> +{
>> +     if (refcount_read(&hsmp_pdev->acpi_sock_refcnt) == 0 &&
>> +         !hsmp_pdev->acpi_misc_registered && hsmp_pdev->sock) {
>> +             kfree(hsmp_pdev->sock);
>> +             hsmp_pdev->sock = NULL;
>> +             hsmp_pdev->num_sockets = 0;
>> +     }
>> +}
>> +
>>   static int hsmp_acpi_probe(struct platform_device *pdev)
>>   {
>>        int ret;
>> @@ -603,49 +619,63 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
>>        if (!hsmp_pdev)
>>                return -ENOMEM;
>>
>> -     if (!hsmp_pdev->is_probed) {
>> +     mutex_lock(&hsmp_acpi_probe_mutex);
> 
> You should generally use cleanup.h when taking the mutex, especially, if
> you need to duplicate the unlock to many places.
> 
understood.

>> +     if (!hsmp_pdev->sock) {
>>                hsmp_pdev->num_sockets = topology_max_packages();
>>                if (!hsmp_pdev->num_sockets) {
>>                        dev_err(&pdev->dev, "No CPU sockets detected\n");
>> +                     mutex_unlock(&hsmp_acpi_probe_mutex);
>>                        return -ENODEV;
>>                }
>>
>> -             hsmp_pdev->sock = devm_kcalloc(&pdev->dev, hsmp_pdev->num_sockets,
>> -                                            sizeof(*hsmp_pdev->sock),
>> -                                            GFP_KERNEL);
>> -             if (!hsmp_pdev->sock)
>> +             hsmp_pdev->sock = kcalloc(hsmp_pdev->num_sockets,
>> +                                       sizeof(*hsmp_pdev->sock),
>> +                                       GFP_KERNEL);
>> +             if (!hsmp_pdev->sock) {
>> +                     mutex_unlock(&hsmp_acpi_probe_mutex);
>>                        return -ENOMEM;
>> +             }
>>        }
>>
>>        ret = init_acpi(&pdev->dev);
>>        if (ret) {
>>                dev_err(&pdev->dev, "Failed to initialize HSMP interface.\n");
>> +             hsmp_acpi_free_sock_alloc_if_idle();
>> +             mutex_unlock(&hsmp_acpi_probe_mutex);
>>                return ret;
>>        }
>>
>> -     if (!hsmp_pdev->is_probed) {
>> +     if (!hsmp_pdev->acpi_misc_registered) {
>>                ret = hsmp_misc_register(&pdev->dev);
>>                if (ret) {
>>                        dev_err(&pdev->dev, "Failed to register misc device\n");
>> +                     hsmp_acpi_free_sock_alloc_if_idle();
>> +                     mutex_unlock(&hsmp_acpi_probe_mutex);
>>                        return ret;
>>                }
>> -             hsmp_pdev->is_probed = true;
>> -             dev_dbg(&pdev->dev, "AMD HSMP ACPI is probed successfully\n");
>> +             hsmp_pdev->acpi_misc_registered = true;
>> +             dev_dbg(&pdev->dev, "AMD HSMP ACPI misc device registered\n");
>>        }
>> +     refcount_inc(&hsmp_pdev->acpi_sock_refcnt);
>> +     mutex_unlock(&hsmp_acpi_probe_mutex);
>>
>>        return 0;
>>   }
>>
>>   static void hsmp_acpi_remove(struct platform_device *pdev)
>>   {
>> -     /*
>> -      * We register only one misc_device even on multi-socket system.
>> -      * So, deregister should happen only once.
>> -      */
>> -     if (hsmp_pdev->is_probed) {
>> +     mutex_lock(&hsmp_acpi_probe_mutex);
>> +     if (refcount_dec_and_test(&hsmp_pdev->acpi_sock_refcnt)) {
>>                hsmp_misc_deregister();
>> -             hsmp_pdev->is_probed = false;
>> +             hsmp_pdev->acpi_misc_registered = false;
>> +             hsmp_metric_tbl_unmap_all(hsmp_pdev, hsmp_pdev->num_sockets);
>> +             kfree(hsmp_pdev->sock);
>> +             hsmp_pdev->sock = NULL;
>> +             hsmp_pdev->num_sockets = 0;
>> +             hsmp_pdev->proto_ver = 0;
>> +             hsmp_pdev->hsmp_table_size = 0;
> 
> Using kref.h, you can give a release function for the put call and
> get/put will be cleaner interface anyway than handling the refcount
> directly.
> 
Ya I will define the interface.
>>        }
>> +     mutex_unlock(&hsmp_acpi_probe_mutex);
>>   }
>>
>>   static struct platform_driver amd_hsmp_driver = {
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
>> index 9f7a5fb67728..4dc3826a0d57 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
>> @@ -12,6 +12,7 @@
>>   #include <linux/acpi.h>
>>   #include <linux/delay.h>
>>   #include <linux/device.h>
>> +#include <linux/io.h>
>>   #include <linux/nospec.h>
>>   #include <linux/semaphore.h>
>>   #include <linux/slab.h>
>> @@ -41,7 +42,9 @@
>>    */
>>   #define CHECK_GET_BIT                BIT(31)
>>
>> -static struct hsmp_plat_device hsmp_pdev;
>> +static struct hsmp_plat_device hsmp_pdev = {
>> +     .acpi_sock_refcnt = REFCOUNT_INIT(0),
>> +};
>>
>>   /*
>>    * Send a message to the HSMP port via PCI-e config space registers
>> @@ -488,6 +491,7 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
>>        msg.msg_id      = HSMP_GET_METRIC_TABLE;
>>        msg.sock_ind    = sock->sock_ind;
>>
>> +     guard(mutex)(&sock->metric_tbl_lock);
>>        ret = hsmp_send_message(&msg);
>>        if (ret)
>>                return ret;
>> @@ -497,6 +501,28 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
>>   }
>>   EXPORT_SYMBOL_NS_GPL(hsmp_metric_tbl_read, "AMD_HSMP");
>>
>> +void hsmp_metric_tbl_unmap_all(struct hsmp_plat_device *pdev, u16 num_sockets)
>> +{
>> +     u16 i;
>> +
>> +     if (!pdev->sock || !num_sockets)
>> +             return;
>> +
>> +     for (i = 0; i < num_sockets; i++) {
>> +             struct hsmp_socket *s = &pdev->sock[i];
>> +
>> +             if (s->metric_tbl_addr) {
>> +                     iounmap(s->metric_tbl_addr);
>> +                     s->metric_tbl_addr = NULL;
>> +             }
>> +             if (s->metric_lock_inited) {
>> +                     mutex_destroy(&s->metric_tbl_lock);
>> +                     s->metric_lock_inited = false;
>> +             }
>> +     }
>> +}
>> +EXPORT_SYMBOL_NS_GPL(hsmp_metric_tbl_unmap_all, "AMD_HSMP");
>> +
>>   int hsmp_get_tbl_dram_base(u16 sock_ind)
>>   {
>>        struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
>> @@ -504,6 +530,31 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
>>        phys_addr_t dram_addr;
>>        int ret;
>>
>> +     if (sock->metric_tbl_addr)
>> +             return 0;
>> +
>> +     /*
>> +      * Initialize the per-socket lock before anything that can set
>> +      * sock->metric_tbl_addr to a non-NULL value.  hsmp_metric_tbl_read()
>> +      * gates on sock->metric_tbl_addr being non-NULL and then takes
>> +      * metric_tbl_lock unconditionally; both callers of this function
>> +      * (init_acpi() and init_platform_device()) intentionally only log
>> +      * a failure here and continue probing, so an init order that left
>> +      * metric_tbl_addr populated while mutex_init failed would leave the
>> +      * read path locking an uninitialized mutex.  Doing the mutex init
>> +      * first preserves the invariant "metric_tbl_addr != NULL implies the
>> +      * lock is usable" on every error exit.
>> +      *
>> +      * Use non-devm mutex + ioremap so the shared sock[] array (ACPI
>> +      * allocates once for all sockets) can be torn down from a single
>> +      * refcounted release path without devm lifetime being tied to the
>> +      * wrong struct device.
>> +      */
>> +     if (!sock->metric_lock_inited) {
>> +             mutex_init(&sock->metric_tbl_lock);
>> +             sock->metric_lock_inited = true;
> 
> Perhaps it would be possible to arrange code such that booleans like this
> are not required.
> 
> This problem may in part stem from using global array to store sock
> instead of sock[] being just pointers to memory allocated dynamically
> on probe and freed on remove, and in part from the init order.
> 
>> +     }
> 
> This patch should probably be split into series so it's easier to
> differentiate what belongs to which fix (or if something strictly belongs
> to the ver7 ioctl additions and not the existing code, it should be sent
> with them once the concurrency changes are made to come first).
> 
I will create seperate patch list to fix them first.

>> +
>>        msg.sock_ind    = sock_ind;
>>        msg.response_sz = hsmp_msg_desc_table[HSMP_GET_METRIC_TABLE_DRAM_ADDR].response_sz;
>>        msg.msg_id      = HSMP_GET_METRIC_TABLE_DRAM_ADDR;
>> @@ -527,8 +578,7 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
>>        else
>>                hsmp_pdev.hsmp_table_size = sizeof(struct hsmp_metric_table);
>>
>> -     sock->metric_tbl_addr = devm_ioremap(sock->dev, dram_addr,
>> -                                          hsmp_pdev.hsmp_table_size);
>> +     sock->metric_tbl_addr = ioremap(dram_addr, hsmp_pdev.hsmp_table_size);
>>        if (!sock->metric_tbl_addr) {
>>                dev_err(sock->dev, "Failed to ioremap metric table addr\n");
>>                return -ENOMEM;
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
>> index 7343f8a1681f..5f5ad2885c22 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
>> @@ -15,7 +15,9 @@
>>   #include <linux/hwmon.h>
>>   #include <linux/kconfig.h>
>>   #include <linux/miscdevice.h>
>> +#include <linux/mutex.h>
>>   #include <linux/pci.h>
>> +#include <linux/refcount.h>
>>   #include <linux/semaphore.h>
>>   #include <linux/sysfs.h>
>>   #include <linux/types.h>
>> @@ -42,11 +44,14 @@ struct hsmp_socket {
>>        struct bin_attribute hsmp_attr;
>>        struct hsmp_mbaddr_info mbinfo;
>>        void __iomem *metric_tbl_addr;
>> +     /* Serializes concurrent metric table refreshes from the sysfs path */
>> +     struct mutex metric_tbl_lock;
>>        void __iomem *virt_base_addr;
>>        struct semaphore hsmp_sem;
>>        char name[HSMP_ATTR_GRP_NAME_SIZE];
>>        struct device *dev;
>>        u16 sock_ind;
>> +     bool metric_lock_inited;
>>        int (*amd_hsmp_rdwr)(struct hsmp_socket *sock, u32 off, u32 *val, bool rw);
>>   };
>>
>> @@ -55,7 +60,8 @@ struct hsmp_plat_device {
>>        struct hsmp_socket *sock;
>>        u32 proto_ver;
>>        u16 num_sockets;
>> -     bool is_probed;
>> +     refcount_t acpi_sock_refcnt;
>> +     bool acpi_misc_registered;
> 
> Don't you know this based on the reference count?
> 
>>        size_t hsmp_table_size;
>>   };
>>
>> @@ -66,6 +72,7 @@ void hsmp_misc_deregister(void);
>>   int hsmp_misc_register(struct device *dev);
>>   int hsmp_get_tbl_dram_base(u16 sock_ind);
>>   ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size);
>> +void hsmp_metric_tbl_unmap_all(struct hsmp_plat_device *pdev, u16 num_sockets);
>>   struct hsmp_plat_device *get_hsmp_pdev(void);
>>   #if IS_ENABLED(CONFIG_HWMON)
>>   int hsmp_create_sensor(struct device *dev, u16 sock_ind);
>> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
>> index e07f68575055..2ef2102d0af3 100644
>> --- a/drivers/platform/x86/amd/hsmp/plat.c
>> +++ b/drivers/platform/x86/amd/hsmp/plat.c
>> @@ -230,6 +230,7 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>>   static void hsmp_pltdrv_remove(struct platform_device *pdev)
>>   {
>>        hsmp_misc_deregister();
>> +     hsmp_metric_tbl_unmap_all(hsmp_pdev, hsmp_pdev->num_sockets);
>>   }
>>
>>   static struct platform_driver amd_hsmp_driver = {
>>
> 
> 
> 
> --
>   i.
> 

