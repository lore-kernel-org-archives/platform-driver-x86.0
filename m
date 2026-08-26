Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546B727144B
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Aug 2026 09:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735350; cv=none; b=g1ShkI6LxwEAiIhIviOj+5hCL1GfRekM6vXJ4StfaEcMa8IIjfdc1grvdqhRUt6WBdU8CygD4veDmIiUBsCAJhcPiCGaealyk3pV95uPdRT8ZgeyR2SJv5nFG6xci6nfjprbPHfNrq24a04aukJwvTCx/IAIBN6oT7oYlFJF4E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735350; c=relaxed/simple;
	bh=+6JFwj86L0geMJ4PtWbM8iOP1WogyjSiv7jFOskyhYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vENyGpk2mNMavMCZ2D84L+uDdCNTK3ivQSZLs0OkUWBWT2C42SFGsjmSqcuxG+f3dqXWVgkgYthG4lN9exw5uFVV35hsIKfpOBfW9bUS925u1r5aCk3kq4CoXr5iAobcsMqnBIMnBeexWhpN9gCUpUwygX5ajI/xC4XH4Zw+MBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fcQtr5ic; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fcQtr5ic"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B32C1F000E9;
	Wed, 26 Aug 2026 09:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787735348;
	bh=IjxIlB1BULRmQXE+VxT7WyEuZyg2I234XN+jO2pvHQo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=fcQtr5icyeRlMS/25oROgR7iP8GCmXV6zkJgXdZd8lRfBl6aF67JCH0WFqzrxvO/8
	 D36w5UkSyb+mOia9mytZQcTaaX1S26go1nFYsJ7sYP9EMrWr4Bc60aeSGznz8CBM2x
	 8gNy+UmMY3Enn5YQix3PkeibZinfrIWhlu/203ZqbJIcw3Ibwri7bJBBi27POVW3yD
	 7ja3zR6UuV187+wfTqpdLqsPXuPNMV5sf9dY2Jj9p68rIDEF6AuEBagRgKQHKGqzXQ
	 yQODiEQ3AUATRHpjvCX2jZtp9MoR34kOTmkkHNKJuYFCTdUJ/r4XC9X1J1SjXORuSi
	 JdpaP5Hr7T6dg==
Message-ID: <8cf8ef11-0d21-4d09-ba8c-004132a3a0a7@kernel.org>
Date: Wed, 26 Aug 2026 11:09:05 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform: arm64: thinkpad-t14s-ec: don't send
 KEY_KBDILLUMTOGGLE on Fn+Space
To: David Stephenson <git@davidstephenson.net>,
 Sebastian Reichel <sre@kernel.org>
Cc: platform-driver-x86@vger.kernel.org
References: <20260825193556.133277-1-git@davidstephenson.net>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260825193556.133277-1-git@davidstephenson.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 25-Aug-26 21:36, David Stephenson wrote:
> On the T14s, the EC already steps the keyboard backlight when you press
> Fn+Space: off, then low, then high.
> 
> We report that change with t14s_kbd_bl_update() (brightness_hw_changed).
> We then also send KEY_KBDILLUMTOGGLE.
> 
> The extra key is the problem. Desktops treat it as "please toggle the
> light." GNOME calls Keyboard.Toggle() and changes the LED itself. That
> fights the EC's three steps. The on-screen bar also stays empty,
> because Toggle() always returns 0%.
> 
> thinkpad_acpi on x86 already skips the key when the firmware changed
> the light. It only uses brightness_hw_changed. Do the same here: keep
> the LED update, do not send KEY_KBDILLUMTOGGLE.
> 
> Tested on a Lenovo ThinkPad T14s Gen 6 (21N1, Snapdragon X Elite) with
> GNOME. After this change the OSD bar tracks off / 50% / 100%.
> 
> Signed-off-by: David Stephenson <git@davidstephenson.net>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
>  drivers/platform/arm64/lenovo-thinkpad-t14s.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> index 5590302a5..22d20a907 100644
> --- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> +++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> @@ -488,8 +488,14 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
>  	case T14S_EC_EVT_NONE:
>  		break;
>  	case T14S_EC_EVT_KEY_FN_SPACE:
> +		/*
> +		 * Firmware already cycles the keyboard backlight
> +		 * (off / low / high). Notify userspace through the LED
> +		 * class only. Emitting KEY_KBDILLUMTOGGLE as well makes
> +		 * desktop environments toggle the LED a second time.
> +		 */
>  		t14s_kbd_bl_update(ec);
> -		fallthrough;
> +		break;
>  	case T14S_EC_EVT_KEY_FN_F4:
>  	case T14S_EC_EVT_KEY_FN_F7:
>  	case T14S_EC_EVT_KEY_FN_4:

