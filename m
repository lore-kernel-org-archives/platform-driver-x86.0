Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5F626B75B;
	Tue, 28 Apr 2026 21:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777410764; cv=none; b=W2mnjv1KAW5uHuZgirXX7cvEJGlIFRmT/U0M1WEnsRfi3OHOhtSsq0kvV35uHB67pHnuEC6jchr0rfwmpwp7ZGIKu+CTpo73WPbnJrRtjxruhSF5zabD6d/z3sXCZKMfib44KHAzDgn7Ktqy8gN21oloVeLyD2XL0IszQhkx/8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777410764; c=relaxed/simple;
	bh=/A/8jyR1ech+jj6bhBVwixdQuVfLnTCSROYw2IqByb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BFhYi9uY/lTT6o/yXoP3zxWrkCUVvziUHSzbhv0F4nn3LbJMj78OxvpIYBuU59IlkNy2O61iFp81dGxWm1k4Ef5rk7cA3BI8ZThzTy/IzgLRsX1M2hc2pi/KwJtDW0nzSJcq1VVm2yKWW4KktvQIcD+9mQqBhVefZVvXNfRhqZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=MijNqs8p; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="MijNqs8p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777410760; x=1778015560; i=w_armin@gmx.de;
	bh=V1sULr/fvOUJzIeJOmj6LvYIqqFVh70arheWd0VretU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MijNqs8p9VUEXSh6fzbdkCTCa5ju3+e9b4nSJHAIpTRv0s1EMKGcorTg2LsbT28c
	 GG2bLtjsc14xUIObUZWnI9Oh7RNqA3pwpooZOwFde7X21DrmF4xBaKp6Y6GrA7KPu
	 Dgk+kwbkdMUq2PDQi/On09H5+/ZnLppyfaKQcj6Njma/1Te4Mkz2wBrxNJByPSkO7
	 fosMaqqOXyCieUzhkbo3gJRGp6nOqe6FzYtt1+noXKO+i/fqGg78F+iT3ewO6GR3O
	 0ZM60FX8wgwhDYNYojj7U1D5Edw5hljSX4BCMOc/ORx+Nn6Y9Vr2tl3b+fiQUAlWe
	 GNtTtvhmenkrnHxNQQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfpOd-1vgKBt09Qf-00qn0p; Tue, 28
 Apr 2026 23:12:40 +0200
