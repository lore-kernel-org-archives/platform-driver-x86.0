Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A81D6C77B61
	for <platform-driver-x86@archiver.kernel.org>; Mon, 10 Apr 2023 17:33:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229909AbjDJRdg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 10 Apr 2023 13:33:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbjDJRdf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 10 Apr 2023 13:33:35 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B32110EF
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Apr 2023 10:33:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/b7GCUT1SWzU4q2vVW4BhWh31LV6XyvqPs6O5YnchyUYIqoTf/H6UrXV245JCyNQ88DWGGvX7sYohgDtxynrPjzXkI/cXHGxBHMR1sw4pYKlirjuiLguIBCFkmgetqkwFTTUCesmKafejRAZ6e3EGJVkcjiHb0XMWknU16tcIp58glu+vZQQLx2tMcZgcs9TwQT01r9AonHyOH7hisGQNSXHKaacQOVnNq5kLIu8Cm6dnjqZCxoLCmQD+tBfq2GscFs0qj6ev//OJ2BPuK09GcvdeEYoYSEutIZReDKAK1C6t6PV3s5zkyJIOdmuk8CM5UEaXAa6PAsMjFkGN5x+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRxyma6ts+Ql9Cpk76RHkgzShG5PdzsOqbJ9UGX/srk=;
 b=Sgi0LCGwRscr/l1mvQqcYuuXXLoKcIK+6liB0TDW8oQRzcKdM3fPSMXrnzjV49HHED3GmhxLafJNHkpAU2+B4kH2HZyAQPo+prhyzyNuMeqEUB2ypF0qscF9EXWFTVEet3MXHKyI/mSf70nvMbv2/o4Q6ce5XmDOz+7Yke/V93UWThA72tG/JxP+Kj/5pzldcINy/FsRqDXz9xVNo66AjIi9iAyQwyY1fW8SFBspk89Hz7p8nkAwINzyzwe6ov2dUtr8N3v94udwwUAYxStRiuEZFIV5U9F59CBHv8C8RQZSEuO5vhbJc6cogxRZTo7FmaoKqcOZ9E17TwsdGtG9XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRxyma6ts+Ql9Cpk76RHkgzShG5PdzsOqbJ9UGX/srk=;
 b=iaN6CSTOL7p1UvWLCdb4gvrwzvh5hJciGpcuT0rKStF6cByrLgl2F4YfuT0Wr8X0nzuBU2sLLK2vc4oX+26/4tRHy7VhSlffbZ4x9VdqIS5xSZyiqGFptm1swJAN8bjjm6+ymO68iOgT4xXqCRu8Z+SfkXZi+6g+eU7gxbFk2Ho=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MW4PR12MB6756.namprd12.prod.outlook.com (2603:10b6:303:1e9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Mon, 10 Apr
 2023 17:33:31 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::70d7:b03e:aecf:3b6d]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::70d7:b03e:aecf:3b6d%6]) with mapi id 15.20.6277.038; Mon, 10 Apr 2023
 17:33:31 +0000
Message-ID: <5cdabe58-0c16-a815-68fd-5b81e7ff5f42@amd.com>
Date:   Mon, 10 Apr 2023 23:03:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 0/8] platform/x86/amd/pmc: Updates to AMD PMC driver
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>,
        Hans de Goede <hdegoede@redhat.com>,
        "markgross@kernel.org" <markgross@kernel.org>
Cc:     "Goswami, Sanket" <Sanket.Goswami@amd.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <20230409185348.556161-1-Shyam-sundar.S-k@amd.com>
 <16fc47de-2464-5862-73f7-38a80cd82df4@redhat.com>
 <MN0PR12MB6101CD495BC935413CBE981CE2959@MN0PR12MB6101.namprd12.prod.outlook.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <MN0PR12MB6101CD495BC935413CBE981CE2959@MN0PR12MB6101.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::15) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|MW4PR12MB6756:EE_
