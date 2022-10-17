Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DEC6C433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 Oct 2022 14:29:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbiJQO3W (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 Oct 2022 10:29:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbiJQO3V (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Oct 2022 10:29:21 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82DE2659CE
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Oct 2022 07:29:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gI6Prz+SyoW9/5IaR5g3aJWvZeYfkUhi0wd/fBKQSV6GHl8womZel2j7rgL9bCaPDJd/KM/DQRvJTtMIgXqms22slDC5Y9edsAISotVKbZRkSNNl4V5UCtOoROSAoWplngCIfDGkV56yawHjgYmtNZLqDjiNSzzTuE1Dq5P04Rsto06BoSdbIQjWAJrTEKkpr2tBVu8+XKuUOr9QaO1BwoCEgRqzeG+OGHMixY/7GscWuRxOf4pUh8Lpwlt3HSuAd2SGWX2wOl3P2PUzLtC0S5Z+YtHmHzilyRDivPIJBUdNc2poWPmnMAlZWjb8yJt90BIKvdCS81i6ZyNQiicM6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLjs76BqCDLVh39TFc+0ragGieQyIRV+7HVGCROh4VI=;
 b=a46p4B8W29WwP3i0cW5qHWZ+132+Bm7thcNgWaecY78IPQJDkAcGWHFDLCcgTQJ9o71FXBkMLbnhuGbDXSti28evT9o8sckIVwd97tRyqQ5CXTuJiaQ1o8LY1cHRsO6kzw+TqFh2slRAWPnMzUREDQ85p5Tef0UB+fNVRxA2KsbWOK3jdlYxlxPhNU/iWQ60EN6Clu+W1HlrMtq4xEvlcuiMFgWI1VnJWCKuY8/dl89+hEVqb3fgX7Eo8c9fR+5fUPdleKD10Wy+KcLl9kgvE8Xs7UPbEBPbsmcVRE+G9p3PE/KbV8vk4xqC5mAatOK2PFNk3XFDpHn/yE2U1BJLwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLjs76BqCDLVh39TFc+0ragGieQyIRV+7HVGCROh4VI=;
 b=yKD97dcW/X6Ns5fsOVdbzMGNs+HmDhy6puWKZZtsRodxVjXL5qVVzDQ+N8J+3oiee7ytwYeAoPSjdQhJ5tG0hKeWpNTvUlGNM4DNchkKSkuQeyybiNGYvr+Hyo3K8K58GCoYs5hRz5pPAOYUAl97rMGmKAgFFos3j56B4btDKp8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA3PR12MB7951.namprd12.prod.outlook.com (2603:10b6:806:318::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Mon, 17 Oct
 2022 14:29:15 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::76ec:6acf:dd4d:76a3]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::76ec:6acf:dd4d:76a3%8]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 14:29:15 +0000
Message-ID: <dbffc3c3-9fbf-8d7d-99a9-29d44671e7f2@amd.com>
Date:   Mon, 17 Oct 2022 09:29:12 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v1 1/1] Introduction of HP-BIOSCFG driver
Content-Language: en-US
To:     Jorge Lopez <jorgealtxwork@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <20221010162326.12957-1-jorge.lopez2@hp.com>
 <20221010162326.12957-2-jorge.lopez2@hp.com>
 <a50407fd-6969-9e9a-23a3-39879af639cd@amd.com>
 <CAOOmCE--qzRCOgpfpW5j5VmnCPExdTVDM9yQ-PcXrec76e492Q@mail.gmail.com>
 <d88e15ba-9e3f-310d-118b-7ccb2fbe1ca9@amd.com>
 <CAOOmCE9wVT=Fr72pgx58X4RMPy554MwZev3_8JtU8cBLdNpfhA@mail.gmail.com>
 <CAOOmCE9fuHTTVcSUSC0SU3N_ht8uVLg4hGUAJE7bJgs6UAt3gA@mail.gmail.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <CAOOmCE9fuHTTVcSUSC0SU3N_ht8uVLg4hGUAJE7bJgs6UAt3gA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR20CA0020.namprd20.prod.outlook.com
 (2603:10b6:610:58::30) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA3PR12MB7951:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a0072ed-350f-41b1-b969-08dab04bf79d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 25lqxVNaUdtSYXxQ3kEUAaaB2zAuRe2wtndLCJkQJIQS9kpRN6d2O8bg2JIjC9dms+/tY95G+za3OXkm7HVp+MdbPO0PRTlUSPVPd7eyk8cPEjrryW8IZUW8bqtdZNqIGCSQGw3mdyvUfE1a32gioMzclNPf/JhbeAgpe8+Vo8Qoh4r7ld2Hzo2qrPsv9Z5siBiSpyyYiBwgn0DJ8sN15WUa05V/xTfK3w2i3GzLvizNpKUFCsFnwvY9uG04s1JD47Ft4zguDfBCnXuNoiduYnRT4wZ2vGbS9U5ZoVTP+0YAkOqYBfZOnH33o7pui9lSYUBqM3bFtLkTBg3aivSvvHQ/WA2RINUwq1sIiYxsJuqlIIG1Q4bKaJcjqK+8MeChYED3JtF0ZLrDhQldagQ4PIjqXnE5vbWo0Nl862gZFqojMA23d/XWFVkk+u8Q81phUQVTkOMFEaJg/BNvgHRaiR+Acho+GV07jMQR7NOV9niajBuLj4udQCeW5zYsRF2upD9lTL7gBKKsA/Z+KKqxVyjDS2Iydqb/cPzZ04m3FILDDUkj2njvEReLHrb3J18GeRD9RyCpL97NralA5+0pNq++Rugi/cFZb5YqtKTr2/4G2fWhLopxK0V079aSk5ETEEZ7QkN3TCwgMpk+C6uYf6JLwvXxjNwKbn2gTmjIdCOsTLice2l2YN+8fJmf3nfi7ldGICEKU03yvIrNvVEuUGXlfXbRVc2lriMdBPr8hMPeSR1s5TvlKOvqiAYvymaHLoJMCHxZQWKFdsHliHtlrwDYuT8WYT45PW1szCz1RYo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(451199015)(186003)(31686004)(2616005)(2906002)(6506007)(5660300002)(316002)(53546011)(6512007)(86362001)(38100700002)(26005)(41300700001)(6666004)(66476007)(8676002)(66556008)(66946007)(83380400001)(4326008)(31696002)(8936002)(110136005)(478600001)(36756003)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3orbG54UGhOUkx6a1dlZDlUYWRraW5WVHA1NUlJdUN4K0J0aEFERytQaXY1?=
 =?utf-8?B?dFp0R3poUmRMSkxzcU93RkJvOXFFeTVzWGtXLzJvV09VMXZPN1FraHB6Y0kv?=
 =?utf-8?B?ODh4TUdhNzJKN2dEOHZSZ280NFRCNEswc29jK1NRU3BqdTBNd1MyditzRXVN?=
 =?utf-8?B?OFNDRHYxUE1ZWGZiL0JXNXF6bXg4cHBRU0JYUzFZU3lGTE1ZVyt6Y0dKU0t4?=
 =?utf-8?B?eVJaTFIvRW1WdnZ0clVIQVFLVmkvQXZQQmRaOFR6SFFDVkQyWFlnbE1rUWIx?=
 =?utf-8?B?YXRaZWhIczQ4Z20rMFE3emhRNDBWWjl1VkdnR2ZiUko0MDdRL1BvekV1TWUx?=
 =?utf-8?B?TlMzNUY1d2JRNGZCbkdzWmtkWlI5Nm00T3RITkViMGRwNFdMQU5RN2RIWUhq?=
 =?utf-8?B?aXptdXBiOG8xcy9GRzN6bUdFazZVZDB4T1hneU83alhTazdINmNwZnZWL1BT?=
 =?utf-8?B?WFFHc3BjcTVNYU1iQlpJT3psUzlKOGYyUUVxSWdESkxSTG9RTUpSVm9kU1I1?=
 =?utf-8?B?clVROWtmUnNTVlBZRTdHYk9QMEtQV3NLdm1jb3pyTzY0N2NHRnJkcjVUN2hv?=
 =?utf-8?B?alAybTV3cG0rcU9VZ0ZMYWN0eVFtVFFvTkRmQmIyZUFZcGV6TFp3aUxDSTAv?=
 =?utf-8?B?aVBWN3o0bU5oVzJlaXRlZ3RzQTFNejRnOTExMkE4RVRaelJQRkpsR013emtU?=
 =?utf-8?B?VWlidWZseER4MThRYWdVNXJJMU41TkErTHJvWVpUTDFHUDFkbStLR0JSYXhq?=
 =?utf-8?B?ZmhFdE0yK2VPRnBFWXZPbHFsQkhScnZDamozb3NPUzMxTDIzNkd6LzZ4Mm9H?=
 =?utf-8?B?ZmlCd29PZkIvd0pmQmZlcEpWNUhFbzBGa2FXVDRvQmNwSGxJRXpFYTMrVGx0?=
 =?utf-8?B?enVsK0NiM0JSd2lCWFc4dDJvNTF4U052Yy9pd3dqUTFPckdvZmh2V2NqZk9m?=
 =?utf-8?B?YzROeTNmU0ZLM1grZFB2dUVDeFp5MlgrWmtFM0R6TGluK2VPUGpRSkUvaGRu?=
 =?utf-8?B?ckptSFB5QlpkNlh4cmdVOUdjQVZIbE0rZlBaT0JCMnBkUU8rdnBzWTExSlBN?=
 =?utf-8?B?YnpUSkxpNnZUc1RQWjRoMFZVVDlacVBReStVT3o3ZWd3eVFDKzlMRisrMWZ4?=
 =?utf-8?B?Y3dmblVJSUxLM2F1SXZhYWtuQjRSNEtYZVFweTcxNjIyZjlqdFFldVFyQXZJ?=
 =?utf-8?B?M1hhK0tRQjk3eTl0TXY0Qkw2NFFXRFZldGhEWVI0VFJ1aUEwcmN1YWRrMVFM?=
 =?utf-8?B?V00zaEsxNndkME4xTlAvekVJVlhFK1E1T2ZpdTNIUW9jeTQwMVdHc2pIdTZP?=
 =?utf-8?B?Nk44WW5LUWhqM2czUW5pbFBMcjFDQUdzQStKUGc5a21kbk5xVk9SdXMwOVp5?=
 =?utf-8?B?azVEYjcwai9PVFBWNWZJYXp6OTRobUcvSmJ4eVQvM1Z5N3lDcWZ2amRxQjVt?=
 =?utf-8?B?RGt0dmxTZVFia0hTbFU5bzBEWGtZeWxzUlhOUDZRNGdEcGpnVUgyZzRLWnpt?=
 =?utf-8?B?V3F6SnkrdkIvTHNESWw4L1VldkdienJPRkJzRnpEdTZpMXVpN3c4NUhuYUNR?=
 =?utf-8?B?NG54UnNyRWVzL21YcyszVWJrZUxnZ3pzUTMwL1loK3BuaVBraWxjWGdLWVpZ?=
 =?utf-8?B?T3lqZHMyQWxMSUp6SGRwY3I2Z0ZuL3hleUNQckxaTno2Z0x0QkIySE9IQW9P?=
 =?utf-8?B?Nk9iUjY5ZlRZYVlKYnB3WnFNbUYvWFpOWm0yaXEwY1JRelg0c1cvQXdPVG5x?=
 =?utf-8?B?YmNzTXErM081di9SOXBGbmRWWFJIclRSb0Yzc2NmVVJJTDg1ZmpOSittaFor?=
 =?utf-8?B?b1JLYnI5UTZ1TzFTMUt1YTF3VHArK1QyblA5VUdMekZBZW85VWdQN2xTckVv?=
 =?utf-8?B?N0hyNGZPQkVuZHNhY29ES3BjZUlQTkx1K1o1ZVBueFVXRWF5N3VzTXJjZDZH?=
 =?utf-8?B?emk1YTI1YU14d2xGNXFkYytIY3RXYWM3WVorZTY5T3FPMmJXUVlOV2xRajRo?=
 =?utf-8?B?TGlRQ0c1Z0YrbkVVcnNFVTZKdEIzMjBQRkNjVW9wMjUzQ05IN3k3ZWxyV3JW?=
 =?utf-8?B?KzVDQ0FBUTN5bFNpZ2VwdHJQYzdZSE14Ny9tSFB1OHYxdkZDa2RxeDBYSHdY?=
 =?utf-8?Q?jW6l+Pggu4u+dEd/U4dLnTk9a?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a0072ed-350f-41b1-b969-08dab04bf79d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 14:29:15.1095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJjEXZBiiD99Mwify2+aO5PYz2kt6QfyoX91d1EliJ3yyMDcgy8Pd9uTR/3jXA8GiGwGeTEo9hzmxC2CTSZKpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7951
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