Message-ID: <44fec314-061c-4ed0-aa2d-9a25689f42ee@gmx.de>
Date: Tue, 28 Apr 2026 23:12:38 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd: Introduce Halo Box RGB LED driver
To: "Mario Limonciello (AMD)" <superm1@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, open list
 <linux-kernel@vger.kernel.org>,
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Leo.Lin@amd.com
References: <20260427022546.1407923-1-superm1@kernel.org>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260427022546.1407923-1-superm1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IWck+7Wf10QE5BA2H7eV7mweFGE+vWUnAamTw1yy4vlwOm8O5ay
 CPKlF2B7S9LBQQXl+Rvj0DJ69evTVFRwKdaJuZndK+beHdNaEM84XgUFcydRr0DoJqUqXCu
 vBdXvcdOUghefj1pvquwKGCqL2GD1j5U+de3boePYn3FGzTzO16CV/eAGt3G+qYO2BakS+G
 8Su8h6IOHRHmnkJEu225w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RV+ibXRHtE0=;gIh1xD9A7fSSgyMGEy+MkIWaXbP
 6I/JpdvbhMvoQyFuhJGV4dAYhc9bklvG2SryIiJfFKPP7nMjj6L1XsDOhua+lc05Rs2DB47SK
 U+JI9l+uEb3sXtavZttJSowG89waoZpKJU782PjG+hNU4XEBkrbhYc/GpRTs3qg3vfadOAPJn
 u4uuqs1cmBzkjKND9MO5pNMe7AZhlgGWUHzltUybGQ7Aq3g1g3ouy1fpxUUrENmvCxy36UmnZ
 eIdoD1p8AKQRkfNG2vr2gPSGu3tZmB/ZyK9RKzpupAkPpEKZxOZBODI5SaZzdbnmXEeY6PR53
 m+HYUis7iOkU32hTcKuIB8UfQdoJckcSyNZYbgUcsenYSAI5l3petQikbB2cOgvhrvQqnxqCZ
 KEJNdyjnmwpRlv0kVjcNsHSRU54gWLmf3xtohXdap7KrK50xcHlVlnIUrhDYOvydkpN8p+8O6
 kcknLqtJ8y6cxifCsGxS5cJ8SxEL03kl/lGZxtmFJKT4g4bCbUj3wShAG/WDCQDdCK9J09piY
 C7vsuN4w5KRbbja2mdgfWwJIa9xXl4io1/IDTHjk0hAeh7ATdfa6pY1VwHd53aNJt4RSOTzrD
 /C9fiRTHV5B4Dy7FRfBZWuwCic3hTgvqQxkNMWBAbRrSxcGEai7uK7s/dXiwAFB2qvoxSDHAf
 +OFTQ2ZX58NZzYrHyCoqBpu/A1AMvyIcCyJj9zwuI1nUSwXMlDQlfL93OYJbHuhBztQiXtGGS
 FPf0lxTgub36O6U677dbSzIK68Bkql9M1UZsHJ0HPBnYD7XL6qmeyR8FBfCTk1IGmGyU96Rr3
 Djt7Cgd4bMlsPbnZaOpdwBQq+Smi/KhYOwx/f3tkP3buNiq9F0Vlj291Ptyt4W+DXxloxgcmb
 UFzjzZgCuCbw1qsnGkrAzq2IEUc0A4D67K/zNtbVfUm3YW1ZQNWzkq8TySgM4UscTA4TkaYm6
 +9pBHLnUBPBkqF3IzwN7WvgQQ1gtJYJmPAYZuX2DQ14spPFe35GL+rO+JqYWMmBk8vjzLEzHL
 2RfkHtR1dKGJk/otnoc7qN88S9PrsG6SBluHrhF563rb4qrf7AUZb5xUnDmBcvhlTbuBp0QSA
 LSeGItFcz5nAuZL5wlwaJEl6awb641RpgqCkeNzxFETSLquphnJLAbrBbUZ4DXcE4AV6Igz81
 4k8VRU+uVioajocWvOeupajf1Earq7hVoIvZq43dfxDT1yFu6dUTFr718HM82z7ScoLLzUYk1
 GizTkMmN8XGiifZhP53nnCEizYCz6rbgXACdXZBWgPG39mfJk/O+y19oYcp5GuRYcqyY0gKBE
 51iwnTWuHBVDpXtqq3SaKYFrr7VWaJWucckX+8T/nIle0vgzXH9zPc7fawJK2GkOywe5WwdAr
 9l+OWURIsGejDwozMy+nWNlzBMoEZ0pJWsS0a4szGCdyw7ptsSXR+BtMU31wGiqSuAJFL9oot
 wAuJJsLE6vS/Re9WZk15sFO++XU90KWJooszLw8e9B67lm9t69++JV0mimukWS4vjodGF+Q3r
 8jcjomSqOO8I5BHG5Oj7YlACBsZcr/cDgJBp3vFkvQfjUb/fYEZI2GvObtg3wDcSyYBthmWiw
 dfZdqIg+oWyjvTCBaQKkcspAKGTnCqCWWfwvX9qF3Bwwe5TltO6bRTZhwrnPn5jZRUuxvg4YH
 q9zApRX1Rt4YcZKXWP1RFkmqTE7JTep4QvBRrH2NZjc5ug7ZO3l//Yna24KbrVBOz/V+do2aV
 x6F+mCwnTvXKHB8ZuynfMS0/FzU9QoLYxMGD66zughR/fcLZu2y2vXxYvj7ZLnuikarX/Bkfo
 QqT0x2/2tXSLoyWSM77lcfeC/oQc3pW6f41cC/6LIZO1z+d7TyUkURHH6x8vPirF64Hm4fjek
 XdTWUXMwnzntW0eocGwVnM6YQpcVbM2npYx4dNIu2H+4meCZANh2uMN1Jk7/GOUDVm+iwjGlN
 eZmCU4ZlB81cotojkPYBYWtJA+8GR9ugCOnFqcg9lyDsGucT/R6bf8Ob5SXFo84hsswBhTrQT
 lYX3Z1tuPy2Hm6R/4QbF9BsBTTmSNVKzJJRFdkLoNvo+sQ0ZL8grjI3Heu7XoVtwIYcNly1yk
 9stm9kactTV0QiYz4FpFrEkYNRKjL3SMYeg/V4kb/DS/xuiIK5zz9RA8HcF0HU8JTQL9FljAa
 18GLVPiFRdn1jivPn6ScWftIutk3nkUIJ4YNLy7NiKB72rfZrvUmwFMDwDnlaDL/f0RyWjRiZ
 tQGEQONOxeN6o/0/ppjHwcYWEYQZFHrKL19SdoetDgUodSr6sPuSzQ32Kp0jqNp8HQMTtN/H0
 RzJY2ngtiL1czW89H4hqeqzZprgY7pEp6uLJjtyRcbvFln+xXUPI3McsBnhdnevS8lZveqlze
 dAhMtqfQKZ3lrGD2VFyVl3wf3DsM8v5OMbnIFEt9UHL68SO1O4TWE/uIePJipSZLc2rjwiANG
 qGoULfiQfb/L7T6DGPeOVtd5FOBmvURresUGyd7F33tac6NF3dMoMUlHyrhnriNSReFHW+LzP
 JD1QHGGVmLjRQc2llhS5c3Cqv4EFTfL8OvLFpvOtP+KRsnMpBl72T9Gn2QhrOaONmTnC9/KnL
 r9p9iGQJKad4zT7fqNlTn9Cv12NbCHKFgcTrdilEixi2HMFI6lDiAYdks1eDRqzzoL1V+QBAH
 s0CEuP3p3s2I+GGJs6GZRLJ5Qpk1rd29PCdy4pYSI20C71vkh+gFBkYQS22HhhgNZ4nXBvacu
 c3hjPa20GF5u7Ruf3pO7BujehHnY7M7elfQKgSPZ1fWG9s3+UAytRM78AoW6bb0EIVX8psUOt
 ++cIEH8UtrsMTld6WdrcvKt/ZsbzlgIMrl1B+a+nnerxPO2NaLqCClxPWXqmIZQq5X4DqKwUd
 3Ci33ejIEHWdl9M6IdoFYKlwDDLu+hJS2gc5Ol8AcUpS3E1sUiMcnfaJE7TdmAtxmAqa0jgOn
 v6URvelDsylcTbTCiZ2Incz7U56CwHJKIMq7gAk6tm1GhZdtWnCd8LLOc2KR6nS7zfwrQZLze
 Tt6xQ5s+w0guwHlB3JXc46bEyPxXDWLBIwLaAispbV7WazhmjxxY4Y3j3Od1z9vr44q1JRw2c
 kL3pBK3ScrglsSb4tnIaNyZbE6v9q1gSOeJ5Rg0YPwqRURnVgctfq/+sdTifQo/CoGexo6jMZ
 Ipq7yx/S/SAUrKiLK8tGzYuvCABB2tPZy97fQTMzSus8nxfxIhleEq5wlp/FKeJ9RFagri2Dx
 KV9pWHJ6UI3dnzIX6CiWohFvulrPnfbiYyNjbaXmhIuBzo+7FbjmlLH2yWwW2l7uHk/8KzM6y
 fPvs2z4wP9sXpHVSD9+XDzECEOI+H7BJKjqjgDwTXGS6MFa00rjRPy7HHUtEGGd4n75jqTvpX
 22B8XIDulsLPyVa6r5b3jGa7Qn56CwBozRla4Rzk/Ffi5/XpCL64DmgnJWDWnIC0kpwmpFshD
 64V1Jbm+PYLsiGxYTfsiV11CUjxoQiOoGfJGQdBNA0M4c5EZN60DLrXPPSfgAGplhzp+F79wd
 M83pQTdTTz86Pn2gqeUeEnaLFMbwSWrAVoxQ0m4eKUkEnR5hVNdn/7w9Md8NciQWk+UUkA8H/
 Q9GOLmyfyyhLOUA63ksReKOAeEx0diLJJm1RF8ETK3D+Un1ICCokuk/p5xXOZX3mwieDs0Z0F
 2CNGw727JILFhS9CPmINOMKy10UY7QwixvT0CZtumXiX+1AvaG3b7Y0s1HMyZKMUqytu1F12D
 ZzmSs4Jm5SoHFl+5yhHLDoBm9raTWECtrfxxHCpQG2RZoJy6Tc/YJ/gGxocrsTUWIqV8IDVS8
 Dw+8x2dw9C7iqgXeqs7t16703TLoz9dwl8DzZQZH7agaL/TTKkh1gDJvpZjBLTDAoWxG+xZH8
 9SDRaJ27IcqU/o1tLm87bpzUlsYWweLkaSD3VLPs9BeMcLejXvAMpj8HZGCajgbR3+W/IZ2+R
 VcjkptYG02WoouRIG+9fOqNMe6OO/JKaDP2wgqMsjd76VwuFUC1dmmIVqTYV6mjU3ZcMbaEAT
 wYazs0oyW0FbRyKkBEVGjedjiaKIqBZBnGbFMz9H97IsxepJoJ4c3xAlPXckINnOFbdD1ns6C
 CK0JTLTKbLYO737r+89t1BWiJtvFe75HSmrxXVy4csvXOX+t7I3vBotPQU9bYoEgLY/6rHIq+
 QsF4NRiRAg0XUF0gHbhgFr06EW/BPUCplZ8ELGmX0gVKQ1ZxsArA9Ia8k+dndyLJo90DKsSkU
 iismL3CLFlLgzoU/s/lq8KXn7/zySCKFx7QCg3aSUGdJnp15pBBha/vRnfTA0m9DmJgnz62uL
 xzg2oiMerWLqKwiROftlA2ZyeXMx133/5RhLS1wppV/ZlqSs3PVJnUHWunt2d4QEIIAoBrm0x
 vlsM4pw7Qjv0YOjYKdwqpp5Knf8jcY/xOWrALq2LUyxe0zPwDnvFenZQAehaQcEa2VUqBdvgJ
 sK7RMzIf4M6IRuE06bU66t/6Pu9FWjOwlrsPJKtPYdOdli9r8EPzAL2J8gLGr1GZg6o8qcko6
 JrrSZVkNAwm8XH/E3o4BBwczDe9wKr67iUAC0z86CINKxXBEyHcAgMkoTpIKX6VC7LPyF3kUc
 gxuFYNofqd2BQ20PNUD8h0CNK9jejKY6/fhiB8dKhl6qz2whTxWOXancd+RJuX06eq4GoWgB3
 YJWK1rlE25m1+p3GIihkJKd7oRZ8yyEgsuDCPd8RTTo9aRgvriuJO8CC3kNO3IbdrWSsfMDNT
 2fpESo9ZySnHctn7rpSpUkI/aMK87Eg+6ynjBymRVet48QGloaaFKOFCDZ3k+4ZYSXSnIQRM1
 Or5dkki17h3W1FHBl/XUfTOzqz2n4KW8RXsJBZMx/l5H5rP8BbAY9gstMoo3XuwdJIdg7+F5U
 iXkY/GVqKnhM3KMJybCWwzRAXrjRv1prgYlIKnprlsdPpZ+kbI1PZ/NsOpMh8HEIXnPNS5xwO
 1dVEoffWECQECIqGQ2YFqY3GxFb4Pjjd5Mu04YT/9EeFqJAP2W9rS9j1s5cHEmate0UqMzZG7
 S+ZG4e8ZXtpISN/x2tJonKBX5Dd1nY8ZJJjSAVxp60ydX1hdmWvRFD89L0q10F+QiUAtOs3ai
 A5wqpcxuLAAqyqCgZ5xkl85ue2mAV3KwuUjo2fuQ3KUqYFmef/m35m5BvgMM8JvqcUxHOHtMt
 +P1wdWXmKemBi2mV2KD5Io1FfeO8nPk1G5XZcGz+8Iq/GFtYkkyWB3bCoun1NTMhGKoX5Hbab
 agu5ribXWq2Vk9dsz5YdcSpSIC/eMak5NS/Jn7QclJipcgjcnZKpHgNbYuMbyWAxD2xuEyaJP
 EpDNm/uj/iWa+2oBfJTqwkm9zcCNJRWvDzes3RfyWErJEcVJrAwfHMx0L/OWTNy9UMSDkejpb
 0buggEbu47LRX7q6Mu60NpOHr4WX/utfDztFx+nQSZsh6OpfiFAj70DZATIPUjqoKjubvvxIS
 FBwLSq+d8ZKv2NmMRBz/wf3lpfkFu88lEuCIds69lvMMEKONyhNse335qloowwfHF/5icJxbP
 pHPzSxSIy4mLYWaUdC39puOsngU=

