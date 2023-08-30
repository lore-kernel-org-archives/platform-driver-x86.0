Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A7FBC83F17
	for <platform-driver-x86@archiver.kernel.org>; Wed, 30 Aug 2023 18:48:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243297AbjH3Srf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 30 Aug 2023 14:47:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243427AbjH3K6n (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 30 Aug 2023 06:58:43 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 973E91BF
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Aug 2023 03:58:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g27tr68CThAsyGAbsefabGWJtoP0V45ZeoBsWefKhnXGdmPnO0Dx39EcVcrmV1DSR/dGIPMwdzhl4UbJWRzJSpAx2v8oBmgFL8iiL4Vqo5AQeloBPPQvAgEN/t5BTQ2xRHnATleVU1W8Hdg+KrQVDSwXK/WxvM6jJCXV9FNW+j7lTQraFphf2yMCCccL9HDrpdkFr6opUE2LP61UWC41SpDo9FCvuWTT7glG9NzbTcJ97w18xbmCYSZKxPr6bSr4UtgGqzqfD9BvqP3yvX+jP1BwVIdcGJy6xauidDxscbglf3qVs0ffaiPQC738oTZpS5bGmU5Y1qx6PuMV/Hvo2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btqyhJqiPBDfpZtA71BJDOV+LdqBcqLYWfj9fP9Rw0A=;
 b=NFEAAdKHOXZ3V3Csp2DtwAMFezwCEZ7DOwOzCBJk0E0WPbZFp7K8vmOeWwInaqYxIoVIawKlicHLI359LSNjinmqjjqh/arzaIKUWFYsV0NaeMd4tfXJ3NnssOoOfofJz2OABuA5Pn1TTUZYI7M5R/SLDVAi+egFYDPHMp/YzZe10UV3YeCJqoV6+mI6vxj8czRS89ggsDrpxsw0ChSunA/FAGP71aXdy1TB1ZFpSnVe1LQuU2VxUhRdDcZo+T3+3wDZ3ZBkWUb/J25/XcY2kcPYmrwBvKJeb5JEJ48uAQkG3ZFdbibo0xZQoxEQjzHQTx/E7Yh4NykyxxJs+CbmTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btqyhJqiPBDfpZtA71BJDOV+LdqBcqLYWfj9fP9Rw0A=;
 b=100kz3qWOlTniBo8SLwHPeE6ZAyQcoTOKdW3C6EnIjsqIcpi2/52T62X+CWduMDkB+yNi49bRl7AzVB71sMTls3Eil5wQJPOHYwdlGXnVfitNuFmNF3ufRNQ5a5v9xPeqp6n3cy3Smx5u8zyspbr0NYPiGagtruXcCP8LCtFidA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CH0PR12MB8486.namprd12.prod.outlook.com (2603:10b6:610:18a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Wed, 30 Aug
 2023 10:58:36 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::7cb:5286:6276:882f]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::7cb:5286:6276:882f%2]) with mapi id 15.20.6745.020; Wed, 30 Aug 2023
 10:58:36 +0000
Message-ID: <8210819b-cf0a-6e75-57a7-bf1d0c7df9fd@amd.com>
Date:   Wed, 30 Aug 2023 16:28:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v3 2/2] platform/x86/amd/pmc: Add dump_custom_stb module
 parameter
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     hdegoede@redhat.com, markgross@kernel.org, Sanket.Goswami@amd.com,
        mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org,
        Harsh Jain <Harsh.Jain@amd.com>
References: <20230829035239.4132737-1-Shyam-sundar.S-k@amd.com>
 <20230829035239.4132737-2-Shyam-sundar.S-k@amd.com>
 <31b525c2-1271-f9b0-af58-6b68b5d9f967@linux.intel.com>
 <ce8d2e56-29cc-4b6e-6b61-69c28b7b7d10@amd.com>
 <fae9a214-1d65-f7b-7329-f13ddb669daa@linux.intel.com>
 <06125c23-c086-ff61-de5a-aedd47ab79ee@amd.com>
 <e7ffa6a8-8fb2-8f6-1fbd-e898c48c4ec8@linux.intel.com>
 <e49f5ce4-4113-1370-624a-d747ecb1c167@amd.com>
 <dec5e1ae-8640-e1a-d166-301b2f5d3788@linux.intel.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <dec5e1ae-8640-e1a-d166-301b2f5d3788@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0043.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::19) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CH0PR12MB8486:EE_
