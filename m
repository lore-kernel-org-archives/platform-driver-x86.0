Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4832C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri, 11 Feb 2022 09:51:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244482AbiBKJvg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 11 Feb 2022 04:51:36 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231190AbiBKJvg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 11 Feb 2022 04:51:36 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D765DE51
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Feb 2022 01:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644573094;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fFtXuWvABMk448Edughf1SS5VtMOoH+6OjFUKye63ho=;
        b=cdeW9Skyr1pu38mAKQmnqd6IIwyH/iSksKQwp2Wb3zOmShWQa6YLqKa7woLVfebkbOP3vJ
        Y9e4hga9dJVI921mryA1Bk80vSPEsdXWFCuHoRweUwOItqHN5Ols1Ns39p3afQP+LrCvUP
        9eNBpmCBP8N75JACNRSKgI7aO6S0IyQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-167-VSNhOOWZMXqr-zVfVBdmqQ-1; Fri, 11 Feb 2022 04:51:33 -0500
X-MC-Unique: VSNhOOWZMXqr-zVfVBdmqQ-1
Received: by mail-ed1-f70.google.com with SMTP id m4-20020a50cc04000000b0040edb9d147cso5036584edi.15
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Feb 2022 01:51:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fFtXuWvABMk448Edughf1SS5VtMOoH+6OjFUKye63ho=;
        b=uc9TTZbn1TrnFmLI26QVcQYhhMsD4aeM/HrZpQ+D1gaJUqGb2Yzdn21/1ylhwECwS5
         UrjfcTYDy35bv7rfBt1rb/SKeTVYWsuvdiqfMDkOCA/gtV+tQEi+ojKoBkHgyscgGzTH
         ZR9R1WFUbT/jYT7xHjx5ch9d0Uor3ywGVwp2N45Tv3+bSXl72m82W60NBfBdnKYOFJMn
         7IRINqUkbcF/oIt3tKQnubojc5iiCbMjIu2zKuQNlRupRXHKnU8N/9/6jDs3QYcDIgnL
         t2mWCitNI33wJ/Vjv8Il42fi928u+ZtfHdAQ1gNNaKLTjU9+RleTqlil+6QPkqll1gfk
         Ki1Q==
X-Gm-Message-State: AOAM533dV8YhpqbnM5lW8EjumO+iaOBp3Ab3cFHm/76WlHBeS/Jetor/
        wXoGJrWW+DiLagYyFu+o0JC4/YOuQXAQdZPmBBkY8bQ1cS85yejut+6RL59eIJsWT0i8waBQa2w
        bOFiEktcUBktHlGtSda0q44lK01MbFfqrXQ==
X-Received: by 2002:aa7:df8c:: with SMTP id b12mr976149edy.330.1644573092484;
        Fri, 11 Feb 2022 01:51:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywl842/GOuygQsuM2RcCPMC3A3VHAvXKmwI03IWFrHDqy+ErVDm+udIVPvs5x8gUwxvXFdag==
X-Received: by 2002:aa7:df8c:: with SMTP id b12mr976140edy.330.1644573092315;
        Fri, 11 Feb 2022 01:51:32 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id os9sm4636173ejb.57.2022.02.11.01.51.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Feb 2022 01:51:31 -0800 (PST)
Message-ID: <149e39fb-145d-4c5b-483c-bac6c98060db@redhat.com>
Date:   Fri, 11 Feb 2022 10:51:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 4/6] platform/x86: x86-android-tablets: Add lid-switch
 gpio-keys pdev to Asus ME176C + TF103C
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20220205191356.225505-1-hdegoede@redhat.com>
 <20220205191356.225505-4-hdegoede@redhat.com>
 <CAHp75VcBNentfYMymyCnCav-NGK+DrDzTG3Mf973ERXpyvT2uQ@mail.gmail.com>
 <64953b75-3dfe-bc0a-6f3b-58b2329c5a1a@redhat.com>
 <CAHp75VfZ1JEawAiaRv0ZfLrA_bg0=miW=wXJmZ2v30fFj6xKJg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VfZ1JEawAiaRv0ZfLrA_bg0=miW=wXJmZ2v30fFj6xKJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/6/22 20:50, Andy Shevchenko wrote:
> On Sun, Feb 6, 2022 at 9:22 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 2/5/22 21:40, Andy Shevchenko wrote:
>>> On Sat, Feb 5, 2022 at 9:14 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
> ...
> 
>>> USB ID change is not described here.
>>
>> There is no USB-ID change,
> 
> ...
> 
>> Since adding lid_switch support involves adding a second pdev,
>> the contents of the generic int3496_pdevs now gets duplicated into
>> the new pdevs array which adds the lid gpio_keys pdev:
> 
> I see now.  Perhaps a comment about it in the commit message?

Ok, I've added a comment to the commit msg while merging this
series into my review-hans branch.

Regards,

Hans

