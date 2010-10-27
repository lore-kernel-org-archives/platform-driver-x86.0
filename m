From: Corentin Chary <corentin.chary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: drivers/platform/x86:
	Backlight-Add-backlight-type-v2.patch
Date: Wed, 27 Oct 2010 13:39:10 +0200
Message-ID: <AANLkTi=NcpzcUv8jx5_NYxxBp8y0F2-Uh8aCCacb-ZWN@mail.gmail.com>
References: <AANLkTikwo++xG7SXzNPwmZgU2jbdLiMr0Wi+vaxFqb7o@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <AANLkTikwo++xG7SXzNPwmZgU2jbdLiMr0Wi+vaxFqb7o-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=acpi4asus-user>
List-Post: <mailto:acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: sedat.dilek-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel-otUistvHUpPR7s880joybQ@public.gmane.org>, acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DRI <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Oct 27, 2010 at 1:06 PM, Sedat Dilek <sedat.dilek-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> Hi,
>
> while testing linux-next I wanted to reactivate the backlight type
> patches laying in my build-dir.
>
> Within 2.6.36-rcX cycle I had successfully tested the backlight type
> patch [1] with an additional patch for radeon by Michel (posted to
> dri-devel ML, see [2]).
>
> The main patch needs a little refreshing.
>
> v2: drivers/platform/x86/asus-laptop.c: Refreshed to fit linux-next
> (next-20101027)
>
>
> Kind Regards,
> - Sedat -
>
> [1] https://patchwork.kernel.org/patch/163971/
> [2] https://patchwork.kernel.org/patch/182352/
>

Hi,

I think rfkill has the same problem, on some platforms, the platform
driver will add a rfkill switch, but the network (wlan/wimax/whatever)
driver may also add one. AFAIK, the platform one is more likely to be
able to power down the device completly.

For the current patch, a common pattern seems to be : video/ -> RAW,
platform/ -> PLATFORM. Couldn't we make some guess by checking the
parent of the backlight instead of doing this by hand for every
drivers ?

Thanks,

-- 
Corentin Chary
http://xf.iksaif.net

------------------------------------------------------------------------------
Nokia and AT&T present the 2010 Calling All Innovators-North America contest
Create new apps & games for the Nokia N8 for consumers in  U.S. and Canada
$10 million total in prizes - $4M cash, 500 devices, nearly $6M in marketing
Develop with Nokia Qt SDK, Web Runtime, or Java and Publish to Ovi Store 
http://p.sf.net/sfu/nokia-dev2dev
