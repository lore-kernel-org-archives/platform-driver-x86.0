From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: asus-wmi: try to set als by default
Date: Fri, 21 Apr 2017 22:06:57 +0300
Message-ID: <CAHp75VfRio2j+AQfC2qFmyjHpVGTqgANw91XP98CihyTeE14ww@mail.gmail.com>
References: <20170421152434.3834-1-linux@rempel-privat.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f182.google.com ([209.85.216.182]:36098 "EHLO
        mail-qt0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1424570AbdDUTG7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 21 Apr 2017 15:06:59 -0400
Received: by mail-qt0-f182.google.com with SMTP id g60so76938690qtd.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 21 Apr 2017 12:06:59 -0700 (PDT)
In-Reply-To: <20170421152434.3834-1-linux@rempel-privat.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Oleksij Rempel <linux@rempel-privat.de>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>

On Fri, Apr 21, 2017 at 6:24 PM, Oleksij Rempel <linux@rempel-privat.de> wrote:
> some laptops, for example ASUS UX330UAK, have brocken als_get function
> but working als_set funktion. In this case, ALS will stay turned off.

Please, spell check the above.

some -> Some
brocken -> broken
funktion -> function

>
>              Method (WMNB, 3, Serialized)
>             {
>             ...
>                If (Local0 == 0x53545344)
>                 {
>                 ...
>                     If (IIA0 == 0x00050001)
>                     {
>                         If (!ALSP)
>                         {
>                             Return (0x02)
>                         }
>
>                         Local0 = (GALS & 0x10)    <<<---- bug,
>                                                     should be: (GALS () & 0x10)

How GALS is defined in ASL?

> Since it works without problems on Windows I assume ASUS WMI driver for Win
> never trying to get ALS state, and instead it is setting it by default to ON.
>
> This patch will do the same. Turn ALS on by default.

It would be good to see if there is no regression added.

-- 
With Best Regards,
Andy Shevchenko
