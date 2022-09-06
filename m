Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABCC0ECAAA1
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Sep 2022 09:59:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233424AbiIFJ74 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 6 Sep 2022 05:59:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232732AbiIFJ74 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Sep 2022 05:59:56 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6A8822BF5
        for <platform-driver-x86@vger.kernel.org>; Tue,  6 Sep 2022 02:59:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aW/wzfrqZ8IAuVlSZuBgieOsxjD/p7wXNY52IjORDxpv1fayLPQwhLc7cFnW0pIEuNJW79AazjnJDtkJRK0gJYxktcgJUbPKQvvPnOLHMaUC0MXoD+fs1SwwgH2GBxT15w3S1tcx0onqP1NnsBQUow9F5unrpnmot0fzNJMBh8wqeG21dyWo1xI54pC1CRr9T9bk83Niztv/HutX4MgamYjLLDe+f6dPA4jO4FsEwO6vnt8zd0JyVTCSIgdDXMp/5JxXSzzoULboor+anN4LwIWHHDOttqNtwUHOqVULgLrqlYL+rcnC1qqW3GfmrgqgNMFAMIlLjRli97kbl+B4VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBCTe2xA3hBnJ531kT4zx3KgDpR2e6LPMXjDghW/5TU=;
 b=nVtkyD9O2AL7ULgKGGEFZ6dfqDFUd4rBt4HwhoPVGfA4KjMrC3ukc2TkCAKrKZnulRYSkS0iq0B+D848UPbTgp/eus72J7YAr9YBVW3qzmc2if8eokhqwNY8svqe9siSIKBapePUxvNYfSO/raRMwAaT1MPMZjd+BMiHCvgC4rsqe7WI2Oh1UGJcCDx16oXdG4vWLw5okuX/mnEdLm+VRvfq1j71glmhfCAWlJQq9iIjmB2qt598xbJ9UTIa/Z6BlGX+D6HP+TDpksHZG+DJ3f2Cs8XjDoitz5laSX0HlX7UHu/fHeCysrPLB7CzMdzFUOg81D5D4FUPHU9buyHY8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBCTe2xA3hBnJ531kT4zx3KgDpR2e6LPMXjDghW/5TU=;
 b=C18sNretR8B92gzeeLLyxYOAM1B4Ks5/1ikVxrw6EEsp7qR6JnOBC68eVEJS7QY6mMFpt5yS3trGmC9Ws5SZ0VmBSAVnrRSvGa66KYlvXF1pe72V4HFeIY07uGXAF5tmokS++nYUKlAkA5tD6KdFfC/AcQjF9pfQA0Mvz2VEGp8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Tue, 6 Sep
 2022 09:59:51 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::a145:69df:f280:f813]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::a145:69df:f280:f813%9]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 09:59:51 +0000
Message-ID: <a5ac5eb7-6a8e-aafd-10ca-b3049a7a74f4@amd.com>
Date:   Tue, 6 Sep 2022 15:29:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 0/4] platform/x86/amd/pmf: Introduce CnQF feature for AMD
 PMF
