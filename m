Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E76FC4332F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 Oct 2022 16:04:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbiJQQEW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 Oct 2022 12:04:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229913AbiJQQD4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Oct 2022 12:03:56 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46EC16DFA5
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Oct 2022 09:03:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WyhlqYRVecCDU89vdBDxqXRZ7RLMd7aX5SdbFzQYcZaXATigJLngFV+LAVl1O6Ir2Yi1PjAAM/4i5M6399gZK2QqEFKFqy/R7WLcj5smk3nJ2FEWeoeObWBHGJnm1iBPXMcT8V6+uBnJ93iyGTWKUm7wPdZPqQ1sf/0K+RTMM1MhydwV9oT9RyTdexvHrVPi/ZNS9aDXbuKVZhmkcD5s6XbKNmZ2vYoIOgKXk4FRSaX4M+Xq3RPuGWCYX7EO8kWrZYsaDUMbnNbGJXGakxIZEmBFh5jnMT0sEoy1NJ9Fd+y0k9Lx3qyNc0pVWq3yILBPuQ/Uuhgta1PqKtP74Hps1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aspOKknu8eemQIJ8PsJFhFQviUGD3jkiMJjKEInN1xY=;
 b=Zj+w7HwtP39UtPOgUFf4TYE3/4HWcsrsHG9aiH2yrdIXIcEx8Ob720vWPSadqBNNyPWgS/qQ6w6WopNrzMLca3WX0xAQ0DeO3R3ZsKgKC648D+eKHU512p52Qs/5T13ay2ASk2xXspeQG9dkTDPPIjtii4QLBcSgaMue1zAQbZJW9fZi2hm4+EZWnd2rI7ToS5GY8IntETI83sKgqT8kRZ2TZasLZNmpt0NHnV95UaYOluFFhPL17qdsoE8ABKqq2Ar47HvsSLQlaA0JGx6EGPzx4JkNhy/TJ1wR2jiDEjck+TacVH4OTVjzB51yQMY/u+xvHmRLv56H4JqFOrolZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aspOKknu8eemQIJ8PsJFhFQviUGD3jkiMJjKEInN1xY=;
 b=jiKSvYrI4hwgNnqlVD+GDwS91JP+JT2lRcgN14WowI4OAOKvmpZYtMWjJqYjQVhTWd6UNoRd11vw5z8vPPj4EXXmHA+ZHvhZjpaW2NoAi/mGeR4xPFVHr9awBmKc2qPvYqKaday6C+qZdOfdc4D4IJkdSeOh1FZIO/IT19JE/wo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MN2PR12MB4565.namprd12.prod.outlook.com (2603:10b6:208:26b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Mon, 17 Oct
 2022 16:03:34 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::76ec:6acf:dd4d:76a3]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::76ec:6acf:dd4d:76a3%8]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 16:03:34 +0000
Message-ID: <643af53c-48c3-dd9f-4975-ff4430dc3c62@amd.com>
Date:   Mon, 17 Oct 2022 11:03:31 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v1 1/1] Introduction of HP-BIOSCFG driver
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <20221010162326.12957-1-jorge.lopez2@hp.com>
 <20221010162326.12957-2-jorge.lopez2@hp.com>
 <a50407fd-6969-9e9a-23a3-39879af639cd@amd.com>
 <CAOOmCE--qzRCOgpfpW5j5VmnCPExdTVDM9yQ-PcXrec76e492Q@mail.gmail.com>
 <d88e15ba-9e3f-310d-118b-7ccb2fbe1ca9@amd.com>
 <CAOOmCE9wVT=Fr72pgx58X4RMPy554MwZev3_8JtU8cBLdNpfhA@mail.gmail.com>
 <CAOOmCE9fuHTTVcSUSC0SU3N_ht8uVLg4hGUAJE7bJgs6UAt3gA@mail.gmail.com>
 <dbffc3c3-9fbf-8d7d-99a9-29d44671e7f2@amd.com>
 <f453562f-b87d-d754-0aaf-524575bc7f57@redhat.com>
 <CAOOmCE-E8SGmUVmajYqXFpza1p5mwTOJS2Z6a8Wxd4g=j92vkQ@mail.gmail.com>
 <30603c5b-2dbd-32d6-00b0-023a5ff977ee@redhat.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <30603c5b-2dbd-32d6-00b0-023a5ff977ee@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR05CA0036.namprd05.prod.outlook.com (2603:10b6:610::49)
 To MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MN2PR12MB4565:EE_
