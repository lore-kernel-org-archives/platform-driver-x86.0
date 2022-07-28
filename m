Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86878C04A68
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jul 2022 18:06:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbiG1SGb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Jul 2022 14:06:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbiG1SGa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 14:06:30 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47FF952E64
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 11:06:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWZrbv4Q/svbjj1WlMLGzb6k3S6CEnOi42x9QMDOp/3ZGY1Va8J2W6YYH70tOxCh5UQKuoWqjg2xBqnBJ2VemWDqoNSFGKay+9jJF3xHdyBbP/Lehz6ZRcLbEvq1v1g+0nOKAauyo163yaB7bGwzZ/TWsMSO+RjF6wdp1UJFBECf6H4VOBW4IlqiEPD8s33FOamgCdISUZg7NgXNRiJpPL8dkubrML8uPkc2CrHYaidxprUc00mHYnzBeDswLQDziwPwDQbG3llvge/pX4aNIsILBHf6sc+lXRU30sMR8NJulxH9TrT8xR1pDWsaka6oZTxffT+oFzSUsC81GkHfzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARn5MqWYj9zg6UlsVoD6mZXD+Y/pkFrWeb9AaXmeDKo=;
 b=Nlps+tqcsClfIrjqlf4BN/Rz0Hi7nnVGCURkZ6EG5fqz2WcS04xtFfY3DyHs3dKVb85nCZQRfY6soQhzbJR3lEas537JHioW0r4r0EEthAmTeNLZvjzrzpA87V3dkGzaXfABXvfIOKvPWv6fbDliDt3fyR/ORbqZ9rd1heXNXweEnBQUbES52v+gjuPGxJwRslCRPr3WYO+SAgYI85oamyGmKIySWRdQoitN0UC6PjerICoDqV449I7cbF5SqOc8daz96pVtbVQKIo4t0tc4nh+x5xy1Q0uhgJqLB7HTp19bR78/vDtxC4xsEU8HkK7YEmgrcXm0BdLfS17zJB7bBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARn5MqWYj9zg6UlsVoD6mZXD+Y/pkFrWeb9AaXmeDKo=;
 b=4eLXAjaFpmc2ehliZcbYtIZQ47YoWm4qmc4R5LevvWSQ9BTEaTyqnWaAGjDBdu1UhLoOpSUVZUA0tGJ0QNouXemSuIuK6suUxIV3HWzjy8tdz+FxlwBf+f2J6HcSxLxj6kPwHRTQa6dNhV5CpxTBg2B345S2DnGXYzYMwR/C0p8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM6PR12MB5519.namprd12.prod.outlook.com (2603:10b6:5:1b5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Thu, 28 Jul
 2022 18:06:17 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::1143:10a5:987a:7598]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::1143:10a5:987a:7598%6]) with mapi id 15.20.5438.023; Thu, 28 Jul 2022
 18:06:17 +0000
Message-ID: <b1059e6d-31f9-16de-c728-d9003597b31b@amd.com>
Date:   Thu, 28 Jul 2022 13:06:15 -0500
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
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <81fae6a4-4859-bc15-4edc-2c4df953cc12@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR15CA0051.namprd15.prod.outlook.com
 (2603:10b6:208:237::20) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9812b01f-16ba-4f89-4ca3-08da70c3de1f
