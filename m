Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A384C7EE2C
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 May 2023 09:47:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbjEYJrO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 May 2023 05:47:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240613AbjEYJrL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 May 2023 05:47:11 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2052.outbound.protection.outlook.com [40.107.101.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2D5C191
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 02:47:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HMEbk2n1BTtJ63iJMU3XdRn93pBNQ8lFnOram487FyUhDGU+BvJTB7Z6/ZaEDPXbjNeL55QToMdtRdhJ39gbfDZSJHazHQcGP/F+lB+3yjeVnSN7hZ+XH0gDWUtyuHoiBb12PTryg4h6htLd4h8StZ+h9Q+V9cyTLtJ8RJv52UPOnXQfWVa/z26HV+UqPBvlPPuCq/LCX5Kf2qGKUPaC4xtcLQqK7Sfmw7kwDLrgxI7mVLe+ZxmrohHF/PWK4esaBCa/fvD0jnt4yYXRGn5AgHtfsznG4Vb2VF+WWL4Xzqtt2S+hMPmxCfEqAzYx6/FiVBO9GSIQBawGYyspckMVFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNfa1tgln4hZcGSMZN5RfASOfHbEMYtKsS29i/40gwI=;
 b=fjvqVK9M8cvksR73ZWiSrYtfvMSzawvFh+XKBbKAaNzBDKKK2uFMBQB3oy6KglB7IF68lTr+uwsOp59FdKegV0/lV6AfiSKBkGVy0icFSjBY384s9pqzGiLfqkZb8MIQxhHjG2HizoUjfgDHm3NHhbmA5tY8ACf2yqATCZ7dSSqnbsN1gcBKNOwgQxVKDFJkza0vIOO2XGYcbVsf5BWn7eFZkALOnXr4bUAdwDSpse0vpmzrtmbx0aqGuWFw7/sWOieSjOpLI2NIQuayrh9+QOU7Rw56aoGR0Ke7zEl9y0VimAkDGDXwMI74B3XvENBxzTUhELeOLZCrgGnkNlK/oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNfa1tgln4hZcGSMZN5RfASOfHbEMYtKsS29i/40gwI=;
 b=npKPPXMzhjoUtnIDyPvqh2i7mkph7Gk6Tf9C+dy+XdbYK55/VIRHQA4SL5tkbhwqsU0IuKelbziE1QFwuofMX8EGj1mANKCH0l/kdBdsEAJ1tS+0AiERbQ+Jyf25v5VPsQX7CbYr9/7cPOmV7mFvi7fbsvUh9yxlOPpB5cnJ9rg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CH2PR12MB4120.namprd12.prod.outlook.com (2603:10b6:610:7b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 09:47:06 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::6585:7aed:3f57:641b]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::6585:7aed:3f57:641b%3]) with mapi id 15.20.6433.015; Thu, 25 May 2023
 09:47:06 +0000
