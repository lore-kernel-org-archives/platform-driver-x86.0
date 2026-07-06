Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010041.outbound.protection.outlook.com [52.101.201.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B8E3911DC;
	Mon,  6 Jul 2026 15:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783351781; cv=fail; b=S1Qne17+4Njam1J7LLxVJjylYsu+rpu8WoQfvLS98Rx5K/uYIaXfVRKrd4NjN55GrW3MdOESHFdSTEvSEVtOx1KHgIQvMO0fmjuORLHwfXU2Ujx0XNLdd/mqmHgaLV1UXg0Vxg5qa07NddBL8aDI7js8zVrIQ5Sj98QxDcLYcdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783351781; c=relaxed/simple;
	bh=ILLf1t745T+il3aAthW6lh4S7DC2JWAZMNqYuFfvRjo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Nfg7Ao4E/hVuj+qhRGZAnq5n1iOeVg36qaxhEqz+h79kqP5fHF2xfvjgQ8sBs5YWqTZ3AvEsufHvGUjYf9gAiJmrfGbtq2WbvV/5BXrZTczGv0zOhy07BTESH5Rx6uM0usU0Se2gjy3Wr4e6/Zf8dpAHvKyGeBWxP9ye45LVsfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wpYd4o+W; arc=fail smtp.client-ip=52.101.201.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wpYd4o+W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qKxtUDafUEJ6DIyO73jQSg++FDmy5w33zXOPmiW5Zpfnd0p3WahjJ3Uhxh/C6sSToYAik/vKl85sb05koXigzNGr1Wo4axnZgD1lRSU387QLxDxkO9Iaa68NDbVBY3/USA6vWq8g7DZfry8HcKFIUbjGu2V1xtxwxCgYrYZ/6Og93cWofbQ7pdFZjxjXWLQ+LOhKvrxDDZcL8i7bV5Q7/101atgHUykNjT9TXtV3cVoOKuy+NMBrjzIOeWCAQcJoNoszVGLZtbhKnBmTODUCmGUC7jgiN2lYQ0V7WuFb1ITrPExSw4dV7DeZmablddDANFQa9UHT5qg4AMQlcYPVTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1Kx8kRnQ0RV4gXh1r/51XcOmzEXbBfo5EWCoEh8tPg=;
 b=gTKcKNwS0ev/fSIXmj0VTsCBxEHOR6Su88ovtq8QODxJqP/GoBNsMMRhwwyR9uBPSKUt6vFsKL/47HdHLo4MaWLvimrwCYUrli0Oc95fIscQdrjAPiuB4fPMvbeYIDUGOsTVM1FY38gR8nP+mepH39dQ6EH09tN83BW+LXBeeoYvogE0LLCwbnPjSSg7W8NJ4EPLXY6LBEcOINkiB849GxdCpbu8YtPfigThJs3g9YFq0WQ26wk7Fhd29HdhPwB+lgn4/eY5MrNv6N+neDVgO9X5V2t6cDqJ/fIvHtP9+PZ8Ii1qPLZWAIUexHecmZ8VENgUg0TrWHAyPvzidY2yyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1Kx8kRnQ0RV4gXh1r/51XcOmzEXbBfo5EWCoEh8tPg=;
 b=wpYd4o+WN17X/MDKL5kyvm7Sv9SipSv9S9SujcRFGEOemFNjiDgqGx36hkNjPkxhdLFa1izqvzflNVS3D5Q82D7cXOI7PlAQig8SNon14ld4RBxFxVCVfLgKuaGVKRTmZEAGCr/6dQKQ7McjN4wqMeaXlS3+m13tAnz3mHtlRfY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by SJ2PR12MB8691.namprd12.prod.outlook.com (2603:10b6:a03:541::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 15:29:35 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.21.0181.009; Mon, 6 Jul 2026
 15:29:35 +0000
Message-ID: <d0a0787a-76b2-4628-99d1-f635ccd1f06c@amd.com>
Date: Mon, 6 Jul 2026 20:59:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] platform/x86/amd/hsmp: Serialize the data plane
 against socket teardown
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Muralidhara M K <muralidhara.mk@amd.com>
Cc: muthusamy.ramalingam@amd.com, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260625123337.886435-1-muralidhara.mk@amd.com>
 <20260625123337.886435-6-muralidhara.mk@amd.com>
 <0c56c0bc-a14d-dc75-9897-b70127c8e991@linux.intel.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <0c56c0bc-a14d-dc75-9897-b70127c8e991@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0058.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::33) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|SJ2PR12MB8691:EE_