X-MS-Office365-Filtering-Correlation-Id: 18f4fe6c-114b-4f59-ec13-08dab0592497
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n2dOWRERmsTNxw4uSQ6tpkXxEjLb1MaXfSnSSklrb6QtJsnvJdAIqm2TRyVOPAXGCfb/Nl8MJd6dRdA0EL8OlBhzHldt2lSgKHJsQoBO0rYpyBj7Ks8usLmHQXWu7XFOFR2Nrd9Qe+k7MENADPbBAlM3Im5BYLx4OKLnvcMnJKPzBqYCuNXbIc1J5v7LV2Zh9Yv/QS/azVnuHg0mwgru4SdeEsTNZUG3vME/6FXJ4t+VWRdSB1jjQYS0YDh+z9yG5KwuaAPAL37+h4ngmiIhCsSqyHWKIcl6JPVkzuvT45hYELTTqgpqj5Y59ovwuT/05aDfe7HHeeihRhah4JWk71Rp/t1Z2PXMpy8UdTzQ3n5USqB8MY7kgJ1yGwaB2bDdHOYAT9Kf0Sa1iKa2+9Lcv9JYArhiqUIu08YaBNfexlDiVIeEldl8HUECj/commuv1IEajVRpZ3HTYmToMObQaju482hFhFPVgwe9XoUo7pF7Fg7f78AJhZXdyJ7qTkyzo8gzk5KhvkSQ427dAbV1jLZgbTvTIHL+lkfA9isqhTJ22NpviO+TolMSucW9TQ9yvsR5vHJishCZG1CwofCRri7ZEii3iY3B86toxLkaxTxdwidtE8tYbflPUqNYUcglsiQqFiwg1PSYVp9LfB7/ykPINVIp7jp2MH5n0ZsqJYevE2AWWkH5lZaZEkoc4iTLYklLKSb1KGq32kQsXEfA74gGhDtvZVLFIoSp3DvhGVLBxZ3bdsAakL4CjoRQHQY4BeUvxOFC+3eGg72Ow98RhRDyeU3qTw0ue+EEdN3cSJjkhSrLWb95pa0w9IbPI363tk0IdD54bYlTJ/HuMGF61g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(451199015)(2616005)(186003)(6506007)(6512007)(6666004)(26005)(83380400001)(53546011)(2906002)(5660300002)(8936002)(110136005)(316002)(478600001)(6486002)(966005)(66476007)(41300700001)(4326008)(8676002)(66556008)(66946007)(36756003)(86362001)(31696002)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZCszTnJnNm1QbUJJMlVYaS9qZ3NSM1RINXJRRTFFanR0TGJPOWxrYWRnSWpL?=
 =?utf-8?B?cTM4azZjUDR1VUcvdFpnaUNyOXFndjVYMnY4Q3RMbXFGandLWjhFWVFpSG1Z?=
 =?utf-8?B?eFhLbXEwcFZLU3gwbjBXcGYzQ2psZFV4VEl6eGRucE5yYkQ2aWtWRFZQRlBR?=
 =?utf-8?B?MVRXUkZDSXQzM0NnUzRZTi8ydmhXQk5jbjZobVpIa0Y3d1AzeElQa0VMQWY1?=
 =?utf-8?B?ZVp5YkxsS1J0L2prcG1vT0x1K1VkWTAvY0dFZVk3SmYrM0dvcEI5OFpiWHFS?=
 =?utf-8?B?RFc2RUp4Y0Q5Q0pseXRpem53MWZub1dpcmlYMjJtUGFhTjhoZzR6emNjenRt?=
 =?utf-8?B?REJQakZPSmEyMDl0MDhKOUJ5R3Ivbm13dzB0WkZKNHhJVTl5SWJSOFgwbGdB?=
 =?utf-8?B?bnlLTWkwNDhERjAxYjZ2U0xzNlNHdmtqOUlkbzJpNXNjbmgwRFc2RWJQaG9r?=
 =?utf-8?B?MEpyQjBRL0RZaUdXMmc5NUx1eTJZdkhWL3YxRG9ONkdxYzZncEx1d1pPVmhn?=
 =?utf-8?B?clFnUjRvdEVzQ2toY3QrWG5CaXdJbVJ3Wk55K29QbTNXeC9YUk9Pdll5YXFB?=
 =?utf-8?B?anRlZU45NlAvZTRobUoreWwvcytTMnRXL1RORkZGZnI3dzlqUkVIVU5UVmVP?=
 =?utf-8?B?d2o1cS91MkJGU0Q2dVBMQ0IxK3pPbkJwellyOWZhSHJ5K2FSbHcvUSs5TmI3?=
 =?utf-8?B?bEptOHBkL3JjTG9yRW0zQXpONXpvZjFsSk5qZUEyT2I0Sld5VGJXdGVoQkRa?=
 =?utf-8?B?dmROTStWa3kyWmhWaWt2cUVid1p2RXh4TjJHb1E0NDZvMERhSFMwRVBWWGhZ?=
 =?utf-8?B?dGJORWhOZXNMQU1PaW1mcmkyMzNqV3UxN3VlNmxSTEEyZVJzUTZ2Z3JNWEli?=
 =?utf-8?B?UDNBSk1tM2M1VnVsYVh1KzZMdk5SSzd3SjNiNlR1bDZZaEJ6V1FtQVg1bjIy?=
 =?utf-8?B?ZGl2aFc3YUkyZXN1U0pkUFFxTkRRMzNMZlQ3eVdVVmFqMW92TFhXSVJjK0lV?=
 =?utf-8?B?SW82WVdEMHlkdzRacXBmd3ZTdktsMUkydDFzOUFzeTh2d2ZaMmQzSTBicFV0?=
 =?utf-8?B?NksxcFBESERFbCtHUmt5ZVA2eHE2VmR3RU00WWY4NU0ybnlGTnNyb1F6SnZm?=
 =?utf-8?B?MFBvbUdzNkVLWDZPRG5RdUdwRkJJWGVoTDVJU3FKS3piMVlENVZwd2txaEY0?=
 =?utf-8?B?WTBBbmg5dnpydEhXNTByN1cxemg0VWl2NHp5ejZBQVRrajIzajZCanBHd2lK?=
 =?utf-8?B?Ykt4TnVqUVJQY3FSMlpNMGVFZXZWTjl4akNDcEt2L25UU2xvbk52eGdDb3h6?=
 =?utf-8?B?aVFjYWowb2FOSFkxbDJPcmFNaFRFN0ZnOUVmQ3pyODQ4Ymx6b1ZVWDJTSWUz?=
 =?utf-8?B?SkVVYXJmZHd4NzU4MjUvdmxMWCtQbUkzaG9zdTgybUdHWTF0RlR3MlNYUVJE?=
 =?utf-8?B?ekxsMVVTVmpZOWZlSXZDc3ZFTkREMTdlWkNwNkRIY0FXeVpsYnhwWG5YOUFr?=
 =?utf-8?B?bHNzajJ4MlFkTit6N1lrSEJ1UHZnL1NaMkhpS25Zb2Jid1V0a3MxZnZidkVt?=
 =?utf-8?B?TTdqTWNCUTRYSDB2aVlqZS8vMVk1OEVBcVh0Q2s3YWFURUhrN21TZEl2WHow?=
 =?utf-8?B?eVFDUHdvSWhuc24zT1hQekdwTURQN2xBeWQxQkJ3aFZ4ZitCTWowcTcxNzF6?=
 =?utf-8?B?bStvM1h6RlNqbGF1aVl2NTZjYzBQWHFqQUhZMFdwdUVza0cvbWZTaGx5eGh0?=
 =?utf-8?B?S1o0Q0IrRjVVeXNQSElHL1hSSE9ueUJab0RzelFFOFRyeTdJMTNRc2NhVXVU?=
 =?utf-8?B?YkRFNjF3dUZrVFZLR2tKckEwWHlpaFFaVDQ1Ymo4QU96bWhDU3YyYU8xQm9R?=
 =?utf-8?B?YnYxQ3JReDVpMGRvN0pqTHA4ZUtldUlwUUJwNmhjSU4zWVd5Uk1lMDBCb09Q?=
 =?utf-8?B?RG5aS1AzRE9UdUl6d0RidkIxaTRNakRJNXhuR0s0VDIrdUI2UmYwbnZ6cFJM?=
 =?utf-8?B?ZHFIcTJYcGZvN3FCR3pQektNdzJZK3VEcG5NMWw5QkZwTHNrbTlTU0E1MGww?=
 =?utf-8?B?K0RmNmhSOEk1OXdReXJIN0ZNeTVFT2tyblUydHA4Mkg1ZWhhNWtaSDBCbTQ4?=
 =?utf-8?Q?vim5BCKIYpS+eAzb9orGZSqGq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18f4fe6c-114b-4f59-ec13-08dab0592497
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 16:03:34.1516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uhIANqzsN5UtPumPiS6Hwf6dZjzq4JVFfsIxFDXWkoEg7erSDMx99I99uLTdaHOvFgF6gxNZ9PDk8U4JC7MHdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4565
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 10/17/2022 10:37, Hans de Goede wrote:
> Hi,
> 
> On 10/17/22 17:20, Jorge Lopez wrote:
>> Hi Hans,
>>
>> On Mon, Oct 17, 2022 at 9:37 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>>
>>> Hi,
>>>
>>> On 10/17/22 16:29, Limonciello, Mario wrote:
>>>> FYI When you submit v3, you don't need to add "new patches on top" for your feedbacks to the new driver, they can roll into the patch introducing hp-cfg.  Just make sure you include a changelog under your cut line to indicate you changed these from vX->vY
>>>>
>>>> I suspect that Hans will also want you to split the driver up into smaller bite-size patches to make his review easier as well, but I'll let him advise how he wants it done.
>>>>
>>>> On 10/17/2022 09:11, Jorge Lopez wrote:
>>>>> ''Hi Mario,
>>>>>
>>>>> Please see comments to previous source comments.
>>>> <snip>
>>>>
>>>>>>> Thanks.  If you make this change for v2, I can make the matching change
>>>>>>> in fwupd so that if it notices current_value permissions like this that
>>>>>>> it shows read only there too.
>>>>>>
>>>>>> Submitted the recommended changes for review in v2
>>>>>>
>>>>
>>>> Thanks, looks good.
>>>>
>>>>>> Submitted a patch to improve the friendly display name for
>>>>>> few numbers of attributes associated with ‘Schedule Power-ON.’  BIOS
>>>>>> assign names such ‘Tuesday’ to an attribute. The name is correct, but
>>>>>> it is not descriptive enough for the user.  Under those
>>>>>> conditions a portion of the path data value is appended to the attribute
>>>>>> name to create a user-friendly display name.
>>>>>>
>>>>>> For instance, the attribute name is ‘Tuesday,’ and the display name
>>>>>> value is ‘Schedule Power-ON – Tuesday’
>>>>
>>>> Looks good
>>>>
>>>>>>>>>
>>>>>>>>> Presumably if this is going into it's own directory you should move all
>>>>>>>>> platform-x86 HP drivers to this directory earlier in the series too.
>>>>>
>>>>> The other drivers named HP-WMI and HP_ACCEL  were written by third
>>>>> party members and not by HP.   It is for this reason and because of
>>>>> the number of files, only hp-bioscfg was placed in a separate
>>>>> directory.   Let me know If my reasoning is not valid enough  and I
>>>>> will keep the files in a separate directory and move the selection to
>>>>> the main list.    In addition, Moving  HP-WMI and HP_ACCEL drivers
>>>>> from x86 directories fall outside of the scope of these changes,
>>>>> Correct?
>>>>>
>>>>
>>>> There is no distinction who writes a driver.  I think either you keep this driver in the root of drivers/platform/x86 or you put all the HP drivers in drivers/platform/x86/hp.
>>>>
>>>> I think if you're going to put this driver in the sub-directory "hp", then the first patch in this series should be to move those drivers to that sub-directory.  The second patch should be to introduce your new driver.
>>>
>>> I see this driver has a lot of separate files, so what should happen here IMHO is:
>>>
>>> 1. a preparation patch adding a hp subdir moving the existing hp drivers there
>>
>> This will be a separate patch but not an obstacle to gain approval of
>> hp-bioscfg driver, correct?
> 
> Right, this is just shuffling things around a bit because as we get
> more and more drivers having them all in one dir becomes a bit
> unwieldly.

The AMD drivers just underwent this very recently too, as did Intel 
about 6 months before.  If you want an example of what they did you can 
use this to reference the AMD one:

https://github.com/torvalds/linux/commit/ef233eafe5adc54ddc39a1b6cc483dddc744bf97

> 
>>
>>> 2. but this driver in a subdir of the hp subdir, so put all its files under:
>>>
>>> drivers/platform/x86/hp/hp-bioscfg
>>>
>>> so as to keep the files together and separate from other hp drivers.
>>
>> Can you please clarify..
>>
>> Do I need to start a new review with only two patches described earlier?
>>
>> 1. a preparation patch adding a hp subdir moving the existing hp drivers there
>> 2. Squash (current version v1 and v2 changes) into one
> 
> Ah, no, splitting step 2 as you did into multiple patches is fine,
> reviewing multiple small patches typically also is easier. So keeping
> the addition of the hp-bioscfg split into multiple patches is good.

The split right now is along changes requested on v1 -> v2 rather than 
along making the driver into functional pieces.

> 
> The point which I was trying to make is to put all the files
> for hp-bioscfg in their own sub-sub-dir and not mix them with
> the other driver files in a single hp dir.
> 
> Regards,
> 
> Hans
> 

