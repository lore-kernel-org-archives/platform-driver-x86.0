Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A122F2D46CE
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 20:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774988534; cv=none; b=rmt2156aaqfQqeJbRDvS7MVUBKa4ZSZPdSkwxsAwli5CICtYyuegqTPKk6b3WoOhzozEv5rIip7Pdojumx/Qfjx9mei+DHvxBTxM8PE+6cwo9csZYfcc0WqxEE5lhHvyTHWAW15Sd3E450YEr8/hZFvWVGfFFRFtofm9mMu3gYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774988534; c=relaxed/simple;
	bh=X4pwsSCs6CY1ZTFhzLk4Sy86tGmE7ez+GqfkECY72ng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LzOCxp+D1uUanF50U1EEAf2r+SZ/A4RSgKd+dEbLktTt11yB9dXgoDoyg/206Wh6IqL+Kh8nFyE3/4zX6J7WhgQ7A73kn/Ad9QPIBdgsmEO9NkaTriXYIpAnmkcem5jfJzYKpN0m9f3QzwkMxQCRFrM4zc7ex5KjJSp2GbP4ksY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=R/SRCxF/; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="R/SRCxF/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1774988530; x=1775593330; i=w_armin@gmx.de;
	bh=iJeU7cBPkk8Xke1LoawtrEr71383xnyej70RQWCsDKU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=R/SRCxF/IpJN8neXE73z2XADNpu1mxKnicXe9KjnrT9bW9OM6xU6B3EaTniMnxYL
	 MccY640qMavs9qx4PuNxXvD6yX0EYpoYbRLSCem5lYq9sX/mz2V6nVl0Dgy6KCFCS
	 H2Yu/Py+KqbPUsdoBfGQFsDlJLGa6s2BtIA9QHsCG02Oe8Dzq69v7z16IqLJh+sJn
	 i41d+baJnJ6JnUe+j1eWIf97wlIvOH1Jb9uWUvxQIPYKynDUgvRJ8ZAy/wMXi9b0I
	 NdBY4YzlHEncic4oIWxed8kq1JNlk3dE3LbsWNzaOpq1MUqzY13odmNG80kgNIXsz
	 VUtJpjaRWycNYKf6BA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McpNo-1vZA3s3ExO-00gMlw; Tue, 31
 Mar 2026 22:22:10 +0200
Message-ID: <95e9a9cb-9894-4cf0-90d3-ff22ed941763@gmx.de>
Date: Tue, 31 Mar 2026 22:22:10 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Internal keyboard non-functional on linux on Medion Laptop -
 NTC816 (Intel IPF) has no driver, PS/2 fallback produces corrupted scancodes
