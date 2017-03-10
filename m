From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH v4 0/4] fujitsu_init() cleanup
Date: Fri, 10 Mar 2017 21:32:00 +1030
Message-ID: <20170310110200.GC21396@marvin.atrad.com.au>
References: <20170310105036.26899-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170310105036.26899-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Mar 10, 2017 at 11:50:32AM +0100, Micha?? K??pie?? wrote:
> These patches should make fujitsu_init() a bit more palatable.  No
> changes are made to platform device code yet, for clarity these will be
> posted in a separate series after this one gets applied.
> 
> Changes from v3:
> 
>   - Do not use KBUILD_MODNAME as backlight device name as it breaks
>     userspace interface ("fujitsu-laptop" vs. "fujitsu_laptop").
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

As noted, this V4 patch series is identical to V3 except for the backlight
device name fix.  No regressions are evident on the hardware I have (S7020). 
I am therefore happy to see this series applied.  It represents a further
worthwhile improvement to the fujitsu-laptop driver which will facilitate
future maintenance and provide a more consistent basis for upcoming
improvements.

Tested-by: Jonathan Woithe <jwoithe@just42.net>
Reviewed-by: Jonathan Woithe <jwoithe@just42.net>

Regards
  jonathan
