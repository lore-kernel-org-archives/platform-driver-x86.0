Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 799C2C19F2C
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Aug 2022 10:29:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbiHAK3T (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 1 Aug 2022 06:29:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbiHAK3R (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Aug 2022 06:29:17 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99B4A19C10
        for <platform-driver-x86@vger.kernel.org>; Mon,  1 Aug 2022 03:29:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JFeeYSJcLFIeD5y6Dube+WKGW8WQ9b5+TcVoYKyloWjSL33dH1e7F//nWE+G/Iag4b2ZPP2gUfQQCKPdxKh2c8fmSaZYXAMtHysq+BIHqvxXSQyZMhp3KUnyu1A2IM81id0Kav7GH5TE8KfU/RYqYXp3+Pv+IbmKj3RqT/kjzoBw2ZhPtSbpPl8qTc6IOdwhm2+D8FM74txc5LFoY7eBvK8F9yhlqMojwdQuD8PFfuowOXF6pLsQUDAdRiqVA5dAZrm/LA1zmrs7bIekjqtzCTQMO1++bwh2q3qy6/TmxAMI/31cVVNHHXzRJ7E1UCxPhbwaUD9A8IGTkxtfDJaIBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4jULz2idpp+QXQJPbFYchceYucMhH+fhO6lIQOLivY=;
 b=U3ZfLwgxz00c4mukAgj72uDkQcW4JWSecXnt86feHtnieJ+OqC3MNDY1ADXD8oqWFST2/iLtp8na2CNEg+rPrF8j2FRfPKfIzfSTVkyOYPHuhv7SkcBb1XcTeYQrTyCXLzl3bc91K5ODk3Allj+uyDKcATn/wK80ltdhS7dpCmeEV4qW51vpNzZcdVUbfp7AKlvrOzsqRlkq0hyuqfSW2S29y2UmwkgJpwlOLbqEKXRY6+N5dXCCliNNBQyY2u2SyA8q8GpUJRza4gHj+3q6qhdhSPZQCKIn4sih8/kEbWUn3KKwnmYNRBdQ+mKNPAYdSyP5CkqyJfi1Lu2YfuBM1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P4jULz2idpp+QXQJPbFYchceYucMhH+fhO6lIQOLivY=;
 b=BH0q6HsPqhMSn8gFOF1KW+Zrzsi2EsnVgr9nzQAnmCML4QK1VGS8OlSk5jV+zrjQ5wwPV7eXz6XNK8v7u5Fa7AwB0dp94vT1EHGgB92VQVUlun0NquRIRdFRSfL2Hahh2s1qsuxpEVrPVOrLkQBj5+yJKUI3n6qwLj39GEFdcUA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MN2PR12MB4454.namprd12.prod.outlook.com (2603:10b6:208:26c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Mon, 1 Aug
 2022 10:29:14 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::6947:34fa:6a20:3e20]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::6947:34fa:6a20:3e20%9]) with mapi id 15.20.5482.016; Mon, 1 Aug 2022
 10:29:14 +0000
Message-ID: <29f5a1de-d8dd-36b5-8ba9-bda5686a3304@amd.com>
Date:   Mon, 1 Aug 2022 15:59:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v1 13/15] platform/x86/amd/pmf: Handle AMT and CQL events
 for Auto mode
To:     Hans de Goede <hdegoede@redhat.com>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
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
 <fbc06d40-f466-d971-d60e-0a9e0b8f7580@amd.com>
 <b75f24fc-3ac4-35b0-3df6-870f4151dc43@redhat.com>
 <bab60716-a19c-ffaf-81f5-d26bc8f2f6f3@amd.com>
 <194be06e-5831-eb0e-5018-61f1cfcf9912@amd.com>
 <79264f93-dd2c-e54e-7d77-b91193307841@redhat.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <79264f93-dd2c-e54e-7d77-b91193307841@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0088.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::33) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5564188-85d8-4870-9ea4-08da73a8ae21
