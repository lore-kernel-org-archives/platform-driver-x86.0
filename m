Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=157.90.84.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437409;
	b=w2CwNJdcFlChC3iGnFxQkrgNHDVbZ1u+B6j7QNHTTB33CgkgUJeEUmgQb4bqe6mPrGCK
	 Oroksnes0Z5Lcslyq7y8buSAgyqlmOHZGFF9O1j8A2nMfUeeQK7VrvlnFigaPKqlBGpJK
	 znWBCEG2fNVI5cy1RhM7aCVZsCG22gXX6mS8DMyf5YWthwTliZKnY5+ACafgEtWFSwSc5
	 pWMkI6HdPaKbsGx20eoP+zY4hPELqXLG9PwT8otTUvISelzlrpZ/gR7+D03Qxc7aUXA3j
	 OXJ9xC7lNLYyczOw+KC3RShMSW7AsnNKo934bkMI9kLeloDwZZwcUF19P23b6sJwEkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437409;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=aZULuFGfR20WLnUBRKpi0zNnosUrXLsUQp77Bob/cn0=;
	b=UHnNQdN4q4+G1sRbyfoa/+VHdf6Zkcd0Cokxd+BApr3J5cjXj72X/Opgjv+vi+yXNo6/
	 nMX6yvknjmULKn8Z7Ue+is8XbbtKgN20vI2wZdFMJcGC8PF/l7ofDbzRV/CKC4R48xGWX
	 x6cUAEfsiU/7nfs4XBPQqqb9vpvothVhEb9QREEKZ36CdphP/p8+zjLCJfPlB33C/z47Q
	 RdmepG1j0BEExBJUpYFX50UvGuM8P1X1XWzTALtIQ/oM89l/aykBiQW++A8oV85VMF/Tl
	 vLWW/d5t0nbhVJH8cnEi+69WFBZExNuTZls+OFZWI9SK8PJWKjOz9iAxtM1gYea08Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tuxedocomputers.com;
	spf=pass smtp.mailfrom=tuxedocomputers.com;
	dkim=pass header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.a=rsa-sha256 header.s=default header.b=j0WVyS9X;
	arc=none smtp.remote-ip=157.90.84.7
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA25606A6BC;
	Mon, 23 Nov 2026 12:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FA25606A6BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.a=rsa-sha256 header.s=default header.b=j0WVyS9X
