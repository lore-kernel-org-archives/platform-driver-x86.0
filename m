Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010001.outbound.protection.outlook.com [52.101.56.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2174EA377;
	Tue, 12 May 2026 06:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778567226; cv=fail; b=oDdX9gDAV7pyCjG1QaJZjp99UkAUh4j9huXQcVyrHNlckBxXQTN0QyMyX5i2Y/VSKPlq5fnVRkr4Vt9ZAAqsY9TmGfP61KIFBNBGR2iDxt9kCDtrNtnnzci9Oz78UQYdz2yBpsihcI7ajuTfcSDbVWrwQDnekBTcWZ0M+GnMyGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778567226; c=relaxed/simple;
	bh=Cb6bTnBRgUMpnNjpQB1A3kJ7cwcbHmEpCiG+yB1MR74=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=J4iz6emHqgiuZa6vBg5ubjVsUrJ3iAhqi9YPAqcQIRBTrn8qSMetCl0YNoIfBwDrPNNbIBpDzndBQ57N43K171A/61q4lTC6kSCy1gFKUTxbDhQMbEjq3M+Fy/rOERZOj2kX5lwEoVQJzbUAX22B12qIW0c5BKtbudYLFNXWleM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qzBYb6KJ; arc=fail smtp.client-ip=52.101.56.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qzBYb6KJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hnjXDlHD1YySRQKM05AFZiOObUhT8JIZslsceysYPFenQG3MZPvWbFQ0IcaCzKyHKtm+c+1yhHfqz1I3Rj+rZIBFuCn7YwbYy4o3XMT0uDUQz+bUovfJz/f19D79qvyAqfl40Q8BNESGUonCEIUFPPH68w4yHwj2OTOEONedxw0woOJUEZcp2ai9pXKat2Nu2qgc5FH/c+9v5QBEEGIqn5+evMPIekW+yHvqlHFVRDY8N+RHSs2H2onFN3ZJOe6U62kZZO4lu77rPp7KTfznZ6ryRX0tnPgZfjtJWcj5elKX3lEY5sUBth6UwkNv72GqLDomqGUgxwERqiMMfsiX2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nyZPjZkF7osE7URieCZY80sJTcCg338GiCsqQe5tkAc=;
 b=JtcGxJ5Yokh88b9XesehEQvNdufgBjqPCjNogt4TVfS5htC3Vcxmrt6A3qTxk32f09YkS0CBnOYRjqYrmJ1fG/KqseQnW9SxHMQdvDrLBbvV4WIG7WmfHUQvFSCDqSzb58ufc4eMwZnUl/vle9MAKBvOn1mkpJmYzr2nIpt1Hrw6/nLqhk8t3ITEWSuC7yhVP5VNuyvdXcfrMtVsvJKhkzbZHXG1kwfh5l/w7uF7uNHES+96M2nB4btTvuGXKuLmdd/UP3gWybMxxUwNsxV2TVkAjSa/ilTQgi0S+C+ybBCK+o+RYA8TLp4Lxz6H9Vqppxsg+vdw0A8uiShg4AcADA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nyZPjZkF7osE7URieCZY80sJTcCg338GiCsqQe5tkAc=;
 b=qzBYb6KJqMZrSH0ncA/1erfpdlL07fXzLXFklQYbGDW7pB6SL34OscZqnMUCQJwiNfbyaba3Kt1M4npEZhDtlcQwigY9tBqb480Nr4NpIRGd1RpRUzbSexgdVoNBEyo/eMzHMYy/rrF8DSSIVZWBbzfw80K8duKTea6dkSbFmSc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by SA1PR12MB6776.namprd12.prod.outlook.com (2603:10b6:806:25b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 06:26:48 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 06:26:48 +0000
Message-ID: <d4cf0ef8-eb54-4962-b58e-afde936b768e@amd.com>
Date: Tue, 12 May 2026 11:56:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] platform/x86/amd/hsmp: Make metric table read
 locking use guard(mutex)
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Muralidhara M K <muralidhara.mk@amd.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 driver-core@lists.linux.dev,
 Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
References: <20260427155129.545327-1-muralidhara.mk@amd.com>
 <20260427155129.545327-7-muralidhara.mk@amd.com>
 <9e34e44c-d19c-5994-1390-107b4058367c@linux.intel.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <9e34e44c-d19c-5994-1390-107b4058367c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0093.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:268::13) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|SA1PR12MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ee4875c-b96b-4651-e95e-08deafef7257
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	fTn+wi8LdVGLvbBzD5iFqlKgTXgai4rDxU1Weql9q4hS1UcA/tlgdtv6aeRHVYlEvwuJOVEMK9pkKVqjlkIyDOLbW2jFyD3IY1gDvo8nlz5ZJ8rjLnnWaPvcqfId0WAXWfZsstTe7c+iTlyGj3txY+n67adKu8t6YAVPv/TEeqUwvG8sTAWS0vAUWnQJudq3VJk4QwtnOC9nFWvUxAcQKvXgx6H+Im03Km+dxOdOXMqWZXCiT2oLi5ZsBXi4Gbp/FxC0h9biSbhw2Zm1qHd6R/9O3+j2NBGOnFcafZ0zumPjdKpp0ABi+J4/tfGRA1vSjgrsu1YLkshtdysIeHn0ylRuKcYRCUyK++Y4YQ++YXA9DKH7VBMxCR2cMdtC3tqLP7RwdEwrEFR9viF1xDw+vI2zUUqjJ+PnkK2xTLU3dGk0v2//G6nms8CpjOZcJvXRF01WbADvqEFhr3Wl4lBQ37pAJSmReuZrkH64qWgQAwB8jcFXO6wfpu8bpgn2G8vfYjmt0a4gObHY8rlhbgIJDdBaJU/nk9DF+Wkf4oo/kj4/0/n0Kq4Nk8x1gS+rHT/9CVB7V2AnaUq1JoOXt8hiKdVSP/e5H0Nih9rNzr4m75Ex+nkGEBxHlYjcBqald2jtKGLYhnLUIO6iMWMo44bZdMVJgHPTzfrSjsca7O6oEZWD3vXtKIXXJ2+BwxoYjrMl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0RiblQ3VUZaZnovbUUyUUFraVJ2NkVtRzhSVlJvb3NjZVJuaUdUUEZVVUs1?=
 =?utf-8?B?N3lzZHZWcXhoYmNBM0dNRUtxNGFVK0pLaG1Db1NOTXRFalZwNk1PeGhIdEQ3?=
 =?utf-8?B?TzJpeklWdnkvTXBVc3p3UlFDSmgrL1Y5alQ1enRORThGRmxrVnJzdWdjelcr?=
 =?utf-8?B?MGJra2F0dkNsdXlOOEFRc0F1dmd5RzdnQVlkUmUzemRRRmdMVmtQUzF2NDh2?=
 =?utf-8?B?Z1BabTF3YlRGNzBsTjZWczcrUVRLWTl5TmRFLzFlMlNhaC9IZWRVVDJ3VWpv?=
 =?utf-8?B?RHJlZjYwaXJ5VEhMVTFDOHdsYytGM3JPcFpoNk5CbjFZSnlxRWlXalFLT3Rv?=
 =?utf-8?B?NVRSa2RMMXNiTkFyd3hJK0k2ekxLU1VZTEhSYlZVdUhZUnR5dnZndlJBNk8w?=
 =?utf-8?B?MDNMaGRmc3ppTHNnZkN5VUtqa0hndnA5MWpOTXhCNUVGQU42S3doV2RXYUNx?=
 =?utf-8?B?UjM5enBxT2ZNNXY5ZFA5K0hQWHJBYnZjYTJMN3pyWXR1Qzc5Zmc4eXc2akYx?=
 =?utf-8?B?QzlQbkw5cXhrNXJ0L29SOHBCdEhuNnV6eHFqTEN1UncrR0QyM1YvYnZlTnpp?=
 =?utf-8?B?c0dZN254dTV6R0tUQkluL2UvUXJReU00NGFBQW9sNnNWeVZuNXNWQ1J2ZDNG?=
 =?utf-8?B?T1kvbHVZYXAydFRLODlxN0pWN0FPbFEwcjRNd2toS2ZrTjZsVEFUQmxyNldw?=
 =?utf-8?B?Y0hSV1dTTUJST2IrTU9xSGNSN29adzJocXBnY3plQTdwa2lQN3JXL0tzZ1dF?=
 =?utf-8?B?OEJyajI3WGk1dXdvOW14NVA0d1dnT2s1VDhrdTdUK3Q5YWN2MFRQZUFwWThs?=
 =?utf-8?B?TllsRzYySmlLUk9XOVJEV2ZKVE44NVI5RWVEdkNHUDhCSGZuZUtZUW1ORmtT?=
 =?utf-8?B?cE9iVmVoeXNvTzltVERESVA0WmdnTWxXQ09WTVNGTDFTMXRrN3VGQ3h0cStX?=
 =?utf-8?B?WG1wSXdpUmhLMnRWa0xKWUxSMkM0UmVXbDNBVmpLTUwzV0xXQ092S0hteUtO?=
 =?utf-8?B?dkMxSGFyMzN6VzVJczhQcEFueWZwa2Z3bjQ5QmcvejdIeTNEYlhCVnRQUHlh?=
 =?utf-8?B?MjVuS0N0Si9ISy9rWUs1b1Z2YnowQjh4ZjRmN3lsaUVxZW5xQnh2OXFublVM?=
 =?utf-8?B?VGZuaWZkeHZRREI1OWhlRUdqcTJRQ1RyemxGYjNxVEwvdzEybG5PdEwzQlIx?=
 =?utf-8?B?ajBibTFRV2VHeVl5bmtYQnNKRzJvN25FMDdzbXlhMXVxRWlEL2VvUnliSzJQ?=
 =?utf-8?B?cDJJc2dkb3BUR2Z1aWtZb0dDQXU1N2IrcXVickY2NHYzUGNCTVpGcStsVHVE?=
 =?utf-8?B?L1E0SE5QWUFpZjhnaHFDWS9LQjQ4Sk9wZDBvL2NSRGNGNUZKMnZFUDUvS1Iv?=
 =?utf-8?B?dWp4OTJLN3dZMFVaOUQvYXJQY0JIdEpTRi8yOWx0TDNnbWx2bjRlU0dBc284?=
 =?utf-8?B?enI2SnhmaEk0KzM4KzZyTXpXbnFveGV3MTRRTDlhOHg4MVVwS1g2and0SjFh?=
 =?utf-8?B?OTNNM0hYcEJEN0M1bURhbnE1SitDSURpczFGZ2ZrYU9qdEZSRjlkQVlzRytV?=
 =?utf-8?B?QVVodnh4dG9FN0FBam1xbWtpWG05MVl2ZmIrM0R3UGtKaXozYjlySDYrR0VU?=
 =?utf-8?B?QjlMYzd0YnZtb1BnWWt4NWs3MTFvNk9Vanp6VGorUzFhTlpDcEhOaGJBNE5m?=
 =?utf-8?B?eG5nMVNQaWlJMlovQ1JNdGlqdHhVV0RTVjYyUmZQRUR5YXNDWDRSdFUwRVpS?=
 =?utf-8?B?TXY4YjlOc1JUYlVMSm5IV2gvR0ZRWUZORTVmMDBnTmprOTVRTHlFUkszMndo?=
 =?utf-8?B?YkZFakNOUlpBZWJkZXhrYTlzQjM3cldVQm1KQzhCL1kxRU9ZSzFBK3pnSHhj?=
 =?utf-8?B?ZEdULzNDT09Gc3lGMFM5Z2wvTU9UUEpVVmlNZ25jdUY5aFg3REM3dXBLRHZ0?=
 =?utf-8?B?aHRLVnBhSXNmYnZVM3MvY2RkRkUxWkdiS0tHSHZ1ZS9Td0xJL1RJK2NVWnZs?=
 =?utf-8?B?NHZpSUwyN1FHRmtyMm1zcmVwTmdGLzh5WGhqSC9HcUViYVlWZm1pQmU5V2RO?=
 =?utf-8?B?QWYrMmY3alVrNGJiUFdnTkc0UUFMWmY4QmhJUCt5YnJvQjVOT2IyazZmR0F5?=
 =?utf-8?B?REh2OWFmWmo2aDgrQXhSK0UydVdPeTVCRHBqZnlPMmR4Q0pGUHloS2krQXRF?=
 =?utf-8?B?MVdkaVI2OWMwNy8yVVk4MlpwVUpzY1NCeXZsemU0VWtuTzdCZkxyNlc0SGcw?=
 =?utf-8?B?S1ZUaGNjamNTOHJZVTlDSExVUksyZTJhcm5DWTBxWmRUcllBSkMyT2s1d0dF?=
 =?utf-8?B?Y2I2Z0dpajA3M012VEFVZzNTOXdLcGhRREtuUHFWOG43Y09pRXJoQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ee4875c-b96b-4651-e95e-08deafef7257
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 06:26:48.4682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dkQTGlHKRM66/to0Vu450KI3xVkJ3+Z+x9KLP6qt0HLKBJDYCyxS5c+x/Bow3pH0ECx0nrWF25V9P4x00H7nZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6776



