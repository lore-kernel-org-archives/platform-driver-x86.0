Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B65C04A68
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jul 2022 21:01:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232113AbiG1VBO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Jul 2022 17:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbiG1VBN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 17:01:13 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D39B6246
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 14:01:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E3/jOOqRVwBOksV7uePTLmxHfCbyAMiybfpDMVLq0l9nGI8+w3QOXuH15LczIZSVDZZBiwF9Ugzy+rmql7kO6gazg3MOGUOPc8gFL9vK9cBGxeEUnFA1hDAmLH0JAyHKC2POSdtGBEVE5MAdn5qsSQUZiYsCv+JnsoBx/GQI7OmXis8TO70od09/6C1G+NnkCzuSpOa3QFKwM0IsR/mjJ+vMOHy8q3MdkyvifI0OMVVuN4fc3v7N7Z24alKH3Yv4yIDKWrSBnDIUe0zMPKsI2Z92hGDHX4//P5e043USk/LlWGP2mtb9KmMT6frIkTT283mVsT8VUlCuWQ2pY59txQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9NlcbLihUIp5JjOAdCCRKhsYbBWX+89EKQSrYwwsqJg=;
 b=a1aQZNa7WwJJAYnTiokDW++YJ46B9t7/yPYWssxTXkXyZHfjysfbold7fAnAEdQI7cbjeMf305+HUPO0Ppw+tiNoNiRkM5Ixj+Ji+1UUfu6mLK7xS/dHbcpVYeUPWjsh2qh0z/reTHz6FHZja1B4cSxnVtqUlPMVbKdTfFl4ltiY9fDAK6Mt1LXeE6gOlE+/I6ws3ANP2UAUfas1wzzfy93nh/ESlBDhi4mYoGOOdW734N+G8BUERtSHk1OEw3FcjsDmLe010ebiv7ecJhL9wkS2QHpHSbtqwxPQgFOlW2MXRnMD6zwmUbl7NU/nh0O5Z+fpkUdXEuGD3JNyWthdbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NlcbLihUIp5JjOAdCCRKhsYbBWX+89EKQSrYwwsqJg=;
 b=RJHkigRn2+hkcBE5HS52hMTYn3//WX/DCnwoChBiCu+HSKlmYNPbEPbOqHa4abzpQvKv7sWJkzLC3HGJxZ40zty2pjIHw1WC16M7T5OJheMCFF2GPzH+c+y1I77TSs/b4X+aGS7gzAJlLNsIlDtaDqYvrCpvKOWdrdazqlAmCHg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM5PR12MB1930.namprd12.prod.outlook.com (2603:10b6:3:10d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Thu, 28 Jul
 2022 21:01:09 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::1143:10a5:987a:7598]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::1143:10a5:987a:7598%6]) with mapi id 15.20.5438.023; Thu, 28 Jul 2022
 21:01:09 +0000
Message-ID: <fbc06d40-f466-d971-d60e-0a9e0b8f7580@amd.com>
Date:   Thu, 28 Jul 2022 16:01:07 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 13/15] platform/x86/amd/pmf: Handle AMT and CQL events
 for Auto mode
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        Mark Pearson <markpearson@lenovo.com>
References: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
 <20220712145847.3438544-14-Shyam-sundar.S-k@amd.com>
 <4585d2c6-6ac1-a697-d54a-f173e9821446@redhat.com>
 <d01e52cb-31c5-7d20-4f18-1e4bb70c1355@amd.com>
 <828a7b8e-2375-a9d0-7b00-d59e84cfaa2b@redhat.com>
 <5500e911-22eb-08b3-c3fe-2a63cf22d7b8@amd.com>
 <ce75f2cc-0129-84f5-bbab-dae5ed9a7ea9@redhat.com>
 <f351a921-3b7f-d8c9-10e5-816f83f22775@amd.com>
 <81fae6a4-4859-bc15-4edc-2c4df953cc12@redhat.com>
 <b1059e6d-31f9-16de-c728-d9003597b31b@amd.com>
 <0bc30454-315d-2466-4915-ad673b1029a9@redhat.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <0bc30454-315d-2466-4915-ad673b1029a9@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM5PR07CA0065.namprd07.prod.outlook.com
 (2603:10b6:4:ad::30) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 167dd3e0-a8dd-4231-1349-08da70dc4ba6
