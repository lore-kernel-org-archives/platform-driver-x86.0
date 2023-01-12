Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E59A8C54EBE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Jan 2023 19:00:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233009AbjALTAc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Jan 2023 14:00:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240014AbjALS76 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Jan 2023 13:59:58 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C6541DF1C
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 10:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673548603;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=akqXSxbWkkMs6QaYC0/F/LE3FUEcneDw1DnPUsgrw54=;
        b=dtFgguB546xLcfoIUToUTIJ16PQR2+6NZ2OrgiMqLiD8RZET6XiwBUX5r1x4InV0A3ZbrS
        hx375GM/pESk2r2yYj4tLLY7v/daKdmRxMPvyMg9fhA9D4/SDYAXM6KNTT8Z4Si7t9x+kq
        DCKnutVhZJo97nlXNLAml4LcWvT4XmQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-194-FMTl6qqFPnC5Vt6W5NQM0A-1; Thu, 12 Jan 2023 13:36:42 -0500
X-MC-Unique: FMTl6qqFPnC5Vt6W5NQM0A-1
Received: by mail-ej1-f71.google.com with SMTP id oz11-20020a1709077d8b00b007c0dd8018b6so13334936ejc.17
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 10:36:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=akqXSxbWkkMs6QaYC0/F/LE3FUEcneDw1DnPUsgrw54=;
        b=4pQRv4wnr58mmzXJ8VpMy3Sx85QG4mw2sp+cojEr8JgAr4iz9VzAH+j04i4dH3DrnU
         N973autqKeIDrkC5wRxFoNwfgjlyjV3BZETaPYHLpu3gwqXG2Tr+n4IUGelL7cH50QUK
         tb4Vh5TzPI6/095WVAaus63R+dQEcJa5ma2XCjrZzjZJ3ajIBk0bE7aYPtk4GTebW4bD
         q+NSv7vg5LDenKRyO98gWQT86RSdZV00HLgVQCCvHbH2a4d3q1oPG0Uug5P2sGXG362P
         HPv3YfxwhINK+mQKxvuLLZHvI5Cu0cRlwhuz5ehpZCHLyKuuN1ZtofXU1WED5+xeYG4p
         yWsg==
X-Gm-Message-State: AFqh2krhDgIF8V72rlH2bkXZ3sdGaFRNSJsnUhEcozDLU/lmmQAOleQy
        jNa94IKujmTF35YZpuCDDw9Dylg31cy2waGdbxXdnNV22qlBh+71nOiQR2TwubQV3tAet8zLkZZ
        ElhRhzu7k1wmcLYiKjdTIyU/R3jPwCLW5Sg==
X-Received: by 2002:aa7:c951:0:b0:499:d374:e18b with SMTP id h17-20020aa7c951000000b00499d374e18bmr7812760edt.35.1673548601274;
        Thu, 12 Jan 2023 10:36:41 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuJ5Pr+YxfuIISPqeceagzX2eNYIOGjl0+m2T9ikfOu4DD4NOKmvc5O35jXaqAGKUkMmxuICg==
X-Received: by 2002:aa7:c951:0:b0:499:d374:e18b with SMTP id h17-20020aa7c951000000b00499d374e18bmr7812746edt.35.1673548601086;
        Thu, 12 Jan 2023 10:36:41 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id og5-20020a1709071dc500b0084d420503a3sm5946308ejc.178.2023.01.12.10.36.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 10:36:40 -0800 (PST)
Message-ID: <cc644ad3-1b12-5ecb-c8fa-8f7ab5d5b055@redhat.com>
Date:   Thu, 12 Jan 2023 19:36:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/3] platform/x86: asus-wmi: Fix issues on fanless device
Content-Language: en-US, nl
To:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
        Corentin Chary <corentin.chary@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        "Luke D. Jones" <luke@ljones.dev>
Cc:     acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221221-asus-fan-v1-0-e07f3949725b@weissschuh.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221221-asus-fan-v1-0-e07f3949725b@weissschuh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/21/22 18:59, Thomas Weißschuh wrote:
> This series fixes issues experienced on a fanless ASUS VivoBook E410MA.
> 
> To: Corentin Chary <corentin.chary@gmail.com>
> To: Hans de Goede <hdegoede@redhat.com>
> To: Mark Gross <markgross@kernel.org>
> To: "Luke D. Jones" <luke@ljones.dev>
> Cc: acpi4asus-user@lists.sourceforge.net
> Cc: platform-driver-x86@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

Thank you for your patch series, I've applied this series
to my fixes branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans





> 
> ---
> Thomas Weißschuh (3):
>       platform/x86: asus-wmi: Add quirk wmi_ignore_fan
>       platform/x86: asus-wmi: Ignore fan on E410MA
>       platform/x86: asus-wmi: Don't load fan curves without fan
> 
>  drivers/platform/x86/asus-nb-wmi.c | 13 +++++++++++++
>  drivers/platform/x86/asus-wmi.c    |  7 ++++++-
>  drivers/platform/x86/asus-wmi.h    |  1 +
>  3 files changed, 20 insertions(+), 1 deletion(-)
> ---
> base-commit: b6bb9676f2165d518b35ba3bea5f1fcfc0d969bf
> change-id: 20221221-asus-fan-9aeac7d59c6c
> 
> Best regards,

