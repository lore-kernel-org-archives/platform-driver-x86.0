Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB6ABC38145
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Sep 2022 10:08:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231262AbiIHKIe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 8 Sep 2022 06:08:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231258AbiIHKIa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Sep 2022 06:08:30 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E699BE1246
        for <platform-driver-x86@vger.kernel.org>; Thu,  8 Sep 2022 03:08:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/NCDcBuzCx3JPvPrHN4ma7o0yR1PT26nh9hIcrE3ShGGDEn3JWIOFaIaLXBbmFxOiW47jtkZQAkMjqVQiHMAfBqfXl+U9+YDpWBmseA6A7Ow+oZgRsmJhDDfnnDcxiayRTRIvGxdD4OqSf6a/8zSybkKeKru7HYfrYypWysJ8MhUUqApy5U0fmaHQ5H8go85Hw1R5x/j91Vd6CoKiFQJP3xxAe9hCkZQqs+/UwN+c8eVH4aCVQLLO+6nfLRCBv5c/XbEnVNylM95JU17InLjpQw5Jz/S2fdMvQoEQRKMcf0KkKxEg+WpQKzCHClZyXGkbFIwIq52Oep1VtV2DyYkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjGvxMGbUmNNI10ALnhJiCT1wSpo/m1kj2guZmMVNOQ=;
 b=SXnABWEERC6bx9YoSZ6Bz3jDpAzjfgANSMPwXDGqP9pvjQ/09PTsM7zRQBcRfnwy/yR+uYQ4g4Fk7pjZ4OTBlBhVPE/Zvltsvt/vwsts8BneH42ozypLKROJs2WmdPss+TmTKUhnd4U8dEQjfYnymXl7f+/g2PU/y/iElkqCmttvRNXZhBXNMcjU4YqRSYTAl0ZibBXEuPhMMI1ZK6r7NzvsY/kNdQY+lbLa2+p9K9fV8Zp4wyLQpZAuMKDDDV5DfyAWFw2l098alFmY23nTuFM+V7F6EOMXl+FOY3PJVNew77bZAeeQ5sIsg99EdCvlo4cCyFJvWkMXPerfc2UyBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VjGvxMGbUmNNI10ALnhJiCT1wSpo/m1kj2guZmMVNOQ=;
 b=HbOVHWpr98uECOHXPntkrwpFxg4WDVPEXrLv4B+bOAn/ixSU5SCACoUu0ttKnb340S2R9VBLJOUypqnJFvg+1P4/ADQKthD2FQk0m65tRRvJQuKsjWNi+xYtyPUmc/qAQhbfEG3cl+kPTQ8NecvDFE50TPVrD+OcyBLTRz8Dtuw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MN0PR12MB5860.namprd12.prod.outlook.com (2603:10b6:208:37b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 10:08:25 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::a145:69df:f280:f813]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::a145:69df:f280:f813%9]) with mapi id 15.20.5588.023; Thu, 8 Sep 2022
 10:08:25 +0000
Message-ID: <d1bfcaa3-347f-c555-1d6a-b24ccf0e5c10@amd.com>
Date:   Thu, 8 Sep 2022 15:38:15 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 0/4] platform/x86/amd/pmf: Introduce CnQF feature for AMD
 PMF
To:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <bnocera@redhat.com>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        Patil.Reddy@amd.com
References: <20220823102913.4181217-1-Shyam-sundar.S-k@amd.com>
 <6ab21af2-e1c6-f76e-9bee-74e21f019be5@redhat.com>
 <CAKEBQogpK-Kgrgc=gb20w07XnsU7ASVjm4XHWMG=rhD0yQLUKw@mail.gmail.com>
 <a528cbe2-847b-9b15-5123-536900e0d943@redhat.com>
 <d72d77c0-83bb-99b4-03ed-bb9a5b03f35e@amd.com>
 <9fe37e9a-c861-538d-a9b3-9bfc7ea381ea@redhat.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <9fe37e9a-c861-538d-a9b3-9bfc7ea381ea@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::13) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f65bb754-fffd-4b29-b36a-08da9182114c
