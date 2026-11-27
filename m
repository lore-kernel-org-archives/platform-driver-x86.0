Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795750131;
	b=EBTVkvehSADbEPBvK2XHqvIbuOFW1agQLvNZ0tplxQ8GfeIPtyYO1/h4RHmj6vxGgsjc
	 G39CAdnZuMIOELfpB6LLTjPvqrPZ0dfKkqhhBOgRkA+qYSS1pFAc/zQOXLs1dHc5zN7ey
	 Qus79yY3jNiL/YqnNGiN4A0M/yAVwBXD3R0aU+insO7a7qQqfaTuOfxOMVNVUjKEm3QOM
	 SwdRvJrBSKGnHWTd1drcT0fBEfDG60HZW/fG77tfAOFVOj5Ysp1Udvx0tFjrODW7txvsQ
	 rt++nQkh9MnDc/5ChSpvKtg3ZcL0RAmtKWVdx89TFvPyMSoJZ/LfiqJiyHzc/gNn9TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795750131;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=BJAlSzI5UcEx5OP48wuU5Wx76cjwhu4AHNtHYsq6++U=;
	b=IJckL8PusTEHUxXMT/0n33Wwoxpjv0bnMlA8L0sFP8QpaILkAz8rCqA8gAHUjh4lgU7n
	 VldQm5gygQKwvIcRM6rpuZhi5eaLHrw9A84dFyUP4LXQH8s7mJdAq5xCbHdk3rloPVSsX
	 4OTgLUHd9AAEUZawrCy1H8578N12wsGirbloysFY5pjBC0nEfrjov1VsB6M+bJ/w9XqJT
	 NN0dtZKAxzQ5aH6/putHkO0aN4hm2eu8VKewlMLCPFse3ReRvt+QqiUkxaPZ6udXE5Mho
	 PzuhNhqLbVouE6dYO/UZxFNlCId9IV41aixe+vcmeUYIukY//Qmhd2f0JdC1JKhL3WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=WT7GFo2w;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=xotrWsQd;
	arc=none smtp.remote-ip=202.12.124.151
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D69606A31C
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 03:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35D69606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=WT7GFo2w;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=xotrWsQd
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.stl.internal (Postfix) with ESMTP id 71E761D00541
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 22:28:49 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Thu, 26 Nov 2026 22:28:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795750129;
	 x=1795836529; bh=BJAlSzI5UcEx5OP48wuU5Wx76cjwhu4AHNtHYsq6++U=; b=
	WT7GFo2w+kqLUx6NcDahsXKguYj27RccnqzFe6zvdQ7KfYK0Ul3GyX6bUuy/WaeQ
	b5wvOmHZJ8gDCm4t519COkfZ8p0OlIAIXug1++8bkqH+XNxJo4AP8hWsmc9w3OqO
	LTpon/pEqhMgMu/PQo8CIzcHGFDTJphku2esUDnho6HC5hN5pT4PojcubBXvxIzb
	3cAvSnTBmpVzCCwIu2U3mBYtH3hQlQbdSxsZ6Zfh6hffcAmKG7HPUc3+PXTQXetF
	A9fYpZnjPlscdwn2lgaBwJGX1n1vSJr95F6zFY1JP6aaKMWEcfVTAIlbFBSfBFJ/
	rVvK2q4Sj+vfEAuEiktoyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795750129; x=
	1795836529; bh=BJAlSzI5UcEx5OP48wuU5Wx76cjwhu4AHNtHYsq6++U=; b=x
	otrWsQdom14JCw+Fzv97dpOnqCVPHK8bQ3dHISJdmWh/C5KfJsf7m26rXKKH5Uv1
	KWsg0t5a2PB+FZu53qu4QXk4o9a6bfY4TS6WegStq0ORCo2221554nfQOWWTPpMC
	m0Mt9l9tkG1aqPyWKD8TEZB94J2xfPxUqN9YDFrwMAV/M7n7LSK7WVAFDidkee5o
	08qV257BY+WoFFQ3pBRtwIuI+StQtJm8er/jbaSTmkfXRS7b3Ufqw4jjlOcptXK/
	7/x2pF1xChMbYSqP2XPp3TSjoNi8pSYCfH/NsK4ndw/mheUUHHrs3Gco6in/sJY/
	zYRtIF3rmN3Sg+y8wn4tQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795750129; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:Ps+hteIPa5E81PyUg/16jJqSDsDi5osep0OGCprhfGFxB5Y
	9Vwjs7nANonwoGV0hZI6yzk+MCjKss1nvpy7Yh/k1i9H1DsgLRFevlHShjwCO8YJ
	7VJHDgFu8J54B378K6nMkQFwplkOLEL6X1YlPkuW/Yda6EX64pDwz4oYc2NbJfGX
	7hwqmWtLeNUoWWHZK161oOXbYMDHsP8xgLGJ3jhYAYe86pJXPDAAHNwbgEtGzwnE
	cNAzBBSZPfS5iMtl7XRBJYN4MB09tqN5+ioPn214/t0rDHvz6I3bvD8I2mWUa1pR
	w1wdk/xO+dW9AUzUaZm3kxHlUamxwLWci2IEMhw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:D95H2mg59jOiOrFT89uL5ascvol8l5pfttyPizF8yic=:Upyl/7R1fGO+Fkbu3+o5xlesaHhR7inoKKSSwpwhVdY=;
