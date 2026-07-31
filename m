Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011066.outbound.protection.outlook.com [40.107.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C701E30C371;
	Fri, 31 Jul 2026 04:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785472053; cv=fail; b=GZP4B19s8hpfThjfxBVnKCuU3EdupvYkydqhF9oVvzCpME3SNeBJ1P+efbitC+0lGycoj/qPlvMTtFMxYoasV1xcCaxluoQnjGMAxjlm0jyz/Okse2tsLBefbYk1K7iKkAO8QGRFv0BKQnn6fbihvVO+GJ5SPd1IMT0BFuTYXzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785472053; c=relaxed/simple;
	bh=i6sD3KRFwOaMbdjb2AGGxfo1hwNhfE2YIyOQXisgqj8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OOZFCuV+tOPvywTifnhg8iQqNPZAqLAbECaQZZs9zFdxD9rDrEowBKxcGqrUlmp4SkaJojg/UIB+R50JYqXBc3s9VXyX8G58QlNubLnQDLSEsi7zB4eN+T+d2I5/DksZP7wsHeKerbwMSADONbJPAJBtYmRlJa3m/pRWNNhWjB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Nhn8fwEY; arc=fail smtp.client-ip=40.107.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Nhn8fwEY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ktYzYVd9nzVByFlbl4m8X8n6USsw9kE+6cw8TxwbkLaTx2LZMRHWeeWO3gxsPUT6v237KTSCRlhsgcBo05O4GZj1SjzyI/wnicAlLgUui+FpfLzINYZ5VnBk3CxhRa2ISuW5Rq/p8jdI6CXrpGcF30GVdcEnRSc74EusDFrvOGks0zsAdi+6yeZYNCILW93FiLL/r8KnNKZGI6v3xcNDypfNbchV+TvMwRUq3yKXAu9UCS4BAEWaPQOYO/XmUJQNrTBcsym0c3ib1Y1wmgbx8tz4ekzHLz8Q1HV/RZ5rMeEmsnATwvCBxEh0esJMyh3gCUIv9LikBhOfLuP+X+HTBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YO7mJhNyZN4vWsJKFxOUUmWTWU1QI08+H0NhXaqAMZo=;
 b=YARIcHxVm/kPO+v14xVOHgkzUnFEAt0OJrX1kN2WrRbwhd7OARuFN63SURAMhW4qxfYZR6pZZ+vcDoR13NFHC7WkJHm2bn2gkYJ3QvEqzRq2mwGR6equAgXnFixsSpvxoGblyWgjS7RZQbld8XsmCa6nnlQ+xUEOQ44toHdVOtvh6PEPqlkxMXFPWAH6k0y0SqUf8w0QRxjIrmBO1Ik0MDKkSWDz06uHHDC0OYDXNZow579KsiIkicznI4MRlxLoFwBCzT/+5+cSHzAKEObYgkdpnC/9L/HSkHxC12G6wNq4XfYn6TubRILf86CKQ6HVW089p9Ycfo/unfcY0wbGTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YO7mJhNyZN4vWsJKFxOUUmWTWU1QI08+H0NhXaqAMZo=;
 b=Nhn8fwEYxEUvJlq1z/IGD6tGLKes23ff557DYq2jq9EwdarionxtK3OpMpRuwza4PsOgYHYuK50C+FhMMNhZDcMuh/FUWYZFK/FjfCTUEUEU83uv/HnJw913qqjzeUaRgG9YfLGNX0m0VxuL2UEl263OupAHirm0kDOttNLI2ko=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by DS0PR12MB7703.namprd12.prod.outlook.com (2603:10b6:8:130::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 04:27:28 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 04:27:27 +0000
Message-ID: <351c92fc-ac25-4cba-bb2c-f2bf79fef126@amd.com>
Date: Fri, 31 Jul 2026 09:57:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] platform/x86/amd/hsmp: Add HSMP client support for
 Family 1Ah
To: Armin Wolf <W_Armin@gmx.de>, Muralidhara M K <muralidhara.mk@amd.com>,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 muthusamy.ramalingam@amd.com
References: <20260729164034.1331375-1-muralidhara.mk@amd.com>
 <20260729164034.1331375-2-muralidhara.mk@amd.com>
 <5c600f4d-a93a-4410-9183-d33b7f6f4fc3@gmx.de>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <5c600f4d-a93a-4410-9183-d33b7f6f4fc3@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0060.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::14) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|DS0PR12MB7703:EE_
