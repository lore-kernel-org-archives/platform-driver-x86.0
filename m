Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011046.outbound.protection.outlook.com [40.93.194.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4C61A285;
	Tue, 26 May 2026 10:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779789751; cv=fail; b=uJK/+hHgStVVqz7FtG0jaWP3D+MuHsZInkaTVvAo/GbD+dMyJwbu7DpbZ6i6rXpKDMbO3jFAEnDtF8dM6OPoLPEafQk23hIGZQpAdPAHmeyF3wJVy6LSjqZ6Ocs6TVuRr2tYJe7PJNjjrIyADrHaSpqFcYs9ktZYmKpaTjnrl/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779789751; c=relaxed/simple;
	bh=FljTsdLr6kz5lRcwF0nmI8XnIx+4BJdRi1nuhlB+3Yk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fBVwheeJCiKtrWtBg09EG5P7hzjISkyvmuaf2eRZQKC1VezfdYc322AbhZTMYSh57cfsYFx+SnsN/eqRlcEZU+EJ0f/0cYiPnO4UiqGWycH+zmjTCKjqxPNgI8KYjUwyXmEpirh9lzXeWsA81cGq8wveg205nXxdL0REr12dGTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=d9+WBTLl; arc=fail smtp.client-ip=40.93.194.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="d9+WBTLl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YC3o2+dHUGyFPGSvswT/k0xJbD1Ogt/E3TQDgwhQBVBNcsMLdE0MIWMvahk5slfGYtuFMYORr9qFG9mP12GWxZMAeDV6t+NZnvkUv/oOvJcvMrpaNVwc+CWda/sVlOaGdh0baMZXLoYcPPfNY68rtf/d7VdUP+UnE22durmadoSHHpkPJcgd1FRT1Sr9FIhIxfOTFfTDDpyGeYDW/vURgwIc5Xf9I91fHEn2ORLrpzWhsNLRxdOgTDCTxLmjCjyaIVpAfpKYRfbhMNEJjZKZ0Ir/q6tMpjGtTN07aq4FL/6W0a8vRcovW3utmb/M2bOUpiKxqmBIrsZ4UwZnP7yTtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xt+gmb8HmW5sepOWU0GagZ7cq7F0vyMZlpYwHhwf6lY=;
 b=UvcZt2uGe+E0Bq+G44459ERZSDRrxdxVSH4+PLcE5OSv7JYcEzffS18jPuIe+sigfcADFAZfR5mpn2Woh9qisSqMshZ4ivZD5j2bRIXH2Em1xgQSBoTxj7tejo6TQvVDdG6RCzy3Epu0OlZY+i1IsUF1nqaoXTbrk+u5Q5siuE5GIblPvxV6jyqfmB3pfngtHLF8d8wwHV2jv+acwgCdt6Qrfz1FPU6PY6z3+krycXzpUHxTXffMQppKBBlzN0UMmICjNMgwt0bUQ0c08BpC+8lt7/wBjWaq4hYCnzcHGStXTDPBUyLyrbNJvWowTU+HSitvkB+kEHGRfCrtISyjCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xt+gmb8HmW5sepOWU0GagZ7cq7F0vyMZlpYwHhwf6lY=;
 b=d9+WBTLlM1KxFAtFAUoI1rJLkIdBvbO4/B4kMB6kUjdzEyK9IOU8tEWil9eTrRvCSQghdJrKneZ4gtvAcIX2Mu5SIF0hlqayFepqJ/jYrl7Qm1V5y2rxwaXshXk8W7kSlPA5UFw/DNNZ5++0J6HAz7dX3Nc/IEWz82q/ul/pKxQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by PH7PR12MB8179.namprd12.prod.outlook.com (2603:10b6:510:2b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 10:02:25 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 10:02:25 +0000
Message-ID: <914879f5-c960-494e-bd17-6ad140c2bb8c@amd.com>
Date: Tue, 26 May 2026 15:32:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] platform/x86/amd/hsmp: Make metric table read
 locking use guard(mutex)
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Muralidhara M K <muralidhara.mk@amd.com>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
References: <20260517151211.415627-1-muralidhara.mk@amd.com>
 <20260517151211.415627-8-muralidhara.mk@amd.com>
 <1af1f3b6-7554-4e15-8ca1-665e821bced9@linux.intel.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <1af1f3b6-7554-4e15-8ca1-665e821bced9@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0049.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:274::11) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|PH7PR12MB8179:EE_