Am 27.04.26 um 04:25 schrieb Mario Limonciello (AMD):

> The Halo Box features an RGB LED light bar that can be controlled
> through WMI methods to display any color combination.
>
> The driver exposes the LED through the LED multicolor subsystem,
> allowing userspace to control RGB values via sysfs:
>    /sys/class/leds/amd_halo:rgb:light_bar/multi_intensity
>    /sys/class/leds/amd_halo:rgb:light_bar/brightness
>
> Hardware interface:
> - Three separate RGB channels (Red, Green, Blue)
> - Each channel controlled via individual WMI method calls
> - Value range: 0-100 (matching hardware range directly)
>
> Co-developed-by: Leo.Lin@amd.com
> Signed-off-by: Leo.Lin@amd.com
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>   MAINTAINERS                             |   7 +
>   drivers/platform/x86/amd/Kconfig        |  12 +
>   drivers/platform/x86/amd/Makefile       |   1 +
>   drivers/platform/x86/amd/amd_halo_led.c | 375 ++++++++++++++++++++++++
>   4 files changed, 395 insertions(+)
>   create mode 100644 drivers/platform/x86/amd/amd_halo_led.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2fb1c75afd163..c35b654a65041 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1124,6 +1124,13 @@ F:	drivers/char/hw_random/geode-rng.c
>   F:	drivers/crypto/geode*
>   F:	drivers/video/fbdev/geode/
>  =20
> +AMD HALO BOX RGB LED DRIVER
> +M:	Mario Limonciello (AMD) <superm1@kernel.org>
> +R:	Leo Lin <Leo.Lin@amd.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Supported
> +F:	drivers/platform/x86/amd/amd_halo_led.c
> +
>   AMD HSMP DRIVER
>   M:	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>   R:	Carlos Bilbao <carlos.bilbao@kernel.org>
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd=
/Kconfig
> index b813f92653686..d642386938055 100644
> --- a/drivers/platform/x86/amd/Kconfig
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -34,6 +34,18 @@ config AMD_WBRF
>   	  This mechanism will only be activated on platforms that advertise a
>   	  need for it.
>  =20
> +config AMD_HALO_LED
> +	tristate "AMD Halo Box RGB LED Driver"
> +	depends on ACPI_WMI
> +	select LEDS_CLASS_MULTICOLOR

