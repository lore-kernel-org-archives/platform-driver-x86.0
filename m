Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795451971;
	b=3smS1yV5HY0g8GJPLNdyIla3VaFK8l++kQarAB+UAVeK2KeDe03bs3tOMF4uJYcExpvt
	 5M9+vqw0JhJzTTqd6Pad/39bMGnmd91K+0WkUbtH+IMOWMEKz8mH9HTPX/ataLoBQJMbH
	 v7YCAlFp47I0CvdPQ86ubN1PQ0bTHtxoRKGY1qfrBcA0fQW0R2Lj7BJgA3A6VZM50mVOj
	 4ieKkqugcgq3D11K7io8X0BbrYcM6QrvIcmD7gQkHO2BnJ1CS2UfFQwWtCWoDnZU8LCN0
	 frVOEIZDXivA9hH5AP+ndSYBM8O438O4Jklw5wsDNTNpm4pWIyGtDnuz9tx0wfgxyJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451971;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=E44P/FLn1RFKAm7WQnh3lFMXkonrjMwjCVkN8eMXiQw=;
	b=xQAAlvgicAsz7GYpFX7u8kCnQVIonkdkquoRJI8F+mx9ph4vsTOpH/K5Na36j3dXw9lw
	 uk2efoUI+Sh8TEUiZq8Is9yhU/mfbklmsiWNpCtjV0fiEY4ZoA72hMPJPyENxCs3febLT
	 tgGqTEgbFQjQJXqY52uoi8Vlg2gGUiDIqY8KsBZGt2xi53wTZMLmTwpLBokE892n0n5Th
	 euR9P97wzCtztIYWIUC6Be8xqfx8hOQW8tw8FKtqqwiqkRyGKG2yUYJH9KIT4REzgxP+L
	 z/1JbgKPpJ1PAPKb5zDZyNE2JYTJKcN7JuS9lfqkhL8yFRZ9v8XotvtS8lRguYnrz9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=mrM7HLS4;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=uLUU217U;
	arc=none smtp.remote-ip=202.12.124.157
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42139606A31A
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 16:39:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42139606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=mrM7HLS4;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=uLUU217U
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6DE447A0611
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 11:39:29 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Mon, 23 Nov 2026 11:39:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795451969;
	 x=1795538369; bh=E44P/FLn1RFKAm7WQnh3lFMXkonrjMwjCVkN8eMXiQw=; b=
	mrM7HLS4FC7ofIt8qmWttrdRpQvu+FOE1w3G594C1k5DWAcx523lvCUVpGPE+u9Q
	ZFO1WtcaBvOiqYG8y0+3QTjFeP3r/AGoGNgAfh9t7dCxaiSAwPTjL/ht7HvnuTX7
	4VhpDQvpia+va2a4BRjKQO/TKWpz4l+EeiTqZIJz/KeDkVbdc5BvdGTi+pezZhak
	3fZTESZmwJ/rwHUWPFQWacOoNCGg7H1dSH4MxBnBHTujA1+DKpilYUKpVxk1FzGT
	QwIKV5m26Y5Se9V7SwlO1Yubvv9TD3kRjkFe/vknzv5B+JE1FgjE+nuWBZvthdPE
	mLOkYEMWB22/ebp2Nv6i/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795451969; x=
	1795538369; bh=E44P/FLn1RFKAm7WQnh3lFMXkonrjMwjCVkN8eMXiQw=; b=u
	LUU217UTZlqclQ9GV+fm+R+zL98kvKQ56XGWLo2gRSX7hG1p/WXEYlSe02MWIe4U
	xY/vYDsA9NYm6+I9qdTK3wtJp0oYmHaZ7vkX5OO7tvt7u2kMqQ2if0HoQ55FSyYj
	Mdy5gp+TmoB6jDYrOCYkQHMQE5CqNdBb1G22JYO26rcJuSfaqyBImef1jKn7/71K
	AjJoXWB7rGQ7yimhu7eLTVu9N34jD6dD+0Y/in80zVSBMEDQqe6taRoTc1MCSqtl
	5Gshhr7Lzv11wwNJzKuVq4hQmilmEfQRtON0R9wPxBy/T2iXES8cXkqsaS6OT1hR
	PiGcz+NE5feRxHknHPhRg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795451969; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:ebguKj5n/VjA8ni5NVaxyHU/kmhY8S7DrrvhW6FnyjAigc+
	w0GXuPRr0CIQbS/D1GbqCZOB3WAA8whEI22TiQv83/ZAYGYMhB2y2fpZeyaG2H9q
	KT/W5uMSP3H+G4DjR+/L2VZfIsIwlzfXpHvesLAoZEg3Eo33Ug4tPFjccg+4m8XC
	psEgcOFJF3SzC0rZLYGnWqcABWuyZ38+h/8+29ojBILpvnVtpDQrIPB7dgdG4cM9
	SpohpfUEy47SQG7WoTwjvD/jy/vxo02msQy7eU0qFhWv0iDFNtbAee5sFMFFXh/4
	MPmvGWQU+BzW9/j8KR19WdG722mQW4lKJxKrfvA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:OQxFFO5gGP8cVJnetAWkM9U0ln+A5eyFj69YGsRsH3M=:V9H0yqnDvoFlOlDkD06vyvvZm7ktslNEGxukQIcqbP8=;
