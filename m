Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0242DC05027
	for <platform-driver-x86@archiver.kernel.org>; Thu, 26 Jan 2023 03:38:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbjAZDi7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Jan 2023 22:38:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjAZDi6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Jan 2023 22:38:58 -0500
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2073.outbound.protection.outlook.com [40.107.96.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCD6676A8
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Jan 2023 19:38:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUAKqHWPvaM3Tg4XRNNBIvWkPlEQSoOmVNHra9RPyf5dXGTegMv2tCwhELWfWFcu2t1NtAUjiYX55b75iOy9A+dqCbtvUAqP6F3wqxqIudyxkRsTJ2aaswTldy1xiIIuY8Le7NTcjWM+HN00HuVekkOOMcCDLOH3fhfrm9udbSprG4Dqb9qiqqwPLJ2vPlzl1hG2blf7fOES0QyLbQG+RwwifIved43R9Mo6uVk8XUSAvx8bdobCwdJgB6+sy3y+cOLnKbcCLJH3OUFx0rmsHJN4z/kYf1S3JgAWuRnjqQN/23kFDYIBLRmnnz8buxiv857bMTHOXOXUkS/HW2RQDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=stTpZnaZm8L6cPsaRuk2MWFQTq1KbOW/90GjLBtp0sg=;
 b=hadQAcZToewdML4W3Bx7O9q0gJ33GmnxTiRlcqjX308MvpaKok5AVypJFzPDGO11MyaP/RKKVDabm34IewPYJA6rqqLYFyBuGsFynDVP/dQ/0910x7b35CKxot+DUkb+gjYe/Dr/tUra/WXZd+vMVcvXSjN9gilyD5RhmgoJPgeDW6XIgdarYR+trbz3mmP6pl3hmx2X6KV5LI1IvzvpT3pf+KS1KmEwYaVbntf7b88cEgy973mcxuXEsZMAR+Oddd6lrd2z8r8zA93UYl8mesBTc2Nb2r+zjdvsssuJyn6PTxPMRwyMCEi9iSfzAh90MA7yTmYTQO8YlD4g9aaZVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=stTpZnaZm8L6cPsaRuk2MWFQTq1KbOW/90GjLBtp0sg=;
 b=tWKZYvw3KWNFAdHo+zhh6lLHxIisyF//D+At5CTJl0h2KUZjnvHMn+ZXQViTyVcIfDf5h5FBarf2wWC3IQvk6s0fPtD0FzYmiVIQ31fzAvVe8IcKnhCI4BxIq7DcznywjlfAOtpTBpvmJCfOfrx8fK+b5pyDGJChA9MllGIBWiE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB6658.namprd12.prod.outlook.com (2603:10b6:510:211::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Thu, 26 Jan
 2023 03:38:55 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a59e:bafb:f202:313c]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a59e:bafb:f202:313c%7]) with mapi id 15.20.6002.033; Thu, 26 Jan 2023
 03:38:54 +0000
Message-ID: <cd3a71ec-cc8c-0b06-4b97-1dafe9ee27f0@amd.com>
Date:   Wed, 25 Jan 2023 21:38:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 0/4] Updates to amd_pmc driver
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
        markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20230125113127.3862898-1-Shyam-sundar.S-k@amd.com>
