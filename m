From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] platform/x86: ideapad-laptop: Squelch ACPI event 1
Date: Tue, 23 May 2017 19:37:12 +0300
Message-ID: <CAHp75VefTZv+De3TU4bQMBND5wiYNmU5AHLD+ibhS0vL7f=wAw@mail.gmail.com>
References: <7a7642d7-846e-9ead-a8d0-d10d7f85158b@angelsl.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:34012 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935211AbdEWQhO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 May 2017 12:37:14 -0400
In-Reply-To: <7a7642d7-846e-9ead-a8d0-d10d7f85158b@angelsl.xyz>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hao Wei Tee <angelsl@angelsl.xyz>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Ike Panhc <ike.pan@canonical.com>

On Mon, May 22, 2017 at 1:38 PM, Hao Wei Tee <angelsl@angelsl.xyz> wrote:
> Don't simply throw this to userspace via the sparse_keymap (which does not
> have a mapping for scancode 1), as this causes KEY_UNKNOWN to be emitted,
> which is a nuisance and of no use at all (it is not the right way to expose
> this ACPI event to userspace, anyway, and the original intention of the commit
> which added this (cfee5d63767b2e7997c1f36420d008abbe61565c) was only to suppress
> an unhandled event log message).
>

Pushed to testing, thanks.

> Signed-off-by: Hao Wei Tee <angelsl@angelsl.xyz>
> ---
>  drivers/platform/x86/ideapad-laptop.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 24ca9fbe31cc..998da7b4cd8e 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -810,7 +810,6 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
>                         case 8:
>                         case 7:
>                         case 6:
> -                       case 1:
>                                 ideapad_input_report(priv, vpc_bit);
>                                 break;
>                         case 5:
> @@ -828,6 +827,13 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
>                         case 0:
>                                 ideapad_check_special_buttons(priv);
>                                 break;
> +                       case 1:
> +                               /* Some IdeaPads report event 1 every ~20
> +                                * seconds while on battery power; some
> +                                * report this when changing to/from tablet
> +                                * mode. Squelch this event.
> +                                */
> +                               break;
>                         default:
>                                 pr_info("Unknown event: %lu\n", vpc_bit);
>                         }
> --
> 2.13.0
>



-- 
With Best Regards,
Andy Shevchenko
