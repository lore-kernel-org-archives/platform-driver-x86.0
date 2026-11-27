Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748506;
	b=k58FNZTdHkcQRJtjDbJ3QRpk9V2BAN24avhUhlHUk9g8zVreLJbJhpAeIzecVSdBSF+g
	 HONnopDmmQXrtjP1Nt9fRJJLWEHiNEOT9jHkWihkYsqK/DVKJ2EjAwpbTiCbgdT8XNRYS
	 nLOZq/r43+SD5gIt+3/FLoXd62v/9atKrxVUrMIvYiSC7gDQsB2wKWFRTfDFsPXGOr3pO
	 USKkrbzbxdzRKgzhMOzloV8B14c70A77HLUyEbqptL2QWAVtQPrb9aAGBmTfNAHv8qvbN
	 A+XAO69yCz8znMVch7pIAjYq+mspXF8ztg7gNikLhPm9P2LWZfDVFH7irQBfntYAnAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748506;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=+6hXsenVNkxYMOO2yexaCePoBYw9IckFtpqFYJKqNdE=;
	b=f1ORQ7vgq01GgkKS1ZacnDioOwD+r4hiV3m0LC8Dd+PXAS1PJo+RMIoG3wRQLkob84Pv
	 SwJEF5UZTaqqQTOzJlLD9eOJ5t+C181dq+HfB50oT7rYkknIih8MReYBIQzM5BaM83TAl
	 gloTOcFGPucGiAiNs9l26evjRXCPL3qeTjG540lBZiFJJpq6jBkOWPZHzme12qr37RRNB
	 7qBXNXy4+GcNrDMO2MKpD2Cv2DBE4Pb3RC8sqLyL9LqqQ2/10ndG9CulqbDhKGOd+p8Sa
	 u6REWKo7y5EaQmiWMlCZHPIAk66c9JvChz51vIPYVx/9xmYn+cxfqF1GmIdwoLIkMqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=fqlIlK+5;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=lGLZHtAi;
	arc=none smtp.remote-ip=202.12.124.152
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232F2606A31C
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 03:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 232F2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=fqlIlK+5;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=lGLZHtAi
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B50BE7A0535
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 22:01:45 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Thu, 26 Nov 2026 22:01:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795748505;
	 x=1795834905; bh=+6hXsenVNkxYMOO2yexaCePoBYw9IckFtpqFYJKqNdE=; b=
	fqlIlK+5E9Ut45AeVP7yU7VhPfIpWlZMaxlKwv9dKqS0Hu3UNlyj4lj6VUJRE/Tm
	qj44PuFWMmEFRAHpOlEmRHXvwIrihta6cqmzCCorKB6MCIH21pyrrntu3KHlINUV
	B8OhLCsLlIuE4LCE+RNVep2tee3CTMQkXYFFWeBnUMIwPCqJUleMSKWAjH4hjuzu
	/MqbmzWsIA67bOYBDTSs+7jwvB5PawUH0RGPpJ4Jt/T5505/y3QFQXQxD3p1JTVW
	eXtmSPVkMhfMZPZK6k8mO7bJE58arEl5HL1t+Hz75srC9djvpl11siTqmA+BnmAa
	ya4U2846tyckALdr37tEYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795748505; x=
	1795834905; bh=+6hXsenVNkxYMOO2yexaCePoBYw9IckFtpqFYJKqNdE=; b=l
	GLZHtAiVDLInug0qCRoUgEKpfTvi1S+YHJ0vgu9QGRDhPaDinQyTnQkQwThYTx9f
	VQzTAwcIelgPKx5o1gnaSxjqXd1O7+OOWOf7vxFb+hzYgWqmd/jBEH1h/Qsk/wsd
	xnnBWpjgq2tdaVHMPL69AgJzXl0yTxeMVxCGNmxbL+MO4O7tfHo3xvl/p6hNEAmo
	3jEIDSh2Bs7j0S7kYTKA5jSRijemjm2e7iwKBz2aHfskV01jxZ/rFldGqQJ/ogH/
	LU7abWYbOr4eIBLeCo0hHTIam9CVA94fNsV1+WisFZopaf/snHziTui3ZueqyLvq
	kcZmoPVJSmup29lChpWOA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795748505; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:LCYWqXY7shCcrpPi/I+BUwi81yl66MBI96okzwIdqfpiQN+
	H4w5VgS0IpaY3Gm24mMJ8tJ1CRt+gPL9ByaAvXoZT45acyLjXOd8KXDN8YZEjPwN
	eRrTPOE1Txknl7eItdseaPKjZ8k/joiMV/XwjhUq4upDgoP2NueEjqBRH0vCzgDU
	Kix2K/YxdicjP7WV60JYtmirqImgFyRXb9Hz2uyk4Y1nw9+j6/lx3wDtcRNFgwE3
	t5U3Bf950Ao9bWxmxCoIS7n/jsYu0Ui/drjT413QMD3Mcswsomjjd1sPP4ATzgL+
	f1k9Ue5cEyMxjnPf5oDW6DRn3usPL1bd813FibA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:NLl//hFdUHl+cFNPoP1dqpNv0mgKleFQoqTmOqH+ZW4=:vHj+tkkvtny+PZdJbszsuNPhYoPa+e8Kb6T6hTuwtlc=;