Message-ID: <378b7e91-3b14-c6fa-036a-c91a30ab4665@amd.com>
Date:   Thu, 25 May 2023 15:16:55 +0530
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
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <d4e98445-d2f2-10f7-7f62-9bcb16deef79@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::17) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CH2PR12MB4120:EE_
X-MS-Office365-Filtering-Correlation-Id: d8d45639-4252-4b84-e0d2-08db5d04fff9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nawzhKkhe7FDLAKpb9isx1QPW+wuw8Gwd46J6lT/AN4BsVOJDeIGmL/OJq418/+AXzshxqdqHsZfQM5QF6E2XoYMcshNRXFNGz2Yk88igwRtDRCeY5QMdJEWe3KIOSBMN57dWb9tNYKHS2236RryfZpDjiiLvLaxLJWBZSAYxeTFGkBlwiOs3qzEM7+iiR5u8nXPDGkWDGWDU2j1AZCMjFmyR5HpGdvXdkyOcmOyfs32uSL6kP1Z2f/+p/olIuQ2NQ/B3MwQ2TLYBgOxLFvB4+/vwhNZ0DyUYK2CQ9wD0HtbjOUnilPqFFaSRNDv0iKaX3ag6g1d4MTF5P5aaNRrjvrywMtBVi/HrAgLdqWxjMzjdspx5bQzKCYp/voGrGUxzt3xNABnB/Lyx3w5WY3NJrDMA+Wv21otx0iXAQd/I1oCQcJk4lcwJryJbbP6lhZ437brWXcSSz3njQPvtJmEp0z4mvQqWJuK73G/U9Ly/FHxC2YD3IcpoybU6T+t2Vhy2+HAdHsEh6R6aZhlMwSCAmvWXFgetWMU9PzU83rZIvnvTWeplhGJEb1cEGT2fqj4wuxwa1X6aSN7EJAce7dNtmNtD8WAUMIyVSLxen344lQSLGtNwdZmdEhqUhpKHwoGnDe2xwPsEjx67xyqF3gsbQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(451199021)(6666004)(478600001)(31686004)(6512007)(6506007)(26005)(4326008)(66476007)(66556008)(66946007)(6916009)(316002)(41300700001)(6486002)(8676002)(5660300002)(8936002)(86362001)(83380400001)(31696002)(2616005)(36756003)(38100700002)(2906002)(186003)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWVwTlJIbFBjTXdwQzJuMTFiK0J0S3dNaFY5by9JYWJEeHhvU2l4SWN0KzAw?=
 =?utf-8?B?NFhUOVVzTVB5SnFzdHlEbVE0S2JYZUN0Sm9jR3Q4b2huUFE0Q3REdzFZOGRO?=
 =?utf-8?B?L1hWTU14YlRLZ1AxTlBaUTVaMGpmUEVqcFJUL1hDYjZCY1huVjJPN0tQVm4x?=
 =?utf-8?B?TVlQYjN2bjFmaHRrd1FvS1V5QUpOb0hoSTZSeGNLNVEwZDlxdjFuNEtKdWsv?=
 =?utf-8?B?VmdXWG00RzhmWTZ4RkxRM3JRWmpGb29hOS9GN1NqaXZLamNrNU1mZnR6Rkg3?=
 =?utf-8?B?K0VYNk5vMC9kQnVsS3l4ZmZLR0VZMncxUGNXNlBLSVIycDF2UkR4QVVJRm1S?=
 =?utf-8?B?MlN0YkxsLzV4T0M5czdGT1ZVc2JmWXZvaDFEM1JCWjZkNUtnSG9tQlBseVp4?=
 =?utf-8?B?ZTVkWi9VZG5uWnRLcGlXQ0tLSlRVMUY3dndUWVFGMjJGMUMrTVRnM0xwVDNJ?=
 =?utf-8?B?SWNIaDJtaUlwZUlQUnJEVHJ2d1lhWStTVXBEa2cwZjd5d3VIeUdFMWJ2N1ov?=
 =?utf-8?B?cWUvT2FIU0VGSlI3eFhrWCtWcHlYODZCbUlsVDgxbVk1SHZZZFpHSlVpRFNw?=
 =?utf-8?B?RkRQd3dGWjdrQ1B4d0VWdzVuaE90ZHVJeDhNZGc3R0dTSGJ3VmJ0M1lHTDZU?=
 =?utf-8?B?eE0wRFYrZHFrMnZjNFBqOEQwVlNOa2JUQnJvYlZxRlhPRkxBWjJQZm1vU3B5?=
 =?utf-8?B?RHF0ZE1URC9vSi9yMmVhT2NORHRJYUpjZ2hYNlFzejIwRUxRSC9SQm4zUXlk?=
 =?utf-8?B?Si9vSGxkdEJNR2YvRjhhNHBFcGswRGNxYWpVemp4Y3FOT2U2QjZpTHhEcUt4?=
 =?utf-8?B?SlZKN0RFNUQvNGxUM0huNnNMNmpkZ3pHUlVHTVlVbFdPMWdGMlpVOTVFcnd2?=
 =?utf-8?B?cW5MV3JRZHhtamxnOXozRm5SZmZSZzBadGRudnhYMmFsN1Q4MktXU1lKMTEr?=
 =?utf-8?B?bU9ZbzFzYmEwbVVEdE1iRFZPOFh3RHkvcUxEWVJwWXQ2MmVTWDVMcEtSM3Nu?=
 =?utf-8?B?c3h4WnpKQ3F6YzUxcE5MbnN3Sk1vZ0I3RVFhY0NCQ0hJclhYemxCcE4xaFhY?=
 =?utf-8?B?WEpyNjJBcEd5U1A5NmVDTnRPZkk5L3VpcklxNXRsWlozbVc0RkRNSUJYUFhs?=
 =?utf-8?B?dHh3K0dXdS9IOU0xVXNWSGgrVkNHOHpMa1V6K082bk9vQWdiSis1Q1BiYTFz?=
 =?utf-8?B?Y2tuZ2ZtQkVnb3p3TXNUdU5sMVFtZWlCU1NIemUvS0pUcHBVdTlyMDMxMFM1?=
 =?utf-8?B?cWFyNzZPQ09POXUra095clE5VXRiMVpsSVFtWFFMZ2hoMGZydURLK3Z0cmFo?=
 =?utf-8?B?Mmo2L2dFRURMZlNBMGNFNCtzRWMwY3pJeGpKdWUxTkxHQzRBZ2xQWE1icXJm?=
 =?utf-8?B?QUtNekw4Z2xRN0xUVEpETmQ4cS9TRVNBVGFrYnNlS3VhUHowREFoT1FUMEpw?=
 =?utf-8?B?dlppMWpuazFBT0RMOWFHeFh6aEZDQ1lIVEo4L3MzN2I4VkQwLzlqOWJ2czlB?=
 =?utf-8?B?eEQ0cUxQT1hJS3VvbWNoVDI3TXhURXlvaDNsMXVZUTB4bWJQTE5GWWRCY1h3?=
 =?utf-8?B?VDMwcjJBQ0g3WUlHelduYWdjRXdNK0pDUFcrT2ZyVm91a2c5MDFlcDNKR2lz?=
 =?utf-8?B?ZXJqQlVMN1FuT0FSQi83dVk4T3pYLzlpYUZXMUdwdEdOV3dXelRxTmM0ZE94?=
 =?utf-8?B?LzY2cGtVQ1pENWp5T0RiakZBZVE1am9QMTBVTHh2MWVqblg4TlBaaHVxSkkz?=
 =?utf-8?B?QzN6MHVuQ3FxWUZ1RjcyTWR3ZUJxVHZkYytYZmpOMlJBbmYxTlRvRG0zUXJR?=
 =?utf-8?B?MVFPTFYyMUFPcCsvM3dQOTFFTzFqNDVwREJOYU54NDV1NUlqZFhWT1lXdlFv?=
 =?utf-8?B?b0FOVGJ2RmlaTjB6VWo4cGg3bVhXYzM0UXdKSitYVjNOZFI3WXhGR3dpOXhE?=
 =?utf-8?B?MDQ2b2pIM2EvNDdOWURlR0I3eEhiWVJwNEdPM1V0a2V4d3FDTHcxQjJOLzN1?=
 =?utf-8?B?d2xDZW1UcjlJV290MUpwcDYyOTN3M3oxZ2xYb2lRMXppeVQ4NnZEWVZpNS8v?=
 =?utf-8?B?K0dYb3VEY20wdHdUL0ZzSmplaXJpLzZvQU9qdWJqOGdhWVl2ME5oM1N3VzJm?=
 =?utf-8?Q?k9xuadVqOy1yZj0VmUFf5jabO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d45639-4252-4b84-e0d2-08db5d04fff9
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 09:47:06.4481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZQqK1eMgHF9y+A4FVNqraQVJ3UYat/5F1Zn5meSBSsFm9sLuat/peVT6/gCMZc14k2t9ZWHJmcl88e2FcGHeSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4120
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 5/23/2023 1:56 PM, Ilpo Järvinen wrote:
> On Tue, 16 May 2023, Shyam Sundar S K wrote:
> 
>> Add a helper routine to check the underlying cpu id, that can be used
>> across the PMC driver to remove the duplicate code.
>>
>> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmc.c | 17 ++++++++++++++---
>>  1 file changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
>> index e2439fda5c02..7e5e6afb3410 100644
>> --- a/drivers/platform/x86/amd/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc.c
>> @@ -564,6 +564,18 @@ static void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
>>  	debugfs_remove_recursive(dev->dbgfs_dir);
>>  }
>>  
>> +static bool amd_pmc_check_sup_cpuid(struct amd_pmc_dev *dev)
> 
> Does sup refer to "supported" or some other acronym? If the latter,

Yes, please read that as "supported"

> you should mention/open it in the changelog and/or in a comment. If the 
> former, the function naming seems too generic (an observation entirely 
> based on how/where the function is used, you're not exactly verbose on 
> what this actually checks for other than what looks like a set of CPU 
> IDs but clearly there's more behind it).

OK. renaming the function as amd_pmc_is_cpu_supported() would be fine?

> 
