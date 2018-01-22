From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] platform/x86: mlx-platform: fix module aliases
Date: Mon, 22 Jan 2018 13:48:01 +0200
Message-ID: <CAHp75Vd2us0ytvkoAxUeo-gb8Y6siSV2mfDZZeQGYkGU5-8Hnw@mail.gmail.com>
References: <20180122101148.22135-1-ivecera@redhat.com> <AM4PR05MB333066D7C4F921EE90DAE360A2EC0@AM4PR05MB3330.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f182.google.com ([209.85.216.182]:43967 "EHLO
        mail-qt0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750955AbeAVLsC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 Jan 2018 06:48:02 -0500
Received: by mail-qt0-f182.google.com with SMTP id s3so19907965qtb.10
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jan 2018 03:48:02 -0800 (PST)
In-Reply-To: <AM4PR05MB333066D7C4F921EE90DAE360A2EC0@AM4PR05MB3330.eurprd05.prod.outlook.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: Ivan Vecera <ivecera@redhat.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>

On Mon, Jan 22, 2018 at 12:23 PM, Vadim Pasternak <vadimp@mellanox.com> wrote:

>> +MODULE_DEVICE_TABLE(dmi, mlxplat_dmi_table);
>
> I am not sure about the location of MODULE_DEVICE_TABLE record.
> Should it be placed at the end of the module or after mlxplat_dmi_table
> declaration?

Yeah, it would be better.
I dunno if Darren is going to ask for another version or fix this
manually when apply.
To be on the safer side, send a v3 with properly attached line as
Vadim suggested.

-- 
With Best Regards,
Andy Shevchenko
