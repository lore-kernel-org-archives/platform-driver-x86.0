Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CAA2C48BDF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Jun 2021 05:42:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B0D260FF1
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Jun 2021 05:42:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbhFXFog (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Jun 2021 01:44:36 -0400
Received: from mail-bn8nam12on2076.outbound.protection.outlook.com ([40.107.237.76]:52672
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230110AbhFXFof (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Jun 2021 01:44:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpKNsQO24RnGxxhFrGwsiHXHMarRCH0717u41gJIhDFWSgsNqr+T3ujsFVEoBQgoV/k93LitYZU46jdJ1ZmpEzebn4yMQrm1b4rbsPUMRekJB+XWoOwACaNpjOd+DnQwkzcCcpnl5ZGwZ8gaDV347nDJVz6lVbLaBAJJp4/KOi9fioT1p7XDKEKeApaK/ktVe4j1VIGV/DAs0F9UBI/xNt3SPTYq5uUukGqTLWeTEyidCpMhayzkP2jlY6rnGk45cfFN6Vbj4teWP0iRu3IS5/IrNdFDXjjV4uu1I9Mwynll19j8b8CphfXNaVPHifNzidsbo933ovONH4QiOu2TMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNFql5wvHC/mCmg7XHKccN7tIMMyfFmdB6l6jOo41TI=;
 b=GMAAI6a4QGhm8fTqOp0wYNeLtvDnrGh37bt84cz5/z/ZtiQ/DfifvYboTw4+SnRyE2h7uZy7RNYPhNzujGG6ibFBo0DPfahMtI0VOlpcvnXGLopj+Ixjm4VQ/OIQzBM5Bx1125gOx1UAqD+9BcuHXOg+hY3nHV1IgFU5KH3cH42x0MwE7MkajeWeemaptUgHY7JR2kUfkZEoKt1WHqB/KxWda3t1XCSgnuq3woTBUtAJefBzZP0uCQBrnopKzPCF5jPdolPQkviMXNhf3kGdpwFdjeGnyWAERu55ypUKP+8sHhaddSewk2ZXJ0yJDker5tmwrrgLEXuRlDbsQI6K8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNFql5wvHC/mCmg7XHKccN7tIMMyfFmdB6l6jOo41TI=;
 b=0mT3JZ/diG/BqNj6LXCforfmMVkQkWyyJxNIC0Ln2ewqDlnsHlMKFZljZ6oJBpQRNr3cAI0vPNewnKP9QtEmVDY5eONX42zlTuY8y3IRTZrkiL6e57n18np7bvShPR2JuBsw8GupmujtW/mA/kZeMI78zX5TDsjxM1pdrcvpbdo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by BL1PR12MB5126.namprd12.prod.outlook.com (2603:10b6:208:312::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Thu, 24 Jun
 2021 05:42:15 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::3172:2af0:3407:853a]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::3172:2af0:3407:853a%8]) with mapi id 15.20.4242.025; Thu, 24 Jun 2021
 05:42:15 +0000
Subject: Re: [PATCH v2 0/7] updates to amd-pmc driver
To:     Hans de Goede <hdegoede@redhat.com>, mgross@linux.intel.com,
        Raul E Rangel <rrangel@chromium.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20210623200149.2518885-1-Shyam-sundar.S-k@amd.com>
 <17e342aa-fa99-c14d-d018-2b4b65d31933@redhat.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Message-ID: <b56d0232-5002-ace3-f3ce-21c506c1eeac@amd.com>
Date:   Thu, 24 Jun 2021 11:12:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <17e342aa-fa99-c14d-d018-2b4b65d31933@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.159.242]
X-ClientProxiedBy: SGXP274CA0015.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::27)
 To BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.89.180] (165.204.159.242) by SGXP274CA0015.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend Transport; Thu, 24 Jun 2021 05:42:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9a96294-99fc-4fa4-aa05-08d936d2d2c5