X-MS-Office365-Filtering-Correlation-Id: dfb6638b-f3d1-4924-5f8a-08dedb736241
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|11063799006|56012099006|18002099003|5023799004|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	e2W8E1RJtACq4h3/rexCMEy/WDHRgMKJBkYL4KihdJeQ5zBIY6mPA4PZpPN6AGt5Wj0RHZRTcjB+Iwa5TdffR46yjS1qwncjgoKSMMWn6BQmQzW8NRUCkALro8kj7WyD1HbXGj8719bOKmQlSFREUxgHsmb+P+gFgi1FFY8coIZ0/u5dx63X5RSAVZhXsyVkYp4B2x+P2tQCimFp9Z8I/MQZcwelYDMSq/rGJkP5yBjHDAeGBlFez6n4R+NplRrTug6Ux3u75chjXVzvNSJJTW00HtF4kr6KI28LskOskm/e0Ifbya5qgsNfA4iXjqr4yZQuL7/PNFtMqSi2gRmt40lRgdzr3IhFCl5YmdyERjxoC5QWGhRYaUKUADRBMVC+0Dva2bMn/AadFNIuYV21f+/TFIu/Nmr7b6aSisF/uJ2/6/+YE/WaBuyi3JkyOBnfhtY+rhNNB/y1ny64GSZl9AD9ufEoIl73Mr7xwSj6vSgSJ3AvWCO02DF08xIR8I36tUqh5BUTxfM8GC+rmIqhI7SlHsVVHpyl2BUEukS4b28VcpqwlI96HdmB5a2lv6uLoG6+bKjQdIXzCvd22gebVWUFoTlMFqF+R6ikMQQ2/nJwwrt6cq6vANP/jY3qY+/DwfXu5rZp1v9hmOFfBbjVtafRifP8HYd5fYqw0jhkCGk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(11063799006)(56012099006)(18002099003)(5023799004)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0lhaGkrZmM4M3NYMldkTEEranZ6S3hPZkVNMEpuaGQwazVpK3RGZHpXYWEv?=
 =?utf-8?B?VzBPN0VROE5wQnIyeVBkcmxSb3ZDQzVYSmhYMkR0RHVQUGpNdThGaEJRVHlD?=
 =?utf-8?B?MG1YQmNURHVzSDBjaWFBKy9USUdQbDNodkllQWlJTitvQkVNK3M1L0Y4ZkFO?=
 =?utf-8?B?OHFsZzBCSXhNbks1d0hBR3lFZEduMjYzUTY5SnBLOXFRc0FBdUVhd1NGZnhs?=
 =?utf-8?B?WEo3OGxXRWJFYTMvWnNYMS80UzdBbUFzMnlKYjA1QzVzYWMvdWdFNmZGenVp?=
 =?utf-8?B?eTFEbFNIamw1N3o3SzkvcmlxSnZZajFmVXlnc3p3MG5SSjJ4a1A2N1haVmYx?=
 =?utf-8?B?Q3pKR0h3VWJTU1kvNnBNM05jWDdKMDl5R2ZXWmRpMjVoVkhtYlZwblpPTnZW?=
 =?utf-8?B?Y0RCYVRhdHNBNkFlSTdzdGJPZ2V4bTJmdE1lZHBodkxzVE9PMlAxU1dxVmZj?=
 =?utf-8?B?NFpEd3YrOE5zMm1BN0JWOHdCK0UxcWJoOWdIYWFWUlZxS2FjNGpqYzVkaGJX?=
 =?utf-8?B?VC92aXRFSVh2ZytheDZmMmNwYnhlU0ljN2FOUEloYklGR2JiRFg5VVYwdDUy?=
 =?utf-8?B?THZOc3JRalNHQzdoUFIwV2gzMVlqV1B4ZHpydldiUVRtTTd1RTNCNzRzL1J3?=
 =?utf-8?B?S01zQllMMUwrZWQxM0ZFMWxrWVdoK1VKc3ZYRmUxdVVmdm1CSlREWFZpZ0tt?=
 =?utf-8?B?MUo2dE9nNTMvOUpKVkhIaFRDb3JxSi9COC9vMTE2NjhKQXVDaGtCVTUwTTdI?=
 =?utf-8?B?VEh3NHFsVWNNNW9NclBlaFpKMUorRVRqQmg4V2pCOXc0TWZYc1dvV0FNMWFC?=
 =?utf-8?B?cHl1TlNLQXpzSXJsL29LTmdwNkRpWXZWZE9vc0VZWk14MHhrNFEweTRRT2k0?=
 =?utf-8?B?MkRnZ1pabE50SUd0aDBCWVlCL0xLVEk3a2lCQWNKY3NkWnh6dUJabWp1Ulox?=
 =?utf-8?B?TWVWUlRWZTdKUzRYMWMvdHZTSEJIeTluNkVTQzFZRHdITDRLaDA5bUFHNk9i?=
 =?utf-8?B?bTB4ZlBuR1MzVDRjMVV6QWR4OXdmaTRDY3BGZlo0eVJSK0E3OWI5VzE5MzZj?=
 =?utf-8?B?MVVwcno1ek9FWGhCbUEyYmhVZHpCL1ZndTl3Q1gyUGpiNzd2bmpBd2JoUHVR?=
 =?utf-8?B?TmhwbVN6b29xa0Qzd0hZc0wrWEhnMXZ1TTcwdmV2Y1VIMlJTRElwdEtLckxZ?=
 =?utf-8?B?QVFBMWF4eEc5bldXbndKSW4zeDlaNmIwbHJmM2xnRHhRdmlzUk1iVmNvbDJV?=
 =?utf-8?B?Tk5XdU5vS2pvcmVlNVhncERYS1BLVnRZdlJVb1VleG0ySmp1Vzg0VFFvMlQy?=
 =?utf-8?B?MTMySE9Lc3MzaTZhbC9vZFd1aUtxUkp4Q2VsdklJN2ZDMnFGOFhYRFlIbHJN?=
 =?utf-8?B?Y3piQ2RodzVKQ3lHMmVLS05sMWNMN2xSTk1BWGFoTFprcTBTbE9mMDJYQ09y?=
 =?utf-8?B?VFJIcnFHRGs3Tzl3elYyeDdoR2w1WmxrNU9aUS9hTkgvYUVBSU50MEFaT2lz?=
 =?utf-8?B?Yk1SYXZXZ2ZGREkrVlc3Z0Y4RDFnaFJoTnAxNUJqbnJlQXhCRVQvMlcrTXg2?=
 =?utf-8?B?ZHVreVg2UDB4d1Izb0lEOEU3TCtzRUQySjBSUU9aNldpU0JaSFdRNlUwTjFY?=
 =?utf-8?B?RXVnY3pKWnlzWXJZdTVHTGRxWVY3VXkyQVQ0dFRKaXFYeXpBdDBGUXNIRDQ2?=
 =?utf-8?B?aXZBMWJkR1EzWHZIazR5T2krc0w2djN2VUd0SHZ5emZKdUZQT3Y1VEhsbUJ3?=
 =?utf-8?B?dk1sRjZYQTJuTGJKdDZncExmZXNFVzBGbkZxNEhrME5uL2FKUklOOXhWa2d3?=
 =?utf-8?B?TDJZK3Zaa0VPUHRjbHRHeXQyZnJNMWV3U0RmMjlURjdiRmFsMXgxeXF3S01x?=
 =?utf-8?B?WVJkYTlLbTAzK0V2MllFcVdFN3FHUHVXNyt0MW9uQWR3YWlnc3N2V1lTdUNa?=
 =?utf-8?B?YktRLzUvbjR2eWFmQ1J4cEk2VkpLbEg5eUtxU01PeC9LZ000OCsyY1h5Y3FB?=
 =?utf-8?B?Y3JodnJXZ045OG10SERYZlVyRmhSVlpZUnRCWXNaZFljK3NJY21UdllpYk5N?=
 =?utf-8?B?ZVVPN2NHOE9vRWRHZTZxSEZnRXlucDZ3WEJpUHlLWVpsdWxoTWZETHBTdkhp?=
 =?utf-8?B?Yk9yWUsyZ3UyZjBxb1cxMkpjR2lWTThyTGZ5TW5hQnVHTkJKZXphcm14QWhi?=
 =?utf-8?B?aXk5RkhOYnByT1IxYk5IQ3NmT3pwTDNwK2IxM0E1dWtJTDhCS1JGT1pqYnRR?=
 =?utf-8?B?VVJpNWlYaTV3UkhXZkFXMUJ2UkFYdWdvM0NSaEVqQTQ4WjNGWk9MZHFCVjUy?=
 =?utf-8?B?UDNtZjhTcG1HRU5yWkVhak5oSHloNklUcHNiSHR3WU5VVWpZeHlJZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb6638b-f3d1-4924-5f8a-08dedb736241
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 15:29:35.4375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x4z1QwZJiI33PqDDce03iwKaD0ZA32xQenzOvarYrusDUw4d+tHsWJKyu/nn+OTPbYnkY6fs9RVu5LhFDlTQ4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8691



