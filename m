From: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 08/11] apple-gmux: Add support for the switch_ddc callback
Date: Mon, 2 Jun 2014 10:35:47 -0400
Message-ID: <CADnq5_PrQM2PbNkAb+nf7shgk1jQTjjzya02EvhME9uO+LPxiA@mail.gmail.com>
References: <1401640723-2058-1-git-send-email-matthew.garrett@nebula.com>
	<1401640723-2058-9-git-send-email-matthew.garrett@nebula.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qg0-f51.google.com ([209.85.192.51]:63708 "EHLO
	mail-qg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755007AbaFBOfs (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 2 Jun 2014 10:35:48 -0400
Received: by mail-qg0-f51.google.com with SMTP id q107so10658801qgd.24
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 Jun 2014 07:35:47 -0700 (PDT)
In-Reply-To: <1401640723-2058-9-git-send-email-matthew.garrett@nebula.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: Dave Airlie <airlied@gmail.com>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, platform-driver-x86@vger.kernel.org

On Sun, Jun 1, 2014 at 12:38 PM, Matthew Garrett
<matthew.garrett@nebula.com> wrote:
> We can switch DDC pins in a way that ought (with luck) to work for LVDS.
> This isn't sufficient for eDP, which is addressed in later patches.
>
> Signed-off-by: Matthew Garrett <matthew.garrett@nebula.com>

FWIW, on AMD muxed PX systems, there are separate muxes for ddc/hpd
and data lines so it would be trivial to implement there as well.

Alex

> ---
>  drivers/platform/x86/apple-gmux.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
> index b9429fb..5594cbc 100644
> --- a/drivers/platform/x86/apple-gmux.c
> +++ b/drivers/platform/x86/apple-gmux.c
> @@ -271,6 +271,16 @@ static const struct backlight_ops gmux_bl_ops = {
>         .update_status = gmux_update_status,
>  };
>
> +static int gmux_switch_ddc(enum vga_switcheroo_client_id id)
> +{
> +       if (id == VGA_SWITCHEROO_IGD)
> +               gmux_write8(apple_gmux_data, GMUX_PORT_SWITCH_DDC, 1);
> +       else
> +               gmux_write8(apple_gmux_data, GMUX_PORT_SWITCH_DDC, 2);
> +
> +       return 0;
> +}
> +
>  static int gmux_switchto(enum vga_switcheroo_client_id id)
>  {
>         if (id == VGA_SWITCHEROO_IGD) {
> @@ -346,6 +356,7 @@ gmux_active_client(struct apple_gmux_data *gmux_data)
>
>  static struct vga_switcheroo_handler gmux_handler = {
>         .switchto = gmux_switchto,
> +       .switch_ddc = gmux_switch_ddc,
>         .power_state = gmux_set_power_state,
>         .get_client_id = gmux_get_client_id,
>  };
> --
> 1.8.5.3
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
