Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AACCC54EBE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Jan 2023 21:31:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240481AbjALVbl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Jan 2023 16:31:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240441AbjALVaZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Jan 2023 16:30:25 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CF9560CF9
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 13:12:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lWPDJDFMt3bj7MoN6xv3jOD8tLvM2EQZ5nww93QdrsHbOMSmgqu/pIDW1GLGXTRQdBz3ilbFUspzpObo5mlUGyYnqnyX2vRqAF7JqHJwwY7S/EbNtq04EllpV6DT7js8xyS6NFSYXzzGLJRgcqj5IRc8/mwIlObef5yycK3uhusvCG0zzQuAO9kPubYsIc4GrwTOUXvWff1seC7w5K9zhtg3C641zGfzuGmsc3wPy1kh8TDoijhgh6CvD6URUy5ta43rqekizIZgMfau9kypWVuCpAXLe0sL90ur7bDg+TXbp9HyF3UfTn/UZHBJbePtKxK77JNwDgf8Wlp4TKO2Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAsInoFbnllIF/PU20bpdbO52Zy12eBIux5X46wkC5I=;
 b=ZLsHdZxSnJu5MtjjFv60chfzD2tghEDQTenmUJjLShKfU2DCDirD+CNOchYFLEcxFkmmQ3CiYn7HWJcIaGfsj+xKIuRzBQTBlOtMl+efak2Z/LoOacW3fBtmaWUWuEvPvb0m/366kaahUXggN85jPQ1KAktGRA136d0bVcaZdp8dFkZdkhnbXoDtoRxf72Nv0co1fJidEdzUGFyknhDGrUW6iliO5YO1Z4ngAPFNxls0BMzmo+SiGqFbThU4E2A92uwmmrMex6R1gkgMAh9lgRmJZbjn/bWLJbPn8cH2SPSTRGxwu7kHvZotufIvwQWy+alc3GGB6gyiYyiVOSA0tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAsInoFbnllIF/PU20bpdbO52Zy12eBIux5X46wkC5I=;
 b=ykU24fLPBNzy9ZvHRT51qMo/u1VIjMyugPlCpxOVSQTl+lvy+X7yRueORL2VRDWwCiLdC1u7LJc961vKoqrrIUgZmh2mjXC+3CKwg7Hxk989JPmfgfUJ7x/bm3PxkLc+s9LHk/0i9KTcZleRmO7VV5O0vwqhQWqyDYfkYk5R0lI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB8329.namprd12.prod.outlook.com (2603:10b6:610:12e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 21:12:00 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ff3c:2d37:75f3:442a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ff3c:2d37:75f3:442a%7]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 21:12:00 +0000
Message-ID: <a1e5b5b6-dc8e-f635-e7f3-b745dc950f78@amd.com>
Date:   Thu, 12 Jan 2023 15:11:57 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Remove AMT enablement
Content-Language: en-US
To:     Mark Pearson <mpearson-lenovo@squebb.ca>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <mpearson-lenovo@squebb.ca>
 <20230112204501.487920-1-mpearson-lenovo@squebb.ca>
 <MN0PR12MB6101029E8A023F5BD67D227BE2FD9@MN0PR12MB6101.namprd12.prod.outlook.com>
 <385be0a8-15d3-42ee-ac15-67eac01d9d24@app.fastmail.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <385be0a8-15d3-42ee-ac15-67eac01d9d24@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR06CA0026.namprd06.prod.outlook.com
 (2603:10b6:208:23d::31) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB8329:EE_