On 7/6/2026 5:11 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Thu, 25 Jun 2026, Muralidhara M K wrote:
> 
>> The HSMP data plane is lock-free: open /dev/hsmp fds and hwmon sysfs
>> reads call hsmp_send_message() without any coordination with driver
>> teardown.  misc_deregister() does not drain already-open fds, so an
>> in-flight message can race a concurrent unbind and touch a freed socket
>> array or an unmapped mailbox.
>>
>> Add hsmp_sock_rwsem.  hsmp_send_message() now holds it for read across
>> the whole bounds-check + MMIO access, and hsmp_sock_teardown_lock()/
>> hsmp_sock_teardown_unlock() let a teardown path hold it for write to
>> drain any in-flight message and keep new ones out while it tears the
>> socket down.
>>
>> Wire the non-ACPI platform path into the drain: hsmp_pltdrv_remove()
>> and the probe-failure cleanup take the write lock and drop the global
>> socket pointer before devres frees the devm_kcalloc() array.  num_sockets
>> is left intact so a later rebind can re-create the array.
>>
>> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
>> ---
>>   drivers/platform/x86/amd/hsmp/hsmp.c | 55 +++++++++++++++++++++++++---
>>   drivers/platform/x86/amd/hsmp/hsmp.h |  2 +
>>   drivers/platform/x86/amd/hsmp/plat.c | 23 ++++++++++++
>>   3 files changed, 74 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
>> index c3939908d95f..c15acba241c4 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
>> @@ -15,6 +15,7 @@
>>   #include <linux/io.h>
>>   #include <linux/mutex.h>
>>   #include <linux/nospec.h>
>> +#include <linux/rwsem.h>
>>   #include <linux/semaphore.h>
>>   #include <linux/slab.h>
>>   #include <linux/sysfs.h>
>> @@ -44,6 +45,16 @@
>>
>>   static struct hsmp_plat_device hsmp_pdev;
>>
>> +/*
>> + * Serializes the lock-free data plane (hsmp_send_message() and the per-socket
>> + * MMIO access it performs) against socket teardown.  Callers of the data plane
>> + * hold it for read so multiple sockets can be driven concurrently; ACPI
>> + * removal holds it for write while it clears sock->dev,
> 
> I don't see acpi change in this patch (just hsmp_send_message and plat
> changes)???
> 
I have to correct the comments.

>> frees the socket array
>> + * and unmaps the mailbox, so a reader can never observe a half-torn-down or
>> + * freed socket.
>> + */
>> +static DECLARE_RWSEM(hsmp_sock_rwsem);
>> +
>>   /*
>>    * Send a message to the HSMP port via PCI-e config space registers
>>    * or by writing to MMIO space.
>> @@ -215,8 +226,19 @@ int hsmp_send_message(struct hsmp_message *msg)
>>        if (ret)
>>                return ret;
>>
>> -     if (!hsmp_pdev.sock || msg->sock_ind >= hsmp_pdev.num_sockets)
>> -             return -ENODEV;
>> +     /*
>> +      * Hold the teardown rwsem for read across the whole MMIO access.  ACPI
>> +      * removal takes it for write before clearing sock->dev, freeing the
>> +      * socket array and unmapping the mailbox, so the lock-free data plane
>> +      * (open /dev/hsmp fds and hwmon sysfs reads) can never dereference a
>> +      * freed socket or touch an unmapped mailbox.
>> +      */
>> +     down_read(&hsmp_sock_rwsem);
>> +
>> +     if (!hsmp_pdev.sock || msg->sock_ind >= hsmp_pdev.num_sockets) {
>> +             ret = -ENODEV;
>> +             goto out_unlock;
>> +     }
>>
>>        /*
>>         * Sanitize sock_ind after the bounds check.  A mispredicted branch can
>> @@ -235,18 +257,22 @@ int hsmp_send_message(struct hsmp_message *msg)
>>         * semaphore or an unmapped mailbox.  A non-NULL dev also guarantees
>>         * virt_base_addr, the mailbox offsets and the semaphore are visible.
>>         */
>> -     /* Pairs with smp_store_release(&sock->dev) in hsmp_parse_acpi_table(). */
>> -     if (!smp_load_acquire(&sock->dev))
>> -             return -ENODEV;
>> +     /* Held under hsmp_sock_rwsem; pairs with smp_store_release(&sock->dev). */
>> +     if (!smp_load_acquire(&sock->dev)) {
>> +             ret = -ENODEV;
>> +             goto out_unlock;
>> +     }
>>
>>        ret = down_interruptible(&sock->hsmp_sem);
>>        if (ret < 0)
>> -             return ret;
>> +             goto out_unlock;
>>
>>        ret = __hsmp_send_message(sock, msg);
>>
>>        up(&sock->hsmp_sem);
>>
>> +out_unlock:
>> +     up_read(&hsmp_sock_rwsem);
> 
> Don't add unlock labels at the end but please use cleanup.h. It will
> simplify the patch too as you don't need to alter those direct returns.
> 
Undersrood. Will update anbd send in next version.

