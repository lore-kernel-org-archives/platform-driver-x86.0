Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E251C43334
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Jun 2022 15:07:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242651AbiFTPHv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Jun 2022 11:07:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242047AbiFTPH1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Jun 2022 11:07:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D25AC192BA
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jun 2022 07:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655736383;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EuPLnv3TxBvx0dcIPzcNt4xFvE8FfTVPRBY+T/dhH5s=;
        b=Oq5HvsnvKj8j9hXtZBp2p1qjDVxHpMwKA+Oous6y2hwXjxrT9Uc8ifqRd9zyaGWGMo6Pgp
        2CF3sVLyPh+zkI7ZZ7nnSmlZ/2rZpf+x1jB1UK8t1w96Dlok6hGwSlf8BPJRmOOTZUlqHp
        +KjKykqEQAYh5XOTXd4TiL4d7AKaLFA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-p_OPSAd7OECNJAiEDRy5xQ-1; Mon, 20 Jun 2022 10:46:21 -0400
X-MC-Unique: p_OPSAd7OECNJAiEDRy5xQ-1
Received: by mail-ed1-f71.google.com with SMTP id b7-20020a056402350700b004355e4d1e36so6988270edd.10
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jun 2022 07:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EuPLnv3TxBvx0dcIPzcNt4xFvE8FfTVPRBY+T/dhH5s=;
        b=BDFvzQ5trRhGMj+RlvqoMMykxH5A/f/kXvmr+zCMN7HrGColDxr075jn1Id2U1G0hl
         xFpDcI86Q3Zr37UdJFuUtVLHDkTHM6Rky/Nq1wF5WdMm2H7U4VL99otw+wgqhD8uhRP8
         LEtASUsikSlzQc+mYYosssJiQrIxxPciwd+TcWmpgGF5htZ4DwfL8JwrlYOzG2OUxlL6
         iL8H3doQ6NUiQ/MRgJ+110eJd1GUM+WKmnvSjWBW9Fm9ynXbzBOhR+bxxNmrO0rg+RF/
         /i30UWPDkmdHRyYSBfB+SydwRdInvcGMPBDsxMgIiwjOYGn4Jv7TszpLaQ2ilL0J+b+J
         /FmA==
X-Gm-Message-State: AJIora8hrI9vgXMW4ayo/JqqX/iON50V59Jn+7yFssik3e1kkMWtih9o
        HXtCHwgBme6PXTTwsBsyXcFMWj7FJbfDQh32TSF/rjLttdm8ULmORGrMs8nKCmRK/4RDd9q+POY
        W9kFCVQOXUXwjr8c907gUXIFE5exOTMGewA==
X-Received: by 2002:a17:906:ae57:b0:70b:e847:271b with SMTP id lf23-20020a170906ae5700b0070be847271bmr21402920ejb.700.1655736380216;
        Mon, 20 Jun 2022 07:46:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u3rgZmBHzCKhL8u2XwQpvwzNmd6nYRBVjcpvvPg26UxtD6hk/fbuPOIl22BfWkSOQTzVf/Rg==
X-Received: by 2002:a17:906:ae57:b0:70b:e847:271b with SMTP id lf23-20020a170906ae5700b0070be847271bmr21402896ejb.700.1655736379913;
        Mon, 20 Jun 2022 07:46:19 -0700 (PDT)
Received: from [10.0.0.147] (D57D5A4B.static.ziggozakelijk.nl. [213.125.90.75])
        by smtp.gmail.com with ESMTPSA id h18-20020a056402281200b0043173ab6728sm11039491ede.7.2022.06.20.07.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 07:46:19 -0700 (PDT)
Message-ID: <a6439243-9d4c-0089-62de-50a9d992dcaa@redhat.com>
Date:   Mon, 20 Jun 2022 16:46:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/3] platform/x86: Kconfig: Remove unnecessary "depends on
 X86"
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20220620093637.9429-1-hdegoede@redhat.com>
 <20220620093637.9429-2-hdegoede@redhat.com>
 <CAHp75Vf26xfP9j386HEoxeJmu1Co-KXkU6Dk+9q8rEu_hr4fFA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vf26xfP9j386HEoxeJmu1Co-KXkU6Dk+9q8rEu_hr4fFA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/20/22 12:21, Andy Shevchenko wrote:
> On Mon, Jun 20, 2022 at 11:36 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The sourcing of drivers/platform/x86/Kconfig is protected by
>> a "if X86", so the "depends on X86" for X86_PLATFORM_DEVICES
>> is unnecessary, remove it.
> 
> Looking into the upper Kconfig, I would rather go and drop dependency
> there to be consistent with the rest of drivers/platform/ cases.

I did consider doing things this way myself too :)

I'll go and prep a v2 of the series with this changed.

> Perhaps it needs to be done separately for MIPS.

That would make everything consistent, but I'll leave doing this
to someone else.

Regards,

Hans