X-MS-TrafficTypeDiagnostic: DM5PR12MB1930:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mx83zfDRmjRO3xIaHDWTavxdoSi1QGlRBarwsrzRhTnMZM41CsLPpA17lW2jasqj607bLn976J5N3fD7bEl7VQtKGQi7S0YgKVZ4fjnGUNy+2gbMYAo06lcO6Dle800FTcjkV9AQSm25gTmXdFU0ADsatwz3uMrQdqpsbAqPWEfRtyK77L3k1gMd+XyI8asdMYIaQ7twg53HiiO54rvLqEmMsAdXobTYkfdGqZFJYujROHBZ/bJslzqAA3+uFaawtuPweaurBzTZbxoNffeAtlvXmqX7fp2d+Ep656XDOA3BIVPj0b6MudU3AezdvIexthTiBA25HLEqAAIrk1Rw8mgPR46y/dFTQZlVLCP+KM5+jXInCwtNveVUo1ZRhCKmddGfV1ljcNQr0MoCHonb0kGJwYi+4Gj0RsBQjV79CviOj1JoAC9Oid3+EkXATedaD9Ot1gABQ3iqEW8ujjV3FcJMYjqZRXnzos6IbyvfKKMWdtX5cuG6NxmPgBECHcIASQwj8ldt4h6XMSg3ZciIfWbL+kNBHbFZP+tMBA86k8HxDuEkxNMkIP7yVowE17kkCZHJU7Azpa3gOuvyL/XQiEMXWcNSDmU5sCdXr1Pj042yIZpj0QbE3/XNeW3YH7IEtzEno3Z2HRXUL0Fox2Azam6axkWukB+9nmdWPSC6nUAya7MxS5RP99VS8PAe5m2eB3zp9LktQitisvmWe8JRDqO2hV2bGokOBb7GdGzeX1Ua5LFYQORU4pGjg3A28ZisJrnXVZLGa1Wrm7PKPR2nNDaTo/7zv7SiqqyAb3CbSLVaRMRTJ9ua2KLeZXfX79sEWfwyuic//Z4rLfNCunoLCM6llO0vL4U+oDrd//01oXE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(478600001)(31696002)(86362001)(38100700002)(83380400001)(66946007)(66556008)(8676002)(316002)(4326008)(110136005)(66476007)(2906002)(26005)(6512007)(53546011)(6506007)(8936002)(186003)(41300700001)(5660300002)(6486002)(2616005)(36756003)(31686004)(45980500001)(43740500002)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3JRdmlKSnBmeWFldUZtWFNDVnZPVnRtblNXUEF6cjRQSWtOK3RQVUJoTHFp?=
 =?utf-8?B?ZEhUMldJV0s5Vm9WSnpMcEloWEdva1gxSGNyTnhEV09NMmFEVEVXWUt2MnJ6?=
 =?utf-8?B?S1k2OXM4UU5OdFhFYjZYc1loSUFBYkt4d25tZ1dSZGdpbFFLV0J5WUZPUTRv?=
 =?utf-8?B?VFJ5cGVoM3JvUWZucy9kVGVmK1h5cFJ2cnpScGI4alN1TWtCdkNTTGlFRG0z?=
 =?utf-8?B?RlBYSVF2Wm5Ua1hlM2ZWNERrUzZwcllMaExLSkNBdXVXb094SGNWOU10VTk0?=
 =?utf-8?B?aWlMK0FValAvbmJDbXZEVGZtZ2gwN01LTW05YXA1Tnpjeld2aEt2ZmpRRUFt?=
 =?utf-8?B?aVNpZEpjMU55UnZSYzNzZXRNbC9sTEFWbU1PR1ZZK1VOWVpDU2RLaENiMzVp?=
 =?utf-8?B?TjF6ZUoyYm1hV1hlMWcrSEhrSDc5TDg0bk1NWFV5UFFick0wTzR2KzNKcmZX?=
 =?utf-8?B?VFBWbytvU3I0akZoNkkwUk9JYXRoYytKK2pJbU03YnFJd2hRWk9nZ080RmVu?=
 =?utf-8?B?QzlDZjJyZ2RqcXYxMytZbGxuTjIyTExkYTkzL01heElsVjBCalI4RG9xQzJh?=
 =?utf-8?B?N21sS0RvZytGZHJDcDZOSENEWXJxdkZ4SUtBc1N6cmF2SkxGYUw3NDVwdDFL?=
 =?utf-8?B?RXRRKzJmVGNuM1F6V09TTUxCTllLRVo5bTg3MXNxd2RmemowOGdFb01pS04w?=
 =?utf-8?B?Kyt5djdiVjRvTmhpdTc1ZTI3cUkydzZ1MTA3ZUlYRUNjcmppSm4wbnhPOG51?=
 =?utf-8?B?VGJaNkZyU2NtSW5jMk9NL0EwMjhYTjU5RGxFN0tMSEpIMXhDeDV4aVNxTXZm?=
 =?utf-8?B?K0YreXdtR2EyR2VnL0VacTMveDVwQ3VRZDg5bmZJRGxSeUxqV1FVMW9hcnZl?=
 =?utf-8?B?VUE5VGNhOU9nSmdaeEdzOC9vTGRDWk9mb2NEZmlVYkFDU1hXdGlDOVA1Qmlt?=
 =?utf-8?B?Rjd3RXR2UjBFSGRQYXpBYnU5RFV4VUFHWDMxV0xkOVhvT2xhSHJuaGF4QzJ3?=
 =?utf-8?B?NU9uQ1hYMXpKZXNxYTJoZUxZeE5iMlZNZmJPSFovbUdscmJ6dUpuMkE0c0RV?=
 =?utf-8?B?eDFUL3ZjTkQ1eUZaOHh2eEQ2eWVHSEVZamdMVTRTNWlsTkZJZE1oMGh0R0lk?=
 =?utf-8?B?L2pGUzZLZTZxVmdYK1lWREJhemcrdmx1RFVQNURiVFZsWmpueEpFbFZWNXUz?=
 =?utf-8?B?bWk3b0VZSDViRFRnNnRvTEEzV1B5R0VNbjBkTVI2T0xDWEdCOVYrTUZLbzEw?=
 =?utf-8?B?aEFrRTY1OCtWT3hVUmlxeXpNYU5nZFkvR3IyTnV2TERqWG03WTFlWFJ0Zm1m?=
 =?utf-8?B?WHowUWIzb2JYOXVnNmV2ZHdlS3pWM2d5VWIxeXdEZU9mbnk1d1dPU0s3MVlz?=
 =?utf-8?B?bjNZUnJxRk5pVTEwQStJQ0p6ellnbjhRY1RWZjhXWnBlNXJnR2RtbXJsYzBz?=
 =?utf-8?B?UXRQVWc0NThhWjVHT1hjK2d2RFdpMFVuSS9GaGpMMzJ4ZWQrdTN2OEUyeTJm?=
 =?utf-8?B?clVXSHRIMEhVNXN6OVhqdjUzRlhaTUpQa0hhazZmbVVLdENTS2x0ZG14VEVO?=
 =?utf-8?B?R1llV21vWU96UTJnYUFqT0VhNFpDR2didzRoelYzaHFLbXFvd2JSTm1VK2F4?=
 =?utf-8?B?cE53a1IxRWU0bjA1QlA3U0NQYkZBOXpQVUpIclcyTWpScjQ4VFBTbHllcnJr?=
 =?utf-8?B?WWdTaEc4RGZvVkl3aUtOTmtmY3haZHFwQ0VyeTRERFJRUHZGc0dXTHJRUFR4?=
 =?utf-8?B?dWxRZzhmTUQ0SVBVUytEL3k1T3AraWNkV1VybzYzL1RzOVpHWGhWc0FyaTUw?=
 =?utf-8?B?Nm5JeEEreURLZTBPU2hOeGtOMkdqQXRJdTNrM2VoWHNHdEZTcGxxZEJzdVJa?=
 =?utf-8?B?Q2sxVG1tdTJOR05XOTloRGtvSjMxUWFiamdmbldLWXRkUXlSZzVYby9VZXZi?=
 =?utf-8?B?cU5iVzJ4Q0IrcDF2N0N0VXVtS1J0TXkxN21hZXFhTnlQekxSckxlK3dwQzdz?=
 =?utf-8?B?M09aYWp0TWdyelRPUk5ONlpUM3pCUjVyeTZ0UWxlWTNkeDkxTEsra05zZ0JI?=
 =?utf-8?B?ZU1BaTIvR2M1K0s3VytrbHBOYmxUU05HU3h1Rm12TndJcUlsNkkxY3EreWpX?=
 =?utf-8?Q?rgdvl73bJCLZoyeQ3FEf7PLyM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 167dd3e0-a8dd-4231-1349-08da70dc4ba6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 21:01:09.2043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pWy++hDV5Etqzp3wV5ZzdDDG83WcIuJgkF19QN0LkLSVzQM10b6PxbDugW5ntZQnMOblaGJhwjEDUQ53Be2LeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1930
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 7/28/2022 13:17, Hans de Goede wrote:
> Hi,
> 
> On 7/28/22 20:06, Limonciello, Mario wrote:
>> On 7/28/2022 12:46, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 7/28/22 16:38, Limonciello, Mario wrote:
>>>>
>>>>>>> 1. If I understand things right, then on ThinkPads /sys/firmware/apci/platform_profile
>>>>>>>        will be registered by thinkpad_acpi. But in version 1 of this patchset nothing is
>>>>>>>        stopping the amd-pmf code from registering /sys/firmware/apci/platform_profile if
>>>>>>>        the amd-pmf module gets loaded first. So if the intend is for it to always be owned
>>>>>>>        by thinkpad_acpi then the amd-pmf code must check for this and not even try to
>>>>>>>        register its platform_profile support. We cannot rely on module ordering ensuring
>>>>>>>        that thinkpad_acpi registers first and then amd-pmf will get an -EBUSY error,
>>>>>>>        since there are no module load ordering guarantees.
>>>>>>
>>>>>> This was my thought initially too while this was being developed, but actually there is some nuance here that is non-obvious.  The platform profile registering code in amd-pmf will examine bits set in the BIOS to decide whether or not to export platform profile support.  In Lenovo platforms that support thinkpad_acpi these bits are not set.  So platform profile support ONLY comes from thinkpad-acpi in those platforms.
>>>>>
>>>>> Right, Shyam mentioned this in another part of the thread. As I
>>>>> mentioned there IHMO it would still be good to check this in the driver
>>>>> though. To catch cases where a BIOS for some reasons advertises an
>>>>> unexpected combination of features.
>>>>>
>>>>>>> 2. So when the thinkpad_acpi platform_profile is set to balanced, then it will
>>>>>>>        enable AMT and then the periodically run workqueue function from amd-pmf
>>>>>>>        will do its AMT thing. But what when the thinkpad_acpi platform_profile is
>>>>>>>        set to low-power or performance. Should the amd-pmf code then apply the static
>>>>>>>        slider settings for low-power/performance which it has read from the ACPI
>>>>>>>        tables?  Or will the ACPI/EC code on thinkpads take care of this themselves ?
>>>>>>>
>>>>>>
>>>>>> When thinkpad_acpi changes platform profile then a BIOS event goes through and amd-pmf receives that and will run based on the event.
>>>>>
>>>>> Hmm, I don't remember seeing anything for this in the patches. Actually this
>>>>> reminds me that the code should probably reschedule (using mod_delayed_work)
>>>>> the work to run immediately after a BIOS event, rather then waiting for
>>>>> the next normally scheduled run.
>>>>>
>>>>> But even then I don't remember seeing any code related to catching
>>>>> platform-profile changes done outside amd-pmf... ?
>>>>
>>>> It's not a platform profile change - it's an ACPI event.
>>>>
>>>> When a user changes a platform profile then thinkpad_acpi will see whether it's balanced or not.  When changing to/from balanced thinkpad_acpi sends an AMT event.  amd-pmf reacts to said AMT event.
>>>>
>>>> This is the code you're looking for (in this specific patch):
>>>>
>>>> +static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
>>>> +{
>>>> +    struct amd_pmf_dev *pmf_dev = data;
>>>> +    struct apmf_if *apmf_if = pmf_dev->apmf_if;
>>>> +    int ret;
>>>> +
>>>> +    if (apmf_if->func.sbios_requests) {
>>>> +        struct apmf_sbios_req req;
>>>> +
>>>> +        ret = apmf_get_sbios_requests(apmf_if, &req);
>>>> +        if (ret) {
>>>> +            dev_err(pmf_dev->dev, "Failed to get SBIOS requests:%d\n", ret);
>>>> +            return;
>>>> +        }
>>>> +        if (req.pending_req & BIT(APMF_AMT_NOTIFICATION)) {
>>>> +            pr_debug("PMF: AMT is supported and notifications %s\n",
>>>> +                 req.amt_event ? "Enabled" : "Disabled");
>>>> +            if (req.amt_event)
>>>> +                pmf_dev->is_amt_event = true;
>>>> +            else
>>>> +                pmf_dev->is_amt_event = !!req.amt_event;
>>>> +        }
>>>> +
>>>> +        if (req.pending_req & BIT(APMF_CQL_NOTIFICATION)) {
>>>> +            pr_debug("PMF: CQL is supported and notifications %s\n",
>>>> +                 req.cql_event ? "Enabled" : "Disabled");
>>>> +            if (req.cql_event)
>>>> +                pmf_dev->is_cql_event = true;
>>>> +            else
>>>> +                pmf_dev->is_cql_event = !!req.cql_event;
>>>> +
>>>> +            /* update the target mode information */
>>>> +            amd_pmf_update_2_cql(pmf_dev);
>>>> +        }
>>>> +    }
>>>> +}
>>>> +
>>>
>>> Right this is the AMT on/off path that bit I understand.
>>> This happens when switching to / away from balanced mode.
>>>
>>> My question is what does the equivalent of these lines:
>>>
>>> +        amd_pmf_send_cmd(dev, SET_SPL, false, config_store.prop[src][idx].spl, NULL);
>>> +        amd_pmf_send_cmd(dev, SET_FPPT, false, config_store.prop[src][idx].fppt, NULL);
>>> +        amd_pmf_send_cmd(dev, SET_SPPT, false, config_store.prop[src][idx].sppt, NULL);
>>> +        amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false,
>>> +                 config_store.prop[src][idx].sppt_apu_only, NULL);
>>> +        amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false,
>>> +                 config_store.prop[src][idx].stt_min, NULL);
>>> +        amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
>>> +                 config_store.prop[src][idx].stt_skin_temp[STT_TEMP_APU], NULL);
>>> +        amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
>>> +                 config_store.prop[src][idx].stt_skin_temp[STT_TEMP_HS2], NULL);
>>>
>>> When the profile is switched (by userspace, or through the hotkeys on
>>> the laptop) to low-power or to performance mode ?
>>
>> Lenovo's firmware will handle the equivalent of changing relevant values for their platform through a BIOS interface in this case when they change ACPI platform profiles.  You will see in their driver something call "PSC" mode, and this is exactly that type of stuff.
> 
> Ok I see, thank you for clarifying this.
> 
> So as for the AMT mode, since that is Lenovo only, I guess that means
> that there is no need to do call amd_pmf_update_slider() when AMT
> is being disabled since at this point the firmware will have
> already set the values.

Yeah, Shyam made this modification for v2 to make sure that code path 
isn't called unless static slider was set in the BIOS.

> 
> Actually this seems to mean that we must ensure that the AMD-PMF
> code stops touching these settings as soon as the event is received.
> 
> Which would imply killing the periodic work when an AMT off event
> is received from within the event handling and then restating it
> when AMT is on (and making sure the work being queued or not state
> matches the AMT on/off state at driver probe time) ?
> 

At first glance this seems plausible, but actually I think it should 
stay as is because CQL thermals can be set at any time (that's like a 
lap mode sensor event from thinkpad_acpi).  Even when AMT is turned off, 
you may want the CQL thermal profile set accordingly.
