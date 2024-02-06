Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C514012D145
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Feb 2024 09:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707212819; cv=fail; b=F605nqmZewkfF/fvNBf4nMQpLSFi4JEazSM3h3qt9xdbl0bnCeNoranRJZYRQgxwb4rIxCtc0iRdtEmKc9UwVTrNicXysV+Y1MNBO6wua2nLq3jcJ+/xb/sMXArnBUpTmYUW+rpNKlt2TGq8vtkCBqYFlWojOb7hfQja8mBes1c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707212819; c=relaxed/simple;
	bh=SVvx3Dy2gsLu/ZKM3m8wXL7gQoiVjv3+PDhvTUhRJKQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=u0L6WnuaJjlzDIk7G8wcYNY9IrIjUeukZWN3kpOjFtD8g3j8PSaJZ/wamUOduu50iWSNzB/GAdSc5KL+BLrFtbjq4nV4Q7XFeiCKzprvRD5FkKRt3ZZx7VSayJWUNajl8ugUdUR17cbvxX1MRNp2DvvomcKlMjAKOEVekiBqdMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VVhWG+6E; arc=fail smtp.client-ip=40.107.237.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VVhWG+6E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbUUYqeXXMspp1FVhuRSkJMm4gnM+ekvOhSwfPxGJfWjuHdo/ogzU4nI84I319t/P6adMFcoYr4dM1VL0jASMWD2upJdqIPmAcnRGStLYQZGIe5ubFV4JfHx+i7G0xYtVy6qnhUIBxrkT5/mXxAMSbLyxe7/Yd1pkUuBAFAk8i0XcIOYL+BZnn/6XAXK/7XB02CHDjH+Z++d6npetiZrAoKCpNC0Pc+ccJLekxkEjR8DyuvIc1VxHYiDInVrdDiSi042AaN6s0ZHzBfvo3n43lgASuOEbjhGw8SCjKAs2pNClzpbLnGJxWP1tdlKHBL1PUksM+yeKz4O0/l0z23GLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQEk/TN1DIhv6ylHBHvmNFFCzijBbwReS9MzS1P8ln8=;
 b=CXXGeID8wutEfbxBJj0RJ0whw8aFDDk0bF3dq9V7QxIWqlxTvlGRSV45i+6UWqw+25jVzYMi71xmBy3GvG7K706HhXPGAL2ls1eNSdBoaTdWjLC57/4ferY5rS22KyW68khW5NDL8qopPJSDmuuBfuPE/ZgXRku9RwBw4N7fzIgYF1PttY7kMyOewzXb08DcWpPO4KUKwD48rL22OoGaONvpHPOg3m7n+KaKVT24IUPJN7sPEE7VJouD70Wr9ABZCBrwsS1v5vNMfEGasG6r7lYUrZWw20DhIhOd054O0Mb32wNsaG3NVw1OsUURKO+i8SSygb2tlu1MccnbEcwrZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQEk/TN1DIhv6ylHBHvmNFFCzijBbwReS9MzS1P8ln8=;
 b=VVhWG+6E3WO4uJzjCiCOWkmWoHqgrwJjPbqZtJryunyasO5IviVu3gQQsRYJbLJPjBQenoKyDOGmhEEG6FajmwuVR+pTpToYUx5hix83uk2ljG4aUEzsEUtCam40zHFaaF2rlSIRT1E7e5dPjA4dX3yNY0gTgUblTCf3c4wkWLU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by MN2PR12MB4336.namprd12.prod.outlook.com (2603:10b6:208:1df::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.16; Tue, 6 Feb
 2024 09:46:55 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::4196:178:d5af:9f2]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::4196:178:d5af:9f2%6]) with mapi id 15.20.7270.015; Tue, 6 Feb 2024
 09:46:55 +0000
