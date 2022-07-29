Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A66C00144
	for <platform-driver-x86@archiver.kernel.org>; Fri, 29 Jul 2022 17:41:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233350AbiG2RlL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 29 Jul 2022 13:41:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbiG2RlK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 29 Jul 2022 13:41:10 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C6F9175A9
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Jul 2022 10:41:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=noBhGmhl52DqCQOuyCEcE89X++A36hzgogLa/eGq4tMNBFSN3IOVBBZ+Bn/FOOK1/7CZARKHZRgi/qwobckrsp4Z1VeAGBpLFVWWdqhutfDoNcJ/ZDfcCOkHcVUNJZGRbSu35QpuVFggr7JXULocHYzDf/rhSsWyZH78Hj27zkkJ6Yv7yEpCaO8gC8nBcKTMa+VxvVQWS6dWZCaZcOa7ky90TEFvoozVKn+5pNtGkAxeZ0T7AWNA511My67zaukCpbrFPitXOQMZ0GxgDKDnSMxc4rIqwkkKHUi40ny1OnGQZUvvZQzQ7o/HlfJEgZHuBUXkcUlyoRmUNsYpXzQiZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KGJvwSkWYwF8UH5XPPvKutNq+kQam4AXngj9AtQFlwI=;
 b=cxyhmMdQis8xlRoLB3EicXuhgW/0bhWy7Uf8UFveT/BQ1+7qy5bYDfpNBSlKws/sbXmwGvNr8tZrno4b8K0eqR8FZuSbzg2cTSpNvBUYJlrBU+kjNKa/Yl80DcRgJFezUa0D0xJxBc8EYWnEyI9L8blL5H+sGl7/G5TcOwz/xua6RNHTU1YD5nZFdMJQTK2/GY1VQNF0zz5cg7QAGNF4ihLwENDWw9VNepQ85EoUF9lLm4LMvdzrir4ouLV0iPqPTSlWXJTFODR31nNz8P4wACYCbN/btbLiqfFheCQssqLQzDDWw2IMwHDlp8042P3S783oyJq+imyUbdAJW9wnhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGJvwSkWYwF8UH5XPPvKutNq+kQam4AXngj9AtQFlwI=;
 b=aUQzHFcL3Y4gDDytZxyPydpWzmly89ZmeCvuP1/sy9r+aYhMVI0TZeLGjc48DxBcG8DxZXznXy3TVDJZjyGu+mwEPwQmJAgKbAfKJrM11Qe7vB4LqcjxT8o3VLRAa77j/GezLPmJOVKY4A+yZJZmQGDNCsFtip+GTY9nOX9BZVQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by BN8PR12MB3361.namprd12.prod.outlook.com (2603:10b6:408:67::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Fri, 29 Jul
 2022 17:41:07 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::6947:34fa:6a20:3e20]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::6947:34fa:6a20:3e20%9]) with mapi id 15.20.5482.012; Fri, 29 Jul 2022
 17:41:07 +0000
Message-ID: <194be06e-5831-eb0e-5018-61f1cfcf9912@amd.com>
Date:   Fri, 29 Jul 2022 23:10:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v1 13/15] platform/x86/amd/pmf: Handle AMT and CQL events
 for Auto mode
