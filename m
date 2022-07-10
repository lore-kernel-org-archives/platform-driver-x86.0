Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B45C43334
	for <platform-driver-x86@archiver.kernel.org>; Sun, 10 Jul 2022 18:53:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbiGJSxV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 10 Jul 2022 14:53:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiGJSxU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 10 Jul 2022 14:53:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B732211C26
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Jul 2022 11:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657479198;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rSUShsJ6IPWR4doimTX6tAItMj1xSGNWDVWSaFvkK0M=;
        b=JoROCL+IfENHbYkWwY1MlYYqeTinZiW2BlYAEq1Xv6mYQtVR8JUj8R+qrBIVZXx/GdaEIi
        N+ZiPsA1bRcxCchT4Cg5vA5wgRl9F+7QZ0V999OY+btqe125CUY0kgDjUuaAWU8woWyrXq
        Ow0V39NqVb3uapyYolkHYdys8m9egRY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-225-mprLvrWcPbip5nYqHlY_bQ-1; Sun, 10 Jul 2022 14:53:17 -0400
X-MC-Unique: mprLvrWcPbip5nYqHlY_bQ-1
Received: by mail-ej1-f70.google.com with SMTP id sb34-20020a1709076da200b00722f4a9865bso357741ejc.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Jul 2022 11:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rSUShsJ6IPWR4doimTX6tAItMj1xSGNWDVWSaFvkK0M=;
        b=Px2aY8n+pNE5CjD2BB+XSI06XOu2lbA33iwfJpdukgrRJ58fO20+nWfqxcqYoWLlnZ
         38AITs0JxyHu5/1bS/+wfHOEer5+uqJegH9RAA2TlgD1ZnvIlVh6SNnZ8/L0A/EwHgLa
         y7gx3azfp7nf17XrPI3w5FDffU/1CH4ih+MWK3/m6ElZUl9qqENXXQAJb3ZMy7FDxyn7
         nZAHDDi7slHpirqwHJTlWBlv/7dkvHrYm8a9dfYxpQcJNgYJI7JVXb84i5mhKDle2GC8
         rPIGLccJSDsfojRDMNEiw1cfc84B9EiYOmIWf8S7vHtv9HfR80/4LUukOXvUnsFSURGJ
         23LA==
X-Gm-Message-State: AJIora9MFIcJ0UjgT3t/DQr5MixhY2gdLZB9Yn2mQMYQ4HfnoZbQ5fIf
        rNqj2Epd0L3nkOCPaVugLYktGnPO82zHCQHTAn9a6DHwrdT+sMe9JY861n47qFtecl8M+1RwtfW
        jm7W4XnnlVRVBznxT20NWu0fcowm4Jgxl+w==
X-Received: by 2002:a17:907:d16:b0:726:a3bf:121d with SMTP id gn22-20020a1709070d1600b00726a3bf121dmr14577818ejc.390.1657479195847;
        Sun, 10 Jul 2022 11:53:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sUvoVQ3Sj9/nHQjlfP5jMQqbgCBr+aJPol8RB1WNCAVSMkEyGsvkNel/muD23DJpmOBuMHlQ==
X-Received: by 2002:a17:907:d16:b0:726:a3bf:121d with SMTP id gn22-20020a1709070d1600b00726a3bf121dmr14577801ejc.390.1657479195647;
        Sun, 10 Jul 2022 11:53:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id z18-20020a05640235d200b0042de8155fa1sm3162698edc.0.2022.07.10.11.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Jul 2022 11:53:15 -0700 (PDT)
Message-ID: <0dc3e517-2ba2-bb7b-c1aa-7c4c074e9214@redhat.com>
Date:   Sun, 10 Jul 2022 20:53:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] platform/x86: intel_atomisp2_led: Also turn off the
 always-on camera LED on the Asus T100TAF
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20220710173658.221528-1-hdegoede@redhat.com>
 <YsseKWbSxr7cFbCi@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YsseKWbSxr7cFbCi@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/10/22 20:44, Andy Shevchenko wrote:
> On Sun, Jul 10, 2022 at 07:36:58PM +0200, Hans de Goede wrote:
>> Like the Asus T100TA the Asus T100TAF has a camera LED which is always
>> on by default and both also use the same GPIO for the LED.
>>
>> Relax the DMI match for the Asus T100TA so that it also matches
>> the T100TAF.
> 
> Shouldn't atomisp driver take care about this (presumable in the future)?

Eventually yes, for now we have a small driver to at least turn of
the LED on devices where it is on at boot (or to be more precise
gets turned on when running the ACPI INIT method of the asus-wmi
WMI device).

Regards,

Hans

