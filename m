From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for the Trekstor
 Yourbook C11B
Date: Fri, 15 May 2020 17:18:15 +0300
Message-ID: <CAHp75VfAeyMnwoJi8P0d4Gs5dziUQYhPGzS2fmev00UiRZ6vaQ@mail.gmail.com>
References: <20200512204009.4751-1-bernhardu@mailbox.org> <2656984b-3eec-c6d0-f992-8f1f8973fe3e@redhat.com>
 <CAHp75VejzaZL26ztQMFGjAAMC3B8mkSnXSvGhyFeiHUbUUpp=w@mail.gmail.com> <4787d347-b761-6283-7f9d-34c1a11b909f@mailbox.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <4787d347-b761-6283-7f9d-34c1a11b909f@mailbox.org>
Sender: linux-input-owner@vger.kernel.org
To: =?UTF-8?Q?Bernhard_=C3=9Cbelacker?= <bernhardu@mailbox.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, linux-input <linux-input@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Otmar Meier <otmarjun.meier@nexgo.de>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, May 15, 2020 at 5:08 PM Bernhard =C3=9Cbelacker
<bernhardu@mailbox.org> wrote:
> Am 13.05.20 um 19:17 schrieb Andy Shevchenko:
> > On Tue, May 12, 2020 at 11:44 PM Hans de Goede <hdegoede@redhat.com> wr=
ote:
> >> Hi,
> >> On 5/12/20 10:40 PM, Bernhard =C3=9Cbelacker wrote:
> >>> Add touchscreen info for the Trekstor Yourbook C11B. It seems to
> >>> use the same touchscreen as the Primebook C11, so we only add a new D=
MI
> >>> match.
> >>>
> >>> Cc: Otmar Meier <otmarjun.meier@nexgo.de>
> >>> Reported-and-tested-by: Otmar Meier <otmarjun.meier@nexgo.de>
> >>> Signed-off-by: Bernhard =C3=9Cbelacker <bernhardu@mailbox.org>
> >>
> >> Thank you, patch looks good to me:
> >>
> >> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> >
> > This doesn't apply to our for-next.
> > Please, rebase, add Hans' tag and resend, thanks!

> I am not sure against which git tree I should rebase?

Ah, sorry, this one [1] you should use for PDx86.

[1]: http://git.infradead.org/linux-platform-drivers-x86.git

--=20
With Best Regards,
Andy Shevchenko