To:     "Limonciello, Mario" <mario.limonciello@amd.com>,
        Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org
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
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <bab60716-a19c-ffaf-81f5-d26bc8f2f6f3@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0132.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::16) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6536d1ce-c981-44f9-ba75-08da7189845e
X-MS-TrafficTypeDiagnostic: BN8PR12MB3361:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qEePmPWjQwGGI6GA95mr7lqZL7bkjsXdh9qWo7m2MTXvUVkw7um1bYQSxU749i5rSHQes8SBYzeH8zSHbrY/jPqJyqV8gAHNVyDse4XhBlbpi96aw/FvVZR+vzfof3Aye9RQRD85R1tfITrRMPccWbtn8Eoef+xC4kXRVFdLqFAzBygVe5+8iA5oSga7x0c1ZPVLAP3u+WjgsUbXgF3p0MXL5Ob0FS7BcYv9LYcA3Bal4Calr6PAi0GTBVIM1F2HlqVL3fB8qlU7jIy1qOYydnytMlieTeY0gIY9CcOGgWAa3q7AEN7RV6jmQota1QbnaI6qu4VJTAKWr9EzfA3fa1CsUGOW0WY+jLFHz8rwSMx5vZ16iNdbTclSlru2IS/Hi+fV3A5VL+m8f7QTvwH6L67iLA7snAEuxBlnBKifToA7+yyd5ilteuucgsPNQq7+/nJc6CufcpPk5OnNAP/GJO/2g1jCLB5hudbXjKE0fYY8UbqDVFofQYJqpOSEm5IHnsehpv0BupBkBuzKJlgLWs9N4noXJsFWdp1h3JeK4wM/dp1sYtDfJffgm0D7Fd4aN31/RGqSWKvJpUIEoc40q2wzF4ML7eZu15qkMxM1s5hdmWMnHKZYAhFCVkkeoLyEeJS8AXlQZqJk9XfuCgSlO62FvN3adnrGY6Zgc9bukbGRBw99yYcCFezhKFo2C25iZxj4RG+Rdx/9oLRsobGOF1Ak78gX7tt1kBdwPQegSDSMVMY1SFbFR6RPjX5IUzi4EM/5FQIKA6ZcRkKcXbzs7StolSRp/3sFK2r+cRlYQGBahLI9/AvTxZsiakoPpwEWrwZ6e0fDZT4HVfULDjO6yg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(66946007)(36756003)(110136005)(316002)(478600001)(6486002)(4326008)(31686004)(8676002)(8936002)(66476007)(66556008)(5660300002)(6506007)(6512007)(2616005)(53546011)(186003)(41300700001)(6666004)(2906002)(83380400001)(86362001)(31696002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUNnTkdnL3Z2Nm1yZ3lSR1QzbHUxM0NWMjZtSGxQOGFNWFI5QXVNTHlZeE5j?=
 =?utf-8?B?ejlzU3kyMGdYdmlHRStyYlAzUXRBa1ltcTRmK2Y5MHFNcW80Z1pZN1hiM0p6?=
 =?utf-8?B?MXFLaHlRbjdwWlVNNUZGcFUyZEZZbi9QRjZZRzRnbHJRUzdlcytYWEx5V21L?=
 =?utf-8?B?Tkh4UWRTL2RLaGJuaU1sOHJ5T1R6aS9kK1RhU0lVaVB0ZnNRQUkzSW9JZy8r?=
 =?utf-8?B?MGs3dDlxTWo0cTgrUUFTblpCNFJGMkVMYUp1YU5zd004S1M5MXB6NHB0UmJC?=
 =?utf-8?B?VnpISFBRLzdpUnNLTnQxODBHSkNneU53YkUwZGViZ3Y2Q2pIV2ZETG1PeWJ5?=
 =?utf-8?B?OU4xM3FQWmFvUnVyNHh0RU1kUU9oZEdkcjdlWHdRQk43MnV5a2lTNmtZRmFZ?=
 =?utf-8?B?S09iV3NEK3pocVozbXhid01hRERsa3RQZzY2ZU5nYzJibGZiUCtscTdzOXNN?=
 =?utf-8?B?enFLZWIwcmYvbmx6andENW5QdDZqSVR5cTJ4VUNGOHpFdkRVdm5WVDRlVk9G?=
 =?utf-8?B?OFRRR01Ea08weGU1SGx1NnBCWTYyVkdydUwvUlkzb2h6MGFSaVBSbXVSQ0xx?=
 =?utf-8?B?TXVUUlJRQnpiSFFYdDJLcHNsZXAyczNOdVhlMUxiTmZzNmI1TG5ZSjlkNTVn?=
 =?utf-8?B?OFVXQWw5dFk0dUtsN3Y5ekJxNVZtU2o5NnpubFNjYXFobkU4TTdaVVMvc0Jk?=
 =?utf-8?B?MkNUSW5mVXlWWWExRHBmNlg0T2NwT2lzQmpheXNBdGNPWGQrbGJBZy9NZHNs?=
 =?utf-8?B?R1NoZS9xYk1namdOc2dCZy9lU3lCSWV2SG5jNXZLcGk0b0Z1THlHLzFYVFFL?=
 =?utf-8?B?Q2VnU1RGVStXK0s3MEVmck1xN1RaaTN5OUJnQ0FFZE56VS9IeHpjMHIxY1Zw?=
 =?utf-8?B?NjA0dmRtOXJQNmt1cFFJdGdlVkdSb0tuWlU2YjR4SGJQNWJCcEZxdHV5Vm9E?=
 =?utf-8?B?ZUF6NTBaVHp0TjZqVmtkaTJFd0M4K2N5UTV3TFNmK0RQYitCWXlPRjdKaWNP?=
 =?utf-8?B?N3JXSXR5d2gwaU5QSE9PbllqY3diM2QyV3NscDBJZzljVXRkWTIzdDhTc3dY?=
 =?utf-8?B?Y1EzZzVvaDhLN1ZwWWVYcHAreUEyblZpbDl0Vmsyd0diWFBsV0JwdVdkUk41?=
 =?utf-8?B?RkVxUC9TbmwwQlA2VWY4K1FlL2o4U242NHlTVC9pb2M3K1F4RGdvUk5LZjI0?=
 =?utf-8?B?VzlQZ1lzemNKcWliR0NBcmRmSDNaTnZocTNDdFE0Z2laSnBYRFQ3MnhCd2NL?=
 =?utf-8?B?aXpTS1pSM2tkVGdzaStCaWd2bnNmcnZ6VFdLbUJQRFUzRlk2RzNNZlRyS25D?=
 =?utf-8?B?aWE0ZDU1VnlnNVhDOHhLMmtCbVYzSVF6TDhXWWlTbTVIUGo5NjBoZHdUTFZ3?=
 =?utf-8?B?MkRRc2xyYUdjWHlVckxndFI0Yjd5R2RNQys2MnRjTnhCNXVYa3d2RzY0c2tV?=
 =?utf-8?B?THdkakNva21DL0JNSGYvZDhhSVpuMEFjRGhBelJTa0FZUEp5U1AxWjZFNVd0?=
 =?utf-8?B?NmhxZnZyOVV5RTU1ejVNbUZMZ0w1K3FFbGZxWThjb2MzZ205dnlWVWhoYlpt?=
 =?utf-8?B?UnhXRm9iSkNEZmtOUFdZQ081ZGtJVHZKRzExWThURjNCVml2RTNiQTZwZURI?=
 =?utf-8?B?bXFwODE3RTYyMGJkVGlVNG85N1cwcTlIMGxybWlVaFQ2UmE4Z3NLOExXMnhY?=
 =?utf-8?B?YTJJMXJNbmZ4WWNBbkxhc2FXcGNQcTdHbnl0eTZ0SnBiVlF0WDZLRDUxVGM0?=
 =?utf-8?B?eEdKRUdKR2QrdUQ0cExDVmI1UUFmTE9qSk0zRjNobUd4WnoyM25Cdnoxblor?=
 =?utf-8?B?ekZBQnlsL3Y1bTRlRHVhVmF4d1ZuWlpLNENqS1Q1YkxyaVZtT3dRTkt1NHBl?=
 =?utf-8?B?YXZra1Nrd1ljRTlQUTVFSm52WkoxdUJNMTB4MTZLOTEwK1drcE0zbWcwT1Rr?=
 =?utf-8?B?VmNCck82SzlGM2tOMW9KWlMzdVFQVGNPMGhRUTloMDRYeEdFZzJpTGU2WUFW?=
 =?utf-8?B?dUtNU0h4QldlOU9ZdGdJNklOaXhYcjh4MGFzL0M4VW5DenFGZ2VtMWtXNE05?=
 =?utf-8?B?MnI2R1JTQjBHejZ1L2JtZUVjYWNxdDEzOGo5T204Q09XODdRaHkzSHY1MkdU?=
 =?utf-8?B?Wmt2RkNWL0Erc0NCYkxpMHFrcEszWU0zUE1mZWxSd0hUSlp5LzFwMHZZdUxv?=
 =?utf-8?Q?winfXc4Ofgk0jUbKhn2cwtxtUXwflDrkjgRxF2vmjz9R?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6536d1ce-c981-44f9-ba75-08da7189845e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2022 17:41:07.5367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wzXaDH2qz7/k8xKZwmpADkYcO16IxItLn6N/5xEGcxuh03bDWrS429oQxF4hZqynoG3XuqJY/bWUKjNBf5uG1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3361
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mario,

On 7/29/2022 9:13 PM, Limonciello, Mario wrote:
> On 7/29/2022 06:03, Hans de Goede wrote:
>>>>
>>>> So as for the AMT mode, since that is Lenovo only, I guess that means
>>>> that there is no need to do call amd_pmf_update_slider() when AMT
>>>> is being disabled since at this point the firmware will have
>>>> already set the values.
>>>
>>> Yeah, Shyam made this modification for v2 to make sure that code path
>>> isn't called unless static slider was set in the BIOS.
>>
>> But this code path is only hit when AMT / auto mode is available and
>> when that is true then the static slider should never be set in the BIOS
>> so the whole amd_pmf_update_slider() call on AMT disable can simply
>> be dropped AFAICT.
> 
> The reason to leave it in place but guarded like this is for validation
> of the feature behaves properly from AMD internal systems AMD test BIOS.
>  It can be used to prove out something works properly without needing to
> include extra drivers and software.

Yes. We will need this path to check on the internal CRB system to
validate the 'auto mode'. Whenever the amd-pmf driver gets the AMT
disable event we shall disable the power-settings w.r.t to 'auto mode'.

I moved the handling to amd_pmf_reset_amt() based on Hans review
remarks, and its guarded with a if() check, so that we accidentally
don't land up in updating the static slider.

Also left a note on the same function, so that it provides some
information on why the logic is being done in that way.

> 
>>
>>>
>>>>
>>>> Actually this seems to mean that we must ensure that the AMD-PMF
>>>> code stops touching these settings as soon as the event is received.
>>>>
>>>> Which would imply killing the periodic work when an AMT off event
>>>> is received from within the event handling and then restating it
>>>> when AMT is on (and making sure the work being queued or not state
>>>> matches the AMT on/off state at driver probe time) ?
>>>>
>>>
>>> At first glance this seems plausible, but actually I think it should
>>> stay as is because CQL thermals can be set at any time (that's like a
>>> lap mode sensor event from thinkpad_acpi).  Even when AMT is turned
>>> off, you may want the CQL thermal profile set accordingly.
>>
>> So the CQL code is to handle lapmode when AMT is active. But I would
>> expect the firmware to update the power-limits, etc. for lapmode itself
>> when in performance mode. >
>> The amd_pmf_update_2_cql() function only does things when
>> config_store.current_mode == AUTO_PERFORMANCE (or
>> AUTO_PERFORMANCE_ON_LAP)
>>
>> And that reflects the last mode selected by the auto/AMT mode code, not
>> the mode actual set by thinkpad_acpi so if the last auto selected mode
>> was balanced and then AMT gets disabled because thinkpad_acpi switches
>> to performance mode, then on CQL events after the switch
>> amd_pmf_update_2_cql()
>> will not do anything.
>>
>> To me it seems that when AMT is off the AMD-PMF code should not touch
>> the power-limits, etc. at all and thus it should also always ignore
>> CQL events when AMT is off.
>>
>> This assumes that the firmware takes care of udating the limits for
>> on lap / off lap when thinkpad_acpi's profile is set to performance.
> 
> Where does this assumption come from?  I guess that's how it's done on
> Lenovo's Intel systems?
> 
> AMT and CQL is a new feature on Lenovo AMD systems, this is the way that
> it's supposed to be done here.

Yes, this was newly designed for Lenovo AMD systems. The behavior is
same on windows too (atleast on the RMB laptops today) .

When the system is running in 'auto-mode performance' and the user keeps
the system on his lap, amd-pmf driver receives a 'CQL' event from Lenovo
BIOS. In this case, the amd-pmf driver shall apply thermal limits w.r.t
to 'auto-mode performance-on-lap' and not 'auto-mode performance'.


> 
>>
>> If thinkpad_acpi does not do this then the AMD-PMF code should
>> check what mode has been selected by the thinkpad_acpi code in
>> amd_pmf_update_2_cql() when AMT is off.
>>
> 
> It is up to the firmware (and thinkpad_acpi) to decide when to send
> the CQL events.
> 
> Shyam - any comments here?

Yes, I agree with Mario here.

Thanks,
Shyam
