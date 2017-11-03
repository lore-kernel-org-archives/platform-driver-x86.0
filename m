From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 3/4] platform/x86: topstar-laptop: add platform device
Date: Fri, 3 Nov 2017 14:47:36 +0200
Message-ID: <CAHp75VcsZsWxYgwQL9yja45vwo0_kShdCEoa_WreFU7fYLYW_A@mail.gmail.com>
References: <cover.1509229280.git.gdouezangrard@gmail.com> <53fbaedf9958cfb56e1e4ce11ccea4de3de134c9.1509229280.git.gdouezangrard@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f179.google.com ([209.85.220.179]:47401 "EHLO
        mail-qk0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750857AbdKCMrh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Nov 2017 08:47:37 -0400
In-Reply-To: <53fbaedf9958cfb56e1e4ce11ccea4de3de134c9.1509229280.git.gdouezangrard@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Guillaume_Dou=C3=A9zan=2DGrard?= <gdouezangrard@gmail.com>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sun, Oct 29, 2017 at 1:52 AM, Guillaume Dou=C3=A9zan-Grard
<gdouezangrard@gmail.com> wrote:
> * add platform device to support further addition of a led subsystem,
>
> * add existing input device to the new platform device.

>  #include <linux/init.h>
>  #include <linux/slab.h>
>  #include <linux/acpi.h>
> +#include <linux/platform_device.h>
>  #include <linux/input.h>
>  #include <linux/input/sparse-keymap.h>

Please, keep it ordered as much as possible, i.e. add the line after
sparse-keymap.

--=20
With Best Regards,
Andy Shevchenko