X-MS-TrafficTypeDiagnostic: MN0PR12MB5860:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O/0sZC4m5J08ltjWInEfMTBdugowKfFTIHtsyt7GZjR5+TuqtjRJ/Fr03oufyOrdkToRBSRwK/K/uk4Cowz4FJUsPBWTzNM/G4gbzB0mHvL4DvU+NUFRf4yIklCiG7jiH1cEASIDoY34su8ZXfRI/jli5Ovj0C0UgSqVQ6w19DCluoGwY0IpXutkwVEXL4Hj6SOgN8Nv8XtGiz3eB6L+RkgZq7pXGUr010cR19iJqsFE003lz2qeTdt6ajhbnLQ9H8E1/KZYZA7oZYWN9Xvck0Y+CGGKmkYwynv+tJnJqg72PyvcA+C9hjVGa9Y3BsGKINnfzdFOpu9LWM22Rawp9n0RyZz86Wn3LtdjCc/3inA6xJ2mtqdmPetVyD7HJdKQfD4dq7tOGJ6gR+PYeEyO3InHGTG+A7IOMMjMyJOSstFiPS1jllbLkGNd2yry6OAJlmUpZKFYsdXOyHaSxzwBEHitRJ/lVcvwGhK6/Bt1BJLUmO5gxEpli2mkxefzbE5TJcopgftYkkelWmXFsL1kNIll/k/WO/wfpG1GrtvaBhIN6ZJWxhB2s3P7PM2rXUtq8qhykwkOPeXcxk/dC6ABjagYWTAbEodYrPiygAajjPakbGcDlUqYnFE1nnbRF5+3UhU0rFhVzNhdyCJO0CcpA8lT2xsrT+Iu8kxlNJjndVghth5YkFzf1SqCUuyb/UsC1l00r3pruo6tBZz9ng5BDphMmxfYmkPGCsdd94iWYTldKOkH0/kpiReEqVhfvcc1ZF/Pk87cKp7aevvWhb+DdxDpUhF4/Yjf4AexxBvW3A4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(31696002)(38100700002)(316002)(110136005)(83380400001)(2906002)(5660300002)(30864003)(8936002)(66946007)(66556008)(4326008)(8676002)(66476007)(186003)(6486002)(2616005)(6666004)(41300700001)(478600001)(53546011)(31686004)(6506007)(6512007)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVFSWFl2c09xcityZnFKaTE2b3BJUmpxcDB6TWVmRVU2SzZid2pYTG4xMVVO?=
 =?utf-8?B?MjlmTVJZcVZIN2V1dDNuS3VrV1FJSXRVMzF3emlycG95cFJvVys4d2pRT2Rl?=
 =?utf-8?B?U1gzTzF6S0NnYlJta25wQVBUMUVObWdVMlZUd21oYnk3VS9uQzdhaW0xdmJN?=
 =?utf-8?B?NTlSY2d0ME9IT2pVdkpINWtacm5NbmNmV2dOLzJjeWt4M0J3V2xVdEJtbE1u?=
 =?utf-8?B?ZzZsWjhBaUg3M1hSZlpFWisxK0xoMGhjMFZ4alM5d1RsbHBSWlJBeW84cldM?=
 =?utf-8?B?UHlSVE1VTFIvT2VPNndaaWRYUWpud0xod0xma1lySEtEVFFmOGgzMnFxbXFJ?=
 =?utf-8?B?SXJLSnJKTlhaQ1dsV2poWXpoUjdYTUZaRGROWXdEeUJ4T2ErTG9BVlFoQlYz?=
 =?utf-8?B?bjhNNFptakNLWW03MFhqWGpkMWFyaGpIYlhyWlRHd1RrVVNmR0dpcFJYVm9a?=
 =?utf-8?B?cGRiUWd3ZDQxaUMxZDJ1WFNlelBZR0ZZRkk2RENTMjFaSTgwbVhKZFFkQTgv?=
 =?utf-8?B?bEJndkhWRGJQNEwrZ041b0NackEwM2tDdW9pQ0ZVSnFLcFV4eDRqS0RMVzhF?=
 =?utf-8?B?L0dWOHIzaktOcXNvTyt4bGR5QndSOGtGYVU4TEYrb0g4MnRLbHkwL2l6WmZw?=
 =?utf-8?B?T1FBSzR5bGFORGFwZ0NUV0VtNDBZNW1GZkpLMmVlTisxbjAwTUxFUW1aNUIv?=
 =?utf-8?B?SFBKTWlSQ3ovWXRJakx5MExsVHZMT3lyM1YyTG0zVVVKMzFud3ZjbFhaSjVs?=
 =?utf-8?B?TFBLNjBlVE1CbzdiOWg3eW1mTlloeWdwL1NhWmlyZ04yVHFIalFPNmlodEJJ?=
 =?utf-8?B?V2h5ZnRjUWhXZUgva0pwOVBmMTcyeHV0djF5eU5BUmVEb1BHVWVkMVR2RE5o?=
 =?utf-8?B?S3pFYWtZUWYyaGZRdFp2eDhPeUsrVE9BUWxheVVoTlZyWHR4ZkpVd3l6YlMw?=
 =?utf-8?B?bWxKZTMxZ0Vwejc4ZGpySDBjaVBQS2lmcnppRzFXN240MGx1blg4cGQwYXFp?=
 =?utf-8?B?Q0ZvZGc3cXdUWGtobkg3OWdjR09LN3Qza1lYNDlpeTZ3Y3RyT2t2QnlQL1py?=
 =?utf-8?B?eXV3NXJqS1ZhY3E5TmxicFl2MFlXRjdQYjlmSVNQSVVHaDl2MlF6WG16QnE2?=
 =?utf-8?B?L0hzaTJheW8zUGVDM3R0V0JsOXVnU0NqTnNGTElaMXFia3pKVXptVjBrSXUy?=
 =?utf-8?B?SlVqWjJxRVBqOUsxKzMvZXJLSUZBTFlOZnlPOG9jZEk0VDY2cmRCK05DQUQ0?=
 =?utf-8?B?UStoUFNGRkFvOEc0N252MGVZN3QzUWU3eGU5V1ZOMUVoVjQzQjMxQjkzU3ox?=
 =?utf-8?B?bk9hbGlTZk9VRXlLUmVpUEZmMEgxYUcyMFlXNHk4MEl2KzgyZERIQ2pDejZO?=
 =?utf-8?B?a1FaYWI4NlZ1ZEljTlAwczVwaXhFZGVobUR2bkUxWVFOSXZjc2szSzFKOFRP?=
 =?utf-8?B?T3hPZmxneDU3elAya2hjSVZtTithSlp2eXFLMGszUi9oaHcvdHhnQVFJNTVW?=
 =?utf-8?B?US9YelRBK0VQNmMwTmh3YWdETFRpL3dHU3FTeWdnMWpLb1FyMkoyQktZUE5j?=
 =?utf-8?B?dnUrK0cvWkh2a3JlN29FVmRjU2xkU0wxSkt4QnRleDhYUnJjaElaQ2owbGUz?=
 =?utf-8?B?eTBrdis3MmQ3ZWkyNyt6cmFOVEpqektxWjV0MnZnNkZHTFBaZ3hBdC94MFhM?=
 =?utf-8?B?ZTM2NFpSN3ZCRmVFa1RBaTZBREhRdlFRcUN6cFlIRmJobzE5RVdESXZYQkxI?=
 =?utf-8?B?WmdIcXlUSmJzYW81c1pYVVp6UlpJL0tlbHJvSXF4QzhrMit6dTN6ZDg4VzUv?=
 =?utf-8?B?QUhTQnI2eDJkd0tYR1J2VFhwd01haUdxTUxvNnpmZWY1RjZ5K2hrRzcrVHJL?=
 =?utf-8?B?YkZBczZGOUlYdHgyQjl2R3RsTU0xTUxqbTFOdHJwazcyeUxvT0x5cTR2aGVE?=
 =?utf-8?B?SHZoQ3R0QU5DL0NMVW9rWHBPRnRXRjduSHhlVFN3amVmd0o1cXFJY1lpeHZa?=
 =?utf-8?B?eVJzcGNYMXZQajdLL2RXRmtNSmZNTkxvbzB2TUdCd09oU2I2U0lHMWlBVFFl?=
 =?utf-8?B?MWZlSW5qaFZHTml4elk0V3FVS0NRQUEySGV5dTkrSVVIbkp0NDNSZjBQWXZO?=
 =?utf-8?B?NVJFdFlwU0FhWWJMNU9Idlk5cEJBZHU4SVcyemRzNnVnOHZ1cGxva1ZhTzVK?=
 =?utf-8?Q?qvZ0lrRwFr/POHRp0tiFdExDoKJvsMteIPumG1Qu3U2e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f65bb754-fffd-4b29-b36a-08da9182114c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 10:08:25.2423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U3uBg1rhLJ/IbpxvXDJAhp5Dk7KrZmaQJ8O3hgy/BnRWAmso8TEkCR78qcVYEGq6cfVbg6PzH2pYlID81Izl+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5860
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 9/7/2022 8:18 PM, Hans de Goede wrote:
> Hi,
> 
> On 9/6/22 11:53, Shyam Sundar S K wrote:
>> Hi Hans,
>>
>> Apologies for the delay in responding to this thread. Some responses below.
> 
> No worries.
> 
>> On 9/1/2022 6:14 PM, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 9/1/22 14:24, Bastien Nocera wrote:
>>>> On Thu, 1 Sept 2022 at 13:16, Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>
>>>>> Hi,
>>>>>
>>>>> On 8/23/22 12:29, Shyam Sundar S K wrote:
>>>>>> In this series, support for following features has been added.
>>>>>> - "Cool n Quiet Framework (CnQF)" is an extension to the static slider,
>>>>>>   where the system power can be boosted or throttled independent
>>>>>>   of the selected slider position.
>>>>>> - On the fly, the CnQF can be turned on/off via a sysfs knob.
>>>>>
>>>>> Thank you. I think that before doing a more in detail review
>>>>> we first need to agree on the userspace interactions here.
>>>>>
>>>>> I've added Bastien, the power-profiles-daemon maintainer
>>>>> to the Cc for this.
>>>>>
>>>>> From a quick peek at the patches I see that currently they do
>>>>> the following:
>>>>>
>>>>> Probe time:
>>>>> -----------
>>>>>
>>>>> 1. If static slider (classic /sys/firmware/acpi/platform_profile)
>>>>> is available register as a platform_profile provider
>>>>>
>>>>> 2. Query if the BIOS tells us that CnQF should be enable by
>>>>> default if yes then unregister the platform_profile provider
>>>>> and enable CnQF
>>>>>
>>>>>
>>>>> Run time:
>>>>> ---------
>>>>>
>>>>> Allow turning CnQF on/off by writing a sysfs attribute for this.
>>>>>
>>>>> 1. When CnQF gets enabled unregister the platform_profile provider
>>>>>
>>>>> 2. When CnQF gets disabled restore the last set profile and
>>>>> register the platform_profile provider
>>>>>
>>>>>
>>>>> Questions/remarks:
>>>>>
>>>>> 1. If you look at 1. and 2. under "Probe time", you will see that
>>>>> when the BIOS requests to have CnQF enabled by default that
>>>>> userspace will then still shortly see a platform_profile
>>>>> provider. This must be fixed IMHO by checking whether to do
>>>>> CnQF by default or not before the initial register call.
>>>>>
>>>>> 2. What about low-power scenarios ? Currently power-profiles-daemon
>>>>> will always advertise a low-power mode even when there is no
>>>>> platform-profile support, since this is also a hint for other
>>>>> parts of the system to try and conserve power. But when this
>>>>> mode is enabled we really want the system to also behave as
>>>>> if the old static slider mode is active and set to low-power.
>>>>>
>>>>> Some ideas:
>>>>> a) maybe still have the amd-pmf code register a (different)
>>>>> platform_profile provider whn in CnQF mode and have it only
>>>>> advertise low-power
>>>>>
>>>>> b) teach power-profiles-daemon about CnQF and have it
>>>>> disable CnQF when entering low-power mode?
>>>>>
>>>>> c) make the CnQF code in PMF take the charge level into
>>>>> account and have it not go "full throttle" when the chare
>>>>> is below say 25% ?
>>>>>
>>>>> 3. Bastien, can power-profiles-daemon deal with
>>>>> /sys/firmware/acpi/platform_profile disappearing or
>>>>> appearing while it is running?
>>>>
>>>> No, it doesn't.
>>>>
>>>> It expects the platform_profile file to be available on startup, at
>>>> worse with the choices not yet filled in. It doesn't handle the
>>>> platform_profile file going away, it doesn't handle the
>>>> platform_profile_choices file changing after it's been initially
>>>> filled in, and it doesn't support less than one power profile being
>>>> made available, and only supports hiding the performance profile if
>>>> the platform doesn't support it.
>>>
>>> Ok, so this means that if we go with these changes as currently
>>> proposed that if a user uses the sysfs file to turn CnQF on/off
>>> they will need to restart power-profile-daemon.
>>>
>>> I think that that is acceptable given that the user needs to manually
>>> poke things anyway. We should probably document this in the documentation
>>> for the sysfs attribute (as well as in newer versions of the p-p-d
>>> docs/README).
>>>
>>>> Some of those things we could change/fix, some other things will not.
>>>> If the platform_profile_choices file only contained a single item,
>>>> then power-profiles-daemon would just export the "low-power" and
>>>> "balanced" profiles to user-space, as it does on unsupported hardware.
>>>
>>> Right.
>>>
>>>> The profiles in power-profiles-daemon are supposed to show the user
>>>> intent, which having a single setting would effectively nullify.
>>>
>>> Yes that was my understanding too.
>>>
>>>> It's unclear to me how CnQF takes user intent into account (it's also
>>>> unclear to me how that's a low-power setting rather than a combination
>>>> of the existing cool and quiet settings).
>>>
>>> AMD folks, please correct me if any of the below is wrong:
>>>
>>> AFAIK even though it is called CnQF it is more like auto-profile
>>> selection and as such does not take user intent into account
>>> at all.
>>
>> Yes, You are right. Below is a brief note on how CnQF was designed.
>>
>> 1)CnQF – Cool And Quiet Framework - It’s an extension of the static
>> slider concept wherein PMF dynamically manages system power limits and
>> fan policy based on system power trends.
>>
>> 2)OEM can opt into the feature by defining the CnQF BIOS ACPI method.
>>
>> 3)Static slider control and CnQF are mutually exclusive.
>>
>> 4)CnQF supports up to 4 modes of operation – Turbo, Performance,
>> Balanced and Quiet.
>>
>> - It can be configured for AC and DC distinctly.
>> - PMF driver calculates the moving average of system power and switches
>> the mode of operation.
>>     *If system power is limited to the threshold of the current mode,
>> move to the next higher mode
>>     *If system power is not limited to the threshold of the current
>> mode, reduce the power budget by moving to the next lower mode.
>>
>> 5)CnQF feature control is through Radeon SW (a GUI based tool on Windows)
>>
>> To match the behavior on Windows, we kept a sysfs node to turn on/off
>> the CnQF on the fly like the way it can be done the windows side with
>> the Radeon SW tool. If you think that having as a module param makes
>> more sense, I am open to make the change and send a v2.
>>
>> Like I mentioned above, on Windows the static slider is absoultely dummy
>> when the user goes on turns on the CnQF from Radeon SW tool. Based on
>> the review remarks on the earlier series, we tried to
>> register/de-register to platform_profile, as per sysfs input (like
>> setting up and tearing down to platform_profile).
>>
>> The Difference between Auto-mode (for thinkpads) and CnQF(for others) is
>> that:
>>
>> - Automode gets turned on only when the slider position is set to
>> "balanced" in the platform_profile and
>> - a corresponding AMT ON event is triggered.
>> - it has 3 internal modes quiet, balanced, performance
>>
>> But for CnQF,
>>
>> - it is independent of the slider position and there are no ACPI events
>> for it to get kicked in.
>> - There are two seperate ACPI methods for AC and DC to get the
>> corresponding thermal values.
>> - it has 4 internal modes quiet, balanced, performance, turbo
>>
>>
>> There is already a WIP feature called "policy builder" where the OEMs
>> can build custom policies, which includes looking at the battery
>> percentages and making thermal optimizations accordingly. But this was
>> not taken into consideration while designing the CnQF on windows too. If
>> we bring in this change for Linux, there maybe differences in the way
>> the same feature behaves "differently" across OSes.
>>
>> Like you mentioned the usecase, where just a compilation can end up in
>> battery drain if not connected to AC power.
> 
> Thanks for the explanation above.
> 
>> Can we not have a
>> documentation update saying it is advised to turn "off" CnQF when
>> battery % goes below a certain level?
> 
> So we would need to document that the user needs to poke
> the sysfs file when the battery is low ?  That seems very user
> unfriendly.
> 
> And also don't want power-performance-daemon to need to know about
> this AMD specific sysfs knob. That is why we have the standardized
> platform_profile userspace API.
> 
>> That way, the end user experiences
>> across Linux and Windows remains the same.
> 
> I can understand that you want to keep things the same. If I've
> read the above correctly then currently the user experience under
> Windows is that the slider in Windows has been turned into a
> dummy slider which does not do anything.
> 
> That IMHO is quite a poor user-experience esp. when users want
> their battery to last longer because they are going to be e.g.
> on the road the entire day.
> 
>>> It looks at the workload over a somewhat longer time period (say
>>> 5 minutes or so I guess?) and then if that consistently has been
>>> quite high, it will select something similar to performance.
>>
>> Right. The switch time would be dependent on the "time constant" values
>> set in the BIOS  which is configurable to the OEMs.
>>
>>>
>>> Where as for a more mixed workload it will select balanced and for
>>> a mostly idle machine it will select low-power.
>>>
>>> I guess this auto feature is best treated the same as unsupported hw.
>>>
>>>> (it's also
>>>> unclear to me how that's a low-power setting rather than a combination
>>>> of the existing cool and quiet settings).
>>>
>>> Even though it is called cool and quiet AFAIK it won't be all that
>>> cool and quiet when running a heavy workload. Which is why I wonder
>>> how to re-conciliate this with showing low-power in e.g. the
>>> GNOME shell system men. Because in essence even if the battery
>>> is low the system will still go full-throttle when confronted
>>> with a heavy workload.
>>>
>>> So selecting low-power would result in the screen-dimming which
>>> I think is part of that, but the CPU's max power-consumption won't
>>> get limited as it would when platform-profiles are supported.
>>>
>>> So I guess this is indeed very much like how p-p-d behaves
>>> on unsupported hw...
>>>
>>> ###
>>>
>>> As mentioned I guess one option would be for CnQF to
>>> still register a platform_profile provider and then in
>>> balanced mode do its CnQF thing and in low-power mode
>>> disable CnQF and apply the static-slider low-power settings
>>> I think that that would work best from things actual
>>> working in a way I would expect the avarage end-user to
>>> expect things to work.
>>>
>>> So p-p-d would then still see platform-profile support
>>> in CnQF mode but with only low-power + balanced advertised.
>>>
>>> Bastien would that work for you?
>>>
>>> AMD folks would that also work for you ?
>>
>> If we go with the above proposal it would become very identical to what
>> is being done with automode (expect the extra "turbo" mode and not
>> having a AMT event).
> 
> Yes I think that the AMT mode, where the more dynamic behavior os
> only done in balanced mode and low-power is still very much a low
> power-mode (and performance is always tuned for permance) makes
> a lot more sense from an enduser pov. Then the slider still actually
> works as expected and in the default balanced mode users will get
> the benefits of the new CnQF behavior / feature.
> 
>> This would need some amount of discussion with our
>> windows folks also to know what they think about it.
> 
> Ok.
> 

OK. I get it. Your preference is to have CnQF getting ON only when

1. BIOS advertises CnQF is "supported" and/or
2. Sysfs knob is set to ON. and
3. the static-slider (platform_profile) is set to "balanced"

In rest of the cases, (low-power or performance) the control would still
remain with the static-slider so that, user can make his own choices.

If that's the case, let me have a word with the windows team also on how
we can have user experiences same across OSes and come back.

Thank you for your feedback.

Thanks,
Shyam

> Regards,
> 
> Hans
> 
