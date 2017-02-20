From: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Subject: Re: [bug report] asus-wireless: Toggle airplane mode LED
Date: Mon, 20 Feb 2017 14:22:38 -0500
Message-ID: <CA+A7VXX-ST1GgeSU6JJ_Wu8BWFqVz66gg6Wshm71agFHbjuVgA@mail.gmail.com>
References: <20170218203059.GA23566@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yw0-f194.google.com ([209.85.161.194]:33553 "EHLO
        mail-yw0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750935AbdBTTXT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Feb 2017 14:23:19 -0500
Received: by mail-yw0-f194.google.com with SMTP id q127so2598542ywg.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Feb 2017 11:23:19 -0800 (PST)
In-Reply-To: <20170218203059.GA23566@mwanda>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>

Hello Dan,

On 18 February 2017 at 15:30, Dan Carpenter <dan.carpenter@oracle.com> wrot=
e:
> Hello Jo=C3=A3o Paulo Rechi Vita,
>
> The patch 2c1a49c96123: "asus-wireless: Toggle airplane mode LED"
> from Jun 13, 2016, leads to the following static checker warning:
>
>         drivers/platform/x86/asus-wireless.c:54 asus_wireless_method()
>         error: uninitialized symbol 'ret'.
>

I believe I have a fix for this, but I'm not able to reproduce this
message with neither of the following:

make C=3D2 CHECK=3D"/usr/bin/sparse" drivers/platform/x86/asus-wireless.o
make C=3D2 CHECK=3D"../smatch/smatch -p=3Dkernel" drivers/platform/x86/asus=
-wireless.o
make C=3D2 CHECK=3D"scripts/coccicheck" drivers/platform/x86/asus-wireless.=
o

So I am not able to check the fix. How can I reproduce this?

Thanks,
