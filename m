Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4635C54EE9
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Sep 2022 09:54:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230112AbiIFJyD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 6 Sep 2022 05:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbiIFJyC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Sep 2022 05:54:02 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A262010FA
        for <platform-driver-x86@vger.kernel.org>; Tue,  6 Sep 2022 02:53:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G30+2Dd8+SwAO1JymrJ8mhAGKXQXMoSqIn1D0WcxqcAPi6ukVkLCJxJI8sWkeznfqqpOBvplpE8d9c6ONwKq9j3Hbgkb4V77rvs3YFdKoavPuRwwMWBCdzNXOY70JF2yhIkbRPJWizcUpBKTcLijKTuAs6MAWgMArd6zrqEWthYBxi/wG2LzQR66wLYi7mlD49fkqHHDv2NdJR1fJbP9G54CfYnuWGvzWk/geNPnS3abjDnSjg/BKP5trlYM5s7IS+2ITTGHXvu6geGf7ZfWjh6LgCj8g2F/UE5EMZz88hMfBHA/JMT0u1WbsT0AyTcx0KnDM/wLgqI4Yg5QzXkqMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=42xIOeie3nS78DVCfQHTEbzCdsPlqP0s29Mx22UZEZ4=;
 b=i7BxlUhK7dpTh4WGJveZF1UMdPb9XXsMgV2RZbscSt2eXdEth+jG8d42Oe7jf5BjvcuzZliKRON/iACwVvOl2Tse+yuZZrI3c+IfWdUN3tJGaUMnj3R5ttGkJHCL88om1nDpeNdsOO3lePcOrJUYhHh/FD0F3P0yVHCbDOe0cqjE0xq1RAHEbp+LeWOx4jCKS2fSoCCUGaB+TqGmjJ2mZxTxEg4Mv8NfOip7asTVcrvqMWNQSFrXkhdOp3BwTdyXFnXErAMjwadVNxOCeLBa/leSthcy0l1Z1UjNd0lcl96b7fAgkORcKXDjXoVGzfB4e9PxhBltrIyFOunqZ3HTyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42xIOeie3nS78DVCfQHTEbzCdsPlqP0s29Mx22UZEZ4=;
 b=koMVthsqv8l594VAy9MH/b4T9zbP92q4qPcFMgycZECHPyl0Psz/8jzUqM4kC8QDasF+ag55XhgikXsiUtfuW4uTxeiOFHOQDZU5b0ZBS9j57S/JA7p4Sgh28FS75rLslMc3N6S5s9v9mQeItVz89LhRHO0UaypRBmmrzMChCpk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by BL0PR12MB5508.namprd12.prod.outlook.com (2603:10b6:208:1c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14; Tue, 6 Sep
 2022 09:53:56 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::a145:69df:f280:f813]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::a145:69df:f280:f813%9]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 09:53:55 +0000
