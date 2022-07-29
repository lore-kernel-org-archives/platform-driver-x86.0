Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0690C00144
	for <platform-driver-x86@archiver.kernel.org>; Fri, 29 Jul 2022 15:43:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237659AbiG2Pnk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 29 Jul 2022 11:43:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236096AbiG2Pnk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 29 Jul 2022 11:43:40 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11EE012630
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Jul 2022 08:43:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h1BTIQiUwcNMQRiTxm4wSqIXVT5vIIkDVNsOdlYroML8ta0rW5AhTSIdAxfrIisxEqJJy3uZKagpoxYFBKom22V6/pP7oHbH3cOFhG2O++1cG++7HlFaRO8wKEqXUqgA9SChPkKjIBSLN23vaGvZfqsDcYaShPzlyvkMEuKqqlnnRbxPqw6dP6Lz2krkYjNi6yLymdkj8mrWm2y8WSbfOmz5b9GwfBqNPF4vd9fpjLwn8n0licYE/Af+fv3LUrnBwaoCvAQR0xASzYRhRFJe0ca01ONzw/SFUyG4rLifaM6bfO3QCYU2sQecFie5cxEG3rT0I5IkH1csUdYw1jOLtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eMAGkFxWpx30vv/ZKDWymnAndCoktTbtmRPxaY8GQZg=;
 b=mH5HWiG1+2NsrARzoSraNdWLLl8kKKBIpBZKr5PM7Ufs82oFOfVUQNw/951qEU8OvKIR6LnmHrsWgyRHRdVoDtL9v/lMmVr38vsNAB2mM58Wk1rcoUipi9IQJpcOhOnp24OqC/aBe17WDivslfnMhNZWmAcLT8huBTfP4wpOJ23xvVy12JvR+0dIFxRwXPI0JlKZKtXcWCT8FTsJQBCCUseHmLwtsYYUnI0wAkvV7mQMovMmavjyPlulkNK4JxU24yEA6IQFETgA3MspY6lMa/Oyl9OSMIZurUVBIPpjjo6sPC5jUUFA+WfeWplI0QaiOFx++bZxnLZpWiExyitcaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eMAGkFxWpx30vv/ZKDWymnAndCoktTbtmRPxaY8GQZg=;
 b=vuQYI9+LjurBtIeMLZuWYHTC8mcnJxIOC6/Ygcfr2MkllMcGv3SARKiU08p2W/MWkdZ3wri2R8XqJ7OiGopJHP1jMbIeQWhUzipukAi57/pshRGC/qxSciq7ucKuvQpSMDfCMlnJrfHTGY+Df48BhKkwabqOCD9DucW+Yj4Gsi0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB6258.namprd12.prod.outlook.com (2603:10b6:208:3e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Fri, 29 Jul
 2022 15:43:37 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::4489:9a98:ef82:6c67]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::4489:9a98:ef82:6c67%3]) with mapi id 15.20.5482.012; Fri, 29 Jul 2022
 15:43:36 +0000
Message-ID: <bab60716-a19c-ffaf-81f5-d26bc8f2f6f3@amd.com>
Date:   Fri, 29 Jul 2022 10:43:33 -0500
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
 <fbc06d40-f466-d971-d60e-0a9e0b8f7580@amd.com>
 <b75f24fc-3ac4-35b0-3df6-870f4151dc43@redhat.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <b75f24fc-3ac4-35b0-3df6-870f4151dc43@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0414.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::29) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee5f6a23-2e90-44a8-6aa8-08da71791986
