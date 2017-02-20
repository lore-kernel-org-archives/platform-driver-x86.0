From: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Subject: Re: [bug report] asus-wireless: Toggle airplane mode LED
Date: Mon, 20 Feb 2017 09:19:44 -0500
Message-ID: <CA+A7VXVj=Kf6bEu53BoLS3CLrUmT+G233-SS9gP_Tq18e1Zz_g@mail.gmail.com>
References: <20170218203059.GA23566@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yw0-f178.google.com ([209.85.161.178]:34862 "EHLO
        mail-yw0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753205AbdBTOUZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Feb 2017 09:20:25 -0500
Received: by mail-yw0-f178.google.com with SMTP id l19so50414602ywc.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Feb 2017 06:20:25 -0800 (PST)
In-Reply-To: <20170218203059.GA23566@mwanda>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>

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
> drivers/platform/x86/asus-wireless.c
>     33  static u64 asus_wireless_method(acpi_handle handle, const char *m=
ethod,
>     34                                  int param)
>     35  {
>     36          struct acpi_object_list p;
>     37          union acpi_object obj;
>     38          acpi_status s;
>     39          u64 ret;
>     40
>     41          acpi_handle_debug(handle, "Evaluating method %s, paramete=
r %#x\n",
>     42                            method, param);
>     43          obj.type =3D ACPI_TYPE_INTEGER;
>     44          obj.integer.value =3D param;
>     45          p.count =3D 1;
>     46          p.pointer =3D &obj;
>     47
>     48          s =3D acpi_evaluate_integer(handle, (acpi_string) method,=
 &p, &ret);
>
> "ret" isn't necessarily initialized on a couple error paths through this
> function.
>

Yes, I have missed that, thanks for catching it! I'll send a fix to this.
