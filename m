Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D05BC7EE29
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 May 2023 10:22:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240941AbjEYKWU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 May 2023 06:22:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240898AbjEYKWI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 May 2023 06:22:08 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20623.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::623])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22F1510C2
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 03:22:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HEZmNTaExHa7rUQPROqiQSBJGf2WnmJjlRO9MeGZoZSmQzLZHLJg2haStWfNki1y0zj3pVhT/imZi4ZnyQ0GNwX8tjyhDfzuR0p4pSMwxETPLmb+PnOhSS5PKrAJSvHvVb0/vC6ox04PzNeysG2ic391rSqQ2up1FNfcHNDTwQYnGm3WfovsNf6SysvmaK/wj93u4WRnfZqCJRUaupfraRWSs5+pAV4dUedc5STfr53W7DUp25RwcrHMHz2qPzg46cOoZJY/J8sY+ZHODO0Zf/77ls2Ax70yLTtanFZyPYslXmCXR04EYUZ/3sTbBS0xJGHy8AnYqNlWXVj7LhaUsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ztRjdSC2A10UK/QPw1RIZyBDzkYWjvYwpPAjv06OJk=;
 b=XSDf2MTQ35v2ITbfDyVVjWLnuwElDwSnd9xSsQs+w8SQnJctDjch4iT+8/CurHzZrt72Lljova9Sko/dEd0tMlfzzaDto8nlCWjCUrqRqdYOx4XHz5TT85wQ/zRJ9SGtynrcnRtKrGN8xmKR1+mUjbC8PBZTUDxPLHi1A6JLZQ0+WyMAuvBACVsIx8uYOQOjpKQDU91BAr4GRpiQzad69ePlniOuWrcd3Uf8VNxHB0j3vzZ72u+K3Y4HvEhzTL6or3C1KLq+pV00J7VAKLmcth3Tf99nbsAR01dGiszYic0AsRHdFDIa9W5uWNaCcCqbreCXewE1LiQiFbHz2vUSEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ztRjdSC2A10UK/QPw1RIZyBDzkYWjvYwpPAjv06OJk=;
 b=FsXuMAs1q3/bD0CgkOOdvUF4H+mv9aZ0jWDglPDEMAac/E004fZ4iyBmjBa52ch9bwkkD54QnudQvShp8LyIOcMxjM9u9hXHYGDOIO5XxcWGKwWPtVt/bVbWkM9QTxNpzA0+UBAH76gRgvBmI1qc7TS7W67eDZDgXKn2YR1Whfc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by BN9PR12MB5114.namprd12.prod.outlook.com (2603:10b6:408:137::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 10:21:57 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::6585:7aed:3f57:641b]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::6585:7aed:3f57:641b%3]) with mapi id 15.20.6433.015; Thu, 25 May 2023
 10:21:56 +0000