X-MS-TrafficTypeDiagnostic: IA1PR12MB6258:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3ZdoBlZ2uFgGlERYtejLfZ99AzK0PUbAd9awkSaqpxsX05yhoTiKMFJl3GNY7/8AHh/hflT/QoZkoN6O+YllZX040og5W/C9ixR7kzt/xOBxEoW9rM5XUyu0Pd4kBFYf5db1qBVxoDEle+4ypq9Rk0iLy0udPfjzgVZR7+Xh37WtrUi5yvl+loFaGcBGeFF9tJ//DtGV5eTFpAqzsbFVQo01Q82hf1ZXA1FA5Uvlh3le7auGKvftJGxNVA/b0ooiQfjCgcoFtrPP9CXpxQ4PfNTYUszHd+lbZDK6BReGCJcjBqytyD1lyzCBQmLO/8JMHbEvwzvyZYfk8XHESHXeUB1d9hFzXPFdPXd/uRT173P0pc27icLAHXiiduwN9n2YQSGrTsrzY/18m83piVfgRZ0xQgKyRAZ6O4XR/8DIV8TtkXTzD1DK2+QKHC8i6sSW44ZL4/wteTJ/7h99zm4rfPUhvPxeRyOJ+ipbsfmN5Usz8Rtjm5XW4qmCcfRJxuifevZhoFhQbCUlXjuLv1eoQZIftiREPMT0C82G1/TgGGsyZEYO23W8Az12UCogm976eGXXi6cvFr45R4UkQChk0irR/4RyaDY1jP3sIhpH7iRswYZtE+KBJ5gFOulbuCcRbg7GOu+egvxIh+KUh19W4haUozeYuvB/coRPTDbQrwL/Kl7Q1ojYqjPCzc6Y2ashG/HaDhKKoFWHJiay2sevQsi0AR3dmN2VD7k+RLXtaYqTnO0cCDJVdBCZ1aK+dbk7S268VZ/e0H9SRpdcxhYEHulSzuNRfJak96zLu4VKFSZf/hWhsTPqmmSR/Lr6KHNb4CeiLhl/8aJbwcOJIDTUiw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(38100700002)(6512007)(8936002)(66556008)(26005)(8676002)(66476007)(6486002)(110136005)(66946007)(6506007)(4326008)(41300700001)(6666004)(316002)(478600001)(36756003)(31696002)(31686004)(2616005)(186003)(2906002)(83380400001)(86362001)(53546011)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azJRWWF1NnIzenhmZ1VXZEhNYVZXMHAxaDZ3VkN5RWxHdTlMWlVwUCtRMEw4?=
 =?utf-8?B?WXk1L3h4ejkxRW9mTkpGdUtDaXlGdjA0V1NsOGdvZmNFNUtZeWpNbzBZU240?=
 =?utf-8?B?VzZXRHpzZVZXam1nblRjY3gvVnFiRmtsNjlqN1BUd2xjaUEzRGkycWsyd3Jw?=
 =?utf-8?B?VVJBeW4xSTdzbE1GcGpnbXRHY2JCTm83cTN5SU1jaVJhNHJhaVN5djRuZ0h3?=
 =?utf-8?B?VEthWXRrRjR4dHorNEkvNjNTOVozYUkzYkQzMnhLMFRjSkRaMDJoR29XZHdU?=
 =?utf-8?B?SUsxQkhEcGNWV2hQSFlSR1Zlb0NteldXZVVqekZUUWpUM1k3bkJ1czVNUGh2?=
 =?utf-8?B?czY3RHMvc3FEMjRDK1crcGtOV3VtZ3dOSU1qSHdwL1I1Sm5FRTlNNnA5aWNM?=
 =?utf-8?B?Y3NUUUFHaitMTytrc1g4TVBvQjVUQVpudUVpOXBjb25DYzg2eFNIMHowc0di?=
 =?utf-8?B?YjBtNnRERm9qSFRMQ0JyQWJmN3VqSXEwL0ZrT3Z2SkxUcnpHaHNQTWtQUUVG?=
 =?utf-8?B?K3JNZVdiaFRTMG54d1NQdjVDOVZISkZndXZwY2crU2lUU3FkMEg4bVJHdU5N?=
 =?utf-8?B?Nk1wQzM0ekxHUTJIRXpUblNYdEpDbEphdjJlZTdSTStMWUFlN2VqK2I5M3RY?=
 =?utf-8?B?R0srOE8zbXJTTnV2NjA5WFJHU3hzbmNuL2g0TWxUaSs3YUtmUlJ3RHE1a01j?=
 =?utf-8?B?STdSeTM5MlN5U0FoZmhIOWl0MGNQTHpRcTRWcCttaU5NTy9ySFF6dmhyWStL?=
 =?utf-8?B?ZjZpK29uZWhxYTRnZjExc1lublQyNGpiTnl4dnNDbGRGZ1h4emZXaWJtczRu?=
 =?utf-8?B?ck0rUWUrUmhGdWIxYU9jc0lPNEtmRldaWWxoZFhYOC80YnM1WnhZaWRDOWZC?=
 =?utf-8?B?VHBMK2VaZDVZV25OTHRteTRBcjc2VUlVQU1xeDVlWUlsd3NBWTRpQkg0c0tU?=
 =?utf-8?B?ZUk3OERTVStQeEhUT3UzK2FQWk1qc1BJZ2oxQ1VHcXE2YkJKak91ckdza3Rj?=
 =?utf-8?B?K3NLdHdSMGVFWDcyNHlySC84TDQ2cHZZMGRhK2x6RHhhRENValJKUzZrNW9x?=
 =?utf-8?B?YjBWOG5ZbUk4bzJPZlY3Y3RnN3RtVGZvaGc2Qmx6TVlsOFRTR3RtVHVzRFFk?=
 =?utf-8?B?c2l6UHZtdW5ldy9mT0dwRzByZGhZOTVwZ2djcm9HOFZvOUp4N1laS1FSYTNu?=
 =?utf-8?B?bDMyd2VUcmk2Z2VYaGV5TkJwVmQwZWdTZDVPR3hRcnZTK3ZhdFYzRnFuR3dG?=
 =?utf-8?B?NU1qTnNLT0F6eWt2NzkwK1FIZUF5YWVsazF2dU9IVGhnZzFFckZTbUc5Ulpu?=
 =?utf-8?B?U21qbXhVdDhMSldCaWRwRzhacWNXdEROK3NwKzBrZW82MEpqNFQxcklPYXdr?=
 =?utf-8?B?ZEpxUytSZ1RkR2xIUWViME95aFNjUWRlSzE0VytWOHVZMm1lZnNGOFVNaXdz?=
 =?utf-8?B?aGhiZ2VsVmd0TDc1WDVpZ2J6TC9DRUd6b3F0eis1Mnc2YWkxZ0FGejE3NlpY?=
 =?utf-8?B?ekNxVFphcVpTTlcrbGVqRmlwclBOQ1haMTJ2bkxROTJBYjM0eGVOSEJVNFQw?=
 =?utf-8?B?MldCNGhtYXZZV2piaVJ5UUVRVWQ3SHhpTTdkNjEyL0ludGw1b29qcDIvUkRO?=
 =?utf-8?B?Q0U1QVYwWTJpa0E0SmVpVTJHMy9GUDkvVjJGVUNvUUVPS3gvS1IzUVd5ZG5z?=
 =?utf-8?B?RXZPM29QalBnalhDbWtOeFdFZVFTWFF2VGx2Zk5wOFFkb0FzMGJSSWN2OHBv?=
 =?utf-8?B?ME10Y1daVjV1aGExOTVmbU5GaCtNZzB3M1pJSEZMemNYVHVtd05mMmpUZGZG?=
 =?utf-8?B?VlN5blRMWnZLVGpmMFJ0Q2xHOTR3citScTBqcDNBbmdZZVVzaEdhZzZreCtC?=
 =?utf-8?B?S0x4NERsZmV6T3lQUmdmQlZRRzA5YU5qUW1yakhpWnVVZDdlNWQ1S2RUdFVS?=
 =?utf-8?B?L2NreHpSeXZEeUZlbWtyQ1diZTJsNm85QTNOTmNLUHVlZEhIckZqbGJPNldP?=
 =?utf-8?B?cEpOSVVyVWs4eG9sSVRVWktGcGNFaVpGSDBNTmZuT3B4VGdNa1hQTCtFdzFU?=
 =?utf-8?B?QXdkWUY3VnR3cjhzdFdJUXBuZit2VFhwYUh1ZnpEaTl5SkxGUHh0ZHpxNXBW?=
 =?utf-8?Q?zJIkl8Soxvo4TOHhsP7imT/kS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee5f6a23-2e90-44a8-6aa8-08da71791986
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2022 15:43:36.8954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h0MC83CrM7j7/ioOsN2RMz6kzjCUdLdyY5++fZ2JyBrSRU6F5vPpKHv4oe2dIbIk1pDHF8SXYq6TQI5M2cAXRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6258
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 7/29/2022 06:03, Hans de Goede wrote:
>>>
>>> So as for the AMT mode, since that is Lenovo only, I guess that means
>>> that there is no need to do call amd_pmf_update_slider() when AMT
>>> is being disabled since at this point the firmware will have
>>> already set the values.
>>
>> Yeah, Shyam made this modification for v2 to make sure that code path isn't called unless static slider was set in the BIOS.
> 
> But this code path is only hit when AMT / auto mode is available and
> when that is true then the static slider should never be set in the BIOS
> so the whole amd_pmf_update_slider() call on AMT disable can simply
> be dropped AFAICT.

