From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH v3 0/4] fujitsu_init() cleanup
Date: Fri, 10 Mar 2017 21:04:52 +1030
Message-ID: <20170310103452.GA21396@marvin.atrad.com.au>
References: <20170307101516.9852-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170307101516.9852-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Mar 07, 2017 at 11:15:12AM +0100, Micha?? K??pie?? wrote:
> These patches should make fujitsu_init() a bit more palatable.  No
> changes are made to platform device code yet, for clarity these will be
> posted in a separate series after this one gets applied.
> 
> Changes from v2:
> 
>   - Patch 2/4 from v2 did not work as expected and was thus replaced
>     with a rebased version of patch 3/4 from v1.
> 
>   - Added a check in patch 3/4 to prevent a NULL dereference when
>     ACPI device FUJ02B1 is not present and ACPI device FUJ02E3 is.
> 
> Changes from v1:
> 
>   - Rebase on top of reworked Alan Jenkins' cleanup patch series.
> 
>   - Drop patch 1/4 from v1 as it has already been applied in reworked
>     Alan Jenkins' cleanup patch series.
> 
>   - Patch 3/4 from v1 has been replaced with a completely different one
>     (patch 2/4).  It needs to be tested on a relevant machine as it is
>     based purely on a dump of a DSDT table (further details can be found
>     in the patch itself).
> 
>   - Patch 3/4 in v2 is a rebased version of patch 8/10 from the reworked
>     Alan Jenkins' cleanup patch series.  Patch 2/4 from v2 (the one
>     mentioned in the previous bullet point) ensures this one can be
>     safely applied without causing a NULL dereference under any
>     circumstances.
> 
>  drivers/platform/x86/fujitsu-laptop.c | 98 ++++++++++++++++++-----------------
>  1 file changed, 50 insertions(+), 48 deletions(-)

Having tested this V3 patch series on an S7020 I can confirm that there are
no key functional regressions with respect to the module components utilised
by this model: the bl_power and brightness controls work in the same way as
they have in the past.

My backlight control scripts failed because the attribute path they expected
(/sys/devices/virtual/backlight/fujitsu-laptop/) did not exist.  Instead
this patch creates /sys/devices/virtual/backlight/fujitsu_laptop/, the
difference being an underscore instead of a hyphen.  This API regression was
caused by the introduction of KBUILD_MODNAME to replace the literal
"fujitsu-laptop" in patch 1/4.  While it would be nice to use KBUILD_MODNAME
instead of the string literal, doing so does constitute a userspace API
breakage which is best avoided.  I therefore suggest KBUILD_MODNAME be
replaced with "fujitsu-laptop" in patch 1/4.

If the above substitution is made in patch 1/4 I am happy to see this series
applied.  It represents a further worthwhile improvement to the
fujitsu-laptop driver which will facilitate future maintenance and provide a
more consistent basis for upcoming improvements.

Tested-by: Jonathan Woithe <jwoithe@just42.net>
Reviewed-by: Jonathan Woithe <jwoithe@just42.net>

Regards
  jonathan
