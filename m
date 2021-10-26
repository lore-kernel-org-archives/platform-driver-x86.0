Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63BE8C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 09:58:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3ED9260F46
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 09:58:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233588AbhJZKBT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Oct 2021 06:01:19 -0400
Received: from mail-dm6nam11on2055.outbound.protection.outlook.com ([40.107.223.55]:51457
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231495AbhJZKBM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Oct 2021 06:01:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VzmMdi1Ibd4V8TRNue9Uo2E9URuumeuCKhmoM5WgQczmYfst4DcEDmndCBEiywIJnyQnWCZ/koD3Ekr9+bEjkS6123zlWZXadHt2gG2DdM337OZdFfqOeHQtFGfaOFEXbbzJhOmr2MhlPsBN8377k0yohD+fHxmTU+Y912ywMwWqEq9UGSvJ+JDv60wo6eWbK1D+QxDVOQbZ+epl54CJr1sNWnA6RQJQhteMJDuLIIMbplTGLOn7BMKPZ4Au/g6fzn2gDskJArkAbC6v+FdrouVaEXPBNTINDl+3tPZf8SXtt9w9GRWUMr0lU1xV6HXmcNFzaAZN+5nlNdrumx68fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kl4MbdJEAeSUyPCCBSR8ie1zofJqCFmJyUtv9Oo4arE=;
 b=Opzs4c71Niz1abzqDmsl38cW9LcRp4B37kn0bNPiswcQzDgsUYZ+i2Rg43H2wh6d/P9idG7AkNJen+yromarJgbyraVIoX17jzZ/aTNbk3n8XSknuKGh8BsQqATMtBIpPXzEljUZVbQrAmlfASl7LxU5yI1i2avF/38URLaEuAN+pH90lDIb1i8S3M7hmcrkZnaf1cvoVc6VOWAg8VKSoCmB0rA1S7rtiPX718iIgqkHggHeuDoxiijBzX+aYrE4gJNfCL1ZjEOXgkTowKFmclnInCqMYYg8bXK/UTzKnUgg9TjU3fO+Wo7p9Yk1Z8OMl7sGj8EZVcVWX/VG6rD3CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kl4MbdJEAeSUyPCCBSR8ie1zofJqCFmJyUtv9Oo4arE=;
 b=FRFXBbechT5DDGNWPB/UiGZ6q8RjULU4Tn3XPYTBNgb7bD3896kMmFAwSIr6vIdOo70cgHl6Kf2UYbKgwcyeW5ugSt8RlN6Fxn6bxeiUZ+L0jl8RXjLR3xknModi0tshAChHVI4seZBR0lcjMKy0G3lTTDRxD4v7JgDuo97zysY=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 09:58:47 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::e8e1:a20d:de7c:8b53]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::e8e1:a20d:de7c:8b53%3]) with mapi id 15.20.4628.020; Tue, 26 Oct 2021
 09:58:47 +0000
Subject: Re: [PATCH v3 0/3] Updates to amd-pmc driver
To:     Sanket Goswami <Sanket.Goswami@amd.com>, hdegoede@redhat.com,
        mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org
