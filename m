Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE61E27FD52;
	Thu,  4 Dec 2025 16:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764864735; cv=none; b=MwsGIpwfR1HsxrwL+2meyPoq4dA0zEH8MBSOgRM+43+BwaaHUYzdhmbHUqITZv4e8otjetj1SiDVpEBknub0o2fSDjGRWWkrWbnP2HMc7FmlE8bYlHSbb8zKy3cg+UNpfdSDTw9hXKFK/ACOoSJGrS4nZQqUialULImtrLYsumw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764864735; c=relaxed/simple;
	bh=K4N13fxO5XJ1wk9T6vu+uJGDj0sUWJXDpVsSRJ2gPBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KmrIYfCmZqqzvuo0aL8ArV/L3npv5G2PlWrpK70w1T0CySidvBfXFwbMvFMXmRk6cQr85EFzrtzo1bY7Ta4LxIzvDtNantWC7wPxbQyqHIAvBonqwyLyUY+pk2kjy6IkFPyDIJRHNjMGFjbBv8xk8e6R4B2n0RRz21VlTn37XUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=aEww2KoN; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="aEww2KoN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1764864718; x=1765469518; i=w_armin@gmx.de;
	bh=LMtnPkWRPOZZTsrfnGw9vNpHpvYmNjUO7DoPSikPnDE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=aEww2KoNybaekdjV+bFUS0cHRriwpB2lolNOjkA5k4kwK6tGBAQSgDuyyAaLM4FD
	 PtpbbFDCPEs5uB/6TKfu3l8lrusdqiUuX1cA554G4V+/f6kaZA0fRZM9n+Xhra8gV
	 GuX+Zea9Kfs/oAZGICnGH2LydhSgyPh5dttSJ4pp0366r11cvK+3zLQcWDQqSa+hu
	 OqyqEfp06g8RMOr+KBypq3mNANqRjHoBOc8dINWoZP/AH5ZkK70gM5PHDJ8tY3Ynb
	 t5Y8FreVdHstk3i1LxLxCLsH9pSEbeJPbj9dRbOKX5MnAOU7ILJ2IIPar6U1JXDJQ
	 YZHmGdDGrrzHmo+HeA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N5GDv-1w9unr2aYf-00tFrh; Thu, 04
 Dec 2025 17:11:58 +0100
