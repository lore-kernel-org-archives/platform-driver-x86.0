Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFCC29B8C7
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Dec 2025 06:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765435772; cv=none; b=pg+B+D+M1376MTQFwElqqM4aQXINNgrKKYPkZjoNOO9CwRcJENJFqeQ5rv0Bg/cCJMTlTW4JHVH4eAKLEPqpov+VdtQKjwkq1IzXadc7Aj82sRjrtK1v6t00kKm0rpvPYBbAxhxiiXmjBCeTgsvzfcXsNTBuSWqOcPRLa+OkfCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765435772; c=relaxed/simple;
	bh=St5P/dKbzDpzDcZYqoy/Tl1MQ0rf5fYQKRZAJ31LVaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BZqrBdUfPvZ/DMyW68lpPuqZuC6KaJOEK15Uoj+zlkKA1r5s4RrgxlUsUm5CQ8v0dQGKCtirLfMglunwTRHozPlNVm1h9UijIUA8/XUQLkd1H8lnfntLz2CRiVkXQUDhtcpbTZCUSbD+MYuYM39HxCUUxVVrfvmjwJowGhd7hW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ux3Boi1R; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ux3Boi1R"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso731831b3a.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Dec 2025 22:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765435769; x=1766040569; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TvqvRKg6Dvm4JYTqbcpJmcxvj5YVSJwC2ID5rS1kYns=;
        b=Ux3Boi1RJtJkm4EKbwkd1TdKIUlssLr03nVEJpWhDJi/DHdIulpYzI1rLQL/kolX++
         zWjmIPlSHeTL3sPm8RPn8la+UTd71tOooPd0mdXQ0sADyMStR83wynd9RZ0vTYmyyeBb
         M9lYT1dRZMLzucoPWjiG2kOIDNpSsYSoI8coZq6PK+OtAsCW3jHAA9emiRs0LjXEAZMt
         n58YEgbsx9U69XvTfQ0MvmU+wpNRujfS/tGiszkUpK8+AEpyBlEqFn4/WkNW25rZlra4
         UwmzgU89xhfM02rHCb2zmq30AbU19IlQlr+vVoMkt/CZSfMIrx5rPdTEArXPc6pbn1Rs
         /nIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765435769; x=1766040569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TvqvRKg6Dvm4JYTqbcpJmcxvj5YVSJwC2ID5rS1kYns=;
        b=alHgXyi60kF7Wf9J8Suuwb4pnkTjsQ6Q8mgX+8dhnrNENwA+jeFov2K6v0KmWJ4WSJ
         6BKn1ywshumRnmhah+tI2XbhDMiFLIEJ5dRHMby24VEscKUv7SVHOtMzdp27w1uBmj3J
         kvn5dyjiykytu3uLcX8P+NG402g/VM5387A2sJU7dAJSW1x3SCkxTFVlyjQfq+R+qfOZ
         +sfD17bTPW/EMOgsPbh5B7JHsntX0Ir3U1qkZTYOh860g9+UIJM0NXj8c0Hj22DTmiIH
         6PUINh3NCynVa/N4Pqzvg4afa7PtAb7l+LbtuAIiA4sJZxV50h1mmI6V2AlhI/UlLGNq
         r6vg==
X-Forwarded-Encrypted: i=1; AJvYcCX++ISMYlt+Skc3EnH+awlEFl5bXt1XYjV9SwGIgeSwSuXqDGalpp4X5Jlmh9A9fyaw1BJUQO+bHz0356y3+BgEtvuZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwrKvKz/qeKYqmA5pOJBxgGtOb2k84jiR7H8tS+kRiE17bod1P7
	NpQkFy0ij6zQWkvedlFvKEcdad6sP5amYQi6LZkgYpdbvvgh9dvyBsaB
X-Gm-Gg: AY/fxX7H+6i3K91SYshGS5e6X1136Nl1CM6iv4kwgh8p5SoSj+stTgJ68T6sPWhwZHB
	9KM/b2dga76IheswqyRFriN054v072sTEGrJmS4C6jiU0nN3dcujFpEr1/caxsXIuErEthQEvvA
	hW6u0fC5HELhQR+mu4o5kh7rMtxfQkoRy34EKkr8xk/sTRmDVOm5x8JUl8UKtbcSS8kdjfC+kFw
	CjxlGBi126sruHMGUqfVlY34NRybYWZjqfPhSHy+yM1i26iRNQUSVxqqg1hgdk+zomNzH05XqGb
	RIHb/rCKAN5AzMASfsmBfBkJuvUQYohrzqqIYn3IIHEioklKzNvFnoiA7A83yLLNhf/3coG2ZUc
	+LUAMGrwEABkt9tPTSEfqMWFqyRON9Fmt8gQgw8GhOvznR3GWGuSyZ+AxOtq5ADoOifwe2jh9T6
	/w4pfNrY2OazH2avVN+wyBMyK7dZYN3rPWP4Ig9FqcUGaFxHc9T0Kz
