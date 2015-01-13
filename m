From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] samsung-laptop: Add use_native_backlight quirk, and
 enable it on some models
Date: Mon, 12 Jan 2015 20:03:09 -0800
Message-ID: <20150113040308.GA98306@vmdeb7>
References: <1420812601-7983-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1420812601-7983-1-git-send-email-hdegoede@redhat.com>
Sender: stable-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: stable@vger.kernel.org, platform-driver-x86@vger.kernel.org, Bertrik Sikken <bertrik@sikken.nl>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jan 09, 2015 at 03:10:01PM +0100, Hans de Goede wrote:
> Since kernel 3.14 the backlight control has been broken on various Samsung
> Atom based netbooks. This has been bisected and this problem happens since
> commit b35684b8fa94 ("drm/i915: do full backlight setup at enable time")
> 
> This has been reported and discussed in detail here:
> http://lists.freedesktop.org/archives/intel-gfx/2014-July/049395.html
> 
> Unfortunately no-one has been able to fix this. This only affects Samsung
> Atom netbooks, and the Linux kernel and the BIOS of those laptops have never
> worked well together. All affected laptops already have a quirk to avoid using
> the standard acpi-video interface and instead use the samsung specific SABI
> interface which samsung-laptop uses. It seems that recent fixes to the i915
> driver have also broken backlight control through the SABI interface.
> 
> The intel_backlight driver OTOH works fine, and also allows for finer grained
> backlight control. So add a new use_native_backlight quirk, and replace the
> broken_acpi_video quirk with this quirk for affected models. This new quirk
> disables acpi-video as before and also stops samsung-laptop from registering


I take this to me this quirk is broken_acpi_video && use_native_backlight.


> the SABI based samsung_laptop backlight interface, leaving only the working
> intel_backlight interface.
> 
> This commit enables this new quirk for 3 models which are known to be affected,
> chances are that it needs to be used on other models too.
> 
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1094948 # N145P
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1115713 # N250P
> Reported-by: Bertrik Sikken <bertrik@sikken.nl> # N150P
> Cc: stable@vger.kernel.org # 3.16
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/samsung-laptop.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
> index ff765d8..ce364a4 100644
> --- a/drivers/platform/x86/samsung-laptop.c
> +++ b/drivers/platform/x86/samsung-laptop.c
> @@ -353,6 +353,7 @@ struct samsung_quirks {
>  	bool broken_acpi_video;
>  	bool four_kbd_backlight_levels;
>  	bool enable_kbd_backlight;
> +	bool use_native_backlight;
>  };
>  
>  static struct samsung_quirks samsung_unknown = {};
> @@ -361,6 +362,10 @@ static struct samsung_quirks samsung_broken_acpi_video = {
>  	.broken_acpi_video = true,
>  };
>  
> +static struct samsung_quirks samsung_use_native_backlight = {
> +	.use_native_backlight = true,

Shouldn't this also set:

	.broken_acpi_video = true,
?

That's what I understood from the commit log.

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