To: Ian Jensen <ianmoellerjensen@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <CAJ0oKyQTEJit294y=fs2s2nzhzUs_GQzsgMswDNs==zkdiqz0g@mail.gmail.com>
 <05ae0012-db1b-4826-a466-f706d2a57cc7@gmx.de>
 <CAJ0oKyRU3=qBQvxaBycQYAyxCaVogzuVNv_M=4=npTkBF=X1zg@mail.gmail.com>
 <18a5bcab-84d2-4957-a053-dabbf900e85d@gmx.de>
 <CAJ0oKyR0VPXz887cJsF+oUZFYVD7QY3F3FXWbjAGZGTmFFV-UA@mail.gmail.com>
 <81b30359-7090-430d-8cb1-805cf2d6fcc9@gmx.de>
 <CAJ0oKySi8dLwbjM5UAgtCBRFEGAMpWZfLth=eWcMrBc3=YQqfQ@mail.gmail.com>
 <CAJ0oKySN-q4=RuFt3mTa-VESspRn+OWDSssFtGRJm82ZWGLaGg@mail.gmail.com>
 <b773699a-ea2a-4304-90ea-851e9ee29dbc@gmx.de>
 <CAJ0oKyTsH5r=HuBHePCyW7k5uoC7QFLarY8Ohc7NA-6DYPDxww@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAJ0oKyTsH5r=HuBHePCyW7k5uoC7QFLarY8Ohc7NA-6DYPDxww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Tn9+NTHNwX5QhUHAV4D/P1yvNWYv5GP4ozTB5+PpLGFpnPtcNeM
 FiWoSxoCqN57re+tcrA32v6nBHdzA8HwbZF4I/Gpzlk6s7IKVD9zfWoiWB8kfHpXm0f0R/1
 SVYued+AtezGtEtRg93C51tIoF2GgoaE+Nr0ULClBEWQZFtRVqW1zZwcM8V2j/qKmQcMJCd
 6vKz8bH5H//EYIon78xTg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8+o01YptwKk=;9Q7OFcDv3jBu9HfEybKYnnDB/sf
 BFL1SmLWoeYtGIIYPm76Cic0TJiygz7JN+6JsyFHevIN4rqIiZLcyooZ6U79+YbTRAvr5EggP
 z0teZeLYdlwumbLx9t4aoSAtKYWuz0OU8q78Jv0StlOrsz55Fi98zjHWrV/zoIFGcIDdi3U26
 vF+sgQZtza/9rHigrIJDnOeD0hR373jv4FaAEsdJb9GTNCsAGhBTLgXdlQgsVOUxV5oWkODHa
 6n65cSxFi/6/MKsFyjgTiEJahRuYZD+ubTbHOZ9E6UzuVg40SFi3qSohgF5eO/oAki1aDu2+K
 YNoSDYXchpxeUaZZPAhrbwc5aPeIpFv+riiv2bOaPL0rQW1GwrX48ZerJwkvvVatKvL3mYB5R
 M7/v4rE9cQuVkNTcU67exuIH3Z0LZ6SrtOQz75baesDw1hP41RaRG6Osu4rQJh7si3LQjwCKR
 tMiV6gp3Nzp4RXKJknAA4uVFNzny6+OBzb3SaSXN65l1L/y8jwlTQTixhW67gBHm+ghAmbmw1
 WrMoqGeYq6G9yxmHG1FndsEL6h08koF9THQm8vqukjJnmLZu+5H+pK/KFkUg4Ms934WsJazl6
 f/umRVfJ19AlJ2mwpdMYiZ9P7hBT1q4lda67kE4h0zcxiQOvrZrLISh0jzX66wCN3KSOthrAr
 PPqkX427s1C9mHLIc+ux2Mlp+06+vWMMVbu3+WY9w9xfNpXrKAK7XKEcAnFQ3Bpma134sceH5
 xB2LCrLCNk/QWZQlz9cq+6jQtXE6xYVmb9s+ZY6i4ZzetHc86kTFa7b0Gm3CasFRuef1NyN3t
 GZqAuBxitiMrQbO3zDLL/C5Fov1FX4CMDhbTYKZYUEw4PATRS58o3FlYAH0tIKUazWh6DfZlW
 Z/oA11bhArwfritdvqa1O/Vv5aLsci4J+kqHMx6c8dUhpfUCyUqDIheUBh8rUTPAGR4VwGSpu
 INEVZ8muJJ2832xx/QXK42m3VJ2+3jyL2KPiI9w09+FF+CCj4iJHgMixRGI+YCANy4rX7gN2f
 XjGlJpnigaBF0KWvrhv4sb+kLKO5HPHI5mRRH/ZTFHZPOMFk8bhYIWUSMd8Uf/tlV8DaUzh5V
 P4MKyWzKx7QhBxomQiIgk78Be788N1lzsoioPKCXDOBoUCGV4Y4Pe2UelZqSYlmLQlrmOvmxt
 RVJ9gTPnpwy5lRT9SlsocWum2n4iFHc89+N/WH3k3OKyqbbidcLaheJBlVWdvVOwbpn1R1aUq
 3BAaJKol2HF0quDeD8ckTO+PFclPYib0i5JZlP+cg49mOfg42Vt0/HANerxpj30X7h820OyEE
 jkbVvPOBzCDzl39+n4Oy0ZaUO+tG7ae6RJXYcOj9E8b8//4TNKT2h9d5Fl2UP6ADnCNp6NNct
 eWo4qT0dW5jEZr74ZrDR9oXolPiUdF4CiYraSt3n0zkzQH8UYpAHqFUy0s2V00gYzPE+XHZnY
 jMbrg3XxQcZGECZR/1JppjUCguIS9gaxpvAVb1b3aerU1jKSRy3kKZ0l+TgWwjG4DYxSCq7H1
 tmyk9cqxiw4LjnvJzasdmCYbFwzBkn4tHhhFZSg09JbnNwSuNFU7aBg5VuM3dpRjDG6t9Yj2R
 qHhA6Ge3SuXlCLNlCviRRfz/CXPOSL2EARn62igOa7yJhYT1Sfzfbjx38cacxIKsom4eW+Crl
 OrQARXkLIYG9qwHwe/CPHQuSD3IupF1cliTAIBTFZ3zDw9whDxC4XIASejDHl/tMPMjM/8OwZ
 mClbD7Vph4BGopL3JG1fEukJyFinLeZlwJEABn6V6UGCYEO9cK1W6w5ADlN9OAfSQuFDfH/0N
 fYVVRkrLqEQ3XXeV7lPfh3ZcWPxvsNQVGNm6RpggK1j5/CiRBstYa1nr9eJAnfWBKPZiO+KMn
 E+I8t2JUYoa6bPwhJOl5QzAH0O2Y683SC5AJOE1zRlT/RJ2zmncCvpWRBcAwJ1E0XZnbSW8qn
 LpSFKiQZQnfPsdp7PIolv6XbcT0lQ/bOvgK0YzkyZz2pd4BJBYsn8mgpTa1ASwdTEIvh1F2ky
 uSopEFatX2neSheyarzwt1kaOBxBiCXtksiJBOOeMteQUjHicPhUUrTI9bKMNZ/0rfPt52TVk
 v47iLTY29zavQyzwPKyYUQ1flzdKgAo2AvjS8M2cPyuacsvkvTWd2cQQQi7kLmv4ep/ounf4V
 /jer64kAgEWFTXVqFDqVpIoLwjjCltj9OP150vf1L30Ew/c2Odp17k+uHwCRS7aDvBSIuSX/J
 6lVZ5nqtRRiW/I8QKT9sWj6CHyR/+dAwYGXUAw279z3IZpWD2YjF26MILRGN1KYgxSeUZni1x
 l0KAv8RSpgkGiHpeJqaNgbX6n+7BWSp//WnGpo79yCHQ6jzh/FRpi7cfbomyxVaLB2n05Rbwj
 hwrWCJW5QgBoKEDaeFViwyqBL1cEqEK+4S0Hy/FmgmjvjQaIN+Xjw4dS8/onf+BB6UkECQzGg
 hkjZcVMFHcXvcxsuEI/m2cEi768HxTaXOAVfXqKgom1oH48nhnJSxffHsqPa8jPR51VEe/tIw
 8sRbt3a7m4mQiOhar6WrI8I5iOVGG2DeRQ4rJAhYML6HsXuHVuFHPqIyoJ+N9uecdfIjplYH4
 +KSiJ1smUOygMg5WZjem4qsK5FfT4A7UXexbBojUeosaleF8+jhr2nmpPcfWTq12WXFSyx+G5
 3pw0ZhJ9tOTG7d7oMBlI+DGCE2VEL5/G82SqMUib/lLCTB5OSHx7LyG/KV+qZ5eFDvGaUF1+9
 DAI7TjXZ6CzGepHlpUUwHOmQWOTp/5c0cpjyk/375TGKNtULmRs+IfuIkhLRFdXv6xBFQ1ZP/
 wzgCyzlrSm7N/0lS2VKZBk40koo7kg58T2ouZc1LWbf7TOjj809ok+MRmrAtSghWxsO51J8AX
 3CiXCnl2Fatau0Meh9O41aPWrXK3q9oyjd7G1lz895T12xqWXOUIYhnzCAa/1C5sVVS8DHf23
 zPpVKPZ0YuqAPi7Ra+nuG5edIHjo7zikpz3qF08jC9laIpQLyd3rY274UaUH8KOzH5OpwNxw7
 mQxtDTZa0VxSGLL1AsG3BHEBZPDKfWgHw5Vgbwe1DhzwK0AeqtzXRyY6Q/xpNkqM5Nlp2JGDH
 PXQQQcjzl962qbOr58C0OoTZ/I2+0q9ByOfRXCeUx2vTjuBXFNtNRu0K8L26QMGzQMr3UDLzM
 jPqqScqquGmVy5IalnJN8S8JjY7aPOFdrZXzTSQiv+dRVU8gWo5vX9sMzCY8qe3WY92lrxUPd
 bq1IiMAFh/RrVzfFQfMSDaLYo1i4Ba3pc6pdR0p5v3aNqM5Qs17Wvl5LtvyZr380kDGL7RazA
 99foG6i/xkDxFq13HynVmgrP8e0Kn6XBJcnyhDZ3VmjV4/js5MRP+aV9Yh3OuGCPc75nmw5Ui
 wny/LE2rp/6WG2r9Zhy8KoyJZbhH39FLspCZ66sqgLGNZfQsQ0jd6M5UnATVcesi7vPicyH5S
 0NpIWTLRLOzKGpDgfsYyo9nSuw13OuTLYpIdd1G/owHbFykV2iHCl4zoSq5hyT7RUDfgLQAPS
 2ZdxueIHXLFOSxlzrRtg4HFyh8qJGkQOfd5frt97GIABSjaIWN6gv+kE4mMa9k6geYbPJk3xL
 qm9lQMt/2efBMPuUV7Lkanf6EOZlZXS4kH+M39QdSHO8W51Rh7+CGLPGBmn9zUrjWm4KMKuIQ
 DIHxZs4ZISrAcLfAJOp82XXJwcVy2nA4hUwCZtudO+RaZoP0jzISc/Dh3X8ldh0kCsWJcqU82
 VVFvz3Y6/Bny4Lffp+nVEXV/JZJHhzDKckCr4ayqiq7sLx7oOKA/XUBI6+4gAqRloMIxJ7n+T
 ql0aY6dic5cNZgPhA29DkeaXoqMeqODS3oGa+lAYyd2r5tkOS/QF+ZR+I6+jwAbPUvO7Wu6oh
 D3gdeIMV48EnU/U0IZXzdLQAcDR9nYUjZ7oPMahTnyvuUQ+Nshbi9eFFPanZzhmubey+i1cBJ
 U8twnI0vi3e5hCtQTwvzp5hGF8aJ6jJNDL5WAhtHgknL+hVFKzWrMlpu5K+syYMDursdauEmw
 DpgA2rFr/g0ELvX0kQiOV7nkWm541ETcJKgy6k8Mz8oDNZqDEUX3dCl8bOjmG3wZZkZE49ZGO
 MWKbC70UV5mRFvKneNOsSWrr9dPHNuNTnEI6i1aoeHIBsvntZj9jdo/BQC99ObMcEtKN850DL
 vEzgVGurYWRhC0TV+Rom86sN8lvDa6cghOs0chRcXbzvKCxKUIlg9ALkatgqU6l8ciRCLSVk+
 Q0oSNkz12qos3tJzrHOyW7PbcnX6aGIsgnlaQUJ/gQ7uqAdRwXzH9FCKsgC6+hWmD3jH2OirW
 3fV4nS6jZ9LmWWf2AVi43xfHMCzX4a2AB2drhanhL+iv9MqDAS2d1IzYKapGJPBVNDopDjzHN
 q99ODhUF71vvaebcLqd2ixf6tqtD2Zzp1w8kp95EBAiVUEhsq3OA38mqdq9qZ3FGwNs7RPvBC
 VeXayqtp5+FE4cTuJn0fSlhCRboMiVppgc1aKYy2Wviu1VK7k37ObZ8emfpWTi7vuYFdgY3GL
 3AFDJQ5Mg8AmDU5lohw+e/SVseue5GrqkkXbKo8rgqPJ/ATF2OBHVDXGOJq69u8HQPEpt0DrV
 7TaHPnxP3o+cThVW4zDgWfM1eVK4m0S9o3LVyrEo/QsQ9JJeBSx3Ij74ZPuqOeFeC1SY0URm6
 88i/iHXWPr7da5Ud3JKlsPMSFvvgx819/R/h8C+0DA2NrsmvFlen9JBlKfDDDaAb7sDKccze+
 9cpbp+OtBEf6wYjAeAUNueAaRUVM5lIk/BYPVVbBlaspI1ICv8HkGVVdDE9+Ju7zKVQk1odmO
 BEDB7BqCGI/3mUNGqg+Y3Jk6+EIQkfI6AaIsm5NMnHR+A9yhRMVGqafM2weKK3wCPCjgjkY00
 tSbsNdnz0bvKKPI5pVWW8HzvN/PsC5tLN8HxhE/OhrpGuYSzjznZBi8XwzVHca0TdhTaGgADc
 4szu8APE0cZsjPilztOey3OMl5InXv/8yfmOe6Fq+NRxc2f+Elvg03GH149eoIx9R7zOduzLt
 m+uU+g8mMBg2z59Xxw5duQD8CoUNaeEqJ3zrng4HouS0O71Pv8V2OmO0gezqbsW85MeQNPZd5
 3uuilF0AuJdZf7GkObOxY6LSBsjSXoWao/d6I2HBF0UiuFRbrtFb+TE3AOO+/Habo16Z8Eyr3
 +OQhBaLZU5LiFDUN/6MCf7Cj+f/ar1xLBll1Pr6jiLYmmUUin8/kSvGHiicIpSXG20S+Aapi7
 ITDi/20Khb1DTJsejps4qUIhA/pauHg/HMBIXclZQsPtCAMrRyMH+enaqO3v6O2zbbffyRAI+
 1Eid6rNEKhvIFQ/ohBkVgYEV7YXvvVw5veQ6TVUb36a1AFpa9kITbHmOQWq0hYsjNa4belXQ5
 fYG8aO94l6HbtWhRdf7wFzzz3kawHkkN8RM9BxyI5lHUTyHUgE+CxgFg1f5dXEBiS3wkWElyZ
 jWcrw/biTEDBRbQ==