X-ME-Sender: <xms:7_gIa56tPGt48fZwGqFIt-okcbomrZdzdTtm95j7-KkqIhpu7rKOMA>
    <xme:7_gIaxu0CBqY8bgyAfh7DtFhuSeno_OxNMw1uVMZI_9PnLMc6cqmM4wahWjCR-1xs
    Emv2ZT6AfoogIzzJCu-JljVQuJ5Ioi0WwBaSTtx2_CK1gWQBnNX-2k_>
X-ME-Proxy-Cause: dmFkZTG01xXJrmqprHWG8VsiOMWao6tIoBjZJv+z/tOB0VVJOQdd3wb80aBasX09ouZT8R
    VbZ4N71HPlJQEbv2QCUOk4UwYTGbXOe6kIawLe5JkXxrBASX+JerCTHUslSveUadCuygLb
    HIUFV8uf7EdIpBdgW/dH7uxlAbB+iiFoXHNxTC3Pldtjo4EqwNkxlzvCXvfZuJtjisQSVB
    UQVn/ow0PpihClCa3wUc3UmoE6dMoXhHmJIQB3quixxKlPWQkE1017XWt0JafqrXX8gbP0
    eFMQpfkql9+IC8mvuQvO36tcNBiWHupe8BtayMU4OyRKYXYubl1mJoHcwdHH9oF4iT1NMN
    U54jqO4CvfFJuYlqww+tjlXTYxuGC4fV2Jxhmvp1JWchpP9h4h/amBNo8/AtynuPJ1JS5p
    Zil4yuZqR34UTGg85Gt1aS2pHaedKL5097nc/Fi/6gIHNjLs3sRukIqfeOlYwwoRPoZYt7
    +zrV2ypXvBvo6I2noMftk5XL4eXEelRVo2axTtgZg6YG03D4s9r7Weu1UYDLZGkNQCbtX9
    KdNmLq6y7pZbmeGYiv0u+sWVpuyvcSqy4g/kGp7iOaf8nXgbNaVCRuPOvivEXa+GRGqwVV
    N2sTdQNcQQgp3URI2F1eypIbuf+WTG7+vw0jPr0vt675ozlM8iBkSGXEJVZQ
