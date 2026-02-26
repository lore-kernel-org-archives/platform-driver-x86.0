Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36E1212F89;
	Thu, 26 Feb 2026 01:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772068659; cv=none; b=GkmdyzUbEtXVMaEyc1188qiISktwWnQp2SDXFWzmX5uHEtuUxcV2oICboE5kGnUHG21JYYUYSaKlnk/zrQw3NNVb0Zn0c/LQYtVhyijImXBKtkQtK7w6PKy9414ftLQGyNRmVv1RdS0D0DMZXSKL0KiilPZOnsd+Cq+DzXFc/mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772068659; c=relaxed/simple;
	bh=7XJ7eGFqeDnSzharVWuKfd7PAsEa6kCmAoEpdrrzuQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oMPZ6bUtJYsGbLxIOFLsA2D4WeErcUiVaFOmUMM7N+zvZxi0mSiGwGluL0XzsIzu/7FNx5BZUhQwbiQX9mqnL3iVA+31340z/FUPMtAbzt9arN6lvh+4CupzEVBuwPvQfz/EtslwbSO1RXq+EJInKvxxBCmOrw+oL7lIQSj5XIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=OedOeOAM; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="OedOeOAM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772068653; x=1772673453; i=w_armin@gmx.de;
	bh=C85nay36X17oCKPxPBAI7i6AvXjXz8rR1EoURwT9WdE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=OedOeOAMR29anxPSQqF8ffl915NbtL/0sDS5IgY3eok0OXcSO5vXgz8yQfoQbT6G
	 5EibGOU+8bBoHGR38ZiOUa1C9FxaFQU68F3LfmCelKRjQD0UNn1RcV3zBW0BHPZg1
	 siVBx6+qGP6+EMikrJvmi9lDViq6XHok3mr2nNzvJQc5wWoWMo+MnPJHGLeMYu4tU
	 H2hC2Yla1ZRNSo7TBdxf8ivMzQaxdtGL1TCUAqkfonJKSgW3DzMTyFk8OyweHbw0h
	 pDDDJ2IRT0Bih232h3S0YtSK4jL541NFZf2DU9mkLOez4NCmsFgf08J0Eavw1ZfAJ
	 dSlW50bQ+Ys+G0cGbA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUGi9-1wL5l130tf-00LdeG; Thu, 26
 Feb 2026 02:17:32 +0100
Message-ID: <8762b37f-34aa-4cd1-9463-4a308388ad32@gmx.de>
Date: Thu, 26 Feb 2026 02:17:31 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] Documentation: laptops: Update documentation for
 uniwill laptops
To: Werner Sembach <wse@tuxedocomputers.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260226003408.1623547-1-wse@tuxedocomputers.com>
 <20260226003408.1623547-4-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260226003408.1623547-4-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YLpkwNuneLHyqO3VcnIa9Xg/mXebzOPpWifVfzF8KV20ybtf9y9
 Chne5qPqdnpWKm6j6IwhyVWDIAS2Up+QwFa1tS0S+YtMBbJzrq60szMvXKHqUR3bgppE98Q
 EykrWOBVcuaPMENvq+86MBusz/E2t+FgsoYqk2xhnMwGsNv7Xrn3ONGYVf+E/vAdCrBDvLZ
 vLveSu3eJRhekPEinF18g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dw4zfAtrK3A=;RvVTmPPyMN/12t9i0Lpl2iaGsiS
 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
 VT8h7yTg=

Am 26.02.26 um 01:31 schrieb Werner Sembach:

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

set -> choose

Other than that:
Reviewed-by: Armin Wolf <W_Armin@gmx.de>

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
