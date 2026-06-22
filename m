Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B321C235358;
	Mon, 22 Jun 2026 19:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782157530; cv=none; b=s4h8ePQsDcgYIF1Em43fSyb0OLQDFbET0HNngQW4SPil0cfg8bx80J8dG21bKQucwfZfuWIvL6DCSPmc38d+Hf4k+c2Y/n8ZDUEA89i1I2WKhYcBSTaLHBlHvxJxa/a+R6JiOvaFkRdocNfCHa1mC4M+/445qEtT+edLxlz5DHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782157530; c=relaxed/simple;
	bh=EVGKAg6aE+p9iumKQyGtu81QRAw8zI5rkxQmMHg2Lv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N/+e2X01wosCWF6jejsvNBIsq+eRoAVKNImZ52srbI6ZIcTC84qjEYq1EJGQrIRxCqRd4DALyoWkCS/OlaJji39p+mJcFkeDReKBpXHJsAd/Gzysbbx6mhzNh6VznAc1kdEO0jGTKtamz//Qf05v25HgzK+YE0VKsysz0eBA3Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=btPl0GGO; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="btPl0GGO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1782157526; x=1782762326; i=w_armin@gmx.de;
	bh=YKI5FCTxdfhP6gj4zm0RqMIB81+Q6jpOZ4Vhe90cRhU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=btPl0GGO8W0LctiKwli+bPnBcRwQ01CPAT4l0u8RqqwH5PXER0PKs0jgxDMzCeZF
	 5IosGw0G8IqmbwJglIPjJ5pQ7rRbDkItT/hLKvwMiTlVsuKRbQuuSqL9IYBo7Xrh7
	 /bRXOWc91RHJ46uOrB4zopwIP3sTl0eXYiOPs2N6ue8QUmtHKCoeATz0m7GvuvDVt
	 KBgiIi0Mx9zMp/Qpwb8xFKuZW3O25DE8IdBrlu/rzX7VjNg4LeTgynEAquplzhwiK
	 FPw3FNFKqwHfa6BGr2+qQjI/DGJdgZ1rTVpVoyP+pICd5Wyu8XXjNBuICCTO5zS5c
	 AkpP36y0Iz3Aj/5BjA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRTN9-1wppaN1Hjp-00OOHo; Mon, 22
 Jun 2026 21:45:26 +0200
