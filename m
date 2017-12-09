From: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH 2/2] platform/x86: wmi: Allow creating WMI devices with
 the same GUID
Date: Sat, 9 Dec 2017 12:43:53 -0800
Message-ID: <CALCETrUucweyaCVTurhAmcWPhU9nk+GNzmJNzi0qv8vgLPBdrA@mail.gmail.com>
References: <1512786861-1014-1-git-send-email-mario.limonciello@dell.com> <1512786861-1014-3-git-send-email-mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:49040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751115AbdLIUoP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 9 Dec 2017 15:44:15 -0500
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com [209.85.214.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B612D2191B
        for <platform-driver-x86@vger.kernel.org>; Sat,  9 Dec 2017 20:44:14 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id z6so9385949iti.4
        for <platform-driver-x86@vger.kernel.org>; Sat, 09 Dec 2017 12:44:14 -0800 (PST)
In-Reply-To: <1512786861-1014-3-git-send-email-mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>

On Fri, Dec 8, 2017 at 6:34 PM, Mario Limonciello
<mario.limonciello@dell.com> wrote:
> In: commit d1f9e4970742 ("ACPI: WMI: Survive BIOS with duplicate GUIDs")
> parsing two of the same GUID was prevented in the WMI bus driver.
>
> At the time no one understood why GUID 05901221-D566-11D1-B2F0-00A0C9062910
> was being duplicated.  It's now known that GUID is used for the binary
> MOF file of a _WDG entry in the ASL.  It's entirely possible for multiple
> _WDG entries and for multiple instances to bind in a given driver.
>
> NOTE:
> The only known instance of duplicated GUID's is the WMI BMOF GUID above,
> but it is possible that other vendors may duplicate GUIDs as well. It
> would be better for drivers to not interact with the WMI bus by GUID
> string but by the struct wmi_device provided by the WMI bus during
> probing.

I think you also need to audit all the users of wmi_block_list for
duplicate handling.  For example, wmi_install_notify_handler()
probably needs a break statement inside the if (memcmp(...)).

>
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> ---
>  drivers/platform/x86/wmi.c | 31 -------------------------------
>  1 file changed, 31 deletions(-)
>
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index 45d9010aafcf..5ac17e360fa2 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -1102,28 +1102,6 @@ static void wmi_free_devices(struct acpi_device *device)
>         }
>  }
>
> -static bool guid_already_parsed(struct acpi_device *device,
> -                               const u8 *guid)
> -{
> -       struct wmi_block *wblock;
> -
> -       list_for_each_entry(wblock, &wmi_block_list, list) {
> -               if (memcmp(wblock->gblock.guid, guid, 16) == 0) {
> -                       /*
> -                        * Because we historically didn't track the relationship
> -                        * between GUIDs and ACPI nodes, we don't know whether
> -                        * we need to suppress GUIDs that are unique on a
> -                        * given node but duplicated across nodes.
> -                        */
> -                       dev_warn(&device->dev, "duplicate WMI GUID %pUL (first instance was on %s)\n",
> -                                guid, dev_name(&wblock->acpi_device->dev));
> -                       return true;
> -               }
> -       }
> -
> -       return false;
> -}
> -
>  /*
>   * Parse the _WDG method for the GUID data blocks
>   */
> @@ -1157,15 +1135,6 @@ static int parse_wdg(struct device *wmi_bus_dev, struct acpi_device *device)
>                 if (debug_dump_wdg)
>                         wmi_dump_wdg(&gblock[i]);
>
> -               /*
> -                * Some WMI devices, like those for nVidia hooks, have a
> -                * duplicate GUID. It's not clear what we should do in this
> -                * case yet, so for now, we'll just ignore the duplicate
> -                * for device creation.
> -                */
> -               if (guid_already_parsed(device, gblock[i].guid))
> -                       continue;
> -
>                 wblock = kzalloc(sizeof(struct wmi_block), GFP_KERNEL);
>                 if (!wblock) {
>                         retval = -ENOMEM;
> --
> 2.14.1
>