Message-ID: <aa1b5796-ec92-41d2-a309-34cb5fa7c90d@amd.com>
Date: Tue, 6 Feb 2024 15:16:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/11] platform/x86/amd/hsmp: Change devm_kzalloc() to
 devm_kcalloc()
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Naveen Krishna Chatradhi <nchatrad@amd.com>
References: <20240106022532.1746932-1-suma.hegde@amd.com>
 <20240106022532.1746932-10-suma.hegde@amd.com>
 <8b896046-2058-805d-1998-7ae6d51edd01@linux.intel.com>
 <0c930967-ce51-edf9-c8c4-5e00d8ff7047@linux.intel.com>
 <6a60fd66-64df-491e-8879-3333c8f119d5@amd.com>
 <576a14c5-e0ad-e6d8-fc7a-0e0121f16c37@linux.intel.com>
 <4b97ff14-dbd7-4c07-9bf6-5f17cd5c93eb@amd.com>
 <1600919a-6475-1b68-0b7c-49f80913fda8@linux.intel.com>
From: "Hegde, Suma" <Suma.Hegde@amd.com>
In-Reply-To: <1600919a-6475-1b68-0b7c-49f80913fda8@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::15) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|MN2PR12MB4336:EE_
X-MS-Office365-Filtering-Correlation-Id: e81d60e0-339a-44be-7570-08dc26f88d80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ulan2N4zz/z2oMe4bedtPmytqUOjp7PJorCUMUnveV6lnNkor8BcoOBLB0OAbuDuOqBsfLYxg4xgL5eqkd/0Nv6vH68ExCFx72HwgFuy9qbiMgTzXfwpMLqLp8Azhnc9BA4xVxCQiUmFrhkLjLbtm7etDZ66nhuXPXGMiBJjF8VN56XjXiHyRczP8Pek/ahOpuknBq/ZwsUEdP/QLJ0Bc6dUVpTypHDG2HVNqe8l51A8HTnlhpmYmPVaTv4Z3A6M3N3zOhQhckJ6Top1M8itartDSF9pNY0+LW9mKNgZNU3hsby4YMS9iybiyAqOSMup6+r6c8dMlpUCMURj7N832VvWpB6F2VSrOe1nfsHNEpm6p6QHzZDy7hhCbOwl0fGUPLAqvS72+wyGlkX2uZ7BQpI8noQaoUfKrwXmCbK/hQkjnbXcCLnXnbujS3PI5hbCQ6jzKxS/1wch+CSN6BUWK32eNxRt6x1sZT7zpG8lW6hyz4D9yCfw34e/6tbiT2sAP/NpxA15kQ8qwtiuGZLVLFoYjT7Q9sKg2dXNVdQtbmy8Z4ErHtjcbbU5eBf7O1el4ACEiZSu1EOHcOaSPSo9TkSxkyLO4vxtTuUcQH55s3Zpix2LUI5x7KymT1vdy8ieFkv13GBdA2elOl2GD8PNgw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(396003)(39860400002)(230273577357003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(2616005)(26005)(31696002)(83380400001)(41300700001)(66574015)(6666004)(8936002)(316002)(66946007)(8676002)(38100700002)(4326008)(5660300002)(66556008)(6916009)(2906002)(6506007)(66476007)(54906003)(86362001)(53546011)(478600001)(6512007)(6486002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzF5UGFMMVZvTFUzRkVyTEdxUXk4KzdNVEpXYU9OQWtnN1FKdnAwZTluRHZw?=
 =?utf-8?B?eFRHQzJOa1NERGM3cFlNeWhsck9ZVk1RWE1tVlRaZU8yb05iWHlOQ1FzSEgw?=
 =?utf-8?B?NzNXVFV3U25aOE9UbTRteUdnV0hsb3NuZ3FCaFBSazJoZVp0VVArcTVqeW0y?=
 =?utf-8?B?dU1QaW5yODhGbXo4bTc5c0k0dWl4UGRPQU1MWnFkY3VIT1lpelFNVy9GczI1?=
 =?utf-8?B?bDhMYThmRUUrV2JXMXZ3TWlBcVVjSjk3eU5OVXZobEdpTHRjQkl5RXFRVTRp?=
 =?utf-8?B?SkNIeVhwZ1dQR2NQeTIrVlkvWkMycitmekt2QmFDcUY5MTY2bllGQWROdUhm?=
 =?utf-8?B?OWpQR1VwOG5EenZtL0tubkZRSDh3RXFVS0plWEF1MktZb1QrN1JlLzNYQlIr?=
 =?utf-8?B?aWlGUmh6NjUvUDRTMG9kZjg3clpwenBpa3diUW5mdDRrVkZEdGUvazRiMnIx?=
 =?utf-8?B?ajhMbDBiRVZWQndEeDJQT3grU1dBZjEzNk8vUkFycy81UHQxUlpKeHl2b0FN?=
 =?utf-8?B?NnJKTWRrQzg1L3ZhYkxFOEszY29JSnFZbG1VRi9sR0RwMXJRMHBhdEQ3SmlM?=
 =?utf-8?B?NXE4VlRHc3RSbFlQWEV4M3BXV0R6TWExR1ByekZ2NWk5VlF3RGhqbk5aY3Fn?=
 =?utf-8?B?UUJwYlYvOEJGczRCQUJ5cmxvNlZCV1JjMTZBdi94RUpFbWhLTERQSkxqRXow?=
 =?utf-8?B?K0JpOTIzYUFlclo2RHAxRVZkYkliaHV1cjZxL1JhVkNyeXpSZFBnb0JlREFX?=
 =?utf-8?B?VjhaTlJHSmU5aFErYjh4R2dxUU1mRVlFQzRyOWM5NVdMYVM5MGVMeWNoVkJk?=
 =?utf-8?B?SXVBM1FlM0l6YzIxZ2hIVVFUcHZWaVFSanpXOTk1SUIvUnBRZng4WnRhQmNI?=
 =?utf-8?B?VlVzS2ZuQUE3MlZ6bXUzT3kyaU5lYzhYZkR6U3FkaTFnT25uNENzSklXdU1u?=
 =?utf-8?B?dk5BczFpbTRJMkNuZmVTRjA1NlRCbC93MXM2amlZME9WY21tYXN5TGZPSkh5?=
 =?utf-8?B?d001WkNEQlF5UTREeUtwOWdnSGR6bUhxQ2U5T00zMWZoS0VadVpFVTBwRThz?=
 =?utf-8?B?Mi8rSzNpUTU4R1phWXRtT0xnQkNOaW0yV1dwS3oySDVXTkx0T09DQWE2VzZB?=
 =?utf-8?B?VGlwMm16V2doSTNhVjR4SGVxdHBiOCswVXV5MEpxVUJrdmZwQzBJdkVCVC93?=
 =?utf-8?B?UVZ0UHpjb1BNZncyM3JwNlczS1ZrVTVrVk1Ya0FGZGZ2ZE5JdmExY0JvaVpV?=
 =?utf-8?B?WVh3WHZCTEltdkJLb3E5U2dNaEVpMkZYRnlSQ2p2WEJ4MXZ5WHJuODJxamZw?=
 =?utf-8?B?NFlYMnd3TG1PUjU1TWtSRy9jMy9MZ0d6ejlvdGg4MlFzU0VoMVJIRTd0d0U1?=
 =?utf-8?B?d3RvdmROcFppM2lWM3hqR1R4NVZYUVcyeTBHMmJrU2NMRjlUM25zYlJuM3pC?=
 =?utf-8?B?UlB0eTEvTkJsOFl2UUdPdkYzc0JseGpYbnk3NHgyeWhZK3d2VVNSWWsyVXNu?=
 =?utf-8?B?YkpqcVlXOEVlS1paa3ZpR2lzL3Rqc3g0SzZPUUZpR01JOVdiV1orK1J3NklK?=
 =?utf-8?B?WGZobGZyV2lJbkdIbzRYZjgyM1h4OWt1SS92Q1RWUU5oYUpSN0hlMWVnOVo3?=
 =?utf-8?B?ZDJWblZWVnZ5SEd4WERmSE1TZldYT1NydGc4eG5wNm5zWnU4U2RjaHpsdy9G?=
 =?utf-8?B?YkZpY1FiTlZXbnZkVG5CdktabVM4WHZYOVJxMGhDYmhDbzhsRjBTQjVZSmFk?=
 =?utf-8?B?WmE4SHVZYVpkaFl3NXZTWXVlblRRUk85VWh3OStuMU0xeS8vOFdEQlZ4a1hu?=
 =?utf-8?B?bHpNZUM5RGpHeTJyWmJnbUdkYjJaZVdueXZmakpqMlpWZ0NkbVlZcGhkeWQ3?=
 =?utf-8?B?N3VYQTZYYThTUGdDWHlUSVhRSTdEMjJWZ0NMK1hjdzBRTDcvOFZmY1ZHWE8r?=
 =?utf-8?B?MGgva3lLWHJJYXJBTzhFN3Z4cElqWmxnNVBCNDlEUHlUUU0xUlZySWdHOXBS?=
 =?utf-8?B?N3NhWkoyeWtsRnAxREEzZGFabGNCWjJSc2JWeHJTeUxraElWSWVXbjRWZm00?=
 =?utf-8?B?S0JlZVhqRDRZYmY4MGgyYlo3K3lFMUxlRXF6QzBxVWFPN2tHa3o2ek5JdXNI?=
 =?utf-8?Q?pP9ZD3y0G95s6UkZZEc1PlDIl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e81d60e0-339a-44be-7570-08dc26f88d80
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 09:46:55.0568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LBYXxcTAcTKtJdzpjY0MClspelM7CM8UqWqRPX+DlYPrwldiIIMaTABNjC+c8LT/hYVUAPqOm6CETYUtGA2yJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4336


On 2/6/2024 2:34 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Tue, 6 Feb 2024, Hegde, Suma wrote:
>
>> On 1/31/2024 4:02 PM, Ilpo Järvinen wrote:
>>> Caution: This message originated from an External Source. Use proper caution
>>> when opening attachments, clicking links, or responding.
>>>
>>>
>>> On Mon, 29 Jan 2024, Hegde, Suma wrote:
>>>
>>>> On 1/29/2024 6:14 PM, Ilpo Järvinen wrote:
>>>>> Caution: This message originated from an External Source. Use proper
>>>>> caution
>>>>> when opening attachments, clicking links, or responding.
>>>>>
>>>>>
>>>>> On Thu, 25 Jan 2024, Ilpo Järvinen wrote:
>>>>>
>>>>>> On Sat, 6 Jan 2024, Suma Hegde wrote:
>>>>>>
>>>>>>> Use the standard array allocation variant of devm memory allocation
>>>>>>> APIs.
>>>>>>>
>>>>>>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>>>>>>> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
>>>>>> I decided to apply all but this patch 10/11 into review-ilpo. I fixed
>>>>>> the
>>>>>> parenthesis issue I mentioned in one of the patches while applying.
>>>>>>
>>>>>> Please check the comment I made against this patch and respin this
>>>>>> one.
>>>>>>
>>>>>> I also noticed while applying one other extra parenthesis case in
>>>>>> patch 5
>>>>>> but since it was not added, I didn't go to tweak it now myself, but
>>>>>> just
>>>>>> you know.
>>>>> Hi Suma,
>>>>>
>>>>> There are number of issues and warnings due to these patches including
>>>>> one build failure due to lack of ACPI in the config (I think), can you
>>>>> please take a look at them.
>>>> Hi Ilpo,
>>>>
>>>> I have pushed patch with fixes for smatch error and warnings.
>>>>
>>>> For the CONFIG_ACPI=n build failure, I have added "depends on ACPI" for
>>>> hsmp
>>>> driver and pushed patch for that.
>>> Hi,
>>>
>>> I've folded your fixes into the relevant patches now.
>>>
>>>> But we support NON-ACPI probing also, there may be x86 platforms with ACPI
>>>> disabled, is there a previous reference of how this can be handled
>>>>
>>>> without making it dependent on ACPI in Kconfig?
>>> Given you have quite much code that relates to ACPI case, perhaps
>>> creating hsmp-acpi.c wouldn't be a bad idea so you can make that file
>>> depend on ACPI without polluting the hsmp.c code with #ifdefs.
>> Thanks Ilpo for the suggestion. I will address Han's and Greg's comments and
>> later will work on splitting the ACPI code into separate file.
> Okay, thanks.
>
> Mario also raised concerns besides those from Hans and Greg so could you
> also take a look at them as well.

Yes Ilpo, we are working on addressing Mario's comments as well.


Thanks and Regards,

Suma

>
> --
>   i.
