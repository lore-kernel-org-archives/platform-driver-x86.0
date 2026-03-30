Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011029.outbound.protection.outlook.com [52.101.52.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99673C873F
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 11:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774871149; cv=fail; b=hZn5HP1EmGJwJaQmaoeqxpyxd9vCgPIhzhXeXAPFCs9IrBCBJm++viL0IgqDFEd8OyeMC9A3P13XOHSJ5w4U3xofbKeM1wk9hFLY6ctCQiGZPfdck9jozqO1+Bt7RAIE5V6YKj9DfPHsI7IrN2LkukhN45doyZT76pxebSPmrWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774871149; c=relaxed/simple;
	bh=VGwU79WClA/WIVhtQdpfsP3h9RBt8LBAywYJZ2qtHgQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=N0n59kBN8MTzxwML2MOLIaP+5c9Tr8ZLuWKE3kSQ6M4j7rCJhzqXvOT1tjl9kYiKhrVMAqWoWZGColdwGZHuJOQpBx/rElG6OfMqxbu5fPwAbUXW15mUrHZwTJSZRfUrFWEZSlHLLJfAgcFK5JXwvX3GW6te9LjsNGn2XWLI1XA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AGNs8yGz; arc=fail smtp.client-ip=52.101.52.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AGNs8yGz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xdKyatBck4ikqJhEUjXMZfv0gD+yH32RN+QZdxgQGCDJvGSaWAooQhHjJJxNnSfWbI8wwl+3AUca585kUnRI13BQTq6m47AYn/0y4VLfFYoMID64oj4/K7rxViANZM1yH6v9HBU0j/KZiwzqA63nQizKjHMGT7r41RIEqh05jyC3WOgVfizfBQffynyQ4qoEKJvCh7/uIFhwqT19A45fH8SI0jdEY07nEFWGNOLnuVNnGEhBj87pZim34Ut6CIVEopiUTf+E2ND5724/SiTG5ZJ1sqQI+SOUwow5LzoGjE0KBdspZ5Abd2So4ycnvKSqOpt7nez9Ntr+9ujELGsswQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=So1iuUewGCweGzSRJeZNGgPEKfx7MrqCqWqJQOKS/xk=;
 b=y8RbkE/6+5gx9N0oYI64eFkw0iWWtw3TPstaeWE/X1L82+S9NiQbKg/cls/HAzImtyao9Kn5JbYzFU56OMXXpflar7lGPubKn9x78jVfWt8PeEAc90a/M6hQhqDsY5G2Hrnb8n+FaxMGEwCgWg8Hs0s2Jh5mfJhiTLS+5ApRbnkpMq4A87DeMg7FGJG+8SCV0awyolhnM/+CNX87DT82bF3W6fe58Pv68w6BnjmlhJQqqPF0Ix4odWmqCJgRmIfU6sANe1x5sXHTnB/p8ruSPoQ41rXZ98+H3QRqnNR8Apa9rTpORAslOvXyYl1gVuVYyjEa++nNYqbrzCCM97FnMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=So1iuUewGCweGzSRJeZNGgPEKfx7MrqCqWqJQOKS/xk=;
 b=AGNs8yGzbQfish7pMmWUNhZwn5Fe8I/olOTYKY9Yn4XJCL/YEd0mcH2296C2iEUyamXCmMMK7AtoLDTBu1L9k1ziNuEKNDdFFjDSIgL6tC/fuo1D8IbkNXs7QArdWmSQx5LpnB8M9A2PB5vjZMuHjP2RnKoH5pxtvrWJUN1olag=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SJ5PPF01781787B.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::986) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.14; Mon, 30 Mar
 2026 11:45:44 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683%3]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 11:45:43 +0000
Message-ID: <0259d8bd-99c2-46a5-ad28-5c6d60376db1@amd.com>
Date: Mon, 30 Mar 2026 17:15:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] platform/x86/amd/pmf: Move debug helper functions
 to UAPI header
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, mario.limonciello@amd.com,
 Yijun.Shen@Dell.com, Sanket.Goswami@amd.com