Message-ID: <d72d77c0-83bb-99b4-03ed-bb9a5b03f35e@amd.com>
Date:   Tue, 6 Sep 2022 15:23:45 +0530
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
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <a528cbe2-847b-9b15-5123-536900e0d943@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0061.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::6) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: edb61b07-e26b-4af6-ae7d-08da8fedb65f
X-MS-TrafficTypeDiagnostic: BL0PR12MB5508:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VSSs70nEVXjdoUY5Qo9WuRjsr6P+Vk2hm0jyXYr+MgBv7hEQ+Oix8ZyEdmnlDLClyqeBXojqmFnbPmliOEERLGQNksCZSLWxw1ppFCcF0QsWYNVL1UNHtWuncRkGdqAylHKw4tQv7Mo3TGxFb0hGIWP1zRBw3QwZIFOhvlpMp19Fa08FVQ/s4LKtQGH5yQO0ejS6mN14JYYwIBMhsTAu3AqV9aw5wTTEHaFCZuR2NpDPtkwNwZVvHtTQ7y0GOTn0tpmQ6bsEizRvWtgQky8ylmEp3rxZfCSnLealzRUQJdepxcDZGOAo2amAWS54xCpGWyLFL/et9rsftHqSsls7OlXsUpQxtkN1657aPdo3OeZERvJRujznUI5rwFpcpZuzdZE/U8zaW0Z7Q5wk8nGPf92paWvq2Xx7wyEQlTLQv6p6r9J/wpAqYDysmV1SLb+z0p0I7F/4WRiVXH0tIzjJnp+49EJnPayZEYkde15EGVmiPyiCJ+a8SZLL5N/OPsHjRJ5w2/K7QvwTfYnZzZnvIz79dWPjQQ+gZNwzcceFnnECRaZCADQVCxL6gcKFs91VwrvFAmubaqUVp7W+KaI6Hh6jL/s6PZZ9932Lh4+O0eu7FI9PwGRuqM9pE2hPFP/sjzqxegn51w9VwV4mI0/zyc+KqnMYn+/vG4kWPZJWgbQCsuzO6kXibHq8TAN8QhmWNwKhYweCiPGTlD/Z48fhNwbTAFcOmfsmJcWngMXU5fet6YLW93JPpL+qXxYW8tJ/JZ48K63PmaZTF89K3s8zn02O0QkHOrDJrvH3N35L3V0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(4326008)(83380400001)(31696002)(38100700002)(86362001)(31686004)(66946007)(6666004)(66556008)(5660300002)(478600001)(41300700001)(8936002)(8676002)(110136005)(6486002)(316002)(6512007)(2906002)(36756003)(66476007)(2616005)(186003)(6506007)(26005)(30864003)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFZZaXVFTFRoMUU4ZVphYXVJOVVJVjhBWnREbkpkNldKTktTZEliOE5RYk51?=
 =?utf-8?B?V1pPaGljZTJVR0poR1hNdllrckN4Z1JZMmNTUUxmWFZPKzZ4N1pGR2RuTFkv?=
 =?utf-8?B?MGhobDF0dmV2eHlUczM5dTQ3ekZwVzErMGZPM0R1dXNlNEFkZzFZZ0xtQnJm?=
 =?utf-8?B?Q3Y0bWxaK1Y1YmhXRGtxZ3pqc2N2anJTR3l4NitlV3YzbitkK1hkcU52aGxw?=
 =?utf-8?B?dU1NVXBaR2lLYzRORTdaTTBQL0Vxd3dMdDUramhHQVlNajU3Ym8vQlpZaTJ6?=
 =?utf-8?B?eEdnOVhGTDdta0V6LzRpbnBRWmVTaGJoL3J1eW9TbVJLNk1mMHhJdE9xUzF4?=
 =?utf-8?B?SHpia0lQMHdOTnpFQTcvemxLV0UwamozeGVoRnFoVkc2VDkxell5c0tvQlZU?=
 =?utf-8?B?QUhaYzFDcVduNlBZMExDQzFmakIxd0h5eUdmQi9DWlMzOGRLZGs2bUNGL0FT?=
 =?utf-8?B?ZFpTTStMcVpqbU1JbkdVb2QvOEovRFVYdVdtb0g5WVJDQ2J4bnBNR1JyT1lN?=
 =?utf-8?B?K3FuWmRmbWlsY29CdldTSVNUOXFUVnFtZVlFQUZyNUg1ZVBsTkFHSVpXbEc4?=
 =?utf-8?B?VDlvbVFVWlNzZDA2QmU4ZVQvTWJLcGdEeXBWT1cxV1p3T255T1kzYXY2UWNr?=
 =?utf-8?B?VndIQkhyNmZLaWlWdTRSMzFhSUlFSGxvTFJWYVFCQ0RhVGdNN0FmalJoVng4?=
 =?utf-8?B?bG9lOGRiNXRPQjg1dUFxNlZFTHNnQXNvZXh6aHlOUmNQcDd5b2xRVmh5RWk1?=
 =?utf-8?B?MmlJVFloMjE4dTRSeDNzWHFsZkwxdFh0cGNzVG5VWUxOQ1pXS1dibS9qRnAw?=
 =?utf-8?B?VGN1UkZ5cm9ET1MxTkdnUkxGUEFWb0hrQXBxUXZEWDIrSHNULzJUZnBzU3R2?=
 =?utf-8?B?ZVF2dnM3Z0Z5N3EyVXpMRy85N2M3dkNqYWxkQmlqeW5WZkh0bW1jQ3RleS8r?=
 =?utf-8?B?UGJoOUNUWG1YTlNxRGFvbkNYUEF4Y2lFUkZqdXd2MjNjNlhWTU1iTDZoZzNX?=
 =?utf-8?B?U25Kamd3NWRSUDNpTThqbENSUjZwWE03cWpTWnNYanJEemw1dnU5Q0d1bzVp?=
 =?utf-8?B?Z1BHa1M0WGp4SEFMaWx2UGpKS3NWdy8rdnB1dEdFaGgybEVnTXhHS3JPYTNF?=
 =?utf-8?B?SVBLYitjUzdlQmZJZWlpZGZJeU5DSFY4aGlwZk1jbEJ6dHQrTDBiLy8vQjBI?=
 =?utf-8?B?Y1JPYW1KZ2JzRkdIdVg4S3gxQ0xYQ2xmZkpNMUVsVzY0VHZTN1Vhd0FRajVi?=
 =?utf-8?B?QkVSSmdPQllGT0xQZTM3UjR6eTJJRW1TcFpKZ0NFWXIrSmdncUlxMnYrTGNO?=
 =?utf-8?B?cTNIYVpsb25reTE1TmhMVktCbitJVndzZnJZUCtKVmtNNnNCUFdMcGJGaitT?=
 =?utf-8?B?ZndUYXJ2LzRiN1JrSDZ1MW5vdy96RjFTbVFjY3hRYVVCVDN1REIwUlJEYTdh?=
 =?utf-8?B?emFUbVNwQitmbUpPV29xVmpZN0NRbG9xZTVuVTFaOHc5UTVYUmx3MVROTWhs?=
 =?utf-8?B?emhydGtIR0E4R1NBS0R6RnpxVXRCV2RHdkZ1K29pRjU2TG51TE9oSGkzbENr?=
 =?utf-8?B?cGl5Q1VSNzlrbkp2YVdLcy9NY3F2QnNoSFF0cWV1RUJCNXNZSzZ4a2NjWjhX?=
 =?utf-8?B?dU9pSHlxQXE1ZnFXRXNGbE9qa3pDZ1c4VXhBZEdhRXpvZXRpdjBreUE0QjBO?=
 =?utf-8?B?UEprWGx0MU9VdEFNcys5WHl5K25GU3J4VS82Qi9ScUpVdlE2c3NBWisyWW9n?=
 =?utf-8?B?c3Nla25TSnFVSjEwQzdxRlR3T3NnS2ZNQlhKVlN2anBOMEkwQ0xkNm0yS25V?=
 =?utf-8?B?bFFGWTIvQytoeGJXMjMvZ3NTQkU0OWFFQWUyS1RXc1NCSEVzd0gxR3lHY2J6?=
 =?utf-8?B?WEtJQWJjeG1YU0JMOGNIM3NqNU5LbkowSVlYMkx6Y1N6SDhsSlF3NXltSm9H?=
 =?utf-8?B?MkN2WnpvdzhZQklzZDcvRENILzBUeDJFeUk2cDlsSzdQL0k2eWVnV3p5RVh3?=
 =?utf-8?B?UytXR0JkeFlNSURRWXQzY1ZucnZUTmtZOGdyc0NxY2JzNG9mOTlCQlRjNlRj?=
 =?utf-8?B?NmVPd1RLelZhZEdtcWNlZzNZOFRjb3pxQzVNZEpEWm00TnlaL0M2bG82eGFi?=
 =?utf-8?Q?5/sAeja+vKPOKB2xT2lCEJJlw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edb61b07-e26b-4af6-ae7d-08da8fedb65f
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 09:53:55.9371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Joa3QMTooc3uLtO+Xd1OLfMDfAMbQ7ppCP93cffdk+tToX7fQ7Q4PEllWow/Zb5w+7UQ/a6y3lmSwLN78yRQrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5508
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