X-ME-Sender: <xms:mfIIa9HP0nKqTw4HJ_Pq09orbR4e9ntfsqkD0sZBAzHHOhu6YYpvvA>
    <xme:mfIIa9IVs_iOfZgCXNOXPYF94XsFdjMEi1ugNbeOWrgH06gClNoTRXoGWI0kb9ME2
    RylD3SbHcaZqckZBTgRFk7T6MSGy05qYNIq9aJCbv8zZt107v7_Sq0Q5Q>
X-ME-Proxy-Cause: dmFkZTELTN6qw6N38x7pgd/7WeE5TtjYDJkspwKAdCxfcfG2sgFH63EqQcluBk4AT/nmm7
    shlQLe5kyjW1p3sXnXk5goA1/j3WZzIkrZmfShSLlj944whBe6hRPE7K+/Krb9qm2rkaL2
    e5S8KMR+WbE+ZNDVDchrySllnmlwwffxm7AmoM1+FbFAW3qNi9ZH1V54PRINm55cdTQpNt
    5aPYg+wWgxXA1O7qYelUHkWX9KbVr8ITVt1sbQIcojB/5Qi1HAdZ5rx7Ng8jB6QPHlowNE
    sGmugeAsCIBVvxWn1DzrvYnlM5YqSQlY4mqVjzDC86eSGKZtdlCCHzWILwdPY1jdhYSqWt
    ykxks5hehzdZ6nT2UsfxMr9Ti26jk/wR0GyVbfehuwuKde+74zPCIunaoTp50+xA21ZRBn
    tDAk4VBArd/NByffJD10ju1NKdZye7Jn/tbxALIi32n3pvhGaTi1sp4mawsC8jsUH5uYpc
    Ykzd9e4oKUsoRl8Dr0zR9gTcQ2wVyqBIJHFFzOWe0CxPleTSuVCa6wz3gisGwIr0Q+G0tG
    92vYiSIqFM/P4On6q6vbYxi90ARU1x0wnpF6RvwEJ0IpK1BB+++X0h4BK5icghFKDTiJq4
    gz73Jvp4kVmBwuJ+ujUkDu0wUsM1fwIvqq1jT00PX0ZzaksSNvIyssrm30DQ