I do not think selecting whole subsystems is a good idea. Consider changin=
g this
to "depends on".

> +	help
> +	  This driver provides RGB LED control for AMD Halo Box devices
> +	  through the LED multicolor subsystem. The Halo Box light bar can
> +	  be controlled via sysfs to display any RGB color combination.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called amd_halo_led.
> +
>   config AMD_ISP_PLATFORM
>   	tristate "AMD ISP4 platform driver"
>   	depends on I2C && X86_64 && ACPI
> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/am=
d/Makefile
> index f6ff0c837f345..2f467dbbfc8a3 100644
> --- a/drivers/platform/x86/amd/Makefile
> +++ b/drivers/platform/x86/amd/Makefile
> @@ -10,5 +10,6 @@ obj-$(CONFIG_AMD_PMC)		+=3D pmc/
>   obj-$(CONFIG_AMD_HSMP)		+=3D hsmp/
>   obj-$(CONFIG_AMD_PMF)		+=3D pmf/
>   obj-$(CONFIG_AMD_WBRF)		+=3D wbrf.o
> +obj-$(CONFIG_AMD_HALO_LED)	+=3D amd_halo_led.o
>   obj-$(CONFIG_AMD_ISP_PLATFORM)	+=3D amd_isp4.o
>   obj-$(CONFIG_AMD_HFI)		+=3D hfi/
> diff --git a/drivers/platform/x86/amd/amd_halo_led.c b/drivers/platform/=
x86/amd/amd_halo_led.c
> new file mode 100644
> index 0000000000000..01b4583ca70f3
> --- /dev/null
> +++ b/drivers/platform/x86/amd/amd_halo_led.c
> @@ -0,0 +1,375 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AMD Halo Box RGB LED Driver
> + *
> + * Copyright (C) 2026 Advanced Micro Devices, Inc.
> + *
> + * This driver provides RGB LED control for AMD Halo Box devices throug=
h
> + * the LED multicolor subsystem. The Halo Box light bar can be controll=
ed
> + * via sysfs to display any RGB color combination.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/led-class-multicolor.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/wmi.h>
> +
> +#define AMD_HALO_GUID "081E747B-E028-4232-AF24-EAAEAB2B1E86"
> +
> +/* WMI method IDs from MOF */
> +#define AMD_HALO_WMI_GET_LIGHTBAR	0x01
> +#define AMD_HALO_WMI_SET_LIGHTBAR	0x02
> +#define AMD_HALO_WMI_TURN_ON		0x03
> +#define AMD_HALO_WMI_TURN_OFF		0x04

