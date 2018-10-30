From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 3/4] platform/x86: intel_pmc_core: Decode Snoop / Non
 Snoop LTR
Date: Tue, 30 Oct 2018 11:39:00 +0200
Message-ID: <CAHp75VdXCXHYGuM8+iT13MdPrndTDoXUF8B_Hyb-uo8RXRHsoQ@mail.gmail.com>
References: <20181006065113.669-1-rajneesh.bhardwaj@linux.intel.com>
 <20181006065113.669-3-rajneesh.bhardwaj@linux.intel.com> <CAHp75VcLN6g-6FJsVgxPZRV675N6YQzxsbm19BWgKhpiYfmG3w@mail.gmail.com>
 <7d7d59a3-241d-9753-24e0-74a8f0fc9df6@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7d7d59a3-241d-9753-24e0-74a8f0fc9df6@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rajneesh.bhardwaj@linux.intel.com
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Oct 30, 2018 at 9:40 AM Bhardwaj, Rajneesh
<rajneesh.bhardwaj@linux.intel.com> wrote:

> Thanks for your review. My comments below.
>
> If you agree then i can quickly send v3 addressing all suggestions so we
> can make it in time for 4.20 merge window.

I don't like `quickly` part =E2=80=94 usual way to make the last minute mis=
takes.
How long does testing take?

> On 19-Oct-18 6:04 PM, Andy Shevchenko wrote:
> > On Sat, Oct 6, 2018 at 9:54 AM Rajneesh Bhardwaj
> > <rajneesh.bhardwaj@linux.intel.com> wrote:
> >> The LTR values follow PCIE LTR encoding format and can be decoded as p=
er
> >> https://pcisig.com/sites/default/files/specification_documents/ECN_Lat=
encyTolnReporting_14Aug08.pdf
> >>
> >> This adds support to translate the raw LTR values as read from the PMC
> >> to meaningful values in nanosecond units of time.
> > While I have pushed this to my review and testing queue, it needs a
> > bit more work. See my comments below.

> >> +       u32 scale =3D 0;
> > Redundant, see below.

> >> +       if (val > 5)
> >> +               pr_warn("Invalid LTR scale factor.\n");
> > if (...) {
> >   pr_warn(...); // Btw, Does it recoverable state? What user will get
> > with returned 0 as a multiplier?
> >   return 0; // Btw, is 0 fits better than ~0? How hw would behave with
> > this value?
> > }
>
> We show 0 LTR for invalid scale as PMC output is junk sometimes.

> >> +       else
> >> +               scale =3D 1U << (5 * (val));
> >> +
> >> +       return scale;
> > return 1U << (5 * val);
>
> We intend to return 0 so for invalid LTR scale. This will make retuen
> non zero and we dont want that.

And my example, if being read carefully, doesn't alter that.

> >> +}
> >>          for (index =3D 0; map[index].name ; index++) {
> >> -               seq_printf(s, "IP %-2d :%-32s\tRAW LTR: 0x%x\n", index=
,
> >> -                          map[index].name,
> >> -                          pmc_core_reg_read(pmcdev, map[index].bit_ma=
sk));
> > We use 32 characters for the names. Here are two minor issues:
> > - inconsistency with the rest
>
> intentional.

I understand that, but this is not like the rest is printed.
OK, this is bikeshedding, it's your call, but keep in mind the
avoidance of ping-pong programming.

> > - ping-pong style of programming (you changed 32 to 24 in the same
> > series where you introduced 32 in the first place).
>
> This is because the formatted output looks better with this width. I
> used 32 for the earlier patch because its consistent with rest and also
> does not look bad on screen.

See how it looks like with my proposals below.

> > After you remove the index, it would give you 4 more characters,
> > though it 4 less than 8 you got from reducing 32 to 24.
>
> I plan to keep the index as is. Reason for this is mentioned in previous
> patch that introduces this index.

No, please don't. We have a numerous userspace tools which are doing
this pretty well.

> >> --- a/drivers/platform/x86/intel_pmc_core.h
> >> +++ b/drivers/platform/x86/intel_pmc_core.h
> >> @@ -177,6 +177,11 @@ enum ppfear_regs {
> > It might be good idea to include linux/bits.h here.
>
> Certainly. Luckily 0day bot didnt complain about randconfigs etc so is
> it really needed as it will increase size?

You are lucky because of ordering of inclusions. This is fragile.
Since you are using macros from bits.h better to explicitly show this
dependency.

--=20
With Best Regards,
Andy Shevchenko
