Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E22AC77B7E
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 May 2023 12:20:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232193AbjEYMTs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 May 2023 08:19:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233263AbjEYMTr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 May 2023 08:19:47 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0941198
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 05:19:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SVPXeG53scUxgFUYv2ugRuHeMtxVng1yMpev4pq78QM6svGQxcC0FEq9kjybiZL2OZc4nCv4b55jNzRogJ9IMeKZG9v3h0OryPQli/bRGtzab6OHMzMJcTVL72vGhh4qatEYJTx4fnkQ4I1wZ2uLJgLRz/jX+K2pbKolcKtpK8FsYeAPQWy0dN7PonTHx+vzX6CEJ36e84mIFfKW25XCPwSR9Y9yC7u8VPLwIskH8A39Ie28M93hRJ+8tZc7Fso4sSLE0qFtKrn0Wr6KhGMoDfW1suhR+a2aaryewzXoUCQTAH7BV31rmAn6JuDkAqibYUGr3cbDGq17bauCSCNZ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cx/X5kO7/HV9/+e4XMZPRDEpNXlnLA/meHsmahtuhMg=;
 b=hMB/+8DxGuXbr4a3J3RoXmCBfhKl85hF5ONugWrSGy+UcVjb6O54l/NwivOOS/4vVXQAQv7oLVP+D/NXhjJGTArJ7k7lJLOmo3Zvpwk9V5d7akxaOkuQrZuTQjPfFNfmYs3QzRlTEbyQhZUajt/1U8nkTcCfn7hOEM8K4vRUXnsirJSX2y2BDtOHcJzC2Pna9GxMEaIkq5Z6/IJG/tEmtHIjHPDUI/MwlsCqDwDeBcPNwH614nbwbFkr1dt+uclN1qwT+1a9av/hX1in/lI7x+EQQrXLVnsIfK0Qzq/zpQ6KPWOJjgkPuaGJPtMpsNR2bzXRShkkxvjI5uPM2Q0V9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cx/X5kO7/HV9/+e4XMZPRDEpNXlnLA/meHsmahtuhMg=;
 b=ICxWdiPPNriFEED7v3vRMxDAr5ez5gHn/8rhvKqTYETpdaks6HjjLI6BV2XWHcWuldC8YYLm0ChunvNUbMA62cYv8ghZuC5fDRMdRSzQ5ogtQLoWAFsUac54XV+8kuEtixnUqUq4axekIbqSeqsI/qRtMyCBGGQiCRTuy0N+Fzc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by PH8PR12MB6890.namprd12.prod.outlook.com (2603:10b6:510:1ca::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Thu, 25 May
 2023 12:19:40 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::6585:7aed:3f57:641b]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::6585:7aed:3f57:641b%3]) with mapi id 15.20.6433.015; Thu, 25 May 2023
 12:19:39 +0000
Message-ID: <26c60e42-6915-8f08-edc4-d8836cb3e4af@amd.com>
Date:   Thu, 25 May 2023 17:49:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v3 3/4] platform/x86/amd: pmc: Add helper function to
 check the cpu id
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     hdegoede@redhat.com, markgross@kernel.org, Sanket.Goswami@amd.com,
        mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org
References: <20230516091308.3905113-1-Shyam-sundar.S-k@amd.com>
 <20230516091308.3905113-4-Shyam-sundar.S-k@amd.com>
 <d4e98445-d2f2-10f7-7f62-9bcb16deef79@linux.intel.com>
 <378b7e91-3b14-c6fa-036a-c91a30ab4665@amd.com>
 <209390a5-4945-f99a-5951-9fc61e5f6060@linux.intel.com>
 <34cf33d3-0b43-a7a5-4c1e-c9027c994d5a@amd.com>
 <4651d798-886-9144-7bac-4a87d73fd48@linux.intel.com>
 <f929738d-a46c-2298-d552-4ff6d5e2eeb1@amd.com>
 <82b55d8f-f3ca-a2d-5e57-5610d94812c@linux.intel.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <82b55d8f-f3ca-a2d-5e57-5610d94812c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::21) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|PH8PR12MB6890:EE_
