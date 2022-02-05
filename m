Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B86DC433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  5 Feb 2022 11:26:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243771AbiBEL06 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 5 Feb 2022 06:26:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23515 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243589AbiBEL06 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 5 Feb 2022 06:26:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644060417;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gh/nUdHk29sNmDMlgT5ea/uAbyFLF1j1/BlmX240Ke8=;
        b=BZe2/kJLA01joPqTaJu6LN7bph+ift/073BLlc+nTzvwQLrQfOH8jkj12PKzj6Evvrjv+7
        5WzWFanmFKbKczK44C0ebJfT9seTG7YTCkBkROge0bPcPpIiKoIwWFHP7DsgjDry5ep/Q4
        nkeQHtf4jXX/HRFeX2wVH051J/PoVLA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-RTFYGs-YN3yjQ3QIhl2h7g-1; Sat, 05 Feb 2022 06:26:55 -0500
X-MC-Unique: RTFYGs-YN3yjQ3QIhl2h7g-1
Received: by mail-ed1-f71.google.com with SMTP id o25-20020a056402039900b0040631c2a67dso4472042edv.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 05 Feb 2022 03:26:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gh/nUdHk29sNmDMlgT5ea/uAbyFLF1j1/BlmX240Ke8=;
        b=t14hxr/r6maym2f6rEAO6TjPESDxvo8z12/W2lLDqVS7LOCy2pmVzcFYfvhwebNq2b
         d3fvG9ubpsl3LuZb7Ptu60I9aR9axFIW+hU0u1yUzXmsOitqMjckj1dIiMxrLApF4Y4+
         Q3cpz4AI6KS9ltVXkQeGnMehIV8Pai7Pn6Qp/JPagE0h674tDgr4sHm8s+f6Qml2qj53
         XJBgdbAyt7epANXkf4pMfLJcm2k3WyeWtB+sRNiyHddJXHxeDEHK0HB7SOxDHTM037Aj
         YOcsWRpD0vyyTp7/1GtByd8uqeZkz+SnHgMjOmgqye5BmDzKuC0YI7qznywQmv2kwssy
         Jxzw==
X-Gm-Message-State: AOAM531QLZzdwIiuiLmckWDJPm7HDxD9hvGnyMVBcCDWdvjpnLiE4kPh
        XWIYDyC2xU99XehE21ivdXNXErqeqADlUCcjc+2RlKSZfpSdqo7KpH00ObAF8mE4u7HFBd6iO0k
        iyJ0sBc5LGHZ8CAKDhcA+gdv8qPc8J8/w8w==
X-Received: by 2002:a17:907:3da1:: with SMTP id he33mr2716450ejc.207.1644060414159;
        Sat, 05 Feb 2022 03:26:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMJm0nOP0QF34eE1Jd7CcSUBrVDihjgQKwUD6azlyLrFWhuij8OTDsUW9WLSr7Jwe7050swA==
X-Received: by 2002:a17:907:3da1:: with SMTP id he33mr2716439ejc.207.1644060413949;
        Sat, 05 Feb 2022 03:26:53 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id ry6sm1509196ejc.45.2022.02.05.03.26.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Feb 2022 03:26:53 -0800 (PST)
Message-ID: <5ce59b72-f098-6b1d-7eee-5012f6841dc7@redhat.com>
Date:   Sat, 5 Feb 2022 12:26:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Regression in asus-wmi due to fan curve patches
Content-Language: en-US
To:     Abhijeet Viswa <abhijeetviswa@gmail.com>
Cc:     "Luke D. Jones" <luke@ljones.dev>,
        acpi4asus-user@lists.sourceforge.net,
        Corentin Chary <corentin.chary@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <6c52edb4-7cb4-7bfd-a40c-a0874569de72@gmail.com>
 <fde23037-b9c7-adde-5a2b-79a67c329538@redhat.com>
 <3223414e-2f95-9945-f0c1-c36782281478@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <3223414e-2f95-9945-f0c1-c36782281478@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/5/22 12:01, Abhijeet Viswa wrote:
> Hi, 
> 
> On 05/02/22 15:46, Hans de Goede wrote:
>>> Firstly, apologies if I have included/excluded the wrong mailing list or persons in this email. This is my first time doing this and I've tried my best to make sure it is accurate.
>>
>> No worries, it looks like you've done a pretty good job at picking the
>> right people + lists. And even if you didn't with regressions like this
>> *the* most important thing is to get the word out quickly, so thank
>> you for doing that!
> 
> Thanks. I'm happy to hear this.
> 
> I tried a git-format patch which created an email patch. Wasn't sure if I had to send a separate patch email, so I've decided to inline the patch contents at the end of this email. And, I certify that the changes are mine and license them under the same license as the files modified.

Thank you for the patch and for the nice commit message.

I've come up with a slightly different version where -ENODATA is checked
inside the fan_curve_check_present() helper. This way if e.g. there
is a CPU fan-curve but no GPU fan-curve, because e.g. there is no
separate GPU fan the hwmon device will still get registered for just
the CPU fan curve.

I'll send out my version right after this email, if you can test it
that would be great.

> Hopefully inlining it is fine. If not, I could provide it as an attachment.

Since I've come up with a different approach I did not try to apply it,
but inlining often leads to issues due to replaceing tabs with spaces
and linewrapping. Although it seems your mail-client has done neither,
which is good.

Still for the next time, the preferred way to submit patches is to
use git send-email which does not have any of these issues.

Regards,

Hans


> ~~~
> 
> From f5bae0a579dc211c329c7aa08837e462aee1af6b Mon Sep 17 00:00:00 2001
> From: Abhijeet V <abhijeetviswa@gmail.com>
> Date: Sat, 5 Feb 2022 15:57:23 +0530
> Subject: [PATCH] asus-wmi: Fix regression when probing for fan curve control
> 
> The fan curve control patches introduced a regression for atleast the
> TUF FX506 and possibly other TUF series laptops that do not have support
> for fan curve control.
> 
> As part of the probing process, asus_wmi_evaluate_method_buf is called
> to get the factory default fan curve . The WMI management function
> returns 0 on certain laptops to indicate lack of fan curve control
> instead of ASUS_WMI_UNSUPPORTED_METHOD. This 0 is transformed to
> -ENODATA which results in failure when probing.
> 
> Signed-off-by: Abhijeet V <abhijeetviswa@gmail.com>
> ---
>  drivers/platform/x86/asus-wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index a3b83b22a3b..adeb58765dc 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -3585,7 +3585,7 @@ static int asus_wmi_add(struct platform_device *pdev)
>  		goto fail_hwmon;
>  
>  	err = asus_wmi_custom_fan_curve_init(asus);
> -	if (err)
> +	if (err && err != -ENODATA)
>  		goto fail_custom_fan_curve;
>  
>  	err = asus_wmi_led_init(asus);
> 