References: <20260301131124.1370565-1-Shyam-sundar.S-k@amd.com>
 <20260301131124.1370565-6-Shyam-sundar.S-k@amd.com>
 <c2678400-a4af-03e6-9948-33dd5a486c5c@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <c2678400-a4af-03e6-9948-33dd5a486c5c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0258.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::6) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SJ5PPF01781787B:EE_
X-MS-Office365-Filtering-Correlation-Id: e8e6c519-bde7-4a88-ea15-08de8e51dfdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	R2ln563c/XIOF4nvl0zcgqlpXAujHOTYpUyYmVxyw/aFsIHAu5FoNRT4uhhHFDP/NArn2UD3BWKdM0xt7tIU/Aao7vOMD46E5DOmk9O7HFkJXl63lhc97M8Z0abst0pTBksCbpAaqDpJT3N9IIurYVGmIS5JZ9qxRggyroaLjf8LcuIXJ/AhElQn2jRY+L/GUnnDZZRtL7BhY7b1qZ3i1VNJxNi9CvPVNBOefFD1nVj85weCD+jSDX5CO3Pzo0iRXy37LNWwFtei0pd89EleKx7g1ZwZPf969vRI2GbFf6t2l5F4t8WirmAYySfaE2Ia9ftz3JHtbqWvt0VXEOqZbcIRK+RW1vlUb21SgM6W7uRmx2IgoCpgZtlOkjb3KaWffoKyZcixByJJp1yCvf7oygvOT98Muy1k2PjoBebeYPSUnw1yL3G8eUu0mstloLAxQ/4/OR6q/Kqc0l3BVgGEsQxYsC7OGlBIMmsCTkhiLMcOwwffEF8iQD0Xer/0P8N1NRn69yZZGwpto4slgaS8aUK6uVMRIV5ia61kG84+OGReBMmQSRJu0Y4Vr9l5nevIUoeLuZY6IVVxcV0T/9ryxWmBvH8LKyPmVpeh8Pf3w6Rw8ZIZxugb/g4QB9fwqJPF6hKitOcZqkocWTlyiEdPm1TkKrZeLBmCnHZAhNdPgP1ATdOC46yedkYu4RxnpIigRM1L5DLqIk8IznGasdqvvv10T2vvjvAzmTuNgEzcAmM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWdkTytickZvYlRzcFNFTWdJY1g1Ulpjd2cxT3Z0bGRRMnZrcXZxZG5zQlo0?=
 =?utf-8?B?ODMyZkFraGtYcXkzSU1QVGpDbStMcnZoTkVIcHM1dktlZzFEY1doTExROVBR?=
 =?utf-8?B?YVR4RFZSRkxaT3U1cUFUc0toeHNSL2laVHRSbmRUZUc3YmVEVzFwUXNWVHhw?=
 =?utf-8?B?d1VkUlBKR3IzcnhLVlZWTHBYNXVhQ2RONmo0dW9hRXdnSHBzTE5Yb1FNclVR?=
 =?utf-8?B?eVp1QTMvSU9nZDdLazZpUXR1VE5Oa25KWml0Yk5RK1lDZENBSXg3aEMyNEw4?=
 =?utf-8?B?Uks5T0syNy9OTVNZcktGSkprSXZlTFpVeHh3M3hMR25iaGdjZEp5Y1ltVGQ4?=
 =?utf-8?B?eGhKOFNhZzU3Y1I4QmgvU1JDZnVVd0VPU2VjNDNoN29oSk1teWlkUEpWejE4?=
 =?utf-8?B?dlN2ZWhNeFF2cmZKbzFWUExyUW1aWG4yWjZQNVg3MHR4RUhkb09yTGJXeGU3?=
 =?utf-8?B?SENGcE9zWCtTT1FiTEgvRmVFcWNFRi9CSlRtTnFHZkpHc0ozTmVia0NZMTBR?=
 =?utf-8?B?bzV2Z284VnlaNFJzZGthUkpTOEZoSWJpeVZJL3pqUHpEa29JbzNhRExDOS9m?=
 =?utf-8?B?T0pLMWFJZHh2T0xuTmlRWStaU3NUN3Z3VDJENkx3enB5a09tU2kzK3J3aDhQ?=
 =?utf-8?B?NzBXcnRtbVZabHovUVF5M3kxQ0JGdE5teFpLajBUTjRzT2ZnUCtzdW1haDcv?=
 =?utf-8?B?UUd5MWllN1FFUCt4RlZGN0JudENnTFZGWjhQY1JxM2svRHVmbk1VdnVzdURP?=
 =?utf-8?B?TFhwSVovZjBxdUhnZzhDYUtWb0Rkc0dmMUVPa3RHQmJwcjNuVjZmZElGOXpu?=
 =?utf-8?B?eFRYWVRXMjlVQmJyVmk2dmF4b0dMTGxuUjFLd1QwWStsanVseTN5T0VuQXlS?=
 =?utf-8?B?M1hBNUZnbHVqaXE5UVJxTk0wRjJDeW9abWVXcFF3enJKOElvaCtqSHZwV2dK?=
 =?utf-8?B?MUVsUUZ6RjdZQzNyL0tTbnJ0TW1nM1dsTzVmYXhrTTFGOFFFSERRcEc1SGxS?=
 =?utf-8?B?T1JTanRjaktmNlBDc2ZDdnhaclcxWVZPbXl4eVNWM1gyNnJtdDdMSmZvNmFW?=
 =?utf-8?B?Qm94aUNUaDdXamtNSmlWZXVWK2toRDltNytnRnFlM1Yrb1FVdlRiek9kVnNS?=
 =?utf-8?B?eVBNK0NRS3pCekZlcU5yVG1BL3lqcWpJQzlybWFVTzJyQjN6Q2NIMWFLQTdM?=
 =?utf-8?B?bFZjNW1vZUFYcmpjS3gvc2RRVGkyeDF6NEFKSUhSem1lQWMrUFRKb1ZLZFJT?=
 =?utf-8?B?ZG5vWHBLbGh6Yzl1U0o0NThpcW1VVjZGYTZwQ0hXYUFvVE9mT3NuaVdkSWxY?=
 =?utf-8?B?a2FUM2d5TnBONTFjcHNqVFBHUmRGSS9NNXVEbnhYMG91WXhncE5NeW1heUln?=
 =?utf-8?B?ZERmZnByejNaVVNqRmdJRjhMekVFVCtzbVJWL0g1R3pRZFVURW5mNWtjelcz?=
 =?utf-8?B?Y0VPTTdnYjBGTFRFVHdGSk5ZQXFPSEtoTGxTbnMzSUZJaStzK2ZMdE5jTlFm?=
 =?utf-8?B?alRRejh4cTdkWjRTa2xzbWVKbHliUzRObHQzK3BReXJHUDlPQTFmeHF1RXhK?=
 =?utf-8?B?dkl2WkJlTVdlTmsyK2VkT1RRT2VMcnF0UytNQ0IwU3RzYVRVcC8yR3YvNTR3?=
 =?utf-8?B?TGJZcWhtcFkrRnRLOXV4L01YWXpLeVI2RWhHNnU0ZEFlRHh1dlZpQzZNM043?=
 =?utf-8?B?eEh2YmM2MjVKK1lubHArS3hCeDhvdUtrRkJsa3FCdG03Q21mL1h6L3loZkNw?=
 =?utf-8?B?UTFLYituZEpCWVZuUFdaWnZCb0pRWUwvTkxvekkxcGVGb3l0YmxML3BPQWdh?=
 =?utf-8?B?L1dWTHdJMksvSnNQNUY2ZkZ5a05kVThPZmM1dWdGWlV5c0pZcWtXY09kazR0?=
 =?utf-8?B?amxhU21BQ2VMR2NwYjJqaEJUYnYrYyswc3FHUDA3VFJ2L29EQ1dkSHBxc295?=
 =?utf-8?B?SHpsekJRSDhtOVhBNWpxak9DZmRsa0hKd1pkdXBLb0tiekVES1pZVGhFVE1U?=
 =?utf-8?B?UE5RdHBueGcrdXZNeVBsU0VvOHFOdEZYOGp3WUtvWXVXQ0tKNmFGVlAxQitq?=
 =?utf-8?B?bTF0TVoxekZzZXpkaXRkaHBLbFVnYmNFV2VWSVpqemhKSDZmN2lQN1hqK0Jq?=
 =?utf-8?B?cUZxdEdIZTlSYXQ3VG5LRk42Vmg4R3gyeUlBRnFLbE1oeXRDUkMyV3QrSkUw?=
 =?utf-8?B?T3MraGxzTzJJNUpSUDN2cStIcFRmUHc4U0podnhnQkNxTEtSbmxJRVU5aUl2?=
 =?utf-8?B?WStHNHpsdC9CVEhuTEdVZTJoUmZJRTdSMWxCY1B2RUk3VXV4enAyeGlUVGM1?=
 =?utf-8?B?VUlFTGRaM3VPOHI0M3FlYnY4UUZ3b1ZZRkhUajcwSWc0NWNOUllvZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8e6c519-bde7-4a88-ea15-08de8e51dfdf
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 11:45:43.7791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6+osBffQAk/lb7htqcIfZ+Wgcis/6tLD2TKp41S16cnprJcQ2WC2YZN166GqZYnQCOni/ExjY1pP+OsF5k9WZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF01781787B



