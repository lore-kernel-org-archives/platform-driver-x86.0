Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318C84E80C1;
	Mon, 28 Sep 2026 15:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790610642; cv=none; b=JfhvomMcDv2UOxAMdJJBh78ziulcHeIot6qCQA+GM9vNYgbDpWXPy7f+XnxyZXEata396BhiLdiHskZ7X4smfN2EevsGicoS5Ow8lXWCN2EFC3/FlAPW3g3sl4n4NF6lw5p5HLNgfMrQGUJulrLONLvbXX2uncI+TT4LVPpyHCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790610642; c=relaxed/simple;
	bh=nmLVfe4dvpb0vNGKCx0ht3gz+WrVFiycbXT+JcmknPU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=mRphZnEicMD1/HyGzTfi2vC4dM79xPKojq7B9sCye+Sq05YieMMRBFXZ+8xol5AI/yAb8/8/Ugqgre4DMs0fwro3CLnMNtYAlBApca70iiYkF7zvD2xf3JZTIH62ecBfsJ+blyC4HbG7ds8vfstpEFUd8wQ4aD8JLUtjozDPm34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=KBw5tq1l; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SxzfmnBX; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="KBw5tq1l";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SxzfmnBX"
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.phl.internal (Postfix) with ESMTP id D12A3EC00EF;
	Mon, 28 Sep 2026 11:50:38 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Mon, 28 Sep 2026 11:50:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1790610638;
	 x=1790697038; bh=RRCoUZlKYkznsUM6Nze6o4c11DvNZ5cTeyM1vfAi1H0=; b=
	KBw5tq1lyA68/ggKjoo7nS+vDemMqy0C8rJWiyGyZ376I1Di6SvCn/5ihCi9XE53
	/7ZNOawcGZcswFnWN7nANh2MZ1/txEpC0XDoQR/2qQYCyBV6uPy6RL1umeRZyKRu
	1Owz+uJNGgdtvZobIWuT14peCZG/fLC+pAE4H0VElPnd+pi2D1DrIFSUyS8+zIsK
	24m18OLvV0PHKseuyF2w2me3KSLTySwUqgxUK1ozl5qAJsT7pRTC3zWQdBk4O+qB
	3Ickm+ZW4XAN4oiP4J0ym2lK/KFCj7Ny77KBTgu6TkbjWyITzIw4fNDbsS1RbRhz
	5+3PegJ1KK9bUWrXUCi8xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790610638; x=
	1790697038; bh=RRCoUZlKYkznsUM6Nze6o4c11DvNZ5cTeyM1vfAi1H0=; b=S
	xzfmnBXwXdgtYYcCG0HRjR3//QieBWsJBxvW7/SX2PxQBbnTGQ+6ehojpDVufMSM
	mrkHFXOVZt+YQua+eGNdDPDdwOWOITk9QxzUCgUEma7H4f9Ci4gMw0k5jx3h6HVm
	IluI0pHmFSdFuYL7ntWB4HWkW4xwSx+JUGntRzMeVSL+E55F9n4726EE1z/Xsxaq
	p8XKei3z9JMTBjgyAx0t0E9yKk6dLwJDSSraXu+AdfsFbzyT0vR7reWr+XvHFikT
	9QuXhpWal7aN6aU+ixJoH2HM2Wk+uhOUe28uopuv/3jU8h1Eiq1H/x7GT8AXMm5u
	A+g0ySwUiX4zNQ3f9eWQQ==
X-ME-Sender: <xms:zYy6auPh211jVWse0qdUBriGXW1YrctBj5raQI90jdF3-lcW3hUjsA>
    <xme:zYy6anzzY3a7rYZLzhD026CW_QrqNdrXAUub3r9LUQu03jNUrEyhOVaK9PBD8i-I8
    ghdSyFtEcfwZTxM5I6LFOCXjgBE24EqCTtPdABoHcY8Lz1934qYIp07>
X-ME-Proxy-Cause: dmFkZTE1qhTKKOlxh828bNkYq/cR2dAN6wjMak0lcYYKX9ZS06gGjdNmiS1/pi9aS1oaed
    bQCKXU+ay8vkMPg/tM2kFnXZaXoumuknZOGbQ7ZPbGjmzdgbL5tkQ6KNHuUXjjCRK1RDKu
    NDrSyPRmB7PoI6hkwSM+KgulIx6AO0g7Z+j1WJvyYjuAKMKhfoKwIZJ2ENRkKp/CQp6ltv
    +QtUl/0aCtjuBNICE4avJQD+srcvJ629O75ZJMYpdX87N/dX9siGDYF6DIb7QmqvmJGlvd
    qyYDwGwrdjz2e9WJH/zyeWICWQjRlfGMjpAn9/5ao+whOHJBRmdVCHcHxKDPCUgJ/ayBms
    m8bO4+G245jbo6fgecV8J0/zzMlhB53XA/4B/5pqV8ewHFj0jibHBZojHEe1tdGh0Nu5uv
    k239BuCdrK/N3qEKjEpCW6u7nP+o9m6J2IDdY9bbb4UcGSnl/Pyq7d1iX47zTydFlCltZo
    X/RjHXSaTeY0VECSjG1DKsCqaBdkcTAHbG3b2FogZYMZsnJ6BPvxouIAjkKc191y+yBmyz
    PDRTm3S7jhNDZAhTunl/DYOqxWOQ3A3AiX701BYkq6Ui9qAVkZDOj7ghCZVSJMWcOqPnTj
    yUwXcEjkyGXf0SQnzGC7GTRiPdcC86MphgTOceMRgr7p3QOWQxs3hXP644kw
