Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010048.outbound.protection.outlook.com [40.93.198.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4E13D9051;
	Tue, 26 May 2026 09:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779788593; cv=fail; b=BWzNR8ZUL8MnzTpj6JCDO1uz+i9aBH+GlaMgY687LLlDM60vljmL85c5VYaqt90u3f2XSBlfD4jPc4k3Hcm0B5CNVM96JA67lj1UNPDHB48u769Ki1FDSfe4CnoKgcZjaISCcLfvwLvmN2oMBWunnb+KtfnAnjE1CIUAwVQ9je4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779788593; c=relaxed/simple;
	bh=+ydV1GalQYS6tpofhMV71s09Us09+cQxWoHy80Zio4M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jrA2VhG3aBRFZQXaSbafvYW4FDUCa9Xe7FmHaTtltsmghoDuO/XBhFGkGF6ciNQ8doXviQ1BXXwbPQBddYaXnPWpCSNKSWBgG7znu9VLDUtyGDxJPBJE7a5c6QkklYd4pL3uDSfD7ic0Hg4iSmi0LAdfhx9QoM1jyTdsYLU/dK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BIeJNhvd; arc=fail smtp.client-ip=40.93.198.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BIeJNhvd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G7uQQCVMNDdp/unM3hU/wBiijuoqhIKiyok0yA9ERi3Ij8yhCjKev0IZ2G4NMfihJVArkIv2CcV8+XV4WbIskYR3SdQ4lPIGUXE1T4zbWW6lMX4z81BwxZHq0h27pTcDPjxaK/Tzejcc2GreDmRn8pYVq8PeFkqaDxQXG4I93BZ8F3Km6M6e0TjwrFFw1H7ioUWmU+U107RvAq4d+/jA+1Sie2qotXBrZpLA3ChuRsm5Vm3JU9xafKlSo92evSi5hiUdGYdbt0hX9E24UDbDP5fbyJPl/6IxZYk6Pih7bOT4sQVwatCAOypADGz+gqgsQI3PuiQaHrAhASsqsIDZng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3usc5OXT04LqWjxaxkRN2VP8Go/6woLc2yPUSSmP6c=;
 b=CQjUAiiTX13UpRSpBy0tong4RyAQq/9ZmrVkzVpWhNQYfvmIYcdVucDHnhkrFTJ6uXVYiZ20mh1SDghbHGWbjLis2HR+2grPBkJnwS6RAwfTkQY3oUFpiJiMFeGk34OLd7LeLaidt4zqrlBMLelnlWnZWEzv17adL5cgWEI0flM32ASHh7ergkKnyfhI/XY/xQR2JK7tfWBDxDEye7x8WoQnkNkq4V3iJCWJo3ionlUT1F4VzT1VPwsNiEhyOW4+aPUbQuyMOsuSgxqOgY0lE+NklLBAIWf953elo342AXsV+g8tIc8L5W4ggtTfJT8Z5M/vCNfnmbOA3L21NDH3Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3usc5OXT04LqWjxaxkRN2VP8Go/6woLc2yPUSSmP6c=;
 b=BIeJNhvdY6XErtxFLwzU9heDMZ6QjklHHqTbTXHpsKf/QNOOSsJxNbveF66KS4aPHb+a8g/nLl+meB4hIgHA9jaNay9o4uu1/3xrpEBNZwkK3iplTu+HAa4TrOtzc7eZcca06PQi5uFm7FHGWokRHaEs43Kaoh6I0wn4vTZl4Ug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by IA1PR12MB6212.namprd12.prod.outlook.com (2603:10b6:208:3e4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 26 May
 2026 09:43:09 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 09:43:08 +0000
Message-ID: <df0ee66b-f1f5-4bec-8b8d-4dcd52181a9f@amd.com>
Date: Tue, 26 May 2026 15:13:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] platform/x86/amd/hsmp: Add
 IOCTL_GET_TELEMETRY_DATA for metric table reads
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Muralidhara M K <muralidhara.mk@amd.com>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
References: <20260517151211.415627-1-muralidhara.mk@amd.com>
 <20260517151211.415627-6-muralidhara.mk@amd.com>
 <cdab5033-0ad2-4ed8-ab19-cdac24c390da@linux.intel.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <cdab5033-0ad2-4ed8-ab19-cdac24c390da@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::11) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|IA1PR12MB6212:EE_