X-MS-Office365-Filtering-Correlation-Id: 035553d7-deca-40ed-5613-08db5d1a4ffb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3vSxV64EaEYmsITKwhKhPCLiSW+ol8RQclk8KGvwIfS6iA58CIBitZOP08eccsLOACIrckh47qMl1Bw9suOuztptPnbD+8MHjgn1blj8i+sEYEZpe9PdGBiTfrtlCeBj4KkMhUOgdHU6snSlv7thxwtyvdAtao2GTMFMc44VuSUEAfL+PMTslVU2Jc6E/EoESrNUdgBs6EOim1Vwe7Cq5VQEVSDNDQm8/JxpxirSqRxIO5iP+7Z9XkezubOCAHexL8JX5rn/KCotIOWw8d7xbzXeuITwPHPXuVh1z1/Cwi0KsH9I0vXlDWmpNHP2nkjirfPo1nVDpiOWmbevUBPXWF9O2R6Z3CvaSobZ5faLLSLwFkAYlFQoNm4aIvZj6L2cdRqVqqvKnL8ChI6mke8C3zLhcWcHVX6zXoAY2BycQY7nYDQg8aex4Z3S7kk4HYTjMlx/kEIUI0n4W2i3QC5eNu4EXCdTShJXc0F1F6b835PYAPcaQeqHj5kOiUoAHHO8w1P5sbcdMl1QeuA47xAWPUSjY35nv9OQJGKU8CrMwg9aHIJvoqwYWyBvlXoGHV/nheX5dlbB4oWWTTlBtvQlN+OOEXrFFH+n2OYy+Gydw48Q4F2Qu3OnMZNzlaswpCbHuRkAzprt64nh1datnXBLcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(39860400002)(376002)(346002)(396003)(451199021)(2906002)(186003)(83380400001)(8676002)(8936002)(26005)(66574015)(6506007)(6512007)(31686004)(2616005)(53546011)(478600001)(5660300002)(38100700002)(41300700001)(6486002)(31696002)(4326008)(66556008)(86362001)(6666004)(66476007)(66946007)(36756003)(316002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkVtT283SUVIempFT21CQkN4dEQwbjVqSnJjZnZJWnRUQ0k2TlhMbjVidEM4?=
 =?utf-8?B?QjFhbkFsZUsvd1pEekxGOUEyRWY2UXZGOHY0QTJPZmMvZ3U0VzNKNUpDb0Nt?=
 =?utf-8?B?dktXUlFNWDhyaVFDQWNhaTdlVGFHRExxSDFNQUZhSTdNSEdETXhueFNhcnl4?=
 =?utf-8?B?ZHlZRk5kNmRxaUV3dnREb2NkYzJlL1dGYWEzQ2ZSSXlRNGd6VjAvb0pOWEZS?=
 =?utf-8?B?b2lGUytTOHlYSmk4RFByM0hicWwzVXdXUDNRWXNEQ1l0UGwwKzNScmptRldR?=
 =?utf-8?B?UzRjTVdYWXVvbm9TVzIxNXRqSGZENFRhMk56ZnAwMVJ6ZXBZRERndW0zL1lV?=
 =?utf-8?B?blR0NGRxcHhYbzgxNUp2RmI1WjE5RDNhRklxQkVBYVM4bGMzTUErckNJQThw?=
 =?utf-8?B?M25VQkdBNnRLSW1HbDVSSThPVlF2ZC9rSVJ1cGFpQ1oxcmNWZUJkWkZaWUNv?=
 =?utf-8?B?Wkx4UTZseEl4TUZ5SmFsS1NQelYwSUZ0N0ZzdmVYaDlYNVdWL1R2S3Nuc0F4?=
 =?utf-8?B?dlRxY3BGTHlhdUdjREp3RWdSUnI2UGRCU3l1REJGN2VIVUliUjIxc0VKUWw1?=
 =?utf-8?B?cVZ3WHJmZ0Z5ZzNIeFpYcTlMZHVCTmNPWmhYc0ZRWVArRks4MldKSng0ZDZC?=
 =?utf-8?B?THVBenVLMTl6cUtiNExmdlZpRHo0OWdLQTlYenljcnp4UnpnWkJ6UFdUbGJE?=
 =?utf-8?B?QmFEQ3c2bmd0aTlURHhhWTM4SUVpc2M4R01lMURWMVNhQVdMOTF1ZWlMaU5a?=
 =?utf-8?B?UzM3L1Zub29hRWt4UWlHamx5QmUxYUNVSDNMSVY4d2VPOGlUSDZHVWM1YzdL?=
 =?utf-8?B?VngvcUNkRzduL1h1aGdtclNNT21qV0pzUUd2WVVwSGVpMlRqNUgyQ1dNQ0tU?=
 =?utf-8?B?cDBVUC8yVEVQYlJiR05ueFMyZmZQMnoveUFHZUtsYmQ5azFSQko1T3lSYzBl?=
 =?utf-8?B?SURRWGNFNEs4VDkrcFBOZ0VVS3NkanBlMXZoUS9QTzFXYXJRRENWT2hHYTdT?=
 =?utf-8?B?cVhtQzlSbGN2KzZYb3pOUHNESS9MRm9haDk4Skp6dEJDU0pNMHBXdmZCU1V4?=
 =?utf-8?B?eVRJSW8rZ1hjcnhXV3hpOFUxQ3RhS1kxTXd3OG9MNGhGV3NYVXdZVnVDMFg3?=
 =?utf-8?B?UGk2ZnFySjVnRHJmTzg1bmF2YlcwVUxMQ1NobDRLVzJCdDFiMHIybjNodmFp?=
 =?utf-8?B?eEJqY3hiMStCRCtMWVhjTm5mVksvdkVOajFwVThmWEF4TDNISGo4NmgzSGg5?=
 =?utf-8?B?RHdZTVFWdi9uTWR2dEoxWFFsSUxIMzB3VW5BVEp0ODJXVXZkeit2TVFNWXV3?=
 =?utf-8?B?WDdvaVJKOHI4OGhQNjZjY2lOeG82dmtHTGhwM2NHR0RiNkJCOTVSbGVGY1g4?=
 =?utf-8?B?cjA5UEYxTGpCL1dXTHFWOUZMZi95c1ltNjd0Zmg2Z3Z4emxscHQzdE54REgz?=
 =?utf-8?B?bFpmRm8zNUFPYVJaT2hVV1hYWDdZdkZMUjFZTm1YM2lDanZ0TUxRbW5wL1Bz?=
 =?utf-8?B?aVpmRUpBcW9uNVpZc2I1SVRtZTZCSmNnWFBINlZ4MlAyUWhkd0NIWnIzcWpC?=
 =?utf-8?B?a0p6QWdLbkNtbHF2eHFxelZnQnovT2RJRWFiNW16eDYySVVDcjhwaExURVU1?=
 =?utf-8?B?VHhkdTdXQmpEYXBSNXlPSUo0cFN6aFAzSG8vcmxuVmZFcldSa3ZVNUlJRjUr?=
 =?utf-8?B?ME5RN2FGTEluczREVFJTbTRSaFhCZUJrZWhkays1U0lCTDBSN0dJWVVMdDJI?=
 =?utf-8?B?d21ZYm5RRGREaXU5S2pkL2VVanhBdUg1WkRJeUoxS1k0S2pyRFZ2MUlENi9T?=
 =?utf-8?B?bDF2Z1BaaWo3eDA1aUwyaVMwNVNVUTdsYTBkaDUwWU9qUG1ZSXpoS1FLZDJi?=
 =?utf-8?B?OHV4YTBVWk1XK3ltWkNqUmh1NzdKbVV6Y3NvaXdKa2I3eUVNdDJRUXBBUExY?=
 =?utf-8?B?bTJjNWg4Zk9qSGZPWjZzUW1nVllISFpvSDExTnBiakJyZTlGU0tEWWVaVk5h?=
 =?utf-8?B?aVU3S01VWllTUExlWkxwbmc0b21ydnN2ZGVQSU5EMTdkQzNYeTJXT0dLNUYv?=
 =?utf-8?B?eVpocFNKN0tUVm53cEtQVkV4eCs0V3paSWpqQ3RXZDJXU1lodEhZNCtmYmpr?=
 =?utf-8?Q?1yuARLpk+pVZr9icieEM3+DUL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 035553d7-deca-40ed-5613-08db5d1a4ffb
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 12:19:39.8882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OptGrGqDn8wJs9/mNNAsu3azDLPkT9ZzSxz6HZAEXjhp1gQGIa2gWJXe67lzXum/vRW4c40QulGkxukleio+NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6890
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Ilpo,

On 5/25/2023 5:28 PM, Ilpo Järvinen wrote:
> On Thu, 25 May 2023, Shyam Sundar S K wrote:
>> On 5/25/2023 4:14 PM, Ilpo Järvinen wrote:
>>> On Thu, 25 May 2023, Shyam Sundar S K wrote:
>>>> On 5/25/2023 3:29 PM, Ilpo Järvinen wrote:
>>>>> On Thu, 25 May 2023, Shyam Sundar S K wrote:
>>>>>> On 5/23/2023 1:56 PM, Ilpo Järvinen wrote:
>>>>>>> On Tue, 16 May 2023, Shyam Sundar S K wrote:
>>>>>>>
>>>>>>>> Add a helper routine to check the underlying cpu id, that can be used
>>>>>>>> across the PMC driver to remove the duplicate code.
>>>>>>>>
>>>>>>>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>>>>>>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>>>>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>>>>> ---
>>>>>>>>  drivers/platform/x86/amd/pmc.c | 17 ++++++++++++++---
>>>>>>>>  1 file changed, 14 insertions(+), 3 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
>>>>>>>> index e2439fda5c02..7e5e6afb3410 100644
>>>>>>>> --- a/drivers/platform/x86/amd/pmc.c
>>>>>>>> +++ b/drivers/platform/x86/amd/pmc.c
>>>>>>>> @@ -564,6 +564,18 @@ static void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
>>>>>>>>  	debugfs_remove_recursive(dev->dbgfs_dir);
>>>>>>>>  }
>>>>>>>>  
>>>>>>>> +static bool amd_pmc_check_sup_cpuid(struct amd_pmc_dev *dev)
>>>>>>>
>>>>>>> Does sup refer to "supported" or some other acronym? If the latter,
>>>>>>
>>>>>> Yes, please read that as "supported"
>>>>>>
>>>>>>> you should mention/open it in the changelog and/or in a comment. If the 
>>>>>>> former, the function naming seems too generic (an observation entirely 
>>>>>>> based on how/where the function is used, you're not exactly verbose on 
>>>>>>> what this actually checks for other than what looks like a set of CPU 
>>>>>>> IDs but clearly there's more behind it).
>>>>>>
>>>>>> OK. renaming the function as amd_pmc_is_cpu_supported() would be fine?
>>>>>
>>>>> This makes things odder, it gets used in two places:
>>>>>
>>>>> 	if (enable_stb) {
>>>>> 		if (amd_pmc_check_sup_cpuid(dev))
>>>>> 			debugfs_create_file(..., &amd_pmc_stb_debugfs_fops_v2);
>>>>> 		else
>>>>> 			debugfs_create_file(..., &amd_pmc_stb_debugfs_fops);
>>>>> 	}
>>>>>
>>>>> What about that else branch (PMC is not supported so who does that make 
>>>>> sense when the file is called pmc.c)? And here:
>>>>
>>>> I did not understand the actual concern.
>>>
>>> The file is cammed pmc.c and states "AMD SoC Power Management Controller 
>>> Driver", so PMC, right?
>>
>> Yes.
>>
>>>
>>> You propose adding function called amd_pmc_is_cpu_supported() which to me 
>>> reads "is PMC supported on this CPU?" since you don't have anything else 
>>> in the function name to quality a sub-feature that would be be tested for 
>>> supported or not.
>>
>> The function naming convention across this file is amd_pmc_*. So would
>> like to have it as "amd_pmc_is_cpu_supported()". And yes, this should be
>> generic helper function that should be used across the PMC and STB
>> functions interchangeably, as the underlying CPU where it runs remains
>> the same.
> 
> Okay, so I read this as stating that its testing for a larger set of 
> features than what can be read from the code.
> 
>>> It begs a question, why probe doesn't always return error when PMC is not 
>>> supported by the CPU? Can you see the problem now?
>>
>> PMC driver probe happens based on the _HID amd_pmc_acpi_ids[] and probe
>> failures are handled.
>>
>> The only intention to look for CPU ID's through the PCI root port is
>> handle the Firmware changes across CPU generations.
>>
>> Hope this clears the question.
>>
>>>
>>>> STB is an on-demand debug
>>>> feature and that can only be enabled when enable_stb module param is set.
>>>>
>>>> The check for amd_pmc_check_sup_cpuid() is to see if the underlying CPU
>>>> (with the right PMFW support) supported is pre-Rembrandt, then Spill to
>>>> DRAM is not supported. So reading the STB buffer is a different
>>>> mechanism and that has been handled in the amd_pmc_stb_debugfs_fops().
>>>> But the platforms after Rmebrandt, supports spilling to DRAM, and that
>>>> has been handled in amd_pmc_stb_debugfs_fops_v2().
>>>
>>> This kind of information should be stated the changelog up front.
>>
>> I don't think I am touching that part of the code to explain this stuff
>> in the changelog.
>>
>> Let us purely keep this as a helper function to check the underlying CPU
>> that can be used across the entire pmc.c file. Makes sense?
>>
>>>
>>> So is that function testing support for Spill to DRAM? Clearly, 
>>> Spill-to-DRAM != PMC, that's the second problem here related to function 
>>> naming.
>>
>> PMC driver is a FW assisted driver for S2Idle path on AMD platforms. But
>> for whatever reason if the Supend/resume fails to happen, we need to
>> have a debug mechanims to address the field issues.
>>
>> Since it's FW assisted, the FW also provides a way to know what happened
>> behind the scenes and that debug mechanism is called STB (Smart Trace
>> Buffer).
>>
>> Intially when we started the STB was supposed to be a small interface
>> and it has evolved a lot over time. And maybe at times you will see that
>> PMC and STB are used in conjunction.
>>
>> If its becoming confusing for the community, maybe I will come up with a
>> way to decouple PMC and STB sometime soon.
>>
>> Thoughts?
> 
> This kinda digressed and didn't answer my question at all (you mentioned 
> Spill to DRAM zero times in your reply but went to something called STB). 
> But it could just that I'm not familiar enough with all the details here.
> 
> My question boiled down to if this (your own words) is true or not:
> 
> "The check for amd_pmc_check_sup_cpuid() is to see if the underlying CPU
> (with the right PMFW support) supported is pre-Rembrandt, then Spill 
> to DRAM is not supported. ... But the platforms after Rmebrandt, supports 
> spilling to DRAM, ..."
> 
> If the code is solely used for testing whether Spill to DRAM is supported 
> or not, it feels odd to name it something more generic than that. But 
> given what you said above, I guess the answer here is that it can be used 
> to test Spill to DRAM among other things, and this particular patch 
> just doesn't do those other things so it looks odd but is okay still.
> Is that the correct interpretation here?
> 

