From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [PATCH] intel-hid: Fix build failure when CONFIG_INTEL_HID_EVENT=m
Date: Mon, 4 Jan 2016 07:34:02 +0100
Message-ID: <CA+icZUU1hLY=k4hWvLyoitbtkXgEZuZo1Y0G8J94x+ZEwUfa1w@mail.gmail.com>
References: <8c329ffac51276860bff1911a0f257dd108ee5e8.1451832665.git.luto@kernel.org>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vk0-f51.google.com ([209.85.213.51]:33221 "EHLO
	mail-vk0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751268AbcADGeE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Jan 2016 01:34:04 -0500
Received: by mail-vk0-f51.google.com with SMTP id a188so245752157vkc.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 03 Jan 2016 22:34:03 -0800 (PST)
In-Reply-To: <8c329ffac51276860bff1911a0f257dd108ee5e8.1451832665.git.luto@kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: platform-driver-x86 <platform-driver-x86@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>

On Sun, Jan 3, 2016 at 3:54 PM, Andy Lutomirski <luto@kernel.org> wrote:
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

Happy and prosperous new 2016,

OK, this was refreshed against linux-platform-drivers-x86.git#for-next
where intel-hid driver was already included.

[ Next/Trees ]
drivers-x86 git
git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git#for-next

Thanks Andy and all involved people.

- Sedat -

P.S.: Personally, I do not need the intel-hid driver. I was interested
in 4 patches from luto.git/xps13 in the area acpi-pm/pci-aspm/hid/etc.
(as I have ACPI-OSC/ASPM troubles and with llvmlinux I see a hid
issue) which are all in the appropriate -next trees.
Looks like Dell's XPS13 9350 (Skylake) is well supported on Linux -
worth promoting.
( Maybe I try today's Linux-next tree. )

[1] http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/Next/Trees

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
