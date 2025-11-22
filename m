Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F9727A123;
	Sat, 22 Nov 2025 23:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763855739; cv=none; b=m/nwoqNhkNCs0NyuxgP6c71puLWYMhnprzhcpXPIe+Kl17NsqB+4ksRInCEimdUr+BhoTWI1JDfPXw0Dqn8XqOT+CM7zmb1aG8pCHWfnqpEbZ7hFEQd+Wbi4iRmWeOw+/6NoniMntdWpKnMR6SgrL0o3FqaTBnZc1BvgN6+cbkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763855739; c=relaxed/simple;
	bh=6J2eGV0j+UBa59UjFhI7CoGgMCkNwIL66EFL6QGC7qc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HmUjk18Fk/T2hh/VaTwPleXLF8+owpe6llWcAIAZHe4vUSwksgJglt/Gi7W4n3xaJwv9K+aCUUuSIwith4awC6E82mrszoU/f7AGvPTYFLWr28niaqxiVGrWds5czzLa9I8dCw93WLa221p+3kqWelIq6Qdgz38uvelyGnSUPTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=jGfISW7C; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="jGfISW7C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763855731; x=1764460531; i=w_armin@gmx.de;
	bh=Age2za08MNxKsCkEWLwuk67v4GthKnmjyRwE6RYay2U=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=jGfISW7CZtrBXrq1UmdrZxVJJiqXmj6rpvIVt/GxKAfPqMe/bVM+tM1QpxowPnqm
	 lZcD9reAFnWfINrxQ6ZRQ9wXTLJKBNaTWn4IS4c/oL6mpM0ZRB+33uuZLQMjbmnVI
	 vduQTr0aEo53pQK2IFSjpARTLIiWe69uFaGjQfKv+hHWZ0Dn8eeUFFpS1YPQz5daK
	 OrKSqAUpNlUCQrLbBDd/RdvYqAcAnBzKpTB3Ehh8Wbs1KCVcZR94zUO7K6staZ/rA
	 /p+hL3KMknTssn08YpLBz7j57K42tz+6I4PtjfzHR+q4RKE+q+K2sLXAH9rawW+AD
	 1UgHZ6F9g1PayB9A/A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAfYw-1vGNru3qYq-00E89l; Sun, 23
 Nov 2025 00:55:31 +0100
Message-ID: <df986ad5-5159-45e1-a236-0ff86c19eaa7@gmx.de>
Date: Sun, 23 Nov 2025 00:55:29 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] platform/x86/uniwill: Handle more WMI events
 required for TUXEDO devices
To: Werner Sembach <wse@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251120215240.436835-1-wse@tuxedocomputers.com>
 <20251120215240.436835-2-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20251120215240.436835-2-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7tSFUZswE1zgntOSKK/1WkVHF8J8X91j0Bg1o5c16hxoCSes3KW
 MnWcYWcpdvs+ohVT7ZOlSQYVOk6o9jmZLOsg57U3GDj+TqdaUViNFYVEz0BMvesmvXBiwlY
 cz/pt66tUT2Hb6V+MOv4jrPJbdkuqXV3eYdgpend2GKZD958DgSkGzX1iJ9RcHKOkN9CKWb
 irNBuv0NpXAErKybD91/A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ryzbjMq49BU=;WLXT4tZAKJqdCxDhCkHnAeXNvKA
 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

Am 20.11.25 um 22:49 schrieb Werner Sembach:

