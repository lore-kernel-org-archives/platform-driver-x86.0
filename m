Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F76DEE49A3
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 04:12:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232345AbjHVEMB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 00:12:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjHVEMB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 00:12:01 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CA14133
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Aug 2023 21:11:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JePpg6lCzmQMLqDCvgyubOQE9mtY5iMbpBhXq59GZEBzYSbADk5sVMq/CJO/vj115aK5riRIp+ZJIhzhaSGUQTTKt6J1PCFL1YQOA/OusYTtUnR0nlueg2GdvyOrXrp5GTOyZfCG8b9LrOkWBNz1qKVeKHAxkVDDHdRkaPDU0S7ED/e9bnelpdHq6O4Om8CdAOJeEZgwAhclMzhZpm1VCVIY5N+No0YRGOMWJ8Gf3SRnbciQUvDLwa+25/aqJRrZVAapI8+JhwL5BZ3mhOiDUqFwLmKhhUs6jdhwxtDE9Q9TWq6mON9tN2vdwdeyPnpUW7iDspPDz0xaxstjHjFV9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWn5qEbx4iJFYch/J/laLNgmEPxjP1e6jlFJOPuGhZE=;
 b=Lh6suhImik6j0QEKYZuq1wKijQNogu8ec59L8X7m+ADbjkELhxlQwn30QyXhAmFk3hcLLDVnOVWIfmAuNxW/O8fkmP9QLnZuJEtRd5TG8UR3XrgeH7eXN0wPQmBBl9ia3q1wjjGjY2E1c0EEhAeUeIV12keY1gV1BjYkJyJLaLjKXXbYAFyfvYm+AXfXJnaIoVbh9DHnl7BKRENbZX/OHM1cWFmvd9MJqmGhiBYB2rodhto8nPAJ3sgVNtS6sL+eJ4IKzl9fvCCk4ZpLuXdSL6WyJLGNzMcl1xiLWUgfXSQ/5jSIb3t9f68SYjECfPARrZm6NYY3Qm7nBpCxE4YicA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWn5qEbx4iJFYch/J/laLNgmEPxjP1e6jlFJOPuGhZE=;
 b=qKO/otCxZPPTbKF8lIS69iMstx5yPWatTjHwfnRrv+K/ExxzQMhVIDSf+V7K35Sf0DmeBHTbwIzjIlYaEIUrCVZ1ABkHFYp/QMKkCZhL5zp3z/Jkt4DPL0lMBgAVpSQon0YseTMmZ9qqZnCYlJidXsJkQROD3H7Siz5OBOAXedQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5184.namprd12.prod.outlook.com (2603:10b6:5:397::18)
 by MN0PR12MB6055.namprd12.prod.outlook.com (2603:10b6:208:3cd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 04:11:55 +0000
Received: from DM4PR12MB5184.namprd12.prod.outlook.com
 ([fe80::39ab:c489:68ca:4729]) by DM4PR12MB5184.namprd12.prod.outlook.com
 ([fe80::39ab:c489:68ca:4729%3]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 04:11:55 +0000
Message-ID: <060110a2-d0d6-5954-eace-7c80a3386990@amd.com>
Date:   Tue, 22 Aug 2023 09:41:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 0/4] Updates to amd-pmc driver
To:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org
References: <20230811112116.2279419-1-Shyam-sundar.S-k@amd.com>
 <2c0ee105-8610-5698-a729-8d665b9318b3@redhat.com>
 <a2a5f3e5-c921-d62b-4c11-109d24b90811@redhat.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <a2a5f3e5-c921-d62b-4c11-109d24b90811@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0045.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::8) To DM4PR12MB5184.namprd12.prod.outlook.com
 (2603:10b6:5:397::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5184:EE_|MN0PR12MB6055:EE_
X-MS-Office365-Filtering-Correlation-Id: bf14e087-df4e-493f-212a-08dba2c5ebfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9wfgI5vEGHqpAw0004O8xiwgukkIc72Ia+yCjFXlqZbM82FcsVlygZUsum3aNL4NKdn8dZ+iLDwCIqofabUOIfQs0rCU9NeWCR9ITJrJXFRDz/virUWitaLFpG+W19YTVNmD4c2WmNs3LGvSJVCGCCidlrW0voovJJ/vGIjbi8BR6I5dT3FDZUGb9UTPfBlapZLxjkNquINfezd2D7szf7tHj0m/+mT12FUJLfvIDa5MA91E8ccpFAI/bUv4STSdEu7RVCpBIOVVleVMDzbXYZkuLTf9T2698LPAQktE0PR/hzN4fusTveTrtruSefmizVeDkBM7QLHEGotizH8M0zdJOUgwebM3KhVaxssw9ILBLkS6tGHLyIkrOwrvXbpK5najOcIYqF55KOCYng4MSv/Vxnm0UdYnJntqd/FW+T4PCr90ItfBWgLYnWDvRiWPqqaHZArFiLWin20iQ56clCwxDXOJJfwMZFsik9grWXWZjoOdd8wFbvXVtT4+X8TJl4Kk5lslXk9dtgmtUNuNOFuv6HE5czROY5OjcNQay2Mtdo6K/a+jD1JDmFn9RI1w3HFbZB8Ca3P2Cn1k5ScQeEjWAED4yRJWa3OHc54aXyzCQk/4v8X+aTQnyKwlMEKng716z1Yc7qBcWV+Dnxmjow==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5184.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(376002)(346002)(366004)(1800799009)(186009)(451199024)(66476007)(66556008)(316002)(66946007)(6512007)(8676002)(8936002)(2616005)(4326008)(41300700001)(36756003)(966005)(478600001)(6666004)(38100700002)(53546011)(6506007)(6486002)(83380400001)(2906002)(86362001)(31686004)(31696002)(5660300002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGpPbmVRelRPcXE4S0lWbkYyelgxaVdheDk3djNtbFNBMG5ER1VhR0gxUitF?=
 =?utf-8?B?ZDE3RTNDdnZXMVROOS82UTFvM3luVmlJTTBmaXYrS1NENEExUTQ2R09KRHFo?=
 =?utf-8?B?b0VTQmVLUEZCZjg4T283UXp0YlB0UTN2dzVZNHJRM3RBM1JEYlc1MWMzWjFL?=
 =?utf-8?B?WGRpM1FMTG5UZ1p1Q29PS3U3UUZBY0ZmRkwyTjJHbCtYSGtiK2xldkRXWHZh?=
 =?utf-8?B?R3dQbGFZTC9tMFhxVTUwRXpKMi8vNEVPRkoyU1JRSmRQbFBubXlHTzNVUkV6?=
 =?utf-8?B?eWRTUTlpR3M5UGxsVFFMQ29HZ1pPb0plTG5EdHdGS1RiWXdYWUVJTEx3S25y?=
 =?utf-8?B?TFRvam9CMUtXOGlrZ1owWnpRanhjeHJTLzZIK2lFWE0zNmlhNEJlYUF4OHJ2?=
 =?utf-8?B?K0RwVmdjWW93Unl2K0ZqOXFPTmdDRHQvejZWTUR6bk9rU0xxcHJqL1VZUlQz?=
 =?utf-8?B?dDRBVzZmQk1wdnBMTzlQUDg0dGgzanl1VEV3Z0J1SDFIOWVjTmNmT3JyOGxx?=
 =?utf-8?B?YVpDSWkrWjk2bWlWQ1YwZHVCMnB2YjZwZXE0b1NnQm03aFBhYWhvVkgxSldK?=
 =?utf-8?B?am11ZW5Va0lHNk1NMlBlSzB2UGxaa21MRFRacGcvUVRSd3AvL0wwaDc1VDQr?=
 =?utf-8?B?Sm9TWkFBT0M2MkF3RWFid1lDbS9DaVdjb0hCVkhzRTlJU3FVdzBzN3BJVmRW?=
 =?utf-8?B?UTFuVjBBZm8yUXZUTnBPY2pGRi9LYk1NRXk2ZHEwR2FidHNQTEtObDN0Vmw0?=
 =?utf-8?B?VUJaeDUvM3dpQ3BZTFFwZE1IVURuTml1eGpXMVdFWktxcDQvK1RYdDVzenJq?=
 =?utf-8?B?L3hnMEkwNXVqM01BR3JWY24yekZXaEFrWVBWeEN1YUxyYVJMVjE5ZTIxUjlM?=
 =?utf-8?B?YmZ6c3pnNHh2akpYOG9KWVVlNkg4VUZRemNPZUlCdnQzRzJteGcvNkNCYktQ?=
 =?utf-8?B?czE1eUVYeHdmOTJPSlhnN3dUejBtMjJKWUxpckU4eXVrbW9lcnJxbktham41?=
 =?utf-8?B?QkhVRnlZR0cvdEpyZnhOemhoKzZjK2c1c1lTT2doQzEwYVNJdWs1cDRnbDVO?=
 =?utf-8?B?OTV5OVp3M09GRng4UWhHRFM0OGNJdXJHMFlqbXpoZVR4VytWRVlRdHBmbHNQ?=
 =?utf-8?B?YlR1ZVhrU3gxZ2lZRzRkYXkyUzF3UCtNZ0I2a1NxWlNSMnM0amE1RTBLZlhR?=
 =?utf-8?B?OGVJZmVwYXJQV0thVks4OGVLTzNSZGl6TUxpSFQ3S2ZoMFBsdGViVTVWWEdy?=
 =?utf-8?B?KzU4WVlZaWlJMEIyYWxBNnN4Zys1U25LanBGNHVvWWhXUkxDVHF6dm1JZDdw?=
 =?utf-8?B?Q2FSY2o1ekVBaXFVZHYySlJBWGgwUUhVMDQ4NjZWQzVTOVE2STk0WlpQZms5?=
 =?utf-8?B?ZlFaaHpZd2FVSTRzSlA1MmZ4SWRUUVNMZ1NRa0d2eUZvd3BicXByQ1VKZWxJ?=
 =?utf-8?B?V1pNZzJwdVBZb3BvRVVlTURXanB6S0lLTi91UnN4TExnZ3Evb1UyQTBWQjBS?=
 =?utf-8?B?bHFwaUUyNjJTOEhLWXVwL1F3N0tHRlNxYnF0T0gzN3lHZW5aMUszUUlvNXVR?=
 =?utf-8?B?RjZjQmFTRFhyNGt1aExHQUVJVDlQVEIvVnYzUXA1cVM1eFZNaHE1SjlHTHEx?=
 =?utf-8?B?N2piSU1rekhwM1JCbkUyM0o2L0dOdlhDWkNTSFBvK210QUtJWVRzcDJwUHFt?=
 =?utf-8?B?SXRLa01MRm5ZMzhhWit5UDZVUkNuZ3RLaXhKaVlsVjdWUWtETGsyNmxvMG0z?=
 =?utf-8?B?TC9SRk9PSnNJMm0zS1Q3bHZwS2FkQndsMmx6UUlDNHRjNU16NUJ6NWI3SVVT?=
 =?utf-8?B?SFRWclh3bHArTnJza0I5OGZESzdsMXFxUmU5alkrTVZSSFFOZWI3YVN6WXBs?=
 =?utf-8?B?UDNJZmdxZm54TlRpZ0JhYVVhNGE4YUQxTDR5OG9udVlGbkRSQ2thc3FXRC9O?=
 =?utf-8?B?WFMvbEFBNXpHRjF4TTJvWmtZcHJZeG1DWEgwRTQwQmtnZHNIU2lldUV5VTZs?=
 =?utf-8?B?VFVEd0h1KzVuZ0RvdzlaekVoOFhSSlpDemthVjZ3Q25Wb1huRXNLY0VEQXd0?=
 =?utf-8?B?MkZLMzdjdFJsb0VwN0NTNDkwcE9KMGZoYXhYY3h4cHJ4UjVRMnliWXNxWHFZ?=
 =?utf-8?Q?ZjqmLmGNB03YANpDRtuRKikf2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf14e087-df4e-493f-212a-08dba2c5ebfc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5184.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 04:11:55.7946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B7qIwYGsoCFtBKVCBsXvNTeRQpvYKmCxTe9J3VwPVzk1CQ7WgGb9IVKa0WG/pR0idf7ASXCzk1btk1mysFUjHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6055
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

On 8/21/2023 11:22 PM, Hans de Goede wrote:
> Hi Again,
> 
> On 8/21/23 14:57, Hans de Goede wrote:
>> Hi Shyam,
>>
>> On 8/11/23 13:21, Shyam Sundar S K wrote:
>>> This patch series includes:
>>>
>>> - Move PMC driver to separate directory
>>
>> This one seems to rely on the state of the amd-pmc code in pdx86/fixes
>> which is also the state in Linus' master but not the state in pdx86/for-next
>> which is based on 6.5-rc1 where as e.g. :
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?h=fixes&id=e8ef8dd28c4c4b86cd3010ff42c79582f766862e
>>
>> Which adds the pmc-quirks.c file was added later in the fixes branch.
>>
>> So it is best to do this moving into a separate dir directly
>> after 6.6-rc1 is out, at which point fixes and for-next will have
>> both been merged.
> 
> So I have just back-merged pdx86/fixes into review-hans (future pdx86/for-next)
> because some pending mellanox changes need this to avoid conflicts.
> 
> As such I think I can pick this patch (the patch moving things into its
> own subdir) now.
> 
> I think it might be a good idea to merge this patch for the upcoming
> 6.6 window so that we have the moving of files behind us.
> 
> Shyam, shall I merge 1/4 into review-hans / for 6.6-rc1 now ?

Yes please. I will drop 2/4 as per Mario's remark. Once you have 1/4
into review-hans, I will rebase my changes on top of it and send 3/4,
4/4 as v2.

Will that work for you?

Thanks,
Shyam

> 
> Regards,
> 
> Hans
> 
> 
> 
> 
>>
>>> - Read SMU version at the time of probe to avoid duplication of code
>>
>> Please address the comments made on this patch (or drop it).
>>
>> I assume the rest relies on this patch, so I'm going to drop this
>> entire series from my queue now.
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>> - Add a Firmware command that can force flush the Spill to DRAM contents.
>>> - override the STB dump size with a custom one using a module_param
>>>
>>>
>>> Shyam Sundar S K (4):
>>>   platform/x86/amd/pmc: Move PMC driver to separate directory
>>>   platform/x86/amd/pmc: Read SMU version at the time of probe
>>>   platform/x86/amd/pmc: Add PMFW command id to support S2D force flush
>>>   platform/x86/amd/pmc: Add dump_custom_stb module parameter
>>>
>>>  MAINTAINERS                                   |  2 +-
>>>  drivers/platform/x86/amd/Kconfig              | 16 +---
>>>  drivers/platform/x86/amd/Makefile             |  3 +-
>>>  drivers/platform/x86/amd/pmc/Kconfig          | 19 +++++
>>>  drivers/platform/x86/amd/pmc/Makefile         |  8 ++
>>>  .../platform/x86/amd/{ => pmc}/pmc-quirks.c   |  0
>>>  drivers/platform/x86/amd/{ => pmc}/pmc.c      | 80 ++++++++-----------
>>>  drivers/platform/x86/amd/{ => pmc}/pmc.h      |  1 +
>>>  8 files changed, 66 insertions(+), 63 deletions(-)
>>>  create mode 100644 drivers/platform/x86/amd/pmc/Kconfig
>>>  create mode 100644 drivers/platform/x86/amd/pmc/Makefile
>>>  rename drivers/platform/x86/amd/{ => pmc}/pmc-quirks.c (100%)
>>>  rename drivers/platform/x86/amd/{ => pmc}/pmc.c (96%)
>>>  rename drivers/platform/x86/amd/{ => pmc}/pmc.h (98%)
>>>
> 