X-ME-Proxy: <xmx:mfIIaxR_oDtcD3pQTBU-8TO0DrrI8ovDARpBz525aYL2ufrUvUCljg>
    <xmx:mfIIawyL9OxkxUuQ_zuDG--REdh0Ni63pTP_PoNWsFJ1dncU1X007g>
    <xmx:mfIIaxpl3MME2jE564Fj8ZjRUkNwUDpxY3QWy4A18ZIgBXQbJ9AVog>
    <xmx:mfIIa714FurJhAGTAYe1BcwTIp765ewdzZEONG5Ls5_8ZO1TBZPzlQ>
    <xmx:mfIIa_Ib9Qh7XAwabl4JHRSILt0KF4lL5qshIGhK1Yd2wMTbFKwQJVzx>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 199F02C00085; Thu, 26 Nov 2026 22:01:45 -0500 (EST)
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
X-ThreadId: A7_KXksUTwD-
Date: Thu, 26 Nov 2026 22:01:24 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>, "Rong Zhang" <i@rong.moe>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Message-Id: <2c7da819-fb12-4504-8e15-42aa830db18f@app.fastmail.com>
In-Reply-To: <20261125-thinkpad-acpi-hotkey-poll-v1-5-6dee57519c2e@gmail.com>
References: <20261125-thinkpad-acpi-hotkey-poll-v1-0-6dee57519c2e@gmail.com>
 <20261125-thinkpad-acpi-hotkey-poll-v1-5-6dee57519c2e@gmail.com>