Apologies for the delay in responding to this thread. Some responses below.

On 9/1/2022 6:14 PM, Hans de Goede wrote:
> Hi,
> 
> On 9/1/22 14:24, Bastien Nocera wrote:
>> On Thu, 1 Sept 2022 at 13:16, Hans de Goede <hdegoede@redhat.com> wrote:
>>>
>>> Hi,
>>>
>>> On 8/23/22 12:29, Shyam Sundar S K wrote:
>>>> In this series, support for following features has been added.
>>>> - "Cool n Quiet Framework (CnQF)" is an extension to the static slider,
>>>>   where the system power can be boosted or throttled independent
>>>>   of the selected slider position.
>>>> - On the fly, the CnQF can be turned on/off via a sysfs knob.
>>>
>>> Thank you. I think that before doing a more in detail review
>>> we first need to agree on the userspace interactions here.
>>>
>>> I've added Bastien, the power-profiles-daemon maintainer
>>> to the Cc for this.
>>>
>>> From a quick peek at the patches I see that currently they do
>>> the following:
>>>
>>> Probe time:
>>> -----------
>>>
>>> 1. If static slider (classic /sys/firmware/acpi/platform_profile)
>>> is available register as a platform_profile provider
>>>
>>> 2. Query if the BIOS tells us that CnQF should be enable by
>>> default if yes then unregister the platform_profile provider
>>> and enable CnQF
>>>
>>>
>>> Run time:
>>> ---------
>>>
>>> Allow turning CnQF on/off by writing a sysfs attribute for this.
>>>
>>> 1. When CnQF gets enabled unregister the platform_profile provider
>>>
>>> 2. When CnQF gets disabled restore the last set profile and
>>> register the platform_profile provider
>>>
>>>
>>> Questions/remarks:
>>>
>>> 1. If you look at 1. and 2. under "Probe time", you will see that
>>> when the BIOS requests to have CnQF enabled by default that
>>> userspace will then still shortly see a platform_profile
>>> provider. This must be fixed IMHO by checking whether to do
>>> CnQF by default or not before the initial register call.
>>>
>>> 2. What about low-power scenarios ? Currently power-profiles-daemon
>>> will always advertise a low-power mode even when there is no
>>> platform-profile support, since this is also a hint for other
>>> parts of the system to try and conserve power. But when this
>>> mode is enabled we really want the system to also behave as
>>> if the old static slider mode is active and set to low-power.
>>>
>>> Some ideas:
>>> a) maybe still have the amd-pmf code register a (different)
>>> platform_profile provider whn in CnQF mode and have it only
>>> advertise low-power
>>>
>>> b) teach power-profiles-daemon about CnQF and have it
>>> disable CnQF when entering low-power mode?
>>>
>>> c) make the CnQF code in PMF take the charge level into
>>> account and have it not go "full throttle" when the chare
>>> is below say 25% ?
>>>
>>> 3. Bastien, can power-profiles-daemon deal with
>>> /sys/firmware/acpi/platform_profile disappearing or
>>> appearing while it is running?
>>
>> No, it doesn't.
>>
>> It expects the platform_profile file to be available on startup, at
>> worse with the choices not yet filled in. It doesn't handle the
>> platform_profile file going away, it doesn't handle the
>> platform_profile_choices file changing after it's been initially
>> filled in, and it doesn't support less than one power profile being
>> made available, and only supports hiding the performance profile if
>> the platform doesn't support it.
> 
> Ok, so this means that if we go with these changes as currently
> proposed that if a user uses the sysfs file to turn CnQF on/off
> they will need to restart power-profile-daemon.
> 
> I think that that is acceptable given that the user needs to manually
> poke things anyway. We should probably document this in the documentation
> for the sysfs attribute (as well as in newer versions of the p-p-d
> docs/README).
> 
>> Some of those things we could change/fix, some other things will not.
>> If the platform_profile_choices file only contained a single item,
>> then power-profiles-daemon would just export the "low-power" and
>> "balanced" profiles to user-space, as it does on unsupported hardware.
> 
> Right.
> 
>> The profiles in power-profiles-daemon are supposed to show the user
>> intent, which having a single setting would effectively nullify.
> 
> Yes that was my understanding too.
> 
>> It's unclear to me how CnQF takes user intent into account (it's also
>> unclear to me how that's a low-power setting rather than a combination
>> of the existing cool and quiet settings).
> 
> AMD folks, please correct me if any of the below is wrong:
> 
> AFAIK even though it is called CnQF it is more like auto-profile
> selection and as such does not take user intent into account
> at all.

