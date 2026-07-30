Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012006.outbound.protection.outlook.com [52.101.43.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51766369D57;
	Thu, 30 Jul 2026 09:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785404244; cv=fail; b=ZdFwUS5BVEJpw4GCZTNnZglCTVeubl4ycwANmefVmqBPea5sA4muYKB7B9Kha5RUMRurnAARfm4hfZPbZPteiMS37zhP2STI+Uv1BidebtLuJUUtjjUyhm7PCOvFCqW7WeORsUYck4+nqMjTszQQHdw92F5y7aOGTyT7hoHpUjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785404244; c=relaxed/simple;
	bh=oCeXewC2GM6K3kgTCw1WODMr/ECuGLOK+MVTWmfUW8g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=X1N50Gl+lwR8TBP1HrJIySCWrE+FtdTXSLY1hjTt8nl6za27u99COBWR/DiunZ5u/q+AOZrE56ayTElICN21uBpHVVChpOYZexcd8yA2i45oAzc/1JAntXz7hp0BC90WWRfPuKVGj8vxCzF7P9x+ms7EtOC8t9ZxF1lM8FUvE2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uUVmeNBm; arc=fail smtp.client-ip=52.101.43.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uUVmeNBm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VOf37gChIwzmMOogWM4hhazPt8roBxB2tm+rBMC1saQczm0um7Bx1NQptJtHEG1ejlfkNR/kO92DuZMlVmKjGYEtkj2AqX2I5pSYsr6JPAlug6hoqXMPMFk/PeGS+ZpodpoJF8RutGQQVNZAtgim55YpkwCTAOeLpEUv+JO8O9NF0GKuX44/HSztIyvqPIXuAxRTs4pdvDvHisMykPO31JBcCADPHGS8xcI4ojAEpSOdpGhlEwFKQkSS25IVEG/T2oanTGe5FVWred6i3+kJyBQTo6Jjtf1q+doKR7pbLK4PkBVY0BRFFEeiC1YipRmFwCVno1vpR1f/mBp94ZnDmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOQSJSkZ+DVrjAq+WWSp2q0/f51s9p8eNbrpqSp7tRs=;
 b=USGmvYdTLhGVZhDsLHD3ZR+z/gWtFnSxzjQZaSnVI8NLi2T8Hp7mcFdIXqI0A80pz4m++ScMHylZEqo7ZdrHXrlTHUBwPqF4amNEOe7pTItmTZX7bgSlo3Fxn9tm05qCF7OlrNJHQUMcvkvZCinfzjRtRWCitPIVXI8pIljreiC4OjjCD8tQxpf0KLZ61mc76Yg+P3CuOLEaJFNvEZQr23v6PteKdvkDE4cO+biD7I9bz5MD+THX8X2ewzhAwnIs2NA/LlefYsZIhaVk0ERxkVtEt8HSLFybg+cTfya4i0+acCoG6vtTW3/6jIUbu320DYK3Wc2UNr87HdADxdnoSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOQSJSkZ+DVrjAq+WWSp2q0/f51s9p8eNbrpqSp7tRs=;
 b=uUVmeNBmUNEwScItWe92ZWb0TRLTLpWc426MLKF3V1bM90RwwGZhOv0YTQ28ZpQ6miNSalX0tHFP/2bLaRaSZpPgKmJPoIrTIlYgJSuEWBG56KHxPpGdZ16u+cQGU9U58eg+VCwmYYuh8vq1F1e97ziA8ofvpz9IfLel3G0Nms8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by SA1PR12MB6995.namprd12.prod.outlook.com (2603:10b6:806:24e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 09:37:16 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.21.0270.009; Thu, 30 Jul 2026
 09:37:16 +0000
Message-ID: <b87442b0-e958-4177-8e3a-cc50c8264ea1@amd.com>
Date: Thu, 30 Jul 2026 15:07:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] platform/x86/amd/hsmp: Add HSMP client support for
 Family 1Ah
To: Mario Limonciello <mario.limonciello@amd.com>,
 Muralidhara M K <muralidhara.mk@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 muthusamy.ramalingam@amd.com
References: <20260729164034.1331375-1-muralidhara.mk@amd.com>
 <20260729164034.1331375-2-muralidhara.mk@amd.com>
 <04201312-5535-45cc-a93c-4e71b66e1dc4@amd.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <04201312-5535-45cc-a93c-4e71b66e1dc4@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0126.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b2::9) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|SA1PR12MB6995:EE_
