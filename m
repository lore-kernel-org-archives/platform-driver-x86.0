Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF4BECAAD8
	for <platform-driver-x86@archiver.kernel.org>; Fri, 26 Aug 2022 21:42:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245719AbiHZVmp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 26 Aug 2022 17:42:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbiHZVmo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 26 Aug 2022 17:42:44 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC2161903E
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Aug 2022 14:42:42 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-33da3a391d8so68071857b3.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Aug 2022 14:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=stVd1kvtLgfEmwVkeFj+I3sq6eTvN2FbTADCLAaKivY=;
        b=cpORBdKyDf9E+dMF/M1oISvK5qEa/G3NcnVQrFQbWWjMPCPEJBCAUOq6kNgiNOCTLd
         1X40iUjQ1XZA8MuboIiSjjtJ7r0Pcd2l4s2Ti8Y61EqTHP0UQm9w+egw8igqv/EezsXb
         Ia3GrgGZN9B7BQLEdSeHRWs9aY5C00jVW9xuD+jb0Jay6fZngjiYlOK4MphbusgD1Aro
         Fps9c2cm18M7TBXnqPY8SNC7LpLUZMzm3ZgUIaqdmXxtdO3HM/8LVJ2nGutNpze43pzt
         dl0cK9uU6uUfc0prCPyIQhDt0jTyvIhoGYcG3lNWc4lFT/osLNNWPvyfXjrd1EEVUChR
         RUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=stVd1kvtLgfEmwVkeFj+I3sq6eTvN2FbTADCLAaKivY=;
        b=YmYyylOMwDpfDj3BkSHen4Nu37Vm0OZipsOZ2kSaA1ttgJlc6PZu3+SPbhyJHgCc+S
         jMf4/i1ppcwcRDZABj+tAYtw/hDMdf/ac1MW80r9BdplUCCOPb8GZx7OaKPciAsEtjdk
         CJs8ARO2hqWLb2NSYJaebEl+QczWtaNhWd3imwZnloHxabi5nVtQ/R3PcYnJ5uKnuxkf
         EN120GSwucVfjGODARnibozcOIHdCLbpBvLaS4hv8dIMRe2OfRQ3pg7aUCR5WHIbBvhC
         Cuu4B/t5/M85MtNeOsKGVjg5mzzIgCn2ob6qXjbp3bMKKiqpvkdzUNc8HJVmTem4qif3
         /cKg==
X-Gm-Message-State: ACgBeo27Qbw8eOrQmTgk21OjJWPOZ/YWxxBugEkQt6ygozDwLgIsbcAm
        v3zSRTEFG1tvMV46os8KlcWcxuCI+NPOYXtm+edWIA==
X-Google-Smtp-Source: AA6agR7MUxUWlWIUrcYRP1p+BJKCa/BwK4c0Lfj4vCbAboDXjIK3nknSMyrkg2wxgWFegS5KCUPLDRxJTC7ctbNQrx0=
X-Received: by 2002:a05:6902:3c6:b0:694:1088:5448 with SMTP id
 g6-20020a05690203c600b0069410885448mr1577517ybs.410.1661550162253; Fri, 26
 Aug 2022 14:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220825104422.14156-1-henning.schild@siemens.com> <20220825104422.14156-2-henning.schild@siemens.com>
In-Reply-To: <20220825104422.14156-2-henning.schild@siemens.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 26 Aug 2022 23:42:30 +0200
Message-ID: <CACRpkdZgcLsP+q_jRkKX6gXfXErnnF6DPUzLMzVEtZui24chyQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/7] gpio-f7188x: switch over to using pr_fmt
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Sheng-Yuan Huang <syhuang3@nuvoton.com>,
        Tasanakorn Phaipool <tasanakorn@gmail.com>,
        simon.guinot@sequanux.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Aug 25, 2022 at 12:44 PM Henning Schild
<henning.schild@siemens.com> wrote:

> Subsequent patches will touch that file, apply some nice to have style
> changes before actually adding functional changes.
>
> Signed-off-by: Henning Schild <henning.schild@siemens.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
