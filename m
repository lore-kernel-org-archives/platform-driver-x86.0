Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5556CC433E6
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Feb 2021 14:43:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 258F264DF5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Feb 2021 14:43:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232959AbhBBOnZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Feb 2021 09:43:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53635 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232349AbhBBOlY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Feb 2021 09:41:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612276798;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XwLM1qr8Fq0WkUl5xjaI4hjLYikgWJiraoZrsEvsnpU=;
        b=TXYODxKcuzA1DB+MOm1EegVGi2sRi9OChO+kpjhVBonJfDb28Z4gzPb5zvBO8MZk7VVXn7
        19MpruHOXTLWmeglaK+kjix9tGsXvKe/8BcJzNR1ivOo0+GA+eAtRSdr1r9aQYBYPBw0rZ
        re5kxIzEdrlvR5ToznYhGn3B01aBTUk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-MFfnD_5NOM6h-lhTYdGVlw-1; Tue, 02 Feb 2021 09:39:56 -0500
X-MC-Unique: MFfnD_5NOM6h-lhTYdGVlw-1
Received: by mail-ej1-f70.google.com with SMTP id h4so10134717eja.12
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Feb 2021 06:39:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XwLM1qr8Fq0WkUl5xjaI4hjLYikgWJiraoZrsEvsnpU=;
        b=P6trDVKG/PbVL14bK8PvoJ/aZzpDrVB/r40uInYhpup5T1XZQoDcx2S7zwaZq7pwHB
         zqaCLx6JkoK+3a0zMtDpgYJmzorbs0HV6UZYHQycW/Hyk7ELMpiuodiQo+dD9pJVM5t/
         nrz4FghbGwRTc87PcR1ymKhwW49175P/Hrjk5zRjWZLSiRec87k5oSGoxIy0uzurwtYK
         osM4lNxOrD4EXV6HClDJNOGwYuNrsQjPz0yvWNAeLEFvzVVq0cc9aviMfxDhIlRC+TIp
         2lWmfZUNLG4BGoOr/7UPP1Mo3hQrkL6fxIWTRDY3fS/R2W5QDejWuPNGx1b66WDXwmNN
         7FTQ==
X-Gm-Message-State: AOAM5326VxoAYUq84SxmVZeiJHoOIRf+JSSYtkWrFKe5uXcXi9SZIR96
        ZAJTLvQKDhoqxfyH/e+Q0sgJJb/14KnaH+o4b9iIAvAJAIrZ9oRieFXfIQfwfTC7n2PhyYwyhqI
        BcYsthqWP1JZZONdzD0E9zm0t02vK55kW6wTqh/6QyLRMSmSmOSqj/jgPiKugNgU61jqD9S/KoX
        7sBPNXArdTXw==
X-Received: by 2002:a50:8466:: with SMTP id 93mr12132159edp.55.1612276795331;
        Tue, 02 Feb 2021 06:39:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwATqBa2bC9fPDIzxTOmTh2LWCs80TuPFub0bxqt9MpNy54OydCvXDdUc7w1r93lUAiocEdVw==
X-Received: by 2002:a50:8466:: with SMTP id 93mr12131965edp.55.1612276793017;
        Tue, 02 Feb 2021 06:39:53 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id i4sm9441404eje.90.2021.02.02.06.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Feb 2021 06:39:52 -0800 (PST)
Subject: Re: [PATCH v2 2/2] ACPI: platform-profile: Introduce object pointers
 to callbacks
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Mark Pearson <mpearson@lenovo.com>,
        Bastien Nocera <hadess@hadess.net>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20210125115957.3292-1-hdegoede@redhat.com>
 <20210125115957.3292-3-hdegoede@redhat.com>
 <CAJZ5v0iVGpUxUVMAO4R9bz8dogFRoYun-9-4G_Mgzq0_WP305Q@mail.gmail.com>
 <CAJZ5v0iCWXmtAApSvVwmWT_p8QXoK9oivTFkxynf3LPEjCE7+A@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <054e36fc-edeb-043c-7842-cfb29bf6f98d@redhat.com>
Date:   Tue, 2 Feb 2021 15:39:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0iCWXmtAApSvVwmWT_p8QXoK9oivTFkxynf3LPEjCE7+A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/1/21 2:55 PM, Rafael J. Wysocki wrote:
> On Wed, Jan 27, 2021 at 6:47 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
>>
>> On Tue, Jan 26, 2021 at 6:58 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>>
>>> From: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>>
>>> Add an object pointer to handler callbacks to avoid the need for
>>> drivers to have a global variable to get to their driver-data
>>> struct.
>>>
>>> Link: https://lore.kernel.org/linux-acpi/6a29f338-d9e4-150c-81dd-2ffb54f5bc35@redhat.com/
>>> Link: https://lore.kernel.org/r/20210114073429.176462-3-jiaxun.yang@flygoat.com
>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>> Suggested-by: Hans de Goede <hdegoede@redhat.com>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>
>> Applied on top of the previous platform-profile patches, thanks!
> 
> And the entire acpi-platform-profile material is now available for you
> to pull in the git branch at:
> 
>  git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
>  acpi-platform
> 
> which is not going to be rebased going forward.

Thank you. I've merged this into pdx86/for-next now.

Regards,

Hans

