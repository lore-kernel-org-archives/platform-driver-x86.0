From: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
Subject: Re: [PATCH v4] thinkpad_acpi: Add support for dual
 fan control on select models
Date: Thu, 30 Apr 2020 18:40:41 -0300
Message-ID: <20200430214041.GA28186@khazad-dum.debian.net>
References: <20200423165457.54388-1-larsh@apache.org>
 <20200423215709.72993-1-larsh@apache.org>
 <11041815.WYjWQN8m1R@lenovodario>
 <CAM_y6qhV6r9BVE6Uibn=xpDZRYuhZDBBgfHT8fMECNS1DyaQwQ@mail.gmail.com>
 <1605997626.1278142.1588119634625@mail.yahoo.com>
 <91feeffa-1f48-347a-fb90-7bf733647476@kpanic.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <91feeffa-1f48-347a-fb90-7bf733647476-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Stefan Assmann <sassmann-llIHtaV5axyzQB+pC5nmwQ@public.gmane.org>
Cc: agk-mA9ux5SlULTR7s880joybQ@public.gmane.org, kjslag-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Dario Messina <nanodario-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, civic9 <civic9-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bastidoerner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "larsh-1oDqGaOF3Lkdnm+yROfE0A@public.gmane.org" <larsh-1oDqGaOF3Lkdnm+yROfE0A@public.gmane.org>, arc-e1Wt+8K1Ta8ZEwqihLH0+Q@public.gmane.org, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, 29 Apr 2020, Stefan Assmann wrote:
> On 29.04.20 02:20, larsh-1oDqGaOF3Lkdnm+yROfE0A@public.gmane.org wrote:
> > Do you have a use case for that behavior?
> > 
> > The previous patch broke the /proc interface, didn't not work with the current version of thinkfan
> > (but a a version with multi-fan support is in the works), and it had hard to track internal mutable state.
> > 
> > The proposed change is clean on all these fronts.
> > 
> > I'm not a fan of surprising the user with unnecessarily complex behavior (but perhaps this can be added as an option in the future.)
> 
> I concur to keep the patch as is. Any additional functionality could be
> added later on, if deemed necessary.

Yes, but let's avoid changing exposed APIs as much as possible...

Anyway, the correct interface *when exposing both fans* is:

1. Use the "hwmon" sysfs interface to expose each fan separately, and
control them separately.

1a. it is quite acceptable to control them in group by default, and have
a module parameter to select grouped, or separate behavior.

2. /proc/acpi/ibm/fan shall control both of them at the same time, and
report data from the first fan.  THIS INTERFACE IS FROZEN, LET'S NOT
MESS WITH IT.

Also, "fail-safe" for this is to have the two fans on automatic, and to
enable both fans.

All of that said, *it is very much acceptable* to merge a first set of
patches that controls both fans simultaneously and exposes the fan group
as if it were just the main fan, and later improve on the patch to
expose the second fan separately (provided safe group behavior is
maintained, see above).

-- 
  Henrique Holschuh
