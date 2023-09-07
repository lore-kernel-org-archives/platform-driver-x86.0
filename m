Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53915EC8743
	for <platform-driver-x86@archiver.kernel.org>; Thu,  7 Sep 2023 16:44:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231381AbjIGQok (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 7 Sep 2023 12:44:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230433AbjIGQob (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 Sep 2023 12:44:31 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F16F26A6
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 Sep 2023 09:44:05 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-1d0d3d40124so859924fac.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 Sep 2023 09:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694104988; x=1694709788; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VX520/JAjo5YxFEs6vhZtWf0iQa736VrN0vgqzfoO4=;
        b=Qpbjm1tL0D8AGU2yretxfsyg+PE4QWrAIzx9cnSVTU7+5smDbCX6kHoJ4G7HCbKSqn
         9dCo9Kf5Fa9ISHL+WQOOumBD85ThwzO+zp2O8K5e4u6dDhQCWj5oHqfY4Dr56F8T9pRu
         CEWtWtlMUSjiPdUKDgDfGVI+FWvNPwIbnUVYLplZIdQj0E06tWMs5fcOGcijkUhzhcew
         cyw+EuQiOgWVO89IGiKOM6W4dpddoIU6ZEJCgh/PDMzOuxxip6jUFvQEBpHFINXWF+4n
         7fXjP5mSM4hzHDXOZ3W+F0lyk79Y8gY+8AgPRQ3/DYrXWbfKXgTgeYMMFZbVsNnFMy2l
         4jjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694104988; x=1694709788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9VX520/JAjo5YxFEs6vhZtWf0iQa736VrN0vgqzfoO4=;
        b=K1TchZycHSuvnKmz+tDTaFx9Xr/68AjodQMVG+gnx/zn9VBKVVxznrD8ygMwfWywhv
         PcZHNbHZWRu9BxQtv6xUult0mjOioLyrDlYi+ZFocWQHHc7YTU8E+1QzkdULRZoKmMzq
         RjU7MqpwNZ3ejNPbw/cYWNAlLYRLciYTLoWq74qophB73wbOD1UAEb9tbI952Sh+udBk
         a71m56g1jt7qhsXnfjNnSSxyJ6J35ydCWHUBAnkoNGhzb+bvp/dgSKRJbFEGQqPSM1aH
         aMbtkdVZucAMEJLwEtB94eSV9EFui2kq6Tx2Lf1mq9c6m67Xk8d0Kbr/NPtNFwYZW7Yu
         d2Tw==
X-Gm-Message-State: AOJu0YyW5HHzccNHqx6A5ha/Svujy0vuKe5gS034WKBRa8SenAPJ2tQn
        X8PS/XhCzHrzDTMA62310RdX65SRXEy5Yz3WblZ6av6/N2XlPF09
X-Google-Smtp-Source: AGHT+IGsG5hJJbLxB8MJ18cSL64AbAsKmU8HUkb1gvXKq17Y/8ZLDXSkKoAPtcsGb/CfUJGklHIiazXnZYlmi1tiRYs=
X-Received: by 2002:a25:d78a:0:b0:d78:47a:d76e with SMTP id
 o132-20020a25d78a000000b00d78047ad76emr19559951ybg.49.1694072224500; Thu, 07
 Sep 2023 00:37:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-17-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-17-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:36:53 +0200
Message-ID: <CACRpkdap-AFmVFG_gtYeGuR5JFLgHQ6i7w6HRwKP4+pu=nd66A@mail.gmail.com>
Subject: Re: [PATCH 16/21] gpio: of: correct notifier return codes
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
> According to the comments in linux/notifier.h, the code to return when a
> notifications is "not for us" is NOTIFY_DONE, not NOTIFY_OK.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

This should just be applied, right? If the notifiers already
went upstream (sorry for my ignorance) then it should be
a Fixes: even.

Yours,
Linus Walleij
