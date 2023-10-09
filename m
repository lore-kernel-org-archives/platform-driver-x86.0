Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23BCBE95A91
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Oct 2023 14:55:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234554AbjJIOz2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Oct 2023 10:55:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234568AbjJIOz1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 10:55:27 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1480EAF
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 07:55:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X0QIN+ck/ILgoLzi7ZK8MnlXQVkE5tBjCvVETGgfTx5kv+Q0QckW13zmgGEuEU/VcApDWKEIFFKokLDsoGZBXmcgUahtkiYRBAv3ELmbn5T1ep6vpsqBlHld+N9V2xWfZnkYT/Mpbb3fU+zsBKNrTT1u36ZD6fwVP304JNesnHSDtfiDXLNa1VLjSL3twdf7F8rFaXpRwMuHcTBh4yxkrSNirsmLg+2PgnzsURMKK6/qTDpI4nOdVmLRIwtRI6T1TgnuwR6N88xbS1PUJI1xTkYbUj3LS+uUMd2OiXiXr/8vlstLPBKiEacZLQrBihiH9uX16GIyzjo4T21K1tLW0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDLrQ0XezebxcbRh1mLngSVOjhL+X5iCZ/6zP/dzv00=;
 b=G0eA9sphPJHo8jL8pSzz4jNb4WXONTEnNWxlmCTe/Bs2CS/BxMyKLcR3l+d9LS6O0ZZTc4Uhv6cK48nu1l3YAWp+0G/SmmXZjta18vnGNBmGSNSEV6Xq4uUQ/wr/27Vj8d+JlUw9CJrFaiYa9MV+huqqzQsTYFnZEruJWjughVSUBj9FSGAya56z2zg8UXXlSgxudwTm38dCSWcNZV7v1baxunesNr2QewDXvExqg6zKjdrM2k4RAnS0XRDXBnE6W3okSKKdCj3MJ4CaYFusxiR95bVYgIrjs2ZW6ES1UriGlJx/it4cwjQF2iRkaFRNvUDFkfmv0Vy72m3jXCv9jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDLrQ0XezebxcbRh1mLngSVOjhL+X5iCZ/6zP/dzv00=;
 b=EdnZ6KnHvLnP+3WISzU6Vjlhk2B5QO789ksqXGVRdL3EuMKJUDkI5LEXrvlEI/qgTByjuWdYZ/T0Tleg1LPGAcVka4ZWFj82fiIDv1ThbsdBCe8GJGk6oBs35x6tyJISiYJQIuJfhqZt097LIibh2QV0HKjPF14Gh4TXhj8oOUs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BL1PR12MB5801.namprd12.prod.outlook.com (2603:10b6:208:391::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.41; Mon, 9 Oct
 2023 14:55:19 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3e65:d396:58fb:27d4]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3e65:d396:58fb:27d4%3]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 14:55:16 +0000
Message-ID: <3e42aa76-64c5-4276-a496-433d788e0779@amd.com>
Date:   Mon, 9 Oct 2023 09:55:12 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86/amd/pmc: Fix fetching DRAM size
 mechanism
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
        ilpo.jarvinen@linux.intel.com, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20231009144748.24054-1-Shyam-sundar.S-k@amd.com>
From:   Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20231009144748.24054-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR01CA0007.prod.exchangelabs.com (2603:10b6:805:b6::20)
 To MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|BL1PR12MB5801:EE_
