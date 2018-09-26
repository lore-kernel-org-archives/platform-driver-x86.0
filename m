From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 4/4] platform/x86: intel_telemetry: report debugfs failure
Date: Wed, 26 Sep 2018 20:18:18 +0300
Message-ID: <CAHp75VeCC0CUmzieujpxUP1A3Mn8J9gekX6Vn-fbtD_ZFPbnYw@mail.gmail.com>
References: <20180903180415.31575-1-rajneesh.bhardwaj@linux.intel.com>
 <20180903180415.31575-4-rajneesh.bhardwaj@linux.intel.com>
 <CAHp75VcE+BY=8aKEGqzkDBVazLGtwNNCa1CYCKGirS1vBLVXPg@mail.gmail.com> <69ad420e-362c-d8c9-331f-056cdaefb1eb@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <69ad420e-362c-d8c9-331f-056cdaefb1eb@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rajneesh.bhardwaj@linux.intel.com
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>, matt.turner@intel.com, "Brown, Len" <len.brown@intel.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Sep 26, 2018 at 5:24 PM Bhardwaj, Rajneesh
<rajneesh.bhardwaj@linux.intel.com> wrote:
> On 26-Sep-18 7:26 PM, Andy Shevchenko wrote:
> > On Mon, Sep 3, 2018 at 9:05 PM Rajneesh Bhardwaj
> > <rajneesh.bhardwaj@linux.intel.com> wrote:

> >> not be obtained and result in a invalid telemetry_plt_config.
> > What is telemetry_plt_config?
>
> Internal data structure that holds platform config, maintained by the
> telemetry platform driver.

You need to spell if for the reader.

> >> This is also applicable to the platforms where the BIOS supports IPC1
> >> device under debug configurations but IPC1 is disabled by user or the
> >> policy.
> >>
> >> This change allows user to know the reason for not seeing entries unde=
r
> >> /sys/kernel/debug/telemetry/* when there is no apparent failure at boo=
t.

> >> +exit:
> >> +       pr_debug(pr_fmt(DRIVER_NAME) " Failed\n");
> > Completely useless.
> >
> > Device core does it in generic way.
>
> If i remove this print then perhaps there is no need of this patch.

Maybe.

> Reason to print this is that the platform driver / core driver does not
> show any error.

If the code fails and returns 0 =E2=80=94 it's a bug in error reporting ins=
ide the code.

> In-fact they are even loaded in module table. OTOH, this
> debugfs interface fails. This is very confusing to the users if they
> check the lsmod output so i feel this print might help.

Again, device core *already has* this and even more (it prints also a
return code!).

--=20
With Best Regards,
Andy Shevchenko
