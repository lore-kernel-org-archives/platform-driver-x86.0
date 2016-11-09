From: Daniel Martin <consume.noise-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/3] thinkpad_acpi: Move tablet
	detection into separate function
Date: Wed, 9 Nov 2016 12:10:20 +0100
Message-ID: <CADscph3VdmG4UQF+6=2jDR3DtStR+f=zsaOURSXH_U4RMp0ntQ@mail.gmail.com>
References: <1478538633-11450-1-git-send-email-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <1478538633-11450-1-git-send-email-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Lyude <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

Sorry, I didn't had the time to look at the patches earlier.

Now, I did and was wondering why hotkey_tablet_mode doesn't show up in
sysfs anymore ...

On 7 November 2016 at 18:10, Lyude <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> @@ -3464,17 +3495,6 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>                 res = add_to_attr_set(hotkey_dev_attributes,
>                                 &dev_attr_hotkey_radio_sw.attr);
>
> -       /* For X41t, X60t, X61t Tablets... */
> -       if (!res && acpi_evalf(hkey_handle, &status, "MHKG", "qd")) {
> -               tp_features.hotkey_tablet = 1;
> -               tabletsw_state = !!(status & TP_HOTKEY_TABLET_MASK);
> -               pr_info("possible tablet mode switch found; "
> -                       "ThinkPad in %s mode\n",
> -                       (tabletsw_state) ? "tablet" : "laptop");
> -               res = add_to_attr_set(hotkey_dev_attributes,
> -                               &dev_attr_hotkey_tablet_mode.attr);
> -       }
> -
>         if (!res)
>                 res = register_attr_set_with_sysfs(
>                                 hotkey_dev_attributes,
> @@ -3482,6 +3502,12 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>         if (res)
>                 goto err_exit;
>
> +       res = hotkey_init_tablet_mode();
> +       if (res < 0)
> +               goto err_exit;
> +
> +       tabletsw_state = res;
> +
>         /* Set up key map */
>         hotkey_keycode_map = kmalloc(TPACPI_HOTKEY_MAP_SIZE,
>                                         GFP_KERNEL);
> --
> 2.7.4
>

This block has to be before register_attr_set_with_sysfs().

With that fixed and a small patch (will be sent soon) on top it works
on my Yoga 260, so:
Tested-by: Daniel Martin <consume.noise-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

------------------------------------------------------------------------------
Developer Access Program for Intel Xeon Phi Processors
Access to Intel Xeon Phi processor-based developer platforms.
With one year of Intel Parallel Studio XE.
Training and support from Colfax.
Order your platform today. http://sdm.link/xeonphi