There are 3 parts to it:

a) PMC driver[1] used without STB enabled
b) PMC driver used with STB enabled (but on older platforms before to
Rembrandt - where Spilling to DRAM is *not supported*[3])
c) PMC driver used with STB enabled (with platforms starting Rembrandt
and later - where the spilling to DRAM is *supported* [4])

Since we would need helper checks across all 3 cases, it should be okay
to name it as amd_pmc_is_cpu_supported().

[1] which is meant for s2idle suspend/resume transitions
[2] STB (Smart Trace Buffer) which is a shared buffer across several IP
blocks within the SoC.
[3] handled in amd_pmc_stb_debugfs_fops
[4] handled in amd_pmc_stb_debugfs_fops_v2




>>>>> static int amd_pmc_probe(...)
>>>>> {
>>>>> 	...
>>>>> 	if (enable_stb && amd_pmc_check_sup_cpuid(dev)) {
>>>>> 		err = amd_pmc_s2d_init(dev);
>>>>> 		if (err)
>>>>> 			...goto + returns error
>>>>> 	}
>>>>>
>>>>>
>>>>> If enable_stb is not set, pmc not being supported is not going to return 
>>>>> error?
>>>>>
>>>>>
>>>>
>>>> here we return only whne there is failure in s2d_init() - right?
>>>>
>>>> And yes, if enable_stb is not set, there is no need to init the s2d path.
>>>
>>> s2d is short for Spill to DRAM I guess?
>>
>> Yes.
>>
>>>
>>> So in both occassions amd_pmc_check_sup_cpuid() testing support for s2d 
>>> rather than PMC (it certainly looks that way)? If so, name the function 
>>> accordingly (I suggest amd_pmc_s2d_supported()) and put a little bit more 
>>> explanation into the changelog and we're done here.
>>>
>>>
>>
>> IMHO. Based on the above details, amd_pmc_is_cpu_supported() should be
>> generic name. Do you still see a concern?
> 
> Given you seem to be certain there's no error or some detail missing, I 
> won't object it being the way you want to put it.
> 
> 

Thank you, have sent a v4.

Thanks,
Shyam