Message-ID: <34cf33d3-0b43-a7a5-4c1e-c9027c994d5a@amd.com>
Date:   Thu, 25 May 2023 15:51:45 +0530
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
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <209390a5-4945-f99a-5951-9fc61e5f6060@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0127.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::17) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|BN9PR12MB5114:EE_
X-MS-Office365-Filtering-Correlation-Id: 35b1fd36-bb01-432a-8f47-08db5d09ddfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lnqtl33QuJctdZ5QzmHbWPdWNN3fVzKAIVuosKCtd/8muf/cx9cNGzDAhA/g+GmtezireDe8eoQgrrgmLNsvdN1m/iU3at8m7z8aGvOvOyYNojfv8bqdoBGX6LvukHatlPcbOs0MSryWEjk3TL6flXR4C/UxyVQOoa1xAkMusr4bnT/ltqBnQh1uBYcVyw1gvk8zWOf382UV1m7juGpMLs5Y2iR83eQ7tDu+96ooBg4HjFCjSe8S+EJDEBfzw2+r947K/brRx+Kn8tC80Guze5dt/dPBaRg0K+vpnnFZ05Nqu9VgMvaP2FxyUFSOd5sE3rzZYxgWFZPayXKF4qCVTPC/SX6l/son9fj/i+wE7K65z8fciqaPawpn17xOKcP9yVtnrdT9L6xVYq9ldqY/IANA5sbETK/tN7pDIwaI/MbhqUt6H80W9E7H39i8Ubahbe5E4ULoD1AoF2tq/qGQ3P7e/fzY0zplfwk/R1ljZ9wRXtom8x/BYIRLdiib0tHdp2IzDZIs6n72zjad6qft7+GoLhkpwETOBIxKwXMwbhFDV4wgmmKi/dvjqNgp/0jhApn3XxGP13ZhqYUSwgVn/Dc+7lnBD6G7tVlAnRzmiJ0hdixUyav7vQZ37Qj7Q1fbnR1WpVNM5hwVRE2adr6vqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(451199021)(6666004)(41300700001)(6486002)(83380400001)(66574015)(6506007)(2906002)(186003)(6512007)(53546011)(26005)(31696002)(2616005)(86362001)(38100700002)(5660300002)(36756003)(8676002)(8936002)(6916009)(66556008)(66946007)(66476007)(4326008)(31686004)(478600001)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rzc5WWdNL1l4M3RzS0FjQzI0NlM1SFJHd2pUYlBvVlZEc1pKUmM1RjUxSW9t?=
 =?utf-8?B?Qk5wcWF1c2RoK3padlh0Q21OVFN0TTBkMnZSOWVKb1BhK1ROcHhHa2hGY3FF?=
 =?utf-8?B?SGdiM21RM2JlVEtSMmRtd2lrN1ptOXdYWmNmakErNXV3RkdOQTZnVTVmcXpX?=
 =?utf-8?B?RjlhYlVKR0ZjV3VSNWdQVk1PYTZwTS9BSVl0MXNzQ1VXZGNVYnJWZzVzUnBm?=
 =?utf-8?B?S1k5aTdObE42VkMvSjJDZ2FOQ1BWK1FKVG5Xd3VydHVheFpKdDEwRWN4RUMy?=
 =?utf-8?B?L3hHWDdsNUlrWG1HakFzbmdobU41Z0c2c3VNOE1WTDN6MytNVGN0LzV2dXBR?=
 =?utf-8?B?UDdGcFlyU0ZCNHgxWmcyd1oxbHNrMnZ2SDZYL1I5WVorQXRBUzBwdnh2MUJ5?=
 =?utf-8?B?UHFWYXY0U3RiUjBUam81UERNOUp2cWQ5T2R6RW1CRWxFelc3eFdyU2FTMTl0?=
 =?utf-8?B?aWNPU2EraFU0Nk55Q0xrMWhXeXNrbUdYUEROazl3Q3g4WCtKSEhwY0hNQ3B3?=
 =?utf-8?B?THMrSThNQlFzWHV3akZYSFRIaGZXeVZCMnQ1TXlVMzdWVDRwK3d6SlBFZ3V4?=
 =?utf-8?B?VEU0OW9EOUpVRmNWSC8rbWNoK3k3Q1pVS05TZi9kWVVjd0t2U2VkYWV2Rzhr?=
 =?utf-8?B?UFdpTjlWVzZxY0dLRW9FUXhHOSs3MDZZcFFkQVZjdFdjQnJKQll2TFdCWEhK?=
 =?utf-8?B?Ryt2UjNHejRoSGs2ZU1waWpYN01TNDdaT01PVHRvMTJCeXkzWTRuVHE4YmhH?=
 =?utf-8?B?T1VGMTl5eEdWeWRVUldkWWxwZ2V1Y0t3bFhMTUFGcDd2bUs3QkZZeUZoUHlh?=
 =?utf-8?B?VmlkbmNIRWVhSEhDcXFjSEJ0NXBiZHIwdEpocWhXdWg3RmxvQkt3d2ZpQlR4?=
 =?utf-8?B?dTFJZzU4Q2ZvWXNxbjBBaXNvcnVrQlhhSkszQURWUkd5M0Z4Z3FBbVNZR0d1?=
 =?utf-8?B?N3RmSytSL0pudnpzRHpWT1BmQVZRWVoxQ0F0c2M2YUFNVjBiVWFGciszTnVN?=
 =?utf-8?B?NEJkNkNENERwU0VXMTE4bUFyM2VhN1pucVk0bXliKysxWTlZaVJrMnJETjZG?=
 =?utf-8?B?eUloNVAvSkVEMnlFR01pSFBaOFFkSlNJN2plSTJlakJsOEJENnZNdkNoQUNB?=
 =?utf-8?B?Q09DKzV4djNudG9nUkNSb29TcmVzWjR6VFl3MlJVZEpRYWFSKzRiOEU1K004?=
 =?utf-8?B?V0wwQmRsdjczK00yemNOR1hKVXQ4UGt0QkJhMjZSRnVZeHgzVVl5RnB4c1M4?=
 =?utf-8?B?RE1wZTYyRWd1czJhckhJd3B1QjZsOVhVZ3FSZG5FbXpoanJaNHB1NEU2eEZl?=
 =?utf-8?B?UHB0VEZFaWhTNHdGTVY5RDlIU0ZTMExuVlJ3dkU1cTNpMXZjeU9qTUZPTStS?=
 =?utf-8?B?b0R1ZUZvbVp0OE0rM1U1L3lTUW9ETTZRcFNYYWJDK1JGU0FHVzFZZ3lraTlY?=
 =?utf-8?B?TmpybUdFTzdpY094N0I5cGhjaTJGcmN3Y2JLQzlMakhBc0RBYkxmYnpITWZZ?=
 =?utf-8?B?ZWsvbDMyb25HaFZrbjZnZGZGRFpoMC9qRE1sZ0R1QWJXcDF2ekNoMkpIWEFK?=
 =?utf-8?B?aUpkYUVkdnFhTlhKVEJkZDAxem4zTDJWWjVxbjg5RVU1MndycjZ1Q2J1N00r?=
 =?utf-8?B?R3A3U3ZqQ1J3RnVsQ3RoQnBYVGtpYnU5Ui9JTmRNYTdzVHZFNlpIN2ZDYS9N?=
 =?utf-8?B?QzFoUUcveWFWNlZHMlFLSGJzcTBiK2VJWnBDSktZcnlCZnQwazkwNGhBdnhX?=
 =?utf-8?B?SW9xOFVnUWRoZE1DWjFBNTVPTDVkN2tpZ0FWTm5HcU8zTE8yRUhIWGd6ZjhV?=
 =?utf-8?B?aE05TE01UVJnYWMyOU9mRkFFNTBGL2FsMGY5QjB6bkVxTUdLRzE1L1ozZFdV?=
 =?utf-8?B?NURWby9LS25yWmxmMWc3NlFMRUNqLzRHVldQcmFGNzhtZnRQWlJSR1d3akdi?=
 =?utf-8?B?dm9pWmkrcEg0SnNINXZkZ0dPWE1HU1BlMFZ0SVI3MEtSNnJRN3IrSGd1QjBS?=
 =?utf-8?B?WEY4VHdUWG1ZakNKNXVqb3QyREU3RldLTnlQanNZWEdoaGkwTnk3aUZqcFBP?=
 =?utf-8?B?OGxqRWQrT1FyOWVxT0c3Vk5INUVEOVFVYXBadDJwemw4SmIrMSs3aXhyb3VM?=
 =?utf-8?Q?ccf5cD0SsTWCH7nu2PvOqb3p/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b1fd36-bb01-432a-8f47-08db5d09ddfd
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 10:21:56.7567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YH9i36SXw8H4mJR55k1alolNAlwLf07Rbcvr3G985oUjOlZj+IwBobbKllAib5ULussbLsDhsyf7DWJOL78XoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5114
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Ilpo,

