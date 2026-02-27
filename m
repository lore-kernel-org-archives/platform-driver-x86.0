Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB3A3603CA;
	Fri, 27 Feb 2026 09:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772184971; cv=none; b=NG+iGufxfmXipf9iLNcVsHJAxgoNiCPZlyVpz1VCGjTKJwQAnYN5Mztg6t6xCpCgA86/fDVassSd6nvW9hltNqi2Shzb6w4nDa870woq+PJ/UDb6/o/AQtLt8M92vUkN83EM3OwWqIsSX1YAIWrZdYFpqgtPL1G/Dg1xFG7VW58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772184971; c=relaxed/simple;
	bh=xWafjx+wAjCAuS8PrWqmpyQgJK+gnkK2hhFuqTMy8wk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hEUVYb4pfrRGeeEBK01W4/rjWr7LtBizg91YmDinK8qL8XyaxAcTK1+L07WrZvmmLtY83DpaA6gtOdkwcPlI/479sjWxlhjLsO1aUfXRgrka8BydezJT4fwMzWTYuhQh1H9vEXpNn0c45SzxMDleGrrnIUOM5fMFiR7l64miMKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=RRzbcNXp; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="RRzbcNXp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772184967; x=1772789767; i=w_armin@gmx.de;
	bh=PNY7bMaulMmOgejQOJVLOAdf7FpYq5v3M5IGtiGqfqI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=RRzbcNXpLG2mHpqTTkXWE1RXeDQPxbwGPOPDjiv6saoQRfOQrxjOUkspD70AI5Se
	 b98rL6uGzDc3UOsgbI6NhzV7WmshiTvwwhYFjkm92TnNOQ/HFrVp87jCWv2AdncU8
	 6hxOLBizJV9+v2WgCn1Iy7drkSiXU0AVPbeIXU5Zc5v7lBa9ADHCNALX36IHhQDhL
	 RoqxB2OGD5khH/DitFEzXh1/Et/WdMv12Rmd93b+KDT30/6/wVf4QvwpjrP8KLyFp
	 oJHP2cFm7UomyQSHI8ewQ89qpivbglU+mtOngyofKVDvjuFaPIsz0FwhuyE3Q5f1J
	 4+6O3b2bMJUFBgDdCA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1wq3-1vXTVH2n0r-00rxVn; Fri, 27
 Feb 2026 10:36:06 +0100
Message-ID: <dabbd3d5-07e0-466a-9862-3f6eed8756d8@gmx.de>
Date: Fri, 27 Feb 2026 10:36:05 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] Documentation: laptops: Update documentation for
 uniwill laptops
To: Werner Sembach <wse@tuxedocomputers.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260226205302.123782-1-wse@tuxedocomputers.com>
 <20260226205302.123782-5-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260226205302.123782-5-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RJrEy7jairyzKYmzT3XCLeSQelVqRediDFpoAoKkyPGPxFMjVbb
 InMEXi8M38OSalrqUsO1Vw6oFC/kniMRqvOi23J0PJsflilRvya8mcBkJKow+avYEzpHpU7
 ma8lH+ByWjLNdBWEoROqKU2iJYqL02mJpPurlXEDOGEmrQIC+lnq8kYP2U+YoaYsc3FMv9O
 tvKU7FJvVqLJtlYYvD01g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lnqJR5KmkPg=;s9RoWsfx0hX6/PWbMpFEDsxpX+2
 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

Am 26.02.26 um 21:50 schrieb Werner Sembach:

> Adds short description for two new sysfs entries, ctgp_offset and
> usb_c_power_priority, to the documentation of uniwill laptops.
>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   .../ABI/testing/sysfs-driver-uniwill-laptop   | 25 +++++++++++++++++++
>   .../admin-guide/laptops/uniwill-laptop.rst    | 12 +++++++++
>   2 files changed, 37 insertions(+)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop b/Doc=
umentation/ABI/testing/sysfs-driver-uniwill-laptop
> index 2df70792968f3..55943252f2ab9 100644
> --- a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
> +++ b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
> @@ -51,3 +51,28 @@ Description:
>  =20
>   		Reading this file returns the current status of the breathing animat=
ion
>   		functionality.
> +
> +What:		/sys/bus/platform/devices/INOU0000:XX/ctgp_offset
> +Date:		January 2026
> +KernelVersion:	7.0
> +Contact:	Werner Sembach <wse@tuxedocomputers.com>
> +Description:
> +		Allows userspace applications to set the configurable TGP offset on t=
op of the base
> +		TGP. Base TGP and max TGP and therefore the max cTGP offset are devic=
e specific.
> +		Note that setting the maximal cTGP leaves no window open for Dynamic =
Boost,
> +		effectifly disabling that feature for the GPU to always be prioritize=
d.
> +
> +		Reading this file returns the current configurable TGP offset.
> +
> +What:		/sys/bus/platform/devices/INOU0000:XX/usb_c_power_priority
> +Date:		February 2026
> +KernelVersion:	7.1
> +Contact:	Werner Sembach <wse@tuxedocomputers.com>
> +Description:
> +		Allows userspace applications to set USB-C power distribution profile=
 between one

set -> choose the

Thanks,
Armin Wolf

> +		that offers a bigger share of the power to the battery and one that o=
ffers more of
> +		it to the CPU. Writing "charging"/"performance" into this file select=
s the
> +		respective profile.
> +
> +		Reading this file returns the profile names with the currently active=
 one in
> +		brackets.
> diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst b/Docu=
mentation/admin-guide/laptops/uniwill-laptop.rst
> index aff5f57a6bd47..c89b8b3756f84 100644
> --- a/Documentation/admin-guide/laptops/uniwill-laptop.rst
> +++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
> @@ -50,6 +50,10 @@ between 1 and 100 percent are supported.
>   Additionally the driver signals the presence of battery charging issue=
s through the standard
>   ``health`` power supply sysfs attribute.
>  =20
> +It also let you set whether an USB-C power source should prioritise cha=
rging the battery or
> +delivering immediate power to the cpu. See Documentation/ABI/testing/sy=
sfs-driver-uniwill-laptop for
> +details.
> +
>   Lightbar
>   --------
>  =20
> @@ -58,3 +62,11 @@ LED class device. The default name of this LED class =
device is ``uniwill:multico
>  =20
>   See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details =
on how to control the various
>   animation modes of the lightbar.
> +
> +Configurable TGP
> +--------
> +
> +The ``uniwill-laptop`` driver allows to set the configurable TGP for de=
vices with NVIDIA GPUs that
> +allow it.
> +
> +See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details.
