Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D894C6FA82
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Sep 2022 16:35:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbiILQe7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 12 Sep 2022 12:34:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbiILQe6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Sep 2022 12:34:58 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2087.outbound.protection.outlook.com [40.107.220.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DE1DBE32
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Sep 2022 09:34:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1Wtkiu45HsLNI1m6003iJhgXpzSzWUanfSlyif95sgVnBZrY6l8vGRjKGd/KZWtOjM2WFODcG7x9A1uLY5UpI0/qJAUlmoXjgnYnqzwUBxWGN43cOtXqTyWtdMwfUI5vRnWWkM6EnOOzsz+wh6mkyFo25wYmSNmM1+I+unhZAKVhUwhG3W59zjD+2JvzgKsUg0N0vn1WmEcGe1Tq/8Pt5nSR7oRpF6uMlFCnrJpXCxzOWZXPPnSpGOv8EVahuqpIbw1b9TN/mqp4aVGD//twoe8750/bEzA4/+FO/QYgkGnw1eap3Pp1E3cQ+FsafdthtKS2Qk6NS6Arbd5NwNL0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUie1WMu0zE6gH1R0fNMISqWrOntwRWXGcdxAjYvvwM=;
 b=Yl7EkVWPx9DaBkVmNlbNZRp6kaQOJFprp5ztDgw2LhLjRA7xOVdzG/Lpp/RFoCdwiIJ0aKk4+90JbWqllSJYhJI6KYD94xrBUktiED5cH+lcLQmZYTR9vDJKlLPtnAbK5OLuoN7umIQqPiMEr8ahGh/2mkgHYsCXhEWdb4GZmGT9dTAWMX9NhlPBsO8nd+2Eq2fbxmiYiuW3WU0GQTAYapEiEbfmROkygoxbLm40pveWlNDd1bnxqErfbKTbnfNWtnE5MbPTHBVv04jWC8GefSeqn+6IHvSTHmM5syf0sNitN/L+8smhlPAsLavTGNSlVeh0tJWx5UKxNEt6Q6O1tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUie1WMu0zE6gH1R0fNMISqWrOntwRWXGcdxAjYvvwM=;
 b=oKyQsMUtP2fTz9lsmZuegqb0UpCgYtVsdZ5gdHPTpowdkWqE5gSznxkIsyhppQJatZY43c6rjlDYD20cH8KfFsekTAp3vg3/lrB0VMhQkIvEAcTq4xd5I0OzwZXNGouqN2T4Sym3DfZ3F5k+WSezp6LWgE9W1XVXKd5uOFg2Jxg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by IA1PR12MB7662.namprd12.prod.outlook.com (2603:10b6:208:425::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Mon, 12 Sep
 2022 16:34:55 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::4509:38d1:dda7:2d66]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::4509:38d1:dda7:2d66%7]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 16:34:55 +0000
Message-ID: <5b2cf267-4dff-a5f3-6af7-a86af32334bb@amd.com>
Date:   Mon, 12 Sep 2022 22:04:45 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 3/4] Documentation/ABI/testing/sysfs-amd-pmf: Add ABI
 doc for AMD PMF
To:     "Limonciello, Mario" <mario.limonciello@amd.com>,
        hdegoede@redhat.com, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        bnocera@redhat.com
