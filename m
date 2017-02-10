From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 00/10] fujitsu-laptop: renames and cleanups
Date: Fri, 10 Feb 2017 02:42:00 +0200
Message-ID: <CAHp75VeedmO7yyFjfp3VwrqZa6BmE06Xq1oxdugaYn=YEP2Aww@mail.gmail.com>
References: <20170208134633.5152-1-kernel@kempniu.pl> <20170210001616.GH1950@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:33550 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751252AbdBJAmB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Feb 2017 19:42:01 -0500
In-Reply-To: <20170210001616.GH1950@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Micha?? K??pie?? <kernel@kempniu.pl>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Feb 10, 2017 at 2:16 AM, Jonathan Woithe <jwoithe@just42.net> wrote:
> On Wed, Feb 08, 2017 at 02:46:23PM +0100, Micha?? K??pie?? wrote:

> In summary, I see no issues with this patch series which provides a much
> needed clean up of the code and naming conventions within the fujitsu-laptop
> driver.  I'm happy for this series (patches 1-10/10) to be applied.
>
> Signed-off-by: Jonathan Woithe <jwoithe@just42.net>

I have noticed people start using SoB for the code they are
maintaining w/o sending any pull requests.
It is okay, but there is, as Wolfram pointed, a downside for patchwork
users. Patchwork is tracking tags (A/R/T) which by a glance allows to
see what patches are acked/reviewed/tested.

-- 
With Best Regards,
Andy Shevchenko
