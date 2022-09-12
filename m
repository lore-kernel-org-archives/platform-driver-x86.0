Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DCB7C6FA82
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Sep 2022 16:23:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbiILQXX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 12 Sep 2022 12:23:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbiILQXV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Sep 2022 12:23:21 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07on2058.outbound.protection.outlook.com [40.107.212.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B1BC2A73A
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Sep 2022 09:23:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z37WdDYKBMHsTxvv4cpdWf1TcUC0jcv31EuuM5TQbL+bF6DeklZbdKa4YzR2iM05/lhV7b1PW45hwsxPwXCv1zdKEZzTrdkq0C8I6bs5tS0t5F3W6fkKP8ruGsNaWmXucoj+OZe5nF09/f8wurUEV2shjJhSqmrA/Lt0mCvv9y3YGy9tc4D7ls7JCzsK0qquNtz8P+YKc3LxYVhUjRhtkaAbhCfWVnZZF/dP7Ju+uX492g98EHtOA3xnXG/MyuIwSLYC3zPVLbEC911sdAmzdix/y8/yTfrmSTzJJ2ccA5Mia4eSO6JfrtfxKasDG8OP2Hj/d/8+UCRtn8y60g99Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSvkgsJWIISHZrkIQihXY3TQelmxNA9EwZSp97VErZg=;
 b=Svw9+5ek/vtlukvD8qv0zM2dWaoVQ2rgXBBSqacXUrVShDgCCi4ycMJFw7VOwDiwaFUyEAHWjj4c/O6pxpT3JfD8pk44C+6TJdFR43LOnyHginrEkcvODMqeBdK9LAy5CbZTTgvqeJMy8FP807ONDQZd06e5P7fBS6ikdKwDSY1yEBwWqQCumafxPD57XTTjQ3QAFqZkqOHH1916ceu8nE+I63yydCd70KYn3/nb0Cqd+LUHdYE7xudP5SuCgWfQalbyHpbYgQTFaXOjD89HBrMpV0lz1KvceFocT89062mx+ymQI8jmztyoKpHY9mrSSRUALDzFYRFvvAU6TGf7GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSvkgsJWIISHZrkIQihXY3TQelmxNA9EwZSp97VErZg=;
 b=vQ/wVW+ErlKJIo7c2A6qNorg0+Lt1P0dovFy5Onk0soK4cF54aNlVXLvnaAq1scSSC7rlxSpGp6RBg1UlxWqWy2HUPbNmmBhRuAW+FDVzuENg5PJLbQKYH33lXr2YeQYrq1r9iZu6QDXRdbz2B89bTbS8ARQjMPUMdWYTjJsUrg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ1PR12MB6313.namprd12.prod.outlook.com (2603:10b6:a03:458::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14; Mon, 12 Sep
 2022 16:23:18 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3565:585c:3431:216c]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3565:585c:3431:216c%7]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 16:23:17 +0000