Am 31.03.26 um 21:47 schrieb Ian Jensen:
> Hello again, no worries. I appreciate that you are willing to help me ou=
t
>=20
> I have tried the boot parameters you suggested but unfortunately they=20
> don't change anything. I've also tried to apply the i8042-spectre fix=20
> but unfortunately with no results. I did have to change some things to=
=20
> even=C2=A0get it installed, soime of which I admittedly don't fully=20
> understand. I have attached a file called diff.txt to show the=20
> differences, though I don't think=C2=A0that it has any importance. Still=
, it=20
> doesn't seem to actually get loaded which is apparently because the=20
> original i8042 driver gets loaded first on boot and can't be blacklisted

I see, i think you need to manually unbind the default i8042 driver and
bind your new i8042 driver:

echo "i8042" > /sys/bus/platform/drivers/i8042/unbind
echo "i8042" > /sys/bus/platform/drivers/<your new i8042 driver>/bind

The changes you made to the new driver look acceptable to me.

Thanks,
Armin Wolf

> Den tirs. 31. mar. 2026 kl. 01.25 skrev Armin Wolf <W_Armin@gmx.de=20
> <mailto:W_Armin@gmx.de>>:
>=20
>     Am 30.03.26 um 21:51 schrieb Ian Jensen:
>=20
>      > Hello, I am writing to see if my email containing the output of l=
s
>      > /sys/bus/i2c/devices arrived? I apologise for the extra email, bu=
t
>      > because communication went silent suddenly, I was wondering if I
>     sent
>      > it wrong.
>=20
>     Sorry, i forgot to reply :/
>=20
>     It seems that your touchpad is enumerated using i2c and correctly
>     detected, but i see no i2c entry for the keyboard.
>     I thus assume that the keyboard is indeed connected using the i8042
>     controller, i think your device needs some
>     sort of quirk. I was also unable to find any information regarding
>     the INTC816 device, so i believe that it is a
>     purely virtual device not exposed by the hardware itself.
>=20
>     I also found that the HP Spectre x360 might have a similar bug
>     inside its i8042 emulation. Lucky for us, the
>     Arch wiki contains a workaround for this: https://
>     wiki.archlinux.org/title/HP_Spectre_x360_(2020) <https://
>     wiki.archlinux.org/title/HP_Spectre_x360_(2020)>
>=20
>     Can you check if this helps on your model? Please also check the
>     following boot parameter combination:
>=20
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 i8042.reset i8042.nomux=3D1 i8042.nopnp=
=3D1 atkbd.reset pnpacpi=3Doff
>=20
>     Thanks,
>     Armin Wolf
>=20
>      > Den tirs. 24. mar. 2026 kl. 22.27 skrev Ian Jensen
>      > <ianmoellerjensen@gmail.com <mailto:ianmoellerjensen@gmail.com>>:
>      >
>      >=C2=A0 =C2=A0 =C2=A0Yes, here
>      >
>      >=C2=A0 =C2=A0 =C2=A0Den tirs. 24. mar. 2026 kl. 22.08 skrev Armin =
Wolf
>     <W_Armin@gmx.de <mailto:W_Armin@gmx.de>>:
>      >
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Am 24.03.26 um 21:43 schrieb Ian=
 Jensen:
>      >
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> Yes certainly, my mistake
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> Here it is
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Thank you. Can you share the out=
put of "ls /sys/bus/i2c/
>     devices/"?
>      >
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Thanks,
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Armin Wolf
>      >
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> Den tirs. 24. mar. 2026 kl. 21=
.37 skrev Armin Wolf
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<W_Armin@gmx.de <mailto:W_Armin@=
gmx.de>>:
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0Am 24.03.26=
 um 21:28 schrieb Ian Jensen:
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> Yes, here=
 it is attached (this is with no launch
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0parameters, so
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> completel=
y dead laptop keyboard)
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0Thanks you.
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0Can you ple=
ase also share the acpidump with the whole
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mailing list
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0(reply-all)=
 so that everyone can access it?
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0Also, it se=
ems that the acpidump you have provided is
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0corrupted,
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0likely beca=
use use copied it manually from the
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0command lin=
e.
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0Please use =
this command instead:
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 sudo acpidump > acpidump.txt
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0The acpidum=
p.txt file should then contain the full
>     data.
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0Thanks,
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0Armin Wolf
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>      >
>=20

