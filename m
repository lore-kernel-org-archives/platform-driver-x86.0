Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC71288C3D;
	Wed, 19 Nov 2025 20:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763584037; cv=none; b=appzCrr/cfbnV+Cqj98EpWU04ewt8423ykruQhZ8Ih1SklvQcSSIUGJeMylLQYMqSgW8ewLH5ypcAx3YCXGhnm9YaEhCjq5bJVdlQGnDZvtVE0eMCJpjcY2qRuLYesz383xMbcPaH8VcgDuo5p4+XuNiFO7vMVrIqJvFLHTxHxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763584037; c=relaxed/simple;
	bh=Vk1eYEcBhHjDC+oS8rWZS9/edo1DVgf2v6vqlq4dW+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NGH2T1k4zwpCRWWZhwczTNqsGnQiccq3E8UMVQ/BPk0n4mLRx+wWNEcKB8mi771KyJqfJT8orLcl+Ku84f+qaeQoK4niJRdwW4ZKrwDYZAQTtdlCiS24OYsLjyrT8U7OOb8sW4icDMRjVfnlbJwGXO+eQORzPfBQqGe+02PPzA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=bI26QDEy; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="bI26QDEy"
Received: from [192.168.42.116] (pd9e597c7.dip0.t-ipconnect.de [217.229.151.199])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 53A122FC005D;
	Wed, 19 Nov 2025 21:27:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1763584032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QRClyketkTI04R8rGO7hcPliIO/Jc3aO95f2iTKfcXE=;
	b=bI26QDEyP8WSZfwLxK7us6WxsZi6hweTp0wW0uL5iSJzU2c2mQiZP4+G4US52PseQFx6Sv
	FOJ63TdTWm/8iq82Kon0m/Ca8aXBaO0N2objoF869VlGc3Zd22//wtqZbC8ZBH2AW6uS8q
	LKmxaVgFYs5k10Ehe5xSMa54IhQNPS4=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <69819b2c-9deb-481b-b404-fc6523c87a3f@tuxedocomputers.com>
Date: Wed, 19 Nov 2025 21:27:12 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] platform/x86/uniwill: Handle more WMI events
 required for TUXEDO devices
To: W_Armin@gmx.de, hansg@kernel.org, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251118150839.55336-1-wse@tuxedocomputers.com>
 <20251118150839.55336-2-wse@tuxedocomputers.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20251118150839.55336-2-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 18.11.25 um 16:02 schrieb Werner Sembach:
> Handle some more WMI events that are triggered on TUXEDO devices.
>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 19 ++++++++++++++++++-
>   drivers/platform/x86/uniwill/uniwill-wmi.h  |  2 ++
>   2 files changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
> index 014960d16211b..4efb5a909f717 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -371,9 +371,11 @@ static const struct key_entry uniwill_keymap[] = {
>   
>   	/* Reported in manual mode when toggling the airplane mode status */
>   	{ KE_KEY,       UNIWILL_OSD_RFKILL,                     { KEY_RFKILL }},
> +	{ KE_IGNORE,    UNIWILL_OSD_RADIOON,                    { KEY_UNKNOWN }},
> +	{ KE_IGNORE,    UNIWILL_OSD_RADIOOFF,                   { KEY_UNKNOWN }},
>   
>   	/* Reported when user wants to cycle the platform profile */
> -	{ KE_IGNORE,    UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE,    { KEY_UNKNOWN }},
> +	{ KE_KEY,       UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE,    { KEY_F14 }},
>   
>   	/* Reported when the user wants to adjust the brightness of the keyboard */
>   	{ KE_KEY,       UNIWILL_OSD_KBDILLUMDOWN,               { KEY_KBDILLUMDOWN }},
> @@ -382,11 +384,19 @@ static const struct key_entry uniwill_keymap[] = {
>   	/* Reported when the user wants to toggle the microphone mute status */
>   	{ KE_KEY,       UNIWILL_OSD_MIC_MUTE,                   { KEY_MICMUTE }},
>   
> +	/* Reported when the user wants to toggle the mute status */
> +	{ KE_IGNORE,    UNIWILL_OSD_MUTE,                       { KEY_MUTE }},
> +
>   	/* Reported when the user locks/unlocks the Fn key */
>   	{ KE_IGNORE,    UNIWILL_OSD_FN_LOCK,                    { KEY_FN_ESC }},
>   
>   	/* Reported when the user wants to toggle the brightness of the keyboard */
>   	{ KE_KEY,       UNIWILL_OSD_KBDILLUMTOGGLE,             { KEY_KBDILLUMTOGGLE }},
> +	{ KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL0,              { KEY_KBDILLUMTOGGLE }},
> +	{ KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL1,              { KEY_KBDILLUMTOGGLE }},
> +	{ KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL2,              { KEY_KBDILLUMTOGGLE }},
> +	{ KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL3,              { KEY_KBDILLUMTOGGLE }},
> +	{ KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL4,              { KEY_KBDILLUMTOGGLE }},
>   
>   	/* FIXME: find out the exact meaning of those events */
>   	{ KE_IGNORE,    UNIWILL_OSD_BAT_CHARGE_FULL_24_H,       { KEY_UNKNOWN }},
> @@ -395,6 +405,9 @@ static const struct key_entry uniwill_keymap[] = {
>   	/* Reported when the user wants to toggle the benchmark mode status */
>   	{ KE_IGNORE,    UNIWILL_OSD_BENCHMARK_MODE_TOGGLE,      { KEY_UNKNOWN }},
>   
> +	/* Reported when the user wants to toggle the webcam */
> +	{ KE_IGNORE,    UNIWILL_OSD_WEBCAM_TOGGLE,              { KEY_UNKNOWN }},
> +
>   	{ KE_END }
>   };
>   
> @@ -1247,6 +1260,10 @@ static int uniwill_notifier_call(struct notifier_block *nb, unsigned long action
>   		}
>   		mutex_unlock(&data->battery_lock);
>   
> +		return NOTIFY_OK;
> +	case UNIWILL_OSD_DC_ADAPTER_CHANGED:
> +		// noop for the time being
Sorry forgot to edit comment style here, will do for v3 but first waiting for 
ack of the rest.
> +
>   		return NOTIFY_OK;
>   	default:
>   		mutex_lock(&data->input_lock);
> diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.h b/drivers/platform/x86/uniwill/uniwill-wmi.h
> index 2bf69f2d80381..48783b2e9ffb9 100644
> --- a/drivers/platform/x86/uniwill/uniwill-wmi.h
> +++ b/drivers/platform/x86/uniwill/uniwill-wmi.h
> @@ -113,6 +113,8 @@
>   
>   #define UNIWILL_OSD_BENCHMARK_MODE_TOGGLE	0xC0
>   
> +#define UNIWILL_OSD_WEBCAM_TOGGLE		0xCF
> +
>   #define UNIWILL_OSD_KBD_BACKLIGHT_CHANGED	0xF0
>   
>   struct device;
