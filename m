Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011058.outbound.protection.outlook.com [52.101.62.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CF538CFE4;
	Thu, 23 Jul 2026 05:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784784754; cv=fail; b=HGePj/d5KZiQKfQJJfFtD1D/tkrh8vv0ZR//qeMLDQW0F9n6YHgqRPMwVm62+9sLlIE6Okv8J0v1q6uGoeeHCWMN277Zi11EXy+D8dfNBS3fLx052DDmlkxsfdU5QeHCxaSquvA1OP7TsefpJ2WRpOzi0Stha/96mmgovD6R8TU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784784754; c=relaxed/simple;
	bh=6U8iNa5msrK40Z1NJK2bAxZgQp+I6N95NPHwVXEHAI8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=d5e5l9K+sMdwCsrHRGoHXT5s6gU/v0pyzB7Dk2QdbmaDfe9XKbNlWzHFvd8vYqloxEpZ9nqCH07HBJXfwudrg3p608UYtcgl9xzAem2I5Ny6UI6FvutKaxXBt94tTGo7A87I5pjS5wECyYzWRVN9bEra1iy7Oz+x3h8wLVxBs8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FgwV9nKw; arc=fail smtp.client-ip=52.101.62.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FgwV9nKw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yn+WJVYsTuvcJXuUVZglwmI9NovFOkmv1tP7hhW1BliG5ANJjD42N52pB+CeEurZHgwSv2W6fmaiMs8WTBBn/rI/u8JzGfUXl12C3Dc+Yjw3AElnDd3oNjBAKEfEEBVo9o/3HJ0sLwSxDn1NGeoJTLCaELjdXhyXUokMBN39rZXgG1/9I83RMzT/bIBFQd8CXoSVgGYOhsWQRx1aanyzuP+c85dAUD5+Q2T8PcbAIsrPBjoxWZ4S9w1kpkXvIbK02Jn3LTpFDREbtLQmicug0QdElPa8Zrh28xaEKxwveuFqvfZ2QA/4fbFxFqT/Bx+NLbWDshdVfDsgAQvcAhYR7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6jEykrzPSrTWEjtXdcBhiJcSYpCYWQrLlfQg0PRFkw=;
 b=y0BSDbOcgTCDBVOif8W1qyfSMYs3YVQnaJMf6peXNeDy5QJf4QSaUv3XNbwtUmUN/9cikGk1zEbNln91j3fPQm+eVZnaYiuzicckkNVasIGqgfeul2/q5xTHTGgz0jfSWW8eampUfbQODtSJPmSsDSYfIv1uNT1Q21apgGSZkhxkxNfFdvg7S0UcnQYKar+RfQ59P+wsmjZlDbvNK7XPUGKh1VDClVnHxab30fnNyy777XOe4gv1OaPePjPLa+WLIHB6Xc5fnv2EtiBq4DFJmeuKyEh/Fvc9j2qkndRu7IkfmyD4sKx5+Z6ahWj7hQTCD2JG15MXxrP/tAUmzDpzdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6jEykrzPSrTWEjtXdcBhiJcSYpCYWQrLlfQg0PRFkw=;
 b=FgwV9nKwECawmG//uqXcDvDj/bNRSZaQCatEdAzBXxBVj/Sdn3NcUWW8rp1tzGlp9ihTlkSKi+MNxfwmj4zjxy3Nf8K+v5BaoPPRln4VVl/iH+tgaCKU42KhTvZdlZQPH7CXTYpVsajR9ya3e1TEGjzwBvd5X8q9GQ6Tr/nlQIk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by PH7PR12MB6419.namprd12.prod.outlook.com (2603:10b6:510:1fd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 05:32:29 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 05:32:28 +0000
Message-ID: <85095ac8-ca4e-41fe-8e64-4d0fef334789@amd.com>
Date: Thu, 23 Jul 2026 11:02:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/6] platform/x86/amd/hsmp: Serialize the data plane
 against socket teardown
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Muralidhara M K <muralidhara.mk@amd.com>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 muthusamy.ramalingam@amd.com
References: <20260713044005.1194115-1-muralidhara.mk@amd.com>
 <20260713044005.1194115-7-muralidhara.mk@amd.com>
 <f17da159-2a34-79ea-5fd1-b73b91ea680b@linux.intel.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <f17da159-2a34-79ea-5fd1-b73b91ea680b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PNYP287CA0104.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2bb::9) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|PH7PR12MB6419:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a90b968-e181-4242-939e-08dee87bc92b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|5023799004|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	6oxorUdmlbT01atVrtEdpoFdfVNYN83EUelOKx/qvVGKd5iJbUEo5Gr0cnIcQ8ybE4TSLW+9IL0d/7AoYE+kGq8RdbRA6JxdKILGhTfLce3rK0DqtEy5yfmbKg21g3BOM+thaWENK/Dmt28PbQoXJUpmbszXS44Enzp8/iyltEtrlQRd6jueb2/OCq2J0vXcG7SvPILPV7xBx26Vq2JTeVzF8ovHc9Aw1GzeANLlKXfKFpjvFvBFnoWdCKJGf1zcPKcdbUPIennu+eVUn9y0Sos/cwYQ3c9eirSYCiu5/TgXVnpEnxOB3mZjv5KYO4tfjMAB7yOYYIfWFwHZFvc+v4RhC3VzE7rnN8nCQqPP91fRuKF0r1IbQvO3YUv+sSyGlfZwzQebaFxSh/IJ3GNPdxV2QKVtkdwDsu9Va//P5h99UCX7e3PBhMoNHkXhqbUMU1JlEf66a6aplZb7ogWZ5FJiVhO/zc2B6r/2hw5vieI7f/5jXjn9kaI2AVRhjdXjlP9BOPETNOfIrD65GStX0O1A3ttmxQXNtuyJejPTzYoeh7VsuoxlNEzlkLbjOYCKfI4X2TptSw/zQLXXOfrnDKkdlPwXE8jIh+vY1X4GYOYUNNohUflsIDvkgL0wZpyVx9d8LBvMXb8LEsFkodAfYS4UNJMwR03QR/XQT/+RcDg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(5023799004)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWN3U3E1NFo0L1hjN1ZpcjFoSGpRNndod3JVa3Q2NzRVM3ZObEdxWmpxMXpY?=
 =?utf-8?B?ZjVucTJDemJBSXczUDBjUTRBMEpBYlFGSXN1V1dSQlJLTmJrcWtQcTlxT1pY?=
 =?utf-8?B?NlFzYUdVd2lWamNkRERsRWhyb0YzeEhEbEkrYTRIdGZCVmJXcFg5dmx2S3ov?=
 =?utf-8?B?UDJ6MlRzYWNtcEVIaUN3a2NHbVNxYVBsRjZTZ2M0eDRwaFdhN05jZmpQV2Fq?=
 =?utf-8?B?Y3NBdURTVE05MXlqNmV0RWNtVXhoZkxXOGlwSGhVRnNhaDFOTjBVcTduWkU2?=
 =?utf-8?B?ZEgyVis2SlZDTjMxR0tNS21hbmQzVmdFU0I0TENzMHh1SlI4NEVWc20yakZX?=
 =?utf-8?B?SSs5czM2bXdxL0RtSFNqL2JORUhVYzlwRXdGa1k5L2NaZkIyZEJoZ2dUeHdz?=
 =?utf-8?B?MnJpUU5CTWlnOFlHVUs3bDBVd3hpR0VmaHBnNmxuUmR0dnE4VlU3U2VJN0xU?=
 =?utf-8?B?cmQrM0F3MXRMZ256Y3BrbVFKemNUN01NZkRJZVM3d3lOV1IvRmdwR3ljNlpu?=
 =?utf-8?B?c01nUzUwR0NPNDZQM0FIWHVRN2dHbFVHSERtcFhDRkptRHpWWktTUFViMXph?=
 =?utf-8?B?RTduL2c1S0JpaXRSaUYxK2tsQ3pqUUhQa1hDMVFTb2M5Wk53bmpDZjF0ckVo?=
 =?utf-8?B?MEt1blFTMUFaM0h2NklTVTZCY2kyWjBaaFV6Q2dNTGtBcHMzVGRUNm8zMVNl?=
 =?utf-8?B?SDZlcDdDZHlobXFuZ3VuckRlbkgya2pUeEtDNXQ1anVqRDdISTJqNm5WeCtx?=
 =?utf-8?B?TXp6UnRSMG5PMFVyVUZJMXR4dXQyYUVhWC9Pa3QvUTlJd2FEN0hKdGNhZkpk?=
 =?utf-8?B?bGlibDJ0YndCQndpVm05QkpNUGpSMTNzQVJCVlZ4ZE5Gbnc4aHhmOHlnK05T?=
 =?utf-8?B?cjZjbVRHcmQrK0FFRzR0OHdhZWVJdTA3czRqRXpIVEprdExGdVIrY0xkNWFj?=
 =?utf-8?B?TEpzeTJkVC9zZURhZHphN09OZG1sNjVOQjZKbENqZXZzeFdyL3BPd0toU3Nr?=
 =?utf-8?B?dE5kazJaOFpTOHUxdXVORndOSkMyVzR5LzJWSzEvOGhUemNwenRCaVh5bzJV?=
 =?utf-8?B?bUxVazRnSHlCWjF6YlAwWjZPa1RFYXFiZGRMYVBJZnpGTmkyQmYrYTArL21Q?=
 =?utf-8?B?K09VM0ZGdi9qT0pOY1FtMzcySjFaVTlsQ2xTZVVDQVFNb1FYeGJqajI1Wlcr?=
 =?utf-8?B?MEVmQlQ1eXRWNmZ4K3NQKytkcGNNVkpKVElxSkZ1QUZ5eTR2SDliUHV6RUts?=
 =?utf-8?B?RlgxUnNlSUIwQ1VpRTc3UG54YVZVMkpZZzAyS1p5bDJqV1gzTUI5d3pDOEhk?=
 =?utf-8?B?V0owTzM1OXFMUk5NdWVraHF3Y0QrTUxlalluaCtzMG9qSFNvcXZHcGxIKzZV?=
 =?utf-8?B?Nnl5WkJweE5NMUJrNHhFUFZDRkcrWHo1eFBvSHdBSS93TU93M2dVK2VYVldv?=
 =?utf-8?B?ZVFXcm91aDhPV0svMWt3YmF3bG5JWFZwL21NM3RWL3FFZ2JDUWZyQW1Rdm1D?=
 =?utf-8?B?a3N0dklRa1BVMlRnRFY2TWN1UHlqc2o2VFhtRTBxeHdNeENOTXlnZ1RPTDJP?=
 =?utf-8?B?cW9lSHRXY1NCcXBPek1VeUdyVGpEQjBXZjQ2SEZRbnpGQ0xVeHZpanV3S3NX?=
 =?utf-8?B?a0hUWmM4K2FaV2p2Mm9lWm5RcWFkR3dHTlV5bXBJUE9pZThBY1BTMHFyUUNR?=
 =?utf-8?B?dk55Qk8xMFdvMWlyTmcyNnMyc3RpSFJBbzNMWHVDcU9iYk5PMHZRV29JWDRW?=
 =?utf-8?B?bGdEUjViTWJEZVF0bDMrbDN5aW9VYWdiZnJXMFM4eC9lUFZxZm9kTFRoWUNG?=
 =?utf-8?B?OWwxTVVLTk1iYzNENmlHaFY5REFPcnNFb1JLMTRtMlF0VDZNTW0wOEhabE9C?=
 =?utf-8?B?ZDZ2RTlJL0Vha28xeTY1NlpwSkdRdUZONlV1SFgvbE5IaDMzM3ZHby9YQjZU?=
 =?utf-8?B?VHppd2Q3eDRYdERISktodk1seDE0VmVOZzV3dGUvT0hXYzdoOGwzZGRyLzNS?=
 =?utf-8?B?ZmlNM0lEVGRXUmVvRENNbDMwV3RvMkhhZG9HbHNPeEZJOVpNTGhBbG9QYzlN?=
 =?utf-8?B?d1FlV253Q3hESGlmSHNoNEgwU3NSVlFENUJBaEQ0QXMrK20waUhlZVQ0ZlQx?=
 =?utf-8?B?ZnZCUkRaejhMSHNiVWE2SStLblU3NExuVU50YVlKbE5JOXhTZHgvRlB5aU5S?=
 =?utf-8?B?dzV2dmd3cDVYaFRmL3pXeEp2bFpIQWFqK0gyYWExcDJ3V3RLbVdiMkNMR05s?=
 =?utf-8?B?eVdId1hUdU9scW5sdmFFRnBoZmxUbC92WW1xa3dwTXpZV3JwUVRyR21CYXFh?=
 =?utf-8?B?SHJNY2JTS0pPUG9obTdISFF2Z0E2d1JsakJsQXFSelRVcGRuSC9IZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a90b968-e181-4242-939e-08dee87bc92b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 05:32:28.8400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OJQWUw7s4BKwX62QzHKDKfQ1vMiViJ80Dx57+hdWH5Hw2VlMV8tms3OYbi8WhlMI08Na/UN9EJ45FMaePCBr8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6419



