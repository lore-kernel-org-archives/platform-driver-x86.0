Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1049CC433E0
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Feb 2021 18:15:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DEEF064F94
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Feb 2021 18:15:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233838AbhBBSPD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Feb 2021 13:15:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51943 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233310AbhBBOGp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Feb 2021 09:06:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612274718;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LXlNwCxVBCnWTgIRZ67SF78i3D9tADdgI1TeYfcOFjI=;
        b=EhcXHDxBzyRiiU1U0u9HFjrlPdTu1K20D9gi+AHSrRcqXrnxU7KLVjdGoIVkpZ5zAi7/Zp
        vO5hquBzoSRQY8z1LZEEspSac1LUryImCKwZMGbQqxallc270PRvQ4kI8hb0Y8/eXKANO+
        rasSBXKrrPegT18D8nHR/adnATP3Xow=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-V-A5YBebOcalVNGAQbBOhA-1; Tue, 02 Feb 2021 09:05:17 -0500
X-MC-Unique: V-A5YBebOcalVNGAQbBOhA-1
Received: by mail-ej1-f72.google.com with SMTP id le12so10014518ejb.13
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Feb 2021 06:05:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LXlNwCxVBCnWTgIRZ67SF78i3D9tADdgI1TeYfcOFjI=;
        b=kze8tzkEUVlPUHP0VmZLTe5FdupY7lpywKkZ5vfa8wo9ZGAA0AsKx0YGmfbeDVgYBB
         enakQxJNlK+jni0LM92ASXn1h/wTSSjwxPCkoZe+dornEzHEcZDNoaxGKc12eG7oogf1
         Gokv7r27LNAjCmCUnCi3jO6b4KgWzAPzcmtUq4YBivPjyrwVSL/G8pQdn0YA9TxPYzk9
         mjtFcl3iL32NnM+xWSpG33R35zjK+8PgW3B+0Q1BV/utfBfHpoIrAy457lqr6G+G7p4X
         CQ71HX/Zni9o3/IaLKfax2Qsny9CERDsBFI+RenWoiNOJPOtVxO1LOjAz5cosdwiYo4/
         vG4A==
X-Gm-Message-State: AOAM533RsRZcCb8k4HSuzjrtltYy/Hikm+5PloiCJjFUHmqzPPCFujij
        0TYIllxk0yEj4F7jXCJcRoXsr2IgtatKPWcaR6yrP78QA419Nl/5a5E7kf3+Ii3HgL7VqjwWdzp
        dx3Pts2NiS8+EVGhLe3fxJAG9DhMfpHTnyA==
X-Received: by 2002:a17:906:780c:: with SMTP id u12mr22282918ejm.125.1612274715973;
        Tue, 02 Feb 2021 06:05:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQ/DyaGLIBeJhjBFt5cegtfQ7kGKj1VDMfIj8k1n8QaRu28f438c65QA8HfxsXqI6Pm6fGcw==
X-Received: by 2002:a17:906:780c:: with SMTP id u12mr22282903ejm.125.1612274715788;
        Tue, 02 Feb 2021 06:05:15 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id ec18sm9321262ejb.24.2021.02.02.06.05.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Feb 2021 06:05:15 -0800 (PST)
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: rectify length of title
 underline
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Nitin Joshi <njoshi1@lenovo.com>,
        platform-driver-x86@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210129040849.26740-1-lukas.bulwahn@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3b91a535-b818-09be-456b-c728838612dc@redhat.com>
Date:   Tue, 2 Feb 2021 15:05:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210129040849.26740-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/29/21 5:08 AM, Lukas Bulwahn wrote:
> Commit d7cbe2773aed ("platform/x86: thinkpad_acpi: set keyboard language")
> adds information on keyboard setting to the thinkpad documentation, but
> made the subsection title underline too short.
> 
> Hence, make htmldocs warns:
> 
>   Documentation/admin-guide/laptops/thinkpad-acpi.rst:1472: \
>     WARNING: Title underline too short.
> 
> Rectify length of subsection title underline.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
> applies cleanly on next-20210128
> 
> Nitin, please ack.
> 
> Hans, please pick this minor fixup for your platform/x86 -next tree.
> 
>  Documentation/admin-guide/laptops/thinkpad-acpi.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> index b1188f05a99a..0e4c5bb7fb70 100644
> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> @@ -1469,7 +1469,7 @@ Sysfs notes
>  
>  
>  Setting keyboard language
> --------------------
> +-------------------------
>  
>  sysfs: keyboard_lang
>  
> 