X-MS-Office365-Filtering-Correlation-Id: e5fe3b03-85b4-458d-d03d-08db39e9b40e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mgixqNsERHkhHaKwbRwBxtubxGuXTbo5lcu0Ca/x/1i0u0oXRc3M88lOXxrH7W4LJg4ckT+2f4L63QILierVhLoZ0N06LALtMwb62E6H3aG5WKXw/BwWMuD/WACZPq02h7umNZGcKt1kWjjdij3E0wHEM5DFQvGbYyYDtbVjMhJnw4c6yH/d73OZ/AAqPT6G0JtCkCRWMcW97KTLruCIeHz+f8GBwhfgTN0fFP1UttqFMw8Bonz+XzHL7cGsPbyBT7H7mf6WnrEOY+DZiyABbLpVPAo/wZqj1KbtCOBkvsPrMObullM6iWzDdos9Y4RxreYazwSp/FswMpn8ENdAcQYW6C4HzT4wDTX4le72SmRwbgRsKazwnyUH/Vt7l86IU3/67kkf3yC4Ne9+aUaInfC13VfLYa9tpanS6DvdOHO3MoNua3YR8vx1HUs7P0nkmxD+oBWzilJo6zIxbLlgAkm1xnQI77bh0Os4hpJ0n4h2E+BKrFYc9zgKqxNY2/2uh02T/Fw7weq9Jfw3lL4XIWUNhQkYmIpphsnscCYiF9V+tkj1Y6RcLLrax4vetrha929vTphfsJh01BEgzJgFih5pvc5838qlCqKQmjBJz0SJzU02l2lLX9cf4VkqK3GGmvCt3Qwickyx0ULNVQeoWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(376002)(136003)(366004)(396003)(451199021)(478600001)(6666004)(316002)(110136005)(6512007)(6506007)(53546011)(186003)(54906003)(6486002)(2906002)(15650500001)(66476007)(5660300002)(66946007)(66556008)(8936002)(8676002)(4326008)(41300700001)(38100700002)(86362001)(31696002)(36756003)(83380400001)(2616005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGdhT3dJSHMyOVhYaW9ZYWEwUzF3VlRFMHBFdlNaZmFZNEhMdVhLYkdwb1dM?=
 =?utf-8?B?NVVENXlvL2dzNFoxQWlKL0ovSURjbGVIcmZzWGoyblFKanJSWnV2bkNyUXNy?=
 =?utf-8?B?ajFjaG5aeDZoRkJhME5YWmxaUzFtYzJYL1ZPUkxSNjU1bUtYeGpuODlZZHpo?=
 =?utf-8?B?cHZWbG40SCtiY1JqSG9iOW4yek01UEU0SkEvZ3cvdFQzdHhQUGlqSGRrbHhR?=
 =?utf-8?B?R25EQStvMGE2VWlYWjNGdG1Bdi8xNml4TVNKdjNXdytqT1lDMURRNVJSc0w5?=
 =?utf-8?B?cnBVOUhCc1Z4UlAybDVQdlhid2RpU0N1anlTWWI2YTZBK3VrU295bE5UZ3N3?=
 =?utf-8?B?TFhUNElvTk1IY09BNWtDRGdaYk1aUkxoS2VKOThhbm5XRU9teHRhTkp0SnJq?=
 =?utf-8?B?THBXTGR2K2U0bTVyUXp5N0VSY3dvV0FLSmxoTGIvMThpMkdhQjlWMjRNSVBv?=
 =?utf-8?B?ZUsxYUFKdUZEOFc0aTFidERRZkpPQ29hNzZPc3NwU0hPdnoxbzh0amlETXUz?=
 =?utf-8?B?Q0tNTzJYV0cxc3FabjZwVmI0U1BieW04UE9vOVRXRWhmOUdISDB2TG10Y05M?=
 =?utf-8?B?cGlFTHVEUGFkU3c2UHZWMDJWWFA0cEpwV3k1Rjd6MmgrK0Uya3dONGhRT0hI?=
 =?utf-8?B?OFdrMG85V29WU2tCVlpIS2hyM2w0dG9ZZzJiYWUxditJS0k0azVrWlBFbjRP?=
 =?utf-8?B?Y1laaCsyMHFOaGdoa1E1aUxtUWZXU2U5MGdQcm11Z2J2Y0JrVlN4am9SZzc1?=
 =?utf-8?B?MnQrczVpM28raDVBTFlBWVg1eXFYTWp3OVZNVGZVQ0RFd2xJbnI2NXBnK3kz?=
 =?utf-8?B?ZHFOcVF2RVRoNEo0TzRFUzJNcVpzQXdQZTdXNU1XaWdmUjNEZ1BacFN6Y2tk?=
 =?utf-8?B?OW1qRkRyb1grTldzYXpLZElLNDJja0wydEZhM3dVMWc1dG9VQ2VrNDRZRmdT?=
 =?utf-8?B?TGQ1bFR6bWhLNXN6em9jbHQ1eTdpaGo1WVE4R1J3ZkxyMVJYSlZ0cGR0ZnZ6?=
 =?utf-8?B?UnlWK3Z3OEhlR3kxdGN0RTFqcUU3V2ZIa3R4OElWaWZqVko1WWQrSnRBZ1N1?=
 =?utf-8?B?Rm96QTFFOTFvR3QwaTczTFpsUGRFMTdKVHRZQzROTTdPeTNNekdRTktQaGti?=
 =?utf-8?B?NEk3dmZnNHNUYXdWaktEOHVEaEwydUxaaytBU1FqYXZaMjgyMWk2VTNlWmZW?=
 =?utf-8?B?MWFhSFFKMjdZRndYaDZRWjV6ZXNva016U3VVNVJDaEJ5UEV4OXF4WjUweFdY?=
 =?utf-8?B?bVE2SFNkL2ZXOFdPK0VWVlNyMVpwZ3BvNThxNWRjZEpqdnR6eEtkMW02VVZC?=
 =?utf-8?B?UFdGZUd5eGVJOXF2TjY2a3lFbm1uanovQWtiZ3VMQ3ZacVZhdW4rdUZrMGtu?=
 =?utf-8?B?M0hRb0Z4SjJuaGZqSmNnc2ExMUNlODQ3ZlVmY2k3VVVCbjFmeFFGNjlqbk51?=
 =?utf-8?B?VUVFMVc3RENLZ01CRlQvWWo4YnBzemgrTzFncm5vVWNvWlVUSmxEdW1OT0ti?=
 =?utf-8?B?cXQzRlFobGVqOHV2Q2ZTeXNtbEFudndoSmx2ZzZMQnN0VXpiRmhHR3d1MnVM?=
 =?utf-8?B?eDBUbCt0UzhNeEp4OWZLZFpiZlAvR2RzVDh4SlpFL0pJZWJvc0pYL0ExWFFK?=
 =?utf-8?B?SUhqcnRFTXk5dkZDaVA0ZFl4TURBb2VoZXZxWFViNUd4bHpPUU9JKzJhSUVG?=
 =?utf-8?B?NHZNUEtEZitpZlBmMkh3S2EwUTBqQ0t0SDcxc0JSb3Z2S0d3elozK1hQd1BK?=
 =?utf-8?B?QXlkK1ZONXpWUTJNb0ZUdWg4MTZhL2Rob1lzUGlWNGU3OEF2UXZLMW41b3Fz?=
 =?utf-8?B?ZGs0eEZpbFluUXZ6RmZCTzRsSXFSOXlFdUJwVUxDYzAvQTdHazhKcUpPQk1U?=
 =?utf-8?B?TFBSdkNucjBmUnFsY0lFazZvdVYrTTZnb3hTL2QvdktlQk1aMURpQXlBZEMz?=
 =?utf-8?B?bmVrVWhRajdkUVpweHBYYmlIV2dlUFpyZ09oZEpvelY1SlVxb29oZjNkV1Bx?=
 =?utf-8?B?SDZVOGpIdGFSL3ZaUndKWVdVdVhJM2g3SkI3YytvWGpLWnNSWXdlSVUrRE1U?=
 =?utf-8?B?WVFmMUdNWmNyTyswdlNMaWNkUUpjWFkyb0dZdGFDNGNvK1R6UkVTNWVGQlVH?=
 =?utf-8?B?dmtiUWpjUENmWGpWN1dsY2RwM0ZYeC9OaTdiQXAwWHVaNmF6UWxwT2R4bFRx?=
 =?utf-8?Q?nXurjVJjDYzF1r1pH4G2vOZGMHhFvkRzD9NChzNQxNTu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5fe3b03-85b4-458d-d03d-08db39e9b40e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2023 17:33:31.8327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VdPOlKmzKYHijrUa7+XcL+AeFXeNU/zLOX5QZE6IUy0RoJSNsLO6CQ2BCiMnOBeCcmH/uQ0PVrXv2KM9YhL5uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6756
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

On 4/10/2023 10:19 PM, Limonciello, Mario wrote:
> [Public]
> 
> 
> 
>> -----Original Message-----
>> From: Hans de Goede <hdegoede@redhat.com>
>> Sent: Monday, April 10, 2023 05:37
>> To: S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>;
>> markgross@kernel.org; Limonciello, Mario <Mario.Limonciello@amd.com>
>> Cc: Goswami, Sanket <Sanket.Goswami@amd.com>; platform-driver-
>> x86@vger.kernel.org
>> Subject: Re: [PATCH 0/8] platform/x86/amd/pmc: Updates to AMD PMC
>> driver
>>
>> Hi Shyam, Mario,
>>
>> On 4/9/23 20:53, Shyam Sundar S K wrote:
>>> This patch series includes:
>>>
>>> 1. Fixes to Picasso from Mario
>>> 2. Change the SMN pair index for driver probing & STB init
>>> 3. New command ID for getting DRAM size from PMFW.
>>> 4. Change in smu metrics table data structure.
>>
>> So patches 1-6 all seem to be bugfixes, but they don't seem
>> to be very urgent.  At least AFAICT they mostly just fix
>> some (harmless) warnings getting logged + future proof some
>> of the code for newer firmware revisions.
>>
>> Given that rc6 has already been released it would be my
>> preference to just merge these into linux-next so that they
>> get merged into Linus tree for 6.4-rc1.
>>
>> Either way (urgent should go to fixes, or -next is fine)
>> please let me know how to proceed with merging these.
>>
> 
> IMO they can wait for 6.4.  There is a matching change needed
> for NVME for the Picasso stuff which isn't landing until 6.4 also.

Agree with Mario.

Thanks,
Shyam

> 
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>
>>
>>>
>>> Mario Limonciello (4):
>>>   platform/x86/amd: pmc: Don't try to read SMU version on Picasso
>>>   platform/x86/amd: pmc: Hide SMU version and program attributes for
>>>     Picasso
>>>   platform/x86/amd: pmc: Don't dump data after resume from s0i3 on
>>>     picasso
>>>   platform/x86/amd: pmc: Move idlemask check into
>>>     `amd_pmc_idlemask_read`
>>>
>>> Shyam Sundar S K (4):
>>>   platform/x86/amd: pmc: Utilize SMN index 0 for driver probe
>>>   platform/x86/amd: pmc: Move out of BIOS SMN pair for STB init
>>>   platform/x86/amd: pmc: Get STB DRAM size from PMFW
>>>   platform/x86/amd: pmc: update metrics table info for Pink Sardine
>>>
>>>  drivers/platform/x86/amd/Kconfig |   2 +-
>>>  drivers/platform/x86/amd/pmc.c   | 240 ++++++++++++++++++-------------
>>>  2 files changed, 145 insertions(+), 97 deletions(-)
>>>
