From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] hp_wireless: remove unused header files
Date: Thu, 18 Jun 2015 14:56:20 -0700
Message-ID: <20150618215620.GD121898@vmdeb7>
References: <1433928387-2818-1-git-send-email-alex.hung@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:47356 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753513AbbFRV4V (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 18 Jun 2015 17:56:21 -0400
Content-Disposition: inline
In-Reply-To: <1433928387-2818-1-git-send-email-alex.hung@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: platform-driver-x86@vger.kernel.org

On Wed, Jun 10, 2015 at 05:26:27PM +0800, Alex Hung wrote:

No commit message again.

If you feel there is nothing to say in the commit message, do a git log search
for similar patches for examples of what is relevant. (There are several for
removing unused header files)

Please don't send another like this.

> Signed-off-by: Alex Hung <alex.hung@canonical.com>
> ---
>  drivers/platform/x86/hp-wireless.c |    3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp-wireless.c b/drivers/platform/x86/hp-wireless.c
> index 4e4cc8b..731c69b 100644
> --- a/drivers/platform/x86/hp-wireless.c
> +++ b/drivers/platform/x86/hp-wireless.c
> @@ -18,11 +18,8 @@
>   *  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
>   */
>  
> -#include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/init.h>
>  #include <linux/input.h>
> -#include <linux/platform_device.h>
>  #include <linux/acpi.h>
>  #include <acpi/acpi_bus.h>
>  

What was your motivation here? Did you observe a change in the driver? A
subsystem? Run a tool?

Note that acpi.h also includes acpi/acpi_bus.h, so it isn't strictly
necessary either.

Please explain your motivation and rationale. If it's worth preparing, building,
and testing, it's worth documenting.

-- 
Darren Hart
Intel Open Source Technology Center
