Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61EAFC25B4E
	for <platform-driver-x86@archiver.kernel.org>; Fri, 20 Jan 2023 07:25:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbjATHZg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 20 Jan 2023 02:25:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbjATHZg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 20 Jan 2023 02:25:36 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58B2979E90
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jan 2023 23:25:32 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id 129so1649133ybb.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jan 2023 23:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xNyfWsqJp2T2+UrQIXuPGZpKaI5FcQb+oxkGo+mFm4w=;
        b=Hhd9Ipoz1U1mLubpfjYuIMuUuT0SS7UIbB848A6KxJRyrH5M+w6kaiT1zHKCCH4LSB
         ORKjRsWtfcIvpn2vvq1mRPINhEnQp95STVwWsJ323v8EeOVmJGV0IWNDpMfs9ua+/uz9
         KBO7pj3dVdkozUbiq5d+2bgqRlSXWCv0+YUnFRT9aw+R/94FHbFStp8w1abK1jbgbqVT
         BBPASTggslk6ZhaQiO7KSr5iUb9TZM0JwmgKxdfLcvblRPWidW7RXcLOEZq7G0jfwYb5
         fphpYVx9Ca1IxFKwqlwqyRtjqWqM6Llx8Oejw0egLjWzxE9OsgM4HbTI6pLj3l3E8Czm
         RdEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xNyfWsqJp2T2+UrQIXuPGZpKaI5FcQb+oxkGo+mFm4w=;
        b=H1klZh2nV6mMGRzsUppNtSTPl6j9uMRHNFSibxEBCzHhmkSVFnp8P0gnl0n2Es2jqh
         HbR7qF5LHYNJUtVJbFcDmcxspu7WBMFvOM51hUUXk1nOPf4JsCoWHyzzV3qyacxe9IbM
         W6kXE639IOOfsYzVNaoHdk9mAAF6jtYZtA8D0e8Mhv1C30cGiOWOr8y/HaMhAaSkfD/P
         aZsVfv3KY1CprAA8YZu9VMRDfXKbdAQpnPiZn0u0VP33Qszq8nJplWYJX6QhWtI++N0Z
         FKPxnbdg4T49lBRVs8UIsGY/oivDmKcDm80sXEkHsYfnFrrunSjPeH86zR7AePRbuMnj
         9VNg==
X-Gm-Message-State: AFqh2kqWxcTcKkJ1pV2BwZNygsLWjKZDaufUoDD4bZw0OInQEdEs9LTg
        SIAZY5+HdDqDbM7Y1drN5Tx85f98TGSK7hSBhplhxg==
X-Google-Smtp-Source: AMrXdXux6mEufn1tuMXOtYF/YjTIhpmzoCrS5IMGsTbPDgS1suvvZZubHD32doOoxyb+3DRWJoIlv7FHX3zF53qB6YE=
X-Received: by 2002:a25:9d88:0:b0:7c0:acd2:6300 with SMTP id
 v8-20020a259d88000000b007c0acd26300mr1377520ybp.520.1674199531539; Thu, 19
 Jan 2023 23:25:31 -0800 (PST)
MIME-Version: 1.0
References: <20230119130053.111344-1-hdegoede@redhat.com> <20230119130053.111344-4-hdegoede@redhat.com>
In-Reply-To: <20230119130053.111344-4-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 20 Jan 2023 08:25:20 +0100
Message-ID: <CACRpkdZ7VY4mLOZ-yVQogWthWB9E8vjjme8UggHNxfohA4Uanw@mail.gmail.com>
Subject: Re: [PATCH v4 03/11] leds: led-class: Add __devm_led_get() helper
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

> Add a __devm_led_get() helper which registers a passed in led_classdev
> with devm for unregistration.
>
> This is a preparation patch for adding a generic (non devicetree specific)
> devm_led_get() function.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I'm not a fan of __inner_functions because they are easy to
confuse with the namespace for __compiler_directives
but no big deal so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
