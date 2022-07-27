Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A5FC3F6B0
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Jul 2022 14:17:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233555AbiG0ORJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Jul 2022 10:17:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233466AbiG0ORI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Jul 2022 10:17:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 32239AE48
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 07:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658931426;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MId/XktjQmcMCI7FXm5cb1iULa3WVlfui2WBmXvxfVg=;
        b=d9QVMjbzd3oISVuu/Tvrdu9rfoAQ/ChCKkwJ5MMaZhYoikpr0eqT3V0Wb2Vwednq6+jrCZ
        iEtx0aok8vJjAlFt4JHoWvk25LAIiLZQk9VOEYgd4+SnTkodSVBXtCM99QW0XnGw6Of2Is
        7AfRs1d4dJgwCkOVFtglGaslxGkxZ+I=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-GWPxXyBlOS2KbzT6M6ZMhQ-1; Wed, 27 Jul 2022 10:17:04 -0400
X-MC-Unique: GWPxXyBlOS2KbzT6M6ZMhQ-1
Received: by mail-ej1-f69.google.com with SMTP id jg29-20020a170907971d00b0072b5acf30e7so5150750ejc.8
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 07:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MId/XktjQmcMCI7FXm5cb1iULa3WVlfui2WBmXvxfVg=;
        b=uSQsCJQr5sfsTFFoyuUnOjEVms06uSPI6dtf3vknawh8mFmoy2FzOkcj6gIwSlHjTq
         BHH5Rm5RARNWZl8TNLHtFe/yYLsJZ4cQdtxKxGWI6QFRrgEJbCLIu+8E4Q1A7Y6HLVD9
         D1s5tBh1GYMjeMw1F30eYEN3ypxy44Y9Ze46ohFDTiLQlrjNm5saYDiRmSAzqe1DmGKi
         uCngcCEC2yZVeECLyCtvHxEjE1SpfFEsmN0v8weIccxuqeJr9z3mI8nkx3eieOQhTR3e
         cHQ8sWGuX855Qs0spsa0nRvQgRpVyDNAqWo/4e0kL4pZrMyEzKRhS5Sc4Sj9AjSph4UG
         ArMQ==
X-Gm-Message-State: AJIora/0B88Edz8EH1/4b/g9f5s4M8khToM1p3g8snOl6ZB0cPugrcUu
        o8Lc8J7vvKzyoAgtM6A88C/2tpcRQWpMoxVLTb/dkqk3M/0KTGvSO9PBXFXXNvCedvg1H+wCo6I
        BQHA6Fx0+/SNXh6EFlo/I9h0Zn7DTIY01RA==
X-Received: by 2002:a17:906:8a6c:b0:72b:3b4f:13b with SMTP id hy12-20020a1709068a6c00b0072b3b4f013bmr18487789ejc.14.1658931422643;
        Wed, 27 Jul 2022 07:17:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vwCMILN2431xlfeVeqfAJPhv5xDIDxsGF5yoGYt+Su5Ktn+/CPUFDnr5KXuT8Q1f9NDMlfhg==
X-Received: by 2002:a17:906:8a6c:b0:72b:3b4f:13b with SMTP id hy12-20020a1709068a6c00b0072b3b4f013bmr18487771ejc.14.1658931422435;
        Wed, 27 Jul 2022 07:17:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id q12-20020a17090622cc00b0072ed72072aesm7693552eja.192.2022.07.27.07.17.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 07:17:01 -0700 (PDT)
Message-ID: <842cbc5d-732f-7ebe-3f79-762fbe5da8fb@redhat.com>
Date:   Wed, 27 Jul 2022 16:17:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: names for root swnodes in INT33FE driver and others
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
References: <CAHp75VeH9Lax-S=qPq4a_i1kLBWTV=Y0=ePtFHNUN7cR65sa_g@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VeH9Lax-S=qPq4a_i1kLBWTV=Y0=ePtFHNUN7cR65sa_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Andy,

On 7/18/22 22:17, Andy Shevchenko wrote:
> HI!
> 
> During the discussion of some DSA rework [1] I just realized that
> names for root swnodes are not required and moreover should be unique
> in the system. Looking into the INT33FE driver I'm now asking myself
> why we are still using names there (except just convenience for us)?
> 
> Note, theoretically it might be possible that one can somehow connect
> another i2c device to those Cherry Trail machines (let's say via
> USB-to-I2C adapter). And somehow try to register swnode from maybe
> out-of-tree driver, however it's not an issue to the official kernel.
> 
> That said, maybe better just to remove them where we don't rely on their names?

For some nodes the name is important, e.g. drivers/usb/typec/class.c does:

	altmodes_node = device_get_named_child_node(&port->dev, "altmodes");

And AFAIK the connector node also must be called "connector"

I guess we could drop the names for the nodes which are directly attached
to "chips", rather then being specific child nodes of these chips, but
the names being present there does not seem harmful and this might be
useful for debugging.

Regards,

Hans


> 
> [1]: https://lore.kernel.org/all/YtWzWdkFVMg0Hyvf@smile.fi.intel.com/
> 