X-MS-TrafficTypeDiagnostic: DM6PR12MB5519:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 39997GSZaM35m5nWUXyIu0z4DmcgriNYtXrAx3sx6OKfFvvETwEydow7Vx0yrcYGPF5nJtKghe8Nno0i7r0/IH3KlC727LJjSSPQ4dK/qN0+VkfvHLZFuVKJ4pGiQalI0EehQfFozzwAFKuaEeroA586E+mR+uMoCqh6n5U69kRgFUqjqS0UpA+LYucMGbbmsBHyEnSPwLOPziGatXSS8s63YCcApGv6kpwpScE6IQM/k5z2iTGPrpcl0liuROFWqI3wfHN2e8Bb/QjgdpvCAUuHLbeJCAIRwBM5JMj5DvdbtNO3Zwg38DtQxm8rHBUVuHvfb2JFg41nVSAR58lAvjmO9cc/dCPrwygpH12TzssO5X0C83oNfYdTNQezQBD4xIYjHEPECTarWAG8CTJ4dkQeYzEcx4yHAIUtXHZaXcXSUapkeVvBQZOvaEU5oeMSESJL77u26chEorFy11gC2ZGN+XLtXPAq1z67sTrZf7NOxs6w86a3DFDPiES6tYAIsNfpmy6qwXJdueq3MO6+mWVWtSsHfaixBuJKNZGoXIumWgZelpY37LJbHMXLD5Iqb2C7bM0lr70fscIqMmQILE9AxAxZ2zKIsaZWdreKE3Nu/+UZzBuLcxulEg/iQq+qWWCzXhFfg+0mmWdtV1AfSK+bPKbjWN/wHOTrbDPjCrXVXjRr3W+cSd8Gti66OaxthrX6XxsKJXkpp/TRAxFM4N18H/Ao1tMGhqoV9LdzV2BO6L4Q96jdQ6GsJKI46H+gTxjE4EWXwaSPJwY784DjfY9j3cgp6g9ZopWEpiNteJFMLZEbDlilqYFgr8ZJvxmR5RRsmWaoIP4Ee+JXUGzpts8guvYgdu7Nz9iZiuz6G8s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(8936002)(31696002)(478600001)(5660300002)(6486002)(26005)(6512007)(86362001)(53546011)(6506007)(41300700001)(2906002)(8676002)(2616005)(38100700002)(186003)(83380400001)(36756003)(66946007)(66476007)(66556008)(4326008)(110136005)(316002)(31686004)(43740500002)(45980500001)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUxKNmM1d0NNVHV1bERlY0V6UkVqV3JZS2ZzUkp1T2paNzZsY1pTc25uK1dK?=
 =?utf-8?B?Mis4bFVpQ3MrS0FnMi9DcEFUVEJab0JjcThPZUtKVFlJK0grOEtDTGo1Q2I0?=
 =?utf-8?B?YVoxVnpkVjB5SGg2Nk5DOWszYzZEMTVHT28xOUwzMkR2QVJQNWFOMDJrZHpJ?=
 =?utf-8?B?RWU2L0tDN0dCRS94am9HdWFtczhKMFhaR0RPeUJ1MXJ6SXRyUG9lL1JQNHQr?=
 =?utf-8?B?dWZ3NmJqVDVKdnErRHYwS2tCaTVma25vd3JMMDRZN1p2dUkxZDdYMU5WbUZK?=
 =?utf-8?B?endTR2lWMjR4ZjZ3eGZHdzRIUDgxUGt6dGpZalZna0hwajJMOVdaMk91WTVV?=
 =?utf-8?B?cXN6eXZwS2kxOUNZbFZqQXJNMDV4alBKdDl4L0FhaXBJMXhPb1VuY1o5cVgv?=
 =?utf-8?B?M09XTWZxY1BDR0g5RVAxbzg0S080aVlSOTBra2U4YTY3L0srZXBidStHY21s?=
 =?utf-8?B?d1J0N2k5YXlZdmc4TjRDVUZnazRtckpITG1rVWM0UVBHMWVMaXhDbW44bmU3?=
 =?utf-8?B?cUtZZ2xLbEUyd3VUVU41QWZLOTQrU3NQc1BlU2x5VW4rekg2OHc0VFRhYmRH?=
 =?utf-8?B?Q0F5UElCcUREVm9mQ1ZLOGtaZCtOTjBBc1pvUU00alp2cXo5cWdtYUZ1TFAv?=
 =?utf-8?B?OXU4bmpYd1JsTnN6ZDcvRlhPbGdCbGg3aGR3alZkTXhzL2JUcElyelEvczlp?=
 =?utf-8?B?aFRtbWlYNllXOTVYbzdyZGQrWWJKL1lMU3RPczFTcXRTazRlQUlKb0h4cHEy?=
 =?utf-8?B?NW44ek5LY3QxUE1obWEzQkZZOHZwYVJvVDBkM2VnZWZOWjBmMFdXcHFFaUNO?=
 =?utf-8?B?aGtlaVNsZU1pR0ZHSk5aNWZOckczcHp5NUs5QXpIREhIM2FxejBWSmFSQ1F0?=
 =?utf-8?B?QUkwY0VBNUhrdzY0cVZSWXRoUFA4ZkZIekplaEloclBGRVRWL0dsd09LKzU3?=
 =?utf-8?B?eVd4WHAzVEYvNWp4Zjg5VitUNFBoZ3NOQzhkZmpWa2FqTStybnVvSktOWHNV?=
 =?utf-8?B?QjVYVVQ3cStMb2ZwR1JPZ09QWTczV1Y1TmtESVltaWtyYjRxelpiWmMvUm9n?=
 =?utf-8?B?STlZZCtmblUvUlMyZTc0WlNnTC94VjQ4Y2lsMEdZS21FcGxUejJDbDk5U2Jm?=
 =?utf-8?B?c2JhRW1HQWx5akhEUlRvdXhyMlh3QkRvbVAzZWxKYzh4dEQ3UDF2TGFvTTlW?=
 =?utf-8?B?RVpDYm5mS3daVWNYT2pDU2liNG1KdWJrbmh4dW00MjRWcW90aHBTZmNyTjlY?=
 =?utf-8?B?T2lkUnBvSkNYTlN2VlZLakVWdHZ3SUJIdThTZm1TRkNpb2FWd1JEUGt4NFQ4?=
 =?utf-8?B?bnVOY2FiRXdMeGF6YlkxWE5qbTgvTjJzOEkvVENQc0JkbUduOVFVb1NCK0Nr?=
 =?utf-8?B?cXo0RjliaWVwODZsRGFCOVNkejhzZTBqWU85c2VQbHU0QXpsYW5sbkFTMnh1?=
 =?utf-8?B?YlE4MmJpY0pXQ01Ec1Eyd2g5NmVJVC9FTnozYU5yVzJ5ck5ITE9JdUlVUmY1?=
 =?utf-8?B?QzNnQzlBelRleS9GSVVtWG81U2N6NHVaTnM3VFhWTlMwN0xQNjJSeU5HY2tG?=
 =?utf-8?B?cGpJb2JtUXNYUksxdnZaSHBacjZpWlhubGt1VW9aNzA0SEJwLzd3ME5CZWll?=
 =?utf-8?B?R0dDdXZFUk9QL2NtT2lVMk9KWHpBVTNXZ2k1bWN1cTFsY0llUVVIbzNLallO?=
 =?utf-8?B?aXc0amZYZzcxN2t5QitUQUhWVms0YjEyN1M0Si9mL21Ud2xQM1JjbjYvUHhi?=
 =?utf-8?B?RWtoYUo5b3ZVcVVHWXF0RDFVRXFNQjZHaThDTnNoc3l2akZtdERoMGR4Z0dt?=
 =?utf-8?B?NjJPK0lRZ0FZcHZWcEpLS3FVR3FXWVZvN2RLYnZHZE5pQitobkQxZFZXV0xx?=
 =?utf-8?B?VUxTNDVVNGJ1MnBPaUpUTlR0YmQ4bUZuak0zU0VSMUErVHpPNVhHb0lpdGhL?=
 =?utf-8?B?RDU1OG9KL1pWdGorY3RLbStRZkx6TVo0S3lxWmV2NXBuZWdhNk1ERXVuMndS?=
 =?utf-8?B?RnBxZnNyTEtmN3N6bnNVWU5odzhOdmRtOEpqb2U1MkI0WjVxcEpDZlRQY05T?=
 =?utf-8?B?bVZYWUxLdlBrc0VWSjduT3pocEFoMG1tYVdpNnZoTnB0bFZwNTl6UmczRkdX?=
 =?utf-8?Q?XliPxrUe49daVMtQ69Aonl5pH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9812b01f-16ba-4f89-4ca3-08da70c3de1f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 18:06:17.4966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B1f8R1OmT/+djnmhimnGfmeFYJ8DIiW34MNzbmcl94unQIQsljw9SRCysVMEkWgYyRoJBXmnyKEu/vuEX+mb1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5519
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 7/28/2022 12:46, Hans de Goede wrote:
> Hi,
> 
> On 7/28/22 16:38, Limonciello, Mario wrote:
>>
>>>>> 1. If I understand things right, then on ThinkPads /sys/firmware/apci/platform_profile
>>>>>       will be registered by thinkpad_acpi. But in version 1 of this patchset nothing is
>>>>>       stopping the amd-pmf code from registering /sys/firmware/apci/platform_profile if
>>>>>       the amd-pmf module gets loaded first. So if the intend is for it to always be owned
>>>>>       by thinkpad_acpi then the amd-pmf code must check for this and not even try to
>>>>>       register its platform_profile support. We cannot rely on module ordering ensuring
>>>>>       that thinkpad_acpi registers first and then amd-pmf will get an -EBUSY error,
>>>>>       since there are no module load ordering guarantees.
>>>>
>>>> This was my thought initially too while this was being developed, but actually there is some nuance here that is non-obvious.  The platform profile registering code in amd-pmf will examine bits set in the BIOS to decide whether or not to export platform profile support.  In Lenovo platforms that support thinkpad_acpi these bits are not set.  So platform profile support ONLY comes from thinkpad-acpi in those platforms.
>>>
>>> Right, Shyam mentioned this in another part of the thread. As I
>>> mentioned there IHMO it would still be good to check this in the driver
>>> though. To catch cases where a BIOS for some reasons advertises an
>>> unexpected combination of features.
>>>
>>>>> 2. So when the thinkpad_acpi platform_profile is set to balanced, then it will
>>>>>       enable AMT and then the periodically run workqueue function from amd-pmf
>>>>>       will do its AMT thing. But what when the thinkpad_acpi platform_profile is
>>>>>       set to low-power or performance. Should the amd-pmf code then apply the static
>>>>>       slider settings for low-power/performance which it has read from the ACPI
>>>>>       tables?  Or will the ACPI/EC code on thinkpads take care of this themselves ?
>>>>>
>>>>
>>>> When thinkpad_acpi changes platform profile then a BIOS event goes through and amd-pmf receives that and will run based on the event.
>>>
>>> Hmm, I don't remember seeing anything for this in the patches. Actually this
>>> reminds me that the code should probably reschedule (using mod_delayed_work)
>>> the work to run immediately after a BIOS event, rather then waiting for
>>> the next normally scheduled run.
>>>
>>> But even then I don't remember seeing any code related to catching
>>> platform-profile changes done outside amd-pmf... ?
>>
>> It's not a platform profile change - it's an ACPI event.
>>
>> When a user changes a platform profile then thinkpad_acpi will see whether it's balanced or not.  When changing to/from balanced thinkpad_acpi sends an AMT event.  amd-pmf reacts to said AMT event.
>>
>> This is the code you're looking for (in this specific patch):
>>
>> +static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
>> +{
>> +    struct amd_pmf_dev *pmf_dev = data;
>> +    struct apmf_if *apmf_if = pmf_dev->apmf_if;
>> +    int ret;
>> +
>> +    if (apmf_if->func.sbios_requests) {
>> +        struct apmf_sbios_req req;
>> +
>> +        ret = apmf_get_sbios_requests(apmf_if, &req);
>> +        if (ret) {
>> +            dev_err(pmf_dev->dev, "Failed to get SBIOS requests:%d\n", ret);
>> +            return;
>> +        }
>> +        if (req.pending_req & BIT(APMF_AMT_NOTIFICATION)) {
>> +            pr_debug("PMF: AMT is supported and notifications %s\n",
>> +                 req.amt_event ? "Enabled" : "Disabled");
>> +            if (req.amt_event)
>> +                pmf_dev->is_amt_event = true;
>> +            else
>> +                pmf_dev->is_amt_event = !!req.amt_event;
>> +        }
>> +
>> +        if (req.pending_req & BIT(APMF_CQL_NOTIFICATION)) {
>> +            pr_debug("PMF: CQL is supported and notifications %s\n",
>> +                 req.cql_event ? "Enabled" : "Disabled");
>> +            if (req.cql_event)
>> +                pmf_dev->is_cql_event = true;
>> +            else
>> +                pmf_dev->is_cql_event = !!req.cql_event;
>> +
>> +            /* update the target mode information */
>> +            amd_pmf_update_2_cql(pmf_dev);
>> +        }
>> +    }
>> +}
>> +
> 
> Right this is the AMT on/off path that bit I understand.
> This happens when switching to / away from balanced mode.
> 
> My question is what does the equivalent of these lines:
> 
> +		amd_pmf_send_cmd(dev, SET_SPL, false, config_store.prop[src][idx].spl, NULL);
> +		amd_pmf_send_cmd(dev, SET_FPPT, false, config_store.prop[src][idx].fppt, NULL);
> +		amd_pmf_send_cmd(dev, SET_SPPT, false, config_store.prop[src][idx].sppt, NULL);
> +		amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false,
> +				 config_store.prop[src][idx].sppt_apu_only, NULL);
> +		amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false,
> +				 config_store.prop[src][idx].stt_min, NULL);
> +		amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
> +				 config_store.prop[src][idx].stt_skin_temp[STT_TEMP_APU], NULL);
> +		amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
> +				 config_store.prop[src][idx].stt_skin_temp[STT_TEMP_HS2], NULL);
> 
> When the profile is switched (by userspace, or through the hotkeys on
> the laptop) to low-power or to performance mode ?

Lenovo's firmware will handle the equivalent of changing relevant values 
for their platform through a BIOS interface in this case when they 
change ACPI platform profiles.  You will see in their driver something 
call "PSC" mode, and this is exactly that type of stuff.

> 
> Regards,
> 
> Hans
> 

