Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD507C197A0
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Nov 2023 06:53:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231948AbjKTGxP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Nov 2023 01:53:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231926AbjKTGxK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Nov 2023 01:53:10 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33EEEE5
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Nov 2023 22:53:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dyrjaCs1OpE1o133RAt+e5ZSQdBe/pcaAQuVMsx0XxlAj4QqpOwBF+EoHTXYlT+J/WkftvXt0BUN+JSyl+zRTMviuslKD10BFknY6fpeNkBtJCO7m7MEF0pDAHqIYjpko4soIFoMsdDHlYHSpwMZm+DxGpxqbIq1gjj5wAsV2xaletXZftxGAV3ZB1EuBqeiBx4mdCZLT87uNNXrEjRQPET2F1ykZYybqkJnkNW994UkpXK/CNYIHHjI8R6co459umcF7Jwhw8tuKJdItlltIa5a+lW3XvBEgZ/4w0yOYCat5VuQGYT3n4yr+4lIzpzoCez3GXFVQRXP71Ra77K/GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5iB5ZA9HNHk4TPokBRMjGqevEwGk+fvTjrnwV/shIE=;
 b=JC6OcZIz5prpOMl7lXXJxFvC4V95i3VmHfraj59AJWATgejUxVoP1eIlsELj0lCmXjtq6VAQV4n1d1wHjnS9ovcSDeG3Lgm9+ffTPI9wTmtf3U6w0OJQUpqUhtqQbfocxYu8ZcDbHgTwCFHBw0ynquXvvEw+0bmMbhkQ9bOHYZLMPG3yh3nKxkJEEuI/7ughVXhzIaKYsGy0bsiJ5lsW4T2ZEGYd3JRYrbvYgLOyX+q7xpv+ddnDF+xXsEdWgDdB4KEbD9iJ3U7rQbbJyUsPj4kDET7aKm4kMXMhZnYAVmjbvYKi15/TCFr8R7cxFq+Dk6eyWKH27xNsHQWzMUaYbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l5iB5ZA9HNHk4TPokBRMjGqevEwGk+fvTjrnwV/shIE=;
 b=IG+Qt8KLmQAiUfV9oweb8NwVHArPT31u6AK520nUKBrkCIZO4l78Qfs1f3pTIxij3oIytFyNEi7/Va+jweA66FmscHUhXQZUORcktanXM/otG3Pez00IOZ7u072b7RbesqIdWD2x2RT+l1m8SAQM0TXGuscRQ2GMRVrl1sCP4WM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by BN9PR12MB5243.namprd12.prod.outlook.com (2603:10b6:408:100::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 06:53:02 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ef5c:c073:d1f9:e649]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ef5c:c073:d1f9:e649%5]) with mapi id 15.20.7002.027; Mon, 20 Nov 2023
 06:53:02 +0000
Message-ID: <1405ce97-f1c4-4c56-abff-385554f9efe9@amd.com>
Date:   Mon, 20 Nov 2023 12:22:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] platform/x86/amd/pmc: adjust getting DRAM size
 behavior
Content-Language: en-US
To:     =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org,
        Mark Hasemeyer <markhas@chromium.org>
References: <20231116170121.3372222-1-Shyam-sundar.S-k@amd.com>
 <282b53e9-8247-a4cc-307c-7d4f1a924683@linux.intel.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <282b53e9-8247-a4cc-307c-7d4f1a924683@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0183.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::8) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|BN9PR12MB5243:EE_
