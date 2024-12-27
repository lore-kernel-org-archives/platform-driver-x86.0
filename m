Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D97E35976;
	Fri, 27 Dec 2024 03:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735271887; cv=none; b=GYY5S3ddL72ZSdnYdOy5CveLd66EjE8/sg8nY75a4RSMn1U0rqpR6w+s7O3DSDzwBIzvFam16fRDjESxtkqVE6oxC390vqlA5450T6ugPNXEkVCT8CuucDrkjMZixI0vJZpekxKnnZj+uNLYyd5GKsHDM+lCpUaO4lzWSiHAtiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735271887; c=relaxed/simple;
	bh=tkO94siqDXfO1F+4a8Yoq+/+hip9WeS1BejMOq+4nGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=haMxrsM0NEresSlI49f7nmLOVAw9aBqBokfh/O/UQpmRWesHj7utPYJUCXrdrrAZUUk10BotFa2CHbrubLz51vr9/0WD8wN0UyZv8810Fv+BMov6KOoSPL3uRKPYIu5nI34HeiyVePcPGWrGM0gpUU8Kh4EtfD+TEYC6nnLaSLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=HIhxuXdi; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="HIhxuXdi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735271871; x=1735876671; i=w_armin@gmx.de;
	bh=K3BP3bDiV8yIOVvSbgDVsikCGdy1fPUpfGifQUY4j80=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=HIhxuXdiHBCxUcIuTqLMNY0dhZMly30kJF7l4M0zRk3PRz6SVRH0S8stTbh7YdQd
	 K0i1QK1iFOw0aFLc8krxCcm8gLXSIyksF0HlJFYGcfJ33q1BJ4Qnm+vHO73qGIdWz
	 AlJWsUkIC6eIFGwj6PX3a9+Q2NboPLIW24SNoJx/kMslMUnj4ajI6js+bI+qeI2fa
	 GS9FPwYFlvvZnAcF7nLUjFxTBuDCzH1mnNgK/RwcEoz2Rk2bV/Fgw4oQ4dKttHmUg
	 uH+s+bTQ42yEWlQ5I5kbEdTt7k29Qa4in8YiMa17uoJPhyxpN9OIhevQ7tzzkx2mk
	 +RREPs4TTPa1DsOpvA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M26vB-1tP6bW0wo5-001jhg; Fri, 27
 Dec 2024 04:57:51 +0100
Message-ID: <24093961-9a21-4af9-ba7f-3484c5f1402a@gmx.de>
Date: Fri, 27 Dec 2024 04:57:50 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/20] platform/x86: Rename alienware-wmi.c
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
 hdegoede@redhat.com, linux-kernel@vger.kernel.org,
 Dell.Client.Kernel@dell.com
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-16-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241221055917.10555-16-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5ZkeKbZ29zyvcRfxUYLn17KOCkH40lQpy6vYdHjAq71HgMXLzRG
 VQJC0nywA9G9B/HmE1ANBEKAp3bbmEDOyWkgw3RzG/He8ewGzeWtPiHJm8QD2lsa5y8s4nE
 //LUQI6TErLsJAlJJtMshhBlFkDyDH0Wy6tu8lsGdErpA+hOEMfGFkMv4Oj5Jt0YocX6Id7
 jeiWCb0EH3F6qWBOuy3aA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:h2SvFJuHRrU=;DpwfUI1Io3DF3IVS/XqsILfICOA
 pXh8iT/65lOPPaBl1fTaK0ldGRGxGd75y/plgTX2RujR2isIydxfM1ZcdHHuzsbnvbC2zmwgW
 2K0Vzi5SnI7jZKkQX0hVuZhPmjtLPGi4gDMflN6nODbDghr+uLKmCyygcaU738TrgLw31l+7D
 FGnwsaKIoqKUXHR13Jtfdu5xqZhtvhUIOHm2SDB7skVU5dJABq722xNNGvO+2w23kp0AIXIAU
 ogBYp7QnnSfuJOGoMDPT2QMb8PXx4k/l8YEHcyK2EtM3+uoLebb0pcMAMkSgLN8WARbovG0Qa
 pKFDEULXksY0HxxyZ09hNQ4v8t1BNxgQ1JTHUe310z1B1yMYYlPVSkX981ngZOQ+OdDYUdo1D
 Ss/UXwuo/9GPCgOvKvk8qJz+IzZqMO5zFmu8ZSp99inXdiFmEO00NQwDuxVXGRpyXLTRw62+f
 PKFSgbm2BSvthfLM+jwomNyErMWmoAN6GeAQ7YX3Epff+inRr+AGtWlm40T0uqyp008hkECyp
 8JOAG68dqptWjpnHWFOBP2i5Z8u1M7om2u2K+/VwGSCtIpNP51gpQjp+wJFOXWbAB3qcooMfi
 9DrGgprrVLrgv+WViUY+SvZYfmT6m6HCzCMvIBqycAQ/hYwkUj3fTW+A2rcl7C5XQK+nRRS2U
 bF2KpsDpR3GTr5pKPde/hIC+QCZ0LfnllRatT38c2I//i1MouxFE2NskGZB9Te1J21o8d9CD2
 CqYOrE8uIEZzduDd2ibaDm++pqr5DEppWJ9LMV9nnyJxsxfhftPcfJ94YxIPKemM5+iGeNHQR
 bUB0c1ImXqzzwyDa57NeBeEfhSdMx+XwmyDnKHU1ZVjIQa8FQPzPQy5rYkyknEYh3DYzmzwZK
 ZU/2VIkSld7OHpqnWJufk9sVbN53JdLqtysc5OVzzpw9WcPPXgFgyKIu/vo+ocsjx+XhXa38U
 kgQ8rdeUziYouca4xRwDSO7RX3CrTxM7Oxxs+nOHcG7VPKeJdFaz1ytxgsgiWrCV46Zt4ZiJH
 hr9ZVeHFZ22ByS7vXuQ7qu7ytg/39uuDhevSgZb4jv1RGgTR2Zx89WzSwCkI9x99n1H+3fFFS
 E/+jp58C9pqD2CNNOUd8GizyHcocC4

Am 21.12.24 um 06:59 schrieb Kurt Borja:

> Rename alienware-wmi to support upcoming split.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/x86/dell/Makefile                               | 1 +
>   .../platform/x86/dell/{alienware-wmi.c =3D> alienware-wmi-base.c}  | 0
>   2 files changed, 1 insertion(+)
>   rename drivers/platform/x86/dell/{alienware-wmi.c =3D> alienware-wmi-b=
ase.c} (100%)
>
> diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/d=
ell/Makefile
> index bb3cbd470a46..f8aec8502c2f 100644
> --- a/drivers/platform/x86/dell/Makefile
> +++ b/drivers/platform/x86/dell/Makefile
> @@ -5,6 +5,7 @@
>   #
>
>   obj-$(CONFIG_ALIENWARE_WMI)		+=3D alienware-wmi.o
> +alienware-wmi-objs			:=3D alienware-wmi-base.o
>   obj-$(CONFIG_DCDBAS)			+=3D dcdbas.o
>   obj-$(CONFIG_DELL_LAPTOP)		+=3D dell-laptop.o
>   obj-$(CONFIG_DELL_RBTN)			+=3D dell-rbtn.o
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platfor=
m/x86/dell/alienware-wmi-base.c
> similarity index 100%
> rename from drivers/platform/x86/dell/alienware-wmi.c
> rename to drivers/platform/x86/dell/alienware-wmi-base.c
