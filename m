Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52AC1C2AD
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Apr 2024 14:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712242560; cv=none; b=cVM4D+6k+gyYxnJMWMpyGyTBLwFh6BNqGKph8wbX1F0Srxn88iCSVaAi0yXgW07pqtH8twLLlnZ/xqTkGzBlNSR4AfQuJax1vRqecDVysAKGbRzvzqCh2Y6C6owy7gt0+riwt7Pxq8+06HHRm6KjwxA8Rtqjle9QgZ3hb9QPjO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712242560; c=relaxed/simple;
	bh=pLb92LhAvampfltVfG1zLaFeBawf2YhmT9+U8zxrPTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Qe5v7QAJGomBTl6b/FpH2SMZ2e3VsKcnlZEZI15KvQAQ2mQDQMr5lYx4CUiI23LHJ09tM8BvVmxwUea9OsBg/3ad7rHPQQwfrj1erU747XsmZWPVCmEeOgPepH852Fu7XJb/hq1JKSRG0DGVdfEoYgA2Ta6Qw7xg8K7+TOrhl9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=QRZUD689; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="QRZUD689"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712242554; x=1712847354; i=w_armin@gmx.de;
	bh=pLb92LhAvampfltVfG1zLaFeBawf2YhmT9+U8zxrPTw=;
	h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
	b=QRZUD689/xK1qPknLRytRGfSjIaP28Sa528wDMJO7frrf8lK7pIGk3jn3aF0J5sg
	 /xo9oOnWkFDXHejbGCN6gXJOMfFrMZawnZQ/Ie1EmH8wQ+NN6nvbCDKta/mpVYtSe
	 aIl0Vyqv9XbYgbeBy7Gq2Rwmu1wuV+ewkXR65djIFcOZHWlp4ODBZu7Yc+ebXwGcA
	 niMecZjX+TKyrPpXXcsl5Si7PdoHIhUXY1Cj9qRzRHUV9y2p96BpuyF3vZbLbwwM5
	 O0xrfxYztdSN8sKTzVLdWLdATkYoVhXF0Cb1jE564iyFXF0ZcpWE5XfD7oBYhDdp4
	 coTKIn3nxyQdQ9k6yQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRmfo-1sG49I0wEU-00TCDi; Thu, 04
 Apr 2024 16:55:54 +0200
Message-ID: <b85d1fbe-af3a-446e-a4d2-fbbd53c0c398@gmx.de>
Date: Thu, 4 Apr 2024 16:55:53 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ishtp_eclite: reading fan tacho value from ElkgartLake PSE
To: Mikael Lund Jepsen <mlj@danelec.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <AS4P189MB2133A68C6CB82C58E0268311BA3C2@AS4P189MB2133.EURP189.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <AS4P189MB2133A68C6CB82C58E0268311BA3C2@AS4P189MB2133.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:4s0XT0sLSPWXMyUnA25VpMxvsyp60mTsW3Tu7G6a88SiIzld7PV
 KubZrSPXx0oHxXzIESHENFlEWf39K1mYhZyNroyDK2aL2djacEFyWUWrh7RHObHEqlYovx2
 JodrvvMlXmIt+5vppuAVV/1m0n0mR8ihQWYOairgewJVPDh4+txGvj9cSX6+BwZ2yytI61c
 bxAIsauYYykIBa+Zwrw3A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2I8mbGlMVeI=;eT5JUoWPjv06YzQlpnMombouiP7
 h+6727wOGg1QgkyE/8IO1pjz7OaAMJRl5duW1qwnfyu7LCqUKCF+2VEpcpgUui5MSGbn/e1Cj
 UFUy8g9ZW5v3ygUIO/QHtSXk6IQpmCXfvg9OmTVVCwMSPonZE/E6FP2h8FgO1I3wHKzhofumb
 0CbqaeHICJ4JInXisPdSx7hDEZJZXgdtDVBHgVZ7EVIhdpieV4lq2ZQ/1666RuNK3nZ+WJ/6j
 SDeCVBr0frYdS6kwv9yTyLdOwZk96KB/RBS8v3TOIimnSgWHOEQ++beI5WRQyaqNWMSraKXUD
 vT1RpLXFu6do/q/+wE3gGuyw59iEFrCrkfyeskk4601WT/PJXzAyhjIYNmtav/BhVh1h0bwyX
 73eocMd5sm6K/SiQ/0Rxm+0byaGRzyiTQKeTJSazoPl1hPb36I27ztw9ThXNtE5yrEBdJgwm8
 oblWSJqStcKxpw6eWouDUXVBhwW5SMv9wwyFInEr11Ub5/IGaQlTmMGpa1R1v9JTQRiaUbmUf
 0+y0Hv0mQpdT9P4M/W2ByxZr/qA5dGE/foSS342gtYBxUn61qkrNj0Pf0ji7jla0Xj6oBcxXQ
 qvp6mleim/NoCbw7/3OgsGfq1+XwFKDp87VXj+PmlPgo0aDKQxfwvNKGUx702rBD5WCBoMZhy
 kescsgHbFLDuwKh5xBLvagn7lS0d+qXM+/Z8KwZG6FWYYM5f7deKIIskJ01Ianmg+GgLcp/f8
 RV6nUm3CMudj1hn1U7tVcJmIrzqgwqzIv0cK6ZUdFC0nEhFkm21N3VM+j8wnxxHR7QcHfAWEI
 3EAB//lrdp48303LUXEnc4aq8TJ8aIPLUqZ8tzLMYwYIU=

Am 04.04.24 um 10:37 schrieb Mikael Lund Jepsen:

> We are using the Intel ElkhartLake CRB board and need to read the CPU Fan tacho signal from Linux userspace (so we can raise an application-level alert if fan is broken).
>
> The CPU Fan PWM output and tacho inputs are controlled by firmware running on the PSE controller (Cortex-M), which is embedded in the ElkhartLake SoC.
> The PSE Firmware contains an ECLite feature which updates the eclite_opregion.tacho_rpm field. This field is also declared in ACPI (offset 330) by the bootloader (Slimbootloader).
>
> Fan control works fine via the thermal_zone sysfs interface, but we cannot find any entries for the tacho.
> As we understand it, the ishtp_eclite driver merely acts as glue layer to the PSE/ECLite, so some other kernel code needs to call it, we guess based on ACPI definitions.
>
> Does any drivers exist which expose the tacho value to userspace (preferably via hwmon as is the standard way to do this in previous Intel designs with LPC + SuperIO)?
> Or if none exist, we may need to add this, but could really use some pointers to understand how such a driver should communicate with ECLite via the ishtp_eclite driver.
>
> Note: The official Intel binary release of the PSE FW (MR7) does not enable the low-level TGPIO SEDI driver in the PSE environment, so the tacho input is simply ignored.
> If rebuilding the PSE FW (https://github.com/intel/pse-fw) with the SEDI driver enabled, ECLite starts to read tacho as expected, but this does makes us wonder how well implemented (or used) the tacho feature really is.
>
> Best regards
> Mikael Lund Jepsen
> Software Engineer
> Danelec

Hi,

maybe you could provide a ACPI Fan device which implements fan speed reporting through the _FST control method?
In such a case the generic ACPI fan driver would export this value to user space through sysfs.

If you want to use the standard hwmon sysfs interface instead, i can provide you with a prototype patch for exposing
this values as a standard hwmon device.

Thanks,
Armin Wolf

