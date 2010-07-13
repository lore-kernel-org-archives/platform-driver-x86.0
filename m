From: Samuel Xu <samuel.xu.tech@gmail.com>
Subject: Re: How to read time stamp from HPET timer from device driver?
Date: Tue, 13 Jul 2010 21:34:50 +0800
Message-ID: <AANLkTimILvk8XUGeoct6_DZKtAvjSSg9wmQwXRkt42_h@mail.gmail.com>
References: <AANLkTimTF1tNxpfd86a9h6PDKDeFiq9zQcHCbKyfTm5M@mail.gmail.com>
	<AANLkTimRXZqDDcIsPEbgNdAEk3ZzEXzp2MXMcLgl1UnS@mail.gmail.com>
	<20100713130836.GD9114@barata.holoscopio.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:33212 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756329Ab0GMNev convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 13 Jul 2010 09:34:51 -0400
Received: by vws5 with SMTP id 5so5809141vws.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jul 2010 06:34:50 -0700 (PDT)
In-Reply-To: <20100713130836.GD9114@barata.holoscopio.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
Cc: platform-driver-x86@vger.kernel.org

Hi, Cascardo:
Thanks for reply! I just want to get the guide on some sample code of
HPET usage invoked from kernel mode driver.
Any directly guide?
Thanks!

2010/7/13 Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>:
> On Tue, Jul 13, 2010 at 05:39:11PM +0800, Samuel Xu wrote:
>> I tried hpet_readl() from my driver code, while hit compiling error.
>> is it a correct API for kernel driver to invoke? any more hint?
>>
>
> What are you trying to do exactly? Using TSC or HPET is not
> platform-independent. You may take a look at hrtimers.
>
> Regards,
> Cascardo.
>
>> 2010/7/13 Samuel Xu <samuel.xu.tech@gmail.com>:
>> > HI:
>> > I am a freshman for HPET timer. Previously, I use TSC counter, to =
use
>> > rdtsc to get the time stamp. elapsed cycle can be counter from 2 t=
ime
>> > stamps.
>> > As a advanced replacement of TSC, I suppose HPET timer can be
>> > conveniently to read time stamp from both kernel mode user =A0and =
user
>> > mode apps.
>> > While I failed to find a way to get time stamp value of HPET in Li=
nux
>> > kenerl (I am doing a driver and want to know elapsed cycle from dr=
iver
>> > code).
>> >
>> > Anyone can help me?
>> >
>> > Thanks!
>> >
>> > Samuel
>> >
>> --
>> To unsubscribe from this list: send the line "unsubscribe platform-d=
river-x86" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.10 (GNU/Linux)
>
> iQIcBAEBAgAGBQJMPGVTAAoJEEWxSg7udFZIZHoQAKj0xOvvtE5pEZqau1OnFz1t
> q15VC2q/OYQRRjAT5kRFEfWk7NcCaJmw4Y0TdrOjEW9YpYnZARksH2UwFA8myf9g
> WOUpRe0o3HcuiutlxB321bI7mpJLHAaxpFwB8/10iXGjrH0LUQeOWkNo5smd9RQK
> 1WfQ6BVEOqeyfY9ISnwzqhZQMu3AG0DbqnZQe6QtvE4Epg4L8ZeROL1piJqLGtlv
> IGQ4fn+Pdu9+VXpmVl4Uzc/bLF1j2HTTKwwHO0KHTYZty40K8NnbCPJJp00KTfnN
> TYVdEEgWzvIrJmB7hlrdl5gmjs9KYmOe3lpkRdotCzca9VNxFLvyi6ogkE/qiLpY
> Au8wts22+qikxAkHdDfFdlnYAiiguGCJvku2usCtkEbTxsYWHKp/maP8xcNDE52H
> HHwKmkKuYA/m+ML7kKmE7goDHjFvG0SZcm8Gjj4ghxbobhzQ6XGxzsGpJ9GwYz/E
> JqAiqob3lD8TljWXPGN839pi0KHBivH71p9UoCC856G3GL4nXahsBSwMMg3KWj5i
> avvQSCR838LK7qesKYak3xgjmLl9vRWVQwbx1vIlgjpOsBnmhUttUOKFy1eb4THz
> EX080354M5mVfXsoiDVqUy3W5PwL1Yna9AaMVk+05lKg6OR/b0cMC6PFocGkgxRM
> Okd0gXuUGv5IIy38UGSO
> =3DBMoU
> -----END PGP SIGNATURE-----
>
>