X-MS-Office365-Filtering-Correlation-Id: 005f8331-d89b-435b-44c2-08debb0b3187
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003|6133799003|11063799006|5023799004|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info:
	r1snVLujLu3pkWa5TM77qk1P1LI6rczXok94QftRTsuwDG7DVWKtrnzeQZjuVI9VHrsG8ISfS5U58ES2AvLjyJ1kaLpJSoTKgatAJD5ElJY+zJU+bLiegwb27W95CZgU1iijhq/xQ/2lf9zEJziTGCfehHiS7dKEco14kj+gJ8e+ZiIWCpKEnmnqmWTkhzKnD/Gw6ErWJIAwUwzm75eBoEwg5vCn0oac3bFzrvBMsz27qU8Vrdj/XTA8jnMXmqKx7ZIwbFnRrMjrgecQPIYoJR0AFzZX4HY1eziZt4TyjTzyIe5GoyJTa0I9HsmdyvxDS8Hhbpj5PKJpaSdP8bFlJt4dfWq3gTdsWfR/TSi1FeImZD74SMluUD8vRU/R5GR9CkvabmfpH8xqMT/U6GJMRjpXAMybDZqLXNzSd1YI0DlAHmnsmDLukC1WIzSXEEk3cCMEZc7JWRn9zboiZyhk4wv2eCiP8UtbFggwnsKl9867CwWg4aZVpAv0B4roMBo07GTx6t8MqG2pb8xN/O4UWLJ4r+scoGqmwaAaetoMuLhMAJ+nEI8xF20dyLITGe1djRzS4MiIltID6xCSr07EE4qq5g9gWTaOroMRIusMPIV/Egvx5eHCAXqx3WkN0s4qc2LnGKL7SeQwbTrAlDNJnUqETTfuq0oIRBYOjh/W6g+RVmdNbR8Jw1vEbtD0qocF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003)(6133799003)(11063799006)(5023799004)(3023799007)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVkyeUp0d0FnbnZsUGgxQTU2Z09hY1ZYc2NURjhHVkwwNzF2RzFjYWk3NERB?=
 =?utf-8?B?S0hwU0lYY1IrM3gwcU5CSm1YZER5V21DOHBha0IzSzZwRFQyTWhVTWZOazBz?=
 =?utf-8?B?d1NFMHpmSXUwZ2F6ZGxDamFqU2ZHRnBLb0hoOUhkRWh5RWgrTHYzQ2xYRnJE?=
 =?utf-8?B?SzhtaWprNmJFeTJzRU4rcCsyM2ZkWHp4TS85dXVJR1RKZnhYMDRicDZreGs4?=
 =?utf-8?B?WXllbFJlYm8zazRoa0poNm5ERlhDMndRTVNHSnpPUEVlYW5Na3U4eGxpMWxS?=
 =?utf-8?B?SzJCeThXVWh1N0NRMno2NzhFSjMybEIwR3E0WE9QMTZweEN0UGU3TCtjamE4?=
 =?utf-8?B?SFd2dEd0U2lVbzlWK2FybUh1dnE5KzUyN0JaOW13Qm4ySW1aV3FKM1Q0eFlQ?=
 =?utf-8?B?dW5QRkhYd2R3Rkc5RWlLOGcyTG5RTVJFUkhRbGJTREQ5T2JBTzhJc0RKTnM4?=
 =?utf-8?B?c21nNEh1VVF1Q1E4RmFSUVNnVExmZU9FeWZEWkRIMk8wN3h2bTIxc3ZCQ2FD?=
 =?utf-8?B?Um0zUFZFZSt5Q1kyYXJQNlE0RlZibmh0em13QW5rSkIwaDJKc05zalNsSFIy?=
 =?utf-8?B?MlBSUnJpeXFQRG8ySDVGZUpyeVRIUmNoVVEzVEFvL0ZpS2YzNVF0ZGQ4NXZy?=
 =?utf-8?B?YjlVUmpMdDF1ME16YjFNN1hlMkk0Y1lSWmhJRXE5YVRHTVh3NVFHdEovZDUv?=
 =?utf-8?B?Z2dlMVJsd3RTaklUTDFkaFFiZmhzN3NzWTF0ZDRxQnhhR3F3VXRJUzBkbk93?=
 =?utf-8?B?eXZGTzlOUGhuRGY3T0ZnWjB6YTBPNVpZY1lCK1UrTEZnTmdNMmNDUG1HdW9v?=
 =?utf-8?B?WGhlditZZkZVVXIwT0hSczF4VC80WStUV2N2K1dNTUF4WUl3MERuM0ZaTXJO?=
 =?utf-8?B?SmdHVzNUenZicFBpZXBxQXJuZ3RiOUpDbGpxRGJaSnlsM01aWi9lUEU3eXRT?=
 =?utf-8?B?ZzEwdjNha0dMOUQxbmhWU2VDSVRvZnczZHBYS203b3k0dmFVQkszN2xqK2d2?=
 =?utf-8?B?M3dCS1VGa09JR1lrSzF2WGNXbXpxRkRtSU1xRXJhZ3QzUGZjOHI5NFZTQlpz?=
 =?utf-8?B?b3piS3kyS0MxUVhxNFZVSXNlZGkwelVYNGZjSkUvUHRsbGZQdUExYklCNlR5?=
 =?utf-8?B?ZWZockY3eW9GcnRyNC9hQ3ptaDRPUis0NnFWam1WM1NGMGI2ejdyTXJjNHZC?=
 =?utf-8?B?VGJlMXNBNTV2c1EwU1cyUzZqMTFuek9PYjUyMGQzak1ic01EcEtRdE10MGZO?=
 =?utf-8?B?RlBwNWlTc3htamxaMVkrK0JRb2RodWhrOVAzcHQyY0VwSkx4ZEdCTUxMM05x?=
 =?utf-8?B?eFdtbGpOeFB2Z2JhNFovbHRHYkZxcE5CU2NHSVRNdW1BeFQ5c0RmRVZ6Q2tm?=
 =?utf-8?B?eGdUbzhTTy9meWNaK3UwUi8rd3BXRlpHYW1VdTVQRVlndm9QQnI1MGlJWUgy?=
 =?utf-8?B?L1ZabWxCVkN2b1NwMUt4c0NCUE9GUlZxbW83MG1vbU5zZUU5bkM2ZHdnbDlj?=
 =?utf-8?B?K3BkMWlEenpXNzltZXBmU0dXNGIyQ21JbzVIa21mME5CMDIrakdHaDhOdVRm?=
 =?utf-8?B?R1d5bGx1SmptRnJwdWo3VkJaejV1NXpXOUZZY0VQOUZhRGI5SGg1eFlLSlE2?=
 =?utf-8?B?YnNpOEtKUTUyZ1FtREZNWkhPeCs4KzQwb2g4VXhwek9SUlRSbklZM2pMc3VQ?=
 =?utf-8?B?ekVlbDZQUFU0c3c5SUl0MmZRRS9LWnQ5OFB5SS9vZjFteE5HTFB5akFKakJJ?=
 =?utf-8?B?UDZhaS8xdUUwc2N0RTBXQitUZkcwS0lOMmp5MHZobk5XUHNPaTlSMGs0TWpO?=
 =?utf-8?B?TURrTk9LenFOWjRPWksvZGNBQ0tqbU85OVRNZlpYaHR5UXlQRVdicnUwRExL?=
 =?utf-8?B?SjJHUXIzTFpIVHRPUUhGcHlkanIvWEtRL2hEUTBDSzZVcmJpNHZpUlVhZ0V2?=
 =?utf-8?B?WEd4VXF6MjV6ODJRWGw0VzErTFlGVHplNU11MkVwZ0plT2FMRnlhRUViRW1G?=
 =?utf-8?B?UExCRGtBTkxnOWVjVWE1eGIwenRmb0hpU09YWHdrZ1Q1SDVxTVR1TWF4VDZP?=
 =?utf-8?B?c1FRcGRMT1F0UUY2QzY1cStyQkYxRCtETXk4a083Q1ZXT29mdk5HaDBwUGlU?=
 =?utf-8?B?aXVuemtIVHlCU0hkOU1mMUZ3OS80aWdSVVJTQkRQWVJBdDhYeTlUSTdSOXUv?=
 =?utf-8?B?ZjlFb2dnejF0S1hueU5xcEt2djltUmwrdnZBNGhxNmZkOTBHTDR4clpoeC84?=
 =?utf-8?B?dGNFVnlEbUhZeit3aWZ4S24zc0o3TnBDNmdKMk1QUHo4eVJ1YTRpMjFlQnVt?=
 =?utf-8?B?TFJSVWxKNVJBMStmZVAwdnlLaDJTOVhEbVNtcFNIdkgwK25ieGttQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 005f8331-d89b-435b-44c2-08debb0b3187
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 09:43:08.7599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SF6yrWtmFI+u2tHj8xMepizNA1sFFnsZJj7xBXWK8guALAmaYD9dmScuznbDtmt0jaSsdFHJg4Vjk5VJQbXEMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6212



