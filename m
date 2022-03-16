Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4413BC433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Mar 2022 17:38:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357710AbiCPRjZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Mar 2022 13:39:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357733AbiCPRjM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Mar 2022 13:39:12 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam08on2060.outbound.protection.outlook.com [40.107.101.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C37B717055
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Mar 2022 10:37:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DfJSDkynL/mDzz+V2NUNc37Cnw4/Eq1pcvc5NkyP7C5vpmvwgwwPyhzAsg/qJcRmb9TS1LCKtH7Qr8OlCksmFziAFkHKnfCETTBGbIx1UAdFeD21JHBV94Ewt12nr3LtiEH+/ULJ/Dvscf6XflF0lGnclfS4RWaBZzSzKmqvV63HHZ2XfdtUQy3PTnVpEQt+xg/wsPiCBzfIJQGxSr4IOU8KXcmssNVLDFfR0CzJwYYJggKMtBaC6TUWGzAmRbsK+v4AbUUTN+XjoTEdH5VITNusM3AkLNC9dFPt4EKPPpEZH26SQOW2Py2bxgrRU3L2cFczJZNXk1z7lrRO2Cu02w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgTo6beAkdQHa43g8nMzFQv1oMDlBZvPyXWvMAofOWc=;
 b=P2FUMZLIqussj9q4grav8etzciFK1GnIoPCZZ3lTCCnePpCJlcvPmHtFXCOTUhpziYNzQaz7Cn7cUp+kKdJlKTO83UlGpTV+kev7EGExN/0udDZZbt/Tl/ZTYkY8guw+O0xX8sPnTo5vuAbVIuCtFVwmd62uqJmVopiqdRTkSzVdOExR3a2SPFtYCNoP/dWsES4XrQI7HH2tr/kp7I8iA1/wAtVZmtr035lE4cfPuIa1Bulzd2UtM23w7uIz6WU6lA+ehyzbbAJp4mWh18BjewaQCbzwEgbg37uMeTNjw5ZqEoZvM2hBTbqe63dLomp4ZDSxusLrTpgBUl5nT3vJ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgTo6beAkdQHa43g8nMzFQv1oMDlBZvPyXWvMAofOWc=;
 b=fkA1dbfDPytHOcAoBQZKhDkVp6+3xKqF18s8z7Wu9h5HzuYV6SeMOUFlOZeQydlQyirgXQPlZ9gfxtOrtUsSsncQPB86pLchl/1SfJtEi3BugEDfvZktKOldWJB9yfjyow+oWwRGR50ACk7eRtjUcJ3yo75/O9S/oH4I8wAcyJg9zHLwXplFxqSODBgXrRv4zQscuPSfR630x6125q4wyGtT2hdVZwq8pt746Jv8uIrScJcNOo8O6jBLAn+Jj91LoS+5RjaFtIunjIN0YFIXu7DQqJLNck8xBNppbYm77swCJ3v3LCfp1mwloWxwLfnOfVoJkD2Qqc48ZPktpIs71w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16) by
 DM6PR12MB4465.namprd12.prod.outlook.com (2603:10b6:5:28f::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14; Wed, 16 Mar 2022 17:37:54 +0000
Received: from DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::99a5:ac34:8767:b7f4]) by DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::99a5:ac34:8767:b7f4%6]) with mapi id 15.20.5061.026; Wed, 16 Mar 2022
 17:37:54 +0000
Subject: Re: [PATCH] nvidia-wmi-ec-backlight: Add workarounds for confused
 firmware
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Alexandru Dinu <alex.dinu07@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20220316012516.2233984-1-ddadap@nvidia.com>
 <v_ODhOndx3g1l-BhfKGCB6_nLY83LTc5vz1YDrVEVVF5CmgKUs1x9bmROyWXhmYkeQRVVnvfBnyrFyHaEKqtoZE5P7lKJJ1j_vE0J1Piq2Y=@protonmail.com>
 <0fbfd32e-904d-1e04-8508-e863c357a2ff@nvidia.com>
 <BL1PR12MB5157B047D2DD5548FE08F0ABE2119@BL1PR12MB5157.namprd12.prod.outlook.com>
 <7d56afc0-3428-6ab5-ba41-c5ce4f1a7ad7@nvidia.com>
 <BL1PR12MB5157CA033FD8117DCC79D0A4E2119@BL1PR12MB5157.namprd12.prod.outlook.com>
