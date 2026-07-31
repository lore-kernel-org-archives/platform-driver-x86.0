Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013029.outbound.protection.outlook.com [40.93.201.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91C2330652;
	Fri, 31 Jul 2026 07:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785481269; cv=fail; b=VzW172cR/ZQNzz/MUbVeH8EKCgwCbT/Y5B/lFz0RGiVW8DOEnu7grF8gPegBk6eGpOGxaSvrmmAL/9uLcR7OVo3fNWxJvMQ6Rj5NQHJJn2JK03f2dICS5WanIZ5gDp0IxaoDA+ats5MrkhlW3CjyyfYjLkrtFowAk6dM+y/EseE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785481269; c=relaxed/simple;
	bh=p5el88JIXrLuPLT/5xN58ryb99qnSVb7eg9RO5yaNEY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=t4W4egPyLXaukwPYgfLUOMWA5Jm9Gjbch8KFNFKjpqS9ISl2gEys0cktYG92bIALFMlRuT0LlKnO3RzxdRPeb1Asw/mTXHVjR9V6+Wd8sB/+/8ewE4aP8A4QHk2PJC64hrtO+RSSUjlii7LXdXuhL5Te6mGcLR/k96uK7rdpCVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qN3y2izZ; arc=fail smtp.client-ip=40.93.201.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qN3y2izZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLePTz3EpmYKW4JkngVFMfi5A0u4pI8witASqHiKyCDsjDVrAfQycqfFMV/GlJkfR9ngnEWiW/ybMJo+/OTjPpOcxNaxtPBH4HkNodc+Xg1lzoYcC7l4YhpYJ9VxTV/xHVMeZQgRYmDDzpHExHFMbJHsKt8BvTOg8008IidcOgiO17TJ8KDeVWhVOOIPIbGgpjSvgP5NPrIADYk5zTyfCoaf8AbiU+uORTgeoeYJABVD/ynS2RX4WQygdU8Ce1lzok8SA/QoIAxRKrpuAcPhs3cr8q6nhJGuP779ZtRtiNj/PPoASaG/+T3RO6oyp3xttrlGzqKrLX7chd65xfftsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O65E8FOdQJkzpY5LWwd6MgUxnDAez70KYdOfsQwaOFo=;
 b=uhJSI5pXrQm2T/y0LwObZoxEnK39JRBq+3CjVMRKD8NMpWLRLACseusjwvWK5KocmHYn6rAOEqMTozwwhHa7BghgUX48B7ZwSTCm4+3AIQE6MJGyKdl/lz4OsXbnkNvkzxnvJ6xS/F9If95F4dVf+9Ouf+DX7K4zL4r9VJS7eKKDCScy6zkdidRUFEFl8QTJ9nut2J9jMqaVPLI9gqjVTNFYtyfJjlvmiEtzlKeZ5BSpQVjZR95qJXrtYQ8L3u8CFth1PQFLnQH28PmlbSrUn53clQZcwXakyxmvngnmBSZr38kpZG7ClMQx49Ge77mml474aDzII6RvLJlbCWCkwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O65E8FOdQJkzpY5LWwd6MgUxnDAez70KYdOfsQwaOFo=;
 b=qN3y2izZsIeiiZhv2hI4z3y4k1hcDeSb567Bp0Lwq268r46ay1lej2J542Tp30IW/zeRNmb3P6G5xsD2P/C6t7XdBVL4jLs5VkAYX2ApwhN6pQy2FuiOlU3s8fM2ODrAye+qzPIC5nRS/ORaEH9M7bTiBXgcxlyJbhzFsCwSZ/A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8284.namprd12.prod.outlook.com (2603:10b6:610:12e::21)
 by SA3PR12MB9177.namprd12.prod.outlook.com (2603:10b6:806:39d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 07:01:03 +0000
Received: from CH3PR12MB8284.namprd12.prod.outlook.com
 ([fe80::1bc1:88b1:7cf7:87aa]) by CH3PR12MB8284.namprd12.prod.outlook.com
 ([fe80::1bc1:88b1:7cf7:87aa%4]) with mapi id 15.21.0270.015; Fri, 31 Jul 2026
 07:01:03 +0000
Message-ID: <e9f9ab87-61b1-4fe6-9ab8-e11f65b6d4e7@amd.com>
Date: Fri, 31 Jul 2026 12:30:57 +0530
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
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <5c600f4d-a93a-4410-9183-d33b7f6f4fc3@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0165.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::15) To CH3PR12MB8284.namprd12.prod.outlook.com
 (2603:10b6:610:12e::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8284:EE_|SA3PR12MB9177:EE_
X-MS-Office365-Filtering-Correlation-Id: cc4ff1a1-d934-4144-0a53-08deeed17c20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|10067099003|18002099003|22082099003|5023799004|11063799006|56012099006|4143699003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
	yHYPEY5stykFi/zVbuyGEYZBhGNUK45Ube7Qqb8o9RXyfJ8l3m//HLLztexcdoi9wLN3fmx/ml2KA9XnQpAoSBoK3w1LxXIbi3ts3jttErZfUWo17+U4ExTL5mEhIwF68llKJcaDZmMmxSZdSGymOktkiARgYU1IOBsJj1OI93JW6qWHZrXhslNtayG2Oh9Y/9QVDXpmd2tL5Phj2+50ar9ax9Td6nXL3UuZJwU5yEaXCAEJFz4gYbzQO6foGsgpNapLbrfHxxKwo7V7GRu3LKG3fLNRet+NG0krAssNr2CSyH9HUY/o7fL9np+ONHpndHn3iF3lI/TazphBl2sPWG8ronXatllte++LKN+W+8fm+MwbA3HnDA6MfL53QeKVOvnrid5mX7HXygRR4FCw1qJf3whX4dCw52fqkD24ru007S6u6/RhO3wK2qkqLo8jPpJnRVW+dkVd61u8pTeKwRZHsIBoB5E2tHOFH3NrLiubU+7LaxyN3mYrPyl9kENZVNyGAqCSuWgcBKHC4ThpyyEtULVEwsljA14feo43xfZ7AKmSvghHmnXDNhgZHoUYZp79HMyPi8vrORo6k75Ln83PM0OnygrKXD7xy1nw0A81/5BnRblvGGJhAZcLFVp30EGLBwYeLuMlapabVAhYcyLvdHawDry3P9W26pE23LI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8284.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(18002099003)(22082099003)(5023799004)(11063799006)(56012099006)(4143699003)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUJ6dGJvNFJsa3ZleHRHeWlBamhSTW5TWGFLM0dzbXM3NEZDbng3YTZuSHRN?=
 =?utf-8?B?UEJ0ZkR3U21tRWRqMVFPVWl6KzIrUEZ3OW5yT1RZOGdoUHoxQ2h2aDJDYmpF?=
 =?utf-8?B?Y2pCc1dHd2k1bkdvaGcvN3gvWWVacWZSYU1zcnR6OU5DeXVsUFkyVzJzZUJh?=
 =?utf-8?B?UkEreGd5QnNIeGk1ZGZhNnNqbjlXY1hyZHZPQUljdHJkNmRraUZBRFRSVGhD?=
 =?utf-8?B?RU43RFhETHFZdERRQmdYcEVqSXliRHFaNVpWNlkzcTlFN3htV05XY1FEZW11?=
 =?utf-8?B?Wk54MGY5VWh1OFJZb000M0VreUkrMGRrZFB2aTBoYWhudklZNkd1T1J5ajVq?=
 =?utf-8?B?VkhhSVdTb2ZEN1pLV1BCd1hadFdLMmI3OG0yelp2YTVaSS9BT0dtVHRqdmQ5?=
 =?utf-8?B?K21jWm92RDhSSytabzZ1bTNwN1dDaGRtMzA4SW4zNWpZK3ZGbTE1L2pvS3VZ?=
 =?utf-8?B?NmxZajhIYlo4OVRNM2hQTmhuS3lIRWZWUzMzUm1Fa09iWmlGZ3hJWVpHS2tN?=
 =?utf-8?B?cmdsY0ZZT0dSWkNIQTF2TkJZNTlhWC9PQnV2SS91bUlBOE9NaUE5RDcwVUEv?=
 =?utf-8?B?MnI2d3BsVTdTRHhnV3loZHg5RyszcDlRamZTbnNkRGdEbkZvbEN3QUFDRGxQ?=
 =?utf-8?B?M2hXY1lSTzE0cTcrZ1dGbjZ2bm0vV2dRYnEwZXNRTGUzTlNhd1B5cFdTdU11?=
 =?utf-8?B?Qkhra042WEtuSldyZFlnQzl6eWlqUWR0czdFdllaamZiQ2ZuRVdJYkxPVmxi?=
 =?utf-8?B?b0g4eTdmQVQ0Ump1M2RqR3puazFEaDRZeG93ajZFK1ZCNUZKcmZaek1VbUhx?=
 =?utf-8?B?NHBCUVB4TXZDVzlSdUlRcGFLSlA4NEc3SXVVOFVkNHYzVko4Tkh5SU5lWlBq?=
 =?utf-8?B?TDhoVmFYVHI5dXkybWxtUmtGN2JTcFdQZFlHNi9NczFjOUxPOGpkczduSno5?=
 =?utf-8?B?bVhLLzFxemYyblJvRjUrMlpGYU5TbFF0M3ZWMHlxTUlrU1dlOWJHZy9YVFZV?=
 =?utf-8?B?R05ycnY4RC85T3Z6bm14RUlKNHIzOERYbGs5ejdzazNSZFJhRlBQN1A2dE0x?=
 =?utf-8?B?WExyUi80VlU5cmxzOVJ6QWVpR29DdjdHWU5XZmlad2pQNW9uMmk5aVI1MWRX?=
 =?utf-8?B?N2JqOUR1RDRFUHRxYjZjZmxydGlxZExjazhVVWpibW1EVHdCZHl2MVE0eStI?=
 =?utf-8?B?b2ZHQlJ4VWgrZmJHRHY3WTVDUCtMTmF6NDR3NmZMck8vdDJ0a0oxTlFmUGI0?=
 =?utf-8?B?SVZDNnNaTnVjbEFSSDhsTzVtQnN6dlVIUkd1WmpiaEp4aU53R0dXVVloY2hX?=
 =?utf-8?B?eXFmdmh5anpFQ29LeEovTFhhWlVpVm1VbWxrSHJTSHluY3JvNE9Tbk1Pa3Iw?=
 =?utf-8?B?WVBSNTRJZGJwci8zU3ZUVm85ZlVMT2ZVVmpHN3FXZ3dVYnpTdDE3Wk5nN2I4?=
 =?utf-8?B?YlliMzRUcFU4S3FUNXNGUnVFS01NU04wMlFSZzhmYnBFRG1HckozaHNydnFB?=
 =?utf-8?B?eTJidkxMeXFpaXExUVBLV1N6THhXUU1XMWFpYm1OV0ZaQnp0TWFRM0VRY0pN?=
 =?utf-8?B?YldobE1WZ0txbzc1S0ZvbkQ3dkZHZExDVDZzd3RtdTRLZWZYdnh1NjRDRXBZ?=
 =?utf-8?B?eE1Va25HbVpQSUFtWCtmZ1ZBdVJnZ29xNGhwa01mc0d4bHNCR0xOTmdsdGJE?=
 =?utf-8?B?UStkWGRsdzc3OFg2M052U0hLdFRJYktRc0htVCthbWE5SVYwS2xYQi9PdmVH?=
 =?utf-8?B?a3JmeXpvUFlsNkphcnVBT0NjU1ZMK0xMR1VmWXkwSHgyUlNuVHJMYndjaHFP?=
 =?utf-8?B?WnVFQXFGZXh6ZG9rcitXRU1PckQ3VS9NcXgrYytYay81bVhkYjBFdTlaSFhs?=
 =?utf-8?B?djBFZWJOU21WdGpGVTFEdHRHY043by8rdWpyMjhSQ0F0QmVQNmZVdDNhd1pM?=
 =?utf-8?B?OEVJTWZsdzE2RGErYzlrTnB3V2gxZC81Wm9VVzdTMlh1Y2tvZzVFV0VMcjZv?=
 =?utf-8?B?Nm9kNU5rK1NJOE5rbUVVc2pLS3NmKzJ6dFNUOTRMRWhPMkZ1TzVBTDM4cGl2?=
 =?utf-8?B?ZGp2azc3T0NsbktMQ2ZKaUxpTzVWYjkya2JXM3RoMXQ5WnUvY3lWYmlhQXdY?=
 =?utf-8?B?NXVrL1drUW90YUZEY3U1cVhXZXhpcVpkbTFTNVp0TEpHZHR5RWN0WldYM0tW?=
 =?utf-8?B?TzFHNWhYaHg1SFhCWWhuWGgxNFZ4TVRGNUZsTUh4NDVqMktOd1FRdjRUd0pz?=
 =?utf-8?B?bUNpRlJackt3U2dvTWgzeTdjWW4rcXR2TUhHWkhnSWNwZjRLYTZ1UUZSVkpY?=
 =?utf-8?B?Z3lvODVKNE5oUjBxTTJNL1l4b1JOK0lyQk9pbWNPOVE3YUVlYkkrQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc4ff1a1-d934-4144-0a53-08deeed17c20
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 07:01:03.5543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nLHFdNL7dZh9bw7B7cYTP6nI91pIsL0JLzv92xWCaSNj+6VU1KfiWWulDNZ/cC4+ka7fKs7h6JRkZo1q2VZVbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9177



On 30-07-2026 22:13, Armin Wolf wrote:
> Am 29.07.26 um 18:40 schrieb Muralidhara M K:
> 
>> Add non-ACPI HSMP mailbox support, Ryzen Master SMC client message
>> descriptors, and platform routing for the Family 1Ah client platforms:
>>
>>     Models 80h-87h    Medusa1
>>     Models 88h-8Fh    Olympic Ridge
>>     Models E0h-E3h    Medusa2
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
> [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Class to Query/Set a CLKValue"), guid("{95F20B61-3D44-41F8-87E1-03CBF94C4E8F}")]
> class AMD_ACPI {
>   [key, read] string InstanceName;
>   [read] boolean Active;
> 
>   [WmiMethodId(1), Implemented, read, write, Description("Get version")] void QueryVersion([out, Description("version")] uint32 version);
>   [WmiMethodId(2), Implemented, read, write, Description("WMI function init.")] void Init([out, Description("status")] uint8 status);
>   [WmiMethodId(3), Implemented, read, write, Description("Get BIOS ACPI support function table.")] void GetObjectID([out, Description("Get BIOS support Object ID table")] OIDPackage pack);
>   [WmiMethodId(4), Implemented, read, write, Description("Bios request data")] void Getdvalues([in, Description("ID used to identify")] uint32 ID, [out, Description("status")] GetdValuesPackage pack);
>   [WmiMethodId(5), Implemented, read, write, Description("Command Run")] void RunCommand([in, Description("In buffer")] uint8 Inbuf[8], [out, Description("Out buffer")] OutBuffer Outbuf);
>   [WmiMethodId(6), Implemented, read, write, Description("Get Min/Max/Stepping values")] void GetMinMaxSteppingValues([in, Description("ID used to identify")] uint32 ID, [out, Description("status")] GetMinMaxSteppingPackage pack);
>   [WmiMethodId(7), Implemented, read, write, Description("Get DIMM SPD data")] void GetDimmSpdData([in, Description("DIMM Index")] uint32 Index, [out, Description("SPD Data Buffer")] DimmSpdBuffer DimmSpdData);
>   [WmiMethodId(8), Implemented, read, write, Description("Get BIOS ACPI support function table2.")] void GetObjectID2([out, Description("Get BIOS support Object ID table2")] OIDPackage pack);
>   [WmiMethodId(9), Implemented, read, write, Description("Get RMP table")] void GetRmpData([out, Description("Get RMP table")] RMPPackage pack);
>   [WmiMethodId(10), Implemented, read, write, Description("Get OPP Heaer")] void GetOppTable([out, Description("Get Opp Heaer")] OPPHeader pack);
>   [WmiMethodId(11), Implemented, read, write, Description("Get OPP Data")] void GetOppData([in, Description("Profile Index")] uint32 Index, [out, Description("Opp Profile")] OPPProfole pack);
> };
> 
> I own multiple devices with such an interface, and i would _love_ to add support
> for them.

Thanks Armin. WMI stuff was on my TODO for a long time and recently I have completed the work, please expect it to get posted next cycle - Shall include you to the review once I send out the series.

Thanks,
Shyam
 
> 
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
>> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
>> index fa1fc240e212..8a9d6fe7d4cf 100644
>> --- a/Documentation/arch/x86/amd_hsmp.rst
>> +++ b/Documentation/arch/x86/amd_hsmp.rst
>> @@ -8,6 +8,21 @@ Newer Fam19h(model 0x00-0x1f, 0x30-0x3f, 0x90-0x9f, 0xa0-0xaf),
>>   Fam1Ah(model 0x00-0x1f) EPYC server line of processors from AMD support
>>   system management functionality via HSMP (Host System Management Port).
>>   +The Fam1Ah client platforms are supported as well:
>> +
>> +  =============  =============
>> +  Model          Platform
>> +  =============  =============
>> +  0x80-0x87      Medusa1
>> +  0x88-0x8f      Olympic Ridge
>> +  0xe0-0xe3      Medusa2
>> +  =============  =============
>> +
>> +They share one mailbox and speak the Ryzen Master SMC message set instead
>> +of the server HSMP message set, so the message IDs accepted on them are
>> +the HSMP_CLIENT_* ones listed in arch/x86/include/uapi/asm/amd_hsmp.h.
>> +The character device and ioctl interface described below are the same.
>> +
>>   The Host System Management Port (HSMP) is an interface to provide
>>   OS-level software with access to system management functions via a
>>   set of mailbox registers.
>> @@ -17,7 +32,8 @@ More details on the interface can be found in chapter
>>   Eg: https://docs.amd.com/v/u/en-US/55898_B1_pub_0_50
>>     -HSMP interface is supported on EPYC line of server CPUs and MI300A (APU).
>> +HSMP interface is supported on EPYC line of server CPUs, MI300A (APU) and
>> +the Fam1Ah client platforms listed above.
>>       HSMP device
>> diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
>> index eda336bfd3e9..b4c3ddb9d1c1 100644
>> --- a/arch/x86/include/uapi/asm/amd_hsmp.h
>> +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
>> @@ -664,4 +664,141 @@ struct hsmp_telemetry_data {
>>   #define HSMP_IOCTL_GET_TELEMETRY_DATA \
>>       _IOW(HSMP_BASE_IOCTL_NR, 1, struct hsmp_telemetry_data)
>>   +/*
>> + * Client HSMP messages supported on the Family 1Ah client platforms:
>> + * Models 80h-87h (Medusa1), Models 88h-8Fh (Olympic Ridge) and
>> + * Models E0h-E3h (Medusa2).
>> + * These map to Ryzen Master SMC (RMSMC) message IDs.
>> + */
>> +enum hsmp_client_message_ids {
>> +    HSMP_CLIENT_TEST = 1,            /* 01h Test message */
>> +    HSMP_CLIENT_GET_SMU_VER,        /* 02h SMU FW version */
>> +    HSMP_CLIENT_GET_INTERFACE_VER,        /* 03h Interface version */
>> +    HSMP_CLIENT_GET_METRICS_TABLE_VER,    /* 04h Metrics table version */
>> +    HSMP_CLIENT_GET_METRICS_TABLE,        /* 05h Metrics table log sample */
>> +    HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR,/* 06h Metrics table DRAM address */
>> +    HSMP_CLIENT_SET_CORE_PSM_MARGIN,    /* 07h Set core PSM margin */
>> +    HSMP_CLIENT_SET_ALL_CORE_PSM_MARGIN,    /* 08h Set all core PSM margin */
>> +    HSMP_CLIENT_SET_FAST_PPT_LIMIT,        /* 09h Set fast PPT limit */
>> +    HSMP_CLIENT_SET_VRM_VDD_CURRENT_LIMIT,    /* 0Ah Set VRM VDD current limit */
>> +    HSMP_CLIENT_SET_VRM_VDD_MAX_CURRENT_LIMIT,/* 0Bh Set VRM VDD max current limit */
>> +    HSMP_CLIENT_SET_TJ_MAX,            /* 0Ch Set TjMax */
>> +    HSMP_CLIENT_SET_FIT_LIMIT_SCALAR,    /* 0Dh Set FIT limit scalar */
>> +    HSMP_CLIENT_ENABLE_OVERCLOCKING,    /* 0Eh Enable overclocking */
>> +    HSMP_CLIENT_DISABLE_OVERCLOCKING,    /* 0Fh Disable overclocking */
>> +    HSMP_CLIENT_SET_OVERCLOCK_FREQ_ALL_CORES,/* 10h Set OC freq all cores */
>> +    HSMP_CLIENT_SET_OVERCLOCK_FREQ_PER_CORE,/* 11h Set OC freq per core */
>> +    HSMP_CLIENT_SET_OVERCLOCK_VID,        /* 12h Set OC VID */
>> +    HSMP_CLIENT_SET_FCLK_OVERCLOCK_ON_THE_FLY,/* 13h Set FCLK OC on-the-fly */
>> +    HSMP_CLIENT_GET_CORE_PERF_ORDER,    /* 14h Get core performance order */
>> +    HSMP_CLIENT_SET_SUSTAINED_POWER_LIMIT,    /* 15h Set sustained power limit */
>> +    HSMP_CLIENT_SET_SLOW_PPT_LIMIT,        /* 16h Set slow PPT limit */
>> +    HSMP_CLIENT_SET_VRM_GFX_MAX_CURRENT_LIMIT,/* 17h Set VRM GFX max current limit */
>> +    HSMP_CLIENT_SET_VRM_SOC_CURRENT_LIMIT,    /* 18h Set VRM SOC current limit */
>> +    HSMP_CLIENT_SET_FAST_SPM_LIMIT,        /* 19h Set fast SPM limit */
>> +    HSMP_CLIENT_SET_SLOW_SPM_LIMIT,        /* 1Ah Set slow SPM limit */
>> +    HSMP_CLIENT_GET_CORE_PSM_MARGIN,    /* 1Bh Get core PSM margin */
>> +    HSMP_CLIENT_GET_GFX_PSM_MARGIN,        /* 1Ch Get GFX PSM margin */
>> +    HSMP_CLIENT_SPARE_0X1D,            /* 1Dh Spare */
>> +    HSMP_CLIENT_SPARE_0X1E,            /* 1Eh Spare */
>> +    HSMP_CLIENT_SPARE_0X1F,            /* 1Fh Spare */
>> +    HSMP_CLIENT_SPARE_0X20,            /* 20h Spare */
>> +    HSMP_CLIENT_SET_GFXCLK_OVERDRIVE_BY_FREQ_VID,/* 21h Set GfxClk overdrive by freq/VID */
>> +    HSMP_CLIENT_DISABLE_GFXCLK_OVERDRIVE,    /* 22h Disable GfxClk overdrive */
>> +    HSMP_CLIENT_SET_GFX_PSM_MARGIN,        /* 23h Set GFX PSM margin */
>> +    HSMP_CLIENT_SET_CCLK_FMAX_OFFSET,    /* 24h Set CCLK Fmax offset */
>> +    HSMP_CLIENT_SET_CORE_POWER_LIMIT_OFFSET,/* 25h Set core power limit offset */
>> +    HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND,    /* 26h Add extra PSM guardband */
>> +    HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND_GFX,/* 27h Add extra PSM guardband GFX */
>> +    HSMP_CLIENT_SET_GFXCLK_FMAX,        /* 28h Set GfxClk Fmax */
>> +    HSMP_CLIENT_MSG_ID_MAX,
>> +};
>> +
>> +/* Client message descriptor table (Family 1Ah Models 80h-8Fh, E0h-E3h) */
>> +static const struct hsmp_msg_desc hsmp_client_msg_desc_table[]
>> +                __attribute__((unused)) = {
>> +    /* RESERVED */
>> +    {0, 0, HSMP_RSVD},
>> +    /* HSMP_CLIENT_TEST */
>> +    {1, 1, HSMP_GET},
>> +    /* HSMP_CLIENT_GET_SMU_VER */
>> +    {0, 1, HSMP_GET},
>> +    /* HSMP_CLIENT_GET_INTERFACE_VER */
>> +    {0, 1, HSMP_GET},
>> +    /* HSMP_CLIENT_GET_METRICS_TABLE_VER */
>> +    {0, 1, HSMP_GET},
>> +    /* HSMP_CLIENT_GET_METRICS_TABLE */
>> +    {0, 0, HSMP_GET},
>> +    /* HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR */
>> +    {0, 3, HSMP_GET},
>> +    /* HSMP_CLIENT_SET_CORE_PSM_MARGIN */
>> +    {1, 0, HSMP_SET},
>> +    /* HSMP_CLIENT_SET_ALL_CORE_PSM_MARGIN */
>> +    {1, 0, HSMP_SET},
>> +    /* HSMP_CLIENT_SET_FAST_PPT_LIMIT */
>> +    {1, 0, HSMP_SET},
>> +    /* HSMP_CLIENT_SET_VRM_VDD_CURRENT_LIMIT */
>> +    {1, 0, HSMP_SET},
>> +    /* HSMP_CLIENT_SET_VRM_VDD_MAX_CURRENT_LIMIT */
>> +    {1, 0, HSMP_SET},
>> +    /* HSMP_CLIENT_SET_TJ_MAX */
>> +    {1, 0, HSMP_SET},
>> +    /* HSMP_CLIENT_SET_FIT_LIMIT_SCALAR */
>> +    {1, 0, HSMP_SET},
>> +    /* HSMP_CLIENT_ENABLE_OVERCLOCKING */
>> +    {0, 0, HSMP_SET},
>> +    /* HSMP_CLIENT_DISABLE_OVERCLOCKING */
>> +    {0, 0, HSMP_SET},
>> +    /* HSMP_CLIENT_SET_OVERCLOCK_FREQ_ALL_CORES */
>> +    {1, 0, HSMP_SET},
>> +    /* HSMP_CLIENT_SET_OVERCLOCK_FREQ_PER_CORE */
>> +    {1, 0, HSMP_SET},
>> +    /* HSMP_CLIENT_SET_OVERCLOCK_VID */
>> +    {1, 0, HSMP_SET},
>> +    /* HSMP_CLIENT_SET_FCLK_OVERCLOCK_ON_THE_FLY */
>> +    {1, 0, HSMP_SET},
>> +    /* HSMP_CLIENT_GET_CORE_PERF_ORDER */
>> +    {1, 1, HSMP_GET},
>> +    /* HSMP_CLIENT_SET_SUSTAINED_POWER_LIMIT */
>> +    {1, 0, HSMP_SET},
>> +    /* HSMP_CLIENT_SET_SLOW_PPT_LIMIT */
>> +    {1, 0, HSMP_SET},
>> +    /* HSMP_CLIENT_SET_VRM_GFX_MAX_CURRENT_LIMIT */
>> +    {1, 0, HSMP_SET},
>> +    /* HSMP_CLIENT_SET_VRM_SOC_CURRENT_LIMIT */
>> +    {1, 0, HSMP_SET},
>> +    /* HSMP_CLIENT_SET_FAST_SPM_LIMIT */
>> +    {1, 0, HSMP_SET},
>> +    /* HSMP_CLIENT_SET_SLOW_SPM_LIMIT */
>> +    {1, 0, HSMP_SET},
>> +    /* HSMP_CLIENT_GET_CORE_PSM_MARGIN */
>> +    {1, 1, HSMP_GET},
>> +    /* HSMP_CLIENT_GET_GFX_PSM_MARGIN */
>> +    {0, 1, HSMP_GET},
>> +    /* HSMP_CLIENT_SPARE_0X1D */
>> +    {0, 0, HSMP_RSVD},
>> +    /* HSMP_CLIENT_SPARE_0X1E */
>> +    {0, 0, HSMP_RSVD},
>> +    /* HSMP_CLIENT_SPARE_0X1F */
>> +    {0, 0, HSMP_RSVD},
>> +    /* HSMP_CLIENT_SPARE_0X20 */
>> +    {0, 0, HSMP_RSVD},
>> +    /* HSMP_CLIENT_SET_GFXCLK_OVERDRIVE_BY_FREQ_VID */
>> +    {1, 0, HSMP_SET},
>> +    /* HSMP_CLIENT_DISABLE_GFXCLK_OVERDRIVE */
>> +    {0, 0, HSMP_SET},
>> +    /* HSMP_CLIENT_SET_GFX_PSM_MARGIN */
>> +    {1, 0, HSMP_SET},
>> +    /* HSMP_CLIENT_SET_CCLK_FMAX_OFFSET */
>> +    {1, 0, HSMP_SET},
>> +    /* HSMP_CLIENT_SET_CORE_POWER_LIMIT_OFFSET */
>> +    {1, 0, HSMP_SET},
>> +    /* HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND */
>> +    {1, 0, HSMP_SET},
>> +    /* HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND_GFX */
>> +    {1, 0, HSMP_SET},
>> +    /* HSMP_CLIENT_SET_GFXCLK_FMAX */
>> +    {1, 0, HSMP_SET},
>> +};
>> +
>>   #endif /*_ASM_X86_AMD_HSMP_H_*/
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
>> index 5e123a4ecea9..9b65dbd47965 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
>> @@ -45,7 +45,67 @@
>>    */
>>   #define CHECK_GET_BIT        BIT(31)
>>   -static struct hsmp_plat_device hsmp_pdev;
>> +static const struct hsmp_mbaddr_info hsmp_mbinfo_server = {
>> +    .base_addr    = SMN_HSMP_BASE,
>> +    .msg_id_off    = SMN_HSMP_MSG_ID,
>> +    .msg_resp_off    = SMN_HSMP_MSG_RESP,
>> +    .msg_arg_off    = SMN_HSMP_MSG_DATA,
>> +};
>> +
>> +/* RM: Ryzen Master, the SMC interface these client addresses belong to */
>> +static const struct hsmp_mbaddr_info hsmp_mbinfo_client = {
>> +    .base_addr    = SMN_HSMP_BASE_RM,
>> +    .msg_id_off    = SMN_HSMP_MSG_ID_RM,
>> +    .msg_resp_off    = SMN_HSMP_MSG_RESP_RM,
>> +    .msg_arg_off    = SMN_HSMP_MSG_DATA_RM,
>> +};
>> +
>> +/*
>> + * The descriptors carry only the message IDs the driver issues itself, which
>> + * are also the only ones the two message sets have in common.  Messages named
>> + * by userspace in an ioctl need no entry here, as that path already resolves
>> + * the ID against the running platform's table.
>> + */
>> +static const struct hsmp_plat_desc hsmp_desc_server = {
>> +    .mbinfo            = &hsmp_mbinfo_server,
>> +    .msg_desc        = hsmp_msg_desc_table,
>> +    .num_msgs        = HSMP_MSG_ID_MAX,
>> +    .test_msg        = HSMP_TEST,
>> +    .proto_ver_msg        = HSMP_GET_PROTO_VER,
>> +};
>> +
>> +/* The client drives a different mailbox with the Ryzen Master SMC message set */
>> +static const struct hsmp_plat_desc hsmp_desc_client = {
>> +    .mbinfo            = &hsmp_mbinfo_client,
>> +    .msg_desc        = hsmp_client_msg_desc_table,
>> +    .num_msgs        = HSMP_CLIENT_MSG_ID_MAX,
>> +    .test_msg        = HSMP_CLIENT_TEST,
>> +    .proto_ver_msg        = HSMP_CLIENT_GET_INTERFACE_VER,
>> +};
>> +
>> +static struct hsmp_plat_device hsmp_pdev = {
>> +    /*
>> +     * Overridden for the client in get_hsmp_pdev(), which every driver
>> +     * calls before it touches a socket.  Defaulting it here rather than
>> +     * leaving it NULL keeps the message plumbing safe for any caller that
>> +     * arrives without going through there.
>> +     */
>> +    .desc = &hsmp_desc_server,
>> +};
>> +
>> +/*
>> + * Callers must bounds-check msg_id against desc->num_msgs first; this returns
>> + * NULL rather than indexing out of range if they did not.
>> + */
>> +static inline const struct hsmp_msg_desc *get_msg_desc(u32 msg_id)
>> +{
>> +    const struct hsmp_plat_desc *desc = hsmp_pdev.desc;
>> +
>> +    if (msg_id >= desc->num_msgs)
>> +        return NULL;
>> +
>> +    return &desc->msg_desc[msg_id];
>> +}
>>     /*
>>    * Gates the AMD HSMP data plane against socket bring-up and teardown.
>> @@ -184,30 +244,37 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
>>     static int validate_message(struct hsmp_message *msg)
>>   {
>> +    const struct hsmp_msg_desc *desc;
>> +
>>       /* msg_id against valid range of message IDs */
>> -    if (msg->msg_id < HSMP_TEST || msg->msg_id >= HSMP_MSG_ID_MAX)
>> +    if (msg->msg_id < hsmp_pdev.desc->test_msg ||
>> +        msg->msg_id >= hsmp_pdev.desc->num_msgs)
>> +        return -ENOMSG;
>> +
>> +    desc = get_msg_desc(msg->msg_id);
>> +    if (!desc)
>>           return -ENOMSG;
>>         /* msg_id is a reserved message ID */
>> -    if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_RSVD)
>> +    if (desc->type == HSMP_RSVD)
>>           return -ENOMSG;
>>         /*
>>        * num_args passed by user should match the num_args specified in
>>        * message description table.
>>        */
>> -    if (msg->num_args != hsmp_msg_desc_table[msg->msg_id].num_args)
>> +    if (msg->num_args != desc->num_args)
>>           return -EINVAL;
>>         /*
>>        * As the HSMP protocol evolves, newer platforms may define more
>>        * response arguments for existing messages.  Use an upper-bound
>>        * check so that older userspace callers requesting fewer response
>> -     * words than what the current hsmp_msg_desc_table[] defines are
>> -     * still accepted, while rejecting requests that exceed the
>> -     * hardware capability.
>> +     * words than what the current descriptor table defines are still
>> +     * accepted, while rejecting requests that exceed the hardware
>> +     * capability.
>>        */
>> -    if (msg->response_sz > hsmp_msg_desc_table[msg->msg_id].response_sz)
>> +    if (msg->response_sz > desc->response_sz)
>>           return -EINVAL;
>>         return 0;
>> @@ -316,7 +383,7 @@ int hsmp_test(u16 sock_ind, u32 value)
>>        * Test the hsmp port by performing TEST command. The test message
>>        * takes one argument and returns the value of that argument + 1.
>>        */
>> -    msg.msg_id    = HSMP_TEST;
>> +    msg.msg_id    = hsmp_pdev.desc->test_msg;
>>       msg.num_args    = 1;
>>       msg.response_sz    = 1;
>>       msg.args[0]    = value;
>> @@ -340,10 +407,15 @@ EXPORT_SYMBOL_NS_GPL(hsmp_test, "AMD_HSMP");
>>     static bool is_get_msg(struct hsmp_message *msg)
>>   {
>> -    if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_GET)
>> +    const struct hsmp_msg_desc *desc = get_msg_desc(msg->msg_id);
>> +
>> +    if (!desc)
>> +        return false;
>> +
>> +    if (desc->type == HSMP_GET)
>>           return true;
>>   -    if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_SET_GET &&
>> +    if (desc->type == HSMP_SET_GET &&
>>           (msg->args[0] & CHECK_GET_BIT))
>>           return true;
>>   @@ -354,6 +426,7 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
>>   {
>>       int __user *arguser = (int  __user *)arg;
>>       struct hsmp_message msg = { 0 };
>> +    const struct hsmp_msg_desc *desc;
>>       int ret;
>>         if (copy_struct_from_user(&msg, sizeof(msg), arguser, sizeof(struct hsmp_message)))
>> @@ -361,23 +434,28 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
>>         /*
>>        * Check msg_id is within the range of supported msg ids
>> -     * i.e within the array bounds of hsmp_msg_desc_table
>> +     * i.e within the array bounds of the platform's descriptor table
>>        */
>> -    if (msg.msg_id < HSMP_TEST || msg.msg_id >= HSMP_MSG_ID_MAX)
>> +    if (msg.msg_id < hsmp_pdev.desc->test_msg ||
>> +        msg.msg_id >= hsmp_pdev.desc->num_msgs)
>>           return -ENOMSG;
>>         /*
>>        * Sanitize the user-controlled msg_id against speculative
>>        * execution.  The bounds check above retires the out-of-range
>>        * case with -ENOMSG, but a mispredicted branch can still let the
>> -     * CPU speculatively use msg_id as an index into
>> -     * hsmp_msg_desc_table[] (here and in validate_message() /
>> +     * CPU speculatively use msg_id as an index into the message
>> +     * descriptor tables (here and in validate_message() /
>>        * is_get_msg() called downstream via hsmp_send_message()), and
>>        * pull arbitrary kernel memory into the cache (Spectre v1,
>>        * CVE-2017-5753).  Clamp once into msg.msg_id so every downstream
>>        * dereference sees the sanitized value.
>>        */
>> -    msg.msg_id = array_index_nospec(msg.msg_id, HSMP_MSG_ID_MAX);
>> +    msg.msg_id = array_index_nospec(msg.msg_id, hsmp_pdev.desc->num_msgs);
>> +
>> +    desc = get_msg_desc(msg.msg_id);
>> +    if (!desc || desc->type == HSMP_RSVD)
>> +        return -ENOMSG;
>>         switch (fp->f_mode & (FMODE_WRITE | FMODE_READ)) {
>>       case FMODE_WRITE:
>> @@ -410,7 +488,7 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
>>       if (ret)
>>           return ret;
>>   -    if (hsmp_msg_desc_table[msg.msg_id].response_sz > 0) {
>> +    if (desc->response_sz > 0) {
>>           /* Copy results back to user for get/monitor commands */
>>           if (copy_to_user(arguser, &msg, sizeof(struct hsmp_message)))
>>               return -EFAULT;
>> @@ -687,9 +765,9 @@ int hsmp_cache_proto_ver(u16 sock_ind)
>>       struct hsmp_message msg = { 0 };
>>       int ret;
>>   -    msg.msg_id    = HSMP_GET_PROTO_VER;
>> +    msg.msg_id    = hsmp_pdev.desc->proto_ver_msg;
>>       msg.sock_ind    = sock_ind;
>> -    msg.response_sz = hsmp_msg_desc_table[HSMP_GET_PROTO_VER].response_sz;
>> +    msg.response_sz    = get_msg_desc(msg.msg_id)->response_sz;
>>         ret = hsmp_send_message_locked(&msg);
>>       if (!ret)
>> @@ -735,6 +813,15 @@ EXPORT_SYMBOL_NS_GPL(hsmp_misc_deregister, "AMD_HSMP");
>>     struct hsmp_plat_device *get_hsmp_pdev(void)
>>   {
>> +    /*
>> +     * Both drivers call this before they bring any socket up, and the CPU
>> +     * this selects on is fixed long before either can load, so resolving
>> +     * the platform description here is enough to have it in place for
>> +     * every mailbox access and for the probe paths themselves.
>> +     */
>> +    if (is_client_platform())
>> +        hsmp_pdev.desc = &hsmp_desc_client;
>> +
>>       return &hsmp_pdev;
>>   }
>>   EXPORT_SYMBOL_NS_GPL(get_hsmp_pdev, "AMD_HSMP");
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
>> index 8dbff16a87b1..b4bd9800dee1 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
>> @@ -10,6 +10,8 @@
>>   #ifndef HSMP_H
>>   #define HSMP_H
>>   +#include <asm/amd/hsmp.h>
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
>>     #define DRIVER_VERSION        "2.6"
>>   +/*
>> + * To access a specific HSMP mailbox register, s/w writes the SMN address of the
>> + * HSMP mailbox register into the SMN_INDEX register, and reads/writes the
>> + * SMN_DATA reg.  Below are the SMN addresses of the HSMP mailbox registers in
>> + * SMU address space, as consumed by the fixed mailbox descriptors in hsmp.c.
>> + *
>> + * The server set is used by the non-ACPI path only; the ACPI path discovers the
>> + * equivalent values from _CRS/_DSD.  The _RM set is the client one, named for
>> + * the Ryzen Master SMC (RMSMC) interface whose mailbox it addresses, and is
>> + * used by both paths because the client exposes no _CRS/_DSD to discover them
>> + * from.  The two sets share a base and differ only in the register offsets
>> + * behind it, but are kept separate so each stays tied to the platform it was
>> + * documented for.
>> + */
>> +#define SMN_HSMP_BASE        0x03B00000
>> +#define SMN_HSMP_MSG_ID        0x00010534
>> +#define SMN_HSMP_MSG_ID_F1A_M0H    0x00010934
>> +#define SMN_HSMP_MSG_RESP    0x00010980
>> +#define SMN_HSMP_MSG_DATA    0x000109E0
>> +
>> +/* _RM: Ryzen Master SMC, the client mailbox */
>> +#define SMN_HSMP_BASE_RM    0x03B00000
>> +#define SMN_HSMP_MSG_ID_RM    0x00010A8C
>> +#define SMN_HSMP_MSG_RESP_RM    0x00010A90
>> +#define SMN_HSMP_MSG_DATA_RM    0x00010A94
>> +
>> +/*
>> + * Family 1Ah client platforms use the Ryzen Master SMC (client) mailbox and
>> + * message set instead of the server HSMP interface:
>> + *
>> + *    Models 80h-87h    Medusa1
>> + *    Models 88h-8Fh    Olympic Ridge
>> + *    Models E0h-E3h    Medusa2
>> + *
>> + * They all share the SMN_HSMP_*_RM mailbox addresses above and the same
>> + * message set, so one predicate covers them and the two adjacent Model 8xh
>> + * ranges are tested as one.
>> + */
>> +static inline bool is_client_platform(void)
>> +{
>> +    return boot_cpu_data.x86 == 0x1A &&
>> +           ((boot_cpu_data.x86_model >= 0x80 && boot_cpu_data.x86_model <= 0x8F) ||
>> +        (boot_cpu_data.x86_model >= 0xE0 && boot_cpu_data.x86_model <= 0xE3));
>> +}
>> +
>>   struct hsmp_mbaddr_info {
>>       u32 base_addr;
>>       u32 msg_id_off;
>> @@ -40,6 +88,30 @@ struct hsmp_mbaddr_info {
>>       u32 size;
>>   };
>>   +/*
>> + * Per-platform description of the mailbox and the message set behind it.
>> + * Resolved once from the running CPU and reached through hsmp_pdev->desc, so
>> + * neither the message plumbing nor the probe paths have to re-derive which
>> + * platform they are on.
>> + *
>> + * @mbinfo:        fixed SMN mailbox addresses.  The ACPI path uses these
>> + *            only where firmware exposes no _CRS/_DSD to read them
>> + *            from, i.e. on the client.
>> + * @msg_desc:        message descriptor table, indexed by message ID.
>> + * @num_msgs:        number of entries in @msg_desc, and so the exclusive
>> + *            upper bound on a valid message ID.
>> + * @test_msg:        no-op message used to probe the mailbox.  Also the
>> + *            lowest valid message ID, as ID 0 is reserved.
>> + * @proto_ver_msg:    returns the interface version.
>> + */
>> +struct hsmp_plat_desc {
>> +    const struct hsmp_mbaddr_info    *mbinfo;
>> +    const struct hsmp_msg_desc    *msg_desc;
>> +    u32                num_msgs;
>> +    u32                test_msg;
>> +    u32                proto_ver_msg;
>> +};
>> +
>>   struct hsmp_socket {
>>       struct bin_attribute hsmp_attr;
>>       struct hsmp_mbaddr_info mbinfo;
>> @@ -59,6 +131,7 @@ struct hsmp_socket {
>>   struct hsmp_plat_device {
>>       struct miscdevice mdev;
>>       struct hsmp_socket *sock;
>> +    const struct hsmp_plat_desc *desc;
>>       u32 proto_ver;
>>       u16 num_sockets;
>>   };
>> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
>> index e9b2b809c0f5..7423c98a7b3e 100644
>> --- a/drivers/platform/x86/amd/hsmp/plat.c
>> +++ b/drivers/platform/x86/amd/hsmp/plat.c
>> @@ -29,17 +29,6 @@
>>     #define DRIVER_NAME        "amd_hsmp"
>>   -/*
>> - * To access specific HSMP mailbox register, s/w writes the SMN address of HSMP mailbox
>> - * register into the SMN_INDEX register, and reads/writes the SMN_DATA reg.
>> - * Below are required SMN address for HSMP Mailbox register offsets in SMU address space
>> - */
>> -#define SMN_HSMP_BASE        0x3B00000
>> -#define SMN_HSMP_MSG_ID        0x0010534
>> -#define SMN_HSMP_MSG_ID_F1A_M0H    0x0010934
>> -#define SMN_HSMP_MSG_RESP    0x0010980
>> -#define SMN_HSMP_MSG_DATA    0x00109E0
>> -
>>   static struct hsmp_plat_device *hsmp_pdev;
>>     static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
>> @@ -157,20 +146,18 @@ static int init_platform_device(struct device *dev)
>>           sock = &hsmp_pdev->sock[i];
>>           sock->sock_ind            = i;
>>           sock->dev            = dev;
>> -        sock->mbinfo.base_addr        = SMN_HSMP_BASE;
>>           sock->amd_hsmp_rdwr        = amd_hsmp_pci_rdwr;
>> +        sock->mbinfo            = *hsmp_pdev->desc->mbinfo;
>>             /*
>>            * This is a transitional change from non-ACPI to ACPI, only
>>            * family 0x1A, model 0x00 platform is supported for both ACPI and non-ACPI.
>> +         * It is the one part whose message-id register sits at a
>> +         * different offset on this path than the descriptor gives.
>>            */
>>           if (is_f1a_m0h())
>>               sock->mbinfo.msg_id_off    = SMN_HSMP_MSG_ID_F1A_M0H;
>> -        else
>> -            sock->mbinfo.msg_id_off    = SMN_HSMP_MSG_ID;
>>   -        sock->mbinfo.msg_resp_off    = SMN_HSMP_MSG_RESP;
>> -        sock->mbinfo.msg_arg_off    = SMN_HSMP_MSG_DATA;
>>           sema_init(&sock->hsmp_sem, 1);
>>             /* Test the hsmp interface on each socket */
>> @@ -184,8 +171,18 @@ static int init_platform_device(struct device *dev)
>>             ret = hsmp_cache_proto_ver(i);
>>           if (ret) {
>> -            dev_err(dev, "Failed to read HSMP protocol version\n");
>> -            return ret;
>> +            /*
>> +             * Some client SMU builds reject the interface-version
>> +             * query with "invalid message" even though the mailbox
>> +             * is functional, as the test message above just
>> +             * showed.  Keep going there instead of failing the
>> +             * probe: proto_ver only gates server-side features.
>> +             */
>> +            if (!is_client_platform()) {
>> +                dev_err(dev, "Failed to read HSMP protocol version\n");
>> +                return ret;
>> +            }
>> +            dev_warn(dev, "Interface version query unsupported on client SMU; continuing\n");
>>           }
>>             if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6) {
>> @@ -317,6 +314,12 @@ static bool legacy_hsmp_support(void)
>>       case 0x1A:
>>           switch (boot_cpu_data.x86_model) {
>>           case 0x00 ... 0x0F:
>> +        /*
>> +         * Client platforms: 80h-87h (Medusa1), 88h-8Fh (Olympic
>> +         * Ridge), E0h-E3h (Medusa2)
>> +         */
>> +        case 0x80 ... 0x8F:
>> +        case 0xE0 ... 0xE3:
>>               return true;
>>           default:
>>               return false;
> 

