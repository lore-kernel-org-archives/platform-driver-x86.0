From: Alex Hung <alex.hung@canonical.com>
Subject: Re: [PATCH] intel-hid: Fix build failure when CONFIG_INTEL_HID_EVENT=m
Date: Mon, 4 Jan 2016 13:56:59 +0800
Message-ID: <CAJ=jquYYhMMMpiBjTAx_08Rzm=4sTZKrg6b84wu8bGV8O=xwdg@mail.gmail.com>
References: <8c329ffac51276860bff1911a0f257dd108ee5e8.1451832665.git.luto@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:33131 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751349AbcADF5B (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Jan 2016 00:57:01 -0500
Received: by mail-lb0-f173.google.com with SMTP id sv6so146140110lbb.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 03 Jan 2016 21:57:00 -0800 (PST)
In-Reply-To: <8c329ffac51276860bff1911a0f257dd108ee5e8.1451832665.git.luto@kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Sedat Dilek <sedat.dilek@gmail.com>

It seems that I have "INPUT_SPARSEKMAP" in my .config and therefore I
did not have any problems when compiling the kernel with previous
patch.

I tried this patch and it works fine for me.

Tested-by: Alex Hung <alex.hung@canonical.com>

On Sun, Jan 3, 2016 at 10:54 PM, Andy Lutomirski <luto@kernel.org> wrote:
> From: Sedat Dilek <sedat.dilek@gmail.com>
>
> When building with CONFIG_INTEL_HID_EVENT=m on Andy's luto.git#xps13
> Git branch I see the following build failure:
>
> ERROR: "sparse_keymap_setup" [drivers/platform/x86/intel-hid.ko] undefined!
> ERROR: "sparse_keymap_report_event" [drivers/platform/x86/intel-hid.ko] undefined!
>
> Looks like 'select INPUT_SPARSEKMAP' is missing.
>
> Fixes: cd8d25841a65 ("intel-hid: new hid event driver for hotkeys")
> [andy: fixed commit hash above]
> CC: Alex Hung <alex.hung@canonical.com>
> CC: Andy Lutomirski <luto@kernel.org>
> Signed-off-by: Sedat Dilek <sedat.dilek@gmail.com>
> Signed-off-by: Andy Lutomirski <luto@kernel.org>
> ---
>
> Hi Alex and Darren-
>
> I'm relaying this fix from Sedat with a trivial correction.
>
> drivers/platform/x86/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index d0bfcf8e8b8e..9d7704e51366 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -736,6 +736,7 @@ config INTEL_HID_EVENT
>         tristate "INTEL HID Event"
>         depends on ACPI
>         depends on INPUT
> +       select INPUT_SPARSEKMAP
>         help
>           This driver provides support for the Intel HID Event hotkey interface.
>           Some laptops require this driver for hotkey support.
> --
> 2.5.0
>



-- 
Cheers,
Alex Hung
