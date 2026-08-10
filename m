Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110A028033B;
	Mon, 10 Aug 2026 13:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786369061; cv=none; b=prHV2Zf8oDaexZ/8BbOO0QuDEGPHuTWZyjUYAZvwCGQlBiCJnDI9igaA2YL/pSJMfP/uaS3y3RZHwgA/zQV4vp+uP79hanczfA1H2+UpEaBruK2+bB+9Txv6scBErkNEZKQM6pfs0Lw3niVZbqSz0CVmZQWC6/fEy2PdqORTHp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786369061; c=relaxed/simple;
	bh=bP97RUv0CO8z/Jbp3EgdT/RxU1TcpwJR/QZE571L5F0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PYjWGmP9zD8zCMlpI05nV4pCAVhRDBwjXkzNysZsDr/jEjry3Z0xpjJtMlWsi+WgUeHsAW3pJlGpfMsCF7OqYPssZcwH0LT/3K8uKvCYXFBKUQze9Ok63fqVEkNOszIGMrNa0/lZFhTMo0XcmmcUdDnf/7HtKeN4mhFmzqINi0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IJEk2tXa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IJEk2tXa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8964C1F000E9;
	Mon, 10 Aug 2026 13:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786369058;
	bh=8aG/LpDClDrxPVKUcF9qa8ul1jl5K5yF/mC8Dhd4tes=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=IJEk2tXas4zYVpGctmkH8Ihv11vMfwwwiwG21L0vVkjk7pfoQ/DB5KAy5XkjcYdSU
	 Rck8z2zOTtddfE4pub76N4pGo92L7dJ1CM3x33b9faImFDQsLSIK0sCKX2N5KxcQV8
	 Qsp89r7RKRtQwnnHNwKVBuNJlT+v97vOgVhs49ktQhFr/Fwg9AtmeNCTca+rbopImk
	 S4EHYvZ0ewDjO3j+Kcpf5aZW185QdC6lw7D+3ZYGywct+6pnsYbjlXrL5ytelDqtx3
	 DR4P7mbnm8FnkZnAl5vjzIUlbUN2k6niqXGh2JMmiDXJXGpxpQ4YUmJF6GubsHz2Iw
	 KdshWqch+gi5Q==
Message-ID: <34eb08ed-5f3b-4312-84d4-fe91aebf104e@kernel.org>
Date: Mon, 10 Aug 2026 15:37:36 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] platform/x86: asus-wmi: accept either lid-flip
 notify code
To: Robin Everaars <robineveraars@pm.me>, ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260805101502.235668-1-robineveraars@pm.me>
 <20260805141114.699959-1-robineveraars@pm.me>
 <20260805141114.699959-3-robineveraars@pm.me>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260805141114.699959-3-robineveraars@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Robin,

On 5-Aug-26 4:11 PM, Robin Everaars wrote:
> asus-wmi pairs the devid it polls for the tablet switch with the single
> notify code it listens for, and tablet_mode_sw only offers those fixed
> pairings. Some convertibles read the hinge at one lid-flip devid but
> notify with the other, which no value covers.
> 
> The ASUS ProArt PX13 (HN7306EAC) is one. ASUS_WMI_DEVID_LID_FLIP is frozen
> at 1 in every pose while ASUS_WMI_DEVID_LID_FLIP_ROG tracks the hinge, yet
> folding notifies with NOTIFY_LID_FLIP rather than NOTIFY_LID_FLIP_ROG. So
> tablet_mode_sw=2 pins the switch on and suspends the internal keyboard for
> good, and tablet_mode_sw=3 reads the right devid but never hears the event.
> 
> Accept either lid-flip code once a lid-flip switch is registered. Both are
> the same "lid flip action" event and both already map to KEY_PROG2 in the
> sparse keymap. Machines with a keyboard-dock switch notify with 0x75 and
> are unaffected, and with no switch registered the event code is 0 and the
> old equality test still runs.
> 
> Signed-off-by: Robin 
> Everaars <robineveraars@pm.me>

nitpick: Something went wrong with the S-o-b line here

> ---
>  drivers/platform/x86/asus-wmi.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index dce4d07..8b63fb4 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -820,6 +820,27 @@ static void asus_wmi_tablet_mode_get_state(struct asus_wmi *asus)
>  		asus_wmi_tablet_sw_report(asus, result);
>  }
>  
> +/*
> + * Some convertibles report the hinge at one lid-flip devid while their firmware
> + * notifies with the other lid-flip code, a pairing no tablet_mode_sw value
> + * covers. The ASUS ProArt PX13 (HN7306EAC) is one: ASUS_WMI_DEVID_LID_FLIP is
> + * frozen at 1 in every pose while ASUS_WMI_DEVID_LID_FLIP_ROG tracks the hinge,
> + * yet the fold notifies with NOTIFY_LID_FLIP rather than NOTIFY_LID_FLIP_ROG.
> + * Accept either code once a lid-flip switch is registered; both are the same
> + * "lid flip action" event 
> and both already map to KEY_PROG2 in the sparse keymap.
> + */
> +static bool asus_wmi_is_tablet_switch_code(struct asus_wmi *asus, int code)
> +{
> +	if (code == asus->tablet_switch_event_code)
> +		return true;
> +
> +	if (asus->tablet_switch_event_code == NOTIFY_LID_FLIP ||
> +	    asus->tablet_switch_event_code == NOTIFY_LID_FLIP_ROG)
> +		return code == NOTIFY_LID_FLIP || code == NOTIFY_LID_FLIP_ROG;
> +
> +	return false;
> +}
This seems rather complicated, instead if adding this function please dropall usage of tablet_switch_event_code and ...

> @@ -4675,7 +4696,7 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
>  		return;
>  	}
>  
> -	if (code == asus->tablet_switch_event_code) {
> +	if (asus_wmi_is_tablet_switch_code(asus, code)) {
>  		asus_wmi_tablet_mode_get_state(asus);
>  		return;
>  	}

Replace the code check if condition with:

        if (code == NOTIFY_KBD_DOCK_CHANGE ||
            code == NOTIFY_LID_FLIP ||
            code == NOTIFY_LID_FLIP_ROG) {

and update the commit message to match.

Regards,

Hans


