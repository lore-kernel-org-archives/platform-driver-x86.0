Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9687CEC873E
	for <platform-driver-x86@archiver.kernel.org>; Thu,  7 Sep 2023 16:58:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245069AbjIGQ6Z (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 7 Sep 2023 12:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245058AbjIGQ6V (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 Sep 2023 12:58:21 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D9E41BD9
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 Sep 2023 09:57:53 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1bee82fad0fso10018215ad.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 Sep 2023 09:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694105816; x=1694710616; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Rz9GiS8mTfnAVkN8QSO49dpqTEISv8k2Dk2MfoLtSg=;
        b=H3Y8YEzua3I8AXMocC1T/cDfPEYvtkSRw2GrOC53NkKmCtYYSa8YitJkCDsBuNy6ii
         UzKMiYXh2q5zgBpdiIFVeWMVj4/Mj5siWcpA+o9W458dKKRzDNAiF7Nz15dowoCO9lQx
         AetBysMqF59ERZoZGiZZp3W7OcfCtZ8vL3SPj8Oy2uMDGb6NsMo9HZE7huxK44WpabVL
         UKH4dvSwaqq4qICbgc1j/oa9gPaCLtctERjT3sOBhcti7lsc0VXjh9SnUi+DbPKyxkuw
         Xv7WBDqNMG/L8fChEMLfH/8+tPUGh9SMxt4bw2ZAO9OeQemsDMkKLpGgOAOwl+0XF6UO
         cjew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694105816; x=1694710616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Rz9GiS8mTfnAVkN8QSO49dpqTEISv8k2Dk2MfoLtSg=;
        b=KGCE3kBPoIWdaNtNEUfz89AkmwdRpDLq9a7oA90gsdvTJSFZOzPYC46vyI+Q4CawpH
         XCuEma5rCodyPNrnIqlRmFLx4l3DI5GvRdUedwafYMWjgj+88bc5Zpo/b0RtfK0szNnc
         DTqOy+7D+c/DdrmyfCRDB2GNDqEzKylsnBx/3TQ+PtxKsfiukiY1MtP1YgIfn8THJJNG
         rRFjikfaU2IHWftK2fMN4hy7u/RhigkgRzOzqLQ7nScGiUYwPtQyC2uyTzS0TLfyM1qr
         Wh19FonCdM0eNnN3A6Vb0owtBbycHhLrkvj8pvcIWpO++dmns4FHy4dwhg8btci3tm0B
         uW0w==
X-Gm-Message-State: AOJu0YzOiUQPCctjybX3U7fcttt1LSPrcipsZ2uBjLEjtWuKb9+2QQaA
        uMmYI3tWYlh8IRaoNk7sxBRiDojGSBH/9szeOYdqWyMBgdLI81gG3tE=
X-Google-Smtp-Source: AGHT+IFnux13voMEYKL2AvFFZ2IntVTZOtmPk8jRTbyWfstIdLEdj42EUj9cU8dCaEOekjzsm7vjd98pJPwVLSbOMrc=
X-Received: by 2002:a05:6902:120e:b0:d78:1b39:fd03 with SMTP id
 s14-20020a056902120e00b00d781b39fd03mr22126055ybu.64.1694072432520; Thu, 07
 Sep 2023 00:40:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-20-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-20-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:40:20 +0200
Message-ID: <CACRpkdZkPbvDTMo_ZOJ8rZ5+dUOqOi2_EfS+jzreWjMtpJrVYg@mail.gmail.com>
Subject: Re: [PATCH 19/21] gpio: swnode: replace gpiochip_find() with gpio_device_find_by_label()
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
> We're porting all users of gpiochip_find() to using gpio_device_find().
> Update the swnode GPIO code.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With Andy's comment addressed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
