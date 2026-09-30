Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013050.outbound.protection.outlook.com [40.107.201.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8001B51AFF0
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 17:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789155; cv=fail; b=ECj+h6zMXF2otfiigpVnrRJdzLU/cxEVavo7/gP8+PnndOvfoCK8/+A/SxJQf6JjMfpSiCVvTAwsGBC8NinNvRPmlic+XoKBkusHwLZIiQJkgeOo7zkD00j5UJW68XjjQkChesfM42f3kyL4YQVUMw87bqPBpLuEms5WfJVF6VU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789155; c=relaxed/simple;
	bh=5Uv7bSIDZE5kcdiN4EGG1PyTBmucRo/1ImONiOphvYA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=t3sLBOKWb6VM91xzQbt26Yd99c1cZaRB74AEhqNLBwAirnNSx7LkRpFv0AOml/Ss1/zF7qRkrP2lU2WtEJUuqe6gwlF22aOve19+KAwZVWpQB2t99GBOjtIIYLBET4V5E07TyDMSBX3BStl1mBl02axdh1pXv6zcGzc5mUc+83s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lSU6HNZK; arc=fail smtp.client-ip=40.107.201.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lSU6HNZK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fVxm3Ni5K6eX8MlwpS47tKPRlcXslXZjgjeVrapgTPt1w224cqpCUX/oAaCvl7ymIgqi3qSRuzCmawyCjeGt13my3Boazt3waZy6xTdFSi6ugdY987Va4wE6QIvZR0vq8bHD4WWp1VtYTzNNnfSx99MbylmcE4dfu4r6K6gew+l906v2POWVKI7k9vH3KcFNodrUwEzFHZeCk81EH1bmqo7dUjZafAVWKltpttkysiw2bZO0iwTmYPLpY57+vu/WnO3dCRVlPHghKfyH9KSUEg3oGGcf1whiuuL4lZa0SI/y7nTGw1h0YOLTm/SxTkFmLT+4XSgfqo2p+bp2FG8oLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMANJQPs9saL2hOLXQaVmCqfKizAi13AdplTvn2EGCQ=;
 b=dp9Zvx/XXY9FDazxZKLlvJ31e8eDCZAr74MFZRaOYgdPD/9opJFP9HvQqI8n9BViKokruzdrKRZ5UQIH8H3AloD+8sFwZb64AhU8xoB/AftHJe6LWMwnZnAybyRtt7DoE12hmHKP9o673rlxCCuoDZkaOsxsDXnxN9EZ4hYCDBiSk4EeJRCZtH9kVp8jpF57cVTl8oYjvUk3+gA80GeQ/5TG7Ltr0qDncXkSR6LK3RMxGIaQdGeaU1/wPJHdhkYyLbL1wbFMTaM5zuE0osVmK80tu7MM9VfRZb1ZdOIXcUqdPT4ouocIS4MabZX/ySw4yCaQBIh3sb0UNejBDt8xhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMANJQPs9saL2hOLXQaVmCqfKizAi13AdplTvn2EGCQ=;
 b=lSU6HNZKWnaiRNOVYur2ZOZQZKB/e1GDzAxJhxCzwQ8sBTGjKGPHecQqrjppsqOiG5OcWpmc/gKvPxO/dM5Wpp92ry9IEFAJlWNOXbFu5Ig+H3MUS8cfNToq7yGSjx3JrOoKMnIgKE4DQ9/s1M5j5mOC9CGC6tPzZv1bBlQA/Fs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6717.namprd12.prod.outlook.com (2603:10b6:510:1b0::20)
 by CY1PR12MB9673.namprd12.prod.outlook.com (2603:10b6:930:104::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 17:25:47 +0000
Received: from PH7PR12MB6717.namprd12.prod.outlook.com
 ([fe80::3b23:bb4a:e507:c6ff]) by PH7PR12MB6717.namprd12.prod.outlook.com
 ([fe80::3b23:bb4a:e507:c6ff%7]) with mapi id 15.21.0451.024; Wed, 30 Sep 2026
 17:25:46 +0000
Message-ID: <972dde29-309c-4c4c-b27a-8dafee1eadf6@amd.com>
Date: Wed, 30 Sep 2026 22:55:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmf: Fix ACPI buffer validation in APTS
 path
To: Mario Limonciello <mario.limonciello@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20260929160241.1718067-1-Shyam-sundar.S-k@amd.com>
 <455753cb-8b38-42e0-837f-a8b8fd33093d@amd.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <455753cb-8b38-42e0-837f-a8b8fd33093d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN5P287CA0004.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:262::6) To PH7PR12MB6717.namprd12.prod.outlook.com
 (2603:10b6:510:1b0::20)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6717:EE_|CY1PR12MB9673:EE_
X-MS-Office365-Filtering-Correlation-Id: d14c0ad3-4817-4f80-5ffa-08df1f17dcd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|4143699003|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2L9UkFuz2zDxkWj/hb484UJyOKJmLn8fTRyojC+XU9+6D20wJ5Ey+Wmk1Gfb59RoDgFMgzvCFcj6tvm1LxTc2+wlDnbSJVDexAZjxHX7tRhf5Zw3jGGFgEvO5bk6Ebnlvr93vn4WXZHYYd31idXUVpW55/lEUKvC70eo9s7SrsD5jnsVG0bO92yvaRpgvO8hZDBFUQXbbqI+F2gcYWAQ3j64ZuNRB4UuYpfyLx3PQI+PCd78lDa/vHmbkypX6EIwz3klmrEF4lwvMuEvY5FyXxuCVCTpnHZKwl8jzt7dwdAi9wI8bLV4K3zdMJQB3pubIdHP6wIswYy5aYa8MrMNT+7LhFcV+OYuPxfQGRRS0/ZUZed9PXjrJ49aUZWvVZo5gCVHJASTdhtAFWhPRc8/shLOBEa/we8dMBLo3KhJZ1NU22xvolcUpqE9JVTVLXVUnCqkT3/38KUKOa67w2vRJ+jH95jbVFpzL83UG5y3W0ul01BUrJRqDogb6RypHXNr+1VGDemRNoIhMj1bWOooUv5h4b1szAfJ97D0uQzxiF6G9g+eISksR3/OkNQH88RURlb7KI/dSwhSk8rmGnyBPVHKOuN0D9MI/eUYKRo4u20L995W5263Z2D15rHq57j/udzcx98rokZNG3yhkmtNQ4QEyQhDeF6gRMVqGyR5DAU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6717.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(4143699003)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzNlUmtGNmQzKzkrN1kwb2s2cGpSV1VRc3hqRnhBV2lUdkl2cjRJbHRkc1dC?=
 =?utf-8?B?NWl1RnhlaXZ1TjY1QkUxVHhnQnE1TDRWUEx2ZmV3MjNGTFlLOTRKMzIzckVx?=
 =?utf-8?B?dU1WK2JwSXZJWFJhanFpd0VDeElOa3JBZURLeDFDNGwvQnk2S3Z0WmcyMTIw?=
 =?utf-8?B?ZW5WTE9xOWlHcGtvUnc0anAyRU9uYmR1MDJodkpZUUU0dVlZbnA5Zm1RVk9I?=
 =?utf-8?B?djAyOG9JblZEc0pZcExmR2tUbjhwU2sveitkdUtjVlFUdVB2cGxpdVBwOUdu?=
 =?utf-8?B?RG8vZVBseGVBNHMySVlSbnU4SFBKOFplN0lJTk55SHBXQmZ5c0E1eXJnUzdU?=
 =?utf-8?B?UnR4L1lWL1NZQUt0ZjJGK2YwRWZqZzB5ZDhBNVZFckpVaENWR0xtMk9TT3pB?=
 =?utf-8?B?OFlRZnRMY1ZaaVY5S2hlb2ZyZkc3TWJQTU9PTzQ4QWhuWDNiU09IRTVocGh2?=
 =?utf-8?B?UlJNcjAzdWVPU2pYMCtwV096TXkvYVpjamtOTlBvOElGRUxLdVhXa3JCY0tW?=
 =?utf-8?B?YUtuc0Z6eDZTZHNTRitOdzlYdDVCM1dPclVNdWZuWHIwM0lJYmNXcVdsQ2ty?=
 =?utf-8?B?clJCc0tyUDh4OTU3RWdPa1EveUFOeWRNTTVBMEs3OHpzSWpEZHFPbWhsRFk3?=
 =?utf-8?B?dEYyRXRLbm0wdzhOVEo5L2M5QnErcmdrMWRkVVowcG9DcDdqYURNbWdwV00v?=
 =?utf-8?B?N09XRWkyMTMxdWZlOG4rUEluZDh0bFpJaFFaUVJFaFk4c2FTM2dKd0VSNGM1?=
 =?utf-8?B?TDBJMlBkWFBnd2NaS2NhVEZ3cTVTTWYveFU4bTBhK2w1cW42aUtjajNWZ2Qw?=
 =?utf-8?B?Zk1pM2huZUp5UGpXby9qY0JvK05rY2hoeDYxMXBBd0ZzanlkNnYrQWYwZHlL?=
 =?utf-8?B?OHdqa0FpbnpSTU5CY0JmTzZvNngxTE5kRU9OdGZkV3hpS2ZkM0xONXRoL1VV?=
 =?utf-8?B?aGhYaG5oT2VGb3JjNyt4RlE5UmtTT3VURktHZWRTMFdudEJweDk0RkgvTWc3?=
 =?utf-8?B?ZXQxWm5CZXhjcnZ4Zm5YbzhXZThhcjZ5ZkNqZVdQdk9JUkR5Z2NBNjFnTjlN?=
 =?utf-8?B?a0Vqdk8yYS9MdGhsYW4yUkdEdWNYWDFNZmhHbytHR2RuOW84aU1hZUtQb3JK?=
 =?utf-8?B?MkMzd0RBd1c1WVBuSzNKL290NU5qdURRd2JUTEd4Ty9TT2FtTVNmYTVYYkNv?=
 =?utf-8?B?Q2Jnb3BXM0VWbEZxTit6NHprUXRMU09RQmNQMDh6WmorN1RoaHJ1SmEwd25R?=
 =?utf-8?B?LzllZ294RnZHbk5aS1RaZ2lkaUExdVpFTnB3SWllUmVCWHJzNHRhNll5ZlNL?=
 =?utf-8?B?Y042THF6cGUwV0V5RUNzVS96dUNIWW9RR1JIYWtsMDJMd0U2NlRzakpEUFZ2?=
 =?utf-8?B?MGhlY0dmQXljLzI5dkIvQzVXaXdONHFSRHY0TnBROTVaOHFyRnVtTjJvYUVM?=
 =?utf-8?B?dk5OQUgzdCsvYm1wSDM3WkZVR2hlZjJZYjdaVFRhMk12ZUtGdmY2dklYdFo4?=
 =?utf-8?B?RWhqbWdhSks3WTZaSUJjcjhRZXRqYTZOZmxabDAzYUhZSi9yQmRIejdTRHgw?=
 =?utf-8?B?S1Vwbjc2d2xmY0dCMEZWVkRjTWJSQUFWL1oycXUzcDRURHNSb09DMURWK3FR?=
 =?utf-8?B?SmhxS2dnNndMeFVYb2svYU9qWVNOamtSR0k3QytoR1pNSnk3bDZIVksvNy9J?=
 =?utf-8?B?R0ZBWnhkYTFkc0c4RTlIbkkvd05Qc1g3V1BEdVNEMVI5Y1M0aDJXUW5UdTdu?=
 =?utf-8?B?N21RV2kvTk1EQXBVL3poVEVmcXM4SC9CN2k1akFycUlTYmR2b09ab3BzMWc3?=
 =?utf-8?B?YXJmUFdOWS9zaExpZkZlVVd4a1JzU1Y0TVE1Y3J4cXVpeHRjR0ZCTEVmcWlR?=
 =?utf-8?B?SElqMzhBTDVHTmZwdnhCQUpqZkI0ZEx6UUJEeUdsUk5nbFViNVBKQmxHeHlG?=
 =?utf-8?B?Yjl1MForekV1ZXB2cmdrQzFvSEZQRXk1d1lnOEZQZXNkeWlwc1pYZy95cUNJ?=
 =?utf-8?B?dmFQM3VSRkZCY2ZXVDZmYlVSR09lNU5iaTRBM2cxcWFpcDVQYjhiZW01WXhW?=
 =?utf-8?B?Mjl4WTFwNjlOcmZXZ2VkK0VuNWU4aE5FZ08xNlZhWDg5N0ltMCtzVjB2ZHN2?=
 =?utf-8?B?RVJVNnFpVE9iV05EbmlPZHZDd2lBOW5JUWlNZHpmNEQwdUtMODhKNkNaWUpj?=
 =?utf-8?B?YUEyN3NGNFV5Mk5nSkc1TVY3TWlqZ2JsWjdGbFh3djBxZW1xOXJrK0ZYN05l?=
 =?utf-8?B?ZXJndXR3aW5UekFDeU1BTUJpM2lMWCt5VmF5aDJ6d2JtTGVtNitGYXdBSmVU?=
 =?utf-8?Q?eIt91ZGZBUpnc2YvY8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d14c0ad3-4817-4f80-5ffa-08df1f17dcd7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6717.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 17:25:46.5321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Arh7Wa9MEzkIrwTcAje8ItI+8+BAaZMIWVFVkOt3MVsyJ1Ocfhv8j+m5/y9sW06ROex0SgM4sp8yROuPWc1JEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9673



On 29-09-2026 23:12, Mario Limonciello wrote:
> 
> 
> On 9/29/26 11:02, Shyam Sundar S K wrote:
>> apts_if_call_store_buffer() reads a u16 size from info->buffer.pointer
>> without checking it is non-NULL and holds at least 2 bytes, so a short
>> or NULL firmware buffer causes an out-of-bounds read. Guard the access
>> and return -EINVAL before the dereference.
>>
>> Fixes: 3eecb434d7f2 ("platform/x86/amd/pmf: Add support to get sps default APTS index values")
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>   drivers/platform/x86/amd/pmf/acpi.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
>> index 3d94b03cf794..c820a5da77ba 100644
>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>> @@ -138,6 +138,12 @@ static int apts_if_call_store_buffer(struct amd_pmf_dev *pdev,
>>           goto out;
>>       }
>>   +    if (!info->buffer.pointer || info->buffer.length < 2) {
>> +        dev_err(pdev->dev, "buffer pointer is NULL or too small\n");
>> +        err = -EINVAL;
>> +        goto out;
>> +    }
>> +
>>       size = *(u16 *)info->buffer.pointer;
>>       if (info->buffer.length < size) {
>>           dev_err(pdev->dev, "buffer smaller than header size %u < %zu\n",
> 
> I think it would be a good idea to be consistent with apmf_if_call_store_buffer().
> 
> Either add the NULL check to apmf_if_call_store_buffer() or only use the bound check in apts_if_call_store_buffer().
> 
> Would a helper they both call make sense?

Agree. I sent a revision with a helper function.

Thanks,
Shyam

