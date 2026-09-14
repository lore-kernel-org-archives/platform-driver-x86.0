Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF5545A28E;
	Mon, 14 Sep 2026 14:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789396378; cv=none; b=HKsGvMT8jc66mDyKl1jDAwrKLfllms9bzOdEGiryfeOjgyS15T0VaB8RWC99ztXIZUWTzAwDKN5MGnNAGMVEmUPQoMPCP4tVse/pGZA0ze/L16DlQnJ5zIWsAsVahLG+5St5nE0B+Q4lWtO+Rc7fARM44JaaaHlhbyv27H01bBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789396378; c=relaxed/simple;
	bh=HgFB5aEx2ouxatiwPR1aBEpqJLoquDcpC/OxmGn+M4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=izOElU6SwO0TamqkBH6US+lznzeAvAO53Mll9T3v6KowTZsWcnLPUHVn93AqNr7VSeViuYSvCH2GqhdKZby9ceF82s8Q4kAsbendPgpKhTuD16b9f1nEUO0juOc2h4VvgfN1gFR0b1kQInJcrRQxsriu1OsZH4oEYIULonRqOq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KJ3BADTP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KJ3BADTP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F21651F000FF;
	Mon, 14 Sep 2026 14:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789396377;
	bh=LDWyLjc+Umu+8PECaPQcHuToncfX7VhSqbOaJdcjVZw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KJ3BADTP2QO2I+xkyWKvQXTfZLyTLnjnKzGWm1qkyzO8Q3dxsYiE9IKejMbkRqyo5
	 gUGkFwdeV5GkXDoY0XAdqti6P/O7PoC5CANZ8fkdAlTiNJYP6xuaq3geLLqO1ZPQQV
	 COlGhaTBdns4VvLD1XUhqntK0MZo6TvWXcTj8QnzX+Q8uxRd2hzb9/o6WrnCDE78wA
	 H4ShdGBZ4GbajLg0ybAu886Q26gttSmUA6Xwty1lBt5B1BE6/okHjTpDLiaKXWkoCM
	 I2WS28bGIXad2imACSvjNgrHvtyV1hy5bV2AGeEdybtcFPYbdNNXmiJiLX+aaLOhDI
	 dI4RTcxj8FVuA==
Message-ID: <33b9e7fb-be66-4680-b0c0-8c3f6cfa2671@kernel.org>
Date: Mon, 14 Sep 2026 16:32:54 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: ideapad-laptop: Add Yoga Pro 7 14IAH10
 Mode key
To: Navon John Lukose <navonjohnlukose@gmail.com>, ikepanhc@gmail.com,
 ilpo.jarvinen@linux.intel.com
Cc: mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260914134216.1295740-1-navonjohnlukose@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260914134216.1295740-1-navonjohnlukose@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14-Sep-26 3:42 PM, Navon John Lukose wrote:
> The F9 "Mode" key emits WMI fn-key event 0x46, which the keymap does not
> cover, so it reaches userspace as KEY_UNKNOWN and cannot be remapped from
> there. Under Windows it opens a performance profile chooser. The Fn+Q
> button already cycles platform_profile through
> ideapad_check_special_buttons(), so map 0x46 to KEY_PROG4 as a
> user-assignable key rather than cycling the profile a second way.
> 
> Signed-off-by: Navon John Lukose <navonjohnlukose@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans


> ---
> v2: reword the entry comment and explain why 0x46 is not routed through
> platform_profile_cycle() (Hans).
> 
> https://lore.kernel.org/platform-driver-x86/2eab84cb-6d2f-4ec3-9869-e2aa9c1d75da@kernel.org/
> 
> Lenovo Yoga Pro 7 14IAH10 (83KF), BIOS QGCN35WW.
> 
> Measured with dyndbg on ideapad-laptop.c and a kprobe on
> platform_profile_cycle():
> 
>   Mode key (plain F9), 2 presses:
>       WMI fn-key event: 0x46, twice
>       no platform_profile change
> 
>   Fn+Q, 2 presses:
>       platform_profile_cycle() twice, called from ideapad_acpi_notify()
>       no WMI fn-key event
> 
>  drivers/platform/x86/lenovo/ideapad-laptop.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
> index 8213524..35c13d9 100644
> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> @@ -1360,6 +1360,8 @@ static const struct key_entry ideapad_keymap[] = {
>  	{ KE_KEY,	0x45 | IDEAPAD_WMI_KEY, { KEY_PROG3 } },
>  	/* Performance toggle also Fn+Q, handled inside ideapad_wmi_notify() */
>  	{ KE_KEY,	0x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
> +	/* Mode, opens a profile chooser; the Fn+Q button cycles the profile */
> +	{ KE_KEY,	0x46 | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
>  	/* shift + prtsc */
>  	{ KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_SELECTIVE_SCREENSHOT } },
>  	{ KE_KEY,   0x29 | IDEAPAD_WMI_KEY, { KEY_TOUCHPAD_TOGGLE } },

