Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2DAEC43334
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Jun 2022 18:45:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbiFHSpI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Jun 2022 14:45:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiFHSpH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Jun 2022 14:45:07 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1914013E2B
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jun 2022 11:45:05 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id n10so43221768ejk.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jun 2022 11:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wyn7ChPM8gfceSmggjslNfqEzt1RoRkOlJqEBiMROD8=;
        b=YYT1kKmUb3bijdrg5VKbQUeEY0voNSYwWzv1QOKNjIVQy6NmE78p2rg3BUbCWd8mjg
         ageAPLTfSQKqXkQsfO6p3IhlA3wDcqMi9oFPJR6MPABDDfiexVvhN87VF1AkJA1RP83M
         ACOy93JDIAG/pacMwUIpbwKickTa+yA8gJu09/e+tcDG9Lw9/FW1c4v9kcvt+p+dIxzn
         xelVpgufqIyKDIgsw5FrirUBOrAAMRzCqJiFwtlQO44QGTFN+3zP07DPNIGy0ZoIPA3Z
         TwaVrmYR+1j3hVK0QSr2HeVmh0x7XMUgN67EHYwNbSZ9rb1l317tY0fjepEN5b2VaKfq
         33eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wyn7ChPM8gfceSmggjslNfqEzt1RoRkOlJqEBiMROD8=;
        b=W8eZfT1Y3rtuRhAt+vuhQTbjuUu2fkdb51DME+JAI1cFZZNjW3vEgezfGgBr+6bIWd
         Bad4Rt4RIzW96XrS8gWIeHyo4nfK3/h3nRsmutd8ZG4k+G1Zhb3PUsKrW36dehCPQgM6
         bL4P/VbwHLjqXSzwPKXX2WkDopNAZvu8UkPQF9rl+7CdVDwP515asSpyIiH2+yil7IaT
         IWp8AtvfvJ5EILZgHoZrXhIW9bZIUoJxLA9WtbZ30Ny1PmoLJ7I8nKvEMFAJRauFJwPT
         cBuDgOa8ldA517NXL1oslKL4m0PM9ieSQAVMSdlcjqnBCc18qlUkXVYxSsLbLMrfaXT+
         KW3g==
X-Gm-Message-State: AOAM531D0bldDmHCgudqQXdnsf0HKc05lmm2IPvMwBQQKEN7KWHdTOS1
        +JH0d8SpewFjBZl5nlPn1wFd9TT4dHZAZTqAGys=
X-Google-Smtp-Source: ABdhPJyzT/PHTQW3uSthFg15LezbLFMRRvMZsHckX28vXO1wXWrZRpvem58hLH1HZP3Z0D2Moes/kaX4x6KhXCMBE9Q=
X-Received: by 2002:a17:907:9721:b0:70c:65e7:2aa5 with SMTP id
 jg33-20020a170907972100b0070c65e72aa5mr29377812ejc.132.1654713903602; Wed, 08
 Jun 2022 11:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220608170220.5751-1-jorge.lopez2@hp.com> <20220608170220.5751-2-jorge.lopez2@hp.com>
In-Reply-To: <20220608170220.5751-2-jorge.lopez2@hp.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 8 Jun 2022 20:44:27 +0200
Message-ID: <CAHp75VdPOSHyHiwFWYR6_BuoUXca9wvYFkgy7wXBW305FGHigA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Resolve WMI query failures on some devices
To:     Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jun 8, 2022 at 7:20 PM Jorge Lopez <jorgealtxwork@gmail.com> wrote:
>
> WMI queries fail on some devices where the ACPI method HWMC
> unconditionally attempts to create Fields beyond the buffer
> if the buffer is too small, this breaks essential features
> such as power profiles:
>
>          CreateByteField (Arg1, 0x10, D008)
>          CreateByteField (Arg1, 0x11, D009)
>          CreateByteField (Arg1, 0x12, D010)
>          CreateDWordField (Arg1, 0x10, D032)
>          CreateField (Arg1, 0x80, 0x0400, D128)
>
> In cases where args->data had zero length, ACPI BIOS Error
> (bug): AE_AML_BUFFER_LIMIT, Field [D008] at bit
> offset/length 128/8 exceeds size of target Buffer (128 bits)
> (20211217/dsopcode-198) was obtained.
>
> ACPI BIOS Error (bug): AE_AML_BUFFER_LIMIT, Field [D009] at bit
> offset/length 136/8 exceeds size of target Buffer (136bits)
> (20211217/dsopcode-198)
>
> The original code created a buffer size of 128 bytes regardless if
> the WMI call required a smaller buffer or not.  This particular
> behavior occurs in older BIOS and reproduced in OMEN laptops.  Newer
> BIOS handles buffer sizes properly and meets the latest specification
> requirements.  This is the reason why testing with a dynamically
> allocated buffer did not uncover any failures with the test systems at
> hand.
>
> This patch was tested on several OMEN, Elite, and Zbooks.  It was
> confirmed the patch resolves HPWMI_FAN GET/SET calls in an OMEN
> Laptop 15-ek0xxx.  No problems were reported when testing on several Elite
> and Zbooks notebooks.

...

>         struct bios_args *args = NULL;
>         int mid, actual_outsize, ret;
>         size_t bios_args_size;
> +       int actual_insize;

Same comment as per v1.

Please, be careful and read all comments you have been given and react
to them either by explaining why it's not worth to address or with an
addressed changes.

-- 
With Best Regards,
Andy Shevchenko