On 5/22/2026 4:34 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Sun, 17 May 2026, Muralidhara M K wrote:
> 
>> The metric table for Family 1Ah Model 50h-5Fh
>> (struct hsmp_metric_table_zen6) is approximately 13 KB, exceeding the
>> PAGE_SIZE (4 KB) cap imposed on the standard sysfs binary attribute
>> read path.  Rather than introduce new sysfs infrastructure to support
>> binary attributes larger than PAGE_SIZE, expose the metric table
>> through the existing HSMP character device using a new ioctl.
>>
>> Add struct hsmp_telemetry_data and HSMP_IOCTL_GET_TELEMETRY_DATA to
>> the UAPI header.  The request structure carries the socket index, the
>> required buffer size and a __u64-encoded user pointer to the
>> destination buffer, so the same layout works for 32-bit and 64-bit
>> callers.  Fields are ordered with the __u64 user pointer first so all
>> members fall on their natural alignment under #pragma pack(4), giving
>> a tight 16-byte struct with no implicit padding; the trailing
>> reserved __u16 is documented as "set to zero" so future kernels can
>> attach meaning to it.  Userspace sizes its buffer using the matching
>> UAPI metric table struct (hsmp_metric_table or hsmp_metric_table_zen6)
>> for the running platform; sizes that disagree with the firmware-
>> reported table size are rejected with -EINVAL so a short copy can
>> never silently truncate the snapshot.
>>
>> Dispatch hsmp_ioctl() on the ioctl command, route HSMP_IOCTL_CMD to
>> the existing message handler (factored out as hsmp_ioctl_msg()) and
>> HSMP_IOCTL_GET_TELEMETRY_DATA to a new hsmp_ioctl_get_telemetry()
>> helper.  The new helper validates the request, allocates a kernel
>> bounce buffer with kvmalloc() so it can hold the full table even
>> when it exceeds a single page (zeroing is skipped because the buffer
>> is overwritten in full by memcpy_fromio()), calls hsmp_metric_tbl_read()
>> to refresh and copy the table from the SMU DRAM region (under the
>> per-socket mutex introduced in a follow-up patch), and copies the
>> table to userspace.  Unknown ioctl commands now return -ENOTTY instead
>> of falling through.
>>
>> Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
>> Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
>> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
>> ---
>> Changes:
>> v1->v2: New patch based on bin sysfs
>> v2->v3: Replace with IOCTL method
>>
>>   arch/x86/include/uapi/asm/amd_hsmp.h | 43 ++++++++++++++
>>   drivers/platform/x86/amd/hsmp/hsmp.c | 85 +++++++++++++++++++++++++++-
>>   2 files changed, 127 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
>> index b86bbc929395..3d085298dd52 100644
>> --- a/arch/x86/include/uapi/asm/amd_hsmp.h
>> +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
>> @@ -664,6 +664,40 @@ struct hsmp_metric_table_zen6 {
>>        struct hsmp_metric_table_zen6_ccd ccd[F1A_M50_M5F_MAX_CCD];
>>   };
>>
>> +/**
>> + * struct hsmp_telemetry_data - Request descriptor for HSMP telemetry IOCTL
>> + * @buf:       Input. Userspace pointer (encoded as __u64 to keep the layout
>> + *             stable between 32-bit and 64-bit callers) to the destination
>> + *             buffer that receives the metric table.
>> + * @size:      Input. Size in bytes of the buffer pointed to by @buf.  Must
>> + *             match the firmware-reported metric table size for the running
>> + *             HSMP protocol version (see below); any other value results in
>> + *             -EINVAL.  The kernel does not write this field back.
>> + * @sock_ind:  Input. Socket index from which the metric table is read.
>> + * @reserved:  Reserved for future use.  Callers should set this to zero;
>> + *             future kernels may begin interpreting the field, so passing
>> + *             a non-zero value today is not forwards compatible.
>> + *
>> + * Placing @buf first lets all fields fall on their natural alignment under
>> + * the surrounding #pragma pack(4), so the struct is a tight 16 bytes with
>> + * the same wire layout on 32-bit and 64-bit userspace.
>> + *
>> + * The exact metric table layout depends on the HSMP protocol version reported
>> + * by the firmware:
>> + *   - Protocol version 6 -> struct hsmp_metric_table
>> + *   - Protocol version 7 -> struct hsmp_metric_table_zen6
>> + *
>> + * Userspace queries the protocol version (e.g. via the protocol_version sysfs
>> + * attribute) and uses sizeof() on the matching UAPI structure for both @size
>> + * and the allocation backing @buf.
>> + */
>> +struct hsmp_telemetry_data {
>> +     __u64   buf;
>> +     __u32   size;
>> +     __u16   sock_ind;
>> +     __u16   reserved;
>> +};
>> +
>>   /* Reset to default packing */
>>   #pragma pack()
>>
>> @@ -671,4 +705,13 @@ struct hsmp_metric_table_zen6 {
>>   #define HSMP_BASE_IOCTL_NR   0xF8
>>   #define HSMP_IOCTL_CMD               _IOWR(HSMP_BASE_IOCTL_NR, 0, struct hsmp_message)
>>
>> +/*
>> + * Fetch the firmware metric (telemetry) table for a given socket via the
>> + * HSMP character device.  This avoids the PAGE_SIZE limitation of the
>> + * sysfs binary attribute path for tables larger than one page (such as the
>> + * ~13 KB hsmp_metric_table_zen6 used on Family 1Ah Model 50h-5Fh).
>> + */
>> +#define HSMP_IOCTL_GET_TELEMETRY_DATA \
>> +     _IOWR(HSMP_BASE_IOCTL_NR, 1, struct hsmp_telemetry_data)
>> +
>>   #endif /*_ASM_X86_AMD_HSMP_H_*/
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
>> index cf9392f99298..3a02d683dea0 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
>> @@ -13,7 +13,9 @@
>>   #include <linux/delay.h>
>>   #include <linux/device.h>
>>   #include <linux/semaphore.h>
>> +#include <linux/slab.h>
>>   #include <linux/sysfs.h>
>> +#include <linux/uaccess.h>
>>
>>   #include "hsmp.h"
>>
>> @@ -287,7 +289,7 @@ static bool is_get_msg(struct hsmp_message *msg)
>>        return false;
>>   }
>>
>> -long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>> +static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
>>   {
>>        int __user *arguser = (int  __user *)arg;
>>        struct hsmp_message msg = { 0 };
>> @@ -343,6 +345,87 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>>        return 0;
>>   }
>>
>> +/*
>> + * Fetch the firmware metric (telemetry) table for the requested socket and
>> + * copy it to the userspace buffer described by the request.
>> + *
>> + * The metric table size is variable across HSMP protocol versions and on
>> + * Family 1Ah Model 50h-5Fh exceeds PAGE_SIZE.  Userspace must therefore
>> + * supply a buffer at least the firmware-reported size in bytes.
>> + */
>> +static long hsmp_ioctl_get_telemetry(struct file *fp, unsigned long arg)
>> +{
>> +     void __user *arguser = (void __user *)arg;
>> +     struct hsmp_telemetry_data req;
>> +     struct hsmp_socket *sock;
>> +     void __user *user_buf;
>> +     size_t tbl_size;
>> +     void *kbuf;
>> +     int ret;
>> +
>> +     /* Telemetry data is read-only; require read access on the fd. */
>> +     if (!(fp->f_mode & FMODE_READ))
>> +             return -EPERM;
>> +
>> +     if (copy_from_user(&req, arguser, sizeof(req)))
>> +             return -EFAULT;
>> +
>> +     if (!hsmp_pdev.sock || req.sock_ind >= hsmp_pdev.num_sockets)
> 
> Sashiko warns userspace can use this as a speculation device so it needs
> to be protected.
> 
Will check.

> Please also address the req.reserved check mentioned by it with -EINVAL so
> it can actually be used safely in future.
Thanks. I will add a check for "req.reserved"
> 
>> +             return -ENODEV;
>> +
>> +     tbl_size = hsmp_pdev.hsmp_table_size;
>> +     if (!tbl_size)
>> +             return -ENODEV;
>> +
>> +     /*
>> +      * Userspace must size its buffer using the appropriate UAPI metric
>> +      * table struct for the running protocol version.  Reject mismatched
>> +      * sizes so we never silently truncate or short-write.
>> +      */
>> +     if (req.size != tbl_size)
>> +             return -EINVAL;
>> +
>> +     sock = &hsmp_pdev.sock[req.sock_ind];
>> +     if (!sock->metric_tbl_addr)
>> +             return -ENODEV;
>> +
>> +     user_buf = u64_to_user_ptr(req.buf);
>> +
>> +     /*
>> +      * The bounce buffer is overwritten in full by memcpy_fromio() inside
>> +      * hsmp_metric_tbl_read(); use kvmalloc() to avoid the zeroing cost of
>> +      * kvzalloc() on the ~13 KB allocation done on every ioctl call.
>> +      */
>> +     kbuf = kvmalloc(tbl_size, GFP_KERNEL);
>> +     if (!kbuf)
>> +             return -ENOMEM;
>> +
>> +     ret = hsmp_metric_tbl_read(sock, kbuf, tbl_size);
>> +     if (ret < 0)
>> +             goto out;
>> +
>> +     if (copy_to_user(user_buf, kbuf, tbl_size))
>> +             ret = -EFAULT;
>> +     else
>> +             ret = 0;
>> +
>> +out:
>> +     kvfree(kbuf);
>> +     return ret;
>> +}
>> +
>> +long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>> +{
>> +     switch (cmd) {
>> +     case HSMP_IOCTL_CMD:
>> +             return hsmp_ioctl_msg(fp, arg);
>> +     case HSMP_IOCTL_GET_TELEMETRY_DATA:
>> +             return hsmp_ioctl_get_telemetry(fp, arg);
>> +     default:
>> +             return -ENOTTY;
>> +     }
>> +}
>> +
>>   ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
>>   {
>>        struct hsmp_message msg = { 0 };
>>
> 
> --
>   i.
> 

