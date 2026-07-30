Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010011.outbound.protection.outlook.com [52.101.46.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336E03E765A;
	Thu, 30 Jul 2026 09:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785404543; cv=fail; b=MGn8f9MxAOvcnT2lzyT9LpJJ7OlubhnS3ENwLuXjKNopanwHc1Wfydh8Hd1C6XXGSGMemYBlEjS06tG2zWxkhZsssbtxBUWZrde1NPbFn2eil0DS6ZaQD8knLl1DU4L/XIHq2kQMTT9fgzbViJYBhNWw0yEI9IxNoRsQoDOX17g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785404543; c=relaxed/simple;
	bh=KLrE6bQWg8MtO6+YOjmXTVcm/z85S9oHBLk7eDQTOKE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Z/1mfjbwMhIExytmNhYQPMJ26xVBTwOwR0Iwwdbo4nHyRYZdpSdrH8A33Z07i+1DOUmiaC9IQ6ECa7+YqrrCzNGOrxxsPIb/7LRrDLpSJnMYBBTuYpjhNBN1k5A/zish9NnM28mMT97ptdbqBs7khKZBPYUVa4jG0AbIBH4A/u8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=e/xJfePJ; arc=fail smtp.client-ip=52.101.46.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="e/xJfePJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fl7YuBtC1p4d5PFierSsbnJnUPcvhk15u7nxZindw5CzsOykUYoX3EgFvEPoSxlBghFqmG6AbmbyllMJJmnANcrd5l36yF82fLbg0wQakyNCZrOonADiLntyhJWMxWQsTqYB2VgtgyxcLSrKIdqKUaub7J0E6rSFaDh6NZP7wyhHFudBjmoEadCK0CBpr7UReRxPSwoHDilD6jeEsLeFzOVHD5UE0F+rATbTtdL9syU5bZJf7aoUJX5CLxPwlfbWQSYwstArC5Ok4qZWf+kk7N+3P9mqGJD7BY5vX+88eqLUpO/rrBbZ6zfhTLIJhtA2gY98Rm0mHxP8Tf+454fAiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fO4ca+1xybVBrAzCTAbdQIWTJEwnyeRm9n5fc1aVhY4=;
 b=P3OXiOuMVrN3w6C/NZ6ktSKtvD/EEr86ajjvtF4jCUjXVUoOtVJvU/ux/QLhAjzP99djfCULXdHt22LrGBG7kcI7EY1xIygbiAlj67LZkyz2Goe36BXCtW1mRSgb+DSfUGbuPUAatKPqypW6URD8Hqizm5fX5hj1SePrtMIikkjK+XXTSt5N8dU+YTWHD2tj7Wx3WaJMI+rAhBkmzW5eYSE6ldEix3XecYU/Up+G6+RFgBgO3rAV67Ua0XEnhLjBZiUueReYcO5wXuOUIB0PirFuUhrkfEoRNeO6a7TuzfxM665TzTg5cMLF/0wRPGHm8BbqOjV2u5Jhb8sxjTczVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fO4ca+1xybVBrAzCTAbdQIWTJEwnyeRm9n5fc1aVhY4=;
 b=e/xJfePJaZAonQaUIGCc+gTJTsFZ+MiZDCZ1YG5Bg4GtZNbBVJENcuy2+KnCRXslQnvxNGbDKGxuxjs3ysL6vYx+4YqJwM+EaKtYiVux9xddlvEKnZh6kZu08v6eo3bt9FCO0j+Eozp3ImDUnCR4xrlPgQ6yvvbuRwZYriBe0mI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by SA1PR12MB6995.namprd12.prod.outlook.com (2603:10b6:806:24e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 09:42:19 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.21.0270.009; Thu, 30 Jul 2026
 09:42:19 +0000
Message-ID: <6536e0af-72bc-4b47-b3d8-65826a49bf5a@amd.com>
Date: Thu, 30 Jul 2026 15:12:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] platform/x86/amd/hsmp: Route metric table through the
 client messages
To: Mario Limonciello <mario.limonciello@amd.com>,
 Muralidhara M K <muralidhara.mk@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 muthusamy.ramalingam@amd.com
References: <20260729164034.1331375-1-muralidhara.mk@amd.com>
 <20260729164034.1331375-3-muralidhara.mk@amd.com>
 <2cc5bfc3-7da1-4efa-8af8-89192eee1314@amd.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <2cc5bfc3-7da1-4efa-8af8-89192eee1314@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0010.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::19) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|SA1PR12MB6995:EE_
