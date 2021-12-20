Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82373C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Dec 2021 13:30:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232924AbhLTNaa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Dec 2021 08:30:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24529 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232911AbhLTNa3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Dec 2021 08:30:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640007024;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Z2EKJ44NVclr39JIBnz6A51WStQAYZHbOe+OWM8qvbU=;
        b=dYUjBkDt1ssGJnahq26RaXEwkRHEGtnJRZTsKtup4BV+7R5yC2e2U9GIiRKcUyC4pJU8/N
        MZef1YeDl/K/KPEFRJeko8Tg8q4UvhalZpwAJbH6vTOBy6GWH1aNDqkO9t9+QJS4pA4hev
        6DpiSzcbZf10a9by1a/b9W86Y8D9V8I=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-2FZlRgN4Ni2wJ4roHbrQ4w-1; Mon, 20 Dec 2021 08:30:23 -0500
X-MC-Unique: 2FZlRgN4Ni2wJ4roHbrQ4w-1
Received: by mail-ed1-f72.google.com with SMTP id v19-20020a056402349300b003f7eba50675so7584100edc.12
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Dec 2021 05:30:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Z2EKJ44NVclr39JIBnz6A51WStQAYZHbOe+OWM8qvbU=;
        b=H0cScF8Y1MLrHk5liI7XGMFL81L7N0aiD6bJm9BCxZhR4VBv+37q+PJlh54xAfdqyo
         oe6avqeJO+kM4kouy7otJqB/N6sCY1GdcKsSS7HhrGcu8a7jUJxoL/5tMf5v6g0SkdaY
         IuJozZtRxFl2BQDHg1Zdy0E1KfhyeLuq6hGzkhmn81sYroiJdtKHQS5vwotLAxmAsC6x
         TjH6PR8Eh0OoE6NztcoxzjakT3DQepZDkOG1fXY6beEm7XzwO1p0ZOu600Adt6SNqYfq
         BuHHiD0qNDxJfshWG6wT9LPgwaZjX7JpWckW5IXZ1ENDeYZA8AHRxLETZpASLcLvVUQB
         vTdg==
X-Gm-Message-State: AOAM533C2hieMePXywSqZZYtsMlvddP38+m1Wm2wxtIZ1oRbkIs6V/EX
        ugtmTxqjoxgBHgSYpNu/N2VmUMUQ4C9T6ur1iwYSl6dIXZEIzxuCQJEt2nwRkKpu40EIfHmCaJM
        /YRkqwqzlOXGFjLFJ6lUURnLdL//FTQR3Rg==
X-Received: by 2002:a17:906:4788:: with SMTP id cw8mr3409642ejc.232.1640007022257;
        Mon, 20 Dec 2021 05:30:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqgMGNv50pAGIWQ9ZtUDpXvvkrP4KEhKRd2mYFwbqepWudxTftGB+6RrEd2fnS8IYSRqAsDA==
X-Received: by 2002:a17:906:4788:: with SMTP id cw8mr3409633ejc.232.1640007022076;
        Mon, 20 Dec 2021 05:30:22 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id di5sm5404969ejc.45.2021.12.20.05.30.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Dec 2021 05:30:21 -0800 (PST)
Message-ID: <e93265b9-7700-fa79-046d-70bb5ec990f1@redhat.com>
Date:   Mon, 20 Dec 2021 14:30:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v1 1/3] platform/x86: asus-wmi: Join string literals back
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Luke D. Jones" <luke@ljones.dev>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Corentin Chary <corentin.chary@gmail.com>,
        Mark Gross <markgross@kernel.org>
References: <20211210163009.19894-1-andriy.shevchenko@linux.intel.com>
 <YcCALCOv46Y0TogB@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YcCALCOv46Y0TogB@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/20/21 14:07, Andy Shevchenko wrote:
> On Fri, Dec 10, 2021 at 06:30:07PM +0200, Andy Shevchenko wrote:
>> For easy grepping on debug purposes join string literals back in
>> the messages.
>>
>> No functional change.
> 
> Hans, any comments on the series?

No comments, the series looks good to me. I plan to another round of
merging pdx86 patches tomorrow and then I plan to pick these up too.

Regards,

Hans

