Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011062.outbound.protection.outlook.com [52.101.62.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7AA27466A;
	Sat, 19 Sep 2026 05:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789795861; cv=fail; b=U+VBqFL8OQCqVEhE565kSUN770hzX4v4t9zxCWvsdl6lKECGO78KOE3dSuHy63fHN8K2TBDtYo/IJFbrpiONkvcnSCyozxQ6z2t7h9qXXYN4eSRDatcJViVA1QHIuQ+3AoKZNkzrwVlE4A7Iy2eiRMDUNRZNs3lpm5ZRZeAFaSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789795861; c=relaxed/simple;
	bh=IZBmF6VyWYLK+r4NTGrurNEeQBxXHS3m7hntnt8dOPo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kLKUPZBec0sK1oTPQArqptk+un+E9cuVPwz+j9S29R6A9KnJ+95JRx8MBFg1QLRlwDx7kLcVoSIp4t7IQN1gbx5hF+GoB4wtitZzX3X67NYt1YrLV9f3ls/M88ubm7SPZOsLPMHvd1BMYxFhxL0jCDFDUIxM35Y56h3vGgEu8H8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vzPsfaQJ; arc=fail smtp.client-ip=52.101.62.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vzPsfaQJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSKW92C9PQX7OCNbKpxjCC6+zVENrgdIdCb7xNvpPj7OuEEkcYQvg2CyKQoANdZjuZPrLNJ28I6wsg6T4mh/mtreNI2MbJ+KVEq7//C8xgrHhn48ylIXD/lG9ICI+GL9CmFVxj/hFQmnIVZ7uN/y82qgH0RUysU4vqFmuLn6BbFd7H00GQ6ZUMwyX5Hq0UGjEudJHS6ehsPCKOz1HU+VexT+xA9ULyZJpD9pz3M5M9YtSpGBFnMkFDca8C4tLFF6Lxr+HOighR51LmzlFOPm2n0WJcEGy0Y0WrHy1B0WPgkYW2KIwAuwu4fvvsNSpAmyWejJRtXr6n8JOQ0GfBfISg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GTtzp1YhtPDwS/nOMdwQaJzryZz+VcDUjnwvtyFc5S8=;
 b=UvQJsfJluwYR8vciLpj3l0jqwnPm1p6Ibzt/nxMqVIvIDWUMDCI0W7CNtcvk58nrB1cLtUgRQlJWk+38tF0/4m9wh1VnCMbnRvOfKnJGmDdd8Bo1nq7wl79ep+itE0ODrWhD84UyhjSZNKDAPgwKCi5SDD/i7ctmSKfL0GgKq6WwxqFESoYcZDQ5gklU8NfXbaj0E8zFhvjUMSe2DpD4CpsjB8+Q7fMoYo9rZWhSHXXSrrxXuknPa4bNyB7I1d15RwUDrXDT87JQro4X2lyqB5NKV7dN2r+ib4QEdTbczsx/joV4vqXbqprZM/ZMtFo8tQ84chSl2FLrI4HBHfL82w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GTtzp1YhtPDwS/nOMdwQaJzryZz+VcDUjnwvtyFc5S8=;
 b=vzPsfaQJ2gfE9g2EzzFvF8V1gPoEy0deJc64BGlyRtGHT0GHQydE0OL30qE/nXtUsXbQmHiClTMfGCvAJaHW8C1bD6JOARB8zRxcpcg68v8LS+Om6dyx6eJQaFQwpyVfGuFjMex+rsFYpDeLRMejql38yHTZeD3FlGNBbsjSWBA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by MN2PR12MB4359.namprd12.prod.outlook.com (2603:10b6:208:265::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Sat, 19 Sep
 2026 05:30:08 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%5]) with mapi id 15.21.0406.007; Sat, 19 Sep 2026
 05:30:07 +0000