X-MS-TrafficTypeDiagnostic: MN2PR12MB4454:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mNWdHliSWdyC/wMEHdCNCJBNadiB2Wsj42+f8We7Pjh4gvfqbZwtgmmMDmkkhJdsyNBCudOmgVsoTIzEooRjf6FXDEyijkrqFYpv3fgBtkkIn+Gad+SLEQy+tzF6AbbE5WJt8S3a6wPni4nHFzvUrRJ3/hj/QdBUJMVYV4NtR9NTU3CwEBx1VymfhfAoFDfiDu5nC481vswwIZzCai7ipd5aM9RLHQeaJURll/nOcS2z1YrNGvRZG7ScvuBAZQyaD3NK6pqwXfuohcsZJUNYLJpkJaSyoxlPXdxis8efrgk9Q6PvRwSuyiL/JoFaQDPB5XW5T1z9AjhPsJBXC1B6LthFdIfYSbajGAZNszGMSCgeSjwOZYFK5GYPux3jrU06ve5aNYKVAdyw5wDdsbSw34vF5ajMwYpYAHcbfTlTnRdl95c08c3WZn6MFf30fmZPDh3ODH8KJ71aRCWjacpiZ6quSzf5caFa//5BGkRUMrAo6GqeBb1zGgqvF7Gu6uwYIKSBHBLRGh8GWQMjw3GCLYPzl6JP8hjOu4NJqV3BgePVgFJokJUdS1Boqw5huaZtWwKCz37zx4/RCxARkoBnhgci8Xl/zS+HDRDgBdTiI3NbnjLOFtIhDw7vdAItoJOJd2dXAFV1PrAbzzttJH3/ZppEDCq93tgDjxzxPPLOETKSkFmWRoc5O3BPKec7yifWqtjRkFWAblTmjlqT/MbyD4S/g5hthRJ68RMHmTKQI0I4tEXGvUiCMyoyFD5ZElsJlIl986rrT/BgiCXE9WsBpcQli6uGjYkCZU2p8cHo7YiwgpMJuUvi7ED9q82I7XdsoZmpVbxwrn6QaYfzuB8G+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(376002)(39860400002)(366004)(346002)(6512007)(2616005)(26005)(8676002)(66476007)(66556008)(83380400001)(66946007)(8936002)(316002)(4326008)(41300700001)(110136005)(5660300002)(86362001)(31696002)(186003)(478600001)(6486002)(31686004)(6666004)(2906002)(38100700002)(53546011)(36756003)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1QybmJ0bWdaS25YYmt1STlOMEZwbzdWOWErSEpHaWRDWVhwYnVMbXF3U3Zr?=
 =?utf-8?B?bjNiS2N5aUFlTDIyYkhoR0ZNcTJrVlJzbjVMb04xQTA3d3BDc0dkaHU4Rnh5?=
 =?utf-8?B?TXZuUVVacDlJdDJ2bUVsemhBQysvUS9kSEVjQllzMDFoSUtWVVFnT2lQZFZ5?=
 =?utf-8?B?Y2FEbkNHY0haS3hxS1UyVmUxNTlKVEZRV3dMRHdpQ3g0aXpqTUNyaHFwNmRt?=
 =?utf-8?B?c0lsVFVkQmxvY1B2dXQzQzRDTDgwOVhPalhnL3R3eHc2M05pWmVVUTRtTzBj?=
 =?utf-8?B?LzhTZlBETURMZnFXaVBweS9Ybm1lUzc0NThQQURkejlrTmJQdElsNUhnaS8z?=
 =?utf-8?B?a205VnZvbnFwazBRVWlJK2sraE9hWG1SWnFiamFyWjUzWmVCTTVUQnU0TEhJ?=
 =?utf-8?B?amtKRUZLVWJzOXg2R1N4d1JUaEpOMnk1OEt0Z1ZBTTNCSGNhdS9lYWE0RVhj?=
 =?utf-8?B?WlpHbjNnSTJuV29nVEFZUGNyYjVJNDltaVpjYVpxQnBRQkpFdFNwbHYyNDNM?=
 =?utf-8?B?Q2hGOUR5K1pyaWoyZTZIZEtQYytmcGNOZkNXbVhCeXZIWllBa25ZeHBMRUtM?=
 =?utf-8?B?U2ttbjFRTUgvNTdodlY2cXdFY1IzQW0zbGJSV2Y5YXZWYnFDSlpiMS9ra2o4?=
 =?utf-8?B?RWl5TE1xRmJER00rdEE1Znc5WDVmbE1RQmJuakRYWk1GSGh1VDhPaDhBa3ZT?=
 =?utf-8?B?elF4WGNlVERySlBiQzdmeng5NlRQOW5ZeHE1NjBVSGFwMkpYZU0wV1poRVZV?=
 =?utf-8?B?T0lUbGZmUzQ2VDUrM3E0ZVVxMWNaQTFFa2U4WCtWVjYxcjI2UTMxM0o2ZWQr?=
 =?utf-8?B?Z3JXQ0F5emxMN1NsMzlnNVFNQUxBWXo4TDZnOW5Td2xTd3dTMXZ2cTB0WWo4?=
 =?utf-8?B?SmJyaFZaei9NZnZmK0krRlo2Nk5iWXZRZmFVSitCaVU1c0VUM2hVbFlaa1dC?=
 =?utf-8?B?RlNMakhRNkdpOHNXd0pBc0FKNytCcGtnVDJPZ0lUNUJEWmhEQVhqbVlMTjJB?=
 =?utf-8?B?a2RxdEs1bDR1QnhPRng5QWlCendtdHlzcW04S2Vsd3FrU0RKT01KY1ZINkJi?=
 =?utf-8?B?Y2xDQm1ldWJtcEVnNVRVN3VvNEpkQnlpL2lnNE13SE5SUTdqTmdCWDRkeEEx?=
 =?utf-8?B?K0F5UktkR2s5MUlmTTJPQW0veXhnWk1uaFdWOVlzMGJoVGJFa2FDNHIvaUpu?=
 =?utf-8?B?Uzh3Mm5DVmg4MDN5bGNnZ1ZDaTcyOGozMEVYcFVqYjhocGZBTkliUlRjQmU2?=
 =?utf-8?B?cmJXeGdhYnpaZFRMaEMxdVROUzNVbU9KRUtJOTV3SmZEblhwbmtyQWR4bTBC?=
 =?utf-8?B?bEhkQmZWeThqTkZGL3pmMHdRUmpSV212OFhQK005NEo0ZzYyb0dtR1JiY2hM?=
 =?utf-8?B?MlM3RXljY2RyQzEvaG9zUFNZVGdQaUhnOTZEOWpJQjROREM5WUpKNnM1MXdV?=
 =?utf-8?B?QUhGU2ZVOFdQV1RiT0tGU0swWmZ1QnFNR2VpbzZtNkZpa3VXY0JwVnEwVjRO?=
 =?utf-8?B?dW1yQTNCYmxYZTJ2OEhEVlBWaE5VdWVaai9qK1NYc01YaTVNc3F4V0FBVi9p?=
 =?utf-8?B?ZzNoS2lSKzdRRTAyWG4vMnVBK25DSXZEM1d0RExBQ3R5RThhY2RZdFF5Ympu?=
 =?utf-8?B?VHZsVjFZRXpNM0g3TzlRV2ljRk5vUER2VDBFWVBFTHN1MGFCQ1JWNW53T2lv?=
 =?utf-8?B?SnRXazN5QXRMWU8xc0tQeHMwdDRTbk5uVzhMazNwVlJTWDA3VFpsVUdpWmlV?=
 =?utf-8?B?NHZSa3VGL00rVlZlNElHZzdNNmpmazVLUllzTUVUTG00cG1iWkVRUklkM3Uw?=
 =?utf-8?B?UXpRVW1YT3RhcDhwTjhrYklhSU5uTE1SQXVmUUhWaDAzU0VPaGd5OVp6clBT?=
 =?utf-8?B?Q2VyVm1ZTWIvbE90Rmk4YzdLMUNLc3gwejU5VHRqQWZTTWt5NXptNTNUbUhk?=
 =?utf-8?B?RVQ2NEdhT0I5a1hydkhCbTBVRnRCZnFqVkZWM04xM3hOelc1WmxqM1Q0cDg5?=
 =?utf-8?B?UTRTeVhPdHBjYUpFTVF1cVVRdDJiSzNERGRMMUNVZ2lnY3NBNmw0dGlsUVha?=
 =?utf-8?B?RmtKTkVUa2llbWdheTExZkRnbEdhUU93bnU2YTRCa0RMNnJZTFlncmxQODk0?=
 =?utf-8?Q?Io7621y3MenYiC6xgkoF519V6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5564188-85d8-4870-9ea4-08da73a8ae21
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2022 10:29:14.2766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zd9j0sUtYa85lKUVJrCpWDBAuqwI1qirLMm3uPYODaGoy/dma0KZ4Ww7UCCAsl+5CB5P53GpN22dhwELw+6/VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4454
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

