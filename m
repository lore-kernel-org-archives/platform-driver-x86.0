Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92436CDB482
	for <platform-driver-x86@archiver.kernel.org>; Fri, 13 Oct 2023 07:23:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbjJMHXG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 13 Oct 2023 03:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbjJMHXF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 13 Oct 2023 03:23:05 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2047.outbound.protection.outlook.com [40.107.101.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD279B7
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Oct 2023 00:23:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYkEh6FO75f6D10Twn3OIiX0AZpssN/LwgF6pA2fK/nmQFCnl59S/eqjeJagNOIvDSvk+XIcshFnz4YSO0FxzKK2I5uNNXKOUtfjVwdiWrqQeu0D7kNAYmH1iGKCnnXZKIRA7rVxPWFkw04xbt//zTUpfGWcdVE5g+1RJ3kR7b6+pUlKPNMxRKd54/xtnaC8ysoNu170vngw3C0C4L1yKXFsvAG3sfdQ4ukmpvnXG7ObKo/llpCCHiWz7HVAXqN54cF9ccaKPTIhhOL+xS4hDql6P9m/tT9oSLy9L+sodqnA74Sg3QC54nVT0De+3889+7U+gtSf3deM9lJbSF+D9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rabbTbRFUAjCpmdpS0XXa2yWIUnvgA6O+NmiJBIzewk=;
 b=Veo/dZrX7chXyym0nqTEFTCgzB9a/E/wGgi0gvA3dV3Fhqmdwk8j9DAZn3Bt8WLFTiPlTZSEQLxfL39Pp6QgqrrCniz1qq6agW4oTsZTGHy7igTW9cenPSvIKAKcl+alfg3YkBVzIV789JxjPUBnxY3qGVVdnh6EJX+dcReD0nCe3mb9qeMVG8Gu4cLd3Y9TqlpPAdmKW29jtE1RNUq2NE0L6lnIf/NK3+366N0yonzOh5zQIPhOp4RhAvuKFuh8iwFf9srlcP+IXiVvbXGsbVJm7gvgqTDEik9CPhvmhyj1gGFXZ3f6ffQ6khLtdaZmGsQ3/DSvhx/oLAdkfYiHng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rabbTbRFUAjCpmdpS0XXa2yWIUnvgA6O+NmiJBIzewk=;
 b=tpjN3mWIbEXHKt9JHAo61aWi7aNuU09IlPULgwwFmTVpSseX7EYowa2ltrSLvr9XOxfID29cOk2/AIcxnXog1P9a7vEInBBQ9vLTpclf2cCWxznMWpepme1FhziH1u75YOA2iPRZliw8iny2Nf3t+i3I9WFwovEx6TM3pTGWtbs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DM4PR12MB8473.namprd12.prod.outlook.com (2603:10b6:8:183::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Fri, 13 Oct
 2023 07:23:00 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5%4]) with mapi id 15.20.6863.046; Fri, 13 Oct 2023
 07:23:00 +0000
Message-ID: <97ee4e13-5c96-4857-8e08-b4559feed3eb@amd.com>
Date:   Fri, 13 Oct 2023 12:52:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] platform/x86/amd/pmc: Add dump_custom_stb module
 parameter
Content-Language: en-US
To:     =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org,
        Harsh Jain <Harsh.Jain@amd.com>
References: <20231010145003.139932-1-Shyam-sundar.S-k@amd.com>
 <20231010145003.139932-3-Shyam-sundar.S-k@amd.com>
 <5f3241ba-a9a0-10c5-f139-c6bb42c75ac9@linux.intel.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <5f3241ba-a9a0-10c5-f139-c6bb42c75ac9@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::35) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|DM4PR12MB8473:EE_
