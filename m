From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH][v2] intel-hid: new hid event driver for hotkeys
Date: Fri, 18 Dec 2015 08:41:32 -0800
Message-ID: <CALCETrVFkd4=LqtVexusQcpNi8F1rMXmwEh_zYuc-eTc20tSVw@mail.gmail.com>
References: <1450452670-26556-1-git-send-email-alex.hung@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:33550 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932294AbbLRQlw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 Dec 2015 11:41:52 -0500
Received: by mail-ob0-f170.google.com with SMTP id sd4so84416373obb.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Dec 2015 08:41:52 -0800 (PST)
In-Reply-To: <1450452670-26556-1-git-send-email-alex.hung@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

On Fri, Dec 18, 2015 at 7:31 AM, Alex Hung <alex.hung@canonical.com> wrote:
> This driver supports various HID events including hotkeys.
> Dell XPS 13 9350 requires it for the wireless hotkey.
>

Still:

Reviewed-and-tested-by: Andy Lutomirski <luto@kernel.org>

with the single character nitpick:

> +config INTEL_HID_EVENT
> +       tristate "INTEL HID Event"
> +       depends on ACPI
> +       depends on INPUT
> +       help
> +        This driver provides support for the Intel HID Event hotkey interface.
> +        Some aptops require this driver for hotkey support.

laptops

--Andy
