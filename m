Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 605A6C197A0
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Nov 2023 07:29:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbjKPH3e (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Nov 2023 02:29:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbjKPH3c (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Nov 2023 02:29:32 -0500
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2066.outbound.protection.outlook.com [40.107.102.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02313DD
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Nov 2023 23:29:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=McFtWnFjXeUttDxiQsnE9z09B8JKljbgbpeLGxQR7OUPXcZW+0vTzRsjOpgiRrGP441nLCi7yzRi6SFd62ofaOSDo+m+rJYEH8sCSkGit87IQ50B1Xxa9VKBhasOd8WCzC8UXLn28TLpx6PDOkBGLb5oqbaWm3YdMzUqQH6nzTYTNXCmd9/ZT4l1GVSypglAX6E5Zbfk3LcEoH/JttYLpEAPTN8OGA8nN6f7jcA1m9x3nprPC8VeeWVfcI/ZEZkhpRlc9aQXOrQtLRs2FIYu6qrczZVlbjeiSaZDnGzJskjf6MpngMzXE1XikSaT4+BbDmYZr6Y27zAueBxCBb+ZVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1TyAjGHNaWJhXbEfuVBis/eGGXGe/EFCmZ5d+cTLAY=;
 b=JcG1wVlQw2oNFqId6+UKX/mebIOqKEGr8B0IY1ul+mn1XqAeq8J0PbGcm2DeF4lyIgGm+txBEFPKFH5J0Xr9Tg03fnv1mMageqgEON/LaAwpY8fh9e2nmsQj0EtU1fcerIZZY79HIMFnCl5rkF6h7WZ074TxxX3YrCqJfYZbxbSIsKlQtTl154jQtpQ6pwU7LSGW7YTjoZ/7n+tOweo0YzbAblBNFMVLHaxahJtvM2P8i3uLyJFzVrNoph3x5xomxzy+XnbVuEwMcvlDj/L6sNj7touboWr2nWQdYpVpcuPSgF96+YtuBqWLGqyI+8FY/odAV+SZvmDJZO3L/dgUDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1TyAjGHNaWJhXbEfuVBis/eGGXGe/EFCmZ5d+cTLAY=;
 b=cgIA9BPlqW6oGceEaidjezKt/Jt6/2wPTYPKptRJM7qn4GIVEDIjrUu0CEX9mAG9W45DXfa/zlzyZgJV17NsoXMuM473a0K1cvNTbAU+JRyDt13pfT3vxz63C+GnIAn9cCHYUm9J2gbOdVCaoVBhDocLZ+q1SgFEiSc4g6DYr+A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CH3PR12MB9148.namprd12.prod.outlook.com (2603:10b6:610:19d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Thu, 16 Nov
 2023 07:29:26 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ef5c:c073:d1f9:e649]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ef5c:c073:d1f9:e649%5]) with mapi id 15.20.7002.021; Thu, 16 Nov 2023
 07:29:26 +0000
Message-ID: <7d0cb268-3115-4c79-b611-611c6314d369@amd.com>
Date:   Thu, 16 Nov 2023 12:59:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86/amd/pmc: adjust amd_pmc_get_dram_size()
 behavior
To:     =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org,
        Mark Hasemeyer <markhas@chromium.org>
References: <20231109061709.2964246-1-Shyam-sundar.S-k@amd.com>
 <a7435bf5-4465-5835-9595-ab453c8f125c@linux.intel.com>
Content-Language: en-US
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <a7435bf5-4465-5835-9595-ab453c8f125c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::13) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CH3PR12MB9148:EE_
X-MS-Office365-Filtering-Correlation-Id: c4be0ab5-b84d-4031-b9de-08dbe675c332
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6ozOZ95jLo3Wn6fDMgKoATjJJL4TJ+VbbKJIFl+lstAYzCRCyxcy8U90odZPZmFc2IlTfdG1mLhO/cAlMjaYfd5av+k1ObrEJ4UUw9hxMxrUgMtx5Jacx0+3n0zhTTxkAme4t4Z9eDnGL1j1OlKv6cy6duhQ0LRWqVUYeOE6bBJx8qeEFoYUOFIVfEIjTQMzHUqoHtDx093oLVs+ZlrmrGTbE6wU3ADeh4FUns5/EXvcJUn7jgXbuzrWoq5KHDEmtrI7Z3Du8iUNbbZa0k1N686FJzFcAOyObTnzzM3eCuKbH45ilq7oQbTpe8fKR/8w14bHoLt97Vt8y7HkQAJJuBpiOp+OITSiVvPJjJxAHCpI6uIbNosjpuGsZpBXj1Ob7T5bE4VqrctXvnQjZs0Ym5ZXVMRzKe0AhXHQeOSoq9op8bV8O6TW23uKnc5pJNn0eFIcWaQplZj6xhuwjRJieXo/C9vzN4H9Vfkz0Krhhs4bD6UUgpjYAnZUCAzN235czJAQo6PoctlQL6q0SxBwViah5MyRDMm4irCmKkIAKaECyLjlXyAP/AFOOa//C+Qfol9TUvW8e/ofg9mhBZNqHzBCU1wRNqHSQQYG0LBpdPS21AbqzPAmUZrlUKMILmSDhqHget2tKsZZd3ebgi4Gvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(136003)(366004)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(38100700002)(31686004)(83380400001)(2616005)(36756003)(6512007)(53546011)(6506007)(26005)(6666004)(478600001)(966005)(6486002)(86362001)(5660300002)(41300700001)(66946007)(66476007)(54906003)(66556008)(316002)(6916009)(8676002)(8936002)(4326008)(31696002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cStGZklJc3VSWDhFaE5TdlV6MEdTWlF5K2JNeW8wemNVUVdhMTNnejg1Vmw3?=
 =?utf-8?B?OTdkcW1Rc0RFSDdXUUp3MEJaVkozQ0JJN0dobEpLNkNaWmhNM1FFUmVtWmh2?=
 =?utf-8?B?QnhJd21OTVZrQVpsWVJCNS9mbURqMnMwZlBjUnZZRndVTEtTaEhyOEFFRndy?=
 =?utf-8?B?VFRXa2FtbklJOHBLcFdXbU82ZjRXcys1K3pkaTRUdkZ3akJEK2NLdUVuN2sv?=
 =?utf-8?B?cnJ5U1dqRmpkZ2VicFE0Z29OcmJMT29vYXNQcE5VZVBDQm9nYmVTdk9vV0hV?=
 =?utf-8?B?NnNCMFlVT1lTRjNHMkZaOXoyWWUyaTFKOUtWVFUxcjYxUnZ3R2JyOWRObUE5?=
 =?utf-8?B?ZGFLOG1VRGdwaU9pTjNXbTJMb1pYejhoeExiSktXekJEQWJQYkZLUmVvZFND?=
 =?utf-8?B?cFdncmZYejJ5SnpFZFRIZzVacWJJMEQ4VnRWV2R4ZWhwanZoYmYrNTZrQWdV?=
 =?utf-8?B?OFprTFlDTXhjTUJwZWNtb2NiQkw4bXpQME1CRzcxaXZHTmJHT2R2YWM4UXFH?=
 =?utf-8?B?RnYvcVVDYnl0WUJZTm1GaEt2RnhQRXR3Ym1jMGRCaFkvckh2QkVaMENMMDA0?=
 =?utf-8?B?ZE8yM1dRZjRpdkJGRWhQTUxKWW5GNU8rQTZqcldsNDlvNGhxaXFxVCsxK3Rj?=
 =?utf-8?B?QklGSmx0WVpaOVZXenN2SzgwMlYrMGpwL2d3bFVvNWVvZ2taR3NyUjZTK3ky?=
 =?utf-8?B?TklzWDlVNXEwMHpTT3NmdlkvVkljRnhlb21aeG12N2VReVIvSFU2YnI3Zy9t?=
 =?utf-8?B?R1ZJM2hUQ0JpZGljSklsa2d5Y3dtQm5wWjNYK0Q1SHN1Q0EvV1FMbFBlVTBV?=
 =?utf-8?B?UGJLWWJrRHM3S2lUQkxxM3pRZDBuY2FJdldmSWNLS0pWUVl5b29kbS96ZWov?=
 =?utf-8?B?MHdOVy9sSHZhZjVxcTNoc3NHNHZUMmpiU3V3TGJxVUFsaWJiV1JnVjJUWk8z?=
 =?utf-8?B?VExURFEydDBPcXJPVHJqYllYbDF0Q1R2b1VQekZsZUJiYVZVQTRocHpSV3JE?=
 =?utf-8?B?RFBJSVl2YTN4aGtVQlE3SE5QTXRoQjFOd2ZWaDFxV0JpbHM1WHEwd1ZHUHp1?=
 =?utf-8?B?WmE5c2pKRk1WeTlaME1aemtiTUdONklXRHpOaVB3ZXJvdWxGbHRvYm95UHQ0?=
 =?utf-8?B?Q0x3cmxET1NhNmZTd2wrMUlpWXpyN3FoZitKOUZMRFpCNFV5cEtHWkg4ZU54?=
 =?utf-8?B?UzVkWUZIOHdkcTJvY0hBV0lMc3ppZmhZRUVLS2FvRlp6elprN3RDaEhlT2pn?=
 =?utf-8?B?UzRyUnVZbitPVkVQTUJPei9CMHQ3cFZYWmNDaHVudmVJQWRaM3h0WG56UTVi?=
 =?utf-8?B?SCt0cEVmUVY0WExyT3JSbng2a0gzRG1Yb3QwSTdnYUMzVDJBQlFIVSsrdUlq?=
 =?utf-8?B?TXE3QjdWL1RtVDYxUTUxenFWeUlhZHVmMmZsRTRlNnc2ZzNGYkl1MERPa0Z0?=
 =?utf-8?B?aDEyUE12Q0pZN1NESjhvOFdHSVIybVVpKzlCWWxTcjNuL2JTQnNOUExpZHc1?=
 =?utf-8?B?Z1JrNERTdVpRVWRvRnJ6Z1Npemk3ekdRQkdSQm83WUpldWlPZTNJVWI1V0NM?=
 =?utf-8?B?YjdpQmJjVmtvWm4ySG0zMDFxL0ZJaXg3QWNQODVlcXFFU00zUWdxTWgzRTc5?=
 =?utf-8?B?UG9QRzNZcWYwcVRLVVQ0b0FhMlozbFI3b2VqTjd1Q29mL2R4cDJrQ2gxSzE1?=
 =?utf-8?B?M3dsTmpqNWQ4dXdHV0tHVGdTa1F1Y2Y3bm5YelluL2UrZlpSMDJuV2RtZXdh?=
 =?utf-8?B?SGVLU3IrRjBZL3A2NUxueUNYejBnVnd5ZytIUURyazF4TzhXZkJBSWZSNjZk?=
 =?utf-8?B?bmtsRkZ3a3AydzdGQXFKQVJwSGlBMXZXcmpqd1ZwMmV5b2lJd24xb29sZmxH?=
 =?utf-8?B?ZjdkQmM2akpWWUxwVlFwOThUSWc3d3pLTWIxZTJnTmhMRmJvQ1BidExSeXNw?=
 =?utf-8?B?UEtBak10d3FuaytvQjhWcjZneTEvdDNaYnh2cU1lYm5rcDR0b1g1T28xQzU0?=
 =?utf-8?B?Y0J6Zm5kQ1VaRmgzZHBzWmJ6YU9QY3VQUjJXeXVxM1lFQVNRczE3SjNuYVZr?=
 =?utf-8?B?MSttTnRCc0tUNDF4RmR0Nk92cXErVFhraWVSN00xK1BlWTcxU1hlSlc3QWQ5?=
 =?utf-8?Q?ET8ped8cRSqylVMWXv2/9ACAl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4be0ab5-b84d-4031-b9de-08dbe675c332
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 07:29:26.6618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQJYJe2Xn7frCcGeMr+xNVfZqDn2HRDhdXetHeaS7hN5890kR86Yn3R+b+VFq9VlSLBgzgT9nX/JpBrQ+KrCyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9148
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mark, Ilpo,

