Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E9AC6FA99
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Mar 2023 11:04:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbjCJLEa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Mar 2023 06:04:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229967AbjCJLE1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Mar 2023 06:04:27 -0500
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2062f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8d::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D66BAEBDBA
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Mar 2023 03:04:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpgvV79hGpkQKU6A5u6ZvuTE7c1DOPVkUe9mxweUItUwf32oa0xyvobi8fwxCpvX+xCFy+aCLK14vzJBjVxwDI9KMnrooaTvHbVa6n2JWpP522V9h8YoOi6GQzy5yO9i45re3v2jAIy0mbPsC42PepH6OrV7O3GiQSYXLav98dfkUwmn0G2wSIZmlcUmndxC1p+3gE0A6n/jNtYJAvXU9/KhqjjljySMD3Azlwz4FzAGnnYef9q0MHorYwHadaMBbTNn1bfRLZKm2waApcXd9YoAjY94SoiXPLTbIBBP4TFct3J8WOcjgk4iGOdUvvUbct35ihoniu6mK5elOZoQVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Az0KTfH+ue4yIxmiFg4spIs7USUCRCwHXVOHrZowhkU=;
 b=C4t/ViqZ1P4xs/aSoHuo/Ywc5qB927Al+7+/HYydOSbZxgjYtPV/+gFwf1sxhcRYMx0RbDf1PQFdRKbnIZg4fFfm5RghoimO8QjxZploiDPoqqDvik7R7FkJzS0NDZbHs0kKnc+GQV42clBzZ7j9ZyR8P17rzlEjGpPPY9Zxxyiae2RcGkZ8bt5eu4nG/Wvz5Wxjgnw282VucHwcXPyX10TNOgP9aL13MkZ7NGYLpKqZ/qK7UQCYlLgVRylqDmVsz8f6Slpxa0+LrHC3UrAQR2GvkWbRUiLW2d7OkrZh28Z6nrRUtHCc/+CnHiCftAKhb3+8zMFIg6EfG+p/sXYqKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Az0KTfH+ue4yIxmiFg4spIs7USUCRCwHXVOHrZowhkU=;
 b=V+nHerMaE7BjnPKkK7ZrXe8Jsf/3J7BzdS5/ONLKqeTILjZX7WB0bWtrUYCySvCr+1G3/jJ6yDNcZgMWmyYZlJ0z9efSNGSSzxdCXl5pWsL7O7CUdYr4fsHtXCYriTi+VsJr/xfFeVxIgWRavcSP+oMKSC/Chi+fel0JcVknXdY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by BY5PR12MB4243.namprd12.prod.outlook.com (2603:10b6:a03:20f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.16; Fri, 10 Mar
 2023 11:04:05 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::8db1:ed03:e196:be2e]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::8db1:ed03:e196:be2e%7]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 11:04:05 +0000
Message-ID: <04e5e442-dcae-1911-bec8-cdf2da44d321@amd.com>
Date:   Fri, 10 Mar 2023 16:33:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] platform/x86/amd: pmc: decouple CONFIG_SUSPEND from AMD
 STB API usage
To:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org,
        Robert Swiecki <robert@swiecki.net>,
        Steven Rostedt <rostedt@goodmis.org>
References: <20230310095301.1596369-1-Shyam-sundar.S-k@amd.com>
 <543000de-7aae-3670-e7d5-2243bab01115@redhat.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <543000de-7aae-3670-e7d5-2243bab01115@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0230.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::15) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|BY5PR12MB4243:EE_
