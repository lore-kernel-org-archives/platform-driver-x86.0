Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E1E3C83012
	for <platform-driver-x86@archiver.kernel.org>; Wed,  2 Dec 2020 12:15:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5AB8522203
	for <platform-driver-x86@archiver.kernel.org>; Wed,  2 Dec 2020 12:15:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388831AbgLBMOw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 2 Dec 2020 07:14:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37123 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388805AbgLBMOv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 2 Dec 2020 07:14:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606911204;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=s8wBO6q+/ydbMfM2l/hjFLTpTgfds0h6kmbDEEyONUA=;
        b=RiDGFa7UTS19XyQo8awvmGTPEu025vZtbBuXnUon1Fqil8bltpWXjzL3VTidJPUOKsGiNX
        NnCa9qsC5r0Nu+pdou6T/yR5NTonQYL9XHwhPqKHah2OVBZ4djIE5+tDeQ67/YdDEwgyBR
        NQDH6aWczp4XCGrBjna001AFesDPaFU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-ozNrKZa2Mrq3jIXhUrAYPw-1; Wed, 02 Dec 2020 07:13:19 -0500
X-MC-Unique: ozNrKZa2Mrq3jIXhUrAYPw-1
Received: by mail-ej1-f71.google.com with SMTP id z10so2950046eje.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 02 Dec 2020 04:13:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=s8wBO6q+/ydbMfM2l/hjFLTpTgfds0h6kmbDEEyONUA=;
        b=F/WJNIRGgbC8xTXqM/m37luWX2a97wAhGP+IRj0TF4RMxtuTendw2E4jv1nRBHhASN
         7Pw6nL3aCA2AqP70Di7HpHwnH4r5RqM0XyVPyphJFqSvo/s369GpffPLW5qZkFPHfIQF
         sHYjdUH3FZVr3bXQ1FAckHz8pbRBAuFs/1JbXAl3h9KHWjeNvE2fGQlU5wOrkmhZZ0MK
         1Dxj6+6kx21iPop9X07ayvKEUtgKcl94ukW3EZsAXEknmRJMkD2ExvhNHnsnDXZvxMGR
         oRBXde5UNNrEa0+AO/v6j/T/nJXCI/oCVaOTZ9qYgu5Z0EjApwXZ0652+nOHyhoAjZ2i
         tHJQ==
X-Gm-Message-State: AOAM533ZwaacaPOK4tICiC9AD6HIWHK/M0SAEMW5wh8IZFLEvii01GZ/
        R2WkmCr+I6Jxu9zOQPyk0BiEH+viYNhLbfYkTnO7CaaSNmi+aKdwSvepAuB1/DAMdu1QJQaKOrX
        PyVpTTQqTG29tJ+RmWN9XJY53trm90Pi6nA==
X-Received: by 2002:a17:907:94c6:: with SMTP id dn6mr2015606ejc.13.1606911198334;
        Wed, 02 Dec 2020 04:13:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjcf2/jAVd/t5xTW/xEbxoPnYk9GfgCvwh3DT7GD0BwB22NZEO16T4jtdxLCGGhpZ9PtQtGQ==
X-Received: by 2002:a17:907:94c6:: with SMTP id dn6mr2015594ejc.13.1606911198176;
        Wed, 02 Dec 2020 04:13:18 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id u23sm1053845ejy.87.2020.12.02.04.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Dec 2020 04:13:17 -0800 (PST)
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: remove trailing semicolon in
 macro definition
To:     trix@redhat.com, ibm-acpi@hmh.eng.br, mgross@linux.intel.com
Cc:     ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201127181024.2771890-1-trix@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d83d3fe4-5999-b8d4-2b52-961313662e46@redhat.com>
Date:   Wed, 2 Dec 2020 13:13:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201127181024.2771890-1-trix@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/27/20 7:10 PM, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> The macro use will already have a semicolon.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

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
>  drivers/platform/x86/thinkpad_acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 36d9594bca7f..5bbb378d1a37 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -1025,7 +1025,7 @@ static struct attribute_set *create_attr_set(unsigned int max_members,
>  }
>  
>  #define destroy_attr_set(_set) \
> -	kfree(_set);
> +	kfree(_set)
>  
>  /* not multi-threaded safe, use it in a single thread per set */
>  static int add_to_attr_set(struct attribute_set *s, struct attribute *attr)
> 