FYI When you submit v3, you don't need to add "new patches on top" for 
your feedbacks to the new driver, they can roll into the patch 
introducing hp-cfg.  Just make sure you include a changelog under your 
cut line to indicate you changed these from vX->vY

I suspect that Hans will also want you to split the driver up into 
smaller bite-size patches to make his review easier as well, but I'll 
let him advise how he wants it done.

On 10/17/2022 09:11, Jorge Lopez wrote:
> ''Hi Mario,
> 
> Please see comments to previous source comments.
<snip>

>>> Thanks.  If you make this change for v2, I can make the matching change
>>> in fwupd so that if it notices current_value permissions like this that
>>> it shows read only there too.
>>
>> Submitted the recommended changes for review in v2
>>

Thanks, looks good.

>> Submitted a patch to improve the friendly display name for
>> few numbers of attributes associated with ‘Schedule Power-ON.’  BIOS
>> assign names such ‘Tuesday’ to an attribute. The name is correct, but
>> it is not descriptive enough for the user.  Under those
>> conditions a portion of the path data value is appended to the attribute
>> name to create a user-friendly display name.
>>
>> For instance, the attribute name is ‘Tuesday,’ and the display name
>> value is ‘Schedule Power-ON – Tuesday’

Looks good

>>>>>
>>>>> Presumably if this is going into it's own directory you should move all
>>>>> platform-x86 HP drivers to this directory earlier in the series too.
> 
> The other drivers named HP-WMI and HP_ACCEL  were written by third
> party members and not by HP.   It is for this reason and because of
> the number of files, only hp-bioscfg was placed in a separate
> directory.   Let me know If my reasoning is not valid enough  and I
> will keep the files in a separate directory and move the selection to
> the main list.    In addition, Moving  HP-WMI and HP_ACCEL drivers
> from x86 directories fall outside of the scope of these changes,
> Correct?
> 

There is no distinction who writes a driver.  I think either you keep 
this driver in the root of drivers/platform/x86 or you put all the HP 
drivers in drivers/platform/x86/hp.

I think if you're going to put this driver in the sub-directory "hp", 
then the first patch in this series should be to move those drivers to 
that sub-directory.  The second patch should be to introduce your new 
driver.

> 
> The build process was tested with the latest  drivers/platform/x86
> from branch for-next.
> Nonetheless, I will investigate.

I did my test on 6.0 rather than for-next.  But given it's a header 
issue I suspect you have a miss that works with the compiler I'm using.

I was using gcc 11.2.0 on Ubuntu 22.04.

<snip>
