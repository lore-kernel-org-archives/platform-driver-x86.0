From: Corentin Chary <corentincj@iksaif.net>
Subject: Re: [PATCH] samsung-laptop: Add quirk for broken acpi_video backlight
 on N250P
Date: Sun, 9 Dec 2012 10:44:55 +0000
Message-ID: <CAHR064ixLaUnh7YCXJxa0NOzV63RsUG_mNQnPW0WVkCz5O3Tig@mail.gmail.com>
References: <1354745313-22247-1-git-send-email-seth.forshee@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:34955 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758326Ab2LIKo5 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 9 Dec 2012 05:44:57 -0500
Received: by mail-bk0-f46.google.com with SMTP id q16so701662bkw.19
        for <platform-driver-x86@vger.kernel.org>; Sun, 09 Dec 2012 02:44:55 -0800 (PST)
In-Reply-To: <1354745313-22247-1-git-send-email-seth.forshee@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Seth Forshee <seth.forshee@canonical.com>, Matthew Garrett <mjg59@srcf.ucam.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

Acked-By: Corentin Chary <corentin.chary@gmail.com>

Matthew could you merge this one too ?
Thanks,

On Wed, Dec 5, 2012 at 10:08 PM, Seth Forshee
<seth.forshee@canonical.com> wrote:
> BugLink: http://bugs.launchpad.net/bugs/1086921
> Cc: stable@vger.kernel.org # v3.4+
> Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
> ---
>  drivers/platform/x86/samsung-laptop.c |   10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
> index dd90d15..71623a2 100644
> --- a/drivers/platform/x86/samsung-laptop.c
> +++ b/drivers/platform/x86/samsung-laptop.c
> @@ -1523,6 +1523,16 @@ static struct dmi_system_id __initdata samsung_dmi_table[] = {
>                 },
>          .driver_data = &samsung_broken_acpi_video,
>         },
> +       {
> +        .callback = samsung_dmi_matched,
> +        .ident = "N250P",
> +        .matches = {
> +               DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
> +               DMI_MATCH(DMI_PRODUCT_NAME, "N250P"),
> +               DMI_MATCH(DMI_BOARD_NAME, "N250P"),
> +               },
> +        .driver_data = &samsung_broken_acpi_video,
> +       },
>         { },
>  };
>  MODULE_DEVICE_TABLE(dmi, samsung_dmi_table);
> --
> 1.7.9.5
>



-- 
Corentin Chary
http://xf.iksaif.net