Hi,

can you use an enum for that? Also i suggest you create a small piece of d=
ocumentation
under Documetnation/wmi/devices so that future developers understand how t=
his WMI device
is supposed to work.

> +
> +/* Channel selectors for Arg0 */
> +#define AMD_HALO_CHANNEL_RED		0x01
> +#define AMD_HALO_CHANNEL_GREEN		0x02
> +#define AMD_HALO_CHANNEL_BLUE		0x03
> +
> +/* Status codes from spec */
> +#define AMD_HALO_STATUS_SUCCESS		0x0000
> +#define AMD_HALO_STATUS_INVALID_PARAM	0xFFFD
> +
> +/* Brightness uses 0-100 range */
> +#define AMD_HALO_MAX_HW_BRIGHTNESS		100
> +
> +/**
> + * struct amd_halo_led_data - Driver private data
> + * @wdev: WMI device pointer
> + * @led_mc: LED multicolor class device
> + * @subled_info: RGB channel information
> + * @lock: Mutex to protect WMI calls
> + */
> +struct amd_halo_led_data {
> +	struct wmi_device *wdev;
> +	struct led_classdev_mc led_mc;
> +	struct mc_subled subled_info[3];
> +	struct mutex lock;	/* Protects WMI method calls */
> +};
> +
> +struct amd_halo_wmi_args {
> +	u32 arg0;
> +	u32 arg1;
> +};
> +
> +/**
> + * amd_halo_wmi_set_channel - Set a single RGB channel value
> + * @wdev: WMI device pointer
> + * @channel: Channel selector (1=3DRed, 2=3DGreen, 3=3DBlue)
> + * @brightness: brightness to set (0-100)
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int amd_halo_wmi_set_channel(struct wmi_device *wdev, u32 channe=
l,
> +				    u32 brightness)
> +{
> +	struct amd_halo_wmi_args args =3D {
> +		.arg0 =3D channel,
> +		.arg1 =3D brightness,
> +	};
> +	const struct acpi_buffer input =3D {
> +		.length =3D sizeof(args),
> +		.pointer =3D &args,
> +	};
> +	struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *obj;
> +	acpi_status status;
> +	u16 result_status;
> +	int ret =3D 0;
> +
> +	/* Validate input per spec */
> +	if (channel < AMD_HALO_CHANNEL_RED ||
> +	    channel > AMD_HALO_CHANNEL_BLUE ||
> +	    brightness > AMD_HALO_MAX_HW_BRIGHTNESS)
> +		return -EINVAL;
> +
> +	status =3D wmidev_evaluate_method(wdev, 0, AMD_HALO_WMI_SET_LIGHTBAR,
> +					&input, &output);

