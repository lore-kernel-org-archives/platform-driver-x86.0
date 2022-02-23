Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0957DC433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Feb 2022 17:18:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232500AbiBWRTN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Feb 2022 12:19:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243360AbiBWRTL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Feb 2022 12:19:11 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 840A543484
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Feb 2022 09:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645636723; x=1677172723;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3B8HHFtgcHdGpBY02veBzCBZvpiagi8P/nUBuYMNRB8=;
  b=GnEKGWsF81tZMlEM6U8KY/ruezLmJ9VB+xBI6TX2i6cyjsQ8r5hg6dYa
   kXhLlzds41aOUMNZu2JEKa5tVDKZhMWVloCaaKdexLmOLtHGO68sgt8EV
   Zk3QUjy18Hwk+XaRWDDQKhT1wrxsbH7zQcRq/TnhZALYBm1Uba0xKHtwQ
   J4s26juPbJtSrt9EnevaTWCaUa1ld8zNDTUsr1+o1Hdg/iS3HKCxsmGob
   GYDmtJFBy4eVkYYfpvi5nYh4A20MTBPwDo/p+qL2C0ePojM2T5MBFh5+D
   J7JUT8yl4RmjSqOVXuAkQp6lrwBOOxFkThezw+vEiJIMw60ItVc+VKnOh
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="252223023"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="252223023"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 09:15:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="548349855"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
  by orsmga008.jf.intel.com with ESMTP; 23 Feb 2022 09:15:24 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 23 Feb 2022 09:15:24 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 23 Feb 2022 09:15:24 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Wed, 23 Feb 2022 09:15:24 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 23 Feb 2022 09:15:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NxX15QlnlYxAedF9t12L6Jo+IJlBCcCqhpEw4KFIkfabmDRumOWie3fkF9UNJaaQlWkP8Myoi/7B/h9dADRsAUGuKs7VFJgVoWiPbvGOmDB7jsH/JSN6WZqRK+bv+6c2bEnY4IdQTh6xdo0pQKIFieqjU2jTvD7pizDx7fh+XozfuiPUZQW5JIjKq+7BviST8tZERCmQubk4tjyKcWHHpvIWc/XTBx7MBQ7LW8TsZvmJa2Zwd+BdnRXnxPARzuLVuJSiqYrHUJY7qSrlP3pdvIiygrBoriZCsLFFkVwxzOm0ShdyU9CHbffWpUtAzbRg1lS1Tqz2ndWAMavCb/xU+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+WKb/2t9a/dy1h5UAUP6WCOanLw6C7cYwsNdeagYJRY=;
 b=CUAQ8kmZBRjRDil5eDE5gOWozxUucKIZnIQ+JpUiW/vPa5nRXs45UJBGckaAzdUtXEHGh9hXYy34850jIKpSbpl7zASCSbCeSABz7ATQOMIhgA+aR8C1qzrXTw7RGVrSM4xGJpgiHRY4UtmLWGxRxi5d6Jr6wfZmG13MFrkzImWt91ZGY+wePb7l3/2sfh6lR6qL9oCFdYkB7CiEg3FVytWHAbWuS8aO1dRPU+RPt1cq4Z351727ajjcknxOIf5dUVZkyfFvm50GQ3VcxS1z2O8cyEVdHr2cIEEiukjB+cJ4lMnd57hCxf78Eehc9Z+A3fknh7UAfdKcY6ccDoL7pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW5PR11MB5810.namprd11.prod.outlook.com (2603:10b6:303:192::22)
 by DM5PR11MB1977.namprd11.prod.outlook.com (2603:10b6:3:108::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Wed, 23 Feb
 2022 17:15:22 +0000
Received: from MW5PR11MB5810.namprd11.prod.outlook.com
 ([fe80::98d9:1e0f:c183:717e]) by MW5PR11MB5810.namprd11.prod.outlook.com
 ([fe80::98d9:1e0f:c183:717e%4]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 17:15:22 +0000
Message-ID: <072deddb-e477-e457-b2eb-ed3a2e0ea2cf@intel.com>
Date:   Wed, 23 Feb 2022 18:15:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH v2] platform/x86: amd-pmc: Set QOS during suspend on CZN
 w/ timer wakeup
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
CC:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Goswami Sanket <Sanket.Goswami@amd.com>
References: <20220222205926.25779-1-mario.limonciello@amd.com>
From:   "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Organization: Intel Technology Poland Sp. z o. o., KRS 101882, ul. Slowackiego
 173, 80-298 Gdansk
In-Reply-To: <20220222205926.25779-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::16) To MW5PR11MB5810.namprd11.prod.outlook.com
 (2603:10b6:303:192::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09968d92-7bb6-4da7-31cc-08d9f6f012b0
X-MS-TrafficTypeDiagnostic: DM5PR11MB1977:EE_
X-Microsoft-Antispam-PRVS: <DM5PR11MB1977B7C3786440D1A5E3B932CB3C9@DM5PR11MB1977.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HDRlU9BwsDtIMxDFLhaJRSgvH6RskVJDnxlEttRHVP4FwrnWuf+Awx7Fg4jL+Pb0/ibCNMEDXlHWJtYup1VvrJE9RL8Lq1GgM2vUr0CYy3lnHZvelNLp/G7b17UJEXn3TfPfFkstT3lENgvwgLcZ7GXewA41Rzq3phBgwCrhVktEkeo7KJ+9avSS4701S35uUDsSwpV/V1cdmQBqYEpaIHKNeC/TN1+lAJF7yVWBidYvJi/RlirufH0UmE62ML5GExbIVKiWAr4O0kGKiTOc64egv2nqRf49gmbuOoVpWci6B2xxQ+aYWQ2tE2xqoB/kz5m/vcsrHxEEZfNNjoMdradJxyN/xx7JF+DUcpapHfbg37Y3dN0d0NIu+t3HviRnAwxBfxO3qLq86iY9qaH16wPNiXjo2NspXAIK7Kn4URZ8FMxeb1wkPHtONBQdXrdTbTmCIq2zQE+FhU+ZH4b7wwfrsv0FNaNyVvZgFu6SHcfpWQcYIBdlYoEd7M7u4qzG542Op+zSmWdPr5qyR+cVimk+y26kknNvt3W+JMqWR87mPNn5E1gJiEIcGLrOP9fuF5AoN4k8qH94H2EmdwgUjQ75Neo9FuXNv2ywYbaOuh7SPqZJyCN+4qBCQG6xP37F2sLP6k+EQ0vrfrNQNhamE6z4NSPvu16SNRvBkvbsv+qbNYBbUO8i6RamkJbWvzrfGeDvHnLoBPHNrc1S1JRgQ+GC5AP60l6dkvv/hVuugiVpDOop0kB9F8G2CfqPndqWTP/To3mjqKqphxsRCMECAGJGUBRNqR90HoRF0Q+GkYc+gSNLejTaF40hO9rZ4EK2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5810.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(6666004)(53546011)(36916002)(508600001)(38100700002)(316002)(8936002)(31686004)(2906002)(6506007)(54906003)(110136005)(6486002)(966005)(31696002)(86362001)(45080400002)(8676002)(4326008)(82960400001)(66476007)(186003)(66946007)(26005)(2616005)(36756003)(66556008)(6512007)(15650500001)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDBuQzhmV2lkMGNHNFNhR1dvby83S00xaFRFa2hrc1BOQ0lBR0VIN1VZNFg1?=
 =?utf-8?B?VmZYdVp3MFpnL0ZKVjY2am5kTVRwZnNCcXhOMlcwd21YTWpaVDRhQk9YWUcr?=
 =?utf-8?B?czFOamgxK0F4RXJKQS9wdTcrb2hZNjRXaXp3b1RTd3JJcVZFaS93RnNSYitP?=
 =?utf-8?B?dTlsZ3h0ZmZrOGhpZDBDVjdhcWRtV3BLNmV3bU9RLzRTbm1VT0RidHZDOVFY?=
 =?utf-8?B?cHBENUduS0ZnTGFUV1FudzVnTGhyY2M2dTgzaEp4R1BRckhuZzczSFpFbVRl?=
 =?utf-8?B?NGZ0eUtqSE5heU1NQjNuanN1Y3A0S01hR3dqRG5VOEVFMDdITGZyUmV6T1Zo?=
 =?utf-8?B?R1lGcUhQcWIxaStYOE9uTUEvOEprUk9GRFBOWFBIQ2lSZ3BLeWhROW9KbHpC?=
 =?utf-8?B?UzhwTkVUaDBZb0dUaUVTYm9NYURzaXBuWFBUM1crVGJiNnRRb0lRNmJJVUpG?=
 =?utf-8?B?alpzVTJidmRXNmVIY3pIRkdNOFpiNXkrc296VHh4Ukh2cGpzUzZRdVdVR2JL?=
 =?utf-8?B?WjhVU3hHa09NeW4rbXFTV0QzZ2o0VFUxNGJ0dlhsM29LMjZZUjJkdDVkeGhV?=
 =?utf-8?B?Q3ZIUDFhUmJ1MmVpRDFqSno3Z3hhdVNYZlJybXNrdnM3LzcyZ2tLY05rNkxN?=
 =?utf-8?B?Z1FqaWtoYnJFS0pXQ3NwVHd1ZVRLN1RlTzF0OEpFN1IwSHVSYWY3ZkRUSGha?=
 =?utf-8?B?djdQYUUzZUpZUnNUL0xWdThySUVla2ZmRWtVY0FYMFBELzk2VGUrdndpdWNC?=
 =?utf-8?B?VFc0NzE5RDMvbFhURnJqcUxJRW1Rd2xQOXNmVWdqYXF5NjZ2TEN5NmpCV2lM?=
 =?utf-8?B?WXg1dUZIckVPTUwwemU0cm05QmpUMTR2ZHp4VUpCSDdzVENhSkhIbkwrY1RO?=
 =?utf-8?B?eTFBaTdkQWRHajg1TEhSa1RSY0trMXZ4UkUwdS8wUEQrZ2llQ0wvYlVCaXBO?=
 =?utf-8?B?Yjd6ZytsTmJXSXRyMkxpd2tkUy8yaGkvUDBsaGV3NlROOHVQOTNidlU1Y0h6?=
 =?utf-8?B?Z0QraUtIb05NWHRkMGNlOGYzRDFKRXJkKzY2QitkNzBENGQ2R2NpZEhjNXhm?=
 =?utf-8?B?RkZUUWFRV1czNU84UlVodHBJOXZ0dTRJS3dLTnFqQnlQcjlkQWFQYnpwYmUy?=
 =?utf-8?B?VGdDNE1jUjNPVEF2SUMxbE1jcm1zdnFvb082R3pMcE5QRE5PNDg1V20xdm5Z?=
 =?utf-8?B?T3kzQ2xVNnA1ZXM5dG5FZTFiTXpJQmVuUWdYSmQxVURDL28xOVo0ZmlnOWEv?=
 =?utf-8?B?ZDJkN1NiWXBMbllJaWtiYmRpZVZXdk1sMGNobFZkTjVkK1RVVkZXbzR5aTlL?=
 =?utf-8?B?UVBIY0pab1pULzBNZ0pJMHBPSlY5UVFYOVo2QldZelRORVV0OVBabFEwZnI1?=
 =?utf-8?B?L1RIQW1UUVhYaHJ3RXgrU2JTdFExQ01LcytRVklHTXgvMEp5MllxNWNpL1Rh?=
 =?utf-8?B?TGRJNUFMMXNyV3hhZS9tTkkvSWZYSy96SnJZSU9xNkJVOW1FT05UN3FlRnFU?=
 =?utf-8?B?ZmlXRHBNQVNraUlJb1dzYURrWFBIQ3JMMk5pQVZTY1F1UVg2MWZ5TElMU3d2?=
 =?utf-8?B?T0grUkpPMWpsTUt6c1c0R2tSU1A4dkFrdXFmVmxSVnZWSWVRYkQzdi9JZVdE?=
 =?utf-8?B?bko2V1VLOEdFQ0NCZkdubG9WZm1QTGNHRGhielB0L3BHTmt4bEJmZzdxdi9y?=
 =?utf-8?B?N1pWcUd5YitYMUdrTDBORk5kdVZMVkRXM3FqWkpUVlQxUDdqRGtMNW80RURD?=
 =?utf-8?B?SkFPUUNjZUdXbDJlR2wza3ZDSjNsQldsS1c0MTI0ZnVLVENUbEhreDZJbFBO?=
 =?utf-8?B?bXBnNWRJM0tDaEhrL3pNZ0FoZjYvUDA2MFY4UTk3aEluS3lXeTI1NEJQSzIv?=
 =?utf-8?B?WXBuemp0bEdWQ24zL2FHMW5BVjB3MVNFTWpIKzhTTmNLT3RwMHh4cm5UWmtM?=
 =?utf-8?B?VHdHM0pZcUY0NllJUlR2cms5NnYyQk5YUE1DRVRWTzEvRUZTUXhYWHhEQWpW?=
 =?utf-8?B?K2N2eHpQMDB6NDdLTTBUM1dRUnJmT0JTaVoxelZ2VzFhK0FTcjJLaWREcmNr?=
 =?utf-8?B?cWxrTStqNlpqM0lpTGplaVZqampxcklZYThWYmR4ajVyWmNpbCtSSU93OXBl?=
 =?utf-8?B?YjZyeEdPVk1QN243dFo5SkdUdGRRZHR2azF2S0gwVzNncWtFZFYrMXVCc29N?=
 =?utf-8?B?R2lnNWgxdUpSK2dhMFJsSDk1QmZBSjRXSFRGanFWZGFLQjFucjVqVnRNUCth?=
 =?utf-8?B?RnFONGY3RkhORTlsMTRpTm96bThnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09968d92-7bb6-4da7-31cc-08d9f6f012b0
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5810.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 17:15:21.9974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PgHVKdkmyZT8b4g8bFGboWYwudypm0/DoNJn5xRh7IhDqt0+RxNb34hzRUR8OcW3d7mHYd/vWEekV++mwmPgdoFjKwAO23gKmcmGJ1A1fcM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1977
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2/22/2022 9:59 PM, Mario Limonciello wrote:
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
> ---
> Changes from v1->v2:
>   * Update for Rafael's suggested changes:
>     - fix resume comment
>     - undo QoS at end of resume instead
>     - Use smaller number for QoS to allow C1 entry
>
>   drivers/platform/x86/amd-pmc.c | 39 ++++++++++++++++++++++++++--------
>   1 file changed, 30 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index 4c72ba68b315..248dc6735f5a 100644
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

This should be "into deep idle states" now.


> +	 * below which is generally safe to run when none of the CPUs are in
> +	 * idle states.
> +	 */
> +	cpu_latency_qos_update_request(&pdev->amd_pmc_pm_qos_req, 3);

And I would define a symbol for the 3, possibly with a comment 
documenting it.  Something like AMD_PMC_SUSPEND_MAX_IDLE_STATE_LATENCY 
or similar.

With the above addressed, please feel free to add

Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

to this patch.

And thanks for taking care of this!


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
> @@ -579,12 +596,15 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
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
> +	/* Restore the QoS request back to defaults if it was set */
> +	if (pdev->cpu_id == AMD_CPU_ID_CZN)
> +		cpu_latency_qos_update_request(&pdev->amd_pmc_pm_qos_req,
> +						PM_QOS_DEFAULT_VALUE);
> +
> +	return rc;
>   }
>   
>   static const struct dev_pm_ops amd_pmc_pm_ops = {
> @@ -722,6 +742,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
>   	amd_pmc_get_smu_version(dev);
>   	platform_set_drvdata(pdev, dev);
>   	amd_pmc_dbgfs_register(dev);
> +	cpu_latency_qos_add_request(&dev->amd_pmc_pm_qos_req, PM_QOS_DEFAULT_VALUE);
>   	return 0;
>   
>   err_pci_dev_put:


