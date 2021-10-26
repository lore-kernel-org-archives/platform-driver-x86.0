Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F5AFC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 13:12:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 342D0600D4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 13:12:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235203AbhJZNOa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Oct 2021 09:14:30 -0400
Received: from mail-dm6nam11on2045.outbound.protection.outlook.com ([40.107.223.45]:25062
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230324AbhJZNO3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Oct 2021 09:14:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cdDOed6c1w+bxEWrX4tLS8blaHm/Mxym/YsjQc+7aEUg+TGdrHHjW2y5+wFAZoTCyGf+ZfvVe5ZblQvMagA0uU8Nv8kSjZjfFlfqSLUFwncmwb3KfRSJcp1Cj1KyeDa4ruq9oRGj43EXmaYIUdmCjVAKxdz5YyQaBSzhQMbuVgaXHVrif8u/tsMgpInsScJecP32FmlvIUX03wzOBBthEIGIxthVZhXQCLDvqK+OOd0dPYY89KOdIFe5o1L/xSyECXEPPeBLSo45iVRBL1WgSd074qOnRHM+PjTA5ATqC7zZ+sJa2sCPRDPT/Qy4nZ6HBeh9WAPyBDLGdHfbEEsFmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xqjYq4a3JqXL7OyC5PCjoqm4RK/rLStfJ/cTTfXXS7s=;
 b=nbN3p1vQYLupx0cSeA9gYCviWnCWzfabcVKQutAHvrrqJkVS9akzpsfR/LUzvBdz/CKWqOKQxr6sOzkMcT3R1c7Cjd/7diwOJb7aZgyLWNbyXcGIlW7ZSilOaP6pxyOHjVFaINh5qbJtdFvTsjOWxVCD2K/vahCuGIPaM4Ed8fwFmb/cuN+Eky/MSZFebMQuyLyRLMbrpw6J/so1ZO44t3WFV0NUmUbkorocn22Tet5CnP+3ZJaiaXZZWYooOdkgBmliZE/G2mhseiMKRUrI2kJE38DHzAftfhME3xIVgbvYIDAwIz7pr/u0JdUgp2+JElPjQAgsA5HFAUYDfNrhwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqjYq4a3JqXL7OyC5PCjoqm4RK/rLStfJ/cTTfXXS7s=;
 b=rSDnH0/no62BDT//f0Pdgs4EnaM6qjevr1ZUcb4ON8mOkruswecYj8uHWXQsWUu5gWrG5vOe182WU8O5awpisdk84hnRuSxLjKm5PmDMt3QCfrNf/8oYhd/sjiQ/tZfJxHJMpxkL0+dvzacYH/r+pJvGEHxi0a90KhnCpM6twfM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by BL1PR12MB5240.namprd12.prod.outlook.com (2603:10b6:208:319::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13; Tue, 26 Oct
 2021 13:12:04 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::e8e1:a20d:de7c:8b53]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::e8e1:a20d:de7c:8b53%3]) with mapi id 15.20.4628.020; Tue, 26 Oct 2021
 13:12:03 +0000
Subject: Re: [PATCH v3 3/3] platform/x86: amd-pmc: Add support for AMD Smart
 Trace Buffer
To:     Hans de Goede <hdegoede@redhat.com>,
        Scott Bruce <smbruce@gmail.com>,
        Sanket Goswami <Sanket.Goswami@amd.com>
Cc:     mgross@linux.intel.com, platform-driver-x86@vger.kernel.org
References: <20211022172845.2608-1-Sanket.Goswami@amd.com>
 <20211022172845.2608-4-Sanket.Goswami@amd.com>
 <CAPOoXdE0vA7ygcU2UMvd1Sb9PBMhBkJ4Dv8Y8bP9jN7i+bdrRA@mail.gmail.com>
 <31537399-332f-1013-1497-bfdf5de93c51@redhat.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Message-ID: <f079d480-87a6-17a0-fd79-4f7a3fc52fd4@amd.com>
Date:   Tue, 26 Oct 2021 18:41:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <31537399-332f-1013-1497-bfdf5de93c51@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR0101CA0057.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::19) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
Received: from [10.136.40.143] (165.204.157.251) by MA1PR0101CA0057.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:20::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend Transport; Tue, 26 Oct 2021 13:12:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd6aaa19-964f-426b-56fc-08d998823408
X-MS-TrafficTypeDiagnostic: BL1PR12MB5240:
X-Microsoft-Antispam-PRVS: <BL1PR12MB5240FDC0895620452D4B9F7D9A849@BL1PR12MB5240.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7XaWiq+ub7vapHYCvXkKXmmMZqk2Ojs6X2cBfDCF66qRSDwjsp26nRO9giYik0podKQKSy/GlgU3cpbdiQns5hzae50dMd1AP1ru8L6c7BbHHfSuSgkSkgbcxbUvXiAIBp2QNOz6eRLcbOX6uYnS7mf11tkkjkeso7tdXLdWDY1U5rW1Vb6DGMHKi2z5mr33b2S+oUfZ9+ITJiuAXPW2rNm6byonPxS4C/MHiEmhHa/0NlHR5bLbiAJHAIx645vKGu97PTsbuCP0eI0q9C0xMuIHT8pOy7D/Z1YipYy5hiGNl/F6gIufVALs1u/8Jilu20w73qsDzUMfgTAJfZEAE5BLwOvE3oUZRGDdskz/yERi8YeT917arrrrXuMsbneZs3/G9l4FIJ7oxvl46lmy9RDdqUQ9YmLvw3jba2xWsKzg3LRNngAVAX5aNHe2EKLigsSQDTKADADAuD7Ztfe3msR8cnaFM0LkHmDF6I83Nw60zEgJvZZa+kXsW2MXo/LSGyvm0sfnDCGEbdYvNqNcLAvtn7KjwQncMC6Fk3dcZHv2W877Zx8Dst5ypmAriZrnTtqo9ya63Bepn0eCOZViMSVMBcn61rze90HW6kgzrgwGE9STxS7T5IDQBRPokCpYvXDl5zZxwkz89Tr7gx78k6iYGTXuAsZ+qtvLa5I1N6jEb0fv2o6VB/7QwBguXOYc5xMaemczqlP96WC/YDGkAb2S1Ruul7WD8wWAYiQ/RlPBa/lqgaEECO+LAe7Uw/VACuIF7+qbA6KQO/RfNBnuivNCkZCxqa2j/zgGq50JpQgqVM6W3K0GHWmn/t8ccLkWyMrkYdR3nbJUUBDU9vtzGSLAffqfcLuE0ptot0ImY29Mjum23337LT1uemvg9Wzr
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(186003)(66556008)(66476007)(66946007)(45080400002)(8676002)(86362001)(508600001)(36756003)(53546011)(31686004)(16576012)(31696002)(2616005)(316002)(5660300002)(4326008)(38100700002)(956004)(6666004)(966005)(2906002)(110136005)(8936002)(6486002)(6636002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXQwR0hkOFJPRGN5MEJ3WmwyZEQ1czdtMlVQOEVEVlRJZHBjNjk5YVFvWUgy?=
 =?utf-8?B?bTltb0JqWTdqaUs3K1p2MGNocTJiNk5sZDFWZzFlWlgzRU1ua3FoTlpOQlE1?=
 =?utf-8?B?RXB0NDZtK09ZRUUveGhtVEJtNkxDeTVoZVgzNG1WZXVaS0wyYmdCcGY1QnFG?=
 =?utf-8?B?bXU3MHlXRHBPRTZORndJcVVaNG4yMFkvejBpeFcrZE1IbXg2dEd0eWRKVmVv?=
 =?utf-8?B?Misva283SmVJYndpUzBTTTdGU2d2YUxOSHpDaWhNWDJVOHdRYmc1OXIwbHN0?=
 =?utf-8?B?REZkUnhhMUJ4b0tRYld1MnppWk0vZVVEMXBGYTg0ZjhSTFhLaklvUTRGT3F0?=
 =?utf-8?B?QXVNay9YL1ZNRzFjUGdkWTNEWm5WcXV6UER6QWlXdGNkT1hhVk8wVkpPNXFi?=
 =?utf-8?B?YzJFUXN3dnQ4UWJiVlJJakFXVFhLMXNJbU5VTVh1SElaYytwRDBWTXVEZzdN?=
 =?utf-8?B?K0Q1RTlwbVlQclJXeUlZNjZLMnRkWkl1S1EvaDBZVEFuelh3Z0VZRFBVRVhH?=
 =?utf-8?B?VTFlMHk0bkl3YjZTMGpNN3ZqNUZEQXNVZTNhb2gzOTU0QXBBRitTZVRRZE5J?=
 =?utf-8?B?VzdaVjd0VFdidGg1M1dpeWkyTU1RWkw0SG5vYXBiZTFzcjJiVG9lakFOK3N3?=
 =?utf-8?B?MGpGdDV6ZXJyRExlUmhnMmhYdTVyanZ1NjZYZldQb2lrdWxJdDA3dmE0Nk1Y?=
 =?utf-8?B?MDRDWXJRLzY4QjNGVCs0MktUK1VMOVJHWllQOFNxUnJ4a2JJVnp0UlZwQ0o3?=
 =?utf-8?B?SFkzcmh2ZVFVSHVJSU9ES1lTOHJqUG5HdTlyTng3SXlJUUIzaTNhZ2JKVVFI?=
 =?utf-8?B?c013cStPRXc3MXdXMXpUTzBVYTEzcVBNeTVuNmdhK3RRWDlsNkFERXFYR2dH?=
 =?utf-8?B?RktneE9GNS84YlNoMUtUWXNCNzdoVDkrd25HcXlTR3ZmS1dnTVErbU9TUEwr?=
 =?utf-8?B?em5Qb09MZ3VZdUZkQ3grc1RJaStUNjFyMGk3YU1iZExmUWJkVkREK0RJb2Rq?=
 =?utf-8?B?dGk3UkYyaHhvVy9ucW1qRHNPUlF5SnNZUFNPMzNTQjhMaGVkRXJ5aEhyYjB3?=
 =?utf-8?B?bW5RUU00MXdBQ2RvNnlBYmdwazU2eEhKUnArNGVHK2xFbTVCU1Exb3pvT2ZT?=
 =?utf-8?B?K3dRaXUvTlYyN2ZIY1JHczRMaWN6cU5oWVlmTmFaeDJlRHoweUVocmtGU0h2?=
 =?utf-8?B?b3g4VktpdGFmS0R1MzFLck1yVk96Vzc4dS9LQjZmdk5XQVMvMnZINVFEaGN3?=
 =?utf-8?B?eTFXbGlyUkxzNGE4VC9WdHQ1clJKa21VV2xnSEEySSt3b2JzcDN1NzVSSHdV?=
 =?utf-8?B?a1BRUE5RSVhvdzgzZkY1U2luL1M5WEV2WC9QZ3dPbHd4NU95TW5FYnFScTdJ?=
 =?utf-8?B?T2dweWVtUmwzQWZBeU41YTNtZG5jK2hONUNDZVpPaDhWL3EvMTM5NDBVbU9D?=
 =?utf-8?B?Y0o3dmVpdENnOFJQcHRkUWVuMHN3VU1JYU9ySVpicjhaT1hkVnA0bmhBVWNp?=
 =?utf-8?B?L1FUYURXWFNPRkEwcWw4MU5jb202ZkZtbFIzMzlBVEVsQTNYZ0JGV2R6ZnBM?=
 =?utf-8?B?VGhtN0syQnJSUGlJV1Y4SHR4Q3FGbXNCNFNoWEtrbFBiUEtzUkRiSnY4OHNo?=
 =?utf-8?B?WXR1STJYY3MrWHhVYlJSRjNXcjRjVkljclpyeXg1VzRYTFRZL0xIekc5Nzd6?=
 =?utf-8?B?VXJ4N2ppRi9ZVkIzcTlpY2lTQnhsNmpSRVpkeVZvaFhYQUhmUUVyQTRqeGZi?=
 =?utf-8?B?aDNpS3dDSDIreWxYUnNNNEs5eU5TMm84bDRLWCtzenJRdVgyYlorT2dVaFFG?=
 =?utf-8?B?L1BCTDRmWG9DWUhnRzRxc0xYWXc3S2hkWGJQQTNDS1YvY291eGE1c1NPNnpX?=
 =?utf-8?B?RjVTVm1uQk5UVEpLQ0Z1NldRS3dpdEVnZlM0U1JhNzRwSytPWXY1R3kvdEtk?=
 =?utf-8?B?Rk1sOW0zeHVBREdKOVVrM2RCVXR6bHNKUUhSRDkvM1VMcGtYeXdIMjdDc28z?=
 =?utf-8?B?YUdnakJ4ZVJ6N1pLR3AxVTBOSTArZEJhSDZjZC9RYVFtRnhTVnFhK3R2WkJo?=
 =?utf-8?B?K2RQUG5IWFhVS2dGemZXaGhxZFI3eW93Wm5LOHVDL3RRTWhwSmNkazhocDRU?=
 =?utf-8?B?RWp0MWkwTy9PcHJqT2o4NWRpRkFlaXZpcG1yd1o5OGdlajZIN0N3WHVxVU9S?=
 =?utf-8?Q?JD+4nqB022ulDQICEuOYiOI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd6aaa19-964f-426b-56fc-08d998823408
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 13:12:03.7828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zr0P9DLqys5GC0l3RpFOO55WoSPwZ0B9tkBDcWSsrJKF2iZ8+8Qo2O3U5TzQhywxw0ls6zxCYNqe+5WHuCJo7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5240
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

On 10/26/2021 6:22 PM, Hans de Goede wrote:
> Hi,
> 
> On 10/26/21 13:21, Scott Bruce wrote:
>> v3 of this patch hard crashes on my Cezanne laptop on the second
>> suspend attempt. The problem appears to be with the 3rd patch in the
>> series, the first two don't cause any problems.
>>
>> This tree suspends fine using the original v1 and the first two
>> patches from the new series:
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.com%2Fsmbruce%2Flinux-stable-s0ix%2F-%2Fcommits%2Fv5.14.14-s0ix-testing4&amp;data=04%7C01%7Cshyam-sundar.s-k%40amd.com%7Ca0b2dfaf70ee4091a36a08d9987f7747%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637708495523824431%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=AtjU3HscisI4B%2F5SKvecI5hcRnkwxCcTU5oIrg7CkdI%3D&amp;reserved=0
>> This crashes: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.com%2Fsmbruce%2Flinux-stable-s0ix%2F-%2Fcommits%2Fv5.14.14-s0ix-testing3-DONTUSE&amp;data=04%7C01%7Cshyam-sundar.s-k%40amd.com%7Ca0b2dfaf70ee4091a36a08d9987f7747%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637708495523824431%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=qxO46Cs%2FYIXBd%2BUYy0fwl9YEodFTTHdA%2BRjDUy2NAGk%3D&amp;reserved=0
> 
> Weird, I wonder what changed between v1 and v3 to cause this issue,
> AFAIK there were only code cleanups.  Sanket, Shyam can you work
> with Scott to resolve this ?
> 
> I'll hold of on merging this series for now then (until this is
> resolved).