Please use wmidev_invoke_method() instead. Take a look at Documentation/wm=
i/driver-development-guide.rst
on how to use this new API.

> +	if (ACPI_FAILURE(status)) {
> +		dev_err(&wdev->dev, "SetLightBar failed: %s\n",
> +			acpi_format_exception(status));

Please remove dev_err() here, the return value is enough.

> +		return -EIO;
> +	}
> +
> +	/* Parse return buffer per spec: Bytes[0:1] =3D Status */
> +	obj =3D output.pointer;
> +	if (!obj || obj->type !=3D ACPI_TYPE_BUFFER || obj->buffer.length < 2 =
||
> +	    !obj->buffer.pointer) {
> +		dev_err(&wdev->dev, "Invalid return buffer\n");
> +		ret =3D -EIO;
> +		goto out;
> +	}
> +
> +	result_status =3D obj->buffer.pointer[0] |
> +			(obj->buffer.pointer[1] << 8);
> +	if (result_status !=3D AMD_HALO_STATUS_SUCCESS) {
> +		dev_err(&wdev->dev, "WMI returned error: 0x%04x\n",
> +			result_status);
> +		ret =3D -EIO;

Please model result_status as a __le16 and perform a pointer cast
from the buffer (after the size check of course).

> +	}
> +
> +out:
> +	kfree(output.pointer);
> +	return ret;
> +}
> +
> +/**
> + * amd_halo_wmi_get_channel - Get a single RGB channel value
> + * @wdev: WMI device pointer
> + * @channel: Channel selector (1=3DRed, 2=3DGreen, 3=3DBlue)
> + * @value: Pointer to store the read value
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int amd_halo_wmi_get_channel(struct wmi_device *wdev, u32 channe=
l,
> +				    u8 *value)
> +{
> +	struct amd_halo_wmi_args args =3D {
> +		.arg0 =3D channel,
> +		.arg1 =3D 0,  /* Reserved */
> +	};
> +	const struct acpi_buffer input =3D {
> +		.length =3D sizeof(args),
> +		.pointer =3D &args,
> +	};
> +	struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *obj;
> +	acpi_status status;
> +	u16 result_status;
> +	int ret =3D 0;
> +
> +	if (channel < AMD_HALO_CHANNEL_RED || channel > AMD_HALO_CHANNEL_BLUE)
> +		return -EINVAL;
> +
> +	status =3D wmidev_evaluate_method(wdev, 0, AMD_HALO_WMI_GET_LIGHTBAR,
> +					&input, &output);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;

Same as above.

> +
> +	obj =3D output.pointer;
> +	if (!obj || obj->type !=3D ACPI_TYPE_BUFFER || obj->buffer.length < 3 =
||
> +	    !obj->buffer.pointer) {
> +		ret =3D -EIO;
> +		goto out;
> +	}
> +
> +	result_status =3D obj->buffer.pointer[0] |
> +			(obj->buffer.pointer[1] << 8);
> +	if (result_status !=3D AMD_HALO_STATUS_SUCCESS) {
> +		ret =3D -EIO;
> +		goto out;
> +	}

Same as above.