> Handle more WMI events that are triggered on TUXEDO devices.
>
> Testing the TUXEDO InfinityBook Pro 15 Gen9 Intel, the Stellaris 16 Gen5
> Intel, the Stellaris 16 Gen5 AMD and going through the out of tree
> tuxedo-drivers dkms package I identified more WMI events that are used b=
y
> Uniwill.
>
> This patch binds them to their respective function, or marks them as
> KE_IGNORE when they are send in addition to other actions, to make clear
> that they don't need special handling. This also avoids warnings in dmes=
g.
>
> The events with descriptions from memory:
>
> UNIWILL_OSD_RADIOON and UNIWILL_OSD_RADIOOFF - Sent in addition to the
> already handled UNIWILL_OSD_RFKILL on some devices.
>
> UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE - Physical button on some devices. B=
ind
> it to a button so userspace can receive the keypress and to stuff with i=
t.
>
> UNIWILL_OSD_MUTE - Sent in addition to an already handled keypress.
>
> UNIWILL_OSD_KB_LED_LEVEL0 - UNIWILL_OSD_KB_LED_LEVEL4 - Some devices sen=
t
> these instead of UNIWILL_OSD_KBDILLUMTOGGLE.
>
> UNIWILL_OSD_WEBCAM_TOGGLE - Sent in addition to deactivating the Webcam =
on
> firmware level.
>
> UNIWILL_OSD_DC_ADAPTER_CHANGED - No special handling required here atm, =
but
> will be for the charging priority feature.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 21 ++++++++++++++++++++-
>   drivers/platform/x86/uniwill/uniwill-wmi.h  |  2 ++
>   2 files changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index 014960d16211b..e0d356dfc74c7 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -371,9 +371,11 @@ static const struct key_entry uniwill_keymap[] =3D =
{
>  =20
>   	/* Reported in manual mode when toggling the airplane mode status */
>   	{ KE_KEY,       UNIWILL_OSD_RFKILL,                     { KEY_RFKILL =
}},
> +	{ KE_IGNORE,    UNIWILL_OSD_RADIOON,                    { KEY_UNKNOWN =
}},
> +	{ KE_IGNORE,    UNIWILL_OSD_RADIOOFF,                   { KEY_UNKNOWN =
}},
>  =20
>   	/* Reported when user wants to cycle the platform profile */
> -	{ KE_IGNORE,    UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE,    { KEY_UNKNOWN =
}},
> +	{ KE_KEY,       UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE,    { KEY_F14 }},
>  =20
>   	/* Reported when the user wants to adjust the brightness of the keybo=
ard */
>   	{ KE_KEY,       UNIWILL_OSD_KBDILLUMDOWN,               { KEY_KBDILLU=
MDOWN }},
> @@ -382,11 +384,19 @@ static const struct key_entry uniwill_keymap[] =3D=
 {
>   	/* Reported when the user wants to toggle the microphone mute status =
*/
>   	{ KE_KEY,       UNIWILL_OSD_MIC_MUTE,                   { KEY_MICMUTE=
 }},
>  =20
> +	/* Reported when the user wants to toggle the mute status */
> +	{ KE_IGNORE,    UNIWILL_OSD_MUTE,                       { KEY_MUTE }},
> +
>   	/* Reported when the user locks/unlocks the Fn key */
>   	{ KE_IGNORE,    UNIWILL_OSD_FN_LOCK,                    { KEY_FN_ESC =
}},
>  =20
>   	/* Reported when the user wants to toggle the brightness of the keybo=
ard */
>   	{ KE_KEY,       UNIWILL_OSD_KBDILLUMTOGGLE,             { KEY_KBDILLU=
MTOGGLE }},
> +	{ KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL0,              { KEY_KBDILLUM=
TOGGLE }},
> +	{ KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL1,              { KEY_KBDILLUM=
TOGGLE }},
> +	{ KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL2,              { KEY_KBDILLUM=
TOGGLE }},
> +	{ KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL3,              { KEY_KBDILLUM=
TOGGLE }},
> +	{ KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL4,              { KEY_KBDILLUM=
TOGGLE }},
>  =20
>   	/* FIXME: find out the exact meaning of those events */
>   	{ KE_IGNORE,    UNIWILL_OSD_BAT_CHARGE_FULL_24_H,       { KEY_UNKNOWN=
 }},
> @@ -395,6 +405,9 @@ static const struct key_entry uniwill_keymap[] =3D {
>   	/* Reported when the user wants to toggle the benchmark mode status *=
/
>   	{ KE_IGNORE,    UNIWILL_OSD_BENCHMARK_MODE_TOGGLE,      { KEY_UNKNOWN=
 }},
>  =20
> +	/* Reported when the user wants to toggle the webcam */
> +	{ KE_IGNORE,    UNIWILL_OSD_WEBCAM_TOGGLE,              { KEY_UNKNOWN =
}},
> +
>   	{ KE_END }
>   };
>  =20
> @@ -1247,6 +1260,12 @@ static int uniwill_notifier_call(struct notifier_=
block *nb, unsigned long action
>   		}
>   		mutex_unlock(&data->battery_lock);
>  =20
> +		return NOTIFY_OK;
> +	case UNIWILL_OSD_DC_ADAPTER_CHANGED:
> +		/* noop for the time being, will change once charging priority
> +		 * gets implemented.
> +		 */
> +
>   		return NOTIFY_OK;
>   	default:
>   		mutex_lock(&data->input_lock);
> diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.h b/drivers/platfo=
rm/x86/uniwill/uniwill-wmi.h
> index 2bf69f2d80381..48783b2e9ffb9 100644
> --- a/drivers/platform/x86/uniwill/uniwill-wmi.h
> +++ b/drivers/platform/x86/uniwill/uniwill-wmi.h
> @@ -113,6 +113,8 @@
>  =20
>   #define UNIWILL_OSD_BENCHMARK_MODE_TOGGLE	0xC0
>  =20
> +#define UNIWILL_OSD_WEBCAM_TOGGLE		0xCF
> +
>   #define UNIWILL_OSD_KBD_BACKLIGHT_CHANGED	0xF0
>  =20
>   struct device;