To:     Bastien Nocera <bnocera@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        Patil.Reddy@amd.com
References: <20220823102913.4181217-1-Shyam-sundar.S-k@amd.com>
 <6ab21af2-e1c6-f76e-9bee-74e21f019be5@redhat.com>
 <CAKEBQogpK-Kgrgc=gb20w07XnsU7ASVjm4XHWMG=rhD0yQLUKw@mail.gmail.com>
 <a528cbe2-847b-9b15-5123-536900e0d943@redhat.com>
 <CAKEBQoiuDA1DM4Y_EMRNpRmisCc6KAa2akwxSpbKDrDDnrB71Q@mail.gmail.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <CAKEBQoiuDA1DM4Y_EMRNpRmisCc6KAa2akwxSpbKDrDDnrB71Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::10) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70ed9bf1-c0ba-4810-f92b-08da8fee8a6f
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nwjwh349/gOjVIvFgkf+toADQqxAGHpzVyz+UaXlzdqm99zJeD2swbRFEjgAhBBeWCwfc8ucLNvrYemRWRyfQ+vsAULRw7ICfziB7mVwtuIDIs9Gkm+wltV2gA9+SxehTcBKGNcihxYDCmJjl0bDLRe4gLQJ0Kaqwf0xyxSfMKraW6PDpbWk82YyMG8BQSe11HcgwP2fykflqKKO//gQg6lUn2GzMaGmTyaRWMdwrENIqTVv575d2kgJZfUiXM44CjraXnlmFiOYKx5kCtXgbzDo3lNVRE6CbRu19jovflZqs3BuspKp9zcMU/RUu5+YBtaZZuSJYz7ADeCkxkajPuQwBN3OL9oW0tOMb/nfzK2seB617FV+C/HT0kqowTbOTLanFSrq/zugK8JIMCtGTiZCOwQl6lAtJiO4KpmN3geSWJZ1vG7JDXHle8z9Q0lMwggYP6J8AW8GnKyJNPS9xMtnSrM6VdqU07QJDux5RbjIlthffd0mNmEsgFcR+IRqXl+lP78fIYmkjiJxr5UA/zyVQhGbpiF055viJ5eExJZ755TJuVBjinezsG7nXZyG/TE+OetirXK/igs8JZmyuDK3ccVQnhW02M6WEKdbPx6bnKUtrZCZWTHaEdup3FpMp8u3mbviLCmfeB1SjO01GhNGk8oxgrEX2VX60czoYkMEWEsmLNH6bWaLQtMC4Epjq0pueujcvDtuNMfcW81soqQqJ5y8gAZlWcOikOumOp2bQ2sgqhByyq29dOzUxR+qzCi+Pb2FFLofrDcskvbgskMDQSa04YNfLqrDgM5lT2k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(66476007)(66946007)(8936002)(66556008)(5660300002)(31686004)(316002)(2906002)(478600001)(8676002)(6486002)(4326008)(110136005)(6506007)(53546011)(41300700001)(86362001)(6512007)(36756003)(6666004)(26005)(2616005)(186003)(83380400001)(31696002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnhXVURaSmIxVkc5enN4enp3aTBpTW9FVVMrQWNyUWNrMU9BZFNycU9TRUJB?=
 =?utf-8?B?OWJad0p5MGJNVnhoRDc0TC80cjVoSldZY1pKbUlUQVlhVXBhV1JoSWNMc0Jq?=
 =?utf-8?B?NGhBTXZNay9ScmdMNEZrVjdkUEs1T2lGdjF3UHBVb3lSOXY5cGU4RGNhTmJj?=
 =?utf-8?B?WlJNam5qNWRFdmhKVGVlT3J2blU1bGdxMnlnZGJDUUg5SmF6OEQ2SVg5SGZP?=
 =?utf-8?B?YjNGZXcySjNKbUtLNnhqWHVkYjlnVUF5T0VtMC9oeHVHQXcyOFo5aEJwNXhu?=
 =?utf-8?B?UkJ6OHRnUnBhR3l0alh1Z2pzaG8ramxyUzE1cytOVllkb29MeXR5ZTNqbE5B?=
 =?utf-8?B?aVJnU2xZZ3RGcXltb3E4NXJHZk1ETDVmUlBmMUFlVlUwMVBYNjRaR1dZaTBa?=
 =?utf-8?B?ZGdTYno5aktNK29JVjZNUVRicE5yZ2Y5TGpPTG5TczFoWEZOZXAxZ09rK3ZX?=
 =?utf-8?B?SjNKL0IzbXg4Wk50QlJhS2RzV2F4NHpwZGpzYW9BSnFGOTdZSTlpNklJMGwz?=
 =?utf-8?B?QXpyTCsyL21FY3JpNXBmZXBCd2sxQjMvY3JITXVUMmVubU40aHZZa0dKRTRi?=
 =?utf-8?B?QjhBWTA5a1Q3RXRZVVVqV2hPTDBpVlQzRzhRZU1CeTZQeVZSSXo4bGFIaUpX?=
 =?utf-8?B?UGx0bmRNeTcyU2FudEZjOHVDbllXWDBUUUZZcG5UYmhOYVZuMGFSNjgrUnUw?=
 =?utf-8?B?K0p6WU5PemVQV21CS2I2S1IxcFBQQUpWVDUvUkVqRnpRY0hhQ1djRjlPTTQr?=
 =?utf-8?B?SFBqa0theW1RK2wvdzM2NTZSZGtOTUNBNWxYNWFtcEJhWHZ6OWRBaW9TVnZu?=
 =?utf-8?B?T29CcjdleVZHaWdPQTVTZGpBdjFyaU5lVzd5Zy9Pb2tJcGpFT2xuOUw1aWNr?=
 =?utf-8?B?SWxzYXdRYVMzdzkrOUpjcnBnQ1JIcSt6bXMvYTJqWmdMRE1CclFFZDJNUllU?=
 =?utf-8?B?WlpLS1plWW1RVjByWHZ5QTZwaUpybUpTWkRqNVFVOVJONHFHVFM3QWtQNXRr?=
 =?utf-8?B?azI2Sy9QMFdCZHA0bWs0d3Erb2twOStrb3FCZ3pReVh3S29RamdqL3h2MDdw?=
 =?utf-8?B?dnZML1pROXY3QVp1YS9XNlJwWmM0Nk1Bdk5GaVY1MFJJVm5pQzMycmxtZXlk?=
 =?utf-8?B?YzVId1R1Zk51WEFFcjN6OHZybzh1RW5VZS9YSS9XMi9sL25GcDVlK1ZDbXU2?=
 =?utf-8?B?elhzcHNrYXN2TU5nRnhodXg3b08xb1MyRmYrVHJUUmlIVmxtcEppZS9CdUhU?=
 =?utf-8?B?Z09BUDBCa1FmTzBnR2dTMVN1bUVLMDV5MUVMS05MZWNTZy9wYkJzT2lzaHRT?=
 =?utf-8?B?NGtrQjNzR2M1ZnpZZllOV2loNlZRdHVVR2tOTXdpNFQ5aVlCSS9tc29Kdkxj?=
 =?utf-8?B?cVRad1grNkRGNG1JRWxabTEzc1FjTE5LTjB5N2Y1UmhweDNEbzZIR0taWDJQ?=
 =?utf-8?B?eTU2V3lpSG5sV3o1VVJNeXFzeFdUSGRaMGJzYkttbU52YVdUUDN1V2pHMmdw?=
 =?utf-8?B?UlNhMFB0UGR2d2RTNFlKdmN1aTZLVmlSZUVGYmhVSnZhc0Jta0xvWlhiVGxx?=
 =?utf-8?B?VzlsUEtPWUxFeGNXUE8rK1I1dkxYdEl0Rjl4ZWxkalYyV0JBVll5UGk3QU9t?=
 =?utf-8?B?cGJKNU9Da3hENmp4bVhzOW80SzkwVHJCQ1lBL05yY05GUmVjTG1KYjhCQzgz?=
 =?utf-8?B?S3MydWROSUhEY2l3ZXYyQXI2RmhUZ3g1eWlyR0wyK01JazRWWlJONmdnNkdL?=
 =?utf-8?B?c2R1NFliQmdkbXRPa1gzN3c4SmhjcFNCc09RRlBxNlVwWnVmUENEVUJhVUc1?=
 =?utf-8?B?ajczTlJmSksvaWUxODlHdW1aeTZKd2dqQWRaVlFhYWN4a0I4OWcxeSt6U0dQ?=
 =?utf-8?B?MlAwNGFIQ1pHZitiZm15RkllblZYNndkT0Rxc1RLV2xPMThsZWxDd1Y5cnk3?=
 =?utf-8?B?c2Q0alpYVzR5RlZYd2NjTmRrQzhRbUQxRWpyT0lFRzhQa2hyTEt4VGg0YXVQ?=
 =?utf-8?B?eHYzVktmU2k1MFp6R1FyZE91cnp0QnNlNUtzY2hGVHk4eTdEQkIvV08yMUJo?=
 =?utf-8?B?akhOMTdlLzlKeEVPV0tKVEMwbmJPaGYyN2ZpbHlHQldwaU1Oa1Budm9LY2w4?=
 =?utf-8?Q?2o/iUzglSBJLcbL/QqJkDUWdm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70ed9bf1-c0ba-4810-f92b-08da8fee8a6f
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 09:59:51.7047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PoHD5OnyloT8BcadeuKlxKCyVRaZu+CWA+/D0Nj6RFSkKS9Jrk3KFIOMZGIWXosJqICAYpgnWh2Lj3vCDCEeiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5673
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Bastien, Hans

