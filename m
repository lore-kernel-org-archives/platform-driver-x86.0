From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 0/5] tools/power/x86/intel-speed-select: New command and
Date: Sat, 14 Sep 2019 22:48:35 +0300
Message-ID: <CAHp75VeE+Z+KQOOvYgD+3-MsRTe7WPnxPTyTtQrLdQ8mQ=6y4Q@mail.gmail.com>
References: <20190914070513.19807-1-srinivas.pandruvada@linux.intel.com>
 <20190914171950.GW2680@smile.fi.intel.com> <85876cd057ff5f871dd830ff19a6e32c83e8e344.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <85876cd057ff5f871dd830ff19a6e32c83e8e344.camel@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Prarit Bhargava <prarit@redhat.com>, David Arcari <darcari@redhat.com>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Sep 14, 2019 at 10:22 PM Srinivas Pandruvada
<srinivas.pandruvada@linux.intel.com> wrote:
>
> On Sat, 2019-09-14 at 20:19 +0300, Andy Shevchenko wrote:
> > On Sat, Sep 14, 2019 at 12:05:08AM -0700, Srinivas Pandruvada wrote:
> > > This series contains some minor fixes, when firmware mask is
> > > including
> > > invalid CPU in the perf-profile mask. Also add some commands to
> > > better manage core-power feature.
> >
> > Hmm... 150+ LOCs doesn't count to me as minor fixes.
> > So, are you considering this a material for v5.4?
> Sorry, I should be clear. It is for 5.4. I am trying to catch merge
> window. None of the fixes are critical. The majority of the code is
> added for new command features.
>
> What is your cut off for 5.4? I want to send some more features if
> possible for 5.4.

First PR already had been sent to Linus.

-- 
With Best Regards,
Andy Shevchenko