Message-ID: <f0cf19db-7ef0-41f7-884f-92002627e147@gmx.de>
Date: Mon, 22 Jun 2026 21:45:26 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wmi/core: fix use-after-free in wmi_add_device()
To: yahia <yahia.a.abdrabou@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260622190409.17268-1-yahia.a.abdrabou@gmail.com>
 <20260622191838.23187-1-yahia.a.abdrabou@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260622191838.23187-1-yahia.a.abdrabou@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JZn0A2+Ey6I7+FYUbxyKwwxlLvkyhSvI4HyUIQLPbA7+Czb9k6t
 Q/9KoZVoFVXYVmNr/jVCAFtQGR0us/cckNfJHc3UqNgqWme3u1GDBPo+hkQGDfzdaZgVdUO
 zyrGsznx7Z7gbmFaNCRrFF0gfieZhjCKukb7oDeGyQVHsLj/04tVwmT4+OO9j/zuEdtO9Mv
 ZXcOTLYnG+y/4OUP7JmXg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Je/w0J6JqhQ=;IZyRU0Uj2euI3r2artIejNlAdDt
 DeU0nH/Bc09rupR1g2N9KttQzZD59ruXumg+GsZjFjS6ydghO7o096s6xD1bT1yoroHx63BcB
 OO/rpw0UPH7mJazYB6fUdajvaqsEYKslEHh4tkStm8TYpJByk3G7oLtRqHoh2WZihRd71Zd5m
 Mn2vGoRunwfoHNx/G/n2RQ3e9I+maMOy5egQqoSq3huF5cnoPPoxgO+k0LNCKnaH3N8KceHoS
 g9mDyAZNYDkx6vDgoFlfcVUop0D6xBDNGVWgrt99pU06n4LAGDzd/za0YjnIHsP3py++Atghb
 glQ+5y4haB+RdZVfryS6mhvinuQBSroJuXXUeZNStpkbrdDALhYROTquX86Ice19/uoGVMCX7
 zpBJPEVryMtUbBK7Ms/ms4Hw5/pIDmvv11rv6oUr/cAp8yMQYmefkgNY5ZuaK6M5cBI2RzHBG
 4/33bCuck9ntpbZkrnXZbLx6aiuv1m7mVylf+ckcxWaggC+sHusloILrTN+3QlJ5DilQDM9Tr
 O/SCOAYToJ0snXtLTrzn2mFl+qOBjhcmmP7yTaQeKHc1+nd79tAd+1bXJyjCUkIAgkj9bb8Bk
 ySlaUtCvr3rc6R2Bp+3w+42mzFbLUPlfLeyO+JAU/a9mS7WW7yYF2vYJ2TqQxbrdIRC7gKrlw
 wb69ocA7chBBjqZ6LWo/8G+X5twW8Rs4l2Cf6DWkkyR+Pe1jy+nHl6pm39OJ5qV9jMyUalSuI
 VGeGa/WKIaiFKt/7z5CQRQImgqhTM1Xo9hYGfMxTjE8eTo5f7CcvQ6p8uKBOc5G6KAPUTWSoQ
 lUODNQXohgaRqWr3gzXq0z7jsT85/8yG8oxgV5+94BypsaM4UL8kSZSaNTkUhErCkE6UivTK9
 dY95lRF3NDHfeAY7zKIe6nQfI1Ss8nB9ELobS2EX7Ggkb4tzSmqj/mc6eWmoA6Y7C11Z3aDdi
 ObkDuCEcCfBSuHO7rZK2GwDiCjEk3G6FiuEw0LQF3FLPrvoAZmk/dfsyZBsNlRc9TNJNA05fK
 FFxhBHjqpIjb8N8WtimFDF9bhrWusnlAM6X/QgCgFsH9quwfVoLxC0soUOYvLceHZ6BTIyBUy
 mmr0VKCX3mB4BihurVl4AnVSGy3BAkrXr7u839Z7nMk/Vbq7Z5wIBTPdHzyeE/q7kZ81v5dtm
 dPkJmtClINm2hJyzl4ngKAYDnmgbGr5m7fD1YLZdChxEtzL4lGG3Ii2BDOwB5tPXs99qhNC+v
 mgCLj7fpHBOD3Rger+dmK68P+YGzzz7CH+uL5ho9+B8b6t4U6I8AihzNb0CXe73fPCrrAz2JL
 GO+GEXF5d5QxDmsK7LZ75fCtnepA492DyUquBJfzMZE5iEGugd5z27lSw6WG5FsQRHSPBfrT8
 A4yLwNO66jV204OgtbHNuBHw8hbCz1XtDhg1XdO8TL2s0VTRHgjTu/YgMb8Ntvk/EUJ+9MbLl
 yna/uY6zmy1e2jR89NYr0G98apyHemJJxN4GGGBiJty/S2OrLg9C/pBJDbve672szlDNeMZ6a
 7FYXf6F9SK8RcQBL/xGyxVEClyVYsiOqBN0XWTZA90ohB4U7WQcoDtPuKzCG54NHfkX/9lxjK
 835gVelxNCb5Uxu3n6ZheqTi/8GywsAdkiKyWw1Byh8hAJv88t4CemcSARuV3HEA4nftpbB6G
 xk1QcPOyd7mRVVltfgoalKYMOrdbvZLVDBzZhlUYkpfAkhwU6MSHeN/OdZtL0NxL101WGYM0R
 5/nyxlkJ/aBIi3HflFAnaC7M1tEeQyW3RvDaWQLUW5EHg3bLF09BjpgbjoPb5iMYAJUDqhqb6
 0BC4ydgYoDxByRmNUDsRgcC7MaQpriQT8YDwGw8jw894f/9bhwHnw7rJi2B3M5JBbqXBHZmVl
 M2bLMk/J3oS9QBEeaGzaroYvwiDfRBlvjxZb4/NUSRWdA3hRbURLoJVzo+8WD1I1EhgwQufqy
 TCf+as2HP7YhgZAUgAlFjhLnF3+vBRTtIBkWgTu+hVbyPm4/fAW4FUNARpebcBfsJFlu5y9C/
 IPnLBnUfQwXE6+tNhWKArMAm4hyJCSFSlZBSFCtNhCgfx+ZSCGYmBOHJUCM34Md9icr2+guS5
 DJy8OLEj7qKOGcd0TCZUzvPDRYGR8u1WlHC5vfxHe66rqHqV10mFcgJ5l9J1OYR4hgsZpQjyh
 ifgwlhD8hgLH4TvbA/38DboGLvevWnHxiFSptCqbik7kbPbQUSfV4tYFb4y0fEEhjI6leEAHp
 3T+LTH6EQDGYqb4/od+fexKjUPsvm+enBr2aRdN82iUQ7eGAGYByefzym4IODRce5MAhrQbbL
 uWtjMEPwaCI7P6LeYJn+KwiI78FerKGAuHlpLZ53OCuIfdlbHuTKWst/nvVPc3cxtgq2+meIG
 FjzfFLisX2qXM1B8VtC8F7PKjEWZfcntTDqNR/foi6E8a+XKkzqxPaJbi8cxZNUJ+lPRHG0Bv
 o44xMR7zuri1YRr7ybQEioXBbq0M0VXnbsAf90T0mq7Q9qeCKLqoUJ2axamUWguQ3BudrAsJu
 vcF99wtw3afCVggAnnYKuVSR1yh9uqv2H6wFXyBbAcCjkusTPqOH6cjDkumIJmLqK7f5Br6c6
 rCqHuIYv40+MwEZKm2wtCh5rsnfnGTSnmA+5nFksAf8Ha0LGnuKPJBlQm/uGi57SMIJm1yRAV
 toTTzmblj/jqxxI6Z3npfa8R3vz8L0+xBxgvB1jjLyiq4aJ7F2r+NN3tVuau4c64ofpSzHiBA
 qxNMv+Q3HvLoKPt3mvZVRs3/34YjdFAWXqEGxo/4yJ8tAPXbXAqj9pJw7727hwLo5yXxVmiGs
 swhh7gqsJ1g8d9bdnobZ5q25egNeVAkiw/Xa3j2y/OVNnWyoJdwfhJqtQaNZ4GvzWar++qpBW
 gpyIbtqmSFr4UB01kS8DACTdo/ulTHXk2y3WorknXv/lkE98wmX6u5U25N6+/K0UKyrirRErC
 MxfgmCZ0WbEv8eobeWo+9eg/f9P20IZwebz5wSCU+R2y4OYWN6m+4El+14rnWJPrBHXsYEdT3
 rWXWLc0y5HrNLNvevGE7lzFeX7n9kJe3dvwxUCVPcm2yofk/LebMgMwqWCnhk1OqIaue4XPFb
 N/aYIhcXP1GErQPISBHhBOL2YgIoDEkURIBYO4zKmUdpQtJEbX6NMlR9224/cnSR1U7Q1yT/m
 RxozBJ2srzuU0oRf209hI5DfPvyhW9FJnCmHLmYQuGVn5fLzZ1RRh6xBYAjRn7M9hQcJz42sI
 lcSBYJTgpZT1OK5Q9V/FTG3hiDRuaZiw6MpVVtAhdC5/gtKI6WeWpd3oS46ETFPOJ3+ECuEdk
 FXsSX5cXt5P2xJKpZAX5U0Zg3MIK0aIFyvisA9gUbEKTWEQxfto/2ItkJaM3bbJpgM4YO5A45
 TxQKHlZy/eM+p25NGzXwLvBQK7VcmIuaw/71FnpmsFMaTABwy1uN8rGBDrvRHNGGrUl1uuSjV
 qLu8/iOMDFEfFxHrlP21qcqiJvB8oYtZWRlN8FDfDQWFPVs0J/aIOvgvqVEtQUD5ryCFv8raB
 L4hlqB16sNwlCi4lGvaiVobhvna1+g86tWwroReW3jVo9AlbFyQ4ptxKTQSVu0ZZE2zLhJUPd
 lcevc7ZpSIJ+n1AVg72RRDvLNEKYTzqQl7wKkRnlbgeOm/bcSX/5jUX6advUWSd1xHPjNzNUJ
 vIEcqEz14i3p0GWJHmqjI0Ayba++20JAcKhc+8RvL61CYdoRGNlEWhI6PTb6JtQNfh01IHE9g
 esZzRu0LyQdMMgDcM5IRU9C5T1geTOeoMYNMztRbTI8YlnfucaFR0BGJu9RUeMlRAWL9HyYF1
 HpA2vQjohOhl6o9eawPH+5gtUK6wNbUdw7lUrUkBHxR52XD4L5DPhsCG4wNDI3csneKFtqzcy
 UlJWsJebNDddu2K+pU5beRLxVAPuAnxRluoXTzg3u0fgybDvH5pSTYeFKf1NSqJF0If5QyRpX
 PpxgHhT5o7Ei2BXy7sABuRJ77AhK5Idq9msoAFjDYXdCpUXGnDJFvCwSlErDrg2/kqRK817lO
 AFr+dozzMSWEGJnQMDj/OQjvRcKUY6gYsusssW1flEYPKkwG2AeQE7mxD6oo43tH0ZYSZlWUf
 LPxlr/EA1XjH+DB/QavTDYBKtDiieb+FLhEbKuv+4j/BAkMv4dz5uWlbMxRcGxX3kutCmu6m1
 LmcJ9Syb9ImELF0uxISGx1/K6xrfggvYxYxSpR9Qj8zjKkM5Nekb+o3kAo4MHPvBd6q8pfbH8
 Y2en1AJoJ9MBKBv1GXf0KxrHtWgGzcSWBGdDIusv9ke44LE15teUwsIBnFDgTcGlMNkf0186P
 Iqw/Lmc+nvGw7/BwgfpUgjWy+Lk2SFgIRJy9ikBBwdOEletRAyaJdB4YoYRl/IztXv16/JjB+
 2+iCLHZS5Wvpw1pnwIXPMDdTI7I44dk0NuYCKIZvd8c2boCN6fvhvDCf47uDiGs+kPh4ZBANQ
 srPBWm7kMLl0xPHF6O2ybiq+BXzVZsjfBIsg+m1uL1Nodx1XtN5mY5dHyxaUvJynBNw43TVC4
 1Fy4r0bN40h1iIAjZsVpOgCyrxC+H5qW/+zRkbSo83Af/0CfH8x43vg/e3Tz58RYmIBBzzlxI
 P7ZrrQQa+Pbc5psPYK3+1QTib4n+ToQJOHafpQMUsZW6w0xcHbYHYEHD3OvAFIOTq/6k8d6bh
 f/hnMwe9vsp6gffVTtHLgnWW7Fklsd4io8yADTfJQa71F6LxL+e3GRvwTKpYno9dd884NBGc2
 RtfGIPcbOkOxDFLH05aNm5b4j+PaXHeLgCF/H5tXz7zD2a0IOGhwsbq01U1YqEXJyJgGjIP+e
 NQdC6iwnRR0S5nDIxc1UV+YocgKPoA91fdrdyaPiPkigz/2do7c5CWdN9jJ9IF2UMsHifUEdN
 +wREXltqabdMZvkMYHEE3dWlvA3D5z4B382Ibq/HHWg33kFLoghedf0a+KpKCyuzWbIT7ffof
 Fs1mwac5tlRLFySgRnl6N2GxXkLmoLCtrSePXhgl4OSDZL8BQWGSiHTH8tkvrzNTViGhlP5Q5
 UVyrVuU2KA34RaXlLvGZc42Zq3cgxbQPR8fryZvFG+t9b+bU9tBFFYCjsKGjBRWwKoltbDQVF
 6Y0IW40LsMfbe8jXQOnGXjDy/7hpbh8cfnKwudzGj5yHNHb9s+4bXj4z+efkgAEFGjdNetc+F
 wKN9a+lrwKT2WK2lpdzkc1Vk/s/cHZ10zrP9jUBHCu1n4BWTpWjzTA9TWsTY+MAblYkRwZ4KQ
 42PkUTFVw5TUwGt+iufozG3+sm8QJ+weVKUmKKc3smULh7zp/w/XOnWUMONT2QzOhNWodq7qy
 LQtZfAyK7CLjUf+5fsmFXVsuQZDWmALaTz1B0NOuLVotykBK207wtIX24hObPxDT8Q4oOoja6
 63RN/wjfw4ndbEjYCzYGSolG7isqVM96qhkoslMtd80jRKu0F3J2qQueXUUG3X+I0lZ45Azf3
 NfexLOH21MIPwkilIPkaNtW6grTB5a9RpG++dSeN5VAL9yocudXLzGmnUdQyso2++WqI/Q3FP
 IJuEhpSDYkd08ThyQYLIVVTroEqd1X1+J/yfac3QDoDlcLxCJ5cF2VRvRZgMK3/K3S/nog==