From:   Daniel Dadap <ddadap@nvidia.com>
Message-ID: <d3d86512-42c6-a5df-752d-efbb89257d3a@nvidia.com>
Date:   Wed, 16 Mar 2022 12:37:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <BL1PR12MB5157CA033FD8117DCC79D0A4E2119@BL1PR12MB5157.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: DM6PR11CA0056.namprd11.prod.outlook.com
 (2603:10b6:5:14c::33) To DM6PR12MB2763.namprd12.prod.outlook.com
 (2603:10b6:5:48::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f0ecf22-963f-45b6-1a1a-08da0773b357
X-MS-TrafficTypeDiagnostic: DM6PR12MB4465:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB44659957AA97E534BF3F1985BC119@DM6PR12MB4465.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yhrrPEwq38dhZbu88SsWqG6uWuUPDMd348TKne3DKLpYX0nq8l+xRFlZgKK0JldxIdwdvNjqkh0ayGNVL58YmBnbAkWTbdbMOeEQ1Udfpx7glqxtFHiDVnBP+F26sUsmz1MFfcO2f5v4uP9q4hUyEHtMBjKOqS6xq9T76YisDP6evuDwAYmsVC5UpDnAhcFg0/KPyRoMYxCxuyTYxpgoUPtOvbjYoui3WdsmNjH+JhVHZMlThC0rU1cydbqazuZSUIZXVYwiotDlb4v0MfiAHh++na/vd6AMfLK9e/JcEnTI165Zz9MEc4hjQNEQKgbWEnI1xlXaMc9rZVjCLUOg1PYsmlGGEgOemDoD+nfd5zz/TMtKSTWyz3wAG2yr5GihJEm5GFlV+A2HC1YPTF2A6xG/+CZ7UA2Y9yxVdOiRxvNla3tAS+nwHHSribgBLoE1tnaTqskmGkcgcRi5nsmawyachHgASDEBieQdGhMSMJngiD/k0xPpL0UAO9SfvFK1NVU1w4S7H683v3jitgZUyotHX6H77RJ0pgnHWD3lVu69MN2UIh9e3ZKr/W/huQ9pZMmsTuabzj2cTZ95NmpzMcHFn6yNq6IFV9nogZLb2HoEmgpb6ryHgamjEwkbdNqdgUdyCyQvFm7eEkbS4fsq1M93EfuXZ8sGhHEOqszny/IoDV8Sc/Xg+vaqEi9R6I5RNQlAlNS/eA0ubWsexkhs27ToqGuWSqnYLw9auiLpD3ZMPMnJOhmtVGL8yYZJB/mr
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2763.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(8936002)(31686004)(966005)(6486002)(316002)(36756003)(6506007)(6512007)(5660300002)(6666004)(53546011)(110136005)(2906002)(54906003)(66556008)(66476007)(66946007)(8676002)(186003)(26005)(66574015)(4326008)(83380400001)(31696002)(86362001)(38100700002)(45080400002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VldhWUVQTUFZSDRBejVlN2p5VWV3NzQ2enVnZW50UFNkQWtGVVlGTE8weHNq?=
 =?utf-8?B?cHdvQ0U0cjRMUkZtT09IL3ZkRExDVDZRZitRMk92S2JuSHlYbHVvQXlCanBU?=
 =?utf-8?B?RmZJVFh6azkrd0ZhZjdoQVlQclBFNnhlTmJ0Z1orWXpSR0NGY2RVWnFMSGNX?=
 =?utf-8?B?WUozdTJnN0k1S0o4OWpZKzBhRXFOMGxHcXdlL3d4TGtCVDAvVnZLdjNCWEJV?=
 =?utf-8?B?TXBUTGNhVHpRZmo2NnllZUVVMGhzbzhUK2FIZ3JLM2RYUzcwZmx1bDdjUi9T?=
 =?utf-8?B?YWVlWkJHWm9BU3dmbmtBc3diNzRKTEs2cDFhdEQxR3hrVndnNjYwcWkwUVpW?=
 =?utf-8?B?b0Ftem9xVURuelMwSVRaQXpuNk84UUplNktTWmpwdFRaa3o4NkUyRHhvOHVr?=
 =?utf-8?B?ZGVUUnBUeHgxNkpybXR1cTRlM0w4aDlFcmZSOW1VQnlIUlVkQ1pjaXFOenVw?=
 =?utf-8?B?Ukp0NGx6THdyUVlrcHk0TEFyK1RtZDJFR1U4VThXRHpRRTFDYjZQZ1llRS9p?=
 =?utf-8?B?Z01hQlY5USszMkVXbEVXRm1EakZ3Yzk5aURlMnBZV1o0ZFlndldXdUxSaUs4?=
 =?utf-8?B?QXZXU0NZTHVPaEZEMTh4MWR6ZzJGcEs5ZG9Rc1R2cVk5dGVWQ1R4ZkliYUVp?=
 =?utf-8?B?Lzlnc3E5cjhMRllLWFdvSUYrVDZ2RWlYQTJ6VlFqekxIb1VzeVdZUC9vN3lR?=
 =?utf-8?B?eHdBcHJWWHNyU1hzQ1orWUxRd2VpZFJhMFRwcHFVek5yUk9ieWVRMWJ3SGJ0?=
 =?utf-8?B?by95QXprMzl5T0JlRURlQ0dTZVNKcWF5eW9DbWlFTFBhdjFBdVFsM3ZOYUJT?=
 =?utf-8?B?bHE4eG4xZVVoZGhWRFpJRFNqSXFMamV3SERDZnpOYkpMWlRuT01RVWxpR0dS?=
 =?utf-8?B?d0RjZnQrUHkyUld2YXIxdWx3Z2F2WWh3eUduMXlqZTZjTm5LSFVFQU9oMjFv?=
 =?utf-8?B?TTkrWFcxb2JYeC8xWTRNM2dIdklDeUpVbkpTYUxLMXh2N3R5c05lTWkyRHFm?=
 =?utf-8?B?Rk1JR0lCcFpqOU1sVXF4Rkw1UkVpdlNEeDFKYmlxSGFRbE9TaXVpYXdJSDQ4?=
 =?utf-8?B?aGhkS1JFaGRoWnN6SmlEWUF4Sk1CLzJ4OVJHVnJZamFuM1hZQkNGVlNwbmgz?=
 =?utf-8?B?QUJlZTM3WlhYZW1pYjF0dmE4T0FEbmFnbnZHNzBNOXZneVRrQTJIY0NJanV4?=
 =?utf-8?B?TWpJMzVkMGt5NlkrYlpqNWdqVDV1NHhsSVd6M0JjQ2J2R2RFTHVwZll0UUJW?=
 =?utf-8?B?K1pHNVhhWmpEN1FEcGlQc05jTXE4eXR5TEMrbVZGNUg3TWdKRkNRQ0NWUCtV?=
 =?utf-8?B?V2R1RzZMZ1puVlgrUVd3UytzRlhHMzFrdTlmTkVxYkowRVI5QTNsK0RsdHRp?=
 =?utf-8?B?TENld2xIRjY3dW9GVkdYRjhSRHR5TXhsamxtcjRjNXdCNVE3NjVPU2Qzd25u?=
 =?utf-8?B?QTFSc3paMW5Ic0ZOWkdSaHhrREs5aDViZmtVRktKZEFKTUtnWUdSV2JNSTlI?=
 =?utf-8?B?bnR4VVBWUGhNc3hFTVFrQy81cEhzeWU0ZDNWbUdDNUNUSkc2NVNyNjVjY2tZ?=
 =?utf-8?B?TjBscTFqMHVvdHQ0d2dXQXlOZnh2TDJGTE5vS2lZcUF2ZnFCaEsrckRXVmJR?=
 =?utf-8?B?NW1SZk5NbUdHMFFnOVJuZ09BSHdQemY0VDdGUGp2Tzhxa1EyYUFFc1lNR3Nz?=
 =?utf-8?B?SUtlUHVKY09XdU4wMjYrQXlNNTYyNUdjbi9weUs5SkhLaUlEaHp5STNnSUpG?=
 =?utf-8?B?d2Y2dit3K2g1YndiNk9jbDVjSWJ3elVDMDFRNXlXV3lnUnlBbkh1QU5NbDN6?=
 =?utf-8?B?bjJ0ZDk5RXRPMW1zSTdSMktqZjNYSHJiUHV5MEcwZms2YjdCZHNjNk9QMjNp?=
 =?utf-8?B?V0xES2tkMnBBdXBreXphY1RaNWVNZXRWWGZxY3h4aWFkV216aDYrVGJxR1dp?=
 =?utf-8?Q?Z09oY9nXv+ZwFm5enhYjOBLgHNCZhjBR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f0ecf22-963f-45b6-1a1a-08da0773b357
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 17:37:54.0466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l4xkClvRLBzsMYcBELZwdZ2CyD0wM/Jy9d+xdhkJZbXPhf+qBcJzWqlK5dWrNvssilqaJ1vx4VwkGTtQb9PHoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4465
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 3/16/22 12:21 PM, Limonciello, Mario wrote:
> [Public]
>
>> On 3/16/22 10:29 AM, Limonciello, Mario wrote:
>>> [Public]
>>>
>>> + Alex D
>>>
>>> Alex, just FYI this was something that came to an AMD bug tracker and
>> wanted you to be aware there are W/A going into nvidia-wmi-ec-backlight
>> for some firmware problems with the mux.
>>> IIRC that was the original suspicion too on the bug reports.
>>
>> Is this on a public or private bug tracker? If this was observed on
>> systems other than the one already added to these quirks, could you
>> share the details of the systems so they can be added as well? (Or I
>> suppose you may want to test to see if these WARs are effective on the
>> affected systems as well; we can always expand the quirks table later.)
> We (AMD folks) don't have the affected systems, we were just trying to help
> users and things pointed at this driver, which seems to have yielded a good
> investigation and conclusion!
>
> IIRC this is the bug you want linked in the commit message:
> https://gitlab.freedesktop.org/drm/amd/-/issues/1671


Ah, thanks. Most of the people on this bug seem like their problem was 
that they didn't have the nvidia-wmi-ec-backlight driver, which also 
didn't exist at the time the bug was filed. There is one person with a 
newer comment reporting behavior that sounds like what this patch works 
around, and it is the same person who initially reported the issue to me. :)


> But these two look possible to be the same root cause:
> https://gitlab.freedesktop.org/drm/amd/-/issues/1791


This one sounds like it might be a different issue, since it was 
apparently working at some point with a kernel that didn't have the EC 
backlight driver, and then not working on a newer kernel that also 
didn't have the EC backlight driver. That is, of course, assuming 
vanilla kernels: it is certainly possible that the EC backlight driver 
was backported.

> https://gitlab.freedesktop.org/drm/amd/-/issues/1794


This sounds like it could possibly be a simple case of not having the EC 
backlight driver. Notably, the backlight device exposed by the amdgpu 
driver never works, in contrast to the system these workarounds are 
targeting, where the amdgpu driver's backlight device initially works, 
but then stops working after the first suspend/resume cycle (and the EC 
backlight driver doesn't work initially, but then starts working after 
suspend/resume).


>
> If you end up introducing a module parameter to try to activate these quirks
> it might be viable to ask the folks in those issues to try the v2 of your patch too
> when you're ready with the module parameter.
>

v1 already has the quirks plumbed up to module parameters (those module 
parameters just don't have corresponding sysfs entries). In any case, I 
only see one report between those bugs that sounds like the issue these 
WARs are meant to address, and since it's from the same reporter, it 
sounds like we won't need to be adding any additional quirks table 
entries right away.


>>
>>> Comments inline as well.
>>>
>>>> -----Original Message-----
>>>> From: Daniel Dadap <ddadap@nvidia.com>
>>>> Sent: Wednesday, March 16, 2022 10:11
>>>> To: Barnabás Pőcze <pobrn@protonmail.com>
>>>> Cc: platform-driver-x86@vger.kernel.org; Alexandru Dinu
>>>> <alex.dinu07@gmail.com>; Hans de Goede <hdegoede@redhat.com>;
>>>> markgross@kernel.org
>>>> Subject: Re: [PATCH] nvidia-wmi-ec-backlight: Add workarounds for
>>>> confused firmware
>>>>
>> [ ... ]
>>
>>
>>>> On 3/15/22 9:50 PM, Barnabás Pőcze wrote:
>>>>>    [ ... ]
>>>>> Lastly, is it expected that these bugs will be properly fixed?
>>>> Possibly, but I wouldn't hold out hope for it for an issue at this scale
>>>> on an already shipping system.
>>> This question I'm assuming was aimed at narrowing the quirk to only
>>> match certain FW versions or so.  If there is no certainty of when/if it
>>> will be fixed I agree with current direction.
>>> However I think it's still worth at least noting near the quirk in a comment
>>> what firmware version it was identified.  If later there is confirmation that
>>> a particular firmware version had fixed it the quirk can be adjusted to be
>>> dropped.
>>>
>> Thanks, Mario. Sure, I'll make sure the firmware version this was first
>> observed in is noted.
>>
>>
