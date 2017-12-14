From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 0/3] platform/x86: dell-laptop: All the warnings are resolved.
Date: Thu, 14 Dec 2017 19:59:55 +0200
Message-ID: <CAHp75VfTO9iCVFhddb1WHCL8RPKTVT7OhdOwvHJNy60V93wy0A@mail.gmail.com>
References: <20171213081309.22851-1-dhaval.shah@softnautics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:44229 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753698AbdLNR74 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Dec 2017 12:59:56 -0500
In-Reply-To: <20171213081309.22851-1-dhaval.shah@softnautics.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dhaval Shah <dhaval.shah@softnautics.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Dec 13, 2017 at 10:13 AM, Dhaval Shah
<dhaval.shah@softnautics.com> wrote:
> There are total three types of warnings are resolved.
> First patch  : Block comments use * on subsequent lines
> Second patch : Missing a blank line after declarations
> third patch  : braces {} are not necessary for single statement blocks.
>

Can we survive without this? Does it break build or alike?


> Dhaval Shah (3):
>   platform/x86: dell-laptop: Block comments use * on subsequent lines
>   platform/x86: dell-laptop: Missing a blank line after declarations
>   platform/x86: dell-laptop: braces {} are not necessary for single
>     statement blocks
>
>  drivers/platform/x86/dell-laptop.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> --
> 2.11.0
>



-- 
With Best Regards,
Andy Shevchenko
