Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D39800;
	Sun, 29 Dec 2024 00:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735432387; cv=none; b=aHVuOnptFxZFoCSSkJlvE8DNbRmKddw976kad+om1V4mtCUK7SZtY7o2InF3xhSdfMkG9uGStkFdnhCHkx8aaDd24+S+eyZI3ObVjx8JFmGZZ9EAVzfoz7amNmx/F+uOD7qfO0GzdOw9Mt4kucK0rHefe/P4SGBbdwf16LZp/4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735432387; c=relaxed/simple;
	bh=5gamqgGj71fceVZF0825XTtZaag/zWnTzYlM4SEIZVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q+7QjrhZNtBzXxe9pfLRzAudEBPIi9f4ihnohYOo2ud8yHTtoLBy+J1OZU3bykcibWVRQ2hFAAplKXr7eqN/zKzXrvfhTCaGt6IkEiaAzT54IK+4xj0/Qgv318Fj4cxpkOECUhXTdZhAh0zzRzzwe4F1l7m6BZhhP+o1+iJ5kDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=WLI8XL6f; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="WLI8XL6f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735432372; x=1736037172; i=w_armin@gmx.de;
	bh=0CLJT2eS1jfdKbgfgdu+gubidJrPRji7mZiH4dSFO3Y=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=WLI8XL6fi5S5JnoWyLGA4Dk0BGPVFggXxkaohLpWKxiIla8J0ATcJ1RwIE7luoo3
	 UyiS+RyXP+1yeb0paSeUxLZ4ufct9d586cETsAKVs3TxWbpqGYgsO47ed8M8p+49a
	 2FhtquCEz4HqqCaWHBCQKqAix4adEV6uW41TLDSJNxSrv4g37gz9+yVJdb9rv6i7A
	 7TCGZBE+yR/OOKyHGs4sfWbyF9x4bwjsIMaq3FGcO1Dc4UO+7t1x70MjgIB5Ztlb4
	 nItmunAHw469PDRzxnhPvo2fhcXZVM21mB2g8oBadQIMUFG0+nfdy456uQUVuVmJt
	 ksgzN5+ypFFQ6QNXqw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MIx3C-1tCuTZ3mZe-00LrJC; Sun, 29
 Dec 2024 01:32:51 +0100