X-ME-Proxy: <xmx:zYy6aserhBBEd5wqhNS6QIninr8z3s4bo1nhx4h3MmQnarwA3sc6Vg>
    <xmx:zoy6auqj5znM9u7xW2tZE7jRr5Ef_tz8wIEmoIEJ7v-NOZY9pykUwQ>
    <xmx:zoy6auMCpJVwsJqkSDlt7_MHtft-YtP3YrKfumWThZmF-Nio6ImUeg>
    <xmx:zoy6apgTfQy5ZrWTQjk0VKOo5guHghTEFbwF9FK8JjbmvVRCvOgxvg>
    <xmx:zoy6aqRaS-OdL_vFW6paQRSzfPnfniE7gU5upR7T3zj4VdKy76pdSIq9>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id A94C62C0006F; Mon, 28 Sep 2026 11:50:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AbE_HygUqnAs
Date: Mon, 28 Sep 2026 11:50:17 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Zain Aboobacker" <zainaboobacker33@gmail.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: ibm-acpi-devel@lists.sourceforge.net,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <cec269cc-cce9-4c3c-aaff-2a3035f2e634@app.fastmail.com>
In-Reply-To: <20260926162528.25365-1-zainaboobacker33@gmail.com>
References: <20260926162528.25365-1-zainaboobacker33@gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: fix typos in comments
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Sat, Sep 26, 2026, at 12:25 PM, Zain Aboobacker wrote:
> Fix various spelling mistakes in comments found by codespell.
>
> Assisted-by: Claude:claude-opus-5-5 codespell
> Signed-off-by: Zain Aboobacker <zainaboobacker33@gmail.com>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 1225b01ed14d..ee831e6b8fbe 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -2108,7 +2108,7 @@ static int hotkey_mask_set(u32 mask)
>  	}
> 
>  	/*
> -	 * We *must* make an inconditional call to hotkey_mask_get to
> +	 * We *must* make an unconditional call to hotkey_mask_get to
>  	 * refresh hotkey_acpi_mask and update hotkey_user_mask
>  	 *
>  	 * Take the opportunity to also log when we cannot _enable_
> @@ -3770,7 +3770,7 @@ static bool hotkey_notify_dockevent(const u32 
> hkey, bool *send_acpi_ev)
>  		return true;
> 
>  	/*
> -	 * Deliberately ignore attaching and detaching the keybord cover to avoid
> +	 * Deliberately ignore attaching and detaching the keyboard cover to avoid
>  	 * duplicates from intel-vbtn, which already emits SW_TABLET_MODE events
>  	 * to userspace.
>  	 *
> @@ -4047,7 +4047,7 @@ static void hotkey_resume(void)
>  	hotkey_wakeup_hotunplug_complete_notify_change();
>  	hotkey_poll_setup_safe(false);
> 
> -	/* restore previous mode of adapive keyboard of X1 Carbon */
> +	/* restore previous mode of adaptive keyboard of X1 Carbon */
>  	if (tp_features.has_adaptive_kbd) {
>  		if (!acpi_evalf(hkey_handle, NULL, "STRW", "vd",
>  					adaptive_keyboard_prev_mode)) {
> @@ -7131,7 +7131,7 @@ static bool software_mute_active;
>  static int software_mute_orig_mode;
> 
>  /*
> - * Used to syncronize writers to TP_EC_AUDIO and
> + * Used to synchronize writers to TP_EC_AUDIO and
>   * TP_NVRAM_ADDR_MIXER, as we need to do read-modify-write
>   */
>  static struct mutex volume_mutex;
> @@ -7324,7 +7324,7 @@ static int volume_set_software_mute(bool startup)
> 
>  	/*
>  	 * In software mute mode, the standard codec controls take
> -	 * precendence, so we unmute the ThinkPad HW switch at
> +	 * precedence, so we unmute the ThinkPad HW switch at
>  	 * startup.  Just on case there are SAUM-capable ThinkPads
>  	 * with level controls, set max HW volume as well.
>  	 */
> @@ -8043,7 +8043,7 @@ TPACPI_HANDLE(fanw, ec, "FANW",	/* E531 */
>  	   );			/* all others */
> 
>  /*
> - * Unitialized HFSP quirk: ACPI DSDT and EC fail to initialize the
> + * Uninitialized HFSP quirk: ACPI DSDT and EC fail to initialize the
>   * HFSP register at boot, so it contains 0x07 but the Thinkpad could
>   * be in auto mode (0x80).
>   *
> @@ -10623,7 +10623,7 @@ static int dytc_profile_set(struct device *dev,
>  			 * To get back to balanced mode we need to issue a reset command.
>  			 * Note we still need to disable CQL mode before hand and re-enable
>  			 * it afterwards, otherwise dytc_lapmode gets reset to 0 and stays
> -			 * stuck at 0 for aprox. 30 minutes.
> +			 * stuck at 0 for approx. 30 minutes.
>  			 */
>  			err = dytc_cql_command(DYTC_CMD_RESET, &output);
>  			if (err)
> @@ -11685,7 +11685,7 @@ static bool tpacpi_driver_event(const unsigned 
> int hkey_event)
>  static struct proc_dir_entry *proc_dir;
> 
>  /*
> - * Module and infrastructure proble, init and exit handling
> + * Module and infrastructure probe, init and exit handling
>   */
> 
>  static bool force_load;
> -- 
> 2.53.0

All looks good.
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
