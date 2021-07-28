Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 732CEC43216
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Jul 2021 14:55:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E0ED60232
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Jul 2021 14:55:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237264AbhG1Ozb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Jul 2021 10:55:31 -0400
Received: from mail-bn8nam08on2074.outbound.protection.outlook.com ([40.107.100.74]:41568
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237050AbhG1OzW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Jul 2021 10:55:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NIclqGchJ2tL5Y3czqv6fxYSoDxYLYWjEadWBBMhJDno1vVsFWRuKIMm5GrYOe5VIAU2m4w0rI3SajKqJFaujhJ6cR2SpMfl5IgdEVhTYVRacTjPJW/ZO6WVQda4DtWC7ueYFJHLRy5KzY+6gPZ5qFeopw9QP9VN9GEN71EcudRZpsns4Lz6Gm3E804IZswDrZVB5+z+C6h+nf8Pcud8exEb7cUP6HMvWfoLl+9CI78eyV0ehZ1NEt/+e4Ncv/h1LEnoA8kVO75B7Et8s9Hj4b6amBR5CGCt41XPhMjAZWINhTn8iLCTp8qsuzCCU7SCMfLMS9xn77vzvRK8uwWI9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DyjBBSDw+y52uaQFDTWy+v4Z9qYnGL/JTVwsSTvm5U=;
 b=gXMnyY0ajox40BFeHqPgHh3zVaxkSTuRRaS26+X74nM+qwqhAu8kBKEXj4TmEpgbWPeyx8sUFlT2DAcWpT7FZYaJ7N3nD+1rYrN6KrMBWbE9VGCpU277r2sY/gUfBZfbqa88zHDXhfUXfZl5hoOz7j7snuMwfsQGpg7T5pL5MciB9gv6bhFdN7pdGiSYnfvwXze17pDwvJdS8FwgMyFl2vTaq0iWckYnRx2yDBtIYq8ZSXaqqcOKj4g2keREp4FYBs1l42nNFjIFCC7uc5iT+63ZPIXjgGk12wHTeS2vTxmIy1Mw+yzNBzEl2c3ZemkwLthQcIP7O6M+o7eEJeA4nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DyjBBSDw+y52uaQFDTWy+v4Z9qYnGL/JTVwsSTvm5U=;
 b=QttafR31MO5cFkeyJecvOvsnr1VUNFY9GspwUh57oWIVcfNFMPst2W/I4oLMnIA0CEwqZdpEzXx/WfNXninqLz4cBjs0SaMP3XQPGn0OSFqNmNYiO7NMTEl92SWrIQBEDJA+JqDJgivJqpmWA0iUT1XHNBpC9FVLpvBqgi5huSk=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SA0PR12MB4559.namprd12.prod.outlook.com (2603:10b6:806:9e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 28 Jul
 2021 14:55:19 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::c05f:7a93:601b:9861]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::c05f:7a93:601b:9861%7]) with mapi id 15.20.4352.032; Wed, 28 Jul 2021
 14:55:19 +0000
Subject: Re: [PATCH] platform/x86: Kconfig: Make wireless-hotkey depend on
 RFKILL
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
References: <20210720025351.1819-1-mario.limonciello@amd.com>
 <2f223058-3401-5c0a-d216-df32113e11f5@redhat.com>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