Subject: Re: [PATCH 5/8] platform/x86: thinkpad_acpi: use scoped_guard() for hotkey
 config locking
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Wed, Nov 25, 2026, at 6:11 PM, Dmitry Torokhov wrote:
> Replace the HOTKEY_CONFIG_CRITICAL_START and HOTKEY_CONFIG_CRITICAL_END
> macros and manual hotkey_thread_data_mutex lock/unlock calls with
> scoped_guard(mutex, &hotkey_thread_data_mutex).
>
> Keep the hotkey_driver_mask assignment inside the guard in
> tpacpi_hotkey_driver_mask_set() when polling is enabled so updates to
> hotkey_driver_mask, hotkey_source_mask, and hotkey_config_change remain
> atomic with respect to hotkey_kthread().
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 74 ++++++++++++-----------------
>  1 file changed, 31 insertions(+), 43 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 7a82a9014a3e..58500b72d9d2 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -1819,8 +1819,6 @@ static struct task_struct *tpacpi_hotkey_task;
>   *
>   * Increment hotkey_config_change when changing them if you
>   * want the kthread to forget old state.
> - *
> - * See HOTKEY_CONFIG_CRITICAL_START/HOTKEY_CONFIG_CRITICAL_END
>   */
>  static struct mutex hotkey_thread_data_mutex;
>  static unsigned int hotkey_config_change;
> @@ -1828,29 +1826,14 @@ static unsigned int hotkey_config_change;
>  /*
>   * hotkey poller control variables
>   *
> - * Must be atomic or readers will also need to acquire mutex
> - *
> - * HOTKEY_CONFIG_CRITICAL_START/HOTKEY_CONFIG_CRITICAL_END
> - * should be used only when the changes need to be taken as
> - * a block, OR when one needs to force the kthread to forget
> - * old state.
> + * Must be atomic or readers will also need to acquire mutex.
>   */
>  static u32 hotkey_source_mask;		/* bit mask 0=ACPI,1=NVRAM */
>  static unsigned int hotkey_poll_freq = 10; /* Hz */
> 
> -#define HOTKEY_CONFIG_CRITICAL_START \
> -	do { \
> -		mutex_lock(&hotkey_thread_data_mutex); \
> -		hotkey_config_change++; \
> -	} while (0);
> -#define HOTKEY_CONFIG_CRITICAL_END \
> -	mutex_unlock(&hotkey_thread_data_mutex);
> -
>  #else /* CONFIG_THINKPAD_ACPI_HOTKEY_POLL */
> 
>  #define hotkey_source_mask 0U
> -#define HOTKEY_CONFIG_CRITICAL_START
> -#define HOTKEY_CONFIG_CRITICAL_END
> 
>  #endif /* CONFIG_THINKPAD_ACPI_HOTKEY_POLL */
> 
> @@ -2159,12 +2142,15 @@ static int tpacpi_hotkey_driver_mask_set(const u32 mask)
> 
>  	guard(mutex)(&hotkey_mutex);
> 
> -	HOTKEY_CONFIG_CRITICAL_START
> -	hotkey_driver_mask = mask;
>  #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
> -	hotkey_source_mask |= (mask & ~hotkey_all_mask);
> +	scoped_guard(mutex, &hotkey_thread_data_mutex) {
> +		hotkey_driver_mask = mask;
> +		hotkey_source_mask |= (mask & ~hotkey_all_mask);
> +		hotkey_config_change++;
> +	}
> +#else
> +	hotkey_driver_mask = mask;
>  #endif
> -	HOTKEY_CONFIG_CRITICAL_END
> 
>  	rc = hotkey_mask_set((hotkey_acpi_mask | hotkey_driver_mask) &
>  							~hotkey_source_mask);
> @@ -2460,13 +2446,13 @@ static int hotkey_kthread(void *data)
>  	t = 0;
> 
>  	/* Initial state for compares */
> -	mutex_lock(&hotkey_thread_data_mutex);
> -	change_detector = hotkey_config_change;
> -	poll_mask = hotkey_source_mask;
> -	event_mask = hotkey_source_mask &
> -			(hotkey_driver_mask | hotkey_user_mask);
> -	poll_freq = hotkey_poll_freq;
> -	mutex_unlock(&hotkey_thread_data_mutex);
> +	scoped_guard(mutex, &hotkey_thread_data_mutex) {
> +		change_detector = hotkey_config_change;
> +		poll_mask = hotkey_source_mask;
> +		event_mask = hotkey_source_mask &
> +				(hotkey_driver_mask | hotkey_user_mask);
> +		poll_freq = hotkey_poll_freq;
> +	}
>  	hotkey_read_nvram(&s[so], poll_mask);
> 
>  	while (!kthread_should_stop()) {
> @@ -2483,18 +2469,19 @@ static int hotkey_kthread(void *data)
>  		if (t > 0 && !was_frozen)
>  			continue;
> 
> -		mutex_lock(&hotkey_thread_data_mutex);
> -		if (was_frozen || hotkey_config_change != change_detector) {
> -			/* forget old state on thaw or config change */
> -			si = so;
> -			t = 0;
> -			change_detector = hotkey_config_change;
> +		scoped_guard(mutex, &hotkey_thread_data_mutex) {
> +			if (was_frozen ||
> +			    hotkey_config_change != change_detector) {
> +				/* forget old state on thaw or config change */
> +				si = so;
> +				t = 0;
> +				change_detector = hotkey_config_change;
> +			}
> +			poll_mask = hotkey_source_mask;
> +			event_mask = hotkey_source_mask &
> +					(hotkey_driver_mask | hotkey_user_mask);
> +			poll_freq = hotkey_poll_freq;
>  		}
> -		poll_mask = hotkey_source_mask;
> -		event_mask = hotkey_source_mask &
> -				(hotkey_driver_mask | hotkey_user_mask);
> -		poll_freq = hotkey_poll_freq;
> -		mutex_unlock(&hotkey_thread_data_mutex);
> 
>  		if (likely(poll_mask)) {
>  			hotkey_read_nvram(&s[si], poll_mask);
> @@ -2739,9 +2726,10 @@ static ssize_t hotkey_source_mask_store(struct 
> device *dev,
>  	if (rc)
>  		return rc;
> 
> -	HOTKEY_CONFIG_CRITICAL_START
> -	hotkey_source_mask = t;
> -	HOTKEY_CONFIG_CRITICAL_END
> +	scoped_guard(mutex, &hotkey_thread_data_mutex) {
> +		hotkey_source_mask = t;
> +		hotkey_config_change++;
> +	}
> 
>  	rc = hotkey_mask_set((hotkey_user_mask | hotkey_driver_mask) &
>  			~hotkey_source_mask);
>
> -- 
> 2.56.1.839.g22a8290db9-goog

Looks good to me.
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
