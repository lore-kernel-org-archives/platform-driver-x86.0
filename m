Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC5C4C25B50
	for <platform-driver-x86@archiver.kernel.org>; Fri, 20 Jan 2023 07:24:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbjATHYa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 20 Jan 2023 02:24:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230086AbjATHYU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 20 Jan 2023 02:24:20 -0500
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21DF379E93
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jan 2023 23:24:13 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-50112511ba7so1530117b3.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jan 2023 23:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BP/4oQSI0HWid8DUM0fDqxmgNWE8Na1enwT1UmU4jpE=;
        b=KaCoM3liBHtwu146zO8uavA381ipgXY0uzjXg2XKksGT9rDaaRMtWEqD9O/jzIzdak
         gmG5Sqw1pDAApYwpr4zXD8RWY0v0WYH3OxSqAdgk9COf+6V8ubA5sPVcdr2BOHqHY1Dn
         +fnzpj6LexK+W95gY7fbzQ6LApp2M9ik5TOCCesw29+KH090rqXL+LOo8w9gQlGZAEH3
         ws6pQlaA+HtT2K3M8Ndekfa1c0QBdOR59zIjP0D0XPI+kh6WSiy+sXaK3wXcnILDBx1q
         DYZ0jUPHw1CMBZepOtKxjnaJehkch6wDqyrVXGV0Ty0tkcuONQY9n3iYBdsyxy+n29g4
         5IGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BP/4oQSI0HWid8DUM0fDqxmgNWE8Na1enwT1UmU4jpE=;
        b=75SMZxchPtCXM0Z6jF709atlfIiG5d69zq6IYV6FE3ZvLMkCR4Y4KmF/ok898L8btW
         Np4if9R3svyO7L9+dy1VxcUW7zi2cwVksu58XQZQgbtesvjNjKLOkxaMtGHafUCgoLGb
         zZLglpQ+3LyH0yjVGlYXJfWhpxTDqUF2fcuIWEgaLCsYDiWuYEUgEuk5p0yVG4RmlvCT
         0KEhWCHLh0cSb2TUjcXChPZUseCC0jLkKM96i/UnFi5MiWrfrlSBdrPq/PU/XFD3Aq4Y
         WZiXcxutIOFdPvsPxciXs7a7ADzhG7N8smPYS9Ev16rBsNKfjwEqS+Lu9QvCP1pxz8pR
         9chQ==
X-Gm-Message-State: AFqh2krp2CF4el9sXCK0tSPs2dUfhUjon6XKwTFXRerLvxKXWAw0dgZx
        pvMDKyHgsF5MypQV2x2rZO0YFlBCICt+4WA+T2E53g==
X-Google-Smtp-Source: AMrXdXv3cETX80ZlfudJZ3usdoOGqhqv3yEQwywQWIrjTcZDjAwcTdk1BPanKEUmsmWr2/66G8WQSvOsvDXra05ExDY=
X-Received: by 2002:a81:4e54:0:b0:4e1:a40a:af7a with SMTP id
 c81-20020a814e54000000b004e1a40aaf7amr1803574ywb.273.1674199452692; Thu, 19
 Jan 2023 23:24:12 -0800 (PST)
MIME-Version: 1.0
References: <20230119130053.111344-1-hdegoede@redhat.com> <20230119130053.111344-3-hdegoede@redhat.com>
In-Reply-To: <20230119130053.111344-3-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 20 Jan 2023 08:24:01 +0100
Message-ID: <CACRpkdYCEnjjDmukA4qzgjyxuR=BHuqVKKAe-uTHcMPoQy37ug@mail.gmail.com>
Subject: Re: [PATCH v4 02/11] leds: led-class: Add led_module_get() helper
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Jan 19, 2023 at 2:01 PM Hans de Goede <hdegoede@redhat.com> wrote:

> Split out part of of_led_get() into a generic led_module_get() helper
> function.
>
> This is a preparation patch for adding a generic (non devicetree specific)
> led_get() function.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v4:
> - Rename helper from __led_get() to led_module_get()

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