X-MS-Office365-Filtering-Correlation-Id: c39b0976-f8b7-4404-0a60-08deee1e2481
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|6133799003|56012099006|10067099003|5023799004|11063799006|4143699003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	AXFVJrfVJNGwZ5/ImJ49Z/9omY/jx4RuQGrFuGQJdKlecWD912Lm93ju+KB3VGKt4cRcl9TOl5yw/UTJ11yQDGFAR2Fw+oToO2dewR6c3w4ij50aeeM1CKj6leKXUSwxYaFZKE9IrOtwuqLdn60RliNTJifqVEoVCpwziavDHzE9hazXbb6lEWVDyzEgf1tnE6Rtuy4MJ5MksbwFDlhS69Xt/VHESxKo9bZZxGCw7GsNlWSeWSFGnugePe3gqndFo1s9dYqa6O8nVVPIQRARz35Wdc3r/dXCjZOPhNUCo+rr1nBVNyOKtThdakgPQB6BGCvB4aALM740uh89/sHbP2y2qYT4zuUzQsrzFmNEqrKWnEwAMtugFkvjBSrpxhsC0ahbF9RPp4VAAOeom612OPVblyP5wwVD7Jg5rlGQ3xpjHWYUh0ict7Vz1GY9AaKxjdxWTrgj37l5uyCpPKW4m3iMQHkBRlCfTVPQpK85pm2ZLrLi7+4e8lDbIgNc9jjybQ+pMREo8SXkQcl7kd6qkZ/O1utyxEFz5OZn9szMqbEVmTTLrd+zzxOrJSpeb/yMcgJOeQXRVIBGKcz2ZSB3+obrDZjtZWtuGH202U7FvUZORVmcAY2aVy6CKy63xk1d
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(56012099006)(10067099003)(5023799004)(11063799006)(4143699003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjNRTkpjYWdBZCsydHVMNlVPMEhOTHZOV2RqN2ZhYjdYZzZZL1JOT0tYQm12?=
 =?utf-8?B?Vm1yRHZuOERad2JmdXZ4R2pVTnQ4WGdSaDJCbm5uSnNSenRXMUFoMzhpRHZO?=
 =?utf-8?B?bzlmdEZOQ3RKNzNmOGFpbks4eHdRZjdWS1Y4WDMrVUdMc2ZWVk94bUVOU0E2?=
 =?utf-8?B?YkxqRmFpQWZaZ2JaclVaTW45YTYzanVzYXZkNlorMy96WHVaRkRKdlVrQkw5?=
 =?utf-8?B?VTRiVFNqT0FYVUh5NkUxTk5GSnd3U3E0cGRodXZUbmhOZDJEbGpCaUpHOUdD?=
 =?utf-8?B?cm9QSnVYRTRkVVpwNksydE9ySXZpcGVPelBHSE5vK1JzZlFuZ3FLR0Y1TDli?=
 =?utf-8?B?RW01VzR5WVQ4T3JOQklZb3lSTEx0MDhHWmVJVXdib0grT3diK0QwUHlvckxj?=
 =?utf-8?B?SHNEQ1hNWEhnOTA3MHZiMVNtUjVWVkxZU20xWUdkUjJtUHJxeE5Fdms3Mm1R?=
 =?utf-8?B?cGhVTXpJNWlNMW9NekErV1BMelhUTDVkUWpCUGdNR25MQVc5ZHU2RDBJZndV?=
 =?utf-8?B?UVFtNnRDNG9jem92d2tYVlNUSC9sM3YvSStIeFBZSDM4bENXaUNSSWtOYzBx?=
 =?utf-8?B?R05xQlcwOFh6Vmx3LzVUV25wM3RGMWQ1SmZTRlVWSm0vN3R6dG9FYjN4Qmlx?=
 =?utf-8?B?UFByY1FDcVlMQ3UzNHBjUGdZVWhlZDd6SVhpVlZwWkcyVjNPNFdCWVEyQnFl?=
 =?utf-8?B?QXpTOGRrV0lDci9mQ2MzNU8rc0lvQ3VVOVNvTmVmbGVsbVdrUkw4dDFnbXhS?=
 =?utf-8?B?TzBYc2hVL2tGL0YvZnlTVUQ5ellmZEtmK2I1K1EwM2d5eVFOQjJXckxBT1Fx?=
 =?utf-8?B?a3EyaVZRNTdib1Iydks4SzMxN2k4Y3JHbEZJTjdMbStRaUduTVF0cFQzNXFn?=
 =?utf-8?B?Y1VZclh4RHAzdk5uMzhXRlFPUk9keE5GeFlRM2NyRnlxR1hDTXc5WGw1bS94?=
 =?utf-8?B?NHJtVWJHL01QTVJJN3pZL3orbnFSMm9yM1lSU3NjUjdFMHB4QlB3Mys2NkpP?=
 =?utf-8?B?WTlHZ1MzcFNWRkFDRWcrUjVnNW9jcWNtVW95b3lWd3pUQy9IcDk4U0FHYlU3?=
 =?utf-8?B?K09lNFlLdTVaZkxWWDJvWmxEVXZSVDZFTjE3cElrdnV2VkVma2dpdFlUb3cw?=
 =?utf-8?B?NVFUU1BUdkJFbVZ5NDBCeTRPTzUvUFRBTGo0aHJYSGxMQVM5OEFONk8reS9G?=
 =?utf-8?B?MEVlN1lKTnJTbkJIdURkMkt0M2pnODlaT0tWcEYwajVRdHBlVDd4L3RFaFU2?=
 =?utf-8?B?TExsMGFuMzdmYmZFV25VNVNPNXdOeDVuWGdXSjZoOEk4aEZ2OVNDNnVHZ1lN?=
 =?utf-8?B?ZDJvODVFa2N5NndzdlY1cmxaQVlNK0xhODBzTXJBYk5LM0p5ZnVwbHU2S0Zv?=
 =?utf-8?B?dFVVZzRCSjlTeWlYWjM5bHpXNStvbm1Dc29HWEVXdzQ2RnNLdmFOWmlKZVZY?=
 =?utf-8?B?OW9xd3FpeVRzeUJEbE5KZlBKUnV0cCtwakwyUVRMYzA2akswVXdQTWdNQzds?=
 =?utf-8?B?RHhldEUrMXF4N0xLZUxyWE5nLzNXZEFacElJUnpabDhIc3RiNGpFTTMvTTNs?=
 =?utf-8?B?TmtMQlMzK09XcFhPK1piMVhTSFBqY0NxN1BVTncycXNkdEcyWnU2ekRaL2NY?=
 =?utf-8?B?QzVVczMvMVpTOHptbWN2NzBFaEh4a1BKVnhzZmtpN3VPZThyeks3MjR0UjJm?=
 =?utf-8?B?UVhGMFJKZjFXYk1WTlRaK3dkZityZW9XWExvZEJFYUlzRDhPUGhYU1RUblN6?=
 =?utf-8?B?UXJTWFhTR3d1RmxLbFYyZWEyQStqTE1BcjhsN0YxSU9UejErdVRJamFISno2?=
 =?utf-8?B?K2FUeXJEa3hyMUg0SlJKc0JXWXJEUSthUXM3a0xsTWgzU1RLTEZhSmZScDBZ?=
 =?utf-8?B?Z0hySFlqeUE5ZjE1NWY3V2lPZUVpZG5zK0ZoUjJJb3pJQU83UDRhWkVkM3V3?=
 =?utf-8?B?OUdyR0hLQUZGUnRJeUFIZjkwSmo2N2x6WjZxeVNhMFZGMy9GNkUzd0R3blha?=
 =?utf-8?B?dlhFUTErc2ZWclR4eTc2STJMZHJKZjBFMkRlRENXWDhydXpwSFZoRmdwbVdh?=
 =?utf-8?B?RFhnMWpMR0RXNlBIUzlSSENUWmwxRHptbDQzeDhySFljbXYwYVhoN1prUWhD?=
 =?utf-8?B?OEUycWtlblJFZjdkWisxaVUvV0wwV05jMmFGZ0tFMGM4anZSbDQ3VW9HeHpN?=
 =?utf-8?B?dmYvSFVKU3o4VFlYaFVDNUhocVVqWXY3Tmc4amNzNWhoY2NOb2xjVVFQanpM?=
 =?utf-8?B?Nk4zOXNQVzBEa2ZsaFYzc2R6OGZrcnNvNnFyZ24rTCtzallpdWZBVnIxaEZX?=
 =?utf-8?B?WFBiWFlGdUJLR2x2WEN0WHlkSnlwbHArOEc1eGltaDV2c1BHMjd4UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c39b0976-f8b7-4404-0a60-08deee1e2481
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 09:37:16.6090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KFNq4KrFi7aBra9U5uQvYJKAndlrzih4T/GOK9O1ma5b3h9mdJYUyEsVTiP1ktW/QYnu0AHQ8WG8iAZHSj/2CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6995



On 7/30/2026 2:57 AM, Mario Limonciello wrote:
> 
> 
> On 7/29/26 11:40, Muralidhara M K wrote:
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
>>
>> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> 
> Generic comment for the series.
> 
> With such rich function comments, I think a lot of this would be really 
> valuable to have as kdoc (/** */) and then reference in hsmp documentation.
> 
Agreed. also I will make commit message precise.
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
>> -HSMP interface is supported on EPYC line of server CPUs and MI300A 
>> (APU).
>> +HSMP interface is supported on EPYC line of server CPUs, MI300A (APU) 
>> and
>> +the Fam1Ah client platforms listed above.
>>   HSMP device
>> diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/ 
>> uapi/asm/amd_hsmp.h
>> index eda336bfd3e9..b4c3ddb9d1c1 100644
>> --- a/arch/x86/include/uapi/asm/amd_hsmp.h
>> +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
>> @@ -664,4 +664,141 @@ struct hsmp_telemetry_data {
>>   #define HSMP_IOCTL_GET_TELEMETRY_DATA \
>>       _IOW(HSMP_BASE_IOCTL_NR, 1, struct hsmp_telemetry_data)
>> +/*
>> + * Client HSMP messages supported on the Family 1Ah client platforms:
>> + * Models 80h-87h (Medusa1), Models 88h-8Fh (Olympic Ridge) and
>> + * Models E0h-E3h (Medusa2).
>> + * These map to Ryzen Master SMC (RMSMC) message IDs.
>> + */
>> +enum hsmp_client_message_ids {
>> +    HSMP_CLIENT_TEST = 1,            /* 01h Test message */
>> +    HSMP_CLIENT_GET_SMU_VER,        /* 02h SMU FW version */
>> +    HSMP_CLIENT_GET_INTERFACE_VER,        /* 03h Interface version */
>> +    HSMP_CLIENT_GET_METRICS_TABLE_VER,    /* 04h Metrics table 
>> version */
>> +    HSMP_CLIENT_GET_METRICS_TABLE,        /* 05h Metrics table log 
>> sample */
>> +    HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR,/* 06h Metrics table DRAM 
>> address */
>> +    HSMP_CLIENT_SET_CORE_PSM_MARGIN,    /* 07h Set core PSM margin */
>> +    HSMP_CLIENT_SET_ALL_CORE_PSM_MARGIN,    /* 08h Set all core PSM 
>> margin */
>> +    HSMP_CLIENT_SET_FAST_PPT_LIMIT,        /* 09h Set fast PPT limit */
>> +    HSMP_CLIENT_SET_VRM_VDD_CURRENT_LIMIT,    /* 0Ah Set VRM VDD 
>> current limit */
>> +    HSMP_CLIENT_SET_VRM_VDD_MAX_CURRENT_LIMIT,/* 0Bh Set VRM VDD max 
>> current limit */
>> +    HSMP_CLIENT_SET_TJ_MAX,            /* 0Ch Set TjMax */
>> +    HSMP_CLIENT_SET_FIT_LIMIT_SCALAR,    /* 0Dh Set FIT limit scalar */
>> +    HSMP_CLIENT_ENABLE_OVERCLOCKING,    /* 0Eh Enable overclocking */
>> +    HSMP_CLIENT_DISABLE_OVERCLOCKING,    /* 0Fh Disable overclocking */
>> +    HSMP_CLIENT_SET_OVERCLOCK_FREQ_ALL_CORES,/* 10h Set OC freq all 
>> cores */
>> +    HSMP_CLIENT_SET_OVERCLOCK_FREQ_PER_CORE,/* 11h Set OC freq per 
>> core */
>> +    HSMP_CLIENT_SET_OVERCLOCK_VID,        /* 12h Set OC VID */
>> +    HSMP_CLIENT_SET_FCLK_OVERCLOCK_ON_THE_FLY,/* 13h Set FCLK OC on- 
>> the-fly */
>> +    HSMP_CLIENT_GET_CORE_PERF_ORDER,    /* 14h Get core performance 
>> order */
>> +    HSMP_CLIENT_SET_SUSTAINED_POWER_LIMIT,    /* 15h Set sustained 
>> power limit */
>> +    HSMP_CLIENT_SET_SLOW_PPT_LIMIT,        /* 16h Set slow PPT limit */
>> +    HSMP_CLIENT_SET_VRM_GFX_MAX_CURRENT_LIMIT,/* 17h Set VRM GFX max 
>> current limit */
>> +    HSMP_CLIENT_SET_VRM_SOC_CURRENT_LIMIT,    /* 18h Set VRM SOC 
>> current limit */
>> +    HSMP_CLIENT_SET_FAST_SPM_LIMIT,        /* 19h Set fast SPM limit */
>> +    HSMP_CLIENT_SET_SLOW_SPM_LIMIT,        /* 1Ah Set slow SPM limit */
>> +    HSMP_CLIENT_GET_CORE_PSM_MARGIN,    /* 1Bh Get core PSM margin */
>> +    HSMP_CLIENT_GET_GFX_PSM_MARGIN,        /* 1Ch Get GFX PSM margin */
>> +    HSMP_CLIENT_SPARE_0X1D,            /* 1Dh Spare */
>> +    HSMP_CLIENT_SPARE_0X1E,            /* 1Eh Spare */
>> +    HSMP_CLIENT_SPARE_0X1F,            /* 1Fh Spare */
>> +    HSMP_CLIENT_SPARE_0X20,            /* 20h Spare */
>> +    HSMP_CLIENT_SET_GFXCLK_OVERDRIVE_BY_FREQ_VID,/* 21h Set GfxClk 
>> overdrive by freq/VID */
>> +    HSMP_CLIENT_DISABLE_GFXCLK_OVERDRIVE,    /* 22h Disable GfxClk 
>> overdrive */
>> +    HSMP_CLIENT_SET_GFX_PSM_MARGIN,        /* 23h Set GFX PSM margin */
>> +    HSMP_CLIENT_SET_CCLK_FMAX_OFFSET,    /* 24h Set CCLK Fmax offset */
>> +    HSMP_CLIENT_SET_CORE_POWER_LIMIT_OFFSET,/* 25h Set core power 
>> limit offset */
>> +    HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND,    /* 26h Add extra PSM 
>> guardband */
>> +    HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND_GFX,/* 27h Add extra PSM 
>> guardband GFX */
>> +    HSMP_CLIENT_SET_GFXCLK_FMAX,        /* 28h Set GfxClk Fmax */
>> +    HSMP_CLIENT_MSG_ID_MAX,
>> +};
>> +
>> +/* Client message descriptor table (Family 1Ah Models 80h-8Fh, E0h- 
>> E3h) */
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
> 
> How would you feel about adding a static (compile time) assert that the 
> number of entries here matched the number of enums?
> 
> This can avoid making a mistake later.
> 
Good idea, done:

         static_assert(ARRAY_SIZE(hsmp_msg_desc_table) == HSMP_MSG_ID_MAX);
         static_assert(ARRAY_SIZE(hsmp_client_msg_desc_table) ==
                       HSMP_CLIENT_MSG_ID_MAX);
>> +
>>   #endif /*_ASM_X86_AMD_HSMP_H_*/
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/ 
>> x86/amd/hsmp/hsmp.c
>> index 5e123a4ecea9..9b65dbd47965 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
>> @@ -45,7 +45,67 @@
>>    */
>>   #define CHECK_GET_BIT        BIT(31)
>> -static struct hsmp_plat_device hsmp_pdev;
>> +static const struct hsmp_mbaddr_info hsmp_mbinfo_server = {
>> +    .base_addr    = SMN_HSMP_BASE,
>> +    .msg_id_off    = SMN_HSMP_MSG_ID,
>> +    .msg_resp_off    = SMN_HSMP_MSG_RESP,
>> +    .msg_arg_off    = SMN_HSMP_MSG_DATA,
>> +};
>> +
>> +/* RM: Ryzen Master, the SMC interface these client addresses belong 
>> to */
>> +static const struct hsmp_mbaddr_info hsmp_mbinfo_client = {
>> +    .base_addr    = SMN_HSMP_BASE_RM,
>> +    .msg_id_off    = SMN_HSMP_MSG_ID_RM,
>> +    .msg_resp_off    = SMN_HSMP_MSG_RESP_RM,
>> +    .msg_arg_off    = SMN_HSMP_MSG_DATA_RM,
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
>> +    .mbinfo            = &hsmp_mbinfo_server,
>> +    .msg_desc        = hsmp_msg_desc_table,
>> +    .num_msgs        = HSMP_MSG_ID_MAX,
>> +    .test_msg        = HSMP_TEST,
>> +    .proto_ver_msg        = HSMP_GET_PROTO_VER,
>> +};
>> +
>> +/* The client drives a different mailbox with the Ryzen Master SMC 
>> message set */
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
>> +     * leaving it NULL keeps the message plumbing safe for any caller 
>> that
>> +     * arrives without going through there.
>> +     */
>> +    .desc = &hsmp_desc_server,
>> +};
>> +
>> +/*
>> + * Callers must bounds-check msg_id against desc->num_msgs first; 
>> this returns
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
>>   /*
>>    * Gates the AMD HSMP data plane against socket bring-up and teardown.
>> @@ -184,30 +244,37 @@ static int __hsmp_send_message(struct 
>> hsmp_socket *sock, struct hsmp_message *ms
>>   static int validate_message(struct hsmp_message *msg)
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
>>       /* msg_id is a reserved message ID */
>> -    if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_RSVD)
>> +    if (desc->type == HSMP_RSVD)
>>           return -ENOMSG;
>>       /*
>>        * num_args passed by user should match the num_args specified in
>>        * message description table.
>>        */
>> -    if (msg->num_args != hsmp_msg_desc_table[msg->msg_id].num_args)
>> +    if (msg->num_args != desc->num_args)
>>           return -EINVAL;
>>       /*
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
>>       return 0;
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
>>   static bool is_get_msg(struct hsmp_message *msg)
>>   {
>> -    if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_GET)
>> +    const struct hsmp_msg_desc *desc = get_msg_desc(msg->msg_id);
>> +
>> +    if (!desc)
>> +        return false;
>> +
>> +    if (desc->type == HSMP_GET)
>>           return true;
>> -    if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_SET_GET &&
>> +    if (desc->type == HSMP_SET_GET &&
>>           (msg->args[0] & CHECK_GET_BIT))
>>           return true;
>> @@ -354,6 +426,7 @@ static long hsmp_ioctl_msg(struct file *fp, 
>> unsigned long arg)
>>   {
>>       int __user *arguser = (int  __user *)arg;
>>       struct hsmp_message msg = { 0 };
>> +    const struct hsmp_msg_desc *desc;
>>       int ret;
>>       if (copy_struct_from_user(&msg, sizeof(msg), arguser, 
>> sizeof(struct hsmp_message)))
>> @@ -361,23 +434,28 @@ static long hsmp_ioctl_msg(struct file *fp, 
>> unsigned long arg)
>>       /*
>>        * Check msg_id is within the range of supported msg ids
>> -     * i.e within the array bounds of hsmp_msg_desc_table
>> +     * i.e within the array bounds of the platform's descriptor table
>>        */
>> -    if (msg.msg_id < HSMP_TEST || msg.msg_id >= HSMP_MSG_ID_MAX)
>> +    if (msg.msg_id < hsmp_pdev.desc->test_msg ||
>> +        msg.msg_id >= hsmp_pdev.desc->num_msgs)
>>           return -ENOMSG;
>>       /*
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
>> +    msg.msg_id = array_index_nospec(msg.msg_id, hsmp_pdev.desc- 
>> >num_msgs);
>> +
>> +    desc = get_msg_desc(msg.msg_id);
>> +    if (!desc || desc->type == HSMP_RSVD)
>> +        return -ENOMSG;
>>       switch (fp->f_mode & (FMODE_WRITE | FMODE_READ)) {
>>       case FMODE_WRITE:
>> @@ -410,7 +488,7 @@ static long hsmp_ioctl_msg(struct file *fp, 
>> unsigned long arg)
>>       if (ret)
>>           return ret;
>> -    if (hsmp_msg_desc_table[msg.msg_id].response_sz > 0) {
>> +    if (desc->response_sz > 0) {
>>           /* Copy results back to user for get/monitor commands */
>>           if (copy_to_user(arguser, &msg, sizeof(struct hsmp_message)))
>>               return -EFAULT;
>> @@ -687,9 +765,9 @@ int hsmp_cache_proto_ver(u16 sock_ind)
>>       struct hsmp_message msg = { 0 };
>>       int ret;
>> -    msg.msg_id    = HSMP_GET_PROTO_VER;
>> +    msg.msg_id    = hsmp_pdev.desc->proto_ver_msg;
>>       msg.sock_ind    = sock_ind;
>> -    msg.response_sz = 
>> hsmp_msg_desc_table[HSMP_GET_PROTO_VER].response_sz;
>> +    msg.response_sz    = get_msg_desc(msg.msg_id)->response_sz;
>>       ret = hsmp_send_message_locked(&msg);
>>       if (!ret)
>> @@ -735,6 +813,15 @@ EXPORT_SYMBOL_NS_GPL(hsmp_misc_deregister, 
>> "AMD_HSMP");
>>   struct hsmp_plat_device *get_hsmp_pdev(void)
>>   {
>> +    /*
>> +     * Both drivers call this before they bring any socket up, and 
>> the CPU
>> +     * this selects on is fixed long before either can load, so 
>> resolving
>> +     * the platform description here is enough to have it in place for
>> +     * every mailbox access and for the probe paths themselves.
>> +     */
>> +    if (is_client_platform())
>> +        hsmp_pdev.desc = &hsmp_desc_client;
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
>>   #define DRIVER_VERSION        "2.6"
> 
> You're adding new IOCTL's in patches 5 and 6, does this version need to 
> bump for userspace to discover?
> 
Yes - bumped to 2.7 in patch 5, where the first new ioctl appears, with 
a comment recording that this is what the version is for. Without it a 
tool has to issue the ioctl and treat -ENOTTY as "old driver", which is
awkward when the same errno can come from a wrong-sized struct.

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
> 
> Although these are the same for these 3 platforms, they might not be the 
> same for the follow on ones.  Have you seen the work that's going into 
> the AMD_PMF driver to build structs of register lists?  Take a look at 
> this.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers- 
> x86.git/commit/?h=review-ilpo- 
> next&id=e860e561926bf75e323d43fe59a9bf25d2ef33a3
> 
I think the series is already built the way it asks for. struct 
hsmp_mbaddr_info is the equivalent of amd_pmf_smu_regs: the offsets live 
in per-platform instances (hsmp_mbinfo_server, hsmp_mbinfo_client), 
reached through hsmp_pdev->desc->mbinfo, and the send path in 
__hsmp_send_message() reads them from there rather than from constants. 
Adding a part whose mailbox sits elsewhere means adding one 
hsmp_mbaddr_info and one descriptor; no conditional lands in the send path.

The one difference from PMF is how the instance is selected. PMF matches 
a PCI ID and hangs the struct off driver_data via PCI_DEVICE_DATA(); 
HSMP has no PCI device to match on, so get_hsmp_pdev() picks the 
descriptor from the CPU model instead.

On the concern behind the question: the client and server address sets 
are already separate structs even though two of the four values happen 
to coincide today, precisely so a follow-on part can differ without
disturbing either. If a later part moves the mailbox, it gets
its own hsmp_mbaddr_info and its own descriptor, and 
is_client_platform() splits into a per-family selector.

>> +
>> +/*
>> + * Family 1Ah client platforms use the Ryzen Master SMC (client) 
>> mailbox and
>> + * message set instead of the server HSMP interface:
>> + *
>> + *    Models 80h-87h    Medusa1
>> + *    Models 88h-8Fh    Olympic Ridge
>> + *    Models E0h-E3h    Medusa2
>> + *
>> + * They all share the SMN_HSMP_*_RM mailbox addresses above and the same
>> + * message set, so one predicate covers them and the two adjacent 
>> Model 8xh
>> + * ranges are tested as one.
>> + */
>> +static inline bool is_client_platform(void)
>> +{
>> +    return boot_cpu_data.x86 == 0x1A &&
>> +           ((boot_cpu_data.x86_model >= 0x80 && 
>> boot_cpu_data.x86_model <= 0x8F) ||
>> +        (boot_cpu_data.x86_model >= 0xE0 && boot_cpu_data.x86_model 
>> <= 0xE3));
>> +}
> 
> Rather than enumerating lists of CPU IDs, could you instead go off the 
> ACPI ID?  Or are these identical from server to client?
> 
They are identical - AMDI0097 on both, enumerating as AMDI0097:00 on the
client system here and on the server parts. So the ACPI ID cannot select
between the two message sets, which is why the model list is there.

What does differ is downstream of the ID and not usable as an dentifier:
the client device is at \_SB_.TELD with a bare _UID of "0" and no
_CRS/_DSD, where the server has the "IDXX" _UID form and both methods. I
would rather not infer the platform from a missing method, since absent
firmware objects are exactly the thing that varies between BIOS builds.
>> +
>>   struct hsmp_mbaddr_info {
>>       u32 base_addr;
>>       u32 msg_id_off;
>> @@ -40,6 +88,30 @@ struct hsmp_mbaddr_info {
>>       u32 size;
>>   };
>> +/*
>> + * Per-platform description of the mailbox and the message set behind 
>> it.
>> + * Resolved once from the running CPU and reached through hsmp_pdev- 
>> >desc, so
>> + * neither the message plumbing nor the probe paths have to re-derive 
>> which
>> + * platform they are on.
>> + *
>> + * @mbinfo:        fixed SMN mailbox addresses.  The ACPI path uses 
>> these
>> + *            only where firmware exposes no _CRS/_DSD to read them
>> + *            from, i.e. on the client.
>> + * @msg_desc:        message descriptor table, indexed by message ID.
>> + * @num_msgs:        number of entries in @msg_desc, and so the 
>> exclusive
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
>> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/ 
>> x86/amd/hsmp/plat.c
>> index e9b2b809c0f5..7423c98a7b3e 100644
>> --- a/drivers/platform/x86/amd/hsmp/plat.c
>> +++ b/drivers/platform/x86/amd/hsmp/plat.c
>> @@ -29,17 +29,6 @@
>>   #define DRIVER_NAME        "amd_hsmp"
>> -/*
>> - * To access specific HSMP mailbox register, s/w writes the SMN 
>> address of HSMP mailbox
>> - * register into the SMN_INDEX register, and reads/writes the 
>> SMN_DATA reg.
>> - * Below are required SMN address for HSMP Mailbox register offsets 
>> in SMU address space
>> - */
>> -#define SMN_HSMP_BASE        0x3B00000
>> -#define SMN_HSMP_MSG_ID        0x0010534
>> -#define SMN_HSMP_MSG_ID_F1A_M0H    0x0010934
>> -#define SMN_HSMP_MSG_RESP    0x0010980
>> -#define SMN_HSMP_MSG_DATA    0x00109E0
>> -
>>   static struct hsmp_plat_device *hsmp_pdev;
>>   static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
>> @@ -157,20 +146,18 @@ static int init_platform_device(struct device *dev)
>>           sock = &hsmp_pdev->sock[i];
>>           sock->sock_ind            = i;
>>           sock->dev            = dev;
>> -        sock->mbinfo.base_addr        = SMN_HSMP_BASE;
>>           sock->amd_hsmp_rdwr        = amd_hsmp_pci_rdwr;
>> +        sock->mbinfo            = *hsmp_pdev->desc->mbinfo;
>>           /*
>>            * This is a transitional change from non-ACPI to ACPI, only
>>            * family 0x1A, model 0x00 platform is supported for both 
>> ACPI and non-ACPI.
>> +         * It is the one part whose message-id register sits at a
>> +         * different offset on this path than the descriptor gives.
>>            */
>>           if (is_f1a_m0h())
>>               sock->mbinfo.msg_id_off    = SMN_HSMP_MSG_ID_F1A_M0H;
>> -        else
>> -            sock->mbinfo.msg_id_off    = SMN_HSMP_MSG_ID;
>> -        sock->mbinfo.msg_resp_off    = SMN_HSMP_MSG_RESP;
>> -        sock->mbinfo.msg_arg_off    = SMN_HSMP_MSG_DATA;
>>           sema_init(&sock->hsmp_sem, 1);
>>           /* Test the hsmp interface on each socket */
>> @@ -184,8 +171,18 @@ static int init_platform_device(struct device *dev)
>>           ret = hsmp_cache_proto_ver(i);
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
>> +            dev_warn(dev, "Interface version query unsupported on 
>> client SMU; continuing\n");
> 
> Shouldn't this be fatal?  Can we fix the F/W to follow the expected HSMP 
> driver behavior?
> 
Fixing the firmware is the right end state and I have raised it with the
SMU team; I will follow up on this thread when I have a commitment.

For what it is worth the failure is not a wrong answer, it is a missing
message: the client SMU rejects HSMP_CLIENT_GET_INTERFACE_VER (03h) with
0xFE, "invalid message". The mailbox itself is fine, which the test
message issued immediately before it demonstrates, and on the Model 80h
system here everything else answers with the query failing - SMU version
117.81.0, metric table version 5, table DRAM address 0x5DD8114C.
>>           }
>>           if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6) {
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