On 7/29/2022 11:29 PM, Hans de Goede wrote:
> Hi,
> 
> On 7/29/22 19:40, Shyam Sundar S K wrote:
>> Hi Mario,
>>
>> On 7/29/2022 9:13 PM, Limonciello, Mario wrote:
>>> On 7/29/2022 06:03, Hans de Goede wrote:
>>>>>>
>>>>>> So as for the AMT mode, since that is Lenovo only, I guess that means
>>>>>> that there is no need to do call amd_pmf_update_slider() when AMT
>>>>>> is being disabled since at this point the firmware will have
>>>>>> already set the values.
>>>>>
>>>>> Yeah, Shyam made this modification for v2 to make sure that code path
>>>>> isn't called unless static slider was set in the BIOS.
>>>>
>>>> But this code path is only hit when AMT / auto mode is available and
>>>> when that is true then the static slider should never be set in the BIOS
>>>> so the whole amd_pmf_update_slider() call on AMT disable can simply
>>>> be dropped AFAICT.
>>>
>>> The reason to leave it in place but guarded like this is for validation
>>> of the feature behaves properly from AMD internal systems AMD test BIOS.
>>>  It can be used to prove out something works properly without needing to
>>> include extra drivers and software.
>>
>> Yes. We will need this path to check on the internal CRB system to
>> validate the 'auto mode'. Whenever the amd-pmf driver gets the AMT
>> disable event we shall disable the power-settings w.r.t to 'auto mode'.
>>
>> I moved the handling to amd_pmf_reset_amt() based on Hans review
>> remarks, and its guarded with a if() check, so that we accidentally
>> don't land up in updating the static slider.
>>
>> Also left a note on the same function, so that it provides some
>> information on why the logic is being done in that way.
>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>> Actually this seems to mean that we must ensure that the AMD-PMF
>>>>>> code stops touching these settings as soon as the event is received.
>>>>>>
>>>>>> Which would imply killing the periodic work when an AMT off event
>>>>>> is received from within the event handling and then restating it
>>>>>> when AMT is on (and making sure the work being queued or not state
>>>>>> matches the AMT on/off state at driver probe time) ?
>>>>>>
>>>>>
>>>>> At first glance this seems plausible, but actually I think it should
>>>>> stay as is because CQL thermals can be set at any time (that's like a
>>>>> lap mode sensor event from thinkpad_acpi).  Even when AMT is turned
>>>>> off, you may want the CQL thermal profile set accordingly.
>>>>
>>>> So the CQL code is to handle lapmode when AMT is active. But I would
>>>> expect the firmware to update the power-limits, etc. for lapmode itself
>>>> when in performance mode. >
>>>> The amd_pmf_update_2_cql() function only does things when
>>>> config_store.current_mode == AUTO_PERFORMANCE (or
>>>> AUTO_PERFORMANCE_ON_LAP)
>>>>
>>>> And that reflects the last mode selected by the auto/AMT mode code, not
>>>> the mode actual set by thinkpad_acpi so if the last auto selected mode
>>>> was balanced and then AMT gets disabled because thinkpad_acpi switches
>>>> to performance mode, then on CQL events after the switch
>>>> amd_pmf_update_2_cql()
>>>> will not do anything.
>>>>
>>>> To me it seems that when AMT is off the AMD-PMF code should not touch
>>>> the power-limits, etc. at all and thus it should also always ignore
>>>> CQL events when AMT is off.
>>>>
>>>> This assumes that the firmware takes care of udating the limits for
>>>> on lap / off lap when thinkpad_acpi's profile is set to performance.
>>>
>>> Where does this assumption come from?  I guess that's how it's done on
>>> Lenovo's Intel systems?
>>>
>>> AMT and CQL is a new feature on Lenovo AMD systems, this is the way that
>>> it's supposed to be done here.
>>
>> Yes, this was newly designed for Lenovo AMD systems. The behavior is
>> same on windows too (atleast on the RMB laptops today) .
>>
>> When the system is running in 'auto-mode performance' and the user keeps
>> the system on his lap, amd-pmf driver receives a 'CQL' event from Lenovo
>> BIOS. In this case, the amd-pmf driver shall apply thermal limits w.r.t
>> to 'auto-mode performance-on-lap' and not 'auto-mode performance'.
> 
> The question here is not about the 'auto-mode performance' mode
> but what to do when AMT / 'auto-mode performance' is disabled.
> 
> What should the behavior of the AMD-PMf code be when it receives
> a CQL event when AMT is disabled ?

When:
1. AMT is disabled and we get a CQL event, it becomes a no-op to the
amd-pmf driver.
2. AMT is enabled:
  - Avg. SoC power is higher than a selected measure, the amd-pmf driver
tries to move to 'auto-mode performance' and apply the thermals set in
the BIOS for 'auto-mode peformance' but in this scenario, when we are in
'auto-mode performance' and user moves the laptop from desk to lap, we
receive a 'on-lap' event. In this case we apply thermals w.r.t to
'auto-mode performance-on-lap' and not 'auto-mode performance'.

That is what is being done in amd_pmf_update_2_cql() with a check:
	config_store.transition[AUTO_TRANSITION_TO_PERFORMANCE].target_mode =
			dev->is_cql_event ? AUTO_PERFORMANCE_ON_LAP : AUTO_PERFORMANCE;

Update of CQL happens only when AMT is active.

Thanks,
Shyam

> 
>>>> If thinkpad_acpi does not do this then the AMD-PMF code should
>>>> check what mode has been selected by the thinkpad_acpi code in
>>>> amd_pmf_update_2_cql() when AMT is off.
> 
> Regards,
> 
> Hans
> 
