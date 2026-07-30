Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582653C1F46;
	Thu, 30 Jul 2026 09:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785403033; cv=none; b=BvR7Y97AVIVOjlRBPNQ7sZ4VikndSbViXTmWCzRtbQcdbMtGJ1vsh0NMekuReSOAhKwdhNQj90spltWISt+IopMYbtN/qMX16tIdg87B/AXIwrTFpBkPT1KnckXRcwKUtgyGvZhrP8Rfsx3egab+n2+LooZ712kzC2nox4uf4LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785403033; c=relaxed/simple;
	bh=5CytVqFPPqn+mD0KY8tQ6EXXjeR0s1xAgL9HIj9haXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qfZG2q6EkAI7Y7w6mvEjbaoavt3/cVw4yaWzQ+TaKbZAnbSjY0Y1nHOdNwNI5ZWgkjiA6CE6jRARFmwhvYg/RTfzxNPZkf6Be1oiUfE6HP+VdrXPSTSeTvRawWxK1wC8zHsAWkTOSFtp37VC4fwIRcrUT1OGZxnYI5Yz8rP+BHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=fFscyl3h; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="fFscyl3h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1785403027; x=1786007827; i=w_armin@gmx.de;
	bh=HK6xdJhYh5EchfFfeOP72ybbF8aPrLBmtUhBrWSCvjM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=fFscyl3hXyiZ/Zy9GnVsSbvPg/50JjDfN+Fk1DNzLly2/I0PyYEdxc/jK18f23Ir
	 PBh3r3uB3hCVTKUFRRxige/Z459VerNzAzeHAiKD5ZDQ9H5mGoqo8cvIT8nIs56wo
	 cS8Yd97zttyWr0sdpUPA8iJo3CKMNJ4LEmTWva2cIOBD4KgzNmpEe1tW1j5KxITRT
	 g/Ssq1/uc+8YX4oFDfEhCjcLeLNYx+k9iQJkp+R/7ExbYWeLdoWX7NhmNogsVSf3/
	 IcjJ9epYaKSHOkx9erO0jCMOAW9b6+jhFFK+zS+xnraUDHQcYbWfosRZM1rodzh76
	 aOj5amSTuoS/nB+RMg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRCKC-1wdJg70kRI-00T2am; Thu, 30
 Jul 2026 11:17:07 +0200
Message-ID: <a7c7611d-1721-407d-a4d3-ec096c5e34e2@gmx.de>
Date: Thu, 30 Jul 2026 11:17:03 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: acer-wmi: Add support for Acer Nitro
 ANV15-51
To: Justin Vargas <justinyvar@gmail.com>, jlee@suse.com, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260729222920.6490-1-justinyvar@gmail.com>
 <20260729235125.1698-1-justinyvar@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260729235125.1698-1-justinyvar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:rwxiWW7awIySBWXo9wGyiSuTyn+rimBNSgA5I3d4AZItbgejAKM
 9cYkfGVyCEiuBMQ9jlWdCBKzV/U8TMxXmjg04qfZSS1ucbettfgVXTdRccChsj9SZjKCmPE
 o/PKbOaOy7AZxJHkkW0dsUFsflB7eRvBNlqrNeE8lixqTKtMujPMTY/h4EpjT90rvxXqTR9
 zoYaQy/WVTiIVx9PeDyJg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1B6jRziPOOY=;j3RDgK/Dw25FO4NqxPtY+hTSw+w
 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
 8xm

Am 30.07.26 um 01:51 schrieb Justin Vargas:

> The Acer Nitro ANV15-51 uses the Predator V4 WMI interface for thermal
> profile handling and hardware monitoring, but has no quirk entry, so
> these features are only available when the predator_v4 module parameter
> is passed manually.
>
> Add a quirk entry for this model.
>
> Note that this machine does not support the turbo thermal profile: its
> supported profiles bitmap (misc setting 0x0A) reads 0x53, and writing
> PLATFORM_PROFILE_PERFORMANCE is rejected by the firmware. The four
> remaining profiles work as expected.

Hi,

can you create a custom quirk entry and check if controlling the CPU/GPU fans
works? For this you need to fill-in the number of CPU/GPU fans inside struct quirk_entry
and set "pwm" to "1".

I think fo something like "quirk_acer_predator_ph16_72", just without ".tubo = 1".

Thanks,
Armin Wolf

> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Justin Vargas <justinyvar@gmail.com>
> Tested-by: Justin Vargas <justinyvar@gmail.com>
> ---
> v2: Add Assisted-by trailer per
>      Documentation/process/coding-assistants.rst. No change to the code.
>
> Tested on an Acer Nitro ANV15-51, BIOS V1.60 (04/08/2026),
> kernel 7.0.11-1-cachyos:
>
>    $ sudo dmidecode -s system-product-name
>    Nitro ANV15-51
>
>    $ sudo modprobe acer_wmi predator_v4=1
>    $ cat /sys/firmware/acpi/platform_profile_choices
>    low-power quiet balanced balanced-performance performance
>
> Writing low-power, quiet, balanced and balanced-performance all succeed
> and audibly change fan behaviour. Writing performance is rejected by the
> firmware, consistent with the supported profiles bitmap (0x0A) reading
> 0x53, i.e. bit 5 (turbo) clear.
>
> hwmon works: sensors reports acer-isa-0ace with fan1 3024 RPM,
> fan2 2685 RPM, temp1 +48.0 C.
>
> The WMI mechanism was cross-checked on Windows, where NitroSense switches
> profiles via SetGamingMiscSetting with index 0x0B and the same profile
> values used by this driver.
>
> The analysis and patch were produced with AI assistance (see the
> Assisted-by trailer); all testing was performed by me on the physical
> machine, and I take responsibility for the patch as signed off above.
>
>   drivers/platform/x86/acer-wmi.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index e0eaaefb13d..a7290f85166 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -662,6 +662,15 @@ static const struct dmi_system_id acer_quirks[] __initconst = {
>   		},
>   		.driver_data = &quirk_acer_nitro_an515_58,
>   	},
> +	{
> +		.callback = dmi_matched,
> +		.ident = "Acer Nitro ANV15-51",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro ANV15-51"),
> +		},
> +		.driver_data = &quirk_acer_predator_v4,
> +	},
>   	{
>   		.callback = dmi_matched,
>   		.ident = "Acer Predator PH315-53",