X-Google-Smtp-Source: AGHT+IEyDtd0oe3IAE6MkIRcuPF1XAaex7O+UXkzSJ582FShFldjGqeQBlos3z7LrpPfpvFbd/RWdg==
X-Received: by 2002:a05:7022:985:b0:119:e569:f25f with SMTP id a92af1059eb24-11f2966bd00mr4273471c88.8.1765435768924;
        Wed, 10 Dec 2025 22:49:28 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:8720:58cb:6770:779f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2b4bb8sm4156046c88.7.2025.12.10.22.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 22:49:28 -0800 (PST)
Date: Wed, 10 Dec 2025 22:49:25 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Vishnu Sankar <vishnuocv@gmail.com>
Cc: corbet@lwn.net, hmh@hmh.eng.br, derekjohn.clark@gmail.com, 
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com, mpearson-lenovo@squebb.ca, 
	linux-doc@vger.kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, vsankar@lenovo.com
Subject: Re: [PATCH v4 1/3] input: trackpoint - Enable doubletap by default
 on capable devices
Message-ID: <he73fiwxso45ykidteqz2s2gjklezsyd47xwxtwlfes27kxuq3@ucwhmacbtsn4>
References: <20251129002533.9070-1-vishnuocv@gmail.com>
 <20251129002533.9070-2-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251129002533.9070-2-vishnuocv@gmail.com>

Hi Vishnu,

On Sat, Nov 29, 2025 at 09:25:31AM +0900, Vishnu Sankar wrote:
> Enable doubletap functionality by default on TrackPoint devices that
> support it. The feature is detected using firmware ID pattern matching
> (PNP: LEN03xxx) with a deny list of incompatible devices.
> 
> This provides immediate doubletap functionality without requiring
> userspace configuration. The hardware is enabled during device
> detection, while event filtering continues to be handled by the
> thinkpad_acpi driver as before.
> 
> Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
> Changes in v4:
> - Simplified approach: removed all sysfs attributes and user interface
> - Enable doubletap by default during device detection
> - Removed global variables and complex attribute infrastructure
> - Uses minimal firmware ID detection with deny list
> - Follows KISS principle as suggested by reviewers
> 
> Changes in v3:
> - No changes
> 
> Changes in v2:
> - Improve commit messages
> - Sysfs attributes moved to trackpoint.c
> - Removed unnecessary comments
> - Removed unnecessary debug messages
> - Using strstarts() instead of strcmp()
> - is_trackpoint_dt_capable() modified
> - Removed _BIT suffix and used BIT() define
> - Reverse the trackpoint_doubletap_status() logic to return error first
> - Removed export functions as a result of the design change
> - Changed trackpoint_dev->psmouse to parent_psmouse
> - The path of trackpoint.h is not changed
> ---
>  drivers/input/mouse/trackpoint.c | 51 ++++++++++++++++++++++++++++++++
>  drivers/input/mouse/trackpoint.h |  5 ++++
>  2 files changed, 56 insertions(+)
> 
> diff --git a/drivers/input/mouse/trackpoint.c b/drivers/input/mouse/trackpoint.c
> index 5f6643b69a2c..67144c27bccd 100644
> --- a/drivers/input/mouse/trackpoint.c
> +++ b/drivers/input/mouse/trackpoint.c
> @@ -393,6 +393,48 @@ static int trackpoint_reconnect(struct psmouse *psmouse)
>  	return 0;
>  }
>  
> +/* List of known incapable device PNP IDs */
> +static const char * const dt_incompatible_devices[] = {
> +	"LEN0304",
> +	"LEN0306",
> +	"LEN0317",
> +	"LEN031A",
> +	"LEN031B",
> +	"LEN031C",
> +	"LEN031D",
> +};
> +
> +/*
> + * Checks if it's a doubletap capable device

Please finish the sentence with a period.

> + * The PNP ID format is "PNP: LEN030d PNP0f13".
> + */
> +static bool is_trackpoint_dt_capable(const char *pnp_id)

Let's call it trackpoint_is_dt_capable() to keep with common
"trackpoint_" prefix in the file.

> +{
> +	const char *id_start;
> +	char id[8];
> +	size_t i;
> +
> +	if (!strstarts(pnp_id, "PNP: LEN03"))
> +		return false;
> +
> +	/* Points to "LEN03xxxx" */
> +	id_start = pnp_id + 5;
> +	if (sscanf(id_start, "%7s", id) != 1)
> +		return false;
> +
> +	/* Check if it's in the deny list */
> +	for (i = 0; i < ARRAY_SIZE(dt_incompatible_devices); i++) {
> +		if (strcmp(id, dt_incompatible_devices[i]) == 0)

Why can't we use strncmp(pnp_id + 5, dt_incompatible_devices[i], 7) here
(after ensuring that pnp_id is of sufficient length to begin with) and
avoid sscanf()?

> +			return false;
> +	}
> +	return true;
> +}
> +
> +static int trackpoint_set_doubletap(struct ps2dev *ps2dev, bool enable)
> +{
> +	return trackpoint_write(ps2dev, TP_DOUBLETAP, enable ? TP_DOUBLETAP_ENABLE : TP_DOUBLETAP_DISABLE);
> +}

This wrapper seems an overkill given that it is called only once and
always to enable the doubletap.

Thanks.

-- 
Dmitry
