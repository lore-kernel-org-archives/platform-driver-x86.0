Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E9FC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 15:46:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B9E061040
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Oct 2021 15:46:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235328AbhJZPsb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Oct 2021 11:48:31 -0400
Received: from mail-bn7nam10on2041.outbound.protection.outlook.com ([40.107.92.41]:30272
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232671AbhJZPsa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Oct 2021 11:48:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhelhQDmDXCCUB9nlf3hYGT58jcj00QbAKw4AVrjDJ5xSJQzHAvSpgXD72dIJwXAQ4ItTqGxmajzyGy6y6srDt+jQUyR3yA3K963/bFP/DVkAzGAJcRA4wE7FOWcmNPfpBbZ2hxnVJJzGLJi8XcSRZu4Mt6qb5v5FnJ0odEJMGlcxuIoxBlp9bHvfx/LcfzouKUQJ6dkHMqSNBOkZUijNl2ChfvOoXNCcj/6NVsw0R5nxtirbxCUOuohzNVcdmB//zP4rTaIBjr48l0SmLzDcCfa8dKxjhpvbKLC1CN1dMmP1NCDA1GpoCwk7RytNGeHAYpyjzGmBAErpyegSFTS+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8LW9I5KqKiwtma2x83rtA0MTRw1pMtlc8fehyt1Yto=;
 b=agx8esZb5YXg/uuIrSXpiOKbYQuIkXc/LzxPAra04gGAaqcmouM+KTW10S8TiIs75CY71Q5uO4pV+ju+R0ZD34QgwspzDdLdjwtiHTkJ2yqPQBpzTUdX/zDvhJ138423xgLu+ySwreS09kFQcj/X6tXcsWy/6iGaQ/R13BDpLSVZQ+KjWnjeCdlJnd5TxTYuWZdRWsR1Gz8Kp+MAEwbpe8LGSu1WNE12TGMn+KWU11kdfeB6FxFkkEai5iUsygVzzsyUqi1KJpE1t6Sap3NHNZbQCFsR3cb4p1zZ7IVQX7bgcRuLn4EWvHfoHKp4HOfNrFcFpuNCV7WtZ1KgBg+RRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8LW9I5KqKiwtma2x83rtA0MTRw1pMtlc8fehyt1Yto=;
 b=PGpYXnE9PSuUupkfEZdN40RMA6L5zUIkAHSDfk4clrw8u9+psWpukDjxKOHshvYyq8osbQzVjDl7R6xefc+by/4pZbtXCj4WopByuDkdgFseE0jAzn+R8JiRvc5D4O94eLewnNSwQmgJenWqG8XDNR2Tr0jqD6PWtcPftjJHlgY=
Authentication-Results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SN6PR12MB2718.namprd12.prod.outlook.com (2603:10b6:805:6f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 15:46:05 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::f909:b733:33ff:e3b1]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::f909:b733:33ff:e3b1%4]) with mapi id 15.20.4628.018; Tue, 26 Oct 2021
 15:46:05 +0000
Message-ID: <224a173d-a58f-8e74-a515-7f7f6557308b@amd.com>
Date:   Tue, 26 Oct 2021 10:46:05 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 2/2] platform/x86: amd-pmc: Add special handling for timer
 based S0i3 wakeup
Content-Language: en-US
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
References: <20211020162946.10537-1-mario.limonciello@amd.com>
 <20211020162946.10537-2-mario.limonciello@amd.com>
 <YXgV9+YVKi5r840i@piout.net> <9b848381-db2b-c060-f012-c049c3b3276e@amd.com>
 <YXgevKbZupN4kXsJ@piout.net>
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <YXgevKbZupN4kXsJ@piout.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9P223CA0004.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::9) To SA0PR12MB4510.namprd12.prod.outlook.com
 (2603:10b6:806:94::8)