On 5/11/2026 10:57 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Mon, 27 Apr 2026, Muralidhara M K wrote:
> 
>> Add a per-socket mutex (metric_tbl_lock) to serialize concurrent
>> reads on the metric table sysfs file.  Without serialization, two
>> simultaneous readers could interleave the SMU refresh command and
>> the memcpy_fromio(), producing a torn (mixed old/new) snapshot.
>>
>> Use the scoped guard(mutex) API from <linux/cleanup.h> so the lock
>> is automatically released when hsmp_metric_tbl_read() returns,
>> including on error paths.
>>
>> Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
>> Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
>> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
>> ---
>> Changes v1->v2: New patch
>>
>>   drivers/platform/x86/amd/hsmp/hsmp.c | 5 +++++
>>   drivers/platform/x86/amd/hsmp/hsmp.h | 3 +++
>>   2 files changed, 8 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
>> index d6e377078182..49e7ed9981e9 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
>> @@ -10,7 +10,9 @@
>>   #include <asm/amd/hsmp.h>
>>
>>   #include <linux/acpi.h>
>> +#include <linux/cleanup.h>
>>   #include <linux/delay.h>
>> +#include <linux/mutex.h>
>>   #include <linux/device.h>
>>   #include <linux/semaphore.h>
>>   #include <linux/sysfs.h>
>> @@ -364,6 +366,7 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
>>        msg.msg_id      = HSMP_GET_METRIC_TABLE;
>>        msg.sock_ind    = sock->sock_ind;
>>
>> +     guard(mutex)(&sock->metric_tbl_lock);
>>        ret = hsmp_send_message(&msg);
>>        if (ret)
>>                return ret;
>> @@ -408,6 +411,8 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
>>                dev_err(sock->dev, "Failed to ioremap metric table addr\n");
>>                return -ENOMEM;
>>        }
>> +
>> +     mutex_init(&sock->metric_tbl_lock);
> 
> devm_mutex_init() + don't forget to handle errors. (without devm_ you'd
> have to handle mutex_destroy() calls too)
> 
Thank you for the suggestion. I will update the code and test the changes.
I'll send the next version once I've verified it works properly.

>>        return 0;
>>   }
>>   EXPORT_SYMBOL_NS_GPL(hsmp_get_tbl_dram_base, "AMD_HSMP");
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
>> index e7f051475728..038678b8ab0e 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
>> @@ -16,6 +16,7 @@
>>   #include <linux/kconfig.h>
>>   #include <linux/miscdevice.h>
>>   #include <linux/pci.h>
>> +#include <linux/mutex.h>
>>   #include <linux/semaphore.h>
>>   #include <linux/sysfs.h>
>>
>> @@ -41,6 +42,8 @@ struct hsmp_socket {
>>        struct bin_attribute hsmp_attr;
>>        struct hsmp_mbaddr_info mbinfo;
>>        void __iomem *metric_tbl_addr;
>> +     /* Serializes concurrent metric table reads */
>> +     struct mutex metric_tbl_lock;
>>        void __iomem *virt_base_addr;
>>        struct semaphore hsmp_sem;
>>        char name[HSMP_ATTR_GRP_NAME_SIZE];
>>
> 
> --
>   i.
> 

