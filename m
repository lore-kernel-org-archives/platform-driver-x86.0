From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 3/4] platform/x86: intel_pmc_core: Decode Snoop / Non
 Snoop LTR
Date: Wed, 26 Sep 2018 20:42:53 +0300
Message-ID: <CAHp75Vd96+3cB7PwhftpsTOb8WYg-9WLEQvGYt3rYNB7djX3dg@mail.gmail.com>
References: <20180903180415.31575-1-rajneesh.bhardwaj@linux.intel.com>
 <20180903180415.31575-3-rajneesh.bhardwaj@linux.intel.com>
 <CAHp75VcKSVJQ54qFV1BwqnwUu4dkS6sOACT3nTntJV+Ww56Oag@mail.gmail.com> <d8df94fd-cf7d-197f-0532-24e2da8116a7@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d8df94fd-cf7d-197f-0532-24e2da8116a7@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rajneesh.bhardwaj@linux.intel.com
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Sep 26, 2018 at 5:19 PM Bhardwaj, Rajneesh
<rajneesh.bhardwaj@linux.intel.com> wrote:
> On 26-Sep-18 7:23 PM, Andy Shevchenko wrote:
> > On Mon, Sep 3, 2018 at 9:05 PM Rajneesh Bhardwaj
> > <rajneesh.bhardwaj@linux.intel.com> wrote:

> >> +static void get_ltr_scale(u32 *val)
> > What's wrong to return converted value? Actually the name should
> > reflect what it does, ie *convert* value.
>
> I can change it as per your suggestion.

Please do.

> >> +union ltr_payload {
> >> +       u32 raw_data;
> >> +       struct {
> >> +       u32 snoop_val : 10;
> >> +       u32 snoop_scale : 3;
> >> +       u32 snoop_res : 2;
> >> +       u32 snoop_req : 1;
> >> +       u32 non_snoop_val : 10;
> >> +       u32 non_snoop_scale : 3;
> >> +       u32 non_snoop_res : 2;
> >> +       u32 non_snoop_req : 1;
> >> +       } bits;
> >> +};
> > Just use normal masks and shifts.
>
> I chose union over masks and shifts to reduce code size and ensured
> correct endian-ness.

How do you ensure endianess in union if you do nothing to it here? It
just would reflect CPU endianess.

> Just for my understanding, can you please let me
> know why you feel masks/shift are better suited here?

First of all, in the very same driver shifts and masks / standalone
bits are already in use.
Like you mentioned an endianess, it would make it more clear here,
though it's still require to get a value in a proper one in the first
place.
On top of that, a compiler which might generate an awful code out of
bits defined as above.

Btw, there are helpers for that like those in bitfield.h.

--
With Best Regards,
Andy Shevchenko