X-MS-Office365-Filtering-Correlation-Id: 80635da0-99a3-42b8-5f46-08dba9480f60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s2dg3g9uyaaWEiT/DdlGkdbGQ4Xxhjz0dkeIwjDwIUMueM/yiiTTL9OEvoD1DLHPqIUBBUSCQd4MjMPShdQ3zdu+yyw9m9KQJ6WUGbXgeU4Lj46Q7cJT2MhagKaPWvEfv+GHSjScgVL+1iHOC1msgqh6edm1AJgnN5244jKpmmv33xyQ+4yM8cn4cfEByhjSfqhRAWj4I+YmvG5F6FsXna+nddGIrC7B4u/P74c4tcR+gI06FkKMc7lbVeKUQvJoWLJ7lJCzSMZr3/hT8V32W8Vj9B5XUg+1fLhNLFcbw1abf8E92EBBn8yahi5KzLT5ouguYAo10f2p2dD9MCt2F6zm/TtF7JYkXMAYWLMj/pzN/DeoEAAyG69fNgmubl9m+0AwgEr2FUdUNDSU0kOZ3V7FCGm0etoOXDr+drBnGe+kxw9kt90srcKu8PjQJ3RO34Y6LSn+IiKTrqC/tFISX4pyIjQQVAndY2wRCmBawfLLQywhggEseUIIfaDJfNL1h/1K0hR04rctfbbKMgAHqWPvRqfVPWiF9Qj/TBUNMkYpNYt6TMg2mAvOw8RrzLpVNq/AxuxqEm44Om3W05kRxWn9vmp8RVlNWltxf1PzbGtuQclSHca2K1L5as040myY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(366004)(39860400002)(376002)(136003)(1800799009)(186009)(451199024)(6666004)(6486002)(6512007)(6506007)(478600001)(26005)(53546011)(2906002)(83380400001)(30864003)(41300700001)(66946007)(6916009)(316002)(2616005)(8676002)(8936002)(66476007)(66556008)(4326008)(5660300002)(36756003)(86362001)(66574015)(31696002)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTNiekVLd0J4Z3NCQUNWSEFaeFh1NlJyNzZHSVVSQlFvZEJISGZQUFYrUisw?=
 =?utf-8?B?REg0ZGVhTmJoaFA2NlM0VDRSTGJGaDJvVHpON3FqTGVpbHVFRWVXNlgrMGk0?=
 =?utf-8?B?MEFpUXlWNVV3a0M2N0dpNldWTmVvcnNqSHJJQjdXVXgxeFdwSkhaYXdsUXZq?=
 =?utf-8?B?MGlLK1pzSnA1b3E5ZjJRYm15ZUxVQnRMcGs1UDhoRi90UmJ2SVNRVVE0dThh?=
 =?utf-8?B?bkRxVFJhYUE2VVROTnVXUnJFN3EwdFJKVXMyVVRielZrb2RjT2U2UlFWWkRI?=
 =?utf-8?B?SEJxdCtaL25BcGFsdzZ2RkVSc3hMSWlaYXN2Tk5oSEtPYXBnQUIxMUxUWlgr?=
 =?utf-8?B?OG1ncnhVbW9NTWtPUXJqY3B0RGJ1Vm9UYUs4V0pnUnJySG1ocEcrL1VlVStZ?=
 =?utf-8?B?bmgvalJRY2pJVkVsNSs4MVlmSC9iQUgrL1ExMFpwUXlxdFh4WUMyaG1EYnkx?=
 =?utf-8?B?bTY4dDBFWFg4VWdBL2JTdUVPU1o0enY5Y3h2aVBQcFhLTXBEVHRMd1dra3g1?=
 =?utf-8?B?TUJ2clhFSmNLaktVTDRUek9udmQ3dk5NbVJxdENDU0h4a0xBVi9xYlVBN0k1?=
 =?utf-8?B?NTU2OGN3ZVNGbUFacnFybExNWTlkdmE5eGlmQ1puUjI5UlM0QmdRb0NDVlhK?=
 =?utf-8?B?cGQwamNCM1hQb3FvUDN2QXZ2dVlMN0RGVDZJWWlXblhGUTRmSStObUJ5UnJO?=
 =?utf-8?B?Rk5ISktkTjkyWDFMYjRKeXBLdDQ1UE9JL1hLb3Y5NXNONHZ2WGhKMG1BUkw2?=
 =?utf-8?B?MmFQK3ZTMU1UVWdvcUZ2aTkvaW42RENsZU0zVlFyUWdmSit4QllBQkJuRmd0?=
 =?utf-8?B?VGVUdHZaeExGYlRjSVU3NzZRd1VYellON3VTakUzUVRVV2lwTnVPTWNLODBy?=
 =?utf-8?B?dUtiMlVtWnZaVHYzUklEc0hqS3RYM24xT082NkkrMmc1ZDQrVkp3K1BydmpI?=
 =?utf-8?B?cWRna3FybWF3ZW5BV3BBUm9qdUpCZnI3MEp5bW9WTHFCUCtCQy9SVTVHbGs1?=
 =?utf-8?B?UDJYbTJBdmxDd0RnM3pJNDRpTnhSNHBCQlVqMHdDaHpuZE9rdi9LZnczdkJ3?=
 =?utf-8?B?YXBvbjBKQU1VdGVERmJ0RnR2ZHp6MkNvYVhNb2E5SWVBaDlvQnFrd1JxcWZM?=
 =?utf-8?B?MzhNeWZjUTdxY3dWUGxNaTVQQ0o5U1lpeEJNS1lPYkNDVE1Sd3JPYlQ3bDl4?=
 =?utf-8?B?Y0p5UzNSREZaWnFkblZCelVQNjhOOU14MUtJSHkwb2xrMTVGRlVTZlVFazJ5?=
 =?utf-8?B?WXIwVzk5aGk1TGs1VkJqbmV0cS96QkxTU2Q4TW15YUtWTEdxS0tJcnJGV21G?=
 =?utf-8?B?bW9laEpFVkpVY3ZPaSswcFM4c2VyemhJbUNrcUhPSTd5SjV5Sk90b0daNTVk?=
 =?utf-8?B?SHdvZmlDcVlmZmZPNzFyRGRhSFNnUElMM0ZvQlpUb2RKZGFhRDU5a0JQS3B2?=
 =?utf-8?B?cWNvTk41a2J2VzU3YXlzTEVwUG56eTlxWWtoK0thYndDZ1dTUEQzTk5Wando?=
 =?utf-8?B?MWxxemxWcGJUejVQbURqWUdkZG9BMEJNaGxDaG9mU3QvZTBvblJseTR1RTdq?=
 =?utf-8?B?T21JajRBMWxnMzEvNFpJcnZIeUtObHo3aXIrRTlWQ1RoMDE1VVg4TnkxNXM5?=
 =?utf-8?B?aVJReEUzaEFsc1JQL0p3T0YxTzQ5UFBPNlVaTTZVWi9jeW1UVHloOXNPTm92?=
 =?utf-8?B?dDdrMkZqNHI5Y2dHVGxmUWI4SWUrQlgvWTNnZm1TQnFlN0lWMGlNUEhOSG1x?=
 =?utf-8?B?aFdiQklTVHZ0eWxDUjVnY1hCR3BSaGNjdW11YXllT2ZYcU1CbXdCaUI0QWxU?=
 =?utf-8?B?RG9yR0tqYkRJeHQ3TEpoMU9qZmVHMlRhM29SVWZwTTlLbXkzdkcvcTV5SVc3?=
 =?utf-8?B?Nk5EZXF6NC9ZU3A4Z0M3WVhlMllXUE54Vy9wUlJKZGkyYTFBVktEaUZ0STBM?=
 =?utf-8?B?emxNTU5qSnowUS9rV1JVcXArRktiTkIzeUxaNXZQa28rcm9EaDhJRWo3aDVR?=
 =?utf-8?B?MWd6c2FYVUd2V0dYeHI2RU4rMXg5SmpnOGRCQ2l1ZXhPMW12ejNtenJydVUz?=
 =?utf-8?B?M3duMzNiZHFBaVROU3Y3ZXdCSlZUbWEwZG9TYVRvZU8rRjlieC9Tcld4QURx?=
 =?utf-8?Q?qvtCWUh4aUm6cT6DIaXsr0xRu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80635da0-99a3-42b8-5f46-08dba9480f60
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 10:58:36.7499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OAQWnUR/kHfppxAUKEtYvh8HRBZbMaSW3L1YptSrK1vQNBmkzSH9s9Dn8VKt9UwEOHpVU/3HPev8YxYSj9l1sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8486
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 8/30/2023 3:39 PM, Ilpo Järvinen wrote:
> On Wed, 30 Aug 2023, Shyam Sundar S K wrote:
>> On 8/29/2023 8:00 PM, Ilpo Järvinen wrote:
>>> On Tue, 29 Aug 2023, Shyam Sundar S K wrote:
>>>> On 8/29/2023 4:49 PM, Ilpo Järvinen wrote:
>>>>> On Tue, 29 Aug 2023, Shyam Sundar S K wrote:
>>>>>> On 8/29/2023 3:09 PM, Ilpo Järvinen wrote:
>>>>>>> On Tue, 29 Aug 2023, Shyam Sundar S K wrote:
>>>>>>>
>>>>>>>> There have been instances when the default size (1M) of the STB is not
>>>>>>>> sufficient to get the complete traces of the failure. In such scenarios
>>>>>>>> we can use a module_param to enable full trace that shall contain more
>>>>>>>> debugging data. This is not a regular case and hence not enabling this
>>>>>>>> capability by default.
>>>>>>>>
>>>>>>>> Co-developed-by: Harsh Jain <Harsh.Jain@amd.com>
>>>>>>>> Signed-off-by: Harsh Jain <Harsh.Jain@amd.com>
>>>>>>>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>>>>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>>>>> ---
>>>>>>>> v2->v3:
>>>>>>>>  - no change
>>>>>>>>
>>>>>>>> v1->v2:
>>>>>>>>  - rebase to 'review-hans' branch
>>>>>>>>  - drop 2/4 of v1
>>>>>>>>    (https://patchwork.kernel.org/project/platform-driver-x86/list/?series=775324&state=%2A&archive=both)
>>>>>>>>
>>>>>>>>  drivers/platform/x86/amd/pmc/pmc.c | 34 +++++++++++++++++++-----------
>>>>>>>>  drivers/platform/x86/amd/pmc/pmc.h |  1 +
>>>>>>>>  2 files changed, 23 insertions(+), 12 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>>>>>>>> index 443bb78ea5f4..0e61ae74f1a9 100644
>>>>>>>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>>>>>>>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>>>>>>>> @@ -53,6 +53,7 @@
>>>>>>>>  
>>>>>>>>  /* STB Spill to DRAM Parameters */
>>>>>>>>  #define S2D_TELEMETRY_BYTES_MAX		0x100000
>>>>>>>> +#define S2D_TELEMETRY_FSIZE_MAX		0x200000
>>>>>>>>  #define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
>>>>>>>>  
>>>>>>>>  /* STB Spill to DRAM Message Definition */
>>>>>>>> @@ -160,6 +161,10 @@ static bool disable_workarounds;
>>>>>>>>  module_param(disable_workarounds, bool, 0644);
>>>>>>>>  MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
>>>>>>>>  
>>>>>>>> +static bool dump_custom_stb;
>>>>>>>> +module_param(dump_custom_stb, bool, 0644);
>>>>>>>> +MODULE_PARM_DESC(dump_custom_stb, "Enable to dump full STB buffer");
>>>>>>>> +
>>>>>>>>  static struct amd_pmc_dev pmc;
>>>>>>>>  static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
>>>>>>>>  static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
>>>>>>>> @@ -239,7 +244,7 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
>>>>>>>>  static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>>>>>>>  {
>>>>>>>>  	struct amd_pmc_dev *dev = filp->f_inode->i_private;
>>>>>>>> -	u32 *buf, fsize, num_samples, val, stb_rdptr_offset = 0;
>>>>>>>> +	u32 *buf, num_samples, val, stb_rdptr_offset = 0;
>>>>>>>>  	int ret;
>>>>>>>>  
>>>>>>>>  	/* Write dummy postcode while reading the STB buffer */
>>>>>>>> @@ -247,10 +252,6 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>>>>>>>  	if (ret)
>>>>>>>>  		dev_err(dev->dev, "error writing to STB: %d\n", ret);
>>>>>>>>  
>>>>>>>> -	buf = kzalloc(S2D_TELEMETRY_BYTES_MAX, GFP_KERNEL);
>>>>>>>> -	if (!buf)
>>>>>>>> -		return -ENOMEM;
>>>>>>>> -
>>>>>>>>  	/* Spill to DRAM num_samples uses separate SMU message port */
>>>>>>>>  	dev->msg_port = 1;
>>>>>>>>  
>>>>>>>> @@ -264,20 +265,27 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>>>>>>>  	dev->msg_port = 0;
>>>>>>>>  	if (ret) {
>>>>>>>>  		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
>>>>>>>> -		kfree(buf);
>>>>>>>>  		return ret;
>>>>>>>>  	}
>>>>>>>>  
>>>>>>>>  	/* Start capturing data from the last push location */
>>>>>>>> -	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
>>>>>>>> -		fsize  = S2D_TELEMETRY_BYTES_MAX;
>>>>>>>> -		stb_rdptr_offset = num_samples - fsize;
>>>>>>>> +	if (dump_custom_stb &&
>>>>>>>> +	    (dev->dram_size - S2D_TELEMETRY_BYTES_MAX <= S2D_TELEMETRY_FSIZE_MAX)) {
>>>>>>>> +		dev->fsize = dev->dram_size - S2D_TELEMETRY_BYTES_MAX;
>>>>>>>> +		stb_rdptr_offset = 0;
>>>>>>>> +	} else if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
>>>>>>>
>>>>>>> I find the logic here somewhat suspicious in the first if check (I fail 
>>>>>>> to follow the reasoning here despite spending considerable amount of time 
>>>>>>> staring at it).
>>>>>>>
>>>>>>> Lets assume dump_custom_stb is set. If dev->dram_size is large, the first 
>>>>>>> if condition will be false because LHS of <= is large. Thus, we go to the 
>>>>>>> second branch and dump exactly as many samples as before this patch. 
>>>>>>> ...And that is opposite of what this patch claims to do?
>>>>>>>
>>>>>>
>>>>>> Let me explain:
>>>>>>
>>>>>> We have cases where the S2D (Spill to DRAM) STB (Smart Trace Buffer -
>>>>>> which is meant to have debug data that gives information about the
>>>>>> system conditions, be it success or failure.) may not fit in the current
>>>>>> stb buffer size of 1M (i.e. S2D_TELEMETRY_BYTES_MAX). The stb buffer
>>>>>> size of 1M is sufficient for most of the platforms, but there could be
>>>>>> exceptions.
>>>>>>
>>>>>> In those cases, the dram_size would be updated by the PMFW (Power
>>>>>> Management Firmware) coupled with "dump_custom_stb" to fit into a custom
>>>>>> requirement.
>>>>>>
>>>>>> As an example (with this proposed change):
>>>>>>
>>>>>> when dump_custom_stb is SET and dev->dram_size is 3M (received from
>>>>>> PMFW) the first if() will be successful and it takes the corresponding
>>>>>> code path.
>>>>>
>>>>> Heh, I can see the numbers work in that case, however, the above still 
>>>>> doesn't really explain why only S2D_TELEMETRY_BYTES_MAX is copied if 
>>>>> dram_size - S2D_TELEMETRY_BYTES_MAX > S2D_TELEMETRY_FSIZE_MAX and not
>>>>> S2D_TELEMETRY_FSIZE_MAX as I would expect?
>>>>>
>>>>
>>>> I guess if your question is on:
>>>>
>>>> -->the if() case:
>>>>
>>>> why:
>>>>
>>>> dev->fsize = dev->dram_size - S2D_TELEMETRY_BYTES_MAX;
>>>>
>>>> and not
>>>>
>>>> dev->fsize = S2D_TELEMETRY_FSIZE_MAX;
>>>>
>>>> if yes, I think the intention of the code change is correct.
>>>
>>> I agree with you here, the statement itself inside the first if block is 
>>> not wrong.
>>>
>>>> The entire
>>>> buffer has multiple segments out of which the driver can only access the
>>>> STB buffer region. In general cases its S2D_TELEMETRY_BYTES_MAX(1M) and
>>>> with the proposed patch a custom STB buffer range that cannot exceed
>>>> S2D_TELEMETRY_FSIZE_MAX.
>>>>
>>>> taking the above example, assume
>>>>
>>>> case 1:
>>>> dev->dram_size is 3M, S2D_TELEMETRY_BYTES_MAX is 1M, so the dev->fsize
>>>> is 2M.
>>>>
>>>> case 2:
>>>> dev->dram_size is 2M, S2D_TELEMETRY_BYTES_MAX is 1M, so the dev->fsize
>>>> is 1M.
>>>>
>>>> so, it depends on the incoming dev->dram_size from the PMFW based on
>>>> which the dev->fsize is calculated and cannot be directly
>>>> S2D_TELEMETRY_FSIZE_MAX (always).
>>>
>>> Again your examples leave the most interesting case out... So what if 
>>> dev->dram_size above 3M, do you want dev->fsize to be
>>> S2D_TELEMETRY_FSIZE_MAX or up to S2D_TELEMETRY_BYTES_MAX (the latter 
>>> depends on the num_samples)?
>>>
>>> Or are saying that configuration never happens? If that's the case, then 
>>> the entire <= condition looks unnecessary (which is why it looked 
>>> suspicious) and you could simply do:
>>> 	if (dump_custom_stb) {
>>> 		dev->fsize = dev->dram_size - S2D_TELEMETRY_BYTES_MAX;
>>> 		...
>>>
>>> ...But then, dev->dram_size is assigned S2D_TELEMETRY_DRAMBYTES_MAX if 
>>> DRAM size wasn't provided so it doesn't look convincing to me 
>>> dev->dram_size would be limited to 3M.
>>
>> The examples what I gave was for reference purpose only and lets not
>> stick to 3M.
> 
> Those examples failed to cover the case I was interested in and that 3M 
> just happens to exactly be the boundary above which the cases I was asking 
> about reside which is why I mentioned it (that 3M is simply derived from 
> the numbers in your code, not directly related to the example you gave).
> 
>> There are two cases:
>> 1: A special case (proposed now), which is required only for certain
>> platforms. Here, a new module param will be supplied to the driver that
>> will have a special PMFW supporting enchanced dram sizes for getting the
>> stb data.
>>
>> like you mentioned, we can just guard that with a simple:
>>
>> if (dump_custom_stb) {
>>  		dev->fsize = dev->dram_size - S2D_TELEMETRY_BYTES_MAX;
>>
>>
>> but think of a scenario where any end user can just reload the driver
>> with this new module param on regular platform? that would result in
>> getting junk stb data to the userspace or in some cases the entire
>> behavior is undefined.
>>
>> Hence would like to add extra conditions to make sure that even if the
>> new module param is supplied, the underlying PMFW should also be ready
>> to handle such thing and that is the reason you see:
>>
>> if (dump_custom_stb && (dev->dram_size - S2D_TELEMETRY_BYTES_MAX <=
>> S2D_TELEMETRY_FSIZE_MAX))
>>
>> 2: A general purpose regular one - (current existing code), which says
>> about where to get the stb data. That is decided on the parameters like
>> the num_samples, fsize and the r/w pointer.
>>
>> the crux is: the additional conditions are for protection only and
>> definately not a overkill.
> 
> Okay, thanks. I can accept that as you seem to think there's nothing 
> wrong with the logic. Not that I'm still entirely convinced since I 
> couldn't get an answer to those simple questions I asked about the case 
> where dram_size > 3M but it doesn't really matter. (I still need to read
> the answer between the lines for the case where dram_size > 3M and that 
> message is conflicted.)
> 
> But please do explain either in the commit message and/or with a comment 
> the purpose of that check because that condition together with the 
> surrounding logic looks very suspicious, keeping in mind that when 
> somebody reads this bit of code 10 years from now he/she should be able 
> understand why you added it there.
> 

Ok. I will add this information as the comment within the code branches.

Thanks,
Shyam
