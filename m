From: Ritesh Raj Sarraf <rrs@debian.org>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Add sysfs interface for
 touchpad state
Date: Sat, 18 Feb 2017 15:21:35 +0530
Message-ID: <1487411495.13283.3.camel@debian.org>
References: <20170214141612.16913-1-rrs@debian.org>
         <20170217033301.GI6814@wisp>
         <CAHp75VeUGMYpmth34OisQT54VhmkuDSFp=OAOu+c69L3GUZUmg@mail.gmail.com>
         <20170217084806.GA4397@dtor-ws> <1487323140.6980.20.camel@debian.org>
         <20170217195237.GD13050@dtor-ws>
Reply-To: rrs@debian.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:34060 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751162AbdBRJvl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 18 Feb 2017 04:51:41 -0500
Received: by mail-pg0-f65.google.com with SMTP id v184so7052350pgv.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Feb 2017 01:51:41 -0800 (PST)
In-Reply-To: <20170217195237.GD13050@dtor-ws>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Darren Hart <dvhart@infradead.org>, Rafael Wysocki <rjw@rjwysocki.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Ike Panhc <ike.pan@canonical.com>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Hello Dmitry,

On Fri, 2017-02-17 at 11:52 -0800, Dmitry Torokhov wrote:
> OK, if firmware disables the touchpad automatically, then it is fine.
> 
> I am wondering about the utility of the new interface though. Are there
> already major users of it? 

Not yet. I proposed this interface because we want something like this for
Onboard. For detailed discussion, please see:
https://bugs.launchpad.net/onboard/+bug/1366421/comments/43

hp-wmi and thinkpad-acpi do provide a similar interface, but for tablet.


> If there are no users, then there is no point
> in adding it, it will stay there unused and forgotten by anyone.
> Teaching ideapad to emit SW_TABLET_MODE is more useful IMO.

If accepted, Onboard will be a consumer.

Yes. SW_TABLET_MODE would be ideal. But looking at the drive's code, I don't
know if it has an EC command for it.

- -- 
Ritesh Raj Sarraf | http://people.debian.org/~rrs
Debian - The Universal Operating System
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEQCVDstmIVAB/Yn02pjpYo/LhdWkFAlioGScACgkQpjpYo/Lh
dWnEvA/5AfQQYaBiOsunZuR6OcM1BrFy1vpSGAToRNdWkaV18p7IfZGSkDUbZ3U+
rLdL5URnD5/CsHhcOPpUp4IhM4wdce+Rxc4T4LdEyjqZ29IlGrA7k21i2fJXfEws
5Mjd+pN01PitXGGBjc/BcX0ol37pcXyLfMpl3UKvE44LU2CwU5sahnSDyHgM+G77
Gnoy5Po0eLAQoOPAJIsLwSaxJlzoZAknZWuAwqQfNXxXdxVFfTr5OmV9pcTx2vgw
cPdg+8lrU8M7w2SNrK91AvccnXLV5T/rNOolk3VHoH/AQJdgxbiZKdkv0jyg/WKp
TyGIkgwNSFjYeph/JZ/IqXkOnkuB/TcKQq7uVKN5b71U2VouV6gEe/2RcOQ+lSYg
au3NX4Wq6Ot9MSMfqwIZ0+TgazGGjbUlFLhf1TFRZ9o8ERsZrtaXsC5c1U3egAS/
XZWuiI0CI5c3k1WTxWpy76pX963gh+3d9kejanWug2LIriIALmD5/ryN56Jml41S
3I3JnnuiLuwnZ/t/ehA3c9JVhsbTJg4dBbZE9tKgnAjIV/MmmbE9kCtnCRcBuFUa
W2vViMxv2eVBfiHP3Z8TC7E0UUqe69htDEomFfwDpQ1oSqDLzm6gafH8LStbYML8
j+/qGUTyg8d3yP/jrUL5UDO6dMkj+FV5bNi4qlue4uVLV7bx4o8=
=flDx
-----END PGP SIGNATURE-----