X-MS-Office365-Filtering-Correlation-Id: 552880c6-ef35-44dd-e640-08dbe99556ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1tBqb+X1jmaNrl5TRLzyToJ/xiQ8rNzrUDlowcZThkgJpND3MI8dWRP0ciDnaz/SKQGvGBUoYmDcCykSyk/uXNpuhFJ18Xj0O22G25VYiE/aira/eP9+WjwXDZhY2O30FQyjjej7hWuNAU5oCJrnw0hnKhQW7PGlNIzbRNv8yaXVP+ZFr8n03AWVvfC9NmR38AVYu9y531tAAHugewJyR5Sb2/JHL9LAnpTSlkvFSFkGhCEpzhchzfV1A/xa70tLxICDZiSLdq5KylkLC9A1F2wjKvreYkV4C/M3RSM7dI57FltX6J6VWJPmwKMV9ZkKVAKBW3uPeD5N3qVh3q7ZuSv6MiggjltYLTxf3kxDezDYjpOO0rENlmmQThW2NpRVsZok9hPrIF6C0dfcUdY0JSL1k9m8rYesWhb06Wd5nqfwNBkljNOTx9K7FTeN9AYHrI577TWw5KxlhjMx8yB9mT+NXsF/s5Q06zi36f4AToB8FAK+sSsUuxIstbs5Oc6t4gK9NJFbMiBb1vbM8ChpyubetJ5t9UM/G1dDl5OwpKik1kzTxUArHsiaJoBQjOWdPP7cfIxgUjHDcsBEcodBkQTX08JbzIR+GdU9U2d/q4ZBNb8kDYjTjF2fC19XXQTwu1PjeCxV27oEVjaSKNQrbQ2nIpbRMlDjKmo31hVg2v8G18CxC5vrzsFZbvUejHMm
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(376002)(396003)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(41300700001)(66899024)(36756003)(86362001)(5660300002)(31696002)(2906002)(31686004)(6512007)(26005)(66574015)(2616005)(478600001)(83380400001)(966005)(6486002)(6506007)(53546011)(6666004)(38100700002)(4326008)(8676002)(8936002)(316002)(6916009)(66556008)(66946007)(66476007)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UE9UNXMvaVBlNDFxdlZqcjF0SzZlS0FNNklRdlpLK21ma2JlT3FDUDVnZmZW?=
 =?utf-8?B?anlkOGJMang1TWxuc2VkVE9hYklTS1cySUZxYWFxQmFkVC9HeTBXRUdqQ29U?=
 =?utf-8?B?dWRzV0VyTnhvZktWTWQ3dERPVWJhUTV5b0pwVFBwZ2dEeTlQYWk3MVRQTWZO?=
 =?utf-8?B?RmJUMUZhbE52TE1QTml5S0lYKzN0ZkRqSkNvYzU3ODVrVUFaZmdTWXV4L0px?=
 =?utf-8?B?KzU0QTdVRGZJdkpBUEZxRzBzbVZRY2JNOHJZYlNsU0VPWWtORHRrODB6TnFi?=
 =?utf-8?B?OENpSVhOT0U0anVONVlJMC9qU2p5YkJISjVxcCs5dWkyME5aOE84Z2ZrUEEv?=
 =?utf-8?B?SnRqMGwzdFRlUFpHZW1GT2JFMDlBNWxJSENoNjN1QWtQREtrWmV2cnZFK0pl?=
 =?utf-8?B?N1lnK0w4TWxFNGhGc1R6MU51RUxYY25BUHF2VS81QzNPeVlQb0tZOWF6elM5?=
 =?utf-8?B?U08zN3hxaUN5UVRSaElwYVJMcGlrVDNBVlpGTVZvTDlsWHBRTjRBblMreHhh?=
 =?utf-8?B?TlBBSXhsZVA2bEZvSTE0eWdvK2o1Rld0cFBreFh0R05zZzRtU1l1Z2l6L2M2?=
 =?utf-8?B?U0d6VEd3ekpTRERmS3BSUHB6NDA1MVdGcTd1d2YzN0lIZ09IL3BBSk9GZFZN?=
 =?utf-8?B?dGZrUXV1dk1HV2VzckFEY3hqeWpWZnpHN2c0Z3ljRTVwOENPbHJaTEUrRmxo?=
 =?utf-8?B?dXc1aDd1K3hkeisrcW12NUd2OXR4N1lkRTVEYmpqemErdFdlVmV5MDlpTlJj?=
 =?utf-8?B?bElONkNyVGUwUHRidVptMkV3c010RTFReERrZlNYY25xUFFsUThwZHBET1Ns?=
 =?utf-8?B?NXJ0L3pMcGJsZU1sT1ZRZ0RrSFV2aUo1WmtIQWhEMVFRUGZtYU1Eby9CQ01v?=
 =?utf-8?B?eldWcGZadzhHQWt2VHQva1Z1QXlHNUpOSm9CTVNrNndkZVd5dm5xdWdnbWZE?=
 =?utf-8?B?RWtzWDZnNVFsa2lVcFVLZEU0bE5YSTQxWmlhWXNibDV0emFRRG13OTNpV3JV?=
 =?utf-8?B?QkJIRkNvNjBNWVJZN2twOUJqV3E5MndvaFdzOCt0UVR2dkcvR2JrOGhPOWlG?=
 =?utf-8?B?RnNSNFF6Q2dRWmVISnE3SHcrRHlJck9tMDJROUhOUjNTT0cwamZPR2x0WFdm?=
 =?utf-8?B?TWo4NlF0ekcwK3VEUVA0Q0Y2WUJSaHQwMGRtTW9jRUQ5aDZObm5LZW9vOWhp?=
 =?utf-8?B?RVFvMkdBamZ0YnFQMGFMSnhYOWxZeEdwSXMvdFBhTGNHcmtKKzc2dGJRSDdR?=
 =?utf-8?B?RC92akFhS3Y5TkQ3a0lLM21OOXNjelhPNUFMbXRHTXlVcTkyanB1V25wSXly?=
 =?utf-8?B?RzYxTEJ5ZVBuSm5XakFLblIvbndIQWp5SGg2U2pkNzRsQzZ6MUsrblRoVjFJ?=
 =?utf-8?B?QTRZM0k0VWJHckFUM05wWFh1YVRIR2xhVHY0VTJSbjlSUzQyVzdzWkMyVVl2?=
 =?utf-8?B?dU5jdFhncWlNYXlhMFR5TUc0cERuVGNDS0xXZDdaeEJwMlFncnR4QnBjNW5T?=
 =?utf-8?B?SGxUc1pQelNhdlk1UkhBeXljNFIySjltNUk1SkpYNEZnb3FSeU82V1hoZmVY?=
 =?utf-8?B?c2lLZkdRREQ1SUZQRzlRVU9kM1MzVnQzOEhyS1dNSTJQdmYzUUJZZFBlbkRQ?=
 =?utf-8?B?STFqN0EwTUpIbjlwa1V4M2xMRFpBSHlRdnZUOHNWN25IVHY0SFg1QzJ3dHRB?=
 =?utf-8?B?MWF3czFmVkhqQmJsM011cTFuaVFESUN1b1NuemE0VnpJQ1ljR2haWEFyUTl5?=
 =?utf-8?B?eEZXUGJSamZacUZsaDZSanQwN1lGd3ZvRDRPelFaSVFuT05XKzlOOXdDNHhu?=
 =?utf-8?B?cHpyRGgyT3hlcmhRVndobmVydUE2QWYxSjRHNGhweTlCMElYT2pBMGw0SG50?=
 =?utf-8?B?YkcwRkt1OFppeXhKdEZDZkwwbmtCUC9KaVQ0REFHa1k2TDhPRzdORTlDY3hu?=
 =?utf-8?B?R0plSFlrMFdBdVA1UjF6Z1lDZkwyeUM4ZjE5SHRraGMybWJVWnJJd2xnR0ha?=
 =?utf-8?B?LzNBRGpFK1pOZWlWNjBMaUQ4TGVZVS92cFljUG4vaVVXZTJWeHFvWllOLzM4?=
 =?utf-8?B?QmlaNFFzL01MSEpvaVZkSHNYRERQa0ZxN1hweWpubGsweFZjV0lCVmNtVnZp?=
 =?utf-8?Q?/vbBWxupgjUi0SPB9bL69FdYy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 552880c6-ef35-44dd-e640-08dbe99556ae
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 06:53:01.9874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rXHpBvZK5XXrtkqVKwYl8k8Ih1D/3BfpKjyWjrJ7nTfM2X84KTz4MhCcJ1MVMGhf90/m+rRLuF5wXRJsDQxkaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5243
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Ilpo,