From:   Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20230125113127.3862898-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0190.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::15) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB6658:EE_
X-MS-Office365-Filtering-Correlation-Id: fe5c964e-94b0-41e3-41ad-08daff4ed953
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OOpNaT1uO1Z17EJIit+NiMjhw91x5pZWs22wJwe0sFzX0az3ClH1wPHrx/GKl6mOWJZ0YHtbyqXelB1KWaniESJrEIuNYqQujKbyAszv6E8Qehyd+OAn4wl148v9FVgs8/ZNWQ61ghQtULVPoOgTku7gCOVkhxFBJZlnuSsgIh2mAUf/zeNlVBrETCp6w4HBPW9pF8OnlIy3DM+/8GjoQ9DXnCcQuqIY+F7BuGBtVVeTuDVrjQZNM/FOcHOV+fpEtHrsN0Ix5F85B9pHYhBLg57DTEjAWs3/3rWp44KJ8jJd26P2cYDlKVuIGqW84+Dh5VeiGa/aF7TqiAaeXBsyAKuaEV0LeQyAbUSgyPL+kTlyDfleFKCJv9q+EIwS0dcF6+CNF2WqwMyr4XSrgZ00xQlyPylAsEsCakY1peDp4j2EdjVuy9w96aqIU2vOHTIoEMXwARJLpLN+Zs3eXtgMIPFNufY42emdKNxkpwSWDO8p4XxlkVniseK1WqSs4gQrXaiuoC9cjdYu1gdsfUdMb3hzswRxKcxFsAxSJA/2RY9huhDIgOuJjpzVBd7teFxm6jlonu8cov2Q6GHLG+EF/dbkJVl8ZaPDUR5uOclYlASmI/VX3/m/X1XlTDICmpYQ0PEle+oaFbo3lp0XxRQWqinEdBuLawkdOY9I38gJk7BR2PELKWNnRAo5GUL5u5ZCmujPQdlemq92+4WSUAm6V4IIJZ13vBIDndAOQ4vUaP4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199018)(31696002)(4326008)(86362001)(6486002)(66946007)(66556008)(2616005)(186003)(316002)(2906002)(66476007)(8676002)(31686004)(36756003)(6506007)(15650500001)(478600001)(53546011)(83380400001)(38100700002)(8936002)(41300700001)(5660300002)(6512007)(4744005)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGhFVjVNVzh0UXVwclRkTS9uQmg4Y1hjYkpXTi91OEhsYVNjbjMrYmhoaEp1?=
 =?utf-8?B?NWExUVhBeDRxaWpCTGVSTUpyaXhDOERoVHczOFJObDlEYWNEWHNNZ0wydDM1?=
 =?utf-8?B?ZUlTWUZBMm54WTQ4aGdYZnpEQ1lvS2FpWTU4aUdLQWJ5NU00VW51YVJUcXZL?=
 =?utf-8?B?MGY5eEY1VWpQQkdwUU5qWFBJT1hGeUNXbjRZbmxtOHFqWUJveDRHNGk0Vjhu?=
 =?utf-8?B?dTZUb093V1A2NjUyQThpMHQvS0E2SmdzNXZ0VGQwb0lMUUpkd2xhVW9Xclds?=
 =?utf-8?B?cjdmaFVmWHJWWEdmZUdaeWQwL2VJaFl2WWlOUnAxRkFIczFOLzl5YWwyTU1X?=
 =?utf-8?B?dThRYnBzWG1Mc3VGdlZtcGZiWjM5VXpOek0vU1ZYVmJjN1Z0VWJLSTQreE1v?=
 =?utf-8?B?dUpVK2R3MWlMK1k1SEw2Nm5vakVUOEsvWjUyc2JCckhTZkt4aWM1Z2tvVXpC?=
 =?utf-8?B?VTBicm9ZYmdIUUdQanlGS240eitjS0ZNRjhWd0JBU0N2YlRlRVlPSVd2cmxR?=
 =?utf-8?B?cUJvOVJKRS9JNG9lZllwS3FWb0x4Z2dNa1MzRUNsZk9FdjB3RjJSc0diU0lK?=
 =?utf-8?B?d3ZqcFREaW1HRU4zZlc0YVl6ekluYXVkTXR2QUs2VS9iMFV2cHYzREtiVEw5?=
 =?utf-8?B?Y2daK2IwK25KYlFrTlhlT01wenRFbjlMS09YRE1ZY0oxYXU4NXhCbG1UWlN5?=
 =?utf-8?B?RDB1Z2wyTm13OVl0WVlSNnVFdXkzUER6R2pnR29ubmMxdkFBRUEzbnZOS3Vw?=
 =?utf-8?B?RmNtWUlqMDRYTU9GdWk3RWY1cHpwaFhyRy9HbmVRbG0zckt0RWhralFnNENJ?=
 =?utf-8?B?Uy9tT3AzcWp4OE8wZGdkVi9FSXVmOFUxbktDVVhqZG9tRUs0c2hFeUtjOEhL?=
 =?utf-8?B?ZWJJb1ZFZXhxNDVPbnNCbitQYUVVMGVCb2VkaEZYTkxmQVRNTzkwTkM0dzh0?=
 =?utf-8?B?MjN0c04wL3FUcXlob1NNNTV2bTBLQlVYRDNDQUdTVHlNbU9PTE95UUpCZUFK?=
 =?utf-8?B?VjJUT1hyR1dDakQ5bVVFY21oZ3JmQnJPK2Irejk0VnQzTnBuYVdPejRGMTUw?=
 =?utf-8?B?cDNRd2lDNUQ0TzhaRnh2S2wxeXMwRW9ZWU5PUFJ1ZUgyTEJMNDd0OWZGLzlp?=
 =?utf-8?B?eUF2d0RhdUZidGFVOHJmRkV4a1lhcXVmTURZYzV0NUQ5bGhIWFdsL2Q3dXBk?=
 =?utf-8?B?SENDUlQxRFBkaVp0TFBDN1BKRDYzdGVqcW1HTmt3WmF3WWZDMzRySTJ0ODR4?=
 =?utf-8?B?VG82dG1HN1U1czlPNEsydDhJSjV6M00weUx2aFFBdk9QL0trY0JKSzZPTk1P?=
 =?utf-8?B?aDdYTHBubnd2OTZEdlBjRlBPdEJBcnFITVRsenh6QngzMzlEa3lKTEkwS0xC?=
 =?utf-8?B?ckxNRWtGZW1MZjJUWmVoWENLMWV3WFFtWm9uWGhtRy96eVVydVQwUzFsRHA0?=
 =?utf-8?B?WVRTd2ZUREV1Ky8zZXNSbEtTYU5uR2NCR3dVUnhlUEZlUkREQVlGYThIS3Za?=
 =?utf-8?B?Y0UxbE8xQXlzek1qcDh3dm5qTlROUjdVSk9laENhU1V6ekhucVgyUlZScVpu?=
 =?utf-8?B?QmJQOUFKYmdTZDJDbUpNcE15N1c1ZFVtSUpCWG83OURZUEZyVklZUXFyc2Qy?=
 =?utf-8?B?alhlM2k1WHp5WW9KeHhVZjJuaVdpZjhiZXAxVzZYNW5VN1Z4Z05xWm8zaU8z?=
 =?utf-8?B?S2JCSndpV0YvU0VINlp1eUlCWmNQTEtmcyt3NWhuM25QYW5mbTRRTGNQZjhO?=
 =?utf-8?B?WU1MWXUzQ0J0cFhHQW5EQnh2TUtvSXVoUFFzTENlVFB4ejhGNkJNeGd1Zllt?=
 =?utf-8?B?d2RKYVc0QzUvVFplRWczSlpRYUVqaG94SGU5ckM1NHRWNkRZQUZTREhPOStJ?=
 =?utf-8?B?VGtmbSsrczNzeVh1TW9LL3BBVXVjcVF5TjEyeHFLWUkyaVVjQStDcWN1WkNz?=
 =?utf-8?B?STY0VGNobk16dEpZM0I0NWhTencwd1dmMUJIS1Q1QU5mNi90VWw5RFVsVXFy?=
 =?utf-8?B?VmpNR29lNTNINVoyT0VmVjA1dFpaSTBHVVhEMHBaZ3lOSGhUbktpOXYxemlQ?=
 =?utf-8?B?aFN1NzZRT3N5WmhVcmtEQkFkUm9JdFQ3UlYwazJhdmxpYUcwU1J1YmNMSElr?=
 =?utf-8?B?NG9oMk1uWk5sT1V3OFlnZ1FHbDlTY1pDVjFwR2hFWGQ3V0tXZFg0MTNaeU03?=
 =?utf-8?Q?Mhz3U5wHH6Xu9Fl+nkiUstj7jneEOCcqBKbDSVTgncly?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe5c964e-94b0-41e3-41ad-08daff4ed953
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 03:38:54.6865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uB8MUrq+jeGYZxq81swhWFAamPVi+CL8wsXV9Oc4mRhuhO249fS7wcYNSkY5bC+VgNFJJz1+5qrJ4YtIR78q6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6658
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 1/25/23 05:31, Shyam Sundar S K wrote:
> This patch series includes:
> - Add num_samples message id support to STB
> - Write a dummy postcode in DRAM to get latest data
> - Add proper debug print support for STB
> - Add linebreak for code readability
> 
> Shyam Sundar S K (4):
>    platform/x86/amd: pmc: Add num_samples message id support to STB
>    platform/x86/amd: pmc: Write dummy postcode into the STB DRAM
>    platform/x86/amd: pmc: differentiate STB/SMU messaging prints
>    platform/x86/amd: pmc: Add line break for readability
> 
>   drivers/platform/x86/amd/pmc.c | 43 ++++++++++++++++++++++++++++++----
>   1 file changed, 38 insertions(+), 5 deletions(-)
> 

For the series:

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