Am 22.06.26 um 21:18 schrieb yahia:

> From: yahia ahmed <yahia.a.abdrabou@gmail.com>
>
> Fix a use-after-free error in wmi_add_device()
> where if a device_add() fails, it will forward
> the error code to the caller function parse_wdg(),
> which then frees wblock, but doesn't remove it From
> pdev's list, thus if pdev were to call it, it will
> call freed memory and result in a use-after-free
>
> Signed-off-by: yahia ahmed <yahia.a.abdrabou@gmail.com>
> ---
> v3:
>    - Fix corruption in v2
> v2:
>    -  Fix use-after-free in wmi_add_device() by using device_link_del()
>   drivers/platform/wmi/core.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
> index 529825dcfbfe..1afc4d12bdfb 100644
> --- a/drivers/platform/wmi/core.c
> +++ b/drivers/platform/wmi/core.c
> @@ -1268,6 +1268,7 @@ static int wmi_create_device(struct device *wmi_bu=
s_dev,
>   static int wmi_add_device(struct platform_device *pdev, struct wmi_dev=
ice *wdev)
>   {
>   	struct device_link *link;
> +	int ret;
>  =20
>   	/*
>   	 * Many aggregate WMI drivers do not use -EPROBE_DEFER when they
> @@ -1282,7 +1283,11 @@ static int wmi_add_device(struct platform_device =
*pdev, struct wmi_device *wdev)
>   	if (!link)
>   		return -EINVAL;
>  =20
> -	return device_add(&wdev->dev);
> +	ret =3D device_add(&wdev->dev);
> +
> +	if (ret)
> +		device_link_del(link);

The documentation of device_link_add() states that:

	If that flag is not set, however, the caller of this function is handing =
the
	management of the link over to the driver core entirely and its return va=
lue
	can only be used to check whether or not the link is present.  In that ca=
se,
	the DL_FLAG_AUTOREMOVE_CONSUMER and DL_FLAG_AUTOREMOVE_SUPPLIER device li=
nk
	flags can be used to indicate to the driver core when the link can be saf=
ely
	deleted.  Namely, setting one of them in @flags indicates to the driver c=
ore
	that the link is not going to be used (by the given caller of this functi=
on)
	after unbinding the consumer or supplier driver, respectively, from its
	device, so the link can be deleted at that point.  If none of them is set=
,
	the link will be maintained until one of the devices pointed to by it (ei=
ther
	the consumer or the supplier) is unregistered.

According to my understanding the device link will be freed automatically =
should device_add() fail.

Thanks,
Armin Wolf

> +	return ret;
>   }
>  =20
>   /*
