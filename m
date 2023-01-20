Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5793AC27C76
	for <platform-driver-x86@archiver.kernel.org>; Fri, 20 Jan 2023 07:29:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230171AbjATH3M (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 20 Jan 2023 02:29:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229916AbjATH3L (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 20 Jan 2023 02:29:11 -0500
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77CF279E81
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jan 2023 23:29:10 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-4a2f8ad29d5so60576417b3.8
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jan 2023 23:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ltSsSC+JZto0JrpK+1L3ljWItyAcHL59PJv9eZdjARQ=;
        b=r9lSpPFJUyFqK+rZATbzTPgn5Yc8YtOBMW4KLkAzpjSWswkhXZJpjiWsjjeiVcQpFM
         V5KPEYhcAontmo+zEDpfxk8O0uA1/LSD8vLZK57M+rTOwADpxS/Mgs3hCVcijhTrvaKe
         7sxv0cyUNErGDCyGUbJyiofUwVVWWyWKKd9cxsQh5+fUGPA8kNKR5iAOmv4JUJIIqols
         SP8gDHlTHUycodsVMHASSwo9JMWYEhdXxzDnVIXUMhZU+sQyS0kuc11Xrhi4nvO4yOc/
         8YIX35m82A7bfDpHsYJms/tVQvEdHDIoNPhk48p5+vbLuA5Zt7TugdJCHqh2pN1mIzVf
         NfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ltSsSC+JZto0JrpK+1L3ljWItyAcHL59PJv9eZdjARQ=;
        b=gwNzQQOF9ltF5leZ4Ie3OLFBBrK1wTpKIQE17Uyf5Tx9XxCKgmcrTH97TlcISZ4rf5
         GPW28IXHeUl40p2+qoxmLL89ontqGu83ona0ke5dAW2omgK1jnj86nUMbyvC7kEDVlJ7
         bEsGmfqg0ylrpp7XlhbGDQoMLga01nXDBgCzTbMOAoeSopkY9+94v0IH+nzIdjPdTwwD
         N2AJNAYN3XKzbBSTSyTbR0RDT/5XHYcTOcliMmpwR10QQkBrGYPMVC+UbpVrXztC7cxB
         Zc5QblUsp9ndRWmxaLw5NIvFkunCtgqnsHYCRop1evbWASy0cGHHsUapF7Dl1NBldDfj
         +Qwg==
X-Gm-Message-State: AFqh2krWiAFp1/sBKsMT6oMHt1hvtiZpuj8cbkXOfxaMN3LbKS2dDALO
        gzqckGS4hvLqAizdTiAJIGS4wW0kABq/rsYlqO6Hsw==
X-Google-Smtp-Source: AMrXdXv61KRxB3MJe8D+CgvL02tEZ8sNctXqSNuBpAF0a2GrjwbkOe3n1BQQ52Glni04fOfiOrZusfZYB82ps5yhXbA=
X-Received: by 2002:a81:6842:0:b0:4ff:e4bc:b56f with SMTP id
 d63-20020a816842000000b004ffe4bcb56fmr115853ywc.488.1674199749676; Thu, 19
 Jan 2023 23:29:09 -0800 (PST)
MIME-Version: 1.0
References: <20230119130053.111344-1-hdegoede@redhat.com>
In-Reply-To: <20230119130053.111344-1-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 20 Jan 2023 08:28:58 +0100
Message-ID: <CACRpkdbXRtJOGOvtzChay4_FKdztLvN1GScCTYXiVWAVWvbDGQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] leds: lookup-table support + int3472/media
 privacy LED support
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

> Here is my version 4 of my series to adjust the INT3472 code's handling of
> the privacy LED on x86 laptops with MIPI camera(s) so that it will also
> work on devices which have a privacy-LED GPIO but not a clk-enable GPIO
> (so that we cannot just tie the LED state to the clk-enable state).
>
> Changes in v4:

I think this is good for merge, I reviewed the LED stuff that I understand,
but for the rest in drivers/media FWIW:
Acked-by: Linus Walleij <linus.walleij@linaro.org>
as well.

I really like how this developed to solve a real old outstanding hole
in the implementation.

Yours,
Linus Walleij