X-ME-Proxy: <xmx:7_gIaykX6IZVeMMCeRaTyptGORmD_nEBbEUPGSjcBOngDyUF7KwlmA>
    <xmx:7_gIa_0pb7YCaf0RDXrYZALiP1RazvP6aQefU3C9ccu3vD43SalUww>
    <xmx:7_gIa7eXCjyDvDssOWe9bvm9Ewp0DNVlxajfQDSyRfE_hAcl-E0geA>
    <xmx:7_gIa5YT92XWJouqxk8X2AZHTYdwEeSjXoq-5mh2fZYDLeA3JZ6WNg>
    <xmx:8fgIa1faPU2RXfGaRq5grHzc9X-0tyDpmexDfZkoUcr8sjYMxlFuqe13>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 6D56A2C0008C; Thu, 26 Nov 2026 22:28:47 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AjretoapAb9R
Date: Thu, 26 Nov 2026 22:28:27 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>, "Rong Zhang" <i@rong.moe>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Message-Id: <c1fccfb9-edfd-4287-a8dd-6cd9f51170ff@app.fastmail.com>
In-Reply-To: <20261125-thinkpad-acpi-hotkey-poll-v1-3-6dee57519c2e@gmail.com>
References: <20261125-thinkpad-acpi-hotkey-poll-v1-0-6dee57519c2e@gmail.com>
 <20261125-thinkpad-acpi-hotkey-poll-v1-3-6dee57519c2e@gmail.com>
