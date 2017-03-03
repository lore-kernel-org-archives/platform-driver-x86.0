From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 1/2] platform/x86: thinkpad_acpi: guard generic hotkey case
Date: Fri, 3 Mar 2017 20:28:49 +0200
Message-ID: <CAHp75VdtBrbjJ0YTD9ZezdzgYHPiuYVVD_gJ2940FvJTAN+DdQ@mail.gmail.com>
References: <20170228161057.28394-1-ckellner@redhat.com> <20170228200208.GA10069@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:34592 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751742AbdCCSaa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Mar 2017 13:30:30 -0500
Received: by mail-qk0-f194.google.com with SMTP id g129so903726qkd.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Mar 2017 10:28:50 -0800 (PST)
In-Reply-To: <20170228200208.GA10069@khazad-dum.debian.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Christian Kellner <ckellner@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, Platform Driver <platform-driver-x86@vger.kernel.org>, Christian Kellner <christian@kellner.me>

On Tue, Feb 28, 2017 at 10:02 PM, Henrique de Moraes Holschuh
<hmh@hmh.eng.br> wrote:
> On Tue, 28 Feb 2017, Christian Kellner wrote:
>> From: Christian Kellner <christian@kellner.me>
>>
>> Currently when dispatching hotkeys we check if the scancode is in
>> the range of 0 and TPACPI_HOTKEY_MAP_LEN, although the bottom 20
>> entries in the hotkey keymap are already adaptive keycodes.
>> Therefore we introduce a TP_ACPI_HOTKEYSCAN_ADAPTIVE_START and
>> ensure that we are in the range 0 and ADAPTIVE_START for the generic
>> keycode case.
>>
>> Signed-off-by: Christian Kellner <ckellner@redhat.com>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>
> Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

Both pushed to testing.
Thanks.

-- 
With Best Regards,
Andy Shevchenko