X-MS-Office365-Filtering-Correlation-Id: 608a3747-37f3-41de-fa39-08db215729e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qYEcnQU4Bcz+ppFxqGHGDhyyKT3H1NFM1gEklJLtlDP8RSXLTei4EFRRNnSIAmlQe8j5EVG2bOzT/scwYyx+vEMPF6c6vn+vQLTbMZcSaqoARqLXQIgwcbd6Dw5GgHYF/So0NRcD4uNY1OMUTPlDdhLBeOZXEoHi+jrhyXHd8IeX1Bz9iYu/TpOsp7QoEVD89fZ3n7F8M+ZBCSlDmPqzQDXgHXONpIwo9hLt9ro7fIAHGLGqMcflTUlN2l8+dRSPcGeyW7wheAiJcyMG6e6Aftjkdl6kLori0hCo32eQJLA4gIE2+R7cOumO7LkZWeUYJ/Ua8pQwQX+jGwXFdVS3I+q8mRcji7AMVgFcDrQzek2vxDo32pdRMfTB5L8wT5Dhro0Qpj87MOc9x+kK4J0DrcyrrxgFLrOYlZj45YKZsbAGBe+1ElsVEX7U4OG7Vix1EjIvyHY/2rlPZrtaxh0muEVLoLe8vHaMUdAXMVc2jpbl2gsG7aS+qmTLxiZz40EKHE7YFXE/7VbHCZdi85lmqwuh/F9ghZq1C5HngrgwvLzX2UEAUAJKacSlZCU221lfT6359POPIOV77f8i2GCc7TPrQ70837Sphq61tLrJNUjpYg5XOssvvnI1IKlhyLtw+iC/K69/KR3MqDF30GnQeDHpXhHjhOstmFlp7UIubJQWgpqC/al9wRdyXOqOn2fqZiLaoGJjiSLGdEGG0HN9TW4wnw1J0IOJSii5zPD/898aC4jgy3Ll59U5crU1JOHVYqoRQ12TpU0HMXxZDyPT9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(136003)(376002)(396003)(39860400002)(451199018)(478600001)(186003)(6506007)(6486002)(966005)(6512007)(31686004)(6666004)(53546011)(2616005)(316002)(54906003)(4326008)(8676002)(66476007)(66946007)(66556008)(83380400001)(8936002)(5660300002)(38100700002)(41300700001)(2906002)(36756003)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGh1SUw0V0pMTHRTc005UHM0RnJOd21PNm15RFhlTzQvMUxiR0NuVkwzK1JG?=
 =?utf-8?B?S0pHK2lwL0FrZXMvRUp1NEVublJyaVBEUVpYWGV2RXdVNUJJeFNyTUV1U0Jx?=
 =?utf-8?B?ajZXVjIvUCtUak9BM0tjbUYrTjZTOHZuVml1Mm95R29qQ05jM1FXWnR3RDRq?=
 =?utf-8?B?QXhlb0FOWTRDSENybHBrZXAxSDIvS3ZFR1lCbDlQNzVUR1ZSWWFEZkJ5Nm0r?=
 =?utf-8?B?QUIzUER2N1BBS1hjNVpKanFKbjFSeGNPL3EvWVBYK1ZnL1RXV1VLWUlKK3dU?=
 =?utf-8?B?dHlNbFJibFRrS3lCeVY5N3JlSWc3b2c4OGJoSlZzWm1JTkcyMGhOR2drQ2Mr?=
 =?utf-8?B?c1lWQSsvT2RrcjNuNUpXOGJiYUlDaURmOWlCQnh4V0dYWE1uVyswMGdNdWYz?=
 =?utf-8?B?dXZkRlUrSlhuWSs2R0lsMjhoLzVacXhlSC9uVXJaNHVWUXd3QWpSOWlycDBJ?=
 =?utf-8?B?bEJvY3VUTzlTVHh6WTBuYVo4RW9oY1NZcjUrRm9TRHBKbzZIZGd0emp4Y055?=
 =?utf-8?B?S3BQeUk3VGJMTy80SENkZDFuSFdIdkpvVzd1RGlaUXc5azBwT3B6SERCNUk3?=
 =?utf-8?B?R29GWVdGVi8zSVk0Q1RDUE5ZQWZaV2pVaDR6bjBaTEw3dWJKVEVYM2xCcHR5?=
 =?utf-8?B?M1hzL2FMOXBOclUwNE9OdDFabmkrdkZ6UVZSK1dIYzhERmlSMVlTb1l4TUxZ?=
 =?utf-8?B?M0RXMEFNOTgvOFlQUHNSZG55YVhvbENOM3hQK0dtdkNEVlhtdjBSSTRncmRm?=
 =?utf-8?B?RTR3TlZOYUpQK05TRW5BSnR5bzVISkEweTJQWGYxdnhkdHUvVG10aklzODh3?=
 =?utf-8?B?RnFpSjltWFdpNkhxMDJFTngrL0F6UncyREN2TVFEUTQwUXZ0ejJSQkNQMmtu?=
 =?utf-8?B?bWx5SExnUHYxV0JqN0x0S0dnVVRCQnkwMGtYOFNDY1RRRC9IeEtnOVZqRmFK?=
 =?utf-8?B?RkhvOEh6dmswZlpvcSt6aWdEMmw4STZQc2g1TFpRcm5uUyt6WVFkK25RY01W?=
 =?utf-8?B?bHNmT1ZmTmxUSHRYcE1ZMnJad2p0dG9vc3BSNkt3V1pOeVczVHc5TGxiTzNP?=
 =?utf-8?B?NVVhL0U4VVcxWXFqbmVBVHhpbE1TMHkxTlhGNFlzTkYrcjk0QUMyc0NpQ2dZ?=
 =?utf-8?B?amxSR2VTN0NxZ2pMcUFib3ZhUE8xSFZ5Yzh1ZGNNbDMyTXltY2Y5b0F5MU9z?=
 =?utf-8?B?cTBuNEFmRkdkM05SeDRDdThoN1NLMjE5VGM2VXZRV2ZMQThFY2ZTOGVNaUtT?=
 =?utf-8?B?L2UxMEZmTnJlUEdhOWhKWk41cUc5UC9NMlN3bWRPQjdCL2tXbUo1UXYrYTM3?=
 =?utf-8?B?b25FR29HWUl0L1ZyRjM3NWgvcDZQTmRuQjlLK1UyMjR1YTRUUnNvRUdhMDN3?=
 =?utf-8?B?UVFEVWpnZnE5cTdOTmxCdnVtS2hMQmJMT1pNMjlscWdYMFkyQlFJbGc5bTBP?=
 =?utf-8?B?emw3VTU5a3BqSVNVc2YxS0Y5UUJDRS9lK0FaRVkzMWFIWG12MEQ1aFBtMTNQ?=
 =?utf-8?B?TGp2bzBnZ0VaTEhGdXN4anZuSGtxcndMYkFRdGVRMkk0ODY5b3FhMEFGci9i?=
 =?utf-8?B?anBibzRTZW9xM3hTRXE4NVVXSDg3Z3BVb0lWaXJqcW9RUW93L1F3TWNmcFkx?=
 =?utf-8?B?NHNaMUZSVGhkKzRPMUNEaTh3TVJPUXlYdHJ5ZUl5Y1NmSmQrdjdUc20xUXcx?=
 =?utf-8?B?TWVPeWVvazJkeCtXL2g2aVpER2g1cnpPZTNTNkx3OXphcVJBWGwzQXpJUy9L?=
 =?utf-8?B?WktFbktCVExvU2tTb2tFUUo2OEVmanRLZ2MyZHV0MCtZMXdUcm9pejIyaUZ6?=
 =?utf-8?B?VU5QTW5hZSs4Q1VOMUFZcGpUdnMvN3A4clQ3Uno0V0d6dkhwR0lNMmJQSTAr?=
 =?utf-8?B?VGwrcFJEWG42NlZtdWd6WlNWZXc3ZTJzY1FTUGQ4aFIyTGlZQS8yckpOYTdm?=
 =?utf-8?B?SXdkMDN0anJiZUJpR3lLYXZOQlFwa1ZvZmZHY01HV243RE1OZVZubFhTN3pm?=
 =?utf-8?B?U01OOVcyMzJ2TE83RDRwUm5MWjlCVlpCSENhdlQ3ZVRxb2dYd0t1UTlnVmpp?=
 =?utf-8?B?VU9acHFGV25jWTB0OVZkd3ZHRk9Ra1UrVVBhQldlY3NZZWRYdlFuMkNPbUNm?=
 =?utf-8?B?b09lWEM5aWU5dWdnOHQ1RzB0SXYwWjlaaUdqT0VXdEVwZ1ZVWjBBa3U5akov?=
 =?utf-8?Q?DdeVc7eVL+PLD77sDJEn4zzlLu3BH+0I9XPH7lOYQn8B?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 608a3747-37f3-41de-fa39-08db215729e2
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 11:04:05.5742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 73O0i1ftt95Ug5d5XjeMMP9T6PzYv91lYlOoM2gkdnGb0AKouD/vYxpMZK135PPh1+CAvIabPAOWnhDIsLyMIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4243
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 3/10/2023 3:57 PM, Hans de Goede wrote:
> Hi Shyam,
> 
> On 3/10/23 10:53, Shyam Sundar S K wrote:
>> The initial introduction of AMD STB was limited to only suspend/resume
>> use cases, but the need for STB APIs like amd_pmc_write_stb() have grown
>> overtime and guarding it with CONFIG_SUSPEND seems to be incorrect.
>>
>> Also, with the recent commit, it seems to create a build failure where
>> CONFIG_SUSPEND is not enabled. Remove the association of CONFIG_SUSPEND
>> with STB APIs altogether.
>>
>> Cc: Sanket Goswami <Sanket.Goswami@amd.com>
>> Fixes: b0d4bb973539 ("platform/x86/amd: pmc: Write dummy postcode into the STB DRAM")
>> Reported-by: Robert Swiecki <robert@swiecki.net>
>> Link: https://lore.kernel.org/platform-driver-x86/20230309225016.2e8cd211@gandalf.local.home/T/#t
>> Reported-by: Steven Rostedt <rostedt@goodmis.org>
>> Link: https://lore.kernel.org/platform-driver-x86/20230309225016.2e8cd211@gandalf.local.home/T/#t
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> 
> This is already fixed (in a nicer way) by:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=24efcdf03d85bb73df0ba99f69c8d238e7ada0e5

Thanks Hans. I missed this..

Thanks,
Shyam

> 
> Regards,
> 
> Hans
> 
> 
> 
> 
>> ---
>>  drivers/platform/x86/amd/pmc.c | 4 ----
>>  1 file changed, 4 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
>> index ab05b9ee6655..8db608e2c1ea 100644
>> --- a/drivers/platform/x86/amd/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc.c
>> @@ -171,9 +171,7 @@ MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
>>  static struct amd_pmc_dev pmc;
>>  static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
>>  static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
>> -#ifdef CONFIG_SUSPEND
>>  static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
>> -#endif
>>  
>>  static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
>>  {
>> @@ -905,7 +903,6 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>>  	return 0;
>>  }
>>  
>> -#ifdef CONFIG_SUSPEND
>>  static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
>>  {
>>  	int err;
>> @@ -926,7 +923,6 @@ static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
>>  
>>  	return 0;
>>  }
>> -#endif
>>  
>>  static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
>>  {
> 