X-MS-Office365-Filtering-Correlation-Id: fbc3605d-6ab0-4577-3d2c-08dbcbbd3b00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T2+3UZ7RauEiN4fepKn1xjI2KTNvXm2bQrA25nL0vruFZXhWGOnNwHPo+Gb8gXQhmBKPOVY2pfg3n6XhBoiezW04oLXOWlo/Tu5gEYGx9rOCeddrirDBUMMI3XoxA82PM9RSpl+iy/INNIdWfOMSQtrTADp2DoLctTRMpI9NbEDWmmJLheplMLMFE1rSrc6C9lgKm6ZIosseeywXhbJMeB4CRmNjQYdOgtCqTL3m7YuteLHE7Sfp8GEqMe2ihZ1u/ywVczvWUm30YpwXfSea50dzpFeN52sKbfdL5AUPYg5HKgBGQM4/3s4km81oyy+Ok1O2GPMZnDf2QDJGZxWdPlM576GPydyMQ67o58e5ohVQAk/47aHiAfs2IPdJSWUiRvFguu9apNO/rbYZXx2sjc0456BjC1YSzq4Coo7RA+ewOMT5MDEx/vCxk0IYTfmup82WffiVC+XXoBmIremJyF2HLIZ7ibObwDQoXizvEva7Iob8g4NDjz1ct966Mk+YXDfFmeEBv51xb/E6o6PSzuKFnWJ8mj+uE0NtU/Y8zn/o8qK1etiupJ1JCdrplOF8QOynF17T+8nU+/fnSuPHAwK1Kz6c94tD267+Audtr5hyzg5yrUiZY71B5FpyP/WNeRl+V+bJ1LbyBBqXAhMP1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(396003)(136003)(366004)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(6666004)(2906002)(31696002)(6486002)(478600001)(41300700001)(4326008)(8676002)(8936002)(5660300002)(66556008)(6916009)(66946007)(54906003)(66476007)(316002)(6506007)(36756003)(83380400001)(26005)(66574015)(31686004)(6512007)(2616005)(53546011)(86362001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWNEdWxjUG5sTG0yY01ORDdHMEUvK0VRdXgvSTdLWkErdWxiNytnWDlBT0Zh?=
 =?utf-8?B?ZXVpY3g5TjJYVGhzU1Y0TGZSaXdBdHluTWh6MEhmUEJjS05GaVc1RjNOdkx3?=
 =?utf-8?B?dmluNU1meGsrTmNMc2E0VzI1SWFLdFlrQ1drQVQxdnRGZGRWSjhXZWxaQ2p2?=
 =?utf-8?B?TDk0OG11Z3RmTmhGRmRoeVNjby9iaFFtSEZ0elZHd1N5OU1sS2Ryb3lDQWJE?=
 =?utf-8?B?UjhhbVNHazFsRWwxZ3BRUlMzWHpwZHViQ3QrdWY3RCtaZG1nWWNWa3BwQ05W?=
 =?utf-8?B?dENjZXBUSmMwTHJEU3E2bGVSbXczcytUOXdhbHZGbVB3SW1JOC9McXhBcW80?=
 =?utf-8?B?bXpPeWxrMkkwYlNnbTV2cmZEZUZIUlF0SGszOUpIYytsWDEvSXZ2VGwxdmV6?=
 =?utf-8?B?eU9Ua1RLVXE1a1hSazB5NnE4cmVHWHBXSVRwZ1g0L3V5T0JTZVp6KzRDQ1NM?=
 =?utf-8?B?VElQMGdUQUt6MkQ5aHFja3dMWU93V2p1eWdkdHQ4aFMzdnZMVWFaNFBaMkJr?=
 =?utf-8?B?ZUR2WXZhZWI5ZFdmbmVuQVRDbjk3cmZ0eEpFUis0bDV2TlUzTnJNdkI4QW5M?=
 =?utf-8?B?RDZTWjM2RnpGT1RwUkIrZGRRVXM5TmlKWUtiSkFpbjd5ZXNRRGg2TUlkbGFB?=
 =?utf-8?B?YmdtMGpJRXVvempzK0EzVWtFVHREUkJxemVKZlNEN2FRR2FaWGFNTWpyd2NS?=
 =?utf-8?B?YlpZS2wxczRaQ1hPejZMaityL0VWano1NzAwSXg0NTdJUVM0cXgrY056TjY1?=
 =?utf-8?B?N0dEVzlEUXBYaWtZc2NMMWsxdEk3ZkIrOFh5TjRPY1oraklFbzJwVWFpQjFr?=
 =?utf-8?B?eE5KVERDWVNFcVA3bFEyd3h1emUwV2NnVTNDMjFVb3pCT3o3aFgva2s2eEpy?=
 =?utf-8?B?a2p5MU1zK2FvQmhIaXV1U083MDlCKzRta2xBNHR2eDJaa2FTOUhhVjl0KzM1?=
 =?utf-8?B?RGdQM2srQnpBbUFQZGRvT1F6a0NFUDgrQVhsL0h6NVpiVU95UUM2bUlWQktS?=
 =?utf-8?B?ckxRNkd1YUZuQ240dUpyV2lJOUR1dlN0NVdyWmU0WHhWTzhKWFNpZVh2ckV3?=
 =?utf-8?B?bDhCQ2hoYU56QTUzNUFWY2E4aUpLbmxSMjRTUG5WVDNQV0c5VE5UU2V5YXU1?=
 =?utf-8?B?WjhPRG80Q3NURGhZS240TFo5WnNacU15Q3hlR0djTDVuNmVCdnZKdDBoRlVs?=
 =?utf-8?B?R2dQTjJMU01ldEk1cURQNkZDWkVxbEpuZU5CY3BqUlFLNzF2MlhmTzZTRWFE?=
 =?utf-8?B?UlRiRFFlb2R4eHRxVGlSY0hBUHdzZjRaeW1kbERZMGdteWlzUjFraVF1Ykla?=
 =?utf-8?B?ajRqbTg0SkxtS1JEZjdkU05ZWnhXbVNyMWFDZm1aYmlrYTEwVkRzYkVZSmNq?=
 =?utf-8?B?QlVTQXA0L01rd0tyaGVNTi9HN1V1ck9mRWxZZVJvUEpMY0lvNGE3MURROS9w?=
 =?utf-8?B?N2xJbnVuZTNDc0IzQnQ5a1UxbitueHFKNDl6WkhDcGVaNEYvZEZXUnpPclBv?=
 =?utf-8?B?SmI5TTZIWlllQmpPWjNRVWxXc0h5c1VIK3I0Q3phTXNxN2hlNUNrZ1JyOS9Q?=
 =?utf-8?B?Q3o1Z05oeTdyZXh2VldYbFRuSzlPMXl5SGM2WnEzeEFEa01EWklLaEt4bWsv?=
 =?utf-8?B?LzVpamloWjZDdk1NRUlLU2g0UVJCWjViQTBobi8xLzV6NmNuS3M5Ym5rMkZy?=
 =?utf-8?B?V0NQTHRqTkhxVko0eW9pemZHVzB3d2orSTlJKzk2UW5DdlFxVndjamRGNGxB?=
 =?utf-8?B?cytiMDVyMlhReG9GMWpIeTNMU0tKdGNXR1JHZm5rZUVxbjd3eUN6K2RFZG03?=
 =?utf-8?B?dXFib2ZFOFdaSkdDd1F3QnZBVWl4QkZRSGp6WFBGcVZxQ25MNDZ3SlBiaFJs?=
 =?utf-8?B?ZFlZa1kzTW9XQ3Bud09HTDNWaithSzhNclduWWVQVXBwRVpEdU0wK3Q5TVBk?=
 =?utf-8?B?WjJTYXhhKzZCcGw4Vkw4dUxCMUJPc2pmRFE0WnRwUzhTVExxYXlOcFRpTmNJ?=
 =?utf-8?B?bDRCL2tpc0lwVmVIVVB5Q1U0dTVVWUU1c0VCZW5ua205d2I2UHJJMk0zakhR?=
 =?utf-8?B?akxaa1VzNzFsZmlwYjRxdDU1U0RjdllRY0hQZjhmbkNWa2RVZXdUaXFUWEtj?=
 =?utf-8?Q?hyBkdi5Dt0NcyqLmMlgnVwaHO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc3605d-6ab0-4577-3d2c-08dbcbbd3b00
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 07:23:00.5402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1gshxXJCm2i+jL3HvpNYufnJ04H6X+y4CI1OWYT5T8XPbJTNAZliIpYb/r4JAqbb+6jNFY9/eRfM0nAlVO58NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8473
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 10/12/2023 7:38 PM, Ilpo Järvinen wrote:
> On Tue, 10 Oct 2023, Shyam Sundar S K wrote:
> 
>> There have been instances when the default size (1M) of the STB is not
>> sufficient to get the complete traces of the failure. In such scenarios
>> we can use a module_param to enable full trace that shall contain more
>> debugging data. This is not a regular case and hence not enabling this
>> capability by default.
>>
>> With this change, there will be two cases on how the driver fetches the
>> stb data:
>> 1) A special case (proposed now) - which is required only for certain
>> platforms. Here, a new module param will be supplied to the driver that
>> will have a special PMFW supporting enhanced dram sizes for getting
>> the stb data. Without the special PMFW support, just setting the module
>> param will not help to get the enhanced stb data.
>>
>> To adapt to this change, we will have a new amd_pmc_stb_handle_efr() to
>> handle enhanced firmware reporting mechanism. Note that, since num_samples
>> based r/w pointer offset calculation is not required for enhanced firmware
>> reporting we will have this mailbox command sent only in case of regular
>> STB cases.
>>
>> 2) Current code branch which fetches the stb data based on the parameters
>> like the num_samples, fsize and the r/w pointer.
>>
>> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>> Co-developed-by: Harsh Jain <Harsh.Jain@amd.com>
>> Signed-off-by: Harsh Jain <Harsh.Jain@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> 
> Applied to review-ilpo with following changes and notes:
> 
> - I renamed flex_arr -> stb_data_arr (in patches 2 and 3)
> 
> - I had to resolve a conflict in patch 3 with another addition, which
>   also came from you. Please try to proactively construct your series
>   such that this kind of problems are avoided (preferrable) or, if
>   unavoidable, at least note the existance of the conflict.
> 
> Please check I didn't break anything with my conflict resolution & renames.
> 

Thanks Ilpo, everything seems to be working even after your edits.

Thanks,
Shyam