Received: from [10.10.12.8] (business-024-134-105-141.24.134.pools.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 171152FC0049;
	Mon, 23 Nov 2026 13:36:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1795437406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aZULuFGfR20WLnUBRKpi0zNnosUrXLsUQp77Bob/cn0=;
	b=j0WVyS9XNEwULcbxeyO2qiAWSEe5ARR88HvjfXkm7nFR0LQS+4JwcfZkZ9tOjs3N7cD0V4
	iunF5PjyQRNmZUDKN7KTSuxfzxWnqkaahx3qAOz+vqHliSP2d0aofz5HxmL4OwegzRTgEz
	UKLxLGSmOtAq6VN/tXxzSZQPFYZq07o=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <5b1f2805-e1a1-4f06-a5b3-b0644daff5cd@tuxedocomputers.com>
Date: Mon, 23 Nov 2026 13:36:45 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: uniwill-laptop: Remove cTGP control from
 unsupported devices
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261113144749.59958-1-wse@tuxedocomputers.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20261113144749.59958-1-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 13.11.26 um 15:47 schrieb Werner Sembach:
> Some devices like the InfinityBook Pro series have Dynamic Boost support,
> but the cTGP setting is actually ignored.
>
> This commit adds the ability to still initialize DB, but hide the noop cTGP
> sysfs attribute and applies this to the respective devices.
>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 26 ++++++++++++++-------
>   1 file changed, 17 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
> index e2a6a704e942e..c0a75bc6e66db 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -366,10 +366,12 @@
>   #define UNIWILL_FEATURE_PRIMARY_FAN		BIT(8)
>   #define UNIWILL_FEATURE_SECONDARY_FAN		BIT(9)
>   #define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL	BIT(10)
> -#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY	BIT(11)
> -#define UNIWILL_FEATURE_KEYBOARD_BACKLIGHT	BIT(12)
> -#define UNIWILL_FEATURE_AC_AUTO_BOOT		BIT(13)
> -#define UNIWILL_FEATURE_USB_POWERSHARE		BIT(14)
> +/* Mutually exclusive with the cTGP control feature */
> +#define UNIWILL_FEATURE_NVIDIA_DB_SUPPORT_ONLY	BIT(11)
just realized something i forgot: this mutual exclusivity must be added to the 
force parameter. v2 incomming
> +#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY	BIT(12)
> +#define UNIWILL_FEATURE_KEYBOARD_BACKLIGHT	BIT(13)
> +#define UNIWILL_FEATURE_AC_AUTO_BOOT		BIT(14)
> +#define UNIWILL_FEATURE_USB_POWERSHARE		BIT(15)
>   
>   enum usb_c_power_priority_options {
>   	USB_C_POWER_PRIORITY_CHARGING = 0,
> @@ -1004,7 +1006,9 @@ static int uniwill_nvidia_ctgp_init(struct uniwill_data *data)
>   {
>   	int ret;
>   
> -	if (!uniwill_device_supports(data, UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL))
> +	if (!uniwill_device_supports_any(data,
> +					 UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
> +					 UNIWILL_FEATURE_NVIDIA_DB_SUPPORT_ONLY))
>   		return 0;
>   
>   	ret = regmap_write(data->regmap, EC_ADDR_CTGP_DB_CTGP_OFFSET, 0);
> @@ -2577,7 +2581,9 @@ static int uniwill_suspend_usb_powershare(struct uniwill_data *data)
>   
>   static int uniwill_suspend_nvidia_ctgp(struct uniwill_data *data)
>   {
> -	if (!uniwill_device_supports(data, UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL))
> +	if (!uniwill_device_supports_any(data,
> +					 UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
> +					 UNIWILL_FEATURE_NVIDIA_DB_SUPPORT_ONLY))
>   		return 0;
>   
>   	return regmap_clear_bits(data->regmap, EC_ADDR_CTGP_DB_CTRL,
> @@ -2686,7 +2692,9 @@ static int uniwill_resume_usb_powershare(struct uniwill_data *data)
>   
>   static int uniwill_resume_nvidia_ctgp(struct uniwill_data *data)
>   {
> -	if (!uniwill_device_supports(data, UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL))
> +	if (!uniwill_device_supports_any(data,
> +					 UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
> +					 UNIWILL_FEATURE_NVIDIA_DB_SUPPORT_ONLY))
>   		return 0;
>   
>   	return regmap_set_bits(data->regmap, EC_ADDR_CTGP_DB_CTRL,
> @@ -2910,7 +2918,7 @@ static struct uniwill_device_descriptor phxtqxx_phxagxx_phxaqxx_phxpgxx_descript
>   		    UNIWILL_FEATURE_GPU_TEMP |
>   		    UNIWILL_FEATURE_PRIMARY_FAN |
>   		    UNIWILL_FEATURE_SECONDARY_FAN |
> -		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
> +		    UNIWILL_FEATURE_NVIDIA_DB_SUPPORT_ONLY |
>   		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY |
>   		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
>   	.kbd_led_single_color = true,
> @@ -3106,7 +3114,7 @@ static int phxarxx_phxaqxx_probe(struct uniwill_data *data)
>   
>   	if (value & HAS_GPU)
>   		data->features |= UNIWILL_FEATURE_GPU_TEMP |
> -				  UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL;
> +				  UNIWILL_FEATURE_NVIDIA_DB_SUPPORT_ONLY;
>   
>   	return 0;
>   };