On 5/25/2023 3:29 PM, Ilpo Järvinen wrote:
> On Thu, 25 May 2023, Shyam Sundar S K wrote:
>> On 5/23/2023 1:56 PM, Ilpo Järvinen wrote:
>>> On Tue, 16 May 2023, Shyam Sundar S K wrote:
>>>
>>>> Add a helper routine to check the underlying cpu id, that can be used
>>>> across the PMC driver to remove the duplicate code.
>>>>
>>>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>> ---
>>>>  drivers/platform/x86/amd/pmc.c | 17 ++++++++++++++---
>>>>  1 file changed, 14 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
>>>> index e2439fda5c02..7e5e6afb3410 100644
>>>> --- a/drivers/platform/x86/amd/pmc.c
>>>> +++ b/drivers/platform/x86/amd/pmc.c
>>>> @@ -564,6 +564,18 @@ static void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
>>>>  	debugfs_remove_recursive(dev->dbgfs_dir);
>>>>  }
>>>>  
>>>> +static bool amd_pmc_check_sup_cpuid(struct amd_pmc_dev *dev)
>>>
>>> Does sup refer to "supported" or some other acronym? If the latter,
>>
>> Yes, please read that as "supported"
>>
>>> you should mention/open it in the changelog and/or in a comment. If the 
>>> former, the function naming seems too generic (an observation entirely 
>>> based on how/where the function is used, you're not exactly verbose on 
>>> what this actually checks for other than what looks like a set of CPU 
>>> IDs but clearly there's more behind it).
>>
>> OK. renaming the function as amd_pmc_is_cpu_supported() would be fine?
> 
> This makes things odder, it gets used in two places:
> 
> 	if (enable_stb) {
> 		if (amd_pmc_check_sup_cpuid(dev))
> 			debugfs_create_file(..., &amd_pmc_stb_debugfs_fops_v2);
> 		else
> 			debugfs_create_file(..., &amd_pmc_stb_debugfs_fops);
> 	}
> 
> What about that else branch (PMC is not supported so who does that make 
> sense when the file is called pmc.c)? And here:

I did not understand the actual concern. STB is an on-demand debug
feature and that can only be enabled when enable_stb module param is set.

The check for amd_pmc_check_sup_cpuid() is to see if the underlying CPU
(with the right PMFW support) supported is pre-Rembrandt, then Spill to
DRAM is not supported. So reading the STB buffer is a different
mechanism and that has been handled in the amd_pmc_stb_debugfs_fops().

But the platforms after Rmebrandt, supports spilling to DRAM, and that
has been handled in amd_pmc_stb_debugfs_fops_v2().

What am I missing in your comments?


> 
> static int amd_pmc_probe(...)
> {
> 	...
> 	if (enable_stb && amd_pmc_check_sup_cpuid(dev)) {
> 		err = amd_pmc_s2d_init(dev);
> 		if (err)
> 			...goto + returns error
> 	}
> 
> 
> If enable_stb is not set, pmc not being supported is not going to return 
> error?
> 
> 

here we return only whne there is failure in s2d_init() - right?

And yes, if enable_stb is not set, there is no need to init the s2d path.

Thanks,
Shyam