X-MS-Office365-Filtering-Correlation-Id: 867959f5-dad5-4e95-87c1-08deee1ed8ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TNsfrtdJaiPT+w4/wjcyx/Wy8GUNrNwrJDcL5CVnnZJp5Mm+mC38cB0+9GpNy5GbW2wJbRsnY/c+/vlAsPLiADnFIjEFZs8cB/uVYLWPXLbS7JnmPQP6+4/SJXkDQ99OQBSker/rjSQk5AfxdWRhJCth70HJqTPt3NBXSkG8ZFcJ9vhJQWMm48Z7TtiWRsUC0G6n+6pHCE5kHnJmUTSDQcD9/k3IsbNdVSOkqzL+EpI5pV0MOPj6x3OgP4J7kyq+3QSpig924Mj1AmXMxlmQdHNBS2ga+ZOhQdsKmycS4ZHUE/+ND/vXnt35WgbDqsj6XybBV9LtIi/DYCDipUYP3jTrRUaefzHKHQ8LpwrVOrM5DFSsjyK/tF7K5siJoIzKnjMrWCdHU23fjJcY1uIHpa9pn9SfcFpjkVsz6DS53WRA3pBvDBVFaHOlGid2QM9QqGQ9cYCLfbsUiRnZJzuQKvo2Wd5A303r+RZxV+cBe/qLdPq7WD0lXfcj0ME+5FBlczhC1GQnMmi2xIlDYYpYehzeSc8Y6F3YeBdKvhJBJxwrxeQkd5/taTfx5EY6RABFntf5oOyxPl+cGP99ZKOkpWBa2QG2GyfN7imCffvjUEemor6LJ9vGkFew+48w/TLKKYx9K2A9fLHz8b7q1DkRSGpK1DNTWStCPFAmBEGKj54=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFN4V2FCSXcyVkJvWkdhV1M3NW9nOVRobFlMdWVyTE1mSlYyRkpPekkzSUNn?=
 =?utf-8?B?aVV2TGZDTlNNMldGZlh6K0pGTXFtUGhpT293dW1wbDhqTTVENnByK1pEYU1Z?=
 =?utf-8?B?TzBOd0dGRWttemRSbnBYK2R4WTdFcU5rdCtVVi9oSnRVVS9PUnVFRWpkVC8r?=
 =?utf-8?B?cUhNVkVKRXM0YmdvTUw2a2ZURExqSEllT3lOa0ZMSVU0MHdNb0d0N2pMb3BY?=
 =?utf-8?B?bjhsYXY5ZGU3NDZ5QnlqMjIzcElwb1g0V1l6dDZoR1BhcjZHNnVIZXRRNnZP?=
 =?utf-8?B?YmpsYW5BU0NvV1UrK1orN21zNmxKVmw1WHI2K2Q0Qlp2OTN6SmdleXc4OU1x?=
 =?utf-8?B?cElnUWNXYTM2Rnk5azcxQmJlWTFoclhFUHBrNWYzU2Nua2xaSW1aaDdZM2lV?=
 =?utf-8?B?dFR3Ymd1K3NFbVByWTVIZ2VZTkpFZVJhcTlneWJQN3hidmZXdStwMDRoY05h?=
 =?utf-8?B?Znl3ZDhqSWtLQ2FwRmhHWlFCY0s3ajlUdDVtS2NJVU1IOXBpM0s2QWNZc09x?=
 =?utf-8?B?SE1ia2E2aGpkZEdOaTBVQi83Y3c5WkRUc09SbTRTTGxGeFRKSU1zNEp4dnpu?=
 =?utf-8?B?b0NJeVB4OFhFRjdrTlY1cjMzakM0YWE4SENCTm1Rb1BzOWswdHVvMlJhZDVC?=
 =?utf-8?B?Z214MCt3SkRmaS8zT21SbUtVbjF4bmQ1MFJnbGtuYnFKWkZUWkZjN0dUQ2ZS?=
 =?utf-8?B?cGpFRTJjaFlOejJ1RnY3YlJOeE9pNWFPUndZc29veTV0TCtOb0RMdm54b2hm?=
 =?utf-8?B?VjAyR3NZdDYrWFhycG92RHl4cmRzS1ErRlVFQ2RCc3l4U1c3cHpMZGdyeEpn?=
 =?utf-8?B?Q1hidHFSdERFQ2k4czBLYnBSTTdVRVJTSEFsMzZDME03VUEwUWIvL1l5Z3Z2?=
 =?utf-8?B?V3YwaFl4VDk5RTQ1T0VIVnVGZDREQ0lZWHAzSUNiK3YzQS95UDdZTUlsNFVL?=
 =?utf-8?B?WTlYeUxhVWJUSmlkVXlvOTY0S1FPQThKVDFQMUJ2a0Q2UWFsclRkMDNNVzVV?=
 =?utf-8?B?RXByWjVOVjhjT0Q0U0NPaVRVL0czUUxpWE9lQUhPaUFCaHMrN2ZabTdjNldM?=
 =?utf-8?B?aHdnZStQSStKVzR6dU04cjZVU2RtRXhsakhTL3YwUEtHRFM5ZkdoUWh0YlNz?=
 =?utf-8?B?aWZQUVVyaklUaE5QV1ZFYnFYQTR3QXZXUmVsYWJ0V1ZEQkJJRXhBWG5hSStL?=
 =?utf-8?B?N1owdzJxQjVSRHJFRS9JRTJGUE91Q3R0NDRrcDhGMWpiN2ZhbU9kTGdlNEZv?=
 =?utf-8?B?VHN0R2V5a0o5WHRHbzh4ckdPOW9WMGdDZWVWMjNKNkExUjU4ODhvNGhualpZ?=
 =?utf-8?B?amloZEVpNU40Rzl5Rk1NcTZYWUdTeTZCQmJqNExhTlplL2lTcUFZOGxjeDVl?=
 =?utf-8?B?NXZ4VENWUzQxWldQZmZNTFBqcnd6L21WZXhiQnBTVHpUZnNXQURMdGFBNTZs?=
 =?utf-8?B?UHJDNFFtTkl6djFQU3M2clZqSEVMOWcwM0Q2M25tS3NnbFVveG5VVFVkdTFI?=
 =?utf-8?B?K2RaTEpzdjVKd3VNSXJEZjM3bUp3N003Q2N6VkNlTllzc0s2YjdwS1RQcmZx?=
 =?utf-8?B?Rk9ITHVLbnNMc1FmOTZXdWJyK1NRQzBLd3k4aVVwUmg4Mm1wWjN4YXlnaUZq?=
 =?utf-8?B?YWg4a3pNRDlYZFJDMEV3ZHAxUnM0Smp1UjJZOStkdHNtZjdhallJdkROQmZW?=
 =?utf-8?B?ZzJ1aEpCVzhTV1BhTjdrYXJsUktOeDFwWVNST0ZwcmIwOTR2U2RPK2NsTGZY?=
 =?utf-8?B?VUR6ak1NazJSUFFRU1V4YUN5V2xWUHZQUXdEejcxOXcrVGloNGdiZHBNZllV?=
 =?utf-8?B?VWVRcGlYU0VnNkpxN0lPdTRCYUhwNG5aZXZPWXRwdjFqOHNBQ0xkdE9KdUNz?=
 =?utf-8?B?ajI4R0kva3c3M2lmQi9VQndmb3QwWUZiVTdYN3FiUStkVXdHdTNpMU1XWUdB?=
 =?utf-8?B?OVA2OXJ1a1lMUWMreG1vWnVQUHBwL01pYktDNzhyTnpxMWh1SFQvaFd1YmRi?=
 =?utf-8?B?SmRVUitreHpRVi9YNy9Sd2Z2OUF6c1l2eTQ3MG8xUVlVVTRDYXVBMWlTK2lp?=
 =?utf-8?B?dEdSK2p2QStxUmFwSWpxaW5WVnBKSnVRWnZZaVUyTXY2UVZ1K0ZBSFNIQnYy?=
 =?utf-8?B?UzJLVlB1ZHZneXB6bXA4aGZ2aTZlRFRYR0o0eDJHOGtUS1kzdmxKekVSaThj?=
 =?utf-8?B?WFVEa1lEUmxEMjJzbjh0UDZLemdSY1dqMEVKdW85WDlQYm9HWDFmaWwxVmo4?=
 =?utf-8?B?Q3VoQ1gyTWFndzBTR3pDeEVFNEU4cmMwaXhzMGNrODRIZFF2bVdrOVpGM05O?=
 =?utf-8?B?M3dsY3RDd0p6ZFkyV0dZTTl4QitPei9FK1dPNVgxNkZpdWF1M0dVQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 867959f5-dad5-4e95-87c1-08deee1ed8ee
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 09:42:19.0955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uv/eACQ427+R7LGVdIzLscWAFHM2LYk8vpgAMT70M0BfWWqG64DQwCbH99m9wZ4q2SaaiC/+cd5BXeOka/qCHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6995