Apologies for the delay

On 11/13/2023 6:40 PM, Ilpo Järvinen wrote:
> On Thu, 9 Nov 2023, Shyam Sundar S K wrote:
> 
>> After talking to the PMFW team, its understood that the "get dram size"
>> mbox command would only be supported on specific platforms (like Mendocino)
>> and not all. So adjust the behavior of amd_pmc_get_dram_size() function
>> such that,
>>
>> - if that's Rembrandt or Mendocino and the underlying PMFW knows how
>> to execute the "get dram size" command it shall give the custom dram size.
>>
>> - if the underlying FW does not report the dram size, we just proceed
>> further and assign the default dram size.
> 
> This commit message lacks the description of the problem we have the Fixes 
> tag for. Please explain also that problem as it's very much related.
> 
>> Cc: Mark Hasemeyer <markhas@chromium.org>
> 
> Mark, does this patch solve the issue for you?
> 
>> Link: https://lore.kernel.org/platform-driver-x86/3b224c62-a1d8-41bd-aced-5825f5f20e66@amd.com/
>> Fixes: be8325fb3d8c ("platform/x86/amd: pmc: Get STB DRAM size from PMFW")
>> Suggested-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>
>> v2:
>> - Based on review-ilpo branch
>> - Drop calling get smu version from probe.
>>
>>  drivers/platform/x86/amd/pmc/pmc.c | 11 +----------
>>  1 file changed, 1 insertion(+), 10 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>> index cd6ac04c1468..501c72c7d34c 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>> @@ -968,17 +968,8 @@ static int amd_pmc_get_dram_size(struct amd_pmc_dev *dev)
>>  {
>>  	int ret;
>>  
>> -	switch (dev->cpu_id) {
>> -	case AMD_CPU_ID_YC:
>> -		if (!(dev->major > 90 || (dev->major == 90 && dev->minor > 39))) {
>> -			ret = -EINVAL;
>> -			goto err_dram_size;
>> -		}
>> -		break;
>> -	default:
>> -		ret = -EINVAL;
>> +	if (dev->cpu_id != AMD_CPU_ID_YC)
>>  		goto err_dram_size;
> 
> This now ends up returning uninitialized ret variable. I'd have expected 
> compiler to warn you about it...??
> 
> It also still prints the dev_err() after jumping to the label. If we know 
> dram size not supported, dev_err is not really correct level (I'd say 
> dev_dbg at most but better would be to not print anything, IMO).
> 
> Thinking it more though, it would make more sense to initialize the 
> default dram_size within this function to make it easier to track the code 
> + call this function amd_pmc_init_dram_size() and make it void since its 
> return value is not really used for anything else than setting the default
> dram_size.

I have sent a simplified version now. Can you please take a look.

Thanks,
Shyam

> 
>> -	}
>>  
>>  	ret = amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, dev->s2d_msg_id, true);
>>  	if (ret || !dev->dram_size)
>>
> 
> 
