Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012070.outbound.protection.outlook.com [52.101.53.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2943CF218
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 12:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600297; cv=fail; b=eq/kMJHpu4Io7nKrHtVg6fm1PWAxEzekWdJFBXyB8M7gXMELAFYBm/qHzh7zlRh0HiJDw7xss5Z40fmC2tlGhjhlI1+OIRLIigexpiMuk7yalLsMApYOcoxgp/zhmSxsnLoRYujqvnIkZ93D46UNHf2f2l9GrA1uOCdyanJqxWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600297; c=relaxed/simple;
	bh=TFectt8s6nxnwPnNH3+X3ddwmHmzqhBcPUzqP8wSet8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gOVkf7dctu2ArVGidB9yeV8ZsYj5WHr4i14mG0tB/ES0b5Wyum8w0ciPb0QV003P3EloVKQy+gapuvHYY+00n32Qn37l4hVrdsDrxBpbXTdLiGzOD8A58preL1ZaM8mGDD2wTt2otHQR67zjghtAhru3l5IytzzvOARrM2fkYW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qtUMiG3U; arc=fail smtp.client-ip=52.101.53.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qtUMiG3U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SCpMe7Wh8wTfb3SdznTuUJfE6WJtIRiURT7YwYyRcrp8hfBkM1fCUeSm0OzOxJ3IybS6x/fVxDgzCfe/5igSYJObChK4Gfsb83D4d1TUNb2ISFDnv2Pe5MWbVTM8CorNP0/jzyzuxFHYYFJqTWE1CR1JtfmFt6jK/T3ktLenmuJgspWzG4rC+upkFPO35o3rjO1+azdhIUFTuMLRul9Ml/18VSxyfN0cpQ52lY2iUKtcW8cYChy8pDH1MYG4MDneI/n9ptDUsMD0jwRAuo3DFkzzi5qdeoC8yYMFdJM6/f28eIcjEs8sOMY1N4k4hC4GLl0U8bbWbfzuDTbK3e9Dlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZRq3DRmH/4BqI6scVl6CfFrxupvvvjnq5URAmsoAMU=;
 b=jaOm5xMv8HPSH5nfKWbblkTK5DUzt+B/abpFX/cQGdObalPvvDjpvLipWRCI1uNwQUI7toQXt3Si5dYtx3FReFUnw8N7BS+JGZA8uqLpnqAkuo04VYkORWl0lmLbljpcKJ8Cu429hYbuncqxSY1wK215FwvkC6XYsRlj2fhxEBqgiSkPFRLEhStXtbI4QZOtuXxBoKwNnC8JTR3RkWvX4jb2b4s2wO6woDee85IhWG1kQ9fPzhAlHMXAdUpsr0KzsGRkqNgsdqiHni3TPiyhoIgjcjqK9oBsNT5Io8Lz944+QjmefK4PMNHbd0OvBxL8FKyFjY1N5E+ufWeaDxXlFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZRq3DRmH/4BqI6scVl6CfFrxupvvvjnq5URAmsoAMU=;
 b=qtUMiG3Ui9wlNHb9VSkmSnc6Jj2+ceoet4GzXembfsh/QbhgyRGXzv3lAloDSFpAfxj52yhJ8Vr4vNETX5sdbpTKkSH0Qvr9/g4igk01+vbO2fxR8iXlJ9l5LMAyzEgq3FJ45aPIvDWPgN/77z2UNOMumLIGholO2DGnGVLZOFI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by MW3PR12MB4346.namprd12.prod.outlook.com (2603:10b6:303:58::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 12:58:12 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 12:58:12 +0000
Message-ID: <a26d6b46-ef3e-41c8-a542-cf866e6c60c8@amd.com>
Date: Mon, 28 Sep 2026 07:58:09 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: amd/pmc
Content-Language: en-US
To: Karsten Wiese <fzuuzf@googlemail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <CAM=nh0S9e1+_U4WGR92HwOrNC2h2xYb6eKvgN5_skg-vvbSbqQ@mail.gmail.com>
 <d8d7a246-00f4-42a5-881f-66839eb6b302@amd.com>
 <CAM=nh0SB5uhsqGyH9v_1N1oZsv94SmrJTqWi_0YVbULgY-c_aw@mail.gmail.com>
 <c733990f-844c-4ba5-85fa-a0dad627ecad@amd.com>
 <CAM=nh0QY9-G2PJKpyrXe+h1FHvc1pv6v0-AKgPuMRQC=QtbRZQ@mail.gmail.com>
 <CAM=nh0RbdpmEbKxyfbk1JNEjT0iXmBKMyJuxf0TRNwywHVOLHA@mail.gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAM=nh0RbdpmEbKxyfbk1JNEjT0iXmBKMyJuxf0TRNwywHVOLHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:610:b0::12) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|MW3PR12MB4346:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f4f6497-f5f0-41ac-2182-08df1d602737
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|22082099003|18002099003|11063799006|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	xGX1q3G1dxu3/zstbD7XG1zXaYWvpsDdZrrh1Y3Y8vB9tAwt/m2TAjQnRkViVYhH6LlfXu0/6QBwSn+cZETuCOuBPq1YBwZA1+j/M2IJdO2HbETz+2yVUxzTBsN6yNbGtRRWwnyk2cfX23lR2LYmk/rEcRtMgrAtdWC+2XZzw1JF8yLnCewiEktZ+WskpsaoLURTJg0HVSw9olIzegUsfTm4rq4vjsvZL4+uoMYY/FporG1G8o0vXKns1WKHV+CPWfUYFHR2Jqs7MRrSGAA4o7sk2Eg2i0h7BQKYnLVYeFKDE3hlLf1X5SVwgN3jDywtpc7HDsgIkffJlS+e2A6P3npy/ty4fuCmEv/lT6lTFSE/1sII2wxIqg5shchqNlcXCHpO6gYBUaJUYRfH6R9xvJAPpK6bYkxSZOUWIJxLVVIbOl8LbLvXPVdj02+cYVRtPZXihM5z7UAcXp7eQ7z5TNhtsbq0JdPHC4t3btdW2Uue8OolXGh6BA+kxZ6a7GYfU4EF2dz4n3a8WCrmA7PhJogoDXaVDltlENi77/3dtA2759mooPkpcHgWqSRuqDiBxB4T18Je+kds5DcJjLcL01+d0zvg201HjHOyN65ENUxOACVwbPGJD0tfa6SVcngWJgiazbuvATl/xSWNIyatdJ3l0cpSzUrI8i9/XdRXPEk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RytrUFRROGlVT2R4VlNGenphTjZ0bm1PWEpHNGNkU1ozMjY4UnBvWmc0d0Zt?=
 =?utf-8?B?aHphcWUxR0hEZ0V3NTVhc0x6d3RDRmJCcEpXRUhNc1pVU3N3U1NPa3NiTUhL?=
 =?utf-8?B?bEwwakcyaENiS3RKRlRzaEJydEFzK0FjQUZZRHVmOUd3YytvcVpyQkRJZXVH?=
 =?utf-8?B?UUFWWVNjYmdNT3gyMzIxOGFwOUlJQVhsalZRMSsyRXlHN0M5N3RRak9JU0pl?=
 =?utf-8?B?cERLZ2JqOWwvYnE2L2UzQ2RYck1LVi9Ick4zSXc5eGxzNUZSMmRvOVFkMGdH?=
 =?utf-8?B?R3lPU1p1NktxOExyTjBNei9NcFpmVk50dHE5S0h1SEV4ZW80RTdLOThHcFZh?=
 =?utf-8?B?ZG8vSHh5dnFURWZETnI2dWg2NFYzSzdIVmtIc2lsSG55VUF6MDBhaXNoekRT?=
 =?utf-8?B?SVlQNE5LN3E2R0ttanNSYnBDQjlaWnNLYjYwSGdhakdoV0RjQ1g5bVFUL0JM?=
 =?utf-8?B?QTAzN0FJSm5kVDlSb2tFTjdOQlgyR2w2T1ZmVzBkNjRycjJxR2V4Yy9EcStu?=
 =?utf-8?B?NUN2YjNoSXg1WVJJeGM0NE16WU1OVFdwc0RrZ04yNnNqS1Q1OHFKL1ZkY1l2?=
 =?utf-8?B?eEdrT0laR1pyN3l0S29ETlArUnRZV3FoM0tCQUtRNGpFVjVpRlNHN25hajRY?=
 =?utf-8?B?OC9jV3VQUlNoZ3RCWDJVdEJZS3dLMkp2bHg4VXJObWxXMzZmOVE5Lzd3SkZ4?=
 =?utf-8?B?UDhXWXA0K295bDgyOFBkYi9JU0RWeW9iNm5ITWxWNVBqTGR1VHpPRG1TUGFp?=
 =?utf-8?B?Y2RFSjFxcm1hcUVQWVRNMmpQNDZ0ZjhRU1lFaFdmTDVMV1NuSk05L0pva0c3?=
 =?utf-8?B?U2pYQ1l2My80Q0o1QXZURTJXRXpQclo5RElHNENrK0hxRHFUb1FhTFNrNlB1?=
 =?utf-8?B?ajBBREhha3Zkay9oN2JwNkVFeFdEWnhOVWJiamJCWmM2ZWhtZFZRQlJmMDVw?=
 =?utf-8?B?ZVVGV2FDZmx6bTM3L1hkWHk4eFpYVHNaaVpJaGlCdGJ1NlJDdVNiZkxZblZ6?=
 =?utf-8?B?L3NDV250UWhjOGJzQldaUkw4S1d1QXlmcjY3bmtZQytzQkVzTjNzVVVzejZC?=
 =?utf-8?B?VmIwUW5LOFhWYzJXM0FGekUzYXJENEUwOEpqZEJpd1VzOE54YTVCTCtKMlVh?=
 =?utf-8?B?Yno1aVVyL291TWxoTUZKOVBHQ0s2MktBZDV5eUh6S2prcWV2NVJpUkpDRG04?=
 =?utf-8?B?bEllT0tEVG43THE2M2s3VHExWnFCaHRIREEwbDEvQzdjT1hFcW8rZW4rTEhl?=
 =?utf-8?B?bWxlYlorS3k5U1UwMGRZaGVHczUzQlgvTUFEc0ZCZ1J1eVNjVXBsQUVZQXU5?=
 =?utf-8?B?NzZiSDZYV2dsdzc3VXFyaDNjMGx6and3ZTJ6U3A3WnVZOXpxRVkxQzRneDht?=
 =?utf-8?B?N2U1dTFsTmI2UHBPQW8ydHNDUUtjZ0p5dmpPR2RleVduZjZNeFpwS0I0c1hi?=
 =?utf-8?B?bEJLMkplcUpvTGV1UjdPWlQ5MlY2eUNlbi9PYVh3Y0xqTTNKYzhqL1I5dWlJ?=
 =?utf-8?B?T2dEd0V2eTN1ckxlSXZxK3ZRazRYb2lhZTVsd2VRbHlUNzJ3TzJTUlRnVnFU?=
 =?utf-8?B?VmtDYnB2RXB5RHdQYVlSdU14YWpvaTB2YUhra293dUpYazB6Z29kZlZuRDd3?=
 =?utf-8?B?L3dsSU4wbXlibEo1bU1LU0RGZGZRQWtLb2pWZHdSS2wvcTAzN1NpWUtYU3hh?=
 =?utf-8?B?eXgvdVE3VEZUQnh4c2p3UnRQcXBocWR6T2xES3J5RXFRMVdmR3RocXJlalhU?=
 =?utf-8?B?QTU2dkt6YVYyVzVPUU1GSUF2ZzdxRlFDL05HL0lUUGZLOGJVYlJzamNrYzVk?=
 =?utf-8?B?MHpuUkhkTTVKNkk5TkpqQ2kzQjhpZTV4YWthYVJsUTRBeWs5RnQrclJIei9N?=
 =?utf-8?B?Lyt2Tk1aeHMrRnorM1FoSXNiUHJOK2VjVXlOZnkzZkxaSEQ0ZS9mY0pBOWRi?=
 =?utf-8?B?REN5VTUxaHQ3UnNrM3BmY2o5eGx6WkVIVUI3YUNLNTlCTVhoR1B5VVFKeHZH?=
 =?utf-8?B?Qy9MNVhKZWpOTElPMWNwb0E0bHRZUTFQcmtPOXlTS2ZDT2RlMUdubHljSWt3?=
 =?utf-8?B?N3VDM1NUalB5S2RkMENrMFNtK1NiOXI3ejRNUmExYkZuYkFCcHZZNUZXckZM?=
 =?utf-8?B?UnRZNG1yRlhEL09zNnZ3eGtxN2FhcTdIZVhROExyY0dnWTFjdXNaaURlcXBP?=
 =?utf-8?B?bTBLMlhLQlpyVEhCODM2b1FsZVI4MUppWmxVRkFvY3RwQWg4VjNlQXdzYVFQ?=
 =?utf-8?B?Vlo0enMyUUY4ekc2L0hzSGZ2OVJoZE1wRmo5Sjh2eCswUFNLL1UxV0VDMExX?=
 =?utf-8?Q?Kf3H3CriwLn1ycIwYG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f4f6497-f5f0-41ac-2182-08df1d602737
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 12:58:12.3333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jpPnoBVACv0YB9HhYUjSs0pe5mUae7039r8CMx2zkzihEabkmzjGY+5JW3cAq568IV3RTVSw/0JX5OInAyr0ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4346



On 9/28/26 06:14, Karsten Wiese wrote:
> Am Mi., 16. Sept. 2026 um 22:30 Uhr schrieb Karsten Wiese
> <fzuuzf@googlemail.com>:
>>
>> Am Mi., 16. Sept. 2026 um 22:05 Uhr schrieb Mario Limonciello
>> <mario.limonciello@amd.com>:
>>>
>>>
>>>
>>> On 9/16/26 15:04, Karsten Wiese wrote:
>>>>> * What issue were you having before?
>>>> The system would hang on suspend to RAM infinitely. Sometimes it
>>>> suspended, but the fan kept spinning.
>>>>
>>>>> * Was it a problem on every single time, or just sometimes?
>>>> Sometimes it would hang on the first try, sometimes it survived some
>>>> suspend_to_ram/resume cycles.
>>>> When the fan kept spinning, I woke it up and suspended it immediately again.
>>>> It never survived more than 2 weeks with some 3 cycles daily.
>>>>
>>>>> * What is the new behavior with that module parameter in place?
>>>> 17 days without the fan keeping spinning or the system hanging on
>>>> suspend to ram.
>>>> Followed by restarting into a newer kernel.
>>>>
>>>>> * What BIOS version do you have?
>>>> MDCN30WW
>>>>   From september 2023. Should update.
>>>>
>>>
>>> Yes; before we pick up the quirk, can you please try to update to see if
>>> it helps?
>>
>> The latest BIOS Readme doesn't sound like updating helped:
>> -- Excerpt start --
>> Summary of changes
>> ==================
>> General Information:
>>
>> MDCN40WW:
>> BIOS Notification    :
>> 1. Fixed
>>    1) None.
>> 2. Add
>>    1) None.
>>
>> 3. Modified
>>    1) Optimize network related logic.
>>    2) Enhancement to address security vulnerability LEN-198949.
>>
>>
>>
>> EC Notification    :
>> 1. Fixed
>>    1) None.
>>
>> 2. Add
>>    1) None.
>>
>> 3. Modified
>>    1) Modify the combination keys of fn which fix some key may been hold.
>> -- Excerpt end --
>>
>> No Windows on the Laptop, will take some.
> 
> No more suspend to ram / wake up issues noticed.
> Quirk not necessary for BIOS MDCN40WW.
> Bios installation on linux from dissected update.exe worked fine.
> 
> Thanks

That's great to hear, I love when we can discard quirks like this :)
