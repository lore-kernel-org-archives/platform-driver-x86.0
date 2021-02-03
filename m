Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F198C433E0
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 10:57:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA11864F5C
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 10:57:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233948AbhBCK5M (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 05:57:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49772 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233825AbhBCK5L (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 05:57:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612349744;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yn83yLBRux6pkgk3YgU5bvgICX5LFq9qAb45UIy9d7o=;
        b=bRjzDo2gOABwQeFlqQhNYSUBecojbsvjpdEr64N3/awS5t4PZThclJ1pAr77WmpMBT/32S
        J1odMPWurZ0k/wvyNiJDvMLkDQy6rAKbgLSy3VaF8sDQlyv09jx63oqmToIDZoc+3z787x
        2PBYwShKTS25VrL7NRPbQdrrzT5/VOs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-M2T0iE-oNLGbXJfoHDWaMQ-1; Wed, 03 Feb 2021 05:55:43 -0500
X-MC-Unique: M2T0iE-oNLGbXJfoHDWaMQ-1
Received: by mail-ej1-f69.google.com with SMTP id x22so11706912ejb.10
        for <platform-driver-x86@vger.kernel.org>; Wed, 03 Feb 2021 02:55:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yn83yLBRux6pkgk3YgU5bvgICX5LFq9qAb45UIy9d7o=;
        b=RPY9qjZnSshG/6pdTVpo6J1LINfHHOeXhtvJBwSdb28+Ri/d3o0fEwEGBlhdq7QTYn
         ANRa/s+Od01KEbzsw7gnxczUHvCLMMxM3UeGBjx4Tc5TdAYLprwGyuBe/FrIyxl97+pd
         pKZCGEcBG2tI+gf8esEp3o+JKZOeUPsazLTkJnGGHjzvrW609PE4sv+B1x/Q5Jk7xu49
         Dq7NsOdlBEWUMPnUfCpjH/Eoz8HcViCfqQPz+/0uoGhLoPz4d036assiBHUuX87I8cAm
         EZ9ZvKhCG2xmtobmaryeqxV8m0WXuuL1ltVTqJdZTTEHxX0M7kDDx9+w2Ym7Y0x0sG1T
         PG9g==
X-Gm-Message-State: AOAM531EXOAMig9uHQqg0+wjyCDdJ+y9R4amwZzbtmedzbWNvdHDsjAB
        ONMPwZAq+hsxdZDhQHiMQRJRxgxMtN23EhRLKVSkMSt62Ejd1tFkEaqyYAenfvYs0NurzSKHoo1
        ipbFQLxLvid+IeA0ZcGI81f2oEOkuzLQxsR7Rohrw4Eq5dXkOXFMQE3QXg4q3P16IAY3v5hz+z8
        N/dbBOElnEEw==
X-Received: by 2002:a05:6402:3508:: with SMTP id b8mr2300217edd.341.1612349741669;
        Wed, 03 Feb 2021 02:55:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/b/iET4HaCLiALroMkasQIy4yQuLLd8KqVMDOs9Qli8/tTGLlTIkQVnmc3Uxm+wyBWO6xRg==
X-Received: by 2002:a05:6402:3508:: with SMTP id b8mr2300201edd.341.1612349741449;
        Wed, 03 Feb 2021 02:55:41 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id k6sm819697ejb.84.2021.02.03.02.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Feb 2021 02:55:40 -0800 (PST)
Subject: Re: [PATCH v1] platform/x86: Kconfig: Surround WMI drivers by 'if
 ACPI_WMI'
From:   Hans de Goede <hdegoede@redhat.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
References: <20210126140052.3451769-1-andriy.shevchenko@linux.intel.com>
 <3578abae-bf14-c3fe-7726-25358e8993ea@redhat.com>
Message-ID: <6b88be94-cc9c-e86c-82bc-f0d72e0c1c4f@redhat.com>
Date:   Wed, 3 Feb 2021 11:55:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <3578abae-bf14-c3fe-7726-25358e8993ea@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/3/21 11:48 AM, Hans de Goede wrote:
> Hi,
> 
> On 1/26/21 3:00 PM, Andy Shevchenko wrote:
>> Surround WMI drivers by 'if ACPI_WMI' instead of depending
>> each of them separately.
> 
> This does not cover all drivers which depend on ACPI_WMI; and in
> for-next there is a new UV_SYSFS Kconfig symbol in the middle of
> the block which you are surrounding with if ACPI_WMI .. endif
> and that new Kconfig symbol does not depend on ACPI_WMI.
> 
> Admittedly I should have payed more attention when the UV_SYSFS
> symbol was merged, but atm there is no real ordering in the
> Kconfig symbols.

Ok, so I just checked the Makefile and noticed that there is
an ordering there. But most people start with looking at Kconfig
when adding a new driver and the ordering is very much not clear
there. Also splitting the Intel bits in three groups does not
necessariyl help IMHO. E.g  CONFIG_INTEL_CHT_INT33FE is in the
generic Intel block but it is definitely PMIC related.

And the WMI drivers are grouped, except that some of them
(Asus, Dell, EEEPC at least) are not in the group...

So I still think just sorting the entire bups alphabetically
is better. We can then also add a comment at the top to please
keep things sorted alphabetically.

Regards,

Hans