On 7/22/2026 6:41 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Mon, 13 Jul 2026, Muralidhara M K wrote:
> 
>> The HSMP data plane is lock-free: open /dev/hsmp fds and hwmon sysfs reads
>> call hsmp_send_message() without any coordination with driver teardown.
>> misc_deregister() does not drain already-open fds, so an in-flight message
>> can race a concurrent unbind and touch a freed socket array or an unmapped
>> mailbox.
>>
>> Add the read side of hsmp_sock_rwsem to the data plane. Split the message
>> send into hsmp_send_message_locked(), which does the bounds check and MMIO
>> access and asserts the rwsem is held, and hsmp_send_message(), which wraps
>> it in guard(rwsem_read). Probe and remove hold the rwsem for write, so they
>> drain in-flight messages and keep new ones out while they tear a socket
>> down.
>>
>> The probe-time senders run under the probe write lock and so must not take
>> the rwsem again: route hsmp_test(), hsmp_cache_proto_ver() and
>> hsmp_get_tbl_dram_base() through hsmp_send_message_locked() to avoid
>> recursive locking. A single rwsem therefore covers both the data plane and
>> the probe/remove handshake, with no separate probe lock:
>>
>>   - acpi.c already holds it for write across probe for the socket-array and
>>     misc-registration handshake, so the mailbox handshake now nests under
>>     that same lock.
>>
>>   - plat.c takes it for write around init_platform_device(). It is not held
>>     across devm_add_action_or_reset() so the release action, which also
>>     takes it for write, cannot deadlock if that registration fails.
>>
>> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
>> ---
> 
> While the code seems okay AFAICT, I think the comments are somewhat
> misleading:
> 
>> +int hsmp_send_message(struct hsmp_message *msg)
>> +{
>> +     /*
>> +      * The data plane is lock-free: open /dev/hsmp fds and hwmon sysfs reads
> 
> This says data plane is lock-free.
> 
>> +      * issue messages without coordinating with driver teardown. Take
>> +      * hsmp_sock_rwsem for read so messages run concurrently with each other
>> +      * but are drained and kept out while probe/remove hold it for write to
>> +      * tear a socket down.
>> +      */
>> +     guard(rwsem_read)(&hsmp_sock_rwsem);
>> +
>> +     return hsmp_send_message_locked(msg);
>> +}
>>   EXPORT_SYMBOL_NS_GPL(hsmp_send_message, "AMD_HSMP");
> 
> 
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
>> index 45dab9253c13..cfd1a8cbd459 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
>> @@ -79,8 +79,8 @@ static inline int hsmp_create_sensor(struct device *dev, u16 sock_ind) { return
>>   int hsmp_msg_get_nargs(u16 sock_ind, u32 msg_id, u32 *data, u8 num_args);
>>
>>   /*
>> - * Serializes HSMP socket bring-up and teardown. ACPI probe and remove take it
>> - * for write.
>> + * Gates the HSMP data plane: hsmp_send_message() takes it for read; probe and
>> + * remove take it for write to bring sockets up and tear them down.
>>    */
>>   extern struct rw_semaphore hsmp_sock_rwsem;
> 
> This says data plane is gated.
> 
> Both cannot be true?
> 
>> @@ -204,15 +206,20 @@ static int init_platform_device(struct device *dev)
>>   /*
>>    * The socket array is devm-managed and freed by the driver core, but the
>>    * metric-table DRAM regions are mapped with plain ioremap() during probe and
>> - * are therefore not covered by devres.
>> + * the per-socket mutexes need an explicit mutex_destroy(), neither of which
>> + * devres covers.
>>    *
>> - * Drop those mappings from a devres action so both remove and probe failure
>> - * unmap them exactly once, before the socket array they refer to is freed.
>> + * Take the data-plane rwsem for write to drain any in-flight
> 
> This too talks about data-plane rwsem.
> 
>> + * hsmp_send_message(), unmap the metric tables, destroy the mutexes and drop
>> + * the global socket pointer, all before devres frees the array. Registered as
>> + * a devres action so it runs on both remove and probe failure.
>>    */
>>   static void hsmp_pltdrv_release(void *data)
>>   {
>> +     guard(rwsem_write)(&hsmp_sock_rwsem);
>>        hsmp_unmap_metric_tbls(hsmp_pdev);
>>        hsmp_destroy_metric_read_locks(hsmp_pdev);
>> +     hsmp_pdev->sock = NULL;
>>   }
> 
> My own understanding here is that the first comment tried to tell what
> the situation was before this patch (data plane was indeed lock free), not
> the behavior after the patch. Is my understanding correct?
> 
> To avoid potential terminology related confusion, rwsem is still a lock
> (even if the read sides are not block each other).
> 
> We don't write about historic state of things but document only the
> current code does. So if it's no longer lock free, stating it's lock
> free is sure way to confuse the reader. :-)
> 
You're right on both counts, thanks for catching it.

Yes -- the "lock-free" wording described the pre-patch state, not the
behavior after this patch. After the series hsmp_send_message() takes
hsmp_sock_rwsem for read, so the data plane is gated by a lock; the read
side just doesn't exclude other readers. Calling it "lock-free" in a
current-state comment directly contradicted the rwsem documentation in
hsmp.h, so I've dropped that wording everywhere it described the current
code.

I will submit v7 which is a comment-only change on top of v6 (no 
functional change).
> --
>   i.
> 

