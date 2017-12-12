From: Philippe Ombredanne <pombredanne@nexb.com>
Subject: Re: [PATCH] platform/x86: Add driver for GPD pocket custom fan controller
Date: Tue, 12 Dec 2017 16:33:12 +0100
Message-ID: <CAOFm3uE540=Y=pgz=tcM2djQVYZw5b8uOP5wQwJNNhCNEXuW=g@mail.gmail.com>
References: <20171212151102.18672-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:39783 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752102AbdLLPdy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Dec 2017 10:33:54 -0500
Received: by mail-wr0-f196.google.com with SMTP id a41so21574317wra.6
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Dec 2017 07:33:53 -0800 (PST)
In-Reply-To: <20171212151102.18672-1-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, James <james@panaceas.org>

Dear Hans,

On Tue, Dec 12, 2017 at 4:11 PM, Hans de Goede <hdegoede@redhat.com> wrote:
> Add a driver for the GPD pocket device's custom fan controller, which
> gets controlled through 2 GPIOs listed in a FAN02501 ACPI device.
[...]

> --- /dev/null
> +++ b/drivers/platform/x86/gpd-pocket-fan.c
> @@ -0,0 +1,193 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

This should be IMHO this style as requested by Linus on list and
documented by Thomas in the doc patches:
// SPDX-License-Identifier: GPL-2.0


> +MODULE_LICENSE("GPL");

This module license means "GPL 2 or later" and does not match your top
level GPL 2.0 license tag and should be instead as per module.h doc:
MODULE_LICENSE("GPL v2");

.... unless you want this to be GPL 2.0 or later all the way in which
case it should be:
// SPDX-License-Identifier: GPL-2.0+
and
MODULE_LICENSE("GPL");

... though I am not sure what is the point of "or later" for a module.

-- 
Cordially
Philippe Ombredanne