Message-ID: <1384260b-d179-41c6-8f39-11363c1dfd3b@gmx.de>
Date: Sun, 29 Dec 2024 01:32:50 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/20] platform/x86: Update alienware-wmi config entries
To: Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 mario.limonciello@amd.com, hdegoede@redhat.com,
 linux-kernel@vger.kernel.org, Dell.Client.Kernel@dell.com
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-20-kuurtb@gmail.com>
 <0ae84512-46f4-4cd9-8fd8-ed9694d96ec8@gmx.de>
 <znrmeluldzbh6gnczl3najtdmw3kydv7omtio5xufxa234pqaf@v5qwv6r2esiy>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <znrmeluldzbh6gnczl3najtdmw3kydv7omtio5xufxa234pqaf@v5qwv6r2esiy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:cYhBbmYTOEytBa3uWLgXqLKeGK01uOfJ3+FXmChW0dHOfL0DtAQ
 zetUdoargfjP4aGOIvMRWkS/+R66OsMfAW2UAzk99O6cw4ln0rujqrfPrU56PGo79z1/tk4
 5X/8YyWsCvt2aSXjHjQ+rWZVflL4et8hjyiMDo9ij2LyYJBiUpvHRlbfmQUoNTfuLH9RK4Z
 QvkkqWfmpLiCSrIpu9bfg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NtJYrzrMLQ8=;2XXW7SlyPBz8NPvPgJB/bX0WRDW
 nQCFb1SMyZQ/E2LHSz1EPKIjUg4OcDWXLBO3gjhaaU2ZykDVvf1dG3uiqNZxP/xJ7Mf3P7dIs
 fl9n8SHBol5drfJ2OiN9mJ2Q0mZiYAoHRmZrZLg1kGjevXMrXGNDBt/fCofVytKZoqszTqybh
 u3KPu2a7UhLPiqgX2xscv4KF1iUzX8JKhLx55Jkip6OSlCuFF9EEvZsXZoGFu8dQWy8sEvK0j
 U+yFIuVUEFOBaJ+Mm1lwyNRbe9Bwa4bN8UpoMq8m6S7k5JPXSEDSTbx65IOpqGgVaBbQQs69c
 xAuP8o6+KWluiuw1T43PvtyZtxxnlD54F2i9XuqZ8cQ08ad4EBAoakB+MKrrJueJ6bE+U7oXJ
 BF2m+OtsRRablqxNwb5cfrItGWDiFlynHrd5yThj3kOetCZ5bHxP7FStQfRK/em7hGYWlO1gD
 NOeJsAVCDHkOHchNryoTHWf1yskSjza4zGMRhAmk7OqbFuqzDyDR91nLuS83oxpmBjcB67+T/
 7EEiAEUQOpSaKKSD5rvI5WDOXXI971BJ1NarJOoPXrUbVtrCkiLpenxEm5/jDLZX5ZYYy6wTK
 LCKBG4FnI+V9TAAMBAepc2WoknqW+gFdpojyiKUGN9dBo79qeyH9j1kyTCNaXaFTUTemyrKML
 Es+O4bp+eO60IzJQxGRDtezDF2kJCUFiGfQX0S7YIpAm2wZZHvhVWxyIeQpA1LNkQBl7nsqHZ
 XLquEODbl3igTvKh88qrIcOgXQOrC7yjZdL8+mf5rwpewoPG78gpSAppjN9gAssjAlNIajkSE
 Vu1ta4lXxqvOv7LxzUwSLtQTLfECcrqca+3JH2iXQO+TSMq2w8l0o4KDgKhAEdPGQmmaUSdmF
 yN7VUhEQFPZOjt/7JW1wAAxsCerTcZPjQcD9mZxvKccfAHIYdbwg+T7Ntl1Vrh0YfpO0JVuVD
 DGVMmZRng1M4IHd7au+3cx5BWSU8kuljmqJ26ao33zOz0dA0kcb16fR2XQtzO1VgC7+pNIxa7
 EhwCU6DK5k76bNbRwx6EDQ9WwxhvDmyxzo6M9T+m5+rmc/mMbQ3HFEWB8JRbLP6vRCPzuyLRf
 KLsvJHWBHJ7+m63EifEz9jL8RFJPnq

Am 27.12.24 um 05:59 schrieb Kurt Borja:

