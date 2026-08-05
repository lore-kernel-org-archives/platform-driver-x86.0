Received: from out-184.mta1.migadu.com (out-184.mta1.migadu.com [95.215.58.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD1B46A5FB
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Aug 2026 12:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785931926; cv=none; b=UFBhGugPBW4Dc95Ev5Gls/YJucBcRHtTNpPfl0ydd1mv8rxZOdOZRollBDDD4L9UqQ4U1pL+KSxLYMM/aJCwTjGjEFKWAZzW/lRG6ps7X+bGssJQKtxF3I7G8EnNNLXT721LLWcmH/GtwcvJz76aJy9zH/zh5GJYU8xNCpJQTN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785931926; c=relaxed/simple;
	bh=RVCIjScgWrnioG3jrlt8pDmLarRvvk9Mn6ykTj8u+GY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XsSs/UXdhwcJwlh96ghMPqvPa3wqtV1NmPmW4ubgRTIcJELxk6DRGWg15EXQTlWfv5yVPtq8hURayuka9KzeViEGHUQTw2WY3kPnr9Q6nhg8tI3X3n/ooDCyJ6V2HXhVftqbQF5ndJfdoqK7RC66z33Z38b9ngBKNZF22vSOFbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iqFCOHbU; arc=none smtp.client-ip=95.215.58.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iqFCOHbU"
Message-ID: <a27396b5-31ad-4973-a7aa-0ae7ef269c73@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785931922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1kN+rvvN5L7AoRTyRwb2zBCE50Qs7dvKXpTCz3zZRUg=;
	b=iqFCOHbUa0tD0MBxu6GAp0Ao/17/PxggsmraV1NtTVS8hAGsmMdK7ugkgnLFtc/COLCXA6
	w5jRR8dVCMwLgkPI5tdhb+7gm+fJmForVjFx7mj0TZ26YUrLJOSA9pW9coT0BVyxJOcR5D
	VV0Wq7442BY8cCHJuW74dHuxn3JXUmA=
Date: Wed, 5 Aug 2026 14:11:46 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] platform/x86: asus-wmi: accept either lid-flip notify
 code
To: Robin Everaars <robineveraars@pm.me>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com, luke@ljones.dev,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260805101502.235668-1-robineveraars@pm.me>
 <20260805101502.235668-3-robineveraars@pm.me>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20260805101502.235668-3-robineveraars@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 8/5/26 12:15, Robin Everaars wrote:
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
> ---
>  drivers/platform/x86/asus-wmi.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index f68fd2bcd..bcbb98529 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -819,6 +819,27 @@ static void asus_wmi_tablet_mode_get_state(struct asus_wmi *asus)
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
> + * "lid flip action" ev
> ent and both already map to KEY_PROG2 in the sparse keymap.
> + */
You may want to complete this kernel doc blockm adding at the beginning
function_name() - brief

and below the description params and return.
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
> +
>  /* Charging mode, 1=Barrel, 2=USB ******************************************/
>  #if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
>  static ssize_t charge_mode_show(struct device *dev,
> @@ -4674,7 +4695,7 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
>  		return;
>  	}
>  
> -	if (code == asus->tablet_switch_event_code) {
> +	if (asus_wmi_is_tablet_switch_code(asus, code)) {
>  		asus_wmi_tablet_mode_get_state(asus);
>  		return;
>  	}
