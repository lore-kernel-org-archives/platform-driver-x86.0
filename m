Return-Path: <SRS0=isCl=DO=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 925CFC4363D
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Oct 2020 14:02:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30C38205F4
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Oct 2020 14:02:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KdB0lwuz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728544AbgJGOCO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Oct 2020 10:02:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21432 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728541AbgJGOCO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Oct 2020 10:02:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602079332;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1zo6+paFpMvAWB6kLrQqb+o76jYRxz9NTomhjj2qdiU=;
        b=KdB0lwuzNUf56Apx1iCvWBs0RzbmA3vHsbK7OAslg0QcgVFCGuOeNxNAmN38/7IJJNaLSB
        avbc6eK9Hlrl4Xua8OLYtZEfEpLywlPpnFpIY3C6qNZJq1+TpVksZEVE0GPK61IJv7ICQC
        xhVe48C6wuLLE9VFaLWK7SmHpBD4gyk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-HA9j-H9nNfavHFdzVH2uww-1; Wed, 07 Oct 2020 10:02:11 -0400
X-MC-Unique: HA9j-H9nNfavHFdzVH2uww-1
Received: by mail-ed1-f71.google.com with SMTP id s21so934085edi.6
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Oct 2020 07:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1zo6+paFpMvAWB6kLrQqb+o76jYRxz9NTomhjj2qdiU=;
        b=i52Agagk1+kw5XN84NIvodhTN5FVILd7g//9GVSPz3RvbEwD120l6RlvtiQzNMSTRz
         mMC5YoA3gfWxF80sQBvZSqsrnRskMILfTpbe1Z/0/t7+XsrEshiTAS8pc8PFcV9jDit2
         E8NLGaj1Lj2c+8XRJp1XqfWty8Ga9WzEszM9XWwvYQs94ddu96Hkg5WyoYtDjLqQdrLZ
         cvm58nFK8mWrc10hd6krGZVWJ2Efb+z+ZoccKX7yC4hUfp2V/flLAL0umIPddz6tBl2H
         TcyvxLqwoYJqyobD615TDQhDMVpaos7YsgKYGdNXi3trzGgCFraN2C5ypjKACQATsfnw
         5dhg==
X-Gm-Message-State: AOAM531itFlfzRqc8cQrB74bz6csKLXxf0QKro7h1222pFSJZKJkxExW
        HY13tS8Fiqjk1T3Maarh0yPUqe+RW0BjE66lAff/6ma0nJ3m1wzryox8Xe8N3maXJXuZW55a4zE
        v2XR+E7nq0ZlYhtpfvqqebGeScVww29ZGVg==
X-Received: by 2002:aa7:cd4f:: with SMTP id v15mr3526783edw.243.1602079329882;
        Wed, 07 Oct 2020 07:02:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/PT4lCPIXivWIXpR++SRl2M+Cb9ETU5mfjtp+kkWEj7GDNfwMX43yD3IEAhajiAMcAv4soQ==
X-Received: by 2002:aa7:cd4f:: with SMTP id v15mr3526757edw.243.1602079329551;
        Wed, 07 Oct 2020 07:02:09 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id n15sm1535614edv.34.2020.10.07.07.02.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2020 07:02:08 -0700 (PDT)
Subject: Re: [PATCH v2] platform/x86: hp-wmi: add support for thermal policy
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Elia Devito <eliadevito@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200917214957.GD29136@mtg-dev.jf.intel.com>
 <20201004211305.11628-1-eliadevito@gmail.com>
 <CAHp75VfbK226a-SsNj=Bnpfc3wWyT9K_D4XzAMOu9of1_g+8-A@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5d60709b-e3cb-685f-2b3e-07381b9855e5@redhat.com>
Date:   Wed, 7 Oct 2020 16:02:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VfbK226a-SsNj=Bnpfc3wWyT9K_D4XzAMOu9of1_g+8-A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/5/20 10:57 AM, Andy Shevchenko wrote:
> On Mon, Oct 5, 2020 at 12:14 AM Elia Devito <eliadevito@gmail.com> wrote:
>>
>> HP Spectre notebooks (and probably other model as well)
>> support up to 4 thermal policy:
>>   - HP Recommended
>>   - Performance
>>   - Cool
>>   - Quiet
>>
>> at least on HP Spectre x360 Convertible 15-df0xxx the firmware sets the
>> thermal policy to default but hardcode the odvp0 variable to 1, this causes
>> thermald to choose the wrong DPTF profile witch result in low performance
>> when notebook is on AC, calling thermal policy write command allow firmware
>> to correctly set the odvp0 variable.
>>
>> Signed-off-by: Elia Devito <eliadevito@gmail.com>
>> ---
>>   drivers/platform/x86/hp-wmi.c | 23 +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
>> index 1762f335bac9..6e448a79caee 100644
>> --- a/drivers/platform/x86/hp-wmi.c
>> +++ b/drivers/platform/x86/hp-wmi.c
>> @@ -81,6 +81,7 @@ enum hp_wmi_commandtype {
>>          HPWMI_FEATURE2_QUERY            = 0x0d,
>>          HPWMI_WIRELESS2_QUERY           = 0x1b,
>>          HPWMI_POSTCODEERROR_QUERY       = 0x2a,
> 
>> +       HPWMI_THERMAL_POLICY_QUERY      = 0x4c
> 
> Usually we leave a comma that next change won't add any unnecessary churn.
> I don't think this comment requires a v2 right now (may be satisfied
> when applied), but if any other comments come and need to be
> addressed, then this should be included as well.

I've fixed this up while applying this to my review-hans branch, so
there is no need to send out a new version.

Elia, Thank you for your patch, I've applied this patch to me review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Once I've run some tests on this branch the patches there will be added
to the platform-drivers-x86/for-next branch and eventually will be
included in the pdx86 pull-request to Linus for the next merge-window.

Regards,

Hans



> 
>>   };
>>
>>   enum hp_wmi_command {
>> @@ -861,6 +862,26 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
>>          return err;
>>   }
>>
>> +static int thermal_policy_setup(struct platform_device *device)
>> +{
>> +       int err, tp;
>> +
>> +       tp = hp_wmi_read_int(HPWMI_THERMAL_POLICY_QUERY);
>> +       if (tp < 0)
>> +               return tp;
>> +
>> +       /*
>> +        * call thermal policy write command to ensure that the firmware correctly
>> +        * sets the OEM variables for the DPTF
>> +        */
>> +       err = hp_wmi_perform_query(HPWMI_THERMAL_POLICY_QUERY, HPWMI_WRITE, &tp,
>> +                                                          sizeof(tp), 0);
>> +       if (err)
>> +               return err;
>> +
>> +       return 0;
>> +}
>> +
>>   static int __init hp_wmi_bios_setup(struct platform_device *device)
>>   {
>>          /* clear detected rfkill devices */
>> @@ -872,6 +893,8 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
>>          if (hp_wmi_rfkill_setup(device))
>>                  hp_wmi_rfkill2_setup(device);
>>
>> +       thermal_policy_setup(device);
>> +
>>          return 0;
>>   }
>>
>> --
>> 2.26.2
>>
> 
> 