> On Fri, Dec 27, 2024 at 05:08:03AM +0100, Armin Wolf wrote:
>> Am 21.12.24 um 06:59 schrieb Kurt Borja:
>>
>>> Add config entries for each WMI driver managed by the alienware-wmi
>>> module to be able to conditionally compile them.
>>>
>>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>>> ---
>>>    drivers/platform/x86/dell/Kconfig         | 30 +++++++++++++++++++----
>>>    drivers/platform/x86/dell/Makefile        |  4 +--
>>>    drivers/platform/x86/dell/alienware-wmi.h | 23 +++++++++++++++++
>>>    3 files changed, 50 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
>>> index d09060aedd3f..f8a0dffcaab7 100644
>>> --- a/drivers/platform/x86/dell/Kconfig
>>> +++ b/drivers/platform/x86/dell/Kconfig
>>> @@ -18,15 +18,35 @@ config ALIENWARE_WMI
>>>    	tristate "Alienware Special feature control"
>>>    	default m
>>>    	depends on ACPI
>>> +	depends on ACPI_WMI
>>> +	depends on DMI
>>>    	depends on LEDS_CLASS
>>>    	depends on NEW_LEDS
>>> -	depends on ACPI_WMI
>>> +	help
>>> +	 This is a driver for controlling Alienware WMI driven features.
>>> +
>>> +	 On legacy devices, it exposes an interface for controlling the AlienFX
>>> +	 zones on Alienware machines that don't contain a dedicated
>>> +	 AlienFX USB MCU such as the X51 and X51-R2.
>>> +
>>> +	 On newer devices, it exposes the AWCC thermal control interface through
>>> +	 known Kernel APIs.
>>> +
>>> +config ALIENWARE_WMI_LEGACY
>>> +	bool "Alienware Legacy WMI device driver"
>>> +	default y
>>> +	depends on ALIENWARE_WMI
>>> +	help
>>> +	 Legacy Alienware WMI driver with AlienFX LED control capabilities.
>>> +
>>> +config ALIENWARE_WMI_WMAX
>>> +	bool "Alienware WMAX WMI device driver"
>>> +	default y
>>> +	depends on ALIENWARE_WMI
>>>    	select ACPI_PLATFORM_PROFILE
>>>    	help
>>> -	 This is a driver for controlling Alienware BIOS driven
>>> -	 features.  It exposes an interface for controlling the AlienFX
>>> -	 zones on Alienware machines that don't contain a dedicated AlienFX
>>> -	 USB MCU such as the X51 and X51-R2.
>>> +	 Alienware WMI driver with AlienFX LED, HDMI, amplifier, deep sleep and
>>> +	 AWCC thermal control capabilities.
>>>
>>>    config DCDBAS
>>>    	tristate "Dell Systems Management Base Driver"
>>> diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell/Makefile
>>> index d5718ef34c48..8ac9a933c770 100644
>>> --- a/drivers/platform/x86/dell/Makefile
>>> +++ b/drivers/platform/x86/dell/Makefile
>>> @@ -6,8 +6,8 @@
>>>
>>>    obj-$(CONFIG_ALIENWARE_WMI)			+= alienware-wmi.o
>>>    alienware-wmi-objs				:= alienware-wmi-base.o
>>> -alienware-wmi-y					+= alienware-wmi-legacy.o
>>> -alienware-wmi-y					+= alienware-wmi-wmax.o
>>> +alienware-wmi-$(CONFIG_ALIENWARE_WMI_LEGACY)	+= alienware-wmi-legacy.o
>>> +alienware-wmi-$(CONFIG_ALIENWARE_WMI_WMAX)	+= alienware-wmi-wmax.o
>>>    obj-$(CONFIG_DCDBAS)				+= dcdbas.o
>>>    obj-$(CONFIG_DELL_LAPTOP)			+= dell-laptop.o
>>>    obj-$(CONFIG_DELL_RBTN)				+= dell-rbtn.o
>>> diff --git a/drivers/platform/x86/dell/alienware-wmi.h b/drivers/platform/x86/dell/alienware-wmi.h
>>> index 78ac10122155..97b52e51cd7d 100644
>>> --- a/drivers/platform/x86/dell/alienware-wmi.h
>>> +++ b/drivers/platform/x86/dell/alienware-wmi.h
>>> @@ -94,10 +94,33 @@ acpi_status alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
>>>    int alienware_alienfx_setup(struct alienfx_platdata *pdata);
>>>    void alienware_alienfx_exit(struct wmi_device *wdev);
>>>
>>> +#if IS_ENABLED(CONFIG_ALIENWARE_WMI_LEGACY)
>>>    int __init alienware_legacy_wmi_init(void);
>>>    void __exit alienware_legacy_wmi_exit(void);
>>> +#else
>>> +int __init alienware_legacy_wmi_init(void)
>>> +{
>>> +	return 0;
>> Please return -EOPNOTSUPP here.
> Maybe -ENODEV is better in this case?
>
> Also this should be static inline, I'll fix it.

-ENODEV is also OK.

Thanks,
Armin Wolf

>
>>> +}
>>> +
>>> +void __exit alienware_legacy_wmi_exit(void)
>>> +{
>>> +}
>>> +#endif
>>>
>>> +#if IS_ENABLED(CONFIG_ALIENWARE_WMI_WMAX)
>>>    int __init alienware_wmax_wmi_init(void);
>>>    void __exit alienware_wmax_wmi_exit(void);
>>> +#else
>>> +int __init alienware_wmax_wmi_init(void)
>>> +{
>>> +	return 0;
>> Same as above.
>>
>> Thanks,
>> Armin Wolf
>>
>>> +}
>>> +
>>> +
>>> +void __exit alienware_wmax_wmi_exit(void)
>>> +{
>>> +}
>>> +#endif
>>>
>>>    #endif
