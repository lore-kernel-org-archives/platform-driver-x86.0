Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60131C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  5 Feb 2022 10:16:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347183AbiBEKQq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 5 Feb 2022 05:16:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43221 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233009AbiBEKQp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 5 Feb 2022 05:16:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644056204;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PQ0aXswSl/dTBlHPdqpDzttMfm7O9AwI+TyUR22HQAA=;
        b=MNi2DNYQjRpZKVZmG77v/kBC4C3zWjdIP7m/+od1QwY8PVoLzi6/HxMdzVcc4u6B0aRq1b
        z3IGx2W1XIapvBc2tdv3h2k/6GwhMtFmSWWcN0kLcJoMxp1APxWNawusxF3G69HliyJijl
        PkR9+NXVkog2a1PKqgpJoAOZ2HpUd18=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-36-5W1TxMdWOSWYRmZ-9sQ-1; Sat, 05 Feb 2022 05:16:41 -0500
X-MC-Unique: 36-5W1TxMdWOSWYRmZ-9sQ-1
Received: by mail-ed1-f69.google.com with SMTP id en7-20020a056402528700b00404aba0a6ffso4470991edb.5
        for <platform-driver-x86@vger.kernel.org>; Sat, 05 Feb 2022 02:16:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PQ0aXswSl/dTBlHPdqpDzttMfm7O9AwI+TyUR22HQAA=;
        b=vliASrw0XwkbX32xbnEbClR2hcCaxQ9djP5mgt2ABhX18wqgdjKnwbqXvhO7j/4RGF
         bSdqCo/QyEifl9MEW7B1J9JiVZQn5twj+/X5gjC9WI+5c+KRe7kdjK3uNRUrkSX1eKF8
         JOCIQyE77e5KezQOqhmwW2hEbBbMF0Vub3FyfMOETaqa54b2WhnPz6pjvNPhhLkljZGm
         8rBjuBoV6DvnRtM6atXjwFTtkAWCI9gTXqhzi/QAVm256S5UhfpPmmC96vXWrA+XxQ2+
         nNnD/yvC91WLEZUgpvUGacKnKnZkuOjRPVxa9PJwHmCqU/4EMrQlm119OtJpiWVg5+aY
         Ps6A==
X-Gm-Message-State: AOAM530oc93V+RzOJsy7OA7OrcVTllZAN3OlGJIUZ342IiMn+89PB/ii
        xkh+B8ILTfU0zrOZx2PUKBXZrnF6bh1MOxQ9C9Pm/+HIHgscgwzRfq7nQQ/rnYP8k7tUEVne5tk
        FkI0mZwj1WIQxl3VGQVdrfohTYiVCbd13Uw==
X-Received: by 2002:a17:907:a0ce:: with SMTP id hw14mr2607724ejc.105.1644056200169;
        Sat, 05 Feb 2022 02:16:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxAW7BYEaAnE3mY4yMbrfdVKWNkjxE+DDo7ZzZqmoRMraKWTNbeq7m0f2AIylbSGOYZg0HEhA==
X-Received: by 2002:a17:907:a0ce:: with SMTP id hw14mr2607701ejc.105.1644056199954;
        Sat, 05 Feb 2022 02:16:39 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id d3sm1939923edq.13.2022.02.05.02.16.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Feb 2022 02:16:39 -0800 (PST)
Message-ID: <fde23037-b9c7-adde-5a2b-79a67c329538@redhat.com>
Date:   Sat, 5 Feb 2022 11:16:38 +0100
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
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <6c52edb4-7cb4-7bfd-a40c-a0874569de72@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/5/22 11:10, Abhijeet Viswa wrote:
> Hi,
> 
> Firstly, apologies if I have included/excluded the wrong mailing list or persons in this email. This is my first time doing this and I've tried my best to make sure it is accurate.

No worries, it looks like you've done a pretty good job at picking the
right people + lists. And even if you didn't with regressions like this
*the* most important thing is to get the word out quickly, so thank
you for doing that!

> I am facing a regression in the mainline of the kernel (commit 0457e5153e0e8420134f60921349099e907264ca) with the asus-wmi platform driver. The driver fails to load with the following dmesg:
> 
>     asus-nb-wmi: probe of asus-nb-wmi failed with error -61
> 
> I have an ASUS TUF FX506 laptop.
> 
> I traced the regression to the method fan_curve_get_factory_default. It calls a WMI method which is expected to return a data buffer. However, if the device does not support fan curve method it is supposed to return the integer error code ASUS_WMI_UNSUPPORTED_METHOD.
> 
> However, my laptop returns a value 0 to indicate that the method is not supported:
> 
>                 If ((IIA0 == 0x00110024))
>                 {
>                     Return (Zero)
>                 }
> 
>                 If ((IIA0 == 0x00110025))
>                 {
>                     Return (Zero)
>                 }
> 
> This means that on lines 395-407 in the method asus_wmi_evaluate_method_buf, the if condition err == 0 evaluates to true an -ENODATA (-61) is returned.
> 
>         case ACPI_TYPE_INTEGER:
>                 err = (u32)obj->integer.value;
> 
>                 if (err == ASUS_WMI_UNSUPPORTED_METHOD)
>                         err = -ENODEV;
>                 /*
>                  * At least one method returns a 0 with no buffer if no arg
>                  * is provided, such as ASUS_WMI_DEVID_CPU_FAN_CURVE
>                  */
>                 if (err == 0)
>                         err = -ENODATA;
>                 break;
> 
> I am not sure the extent of ASUS laptops that are affected. TUF series laptops do not support fan curve control and so I presume many of them are affected by this regression.
> 
> I have tested a patch which selectively ignores the -ENODATA error code when probing for fan curve control. However, I'm not sure if this is the right way to do things and hence have no included the patch here.

That sounds like it is the right way to do it, can you share your patch please ?

And in the case I end up using your patch as is, may I add a:

Signed-off-by: Abhijeet Viswa <abhijeetviswa@gmail.com>

To the patch when committing it?

By adding this line you indicate that you are the author of the code and
are submitting it under the existing license for the file which you are
modifying (typically GPL-2.0) or that you have permission from the author
to submit it under this license. See:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

> Once again, I apologize if this email is not how things are normally done and would love to hear feedback on the same.

Once again, this is the right way, so no worries and thank you for reporting this.

Regards,

Hans

