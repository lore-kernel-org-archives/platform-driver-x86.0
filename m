From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH] intel-speed-select: Fix
 speed-select-base-freq-properties output on CLX-N
Date: Mon, 20 Apr 2020 09:55:35 -0700
Message-ID: <969038ce47f5f0c054b8971c516b8b961a46b737.camel@linux.intel.com>
References: <20200420141054.26173-1-prarit@redhat.com>
         <CAHp75VfKCuX1CNMaVLeghdoP9-KHh3+1yuFVgU8qhRbKi69JNQ@mail.gmail.com>
         <d0bfcbfe-4834-624f-b590-1aa93970e5a4@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d0bfcbfe-4834-624f-b590-1aa93970e5a4@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Prarit Bhargava <prarit@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, 2020-04-20 at 11:46 -0400, Prarit Bhargava wrote:
> 
> On 4/20/20 11:43 AM, Andy Shevchenko wrote:
> > On Mon, Apr 20, 2020 at 6:11 PM Prarit Bhargava <prarit@redhat.com>
> > wrote:
> > > On CLX-N, the perf-profile-level's output is terminated before
> > > the
> > > speed-select-base-freq-properties are output which results in a
> > > corrupt
> > > json file.
> > > 
> > > Adjust the output of speed-select-base-freq-properties by one on
> > > CLX-N.
> > > 
> > 
> > Thanks for the patch, it will be pulled from Srinivas' tree
> > whenever
> > he sends a PR to PDx86 mailing list.
> 
> Srinivas, OOC do you want these patches to be sent somewhere
> else?  FWIW, I'm
> running get_maintainers.pl to get the mailing list and cc.
This mailing list is fine.

I will take care of it once I test it out an apply to my tree.

Thanks,
Srinivas

> 
> P.
> 
> > 
> > > Signed-off-by: Prarit Bhargava <prarit@redhat.com>
> > > Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> > > Cc: platform-driver-x86@vger.kernel.org
> > > ---
> > >  tools/power/x86/intel-speed-select/isst-display.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/tools/power/x86/intel-speed-select/isst-display.c
> > > b/tools/power/x86/intel-speed-select/isst-display.c
> > > index 51dbaa5f02ec..f6e2ce181123 100644
> > > --- a/tools/power/x86/intel-speed-select/isst-display.c
> > > +++ b/tools/power/x86/intel-speed-select/isst-display.c
> > > @@ -470,7 +470,7 @@ void isst_ctdp_display_information(int cpu,
> > > FILE *outf, int tdp_level,
> > >                                 _isst_pbf_display_information(cpu
> > > , outf,
> > >                                                               tdp
> > > _level,
> > >                                                           &ctdp_l
> > > evel->pbf_info,
> > > -                                                             lev
> > > el + 1);
> > > +                                                             lev
> > > el + 2);
> > >                         continue;
> > >                 }
> > > 
> > > --
> > > 2.18.2
> > > 
