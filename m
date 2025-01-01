Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2252E4C70
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Jan 2025 20:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735762883; cv=none; b=cXvleUaPh8+Lc1mpH2kLUSMtPboKpJrYavsIoxG5P/MdRbV4NHJOb1TN1AVkZ23o6JYq51m4lSzhVp3NgYIhwrXmyDeyFnqynVei9AAnV9EMj2HPDBbmCC/F2TFlivsBX7mSql+rgfmh2Ep6XtWGGHUCFZFpXrq+8I4DLdm4+LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735762883; c=relaxed/simple;
	bh=xVFoPUvKsCry91Sx9Qe6i3l/PqQZl+DLeyUV30jsoyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tu9jzXcmDc8Qi5lD72NzIFkfPS/Stb56lnp2+YnFo7D+B349QBZRq3nQBD1jJLumJRhGKmklWwgJb5dqXkF+ZvPPx+GQNipRm5nLxLnUjyTuiSFfLHDp/mCydsz0Fl+Ih9y7H/opuDMc69bpYLrmDN70FeAFpKj3U5d+5Od5Q8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=L8Ey4Z+J; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="L8Ey4Z+J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735762877; x=1736367677; i=w_armin@gmx.de;
	bh=ADM17zBNJ32xPzFzwJAn0gPhu/vtf2lORlGCrPnqnBE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=L8Ey4Z+J09iGGrYm6ZMYPWuh0R8Aj4tAmKq2HUzTnVX5yDzh3Fqf+Dj/5Ek8NGJG
	 az6sSuWoax5I/bNOx34lp+U+Fus4N44OxKR/zbcNWqrHhFIUV7NYLv50j67Hb7bGz
	 QvH/icFoZGzE1Z8zH6ldGoyoE0noxFTvJ0asYDmVtTA8e8OpMIul0MpWsndYBeXX1
	 ityHPqa4RhdN569/zHqk0sVfZoySoi0yLjxp4Xl34G6bmQksA40HAjiyqkI85nBjn
	 9Kwy7Lj4JJuQUT+Ez39LtgFWZl7BGqi+230Ug/g1Mg5gQDBjLryA27XS3Phv64DKC
	 Mx1o+RzqjQ0vkBN02w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbAci-1u4Lq9206a-00bLfD; Wed, 01
 Jan 2025 21:21:17 +0100