Yes, You are right. Below is a brief note on how CnQF was designed.

1)CnQF – Cool And Quiet Framework - It’s an extension of the static
slider concept wherein PMF dynamically manages system power limits and
fan policy based on system power trends.

2)OEM can opt into the feature by defining the CnQF BIOS ACPI method.

3)Static slider control and CnQF are mutually exclusive.

4)CnQF supports up to 4 modes of operation – Turbo, Performance,
Balanced and Quiet.

- It can be configured for AC and DC distinctly.
- PMF driver calculates the moving average of system power and switches
the mode of operation.
    *If system power is limited to the threshold of the current mode,
move to the next higher mode
    *If system power is not limited to the threshold of the current
mode, reduce the power budget by moving to the next lower mode.

5)CnQF feature control is through Radeon SW (a GUI based tool on Windows)

To match the behavior on Windows, we kept a sysfs node to turn on/off
the CnQF on the fly like the way it can be done the windows side with
the Radeon SW tool. If you think that having as a module param makes
more sense, I am open to make the change and send a v2.

Like I mentioned above, on Windows the static slider is absoultely dummy
when the user goes on turns on the CnQF from Radeon SW tool. Based on
the review remarks on the earlier series, we tried to
register/de-register to platform_profile, as per sysfs input (like
setting up and tearing down to platform_profile).

