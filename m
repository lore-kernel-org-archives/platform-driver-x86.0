Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012061.outbound.protection.outlook.com [52.101.48.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601143C585B;
	Tue, 26 May 2026 09:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779787281; cv=fail; b=je+eCreqMl8BpCcQcqFj8G2VGp5b8Qlr9MrmKQVGuiURmeOvqB6X9sWMbqk/bMHuAnI/SJ9+iTEDFWy6cshAJV7jGizQCWIbkxbda3qPtTqdfMB3Wxj7OihlrVcS3q+3U5SpSA5fKYFY5/DRyoux3GKJ8i2iSxcPXsRl9txHOGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779787281; c=relaxed/simple;
	bh=Jyin6rxwRDIuBVIwZtC80HYUSLNKEv7GplGWOUyizB4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OWa7+6phLJeRFNkbx4vdPP1WjczQWzx9t0vTJNXDQbQPV2oMb57H0rbB63nvLdD0LXr621Uk7rrxfKbE64ESr/pjR/Noej2GTJTvSKp9vcQ1ZhDPM99jJzFC18SeAI7A2CluV6sjFjRi3Bq6lTiZJYMrivpXYWqL3EZjolwncNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=M24bo3wG; arc=fail smtp.client-ip=52.101.48.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="M24bo3wG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/0tCNd4PVxocgxhLoafWF/fuwAZJ/OXG0YXjD432OoiAuyh6gz4ei+j2RJmHcWQUwzozVED2k7RU230E+0QIq4KPXJ5jS2A78kVb3GUAYkVG2yQeZXmGsCS/PnDxCM4cNT7b8h5xhdB1nwm6BMNxtwHA7p3ZphI+e+icZzzRj333V/ofJ/cL8G894joXzIBwCVLaLRe0jdhiI5+I/UuCUaqEZsNeuhXF3RbLxVw+PnQvrYEoynPKgOoUj8+NSYxTV8KJ5kDX3KrW//Jzt8Ca77DXrFDdXGNWmXVG/b5raFraxsIScga6Qd1bR8I/JcwgjyAP0zmcLrY0ghRHrc+0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3xbXTRrWp5iZlsmBqpz69n5EFvDfUbIVP9+1W2pEt3s=;
 b=Jw5KaHsZidXTrsDUCljjf4pf7NJ/RIHQuBu7k9/8mvzOeVKzTrQJf8mry73dWgSVOdhzUV8NGabqr1qIQufhc3uqzP+WHlEQHttjVKl05BD+HEGXrXPzrDRfgUdrX7uR0YUY+sDzEOrRZ+Ttsk223YwQ0E65UShd56TB5F1zbYIOZDBev1CAaGcl8MEkhM8WQEfo7+uJSMPU0gehv/9xXMtDzDW47eS7XjHgwsoMyO+uJOB/OFAcO0hasMW3FHAmBETndwKURKL7oul1wOJtNQ15G7SY8q6rlmn4YPllz4nZzvgqCNoBSQm60kXX5MZfnqCKbKor+gM3diqFaoR2hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xbXTRrWp5iZlsmBqpz69n5EFvDfUbIVP9+1W2pEt3s=;
 b=M24bo3wGi+iGhSRzcEBQKUlo2q2fp2Il1SXj+bcWOIUg/FUL9N66bln8xjH5Bq+XsB/wssu5o7fdjxLM8jh0XMMlYWAjGVpJkxklYN7LBMxJZ9g6vsYl8mInFXptWpNTB3B2I/LMQTwhScBGlPXVdRAmXvb+rT8PslgKTSEuY4A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by LV2PR12MB5845.namprd12.prod.outlook.com (2603:10b6:408:176::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 09:21:14 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 09:21:13 +0000
Message-ID: <0f4e6850-d855-4457-98b5-d1c940f5ec74@amd.com>
Date: Tue, 26 May 2026 14:51:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] platform/x86/amd/hsmp: Add new HSMP messages for
 Family 1Ah, Model 50h-5Fh
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Muralidhara M K <muralidhara.mk@amd.com>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Suma Hegde <suma.hegde@amd.com>,
 Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
References: <20260517151211.415627-1-muralidhara.mk@amd.com>
 <20260517151211.415627-2-muralidhara.mk@amd.com>
 <300f46bd-0edb-5889-1845-f4d718ff77e6@linux.intel.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <300f46bd-0edb-5889-1845-f4d718ff77e6@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0075.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::16) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|LV2PR12MB5845:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e8e1a3e-7bbc-429b-0d5c-08debb0821a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|3023799007|22082099003|56012099003|18002099003|11063799006|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	Tn+HI5ogNDp2aF/ZoWZcu19qLxf62MAlg3lzxZSgKRGF0qjNm9LnWmMQt9mEe/6WoFlmKg4+z5xPkCjOVW0hSfih/6fcWWXICKbbabEzyoRgP96fm+iUwwbJ77MvWqEV80uFQ0GhrHvejcivrpG5teanD0w5iqxwX4IAAG4vDG1b+S3b8ALn7U/pkQusFGo/BCMZ/KSHw0toEqi2TPggs67wrQaPgOkar1Hhj9c/HkXAW6Uf3ryQMGrS8N05gTcnmPy4BBV9pdC5BPIfubOaOC+LjSQMkV2+dwymM8Q+P++IW5yLhhCnM3M7Uadc3WYSabyhJSmKoSGwmWslFKfkbebyso1APvy43qlzXXhqfmf95k6ZIv1j0fl14YlWRHhQBaRMchEZdr2eDdUvwrCw8/xj3h3GEJfSltRLfyhbOPOjjgzytx2u8/7NlPJbr83UYRP4srBSonGTWai0kU8MCU6JmjVPAPRym8l/yCIoJb1V+NZLIoP4TwWmHsSjjrLCJroNEKHaDL4wCKfPbsSaDcmzuF4AqpAvq2a2+QRCF/A7ZVDLGGnbNOSTGr0wZSesFyjudt/sBwkoExZXn415qLDcLV2eU5oTUSTcAb879KR8B/VnkYW6Arrdo7TAOv7xocMrsobnaphoDvze6KUYC0RuHlm4pBH7MQl4QQLtb1J0xRpPXD16cQn2EZoSzJTX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(3023799007)(22082099003)(56012099003)(18002099003)(11063799006)(6133799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dng4ek44TEdOZkVpT1FGTnFacVFMWjVxZ2JKOGNBeUQydHBWNEVuQU9vK1U0?=
 =?utf-8?B?UGJhUWJoV2R5VytHWFRjOEMyd1Fxd01xNFVKTG5manVQTnZRc0x4MmYvdHdB?=
 =?utf-8?B?clpWWkpuSXVyejliTEdRbGZwRFh6c211a01kZFI3Z0VSTzZ2c2dSdE1yclJu?=
 =?utf-8?B?eUFueVlmUUFBVjA3TFplR205ckJRZ3lvenVWeVNPMjJZRWIrSXhaWVlHSVhE?=
 =?utf-8?B?dGl2SlMxdVNjeFRITFdwQmNGSjVtaTVSLzJad01PdXlHZjBISkIxOS8wK3Nx?=
 =?utf-8?B?MXBHVVowV2JOZGxGVHAwMy85M1J0NG41eFlyRm1Yc0diUnllRlpkVGhiUjJs?=
 =?utf-8?B?Y0Z4bTQrb0RmMlV1d09DS1dzZVNNKzhjNTR5ZlBlbWZoSER1OU9CM3FiRW1H?=
 =?utf-8?B?djBBS1B3MGpuTTdqR1YxQ3RYWVhnTzVORXRRL2RsSm5EU1c5aWNrMmF5MU13?=
 =?utf-8?B?SFcwMUYzQmNOZ2M0ZDFPempRZFJNTlE2ZmNIRThya3hKMkVDQVh5Tk13Tktn?=
 =?utf-8?B?MU5pTHJ0VWVrYVB0bDNOcVN2d2VmWi9NVHd4M3BFb0lUYm1CRFk1UVhVejVa?=
 =?utf-8?B?dUhWY3Y3WjBNT2VVcnlRNld5Z3pRWFd6UzZpalJsQW14eHRTN2gzWGl0QzBt?=
 =?utf-8?B?akd4MTZaYUVDckdWOGhlK1F0UkVJd2FpcnZSV1NLOTNlUk1YMWhsMTZDL3Ft?=
 =?utf-8?B?V0l3V1h3YTlmWTJNM1RibGpTc2lBWkJXRnVrdGFULzIyc1RaWXd0aEZMZHlQ?=
 =?utf-8?B?TTczOHN2S2JoL1g0TW56S2JjNkFNdU91azZaOThIb21BNTBTUmZRVU95TEFT?=
 =?utf-8?B?TWN2SkxJb3luZjJxZVMrWjl1YXZXYjZKYjlTV0lvYkpOdGswVEFXSWkvNUxC?=
 =?utf-8?B?WWJQVUlFUWY2c1hNZ0ZIVmJxY3Y5TW5YbmtHL1JqcGJuOFNlTlR6OHlMNkNX?=
 =?utf-8?B?Q2xDQUV5Y2NiVGc4TGxlcXgvbWVQcmVqMUpKNEpDU2xJcHdRUlZRVkxFY0U5?=
 =?utf-8?B?UExXSFJDZVI0RXQ2dzYyeXJSVDRrdTJUV2dZYk91dm5UdFpCeGVOMnVpOGVk?=
 =?utf-8?B?UkNTb3lwZU83ZHBsVlBpV0YvNVRiSHFVelQranFWa1VLZHBwV3gzSk5kR3lE?=
 =?utf-8?B?eWxTSzc3TDcvZ1Jjc25XUWIxd2N5blBmelNkb3NzQmFoQXFIY0NwSG95ZlRJ?=
 =?utf-8?B?akZ2QWJLbmpJY0lRSktTZjNYdmswNkxNWUFvZnpNUDhXNXJwY3psQkQ5NHVw?=
 =?utf-8?B?NmR5U01GV3ZoOFNib2tNcDErSlBFc2FiQ1p0WE9SQ3hUc3RBTlRISWNZVm5a?=
 =?utf-8?B?UG5uMnZJaHlyUU1RSUltZjUxRkZBQWRNblNaWEZKa1lkamFydU5lN3FGRzFp?=
 =?utf-8?B?UjRNMEZDUC9QUm9QbGVJSkc2Ty9jOHllYXZHTkw2NmZQbUNSZTBjNGkycWFB?=
 =?utf-8?B?SkFMR3FZN1gxU2cvbFBKTTRFT0NTNXNFMzNBT21CTU5HZFJtNVFpOTRyTVYw?=
 =?utf-8?B?SUVpcUFiTzVpYnRpQ1dGSVl3TFErVXZIbFdHUE0vcFF6anRlbXNTTHdWUnR6?=
 =?utf-8?B?RStpZG03aU1FaHdXdks2UER5eWgzc1FueEpSVDdJOFBER3g3RmtxUWZ6cXNh?=
 =?utf-8?B?WlhBOFJDaDF6NDdSeDhkZHlPUzZJZ1BmMW9qMGZVeE5OR2hLYWNsWE54MlBC?=
 =?utf-8?B?UmxuUEZHZEFxVlFRRnRTaURkaTZrUEQ2d2JUZUV2bWFQdXNsclVzYnlzRlVJ?=
 =?utf-8?B?WERKRDJ1WGFBbjZHeExzdHdmRHB3QUVkeWFkS29GTG00Zk43cXpiS2R2cVJW?=
 =?utf-8?B?UXhQQ0dzUkZFYjBCeEVJYkhjRGNWYklNU01FR1o3dmpVQk9iWkpTNC9Eb1h2?=
 =?utf-8?B?Z3ptR3dnY2tJMStyUTZPSXRjVm1vcWNNOUlzeUNDdHZLTVNTQnNmTC9Calk1?=
 =?utf-8?B?aUtkdUhkYklsbTBNZWhwb3ZXeHpxT20vRWQ0ZEZpSUVIclNtanQ5akZLaHo4?=
 =?utf-8?B?U3FSeXlqMGxDNkd0cThiUHkwOGFkQTJoaHRqMU9IZDdPWUIzcm1LU0U5RDZ3?=
 =?utf-8?B?OWRESWtUU2czbDdnMzVqWklGTEtWS2lpT2dkWlg0N3M2K2VscGZ4TnR4Ni9p?=
 =?utf-8?B?Y3phTkUyMWtkY05BS29oc0x5U3FYZGR0VTFCcGRlaXhmMmZsZDFYZmJFOXYx?=
 =?utf-8?B?Z0lkT2VEQkFYWWdDYVZVbGhWKzM0bFJKbzgzSkRaSkxmbUhuNURiRUdJOXdI?=
 =?utf-8?B?V2ZqSHBObkhkMjB0UE9FZW54WFdMZDBVTm5hVkR3VGw1aUJRNnVDdmVmakZB?=
 =?utf-8?B?eFJTbEY4WmlGRjhRZlVsV1g3YzVJL0t6SlFTWVdtMEd5UlBhWVlTZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e8e1a3e-7bbc-429b-0d5c-08debb0821a8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 09:21:13.5501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b3niUHHNFmVbVD8vpS4MJBznid+u4/bM5POtTD22uD7S02PcvXKRWy7bCbLrZjEaWQV0J8NI3i7kjRTbTK0sTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5845



On 5/22/2026 5:19 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Sun, 17 May 2026, Muralidhara M K wrote:
> 
>> From: Suma Hegde <suma.hegde@amd.com>
>>
>> The new messages extend the HSMP interface to provide finer control over
>> power states and system monitoring capabilities.
>>
>> Power state control:
>> - Get/Set PC6 and CC6 enable/disable control (0x29, 0x2A)
>>
>> Power and thermal monitoring:
>> - Get CCD power consumption reading (0x34)
>> - Get Thermal delta (Tdelta) reading (0x35)
>> - Get SVI3 VR controller temperature (0x36)
>>
>> DIMM sideband operations:
>> - Get/Set DIMM sideband data(0x33, 0x39)
>>
>> Power management:
>> - Get/Set Floor limit control (0x38)
>> - Get/Set SDPS limit control (0x3A)
>>
>> System capabilities:
>> - Get enabled HSMP commands (0x37)
> 
> As you change the existing entries, how does the old stuff handle the
> newly allowed commands (which were previously blocked due to
> hsmp_msg_desc_table[])? It would be good to explain in the changelog why
> it's safe to do.
> 
These HSMP message IDs are newly introduced for the Venice platform 
(Family 1Ah, Models 50h-5Fh) and subsequent platforms. These commands 
are not available on earlier platforms. This information I will document 
in the changelog.
> --
>   i.
> 
>> Bump driver version to 2.6.
>>
>> Reviewed-by: Muralidhara M K <muralidhara.mk@amd.com>
>> Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
>> Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>> ---
>> Changes v1->v3: None
>>
>>   arch/x86/include/uapi/asm/amd_hsmp.h | 142 +++++++++++++++++++++++----
>>   drivers/platform/x86/amd/hsmp/hsmp.h |   2 +-
>>   2 files changed, 126 insertions(+), 18 deletions(-)
>>
>> diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
>> index 92d8f256d096..603d62f8d4da 100644
>> --- a/arch/x86/include/uapi/asm/amd_hsmp.h
>> +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
>> @@ -53,9 +53,19 @@ enum hsmp_message_ids {
>>        HSMP_SET_XGMI_PSTATE_RANGE,     /* 26h Set xGMI P-state range */
>>        HSMP_CPU_RAIL_ISO_FREQ_POLICY,  /* 27h Get/Set Cpu Iso frequency policy */
>>        HSMP_DFC_ENABLE_CTRL,           /* 28h Enable/Disable DF C-state */
>> +     HSMP_PC6_ENABLE,                /* 29h Get/Set PC6 enable/disable status */
>> +     HSMP_CC6_ENABLE,                /* 2Ah Get/Set CC6 enable/disable status */
>>        HSMP_GET_RAPL_UNITS = 0x30,     /* 30h Get scaling factor for energy */
>>        HSMP_GET_RAPL_CORE_COUNTER,     /* 31h Get core energy counter value */
>>        HSMP_GET_RAPL_PACKAGE_COUNTER,  /* 32h Get package energy counter value */
>> +     HSMP_DIMM_SB_RD,                /* 33h Get data from a specified device on the DIMM */
>> +     HSMP_READ_CCD_POWER,            /* 34h Get the average power consumed by CCD */
>> +     HSMP_READ_TDELTA,               /* 35h Get thermal solution behaviour */
>> +     HSMP_GET_SVI3_VR_CTRL_TEMP,     /* 36h Get temperature of SVI3 VR controller rails */
>> +     HSMP_GET_ENABLED_HSMP_CMDS,     /* 37h Get/Set supported HSMP commands */
>> +     HSMP_SET_GET_FLOOR_LIMIT,       /* 38h Get/Set supported Floor limit commands */
>> +     HSMP_DIMM_SB_WR,                /* 39h Set data to a specified device on the DIMM */
>> +     HSMP_SDPS_LIMIT,                /* 3Ah Get/Set SDPS limit */
>>        HSMP_MSG_ID_MAX,
>>   };
>>
>> @@ -170,16 +180,18 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
>>        {0, 1, HSMP_GET},
>>
>>        /*
>> -      * HSMP_SET_XGMI_LINK_WIDTH, num_args = 1, response_sz = 0
>> -      * input: args[0] = min link width[15:8] + max link width[7:0]
>> +      * HSMP_SET_XGMI_LINK_WIDTH, num_args = 1, response_sz = 0/1
>> +      * input: args[0] = set/get XGMI Link width[31] + min link width[15:8] + max link width[7:0]
>> +      * output: args[0] = current min link width[15:8] + current max link width[7:0]
>>         */
>> -     {1, 0, HSMP_SET},
>> +     {1, 1, HSMP_SET_GET},
>>
>>        /*
>> -      * HSMP_SET_DF_PSTATE, num_args = 1, response_sz = 0
>> -      * input: args[0] = df pstate[7:0]
>> +      * HSMP_SET_DF_PSTATE, num_args = 1, response_sz = 0/1
>> +      * input: args[0] = set/get df pstate[31] + df pstate[7:0]
>> +      * output: args[0] = APB enabled/disabled[8] + current df pstate[7:0]
>>         */
>> -     {1, 0, HSMP_SET},
>> +     {1, 1, HSMP_SET_GET},
>>
>>        /* HSMP_SET_AUTO_DF_PSTATE, num_args = 0, response_sz = 0 */
>>        {0, 0, HSMP_SET},
>> @@ -305,16 +317,18 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
>>        {1, 1, HSMP_SET},
>>
>>        /*
>> -      * HSMP_SET_POWER_MODE, num_args = 1, response_sz = 0
>> -      * input: args[0] = power efficiency mode[2:0]
>> +      * HSMP_SET_POWER_MODE, num_args = 1, response_sz = 0/1
>> +      * input: args[0] = set/get power mode[31] + power efficiency mode[2:0]
>> +      * output: args[0] = current power efficiency mode[2:0]
>>         */
>>        {1, 1, HSMP_SET_GET},
>>
>>        /*
>> -      * HSMP_SET_PSTATE_MAX_MIN, num_args = 1, response_sz = 0
>> -      * input: args[0] = min df pstate[15:8] + max df pstate[7:0]
>> +      * HSMP_SET_PSTATE_MAX_MIN, num_args = 1, response_sz = 0/1
>> +      * input: args[0] = set/get DF P-state range[31] + min df pstate[15:8] + max df pstate[7:0]
>> +      * output: args[0] = min df pstate[15:8] + max df pstate[7:0]
>>         */
>> -     {1, 0, HSMP_SET},
>> +     {1, 1, HSMP_SET_GET},
>>
>>        /*
>>         * HSMP_GET_METRIC_TABLE_VER, num_args = 0, response_sz = 1
>> @@ -335,10 +349,12 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
>>        {0, 2, HSMP_GET},
>>
>>        /*
>> -      * HSMP_SET_XGMI_PSTATE_RANGE, num_args = 1, response_sz = 0
>> -      * input: args[0] = min xGMI p-state[15:8] + max xGMI p-state[7:0]
>> +      * HSMP_SET_XGMI_PSTATE_RANGE, num_args = 1, response_sz = 0/1
>> +      * input: args[0] = set/get XGMI pstate range[31] + min xGMI p-state[15:8] +
>> +      *                  max xGMI p-state[7:0]
>> +      * output: args[0] = min xGMI p-state[15:8] + max xGMI p-state[7:0]
>>         */
>> -     {1, 0, HSMP_SET},
>> +     {1, 1, HSMP_SET_GET},
>>
>>        /*
>>         * HSMP_CPU_RAIL_ISO_FREQ_POLICY, num_args = 1, response_sz = 1
>> @@ -355,9 +371,21 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
>>         */
>>        {1, 1, HSMP_SET_GET},
>>
>> -     /* RESERVED(0x29-0x2f) */
>> -     {0, 0, HSMP_RSVD},
>> -     {0, 0, HSMP_RSVD},
>> +     /*
>> +      * HSMP_PC6_ENABLE, num_args = 1, response_sz = 0/1
>> +      * input: args[0] = set/get PC6 control[31] + disable/enable PC6[0]
>> +      * output: args[0] = current PC6 control status[0]
>> +      */
>> +     {1, 1, HSMP_SET_GET},
>> +
>> +     /*
>> +      * HSMP_CC6_ENABLE, num_args = 1, response_sz = 0/1
>> +      * input: args[0] = set/get CC6 control[31] + disable/enable CC6[0]
>> +      * output: args[0] = current CC6 control status[0]
>> +      */
>> +     {1, 1, HSMP_SET_GET},
>> +
>> +     /* RESERVED(0x2B-0x2F) */
>>        {0, 0, HSMP_RSVD},
>>        {0, 0, HSMP_RSVD},
>>        {0, 0, HSMP_RSVD},
>> @@ -385,6 +413,86 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[]
>>         */
>>        {0, 2, HSMP_GET},
>>
>> +     /*
>> +      * HSMP_DIMM_SB_RD, num_args = 1, response_sz = 1
>> +      * input: args[0] =
>> +      *      Register space[23]
>> +      *      Register offset in given reg space[22:12]
>> +      *      LID of device[11:8]
>> +      *      DIMM address[7:0]
>> +      * output: args[0] = [3:0] Read data byte
>> +      */
>> +     {1, 1, HSMP_GET},
>> +
>> +     /*
>> +      * HSMP_READ_CCD_POWER, num_args = 1, response_sz = 1
>> +      * input: args[0]  = apic id of core[15:0]
>> +      * output: args[0] = CCD power(mWatts)[31:0]
>> +      */
>> +     {1, 1, HSMP_GET},
>> +
>> +     /*
>> +      * HSMP_READ_TDELTA, num_args = 0, response_sz = 1
>> +      * input: None
>> +      * output: args[0] = thermal behaviour[31:0]
>> +      */
>> +     {0, 1, HSMP_GET},
>> +
>> +     /*
>> +      * HSMP_GET_SVI3_VR_CTRL_TEMP, num_args = 1, response_sz = 1
>> +      * input: args[0] = SVI3 rail index[3:1] + Read SVI3 temperature data[0]
>> +      * output: args[0] = SVI3 rail index[30:28] + SVI3 rail temperature(degree C)[27:0]
>> +      */
>> +     {1, 1, HSMP_GET},
>> +
>> +     /*
>> +      * HSMP_GET_ENABLED_HSMP_CMDS, num_args = 1, response_sz = 3
>> +      * input: args[0] = HSMP command mask[0]
>> +      * output: status of HSMP command = args[0], args[1], args[2]
>> +      */
>> +     {1, 3, HSMP_GET},
>> +
>> +     /*
>> +      * HSMP_SET_GET_FLOOR_LIMIT, num_args = 1, response_sz = 1
>> +      * input: args[0] =
>> +      *      Set or Get[31:30]
>> +      *              Set the Floor frequency per core = 00
>> +      *              Set the Floor frequency for all cores = 01
>> +      *              Get the Floor frequency of a core = 10
>> +      *              Get the Effective Floor frequency per core = 11
>> +      *      Reserved[29:28]
>> +      *      Apic id / Reserved[27:16]
>> +      *              args[27:16] is reserved if args[31:30] = 01
>> +      *      Floor frequency limit / Reserved[15:0]
>> +      *              if args[31] = 0, Floor frequency limit, else reserved
>> +      *
>> +      * output: args[0] =
>> +      *      Effective Floor frequency limit(MHz) / None / Floor frequency limit[15:0]
>> +      *              Effective Floor frequency if input args[31:30] = 11
>> +      *              None if input args[31] = 0
>> +      *              Floor frequency limit (MHz)[15:0] if args[31:30] = 10
>> +      */
>> +     {1, 1, HSMP_SET_GET},
>> +
>> +     /*
>> +      * HSMP_DIMM_SB_WR, num_args = 1, response_sz = 0
>> +      * input: args[0] =
>> +      *      Write Data[31:24]
>> +      *      Register space[23]
>> +      *      Register offset in given reg space[22:12]
>> +      *      LID of device[11:8]
>> +      *      DIMM address[7:0]
>> +      * output: None
>> +      */
>> +     {1, 0, HSMP_SET},
>> +
>> +     /*
>> +      * HSMP_SDPS_LIMIT, num_args = 1, response_sz = 1
>> +      * input: args[0] = Set/Get[31] + SDPS Limit[30:0]
>> +      * output: args[0] = SDPS Limit[30:0]
>> +      */
>> +     {1, 1, HSMP_SET_GET},
>> +
>>   };
>>
>>   /* Metrics table (supported only with proto version 6) */
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
>> index 0509a442eaae..b153527e0a0d 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
>> @@ -27,7 +27,7 @@
>>   #define HSMP_DEVNODE_NAME    "hsmp"
>>   #define ACPI_HSMP_DEVICE_HID    "AMDI0097"
>>
>> -#define DRIVER_VERSION               "2.5"
>> +#define DRIVER_VERSION               "2.6"
>>
>>   struct hsmp_mbaddr_info {
>>        u32 base_addr;
>>

