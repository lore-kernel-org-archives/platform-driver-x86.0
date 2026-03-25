Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010064.outbound.protection.outlook.com [52.101.56.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74553DE446
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 15:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774451312; cv=fail; b=GRyOAN02qRfEHP0mTL9jXsuYGjS3qL9Z/a0W8QJ0C0bmHvF+xq8TuH+aBl5C2WOU44yp6f+muBBD5O1PHfjz6H+eaLqa/HhCT8//LWLo7SyRHRbpKJ3eAQODDX/xVogbU5awIxlsqnUnTl03yN5ygbt00TGjhIAy1dq0b9mw6mg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774451312; c=relaxed/simple;
	bh=VwDK5sxx9lRDmYbg3kwrkJlZ8Vps8fTQJ5D3kWtjfGI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fyeYECBBNNBTTsU2e/ceZxDoGupetyFk5ECVZDbMA8DQcmqLAhF0cd9Vc5xF5X22n70UHj6jAv9/G+jv22c0VWyt69KbeJMmMgRrz8FNyhuif3yQD7jq2sCbdNbz4kiRF59HD+SuSQSaRuX+vO3QiIF1ZDaK7HNi7TgbzxO0ONA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jmokd5be; arc=fail smtp.client-ip=52.101.56.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jmokd5be"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wAu9/MBdcAY3mRp43c0ljtiW87FAHcvl8oCXEG8BSOw92p2e2zUZx7ZTBwvDvZ1op9LtAco3mBDxz4z+twQqQddRoTShZ23Fa90kEDr3RyYPiSsJ/PvvqQ40LIN37ikNwYpN1mctzHBYVG6wtTEt69kh2QGIJAqhrrdGDcXScalVSNQXUYksdsWxwLSF+1AjTL2iEestYJY3xw/fIyAdiSgLpzaKoBc67326szV+RcW3jk1RAGuZy91oxmdwaVF7chhDj4zTglIJWhEg4QhFOTZ1ePlmYtwZ0B4WL+3IaE1nZdzwma7jOKLVNzIW4w+ZcLdQTrfeZcGSiGu79Z3olQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TEJNBHSislPKyaM6vyxc9c/wA4C853hHt5M/e8MqUuU=;
 b=sagEiY5V/QVMZYEGZO4F9IlCAmOplK9Q3pjHa/SYV0wAxiv5WP1e+B6nW/IrRCKYDjbfIvxkI58h8gGmFfvQrlG9vUWGdxwymQ3Om9X6egX6Tz4LCXyK5rCTuErW5MiEJ1Dfw6OdfLLmiD31BDxcCJev7R3753PUOn34mMZOFWT5Dje6cgFVqSRzK5VBFve5GmkXAQcH+4LhtmQcC++qX0Y0pk4dmwYhiJFJvT295hebzkU+tYSo/ZzbpSY5/izXEKDgSES4FLjmfVwxhEGI6mUkcAZwt9QSZ1AcYWTdQP8nYhajA+BxR5MzjbkjxSzNvEZ1eCUbya5llHXXK0rzWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TEJNBHSislPKyaM6vyxc9c/wA4C853hHt5M/e8MqUuU=;
 b=jmokd5beacT9rfWOUu8UcdxtgPZS5uHeVsYC3/fBhb2l92zHxdgu2sb/tpwknL+JWZKi6eMpQuZCQail9DKxjdhYm4l6aokjQLDYWZstbMex+HC2Gb8OvqMOb9dHDP2lLitt0Thpdk+4X0SPnsK2jz3md1bMipL9RBoVr6xiYnI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by DM4PR12MB7766.namprd12.prod.outlook.com (2603:10b6:8:101::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 15:08:25 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9769.006; Wed, 25 Mar 2026
 15:08:24 +0000
Message-ID: <05c21f3a-9f56-454e-a1e9-2924da962f29@amd.com>
Date: Wed, 25 Mar 2026 10:08:22 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] Documentation/ABI: add testing entry for AMD PMF
 misc device interface
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 Yijun.Shen@Dell.com, Sanket.Goswami@amd.com
References: <20260301131124.1370565-1-Shyam-sundar.S-k@amd.com>
 <20260301131124.1370565-8-Shyam-sundar.S-k@amd.com>
 <3b1fdb27-3179-ba33-3f8c-6d617b3827f3@linux.intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <3b1fdb27-3179-ba33-3f8c-6d617b3827f3@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR14CA0021.namprd14.prod.outlook.com
 (2603:10b6:610:60::31) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|DM4PR12MB7766:EE_
X-MS-Office365-Filtering-Correlation-Id: bce430d0-094b-485c-f289-08de8a805c66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	vdN1FHtMMTBW26h9sIWOkh23N664Yy9y/acQG1JL8fcw9qoHdHPaFIA7g120Ut613glytuWf/C4uZhjy4l0adoZLnF6kg3RaXxlhkgTJT6MsZ966rERKu4HGx4WZk5itbrA39rkui6Kc784UlPykqPEedIdG9lb+Kypq4eU/IdvZjXf1FVdAVEkCGuIhihhBl69X/YpjwQAZP8lqk37RvDWtToJ1bslhaCIIBZ5CToX6L6Z7tRzZC/6BU1sBcM2eWfTrlnSo7Mpfb0V9Xsru08aTtICEFxw0vpUvm4DMa2A8AMHJVwOQnWHoN6jxa7u867vekqRhDnqNfAW/27tEXTniIMGyy9uhGbFmFwjCmR+8jdBlmMT1mOjLtlThHN1KpRTxBOmDr6gdZpSkIAMrL6l7jrNmA9jgC225H85FGeptYrJznziQKjiFG5C0LK3aNmGHgsusG71qfwRXLKAHZnzTvkFbXHeqbAD3/b1Le2tfJJ9tLwAbZcE7sJ6PGivZXLcDVbATUXtNPe8HFaSRqNIhGm6GdTudEgCnym6EbQpexkniQ9HTz5ki33JdnK7GIlYuVakN+uX7qTDOs4Q/dyJDVQ5pCgvtZORXfjg6DvBKhc3E9SjZcty2C33ZHGNvws9vcTXqtro2KkJqGEEdw88Uhlvd1OXdSUTZXU8gXnWtx/Iea6grQcnDOYY98EcUkFHZ9ZQS9anUUw2sP+d2PhxThE2mHFUoKerUKKoQWeg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3VSY2RoaG1uNzhDNmJxQS9OdlJDWmgxczVjTGpjV1dqWUdUR3QwRHhOdGNG?=
 =?utf-8?B?QVJHa2QzMmorUTYrQW5OQVh5SVR2WjkvbGJjcEhUTXhyTkU0Q1Yrb1h6V3Rw?=
 =?utf-8?B?dE1qdWM3ZFUyVWsyVFNPMjZodkltL0dmSGJ5U0NDa29pdlNTTVpnS0NnS2tN?=
 =?utf-8?B?VDAxQWlDa2hudnhxUVk4dW5hWW0rZWhoeDVnSEk1d0JNZTJSWlQwUVg0T1Ji?=
 =?utf-8?B?M1NqekIrM0FZNC82b1kwazBkSUxhbUpGM09SOUVrUkwyL3hpQlRPUmhjK29Q?=
 =?utf-8?B?TXdjQ0RlRmNGNVVRVU5tajhZSmxLRDdCTVgvM0JvMVBwNzFreWxlUUR5TVlW?=
 =?utf-8?B?eDFQTnNucEZHaGFGZUNmcG10R2hZVWNCVjA0Yi9XTEVZMExZTzRwRUoyaWRh?=
 =?utf-8?B?TDgyNlY5QUNTNzJlVXo4QnhZZ1JvU05SMTRlMXFsNCtBZElLT3E4LzFMeVFs?=
 =?utf-8?B?dGJNblBqU1NaU3cyL0dhY0V1QzYvZFY5RFFnK0lHS2lWQkdzOWVoS0pkRldD?=
 =?utf-8?B?RnRQNG84TC9hNjkwaGNMMWFMRUg4Q2RwZWpCMzZFMjZyR2RxSWthQkdhekpC?=
 =?utf-8?B?RHBlZEhOM2xMbGZDUktXQVlQbG9wV1NCTnQ1QUNyaE56YjM5NW1aSGk1Njho?=
 =?utf-8?B?REdMajZFSzZzNWdFRnlwUVE1TzE0RnlsSGxTenMvT3dQZUVSaWorZXlXUXZS?=
 =?utf-8?B?VzI3dWFCZ0ord2N3UlV3WHYzZUNTTVlwcmZxbHpKYVJMcStlWmJsV2NmNGdS?=
 =?utf-8?B?OHAxdXphbWZVT1F1VmpXN1lYanZWanNyR2o2QnlqM3hsb3BKc0trckcyR1Jz?=
 =?utf-8?B?bkd2UnNoN25HYis0SHpsT0c2VXdQZitWcVk5RFJMR1ZMUXg4a3ZLT0lUeFJv?=
 =?utf-8?B?bWJ1dmxQS05VRnlGb0VwOWpVelRJRjcrZHExUCtnandvcXgyaUVWL0RhbDVG?=
 =?utf-8?B?SWFyUmFYUWorWEYrVlZZeUhCZlo4aHZaSHJ3ZHdNVGNrZHN0M1dFT2pFQ3pn?=
 =?utf-8?B?T2JFUGZzSzNrTDJ1MjJTTVpld0I1dTFuUHZqZy9ydkdwcUNKeFk3UHI3ZGEv?=
 =?utf-8?B?M3o4TDNJaUhES1E0RFBlem92MkY2U2Q2Q1RZa3JmR0lqeU8yMWEyeWFZZlFJ?=
 =?utf-8?B?eHFadzNYNG1JKzZ0OHFFRG9BTW0rU0VKWmhtSkUxVUxLU1RhTks3a0lKZ3Fl?=
 =?utf-8?B?eXZSUGRqV0cyQVF1YzE1eUV5emhUM0QyVUhxejZrQy9JdTh4UCtDczZ6ZlNa?=
 =?utf-8?B?VVFEUm1rQ1Izd0FLMmZQMitkcmwxWmsyVEZBSlE1SEtJSWNLZGFtVi9kVE1r?=
 =?utf-8?B?MldxNzdPcTQwTFZRLy96a3UxY014czYrZmV2eXQwT1FUUkpzaHhXM3Q5S2pR?=
 =?utf-8?B?ODhObXErdFF1TFZBRnBCVHZ4a3JSVWtUeHJaaDVtbGlRbmkxT2pGNExuTmJU?=
 =?utf-8?B?VFpEaHovR09uS2ZEVmgrWjAxREo2YnV5Q0hacGVGRWpsQll1L0REL2xyZDJ3?=
 =?utf-8?B?U2RlckU3NXBwblVWL2NqZ3Bjc09Lc1lBTk9qWWhRVW9UVy9WOTRQcHZzdWMz?=
 =?utf-8?B?NFJtS2NpWFZUTDkyTGh2aWJLVVozcUppRGI1Zmh1dEZPMFBWWmVpNkc0UXNB?=
 =?utf-8?B?bUt5M0VZbGtuZzRhdklQZEVzL1ZvakRUd0FHTjJXUGlMN0VJTWRlTC92V3Rv?=
 =?utf-8?B?c3MxSEgvLzhqUVR6UTlvdzg1UERGZDdUWWhIVlIrQnlYUytRVXFTZDAvS0h5?=
 =?utf-8?B?K3ZBZkFNMjdqb1ZXRmtrRS9UZ2g4b255M21GMlVKUmNxc0NOWHdKaGp2bWYz?=
 =?utf-8?B?MnBlYWNuNHMxaDRuTWNlbWtHVVM2NTJ5UEFaVVRIYjBGR2t0cjMxZkdsN1Nn?=
 =?utf-8?B?eXcyYytqWXM3bTF3RC9ELytzem0xdE00SHIyUXg1YmIycHZsM1l6SWhOSi9n?=
 =?utf-8?B?aW5aclhOa2RaK3NPWmxETXNoc2lTV0tVb2RrRjN3QVh2ZHZxTWl2Y0ZuOVMv?=
 =?utf-8?B?ekZ3OUpxT1JwWTRFdEhFeUwvUkZNNURlVUxFdDh6cjhGWSt0SE5RemwyYnBZ?=
 =?utf-8?B?VWwrb0dVMjdhS20zMHZUV2RlRC8xZkV2VnRtYTZMM2MyU2tIWm1rRG9HOS9W?=
 =?utf-8?B?ek1Fc2k5TktxbnNQaWhHKzRSZXMwRllQOTUxMmdLV25PMlljOHV3clVMUWps?=
 =?utf-8?B?Z2ZLS3BnYUZHSXY3ODhJdnJrQ0pzVWFpMkx5Z25GQk0vem5VK0d4RDBiRFRh?=
 =?utf-8?B?Z3JmSVlJVUhvaUliU1o1ZXBsQnV4eHdYZXd0Y0hQWU5kR0IrQXRmdXBnQ1FU?=
 =?utf-8?B?eVExNlltS05tcHJJY1ZTZ1ZMNDdFaDRRU2FZMG8yb3RGYWR5OEQzdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bce430d0-094b-485c-f289-08de8a805c66
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 15:08:24.7107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v0plf7elHH0U69YvickzzqnLYWRkCBC3rxEd+wmPSIF+unyPy3S5AYTI2Ft7CUzLIDzRa/4FQp6G3Lu0OqlPkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7766



On 3/25/26 08:58, Ilpo Järvinen wrote:
> On Sun, 1 Mar 2026, Shyam Sundar S K wrote:
> 
>> Add a Documentation/ABI/testing entry describing the AMD PMF util layer
>> misc device (/dev/amdpmf_interface) and the initial ioctls used to query
>> feature support and metrics data information. This interface is available
>> when CONFIG_AMD_PMF_UTIL_SUPPORT=y.
>>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>   .../ABI/testing/misc-amdpmf_interface         | 70 +++++++++++++++++++
>>   MAINTAINERS                                   |  1 +
>>   2 files changed, 71 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/misc-amdpmf_interface
>>
>> diff --git a/Documentation/ABI/testing/misc-amdpmf_interface b/Documentation/ABI/testing/misc-amdpmf_interface
>> new file mode 100644
>> index 000000000000..62b0175e1345
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/misc-amdpmf_interface
>> @@ -0,0 +1,70 @@
>> +What:		/dev/amdpmf_interface
>> +Date:		February 2026
> 
> As always, these get stale as we go. Please estimate the targetted kernel
> version's release date instead to fill this field in.

Honestly - do we have any value of these dates in the documentation at 
all in the first place?  Anyone can go look up the date that kernel 7.1 
was released.

Maybe we should just stop using this field in new documentation?

> 
>> +KernelVersion:	7.1
>> +Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> +Description:
>> +		The AMD Platform Management Framework (PMF) util layer exposes a
>> +		minimal user-space interface via a misc character device for
>> +		feature discovery and metrics monitoring.
>> +
>> +		When CONFIG_AMD_PMF_UTIL_SUPPORT is enabled, the driver creates
>> +		a character device:
>> +
>> +		======================
>> +		/dev/amdpmf_interface
>> +		======================
>> +
>> +		The interface currently supports following ioctls:
>> +
>> +		======================== =========================================
>> +		IOCTL			 Usage
>> +		IOCTL_PMF_POPULATE_DATA	 User passes a struct amd_pmf_ioctl_info
>> +					 with control_code set to the desired
>> +					 metric or feature ID. The driver returns
>> +					 the requested data in val, or feature
>> +					 support status in feature_supported.
>> +		======================== =========================================
>> +
>> +		Following are the control codes supported (enum pmf_ioctl_id):
>> +
>> +		============== ================================================================
>> +		Control Code	Description
>> +		0		IOCTL_POWER_SOURCE: AC/DC power source
>> +		1		IOCTL_POWER_SLIDER_POSITION: Current power slider
>> +		2		IOCTL_PLATFORM_TYPE: Platform form factor
>> +		3		IOCTL_LAPTOP_PLACEMENT: Device placement (on table/lap/bag)
>> +		4		IOCTL_LID_STATE: Lid open/closed status
>> +		6		IOCTL_SKIN_TEMP: Skin temperature (degrees Celsius)
>> +		7		IOCTL_USER_PRESENCE: User presence detection
>> +		10-19		IOCTL_BIOS_INPUT_1 to IOCTL_BIOS_INPUT_10: Custom BIOS inputs
>> +		20		IOCTL_GFX_WORKLOAD: Graphics workload percentage
>> +		29		IOCTL_AMBIENT_LIGHT: Ambient light sensor reading
>> +		36		IOCTL_AVG_C0_RES: Average C0 state residency
>> +		37		IOCTL_MAX_C0_RES: Maximum C0 state residency
>> +		50		IOCTL_SOCKET_POWER: Socket power consumption
>> +		52-61		IOCTL_BIOS_OUTPUT_1 to IOCTL_BIOS_OUTPUT_10: BIOS output values
>> +		============== ================================================================
>> +
>> +		Feature Discovery:
>> +
>> +		============== =============================================================
>> +		Control Code	Description
>> +		62		IOCTL_FEATURE_AUTO_MODE: Auto Mode feature support
>> +		63		IOCTL_FEATURE_STATIC_POWER_SLIDER: Static Power Slider
>> +		64		IOCTL_FEATURE_POLICY_BUILDER: Policy Builder (Smart PC)
>> +		65		IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_AC: Dynamic slider on AC
>> +		66		IOCTL_FEATURE_DYNAMIC_POWER_SLIDER_DC: Dynamic slider on DC
>> +		============== =============================================================
>> +
>> +		Following are the return codes:
>> +
>> +		============= ============================================================
>> +		Return code	Description
>> +		0		success
>> +		EINVAL		control_code is not recognized or handle is not available
>> +		EFAULT		copy_to_user/copy_from_user failures
>> +		ENODEV		PMF device not available
>> +		============= ============================================================
>> +
>> +		User-space tools integrating with AMD PMF to discover capabilities and
>> +		monitor real-time metrics for thermal and power management validation.
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 55af015174a5..78773373172c 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1224,6 +1224,7 @@ AMD PMF DRIVER
>>   M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>   L:	platform-driver-x86@vger.kernel.org
>>   S:	Supported
>> +F:	Documentation/ABI/testing/misc-amdpmf_interface
>>   F:	Documentation/ABI/testing/sysfs-amd-pmf
>>   F:	drivers/platform/x86/amd/pmf/
>>   
>>
> 