X-ME-Sender: <xms:P2wEa5m9IJcGZ1jG6l4D5jAxkKR64trEyIVgXVQibLuX7cvb2cb5yg>
    <xme:P2wEa_oD4xWHkVQ9RmI2wme-Kowj-05c0XvAYn-eohhI1Yuo-9b-zIH0KvUgmV_N5
    4FxJBZijrvEF3pZtfO84py95xzHFZwlaofeOAlzaxSJL0GWug-fzueu>
X-ME-Proxy-Cause: dmFkZTF2L/Oh6nRVJfmVXhVDxF0sXCGIh8bj8x8qi3ZHiwvLXfUXOK+vJvC7nqxamMqqfb
    voSes5xdq17FmMns4Hho4HKvII9+uMg9s6VT9m+dFEfQhzu5xcvBZxzb2K2bbj2xszprHG
    nXee0fhbXGMcziMceFZjL7x2GEU0zfxODNqvsS2rUwrRv7H+HQi9PnVPyEf9uky96ErU3E
    Mgdcd3e0sGzGrFKK0jCVG/7dBGGS58dXVIF4bANBaeWNtqAomaoQfgluYDYa6lUwFaA4eG
    2JMtSCZ27ISW7MlRB59RCx/GiM5FJ6qJhC9VIoTSQb3Or+r7GYfDYmq+a5RnbEsDh5L0LH
    7VsOSOQUy2gtfbXc67Xhmq7KQB1MQdURzCv0EKpp5lrj9iqp2xo6weS20bdly7qLTdtHco
    sCam548CerwB8KLrMITL90jCnLjlUSpVr3S7b8gpMvn83/aw4EHsBRAawyeA5R+xTXjyRG
    vrTK6F+8b5DfDx6Tq7KAhLNd4ZWkDUf9Bt3qMX5aSpYQXn7LQEzMu+FPXp374/YmkRNpo3
    iurcqt/yvuw7bdcOzHuoRdMQVsUQoNtRLCEQbK6GJEqxhn0pEaG0xqxpvNcR2rT4l2t2Q8
    URdPthrwDSUTt9zmKHYjBCPvx5xRdUOfcDsrolnUN1Rnkesg/HV1OjvGivxA
