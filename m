From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH] intel-hid: Fix build failure when CONFIG_INTEL_HID_EVENT=m
Date: Thu, 31 Dec 2015 04:28:08 -0800
Message-ID: <CALCETrVnyMgKGwPPn2Tp7gy_=y7jeXN-oFJOKW8ZXvdds_LtFA@mail.gmail.com>
References: <1451559413-30977-1-git-send-email-sedat.dilek@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:33305 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750991AbbLaM22 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 31 Dec 2015 07:28:28 -0500
Received: by mail-oi0-f46.google.com with SMTP id y66so215415260oig.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 31 Dec 2015 04:28:28 -0800 (PST)
In-Reply-To: <1451559413-30977-1-git-send-email-sedat.dilek@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org
Cc: Alex Hung <alex.hung@canonical.com>, Andy Lutomirski <luto@kernel.org>

Hi Darren-

It looks like your tree will need this fix.

Thanks,
Andy

On Thu, Dec 31, 2015 at 2:56 AM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
> When building with CONFIG_INTEL_HID_EVENT=m on Andy's luto.git#xps13
> Git branch I see the following build failure:
>
> ERROR: "sparse_keymap_setup" [drivers/platform/x86/intel-hid.ko] undefined!
> ERROR: "sparse_keymap_report_event" [drivers/platform/x86/intel-hid.ko] undefined!
>
> Looks like 'select INPUT_SPARSEKMAP' is missing.
>
> Fixes: e06871da47db ("intel-hid: new hid event driver for hotkeys")
> CC: Alex Hung <alex.hung@canonical.com>
> CC: Andy Lutomirski <luto@kernel.org>
> Signed-off-by: Sedat Dilek <sedat.dilek@gmail.com>
> ---
>  drivers/platform/x86/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 96a4f18a1c35..ee0ff9287159 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -747,6 +747,7 @@ config INTEL_HID_EVENT
>         tristate "INTEL HID Event Filter"
>         depends on ACPI
>         depends on INPUT
> +       select INPUT_SPARSEKMAP
>         help
>          This driver provides supports for Intel HID event. Some laptops
>          require this driver for hotkey supports.
> --
> 2.6.4
>



-- 
Andy Lutomirski
AMA Capital Management, LLC
