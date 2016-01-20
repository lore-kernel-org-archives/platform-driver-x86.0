From: Josh Boyer <jwboyer@fedoraproject.org>
Subject: Re: [PATCH] ideapad-laptop: Add Lenovo Yoga 700 to no_hw_rfkill dmi list
Date: Wed, 20 Jan 2016 09:18:10 -0500
Message-ID: <CA+5PVA67NAQZtrR0N4p7XVqQ6iBXYYyXebFEmwiw-ebcsDez2A@mail.gmail.com>
References: <1453145573-15600-1-git-send-email-jwboyer@fedoraproject.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vk0-f54.google.com ([209.85.213.54]:33890 "EHLO
	mail-vk0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932261AbcATOSL (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 20 Jan 2016 09:18:11 -0500
In-Reply-To: <1453145573-15600-1-git-send-email-jwboyer@fedoraproject.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Ike Panhc <ike.pan@canonical.com>, platform-driver-x86@vger.kernel.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>

On Mon, Jan 18, 2016 at 2:32 PM, Josh Boyer <jwboyer@fedoraproject.org> wrote:
> Like the Yoga 900 models the Lenovo Yoga 700 does not have a
> hw rfkill switch, and trying to read the hw rfkill switch through the
> ideapad module causes it to always reported blocking breaking wifi.
>
> This commit adds the Lenovo Yoga 700 to the no_hw_rfkill dmi list, fixing
> the wifi breakage.
>
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1295272
> Tested-by: <dinyar.rabady+spam@gmail.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Josh Boyer <jwboyer@fedoraproject.org>
> ---
>
> This applies to the for-next branch of the platform-x86-drivers tree

Just another note that this is actually a new separate entry.  The
changelog and DMI information look similar to the patch that was just
merged into Linus' tree, but they are different.  This patch isn't a
resend.

josh

>
>
>  drivers/platform/x86/ideapad-laptop.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index d28db0e793df..51178626305d 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -900,6 +900,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
>                 },
>         },
>         {
> +               .ident = "Lenogo Yoga 700",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo YOGA 700"),
> +               },
> +       },
> +       {
>                 .ident = "Lenovo Yoga 900",
>                 .matches = {
>                         DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> --
> 2.5.0
>
