From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH 10/10] tools/power/x86: A tool to validate Intel Speed
 Select commands
Date: Sat, 29 Jun 2019 15:17:00 -0700
Message-ID: <41765249d4384d48437eba9c8640ecf167e629d2.camel@linux.intel.com>
References: <20190626223851.19138-1-srinivas.pandruvada@linux.intel.com>
         <20190626223851.19138-11-srinivas.pandruvada@linux.intel.com>
         <CAHp75VfMDpKyYnZkZw51dwcEt5neQwGuZUaB7yEFQW6fjRYCqg@mail.gmail.com>
         <1c4238f7d18d316df82d3ba1618fecdcf014f98a.camel@linux.intel.com>
         <CAHp75VduxgJ6k4J2bB83Xbif0D0AGkxyDAdwvN64ybxdxXHXcw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VduxgJ6k4J2bB83Xbif0D0AGkxyDAdwvN64ybxdxXHXcw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Andriy Shevchenko <andriy.shevchenko@intel.com>, Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Alan Cox <alan@linux.intel.com>, Len Brown <lenb@kernel.org>, prarit@redhat.com, darcari@redhat.com, Linux Documentation List <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, 2019-06-29 at 19:03 +0300, Andy Shevchenko wrote:
> On Sat, Jun 29, 2019 at 5:53 PM Srinivas Pandruvada
> <srinivas.pandruvada@linux.intel.com> wrote:
> > On Sat, 2019-06-29 at 17:31 +0300, Andy Shevchenko wrote:
> > > On Thu, Jun 27, 2019 at 1:39 AM Srinivas Pandruvada
> > > <srinivas.pandruvada@linux.intel.com> wrote:
> > > I need an Ack from tools/power maintainer(s) for this.
> > > Also see below.
> > 
> > MAINTAINER file doesn't call for any special name in this folder.
> 
> And this tells me perhaps this driver needs a MAINTAINER record?
I will submit a MAINTAINER file update. I was waiting for reviews.

Thanks,
Srinivas

> 
> > $./scripts/get_maintainer.pl 0010-tools-power-x86-A-tool-to-
> > validate-
> > Intel-Speed-Selec.patch
> > Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> > (commit_signer:1/1=100%,authored:1/1=100%,added_lines:31/31=100%,ad
> > ded_
> > lines:231/231=100%,added_lines:1607/1607=100%,added_lines:721/721=1
> > 00%,
> > added_lines:479/479=100%)
> > linux-kernel@vger.kernel.org (open list)
> > 
> > Len and Rafael can you ACK this tool patch?
> 
> 
