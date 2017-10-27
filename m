From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: silead_dmi: Fix GP-electronic T701 entry
Date: Fri, 27 Oct 2017 19:48:25 +0300
Message-ID: <CAHp75VeAKSjFCEUoJWc6BmZiu70HS4Exw0p2=qwC2B09i9CwOg@mail.gmail.com>
References: <20171019074414.16335-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:51233 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750962AbdJ0Qs0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 27 Oct 2017 12:48:26 -0400
In-Reply-To: <20171019074414.16335-1-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Oct 19, 2017 at 10:44 AM, Hans de Goede <hdegoede@redhat.com> wrote:
> The GP-electronic T701 has its LCD panel mounted upside-down, initially
> my plan was to fix this by transparently rotating the image in the i915
> driver (my "drm/i915: Deal with upside-down mounted LCD" patch), but
> that approach has been rejected instead the kernel will now export
> a "panel orientation" property on the drm-connector for the panel and
> let userspace deal with it.
>
> But userspace expects the touchscreen coordinates to match the panel
> coordinates *before* applying any rotation, so now that we no longer hide
> the upside-down-ness of the LCD panel from userspace the coordinates being
> generated are wrong and we need to apply a rotation of 180 degrees to the
> coordinates to fix this.
>

Pushed to my review and testing queue, thanks!

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/silead_dmi.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/platform/x86/silead_dmi.c b/drivers/platform/x86/silead_dmi.c
> index a0f80f971081..ac304f2318cc 100644
> --- a/drivers/platform/x86/silead_dmi.c
> +++ b/drivers/platform/x86/silead_dmi.c
> @@ -85,6 +85,8 @@ static const struct silead_ts_dmi_data surftab_wintron70_st70416_6_data = {
>  static const struct property_entry gp_electronic_t701_props[] = {
>         PROPERTY_ENTRY_U32("touchscreen-size-x", 960),
>         PROPERTY_ENTRY_U32("touchscreen-size-y", 640),
> +       PROPERTY_ENTRY_BOOL("touchscreen-inverted-x"),
> +       PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
>         PROPERTY_ENTRY_STRING("firmware-name",
>                               "gsl1680-gp-electronic-t701.fw"),
>         { }
> --
> 2.14.2
>



-- 
With Best Regards,
Andy Shevchenko