Sure, we will work with Bruce and see what's going wrong there.

Thanks,
Shyam

> 
> Regards,
> 
> Hans
> 
> 
> 
>>
>> crash journal: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.com%2F-%2Fsnippets%2F2194519&amp;data=04%7C01%7Cshyam-sundar.s-k%40amd.com%7Ca0b2dfaf70ee4091a36a08d9987f7747%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637708495523824431%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=0OFrXXQTF%2B4RwFOrba1XVJPJyrCgcd3sg9hqrvk42ks%3D&amp;reserved=0
>>
>> On Fri, Oct 22, 2021 at 10:31 AM Sanket Goswami <Sanket.Goswami@amd.com> wrote:
>>>
>>> STB (Smart Trace Buffer), is a debug trace buffer which is used to help
>>> isolate failures by analyzing the last feature that a system was running
>>> before hitting a failure. This nonintrusive way is always running in the
>>> background and trace is stored into the SoC.
>>>
>>> This patch provides mechanism to access the STB buffer using the read
>>> and write routines.
>>>
>>> Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>> ---
>>> Changes in v3:
>>> - Address review comments from Mark Gross.
>>>
>>> Changes in v2:
>>> - Create amd_pmc_stb_debugfs_fops structure to get STB data.
>>> - Address review comments from Hans.
>>>
>>>  drivers/platform/x86/amd-pmc.c | 120 +++++++++++++++++++++++++++++++++
>>>  1 file changed, 120 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
>>> index 50cb65e38d11..665d57ff222d 100644
>>> --- a/drivers/platform/x86/amd-pmc.c
>>> +++ b/drivers/platform/x86/amd-pmc.c
>>> @@ -35,6 +35,12 @@
>>>  #define AMD_PMC_SCRATCH_REG_CZN                0x94
>>>  #define AMD_PMC_SCRATCH_REG_YC         0xD14
>>>
>>> +/* STB Registers */
>>> +#define AMD_PMC_STB_INDEX_ADDRESS      0xF8
>>> +#define AMD_PMC_STB_INDEX_DATA         0xFC
>>> +#define AMD_PMC_STB_PMI_0              0x03E30600
>>> +#define AMD_PMC_STB_PREDEF             0xC6000001
>>> +
>>>  /* Base address of SMU for mapping physical address to virtual address */
>>>  #define AMD_PMC_SMU_INDEX_ADDRESS      0xB8
>>>  #define AMD_PMC_SMU_INDEX_DATA         0xBC
>>> @@ -82,6 +88,7 @@
>>>  #define SOC_SUBSYSTEM_IP_MAX   12
>>>  #define DELAY_MIN_US           2000
>>>  #define DELAY_MAX_US           3000
>>> +#define FIFO_SIZE              4096
>>>  enum amd_pmc_def {
>>>         MSG_TEST = 0x01,
>>>         MSG_OS_HINT_PCO,
>>> @@ -128,8 +135,14 @@ struct amd_pmc_dev {
>>>  #endif /* CONFIG_DEBUG_FS */
>>>  };
>>>
>>> +static bool enable_stb;
>>> +module_param(enable_stb, bool, 0644);
>>> +MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
>>> +
>>>  static struct amd_pmc_dev pmc;
>>>  static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
>>> +static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
>>> +static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
>>>
>>>  static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
>>>  {
>>> @@ -176,6 +189,51 @@ static int amd_pmc_get_smu_version(struct amd_pmc_dev *dev)
>>>         return 0;
>>>  }
>>>
>>> +static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
>>> +{
>>> +       struct amd_pmc_dev *dev = filp->f_inode->i_private;
>>> +       u32 *buf;
>>> +       int rc;
>>> +
>>> +       buf = devm_kmalloc(dev->dev, FIFO_SIZE * sizeof(u32), GFP_KERNEL);
>>> +       if (!buf)
>>> +               return -ENOMEM;
>>> +
>>> +       rc = amd_pmc_read_stb(dev, buf);
>>> +       if (rc)
>>> +               goto out;
>>> +
>>> +       filp->private_data = buf;
>>> +
>>> +out:
>>> +       return rc;
>>> +}
>>> +
>>> +static ssize_t amd_pmc_stb_debugfs_read(struct file *filp, char __user *buf, size_t size,
>>> +                                       loff_t *pos)
>>> +{
>>> +       if (!filp->private_data)
>>> +               return -EINVAL;
>>> +
>>> +       return simple_read_from_buffer(buf, size, pos, filp->private_data,
>>> +                                      FIFO_SIZE * sizeof(u32));
>>> +}
>>> +
>>> +static int amd_pmc_stb_debugfs_release(struct inode *inode, struct file *filp)
>>> +{
>>> +       kfree(filp->private_data);
>>> +       filp->private_data = NULL;
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +const struct file_operations amd_pmc_stb_debugfs_fops = {
>>> +       .owner = THIS_MODULE,
>>> +       .open = amd_pmc_stb_debugfs_open,
>>> +       .read = amd_pmc_stb_debugfs_read,
>>> +       .release = amd_pmc_stb_debugfs_release,
>>> +};
>>> +
>>>  static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
>>>                                  struct seq_file *s)
>>>  {
>>> @@ -289,6 +347,10 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
>>>                             &s0ix_stats_fops);
>>>         debugfs_create_file("amd_pmc_idlemask", 0644, dev->dbgfs_dir, dev,
>>>                             &amd_pmc_idlemask_fops);
>>> +       /* Enable STB only when the module_param is set */
>>> +       if (enable_stb)
>>> +               debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
>>> +                                   &amd_pmc_stb_debugfs_fops);
>>>  }
>>>  #else
>>>  static inline void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
>>> @@ -488,6 +550,9 @@ static int __maybe_unused amd_pmc_suspend(struct device *dev)
>>>         if (rc)
>>>                 dev_err(pdev->dev, "suspend failed\n");
>>>
>>> +       if (enable_stb)
>>> +               amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF);
>>> +
>>>         return rc;
>>>  }
>>>
>>> @@ -508,6 +573,10 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
>>>         /* Dump the IdleMask to see the blockers */
>>>         amd_pmc_idlemask_read(pdev, dev, NULL);
>>>
>>> +       /* Write data incremented by 1 to distinguish in stb_read */
>>> +       if (enable_stb)
>>> +               amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF + 1);
>>> +
>>>         return 0;
>>>  }
>>>
>>> @@ -524,6 +593,57 @@ static const struct pci_device_id pmc_pci_ids[] = {
>>>         { }
>>>  };
>>>
>>> +static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
>>> +{
>>> +       int rc;
>>> +
>>> +       rc = pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_ADDRESS, AMD_PMC_STB_PMI_0);
>>> +       if (rc) {
>>> +               dev_err(dev->dev, "failed to write addr in stb: 0x%X\n",
>>> +                       AMD_PMC_STB_INDEX_ADDRESS);
>>> +               pci_dev_put(dev->rdev);
>>> +               return pcibios_err_to_errno(rc);
>>> +       }
>>> +
>>> +       rc = pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_DATA, data);
>>> +       if (rc) {
>>> +               dev_err(dev->dev, "failed to write data in stb: 0x%X\n",
>>> +                       AMD_PMC_STB_INDEX_DATA);
>>> +               pci_dev_put(dev->rdev);
>>> +               return pcibios_err_to_errno(rc);
>>> +       }
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
>>> +{
>>> +       int i, err;
>>> +       u32 value;
>>> +
>>> +       err = pci_write_config_dword(dev->rdev, AMD_PMC_STB_INDEX_ADDRESS, AMD_PMC_STB_PMI_0);
>>> +       if (err) {
>>> +               dev_err(dev->dev, "error writing addr to stb: 0x%X\n",
>>> +                       AMD_PMC_STB_INDEX_ADDRESS);
>>> +               pci_dev_put(dev->rdev);
>>> +               return pcibios_err_to_errno(err);
>>> +       }
>>> +
>>> +       for (i = 0; i < FIFO_SIZE; i++) {
>>> +               err = pci_read_config_dword(dev->rdev, AMD_PMC_STB_INDEX_DATA, &value);
>>> +               if (err) {
>>> +                       dev_err(dev->dev, "error reading data from stb: 0x%X\n",
>>> +                               AMD_PMC_STB_INDEX_DATA);
>>> +                       pci_dev_put(dev->rdev);
>>> +                       return pcibios_err_to_errno(err);
>>> +               }
>>> +
>>> +               *buf++ = value;
>>> +       }
>>> +
>>> +       return 0;
>>> +}
>>> +
>>>  static int amd_pmc_probe(struct platform_device *pdev)
>>>  {
>>>         struct amd_pmc_dev *dev = &pmc;
>>> --
>>> 2.25.1
>>>
>>
> 