X-MS-Office365-Filtering-Correlation-Id: db81f167-aa81-481f-7534-08debb0de328
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003|11063799006|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	ZoQhikOfF59jgPEsdj45+37dlQzj4P3IRiLrImw/xtTXSNSWuOXnBOkQNAIwonDilTfE05kmNtQQRRVi8+LLoPQogU5RTNSf76LStkPChfyarMZqRKB1vtn4IAITX5bwNlJryLxiFxnbvtwxxPXtvcTsj8H6Bv8CwXKTZRdDFALoD5e8Qo7cpBGqpcxQEWoh5HeGpRgiG79rxYvoVMIbSwCdn1utXRBXmF0WjNYfMx6IRiW8pY6RlDpO3K+rh5d8RyBQMD3llFV+yaClUGOg5lsCiKmeaWFj8Y2cXfRDL1UAF8cOFE0YdoHeCaC2DA7zBiPP2tpYsoHmKVWQ6PaJfRyEyibwRZYwuZXZy6HMahbHBRNBjom0u1zViPN/0kQt6jeWC+hw4Jvd3HvLsuAa7OxBiNsGbdoAAwGEaOGFS58bPbWx1DwrgcLYfhQ1gFJGrkjsI4Qjnwk0lFnuiyOAmMfW2gj17p4ptKW+DUQQ4TPUR0fGZgZm0gVJGm54Xs6Kxlb2f+n+GLzfUKfmMBBaUhwn1QzxIg5vcLUJin+gC2tF8hIozNFMPEnaVHA0lh3soBc+okpo+t4B4CEyjUDl3LYxnnRYIenw5dhG+SWuiUbIfUEyRHHcSScY2iyfrhUuMKHU5pFlufVLMYaR9BZE9D91SIkC8VKw1uNJMED0G2weluM+1uPmFxzTFBnJAQtQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003)(11063799006)(6133799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFRBUVh1OGY0L21kYWdLV3pKUnVqeWhRVEVRL0hqaFVBZGNRUkw1aHh4T05i?=
 =?utf-8?B?NHhnNE1GM0UraDdEN2QxQjdzUlNoY3FOQ2Vpcldwb3RvdjRNSVZmM3gxSjBD?=
 =?utf-8?B?SENyZkZIREZRSFBSbDAxUWdPV1BaUWZGZkhneXFhVlozbnpsWER5N05vaGJW?=
 =?utf-8?B?OWthQXlPbGZ5bnpISWZPT0orOW9DcEJlUWw1S2MwS2I5amdHRlgrQUlna2NR?=
 =?utf-8?B?MXl3c0tvMTVJa2tzWHo5eFlyREhNNksya2o0MmJWRDZKWmtSeWRPQ3l2dlRF?=
 =?utf-8?B?NFI0UlFJMjlJQTZjVnliMHlRQWYvMUMvSXhHRXQwRnRjMmkwd1VjUVB4SXFY?=
 =?utf-8?B?TTcwQ1BCWlNNNzJndHIvTzdic0pxQmM1S3RwczJZUHdIamJQR3pBVU9GeFJm?=
 =?utf-8?B?ZWd0UUJYaWh6TlRzQ3EzblFWRG1wUFl2Q0RmblJIRS9UdmRyZmRzT3JDaUNz?=
 =?utf-8?B?VjBIODRQWU81akg2M3Z2Y1NWbzZEVk9oazdIRUdTSDU0MTlQK3RrK2JONm14?=
 =?utf-8?B?NkhHc05TdlpWNHZJRXZiMGNURXpsZ3RqdDN5ejN4R2FFSExyNzFncjZSY3lG?=
 =?utf-8?B?cUxjT3N5U1hmWFVwVFZCTDh0Mlh4ZlpDbk5kY3JXdGZZclBEdkhvN2lzS0lS?=
 =?utf-8?B?QWFpSzBCcWppdWh4aVlWU2Y5VzAzWFNHcEd3ZVFzb2JkMllNSC9vL1Rqb0dq?=
 =?utf-8?B?VHdKYVpwODR1K2dBNTBZbGJRaTgwWDF3QjlKT1g3TmlsMjdmMURjL1FlRG9s?=
 =?utf-8?B?TGxoVjBKQzIyb3Npb2xyZ0gzZVJTZG9FZXcxU1M0SDhvazYwU3pwQVk0eTFV?=
 =?utf-8?B?ZHd4MURvTDlpVm53YjhUVlBNcDFQVC9VdDZrOWVpVEpWNy9sb3hDNUFoOHpn?=
 =?utf-8?B?ZytrdDlQOWJWTkJNTnBxWWFuZHFUWUZxak5Fa2ZtN210TnRvZHhaVFpwVDdq?=
 =?utf-8?B?S3I3cG1qUWQvR01EV1dZMXFYUU1SODFsZWFGakJzRkxBVXZvYWtkbmdiM2Zx?=
 =?utf-8?B?QVh5TWlhdk80R2R2YnhwemF0WnBob3gxUnlJNzYvVE8vTGVnOEFHNWpoUDhJ?=
 =?utf-8?B?R0JZQ1J2SUlsdUZOV1h2dEZxM281RGpxUU10NWtWZExKNklxSUhLQ09qYTVZ?=
 =?utf-8?B?blVIMHVxb3diSTV6RHV5M1l5SXVLZ0dPenVOM1pMK28vNG9ydDZyM1RqdVJO?=
 =?utf-8?B?ZXdiQWdBWjAzRjZDS2ZxRXczSzBqcy8vUUtUVktFTnMwdkhtcGNpdWJmZlNL?=
 =?utf-8?B?YXZhZnBnZG93WEFLRW5FQjNwOWI3WXM2MUhWREx0N3FZcWFIOU0zajNZNGI1?=
 =?utf-8?B?RVpvVU9Rcmh2VU9KbkFKWUlEY0ZwWGhtNm9FRGhIdnBMRnZvMjcyMnorWWxi?=
 =?utf-8?B?Y3kzdmVqMGF4OTc3NDlUbTRqazFReUtDa08rdVJKeHkrTVA2ZmNRZ296NjA4?=
 =?utf-8?B?eXJQZXpWZHRBMVoydml5eXVIVXBJNklJVzRkc09xNGVXTHI4SVFnQWp1dGdw?=
 =?utf-8?B?NEJIbUJ5OUVYbG1EZlVIUFRvT2JzZlAyR3hJdnRUdTJuQ2JNUHFKSEdUQlBG?=
 =?utf-8?B?b2Q5czI1Zm00SmcvNUJyNS9paEVrVW9vYTJic0NOT04xVVFCRm1EcmJhSGFy?=
 =?utf-8?B?eVk0NDRBTlpmQk91WWdiMHF0SXphQUxGMUNhYnh5aVNQOUxWWmFGeXNPVmhP?=
 =?utf-8?B?MCs0YmI1a1pwMGlUaEM4VWVDdlFVNGJYQm1Kb2tPVU9pMGZtR2ZndW0xWEts?=
 =?utf-8?B?K3lYbUVPOEYzK1Vabytsd3hTK3EwUnVPeEZhN2JhalNNY2xLNWJGZnFjdzJQ?=
 =?utf-8?B?Z1E4VGE1Y3QvOWx3Zlk4U0VOZDRmZW5ydmtZWUlRcjV5ZWc2ck9URExPeFRU?=
 =?utf-8?B?dC9JaXJiVDBNMHRHMXQyd0FsZ3k4OGV4TS9vQjM0NHBkZm5UWWxsWDNidHda?=
 =?utf-8?B?eDEvTm5IeTVpWEFFZ1BZVzNvdnJieTVVZjEwLzVzM0NnUUEzbXFYNDRqdUFv?=
 =?utf-8?B?UjRCWitWelNZcmU2RVZpT3UrbklsTlZnYWJKRW1YMVhrUGxraWJka3VwVWVB?=
 =?utf-8?B?bG5CL21SVFFLdlNUWXYxVWpRTjEvNkR0bGdqNmhTN2ZwTTAzQXVCTEMyK0ls?=
 =?utf-8?B?MmpGbDJ2U215OXl5Vi96Y2xqREJUdmRVc0lINjFEYk5LNUZMalorL0RuWUsv?=
 =?utf-8?B?c0tQZWE2UmxxSklEak12bGdMS3ZGNVpwVnFZSCtlQ3JUQjZmbTBCVjcwdnFY?=
 =?utf-8?B?WkthUXd3N0VabjRmVms4REQvT05iNG96N3B0TEs5M0svcnl3K3drL3YyQkg4?=
 =?utf-8?B?Q0JtWGFvYlVUVURETVdkS0sxOXZrTUpxa2NINFRpRUZrRzZIRThFQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db81f167-aa81-481f-7534-08debb0de328
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 10:02:25.5115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dKdntiSQ2szAgzH18HQm69yYp+lhqiOtmqW8iekslY9hR2cSWEDUPLlL7A3tEb9y2+M4tPK285zLZlOt+/AoBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8179



On 5/22/2026 4:25 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Sun, 17 May 2026, Muralidhara M K wrote:
> 
>> Add a per-socket mutex (metric_tbl_lock) to serialize concurrent reads
>> on the metric table. Without serialization, two simultaneous
>> readers could interleave the SMU refresh command and the
>> memcpy_fromio(), producing a torn (mixed old/new) snapshot.
>>
>> Use scoped guard(mutex) in hsmp_metric_tbl_read() so the lock is
>> automatically released on all return paths. Initialize the mutex with
>> devm_mutex_init() in hsmp_get_tbl_dram_base() and return an error if
>> initialization fails, avoiding manual mutex_destroy() cleanup paths.
>>
>> Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
>> Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
>> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
>> ---
>> Changes:
>> v1->v2: Add lock
>> v2->v3: Replace mutex_init to devm_mutex_init call
>>
>>   drivers/platform/x86/amd/hsmp/hsmp.c | 8 ++++++++
>>   drivers/platform/x86/amd/hsmp/hsmp.h | 3 +++
>>   2 files changed, 11 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
>> index 3a02d683dea0..2fec897a95be 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
>> @@ -447,6 +447,7 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
>>        msg.msg_id      = HSMP_GET_METRIC_TABLE;
>>        msg.sock_ind    = sock->sock_ind;
>>
>> +     guard(mutex)(&sock->metric_tbl_lock);
>>        ret = hsmp_send_message(&msg);
>>        if (ret)
>>                return ret;
>> @@ -492,6 +493,13 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
>>                dev_err(sock->dev, "Failed to ioremap metric table addr\n");
>>                return -ENOMEM;
>>        }
>> +
>> +     ret = devm_mutex_init(sock->dev, &sock->metric_tbl_lock);
>> +     if (ret) {
>> +             dev_err(sock->dev, "Failed to initialize metric table lock\n");
>> +             return ret;
>> +     }
> 
> Sashiko notes a potential problem with this failing and that not resulting
> in a probe fail, which leaves the mutex uninitialized.
> 
> But the mutex could be initialized earlier to avoid the problem I think.
> 
In the v2 series, you suggested using devm_mutex_init(). However, I will 
test it and initialize it earlier if required.

>> +
>>        return 0;
>>   }
>>   EXPORT_SYMBOL_NS_GPL(hsmp_get_tbl_dram_base, "AMD_HSMP");
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
>> index e7f051475728..f7b1cbf19932 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
>> @@ -15,6 +15,7 @@
>>   #include <linux/hwmon.h>
>>   #include <linux/kconfig.h>
>>   #include <linux/miscdevice.h>
>> +#include <linux/mutex.h>
>>   #include <linux/pci.h>
>>   #include <linux/semaphore.h>
>>   #include <linux/sysfs.h>
>> @@ -41,6 +42,8 @@ struct hsmp_socket {
>>        struct bin_attribute hsmp_attr;
>>        struct hsmp_mbaddr_info mbinfo;
>>        void __iomem *metric_tbl_addr;
>> +     /* Serializes concurrent metric table refreshes from the sysfs path */
>> +     struct mutex metric_tbl_lock;
>>        void __iomem *virt_base_addr;
>>        struct semaphore hsmp_sem;
>>        char name[HSMP_ATTR_GRP_NAME_SIZE];
>>
> 
> --
>   i.
> 

