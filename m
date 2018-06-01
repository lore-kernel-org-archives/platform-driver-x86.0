From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH V2] platform/x86: intel_pmc_core: Add CNP SLPS0 debug registers
Date: Fri, 1 Jun 2018 11:25:03 +0300
Message-ID: <CAHp75Vdxz2h1N_bLQ4wxrYoo-kRAHQK=+36Db0BfK1QR4iwVPw@mail.gmail.com>
References: <CAHp75VfLqvjVPwhcsK4enhsvXSLggX9_pO9AozZT56DWDrkjPg@mail.gmail.com>
 <20180525011056.25132-1-david.e.box@linux.intel.com> <CAHp75VfgAS4mDbtnVSMCJcadra=mPEsSQ5jt153r-Fks6vis7A@mail.gmail.com>
 <1527807882.10176.11.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1527807882.10176.11.camel@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andy@infradead.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, kyle.d.pelton@linux.intel.com, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jun 1, 2018 at 2:04 AM, David E. Box
<david.e.box@linux.intel.com> wrote:
> On Thu, 2018-05-31 at 21:38 +0300, Andy Shevchenko wrote:
>> On Fri, May 25, 2018 at 4:10 AM, David E. Box
>> <david.e.box@linux.intel.com> wrote:

>> > +struct slps0_dbg_map {
>> > +       const struct pmc_bit_map *slps0_dbg_sts;
>> > +       int size;
>> > +};
>>
>> Didn't pay attention to this earlier. Why do we have a separate size
>> member? What does it define?
>
> It holds the size of the pmc_bit_map array, assigned as shown here:
>
> +static const struct slps0_dbg_map cnp_slps0_dbg_maps[] = {
> + {cnp_slps0_dbg0_map, ARRAY_SIZE(cnp_slps0_dbg0_map)},
> + {cnp_slps0_dbg1_map, ARRAY_SIZE(cnp_slps0_dbg1_map)},
> + {cnp_slps0_dbg2_map, ARRAY_SIZE(cnp_slps0_dbg2_map)},
> +};

I see.
Please drop this and use a terminator instead like it's done for the
rest map tables.

-- 
With Best Regards,
Andy Shevchenko