The reason to leave it in place but guarded like this is for validation 
of the feature behaves properly from AMD internal systems AMD test BIOS. 
  It can be used to prove out something works properly without needing 
to include extra drivers and software.

> 
>>
>>>
>>> Actually this seems to mean that we must ensure that the AMD-PMF
>>> code stops touching these settings as soon as the event is received.
>>>
>>> Which would imply killing the periodic work when an AMT off event
>>> is received from within the event handling and then restating it
>>> when AMT is on (and making sure the work being queued or not state
>>> matches the AMT on/off state at driver probe time) ?
>>>
>>
>> At first glance this seems plausible, but actually I think it should stay as is because CQL thermals can be set at any time (that's like a lap mode sensor event from thinkpad_acpi).  Even when AMT is turned off, you may want the CQL thermal profile set accordingly.
> 
> So the CQL code is to handle lapmode when AMT is active. But I would
> expect the firmware to update the power-limits, etc. for lapmode itself
> when in performance mode. >
> The amd_pmf_update_2_cql() function only does things when
> config_store.current_mode == AUTO_PERFORMANCE (or AUTO_PERFORMANCE_ON_LAP)
> 
> And that reflects the last mode selected by the auto/AMT mode code, not
> the mode actual set by thinkpad_acpi so if the last auto selected mode
> was balanced and then AMT gets disabled because thinkpad_acpi switches
> to performance mode, then on CQL events after the switch amd_pmf_update_2_cql()
> will not do anything.
> 
> To me it seems that when AMT is off the AMD-PMF code should not touch
> the power-limits, etc. at all and thus it should also always ignore
> CQL events when AMT is off.
> 
> This assumes that the firmware takes care of udating the limits for
> on lap / off lap when thinkpad_acpi's profile is set to performance.

Where does this assumption come from?  I guess that's how it's done on 
Lenovo's Intel systems?

AMT and CQL is a new feature on Lenovo AMD systems, this is the way that 
it's supposed to be done here.

> 
> If thinkpad_acpi does not do this then the AMD-PMF code should
> check what mode has been selected by the thinkpad_acpi code in
> amd_pmf_update_2_cql() when AMT is off.
> 

It is up to the firmware (and thinkpad_acpi) to decide when to send
the CQL events.

Shyam - any comments here?
