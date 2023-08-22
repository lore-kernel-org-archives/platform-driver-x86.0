Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14EE8EE4996
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 12:28:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235088AbjHVM2k (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 08:28:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233267AbjHVM2j (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 08:28:39 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F379CD9
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 05:28:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ChFHlFjqf8jIBUvzfDxtM3HmlX0Iwc2fevx0k8i94IU3qCKS5CoDIbMZY7/kfKoHDx3yJxi1EwR5CFE3mJA9yrteMvau66/V96Py2CXKixJ9T2jfg87OnohnGkLDPWejYVA9lh+uro1eAWCltMRua6aYiVgNvTXiSuY7uvJiNDOqtC2RCRwR2Ol3SdBTMIXcJYZTc748+Uw7D4fFuGZLiQiSslsNrzaa0wez4dTSQ/c+8pQtvtu2BzU10vfCO+X4U7EylrtON/+g2xQn5A72PUdeJIb24k+JFeA69RUOk7U9OLx+wetU222cFkf98ltt7edii9llHaj8/Z1SteWJFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MVG8KseEH+IYv0wKdBVy2suHgTuvSK+P6+PWzhBTgh8=;
 b=Xf2ipVzX0vWTjWrDex0lkL2misUZn5pzgJTZ2roxVpIaTpFeMo7lIR1Eh6gyZKAwHZF7UO00RZth6wAvq5p9tm1Kdno0qQ85NdCG6bwTuYlkon81io39TOLBLQYCNT4y52CDbJzCohax0WDnZL7WQAfdokI59B83ry4Ssxtwfssm/JdWRmz8DuCfZvSNbD0T1uOBqWL3PuhdLU9NSE9BAnaZybDs5zDLb/58YXyYxg6/J6oMjctm+a5vlCaRdnRs9rkO5fPIT/Jx04/xqnuC5zO8qyhM3Eth5IemkvlqlOyBrDGi98SIUI6JBDm9a7G4l3sxPKi1tsb+U6NovkGxNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVG8KseEH+IYv0wKdBVy2suHgTuvSK+P6+PWzhBTgh8=;
 b=0YI840bznm85sr5CSqDKaOocStqj20ptcnSql1G1ZZwwcPeunezbCDqpnVxydj3fCcPohRN7VN0omoh8y6S6XvpRf6oo7hwPsM87HeoopjtvM3UUt3lHSWfmsGcAOZIfT5robBqaRdGRrYqpWTDKJuKeRy3TXo/5E//hDh9IBOQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by SJ0PR12MB6710.namprd12.prod.outlook.com (2603:10b6:a03:44c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 12:28:22 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::48eb:b2ce:39d0:9626]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::48eb:b2ce:39d0:9626%7]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 12:28:22 +0000
Message-ID: <5d963109-56c1-40b0-6e15-cbb058412e12@amd.com>
Date:   Tue, 22 Aug 2023 17:57:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
From:   "Hegde, Suma" <Suma.Hegde@amd.com>
Subject: Re: [PATCH 3/4] platform/x86/amd/hsmp: change the print message
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
References: <20230818125119.1323499-1-Suma.Hegde@amd.com>
 <20230818125119.1323499-4-Suma.Hegde@amd.com>
 <58185d5f-e9ff-a8dd-f4e6-4a40393ebb4e@linux.intel.com>
Content-Language: en-US
In-Reply-To: <58185d5f-e9ff-a8dd-f4e6-4a40393ebb4e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0181.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::14) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|SJ0PR12MB6710:EE_
X-MS-Office365-Filtering-Correlation-Id: a938ec41-82cd-4794-4c3d-08dba30b45e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BSaS/OjoOFCsKHvtAu5tDMghgvEyvwlT/PSLXJv+IySEOMJRKwJrVi6TiaAv6OJGrafqvkepq8WHgvINmgYYwafWAPNJnb7PMG4KtesVJeOqwdseteGdFlIM0scylQq/d0XvaZQ4h1m4/gpkOiJ2vhv0FYt/QxUMoi1TCwepg0u6AtfQHafnH97GbZMCE0irk+pPp7h7pIlfYwlEYijaA1DXJZh2qHHae0O/awfgF25HqMOJHk6KcAK4lwWME85ljn/u/owL0/cpPGtnLxjp0uBjnNFZlPVjy1LYN46TSRoH41pkBq9KQGm/W1/P2fVB12tDZoFGIbtlRaCygVXsix1XU9gQ68BxSYPz1izohpK0EZ49bQ3pIGrIBvaAxGJ731Icf0Gm7SalLg97C2mSLqZaMM5KchJhFuAx7t3lwg+VKZS2guR1Bo/s6A+am6DUG8vdCAWqCHXDua/dgxqR0RwJd5VrydASUMPTyGIqB08u2KmgZWFSEpDrGa9x64Td38sTa+3VPe9IkrJCgKJ7r3eWDJYKa8UdNI1/RBHhIf1dWEw1nVgjVhcHAyZHJXdXJxsUnDHappBHwTFx/pKmQamUPRl4qeh1+rqM/wshZBEhygCi2z9g6FVvyTfj6EPMe13Zts3K4k1zZ8fNtiiI7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(366004)(39860400002)(346002)(1800799009)(186009)(451199024)(6916009)(66476007)(66556008)(316002)(66946007)(6512007)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(6666004)(38100700002)(15650500001)(6486002)(53546011)(6506007)(83380400001)(66574015)(2906002)(86362001)(31686004)(31696002)(5660300002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHBsS0tLRVFvc1RVTHE0L2VSdFNnb0EvTWI3SUd6WlJXUzN0SVkyL2cvK3pL?=
 =?utf-8?B?b1FlTHFaWGs2ZFdRb01iUzZZVzdEU1ZQd01CbWFOY0FUR3EycWErYVZIUnBX?=
 =?utf-8?B?UVVpUzBic1ZjMnNBMWszaTZwZUdYMkY5UVNzOENESzNmNHY1Rm5mTUZTNk5o?=
 =?utf-8?B?Y01SUjhLNit4L0VHSGYwNFZWOU54Vjh4eFNNcGVYRmhaZmpXaGhvbERKOWd5?=
 =?utf-8?B?M3JuUk5kdE0vVGIvWDhyRWR2UFViVmNKckhoVnk4LzFpQUhOakNoK0VlejlG?=
 =?utf-8?B?SjlsbExlZmVoazg2Y2JTZmZFSllOYzdtTlJqWmVndDM0T3lXaEJEa2grS3Ex?=
 =?utf-8?B?MDg4UTVud2N0Tm5vTXhoOHFUVEQ1ZXJRZlJha01MMUxJNGZKdkNyOFZLR0ti?=
 =?utf-8?B?U1NJOERiWHYrSTVkQTBWSytJMUFVQXVRSjdGSG8vdlJMVUh4czdwYktPczdn?=
 =?utf-8?B?WHdQclo3NzgyZnpTYkFjS1FhcThacXA4WHZFQ3MwV2RjUEhmUGNyTzk3TnNR?=
 =?utf-8?B?WlRjaXRmbGlEVlNqSC9IOFpZanlsVk44N0xBQkl6TkZWY29vUUwxZmZ2cUlv?=
 =?utf-8?B?cGtTMnB1dm1VTk05OXA4Zk56OFlIaDNJV3NtUzJKMlpGcW9RQkNmbzYwdm9l?=
 =?utf-8?B?clo3V2hwcG84Ym9paFBuQklUMWF2Q2lzNWVQVnNDK003b3VnMDRnYkpva2M1?=
 =?utf-8?B?aWJuSnBOZEI2RFV4bW15WnY1dHh0bmhuNC92VmMxOUxUcXdpMXRMWktxZFhP?=
 =?utf-8?B?OXVBbUs5TlRXZzBxekNRQlVPUUNFbUN1RkRUZXBoN2VJQXJldW1oUGJKY0RK?=
 =?utf-8?B?a3pXWUNsZkMzeWRIRlAramJ2b0luNkFLVUlXRVZkeEhNVXJyWlVDaUwzOFlI?=
 =?utf-8?B?eFV1S1hUV2FqV0QyTkUwUXJtVHhzTzZZM1FGOGlMVGZydUFoZmNWUmkyUWZL?=
 =?utf-8?B?QmtvdEJSRHJCWS8wNzlIQkJCUThDTEtSZTgwVEhSaFFuVWdidEl0RDQ1dGdx?=
 =?utf-8?B?NzkxWTdBTjdBUmdkQ0lkdE0xNnF5YlhucHhLQlByL0RxUjJxeEVYRnpvRmRE?=
 =?utf-8?B?dDBkUFYrQVdLaUprSlQ0VDRNckk3QnhUeXA5b0tjTnoreEdDcnFFbzVEV1lC?=
 =?utf-8?B?djUrdS9QajIwaGoydC90NGFJeWxtNno1TEFNdmFjNkF6R2k0VCt0N0NuR0dI?=
 =?utf-8?B?WWJ5T1dLcmpYY0FxdXFMcGFLL0ppWVVsUUJpdEtTV3FmQ2dDQUkzMnVKeDdU?=
 =?utf-8?B?dHk4UFRxWk81bnp5ZFVoK1NsN2ZIcU9JeFJBalVPaGxma3NQcmlMYVJ0TGFi?=
 =?utf-8?B?OGZHUEhxbGJRUnhKdEtOSFJNYUVuL2FZR2F3TFhzU0FGZ1RpaDlVUmM2YVJJ?=
 =?utf-8?B?SFFUODRPckJYenM1WmJUcHdYdWgvSGZzUEN3djFXWWlhZ2VwRGdJcUpPR2RU?=
 =?utf-8?B?WGJBbEpWSVFkTHpjSmpOQzFGZU1RL0NRUllBeHRMNE5NQVFWV29DOHd1bXIw?=
 =?utf-8?B?d3Y4QURDTVgvcWpybkFobzJjTXJsUDI4SXMxTy81WTRzYm51SGFVUjhPdzBE?=
 =?utf-8?B?UUJsSGM0U3ZhejdRcTZVRzBHMDdERDFmZXpCTEgwREdrWDZyQkcwQjVab04z?=
 =?utf-8?B?TzZGVitzMWV3bjZ2SDVQRXRMZWR4UGpNUGJZemVkRHZ1QzlTT1ZnRGg4a080?=
 =?utf-8?B?ZmtCb05SK09DZG1VbHpLbWxVZFJMMHRNcWJrS1paME45L1BOY1dxU1hZZGda?=
 =?utf-8?B?eTlXODZ1bkR4NFVyVmNLZjNseXcwYnB2SDZDMXVBM245MTB2UkkrTW9IM2FK?=
 =?utf-8?B?RXhzV0c2NHdFY0NYemxEVTlueUZzdkJ1QzlGZThHNzJISExBS0t4QmRKaVhE?=
 =?utf-8?B?NHQrdmxKQmNtQWVFdFZJTVJBV2ZhMDQrT2ZCaVB1ZHY2VEI5MHA2dmd1MC90?=
 =?utf-8?B?VjBpUXlEVFVPc2V4WVJHRFpMN2w3Rmdxb2F4SmNscEtTbDJvcndlcHByU0RY?=
 =?utf-8?B?NW94cU1OMndlSHNMUnBlMit5QjQ0ZUc4WlZPWERrN24xQWdNT1YzTU1Dd1R3?=
 =?utf-8?B?bXFsN1Rmc3Axb0RiUG56RTZpUHFSQkpwL09NYTZMUERQQ3lmWHcyR2ZabUxp?=
 =?utf-8?Q?NQcpkD5sh+7hRbJZ+ZY13roD6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a938ec41-82cd-4794-4c3d-08dba30b45e7
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 12:28:21.9452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jr6iSFdsUbUUmq2mhpRSlpWl28CbMKOGhTNkXpAFzJyS6MvGAMxfVtg2WUD9ZZz2EiZJpaipXnV747+2VfS2Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6710
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Ilpo Jarvinen,

Thank you so much for your review comments!

On 8/21/2023 4:15 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> The coverletter has 0/3 but the patches came with /4?!?
This is by mistake. I will correct it in next version.
> On Fri, 18 Aug 2023, Suma Hegde wrote:
>
>> From: Suma Hegde<suma.hegde@amd.com>
>>
>> The print message during platform init is little ambiguous
>> so change it to a more meaningful clear message.
>>
>> Signed-off-by: Suma Hegde<suma.hegde@amd.com>
>> Reviewed-by: Naveen Krishna Chatradhi<nchatrad@amd.com>
>> ---
>>   drivers/platform/x86/amd/hsmp.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
>> index cab59750cde2..1f03a22a9d8a 100644
>> --- a/drivers/platform/x86/amd/hsmp.c
>> +++ b/drivers/platform/x86/amd/hsmp.c
>> @@ -537,10 +537,10 @@ static int __init hsmp_plt_init(void)
>>        for (i = 0; i < num_sockets; i++) {
>>                ret = hsmp_test(i, 0xDEADBEEF);
>>                if (ret) {
>> -                     pr_err("HSMP is not supported on Fam:%x model:%x\n",
>> +                     pr_err("HSMP test message failed on Fam:%x model:%x\n",
>>                               boot_cpu_data.x86, boot_cpu_data.x86_model);
>> -                     pr_err("Or Is HSMP disabled in BIOS ?\n");
>> -                     return -EOPNOTSUPP;
>> +                     pr_err("Is HSMP disabled in BIOS ?\n");
>> +                     return ret;
> Your changelog only talks about changing print, and yet you also change
> return statement. Please explain things properly in the changelog (or
> perhaps even make a separate patch out of the return change if it's
> independent change you planned to make).
I missed mentioning about changed return statement in , will correct 
this too in the next version.
> --
>   i.
>