On 9/1/2022 7:04 PM, Bastien Nocera wrote:
> On Thu, 1 Sept 2022 at 14:44, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 9/1/22 14:24, Bastien Nocera wrote:
>>> On Thu, 1 Sept 2022 at 13:16, Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 8/23/22 12:29, Shyam Sundar S K wrote:
>>>>> In this series, support for following features has been added.
>>>>> - "Cool n Quiet Framework (CnQF)" is an extension to the static slider,
>>>>>   where the system power can be boosted or throttled independent
>>>>>   of the selected slider position.
>>>>> - On the fly, the CnQF can be turned on/off via a sysfs knob.
>>>>
>>>> Thank you. I think that before doing a more in detail review
>>>> we first need to agree on the userspace interactions here.
>>>>
>>>> I've added Bastien, the power-profiles-daemon maintainer
>>>> to the Cc for this.
>>>>
>>>> From a quick peek at the patches I see that currently they do
>>>> the following:
>>>>
>>>> Probe time:
>>>> -----------
>>>>
>>>> 1. If static slider (classic /sys/firmware/acpi/platform_profile)
>>>> is available register as a platform_profile provider
>>>>
>>>> 2. Query if the BIOS tells us that CnQF should be enable by
>>>> default if yes then unregister the platform_profile provider
>>>> and enable CnQF
>>>>
>>>>
>>>> Run time:
>>>> ---------
>>>>
>>>> Allow turning CnQF on/off by writing a sysfs attribute for this.
>>>>
>>>> 1. When CnQF gets enabled unregister the platform_profile provider
>>>>
>>>> 2. When CnQF gets disabled restore the last set profile and
>>>> register the platform_profile provider
>>>>
>>>>
>>>> Questions/remarks:
>>>>
>>>> 1. If you look at 1. and 2. under "Probe time", you will see that
>>>> when the BIOS requests to have CnQF enabled by default that
>>>> userspace will then still shortly see a platform_profile
>>>> provider. This must be fixed IMHO by checking whether to do
>>>> CnQF by default or not before the initial register call.
>>>>
>>>> 2. What about low-power scenarios ? Currently power-profiles-daemon
>>>> will always advertise a low-power mode even when there is no
>>>> platform-profile support, since this is also a hint for other
>>>> parts of the system to try and conserve power. But when this
>>>> mode is enabled we really want the system to also behave as
>>>> if the old static slider mode is active and set to low-power.
>>>>
>>>> Some ideas:
>>>> a) maybe still have the amd-pmf code register a (different)
>>>> platform_profile provider whn in CnQF mode and have it only
>>>> advertise low-power
>>>>
>>>> b) teach power-profiles-daemon about CnQF and have it
>>>> disable CnQF when entering low-power mode?
>>>>
>>>> c) make the CnQF code in PMF take the charge level into
>>>> account and have it not go "full throttle" when the chare
>>>> is below say 25% ?
>>>>
>>>> 3. Bastien, can power-profiles-daemon deal with
>>>> /sys/firmware/acpi/platform_profile disappearing or
>>>> appearing while it is running?
>>>
>>> No, it doesn't.
>>>
>>> It expects the platform_profile file to be available on startup, at
>>> worse with the choices not yet filled in. It doesn't handle the
>>> platform_profile file going away, it doesn't handle the
>>> platform_profile_choices file changing after it's been initially
>>> filled in, and it doesn't support less than one power profile being
>>> made available, and only supports hiding the performance profile if
>>> the platform doesn't support it.
>>
>> Ok, so this means that if we go with these changes as currently
>> proposed that if a user uses the sysfs file to turn CnQF on/off
>> they will need to restart power-profile-daemon.
>>
>> I think that that is acceptable given that the user needs to manually
>> poke things anyway. We should probably document this in the documentation
>> for the sysfs attribute (as well as in newer versions of the p-p-d
>> docs/README).
>>
>>> Some of those things we could change/fix, some other things will not.
>>> If the platform_profile_choices file only contained a single item,
>>> then power-profiles-daemon would just export the "low-power" and
>>> "balanced" profiles to user-space, as it does on unsupported hardware.
>>
>> Right.
>>
>>> The profiles in power-profiles-daemon are supposed to show the user
>>> intent, which having a single setting would effectively nullify.
>>
>> Yes that was my understanding too.
>>
>>> It's unclear to me how CnQF takes user intent into account (it's also
>>> unclear to me how that's a low-power setting rather than a combination
>>> of the existing cool and quiet settings).
>>
>> AMD folks, please correct me if any of the below is wrong:
>>
>> AFAIK even though it is called CnQF it is more like auto-profile
>> selection and as such does not take user intent into account
>> at all.
>>
>> It looks at the workload over a somewhat longer time period (say
>> 5 minutes or so I guess?) and then if that consistently has been
>> quite high, it will select something similar to performance.
>>
>> Where as for a more mixed workload it will select balanced and for
>> a mostly idle machine it will select low-power.
>>
>> I guess this auto feature is best treated the same as unsupported hw.
>>
>>> (it's also
>>> unclear to me how that's a low-power setting rather than a combination
>>> of the existing cool and quiet settings).
>>
>> Even though it is called cool and quiet AFAIK it won't be all that
>> cool and quiet when running a heavy workload. Which is why I wonder
>> how to re-conciliate this with showing low-power in e.g. the
>> GNOME shell system men. Because in essence even if the battery
>> is low the system will still go full-throttle when confronted
>> with a heavy workload.
>>
>> So selecting low-power would result in the screen-dimming which
>> I think is part of that, but the CPU's max power-consumption won't
>> get limited as it would when platform-profiles are supported.
>>
>> So I guess this is indeed very much like how p-p-d behaves
>> on unsupported hw...
>>
>> ###
>>
>> As mentioned I guess one option would be for CnQF to
>> still register a platform_profile provider and then in
>> balanced mode do its CnQF thing and in low-power mode
>> disable CnQF and apply the static-slider low-power settings
>> I think that that would work best from things actual
>> working in a way I would expect the avarage end-user to
>> expect things to work.
>>
>> So p-p-d would then still see platform-profile support
>> in CnQF mode but with only low-power + balanced advertised.
>>
>> Bastien would that work for you?
> 
> That's something I can make work, yes.
> 
>> AMD folks would that also work for you ?
>>
>> ###
>>
>> I'm also wondering if we are going to still export
>> balanced + low-power modes to userspace in CnQF mode
>> and disable CnQF in low-power mode then if we
>> even need a sysfs knob to turn it on/off at all.
>>
>> I guess the sysfs knob would then still be useful
>> to turn it on on systems where it defaults to off
>> in the BIOS.  Might be better to do this as
>> a kernel-cmdline (module-param) then though, then we
>> also avoid the problem of platform_profile support
>> all of a sudden changing underneath's p-p-d's feet.
> 
> I would say that, you could probably have CnQF transparently replacing
> the more static "balanced" profile if it is available, and have a
> separate setting to force enable/disable it as a kernel command-line
> for debugging or if the BIOS menu doesn't offer it as an option.
> 
> That way the balanced mode would work like a more refined automatic
> profile switcher, and make the default experience better, without the
> disappearing profiles, or the user-space API headaches.
> 

module param would be fine to force load CnQF if the BIOS does not
advertise it.

But I still think, having a sysfs node would still help to give an
option to the user to "opt-out" of the scenarios where he thinks that
battery can drain out if CnQF is turned on? Or in any case to turn
on/off CnQF on the fly, so that he can still switch back to the
traditional "static slider" based power optimizations.

Please let me know your thoughts on this?

Thanks,
Shyam