References: <20211022172845.2608-1-Sanket.Goswami@amd.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Message-ID: <2497770e-a7b2-349c-477b-4d9de9fb5bca@amd.com>
Date:   Tue, 26 Oct 2021 15:28:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211022172845.2608-1-Sanket.Goswami@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR0101CA0054.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::16) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
Received: from [10.136.40.143] (165.204.157.251) by MA1PR0101CA0054.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:20::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13 via Frontend Transport; Tue, 26 Oct 2021 09:58:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f50a5a5-33a0-4ad4-5aec-08d9986733a1
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:
X-Microsoft-Antispam-PRVS: <BL1PR12MB5176139DF2A18451DC745F169A849@BL1PR12MB5176.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lYboJx8Xggao68xLLoGpg07gGKsOZYDgGXkIEDOysiWJI52lTbydImlr5AL5bR4wxgu+/69zYWcitk92kaZHFgru3n/y7LZQ7HS81EICBWJQ883cPy8xr+gP27l+1Za7+2Noqn0ctD13/5wGioUceOWFovT0iNAerCFlEfzbB35E1bK01R1sary+hR60fUkugwz4gizU/Nu05p6f2u8Yy8zqWnFDOANbC7BhyWiCuXHX8SMG7JxxIcXqmsZF0TqF70eiwaMLDK7nogLC1FMvLGjgaqPewAguzDVX96eSCi46SMG4JRrivkj2yiqtzG0z2u0UIGFIbpvBe3yMCPfEp5jn7c+n8eTcDR7WNOSsENf+mhyjZfFny4Veevts0gYyg4ZVxOY2tBbUIvIB4m8u7Czf9oKNvlTT6PDFRa4luQWcyznrpIn1PPHkzTsroRntE6VUoFOLu6/WCpGUKjXO+roY/rGJ3eQkog9jNadLref7++QZYSNu6OWUvKYtMwqDeaD/SVTmxGX4IYfCs21pxopxWmYwOvE2bIT0+ra+yNLm1K48f+7z/Y3B74kddvkbPjPh5ivbxNew0vXHdZ3ip5X6vHeiG61lwCnObHbZqNTnGRZZ+9oH78XdZq7XipCQz+0YiQoURuJM+li1aKH/PYJfsPaM0t//XICkyQKSGVz/bVxIpD7HbelojYF3NKLrn8df61SeXsXBdbfTN0jDZcwq4O/j5q+l2R5cRBEQ0r0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(26005)(6666004)(8936002)(31696002)(4326008)(508600001)(66556008)(4744005)(66946007)(38100700002)(66476007)(53546011)(2906002)(6486002)(31686004)(956004)(186003)(5660300002)(8676002)(36756003)(16576012)(86362001)(316002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2c4WENJMU5ZN0VPRzk4dlpnTlk4UHkwKytMUDZVQndvVTVPZ1lLMUFFcnp1?=
 =?utf-8?B?Z29HZHBnSlJsbnVxNWRMYjdtZnE2dEhqWCttdnphdTlXM2s1MkFJS3lJN0Ro?=
 =?utf-8?B?dVRrbW9kTGw2bGJmWjd2WEVQS3pnYnZibFJXWlJKOWpRTGJPREJlbFpkcjht?=
 =?utf-8?B?MGdlZGw5SlZoNVpYc3QyRUxxeDA0SFdvTk9kUUZqUDhVTUFRYm5tZm93ZCti?=
 =?utf-8?B?Vjh2ZFpKSSt6cVVycTlwTFRnR1JaazFreVI5ZWlsR2tGTjhraGdmSnBCYkFo?=
 =?utf-8?B?UEFGenU3Wkk1UFArOUNQZWJaeFhueEI5QmxrQnB3N1A0RnJ6NjVVajk0dkJK?=
 =?utf-8?B?dzB5SlV5clJXVmdTNkNhekdRMXFXOUZuTjcvUmlSS3ZkVWpnMXRKR2ZnV3VF?=
 =?utf-8?B?S3lEWnYraCtnVjQwM05HNEd4VEt6YjBJLzN0cy94dUNOVHJubm8xY2xYU0k0?=
 =?utf-8?B?R1lpSnVFeW9iR1VaeEFtVHpzT2lHZzBGb3dYcXFIMGRhTUExSjJLSFZWMkVV?=
 =?utf-8?B?KzlWMk1NZ09HSVdHZ3ZqcWtFeEJ1ZVBxSGZjUFVONnV1WVptTE93MU9DaEJ5?=
 =?utf-8?B?Qjgrb3lVVFZIMWxWTklxdDhUUzN0WjJ3b0RWZkFrQytUdkRSLzhPZWNveFE4?=
 =?utf-8?B?ZmpIWWdwU3R2enpPUnFHbnJYblg5K0RJdVBNZTlZZVpTclhtcnhsYUtHRTNz?=
 =?utf-8?B?YzlpK2ZQd1R6TW0xUFRsOVN3dnM4YVdvdG9UUHR6cXFXTWk2RnViYldsUmFP?=
 =?utf-8?B?WmtxdTFOV0R4cm1OaU1ZY3NiRmlOUnp5K2ovamN6elE3ZE0rZDBNQ0pZNnJw?=
 =?utf-8?B?VFgvNFdiVDB1SlB3SjVYMEdpaGxkbmFhRkVVdTFMVmdLY0tVMlhHOEFNMFE4?=
 =?utf-8?B?Uno1WkJ6NitoeTB2WlBxaGNsS3V5MlZ6SFdxdUM0b0NVd2pNcXZPZmZOS1lX?=
 =?utf-8?B?OFllVjQyTnpJYlJOSFJrMGpKb0tVZDFCbTYrN2Q1NC9ZcVN6RVNvcUR3bG94?=
 =?utf-8?B?RlJCTUttRFREQ3FRMVBVTEJjc25aeGVkNmJ4OUw4R29VV1NlNGNMSXpSckJH?=
 =?utf-8?B?S2ZNRDhadW1JblBBcTVVeGVzV0kvZUtXdmplODBxQ1dIQUpEU1huVFFqYUY4?=
 =?utf-8?B?Y3VLQmpkWFpEWkxtKzJ5ZlBOSGl1MHZEdytzdjhrUDg3ZWtHWU5rSkxnU0cv?=
 =?utf-8?B?UjhPTUpBcGtVL1A3eVJlQmxPNUVHRmJ6eEptZzdrU01HS2ZxaXYvZHdCRTJl?=
 =?utf-8?B?OWRDMmxad3ZodHRuUlZiRmh6UUhEWXhwRVgvN1l2QStPMmZCUVRVZkN1cGxJ?=
 =?utf-8?B?RTlENG9sckJXeEVGNkF4UXh1OTVOakNoRlJBUTlXbG5TaStUeXZ1SUZiWFhC?=
 =?utf-8?B?ZWtRSnVCSDRweTg3cXAxVXpaR0QzYzJRcm90OVI1UCtQVTFwdTlUYkdMZkJl?=
 =?utf-8?B?MzBmODY5ZjlTRlowV3lZMDZ0Z0c3NjkyR3JScVFGQ3RYM0ZsNjhQbTBOZkRm?=
 =?utf-8?B?QURib0k0eklnSjZ5dmFlaC9RS3VVZ2crMmNSY1I0eTRlNW0wejV6dGVGUndC?=
 =?utf-8?B?RHRzaVhtTzZlVXhWaWtGS3M0OGQza3JJVHloMTI5RnJjSTNDdWtueXJwcXdF?=
 =?utf-8?B?dmNxUmdwb0E2R0hvNVFUckEvcGpEbU9xMlU0MkhjWVhPQVBnUlJNbks0Zzdo?=
 =?utf-8?B?bGh1b2FmZkRQZWxlQ2JRUVhsdlRMenhDNWdZSnJkVm1veXFIeE5GRE45KzFY?=
 =?utf-8?B?RXo4WUNJeGttYVVjZHZiSkVzUmtaam5KbFBNR2o2UllOWWtYb0IzZzhaL1RU?=
 =?utf-8?B?NGJnb2lHcHUvRlkrUXk2NjU4ZXYwSjUyZzZKUXdRbHdRajlFNllVZmNLT1lW?=
 =?utf-8?B?OFdTUURJV0hwQnZ3aHhNaVNOR0ZqL25PTFZBQkx3bTFyZHlzWjZsOW4rNWhx?=
 =?utf-8?B?djVWaERjUURPODFwVkhoNngvQVdWcDhiSEtBLy9TZER5Skd4MWN3MGsxMEVs?=
 =?utf-8?B?aEVJa25UZFJoamtKb21rZlVYWU1ETWxzWU9yOXl5aTFWODNOaDlhejB2SFVr?=
 =?utf-8?B?QitMQ1FaY3grQVNZSW16SXlhOWViVHJLcGt0TmUrbUtTWWFuS0wwSDduUWl5?=
 =?utf-8?B?Tmt4eFBkend5Tllzbjd4SFJSbGsrbFkyQzl5YnY1TGFSQW0ydHpGR1VBdEl3?=
 =?utf-8?Q?sjTDz/TFBeYFJwnrkQP7a2c=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f50a5a5-33a0-4ad4-5aec-08d9986733a1
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 09:58:46.9631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dhCrCYrWcEwqmWjgeAFRz+UZZyD2Cw0Hy0yXtVECb0XXOwimVOx0SmkBBtxqTB8AARLXtBtCU0ANyu4cQ4Ratw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5176
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 10/22/2021 10:58 PM, Sanket Goswami wrote:
> This patch series includes:
> - Improvements to error-exits in driver probe
> - Store root port information
> - Introduce support for AMD Smart Trace Buffer
> 
> Sanket Goswami (3):
>   platform/x86: amd-pmc: Store the pci_dev instance inside struct
>     amd_pmc_dev
>   platform/x86: amd-pmc: Simplify error handling path
>   platform/x86: amd-pmc: Add support for AMD Smart Trace Buffer
> 
>  drivers/platform/x86/amd-pmc.c | 146 ++++++++++++++++++++++++++++++---
>  1 file changed, 133 insertions(+), 13 deletions(-)
> 

Series look good to me.

Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