X-ME-Proxy: <xmx:QGwEa6K5IkHcv3RwT0MBuRI7BQJXIOtEzXy0qAw2hnjtBOUElmYABQ>
    <xmx:QGwEaxORURoL_cMOZ_2cG8QwcxV8EKLtH4X2wRIdzph_koYr4zMqjA>
    <xmx:QGwEaw6VIkhU_k2ILvpUGKPVAfqnkio2o5mzbFrFWU-lfhhIMMLBFg>
    <xmx:QGwEa74odcrRUKJsj8dBHoenxlUYfgkMa9U_LxK1jauOYzZjIo4xng>
    <xmx:QWwEa2SKtTGkWTbM-o0SKf-3f7d1ifEhvf0cbhWmUG-6PsTJBrpzfcRQ>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id E02732C00085; Mon, 23 Nov 2026 11:39:27 -0500 (EST)
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
X-ThreadId: AX7cSlv_YVGw
Date: Mon, 23 Nov 2026 11:39:07 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Luo Qiu" <luoqiu@kylinsec.com.cn>, "Ike Panhc" <ikepanhc@gmail.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>, "Rong Zhang" <i@rong.moe>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Message-Id: <a634e184-67f7-4aa0-b50e-c09a1f03a144@app.fastmail.com>
In-Reply-To: <E3DE35B39E153ADC+20261122133456.48054-1-luoqiu@kylinsec.com.cn>
References: <E3DE35B39E153ADC+20261122133456.48054-1-luoqiu@kylinsec.com.cn>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Fix DYTC profile use-after-free
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Nov 22, 2026, at 8:34 AM, Luo Qiu wrote:
> ideapad_dytc_profile_exit() is called from both ideapad_acpi_remove()
> and the probe failure path. It destroys priv->dytc->mutex and frees
> priv->dytc, but the platform profile device is registered with
> devm_platform_profile_register().
>
> Devres cleanup runs after the driver remove callback, so the profile
> device remains registered after its drvdata has been freed. A concurrent
> read of its profile sysfs attribute then calls into the driver with the
> stale pointer:
>
>   BUG: KASAN: slab-use-after-free in dytc_profile_get+0xb1/0xe0 [ideapad_laptop]
>
>   Call Trace:
>     dytc_profile_get+0xb1/0xe0 [ideapad_laptop]
>     profile_show+0xe4/0x1d0
>     dev_attr_show+0x4a/0x90
>     sysfs_kf_seq_show+0x29e/0x4a0
>
>   Allocated by task 411:
>     ideapad_acpi_add+0xd1f/0x2420 [ideapad_laptop]
>
>   Freed by task 7150:
>     kfree+0x1c7/0x500
>     ideapad_acpi_remove+0x148/0x3d0 [ideapad_laptop]
>     device_release_driver_internal+0x35c/0x560
>     unbind_store+0xde/0x100
>
> Subsequent reads through the stale drvdata also observe corrupted
> values. They trigger WARN_ON(val >= PLATFORM_PROFILE_LAST) in
> get_class_profile() and fail with -EINVAL.
>
> Register the platform profile explicitly and remove it in
> ideapad_dytc_profile_exit() before destroying the mutex and freeing
> dytc. This keeps the profile device and its drvdata alive for the same
> interval on both removal and probe failure.
>
> Fixes: 0d882fae334b ("platform/x86: ideapad-laptop: Use 
> devm_platform_profile_register()")
> Signed-off-by: Luo Qiu <luoqiu@kylinsec.com.cn>
> ---
>  drivers/platform/x86/lenovo/ideapad-laptop.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c 
> b/drivers/platform/x86/lenovo/ideapad-laptop.c
> index 91a8d11c79c5..2cbd0b87defc 100644
> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> @@ -1185,9 +1185,9 @@ static int ideapad_dytc_profile_init(struct 
> ideapad_private *priv)
>  	priv->dytc->priv = priv;
> 
>  	/* Create platform_profile structure and register */
> -	priv->dytc->ppdev = 
> devm_platform_profile_register(&priv->platform_device->dev,
> -							   "ideapad-laptop", priv->dytc,
> -							   &dytc_profile_ops);
> +	priv->dytc->ppdev = 
> platform_profile_register(&priv->platform_device->dev,
> +						      "ideapad-laptop", priv->dytc,
> +						      &dytc_profile_ops);
>  	if (IS_ERR(priv->dytc->ppdev)) {
>  		err = PTR_ERR(priv->dytc->ppdev);
>  		goto pp_reg_failed;
> @@ -1211,6 +1211,7 @@ static void ideapad_dytc_profile_exit(struct 
> ideapad_private *priv)
>  	if (!priv->dytc)
>  		return;
> 
> +	platform_profile_remove(priv->dytc->ppdev);
>  	mutex_destroy(&priv->dytc->mutex);
>  	kfree(priv->dytc);
> 
Seems a shame, but agreed on the issue and that the commit needing reversing. Any other fix seems messier.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark

