Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18E01C9B76
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Nov 2024 21:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732226047; cv=none; b=q3oiIkBmVNxrBrZRKTDxy6LkI3DUeLl/CIKzGKiyxklb4HsgRekI61cv3+GdTcMxqff/OHnMRRivCb/C46DKRGeBGhpb1ZmBix8X/wyG5XlY+4kKfz3rbvjZW9L7z1lF/HixKbqgm8YwqNDWOytU3+h+SMwd1k50D8dplpK7b5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732226047; c=relaxed/simple;
	bh=ifLpZQrWqE/vJr/w/xfN2IM94D1/r+qv78hFLhvweHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=O5lI9jqOrP35ZiroCm/sPb2Ero9nOP/Z+RL3nilODjNQMNB+ccCgAWiUZn9LURH4ZvVJc8M2N2gGlkQPQ/TidrI0gzbNwilh3KwPGs+hNensmetKjY+gP3WmEGCcT901WvWa680EHF16fuMdgcWmOxZcpDlBtoXGdjhrZkyvrxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=mNbwwkml; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="mNbwwkml"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1732226040; x=1732830840; i=w_armin@gmx.de;
	bh=ifLpZQrWqE/vJr/w/xfN2IM94D1/r+qv78hFLhvweHw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=mNbwwkmlLyn5lGpxU1R+4EZSY/H31NNRylrFzaqUhovgYAWqEkrpdoFM7PJTNsxk
	 H5h41fMc8j/HwDqztmxbuOZgsO2SPD+FPssIqooP7RDaljPpikfTGGCOFp8AjsoOU
	 Gsk3ozoqvZzBUUo7KYG85pxnxedqqiUqSGnNItuyVgrtIQp6H5yHQxI0M4OCM0nnm
	 d+8rA05oCspfTuEF169uZYUEhrmLTJLBQr+ie9ecbzLTWwl9+KGXgh5iHvAU2UKAC
	 7KzLjZ09Pj20upsumxYXzVYhm/r3bvLkWIdfGie37lpQrFHDmWfpnSLc0hjwQib0I
	 RsWQHwwh+OdyjCh+CA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.129.174] ([176.6.148.212]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMGN2-1tUGL80TFm-00R1ij; Thu, 21
 Nov 2024 22:54:00 +0100
Message-ID: <04db3001-55ca-4d9c-aa78-f9286b1d9ccc@gmx.de>
Date: Thu, 21 Nov 2024 22:53:59 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: acpi_device->driver_data vs acpi_device->dev.driver_data
To: Werner Sembach <wse@tuxedocomputers.com>,
 platform-driver-x86@vger.kernel.org
References: <64d96f64-4512-44f6-be3a-ba07043485b6@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <64d96f64-4512-44f6-be3a-ba07043485b6@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SAWghkaS9nyO+LCwFNSXS2iaxl8yYU0yxj0RXFBe56ZhxHpLeWv
 NGez4rE4PVirIpvVyhMX0m23LMZOJ8f8SNWoMHsiyfUjfK4uk4yB/nglFBZNC0TomcyZBUV
 MbDct3C9t1AYoVIBA1l6I/LiravH9GrUhUqTBTJezOppl30+BMwYXUT1N7I7weFrssvS6qa
 izV5Q5NtI/JpSLaFkXMcA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/vbwicV97wU=;8CLbuqzFXFyB5XUNn9pWzlEKFLu
 tFVk6ol7q+6MrWNlN7Z1N4UyeD5jMRfj5f+83ym9bPfDsR57Qv1Ybqx62zihnIjx7PAXGxnb3
 f4dhpFW1BK0huoZLwfIaW/FwEPoZ/Gag8yhYlG01N7HPXwgKqdoTVpRZyA1rlG0nuY+jXzKup
 pNCaTjtos/aX8p502lx1D7NxkqYLVMK3L5HfZvWazQ5N8xEMBgNbvL01ZPDUe3pi5de7ntdeX
 VvdFmVCZz3u3ENp6zGAV/1dL7Caeb1udthbS3OkywTXjhlJT1M2vSeQrSK6ZP9qCW5Pkn9k6f
 xXyST3WApLQ2h9CcVqNieuyuUpvz2gBIqMKT/yGmnOZ1/jN21GSMymMHJJ/yjKk/WYSIHUoQ4
 AprzpO7QfTAckHsbX2oS8KtdH0h0PoMBJ1+FwbFKvcZWsfmPln7c4yUn9/rNwT5nu2vg/sD/z
 poKN4V6WeQ3Usxpc3x8MKEFqWGn2i/OYcTOYm9VHued1ce4BI3RLS+Q8ySOmxM3jVNWNb3ZCG
 e2Dy+6bRPNixqXqW1ijGJFCHSpAn3yVaO8xiSdk01TdCx7+uuI+lRoA/G7XbFMZSkJawfe5e4
 8TZHsfeahOWQgy2K294mszxpHqzsr2Ws8jOkpnJik/H8m9igORZcdPm5M9sXlMftojReMMBkj
 Wd3BiTGT6y5TNWmLthERdTIjEAKKapZCwUmXE4VostEaBbgry03b55w6GB4ldaiYjiKN38n0y
 eLcc/LeCvF6rfRRgaqJSSz9hWqFHBJUyrU2ylnANgCwk6y1dNaqGeNza7DfB0W1rkQI6Y27y8
 cPL/b+i/Xd3f1hv73AKGaK4/wqmW4jx2H00iIklYvLAABuQeg+Ym4ak8FWJgACtp1z0PhPrEL
 GweXeN51ar2UdvOK9ZosKgiSzuu+xbyCNEPhlmVW8c236Tvi4saJ1aSs6EWe0GNJaTdizC0W4
 dLnTbwhG8va8LsmHBYzrlfLctgykB3yf0NEy01VHtGXbt7/0lFTtdUILsnsFF256GTHs+3N0R
 Pan57O31L196FSRXTyt81Mo6mlWb8RIqVlDuc5HwKUdKYfvTntqLqurHXHmVtt0ou7yZqNflg
 3tdV3oskSxxtU/xQBUTQPGW+4FTEjZ

Am 19.11.24 um 17:43 schrieb Werner Sembach:

> Hi,
>
> another quick learning question: Why does the acpi_device struct have
> a driver_data member in addition to the driver_data member of the
> nested dev?
>
> What should each driver_data member be used for?
>
> In contrast platform_device and wmi_device only have the
> dev.driver_data and not the top level driver data.
>
> Kind regards,
>
> Werner Sembach
>
Hi,

from my point of view the driver_data member inside the acpi_device struct=
 is deprecated. You should use dev_set/get_drvdata()
instead. Other than that the semantics are the same (i think).

Thanks,
Armin Wolf