X-MS-Office365-Filtering-Correlation-Id: 122c952d-9579-4e00-0dd6-08daf4e1a4e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NwcF0MBT+ca6yYtohllGHVbxX65vCvhygM0TQ8Bhh8Xj2nljOncSQUskC75NKNT1mqzULKajL6scAGRMMYg2HBWJ6/f+B+pty5EdwIXEzYPDUA2sDDufdgQEsskxUpQX/fYoNvfZEjaY987DmMjOcTEuovnGPyUwduPk3irwttFqQpacXmWutvOyQ4lBX9DwIJJNtjbUfhnvkmRgWWxqUpLaiy0JX750JSKKuYdgsGUoPKwls67RDK3M2jTIxe6kZvcb0D0OYaP0B5npwUSyztR0VEiCuOK54sDd8TrMoD4QdsaayxiB5zfexFq0VxeFN7sHOLeE1OiKiMsc0gYDzBfP9nJHQtCClm8BJ3+XNcoGPIZifuHqrbEAQPGkuLN+6fIkSCajqPq5lihJpNW54fL06uZ9rleLX0qFbvkK5ds9Wc7Lmq1MiMNrrIjX9jbbf3bgbl3wY6FWz3jvuWDwGjdl5PZ0VA4nnQwovufvgTzir1UNkYbs740/TjECpgcU8z0zKBrmXtIbXMKk3F+69itdZPWryG+CQjpVivJ62azHOe5aSpfJ5gdLTKXay4AM/Q6qHAPd+L56QTbylWzKDnrw3x47OPVkFB0EEhLGnlBGtUoF7cI2KQqbSVr1yxYdcLdsq03usgHa2TbSpHgpOWVQFXiBmd4jhRkXZpXOIfDU87DA1vleVt5745roFP5q12WE0GjcXoaXC0xcJhGexhBQyxr4FDpI19WXbC3S3dyY/a1ZTq5Eh6fGKoi/45GA8WaSoly6tH6SgHy5En4NwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(136003)(366004)(376002)(346002)(451199015)(26005)(6666004)(36756003)(6916009)(8936002)(186003)(53546011)(6512007)(2616005)(31686004)(6486002)(6506007)(478600001)(66946007)(66556008)(5660300002)(66476007)(316002)(4326008)(966005)(31696002)(41300700001)(38100700002)(86362001)(54906003)(8676002)(83380400001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3U3bzErOWdKcjJyRms0STF3VUkwdGVMOExBKzdsU3VCZnN6U1ZkYTBVTm5v?=
 =?utf-8?B?T1VvVzQxbnBpbDA5Uk1FY3ducjYydGtoYzNUby9sL0JJWlIxU1Nwd05XYlRL?=
 =?utf-8?B?MGdpR21VOUgwUWlEdkprM3lQT2Z1clpnSVF3a3FGQ1duMlUvMGV4UU4zUjFu?=
 =?utf-8?B?bVZhd0dsTnoyelE2c0pkUGdNWEpaZDVrZEJWYkNjQmhKSVlEbTNqRWFwU2Uw?=
 =?utf-8?B?UGZ0RjBxRTFpclFzMTlaZ1VpYmIwMmsxTnNyeUd5RzArYjAwOWdjVGEvZmdQ?=
 =?utf-8?B?R1FNcFEzYytKQWJPb2RybXdIYXBGMzV4MENVWkJkZ080Y1lXR0c5SUVaKzM1?=
 =?utf-8?B?TkJ3OEdmTm5XM0ZlSmk0dVkwUjhMZzlwU3NhY2QzYTRTbUc2YUt5ZFRoSm5q?=
 =?utf-8?B?WTIwVXRvZ3dWNHU5WVgxQmQyNHNtWVlQOGdGOWsrMjY0MUNXTG5ySTJMbTRV?=
 =?utf-8?B?NmVDQ0pHMXpFcVNESnhxVDg3MmVaUE9qN0hMS2YyZlNjaG53VFFtdk0rS0hz?=
 =?utf-8?B?QU5PREVtZFNULzZYNnFtYy9vVzJsRzloS3F5V05zZG5SL2dWTEJoWlo3MDRz?=
 =?utf-8?B?ZWxOWGt3c1JNaTlqSkhzN2paRVJCQmJSUjUxbEdhcVJWU2VVY3dUYmxBMDIz?=
 =?utf-8?B?VXpVUlVYbkE3NWNPSGJCK2xFSUJZbFEwZmdKT2YwTHE4ZkhoS2laVW1HL2lp?=
 =?utf-8?B?NnVJMUpBdUs5ZkVuYUdMSm5SZ1lZd1h2QWptLzgwblZub2JVV0dubCtiSnpE?=
 =?utf-8?B?UTAvOUF4QzVBcThMRUNNNlRNdzgvV0xycDVpZUd6c1ZlSHV2L29kYzFDTkt6?=
 =?utf-8?B?eDF2MWFwdFA4Z0ZVS3FLTTFSUjVjeWlyaG92Q3FLOXA2MGYxRHk2L291dEpP?=
 =?utf-8?B?eCtrNnBwSGFoSkxISGI5bE9RTnNreUhIM0JZclBacGFWTVQrU3pKV2p2b2lj?=
 =?utf-8?B?ZkJMbWpVclVJaWJrQzJscGpON1ZQRFgwTlVKVGkxNk8wbGQ3MWlVSnRxTUpX?=
 =?utf-8?B?SVRGdTRtWTBwUTV0VllEbDBES2JTS3VxblVRa0NSSC9nZy84RWNYd1Q0TUVC?=
 =?utf-8?B?TWptR1NSVnRWdW8waG5kbVhjMDVHdmhxdVdtZGxrbGNrU2JwY1kxVjY1dFpy?=
 =?utf-8?B?NnNnUFBNSkpwSnlUSTVja0kyZFRJa1hnQzlrQXRZa1U5aUcvQThkclFENmdm?=
 =?utf-8?B?N0E0eEVvZ2UrNU1hR096RlRvVTVHR0VlL3o3VmFlSTZhY25qUytIQ0s5aEFT?=
 =?utf-8?B?bnlrQkJ1T200SUpPVGp2Z1ROVTd4LzRMZ3pBQWI2VG1LSXhlWm11RFBiWXlJ?=
 =?utf-8?B?NWw1QkVEVWJ5UXJZUktYU2MrK1V1d21MR2VmZTFGTmJJVVNKTkxSbkRNWW45?=
 =?utf-8?B?M2ZheVoxNFBQVVh6UG9XcjRETWozb0pYSGpOTTkwb1JmVlZXcDdGMFhkSVlO?=
 =?utf-8?B?UWE0bnVmdThqWEFncnJ5WTBUQzBUL1pIZmZ1Vm8wUTl5emtOUXNhblNZeTNm?=
 =?utf-8?B?bWI4RUdsa0ZkUWRxRFY5TFRUUGN0WjU2ZmwySFpYWHVDZmxNeTk4Tk13Tytu?=
 =?utf-8?B?NDRFU2hhcVNCSUVUMGdMaitleFRaN3FJZUw5bkZLOTBaamEvOW1BMkxxdUxm?=
 =?utf-8?B?UTB3T3I5c1pCRTRPVmcyWEZ4eC9wZkhEYWIrMG5EVzRQNHQrTm5sWjZobTMx?=
 =?utf-8?B?SmlaWlpILzk3U083OWEyQ0huMUFlOG1PK3l2L0gwQUJva2FVU3hITytIMjRO?=
 =?utf-8?B?UzVNQkQweHk1d1NVeXZuOWo1bnhPRjZzWG8zcDgwM3RWVnVZVkdzVU4yYjh0?=
 =?utf-8?B?Ynk2T1dibXpReWUza2pIbDFZRDRocDZPSmZhZEdXenRXbTEydE9mZjdMRDFk?=
 =?utf-8?B?V25ua0o0VkJibE9GdS9EU09zRWdoajJtY0RtVm9mMEZuaTgvMThLR1YxdElw?=
 =?utf-8?B?Vlhwd0ZoOUUvTS81Vm0rb1A1M0lGNFAvZHpGL3YramhiUllKMEdGUC8zVnRP?=
 =?utf-8?B?b2Z3bm1nT0d5UVFxUEFjNTl0RzJSN3ZtcGdPRWYxODFvVXNkZUZIT2s2ZWlG?=
 =?utf-8?B?bGtwRmR4VjY3bjk1TXR0ZUJHanZnNGhZM2pjZFptcFJOcUVmSXVWTWNLQyty?=
 =?utf-8?Q?tSGiT+dp5zyMkNDf6TV0dTp/u?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 122c952d-9579-4e00-0dd6-08daf4e1a4e7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 21:11:59.8864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Svsug/a3KfBaOQHjGVBNNsNaVfWJm6cUrdCbSbBbyW4p0v/ntISxZw9ja1bRdF3DVGUz9A2R8L/AanKBebn1SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8329
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 1/12/2023 15:06, Mark Pearson wrote:
> On Thu, Jan 12, 2023, at 3:49 PM, Limonciello, Mario wrote:
>> [Public]
>>
>>
>>
>> > -----Original Message-----
>> > From: Mark Pearson <mpearson-lenovo@squebb.ca 
>> <mailto:mpearson-lenovo@squebb.ca>>
>> > Sent: Thursday, January 12, 2023 14:45
>> > To: mpearson-lenovo@squebb.ca <mailto:mpearson-lenovo@squebb.ca>
>> > Cc: hdegoede@redhat.com <mailto:hdegoede@redhat.com>; Limonciello, Mario
>> > <Mario.Limonciello@amd.com <mailto:Mario.Limonciello@amd.com>>; 
>> markgross@kernel.org <mailto:markgross@kernel.org>; platform-driver-
>> > x86@vger.kernel.org <mailto:x86@vger.kernel.org>
>> > Subject: [PATCH] platform/x86: thinkpad_acpi: Remove AMT enablement
>> >
>>
>> This title really isn't accurate is it?  AMT is still there, it's 
>> really more of a bug
>> fix for reporting the right profiles when AMT is active (which should 
>> be balanced).
> Shoot my bad. I did two versions of the patch - one to remove the 
> feature, and one to fix it.
> I did some testing and the results from the fix version were better so I 
> updated my commit message....and missed the title. I'm an idiot.
> 
> I assume I should resend the patch with the correct title?

Probably best to do.

> 
>> > Recently AMT mode was enabled (somewhat unexpectedly) on the Lenovo
>> > Z13 platform. The FW is advertising it is available and the driver tries
>> > to use it - unfortunately it reports the profile mode incorrectly.
>> >
>> > Note, there is also some extra work needed to enable the dynamic aspect
>> > of AMT support that I will be following up with; but more testing is
>> > needed first. This patch just fixes things so the profiles are reported
>> > correctly.
>> >
>> > Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca 
>> <mailto:mpearson-lenovo@squebb.ca>>
>>
>> With the title fixed.
>>
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com 
>> <mailto:mario.limonciello@amd.com>>
>>
>> Suggest this to Cc to 6.1-stable as well as it's fixing a power 
>> profile reporting bug.
> Ah - I was going to propose it to stable once it was reviewed and 
> accepted. Is it normal to do that on the first pass?
> 
> Mark

You can do it both ways.
https://www.kernel.org/doc/html/next/process/stable-kernel-rules.html

I was suggesting method 1 since this is a bug fix.

When you submit V2, some other things you should add (besides my tag and 
fix the title):

Reported-by: <person's email if you have one>
Link: <URL where people reported this broken>
Fixes: 46dcbc61b739b ("platform/x86: thinkpad-acpi: Add support for 
automatic mode transitions")

