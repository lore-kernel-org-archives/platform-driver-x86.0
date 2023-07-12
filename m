Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7956CC0015E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 12 Jul 2023 15:50:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233813AbjGLPuF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 12 Jul 2023 11:50:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233814AbjGLPuD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Jul 2023 11:50:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EF17FB
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Jul 2023 08:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689176957;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bkK/lE9xVUoE2L0I2FE1bsKN4N40S5rUCyjcnz9lCPs=;
        b=JMxXOq08+wheDLN69i7pavsjZzgwWwuqN9cHY2SJZ84oHCzu7rf/dT6eAM7N5Dp2vAsP0b
        PxwLm4DG/l88fQodkFdccSZ/93DDUz6sU5/WMckzLlFq5pPXuE0stujVf1FNr61FJUDsDF
        l7z0KWHQ2fmW5QwF2BGwofDwOyQ4cWk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-DwhU4qJuN-ujhv-4n4uLBg-1; Wed, 12 Jul 2023 11:49:15 -0400
X-MC-Unique: DwhU4qJuN-ujhv-4n4uLBg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-31443e13f9dso4164261f8f.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Jul 2023 08:49:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689176954; x=1691768954;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bkK/lE9xVUoE2L0I2FE1bsKN4N40S5rUCyjcnz9lCPs=;
        b=aK/tELGNUImGE84OQ0qf/8fKMcSEANaJkrP3M3jmCPyCrHJc1eGoakcMSD+tTvUgir
         Z+NnKtC54fGVGvJ+3Uzr497X9ILPCwFF/+oVabvvZTOgy9a9tX7+yXKHznJJ7n0tfg8J
         mlN6DgAACc6XCH0Xv2K14QeQYVno4xhfsPBt9xuCjLyFhOb3UgxBmyPdCc2DAtroOKtv
         BSp4bl0Ryp9aWXh/d8Nt+YbKeoltlHKOibwejINW0qKx3AWrPhE7qSwTTPPKA8Nk/1y7
         NHzy+vOJazwokwCmVlgrCHoY845UQ2xB5nJHWKgdmewkkO2VdwQVWM2CJoQdsRkN9wYw
         IBSQ==
X-Gm-Message-State: ABy/qLZlOrdi431f3JXOXpkYoouO9hxFxTG8xyAp8G6jOH1geexQOGQF
        jdn4IHFVRoMQ5/CcgbKnKjvaNqn3BhyJHHQi1dB7t7kHoHKyPWzzk5JOhihRaPEmTfUlJVddsQS
        e0Czhk1tz5ZLYd4TitBHRqewJcMPFq3gQSw==
X-Received: by 2002:a5d:4603:0:b0:315:ad1a:5abc with SMTP id t3-20020a5d4603000000b00315ad1a5abcmr2505857wrq.5.1689176954067;
        Wed, 12 Jul 2023 08:49:14 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHfZBXzs0WOpOSK4uyREoe1iPHFVtvPrhE48RQBaY4V+m6OOpZMax9BclCH2P9YghADvfsQjA==
X-Received: by 2002:a5d:4603:0:b0:315:ad1a:5abc with SMTP id t3-20020a5d4603000000b00315ad1a5abcmr2505833wrq.5.1689176953749;
        Wed, 12 Jul 2023 08:49:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u24-20020a170906069800b009920f18a5f0sm2732141ejb.185.2023.07.12.08.49.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 08:49:13 -0700 (PDT)
Message-ID: <af2be377-ff04-3b00-62c7-a1ff53dddd16@redhat.com>
Date:   Wed, 12 Jul 2023 17:49:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/2] platform/x86: thinkpad_acpi: lockdep support
Content-Language: en-US, nl
To:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Gross <markgross@kernel.org>
Cc:     ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230704-thinkpad_acpi-lockdep-v1-0-60129548a738@weissschuh.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230704-thinkpad_acpi-lockdep-v1-0-60129548a738@weissschuh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/4/23 23:03, Thomas Weißschuh wrote:
> Validate locking requirements in thinkpad_acpi through lockdep.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

Thank you for your patch-series, I've applied the series to my
review-hans branch:
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
> Thomas Weißschuh (2):
>       platform/x86: thinkpad_acpi: take mutex for hotkey_mask_{set,get}
>       platform/x86: thinkpad_acpi: use lockdep annotations
> 
>  drivers/platform/x86/thinkpad_acpi.c | 45 ++++++++++++++++++++++--------------
>  1 file changed, 28 insertions(+), 17 deletions(-)
> ---
> base-commit: 03275585cabd0240944f19f33d7584a1b099a3a8
> change-id: 20230704-thinkpad_acpi-lockdep-7def9d7f91b5
> 
> Best regards,