>>        return ret;
>>   }
>>   EXPORT_SYMBOL_NS_GPL(hsmp_send_message, "AMD_HSMP");
>> @@ -529,6 +555,23 @@ struct hsmp_plat_device *get_hsmp_pdev(void)
>>   }
>>   EXPORT_SYMBOL_NS_GPL(get_hsmp_pdev, "AMD_HSMP");
>>
>> +/*
>> + * Take the write side of the data-plane rwsem.  A caller tearing a socket down
>> + * uses this to drain any in-flight hsmp_send_message() and to keep new ones out
>> + * while it clears sock->dev, frees the socket array or unmaps the mailbox.
>> + */
>> +void hsmp_sock_teardown_lock(void)
>> +{
>> +     down_write(&hsmp_sock_rwsem);
>> +}
>> +EXPORT_SYMBOL_NS_GPL(hsmp_sock_teardown_lock, "AMD_HSMP");
>> +
>> +void hsmp_sock_teardown_unlock(void)
>> +{
>> +     up_write(&hsmp_sock_rwsem);
>> +}
>> +EXPORT_SYMBOL_NS_GPL(hsmp_sock_teardown_unlock, "AMD_HSMP");
> 
> Just export the lock to be taken directly in plat/acpi. It's much easier
> to follow who locks what when you don't add wrappers like this.
> 
Thanks for the input. I will address them.

