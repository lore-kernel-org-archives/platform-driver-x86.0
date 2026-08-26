Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11942E764D
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Aug 2026 21:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787780419; cv=none; b=ZZWvtYY908mmxFCzMtI0VgPfBgoPfBuD0dy0V6Hwg3BP/1IwK6W+lNE2T6WG1jwXDfXR1QN6oIrE7B0zWJpIRlrWY5kJaO8W8MUAR35gzL4ZhjvU+D7j76YEVp93l/KXnP+N+UwCaaOks9uVR98nJ+jouUq88WjX2xRURAHsqD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787780419; c=relaxed/simple;
	bh=o0JnSrQtR1BxIWJ6HzZ+mlnKOc0JDaWErJpMWZ0H5Vg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iLCB9RkRSJj/mZuOAxooqYwdgT+qKUPzaQImP76pmDzwLh2+BYJ78Q1VNenEHlZNN8UvECz3yEREKNNrMUrXlDWCcUsQSB3n3I26sK3ttV0ehtZHSq7bbql/uOwgnW7uWgf+hRUbbSDFnW8Boap0LopdNLIAwuE/zyksnnqNZn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=T1WpE7p7; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="T1WpE7p7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1787780414; x=1788385214; i=w_armin@gmx.de;
	bh=o0JnSrQtR1BxIWJ6HzZ+mlnKOc0JDaWErJpMWZ0H5Vg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=T1WpE7p72QrL1QssmRlF6UFYBadeLmt82TgQnFpAcyguN8YAM4BVroFRpRDO9v1P
	 wZL/ZyrMnTNJ2i/McgVAkrUKuRkQbm6gskzFv6zx5OEeDbwIDd+1ANhdZzekHz3Ci
	 vZfGdqv0aLv7so/5E3bxcnpDu1wFWUtAImFZCwSnbs4Q7k5Ozs6bKQUhCx3wVbZHF
	 5qNHCNEMy2spFzj9cf+Btxxg1pO+qAeZTCS0f+Pdxq43b9i76pDNBqBfoT8AfABWo
	 UNi3t3Pex+dNAjPxzv02taV7chRuu6mQaywSaNFIEAm4c0l3g15x5uYLDgei0L8Kb
	 q1YeUHlIMp+1ETOC5A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3UUy-1wynO81dA2-006l7p; Wed, 26
 Aug 2026 23:40:14 +0200
Message-ID: <f4ee6e17-6655-4683-8dc1-7af324053288@gmx.de>
Date: Wed, 26 Aug 2026 23:40:14 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: bitland-mifs-wmi: platform_profile write fails with "Operation
 not supported" on RedmiBook 15 Pro (i5-11300H)
To: Arjun Mandal <mm3885525@gmail.com>,
 "qby140326@gmail.com" <qby140326@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <CAD12wXtgzoEs81ROqzZ0krJKBg=f84_Eq89sKCp8w380zahzjg@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAD12wXtgzoEs81ROqzZ0krJKBg=f84_Eq89sKCp8w380zahzjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uCSLALO2ifWVj4uYtqYfIjRvbRMRPMmZatMiLUoVHtQwXwoJIAd
 2uvnRKyEAVn+8EVF7fqplngswPemTE7uMFzncsRGxuK6Rol/BoqxJ5RezTFruqOtzylify3
 E6Lxiyf+gmJxwTV5UHqQ7utm69tW8K99B4wuUASBxpvVSn0Vbt9jVEvZTm8zbn5DYDh31+X
 Kleww8ZAhsruMqWUv7riA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NJA0zY1VV+o=;9D9QhE8jK+raUXnYvOXEO1fxrog
 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
 kKISl9IN8aeHSAftE9yVRcX

Am 26.08.26 um 13:45 schrieb Arjun Mandal:

> Hi Mingyou, Armin,
>
> I'm using the bitland-mifs-wmi driver on a Xiaomi RedmiBook 15 Pro=20
> (India Market, 2021 model, Intel Core i5-11300H, Iris Xe, 8GB RAM),=20
> running CachyOS with kernel 7.1.8-1-cachyos.
>
> Reading platform profiles works fine, but writing any value fails with=
=20
> "Operation not supported":
>
> $ cat /sys/firmware/acpi/platform_profile_choices
> low-power balanced balanced-performance performance
>
> $ echo performance | sudo tee /sys/firmware/acpi/platform_profile
> tee: /sys/firmware/acpi/platform_profile: Operation not supported
>
> This happens for every profile value I've tried (performance,=20
> balanced-performance), even on barrel DC charger, so it doesn't appear=
=20
> to be the AC-type restriction mentioned for "Full Speed" mode. dmesg=20
> produces no output at all when the write fails - I ran `dmesg -C`=20
> immediately beforehand to confirm nothing was logged.
>
> As a result, power-profiles-daemon fails to switch profiles entirely:
>
> Failed to communicate with power-profiles-daemon: g-io-error-quark:=20
> GDBus.Error:org.gtk.GDBus.UnmappedGError.Quark._g_2dio_2derror_2dquark.C=
ode15:=20
> Failed to activate platform driver 'platform_profile': Failed to write=
=20
> to acpi_platform_profile: Error writing=20
> '/sys/firmware/acpi/platform_profile': Operation not supported (15)
>
> For comparison: on the same hardware running kernel=20
> 6.18.42-1-cachyos-lts (which predates this driver),=20
> power-profiles-daemon works correctly, using only the intel_pstate CPU=
=20
> driver, since /sys/firmware/acpi/platform_profile doesn't exist on=20
> that kernel at all.
>
> System details:
> - uname -r: 7.1.8-1-cachyos
> - Model: Xiaomi RedmiBook 15 Pro (base 2021 model - not the later=20
> "RedmiBook Pro" 14/15/16 line)
> - WMI device path:=20
> /sys/devices/pci0000:00/PNP0C14:00/wmi_bus/wmi_bus-PNP0C14:00/B60BFB48-3=
E5B-49E4-A0E9-8CFFE1B3434B-4/
> - Distro: CachyOS
> - System product name: RedmiBook 15 Pro
> - Baseboard manufacturer: TIMI
> - Baseboard product name: TM2039
>
> I suspect this may be because my model predates the newer RedmiBook=20
> Pro hardware the driver seems to target, and may use a slightly=20
> different WMI method layout - but I don't know enough about the WMI=20
> internals to confirm that myself.
>
> Happy to provide anything else that would help - dynamic debug output,=
=20
> ACPI/WMI table dumps, dmidecode, etc. Just let me know what's useful.
>
> Thanks for the work on this driver.
>
> Best,
> Arjun Mandal

Sorry for the late reply. Can you share the output of "acpidump"?

Thanks,
Armin Wolf