X-MS-Office365-Filtering-Correlation-Id: 82b092ba-8023-4f65-fddf-08deeebc071c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|4143699003|10067099003|5023799004|11063799006|6133799003|56012099006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	IE+fhspuN9/KfmspfyAoqvGDZ+FdCxf3K6WuxLbUQxdMDy0RX3IbztJiLs2DcEefot57/ygMgRaomCRv73x7VUbIEAVq7LDcWIb+6hrQYkxIX+1DVkY2Eic3a87YemG431Mz7IZii+lqZrzpepZu+1NUZV195dNBGFmyQmupNw+5SC7cb1EHXCj36y2IZX73qmNHQk/IHRlZ14afmfW6WGig+s8RMk0odSa0K88cnE2ZqlRQK9JyPVZTeGaoNFJqPr2tR9XMxY64MGmoqD1HcR/uZmyUY76bv5J50xVx5VI3UxXSte0KsMFmOVt75qx7L6akaWmopiHA5fiNy0+oCIeqNRCn3myPWN68/LyDvsEZPpapOM7dLGwISky0wS0AbQTDfAI9rB79GyUwPKY60CIsGNW2UWVb6KmgULktxttewdBP7Dcmqoerl5/sndJzAFsmKnzCPrNcKxDNYTaXw0zVG+xvhqjCMvLJa5p7O7P++c08bJXmrJofyp9rOliU4RwLqAQm9Oj7wM0gZh45hkjltYMTm4nNujVmwph2K6LPkrLyiPOGDGyuFcoB9fq+764NIO1Oa3mg0jGmUp4D+CSzVGwcBKjVxxF0Z26kdzo0kMJQbe9pQYJuQHEy8f9ZWmrQnOMgNOyxFM8H66BFi1wuAI5U9+S/6QZ5OytGC0A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(4143699003)(10067099003)(5023799004)(11063799006)(6133799003)(56012099006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWlJdzNEbUFLTEg0MzZrZldHNFpjUmxUdEt4Z1BDd2FvS1hqaXVhdWtiL3RL?=
 =?utf-8?B?cktWc3VCS0dGTi9vVnZkeUpzd2FhdnVPVjZpSjhnS2NraC9zSlJvdkpKclpo?=
 =?utf-8?B?MVZTMjI5OThMQVNyemhLRkFZSEZ2NFF3VXRvUmFrRGJrbnFDRDRLY3k4UW5j?=
 =?utf-8?B?dy9ocGFyZUpRcnBzR3dWMytFcXBPUXl2QnI2VDJaSGFQK0UvNVduV0c5cGRk?=
 =?utf-8?B?TFFQU2VaMWIvWCtFa2RldHRVVUVYYTY1U1BMV294YlBwN0hGdWJkSjRvbnJR?=
 =?utf-8?B?OEJvNWVkcjR0dGFXbElsaXVKMG43NytBaktpdEV3eHNvVkRNMkpLYTc4U3l6?=
 =?utf-8?B?aFFLNXlHQlBKNjF2cU1lQUZSVjJyaVpYUytsOHN4SWw3a3BJcFltR1RycW0v?=
 =?utf-8?B?SENYNVREYlZzazBuMzlSbGxDRUphWGxzT0lRMHdUSEpwUEhtS3ZtRnlIUDZL?=
 =?utf-8?B?akVIdDVtMmdqdU5PM3NBTDR3NHRJSWVYTnlMa3JodCtwcmNZMjVIdGMwekda?=
 =?utf-8?B?Rk5SeFo1SGFWUGFZcXk0RnNabkRyTENEaWV6eTB4dGc4ZmtwS2tuYnN4eStU?=
 =?utf-8?B?N25id0JVRC9MS1VpS1RjK2ZsWTRFcklHUE52Z2xtV0FKUkk0YVByTWZKaTVH?=
 =?utf-8?B?ZU5XbU1NZzZ6TTFzUXh4ZURCS3Q3Ri8yQjBrMDhlMzZPZ1pWTFpNQ2VZMU5K?=
 =?utf-8?B?R29hanVGaUs4aGhuWXNGVldaUkF2RXhTNG5zYVJrcFoyOTNZRy9WVFhha1Rv?=
 =?utf-8?B?TWUxcThzaDFSdVFBVWowOWsxQ2J3MitvVHVEak5IZlJiVVBSbFo5MHNmZEp2?=
 =?utf-8?B?WXhObVdyOW5yeDVIV3BUcm55OVlOeVphUjNCaVNOdk95YjdlWUoxSFhZejJU?=
 =?utf-8?B?cm9Qem9oNm9IQXgwNnJ1M3lVQmdNcEwxVmtzUGg4MCs2N0lrWFdubkR4ZFNH?=
 =?utf-8?B?VTM1c0FEQXhYa0RIZnZhNmw5eThvVGIvaVB1RnA4MDVOdnVES1o4UndqT2E4?=
 =?utf-8?B?UG4zemw5TlRYZ1Jjb0c0cU13UEZ6cUhMRjFJY0Zxa3MvTmkwTEJ4V29LWHJL?=
 =?utf-8?B?TWxTeE9JTHBGeVMrbndxQXcwZGNiR1pOalI5enVGVjMyaHlNU0V1NDhPZ2cr?=
 =?utf-8?B?TzN5V1V6QVJkL2Q1cno3bWU5MEtCREczU1J4TElLMlFxa2crcE1sZWJEQ3g4?=
 =?utf-8?B?akI3cHEzTkNSS2VQYWFqUUtlbzJmMnBjVzNqU09ibk4xSUluMlJuZmk5K0Vx?=
 =?utf-8?B?SjdyUUZSVjNyRUphZ0JYcWs3N3NVWVkxSWtSb0pDNjBEUXdFOUI4MnltemUy?=
 =?utf-8?B?Ykg2L3Z3TFVZV0ZiWEt6MVZTUWFiTFlpN251NG1HWENCeWxpSEg1RXkwMjZq?=
 =?utf-8?B?OW1qSVZhZVRlOXpnZXRrTjRnanZWb1M0YXhGMDVLRDBxR01TSkwvMXdDWXdO?=
 =?utf-8?B?SldwaUR0NmhJREM2MlFMZ1pJQWMvWklHTG83eVRFalphYXkvcnNoZ3VMblRl?=
 =?utf-8?B?a05xQjZaWEZLTzhacWxlSEZDcmYyajRGY1Z5cWRPUWFMVzU1eDRkTkFzZ3c1?=
 =?utf-8?B?cnB4RExCN1hyUHdJZk1mUkJuREJRb0lpdEdRTVJjQjYwTklxTFQrWWx0T3kx?=
 =?utf-8?B?TTJzK1BjQnoyQytadzhMYWlweVoyYjYyQ3lwMStER2VKTlNqTDZPcHhSR3JB?=
 =?utf-8?B?NnJzQWJpSG9FV01TQWdLNkhqWlVQbTlMYitYdDQ3VUN5dUU3YWtFdzJjdzRC?=
 =?utf-8?B?Z0hYeUJFY0Jja1gzMmdlL045dHJkSzJYR3dsT3RxQlNMdWpmdmZYMzlLNFNR?=
 =?utf-8?B?SVI1QzZudXpoUXVsMi9NOFpPOXJlcisvTlFnemJHSlRKRkYrcjd5WW1xMjRI?=
 =?utf-8?B?b2MzNk0xVlhhckI5YW9mK2wrWkM1ZFRRQTZRK1JxN2xVUktCbVRIQmt5OVhM?=
 =?utf-8?B?US9EWFZ2WkFjcWFaaGs3SUl3endPMUtNSTJCRmxRZzlORngzMW5xd2ZYcEVY?=
 =?utf-8?B?Tm9RRm54Q01iU21uUXlJMDhpZEEybGwyRFBaNlBUY0NaSDdQME50b3IxUGxE?=
 =?utf-8?B?TnhscWxneTdweVV6MGJlZGZabFNFN3o4NVRkY0hCWDVwTDFiLzZiMk5CeUxp?=
 =?utf-8?B?YUN3NFZFWlJiMkdXalphMnl0WVo5djkvTXdrMUdlL2hzVyt2Sk5lbjUvOUhX?=
 =?utf-8?B?U3dLRnRzMUN4Q2tuWnlvV0tBdTRxWlRsSFRwL3ptVXlNdE9hU040T0RFWmxB?=
 =?utf-8?B?YTFRNjIrVFAzaHVSUS9xOWx6VU5KVEZzTmF2K3FZN3E2bkpIRTJyTEFTMVFj?=
 =?utf-8?B?THN1NklzTkQ1dzJXM1BqTzhtcVpCNnFpRnNZekM4YS9WUEFLeGFzQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b092ba-8023-4f65-fddf-08deeebc071c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 04:27:27.7858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9BJyvTCgBoxAzpTchsARCxBDhI80Ft8gRcljPhJjPuWVnQDnoABPKbexz+BxPLzwZFjCZFApDU56Vr99tSEv0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7703



On 7/30/2026 10:13 PM, Armin Wolf wrote:
> Caution: This message originated from an External Source. Use proper 
> caution when opening attachments, clicking links, or responding.
> 
> 
> Am 29.07.26 um 18:40 schrieb Muralidhara M K:
> 
>> Add non-ACPI HSMP mailbox support, Ryzen Master SMC client message
>> descriptors, and platform routing for the Family 1Ah client platforms:
>>
>>       Models 80h-87h  Medusa1
>>       Models 88h-8Fh  Olympic Ridge
>>       Models E0h-E3h  Medusa2
>>
>> All three share the same client mailbox addresses and message set, so a
>> single is_client_platform() predicate covers them, and the two adjacent
>> Model 8xh ranges are tested as one.
>>
>> The client parts drive a different mailbox from the server HSMP
>> interface. They expose no _DSD/_CRS to discover the mailbox, so the SMN
>> addresses are fixed in hsmp.h and shared by the platform and ACPI
>> probes, and they speak the Ryzen Master SMC (RMSMC) message set rather
>> than the server message IDs. Add that message set and its descriptor
>> table to the UAPI header.
>>
>> Two message descriptor tables now exist, so every lookup has to pick the
>> one matching the running platform. Rather than test the platform at each
>> lookup, describe the platform once: struct hsmp_plat_desc holds the
>> mailbox addresses, the descriptor table and its size, and the IDs of the
>> messages the driver issues itself. get_hsmp_pdev() resolves it, which
>> both drivers call before they bring any socket up and which runs on a
>> CPU that is fixed long before either can load. The server descriptor is
>> also the static initialiser, so the message plumbing cannot reach a NULL
>> descriptor even if a future caller arrives another way.
>>
>> get_msg_desc() then indexes the table behind that pointer, and
>> validate_message(), is_get_msg(), hsmp_ioctl_msg(), hsmp_test() and
>> hsmp_cache_proto_ver() read the bound and the message IDs from the
>> descriptor. get_msg_desc() returns NULL rather than indexing out of
>> range if a caller skipped the bounds check, and the Spectre v1 clamp in
>> hsmp_ioctl_msg() uses the running platform's table size.
>>
>> In init_platform_device() the mailbox setup becomes a copy of the
>> descriptor's addresses. The F1Ah M0h message-id offset stays behind
>> is_f1a_m0h() as an override, because it applies only to this non-ACPI
>> path while the descriptor is shared with the ACPI one. It cannot disturb
>> the client mailbox: it requires model <= 0x0F and the client models are
>> all >= 0x80. The server mailbox addresses move from plat.c to hsmp.h so
>> both address sets sit with the descriptors that consume them; the values
>> are unchanged, written to the same width as the client set they now sit
>> beside.
>>
>> Since this is the change that lets the platform driver match the client
>> models, it also has to let the client probe survive the interface-version
>> query. Some client SMU builds reject HSMP_CLIENT_GET_INTERFACE_VER with
>> "invalid message" even though the mailbox works, as the test message
>> issued just before it shows, so treat that failure as non-fatal on the
>> client and register the socket anyway. Nothing on the client depends on
>> the reported version: hsmp_pdev->proto_ver gates the metrics_bin
>> attribute and the protocol_version sysfs file, both of which describe
>> the server interface. The query stays fatal on server parts.
>>
>> The client descriptor table carries __attribute__((unused)), matching
>> hsmp_msg_desc_table[]. Both are defined in a UAPI header that several
>> translation units include without using the table, so without it
>> -Wunused-const-variable fires on plat.c, acpi.c and hwmon.c.
>>
>> Document the client platforms in Documentation/arch/x86/amd_hsmp.rst,
>> which until now described HSMP as available only on the EPYC server
>> parts and MI300A. The character device and ioctl interface are unchanged
>> there; what differs is the accepted message IDs, so the text points at
>> the HSMP_CLIENT_* set in the UAPI header.
> 
> Hi,
> 
> i am asking myself if there exist a connection between the Ryzen Master SMC
> message ids and the AMD_ACPI WMI device:
> 
Hi Amin,

There is no connection between the RM HSMP message IDs and the WMI driver.
We have already implemented the AMD WMI driver and plan to submit it for 
upstream review shortly.

> [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), 
> Description("Class to Query/Set a CLKValue"), 
> guid("{95F20B61-3D44-41F8-87E1-03CBF94C4E8F}")]
> class AMD_ACPI {
>    [key, read] string InstanceName;
>    [read] boolean Active;
> 
>    [WmiMethodId(1), Implemented, read, write, Description("Get 
> version")] void QueryVersion([out, Description("version")] uint32 version);
>    [WmiMethodId(2), Implemented, read, write, Description("WMI function 
> init.")] void Init([out, Description("status")] uint8 status);
>    [WmiMethodId(3), Implemented, read, write, Description("Get BIOS ACPI 
> support function table.")] void GetObjectID([out, Description("Get BIOS 
> support Object ID table")] OIDPackage pack);
>    [WmiMethodId(4), Implemented, read, write, Description("Bios request 
> data")] void Getdvalues([in, Description("ID used to identify")] uint32 
> ID, [out, Description("status")] GetdValuesPackage pack);
>    [WmiMethodId(5), Implemented, read, write, Description("Command 
> Run")] void RunCommand([in, Description("In buffer")] uint8 Inbuf[8], 
> [out, Description("Out buffer")] OutBuffer Outbuf);
>    [WmiMethodId(6), Implemented, read, write, Description("Get Min/Max/ 
> Stepping values")] void GetMinMaxSteppingValues([in, Description("ID 
> used to identify")] uint32 ID, [out, Description("status")] 
> GetMinMaxSteppingPackage pack);
>    [WmiMethodId(7), Implemented, read, write, Description("Get DIMM SPD 
> data")] void GetDimmSpdData([in, Description("DIMM Index")] uint32 
> Index, [out, Description("SPD Data Buffer")] DimmSpdBuffer DimmSpdData);
>    [WmiMethodId(8), Implemented, read, write, Description("Get BIOS ACPI 
> support function table2.")] void GetObjectID2([out, Description("Get 
> BIOS support Object ID table2")] OIDPackage pack);
>    [WmiMethodId(9), Implemented, read, write, Description("Get RMP 
> table")] void GetRmpData([out, Description("Get RMP table")] RMPPackage 
> pack);
>    [WmiMethodId(10), Implemented, read, write, Description("Get OPP 
> Heaer")] void GetOppTable([out, Description("Get Opp Heaer")] OPPHeader 
> pack);
>    [WmiMethodId(11), Implemented, read, write, Description("Get OPP 
> Data")] void GetOppData([in, Description("Profile Index")] uint32 Index, 
> [out, Description("Opp Profile")] OPPProfole pack);
> };
> 
> I own multiple devices with such an interface, and i would _love_ to add 
> support
> for them.
> 
Thanks, We have already implemented in AMD WMI driver all the above 
methods. will submit soon.

> Thanks,
> Armin Wolf
> 
>> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
>> ---
>>   Documentation/arch/x86/amd_hsmp.rst  |  18 +++-
>>   arch/x86/include/uapi/asm/amd_hsmp.h | 137 +++++++++++++++++++++++++++
>>   drivers/platform/x86/amd/hsmp/hsmp.c | 125 ++++++++++++++++++++----
>>   drivers/platform/x86/amd/hsmp/hsmp.h |  73 ++++++++++++++
>>   drivers/platform/x86/amd/hsmp/plat.c |  39 ++++----
>>   5 files changed, 354 insertions(+), 38 deletions(-)
>>
>> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/ 
>> x86/amd_hsmp.rst
>> index fa1fc240e212..8a9d6fe7d4cf 100644
>> --- a/Documentation/arch/x86/amd_hsmp.rst
>> +++ b/Documentation/arch/x86/amd_hsmp.rst
>> @@ -8,6 +8,21 @@ Newer Fam19h(model 0x00-0x1f, 0x30-0x3f, 0x90-0x9f, 
>> 0xa0-0xaf),
>>   Fam1Ah(model 0x00-0x1f) EPYC server line of processors from AMD support
>>   system management functionality via HSMP (Host System Management Port).
>>
>> +The Fam1Ah client platforms are supported as well:
>> +
>> +  =============  =============
>> +  Model          Platform
>> +  =============  =============
>> +  0x80-0x87      Medusa1
>> +  0x88-0x8f      Olympic Ridge
>> +  0xe0-0xe3      Medusa2
>> +  =============  =============
>> +
>> +They share one mailbox and speak the Ryzen Master SMC message set 
>> instead
>> +of the server HSMP message set, so the message IDs accepted on them are
>> +the HSMP_CLIENT_* ones listed in arch/x86/include/uapi/asm/amd_hsmp.h.
>> +The character device and ioctl interface described below are the same.
>> +
>>   The Host System Management Port (HSMP) is an interface to provide
>>   OS-level software with access to system management functions via a
>>   set of mailbox registers.
>> @@ -17,7 +32,8 @@ More details on the interface can be found in chapter
>>   Eg: https://docs.amd.com/v/u/en-US/55898_B1_pub_0_50
>>
>>
>> -HSMP interface is supported on EPYC line of server CPUs and MI300A 
>> (APU).
>> +HSMP interface is supported on EPYC line of server CPUs, MI300A (APU) 
>> and
>> +the Fam1Ah client platforms listed above.
>>
>>
>>   HSMP device
>> diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/ 
>> uapi/asm/amd_hsmp.h
>> index eda336bfd3e9..b4c3ddb9d1c1 100644
>> --- a/arch/x86/include/uapi/asm/amd_hsmp.h
>> +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
>> @@ -664,4 +664,141 @@ struct hsmp_telemetry_data {
>>   #define HSMP_IOCTL_GET_TELEMETRY_DATA \
>>       _IOW(HSMP_BASE_IOCTL_NR, 1, struct hsmp_telemetry_data)
>>
>> +/*
>> + * Client HSMP messages supported on the Family 1Ah client platforms:
>> + * Models 80h-87h (Medusa1), Models 88h-8Fh (Olympic Ridge) and
>> + * Models E0h-E3h (Medusa2).
>> + * These map to Ryzen Master SMC (RMSMC) message IDs.
>> + */
>> +enum hsmp_client_message_ids {
>> +     HSMP_CLIENT_TEST = 1,                   /* 01h Test message */
>> +     HSMP_CLIENT_GET_SMU_VER,                /* 02h SMU FW version */
>> +     HSMP_CLIENT_GET_INTERFACE_VER,          /* 03h Interface version */
>> +     HSMP_CLIENT_GET_METRICS_TABLE_VER,      /* 04h Metrics table 
>> version */
>> +     HSMP_CLIENT_GET_METRICS_TABLE,          /* 05h Metrics table log 
>> sample */
>> +     HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR,/* 06h Metrics table 
>> DRAM address */
>> +     HSMP_CLIENT_SET_CORE_PSM_MARGIN,        /* 07h Set core PSM 
>> margin */
>> +     HSMP_CLIENT_SET_ALL_CORE_PSM_MARGIN,    /* 08h Set all core PSM 
>> margin */
>> +     HSMP_CLIENT_SET_FAST_PPT_LIMIT,         /* 09h Set fast PPT 
>> limit */
>> +     HSMP_CLIENT_SET_VRM_VDD_CURRENT_LIMIT,  /* 0Ah Set VRM VDD 
>> current limit */
>> +     HSMP_CLIENT_SET_VRM_VDD_MAX_CURRENT_LIMIT,/* 0Bh Set VRM VDD max 
>> current limit */
>> +     HSMP_CLIENT_SET_TJ_MAX,                 /* 0Ch Set TjMax */
>> +     HSMP_CLIENT_SET_FIT_LIMIT_SCALAR,       /* 0Dh Set FIT limit 
>> scalar */
>> +     HSMP_CLIENT_ENABLE_OVERCLOCKING,        /* 0Eh Enable 
>> overclocking */
>> +     HSMP_CLIENT_DISABLE_OVERCLOCKING,       /* 0Fh Disable 
>> overclocking */
>> +     HSMP_CLIENT_SET_OVERCLOCK_FREQ_ALL_CORES,/* 10h Set OC freq all 
>> cores */
>> +     HSMP_CLIENT_SET_OVERCLOCK_FREQ_PER_CORE,/* 11h Set OC freq per 
>> core */
>> +     HSMP_CLIENT_SET_OVERCLOCK_VID,          /* 12h Set OC VID */
>> +     HSMP_CLIENT_SET_FCLK_OVERCLOCK_ON_THE_FLY,/* 13h Set FCLK OC on- 
>> the-fly */
>> +     HSMP_CLIENT_GET_CORE_PERF_ORDER,        /* 14h Get core 
>> performance order */
>> +     HSMP_CLIENT_SET_SUSTAINED_POWER_LIMIT,  /* 15h Set sustained 
>> power limit */
>> +     HSMP_CLIENT_SET_SLOW_PPT_LIMIT,         /* 16h Set slow PPT 
>> limit */
>> +     HSMP_CLIENT_SET_VRM_GFX_MAX_CURRENT_LIMIT,/* 17h Set VRM GFX max 
>> current limit */
>> +     HSMP_CLIENT_SET_VRM_SOC_CURRENT_LIMIT,  /* 18h Set VRM SOC 
>> current limit */
>> +     HSMP_CLIENT_SET_FAST_SPM_LIMIT,         /* 19h Set fast SPM 
>> limit */
>> +     HSMP_CLIENT_SET_SLOW_SPM_LIMIT,         /* 1Ah Set slow SPM 
>> limit */
>> +     HSMP_CLIENT_GET_CORE_PSM_MARGIN,        /* 1Bh Get core PSM 
>> margin */
>> +     HSMP_CLIENT_GET_GFX_PSM_MARGIN,         /* 1Ch Get GFX PSM 
>> margin */
>> +     HSMP_CLIENT_SPARE_0X1D,                 /* 1Dh Spare */
>> +     HSMP_CLIENT_SPARE_0X1E,                 /* 1Eh Spare */
>> +     HSMP_CLIENT_SPARE_0X1F,                 /* 1Fh Spare */
>> +     HSMP_CLIENT_SPARE_0X20,                 /* 20h Spare */
>> +     HSMP_CLIENT_SET_GFXCLK_OVERDRIVE_BY_FREQ_VID,/* 21h Set GfxClk 
>> overdrive by freq/VID */
>> +     HSMP_CLIENT_DISABLE_GFXCLK_OVERDRIVE,   /* 22h Disable GfxClk 
>> overdrive */
>> +     HSMP_CLIENT_SET_GFX_PSM_MARGIN,         /* 23h Set GFX PSM 
>> margin */
>> +     HSMP_CLIENT_SET_CCLK_FMAX_OFFSET,       /* 24h Set CCLK Fmax 
>> offset */
>> +     HSMP_CLIENT_SET_CORE_POWER_LIMIT_OFFSET,/* 25h Set core power 
>> limit offset */
>> +     HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND,    /* 26h Add extra PSM 
>> guardband */
>> +     HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND_GFX,/* 27h Add extra PSM 
>> guardband GFX */
>> +     HSMP_CLIENT_SET_GFXCLK_FMAX,            /* 28h Set GfxClk Fmax */
>> +     HSMP_CLIENT_MSG_ID_MAX,
>> +};
>> +
>> +/* Client message descriptor table (Family 1Ah Models 80h-8Fh, E0h- 
>> E3h) */
>> +static const struct hsmp_msg_desc hsmp_client_msg_desc_table[]
>> +                             __attribute__((unused)) = {
>> +     /* RESERVED */
>> +     {0, 0, HSMP_RSVD},
>> +     /* HSMP_CLIENT_TEST */
>> +     {1, 1, HSMP_GET},
>> +     /* HSMP_CLIENT_GET_SMU_VER */
>> +     {0, 1, HSMP_GET},
>> +     /* HSMP_CLIENT_GET_INTERFACE_VER */
>> +     {0, 1, HSMP_GET},
>> +     /* HSMP_CLIENT_GET_METRICS_TABLE_VER */
>> +     {0, 1, HSMP_GET},
>> +     /* HSMP_CLIENT_GET_METRICS_TABLE */
>> +     {0, 0, HSMP_GET},
>> +     /* HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR */
>> +     {0, 3, HSMP_GET},
>> +     /* HSMP_CLIENT_SET_CORE_PSM_MARGIN */
>> +     {1, 0, HSMP_SET},
>> +     /* HSMP_CLIENT_SET_ALL_CORE_PSM_MARGIN */
>> +     {1, 0, HSMP_SET},
>> +     /* HSMP_CLIENT_SET_FAST_PPT_LIMIT */
>> +     {1, 0, HSMP_SET},
>> +     /* HSMP_CLIENT_SET_VRM_VDD_CURRENT_LIMIT */
>> +     {1, 0, HSMP_SET},
>> +     /* HSMP_CLIENT_SET_VRM_VDD_MAX_CURRENT_LIMIT */
>> +     {1, 0, HSMP_SET},
>> +     /* HSMP_CLIENT_SET_TJ_MAX */
>> +     {1, 0, HSMP_SET},
>> +     /* HSMP_CLIENT_SET_FIT_LIMIT_SCALAR */
>> +     {1, 0, HSMP_SET},
>> +     /* HSMP_CLIENT_ENABLE_OVERCLOCKING */
>> +     {0, 0, HSMP_SET},
>> +     /* HSMP_CLIENT_DISABLE_OVERCLOCKING */
>> +     {0, 0, HSMP_SET},
>> +     /* HSMP_CLIENT_SET_OVERCLOCK_FREQ_ALL_CORES */
>> +     {1, 0, HSMP_SET},
>> +     /* HSMP_CLIENT_SET_OVERCLOCK_FREQ_PER_CORE */
>> +     {1, 0, HSMP_SET},
>> +     /* HSMP_CLIENT_SET_OVERCLOCK_VID */
>> +     {1, 0, HSMP_SET},
>> +     /* HSMP_CLIENT_SET_FCLK_OVERCLOCK_ON_THE_FLY */
>> +     {1, 0, HSMP_SET},
>> +     /* HSMP_CLIENT_GET_CORE_PERF_ORDER */
>> +     {1, 1, HSMP_GET},
>> +     /* HSMP_CLIENT_SET_SUSTAINED_POWER_LIMIT */
>> +     {1, 0, HSMP_SET},
>> +     /* HSMP_CLIENT_SET_SLOW_PPT_LIMIT */
>> +     {1, 0, HSMP_SET},
>> +     /* HSMP_CLIENT_SET_VRM_GFX_MAX_CURRENT_LIMIT */
>> +     {1, 0, HSMP_SET},
>> +     /* HSMP_CLIENT_SET_VRM_SOC_CURRENT_LIMIT */
>> +     {1, 0, HSMP_SET},
>> +     /* HSMP_CLIENT_SET_FAST_SPM_LIMIT */
>> +     {1, 0, HSMP_SET},
>> +     /* HSMP_CLIENT_SET_SLOW_SPM_LIMIT */
>> +     {1, 0, HSMP_SET},
>> +     /* HSMP_CLIENT_GET_CORE_PSM_MARGIN */
>> +     {1, 1, HSMP_GET},
>> +     /* HSMP_CLIENT_GET_GFX_PSM_MARGIN */
>> +     {0, 1, HSMP_GET},
>> +     /* HSMP_CLIENT_SPARE_0X1D */
>> +     {0, 0, HSMP_RSVD},
>> +     /* HSMP_CLIENT_SPARE_0X1E */
>> +     {0, 0, HSMP_RSVD},
>> +     /* HSMP_CLIENT_SPARE_0X1F */
>> +     {0, 0, HSMP_RSVD},
>> +     /* HSMP_CLIENT_SPARE_0X20 */
>> +     {0, 0, HSMP_RSVD},
>> +     /* HSMP_CLIENT_SET_GFXCLK_OVERDRIVE_BY_FREQ_VID */
>> +     {1, 0, HSMP_SET},
>> +     /* HSMP_CLIENT_DISABLE_GFXCLK_OVERDRIVE */
>> +     {0, 0, HSMP_SET},
>> +     /* HSMP_CLIENT_SET_GFX_PSM_MARGIN */
>> +     {1, 0, HSMP_SET},
>> +     /* HSMP_CLIENT_SET_CCLK_FMAX_OFFSET */
>> +     {1, 0, HSMP_SET},
>> +     /* HSMP_CLIENT_SET_CORE_POWER_LIMIT_OFFSET */
>> +     {1, 0, HSMP_SET},
>> +     /* HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND */
>> +     {1, 0, HSMP_SET},
>> +     /* HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND_GFX */
>> +     {1, 0, HSMP_SET},
>> +     /* HSMP_CLIENT_SET_GFXCLK_FMAX */
>> +     {1, 0, HSMP_SET},
>> +};
>> +
>>   #endif /*_ASM_X86_AMD_HSMP_H_*/
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/ 
>> x86/amd/hsmp/hsmp.c
>> index 5e123a4ecea9..9b65dbd47965 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
>> @@ -45,7 +45,67 @@
>>    */
>>   #define CHECK_GET_BIT               BIT(31)
>>
>> -static struct hsmp_plat_device hsmp_pdev;
>> +static const struct hsmp_mbaddr_info hsmp_mbinfo_server = {
>> +     .base_addr      = SMN_HSMP_BASE,
>> +     .msg_id_off     = SMN_HSMP_MSG_ID,
>> +     .msg_resp_off   = SMN_HSMP_MSG_RESP,
>> +     .msg_arg_off    = SMN_HSMP_MSG_DATA,
>> +};
>> +
>> +/* RM: Ryzen Master, the SMC interface these client addresses belong 
>> to */
>> +static const struct hsmp_mbaddr_info hsmp_mbinfo_client = {
>> +     .base_addr      = SMN_HSMP_BASE_RM,
>> +     .msg_id_off     = SMN_HSMP_MSG_ID_RM,
>> +     .msg_resp_off   = SMN_HSMP_MSG_RESP_RM,
>> +     .msg_arg_off    = SMN_HSMP_MSG_DATA_RM,
>> +};
>> +
>> +/*
>> + * The descriptors carry only the message IDs the driver issues 
>> itself, which
>> + * are also the only ones the two message sets have in common.  
>> Messages named
>> + * by userspace in an ioctl need no entry here, as that path already 
>> resolves
>> + * the ID against the running platform's table.
>> + */
>> +static const struct hsmp_plat_desc hsmp_desc_server = {
>> +     .mbinfo                 = &hsmp_mbinfo_server,
>> +     .msg_desc               = hsmp_msg_desc_table,
>> +     .num_msgs               = HSMP_MSG_ID_MAX,
>> +     .test_msg               = HSMP_TEST,
>> +     .proto_ver_msg          = HSMP_GET_PROTO_VER,
>> +};
>> +
>> +/* The client drives a different mailbox with the Ryzen Master SMC 
>> message set */
>> +static const struct hsmp_plat_desc hsmp_desc_client = {
>> +     .mbinfo                 = &hsmp_mbinfo_client,
>> +     .msg_desc               = hsmp_client_msg_desc_table,
>> +     .num_msgs               = HSMP_CLIENT_MSG_ID_MAX,
>> +     .test_msg               = HSMP_CLIENT_TEST,
>> +     .proto_ver_msg          = HSMP_CLIENT_GET_INTERFACE_VER,
>> +};
>> +
>> +static struct hsmp_plat_device hsmp_pdev = {
>> +     /*
>> +      * Overridden for the client in get_hsmp_pdev(), which every driver
>> +      * calls before it touches a socket.  Defaulting it here rather 
>> than
>> +      * leaving it NULL keeps the message plumbing safe for any 
>> caller that
>> +      * arrives without going through there.
>> +      */
>> +     .desc = &hsmp_desc_server,
>> +};
>> +
>> +/*
>> + * Callers must bounds-check msg_id against desc->num_msgs first; 
>> this returns
>> + * NULL rather than indexing out of range if they did not.
>> + */
>> +static inline const struct hsmp_msg_desc *get_msg_desc(u32 msg_id)
>> +{
>> +     const struct hsmp_plat_desc *desc = hsmp_pdev.desc;
>> +
>> +     if (msg_id >= desc->num_msgs)
>> +             return NULL;
>> +
>> +     return &desc->msg_desc[msg_id];
>> +}
>>
>>   /*
>>    * Gates the AMD HSMP data plane against socket bring-up and teardown.
>> @@ -184,30 +244,37 @@ static int __hsmp_send_message(struct 
>> hsmp_socket *sock, struct hsmp_message *ms
>>
>>   static int validate_message(struct hsmp_message *msg)
>>   {
>> +     const struct hsmp_msg_desc *desc;
>> +
>>       /* msg_id against valid range of message IDs */
>> -     if (msg->msg_id < HSMP_TEST || msg->msg_id >= HSMP_MSG_ID_MAX)
>> +     if (msg->msg_id < hsmp_pdev.desc->test_msg ||
>> +         msg->msg_id >= hsmp_pdev.desc->num_msgs)
>> +             return -ENOMSG;
>> +
>> +     desc = get_msg_desc(msg->msg_id);
>> +     if (!desc)
>>               return -ENOMSG;
>>
>>       /* msg_id is a reserved message ID */
>> -     if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_RSVD)
>> +     if (desc->type == HSMP_RSVD)
>>               return -ENOMSG;
>>
>>       /*
>>        * num_args passed by user should match the num_args specified in
>>        * message description table.
>>        */
>> -     if (msg->num_args != hsmp_msg_desc_table[msg->msg_id].num_args)
>> +     if (msg->num_args != desc->num_args)
>>               return -EINVAL;
>>
>>       /*
>>        * As the HSMP protocol evolves, newer platforms may define more
>>        * response arguments for existing messages.  Use an upper-bound
>>        * check so that older userspace callers requesting fewer response
>> -      * words than what the current hsmp_msg_desc_table[] defines are
>> -      * still accepted, while rejecting requests that exceed the
>> -      * hardware capability.
>> +      * words than what the current descriptor table defines are still
>> +      * accepted, while rejecting requests that exceed the hardware
>> +      * capability.
>>        */
>> -     if (msg->response_sz > hsmp_msg_desc_table[msg- 
>> >msg_id].response_sz)
>> +     if (msg->response_sz > desc->response_sz)
>>               return -EINVAL;
>>
>>       return 0;
>> @@ -316,7 +383,7 @@ int hsmp_test(u16 sock_ind, u32 value)
>>        * Test the hsmp port by performing TEST command. The test message
>>        * takes one argument and returns the value of that argument + 1.
>>        */
>> -     msg.msg_id      = HSMP_TEST;
>> +     msg.msg_id      = hsmp_pdev.desc->test_msg;
>>       msg.num_args    = 1;
>>       msg.response_sz = 1;
>>       msg.args[0]     = value;
>> @@ -340,10 +407,15 @@ EXPORT_SYMBOL_NS_GPL(hsmp_test, "AMD_HSMP");
>>
>>   static bool is_get_msg(struct hsmp_message *msg)
>>   {
>> -     if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_GET)
>> +     const struct hsmp_msg_desc *desc = get_msg_desc(msg->msg_id);
>> +
>> +     if (!desc)
>> +             return false;
>> +
>> +     if (desc->type == HSMP_GET)
>>               return true;
>>
>> -     if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_SET_GET &&
>> +     if (desc->type == HSMP_SET_GET &&
>>           (msg->args[0] & CHECK_GET_BIT))
>>               return true;
>>
>> @@ -354,6 +426,7 @@ static long hsmp_ioctl_msg(struct file *fp, 
>> unsigned long arg)
>>   {
>>       int __user *arguser = (int  __user *)arg;
>>       struct hsmp_message msg = { 0 };
>> +     const struct hsmp_msg_desc *desc;
>>       int ret;
>>
>>       if (copy_struct_from_user(&msg, sizeof(msg), arguser, 
>> sizeof(struct hsmp_message)))
>> @@ -361,23 +434,28 @@ static long hsmp_ioctl_msg(struct file *fp, 
>> unsigned long arg)
>>
>>       /*
>>        * Check msg_id is within the range of supported msg ids
>> -      * i.e within the array bounds of hsmp_msg_desc_table
>> +      * i.e within the array bounds of the platform's descriptor table
>>        */
>> -     if (msg.msg_id < HSMP_TEST || msg.msg_id >= HSMP_MSG_ID_MAX)
>> +     if (msg.msg_id < hsmp_pdev.desc->test_msg ||
>> +         msg.msg_id >= hsmp_pdev.desc->num_msgs)
>>               return -ENOMSG;
>>
>>       /*
>>        * Sanitize the user-controlled msg_id against speculative
>>        * execution.  The bounds check above retires the out-of-range
>>        * case with -ENOMSG, but a mispredicted branch can still let the
>> -      * CPU speculatively use msg_id as an index into
>> -      * hsmp_msg_desc_table[] (here and in validate_message() /
>> +      * CPU speculatively use msg_id as an index into the message
>> +      * descriptor tables (here and in validate_message() /
>>        * is_get_msg() called downstream via hsmp_send_message()), and
>>        * pull arbitrary kernel memory into the cache (Spectre v1,
>>        * CVE-2017-5753).  Clamp once into msg.msg_id so every downstream
>>        * dereference sees the sanitized value.
>>        */
>> -     msg.msg_id = array_index_nospec(msg.msg_id, HSMP_MSG_ID_MAX);
>> +     msg.msg_id = array_index_nospec(msg.msg_id, hsmp_pdev.desc- 
>> >num_msgs);
>> +
>> +     desc = get_msg_desc(msg.msg_id);
>> +     if (!desc || desc->type == HSMP_RSVD)
>> +             return -ENOMSG;
>>
>>       switch (fp->f_mode & (FMODE_WRITE | FMODE_READ)) {
>>       case FMODE_WRITE:
>> @@ -410,7 +488,7 @@ static long hsmp_ioctl_msg(struct file *fp, 
>> unsigned long arg)
>>       if (ret)
>>               return ret;
>>
>> -     if (hsmp_msg_desc_table[msg.msg_id].response_sz > 0) {
>> +     if (desc->response_sz > 0) {
>>               /* Copy results back to user for get/monitor commands */
>>               if (copy_to_user(arguser, &msg, sizeof(struct 
>> hsmp_message)))
>>                       return -EFAULT;
>> @@ -687,9 +765,9 @@ int hsmp_cache_proto_ver(u16 sock_ind)
>>       struct hsmp_message msg = { 0 };
>>       int ret;
>>
>> -     msg.msg_id      = HSMP_GET_PROTO_VER;
>> +     msg.msg_id      = hsmp_pdev.desc->proto_ver_msg;
>>       msg.sock_ind    = sock_ind;
>> -     msg.response_sz = 
>> hsmp_msg_desc_table[HSMP_GET_PROTO_VER].response_sz;
>> +     msg.response_sz = get_msg_desc(msg.msg_id)->response_sz;
>>
>>       ret = hsmp_send_message_locked(&msg);
>>       if (!ret)
>> @@ -735,6 +813,15 @@ EXPORT_SYMBOL_NS_GPL(hsmp_misc_deregister, 
>> "AMD_HSMP");
>>
>>   struct hsmp_plat_device *get_hsmp_pdev(void)
>>   {
>> +     /*
>> +      * Both drivers call this before they bring any socket up, and 
>> the CPU
>> +      * this selects on is fixed long before either can load, so 
>> resolving
>> +      * the platform description here is enough to have it in place for
>> +      * every mailbox access and for the probe paths themselves.
>> +      */
>> +     if (is_client_platform())
>> +             hsmp_pdev.desc = &hsmp_desc_client;
>> +
>>       return &hsmp_pdev;
>>   }
>>   EXPORT_SYMBOL_NS_GPL(get_hsmp_pdev, "AMD_HSMP");
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/ 
>> x86/amd/hsmp/hsmp.h
>> index 8dbff16a87b1..b4bd9800dee1 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
>> @@ -10,6 +10,8 @@
>>   #ifndef HSMP_H
>>   #define HSMP_H
>>
>> +#include <asm/amd/hsmp.h>
>> +
>>   #include <linux/compiler_types.h>
>>   #include <linux/device.h>
>>   #include <linux/hwmon.h>
>> @@ -17,6 +19,7 @@
>>   #include <linux/miscdevice.h>
>>   #include <linux/mutex.h>
>>   #include <linux/pci.h>
>> +#include <linux/processor.h>
>>   #include <linux/rwsem.h>
>>   #include <linux/semaphore.h>
>>   #include <linux/sysfs.h>
>> @@ -32,6 +35,51 @@
>>
>>   #define DRIVER_VERSION              "2.6"
>>
>> +/*
>> + * To access a specific HSMP mailbox register, s/w writes the SMN 
>> address of the
>> + * HSMP mailbox register into the SMN_INDEX register, and reads/ 
>> writes the
>> + * SMN_DATA reg.  Below are the SMN addresses of the HSMP mailbox 
>> registers in
>> + * SMU address space, as consumed by the fixed mailbox descriptors in 
>> hsmp.c.
>> + *
>> + * The server set is used by the non-ACPI path only; the ACPI path 
>> discovers the
>> + * equivalent values from _CRS/_DSD.  The _RM set is the client one, 
>> named for
>> + * the Ryzen Master SMC (RMSMC) interface whose mailbox it addresses, 
>> and is
>> + * used by both paths because the client exposes no _CRS/_DSD to 
>> discover them
>> + * from.  The two sets share a base and differ only in the register 
>> offsets
>> + * behind it, but are kept separate so each stays tied to the 
>> platform it was
>> + * documented for.
>> + */
>> +#define SMN_HSMP_BASE                0x03B00000
>> +#define SMN_HSMP_MSG_ID              0x00010534
>> +#define SMN_HSMP_MSG_ID_F1A_M0H      0x00010934
>> +#define SMN_HSMP_MSG_RESP    0x00010980
>> +#define SMN_HSMP_MSG_DATA    0x000109E0
>> +
>> +/* _RM: Ryzen Master SMC, the client mailbox */
>> +#define SMN_HSMP_BASE_RM     0x03B00000
>> +#define SMN_HSMP_MSG_ID_RM   0x00010A8C
>> +#define SMN_HSMP_MSG_RESP_RM 0x00010A90
>> +#define SMN_HSMP_MSG_DATA_RM 0x00010A94
>> +
>> +/*
>> + * Family 1Ah client platforms use the Ryzen Master SMC (client) 
>> mailbox and
>> + * message set instead of the server HSMP interface:
>> + *
>> + *   Models 80h-87h  Medusa1
>> + *   Models 88h-8Fh  Olympic Ridge
>> + *   Models E0h-E3h  Medusa2
>> + *
>> + * They all share the SMN_HSMP_*_RM mailbox addresses above and the same
>> + * message set, so one predicate covers them and the two adjacent 
>> Model 8xh
>> + * ranges are tested as one.
>> + */
>> +static inline bool is_client_platform(void)
>> +{
>> +     return boot_cpu_data.x86 == 0x1A &&
>> +            ((boot_cpu_data.x86_model >= 0x80 && 
>> boot_cpu_data.x86_model <= 0x8F) ||
>> +             (boot_cpu_data.x86_model >= 0xE0 && 
>> boot_cpu_data.x86_model <= 0xE3));
>> +}
>> +
>>   struct hsmp_mbaddr_info {
>>       u32 base_addr;
>>       u32 msg_id_off;
>> @@ -40,6 +88,30 @@ struct hsmp_mbaddr_info {
>>       u32 size;
>>   };
>>
>> +/*
>> + * Per-platform description of the mailbox and the message set behind 
>> it.
>> + * Resolved once from the running CPU and reached through hsmp_pdev- 
>> >desc, so
>> + * neither the message plumbing nor the probe paths have to re-derive 
>> which
>> + * platform they are on.
>> + *
>> + * @mbinfo:          fixed SMN mailbox addresses.  The ACPI path uses 
>> these
>> + *                   only where firmware exposes no _CRS/_DSD to read 
>> them
>> + *                   from, i.e. on the client.
>> + * @msg_desc:                message descriptor table, indexed by 
>> message ID.
>> + * @num_msgs:                number of entries in @msg_desc, and so 
>> the exclusive
>> + *                   upper bound on a valid message ID.
>> + * @test_msg:                no-op message used to probe the 
>> mailbox.  Also the
>> + *                   lowest valid message ID, as ID 0 is reserved.
>> + * @proto_ver_msg:   returns the interface version.
>> + */
>> +struct hsmp_plat_desc {
>> +     const struct hsmp_mbaddr_info   *mbinfo;
>> +     const struct hsmp_msg_desc      *msg_desc;
>> +     u32                             num_msgs;
>> +     u32                             test_msg;
>> +     u32                             proto_ver_msg;
>> +};
>> +
>>   struct hsmp_socket {
>>       struct bin_attribute hsmp_attr;
>>       struct hsmp_mbaddr_info mbinfo;
>> @@ -59,6 +131,7 @@ struct hsmp_socket {
>>   struct hsmp_plat_device {
>>       struct miscdevice mdev;
>>       struct hsmp_socket *sock;
>> +     const struct hsmp_plat_desc *desc;
>>       u32 proto_ver;
>>       u16 num_sockets;
>>   };
>> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/ 
>> x86/amd/hsmp/plat.c
>> index e9b2b809c0f5..7423c98a7b3e 100644
>> --- a/drivers/platform/x86/amd/hsmp/plat.c
>> +++ b/drivers/platform/x86/amd/hsmp/plat.c
>> @@ -29,17 +29,6 @@
>>
>>   #define DRIVER_NAME         "amd_hsmp"
>>
>> -/*
>> - * To access specific HSMP mailbox register, s/w writes the SMN 
>> address of HSMP mailbox
>> - * register into the SMN_INDEX register, and reads/writes the 
>> SMN_DATA reg.
>> - * Below are required SMN address for HSMP Mailbox register offsets 
>> in SMU address space
>> - */
>> -#define SMN_HSMP_BASE                0x3B00000
>> -#define SMN_HSMP_MSG_ID              0x0010534
>> -#define SMN_HSMP_MSG_ID_F1A_M0H      0x0010934
>> -#define SMN_HSMP_MSG_RESP    0x0010980
>> -#define SMN_HSMP_MSG_DATA    0x00109E0
>> -
>>   static struct hsmp_plat_device *hsmp_pdev;
>>
>>   static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
>> @@ -157,20 +146,18 @@ static int init_platform_device(struct device *dev)
>>               sock = &hsmp_pdev->sock[i];
>>               sock->sock_ind                  = i;
>>               sock->dev                       = dev;
>> -             sock->mbinfo.base_addr          = SMN_HSMP_BASE;
>>               sock->amd_hsmp_rdwr             = amd_hsmp_pci_rdwr;
>> +             sock->mbinfo                    = *hsmp_pdev->desc->mbinfo;
>>
>>               /*
>>                * This is a transitional change from non-ACPI to ACPI, 
>> only
>>                * family 0x1A, model 0x00 platform is supported for 
>> both ACPI and non-ACPI.
>> +              * It is the one part whose message-id register sits at a
>> +              * different offset on this path than the descriptor gives.
>>                */
>>               if (is_f1a_m0h())
>>                       sock->mbinfo.msg_id_off = SMN_HSMP_MSG_ID_F1A_M0H;
>> -             else
>> -                     sock->mbinfo.msg_id_off = SMN_HSMP_MSG_ID;
>>
>> -             sock->mbinfo.msg_resp_off       = SMN_HSMP_MSG_RESP;
>> -             sock->mbinfo.msg_arg_off        = SMN_HSMP_MSG_DATA;
>>               sema_init(&sock->hsmp_sem, 1);
>>
>>               /* Test the hsmp interface on each socket */
>> @@ -184,8 +171,18 @@ static int init_platform_device(struct device *dev)
>>
>>               ret = hsmp_cache_proto_ver(i);
>>               if (ret) {
>> -                     dev_err(dev, "Failed to read HSMP protocol 
>> version\n");
>> -                     return ret;
>> +                     /*
>> +                      * Some client SMU builds reject the interface- 
>> version
>> +                      * query with "invalid message" even though the 
>> mailbox
>> +                      * is functional, as the test message above just
>> +                      * showed.  Keep going there instead of failing the
>> +                      * probe: proto_ver only gates server-side 
>> features.
>> +                      */
>> +                     if (!is_client_platform()) {
>> +                             dev_err(dev, "Failed to read HSMP 
>> protocol version\n");
>> +                             return ret;
>> +                     }
>> +                     dev_warn(dev, "Interface version query 
>> unsupported on client SMU; continuing\n");
>>               }
>>
>>               if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6) {
>> @@ -317,6 +314,12 @@ static bool legacy_hsmp_support(void)
>>       case 0x1A:
>>               switch (boot_cpu_data.x86_model) {
>>               case 0x00 ... 0x0F:
>> +             /*
>> +              * Client platforms: 80h-87h (Medusa1), 88h-8Fh (Olympic
>> +              * Ridge), E0h-E3h (Medusa2)
>> +              */
>> +             case 0x80 ... 0x8F:
>> +             case 0xE0 ... 0xE3:
>>                       return true;
>>               default:
>>                       return false;

