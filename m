Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9951E7C3D
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Jan 2025 21:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737754702; cv=none; b=nc4jq2m7F+odgmRWuESbJojfNpErC3nxmz5JbYpwURbA1wz+1v+ug5TtImbGW04TkS5M8lF7QC/SI2Fdq3PuEK8IrCqT9SUCdX5KiHceZMw5cOH0L/iEbFycgcOq2vESctrwBUJ5bwh1a+KQCVtjbR/Kg7TmTDG/qjr16AxE9fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737754702; c=relaxed/simple;
	bh=8sWSEmdG3GQ6SHN8mvPkds76hMWeBZTjpdV32dMTkAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DNYEokdw2hTEP9gw4xxBagAhHQ0NVw1LoUtJUeF6wVHZEq6tqlgBRa/hSp0GvJ4jiymcCbuOLRDhtfrtLT9Sls8UyggL1FFqiGSX5YXtdrSAhKbcZvQRvDacPS2tI6Rd++XrJ9xmoq0MfvOLNNfVE5K2JopQ0scz+3e1R14nNGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=DqnUebP4; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="DqnUebP4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1737754698; x=1738359498; i=w_armin@gmx.de;
	bh=2HS8EjuhfkxkVvBY8Pp59WUZM2Vee6pZnsU4ApWvTIw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=DqnUebP4nAIcYz5rG7tz8qLBWbwdsPjh2goTkyPkgmLEdj4CZ4cTMpXh3RbaH2x+
	 kumwjItGgwTOtFkQBmIrKzi4G83hprQwn7zUo0sHGvagmYRHh6PcBS7VmzaOuFfTc
	 ezJzx8JrhLh9MsH6Fak/TqnlgYd3VOaViCtS7aWM9CzlD4ohR3maGripuYazZXo4d
	 skToBKzwPwLIyt7Kme7W0shWOBfeh36jWpIeI3Z7lpU4XeNB3ZjSm66EWnJ3YX1BA
	 6rM+3/IPOVNUFl/lAzJ7iLPRr+tx7odQ0p4oMsc+gmte2kck5xwuJbYYkYUGpZBM2
	 XddKdKBdcPBmgfDuPg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.246.83]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MC34h-1tle7w42sn-0041SW; Fri, 24
 Jan 2025 22:38:18 +0100
Message-ID: <083e0184-19e9-4473-bebf-5536b3d5ec10@gmx.de>
Date: Fri, 24 Jan 2025 22:38:16 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Need help fixing turbo button and power profiles on Acer Predator
 Helios Neo 16 (PHN16-72)
To: Sourajyoti Basak <basak.sb2006@gmail.com>,
 platform-driver-x86@vger.kernel.org
References: <e0f625f4-9c55-4021-ba43-668edb9fe80d@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <e0f625f4-9c55-4021-ba43-668edb9fe80d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pqUphRq9204lQ2zPe22fg+ej7d3OxHf/9jOP6YL2TytXIYNSAs7
 EP+0T4KxBaDUhKktA1J0POSzFs9PDfVCyqoj0XxiAdrep+6YHxAkWevQyaEZ3//Dx0RYPli
 ScGRb6M2R873eeOgs1HwUqPtPJ52x1ue2zzM/SiKvVKNd/poN5LUyCCPhzd+UatMyrAm6Qu
 b0UZ1ZcNv4Sdo7RwNsw1A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yB4pUVdPA7s=;bnouEjWonn6+BSgRM8ej7o1e76p
 9VA8JVVY8MwkKAgWYptUrnYm0MdV/D1Fsa0waA1MOlHon1uWq8cJpirgZnUhHjLIeej9fuI19
 aaSidGLmC1Q8/g7KniKFAtWUrqFYs8okYNv3WmJ8ttVziZRrODiP7EjE13MuF7YgqQB1QedyE
 nhelt0emiaAeVhC0NjB/9EGxpiCE0iYLptyA2ErgrdNZZPL6WOY5sTZm04ObvqoQ67tsJrSF3
 XPf6nLwRkkPpt31JXyx5cVak9Bplzt+Gq8qVOWWiyXscshJndOD4SCOuTmVUd/7Q7KXNuQE8g
 Kj59T5IqI7uy5HpVkvipkO+RsBT89dMASevwdScsUhNjH1vXJu0i9xXAOurFLtE1T0AuMYhMz
 nLNL2qYPJ2IjHE+orSqMawC4lIGUwEG4fHZBIp+8YdrA5bdrvQFVHPvaVqiaCcE+pzHYzDF39
 CxMF+b1rFMFhlRlnyUr3eQPI4gJ7BEP1uf46kR8memwK+/0Qh0ov4RYNTznOEb8EApIwclMLy
 SfXxYiK48jRA7XE55YxZrc0a1EHd0wQIMCxG48iCAC/TFKK5XGVfUxsGWq2GDD6qsOTb9tPN6
 Q01h/OGT8B5e06NqTQITQZTNjw7xtbHY02/cyrQ0CwDZ6HATtOaxDOAQdgWRMCCbA+xkjrL+D
 IEnFThGMHq8Cjf+Kw0ba/svhjsMf7QQrypM2y4RulUvBdRHL11fCN9+ppiCEF83s/9Ri08Kjx
 AZejTVnCXpWI9fRBHu5/wrZwtyCbWOiBre6j4AgbX+FaNL5HZyhEotroEADlc4oWo7VRFhSxJ
 b8drPcHbMxpeSO6b36DIrb8fEKq7CAQIoHOr/+nE9ppeukGQab2kYoRJDNpbxfzgYVEUqsbg/
 cAvemlPVdaTWtwv5hq0vpF7I1r2wBItpk3OdjmtyMr6yHvQ0DbZNFvJ0BuONw/cw4djOWSHQC
 WDkJ0MQU+MPe52aUQBI8ORWyXwXjbbEMTDELA0Lv+ZTzNMePaMOmC1U40H/PON43TuzPgwfbS
 w1Rn8cU0qK8tWahjlf8gk+nGJguQ6tGBSUX3hjRekK6zrDYzYLzX1lScLbu5ipd/lP/v772hw
 zxS2P6sLukkMIPwl0VT8WKgDRcYyfFmcFS7KEDIXB13KPoeXZmbBJJS2NLmgdom4okgK9R/Zf
 Tx1u86oEpZSLwSzQqOW4e0Gr6k0C/0lGFzq2wKbZqQrUzoyOahpmn9od7Eq4+mTZz0uglKLIg
 W0PuFUUyzTel0GNpCQ9PNllI57+Ws+H8Ng==