> +
> +	/* Value returned in Byte[2] per spec */
> +	*value =3D obj->buffer.pointer[2];
> +
> +out:
> +	kfree(output.pointer);
> +	return ret;
> +}
> +
> +/**
> + * amd_halo_wmi_turn_off - Turn off all LED channels
> + * @wdev: WMI device pointer
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int amd_halo_wmi_turn_off(struct wmi_device *wdev)
> +{
> +	struct amd_halo_wmi_args args =3D {
> +		.arg0 =3D 0,
> +		.arg1 =3D 0,
> +	};
> +	const struct acpi_buffer input =3D {
> +		.length =3D sizeof(args),
> +		.pointer =3D &args,
> +	};
> +	struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +	acpi_status status;
> +
> +	status =3D wmidev_evaluate_method(wdev, 0, AMD_HALO_WMI_TURN_OFF,
> +					&input, &output);
> +	kfree(output.pointer);

This looks strange, does the WMI method return any data? If yes then pleas=
e perform error
checking, otherwise use wmidev_invoke_procedure().

> +
> +	return ACPI_FAILURE(status) ? -EIO : 0;
> +}
> +
> +/**
> + * amd_halo_brightness_set - Set LED brightness and color
> + * @cdev: LED class device
> + * @brightness: Brightness value (0 =3D off, >0 =3D on with color)
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int amd_halo_brightness_set(struct led_classdev *cdev,
> +				   enum led_brightness brightness)
> +{
> +	struct led_classdev_mc *mc_cdev =3D lcdev_to_mccdev(cdev);
> +	struct amd_halo_led_data *data =3D container_of(mc_cdev,
> +						       struct amd_halo_led_data,
> +						       led_mc);
> +	u32 red_hw, green_hw, blue_hw;
> +	int ret;
> +
> +	guard(mutex)(&data->lock);
> +
> +	if (brightness =3D=3D 0)
> +		return amd_halo_wmi_turn_off(data->wdev);

I suggest that you update the RGB color first, otherwise the LED will retu=
rn wrong RGB values when
turned off.

> +
> +	led_mc_calc_color_components(mc_cdev, brightness);
> +	red_hw =3D mc_cdev->subled_info[0].brightness;
> +	green_hw =3D mc_cdev->subled_info[1].brightness;
> +	blue_hw =3D mc_cdev->subled_info[2].brightness;
> +
> +	/* Set each channel individually - 3 WMI calls required */
> +	ret =3D amd_halo_wmi_set_channel(data->wdev, AMD_HALO_CHANNEL_RED,
> +				       red_hw);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D amd_halo_wmi_set_channel(data->wdev, AMD_HALO_CHANNEL_GREEN,
> +				       green_hw);
> +	if (ret)
> +		return ret;
> +
> +	return amd_halo_wmi_set_channel(data->wdev, AMD_HALO_CHANNEL_BLUE,
> +					blue_hw);
> +}
> +
> +/**
> + * amd_halo_brightness_get - Get current LED brightness state
> + * @cdev: LED class device
> + *
> + * Return: brightness last set by the user, or AMD_HALO_MAX_HW_BRIGHTNE=
SS if
> + *         it was set by BIOS, or LED_OFF if all LEDs are off.
> + */
> +static enum led_brightness amd_halo_brightness_get(struct led_classdev =
*cdev)
> +{
> +	struct led_classdev_mc *mc_cdev =3D lcdev_to_mccdev(cdev);
> +	struct amd_halo_led_data *data =3D container_of(mc_cdev,
> +						       struct amd_halo_led_data,
> +						       led_mc);
> +	u8 red_hw =3D 0, green_hw =3D 0, blue_hw =3D 0;
> +	int ret;
> +
> +	guard(mutex)(&data->lock);
> +
> +	/* Read each channel */
> +	ret =3D amd_halo_wmi_get_channel(data->wdev, AMD_HALO_CHANNEL_RED,
> +				       &red_hw);
> +	if (ret)
> +		return LED_OFF;
> +
> +	ret =3D amd_halo_wmi_get_channel(data->wdev, AMD_HALO_CHANNEL_GREEN,
> +				       &green_hw);
> +	if (ret)
> +		return LED_OFF;
> +
> +	ret =3D amd_halo_wmi_get_channel(data->wdev, AMD_HALO_CHANNEL_BLUE,
> +				       &blue_hw);
> +	if (ret)
> +		return LED_OFF;
> +
> +	if (mc_cdev->subled_info[0].brightness =3D=3D red_hw
> +	    && mc_cdev->subled_info[1].brightness =3D=3D green_hw
> +	    && mc_cdev->subled_info[2].brightness =3D=3D blue_hw) {
> +		return cdev->brightness;
> +	}

I do not think that this is a good idea. Maybe you should initialize the b=
rightness values
during probing and just not implement brightness_get at all as the hardwar=
e seems to have
no possibility to read the global brightness.

> +
> +	mc_cdev->subled_info[0].intensity =3D red_hw;
> +	mc_cdev->subled_info[1].intensity =3D green_hw;
> +	mc_cdev->subled_info[2].intensity =3D blue_hw;
> +
> +	return AMD_HALO_MAX_HW_BRIGHTNESS;
> +}
> +
> +/**
> + * amd_halo_color_set_default - Set LED to initial color and brightness
> + * @cdev: LED class device
> + *
> + * Sets all RGB channels to 20% intensity as an initial state.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int amd_halo_color_set_default(struct led_classdev *cdev)
> +{
> +	struct led_classdev_mc *mc_cdev =3D lcdev_to_mccdev(cdev);
> +
> +	mc_cdev->subled_info[0].intensity =3D AMD_HALO_MAX_HW_BRIGHTNESS / 5;
> +	mc_cdev->subled_info[1].intensity =3D AMD_HALO_MAX_HW_BRIGHTNESS / 5;
> +	mc_cdev->subled_info[2].intensity =3D AMD_HALO_MAX_HW_BRIGHTNESS / 5;
> +
> +	return amd_halo_brightness_set(cdev, AMD_HALO_MAX_HW_BRIGHTNESS);

Please fold this into amd_halo_probe().

> +}
> +
> +/**
> + * amd_halo_probe - Driver probe function
> + * @wdev: WMI device
> + * @context: Context data (unused)
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int amd_halo_probe(struct wmi_device *wdev, const void *context)
> +{
> +	struct amd_halo_led_data *data;
> +	int ret;
> +
> +	data =3D devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->wdev =3D wdev;
> +	mutex_init(&data->lock);
> +	dev_set_drvdata(&wdev->dev, data);
> +
> +	data->subled_info[0].color_index =3D LED_COLOR_ID_RED;
> +	data->subled_info[1].color_index =3D LED_COLOR_ID_GREEN;
> +	data->subled_info[2].color_index =3D LED_COLOR_ID_BLUE;
> +	data->subled_info[0].intensity =3D 0;
> +	data->subled_info[1].intensity =3D 0;
> +	data->subled_info[2].intensity =3D 0;
> +
> +	data->led_mc.led_cdev.name =3D "amd_halo:rgb:light_bar";

I think the lightbar could be viewed as a status LED, so "amd_halo:multico=
lor:status"
would be more suitable here. This would also mirror the uniwill-laptop dri=
ver.

> +	data->led_mc.led_cdev.brightness =3D AMD_HALO_MAX_HW_BRIGHTNESS;
> +	data->led_mc.led_cdev.max_brightness =3D AMD_HALO_MAX_HW_BRIGHTNESS;
> +	data->led_mc.led_cdev.brightness_set_blocking =3D amd_halo_brightness_=
set;
> +	data->led_mc.led_cdev.brightness_get =3D amd_halo_brightness_get;
> +	data->led_mc.led_cdev.flags =3D LED_CORE_SUSPENDRESUME | LED_RETAIN_AT=
_SHUTDOWN;
> +	data->led_mc.num_colors =3D 3;

Please use ARRAY_SIZE() here.

> +	data->led_mc.subled_info =3D data->subled_info;
> +
> +	ret =3D devm_led_classdev_multicolor_register(&wdev->dev, &data->led_m=
c);
> +	if (ret)
> +		return dev_err_probe(&wdev->dev, ret,
> +				     "Failed to register multicolor LED\n");

Why not using devm_led_classdev_multicolor_register_ext() here?

> +
> +	ret =3D amd_halo_color_set_default(&data->led_mc.led_cdev);

Please do this _before_ registering the LED device, otherwise userspace ap=
plications might
have already set a RGB color themself. Failing to set the initial hardware=
 state should also
result in probe failure.

> +	if (ret)
> +		dev_warn(&wdev->dev, "Unable to set default LED intensity through WMI=
: %d\n", ret);
> +
> +	return 0;
> +}
> +
> +static const struct wmi_device_id amd_halo_id_table[] =3D {
> +	{ .guid_string =3D AMD_HALO_GUID },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, amd_halo_id_table);
> +
> +static struct wmi_driver amd_halo_driver =3D {
> +	.driver =3D {
> +		.name =3D "amd_halo_led",
> +	},
> +	.id_table =3D amd_halo_id_table,

Please set .no_singleton =3D true here.

Otherwise the driver looks good to me.

Thanks,
Armin Wolf

> +	.probe =3D amd_halo_probe,
> +};
> +
> +module_wmi_driver(amd_halo_driver);
> +
> +MODULE_AUTHOR("Mario Limonciello (AMD) <superm1@kernel.org>");
> +MODULE_AUTHOR("Leo Lin <Leo.Lin@amd.com>");
> +MODULE_DESCRIPTION("AMD Halo Box RGB LED Control Driver");
> +MODULE_LICENSE("GPL");