Message-ID: <86a93644-08ce-4f5e-356c-d51a5cbfa07d@amd.com>
Date:   Wed, 28 Jul 2021 09:55:16 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <2f223058-3401-5c0a-d216-df32113e11f5@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR01CA0033.prod.exchangelabs.com (2603:10b6:805:b6::46)
 To SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.6.126] (67.78.118.34) by SN6PR01CA0033.prod.exchangelabs.com (2603:10b6:805:b6::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend Transport; Wed, 28 Jul 2021 14:55:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00c7d69b-7381-4b26-2124-08d951d7b7cc
X-MS-TrafficTypeDiagnostic: SA0PR12MB4559:
X-Microsoft-Antispam-PRVS: <SA0PR12MB4559B1EA35252371E719D579E2EA9@SA0PR12MB4559.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M43mboTG4QNZAEzPFadzi5lusMIgbA+JKN8Axs/y9lgaD2DPeq9ggfP0amgH08AhyOcsaOx8l1DUUcTvFvdJDq/ND0w0asL50f4JALleeq1LIl/7Qwoob7lxAYQRIRo+bb+waocLnE3lVUquDtHrL4AsctotKlulzT0iSKzJ29+CIzjgJIgPK06soChTgiamPQz/vrR0VgnWacA3GL8QOOszenCHV8Uq5Xes5Wt6o2sOfPfn/vABzuqO0izvkH+b4p+gyNm1VU8U8p8NXPRsJQNyyK6TK+eF5eCSsGYG/h8ddEWmd6NEVnpD7IkbTrPWH6yTVPiDypLbdasYw2INM9n+cZhL+XW1S0xIeBUx7ShM94M1B9phGHuxEmm/oV84Xiri5z00F9i1yykB9/QGCAo2dYXiQM51/7bhJDX9sTV1nmslZ83rL2+ihlgP57+SmqdbXGCw/O8HjBY1iwdj2Ay8vGRsNrRccPvh1V+jNKSV8Ilkvzor9a93uqxYFDpb4+vYV5HrzoCwgT9dMgRdEiL9TWe9E0E/Tpx8QPzflX9IIyvJT9YwWcri+oOFXOXIV6biN8tTWnYcqav+cf/QSb1HeTmod7PkoVSgCJmA0BmgBdiIyhvaYJeQyLBlIdLw/UqofIhiGu8kbYdduNeM7UR+yA8E1Q6dJNdU+Avu0tDEcSUpkm2dFI3TK/vRJXBhOW1jRj7xM1RDJyIuzoy+1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4510.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(8676002)(53546011)(86362001)(36756003)(38100700002)(6666004)(16576012)(66476007)(66556008)(110136005)(316002)(66946007)(6486002)(8936002)(31696002)(5660300002)(31686004)(2906002)(956004)(508600001)(186003)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWJtc2xwaVppekQ5VTRGZUxnOXBZYm4rdzMwSVN6VEFHRlkxekkvY1luNjgz?=
 =?utf-8?B?WDJrbWViaHA5c0FXbWZhRHk1QVpXRGFUTlhNdXFGazRrTGlacURXb1g3dStI?=
 =?utf-8?B?eWNCSEkwTTRoZzY3S0dUK2FPOVJ5ODFxS0RJM2xQOTVrRi9lU3YzYTM3SVZT?=
 =?utf-8?B?cXhPMTgwNm04L2szTHVqVFE3ZHJlRnQ1Z3hnTHNsa0I2RmhrcFZ3RFU4NE5v?=
 =?utf-8?B?UDMwOVdkdnd6YUwvdVBMNGs4RWtTL3lseDJRYkpJNmNLaWdJTjE5MUJkREcx?=
 =?utf-8?B?SFFnQ2dNQjNyeWNmMlhlTWhXZ2NsSzQrODBBMm9DTHdXU0x1VFJYVkFNMHpy?=
 =?utf-8?B?RjBMUTNDVCtxbjY5Z09nVnZweDN2RlZPVDNqc25iS2F5SFBLN2hyWWJYS2xH?=
 =?utf-8?B?SkN3dGZTejNab3h0UTExSXZPaTAxczZIVDZlNTl2U2pOYjdlcVBNb01tNVVD?=
 =?utf-8?B?Njh2b0FyVzhSYmhaVmUrNm1oMGI5MGlYc05NbDBTY05rb0Urc3ZwdTZRRVpT?=
 =?utf-8?B?SCtqSkF5WkVUbzNldWtkZmVCUkwzNDRDM2ZvbkJPbnRTamk2QnQwR0o5WTQ5?=
 =?utf-8?B?WVlEOWtTcEJiRVNxL1FxdmFoM1BmUnFoKy9xTk51YXdXZWJiNW9aVnB0eFhq?=
 =?utf-8?B?Y0VxWXI5cEM0TnlzWi9senFmYmk2Q3BYY3BrdTU0R1FRdkhZVit2QnNCOVpP?=
 =?utf-8?B?aWUwUmF0QnhIbG9VWHhYNlFZMEN5VmU2N2ZsR1A0R2U3K0VrYUF5UXlKRFp1?=
 =?utf-8?B?RjVPblVKTWNGTXBFT1BvV2hwbGZ1UG9tS0ppK0JhVHJsZ245N21ubjk0YWR5?=
 =?utf-8?B?Y1VrZncwR3FxNEpQNzd6WGs1dlI4MlFmYjZ2RUZPNWZkNTRVN01PZytva043?=
 =?utf-8?B?OEpDeDlKa2RGZG14ZEF6eXZLSHFUNGc3d0J1WXo0SHRQVnB3aUJjVityOTl2?=
 =?utf-8?B?LzNTV1NpRW9mS3lFZWlSVmUzdFBOaUZNR2IvdTZmRkRPWmczbFA2SEVaL1J1?=
 =?utf-8?B?RXdENG4zZkpVV3U1TndxeTdUZmJUaDN4b2s2VDdhTmRtL2ZqYzFUc3FNNUIw?=
 =?utf-8?B?Z3U4UHA1UEtSNmNjQ3hOQXNsRk5FTGVuZDJRQ0FFKzJDMklva2RpN0I0Mnll?=
 =?utf-8?B?b3JiVmE1Wm9nV3R0T01RZi9iUmR6RUtwMFR5NnRqTjgrQVRSSkR0Sys1aE1h?=
 =?utf-8?B?RjY3eW1CRmdsRS9EbUkwbFFDQlhQRmU3MFF5OFFKL0RxZWt1QXE4MXNmYXpT?=
 =?utf-8?B?a2RKdUlOaGNSUFVDNlZtU0c2K3dHUnNmVlFZUUg0ZWVjZFgvbmVGS0E0c2tV?=
 =?utf-8?B?OWFCK1JFcWd5WE1TdUFCU0NLUUw0NU5DckdPREtDaFhWdFdWaFNBcndZcExs?=
 =?utf-8?B?L0N5VC9yYlZ4Qkw4djQ1bVRTaGZsNlVMOVM4VHg2MXRVc2lZR0NTTlMyaURh?=
 =?utf-8?B?UFJZTU5MejFEaExTa3pkVkFmT2RkNnRnVWdab0lxcGdDK01seGwxQkd6N1h3?=
 =?utf-8?B?a1oyKy9aUC9PdjZRY05jTGxNVnd2azNUaE5PL05WbWlNVUpqVUJMcE94dUg5?=
 =?utf-8?B?OWhWbVR0Ujh2YldsdlJvdHF1Y3RGWnE4ckRQZmlyTWQ2ZnFZd3JxUUlzWTRi?=
 =?utf-8?B?eWFjdGtweVFHa3RseDN4K0N0cjF0MUY0TGJLeFhObC9OamdHdVFZMU5ZMzJn?=
 =?utf-8?B?U3VuUW9GSE9SODkrNlNqRzFyM1pxMlZXdFlwR25ZVmVRMUkxYnB5bDFhQmU0?=
 =?utf-8?Q?LVJ1eP3XGWfkCcnfd4UbMJ3ZoashndCCFut2izn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00c7d69b-7381-4b26-2124-08d951d7b7cc
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 14:55:19.6288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mFwdpbD95nw9/cSCY/HUx3kxpiiwuS5eQKcLmB9KAvZTzyqAeVKy5OuWt2diWpcC5MhskoxYO2iFiHdtYp76Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4559
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 7/28/2021 07:31, Hans de Goede wrote:
> Hi,
> 
> On 7/20/21 4:53 AM, Mario Limonciello wrote:
>> This driver can be built on a kernel without rfkill, but events
>> won't work which causes an unexpected experience.
>>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> 
> Mario I can understand where you are coming from here, but Kconfig
> dependencies are meant to express true in kernel dependencies.
> 
> The wireless-hotkey driver is purely an ACPI based input driver
> from the kernel pov and as such it works fine without RFKILL
> being enabled.
> 
> So adding a RFKILL dependency is the wrong thing to do here IMHO.
> 

Thanks, I get your point.  Is there another type of relationship that 
can be expressed for this?  Is SELECT a better idea perhaps?

> Regards,
> 
> Hans
> 
> 
> 
>> ---
>>   drivers/platform/x86/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index 7d385c3b2239..22b6e7e3da13 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -419,6 +419,7 @@ config WIRELESS_HOTKEY
>>   	tristate "Wireless hotkey button"
>>   	depends on ACPI
>>   	depends on INPUT
>> +	depends on RFKILL
>>   	help
>>   	 This driver provides supports for the wireless buttons found on some AMD,
>>   	 HP, & Xioami laptops.
>>
> 

