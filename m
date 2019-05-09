From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 04/11] platform/x86: asus-wmi: Improve DSTS WMI method
 ID detection
Date: Thu, 9 May 2019 20:57:02 +0300
Message-ID: <CAHp75Vdo80jfFt5s6KWK1dPJFAEa7BrQS_tcKLx6GPUrpQm+ag@mail.gmail.com>
References: <7acd57fe-604a-a96a-4ca2-a25bc88d6405@gmail.com>
 <d6ee51cc-eb0f-2bb9-fef9-f8b4bf849076@gmail.com> <CAHp75VfMXAyUpWTrEHnv1NcQcHch+RHehWYTjk6KMTbXbtppPg@mail.gmail.com>
 <CAD8Lp46tCfi3ZCmmXZv3-ZDbon+6P8qC4GPR9Bt3uFFr=Sn4Cw@mail.gmail.com> <92518192-8cf0-7529-0c05-4b3e44ce04b7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <92518192-8cf0-7529-0c05-4b3e44ce04b7@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Cc: Daniel Drake <drake@endlessm.com>, Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, May 9, 2019 at 8:29 PM Yurii Pavlovskyi
<yurii.pavlovskyi@gmail.com> wrote:
> On 08.05.19 15:36, Andy Shevchenko wrote:> On Fri, Apr 19, 2019 at 1:08 PM
> Yurii Pavlovskyi
> > <yurii.pavlovskyi@gmail.com> wrote:
> >>         int rv;
> >> +       char *wmi_uid;
> >
> > Keep them in reversed spruce order.
>
> What do you mean by that? Do you mean like this?

> + char *wmi_uid;
> int rv;

Yes.

> int err;

Don't see this in the above, though.

> >> +#define ASUS_WMI_METHODID_DSTS         0x53544344 /* Device STatuS
> (DCTS) */
> >
> > It's not clear from the description what 'C' stands for.
> > Is there any specification which describes the difference and actual
> > abbreviations?
> >
> Not that I know of. Daniel had written some research in the previous
> version thread regarding where it is used, but as I understand from current
> implementation the functional difference is not really there, as it serves
> the same purpose as DSTS, just for another hardware.
>
> On 09.05.19 08:08, Daniel Drake wrote:
> > For clarity I think the constants could be renamed as
> > ASUS_WMI_METHODID_DCTS and ASUS_WMI_METHODID_DSTS.
> >
> Agree, that'll be better.

Also makes sense, but then fix up capitalization in the comment
(perhaps "Device status" would be good in both cases).

-- 
With Best Regards,
Andy Shevchenko