> I don't understand why acpi doesn't use write side of this lock though
> but has it's own lock (hsmp_acpi_probe_mutex)?
> 
>>   MODULE_DESCRIPTION("AMD HSMP Common driver");
>>   MODULE_VERSION(DRIVER_VERSION);
>>   MODULE_LICENSE("GPL");
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
>> index 91bc21232646..5d0a6d819865 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
>> @@ -70,6 +70,8 @@ void hsmp_init_metric_read_locks(struct hsmp_plat_device *pdev, u16 num_sockets)
>>   ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size);
>>   void hsmp_destroy_metric_read_locks(struct hsmp_plat_device *pdev, u16 num_sockets);
>>   struct hsmp_plat_device *get_hsmp_pdev(void);
>> +void hsmp_sock_teardown_lock(void);
>> +void hsmp_sock_teardown_unlock(void);
>>   #if IS_ENABLED(CONFIG_HWMON)
>>   int hsmp_create_sensor(struct device *dev, u16 sock_ind);
>>   #else
>> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
>> index 685f2d2c574b..26c1363e79a1 100644
>> --- a/drivers/platform/x86/amd/hsmp/plat.c
>> +++ b/drivers/platform/x86/amd/hsmp/plat.c
>> @@ -233,15 +233,38 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>>         * init_platform_device() may have ioremap()ed metric tables before
>>         * failing.  hsmp_destroy_metric_read_locks() unmaps them and tears
>>         * down the per-socket mutexes; the socket array itself is devm-managed.
>> +      *
>> +      * init_platform_device() also runs the data plane (hsmp_test()), so
>> +      * drain it via the teardown rwsem and drop the global socket pointer
>> +      * before devres frees the array.  num_sockets is left intact: it is
>> +      * only computed once in __init (amd_num_nodes()) and is needed to
>> +      * re-create the array on a later rebind.
>>         */
>> +     hsmp_sock_teardown_lock();
>>        hsmp_destroy_metric_read_locks(hsmp_pdev, hsmp_pdev->num_sockets);
>> +     hsmp_pdev->sock = NULL;
>> +     hsmp_sock_teardown_unlock();
>>        return ret;
>>   }
>>
>>   static void hsmp_pltdrv_remove(struct platform_device *pdev)
>>   {
>> +     /*
>> +      * Drain the lock-free data plane and keep it out while the sockets are
>> +      * torn down.  misc_deregister() does not drain already-open /dev/hsmp
>> +      * fds and the driver permits sysfs unbind, so without this an in-flight
>> +      * hsmp_send_message() could touch the devres-freed socket array or an
>> +      * iounmap()ed metric table.  Dropping the global socket pointer makes
>> +      * later messages bail out at the first check.  num_sockets is left
>> +      * intact so an unbind/rebind cycle can re-create the array; it is only
>> +      * computed once in __init (amd_num_nodes()) and is never recomputed on
>> +      * probe.
>> +      */
>> +     hsmp_sock_teardown_lock();
>>        hsmp_misc_deregister();
>>        hsmp_destroy_metric_read_locks(hsmp_pdev, hsmp_pdev->num_sockets);
>> +     hsmp_pdev->sock = NULL;
>> +     hsmp_sock_teardown_unlock();
>>   }
>>
>>   static struct platform_driver amd_hsmp_driver = {
>>
> 
> --
>   i.
> 