Am 15.01.25 um 17:20 schrieb Sourajyoti Basak:

> Hello,
>
> I am using an Acer Predator Helios Neo 16 (PHN16-72), and I have
> encountered an issue with the turbo button functionality on the
> default 6.10.10 kernel in the EndeavourOS live USB environment.
>
> The turbo button does not cycle between power profiles as expected.
> However, after applying the
> [acer-predator-turbo-and-rgb-keyboard-linux-module](https://github.com/J=
afarAkhondali/acer-predator-turbo-and-rgb-keyboard-linux-module)=E2=80=94w=
hich
> is a fork of the `acer-wmi` module=E2=80=94and patches
> [1/5](https://lore.kernel.org/platform-driver-x86/20250113-platform_prof=
ile-v4-0-23be0dff19f1@gmail.com/T/#m40bfb80c3a0c043ac038b28079fdabf3a82817=
83)
> and
> [3/5](https://lore.kernel.org/platform-driver-x86/20250113-platform_prof=
ile-v4-0-23be0dff19f1@gmail.com/T/#mc563cc0254709d02740942360a8ca47b9d6352=
6c)
> from this
> [series](https://lore.kernel.org/platform-driver-x86/20250113-platform_p=
rofile-v4-0-23be0dff19f1@gmail.com/T/#t),
> the turbo button started cycling as intended.
>
> Additionally, the `/sys/firmware/acpi/platform_profile` file now
> displays the proper profiles when cycling, confirming that the cycling
> functionality is working as intended.
>
> While some functionality appears to be working as expected, there are
> a few issues:
> 1. The turbo LED light switches correctly, and the keyboard backlight
> turns off properly in eco mode.
> 2. However, there is no change in the base fan speed between the power
> modes.
> 3. The maximum CPU clock speed achieved under `stress -c $(nproc)`
> remains consistent across all modes:
> =C2=A0=C2=A0 - All modes reach above ~2.5 GHz at some point.
> =C2=A0=C2=A0 - The maximum observed clock speed is ~3.8 GHz.
>
> Additionally, when switching from turbo mode to eco mode, the clock
> speed briefly drops to ~1.5 GHz from ~3.5 GHz but ramps back up to
> ~3.0 GHz shortly after.
>
> I would appreciate guidance on how to resolve the discrepancies in fan
> speed and CPU clock behavior between the power profiles.

I know of another users who suffers from the same problems. Sadly i do not=
 know how to solve the fan speed issue.

However i have a experimental patch which does add support for manual fan =
control to the acer-wmi driver.
Please share the results of the following commands (needs root privileges)=
:

	busybox devmem 0xFE0B085B 8
	busybox devmem 0xFE0B085C 8

Regarding the clocking issue: i have no clue why the CPU speeds goes up to=
 3 GHz, did you install the Intel thermal daemon (thermald)?

Thanks,
Armin Wolf

>
> Thank you for your time and assistance.
>
> Best regards,
> Sourajyoti Basak