The Difference between Auto-mode (for thinkpads) and CnQF(for others) is
that:

- Automode gets turned on only when the slider position is set to
"balanced" in the platform_profile and
- a corresponding AMT ON event is triggered.
- it has 3 internal modes quiet, balanced, performance

But for CnQF,

- it is independent of the slider position and there are no ACPI events
for it to get kicked in.
- There are two seperate ACPI methods for AC and DC to get the
corresponding thermal values.
- it has 4 internal modes quiet, balanced, performance, turbo


There is already a WIP feature called "policy builder" where the OEMs
can build custom policies, which includes looking at the battery
percentages and making thermal optimizations accordingly. But this was
not taken into consideration while designing the CnQF on windows too. If
we bring in this change for Linux, there maybe differences in the way
the same feature behaves "differently" across OSes.

Like you mentioned the usecase, where just a compilation can end up in
battery drain if not connected to AC power. Can we not have a
documentation update saying it is advised to turn "off" CnQF when
battery % goes below a certain level? That way, the end user experiences
across Linux and Windows remains the same.


> 
> It looks at the workload over a somewhat longer time period (say
> 5 minutes or so I guess?) and then if that consistently has been
> quite high, it will select something similar to performance.

Right. The switch time would be dependent on the "time constant" values
set in the BIOS  which is configurable to the OEMs.

> 
> Where as for a more mixed workload it will select balanced and for
> a mostly idle machine it will select low-power.
> 
> I guess this auto feature is best treated the same as unsupported hw.
> 
>> (it's also
>> unclear to me how that's a low-power setting rather than a combination
>> of the existing cool and quiet settings).
> 
> Even though it is called cool and quiet AFAIK it won't be all that
> cool and quiet when running a heavy workload. Which is why I wonder
> how to re-conciliate this with showing low-power in e.g. the
> GNOME shell system men. Because in essence even if the battery
> is low the system will still go full-throttle when confronted
> with a heavy workload.
> 
> So selecting low-power would result in the screen-dimming which
> I think is part of that, but the CPU's max power-consumption won't
> get limited as it would when platform-profiles are supported.
> 
> So I guess this is indeed very much like how p-p-d behaves
> on unsupported hw...
> 
> ###
> 
> As mentioned I guess one option would be for CnQF to
> still register a platform_profile provider and then in
> balanced mode do its CnQF thing and in low-power mode
> disable CnQF and apply the static-slider low-power settings
> I think that that would work best from things actual
> working in a way I would expect the avarage end-user to
> expect things to work.
> 
> So p-p-d would then still see platform-profile support
> in CnQF mode but with only low-power + balanced advertised.
> 
> Bastien would that work for you?
> 
> AMD folks would that also work for you ?

If we go with the above proposal it would become very identical to what
is being done with automode (expect the extra "turbo" mode and not
having a AMT event). This would need some amount of discussion with our
windows folks also to know what they think about it.

Please let me know your thoughts based on the above notes what I
provided(in the earlier section), so that we can make the code changes
accordingly.

Thanks,
Shyam


> 
> ###
> 
> I'm also wondering if we are going to still export
> balanced + low-power modes to userspace in CnQF mode
> and disable CnQF in low-power mode then if we
> even need a sysfs knob to turn it on/off at all.
> 
> I guess the sysfs knob would then still be useful
> to turn it on on systems where it defaults to off
> in the BIOS.  Might be better to do this as
> a kernel-cmdline (module-param) then though, then we
> also avoid the problem of platform_profile support
> all of a sudden changing underneath's p-p-d's feet.
> 
> Regards,
> 
> Hans
> 
> 
> 
> 
> 
> 
> and for toggling ooff through sysfs
> 
