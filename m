Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7266C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 24 Nov 2021 16:30:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbhKXQdu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 24 Nov 2021 11:33:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348911AbhKXQdt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Nov 2021 11:33:49 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EF5CC061574
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Nov 2021 08:30:39 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id x6so12997649edr.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Nov 2021 08:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XKNBajIsglAzZe0y/vL//Ni5Us7zXEMN6Pat+pnlU1g=;
        b=oQ4GFnFYFGWjc10X84dgjEwdcPPmEadSws3mdS6kPHHKfYV+F0vZJAmDcKO9w9cy8w
         CX0SNGskoPWc1qmZAVx+rDbyK7Ekd6bBBRJw18mPxZJM7gfduinik4AREWUS1/zENS39
         eN/DBntv+9HtSAHx/9lp+G+xrs2T8R6ZlTb2tUxG047cs2huBs66X79ciS7IiN0Gr8j+
         7QqUh3ENkALW1jufwfhKp+Osi0F2uwwH3ms3Pk/cUOeWfyK5U3xJoDX8K6Ovm+8vLJhW
         n2RbXSeiU4YKFR0JXwPKNPjicOZQAhw6ChMvBPVgDXVGJDaFLakJxSboTbdu1iAGUWub
         E/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XKNBajIsglAzZe0y/vL//Ni5Us7zXEMN6Pat+pnlU1g=;
        b=D8iG57C893tiJfLYsuG7XoA89fXvzWjGC2Vu1NfSK/CJzOsl/pLaMYrJHfF1M8ENnb
         0JHL0xFYACm7jzBiWQ6bewJ6HuUNaB90EG7HeK2/Nw5SKNYsVnhdTpUwJDW9ocUa2M8e
         x1cjDXxxOjKAXU4bmqfWYZaNEO0FzY/CiN5Y6JGSJ7rBtoSsikBYYBvMP6n41tEucqgF
         gLkl50Z4z94EcTGoHSrIq4U0shQtJg/UJRZc0FBtIYBgUPkbeS7S5l9MTUh/NW6pYxxs
         L/5ATD/a60Sj13KMbJROtAGzRiwwcWF9X7h4r1Vrsy2Fzo46vpoRUnraPQ9GexB66J6O
         fnxA==
X-Gm-Message-State: AOAM533uWVGaEObsdeUh5dpzGq8KFjo5wP5uOOglAcCnEY6fKZIlQ1jb
        k/LBlnQwiaN1Kwlex+9ExmWd5kCp2OeEEKwCLG4=
X-Google-Smtp-Source: ABdhPJz7xb1BfgtROA0don+gqkNgZgdwyPZLJ83mtFR3FLOz/MbdkHDTye+/3WssarPWcxbFBm/mhN2GfmEFO3MIPgE=
X-Received: by 2002:a50:fd16:: with SMTP id i22mr26763316eds.224.1637771438102;
 Wed, 24 Nov 2021 08:30:38 -0800 (PST)
MIME-Version: 1.0
References: <c752b3b2-9718-bd9a-732d-e165aa8a1fca@svgalib.org>
In-Reply-To: <c752b3b2-9718-bd9a-732d-e165aa8a1fca@svgalib.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 24 Nov 2021 18:30:01 +0200
Message-ID: <CAHp75VdxCaRJ9Dg-ruHOfiX3Y8yzzKX_fC7txPPn9JypXt9Mow@mail.gmail.com>
Subject: Re: [PATCH] lg-laptop: Recognize more models
To:     Matan Ziv-Av <matan@svgalib.org>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Nov 24, 2021 at 1:27 AM Matan Ziv-Av <matan@svgalib.org> wrote:

> LG uses 5 instead of 0 in the third digit (second digit after 2019)
> of the year string to indicate newer models in the same year. Handle
> this case as well.

>         if (product && strlen(product) > 4)
>                 switch (product[4]) {
>                 case '5':
> +                       if (strlen(product) > 5)
> +                               switch (product[5]) {
> +                               case 'N':
> +                                       year = 2021;
> +                                       break;
> +                               case '0':
> +                                       year = 2016;
> +                                       break;
> +                               default:
> +                                       year = 2022;
> +                               }
> +                       break;
>                 case '6':
>                         year = 2016;
>                         break;

Actually you may replace all those `if (strlen(product) > $X) {}` and
accompanied indentation level by adding corresponding
  case '\0':
    break;
into the switches, but this is out of scope here as it should be a
separate change, if any.



-- 
With Best Regards,
Andy Shevchenko