Message-ID: <bcc5d85c-9f67-4b97-a186-924b383e42a7@amd.com>
Date: Sat, 19 Sep 2026 11:00:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] platform/x86/amd/hsmp: Add ACPI client support for
 Family 1Ah
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Muralidhara M K <muralidhara.mk@amd.com>
Cc: Mario.Limonciello@amd.com, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Mario Limonciello <superm1@kernel.org>
References: <20260901045134.2833282-1-muralidhara.mk@amd.com>
 <20260901045134.2833282-4-muralidhara.mk@amd.com>
 <f22e907f-254d-032a-0350-7f0bb42c0a18@linux.intel.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <f22e907f-254d-032a-0350-7f0bb42c0a18@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0031.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::16) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|MN2PR12MB4359:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e306a2c-6074-442e-fa35-08df160f1099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|11063799006|56012099006|4143699003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	W3vJzlh8hoyOsat4JYrgzfgvgnzERq9Mwe40sUl1ns3yHDYhJvTOI7owsYnOTRUFmcyqnGz8S0DSN+XTEb2BOgnU9E1HulrbhvjinHjeEty6cv28wyJtw+YSzooFWwLglewgzU7POrEZcTCG2heRXGTc3YssdP99Ps6YkVmR5B+kUhxnp+8zlp8apA59T2XMGZKG9qlNO4l1pmUqsBb+/hRzL9sJO07zLyCW3l2Y/wsDfAt8ojwF7pfXP7HimsNlD5qLR8UQS+MP9ESC5egajVpS+BYvkRuPLT8qFZS14xzd14Qde1+AhaUlmp1Ib73t0vSBoMCsqy4PUM+7ZsP17NrRrb8QrAE+8fFwcZwRZnpYkhn8PYo0gfZ1LwhAYLSRJ34NOLH+YDO60lM5tK2unI5lKulS8gR8vIf4RmA0cKvL6l7rc2WJKkj4lsMg94x18RbHxYqzvifO2/yx8uWNZAj8YuyoeM/Ur972brJUuaUvg3912k00Ry4Cb9m/ESPVxKs/GZqqAGbhJjXgq6V+BuFS+04Oh6FbRs7XAQGIJNBwiQRW5lxctLx4ZKnnfl+J4WRXsDLHs+x+QYYlZwrCsfomFfgjKl/nr5n9YZVAqQYi1qBmY4PIECuHlukuoF4uv6j7KlB7WKHahAlQRieHV9+xevetSB28RszibkuvJJo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(11063799006)(56012099006)(4143699003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjUxYngveVI2V2JxbGZZbVdzSXE3TlRtdkVzQXBjN3ZyKzFkOTN6M3FMV0Vr?=
 =?utf-8?B?SFlDRy9KQ1I2UmQ3TEc2Nng0a0ZWdVJzSjlRaEZyL056ZTlZUDlYOTR5cjFJ?=
 =?utf-8?B?MjdPWWgrcVZpZ2ljNno1VGVQbFJvV2J3WTlFMmFMMmtDOFl2ZHRaNHdwelBK?=
 =?utf-8?B?N3hlODZzZWJGY28vaW1neWdWUVlTYzFiakhsWk05dm5FdGQva0x5enBRR2ln?=
 =?utf-8?B?VUsyQkJCQWxLYzJlOENVSzVlSFJDM2ZqKzI1bHNib3o0UGZMcmdTRHB6M0l4?=
 =?utf-8?B?eWdUUzVpVmQzMkVFOEhzci9DL2lCZGErM0Q5UXlrR2tsaGVIRGUvNlJ0d2pt?=
 =?utf-8?B?OFJqUzJXOEEzQkZucGk0L2hyVVFWRTAwVjBHelV6QWhFL1RlV3FiUnZZR1Vr?=
 =?utf-8?B?R0ZTUW5ySkFiV1h6b0ZRRzJYMDVnQkxKZk54VmhCOGM2OUZIbkVsM2hUeEZG?=
 =?utf-8?B?ZWdjbGJJN3NYbzhLam52T1p2MTBxTlJwcFVUNDZ4VGdwTG5CVnVWLytOQVVK?=
 =?utf-8?B?R21WN2FtYityYUIwMFVUYTZzZ3BSaHUxYlVzck12SStyTWUvNnRmVjJwdzFM?=
 =?utf-8?B?cEM3cmZpUlRzbEEySVBZT0c3anJ6ZlRmbnFGZlpqOFBvNXYrZktKT29mY0pp?=
 =?utf-8?B?emVOYWxqb21PRWlxLzVwWUxzUkxDQXBsbTY5MWlONnZ5WkZkL1pUa2VGbjBD?=
 =?utf-8?B?aEpLbW5BUTRlTnZhNE5xR3pnVndtdWFqYzVxM1JIY216L2xqa1lFVVdHOTlh?=
 =?utf-8?B?dHA5bFBIOWV2UHB3U1YxZ04zQmhoZEpvNjkxek5pNHRWWlppNFRLVklVK0JU?=
 =?utf-8?B?SlRyNzQ3RU5xOXhVbytZQmhqVUFjN1RYaU9KemUreHU0YUZnNUR4MUxUdVhY?=
 =?utf-8?B?d3QzeTY2RzdTak1CaXhyVmpLQm8wQ2pJenRHMUpxRGNlSkVYeXphOFRIZ0NK?=
 =?utf-8?B?WHRqZVpackZPUkFVNS9qTXk0SUVXTVZTSXFMbWJ5aXR1YUxBUmEwaFY3Wmp4?=
 =?utf-8?B?R3V0Y1NkVmNMVjBFdHpzNG9Pdi8yaHc3NkRTRXNhdzNUVDJIaHZ4Q0YySlgx?=
 =?utf-8?B?K2MvVnkvdWhOWDhRZlgzcUtENVJWNjZYT21RUVVHOHJyd3djNWNzM2Y3SmVs?=
 =?utf-8?B?U1ozMnZ6Q2hrL3VwaE8yUmdodkthMkdVWUFEekNvTjM1RGk4TVE3YVlkdFVQ?=
 =?utf-8?B?OTd4Q2prL1ltaGRMNnlweEw0Vkc2RkU4UDcwdytSdG5FMlNpbWNHRHNUZWht?=
 =?utf-8?B?WnBmaTcwN05aY09EczlTdnJUaXAxWk9IRjdEQVRRWVFOYTNiZU5oVjhaR1NQ?=
 =?utf-8?B?Z01hU3JOeUhnaWg0Y0FwWFQyazNGemtsMWxSd3Blak9EN1AvUXVnZXJIT2xz?=
 =?utf-8?B?WnpJbHlUbDB2Z3NSTTFhZVVIT1NDcExzUFMzY2ZuTnhGQ1J1SU8zSHNjZTV3?=
 =?utf-8?B?aTdLMUh4MlRPWFowR3RmR01seGRrRGF2cmZGMXlZTlJjaEZxZmNGQWtzN1dJ?=
 =?utf-8?B?aUtYQThjWmhYQnkwc0VDZDd2NG9vSVg4S00vTTA1OTIySWxxUXdPMDE0aGpO?=
 =?utf-8?B?b1U0THZTZC9hSGNjdGdUS2Q3bHdxWUpxVmM4MmpXQkNRZDA1SW9ETFE5VnUy?=
 =?utf-8?B?RFhzM1UvU201dFUwcXFJNmhEZVVYa2Vzc1I1b1RqYWtJb2pxQzQxcjY0bnk0?=
 =?utf-8?B?cURjb1A5cTNOYk9Nayt4L1Nha3NjbG9OeFlPbnJ1OEdGdEYyMGlSV09EN09E?=
 =?utf-8?B?aVpocEwyajNEdTFaRi8zNGdROGxEUVVCa1JNWHphWmVxenBvOWlWVDNENWxQ?=
 =?utf-8?B?RmpqVmRZMnpuSDcxNS9KQ1NzUllUa3FHQWZWQVdQdG85RUhRVHZiK3piVnhW?=
 =?utf-8?B?dnhacHBQaHlPaXl3c204eVRzaVJNcXV5NXNyMmhOWGVjUHFDTU5FYnNGL0dw?=
 =?utf-8?B?UWtNV2hJaDg2YXdzSlF2bVJ0RTRtb2Q4cnJ4T3VJQytYVFVjM2UzdWRCdldy?=
 =?utf-8?B?ai9ZeGE0OHlzRlpHMEpWcjdCbU9XZlIxTDZ6emh0TE9uT2dEcDZ4RUwyd2gz?=
 =?utf-8?B?S3JuYndrcGhRNzVGYVAyU0JwQURzdFlmK1pod0FQTERCa3lWdTNVQ0l4a0hG?=
 =?utf-8?B?R1MzbndFcXhlcGlCZEJhVmNFWlV5RDUyZndhQ0ZieDNxZm54bml5eS8ra3pt?=
 =?utf-8?B?eWJnb3ptWWNMUjdGS25RNVo4MjJzK2U3M29QWm1Iak5kYmVOQVp3N211aVhI?=
 =?utf-8?B?UDFBVHczeWJxd0hpV3Ftcy9yaWFmbEk3T3FVN2NHcmp3Ry8rTlZLa0MxdlQ2?=
 =?utf-8?Q?Bck70Ukn8r4ap0ZMbN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e306a2c-6074-442e-fa35-08df160f1099
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2026 05:30:07.4985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QTlZ69Tdx/yY0DaqasC9hu5itc4MuioFZHJv37QGEO2enM3mmhGLCJXaZv7S5TcNhxKWTokLB/drY8O0v0doCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4359



On 9/18/2026 5:09 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Tue, 1 Sep 2026, Muralidhara M K wrote:
> 
>> The ACPI HSMP device (HID AMDI0097) on the Family 1Ah client platforms
>> (Models 80h-8Fh and E0h-E3h) describes its mailbox the same way server
>> platforms already do, via _CRS/_DSD, so hsmp_parse_acpi_table() and
>> hsmp_get_uid() need no client-specific handling.
>>
>> Client platforms don't report a server protocol version, so also gate
>> the metric table DRAM base lookup on is_client_platform() alongside
>> the existing proto_ver check, so client platforms get their metric
>> table base initialized too.
>>
>> hsmp_pdev->proto_ver holds the Ryzen Master SMC interface version on
>> client platforms, a separate numbering space from the server protocol
>> versions in enum hsmp_proto_versions, so gate on it using its own
>> RYZEN_MASTER_PROTO_VER1 rather than assuming every client platform is
>> ready for the metric table lookup regardless of interface version.
>>
>> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
>> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> ---
>>   arch/x86/include/uapi/asm/amd_hsmp.h | 9 +++++++++
>>   drivers/platform/x86/amd/hsmp/acpi.c | 3 ++-
>>   2 files changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
>> index 00ca7855ca00..3e1b7cbe0f04 100644
>> --- a/arch/x86/include/uapi/asm/amd_hsmp.h
>> +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
>> @@ -95,6 +95,15 @@ enum hsmp_proto_versions {
>>        HSMP_PROTO_VER7
>>   };
>>
>> +/*
>> + * The Ryzen Master SMC interface versions its own way, reported by
>> + * HSMP_CLIENT_GET_INTERFACE_VER. It is a separate numbering space from
>> + * enum hsmp_proto_versions above, which only applies to the server set.
>> + */
>> +enum ryzen_master_proto_versions {
>> +     RYZEN_MASTER_PROTO_VER1 = 1,
>> +};
>> +
>>   struct hsmp_msg_desc {
>>        int num_args;
>>        int response_sz;
>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
>> index 8257cd1da48e..43d746546536 100644
>> --- a/drivers/platform/x86/amd/hsmp/acpi.c
>> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
>> @@ -557,7 +557,8 @@ static int init_acpi(struct device *dev)
>>                return ret;
>>        }
>>
>> -     if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
>> +     if ((is_client_platform() && hsmp_pdev->proto_ver >= RYZEN_MASTER_PROTO_VER1) ||
>> +         hsmp_pdev->proto_ver >= HSMP_PROTO_VER6) {
>>                ret = hsmp_get_tbl_dram_base(sock_ind);
>>                if (ret)
>>                        dev_info(dev, "Failed to init metric table\n");
>>
> 
> Somehow it feels like the patches are in wrong order if you add this
> condition last in the series?
> 
> I didn't spend my time on figuring every out but the key question is if
> one builds kernel with only patches 1 or 1+2 applied, does something break
> which is fixed only after this patch 3 is applied?
> 
Understood. Patch 2 and Patch 3 aren't two independently-useful changes, 
they're two halves of one feature, Will Squash them.
> --
>   i.
> 

