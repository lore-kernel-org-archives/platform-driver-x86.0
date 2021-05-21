Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D290CC4707D
	for <platform-driver-x86@archiver.kernel.org>; Fri, 21 May 2021 16:56:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B21F7613D9
	for <platform-driver-x86@archiver.kernel.org>; Fri, 21 May 2021 16:56:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236408AbhEUQ6V (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 21 May 2021 12:58:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31829 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235403AbhEUQ6U (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 21 May 2021 12:58:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621616217;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NBEhSmItW1IYNtD9GY2PDr4mhgfEoe+usv31WhGIy1Q=;
        b=UuKV2doJ/qlYgEgHRXDBJUmmLfqspo+dyhuxRmoOzVjPXpieFoBfBFk6ZwAfJpUdvMvIji
        YRlgO7EFPtmaR8uZWqY5YCFEc08tQJw4lJ2DLVuhiRXSynwKXi2f4y3o8WsXVzAqam5rAy
        /rBeEpqORZm2Mgx6FG63vgZ+0ODFA6Y=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-YqA-3hH1MaKszCbLjQBjaw-1; Fri, 21 May 2021 12:56:54 -0400
X-MC-Unique: YqA-3hH1MaKszCbLjQBjaw-1
Received: by mail-ej1-f72.google.com with SMTP id dt6-20020a170906b786b02903dc2a6918d6so1499873ejb.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 21 May 2021 09:56:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NBEhSmItW1IYNtD9GY2PDr4mhgfEoe+usv31WhGIy1Q=;
        b=D/m+ito6FHHPIR157tzxeZRO3xFbJAkxvJu7PIts7EXO8yKW8fyNF/Ztd+v/HABdzw
         Df+iz0b5/+89Wb/g/Rr5BUJ7iWAnpAah7Gc8t8YMzVHcQ7rNsWMvTwcFctkCb40EIG9T
         +V7XaGkzKQ1fhmVRzyV6sgt6h433V42F0+24poUM8TT+JcYTIARQ9EEcCxeuwJNW0hBK
         QuR7X/OXQdaGsqCE2W5xZTxQgLA1r4+zw5bjYoXCnMgOduhQc2a0EhxTV03/f71cmbpj
         W9aX4YdoKTCPOiii7veIOI6i+V43GmPEPvMpt0qsmcdKKVe3pO0aUWAsZ08YTgeq8zsZ
         difA==
X-Gm-Message-State: AOAM533est4oZmi5O3kpcpZt45iyHkBnJGe/mVS64EWU3c577xfhL66Q
        M9ID0QQgnhSfvdsH0OBwtId8q4nF5LBb4L6tna4679lwJRmr1MUlEUb5UqK37lcHkFGby48du3Q
        gCLQaXvCNRgXzuROC/4jJnunwfzqA6Jfobw==
X-Received: by 2002:a17:906:d7ac:: with SMTP id pk12mr11553235ejb.143.1621616213246;
        Fri, 21 May 2021 09:56:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCWCDVomytJPfa86MwluYPw4QKWppPo0ioZ/nqTfx41wEQP0/qPljMMPxW+0CBwRb6um6ctQ==
X-Received: by 2002:a17:906:d7ac:: with SMTP id pk12mr11553223ejb.143.1621616213110;
        Fri, 21 May 2021 09:56:53 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id d25sm3878425ejd.59.2021.05.21.09.56.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 09:56:52 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] platform/x86: Add PWM platform data for Merrifield
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-pwm@vger.kernel.org, Mark Gross <mgross@linux.intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>
References: <20210521135516.64727-1-andriy.shevchenko@linux.intel.com>
 <CAHp75VcS5UBeJ9eq3dv_8EHwfjdBSBbC4kdmuKyrxCPj+gQ5hA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e0e58e79-318c-8251-0d01-9abd754dde80@redhat.com>
Date:   Fri, 21 May 2021 18:56:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VcS5UBeJ9eq3dv_8EHwfjdBSBbC4kdmuKyrxCPj+gQ5hA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/21/21 4:02 PM, Andy Shevchenko wrote:
> On Fri, May 21, 2021 at 4:55 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>>
>> PWM is not functional since it requires pins to be muxed and configured
>> properly. Add pinctrl mapping to platform initialization code. The pins will
>> be configured properly whenever PWM driver is probed successfully.
> 
> Sorry guys for the noise, this has been mistakenly out here.
> Nothing really for upstream.

Ok, I've dropped this from my patch-queue now.

Regards,

Hans

