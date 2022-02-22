Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B5DC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Feb 2022 15:24:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232769AbiBVPYZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Feb 2022 10:24:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233452AbiBVPYX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Feb 2022 10:24:23 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7188B114774
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Feb 2022 07:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645543436; x=1677079436;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JxOcDDzJMxfSy4IlKv63lobiJ1d71aaIoH+6QOcT/BM=;
  b=GYhLWEzCpedEo30cDVkeIFrp7YAlhu/PTNJjQ58c6EEbiq2p8umRXtHE
   J1vjfyWuHrKMwCvxnOT9wDTX7FBhn6Svcr8oHAVyxpLOagzgJc6rOCmwR
   1fd5w+TWiir5T8dea4LrCOm3FX+BaJ63cCJc0XBs8Oi/hNG0kVnRjy5eY
   F7hqVbOsMuXT/dAY3ff7jyolJFCAseupxdW+kn9oZQbVRZ/OOv5LrW/hQ
   fb1WrmpuJGvZQD5kf7Q2zmc9uN9/XWwveTeEsp0FofCYv8HCfr2zhvAHg
   V7/Kh+zCJoK15l4KqM3uzZq1hk0U1o91NL5jrciuwO+4z5fM+gutfUgc9
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="276332641"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; 
   d="scan'208";a="276332641"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2022 07:23:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; 
   d="scan'208";a="532268455"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
  by orsmga007.jf.intel.com with ESMTP; 22 Feb 2022 07:23:55 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 22 Feb 2022 07:23:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 22 Feb 2022 07:23:55 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 22 Feb 2022 07:23:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dhYqRVRzHBWAl1EKzHL90JG4F++yRrjIdwKyne1o+PKNnflIQVVqJX+1bIYE6k7UWkcGPp5qUSSwcCaFcbm1CUqq6774IPccNDwD3om9s1MZF79TPV9ehP4kWWToonNyI5OXZEEFDAnyJz4Amp+saTa959OUihiAVJLXddywni/kPQqtmprMWk14jLh2YOyECdj+9sjioW0dXn2CWt2ViKu1DZIJyOLJVpNw0zev9iObUl2K01g0qUYszE1Dlvf3lT6dVMjFet7hETcwajMIn0XIuPrHsmUsngTXfaN6ErgZ3aJUqwPEtzOkBsOgY3//bzuJOIF3DaO5DiCuFsmInQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m94k/nkQkyEBXZyBvNNkhp+BGlkE6cPp+COiSF/SUow=;
 b=JCJFErA7Pub3U778MJq7086n6aS/0PSfufo9uT0mE0kGxn1cSY1Slhm85eJkzN5/B9DsUGdqpw2ShXZdZP6vIUXL/5/Iwy64Ps36awfbLjsXjgxL5okzTahxfjZPjmjKVDDndiYznGXCVLsK7BurqcSqkgzWQuRh2k5kBpvz6iU701BpAbVvb1dxWa19YpjZRPo7WrmydbrRxeMwSrHXJJyCVJZL6bh1lVD7N0qmxdCC0UfplQ93v2S8RyJDyTG1FjlzX/NkiWiR/6O4QeYkoCmSUdfn6Wxe6f+mpvlX5kN+Rk8SY6u4IicV9dezFBgJPEw5A26dtKH8mgJO9f+F0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW5PR11MB5810.namprd11.prod.outlook.com (2603:10b6:303:192::22)
 by MN2PR11MB3982.namprd11.prod.outlook.com (2603:10b6:208:13b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Tue, 22 Feb
 2022 15:23:52 +0000
Received: from MW5PR11MB5810.namprd11.prod.outlook.com
 ([fe80::6c61:b102:e23e:69bd]) by MW5PR11MB5810.namprd11.prod.outlook.com
 ([fe80::6c61:b102:e23e:69bd%6]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 15:23:52 +0000
Message-ID: <9e833847-e42c-a812-1386-f7593bc8f796@intel.com>
Date:   Tue, 22 Feb 2022 16:23:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH] platform/x86: amd-pmc: Set QOS during suspend on CZN w/
 timer wakeup
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
CC:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Goswami Sanket <Sanket.Goswami@amd.com>
References: <20220221200728.2323469-1-mario.limonciello@amd.com>
From:   "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Organization: Intel Technology Poland Sp. z o. o., KRS 101882, ul. Slowackiego
 173, 80-298 Gdansk
In-Reply-To: <20220221200728.2323469-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::7) To MW5PR11MB5810.namprd11.prod.outlook.com
 (2603:10b6:303:192::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fde898f-9986-4365-eb6b-08d9f61754e7
X-MS-TrafficTypeDiagnostic: MN2PR11MB3982:EE_
X-Microsoft-Antispam-PRVS: <MN2PR11MB39828B87512FD8680EB99319CB3B9@MN2PR11MB3982.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iKjMrAs0aLrU9JINd+q8XP1uhoEmEeayVmct5dU8VZHei6S0YqxpC2UWTZ0lRadORRdazvkHYhVHMs3iViCO4vBcvK8MlCedMw8D/eH3JhmkVzhxj15jAMbVplEiFxUCkAkQ5h9uuQJ1MEE38RaXtRDtQB6krOo5GLyX5NEZXMPX03N4rvSJNHYcDC150Y9TMbrMOP750IZ72kQAxmOi1BP3ou2vyGWRcRsVMD6vr6y++B2rXuc/u1W/UYepkSi574y77N/BfPnIs4ofZq3NRfAZkArHhtQygrPlUU531NT4F7QzR7l9Jzn7p8LGXZrm9a3Han/88Kiz5y4iyeg4MM/b/qpsVYroH+xtrE5SAqMTv+J6BQOLajMorUyfQOGlv7xZqlQ2yIA9a6kO1zTW8TXQTehIYxGU+sAVrjtJ5Gq8YQZZCMQRZIoVQkJtGHhxYK/VJOhTBC6LnMYOgkKdOag+QTuY5ROZeW2dTtX1NFdlCr/PzhiUSC3Gvwd+Z+dWJv2eA3F5Kddarx3E++JSUXOc6Q5ObFygWBnskeEoXgiPajYFK6VL/i4pEok9zT5E3hI8uihXnQ+2mYln5VHUOYSrT5KCpcD2cdVEYDsGCc4dbyqAfXReq9lHR44JLOr9nepqkcMZKcW+xvJWQ5V40seWXEyoBlXC9KotOJZClhyMmhqJ1tA2BXJJzFbklD4kFWlNa4QZaDgz9UN9Ud/JAeNJCwJ45aFaSDQ3OspLxuCTX6ghmLsOdWiBsTSzQN07iP01CXKSpApAVlz+9ADXcNumTQaFcwYi/Nz9qYnprw7m5/NLtmjPvDcGhLDJZUrHkMG6+qCghgDiMsoYlGYd8IGi8m2H9hYKx3oQZLUDaps=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5810.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(26005)(6506007)(186003)(36916002)(2906002)(36756003)(38100700002)(6666004)(82960400001)(53546011)(31686004)(66476007)(8676002)(66556008)(6486002)(316002)(54906003)(508600001)(83380400001)(4326008)(110136005)(66946007)(966005)(6512007)(8936002)(31696002)(2616005)(15650500001)(5660300002)(45080400002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alhEOHBzOCtLdG1vWnFDQzRUWnBVM2NHY0VLRjVYbGFTaENpZVE4cGRVK0R0?=
 =?utf-8?B?a20xcWVLbTJENUdlT3k1aHE3ZUN0M2FIYWFCMDhlUmVLRHRHbFl4UVU0N2M2?=
 =?utf-8?B?T0RNbnlOaGliZGRmNmM5M0xROGsySkhYMERCSnltY0tRWHZmV1hPeVkrd2Fv?=
 =?utf-8?B?S00rdzBsM09pdjFiMFpQUGY1N0NHSm04SVJTbTB0c2d1cERzSzllSkxkME5z?=
 =?utf-8?B?WVdIcDV2UjMwaENZUFJHemZQZDFrakV1MGZIZ1N6cG5BcHN3NFA4WlU3aDdj?=
 =?utf-8?B?bFZ1ZWR4TWJRU2wySEVBWVZTakpHa2hDRFNRZUlJenBTcUFXSTltQzRyQWVN?=
 =?utf-8?B?dU9ZR0YzUFhxU3VxaDRSVEt1SEVpNHIvZ3VCcElwQldzN0pNRjdISlVWK2Jp?=
 =?utf-8?B?V3IrajBzaytPSmtCcWFaWUVOMnRvcWM4ZnA5emlzL095Zm02dC8wOUV2RnBW?=
 =?utf-8?B?aTBqUUwrNG52dHF3aVR4RkVubkpsYTllNVc4V2dIbXBsUm45SXBYVEU1WCs1?=
 =?utf-8?B?VlFuMElCbnE5dmg2dGk0bjN1czZJYzl5a21pRDdWUFZLc2RIa2F1RjBIRGMw?=
 =?utf-8?B?b2lweHBKWVRDMzQwc1ZiamRGcThpUEF6a0lVc3hPWHdQQUFmbkwrQlBncnls?=
 =?utf-8?B?R0kzNHdwQVFURGNrT28vUkorVU5xWkJEbE5raUVGOS9hZGsxV1pFR1crVkgx?=
 =?utf-8?B?Q1NsQXRIYTVQc0h3K0pDa1JyYUhQODNQdVg2bnNTcnNJTWVXRUFjVHZ4bTM5?=
 =?utf-8?B?WWpidEE4SHBNMitFbUR5WXQ5YkdubHhVOW1TTzZUaEFvUTMvSm5JZ2wxL2VJ?=
 =?utf-8?B?SDNmeC92SEtuMzVQTHYyU0ttRTVzUVVHcGV2d0VFWVYwcjY5M2s2RkZVK05R?=
 =?utf-8?B?VzRCNWNoMWFrdEQyMGRaa1RpS1I3dktIbnFHWHRvM2oyKzJCelJqK1JMdC9k?=
 =?utf-8?B?THFiV3dWaUZiakFZcGxOV1pEZ1diUTBqejFibVVldXY4S0dZVlUzT2VjWGxt?=
 =?utf-8?B?em42L0pVRVBPRlhzVjMrN1FJcFFKVkJjTUxwTEZYK0ZQTmtzbXZqY2NmY3NN?=
 =?utf-8?B?Wm1DTTZEaUtEN2hVa2cybi9GaFdtYldjUUN2bVZNdmMrQU9obExiSGxPUXdP?=
 =?utf-8?B?OGxScFpiNkptc2EvTkhqR21OMVphSGxxc0hGZW0vY3dyNHM5aGFsa2JNUVZX?=
 =?utf-8?B?VjR4aTBFa0t3bElEdzlFLzhqTVZaSVgvZ0tNT25yOHpZZkdJNWl0Z3F1VVBQ?=
 =?utf-8?B?NGJXeGgzejZWbXNqN1FrSU0ybGM3ZDEyNGQwTk9ra3dCczBBRGk5WjFuV1F5?=
 =?utf-8?B?U0hkMTlFQU83VG9TNDcvMkg2blBCc2VOaHF4RU9JTTUvV2JoZTRjbnEwSVk2?=
 =?utf-8?B?UDdmOSsxRWdiRktWazZRVlJBZEZSN1h6ZEdLT3QvOGRqTlplOVNPY05uNDgx?=
 =?utf-8?B?MGtHalRFQTBwbHdoWEVIWGRiSzNDdTNYV2FEWG1pblRBU21pT3oyMllUWm9J?=
 =?utf-8?B?S0VScGlNQ0w0SHhkUENkdkY5MEtuS3ZUMzZ3dnZiMWNZZ2FISkkyUmpWajB4?=
 =?utf-8?B?L3ZsTjZXdGowbkVHWEQ1Q2k3aGx2YTFoNTlGb0VrSDM3Z2FYVU02L2lPdksv?=
 =?utf-8?B?UE5RS0twZndXRm85cGJJYUZ4UnlidDFUNW1veWNETGRoZGpvV1BxUitMMjB6?=
 =?utf-8?B?ai8ySlBXcklNWGYzdWVZNlA4RE5hR2x4YUlqSllVQlUrazJmQ1EzR2p3MHll?=
 =?utf-8?B?ZjJ0a2YwYzF3RU9VbVhGaE5ram5zeldCNWZQS1Z3Wnl2RXl6aHFYRWRkTFBz?=
 =?utf-8?B?YWErVENHMG1SNFVGS0pVdFdQZHQ0Y3JTNlNHUndnUER0V1lXMnlwVldtSUln?=
 =?utf-8?B?ZlZuM0g1a3dPeXdmY2svRlpleStPUDd2TXpDQVlxVXRIbGg0citDbk82a2xm?=
 =?utf-8?B?YWtsOUZ1Q2RlMm0rem16WGdKZGVGdzN3SE5DUlpLaStYSURlYzF5VksyMTh1?=
 =?utf-8?B?b29YaTJ1WlpjUXIvZy8yQzljU3AyWjJBWGxndjBGOC9WVDVXcVE0ZEJmeXJy?=
 =?utf-8?B?QkhjbktBNkdJTzljU3dJeWxjcStzdm55c01rQW1aRmZWYlloc3V3YjM5NkZ2?=
 =?utf-8?B?N0tCaHF0OVJSS0hvQ3ZqS1lIYUZHRGVLSFJlb1hiTTJhTFgyWU9CSm9CUnZH?=
 =?utf-8?B?cDhZMWVQUXkrbllaS2pGYTBHL0Nqa2hmRUh4cW9aK0JMUkEyTFZGZUovckRq?=
 =?utf-8?B?cWJ5bmVXbXhQMW42enh1YnVKaXhBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fde898f-9986-4365-eb6b-08d9f61754e7
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5810.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 15:23:52.2238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TWKds0/jQW3Stww3stssW1nKyUTdoHPS+dYf97MwGtjeaJTOypErUcgFR0sDmA8/xtYenMoyIAt+zMxfi5LEwFkF6yT7UbJyU/yb/BeA5/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3982
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2/21/2022 9:07 PM, Mario Limonciello wrote:
> commit 59348401ebed ("platform/x86: amd-pmc: Add special handling for
> timer based S0i3 wakeup") adds support for using another platform timer
> in lieu of the RTC which doesn't work properly on some systems. This path
> was validated and worked well before submission. During the 5.16-rc1 merge
> window other patches were merged that caused this to stop working properly.
>
> When this feature was used with 5.16-rc1 or later some OEM laptops with the
> matching firmware requirements from that commit would shutdown instead of
> program a timer based wakeup.
>
> This was bisected to commit 8d89835b0467 ("PM: suspend: Do not pause
> cpuidle in the suspend-to-idle path").  This wasn't supposed to cause any
> negative impacts and also tested well on both Intel and ARM platforms.
> However this changed the semantics of when CPUs are allowed to be in the
> deepest state. For the AMD systems in question it appears this causes a
> firmware crash for timer based wakeup.
>
> It's hypothesized to be caused by the `amd-pmc` driver sending `OS_HINT`
> and all the CPUs going into a deep state while the timer is still being
> programmed. It's likely a firmware bug, but to avoid it don't allow setting
> CPUs into the deepest state while using CZN timer wakeup path.
>
> If later it's discovered that this also occurs from "regular" suspends
> without a timer as well or on other silicon, this may be later expanded to
> run in the suspend path for more scenarios.
>
> Suggested-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Link: https://lore.kernel.org/linux-acpi/BL1PR12MB51570F5BD05980A0DCA1F3F4E23A9@BL1PR12MB5157.namprd12.prod.outlook.com/T/#mee35f39c41a04b624700ab2621c795367f19c90e
> Fixes: 8d89835b0467 ("PM: suspend: Do not pause cpuidle in the suspend-to-idle path")
> Fixes: 23f62d7ab25b ("PM: sleep: Pause cpuidle later and resume it earlier during system transitions")
> Fixes: 59348401ebed ("platform/x86: amd-pmc: Add special handling for timer based S0i3 wakeup"
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

I've sent my comments in this thread:

https://lore.kernel.org/linux-acpi/CAJZ5v0gCb9=W7tCtrk4gZJ+p8K7XvEaeUPZUD1c9Kgnn-u2yRg@mail.gmail.com/


> ---
>   drivers/platform/x86/amd-pmc.c | 43 +++++++++++++++++++++++++++-------
>   1 file changed, 34 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index 4c72ba68b315..1615a3bb9a0b 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -21,6 +21,7 @@
>   #include <linux/module.h>
>   #include <linux/pci.h>
>   #include <linux/platform_device.h>
> +#include <linux/pm_qos.h>
>   #include <linux/rtc.h>
>   #include <linux/suspend.h>
>   #include <linux/seq_file.h>
> @@ -131,6 +132,7 @@ struct amd_pmc_dev {
>   	struct device *dev;
>   	struct pci_dev *rdev;
>   	struct mutex lock; /* generic mutex lock */
> +	struct pm_qos_request amd_pmc_pm_qos_req;
>   #if IS_ENABLED(CONFIG_DEBUG_FS)
>   	struct dentry *dbgfs_dir;
>   #endif /* CONFIG_DEBUG_FS */
> @@ -521,6 +523,14 @@ static int amd_pmc_verify_czn_rtc(struct amd_pmc_dev *pdev, u32 *arg)
>   	rc = rtc_alarm_irq_enable(rtc_device, 0);
>   	dev_dbg(pdev->dev, "wakeup timer programmed for %lld seconds\n", duration);
>   
> +	/*
> +	 * Prevent CPUs from getting into idle states while running the code
> +	 * below which is generally safe to run when none of the CPUs are in
> +	 * idle states.
> +	 */
> +	cpu_latency_qos_update_request(&pdev->amd_pmc_pm_qos_req, 0);
> +	wake_up_all_idle_cpus();
> +
>   	return rc;
>   }
>   
> @@ -538,24 +548,31 @@ static int __maybe_unused amd_pmc_suspend(struct device *dev)
>   	/* Activate CZN specific RTC functionality */
>   	if (pdev->cpu_id == AMD_CPU_ID_CZN) {
>   		rc = amd_pmc_verify_czn_rtc(pdev, &arg);
> -		if (rc < 0)
> -			return rc;
> +		if (rc)
> +			goto fail;
>   	}
>   
>   	/* Dump the IdleMask before we send hint to SMU */
>   	amd_pmc_idlemask_read(pdev, dev, NULL);
>   	msg = amd_pmc_get_os_hint(pdev);
>   	rc = amd_pmc_send_cmd(pdev, arg, NULL, msg, 0);
> -	if (rc)
> +	if (rc) {
>   		dev_err(pdev->dev, "suspend failed\n");
> +		goto fail;
> +	}
>   
>   	if (enable_stb)
>   		rc = amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF);
> -	if (rc)	{
> +	if (rc) {
>   		dev_err(pdev->dev, "error writing to STB\n");
> -		return rc;
> +		goto fail;
>   	}
>   
> +	return 0;
> +fail:
> +	if (pdev->cpu_id == AMD_CPU_ID_CZN)
> +		cpu_latency_qos_update_request(&pdev->amd_pmc_pm_qos_req,
> +						PM_QOS_DEFAULT_VALUE);
>   	return rc;
>   }
>   
> @@ -565,6 +582,15 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
>   	int rc;
>   	u8 msg;
>   
> +	/*
> +	 * Prevent CPUs from getting into idle states while running the code
> +	 * below which is generally safe to run when none of the CPUs are in
> +	 * idle states.
> +	 */
> +	if (pdev->cpu_id == AMD_CPU_ID_CZN)
> +		cpu_latency_qos_update_request(&pdev->amd_pmc_pm_qos_req,
> +						PM_QOS_DEFAULT_VALUE);
> +
>   	msg = amd_pmc_get_os_hint(pdev);
>   	rc = amd_pmc_send_cmd(pdev, 0, NULL, msg, 0);
>   	if (rc)
> @@ -579,12 +605,10 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
>   	/* Write data incremented by 1 to distinguish in stb_read */
>   	if (enable_stb)
>   		rc = amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF + 1);
> -	if (rc)	{
> +	if (rc)
>   		dev_err(pdev->dev, "error writing to STB\n");
> -		return rc;
> -	}
>   
> -	return 0;
> +	return rc;
>   }
>   
>   static const struct dev_pm_ops amd_pmc_pm_ops = {
> @@ -722,6 +746,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
>   	amd_pmc_get_smu_version(dev);
>   	platform_set_drvdata(pdev, dev);
>   	amd_pmc_dbgfs_register(dev);
> +	cpu_latency_qos_add_request(&dev->amd_pmc_pm_qos_req, PM_QOS_DEFAULT_VALUE);
>   	return 0;
>   
>   err_pci_dev_put:


