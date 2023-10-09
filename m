Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D37E95A91
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 15:39:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376816AbjJIPj3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 11:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376690AbjJIPj2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 11:39:28 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2071.outbound.protection.outlook.com [40.107.102.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1E9491
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 08:39:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UY3cptLedNRVBVwA6J89Fu7MPpD3X8dz0xex9w4fhD11sjiA0OwwGaY9y3f06h8dYW/AnQqYkLapdSZP8W/BH2yaaT14gNgsGXvRwOUD//zkpluv80Ur4nivUp1Nhk6oo9dKuTCoJrMfwyKIOu7eQ/KJSkrvt0uhZj5B0LMnxCKx8Zb2rmjDlxNgdYFVHOElVtG8GlIeJ+lKNih9S0SIrR2no2Zfdn3m09/c/DeEa0XwgZpGvhMYKkewzN4xC5Qb1sVL+Ti0/PuJlFqVsWojJpo3vl3L5ihAHdMatjLMBg0SXSZep9l5kmyjEAktp5A4m42MeJVUvMbZHuwok0Xvjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVGWbw5sq9CadN3HcKHYO/Gcrwadlidu5TroHylQU8E=;
 b=TxuiD8osBTfb7fUAmN6/bbfUbKZKGz8coMUZSAlwyqS7EqKK8QP6SpIen0VodmRw2f8SCoZb0MTDryb+JR/gAeP+dBdZ+a+dyCjp++M2Zd6U21wDsdNtubdonu5Cmn1BfVxRB1zWEqMeBfTdrXsdqlv3JLvO1yflTMmvIwAasXUmK7ZWP/dOz0gqbZTeQjkr0IzjHXW9vYvO36W9eIDmLYyirB5YcM+y1/LEjxFKE8MrqryGqU4c2xJK9VDUuasvc5FlD++wVt36t5EoT0Cntmscq5TNrvDRQQ6TN3NZlmeElB7FJkxtZAFFZ22KXcgC91Fs0hh0xUmIrUtsAbnMVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVGWbw5sq9CadN3HcKHYO/Gcrwadlidu5TroHylQU8E=;
 b=nyJjUuJ3OOkGaTqyzwieWOGezjqBYyoLrTG9IlqYt0faXpZDSd1sC8QINA46dlsTU525YvpVRIm2hyRFhVgct/lrJ3nGXBoBn5/pww8WHdVTu/k1gVkqmpxrEJpiHelDpz8FsATznEaE3HO8gMdI6lG2RqcNV5ZN2W3jkyuNx44=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DM6PR12MB4483.namprd12.prod.outlook.com (2603:10b6:5:2a2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Mon, 9 Oct
 2023 15:39:22 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5%4]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 15:39:22 +0000
Message-ID: <3b224c62-a1d8-41bd-aced-5825f5f20e66@amd.com>
Date:   Mon, 9 Oct 2023 21:09:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86/amd/pmc: Fix fetching DRAM size
 mechanism
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20231009144748.24054-1-Shyam-sundar.S-k@amd.com>
 <3e42aa76-64c5-4276-a496-433d788e0779@amd.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <3e42aa76-64c5-4276-a496-433d788e0779@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0054.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::20) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|DM6PR12MB4483:EE_