References: <20220912090641.111658-1-Shyam-sundar.S-k@amd.com>
 <20220912090641.111658-4-Shyam-sundar.S-k@amd.com>
 <3bf7a091-5757-a4aa-6492-30ddb4b2cea5@amd.com>
 <c1560ca6-442e-2770-c2c5-60d40f6f7aba@amd.com>
 <8e68ebc1-b4a2-c2f5-7bf6-138178bad107@amd.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <8e68ebc1-b4a2-c2f5-7bf6-138178bad107@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0207.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::18) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|IA1PR12MB7662:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d3c75f6-7187-4766-a2ee-08da94dcb8d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CUOc6Zz8iR+w6zGpuIYzSWnNasw0bDe7sBn4rPqgiRJrOTqBqedptYMmekHkamuAaMTTyPRSUyPPELl45dCjDoX4a00hTQK3A5DvTflWsipD2X5BoQ9pnQGJmwB+sWIkiaqLcsiSc+ozxjN7Ig4jbORPcT9fvGBtli+kImyH365oTUVwMcLa0aPaAnRGdAQHZxGi6qHxaF7MMy+RSirxwIKKb7O/8eMQYYeBr3lfdcnCkoor517/X1qMa1mHv+0ScOTbi3//BzSM73s/YzOVXDPwd1qXvfBeVwAzTq2qqiF1IolbecDVkUFNG4Jwo3HOCmi6avlVf39BvmQAaaxPw20KODAVDbR+IFNFYYZFVElV7Robhjt37YYaFaZ0Hjqr6blshb3i89sV12rTo4d0sDX1Kf9OGN5qyX9yE3tq145YTcKMD7ZY5YosHWwCfPuBgChgnAsfxivymNT/wd2c8nnPpuTIIU3k1K361BTDkfRVHS+04ZQtKnlv1f2VcT4OugI+A1voOljmPVCpbTFaF9ZoTbk2UEskCWHqR8fhp84oEphGPLpd1VKNjHEJyc4aq674wr877BlcjM3LtIwGOE5Rsa08SAaFGTNlF42/ER0EbY+uHHUQ4Jaxs42VrCN1ZbWDXY9CWDWTsyhZCER69NNDylxqW7AIYPdlVJJbp1q65tvaZLr1gHmUE+c/XLKJjr05+fsmACiVWY4uSufbDmo/8sglyQ17O0/JOfFQ1Le/SBcFD+vvcm9UyxuysGsySx6Lsi+5pPTzPXHdGl1r4bhagQ694QbGvA9OKZYgb3s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230017)(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(5660300002)(2906002)(316002)(8936002)(6666004)(6486002)(26005)(6512007)(41300700001)(53546011)(6506007)(478600001)(186003)(83380400001)(2616005)(36756003)(8676002)(86362001)(31696002)(4326008)(31686004)(38100700002)(66556008)(66946007)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2MxR3JRS3YwbFV3Q1hNQmZzMlQ0c3ZpbnNhWStad0Q1NkNEeThoWTNwVEM5?=
 =?utf-8?B?UnNPTzFwZEpwZWhaTUwyOWFub3ZUL0MrS3FTa0FLckhsc1M5ZGFBTDgyZG0w?=
 =?utf-8?B?QnhxeWU4cmNJZTY0d2ZuamZzVWFQVkd6bmtZelRkZnppU0MydFBmYXNLcDdH?=
 =?utf-8?B?K2t2YnpFQ2hEci9XRHJzRU5aRDlmdEJXTnNsa0hUL1h0cVhxZGVKYzZtcVUx?=
 =?utf-8?B?R0VySVhTT1J1N0VHSlRmeCtMWFhLSDFkQlFIS0I2T1p0aVl1RHRTM1FVTTVm?=
 =?utf-8?B?eEx0VHFnazcxWndkM3hPbDBDRm5sWktqcE5va2ozWnlYbE01c2pOczhzeTRF?=
 =?utf-8?B?Yy9KRHRucnRVcmx6VEFMNG9iQkVHMU84dzNjK3pPZFVaTHZab1FHZlQxa0lz?=
 =?utf-8?B?b1FXcFkySjk2MVVvbXEzVENPbGZLRTlaTVpIdFBMbTMybjZiYXcwZHVHWTR5?=
 =?utf-8?B?RExpazVRVXZCMjlsUWluUzRuOWdDSCtmeUlSeXRsdElYb0NTRXNpdnpYSnpP?=
 =?utf-8?B?SGdwNDRQTUtGMlc4RXlTazNjTXJyczc3Z1lCcHNXcWc3NTE5TVkyVW5IR0JH?=
 =?utf-8?B?b0JPODg5Q3hlMlpWTVBMN3pnYSs1eTdVNjVtU0RrUXp6RTE5aTBlN3Y5clRQ?=
 =?utf-8?B?cGNVa3RIRjVubWloR09xbDdIL0psUXNVQXFRYk9lNFA5bUlEaDR2YzF4NHl2?=
 =?utf-8?B?aWtWdEtqNGVYcWRlb3h6Y214QXVqTWNNdEtRaG8yRURZT2FkZk5xMTVDaVNz?=
 =?utf-8?B?Q204c21jY2dFbER6dHhoeG1BNGZ6WG1HckJQZHRJWmQ4dHlTS1BWVXJESVJH?=
 =?utf-8?B?Tnk0M09wcTdXeEZuMGp5dVl3SFRuOXhNVzFvaitaMlhjcTJxRXREVEZzK3Yz?=
 =?utf-8?B?SUtjbUlveTJUSVo3TEV4c2dzYnRPNUpibUpuSjFZb3RIWXFoellQOTU3TW1t?=
 =?utf-8?B?VXBqejRqMVJ0QlU1Zm9XZThJc3BxRytPZzRBWGNURHo5aUM0REJDWWR4ZWM0?=
 =?utf-8?B?K1RqOTl4RUo5RE1ocHVzZnRYRjVQRUUrazhPeHZiSE4xL1pjSnlndXdPZ2tm?=
 =?utf-8?B?TGhJa1l0YjJyc2JuaXdHdlZMemlpbGtFckdRMU1WcmZYTWZ3NzBRU29HczJk?=
 =?utf-8?B?VlB6UnEyNVZrUEJpb2hEdVY1TExQUndTU1NoUHAyeURkSURKdnBIZm1RNmNp?=
 =?utf-8?B?SGw2eFIrQjRIUWgvNE1KcHhJK2RYeWZhQmJiUFJxTlo2QUtETTZNVHByNjFq?=
 =?utf-8?B?M2ZHMFl0WGNhMUMxUEFZWHkrR1JDaVJCQyttQ2NpblpZQWdxQllRbENEREUv?=
 =?utf-8?B?N2doRUR3Rzk5RzEzUW1XY3dESDlub1NUMmFiMTlWMS9UcWZzSFFoeDhnbnYy?=
 =?utf-8?B?L2U5YXQ2TWoxUEE2RVFOZzUrK0RxY2d0ZEUxQ0dOVVZIeTFjcndRdlp6OG5V?=
 =?utf-8?B?dmRRVm1ENmY2OUdNRUNRdzlxWUxFVjNrL1pDVHBjQTNPelhrcnFYWXYvU0RI?=
 =?utf-8?B?T0tmb1gyZEFOd1AxVk5aK0F4L3hnTGpTSFBVSnhvbUVvQXcxNGlSTnY0dUR5?=
 =?utf-8?B?T1I2UDQyeWROSVlaOE01R2x3c2RPbC9zSVcwUnhHb1NtL2J3TGozck93c3BF?=
 =?utf-8?B?NXhtdmpkajlWQWJqR1NKenFyM0xTckE0TDdlTmhUMXNqMUNoNExwbzg5dTg3?=
 =?utf-8?B?SjdKQWJzdCtCZEZoajF6T0txUVd3U1dSd21FbU5lR3owUnFIUzA3R2RLcWFp?=
 =?utf-8?B?b1pNRzh5UHR2YjZIVVVWa0JuQ2VBd0Q1VXBxMmVYanBZNUhGTUxlZUl5VkFj?=
 =?utf-8?B?QzZrbUhPYXIwS05RWHJmUkVJNXR5R2ErSnlzU0ZhOThWMm1PYzFmazFoeUVG?=
 =?utf-8?B?a3ZUcWMwcjlac243UHgyUDVTMndlNit0RDFCMFFBUUpQUmdObEpDR3lSUWZm?=
 =?utf-8?B?cGlZZjd6bmJvUk9EbGdQZnR4MVpubzg2UXlqSlBpYlFLSmx1WEtxcUQvSVNS?=
 =?utf-8?B?dEdLSlRiNkgvVUxiSElhWng5QmxabldZSWxWTzlpd1dzZlhENFNkTzY2bktF?=
 =?utf-8?B?YS9ITFJWcnFZeGVlQ3VEeUxHdHMrREFqdHZ2Y3FhYTFCNURncGltVkxFQy96?=
 =?utf-8?Q?QtyWELBRc+jBSlEf92Qi1nzn/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d3c75f6-7187-4766-a2ee-08da94dcb8d5
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 16:34:55.0131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U6v1diUf62pukD21VhcU8v2XJxl5z8REXmpfqyKSn9NPzvA4kYqLAmMl5n3d3LfLiSnJBuFXe9OkrLj22eGVSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7662
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 9/12/2022 9:53 PM, Limonciello, Mario wrote:
> On 9/12/2022 11:21, Shyam Sundar S K wrote:
>> Hi Mario,
>>
>> On 9/12/2022 7:31 PM, Limonciello, Mario wrote:
>>> On 9/12/2022 04:06, Shyam Sundar S K wrote:
>>>> AMD PMF driver provides the flexibility to turn "on" or "off"
>>>> CnQF feature (introduced in the earlier patch).
>>>>
>>>> Add corresponding ABI documentation for the new sysfs node.
>>>>
>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>> ---
>>>>    Documentation/ABI/testing/sysfs-amd-pmf | 11 +++++++++++
>>>>    1 file changed, 11 insertions(+)
>>>>    create mode 100644 Documentation/ABI/testing/sysfs-amd-pmf
>>>>
>>>> diff --git a/Documentation/ABI/testing/sysfs-amd-pmf
>>>> b/Documentation/ABI/testing/sysfs-amd-pmf
>>>> new file mode 100644
>>>> index 000000000000..c75d7426c2c7
>>>> --- /dev/null
>>>> +++ b/Documentation/ABI/testing/sysfs-amd-pmf
>>>> @@ -0,0 +1,11 @@
>>>> +What:        /sys/devices/platform/AMDI0102\:00/cnqf/feat
>>>
>>> Presumably future devices beyond AMDI0102 can possibly support this too.
>>>
>>> So maybe this should be "/sys/devices/platform/*/cnqf/feat".
>>
>> Yes, but still we have not reserved a new _HID for future programs. So,
>> I think its OK to leave it as-is and update this file in future when
>> such change happens?
> 
> Documentation is one of the things that is most easily forgotten to
> update when it's just adding a new _HID, so that's why I was suggesting
> to get it right "now" if CNQF will likely be available on the new
> programs too.

Agreed. Will take care of it in v3.

Thanks,
Shyam

> 
>>
>>>
>>>> +Date:        September 2022
>>>> +Contact:    Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>> +Description:    Reading this file tells if the AMD Platform
>>>> Management(PMF)
>>>> +        Cool n Quiet Framework(CnQF) feature is enabled or not.
>>>> +
>>>> +        This feature is not enabled by default and gets only turned on
>>>> +        if OEM BIOS passes a "flag" to PMF ACPI function (index 11 or
>>>> 12)
>>>> +        or in case the user writes "on".
>>>> +
>>>> +        To turn off CnQF user can write "off" to the sysfs node.
>>>
>>> I think you want to have a comment here to the effect that "systems that
>>> support auto mode will not have this sysfs file available".
>>
>> OK. Will take it in the next revision.
> 
> Thanks.
> 
>>
>> Thanks,
>> Shyam
> 
