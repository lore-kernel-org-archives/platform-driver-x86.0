Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B78A4503C;
	Fri, 27 Dec 2024 03:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735271825; cv=none; b=PG0DEJBPF24JkIq22LCfGysu62/GY59IX9V9+B8UXfbEYmGsz+Sat21DjltJps3fyNXNC/Wi+fgBAzpgFr6ELI0JBLh9HPYBOn3EVWwA9n98jrqAC3rY6uJTHhkktQvtZUfHmHOBnk2H7jI5sKPt45yr+7v5z0SdpGQsJ4KTy2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735271825; c=relaxed/simple;
	bh=cFE9E46ffMjBxk43FbJ93K5zxiXwhToEqN0Vez8EtJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M8h+91NcqNiQ+XzFe5I80CVpyY5E/XhAyNU2z+t/Xxjr6xg0ksX0VjQ7l4A0APynbLVvdLkhTGqps/Z72ROcnCJhJ3OR52+W5DoPIbaryzPLE31Wp9e7MNfVi4Di74AEE/HlRlcvKQeXfOONH+M7W0zEZQd9C5gFKCsP8tildD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=dAmftMse; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="dAmftMse"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735271821; x=1735876621; i=w_armin@gmx.de;
	bh=VHpBDjvW/+OxP+kUtWl/DuNhNbY4c27gKirNzQIwSko=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=dAmftMsewE3ShajxXHC3IFJq2cWcpZgpsYIWfjorqvtWn4IFYLHWCXN2pgsn2EUM
	 bAqZVqFN3bjV8AOSLTlOpQs32pJm8rnPi0Jfy+hMjeBQfXmP6wA0V9c1uwKJvTFIb
	 WfZ1NhZpGEAntg3gmuMjLcTW7vTeAwnwMGylGlKmJ0AqtvO7nW8yS8GpSPTZLJjP3
	 EgfFqqbjtu4RyKL5FaL9+dAKIa8oVjd1X/YgAE50cvUWGRp6fEv5lAIhgnYf+KZMm
	 09ERoiVkx2x2SzHWYYcXQoL55qHa4crvjzpz7t7fY4k2R3//iyx6m98PE91XbSRi7
	 PvQwfpY/j+R140GG4g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MCKBm-1tHdol1lMQ-00CVAD; Fri, 27
 Dec 2024 04:57:01 +0100
Message-ID: <9feb7d25-e5bb-453e-b327-c3c1991cf611@gmx.de>
Date: Fri, 27 Dec 2024 04:56:59 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/20] MAINTAINERS: Update ALIENWARE WMI DRIVER entry
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
 hdegoede@redhat.com, linux-kernel@vger.kernel.org,
 Dell.Client.Kernel@dell.com
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-15-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241221055917.10555-15-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iJ3/qcd1f3xTcFO+RF8B3HRjTvfHLbfQTrHFWbcZANiW0X8DhYN
 lqKOjsPPfimgR2dkq0tSY6RY4phM00M9JII+8SyWNyEjjMxZolMd0aqhIkq7ZEKx/ojll1R
 h23bwi1a5ESNaErC7ngdXYMetzc3HjdEt37qA7MrrcOPQYE/cDJOAeFlCgaquDaOqZ+NDUG
 V5QjIe3UG2Y4Py0FwuT6Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GwPhkYKgz6s=;jhTSAT0Hey5F05LOi7mPRSuNpmy
 ExeWJq6NhRTEVNdAOPwZsl58X1n2fMfGf/BW94/xyHLh3qfRNvKD0/hEAFJ9bV/EgEh6xE1Ng
 QqOBj7KPabLhpbUjkMmMT2a+H1dnG8zZaEPfeetUxud5Bvf9YoO7reClA4iz8I9dI29yZP15G
 Azs2eA4Lpc+9/vBrtTRT2Zw3Bfax8Po73xTylWvtpCevA3ILBplpAyZegg+9BydlyUR1+4qTY
 pUfUdbOyvD6TV7G1FuDXPcsSalPktwwgnlILmTszNnklGTXteTqEZ2F+yvcw2fA8evojSzAtl
 GuXHgvecoUlKhJtOdbIGG1P0HldptZ51m+ZZzyjGt8TIgUNMdCIiwpHOd9GKtu89Vip/DLFrP
 t/kN1LQNMwTNNHw3yVwFemipoKOwds5Z5vpv4w6mO8ASs2dxasv+cKU7TxTl7SHE+xCcp+QII
 b16GETprRpvWHlzyG4TpZa6xI+bffzgJUCoBpb/vB4wdwOet6MLWnxmeyydZvvm3NjUExa/tl
 KQ1prQnrzbW9GKScZFw1JB2Ci2XXm+REOpyy5NNe9mOAK6YGSr/BkSIsmItq15KSijvIcFbxe
 E/v8zKysDGK+nDyA0sun9shvAavfehDCQC1GvgukvdP0EtruBF792aoNtCZyqIo7qlua/bGbp
 QrRE5k069xWpe2ZdfCXSYIJ+X9QMujDyZKYDhlnwjKYKyr0Tbf1ujn1XhD6G49qILpJ6DBd/Y
 4TKHv4ILLg1mfL8lXjB2ndoeY/OWpQp5AGc5w+jg5SGBc+dykQtXEzr1n2zx+urXZGiQaIIPi
 ++kReEmza5R1PwnuWCknC0QXl/KB26iMMSWtNUPEz5LY27+m+tR0gh4XduYwBDA7tcp7jpsii
 OhRAMHvaAMeWofcDwmCdwfi8WPcOiBJnL5H9gfev+gd/vJ7dL6PTNTTxRppEa8yIaAjKiHijV
 mxzIXqWj6kp0xAfK0BlEGmsDjHmSA21/m/ly393w1kUGsLRcfhPHweZuY2X5pERn0I4aJy4cf
 jH/631EAuW4s6CeFTWEtn4fAfZEKsu/KHf8rIaO4Gua69OobnKw+dneAuHI/FKZ2wtCfzfJwE
 NkGQpeEG6prWFcb7CI/8ECnOy0eud/

Am 21.12.24 um 06:59 schrieb Kurt Borja:

> Dell has been inactive in its maintainership role of this driver since
> around 2021. Due to this, add myself as a maintainer.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   MAINTAINERS | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3809931b9240..596c6a46478c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -784,10 +784,12 @@ F:	Documentation/admin-guide/perf/alibaba_pmu.rst
>   F:	drivers/perf/alibaba_uncore_drw_pmu.c
>
>   ALIENWARE WMI DRIVER
> +M:	Kurt Borja <kuurtb@gmail.com>
> +L:	platform-driver-x86@vger.kernel.org
>   L:	Dell.Client.Kernel@dell.com
>   S:	Maintained
>   F:	Documentation/wmi/devices/alienware-wmi.rst
> -F:	drivers/platform/x86/dell/alienware-wmi.c
> +F:	drivers/platform/x86/dell/alienware-wmi*
>
>   ALLEGRO DVT VIDEO IP CORE DRIVER
>   M:	Michael Tretter <m.tretter@pengutronix.de>