X-MS-Office365-Filtering-Correlation-Id: 773c2729-9d9e-41ca-c981-08dbc8dde8f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hcb+Len8ycL8xscRUjpJ+LaJNPOn/KFDNDAGuIq5R0/lGk6xMWrybjj5Lhf1TpRxEDGMWhB5Hd6J/p2+IrRhS0BbQgiOtAuZa80QJDEX05czcAkpmtePNZA5y9fIpMqV89DfEsjVQkqwhvVuPsQ3NVsfSHbOkCspXvHo4ZHrHhlfYv+qxSuaed2KUYCThqasAILNnRxxo8cAZWEL8C1n4GrvYldub0+rL6R18BkVSWam8mjmUJweb3W5ixgodqraHkE44A6SOB8QRJdAk2fWf15Clw1ZoYjZiYUiiCliDRKTpYgvqA3ISpjFssIx+AuHsozb140YexCzypwiYENJ5hiegVqTK9meQ8/bBoujGtR8uU+ZKxrWuLNWILIWDvBlJ/kafCAYYHrl0c/s+/080kPmQ/vpZQgKNmyJMoYy1oUWvOGHqK8BnMO/0Mc18sS4WAsY8frHkT8KibszN2zYM5NuUztSRmPk19F96K1Fra6kmdSzXSPXTmUBLLmxpyBiVKXqS/WIMIhlGP/3Y9Tr/dD2M+E5udmbVI+LPQqP8oIobHVUy/61YErOGU0CEvmP0SkMVWsJVxuhoxbYRr2vOsXDqRywWnKFLb1YD8C9Q2nYrUxN63Vd6gNbGXIPVt50Ta6z6AGa9FMHN+/JWLP8nA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(366004)(346002)(396003)(136003)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(86362001)(31696002)(38100700002)(36756003)(31686004)(66899024)(53546011)(6512007)(6506007)(6486002)(478600001)(5660300002)(4326008)(41300700001)(6666004)(2906002)(8676002)(8936002)(83380400001)(2616005)(66556008)(66476007)(66946007)(316002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0N4eDVkeEJBYS9pcFNSTklNMzd0RnN4YUcyL0NGeDlHQW9FYzUzTWg0ZEs2?=
 =?utf-8?B?UWl4QlpXOWJwc3BaeXc2SzB2L3FLY3BML1lxTS9JN3pQcko1WmNpTVdnYXU2?=
 =?utf-8?B?UE5Ub3RGNEJjcEZFQTJ2NTNWY3NYNXlyZHBxaXVnTG96TkZyKzZhZDJRa2Jj?=
 =?utf-8?B?MWt0Z0xEOEswbnJlcFNiVllUbFNDeFZvVE4rOWtOUlk3dkFvOGdBQ2ZNamdF?=
 =?utf-8?B?UmNNUlhBLzNNc1psYXpGa1ljenN1UDJFbGVYa0ZBR2VCNHlnL21CTFFRTjR2?=
 =?utf-8?B?QVdhNHJicmpoZzc0TnR6cHBueFJYTVhFN1ZKM0REcVFFVURsWjR6R0wwZW1a?=
 =?utf-8?B?ZG4xVm16SUZSdVY4aHE5bW9RazlRVjhWbjFTMnVBb2N5Slp2bnJmYWhvc3d6?=
 =?utf-8?B?VDlLRitOVGg3dVozdnJGeE5GRUhObGFBQ3IvY3dNVktKWjlSWUZOR09aOEpl?=
 =?utf-8?B?bUVhNjBkeUc4bEhxMHkxeGxUYWtwNDk2QU4yaVpEajAvaVNkUk1DZGROQ1lu?=
 =?utf-8?B?WkVybVlQOHBabUVVOTQyNUlGT0s0MHFKcEJkVlBsTDFqRGZhcG1IcUxXTzNo?=
 =?utf-8?B?S0ZOZlppV2NrOHhhdmhyYUpiTm45RTRKcXhUNjJ3ZTU4dFM1aEhzeGphWkZn?=
 =?utf-8?B?eEpiUGtVQytRVTZPcEN1dEZOSlJLZjhnZy9wQ3pJeXAyeUY3OC9IRlRZT2dt?=
 =?utf-8?B?OEpTUFNOUUF3eGVQU29QQjZpYkJXQk4rTFlkWi9XWjFEUUtSV0twT0tBaVJ2?=
 =?utf-8?B?S042c2JNYzdPUkdtTjA3TUVVcktWTnpQc1V0c0RJZXFERENkRkEwR2lDSHdK?=
 =?utf-8?B?cGlSUFNLV2Q0VEtFelE5d0MyV0dwdU5yTWtNNUhMbWR5VkhtalNYYXpqRUdX?=
 =?utf-8?B?YVA0R05CV3VmRHpRTXFoYjh0U2NLSFBsOGFmTGtpanFZa0srNGZicklQUjU1?=
 =?utf-8?B?VWI0NUdJMWNYUE1WbmNEUU8rOWpMK0NSWUxpeTVlRmRCUUZXUTllcEM5QXhV?=
 =?utf-8?B?em5qRFRCeTcvWEFpSnRiS09VUGlEVUI2VlBsOG0xS2YvalJIQ1JDakNLUHZz?=
 =?utf-8?B?TkJqT05QK1p5Yk1jSnlnd1hyMGZDYmJvQmNJYlhQMnJxWnhvSUJzTnVqTjFK?=
 =?utf-8?B?MHgxRkVKa1NqOWpZUlcwd3YrRU8yVVQ2YzFmb0R3Y0F6dXU1bFNYNGRkL1Vz?=
 =?utf-8?B?ZDF3ZUYzd3FjQ3FkSjNTWWlFU1lqS1l5ekhZb295TCtnbzJ6eDk1ODVlQ1Zw?=
 =?utf-8?B?cHdGMlMyNC9SbGdpanFsMjZEVmxtUGlGSlVSTklJZTB1VWV1YzhhNnRiTnRR?=
 =?utf-8?B?cFdHWmxXN2ZsYnYrOHpvUjc4eEluSmQ5UWhBZnYyQmdhWHFpc3R5V3JtN2hO?=
 =?utf-8?B?WHZhaGlkdG1yanFXZjFObE1JVFV1REt5aHBzeWZDWGs0R1ZrWEVpY0h4Mzhp?=
 =?utf-8?B?Qy9qaEI5Uzl1dEJaZW51OFRZZUx5RTIxRytJMDZUblZVdjdVejZOT0lxc2VX?=
 =?utf-8?B?K2dnaFRjR1Y0UjY3RXliMldhWDJabm9lMktSMERueWF4VkpIQW9HTGZwcU9X?=
 =?utf-8?B?VU1kM3lrNGVXU3U4QnpWQXVDRlJ5QTkwRkI2SnhVSXhsTUIzSHhGalBWdzkz?=
 =?utf-8?B?ZkhXQUY5Yi9HYm1NYjg4bUNRSjh3L3g2bnAzQWFoeG5TdVVXNHEzTFUraWV2?=
 =?utf-8?B?bzk2U2kxaFIxdnBvMXdvbngxNzR6bWxMRUtzcEhRdWI5ZlNHRTYrSjFaT2t0?=
 =?utf-8?B?NFdvNmVZd3IybHVBWDJEaWZYTUZQQzBWWGFlZzlKNnpIdlVPR3JxRHV4ZnYv?=
 =?utf-8?B?RCs2Y3lKRVZEQTNHR1JobmtORWhSUmljdk9tUzhEbzI1V1daMng0aktQanUw?=
 =?utf-8?B?Wlp5b1hEMW8vMkEzdlRhSnR2Rm84UlBSTEJhWk8yOEFWQXZEZk1mMHpwcnAz?=
 =?utf-8?B?a05JV0UrTTNCREFpNjhKZE5tRmJ3VWlDanhOL2dneHhnMnlyWUFXU2RXRlVk?=
 =?utf-8?B?cWw5SkE3VVNIUFByeWJsdGlJS3NoL0tYZ0Jmdlc4MmczZ0QwOWE2RjdJUTE3?=
 =?utf-8?B?czh3SFpVUHRKVEY3UDdMWnQ1ZEVQQlZxbVV1K0k5TDB5bnZwWmMraTFDalhR?=
 =?utf-8?Q?OpPCX4LBzn3q4CukbcPRZBwAk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 773c2729-9d9e-41ca-c981-08dbc8dde8f9
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 15:39:22.6495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YAF/vzQp+e0wEKGiwe2aoAH2eYhnK/+VRzpfAe456FgOQ8VVuJk7gA9h7np6fv0aphNvE54i7H7uGBLrBbqyuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4483
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 10/9/2023 8:25 PM, Mario Limonciello wrote:
> On 10/9/2023 09:47, Shyam Sundar S K wrote:
>> amd_pmc_get_dram_size() is used to get the DRAM size information.
>> But in
>> the current code, mailbox command to get the DRAM size info is sent
>> based
>> on the values of dev->major and dev->minor.
>>
>> But dev->major and dev->minor will have either junk or zero assigned to
>> them until at least once a call to amd_pmc_get_smu_version() is made
>> which
>> ideally populates dev->major and dev->minor.
>>
>> Add a missing amd_pmc_get_smu_version() call to
>> amd_pmc_get_dram_size().
>>
>> Fixes: be8325fb3d8c ("platform/x86/amd: pmc: Get STB DRAM size from
>> PMFW")
>> Suggested-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>> based on review-ilpo, can be added on top of recent stb changes
> 
> Hmm, so this is actually going to mean that we end up with a round
> trip call to the SMU as part of probe to get the version when STB is
> initialized.
> 
> I think that's going to translate to a longer amd_pmc startup time,
> which could be problematic if a platform leaves STB enabled by default.
> 
> At a minimum I would suggest to only do the version check when it's
> one that needs it (IE AMD_CPU_ID_YC right now).  But otherwise this
> s2d initialization can't happen the first time it's used?

I remember the long boot time problems, but was not that confined to
only CZN based platforms?

Thanks,
Shyam

> 
>>
>>   drivers/platform/x86/amd/pmc/pmc.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c
>> b/drivers/platform/x86/amd/pmc/pmc.c
>> index 1424c03c1f03..92adf4523736 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>> @@ -981,6 +981,10 @@ static int amd_pmc_get_dram_size(struct
>> amd_pmc_dev *dev)
>>   {
>>       int ret;
>>   +    ret = amd_pmc_get_smu_version(dev);
>> +    if (ret)
>> +        return ret;
>> +
>>       switch (dev->cpu_id) {
>>       case AMD_CPU_ID_YC:
>>           if (!(dev->major > 90 || (dev->major == 90 && dev->minor >
>> 39))) {
> 