Subject: Re: [PATCH 3/8] platform/x86: thinkpad_acpi: simplify hotkey open/close and
 poll setup
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Nov 25, 2026, at 6:11 PM, Dmitry Torokhov wrote:
> Since commit 38b9ab80db31 ("platform/x86: thinkpad_acpi: Move subdriver
> initialization to tpacpi_pdriver's probe."), tpacpi_subdrivers_release()
> is registered via devm_add_action_or_reset() before tpacpi_inputdev is
> registered. Because devres resources are unwound in reverse order,
> tpacpi_inputdev is always unregistered (closing any open handles and
> preventing new opens) before hotkey_exit() is called. Combined with
> hotkey_kthread() no longer exiting early on TPACPI_LIFE_EXITING, the
> lifecycle guards in the input callbacks are unnecessary.
>
> Drop the obsolete tpacpi_lifecycle checks and BUG() from
> hotkey_inputdev_open() and hotkey_inputdev_close(), as well as the
> redundant driver mask check in hotkey_inputdev_close() (which
> hotkey_poll_setup() already evaluates).
>
> Also call hotkey_poll_setup() directly inside the existing hotkey_mutex
> critical sections in hotkey_init() and hotkey_resume(), and remove the
> now-unused hotkey_poll_setup_safe() wrapper.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 52 +++++++++--------------------
>  1 file changed, 15 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 659a2c5d1982..e5f78107bd1a 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -2546,12 +2546,6 @@ static void hotkey_poll_setup(const bool 
> may_warn)
>  	}
>  }
> 
> -static void hotkey_poll_setup_safe(const bool may_warn)
> -{
> -	guard(mutex)(&hotkey_mutex);
> -	hotkey_poll_setup(may_warn);
> -}
> -
>  static void hotkey_poll_set_freq(unsigned int freq)
>  {
>  	lockdep_assert_held(&hotkey_mutex);
> @@ -2568,10 +2562,6 @@ static void hotkey_poll_setup(const bool __unused)
>  {
>  }
> 
> -static void hotkey_poll_setup_safe(const bool __unused)
> -{
> -}
> -
>  static void hotkey_poll_stop_sync(void)
>  {
>  }
> @@ -2579,21 +2569,12 @@ static void hotkey_poll_stop_sync(void)
> 
>  static int hotkey_inputdev_open(struct input_dev *dev)
>  {
> -	switch (tpacpi_lifecycle) {
> -	case TPACPI_LIFE_INIT:
> -	case TPACPI_LIFE_RUNNING:
> -		scoped_guard(mutex, &hotkey_mutex) {
> -			hotkey_input_enabled = true;
> -			hotkey_poll_setup(false);
> -		}
> -		return 0;
> -	case TPACPI_LIFE_EXITING:
> -		return -EBUSY;
> -	}
> +	guard(mutex)(&hotkey_mutex);
> +
> +	hotkey_input_enabled = true;
> +	hotkey_poll_setup(false);
> 
> -	/* Should only happen if tpacpi_lifecycle is corrupt */
> -	BUG();
> -	return -EBUSY;
> +	return 0;
>  }
> 
>  static void hotkey_inputdev_close(struct input_dev *dev)
> @@ -2601,11 +2582,7 @@ static void hotkey_inputdev_close(struct input_dev *dev)
>  	guard(mutex)(&hotkey_mutex);
> 
>  	hotkey_input_enabled = false;
> -
> -	/* disable hotkey polling when possible */
> -	if (tpacpi_lifecycle != TPACPI_LIFE_EXITING &&
> -	    !(hotkey_source_mask & hotkey_driver_mask))
> -		hotkey_poll_setup(false);
> +	hotkey_poll_setup(false);
>  }
> 
>  /* sysfs hotkey enable 
> ------------------------------------------------- */
> @@ -3571,22 +3548,23 @@ static int __init hotkey_init(struct 
> ibm_init_struct *iibm)
>  		res = hotkey_mask_set(((hotkey_all_mask & ~hotkey_reserved_mask)
>  				       | hotkey_driver_mask)
>  				      & ~hotkey_source_mask);
> +		if (!res) {
> +			hotkey_user_mask = (hotkey_acpi_mask | hotkey_source_mask)
> +						& ~hotkey_reserved_mask;
> +			vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_HKEY,
> +				    "initial masks: user=0x%08x, fw=0x%08x, poll=0x%08x\n",
> +				    hotkey_user_mask, hotkey_acpi_mask, hotkey_source_mask);
> +			hotkey_poll_setup(true);
> +		}
>  	}
>  	if (res) {
>  		hotkey_exit();
>  		return res;
>  	}
> -	hotkey_user_mask = (hotkey_acpi_mask | hotkey_source_mask)
> -				& ~hotkey_reserved_mask;
> -	vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_HKEY,
> -		"initial masks: user=0x%08x, fw=0x%08x, poll=0x%08x\n",
> -		hotkey_user_mask, hotkey_acpi_mask, hotkey_source_mask);
> 
>  	tpacpi_inputdev->open = &hotkey_inputdev_open;
>  	tpacpi_inputdev->close = &hotkey_inputdev_close;
> 
> -	hotkey_poll_setup_safe(true);
> -
>  	/* Enable TrackPoint doubletap event reporting by default. */
>  	tp_features.trackpoint_doubletap_enable = 1;
> 
> @@ -4024,6 +4002,7 @@ static void hotkey_resume(void)
>  		if (hotkey_status_set(true) < 0 ||
>  		    hotkey_mask_set(hotkey_acpi_mask) < 0)
>  			pr_err("error while attempting to reset the event firmware interface\n");
> +		hotkey_poll_setup(false);
>  	}
> 
>  	tpacpi_send_radiosw_update();
> @@ -4033,7 +4012,6 @@ static void hotkey_resume(void)
>  	keyboard_attached_on_screen_notify_change();
>  	hotkey_wakeup_reason_notify_change();
>  	hotkey_wakeup_hotunplug_complete_notify_change();
> -	hotkey_poll_setup_safe(false);
> 
>  	/* restore previous mode of adaptive keyboard of X1 Carbon */
>  	if (tp_features.has_adaptive_kbd) {
>
> -- 
> 2.56.1.839.g22a8290db9-goog

I think this is all good.
Just to check - how much testing have you done? I'll see if I can put the series through a few platforms just in case (but I can't see any issues with the code)

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