X-MS-Office365-Filtering-Correlation-Id: 039293f0-38e9-4f4a-a2a8-08dbc8d7bf54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y9cCRc+1dXRENYkGMUZOo2z84Fa7hsWJkLiS/kFpXsDYdfy5AmWmDnIHM4LMXU41HgQcBxRq8sUAt+cfoxKdM64jHVDD15eZPf+QqBYfMOba9FZlzMK6lhpKE8WDv4eenY7gNqfqkmE3dUiQXFPw0BYpzQb0QhN22pxXc89Ckm68/iE2RbR0xHMnMdBeIK7JtaFARrJQhWfrKInXfkcMjXlAMGxUcc2Qbaqr3W4HCxoKqr7tOvuos1nXjDitNtnxRdpK6c47FUmPHHpw9JE6+FZrVuXd7OKVtxk5im9VBzHUZ4krbSuVp9U04o1v7PpQjjIjC9e7PwQGPjhECgGHwz7zpEiFAvYeqY9MvuyxBj16xrkika1FBBxqVMoadHY4v5e6o014UgwNTVCI/KeM/+kFpcmgW04kKn6tTOzehHQKEy/tlMBhPM6O5f3eKiIEnQ2rXKFar7IW+hbEb3Gu8i6EG7TehzJYY9aSyRMPgkGRJVbUKn1rGE9iWNP385Ay+PtiBp/h2VQ0bIZUeIspM5oEIRBNGmLFFUj1NefDXxoHW78l7/ncO+Kf+N85SiF/FU6WDx37nz9D7ZtoMNQ+gEkxYtyzokZtHZ7U+HIX7tSUWkl58zN0JoR/cyZyD/yg0zZDTVOr5NvrQBEd4uF9+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(346002)(366004)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(41300700001)(66899024)(53546011)(6512007)(2906002)(6486002)(478600001)(6506007)(2616005)(8676002)(83380400001)(8936002)(44832011)(5660300002)(66946007)(66556008)(4326008)(316002)(66476007)(26005)(38100700002)(36756003)(31696002)(86362001)(6666004)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QytiY0VDOGFLSHNranJoa1MyMUU1eXRkZVR6aHBSci9QSWpVQVVPNTNDOG9L?=
 =?utf-8?B?NHVncFdaSlFaRU52TnNTSXd6YXk2dmpUYlZHYU1KTmg5ZEV5WVNqWC9GRWlV?=
 =?utf-8?B?WEU1enZRYm9TZ2hVRk93dnUxSXZ3Zis1a2Uzb2dxYWl4ZXQwZXZ5aXU3bFhR?=
 =?utf-8?B?Yk5qMiszYmhJYzVzWXZpM2pqendncEQ3RFVFMHJOQWZzcGplMWpjSnJWWnZ5?=
 =?utf-8?B?RDFMVldHNi9pVUNPdy9KWU1mZDRHQzRuT0F2MzRNRTQ4QzJjTDBxK0ZCbC9h?=
 =?utf-8?B?ZWxpYyttSm1PRjRZTUJJdE9OSnBwRXJnSUxvWXVaNjlsVnZFcCsyUWNlZ3lG?=
 =?utf-8?B?cDZ3NnB4Mm1VSmpVRjhXVnJVNDZ6L1hrbGtCYThkVG9LczIwZWx5VTNFUnp3?=
 =?utf-8?B?cjdyalI1dENMOW94WU1MZldzdUszSmVYenZpRmNnMVoxdmZyckxuaHMxRE1K?=
 =?utf-8?B?KzcwTDhrRHBaZDZYQjNhODE4ZTR0MXBVTXk4WC8xZFRrdEZHcEpDdHlyRjBY?=
 =?utf-8?B?eUFxd2kxWURDNXd2d2JLWktjTjdVMG5vME44cmNpQ0R5aEljdytrR1VBT1lu?=
 =?utf-8?B?UWxOUnlkMUtRQ0tRTHJUbXRIcDNsbDBSaUVIbWtPc0VIU0pCaGdJMnoyZUhW?=
 =?utf-8?B?NW8rbVVJRTgwZmMzMExMeGp4QVhZeTVObm9aU1h1d0R6Z21nb1djRzJZWXh4?=
 =?utf-8?B?b2pqKzlhc0dTR01jSDRrRFU2c1I5c0FSTzljbHEyc0duZFF5REFoR21PRE1U?=
 =?utf-8?B?b2NuN0R6RWxXekZyY1F3T1d6cGlLL3pMQWZTRmp4YTJvRWVyd0c1NlU4dUZU?=
 =?utf-8?B?VzRJUjV4anRYUU1uMXJoYXlDaVIxZVZQZVlwR0QvWGdZM2RaMGgvYk1vcXBZ?=
 =?utf-8?B?eUZXVk90NDFnYWYxZ25ENEEwTFUvYjV0c3k5aVJaVlFTaVlISjd4QnBrTExn?=
 =?utf-8?B?emk4Zk9mZnE1U2ovWWozTkthNXNrZGZNRjdGaE52LytxWnl6aDI2L2JwUnJn?=
 =?utf-8?B?aFRpU2tBcFkxUWVjK0tYaGZudTJrWWpuNlh6dVhKTUhpZzZYdDFscW9vcVZN?=
 =?utf-8?B?NmpVbkc3N1VIVEtkbWNFZ210QXVrS2JKZUxleWRMVUxONzBRRURoOElrZlU3?=
 =?utf-8?B?U09adkhPMWUrY1ZtTUEvNUF0SUkyKzI4aitXN3UzWmZ5ZzQ5VGJ1WlV6MVJF?=
 =?utf-8?B?ZGxaNmg3c2x4eVdQYjZEYXZUMHlrd1k0RStMWFlkelhpaW9DTDNEdTJIakox?=
 =?utf-8?B?N2htY05aL2pJTTFKOHVZUTUxaGlNb3ZGODBncFR4eTFwMWNHd2M0VWprMEZk?=
 =?utf-8?B?eVJRWkp1bUM0VUd6WCtoVXpqNDN4ZW8wVkVmUmUwOHByb0dJNVAyVzRHMGV3?=
 =?utf-8?B?M2hNZXJscHQwbExRd3JyVVR6WWlSblMzSi9UeHpJaDNBWVNHaWwvMUV3bFpF?=
 =?utf-8?B?YTA1L2Z6Wnl4YW5hVlRuSDFiczdpY3hHSEZzSE1ta29Pdkl6Q0NMc3VFYy9w?=
 =?utf-8?B?WHp4SG9neU9ZU3VFZE9Wd3p1YzdpNnV5NzNoSUdPQW9iNCtZNTIycms0dGZR?=
 =?utf-8?B?OXY1NU03ZTh2Vi9FVnF1MW5pZ1NLclFwWEFuNGRlZS9ULzkvaXNvNzdlclZG?=
 =?utf-8?B?WnJJWmVqWStIdjhtVkdOQmx5WWZRc2k5NmQ0ZC9lL21oUHFoaTRNek1Eb2Jm?=
 =?utf-8?B?QllVSkhtWlZKbXVBKzlwSEpmS0tYSE1oY2kxalVMYThGN2l4ZCtwdmdtWHV0?=
 =?utf-8?B?NkRKRHhIQUYzd3hvaDArOVFxaWp0ZWRzY2QwcDVMTXQxcTZDcG5yV1h1ckFR?=
 =?utf-8?B?WU4wSlhPdGhXMjM0bDRNRG9GbjBhUjduSytoT04xa3RGSGhESVlHdTlaOWwr?=
 =?utf-8?B?MmN0WjlwZDI3N1lWTnllUXpzTmQ1aiszcEgyZXJoVUJLMmRxMXRUZlhkUFR0?=
 =?utf-8?B?UDdPZnZTUGlZeWFGUk45NW9nTGtncit0VHp6Si9wbnVuSVE3RFltVGU4NTdI?=
 =?utf-8?B?ejFTWUlEaGg4SFMrY2NmdWpoM0swcmE4Rk5KMVVwamdNOS9Ddmd5dWpRRnZm?=
 =?utf-8?B?Y0N6M0NzU3hueGZEWXI1dy82SzZES05YZXlkS3d5bndyQjZhMS9vaU1SYnhu?=
 =?utf-8?Q?JwMp7LqSysDZNUvnxWfONFfzy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 039293f0-38e9-4f4a-a2a8-08dbc8d7bf54
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 14:55:16.0460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z20VJEY/RdINat7eIHaLOlHakd4m4z3H+jFOZtYpQqNXrsfrjCUWy7X1pjRlps+U8iwM15QEHq5BeoqgFYIvpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5801
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 10/9/2023 09:47, Shyam Sundar S K wrote:
> amd_pmc_get_dram_size() is used to get the DRAM size information. But in
> the current code, mailbox command to get the DRAM size info is sent based
> on the values of dev->major and dev->minor.
> 
> But dev->major and dev->minor will have either junk or zero assigned to
> them until at least once a call to amd_pmc_get_smu_version() is made which
> ideally populates dev->major and dev->minor.
> 
> Add a missing amd_pmc_get_smu_version() call to amd_pmc_get_dram_size().
> 
> Fixes: be8325fb3d8c ("platform/x86/amd: pmc: Get STB DRAM size from PMFW")
> Suggested-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> based on review-ilpo, can be added on top of recent stb changes

Hmm, so this is actually going to mean that we end up with a round trip 
call to the SMU as part of probe to get the version when STB is initialized.

I think that's going to translate to a longer amd_pmc startup time, 
which could be problematic if a platform leaves STB enabled by default.

At a minimum I would suggest to only do the version check when it's one 
that needs it (IE AMD_CPU_ID_YC right now).  But otherwise this s2d 
initialization can't happen the first time it's used?

> 
>   drivers/platform/x86/amd/pmc/pmc.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index 1424c03c1f03..92adf4523736 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -981,6 +981,10 @@ static int amd_pmc_get_dram_size(struct amd_pmc_dev *dev)
>   {
>   	int ret;
>   
> +	ret = amd_pmc_get_smu_version(dev);
> +	if (ret)
> +		return ret;
> +
>   	switch (dev->cpu_id) {
>   	case AMD_CPU_ID_YC:
>   		if (!(dev->major > 90 || (dev->major == 90 && dev->minor > 39))) {

