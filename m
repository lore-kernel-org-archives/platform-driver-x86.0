Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A46932720C;
	Sun,  1 Mar 2026 13:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772370960; cv=none; b=Nf39dypZo4MVxwD/E9QZ2fGSwo4zR47dQBW4F80wRa2q+7kd7NXK3IeP8Jvpoy3wlBJETyn2Zc89wDcmtTElJd13R5UljziifBTuosSv3ZO37aPSu0lHFAgwK59hSOyD1PDCz3xXKfOUIl5Yas4sDoYHqqPuBBtLgybXc5BALdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772370960; c=relaxed/simple;
	bh=wCIEqpunTHqbzTcZgYfR+NuNXqG/eQTS5P8SoM0NNYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HhVrw3EfCNePui5iW3jQNr6g3zxXG1ePiuo9T6LVMbXz6ioTggjJFKA4OheVhovyrioAM8bWvSnhiZm2jvIZxDEkKyTbwT2QO+4OudHxqVAoo01/UrRvuxCHhBFXY3Q28lxjXa9zrsJbDUWwofYqk+ihUy+PaoJSpNFox6Ro8Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=JsRTeeJ+; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="JsRTeeJ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772370956; x=1772975756; i=w_armin@gmx.de;
	bh=E6hOSKipa291WMGCf2p3nZ3JujAHO5gZ/H/n/r1wHQk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=JsRTeeJ+L1oaLz3sluxM01E1/3CaQE3eacOUZhcaLl+lFWfkaV+pwG1tTIb4mY76
	 yiiztlKCLY2cQTjuPSKk4g0Yc0mbcm2N8yy87q/RK/qCzAISlf28oVnmtMnc+YtDD
	 2OHpv2lKUFCMxQ766LIKuOtKUXVGKATAfoKYabxJmsM4GQLOBJ8gGVX727cfHgA8z
	 kfE2VKGJjXFeFG62YI7aIyy+JfVbIr0UInKe9GKn05wQoZM5rD5NxZuucsRrylimX
	 PprTVBcCLcbGS+3PeWfN0y+qDi/gdlaebUk+UW1L+9+PPmjx+sCQgBafBTfmPSI5Y
	 27tMYd3ECwRoudwexw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McH5Q-1vOiLA2M9M-00oke9; Sun, 01
 Mar 2026 14:15:56 +0100
Message-ID: <5f492118-cf3d-461e-bad2-fb93504464c4@gmx.de>
Date: Sun, 1 Mar 2026 14:15:55 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] Documentation: laptops: Update documentation for
 uniwill laptops
To: Werner Sembach <wse@tuxedocomputers.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260227200906.514928-1-wse@tuxedocomputers.com>
 <20260227200906.514928-5-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260227200906.514928-5-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YYYOWrzaYTpqyvNAeu0xmSq0WAMWBmH0MLiKNVj7GUbu3WT0yyk
 g+PGnvL2/KMNF4KBkwIdKwx8DDqAaa+op4GTV5lejss7sWboe6lFPI4JZdRlbcaLvwadNtk
 LfxG8VEK0pdjiCehbhbWGIENnUrboolocvELwA0SeqHkFBL9bd1R2a7LsI9IJJ8kFHnP75i
 WnEPcUIT/LNYuGONycfzQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eS4lZT9x3UQ=;D6GZ7cH73oJ+V1ffzMFJZyCfmoP
 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

Am 27.02.26 um 21:07 schrieb Werner Sembach:

> Adds short description for two new sysfs entries, ctgp_offset and
> usb_c_power_priority, to the documentation of uniwill laptops.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   .../ABI/testing/sysfs-driver-uniwill-laptop   | 25 +++++++++++++++++++
>   .../admin-guide/laptops/uniwill-laptop.rst    | 12 +++++++++
>   2 files changed, 37 insertions(+)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop b/Doc=
umentation/ABI/testing/sysfs-driver-uniwill-laptop
> index 2df70792968f3..70b4bc97d91a8 100644
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
