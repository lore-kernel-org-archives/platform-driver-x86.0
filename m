From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] platform/x86: pmc_atom: Add Siemens SIMATIC IPC227E to
 critclk_systems DMI table
Date: Thu, 7 Nov 2019 19:06:42 +0200
Message-ID: <CAHp75VfBS9tjDSaoN2AoBshyQR+x781Zyw61bVSKheNVtNi8rg@mail.gmail.com>
References: <c090302a-da38-5764-2a84-399ed6b333f5@siemens.com> <16119dad-9597-ecdc-a0e7-e386030659ce@siemens.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <16119dad-9597-ecdc-a0e7-e386030659ce@siemens.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Srikanth Krishnakar <Srikanth_Krishnakar@mentor.com>, Henning Schild <henning.schild@siemens.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Nov 4, 2019 at 6:21 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> On 04.09.19 08:42, Jan Kiszka wrote:
> > From: Jan Kiszka <jan.kiszka@siemens.com>
> >
> > The SIMATIC IPC227E uses the PMC clock for on-board components and gets
> > stuck during boot if the clock is disabled. Therefore, add this device
> > to the critical systems list.
> >
> > Fixes: 648e921888ad ("clk: x86: Stop marking clocks as CLK_IS_CRITICAL")
> > Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> > ---
> >
> > Changes in v2:
> >  - fixed cut-off subject line (local tooling bug...)
> >
> > Should go into stable as well, down to 4.19.
>
> This one is in 5.4-rc now (as ad0d315b4d4e). Is it also queued somewhere
> for stable kernels? IIRC, it's generally the privilege of the subsystem
> maintainer to propose formally to stable.

Anybody can resend for stable putting maintainer to Cc as long as the
original commit is in upstream.

Nevertheless, I just resend it.

> I've received reports from users down at 4.14 with the need for it (4.9
> is unaffected). And the same applies to f110d252ae79 ("platform/x86:
> pmc_atom: Add Siemens SIMATIC IPC277E to critclk_systems DMI table").


-- 
With Best Regards,
Andy Shevchenko
