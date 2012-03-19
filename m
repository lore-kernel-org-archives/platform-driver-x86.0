From: Andrey <andrey.k.p@gmail.com>
Subject: Re: [PATCH 3.0.y] acer-wmi: No wifi rfkill on Lenovo machines
Date: Mon, 19 Mar 2012 14:40:44 +0200
Message-ID: <4F67294C.9040309@gmail.com>
References: <1327546404.15260.18.camel@linux-s257.site>	 <1328258799-19665-1-git-send-email-ike.pan@canonical.com>	 <20120314215327.GA1510@burratino> <20120314220251.GB14166@kroah.com>	 <20120314221749.GF31686@burratino> <4F62BB9E.3070508@canonical.com>	 <1331878281.10557.257.camel@linux-s257.site>	 <20120316172040.GB6711@kroah.com> <1332122914.10557.271.camel@linux-s257.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:52800 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752105Ab2CSMku (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 19 Mar 2012 08:40:50 -0400
In-Reply-To: <1332122914.10557.271.camel@linux-s257.site>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: joeyli <jlee@suse.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Ike Panhc <ike.pan@canonical.com>, Jonathan Nieder <jrnieder@gmail.com>, stable@vger.kernel.org, Carlos Corbacho <carlos@strangeworlds.co.uk>, mjg@redhat.com, platform-driver-x86@vger.kernel.org, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

19.03.2012 04:08, joeyli =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> =E6=96=BC =E4=BA=94=EF=BC=8C2012-03-16 =E6=96=BC 10:20 -0700=EF=BC=8C=
Greg KH =E6=8F=90=E5=88=B0=EF=BC=9A
>> On Fri, Mar 16, 2012 at 02:11:21PM +0800, joeyli wrote:
>>> Hi Ike,=20
>>>
>>> =E6=96=BC =E4=BA=94=EF=BC=8C2012-03-16 =E6=96=BC 12:03 +0800=EF=BC=8C=
Ike Panhc =E6=8F=90=E5=88=B0=EF=BC=9A
>>>> On 03/15/2012 06:17 AM, Jonathan Nieder wrote:
>>>>> Greg KH wrote:
>>>>>> On Wed, Mar 14, 2012 at 04:53:27PM -0500, Jonathan Nieder wrote:
>>>>>
>>>>>>> Please consider applying 461e74377cfc (acer-wmi: No wifi rfkill=
 on
>>>>>>> Lenovo machines, 2012-02-03) to the 3.2.y and 3.0.y trees.
>>>>>>
>>>>>> Now applied.
>>>>>
>>>>> Thanks!  That was fast.
>>>>> --
>>>>> To unsubscribe from this list: send the line "unsubscribe platfor=
m-driver-x86" in
>>>>> the body of a message to majordomo@vger.kernel.org
>>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.htm=
l
>>>>>
>>>>
>>>> Review the commit log of acer-wmi
>>>>
>>>> For 3.2.y, this patch shall work fine.
>>>>
>>>> But for 3.0.y, backport commit 1709adab is necessary or patch has =
no effect.
>>>>
>>>> I will post the backport patch after.
>>>>
>>>> Joey, can you review and ACK/NAK for this?
>>>>
>>>
>>> Yes, should check ACER_CAP_WIRELESS flag before create wifi rfkill
>>> interface.
>>
>> Ok, I've queued up a number of acer-wmi patches for the 3.0-stable t=
ree
>> now, all should be good.
>>
>> thanks,
>>
>> greg k-h
>>
>=20
> Thanks a lot!
> Joey Lee
>=20
>=20
>=20

Please notify me when patches will be present in git. For testing.
Thanks!
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJPZylEAAoJEFy4/nEE4cHctr8H/31WX6TyfdfdKdft9oxSvCh3
1kYvxMY5rNgPDV7n19Hu280AZt4mLjbDupfGqewiArxEfiPFQqSs/1wUBM7Rl70E
eniJ+mTz7v2UuA7j+wdnp0LTR41qkmVd8tlLMjLnj+/UqxJyFo+8dyPFpAF3lTZS
jthIMqFJoWv+1/4pvcBFCXeQiQDHMMHFQuqT5qGhsjxuDDCDQ4S2PnYuwcZCPYwY
yTlDCUIhePOBekwU0MAmbtcskz7zByek+Q+xS6a6KV2ZJ4H3h1pO+WqGtsqsbkrj
Xyx/Ng6B0nYSQhsqMZZC7VyqetgXUMBb2ZL/W17dAOXsXbelmpyAtrszRZlXRV4=3D
=3DnXjU
-----END PGP SIGNATURE-----