Message-ID: <8e68ebc1-b4a2-c2f5-7bf6-138178bad107@amd.com>
Date:   Mon, 12 Sep 2022 11:23:15 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 3/4] Documentation/ABI/testing/sysfs-amd-pmf: Add ABI
 doc for AMD PMF
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        bnocera@redhat.com
References: <20220912090641.111658-1-Shyam-sundar.S-k@amd.com>
 <20220912090641.111658-4-Shyam-sundar.S-k@amd.com>
 <3bf7a091-5757-a4aa-6492-30ddb4b2cea5@amd.com>
 <c1560ca6-442e-2770-c2c5-60d40f6f7aba@amd.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <c1560ca6-442e-2770-c2c5-60d40f6f7aba@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:208:335::17) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ1PR12MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: 5357673e-0c88-48c4-d46a-08da94db19a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: srxzf07LCn9ek2PjxjmewUPVX8xozmr2xAxbmB1nycft6C7XF61788uU8H8Wq0BvkohkN17WOMIBYb06BvitqcOD4n7KymtKVp4I+2SZaZiW+hPmXaGSUy/YGHxsiJ0oGep78ndnJx8q2L6UzEG/5e+5rT5Cj/e2dTlW0qSVpO8sfIhE1nuteDsk7lkeVZ6fERZUtBYFFJwaYODvNSVpF665y0/IsyCSaSfJvp8UPu037XAO0+JGeNsuZrUGzYFim58QXVmLaCczhTRX8gOUB3jwz87EwkPELaG04HTtm9aTIXxWtnji8C5itwjAcA5WR/oW5vQnq2+9grgispivxs4jB8YwohBMRun7GVgG61NuylvxMzrk2xD8EauMSKN+S9jDDVMye1q9FvMHAQIr5/3zLjcy20UJITQt5+7iJ+HmoKii35d6XLiYGw6PYwQkRLyBw8Jlh4ZHYi4S5tjYsA9ddG0GR5oS7GZ+kxiR3p/TQ5KBvSu67woBZWedVGl+2IDxGs50h5zfDYQ9vTPycmG6sce9ZhmuFIMCtw/pkgNgwtdz5/uAtWwt3MSxeoCtJxy4oQJm2/CwEtsHdwtZbs2Su74inK+Znm+97xSqDPGI7YmepqxBaz3V9Wvxjn5iAR+izxW5CzGLzv/YesgfLNqexiodZdQZ25Zld5iwEx5P4hIOdYbfepuxPTz7TcqNwoM6SEgC1Mo7Y77Va9cNqN+boatLHdsHbmRqSfMGrOHqxXtdej5utYZg30YCIzITFBS5BctG88zJi257jjE1hVdrogfLRXXm5nrCkyhXtyw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230017)(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(31696002)(6486002)(2906002)(86362001)(31686004)(4326008)(26005)(66476007)(66556008)(8936002)(83380400001)(36756003)(8676002)(38100700002)(478600001)(6512007)(6506007)(316002)(66946007)(5660300002)(2616005)(41300700001)(186003)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2FRVGRsb3RlVzhvMkJCZzJqMUlmMDNpc3RIMTdSL1lBaTJXZHU0VlZGZmJk?=
 =?utf-8?B?ZzNpZkxrNnd4aXpYTFVFbzdvbmpLVGNZdWlOdkJrTmhnMllaZEY4ZXBJQW12?=
 =?utf-8?B?TzJpcVJMem5NYnQxQ3piTHJaRVhlN2tYdS9GZEdjaDBxNXBxSDB1ZGxCZnl0?=
 =?utf-8?B?emREQlFML0VnemgzZXBaRTVMR1BDNFNiSDQrR0UzOUVxS0d5aHQ5eFBzMjFz?=
 =?utf-8?B?WmlQcDh6S3FKNFA1WmQ0T0xQMFZGMmQwbTBNaXRlK2pHQkY0b0trZlliNjdR?=
 =?utf-8?B?ZVhjSEwybjk1L0ZoanRqWEtac1grZjk1WEwrZllEejRxcHQ4Tlg4blpNZ1c2?=
 =?utf-8?B?ak11TEIwSldMSTN0K0Q5OWNISExIQ05uUUdVRXhtL2pJYkZ1RENESlRheDNT?=
 =?utf-8?B?YWZBRVJ3eE9tR1lPQlRHaU14UU9JR1FPQ3oxM1NmWlVtZEdNaXlYd3FTbVA1?=
 =?utf-8?B?YjNQekFOclcrVHFXcXNuMG5TSHQybThDdkFXdERkd1ZpZ1RrUlNrOUdsZ1FP?=
 =?utf-8?B?WnBYMlRrTmcrK2ZoSHVzUEF0RTlQN0h0ZEZDOVdyci94YjdwUDd0T3BLOUVi?=
 =?utf-8?B?aFJvUlUrR3AvaHMyV093OVpwYzR5aXRLKzh5azlBYk5lSm9hMWNLQU5Xa2dO?=
 =?utf-8?B?VmhNcWdpendZRGIvc1FYZE0xbVlQbFBEZDI1U3RiajlIZDRyK0QyeWlVd1dZ?=
 =?utf-8?B?aWE4ZWpNeXVLQlE4TmxudjJLVGdscUxHTlZ4cHNtaUNTd2k2bCtqYUdORkli?=
 =?utf-8?B?U0JLazdCbEFUbGFrSU8vTWxVR0h0d1BsTUZPYlM0ZkUvOEh1RmdpWDJNU01q?=
 =?utf-8?B?ZFpBdnE0MzZuc052b2pXOHhGK2xSRS83TEdESFJUUmc3TllLd090eEhEdFVE?=
 =?utf-8?B?cHlFdzBpS0lmWmlzYmhUZklJWVhjeEw1eUs4TjN3U2NhbFhNTmdHZHZZQ2dk?=
 =?utf-8?B?THplSUFFanFxSzFFVVRCZW5MZGRKWmdMdldhUUMySHZWYUZkOGtqRXhqaEFL?=
 =?utf-8?B?UDRLU292RDMxN2tEZHBzb3lOejhiVXgxQXZadStlTUZQUWh0YnRqVkM0NzRU?=
 =?utf-8?B?N2t4Z2FpaXhEejM4eWZCVWp3U1E3cURHWFNNeEdYNU4vOU9zUjF2Z05NUDdh?=
 =?utf-8?B?dFJPa29JUHZoRTRyM2ErWDE5RVVGdGtvRkpPUllVYmRGRmNrM1dSRCsxVnFR?=
 =?utf-8?B?TldWSitaRE1pVkIwem9rSW1qeGZET2FHc3h3MmJ4Wml5cXlmYTlLVko2OGFh?=
 =?utf-8?B?OFFLeTV2OEY5QVJVemV5dzRMbU12WnFKcUQzUlBPOHRROHB1Y1Y5RFQxRDFn?=
 =?utf-8?B?WUdESms1NEwxaTlNcTNNQ1NibUg3eGxKeHJ1c016eGl5OHRWWEJXcHZvUXgw?=
 =?utf-8?B?MmtaUGh6Q2N0aDB1M1FBKzlNcEcwZGJCZXBvb1plQjNaNHgrUHpYLzRoemtI?=
 =?utf-8?B?cGxaUmtsemltZlRUNXlZWHZkMkM5cEdlNFBNUGwvWng3WThrYjdCQUFJalZF?=
 =?utf-8?B?OG9TdVZqdE11ZWY3YU9na3VHcXhCdTlLaHBkSFhwK0pIZXpQb0x2RCtUZDdp?=
 =?utf-8?B?b3A2OElvVXQvand2aEJnanFpVUhtU2VIeUZPUVVOVGZsUHFiZUJBc0VNb3ZG?=
 =?utf-8?B?UzA4MXlQdUdOanV6c1NDVHdPdXp5aE03S3pVS2lzNmRvcktKQUdKNUZwVkFJ?=
 =?utf-8?B?TDRySEhQbXRDMzllNmc2Z01GOTg2MlYzV3Rid2NVekxBdkJ3dTJFWFBFMWli?=
 =?utf-8?B?WnVnN2ZSN2tvbVZ3d2NaSnh3eVZ0cFVRb09NT2ZENnNJMnVId0IxTEo1Qk9k?=
 =?utf-8?B?UXpwWTJ0Nzd3d2w3NmZZV2EwQXMvbVBzQVdxSFRSSDJMQ0RFNUQ0YjhXV0Nj?=
 =?utf-8?B?ME9sSzFicTkwcU9hTGcxSzZaOFMxYXBwMWlPYjVFbDllL01Pam5GRGxhQWJQ?=
 =?utf-8?B?QjFoK290UnY1SVcvUS80SXl3WmovSGJWejZiWUtCTmlZVkFpSHBGVzk4c2h1?=
 =?utf-8?B?SWE4bGxPK3pnWk5CMWY0cWl2aVRybDhTdTNTOWZqWEY3T2NCREZ6QmhDekQ2?=
 =?utf-8?B?TXMzN2tPMUN5c3Y2ODUyQis1TGFpNXVvaCtOam5BRVRqb2dEeVJwSE1lUUl2?=
 =?utf-8?Q?62M63N9j6hGTSkDFS2UcL24Sh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5357673e-0c88-48c4-d46a-08da94db19a4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 16:23:17.5952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dE5euxh5WZHCMWOof8NdzfXnZDu2DMfNDM1pFtNje08bX7UlCSZyhqzjdbAWelT/7tYy80E+Bi2t2JdBe4nyTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6313
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 9/12/2022 11:21, Shyam Sundar S K wrote:
> Hi Mario,
> 
> On 9/12/2022 7:31 PM, Limonciello, Mario wrote:
>> On 9/12/2022 04:06, Shyam Sundar S K wrote:
>>> AMD PMF driver provides the flexibility to turn "on" or "off"
>>> CnQF feature (introduced in the earlier patch).
>>>
>>> Add corresponding ABI documentation for the new sysfs node.
>>>
>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> ---
>>>    Documentation/ABI/testing/sysfs-amd-pmf | 11 +++++++++++
>>>    1 file changed, 11 insertions(+)
>>>    create mode 100644 Documentation/ABI/testing/sysfs-amd-pmf
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-amd-pmf
>>> b/Documentation/ABI/testing/sysfs-amd-pmf
>>> new file mode 100644
>>> index 000000000000..c75d7426c2c7
>>> --- /dev/null
>>> +++ b/Documentation/ABI/testing/sysfs-amd-pmf
>>> @@ -0,0 +1,11 @@
>>> +What:        /sys/devices/platform/AMDI0102\:00/cnqf/feat
>>
>> Presumably future devices beyond AMDI0102 can possibly support this too.
>>
>> So maybe this should be "/sys/devices/platform/*/cnqf/feat".
> 
> Yes, but still we have not reserved a new _HID for future programs. So,
> I think its OK to leave it as-is and update this file in future when
> such change happens?

Documentation is one of the things that is most easily forgotten to 
update when it's just adding a new _HID, so that's why I was suggesting 
to get it right "now" if CNQF will likely be available on the new 
programs too.

> 
>>
>>> +Date:        September 2022
>>> +Contact:    Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> +Description:    Reading this file tells if the AMD Platform
>>> Management(PMF)
>>> +        Cool n Quiet Framework(CnQF) feature is enabled or not.
>>> +
>>> +        This feature is not enabled by default and gets only turned on
>>> +        if OEM BIOS passes a "flag" to PMF ACPI function (index 11 or
>>> 12)
>>> +        or in case the user writes "on".
>>> +
>>> +        To turn off CnQF user can write "off" to the sysfs node.
>>
>> I think you want to have a comment here to the effect that "systems that
>> support auto mode will not have this sysfs file available".
> 
> OK. Will take it in the next revision.

Thanks.

> 
> Thanks,
> Shyam