On 7/30/2026 2:59 AM, Mario Limonciello wrote:
> 
> 
> On 7/29/26 11:40, Muralidhara M K wrote:
>> Wire the client metric table and metrics DRAM address messages into the
>> metric table read path for the Family 1Ah client platforms (Models
>> 80h-8Fh and E0h-E3h), and initialise the metric table on the platform
>> driver probe.
>>
>> The client reaches its metric table through the Ryzen Master SMC message
>> set, so add the two message IDs to struct hsmp_plat_desc and have
>> hsmp_metric_tbl_read_locked() and hsmp_get_tbl_dram_base() take them
>> from there. Unlike the test and version queries, these two are not
>> numbered alike in the two sets - 24h/25h on the server against 05h/06h
>> on the client - which is why they have to come from the descriptor
>> rather than a shared constant.
>>
>> Fetch the metric table on the client whatever interface version was
>> reported. That query is already non-fatal there, since some client SMU
>> builds reject it while the mailbox works, so hsmp_pdev->proto_ver cannot
>> gate the client metric table the way HSMP_PROTO_VER6 gates it on the
>> server.
>>
>> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
>> ---
>>   drivers/platform/x86/amd/hsmp/hsmp.c | 16 ++++++++++++----
>>   drivers/platform/x86/amd/hsmp/hsmp.h |  4 ++++
>>   drivers/platform/x86/amd/hsmp/plat.c |  7 ++++++-
>>   3 files changed, 22 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/ 
>> x86/amd/hsmp/hsmp.c
>> index 9b65dbd47965..2326506929a4 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
>> @@ -65,6 +65,10 @@ static const struct hsmp_mbaddr_info 
>> hsmp_mbinfo_client = {
>>    * are also the only ones the two message sets have in common.  
>> Messages named
>>    * by userspace in an ioctl need no entry here, as that path already 
>> resolves
>>    * the ID against the running platform's table.
>> + *
>> + * Being common does not mean being numbered alike.  The test and 
>> version
>> + * queries are 01h and 03h in both sets, but the two metric table 
>> messages are
>> + * 24h/25h on the server against 05h/06h on the client.
>>    */
>>   static const struct hsmp_plat_desc hsmp_desc_server = {
>>       .mbinfo            = &hsmp_mbinfo_server,
>> @@ -72,6 +76,8 @@ static const struct hsmp_plat_desc hsmp_desc_server = {
>>       .num_msgs        = HSMP_MSG_ID_MAX,
>>       .test_msg        = HSMP_TEST,
>>       .proto_ver_msg        = HSMP_GET_PROTO_VER,
>> +    .metric_tbl_msg        = HSMP_GET_METRIC_TABLE,
>> +    .metric_dram_msg    = HSMP_GET_METRIC_TABLE_DRAM_ADDR,
>>   };
>>   /* The client drives a different mailbox with the Ryzen Master SMC 
>> message set */
>> @@ -81,6 +87,8 @@ static const struct hsmp_plat_desc hsmp_desc_client = {
>>       .num_msgs        = HSMP_CLIENT_MSG_ID_MAX,
>>       .test_msg        = HSMP_CLIENT_TEST,
>>       .proto_ver_msg        = HSMP_CLIENT_GET_INTERFACE_VER,
>> +    .metric_tbl_msg        = HSMP_CLIENT_GET_METRICS_TABLE,
>> +    .metric_dram_msg    = HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR,
>>   };
>>   static struct hsmp_plat_device hsmp_pdev = {
>> @@ -643,11 +651,11 @@ static ssize_t 
>> hsmp_metric_tbl_read_locked(struct hsmp_socket *sock, char *buf,
>>           return -EINVAL;
>>       }
>> -    msg.msg_id    = HSMP_GET_METRIC_TABLE;
>> +    msg.msg_id    = hsmp_pdev.desc->metric_tbl_msg;
>>       msg.sock_ind    = sock->sock_ind;
>>       /*
>> -     * HSMP_GET_METRIC_TABLE makes firmware refill this socket's shared
>> +     * The metric table message makes firmware refill this socket's 
>> shared
>>        * metric DRAM region, which is then copied out below.  Hold the
>>        * per-socket lock across the fill-and-copy so concurrent 
>> readers of the
>>        * same socket cannot return a torn snapshot.
>> @@ -713,8 +721,8 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
>>       int ret;
>>       msg.sock_ind    = sock_ind;
>> -    msg.response_sz    = 
>> hsmp_msg_desc_table[HSMP_GET_METRIC_TABLE_DRAM_ADDR].response_sz;
>> -    msg.msg_id    = HSMP_GET_METRIC_TABLE_DRAM_ADDR;
>> +    msg.msg_id    = hsmp_pdev.desc->metric_dram_msg;
>> +    msg.response_sz    = get_msg_desc(msg.msg_id)->response_sz;
>>       ret = hsmp_send_message_locked(&msg);
>>       if (ret)
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/ 
>> x86/amd/hsmp/hsmp.h
>> index b4bd9800dee1..c46d53dbcd43 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
>> @@ -103,6 +103,8 @@ struct hsmp_mbaddr_info {
>>    * @test_msg:        no-op message used to probe the mailbox.  Also the
>>    *            lowest valid message ID, as ID 0 is reserved.
>>    * @proto_ver_msg:    returns the interface version.
>> + * @metric_tbl_msg:    refills this socket's metric table in DRAM.
>> + * @metric_dram_msg:    returns the DRAM address of the metric table.
>>    */
>>   struct hsmp_plat_desc {
>>       const struct hsmp_mbaddr_info    *mbinfo;
>> @@ -110,6 +112,8 @@ struct hsmp_plat_desc {
>>       u32                num_msgs;
>>       u32                test_msg;
>>       u32                proto_ver_msg;
>> +    u32                metric_tbl_msg;
>> +    u32                metric_dram_msg;
>>   };
>>   struct hsmp_socket {
>> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/ 
>> x86/amd/hsmp/plat.c
>> index 7423c98a7b3e..bc29b0ec18f7 100644
>> --- a/drivers/platform/x86/amd/hsmp/plat.c
>> +++ b/drivers/platform/x86/amd/hsmp/plat.c
>> @@ -185,7 +185,12 @@ static int init_platform_device(struct device *dev)
>>               dev_warn(dev, "Interface version query unsupported on 
>> client SMU; continuing\n");
>>           }
>> -        if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6) {
>> +        /*
>> +         * On the client the metric table is fetched with
>> +         * HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR whatever interface
>> +         * version was reported, since that query may be unsupported.
>> +         */
> 
> What version was reported on client platforms?  Since it's the first 
> time client is being supported with HSMP, maybe it's best that client 
> should be reporting 6.
> 
> Then this part of the patch could get dropped later.
> 
Currently client version is different than server. So it needs a 
explicit condition for client programs.
But, I will check with the SMU team on this.

>> +        if (is_client_platform() || hsmp_pdev->proto_ver == 
>> HSMP_PROTO_VER6) {
>>               ret = hsmp_get_tbl_dram_base(i);
>>               if (ret)
>>                   dev_info(dev, "Failed to init metric table\n");
> 