On 3/25/2026 19:09, Ilpo Järvinen wrote:
> On Sun, 1 Mar 2026, Shyam Sundar S K wrote:
> 
>> These debug helper functions convert enumerated values to appropriate
>> message and can be useful for userspace tools and other kernel components
>> that need to interpret AMD PMF state values.
>>
>> By making them inline functions in the UAPI header, they become available
>> to both kernel and userspace without code duplication.
>>
>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> 
> Here too I'm not happy with the naming and I'm a little skeptical about 
> the sharing string conversion helpers as well.
> 
> Hans,
> 
> do you have something to say on having this kind of string conversions in 
> an uapi header?

Good question. Lets wait to hear from Hans as well.

The thought process was anyways we were trying to unify things under
UAPI, thought to move even the helpers in uapi headers.

But, I am open to suggestions.

Thanks,
Shyam

> 
>> ---
>>  drivers/platform/x86/amd/pmf/spc.c  |  54 --------------
>>  drivers/platform/x86/amd/pmf/util.c |  12 ----
>>  include/uapi/linux/amd-pmf.h        | 105 ++++++++++++++++++++++++++++
>>  3 files changed, 105 insertions(+), 66 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
>> index a40419b5e1b7..f91feaac5238 100644
>> --- a/drivers/platform/x86/amd/pmf/spc.c
>> +++ b/drivers/platform/x86/amd/pmf/spc.c
>> @@ -18,60 +18,6 @@
>>  #include "pmf.h"
>>  
>>  #ifdef CONFIG_AMD_PMF_DEBUG
>> -static const char *platform_type_as_str(u16 platform_type)
>> -{
>> -	switch (platform_type) {
>> -	case CLAMSHELL:
>> -		return "CLAMSHELL";
>> -	case FLAT:
>> -		return "FLAT";
>> -	case TENT:
>> -		return "TENT";
>> -	case STAND:
>> -		return "STAND";
>> -	case TABLET:
>> -		return "TABLET";
>> -	case BOOK:
>> -		return "BOOK";
>> -	case PRESENTATION:
>> -		return "PRESENTATION";
>> -	case PULL_FWD:
>> -		return "PULL_FWD";
>> -	default:
>> -		return "UNKNOWN";
>> -	}
>> -}
>> -
>> -static const char *laptop_placement_as_str(u16 device_state)
>> -{
>> -	switch (device_state) {
>> -	case ON_TABLE:
>> -		return "ON_TABLE";
>> -	case ON_LAP_MOTION:
>> -		return "ON_LAP_MOTION";
>> -	case IN_BAG:
>> -		return "IN_BAG";
>> -	case OUT_OF_BAG:
>> -		return "OUT_OF_BAG";
>> -	default:
>> -		return "UNKNOWN";
>> -	}
>> -}
>> -
>> -static const char *ta_slider_as_str(unsigned int state)
>> -{
>> -	switch (state) {
>> -	case TA_BEST_PERFORMANCE:
>> -		return "PERFORMANCE";
>> -	case TA_BETTER_PERFORMANCE:
>> -		return "BALANCED";
>> -	case TA_BEST_BATTERY:
>> -		return "POWER_SAVER";
>> -	default:
>> -		return "Unknown TA Slider State";
>> -	}
>> -}
>> -
>>  static u32 amd_pmf_get_ta_custom_bios_inputs(struct ta_pmf_enact_table *in, int index)
>>  {
>>  	switch (index) {
>> diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x86/amd/pmf/util.c
>> index 9a14467f412c..20dc7aa9f250 100644
>> --- a/drivers/platform/x86/amd/pmf/util.c
>> +++ b/drivers/platform/x86/amd/pmf/util.c
>> @@ -18,18 +18,6 @@
>>  
>>  #define AMD_PMF_IOCTL_VERSION		0x02
>>  
>> -/* Convert BIOS input control code to array index (0-9) */
>> -static int amd_pmf_get_bios_idx(u32 control_code)
>> -{
>> -	if (control_code >= IOCTL_BIOS_INPUT_1 && control_code <= IOCTL_BIOS_INPUT_10)
>> -		return control_code - IOCTL_BIOS_INPUT_1;
>> -
>> -	if (control_code >= IOCTL_BIOS_OUTPUT_1 && control_code <= IOCTL_BIOS_OUTPUT_10)
>> -		return control_code - IOCTL_BIOS_OUTPUT_1;
>> -
>> -	return -EINVAL;
>> -}
>> -
>>  static long long amd_pmf_populate_bios_input(struct ta_pmf_enact_table *in, u32 control_code)
>>  {
>>  	u32 idx;
>> diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
>> index 00fab9269238..e2125b304b83 100644
>> --- a/include/uapi/linux/amd-pmf.h
>> +++ b/include/uapi/linux/amd-pmf.h
>> @@ -14,6 +14,7 @@
>>  #ifndef _UAPI_LINUX_AMD_PMF_H
>>  #define _UAPI_LINUX_AMD_PMF_H
>>  
>> +#include <linux/errno.h>
>>  #include <linux/ioctl.h>
>>  #include <linux/types.h>
>>  
>> @@ -106,6 +107,88 @@ enum platform_type {
>>  	PTYPE_INVALID = 0xf,
>>  };
>>  
>> +/**
>> + * platform_type_as_str() - Convert platform type enum to string
>> + * @platform_type: The platform type value to convert
>> + *
>> + * Returns a human-readable string representation of the platform type.
>> + *
>> + * Return: Constant string describing the platform type, or "UNKNOWN"
>> + *         if the value is not recognized.
>> + */
>> +static inline const char *platform_type_as_str(unsigned int platform_type)
>> +{
>> +	switch (platform_type) {
>> +	case CLAMSHELL:
>> +		return "CLAMSHELL";
>> +	case FLAT:
>> +		return "FLAT";
>> +	case TENT:
>> +		return "TENT";
>> +	case STAND:
>> +		return "STAND";
>> +	case TABLET:
>> +		return "TABLET";
>> +	case BOOK:
>> +		return "BOOK";
>> +	case PRESENTATION:
>> +		return "PRESENTATION";
>> +	case PULL_FWD:
>> +		return "PULL_FWD";
>> +	default:
>> +		return "UNKNOWN";
>> +	}
>> +}
>> +
>> +/**
>> + * laptop_placement_as_str() - Convert laptop placement enum to string
>> + * @device_state: The laptop placement value to convert
>> + *
>> + * Returns a human-readable string representation of the laptop placement.
>> + *
>> + * Return: Constant string describing the placement, or "UNKNOWN"
>> + *         if the value is not recognized.
>> + */
>> +static inline const char *laptop_placement_as_str(unsigned int device_state)
>> +{
>> +	switch (device_state) {
>> +	case ON_TABLE:
>> +		return "ON_TABLE";
>> +	case ON_LAP_MOTION:
>> +		return "ON_LAP_MOTION";
>> +	case IN_BAG:
>> +		return "IN_BAG";
>> +	case OUT_OF_BAG:
>> +		return "OUT_OF_BAG";
>> +	default:
>> +		return "UNKNOWN";
>> +	}
>> +}
>> +
>> +/**
>> + * ta_slider_as_str() - Convert TA slider enum to string
>> + * @state: The TA slider state value to convert
>> + *
>> + * Returns a human-readable string representation of the power slider
>> + * position suitable for display purposes.
>> + *
>> + * Return: Constant string describing the slider state, or
>> + *         "Unknown TA Slider State" if the value is not recognized.
>> + */
>> +static inline const char *ta_slider_as_str(unsigned int state)
>> +{
>> +	switch (state) {
>> +	case TA_BEST_PERFORMANCE:
>> +		return "PERFORMANCE";
>> +	case TA_BETTER_PERFORMANCE:
>> +		return "BALANCED";
>> +	case TA_BEST_BATTERY:
>> +		return "POWER_SAVER";
>> +	default:
>> +		return "Unknown TA Slider State";
>> +	}
>> +}
>> +
>>  /**
>>   * enum pmf_ioctl_id - Control codes for PMF ioctl operations
>>   * @IOCTL_POWER_SOURCE: Query current power source (AC/DC)
>> @@ -197,6 +280,28 @@ enum pmf_ioctl_id {
>>  	IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_DC
>>  };
>>  
>> +/**
>> + * amd_pmf_get_bios_idx() - Convert BIOS control code to array index
>> + * @control_code: The BIOS input or output control code
>> + *
>> + * Converts a BIOS input (IOCTL_BIOS_INPUT_1 to IOCTL_BIOS_INPUT_10) or
>> + * BIOS output (IOCTL_BIOS_OUTPUT_1 to IOCTL_BIOS_OUTPUT_10) control code
>> + * to a zero-based array index (0-9).
>> + *
>> + * Return: Array index (0-9) on success, -EINVAL if the control code
>> + *         is not a valid BIOS input or output code.
>> + */
>> +static inline int amd_pmf_get_bios_idx(unsigned int control_code)
>> +{
>> +	if (control_code >= IOCTL_BIOS_INPUT_1 && control_code <= IOCTL_BIOS_INPUT_10)
>> +		return control_code - IOCTL_BIOS_INPUT_1;
>> +
>> +	if (control_code >= IOCTL_BIOS_OUTPUT_1 && control_code <= IOCTL_BIOS_OUTPUT_10)
>> +		return control_code - IOCTL_BIOS_OUTPUT_1;
>> +
>> +	return -EINVAL;
>> +}
>> +
>>  /**
>>   * struct amd_pmf_ioctl_info - Structure for PMF ioctl data exchange
>>   * @control_code: Input parameter specifying which data to query (enum pmf_ioctl_id)
>>
> 

