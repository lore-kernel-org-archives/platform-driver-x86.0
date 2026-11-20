Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795181300;
	b=3+wiqINEHuPGZjnGgol11qXqKtPccLfJAfOdcvRSLQJ05ihBWLuNdif9z2IGgTWkEcrc
	 mMwx3rDG9DW2RaEmZtH0f0l6dUqTfSHmW+lwaER5nX+jDJzQteAwMKo1tBcUKGagj0lI/
	 0NEtbLTNVER8YtfMBV/p5M9iOZmVHl7Isc5U8YEdSLjchCz+1EkvuH90hh91nlHqW5SAq
	 oCWlyXZFXIQQMYkjeWJFkAFwRYUjY4/EUWFwoVo5M0L2aEFz+sHsAlxgJzJ4PJwVXjkCM
	 nI495ebRvqg+AIeepX0uuI25F7lPgQ0DQyIhcBag40r+IRtnAeVCaB7GZG0FkLHfRYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181300;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 User-Agent;
	bh=qfOmk5g8WOhg5omRZE5PZ9/eCljQ9jAhHJ+Xtm7TR/0=;
	b=BFQHPsy47reaMGWlyUYWTB2oBgf1o9t1Iw4Cl2zmu7oA0kDecgt8w3RJ8+/kqu0i0Gww
	 HU2my9jQ0hT9r25HQnejRx83FclgVODyFHNgOC7gdkqlLO9sZ3zHEjPnp0EC0/7AFzqwi
	 VsI5MUy6p2jio2IJnRiqGHw1rPELi0GMfn59EUMr546YHRVEi9dO7fRWMwoTC14yBvkh1
	 HNFXHqLkAa900G29XcWnfJTdcEzrtlgcnNaQdFRRttiyTgOFTkR38r+SAM8cnyHbiCmoh
	 m2qpvHu4cwduSbTZRe3fvFaP8fc9As7IyhfV3GM3W3YPrY/sgJFUURRbLbzG6te8AOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fVieoqR0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54B3606A320;
	Fri, 20 Nov 2026 13:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fVieoqR0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F7551F000D0;
	Fri, 20 Nov 2026 13:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795181300;
	bh=qfOmk5g8WOhg5omRZE5PZ9/eCljQ9jAhHJ+Xtm7TR/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fVieoqR0a4YvsxpVD6Krj2vcLw8hMNIsRtxaOFmgjec4bsmYGsawIM+LsthejH+gY
	 AJYZnnQ1TJhfygJAe1VeATFcRCPhmNsUgi+z13DlGtBb8AQL+rasda413SYxQbuCzA
	 wJf4LQPoZJYvRBUA9Nu5/oCWazLimNokOwzjQXsmlTy8Rz6grV0vQSi9PXdUpQke1O
	 93GQRSe30ZDtXylyb3llDPrC6d6o14huacpzZkMvbrttEhe4cMjdfEBtEvP7Ckd7C1
	 tJwreI549qMWEJLBvzQQoIAZ4yZBwbK5LS0TpxQeMp6YWVyaeYJMezqRNuWyLNivPq
	 i+HgPcSSwHrUQ==
Received: by pali.im (Postfix)
	id 47D7436C; Fri, 20 Nov 2026 14:28:17 +0100 (CET)
Date: Fri, 20 Nov 2026 14:28:17 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Hans de Goede <hansg@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] platform/x86: dell-laptop: Don't use an unread
 keyboard state at init
Message-ID: <20261120132817.mffko5sujvg2lsjd@pali>
References: <cover.1794633179.git.rosenp@gmail.com>
 <7d253bc056c2d6f68992d0d046affef331c57830.1794633179.git.rosenp@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d253bc056c2d6f68992d0d046affef331c57830.1794633179.git.rosenp@gmail.com>
User-Agent: NeoMutt/20180716

On Friday 13 November 2026 22:29:26 Rosen Penev wrote:
> kbd_init_info() ignores the return value of kbd_get_state(). If the
> call fails, the uninitialized state on the stack is used to set
> kbd_previous_level and kbd_previous_mode_bit, which are later sent to
> the BIOS when triggers are enabled or the backlight is turned back on.
> 
> Return the error instead. kbd_get_info() has already filled in
> kbd_info at that point, so clear it as well: level control through
> kbd_get_state() cannot work, and kbd_init() then still registers the
> LED if at least two keyboard backlight tokens are available, which
> works without it.

Why returning the hard error here? At this stage we know that the LED
tokens are available, kbd_get_info() returned success for us. The
kbd_get_state() could have temp issues.

The only problem is with the uninitialized kbd_previous_level and
kbd_previous_mode_bit variables.

What about this?

if (kbd_get_state(&state) == 0) {
	kbd_previous_level = kbd_get_level(&state);
	kbd_previous_mode_bit = state.mode_bit;
} else {
	kbd_previous_level = 0;
	kbd_previous_mode_bit = 0;
}

> Fixes: 02b2aaaa57ab ("platform: x86: dell-laptop: Add support for keyboard backlight")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/platform/x86/dell/dell-laptop.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
> index bee347e1d60c..171728d63c81 100644
> --- a/drivers/platform/x86/dell/dell-laptop.c
> +++ b/drivers/platform/x86/dell/dell-laptop.c
> @@ -1455,7 +1455,12 @@ static inline int kbd_init_info(void)
>  	    dell_smbios_find_token(KBD_LED_AC_TOKEN))
>  		kbd_timeout_ac_supported = true;
>  
> -	kbd_get_state(&state);
> +	ret = kbd_get_state(&state);
> +	if (ret) {
> +		/* Leave level control to the SMBIOS tokens, if there are any */
> +		memset(&kbd_info, 0, sizeof(kbd_info));
> +		return ret;
> +	}
>  
>  	/* NOTE: timeout value is stored in 6 bits so max value is 63 */
>  	if (kbd_info.seconds > 63)
> -- 
> 2.56.0
> 