X-MS-TrafficTypeDiagnostic: BL1PR12MB5126:
X-Microsoft-Antispam-PRVS: <BL1PR12MB51267B1F947A50CD3F8A64CE9A079@BL1PR12MB5126.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9yJBVuZGTBf/FDsXeJeyXztp576XA8qe7+C3KxC1xAxc2Mo6JImEWV4DOlnSGB993/XSudb2Js+rGCrJorkyx22/aTD8sWjfs62Gh0kO1zlwfpxIfLhxI2maLA85kpttUTeZ7o9Ou7wM+8ZrI+F5OVjF5VkPO1EElnvgcsHrWbWVaOWW3YSDxLwJDzlYb0Nkc3NCiGe4YXAhkJFox0hGjN6AE8qbq2MWT+I8cJ7y2444giyrV2JLhMWYgKjVpwcj2df0MUZgQJBY0XkgxZgs7KkUB4yGZTyTzJDSMjX/Ft2NZhwCpHD2/BXpytJtXv7FcHaHbrBm0toEOrPTJHuFi44Vz9o7wE2Xvsqsvj8LCa9olFGZhMA/xrCJS+V0LN5EJqW1DMB1gL6KYFgVlXcIKj54ckgn77wsLIUVhrHl119n+6lR1p5GnvQ49G65V3myTZI93LF+DYNwdQra5F1qd6rj9cMFimbrecJDqLzI6xcxqHwweirGoYEnyl5K1RXIX/ZAT4B0gi4W/CG0eFX8Dx7FsoATZjhjWYA3ElcRd/VOU0nftnw3slIXuB/9h1xPmfY6f/pKgVW3KMVUEJt3NbXJx2NPDUmNc6JxB29dtvJMxWvPVT3mP8GcaYrqyLiET3a14L0H50DzeuDuzzbgmEiZP3NTlEVZo462qgpTVW62cdskOfUE1brKiRBGOaap
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(136003)(366004)(396003)(2616005)(956004)(36756003)(6486002)(2906002)(478600001)(4326008)(5660300002)(31696002)(38100700002)(83380400001)(16576012)(110136005)(66946007)(16526019)(53546011)(66556008)(66476007)(186003)(31686004)(6666004)(8936002)(26005)(86362001)(8676002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2FGUlc5M0o0WDI3WWJOZzdSVEtoRTlZMlhVeEVjQUR3Uzk5c2wvc3BKUXpI?=
 =?utf-8?B?Q3BlT0lqMTl0bUFvWmlsT0czNnNBTFdUYXdZcW0xQmwrcEF5dWtSOUdIaEhQ?=
 =?utf-8?B?YUlDaER4NW9mcmFZN09vOHZFbk9JbW8wMFYybmZ0N0JjSTl3UEVaamxHcjNJ?=
 =?utf-8?B?QjFjRnlzS0ZWOS8zMUNGaUthdE1HL2kvand4NHV5MTcvTFdIa25jVmcrcDZj?=
 =?utf-8?B?KythTVMvVzZLREVKa29RSTZjVXpNMUYwVFRqZjVGM1dGbkFGa20vaFkydzZs?=
 =?utf-8?B?SThXb21qVEp2NFZUMVE4bnNEOXQ2MW5uT1JWVzJlcUZ2eXRBa0FZNjFka2ho?=
 =?utf-8?B?QWNJT0svVXdnckttN0MrMThrMFNDZHFERFNYeG83SG94NUUzRlRyU0MrWXFH?=
 =?utf-8?B?SjdKdmt1dEZhc241MnBsS1A1TDhkUUx2ckhQcTBNM0N0aVJFY0IzUXVacS82?=
 =?utf-8?B?bTFGRUdyQUdOYXRCY0x4MUpWaFF2dkVrSGRWanlaT3dxSWlzLzRnb3VIdmI3?=
 =?utf-8?B?Vm5JZnA0VnpCYzRKYmRuNUlsM1pWdEF4VzhhV3Q5KzFSRnhselNzZTJNa0Jx?=
 =?utf-8?B?S29aL2s5NThzS1JFZEdyQ0RUdENmS2ZTanhmV2tDZG9NL240ZnRmMVFLcWVu?=
 =?utf-8?B?cXZ4R085Nm41Vkdpa055S2F4ZEhEM2tMTFc1MVRuRW13dmdIYjMwQ1BQbTBU?=
 =?utf-8?B?L0xYWENJeTdoQ1FMY2Vnak5TOGM5ZXF3WUV2MEQyVjRYZGFXbndzSlpmb0Nj?=
 =?utf-8?B?cStCYzFVM1F1ZHlrMGdBSHlaY0FqTDlFbjVvUlBGWWplV3FJaXlZaFBMaVJK?=
 =?utf-8?B?aUxMZnBreDVKVEp0TnNPK1JDRld1M0RWZElJWUZQZUQyMVVjS0RmSU9YR1Vx?=
 =?utf-8?B?S2pJNWtwZU0wZkk4RXMwZ29BY010cVFrWDIxbmgrbVRhaGluYzI2YnZTRTBU?=
 =?utf-8?B?bTRBME5LaGtlaEw4ei9FS2VIQkhFcndDd3RhbEFGZG5JYmJiR0N1cU9kdUdO?=
 =?utf-8?B?QVB2Y0JkK2FkeFBjZ2FFMDVFQUhVL1VNeC81ZHpNRTlQYTJaRzhyb25xaGU0?=
 =?utf-8?B?UGxpeVVHK0NMVEVVVXZHTEtnbTh6TFpMMW1wemVEK05RdVM2QVZTZ05wd2hm?=
 =?utf-8?B?dGc1SFhSeEsycmM4cmZYS0prSy9hQ0lEMkQzaW5Cekx1c3lrY2ZYUmRTK3I1?=
 =?utf-8?B?TkJETWRIZWUvL0RBbG8rMVdCSXdsK0JTK25TL1lGVmFMeE5QdEtIczhySG9L?=
 =?utf-8?B?TnMyQ1lBS0tIV29FVkE3QVB1MmFmL1RIS3lxRnpEczNNbzNBaFNrVXJtZ2NY?=
 =?utf-8?B?WDg0UTZDMDJBcFVLTlRSMjl4c3RsL2dYRkI2M01pSHVOTFJXcVNZZXBnRm9Q?=
 =?utf-8?B?RHlOVHpBUG5MaDNOVTRiZ0xUYklOZWhRcXJiVllKN1IvVCtlY2szWm54b1J6?=
 =?utf-8?B?cll2ZzMwamZYSE5mb2QrUGRmTVJ5bEM2VXJETTIxd3doMm9vRDdVM0k2NWJN?=
 =?utf-8?B?WkxPNHpndU5Eait6Mml0aWR2VFhlazU3b1BaUjBHbG9wVWxOQVYvczJPeGcr?=
 =?utf-8?B?VE9SU1ovNm80dUdZZitPMjd6dVFvelFuZWYraHdqbkhuMGJ1TEVKamg5djBT?=
 =?utf-8?B?NDNlS1htSVhqTlNVdVJvVVhuOW1TemVJSzllNVo5RS9xT1F3dUJrU0tCZ3Jk?=
 =?utf-8?B?MTV6dHdhTS9DM2Qvd2w0bWZ0bzhVYTlJeXpDbjRDSkErUkE5LzZnamJvajdW?=
 =?utf-8?B?VlVvQVZYQStOUHpCS0pkbHArcnFWUUR3RlBMT3JPbmlWcnNtMHpRa1BzSFFX?=
 =?utf-8?B?TzdZZkRaSGJ5WklHZnRkQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a96294-99fc-4fa4-aa05-08d936d2d2c5
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 05:42:15.8061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qRriNt7JxaAIjBeOBgL32HbkOqrSKA6qsZg5DrcM0ySUDxWvZNsk8OwRD2LdPjOZkIvY8UmDupEiA1O+cSZGUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5126
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

On 6/24/2021 2:14 AM, Hans de Goede wrote:
> Hi Shyam,
> 
> 
> On 6/23/21 10:01 PM, Shyam Sundar S K wrote:
>> Couple of existing issues on the completion codes to SMU
>> and a newer way to get the s0ix statistics are introduced.
>>
>> Also, add acpi ids for current and future revisions of the
>> pmc controller.
>>
>> Shyam Sundar S K (7):
>>   platform/x86: amd-pmc: Fix command completion code
>>   platform/x86: amd-pmc: Fix SMU firmware reporting mechanism
>>   platform/x86: amd-pmc: call dump registers only once
>>   platform/x86: amd-pmc: Add support for logging SMU metrics
>>   platform/x86: amd-pmc: Add support for logging s0ix counters
>>   platform/x86: amd-pmc: Add support for ACPI ID AMDI0006
>>   platform/x86: amd-pmc: Add new acpi id for future PMC controllers
> 
> Thank you for the new version.
> 
> Can you please respond to Raul's reply to patch 1/6 of v1 of
> the series?  Raul's remark seems very relevant to me.

Unfortunately, I could not find Raul's email in my inbox and hence I
missed to reply.

Hi Raul,

The break condition for readx_poll_timeout() should be 'val ==
AMD_PMC_RESULT_OK'. Reason being:

The smu firmware spec says, we have to wait until the response register
says 1, meaning it is ready to take the job requests. If it is anything
apart from 1, it means it's not in a state to take any requests.

And yes, response register always returns 'val > 0'. Refer to
AMD_PMC_RESULT_* macros.

Maybe instead of doing 'return rc', should I just do 'return -EBUSY' ?

+	if (rc) {
+		dev_err(dev->dev, "SMU response timed out\n");
+		return rc;
+	}
+  	return 0;

Am I missing anything obvious frmo your comments?

Thanks,
Shyam