Message-ID: <583bbdfe-5c5a-4541-b30a-97eb89f2e4c3@gmx.de>
Date: Wed, 1 Jan 2025 21:21:16 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: acer-wmi: Nitro button doesn't produce a WMI event
To: Hridesh MG <hridesh699@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <CALiyAom1xDH6A0Q2WNHCMUcpMJfM3pXO2DaW=bgHGUi8ZOpBbQ@mail.gmail.com>
 <8b8749c1-59c8-4f95-a43e-055cf94f9597@gmx.de>
 <CALiyAo=R1kcvwRpw22s=YU0YHUxR8T_WHLwSvDr=8Ahsenn-jA@mail.gmail.com>
 <9c625119-e46e-464b-933d-9c836577f454@gmx.de>
 <CALiyAo=7kVi4ipA5-xDfRYQ-gqyza0woYHUzwGuW5BccLOVHgg@mail.gmail.com>
 <209f39ab-a312-45b5-981c-8324d9b8cd90@gmx.de>
 <CALiyAon+5H_g1V-iNbjdLmjgYDJng+ePH0XeoYxijYurHj+uTg@mail.gmail.com>
 <31c28ea2-881c-42e3-b754-8b52ca7f63fd@gmx.de>
 <CALiyAo=_vGu50RoAPwFMv9J=mkaQWojAQxmB2qmwcEZ5Y8kfSg@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CALiyAo=_vGu50RoAPwFMv9J=mkaQWojAQxmB2qmwcEZ5Y8kfSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UMPGClmFSUjvzmuM0hQoJeuHmSodjEYF53kmUQpgK3ghmWVkZQE
 VO5ygs7oVPEhpUOgGNkkoXrdRvCUcdzxJs6dI9dCOSLs1590WWVVdDDpM+XxYqG1d2R5S9n
 31Fy372hH+g8dbtuhd5um5+HmZuAWR8OOueKznJvqfO56VzSPtR8jB7iGbSnkoiW0QqMSyz
 R433FYpH/dHm/T9uP2wXA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:roehPmd2pUU=;dEvEf+aR/eT+QTQlrbJkD5T741c
 BBkd0BfrDIiWnQNbjWJm15sbxD5yJyjIyHbXy/+Is4Ab0lbyvAHxoPRfuLvugs4wAcxyY9rUN
 we74eMzuu9EI+SJ5FBaXR+NRWYfUFYCz9FldXQfq1CvbUans09sUV1Bvfu4pWg3rrYnFwQS87
 AzmletI8CHIBJq45CypBPuZziHWncOSip2jqhsapi5oKuEbt1hcDtJLozrzM2mjkrR0jYaUfq
 bnQCMEhXMra5QBcIHplD3ilnp3hWy5twtia7MInkt6Ti/nluJJ9GQavdmSWLZpO4N2OTYZ95H
 0FImDHgdkKpDDjEZ8KEyH1tKdzkAmYAc9fdvK7uuzMiYhoc+tXST/WyzFwoxKk6FTAR9rpjDn
 LbZ1fTcTXjWE/otsj2O6yoLIMZ87IejNO0tTViqwNwWYSvEfby5nVPlRQ52jJgPo0naEYo1EZ
 AK3gCxl05FjybVrYNAycQTX3WXk1CtsvPwmYY0NAMvRp6VKstFCxEFrRmZ437T3+B4Pr01LGR
 6gujuzxrDyEeuWh/4oBtb5V/0xNzlttIiE2zHBekB5No/OVYwR0RazmLUWfN/9Shxgs5/d46D
 9+CyEx+X2YmBuu2g/Hic06ThiwVVTm+PE2RZiNFCI7+Ru1SLo3tMSDHxhkzLGU+dzMhIR7Tcc
 bkSbXcqKC2OS/t26qN7beQJv/Tk54a1QPUFUgrB/hSTe8qbTF6+y2jYF66ddX/RKe7vh/EPWx
 ofmm6rN/lohquieoKcZiKHRET3qxbgALT+6V/pLKlR2ARw1HuQuOtMubb5Jx5kxF1vSJzWB9r
 ndfS7kfbss+WEuzQKGaiLro3Lj/302IPFn9KGekYVd7LbBUiumeZhjVa2BC5s33FReZ7tyQoY
 EXm2W2CpKjvNAU2PULamFoM3WHF/OySIkRgSB2O4GI1CT9OdR88NUDRzmjY8VdTcYrq6jY67I
 zw69t8ZdVL6oNJtiWUOHLFzeL60aXrez+kZ1zWcdNI7Jr0c9oaypevVaqLzZS3cDmiO+a1h6q
 JPPQjyqHUDDaXIO/8UtWrvjIPcs6zqugURUqNE6eNwZrtXIIswc1VDPGUdscjeZF+voGsROcw
 mbjdwf5O83oYin6yEdBUGu6NlSEHhP

Am 01.01.25 um 20:53 schrieb Hridesh MG:

>> This ACPI method should trigger the turbo mode button (found inside the=
 DSDT table):
>>
>>          Method (_Q58, 0, NotSerialized)  // _Qxx: EC Query, xx=3D0x00-=
0xFF
>>           {
>>                  Debug =3D "=3D=3D=3D=3D=3DPROJECT_QUERY_58=3D=3D=3D=3D=
=3D"
>>                   ^^^WMID.FEBC [Zero] =3D 0x07
>>                   ^^^WMID.FEBC [One] =3D 0x04
>>                   ^^^WMID.FEBC [0x02] =3D One
>>                   Notify (WMID, 0xBC) // Device-Specific
>>          }
>>
> I feel like an idiot right now but I just realized something: So far
> I've been assuming that the button I've been calling the "Turbo
> Button" worked the same way on both Nitro and Predator laptops, but
> that's not the case.
>
> On Predator laptops, the button directly enables Turbo mode but on the
> Nitro it only opens the Nitro Sense app. I had assumed that both
> buttons simply opened the app and that directly enabling Turbo mode
> was a feature provided by the Linux driver.
>
> Given this, the ACPI code that you linked earlier is probably for the
> Predator's "Turbo Button". Could it be that the button on my laptop
> doesn=E2=80=99t use that ACPI code at all, considering its functionality=
 is
> completely different? (Though i doubt Acer would leave it in if it
> wasn't being used)

It is quite common for manufactures to just copy and paste ACPI code snipp=
ets, so it is not
unusual to have some unused code inside the ACPI tables.

Did you receive any input events or dmesg messages when pressing that butt=
on?

If no then it could also be that this button depends on the Intel THC touc=
h controller to work,
take a look at https://lore.kernel.org/all/20241216014127.3722172-1-even.x=
u@intel.com for details
about the Intel THC controller.

Thanks,
Armin Wolf