MIME-Version: 1.0
Received: from [IPV6:2600:1700:70:f700:747f:9c6e:320d:4f1f] (2600:1700:70:f700:747f:9c6e:320d:4f1f) by SA9P223CA0004.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend Transport; Tue, 26 Oct 2021 15:46:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbae5378-4dd3-4941-ff1d-08d99897b878
X-MS-TrafficTypeDiagnostic: SN6PR12MB2718:
X-Microsoft-Antispam-PRVS: <SN6PR12MB27182D1BA589CA53B897F2ACE2849@SN6PR12MB2718.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HhujwbuPh4fJ76Vr3d/IqlkhGQPxo/NL0jQV9idWsvLXnyJnM7Dvg+kGrkSW+SCBEQcMD7+VR2NaLIGt5Z72bSFYJ9ZsyuToAwH+u+gbri/wRtYp5Nuplnr7R2IJJ3ULaHWKlCrugnyylQJVvScnuQsznJOVScf6FmEsnNPUy0hm6fTbHv9btCOZ158wpX/OTBvhFr44iF3JMOzoUl3qf1nbjQ4wA8kMxSIE2lSmusSTfnNJpWSsuRcULZJIC+rB1LnqjLv1idigfdgI8BldCKNoN1XbvSB0QIkm2xoJGfJjzHH8uSEGGPgfev0HvjZ4aXOU6fW5IN85p7vNFunS+ZKiboLS2pdTlCYui6M1mpnRKt37dMNEHsHiGAizgbBcDla265z+o8EKJd3yAMT0OL9RZZUYQ4IZ2fdMbW/9t0OjjtoSoRqjK92px5f2vO50dg2YFfCDRR1tUB1Z1gPrqKjhwsisA7AcZx0TqNYqUotoblDQRs2kXPs1mzabLPTiKKwlZsMt72+Pbm8FGKw1Lp/Nb0l4wuXV7xKzDFgS/+aR7rsPqoqKpWZpVd9jcCFmsrD4kWuPpQZhWIHEGI7/yetsVrGuH3NAsK5/pVYgn6JmLx5y25p7hQg/ozCBcn2aIiYC3j2DewdGlTH1caR2mrJVu/5iD1d3r4zsESapXCzUx1ecUwTEFDNHX040/H6LQl8vva1PCj9FX6n5L07qaR31pukiiLbkvjT0P4LsCvIxw4MeZUmS8Y+bp7jeuziX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4510.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31696002)(83380400001)(36756003)(53546011)(4326008)(31686004)(186003)(86362001)(8676002)(5660300002)(8936002)(38100700002)(66476007)(66556008)(66946007)(54906003)(316002)(6916009)(508600001)(2616005)(6486002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUk0Z1BmaXl5aFpPSkZETTYzSk0xUUNOUXUyT1FqSFU0TjFvOXVNZWVsRlJI?=
 =?utf-8?B?ZDNBMHlWeXdteDZqSURLS2pRb2V6N3ViK2N2VHMvUkRkRjBWMVR6V1V0MTJY?=
 =?utf-8?B?UEZFMVdoQjFTaW5VNmhhN0g1aWRqaldXcHFlNEpkN2YzRE1KN2MzSkExU1hm?=
 =?utf-8?B?SDloRXo0UFNHZSt4eW9kLy8xVEdxN3l0eG9tdlRBS1pkZkFmZ0pveFE4MXJ5?=
 =?utf-8?B?UE84elp1QS9KOXFwREZUWGM2VUdEMzByWm5MSmpiSzRPSGVkdGxtelRnNXBz?=
 =?utf-8?B?elpteVc2aWphNXVaeFBhRS9sVXBLQmVCYXNSODFod2VjRXlUOVNJRGRRdU9B?=
 =?utf-8?B?R3ZvUmlKVUQyUkFYV0xtSXFhMGVyQUZBQTRtMUtMdGh1NU5BY0V1YzhEdHB1?=
 =?utf-8?B?N08vK3hvZ2VBVyt3cmkrWDJsY1lsdUhYeWFRMGZkSFJLNUJ1V09HOVZ0aTRq?=
 =?utf-8?B?YUlWMWhDQlJqUG9sYlpSODZ3clQ4VUpVZVdNSzFLeWdZbHhtMm91MnlEUEtq?=
 =?utf-8?B?bmNNeDl4Vmg5djJjSHIwa2JleUd2YVJYYmgzK2xpVGtMQ0EyMFdBbWdqQkJs?=
 =?utf-8?B?WC9XckpBbjFKQmkzaWhlTDBEY09wYlVsRUxOc2dpaHR5S2tON1E1aTdUYkV4?=
 =?utf-8?B?bExZL0dzbHpyR2hOVm92Q01CY0tlV3JNUWsxMElOaXFBdElSb3paWXhza0Zv?=
 =?utf-8?B?YWc4a3F1R1pLaTJBSXFoK2o1SEJudFBNMm9sRU5FK3N4QmtyMzVyMGlXL0FQ?=
 =?utf-8?B?K3BRZEdZdXR3VUw2dVNMbnFnZ0RxNEUwVkcvcDBibkFPWjVZZmpMUURaRURH?=
 =?utf-8?B?dXFTSjNxNFJmTmpUSnpmVFprOVQ3dFBXSlRYbzBWUmtmZ3VNTHhSSEdtS3Vi?=
 =?utf-8?B?ZDJyTkNQM0lOVmRsL0VoRVRWdlRtemVzUTRUalg1Y0U2cHRYMERmWllJS1Zt?=
 =?utf-8?B?TWxYVllqTGZFQ29WWjYyRDBZZ3pyMnliRnhMMmdWRWdIYWI4bXBDQmxHUnJN?=
 =?utf-8?B?a1pXWlRhVHJRRTJpTFVaV0NiRDJzUHprRFQ2T3BvWHlWUmtOUWh3S21obmJJ?=
 =?utf-8?B?UUxNRnFrL3hIVXlUcXZwRTNlcFY1MVUybjlydS92SFZuaDZvOVF5VzgxKzQw?=
 =?utf-8?B?cUlBcnh6MVBpM3kwQXNqcUhPVWE0L29QM2dqU3JlUXcvM3NEOE0wdlFueVJN?=
 =?utf-8?B?K0xDQnE4NzBmd2ZocnNLUTlxTTJiMlprZDEzdUNXYk41T0VpNnE4OVB0dlI2?=
 =?utf-8?B?WVlULzJFNEFxaXZxUWdyUTRBaDYrd3A0ZXgxSnQzNHQ0RjdMZFdIbW50T2Vj?=
 =?utf-8?B?UVkzWUxVRG5vdFdDbTJibXNsTm5CdE1OWXIvYzE1RFYzS1dOMGdZN0FSa1VW?=
 =?utf-8?B?Ymt2T245WlZUd2NuQzJ5OHJxbmhmYXFtUWVoKzlPR3RvR1VHeWdjKzhEelpL?=
 =?utf-8?B?VVJldWY3NFJsaU9SUXdNclBtMXRRczVqS2ZHa1MyQS9CaEhIajdjVHdmN1dR?=
 =?utf-8?B?RDZJU3p6ckZDSnMzZ291ZW1oZ1d3TE1YelZ2RllwR1JIejNDRUp2akYrZTNm?=
 =?utf-8?B?VjBTdVc4ZS9kcXo1dkJ2Z3pwaWJnQ1Y2Sm5TMEJ4ZTZ2ODVwSzArYlJhYWpQ?=
 =?utf-8?B?TVlVdEdEYXF3TllGWTVEaXdCV3B4Ri92YXJaSzVSUnVIRUdMSStZTUdPZGNn?=
 =?utf-8?B?dko5NjkzcUpONitHKzZtY1ZLdUxUcExYM2hzSGRWLzBhNU5mUHduS0NuelRB?=
 =?utf-8?B?WFBtVkIrbTZFSDdzNVN3YmVzM2pYVVcyQUdUMHVDU3l5Y3NxYTJQM00rT2E1?=
 =?utf-8?B?b04xS1lpc1FwR0hnLzJ6MUwxREZQTkhkZVQ1R2I3Znc1UFU3YmErcGtkYy9a?=
 =?utf-8?B?NytKZ2lHRktoamZoQ0xkbzRkcDRhOUdZS2UzRTB2N0U3WEJ0Mnp3eGY2UVM0?=
 =?utf-8?B?QmdLMkJRa2MwWU1Fa2dlRDVsYmJaY3ZYUVN2RGhNNGJDbnlZR1ZqTXBaQnJu?=
 =?utf-8?B?UUh3RWozQi9RYjI4Y2lFd1ZxZ3o4S28xMFlpNkV3U2QwNmEzUThUc2dGLzZF?=
 =?utf-8?B?NlRiTmI0QUpoV0EyVXgwYnBNSVJKUEcyWnlBTmxCTnl1RFl2V3Q2aWQ3ZUJE?=
 =?utf-8?B?anRib2ZWN0pGVGtscHZPem85aG0wZTZrU004T0c4OUlxVkNJL1VFMjRHNHB3?=
 =?utf-8?B?akd2VnhZbUFOUXhyR0dpd01hVWxXUnRWcDM3aVBXY1JRMFpGS2lDTXJ1Q0Jk?=
 =?utf-8?Q?h5AoEVjEGK1TzyRfZKPVgRMHE0YPs+M8RN6U63v6yw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbae5378-4dd3-4941-ff1d-08d99897b878
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 15:46:05.3092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QZNQUx0ssn8UrtxgFZ8vx2XaqQSZ8ge9tYrMH90yzppYvbM4UmKRt3L/dv7G/k28F0wg2yV3JdDRLpxJSUJJMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2718
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 10/26/2021 10:29, Alexandre Belloni wrote:
> On 26/10/2021 10:15:06-0500, Limonciello, Mario wrote:
>>>
>>>> +	if (!rtc_device)
>>>> +		return 0;
>>>> +	rc = rtc_read_alarm(rtc_device, &alarm);
>>>> +	if (rc)
>>>> +		return rc;
>>>> +	if (!alarm.enabled) {
>>>> +		dev_dbg(pdev->dev, "alarm not enabled\n");
>>>> +		return 0;
>>>> +	}
>>>> +	rc = rtc_valid_tm(&alarm.time);
>>>> +	if (rc)
>>>> +		return rc;
>>>
>>> Why do you think the RTC core give you an invalid alarm time?
>>
>> It doesn't matter "why" to me.  It's defensive programming.
>> The function has a return code to check for problems.  If an invalid alarm
>> time was somehow programmed, we shouldn't be using it.
>>
> 
> The question was not why it would happen, but why you think it could.
> The RTC core will not return an invalid alarm, else, you'd already
> catch that checking the return value of rtc_read_alarm. This is not
> defensive programming, this is useless.

Very well, I'll modify and drop this part in a follow up series.

> 
>>>
>>>> +	rc = rtc_read_time(rtc_device, &tm);
>>>> +	if (rc)
>>>> +		return rc;
>>>> +	then = rtc_tm_to_time64(&alarm.time);
>>>> +	now = rtc_tm_to_time64(&tm);
>>>> +	duration = then-now;
>>>> +
>>>> +	/* in the past */
>>>> +	if (then < now)
>>>> +		return 0;
>>>> +
>>>> +	/* will be stored in upper 16 bits of s0i3 hint argument,
>>>> +	 * so timer wakeup from s0i3 is limited to ~18 hours or less
>>>> +	 */
>>>> +	if (duration <= 4 || duration > U16_MAX)
>>>> +		return -EINVAL;
>>>> +
>>>> +	*arg |= (duration << 16);
>>>> +	rc = rtc_alarm_irq_enable(rtc_device, 0);
>>>
>>> What if userspace is waiting for the alarm to happen?
>>
>> They won't receive it.  Note; this is no different than before the patch on
>> these affected systems.
>>
> 
> But then shouldn't that be fixed? Why does the alarm need to be
> disabled?

The reason for this patch was that the RTC is not a valid wake source 
during s0i3 on the affected designs but the Linux ecosystem heavily uses 
it for stress testing.  Leaving the RTC armed will cause undefined behavior.

I do want to note that this constraint does not exist in future designs 
(such as Yellow Carp).

> 
>>>
>>>> +	dev_info(pdev->dev, "wakeup timer programmed for %lld seconds\n", duration);
>>>> +
>>>
>>> Do you actually need this message, looks like leftover debug to me?
>>
>> Yes it was definitely used in debugging to produce this patch in the first
>> place.
>>
>> I left it for two reasons:
>> 1) It makes it clear if someone is using this functionality when they report
>> an error.
>>
>> 2) It shows if they were operating really close to the boundary conditions
>> (and thus it may be required to adjust).
>>
>> I am amenable to downgrading it to dev_dbg and on reported issues around
>> this asking people to +p dynamic debugging for amd_pmc.
>>
>>>
>>>> +	return rc;
>>>> +}
>>>> +
>>>>    static int __maybe_unused amd_pmc_suspend(struct device *dev)
>>>>    {
>>>>    	struct amd_pmc_dev *pdev = dev_get_drvdata(dev);
>>>>    	int rc;
>>>>    	u8 msg;
>>>> +	u32 arg = 1;
>>>>    	/* Reset and Start SMU logging - to monitor the s0i3 stats */
>>>>    	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_RESET, 0);
>>>>    	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_START, 0);
>>>> +	/* Activate CZN specific RTC functionality */
>>>> +	if (pdev->cpu_id == AMD_CPU_ID_CZN) {
>>>> +		rc = amd_pmc_verify_czn_rtc(pdev, &arg);
>>>> +		if (rc < 0)
>>>> +			return rc;
>>>> +	}
>>>> +
>>>>    	/* Dump the IdleMask before we send hint to SMU */
>>>>    	amd_pmc_idlemask_read(pdev, dev, NULL);
>>>>    	msg = amd_pmc_get_os_hint(pdev);
>>>> -	rc = amd_pmc_send_cmd(pdev, 1, NULL, msg, 0);
>>>> +	rc = amd_pmc_send_cmd(pdev, arg, NULL, msg, 0);
>>>>    	if (rc)
>>>>    		dev_err(pdev->dev, "suspend failed\n");
>>>> -- 
>>>> 2.25.1
>>>>
>>>
>>
> 

