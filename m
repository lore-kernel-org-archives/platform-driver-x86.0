Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BCB2F4A16;
	Wed, 11 Mar 2026 19:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257753; cv=none; b=ePV42mczARb2SrMrqcnHssO1yvTXTIQfTfEC4f722Zc8mgfOsnwaV81M4pgyoloGDuvHikW3G1qxxRxAolmn/JN2bm2h6zmWv2Ey/1CA1pa8HWpWXa5w8+zFpIZ899ZOzIQYatlxDtAEf9Gl38y91N629F5dWsx0Q02deQLlkPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257753; c=relaxed/simple;
	bh=oQ4XqioXTJsxp86gq2N3carzW/Li7JQ3g4ZRgWYnMgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OizyG2EPYoObc+5XxuBlszbMiDOXbDkhG3n9Z0HVBKlHb31ZKrDCWmc1kp5x8kJ4QOHc5wypWZtPrHUu//3NBI85x0PYiIUTSSCWaAxasXgRVbQfkbypsGD34b2YzQmlrIKNdhRxw1pmq2qr3mzZIFPitUCmJshSzO19wdMtlgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=N2O2TRsD; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="N2O2TRsD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1773257735; x=1773862535; i=w_armin@gmx.de;
	bh=xGgksq/KPzOeaaX1sEtey4v7pVilxW60+k5HQ317EFU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=N2O2TRsD9h2YWilL8afVqb+vcZepy5VQGE/RDLnxs5ctxWu0ESdjCtxMKgXRSics
	 n95j5QHOvNTHbvYAxWuPl6q+19s37hvS56p1HMmzpRLatxzcFjDG6l9Kyg1tVsOHu
	 jVpeBy+yiyw/800Zw41gKkZnnKOtbY2JD1EDS83HxWpzSsqP2JXUizCz4bqwFd3gm
	 fn/11JwWdpYKGzj5NUHdPxwnk9P4h+y9Np/Dpvi4WnAJFF5nFhkraCeQhF2/kIQBS
	 66kwzBlR6JEFUI1BOQepXRjW2UbVYhQrO90/S5w2OfMzigtlwDvpGIazMOXAOfv3Q
	 vFqaeY+V7xJcz60KXQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3KTy-1vaOHN1OEc-014851; Wed, 11
 Mar 2026 20:35:35 +0100
Message-ID: <6b944d0d-e0ef-4a48-99a5-7f9955d2066e@gmx.de>
Date: Wed, 11 Mar 2026 20:35:30 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] Documentation: laptops: Update documentation for
 uniwill laptops
To: Werner Sembach <wse@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260310234022.2085232-1-wse@tuxedocomputers.com>
 <20260310234022.2085232-6-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260310234022.2085232-6-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KADLV2TQN/VioggSaceKQKwXOugXBma7kZR4dx9IuRxOL534HLc
 PIl5tbRCGfzkDwxx8tjOXhfgK64RiWjBgErE9tD7qkMMnlbuG13AFzC+VDzZ1W+ugkBW5uX
 W7VaEItURlcxajUSekMEGpyfewGLWB0zBEIAgw3DHtsuRAo3MB+4fvbVycOlgM+QhdV1zqL
 9p80CY5gF1V6KpO0uOqBw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yDyWb7u+47o=;VXK7kqIKKk3qFjeFwCaGPHXPcmY
 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
 M65I5Q2+EtI

Am 11.03.26 um 00:34 schrieb Werner Sembach:

> Adds short description for two new sysfs entries, ctgp_offset and
> usb_c_power_priority, to the documentation of uniwill laptops.
>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> ---
>   .../ABI/testing/sysfs-driver-uniwill-laptop   | 25 +++++++++++++++++++
>   .../admin-guide/laptops/uniwill-laptop.rst    | 12 +++++++++
>   2 files changed, 37 insertions(+)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop b/Doc=
umentation/ABI/testing/sysfs-driver-uniwill-laptop
> index 2df70792968f3..cba4138604601 100644
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
> +		effectively disabling that feature for the GPU to always be prioritiz=
ed.
> +
> +		Reading this file returns the current configurable TGP offset.
> +
> +What:		/sys/bus/platform/devices/INOU0000:XX/usb_c_power_priority
> +Date:		February 2026
> +KernelVersion:	7.1
> +Contact:	Werner Sembach <wse@tuxedocomputers.com>
> +Description:
> +		Allows userspace applications to choose the USB-C power distribution =
profile between
> +		one that offers a bigger share of the power to the battery and one th=
at offers more
> +		of it to the CPU. Writing "charging"/"performance" into this file sel=
ects the
> +		respective profile.
> +
> +		Reading this file returns the profile names with the currently active=
 one in
> +		brackets.
> diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst b/Docu=
mentation/admin-guide/laptops/uniwill-laptop.rst
> index aff5f57a6bd47..be4aeb9c023dd 100644
> --- a/Documentation/admin-guide/laptops/uniwill-laptop.rst
> +++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
> @@ -50,6 +50,10 @@ between 1 and 100 percent are supported.
>   Additionally the driver signals the presence of battery charging issue=
s through the standard
>   ``health`` power supply sysfs attribute.
>  =20
> +It also lets you set whether a USB-C power source should prioritise cha=
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

Hi,

i think you forgot to extend the underline a bit. Please do so for the nex=
t revision.

Thanks,
Armin Wolf

> +The ``uniwill-laptop`` driver allows to set the configurable TGP for de=
vices with NVIDIA GPUs that
> +allow it.
> +
> +See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details.