On 11/17/2023 3:41 PM, Ilpo Järvinen wrote:
> On Thu, 16 Nov 2023, Shyam Sundar S K wrote:
> 
>> amd_pmc_get_dram_size() is used to get the DRAM size information. But in
>> the current code, mailbox command to get the DRAM size info is sent based
>> on the values of dev->major and dev->minor.
>>
>> But dev->major and dev->minor will have either junk or zero assigned to
>> them until at least once a call to amd_pmc_get_smu_version() is made which
>> ideally populates dev->major and dev->minor.
>>
>> Ideally to suffice this, adding a amd_pmc_get_smu_version() call to
>> amd_pmc_get_dram_size() would solve, but that has a downside of elevating
>> the boot times.
>>
>> After talking to the PMFW team, its understood that the "get dram size"
>> mbox command would only be supported on specific platforms (like Mendocino)
>> and not all. So, adjust getting DRAM size behavior such that,
>>
>> - if that's Rembrandt or Mendocino and the underlying PMFW knows how
>> to execute the "get dram size" command it shall give the custom dram size.
>>
>> - if the underlying FW does not report the dram size, we just proceed
>> further and assign the default dram size.
>>
>> Simplest way to address this is to remove amd_pmc_get_dram_size() function
>> and directly call the "get dram size" command in the amd_pmc_s2d_init().
>>
>> Reported-by: Mark Hasemeyer <markhas@chromium.org>
>> Closes: https://lore.kernel.org/platform-driver-x86/3b224c62-a1d8-41bd-aced-5825f5f20e66@amd.com/
>> Fixes: be8325fb3d8c ("platform/x86/amd: pmc: Get STB DRAM size from PMFW")
>> Suggested-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>> v4:
>> - Based on review-ilpo branch (tip commit: 94ace9eda882)
>> - Add Mark as "Reported-by:"
>> - Add more commit log notes.
> 
> Thank, applied now to review-ilpo branch. I had to reflow your commit 
> message because the lines were too long (try to remain within 72 
> characters in the future). I also made other minor adjustments to the 
> commit message.
> 
> 

Thank you for the rewords :-)

on the commit message part, you prefer 72 or 75 characters?

Because I did use, checkpatch with "--strict" and did not find it
complaining.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/checkpatch.pl?h=v6.7-rc2#n3275

Thanks,
Shyam
