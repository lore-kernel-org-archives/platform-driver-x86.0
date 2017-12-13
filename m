From: Philippe Ombredanne <pombredanne@nexb.com>
Subject: Re: [PATCH] platform/x86: dell-rbtn: Block comments use * on
 subsequent lines
Date: Wed, 13 Dec 2017 10:24:57 +0100
Message-ID: <CAOFm3uEP-fGPiZt96QDvgXG1Ws8WgdFLbOsGumvhGSG-e7L0Ng@mail.gmail.com>
References: <20171213082301.23209-1-dhaval.shah@softnautics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171213082301.23209-1-dhaval.shah@softnautics.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dhaval Shah <dhaval.shah@softnautics.com>
Cc: pali.rohar@gmail.com, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Dhaval,

On Wed, Dec 13, 2017 at 9:23 AM, Dhaval Shah
<dhaval.shah@softnautics.com> wrote:
> Resolved Block comments use * on subsequent lines checkpatch warnings.
> Issue found by checkpatch.
>
> Signed-off-by: Dhaval Shah <dhaval.shah@softnautics.com>
> ---
>  drivers/platform/x86/dell-rbtn.c | 26 +++++++++++++-------------
>  drivers/platform/x86/dell-rbtn.h | 26 +++++++++++++-------------
>  2 files changed, 26 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/platform/x86/dell-rbtn.c b/drivers/platform/x86/dell=
-rbtn.c
> index f3afe778001e..cab93c6dcd34 100644
> --- a/drivers/platform/x86/dell-rbtn.c
> +++ b/drivers/platform/x86/dell-rbtn.c
> @@ -1,17 +1,17 @@
>  /*
> -    Dell Airplane Mode Switch driver
> -    Copyright (C) 2014-2015  Pali Roh=C3=A1r <pali.rohar@gmail.com>
> -
> -    This program is free software; you can redistribute it and/or modify
> -    it under the terms of the GNU General Public License as published by
> -    the Free Software Foundation; either version 2 of the License, or
> -    (at your option) any later version.
> -
> -    This program is distributed in the hope that it will be useful,
> -    but WITHOUT ANY WARRANTY; without even the implied warranty of
> -    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> -    GNU General Public License for more details.
> -*/
> + *   Dell Airplane Mode Switch driver
> + *   Copyright (C) 2014-2015  Pali Roh=C3=A1r <pali.rohar@gmail.com>
> + *
> + *   This program is free software; you can redistribute it and/or modif=
y
> + *   it under the terms of the GNU General Public License as published b=
y
> + *   the Free Software Foundation; either version 2 of the License, or
> + *   (at your option) any later version.
> + *
> + *   This program is distributed in the hope that it will be useful,
> + *   but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *   GNU General Public License for more details.
> + */

Do you mind using the new SPDX ids instead of this long legalese?
You can check the doc patches from Thomas for details [1]

[1] https://lkml.org/lkml/2017/12/4/934
--=20
Cordially
Philippe Ombredanne
