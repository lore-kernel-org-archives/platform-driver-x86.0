From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH v3 04/11] platform/x86: asus-wmi: Improve DSTS WMI method
 ID detection
Date: Thu, 9 May 2019 14:08:38 +0800
Message-ID: <CAD8Lp46tCfi3ZCmmXZv3-ZDbon+6P8qC4GPR9Bt3uFFr=Sn4Cw@mail.gmail.com>
References: <7acd57fe-604a-a96a-4ca2-a25bc88d6405@gmail.com>
 <d6ee51cc-eb0f-2bb9-fef9-f8b4bf849076@gmail.com> <CAHp75VfMXAyUpWTrEHnv1NcQcHch+RHehWYTjk6KMTbXbtppPg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VfMXAyUpWTrEHnv1NcQcHch+RHehWYTjk6KMTbXbtppPg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

> > -#define ASUS_WMI_METHODID_DSTS         0x53544344 /* Device STatuS */
> > -#define ASUS_WMI_METHODID_DSTS2                0x53545344 /* Device STatuS #2*/
>
> > +#define ASUS_WMI_METHODID_DSTS         0x53544344 /* Device STatuS (DCTS) */
>
> It's not clear from the description what 'C' stands for.
> Is there any specification which describes the difference and actual
> abbreviations?

The (recent) spec I have here doesn't mention 0x53544344 (DCTS).
However the spec changelog does mention that EEEPC stuff was removed
from the spec a while ago.
The spec does mention 0x53545344 (DSTS), labelled as "Get device status".

For clarity I think the constants could be renamed as
ASUS_WMI_METHODID_DCTS and ASUS_WMI_METHODID_DSTS.

Daniel
