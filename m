Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C99EC8747
	for <platform-driver-x86@archiver.kernel.org>; Thu,  7 Sep 2023 16:43:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236021AbjIGQnS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 7 Sep 2023 12:43:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244106AbjIGQnH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 Sep 2023 12:43:07 -0400
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D8544213
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 Sep 2023 09:42:11 -0700 (PDT)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6bd0a0a6766so860614a34.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 Sep 2023 09:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694104810; x=1694709610; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UdWsNUufxYU54d2v+3Wxi5MrfQGJIJLOBq5vhtohyVg=;
        b=VfL20zBvTO6x0aMhIT10ySh/nVP3H4whFAwzWRRavsRhGrtA2WbqHIOWK8BilV66Zt
         eoRuAdmxdHvSJUe9CADOZSB5oHhjShvO+pywrishEjR0hfo82B1tU4O9QCLgjbQeBR48
         huU5CHehjlXBD/JI7FSwKENQ1YkPEHY8tcqgXyuPHaUxrwblzqyLgMwXAy8bhCpJ5PUg
         6++brap1cLlmyuCrsmNHmwkCZA8GBkZbqW2i5ANsFCGxGdzQNZXIJdrVWFCt70T984br
         AXwFibTRfCbfMDbj4LmTByljaSn+f02G/BYWLfePTo1UWksdraGTR/rds2ZPFTK3Zf+4
         e1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694104810; x=1694709610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UdWsNUufxYU54d2v+3Wxi5MrfQGJIJLOBq5vhtohyVg=;
        b=W4b+4OGL+M1LK3Rf7PSQQ20A5u9nHYhPEjEY+SZALgphb/ZvOO5kUPbaHHcarDPJJq
         iQst8Mr/pNBxE9CcfTfttIsseq/pnqF0mdP8cv/pDj7wVUafGxegH/p6IpCP4TQ65R/U
         VlSnrCFoBEDAq6olqrd1jVpf7HFlHPqJxesZ/ygvmjKdMFKqo82QeGfZVCqtX5RzaSBx
         Yax9a6FMvMS+CHf0WvwnfP1uJSZfLixOBV1l1+AN0kNi12I3KBUR4HoC6Y+Z1zwjOhxB
         WPmQWM1H8OSaJQU51dqLiWYLwgDqKqyfQ3hluQWtsUid6J7YybEAGq7OaSWsYK+Q8uPa
         z16Q==
X-Gm-Message-State: AOJu0YwcGVXh++cru3GgS+OA7FAyzvt3A1iMaT6ggE5TtC8D+Av6SKp/
        DmQ0QK18wx2B/j2buTklldX0VgGt9eUtRMlVkPkWpJRjNZ2vwejqmWg=
X-Google-Smtp-Source: AGHT+IGMY/aPJYeBu1Pp0IzmGxqtgA0g7tRf3VGot5Pdq6hh1Y77T4EpHI+nXikBBcDxY/Os4mlIAHH2bnKyBxN7wMo=
X-Received: by 2002:a25:258f:0:b0:d7a:edf3:f0a9 with SMTP id
 l137-20020a25258f000000b00d7aedf3f0a9mr17868648ybl.50.1694070333187; Thu, 07
 Sep 2023 00:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-3-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-3-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:05:22 +0200
Message-ID: <CACRpkdZEphqvwpid7QzXuYX79q2==58eKT7wg9Cmr8m1FLOuRA@mail.gmail.com>
Subject: Re: [PATCH 02/21] gpiolib: provide gpio_device_find()
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
> gpiochip_find() is wrong and its kernel doc is misleading as the
> function doesn't return a reference to the gpio_chip but just a raw
> pointer. The chip itself is not guaranteed to stay alive, in fact it can
> be deleted at any point. Also: other than GPIO drivers themselves,
> nobody else has any business accessing gpio_chip structs.
>
> Provide a new gpio_device_find() function that returns a real reference
> to the opaque gpio_device structure that is guaranteed to stay alive for
> as long as there are active users of it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
