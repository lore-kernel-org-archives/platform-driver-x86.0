Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E9DEC874C
	for <platform-driver-x86@archiver.kernel.org>; Thu,  7 Sep 2023 17:09:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240512AbjIGRJJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 7 Sep 2023 13:09:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240548AbjIGRJI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 Sep 2023 13:09:08 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C44E1199A
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 Sep 2023 10:08:39 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-41368601e92so7528241cf.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 Sep 2023 10:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694106455; x=1694711255; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZM5LCrIIZq6Cza2RJhNNmn9rDXfdqmiDRo4rHF5ssg=;
        b=Hfid/TrXFC4OxN/qW2VGRgs2nj7vq/cTXGp4xGHuOAH7rQR0H7YQqlGWp6sN8bBILz
         UxSF1DAQHN8bKZDJ9RO+pm2NelsDcD1lxqb/1bxE9f8yvKw2y3jIHH3OoQH60s3c9X7e
         XqeueyfdnfpxGYmXJkW7OKYInHRqbwLuHi9TTmXRH0zf9lrCf59xmjk96mNkyHICIIaX
         Sl65vmm9OX6Fv4saP0jff5DJstuq8+8cKTmhlJfhZOobbae08Sq2ErFIRA0pcL+ITB5H
         y3ox5CIvHcMc8cOXFea2TxZNQjoIslRsdqe8H3PiY9cvUfUKQ7Zj9tKPGn3immjFgaDJ
         fDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694106455; x=1694711255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZM5LCrIIZq6Cza2RJhNNmn9rDXfdqmiDRo4rHF5ssg=;
        b=Jy8WSSmEzZED7KI/pHtIddJr4I1PWO68/L9X3QRQEJUUVz1nDzj2ERZIJ9B5wuyzHh
         YjWIErnik/xXNFT8ubyr3GqVPNK8YPKlKclR0Rb2vVF+sDnoyQG5TiUrcvRtUtLvucvl
         l3e3C9UgdkV9o2UJXA7BTj9doSG2PQgJDFL1CiorfrwNWDNsl/WwXFds+cTv/ffsTLQN
         MjvaHDNNBNQigyV0ln9JoBA2bv39wuH+fnj34MOg1IPHQQyzemuxfTrB322up0XptrAf
         onNIYwURvoxY2xeJq9rRc132QjUFAZGaeKYcq8aWXjIyJCUtfISj4vfMsrGrxpHVQ3gO
         NN6g==
X-Gm-Message-State: AOJu0Yzn0NgZeJde1391h54+qQMgikgt79ZSvnNZdtH4OeDJ9HqVQ0FZ
        jI+ElKqY+t+PSYZAmBfZN4ZlkuECsKtt9JszDogXhCfjpSA77vmP3J4=
X-Google-Smtp-Source: AGHT+IHhj18itEgT7Zkm6inaHN3nE+QPEGLPicrIzqqx/vXBzW0adJyqRztqORI4Xy/4ylPWC4tCJ9Ht9cCQq18uOlw=
X-Received: by 2002:a25:aae3:0:b0:d1a:955f:304d with SMTP id
 t90-20020a25aae3000000b00d1a955f304dmr18305004ybi.64.1694070633444; Thu, 07
 Sep 2023 00:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-7-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-7-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:10:22 +0200
Message-ID: <CACRpkdadcw=E38o=cNWT4fQ_PK0UPifJZdVjuXTw0cjxPAEaKw@mail.gmail.com>
Subject: Re: [PATCH 06/21] gpiolib: provide gpiod_to_device()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dipen Patel <dipenp@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, timestamp@lists.linux.dev,
        linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_desc is opaque so provide a way for users to retrieve the
> underlying GPIO device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