Message-ID: <a3802a6c-e771-4802-b0ba-10e5c8185679@gmx.de>
Date: Thu, 4 Dec 2025 17:11:57 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86/uniwill: Implement cTGP setting
To: Werner Sembach <wse@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251204135121.435905-1-wse@tuxedocomputers.com>
 <20251204135121.435905-3-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20251204135121.435905-3-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iBzcCcK8J5ElR8Vifpfm0MaR9v2/6wzH5xBM7POSmhzHzIVT6V4
 tR4EC+p5EIUK8qxTU6c3Niu6jLKbIOBu6UcZVllQvmgpwMD1tfAVWc5b+PyR9dtT1tG6buF
 Ek6YSmtVQKqaAt0StNUC850yQDtQjM6D1ZM+agPCxcrSZWLZKAmd50XzISdV0Jsx62nT6/d
 bz2q1bA0XvqSroOogwTyw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XU3XQGgBmD4=;pSDW2CPLqtNIIcwqptsuRy/DVdN
 PvePodBBcLasOva7RyxsWJARQeDDjvcpzWSVdwpgHNHTtYbwxrxr+FMlAW1ZOn5RNPjXeP3KR
 wr2O9XdxES1zj0LKFBKFC+OwI5mVO5+vp+dDS0R4H1SJdzk79A5z2eJg2lZhejXX5j0Jn4y0z
 mSbd+R1X+9VUCYKrv9eAGkPyRcWQQHgp6v5ul2cnXCbx1zgwW50pLhUnQ6Ew9iKa/TJdJ7Tyn
 Rpk2Jm1k+RY31zX3dKhZkeSVpAW5brMHkN/hdUI4NiyXZILQkhQ1mYaG7kNOIm8i9WYvkC3fc
 GboSoHKuHxgxxmtl3Nyj3IZt8U6W+3Uv2pyZ2lHRqDfQ/dvCOQ9nn/zEl/gAFcFkrohiKVebn
 UG0ETjpXVg5+tpFKyg3J1ZvnXvgH6uIe4YH98i/xwWhrvNKakecFW2GmLyyIPkWJkmRCvm/tz
 Ipl6AOpu9ms8AKaEJZWGbhF5vI5y0zRQJM7QHBMWn2eyfcdGyD/vfr6cddf2z1ThzGN3whikZ
 wV6uulzLY06R3H6dzmLN2NUv341rtAwdt27hasygCsXdC1VLC/zwIRrBOFDuLo5JkS5wNOyUc
 tSQz4w8O74taFOrf928uPCQJv7yPpDQawRoFWWcQL7qjHJMC+LIiPm1PcCIDABIDd3AYFRIgH
 P7MVvO9bWiW4C1vAgBUywJ7Z62XHMYGO4Xt2Nkhm+NKQVBnRGd/Est1+dGrwqlkHrAec71PGO
 FwSXX07l4k9f2ktC+MQLTiOcr1N7o98U9i1K/SU6+MpFOu9Kl3DQVxXVhLhetfbWgOsEWAroH
 RPZCffyYtXUhDKhWCd+RTWYqKhwMqAApQx668yU7jD8javAz8Xr1aepg/8IBMPo+y0U4bn3Dr
 PLVVdmmdzaZ8wdSQrY/5EBTVOSV8+JH2rfRl9VfxlOMNr2Xn6mBEpUa97NCnmxzRAvRk5KjEJ
 jJpSyywN/R+oRna6GJs+Z9Zz3SHa73rZOhkLKQzzY/pVOTzHzoebGkgZt+MHHRUs94PEYq2PR
 T4IJlB3E5TlM/2LtIJJBIAqn0rP6m6J5dFT3N+TGYoLgA7GBUqV/rUhm7BC/lRM+TGmfztGs6
 tKCmmBUeSCjfAJgb+J+u7SH8i0HAoRXwlbuNpnMd06wmvkqLteSiG2fq+qH1uj3fXmVit21m0
 ujHIFlELOEyRRophBtpN7cLKWmrSvTAfTqU7rCMs6HHsHT+7AEUvVuJUyC41wHl1wg8uvAsW3
 XcPHmE8n83welRljD0rrMEwNIdTCCL+yoyo04URikt58rU9ah56+dUIXxu89TjzdmPiQXLYXD
 HalYLdP+TAWe0bAsc8XUL9zny3cP5qvNMb17m7CyxVZb4TZmfmdKkZSjA8caaLNBVIAo7qKqR
 ORKNvkg8Ll8mwIZmR5l602qiLPmWzYCQCK09ojdhQT7bU30ncYvLMqsiKZBcktLredqynFPV+
 XZOSX0U/EG/P6s6ya4owhTW6MrzIjkbb0Jprs7P1mWwjrNjMI+0fHbJzQxeyMwcH4L4g+5oPx
 OyMYyLaLuBQNNb79rLjNB1Jz73R9kqNwF0uMGcmLWgcwcFgqVJRrzVU5J7IjuE6B3ScCWn/iJ
 Ka5ByAq/NM5ehOR6JUkYq7TZEzxBVU9t7e/yJeqNkUyJ+1YygLrr2ZoLFrOSPaaZh2KHc5OcJ
 eFxAOp3ljEv3b783x+dVVhX96WCyMb5n3crO1eWm541H8QVtuDOlRHI4D5kGqM96/XJQAKAcL
 /MaCZBhMFVQE63tROFCbuoZxhWE29AWvNrDoFemGJbsESyazoRu+r6TcPqpzOghNdp1jUEavX
 cveO7Wp8IyMVLjcf+p+oTfkVmLlblAg/34WjvZLdub3kf+1AMLK6tUwx3B2BVxUuVhxGHSQ1g
 z/e5hl/7JsoF16iVXtpHuXWyBPTKM42vYboXsYDbmb2JopqGPzfh5/AFs0EE8I3wK0mvH6UfG
 mU08eFK7xzeOGQ7e8cg8Wt5gcZ5PUuxfazSJ1iS1r9m42/WSxFP+tGrMY8GWrVR0IuPRjcj0d
 FhjF6XqxmsjQXuBYFQbqXkyRfPnPesdr5IF/t4NH2jbiqziHLiK9vIsNrss9bFvKLIzKg3o2b
 moV5TTiuFGrDeiXrCeqzP3RU87hnhbqlyEVLFk1Jq/l4L9OhBSJsWmOabAF8LD38uZmRJCSwl
 Mp6mZNSkn4qA0CwXKob/M2LzAyqIt7VExoTLBuAikAV0HqQ60wMo7sD2m+7+CgbQMyLiFcmPU
 71pufjjILQbBRFiauQbaUoQRTC1oxcehz4968NjThqFPVIUDQD6sJOLCEq3rOfkkdCnyJPm8s
 UHCCl5m8L1B9jvOwo70ifcrwVSXUu4US2laA37kkW24YHs2cOy2L+q8hEEPHaaRso/PjksTMa
 sy/+iLPhZFnZpyUqPqxA8sAXWCAFG7q0qIIffN9AGVArNi2XM0SgEcink+Pf0fKgZei54SL44
 mxz5ciIcWdGmI4kBcaiXZJFARl31sxcqVOhQRiXNI6ipk4NMBN+wLWo2CvGCmacDXhg63IGPw
 mj3rTlNhxwg+CAqlqarJfOjVvynGOo3e8hooFSgRF1egWsqfhOWzNjyzQbREYK+sf1BsV3hOc
 w37askcb3WmrCILC4qMnMnSBgLDhpLzc47X6nULJdcOE9AceN+RAu2KMVz20ceCvPa9nGAzsj
 vvEeE6kqA7yd/fQ+YaaV26ZsW/PFE20U3drQ5ldAlFBykIjFbcm28wKyuZWJEG4M19gbn+hyW
 D8MFTFNmP2+2hFB0KVIkmJw+CplkGbtjoYYKvLLJnutc3A+W3nB2j0rKLAfxc+RatErOnLs38
 K2lEAnPC1nH26BDB7Yx4/3fHMtrxauxpNzHWXHNFeWKDx6EYdRi1I/4/beeYQZ7iWE63ImhsR
 UkyUKA3EyPW9ouzZ0O8Kk+5WMvyGoft/pteFGW7UvOM0RjZcYQFi+D9kVgHusd+O4HlzCYofD
 CQvuSTUfkghY0pvhzKaf8xAW5dyip30/WB3acbO6nYcOYShnk9fbLjeUpR4cWU8hQreUXQUHr
 UNnAbWAYfCLKyTL6lWNprDKjrqoobMdDHv2st89NhQK/GkhDEck59i8fuwmRB93qOBs62KBzA
 VGIlcOTGdVLvnjKq03S0MrZkaOd0VIceU2Xtj02Kckb93bLF3tck67FVD+VEOTiDEgkn4EqX2
 YhJ8yXnPP8W8lmFzywGJLixp4z9e70vZ9gNniCugFe8sjyPzTRpMuLzpnDfwzvGm7CmtXGCdJ
 2f5zAolr/pR6FeMKBCryC8LS5OE2+haySxF8DWrn80+7IQUzBy6tT9O4/1eynnl9Q4L1mY7Aj
 4LT3Q/oPI+QD7Jnhz0lC5SJkPREOFtFmJ8LY/IolRkpl9MBlNIoUhRrt6B/AEow9rbH53lmoX
 5or2t0OIOblC0SwbHjcoNDnzce2DrNSth7tK10jHvhew5U07WhMm45x9/46a3pl1yShrEqIhu
 3xNQ1sFbdWRmk4ZCO2IqQZytHLqdFCO1ZJnuOhNA2myiawv01MQnhdg5hu+jszc/GjRr6yCRc
 0XrJjIBflgs+p/a4/d+5UxElfrPwsRK5hCEA5iKTrWTFDWHqjXpyVrk/2t0SmGHGpsfrE8D7i
 1koVGMTEEwCvhPts/R7AwYW037rGqQMC4ZfCW5KGzUKfk+k1PT7J5XcjldaqeSD8TtsvEexqf
 eg6j4ezRnjcKxCakcj8lhzIn2ui13BsZS4w50owLr2qPuvXOTjwLPebyuaZDRygnYKQFCTIVN
 RTcL1kd1mIRyqMU12LsIE4qf0xz3vC3F6CeoJ+MEJ66AleyUYrPcCEKapFwO2o9c48rwgmA97
 nk5SbI/2E5DGTS/pE3wuxMDzaiJpFu6jQ9v+fSxD/sDwpTJUFOZUhKI5wEVVR3fxWb1bnWlYG
 yfsWmMiKQUh0frmHxmAahKdGNcrLuCkuH+tnaIiQg/NmEFGYRywKA3QOj1/9tTrz4IaCIhOg3
 B85Ncm40tzPcEdrTZr9RoNELFQo54MV73LWEyuE9FnCwDBRPh8UN9zlrirMja6hNPIKqFCqJ/
 h1ehnanshZUzRyLrc7wUZZDm7FYbo4UpHCRmS5kKx/ct9VC5GyC9Zq14WYs6Ewu8gwJiELn5B
 iCD7iYm2leqa4M8wVSqpxnwvNmaYOh/7FKk3sAc9pjnQFtAU1XxzRpJO12S8jneJZkIotZfhz
 bW5ieoLEm9BzeEL4Iq87c8GnUNrz7QRPP+IS5fGsRtzChKsoTI+e7JEAHSnJau6nGha9FskHh
 iYa5i3wqZqRXgWwv8uve/yEXCohpWv4XkgNjjPspirnLzpNnFQCZ1aZRglIc2XMWRdAqUAwdA
 kT1Q17OFOQrLx465ZXuZ3FDmLlQzmFZ0LAzhFFD9Xdzxghzg9uy+jdPmHWIRXySOccCOzM9m4
 j8aKPoIjpJJA6tCbzcSyMSyQAWegAjfPW8MeF3TkkZ//lxn34i8YcrYH/6LwYkAKZ1Gsv3Oci
 83DG/QrEmpuNJNmJWMPkMneV+mArPIPc57r/z67X161nWrGAUtLcAR5Z+ijlTyPS2bsinUwBO
 8C74dB9OrhD7aZ+lK4/a4elvVSoArNSDmrEK9bWQ2O1dFNiMdcy26rOUgyqk9mn+JLMs17Cpk
 GUVvuE0tQdVC2DU/vMV/ehUPTiJJWVZjHLItm2R55sZUw8VzdqS4HGDa3atfIlpRNHGFUZ2QO
 6b/c/jFr1jI0chwIECqmYFMtXMaRVw3nZLFYw37y2yTloDszZzIZHj83PsfMIyaamrmHF2tk+
 bQZ0dC1WDkdTKneoTLZ6nWV9OzK4QL7HEZHHTCZfK1NEtOc3lXv9Gch6k/WZHZvUUJsz+WEKi
 j9Y9pRzDssp0b/CWfMh7DLemRLd9k/3oaQFwmuzeaLBYufjtlqPqRA5oewM6OKdUtJ5RoD2A+
 zCdcIhwq7c0VFbrj5/rDy3TKNCiUnuPsBf9i/LNXylrH7zFxMs1v2g1aniln0aTRHJ3OK3M3G
 EhrfcH9qLj+93A9KRq3qcO8HJxoWq1OffOZPDSRUnJBb22oib98l0udr/zM87w9Sv5egqBSRi
 AHSqsTlLbE0qTIEMZXrLroHZ2RqsLppuR/GWYSsnutSezD3x+TxTxAsYg8QvVYl2trYsUh80o
 VGsVz2Qf7w3vgYvPo6ulRYWBuqhqEiQ0Aiw2Q8B1QRQycMCxjvUPX33fSSBlVQ2dydh12v6gQ
 gLSWAvpuTgufqIK0cp6jgvtcgzUg/

