Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 214F8E95A9B
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 15:42:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376524AbjJIPme (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 11:42:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376463AbjJIPme (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 11:42:34 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2053.outbound.protection.outlook.com [40.107.95.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 749FF9C
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 08:42:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUkHaD0WGX+4DgAH52aVqJZkMBu8ljfFDhQ2yoboWz1E2zfuJZPCI7jItRnw+DAg5Z23KfoUiJFNJ18vrAAtP74TfbVUuudkrjZ6eYqRBukRdIlxqzgBiUJWFaX5RiTlF7KRTFAogT0Gz42fssMoLGshA6T7wAuvojTv9/QrX42nmov8joWz4gqwohoyBpwz76zVDNiiCp9eF67kWa35+GcOm7hZhbnFsdFIMAi9i8ht5Yl54FmZq5+3YR64+sWs6zRkGX8nqRXXKhIh2QP8wEKoodUWmLbeuaIRn8xc0Nl33t7HN6o5ijEiaMPqk3lmxdN8tIABz42WkIb8o9ouQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKbYX98wtsneODI/CIQcgF6/TNu8K2IDkMlwtpT0sKU=;
 b=lFDfXS8kGSAQw+WLvRl8Lihbhz2MTe17VPXvcdVVd4u/ahbSIIGHxZhgyF8pvkRpRxXW46fsJ9Ix6E51Cbnc+LyXGbySc4/McTKsVCX9zKbHTR3WDSMLTaoHQRWRLRoI51p8eXmY0bGoT+N6IVguUoY8ZwyRlKPJbJPPEJ0YQQz8FEk9fwjU36CzWakjzahtzgKNH6C5bNi/VbMcwws1COzW8LjLYqVO+dSi1m+CTmPyRVKztFImJvM+XRYMXysNa4rYrZEwwi3szXOCGQgedF+DOBVnCIr43MTwAyksuhGZkHn5wXwfV66wGXDYuArhIxV0Fw1/LNFRxH6BVVUKVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKbYX98wtsneODI/CIQcgF6/TNu8K2IDkMlwtpT0sKU=;
 b=gEtqWDeYPPu5tit0p5ThreI6ve2bSVDZSzOBBfFpqs3Hgap+SpL9W83E1xXe4hwqkYyi5MQN3oJ31CbPWoobLRTQ1fxlDHusL3UpZFkYUuqUumkhuQgi0QRQ5LUcp2tZDJnEassoPhqQ0my1z5ORka/zjMu2XoNn1GnzGJufYH4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by LV8PR12MB9449.namprd12.prod.outlook.com (2603:10b6:408:204::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.43; Mon, 9 Oct
 2023 15:42:30 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3e65:d396:58fb:27d4]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3e65:d396:58fb:27d4%3]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 15:42:30 +0000
Message-ID: <d9491a84-0a99-4869-a0d0-c4e72ece1033@amd.com>
Date:   Mon, 9 Oct 2023 10:42:27 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86/amd/pmc: Fix fetching DRAM size
 mechanism
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20231009144748.24054-1-Shyam-sundar.S-k@amd.com>
 <3e42aa76-64c5-4276-a496-433d788e0779@amd.com>
 <3b224c62-a1d8-41bd-aced-5825f5f20e66@amd.com>
From:   Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <3b224c62-a1d8-41bd-aced-5825f5f20e66@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7P222CA0016.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::16) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|LV8PR12MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: 6beb3e86-1b6b-4793-1c79-08dbc8de58df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +myiI3rW6xn7Hz1/VgyItHYc1pnK7pFeqg8M0vYXWyzLZibABycLv1CzNPPmqGvz5LQuMKeOfC0r3+csJk9lSTEmIkUv1O28h2FhAJGtdfzxG+z2gqYTTMtmXRaNnt00sQVDAfbMzyCaggorR6vhQLSH9YR9VkXRscxC4cObI3vVdCkuH1wRVye4Yn31ekgUN3H6Lzsq+nZZgAEXshLkbNGxF3ZhSqewcwHNS0gzotrxt5Hbw2RBHDIQuvy+xly5YvhU73+TL0BwHGz2ZOPoEcCC7ZCFUHigH3X2D1ehitACpn9lI384l9y5PgYHNn65mxiir8nP2bZpVvdsTTK9lNo5Z61M027CK0Qk1C4wQWT8ltRcZbia58vyWFoht7AcghUCVw9w1W6d5QbnwNfPIkj5F40qzAYtTuSHIg8yHFnWhZdqsHs1Do+md4vwLkRu0BW3ycSFyCeW4s5ipm3L8wl2MV0g5YvgtKfQ1vrSE8UgBQdErBBtI+ifAE28wUKK4CNMOa8urxVEG6a+lozYGQaXDM2k/g32gl3dHSYQaaqmJhdPXIHzNQ+aSc4YEw7ARhnbONVgKE7ffTUkx4O/ebPLKrzmuXepI/hh43xnACE0eBAwImXE+Wgze5+E+Hr8F2XZiJqCrbii4AFN4XqGbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(366004)(396003)(346002)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(2906002)(66899024)(83380400001)(2616005)(26005)(66556008)(66476007)(316002)(66946007)(6666004)(8676002)(6506007)(4326008)(5660300002)(44832011)(53546011)(8936002)(6512007)(478600001)(41300700001)(6486002)(36756003)(38100700002)(86362001)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTVwdGxqdWsyRjZuNHJuZ210aXpXMUlvLzN2M2M1U1FUMG1mcXd6MGZ4aytl?=
 =?utf-8?B?aVVZTTY0S1h5ampOeHFqTjI4NDN1b1crdmRzUWpUQ09WeDVhM2swbkZXMC91?=
 =?utf-8?B?K2hQYmVFZmJyMTVia2p2V1FXZXlnNndwYnJqRjQzOFM4SVdzbEhjd3Q5RjRy?=
 =?utf-8?B?RTN6ck5uRUMxMW42SE9hRFpIcWthRXA3TC9wRmFpeGlqL0dDSndQT0pieDAy?=
 =?utf-8?B?RjdmWVoxZ256YUU3ZHdNN3hmUGR2bFJvNzZwRWJEcm5OdnQ1ZUYzTmFUaEh5?=
 =?utf-8?B?VE9IeldjZlQrWnIyaHdvWWlReDhmdnUrblFvNG9Wd29JZnRqTlRSMnRXYUZ3?=
 =?utf-8?B?Qi9NV1oydFR2N05PT3BsV0xtSjB5S3VTKzdHZzhwT0NJVi9qKzY4WGhhMkVl?=
 =?utf-8?B?d3NTL2ZOOXJLdG5nenY5eGQ3WWtNbGZ2WXN0SFlGQk03RlprRVFWNlpMdFZW?=
 =?utf-8?B?Ymh1aVc4aEdMc3QwMVhKWElOK29QQnFERjQ2akpTQjdJRUVObzBqeHBqL0lF?=
 =?utf-8?B?UTJOemdXTjFxcmZRajg3WFVxRVc0UmJHR3hHYkdmdm1jL1FPZytGRnRua1pQ?=
 =?utf-8?B?Z2RnVFEwOTBvY0FBaHJxUWY1czk3d25za2ErOUZadStrRTJLSXRnOHNRc0Rq?=
 =?utf-8?B?T0JJbWdNQW5XQUd6VUs4M0U0OWd5NHFtV0V0cVNRckRYZGJHcXZLUFhFVHph?=
 =?utf-8?B?T1JObW9VUkZNeC9yMWkyYllYNkpmUGN5clBWcDRiQ1d4MGxVUDJpWmRacWJ3?=
 =?utf-8?B?Vi9oc0g0M2pCaFhYdFBrbnFSNlYyWXVQZTJIbGRjc0VLc2czc0wxS2JHdXRH?=
 =?utf-8?B?TEZhMVVhZUV5bkVlYVJVQ2xkMldkZndQaGVyL1RHaEZCaFZUS1FqNVhHdWxK?=
 =?utf-8?B?dVF3NG85THFhNVpXSE8xblFrSGNRMTQxOFpFTFZlem93T0ZqNXZVU1ZKTnNE?=
 =?utf-8?B?NlZoYXFMclhwekFGeDR6L2dqZDYwRVUrOVZRaHBiSjY0Z2FxV2duUUFwcHBD?=
 =?utf-8?B?MUJ3TDRhM1hvaFd4M3lWRVFmSXozdzgyZ0hQdU5vczhWM2ZXZVZLU0dHOEZl?=
 =?utf-8?B?QUhjeHJjMzQzVW9pL1g1Q3kyaDJmTVhkVklEdDNaTzRneTBrSnVyS1FJdGFF?=
 =?utf-8?B?M1lKMWxGM0pDZnNkZ1BERHBITGViZWNXeE42OVFsQmxObmtXcTI4MERqU29I?=
 =?utf-8?B?NWZzK044Z0M0S0hjbXFOazZrRUxsRktHSVFsNmhHOExrRmpKd1NWUGxqdDdY?=
 =?utf-8?B?bEduMThrekVvbkdtRDJJRXp0bUpBdDhLbFBINHNTdnVucklxRkJiS2ZSc2NQ?=
 =?utf-8?B?U25UcFFaMjBhTnpYYlpSWnZjd21MM2hJMUZ0Y1JDL1lYSFl2cHV5ZGlUZUUr?=
 =?utf-8?B?N1pWeHl4b2k3dGxBL3dNN1kxdE51S3RBRzBVbThRZDhBdG5WVE15YXNsMFJH?=
 =?utf-8?B?d3JSYldBVVJSM3VrM0llMWdPWmRLQVJTUmp1dUw4bVlCZDB4Rm9EcXQyZ3N0?=
 =?utf-8?B?UDh5NmwrWTE2NHdraitrMXVoaDZyT1d4QWQxeDF5QUJKaDZSUVF5QTFjVTRh?=
 =?utf-8?B?dXp5em9VL1BnMVNtTUFTRkNrekVEWkR2dE5xdHNaMXVrMUtYbG5uZmZ2RGE0?=
 =?utf-8?B?Rmk0bTFUNC9FTndJTkEvbC9kbVZTRk5wcGpxTU9uSzU3MFdZU1gvZEw1SDc1?=
 =?utf-8?B?blp5Sy8zUVREd09DMUxkMklxOHZOMVNsY0I5VXo0VXdYalRrTE1vb0lFZ2Mw?=
 =?utf-8?B?SVlLVWZFT1lTaGd1d280eFJYOUtIVjl5NXlNeHFXMzlieVEvc1JvV0w2M0U0?=
 =?utf-8?B?RVkvZWpHRzZPRHBoT2FPdzZLK2hpTkNJQjBROXpFRWJGZVhvRHpGM3prNGQ5?=
 =?utf-8?B?TDBURUtpdThVd0pnUHVKc3dMWktFVUZCUTQ4em82ZkdjTHNrSGtPS1hpWTNZ?=
 =?utf-8?B?T0pIZGFReU1GK1BucTdPTysvelR1R3lLdmp2Qm5Ya29xb3pzNmxFdCt0d2JD?=
 =?utf-8?B?OXRhRDZ6RFIwdU5LZExYbkFOUVcrMzByVmV2bllLZTZXNHY0clMzazdyeFNG?=
 =?utf-8?B?b0duYWw3N3RSVHJrY1N2TmpwRGZWRWRybzFVNlRpVVczL2JEcjU2bCttMDNJ?=
 =?utf-8?Q?c8OqHBuUR/xfgy6H+gWVUM5dV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6beb3e86-1b6b-4793-1c79-08dbc8de58df
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 15:42:30.3687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rTj9MhhFgW0/7i5sIK6ngdnO/jI7U+JgqxOC4XeHYOoLEuJPDx0b3kWB56jT8ZVfxeXOXTNJ/7JS0NrWVOS6fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9449
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 10/9/2023 10:39, Shyam Sundar S K wrote:
> 
> 
> On 10/9/2023 8:25 PM, Mario Limonciello wrote:
>> On 10/9/2023 09:47, Shyam Sundar S K wrote:
>>> amd_pmc_get_dram_size() is used to get the DRAM size information.
>>> But in
>>> the current code, mailbox command to get the DRAM size info is sent
>>> based
>>> on the values of dev->major and dev->minor.
>>>
>>> But dev->major and dev->minor will have either junk or zero assigned to
>>> them until at least once a call to amd_pmc_get_smu_version() is made
>>> which
>>> ideally populates dev->major and dev->minor.
>>>
>>> Add a missing amd_pmc_get_smu_version() call to
>>> amd_pmc_get_dram_size().
>>>
>>> Fixes: be8325fb3d8c ("platform/x86/amd: pmc: Get STB DRAM size from
>>> PMFW")
>>> Suggested-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> ---
>>> based on review-ilpo, can be added on top of recent stb changes
>>
>> Hmm, so this is actually going to mean that we end up with a round
>> trip call to the SMU as part of probe to get the version when STB is
>> initialized.
>>
>> I think that's going to translate to a longer amd_pmc startup time,
>> which could be problematic if a platform leaves STB enabled by default.
>>
>> At a minimum I would suggest to only do the version check when it's
>> one that needs it (IE AMD_CPU_ID_YC right now).  But otherwise this
>> s2d initialization can't happen the first time it's used?
> 
> I remember the long boot time problems, but was not that confined to
> only CZN based platforms?
> 

They're reported originally on CZN platforms.  If I was to hypothesize 
the root cause it is probably that the SMU is busy servicing other 
things during kernel's boot up.

If that's the case then there is no reason to believe it's fixed in 
follow on platforms.

> Thanks,
> Shyam
> 
>>
>>>
>>>    drivers/platform/x86/amd/pmc/pmc.c | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c
>>> b/drivers/platform/x86/amd/pmc/pmc.c
>>> index 1424c03c1f03..92adf4523736 100644
>>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>>> @@ -981,6 +981,10 @@ static int amd_pmc_get_dram_size(struct
>>> amd_pmc_dev *dev)
>>>    {
>>>        int ret;
>>>    +    ret = amd_pmc_get_smu_version(dev);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>>        switch (dev->cpu_id) {
>>>        case AMD_CPU_ID_YC:
>>>            if (!(dev->major > 90 || (dev->major == 90 && dev->minor >
>>> 39))) {
>>