Am 04.12.25 um 14:50 schrieb Werner Sembach:

> Uniwill offers user setable cTGP for their EC on devices using NVIDIA 30=
00
> Series and newer GPUs. This patch implements this setting as a sysfs
> attribute.
>
> For one device, the TUXEDO InfinityBook Gen7, the variant with and witho=
ut
> NVIDIA GPU can't be differentiated using only the DMI strings, so the ne=
w
> probe callback needs to be used to test a bit from the EC memory.
>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 160 +++++++++++++++++---
>   1 file changed, 135 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index 01192c32608e5..f87f6e9d08234 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -88,6 +88,9 @@
>  =20
>   #define EC_ADDR_GPU_TEMP		0x044F
>  =20
> +#define EC_ADDR_SYSTEM_ID		0x0456
> +#define HAS_GPU				BIT(7)

I think you need to tell regmap that this new register is readable
by modifying uniwill_readable_reg(), otherwise phxarx1_phxaqf1_probe()
will always fail.

With that being fixed:
Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> +
>   #define EC_ADDR_MAIN_FAN_RPM_1		0x0464
>  =20
>   #define EC_ADDR_MAIN_FAN_RPM_2		0x0465
> @@ -122,11 +125,11 @@
>   #define CTGP_DB_DB_ENABLE		BIT(1)
>   #define CTGP_DB_CTGP_ENABLE		BIT(2)
>  =20
> -#define EC_ADDR_CTGP_OFFSET		0x0744
> +#define EC_ADDR_CTGP_DB_CTGP_OFFSET	0x0744
>  =20
> -#define EC_ADDR_TPP_OFFSET		0x0745
> +#define EC_ADDR_CTGP_DB_TPP_OFFSET	0x0745
>  =20
> -#define EC_ADDR_MAX_TGP			0x0746
> +#define EC_ADDR_CTGP_DB_DB_OFFSET	0x0746
>  =20
>   #define EC_ADDR_LIGHTBAR_AC_CTRL	0x0748
>   #define LIGHTBAR_APP_EXISTS		BIT(0)
> @@ -317,6 +320,7 @@
>   #define UNIWILL_FEATURE_LIGHTBAR		BIT(3)
>   #define UNIWILL_FEATURE_BATTERY			BIT(4)
>   #define UNIWILL_FEATURE_HWMON			BIT(5)
> +#define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL	BIT(6)
>  =20
>   struct uniwill_data {
>   	struct device *dev;
> @@ -515,6 +519,10 @@ static bool uniwill_writeable_reg(struct device *de=
v, unsigned int reg)
>   	case EC_ADDR_LIGHTBAR_BAT_RED:
>   	case EC_ADDR_LIGHTBAR_BAT_GREEN:
>   	case EC_ADDR_LIGHTBAR_BAT_BLUE:
> +	case EC_ADDR_CTGP_DB_CTRL:
> +	case EC_ADDR_CTGP_DB_CTGP_OFFSET:
> +	case EC_ADDR_CTGP_DB_TPP_OFFSET:
> +	case EC_ADDR_CTGP_DB_DB_OFFSET:
>   		return true;
>   	default:
>   		return false;
> @@ -548,6 +556,10 @@ static bool uniwill_readable_reg(struct device *dev=
, unsigned int reg)
>   	case EC_ADDR_LIGHTBAR_BAT_RED:
>   	case EC_ADDR_LIGHTBAR_BAT_GREEN:
>   	case EC_ADDR_LIGHTBAR_BAT_BLUE:
> +	case EC_ADDR_CTGP_DB_CTRL:
> +	case EC_ADDR_CTGP_DB_CTGP_OFFSET:
> +	case EC_ADDR_CTGP_DB_TPP_OFFSET:
> +	case EC_ADDR_CTGP_DB_DB_OFFSET:
>   		return true;
>   	default:
>   		return false;
> @@ -803,6 +815,69 @@ static ssize_t breathing_in_suspend_show(struct dev=
ice *dev, struct device_attri
>  =20
>   static DEVICE_ATTR_RW(breathing_in_suspend);
>  =20
> +static ssize_t ctgp_offset_store(struct device *dev, struct device_attr=
ibute *attr,
> +				 const char *buf, size_t count)
> +{
> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret =3D kstrtouint(buf, 0, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D regmap_write(data->regmap, EC_ADDR_CTGP_DB_CTGP_OFFSET, value)=
;
> +	if (ret < 0)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t ctgp_offset_show(struct device *dev, struct device_attri=
bute *attr,
> +				char *buf)
> +{
> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret =3D regmap_read(data->regmap, EC_ADDR_CTGP_DB_CTGP_OFFSET, &value)=
;
> +	if (ret < 0)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%u\n", value);
> +}
> +
> +static DEVICE_ATTR_RW(ctgp_offset);
> +
> +static int uniwill_nvidia_ctgp_init(struct uniwill_data *data)
> +{
> +	int ret;
> +
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL=
,
> +				     UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL))
> +		return 0;
> +
> +	ret =3D regmap_write(data->regmap, EC_ADDR_CTGP_DB_CTGP_OFFSET, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D regmap_write(data->regmap, EC_ADDR_CTGP_DB_TPP_OFFSET, 255);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D regmap_write(data->regmap, EC_ADDR_CTGP_DB_DB_OFFSET, 25);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D regmap_update_bits(data->regmap, EC_ADDR_CTGP_DB_CTRL,
> +				 CTGP_DB_GENERAL_ENABLE | CTGP_DB_DB_ENABLE | CTGP_DB_CTGP_ENABLE,
> +				 CTGP_DB_GENERAL_ENABLE | CTGP_DB_DB_ENABLE | CTGP_DB_CTGP_ENABLE);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
>   static struct attribute *uniwill_attrs[] =3D {
>   	/* Keyboard-related */
>   	&dev_attr_fn_lock_toggle_enable.attr,
> @@ -811,6 +886,8 @@ static struct attribute *uniwill_attrs[] =3D {
>   	/* Lightbar-related */
>   	&dev_attr_rainbow_animation.attr,
>   	&dev_attr_breathing_in_suspend.attr,
> +	/* Power-management-related */
> +	&dev_attr_ctgp_offset.attr,
>   	NULL
>   };
>  =20
> @@ -844,6 +921,12 @@ static umode_t uniwill_attr_is_visible(struct kobje=
ct *kobj, struct attribute *a
>   			return attr->mode;
>   	}
>  =20
> +	if (attr =3D=3D &dev_attr_ctgp_offset.attr) {
> +		if (uniwill_device_supports(data, UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL=
,
> +					    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL))
> +			return attr->mode;
> +	}
> +
>   	return 0;
>   }
>  =20
> @@ -1413,6 +1496,10 @@ static int uniwill_probe(struct platform_device *=
pdev)
>   	if (ret < 0)
>   		return ret;
>  =20
> +	ret =3D uniwill_nvidia_ctgp_init(data);
> +	if (ret < 0)
> +		return ret;
> +
>   	return uniwill_input_init(data);
>   }
>  =20
> @@ -1557,6 +1644,29 @@ static struct uniwill_device_descriptor lapkc71f_=
descriptor __initdata =3D {
>   		    UNIWILL_FEATURE_HWMON
>   };
>  =20
> +static int phxarx1_phxaqf1_probe(struct uniwill_data *data)
> +{
> +	unsigned int value;
> +	int ret;
> +
> +	ret =3D regmap_read(data->regmap, EC_ADDR_SYSTEM_ID, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (value & HAS_GPU)
> +		data->features |=3D UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL;
> +
> +	return 0;
> +};
> +
> +static struct uniwill_device_descriptor phxarx1_phxaqf1_descriptor __in=
itdata =3D {
> +	.probe =3D phxarx1_phxaqf1_probe
> +};
> +
> +static struct uniwill_device_descriptor tux_featureset_1_descriptor __i=
nitdata =3D {
> +	.features =3D UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL
> +};
> +
>   static struct uniwill_device_descriptor empty_descriptor __initdata =
=3D {};
>  =20
>   static const struct dmi_system_id uniwill_dmi_table[] __initconst =3D =
{
> @@ -1606,7 +1716,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTQx1"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/16 Gen7 Intel",
> @@ -1614,7 +1724,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxARX1_PHxAQF1"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &phxarx1_phxaqf1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 16 Gen7 Intel/Commodore Omnia-Bo=
ok Pro Gen 7",
> @@ -1622,7 +1732,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6AG01_PH6AQ71_PH6AQI1"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/16 Gen8 Intel/Commodore Omnia=
-Book Pro Gen 8",
> @@ -1638,7 +1748,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PG31"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 16 Gen8 Intel",
> @@ -1646,7 +1756,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6PG01_PH6PG71"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen9 AMD",
> @@ -1814,7 +1924,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxMGxx"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15/17 Gen2 Intel",
> @@ -1822,7 +1932,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxNGxx"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen3 AMD",
> @@ -1830,7 +1940,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxZGxx"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen3 Intel",
> @@ -1838,7 +1948,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxTGxx"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen4 AMD",
> @@ -1846,7 +1956,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxRGxx"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 15 Gen4 Intel",
> @@ -1854,7 +1964,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxAGxx"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15/17 Gen5 AMD",
> @@ -1862,7 +1972,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxXGxx"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen5 AMD",
> @@ -1870,7 +1980,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6XGxX"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16/17 Gen5 Intel/Commodore ORION Gen 5"=
,
> @@ -1878,7 +1988,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxPXxx"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris Slim 15 Gen6 AMD",
> @@ -1886,7 +1996,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxHGxx"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris Slim 15 Gen6 Intel/Commodore ORION Slim=
 15 Gen6",
> @@ -1894,7 +2004,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM5IXxA"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
> @@ -1902,7 +2012,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB1"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
> @@ -1910,7 +2020,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB2"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 17 Gen6 Intel/Commodore ORION 17 Gen6",
> @@ -1918,7 +2028,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM7IXxN"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen7 AMD",
> @@ -1926,7 +2036,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR5xxY"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen7 Intel",
> @@ -1934,7 +2044,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen7 Intel",
> @@ -1942,7 +2052,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY_mLED"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Pulse 14 Gen1 AMD",
