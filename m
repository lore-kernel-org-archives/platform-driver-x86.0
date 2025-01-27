Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB9E748D;
	Mon, 27 Jan 2025 21:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738012841; cv=none; b=qCAbKZb/wFPvUmE8AtAE1442EM7PNeT4LdWFpiuodLdCQs+v4VGk0ujSXbzq8Qg7uo9H0rudQ2aFOxFSZP7tzpjVzYdLwUaRFi04QHInPP9kYsSz3/K9S0FfXz/cAFhalddMz6EGoYSUpmC5elEJWeszhi9nOZMmSavqjx3W8eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738012841; c=relaxed/simple;
	bh=qhOGeORJqw57DV6Hd89R9sct/6nKTTAJgyseGWh3WyI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Fk0rB8xyYnAl4nLpJgSwlMDr1icZtzuVxBJ++Rphl/n6FQvuTxinW16YEs/YQoxZh8VeCaERwK5KpMOQjtVRS63o0B3yvOpPRssewgks9MsJA5qa+/Jp0kvpFhgphpTujGsF9/KWcsWXzdbWBYjn8wxrCyPo8vYRVYSF8HcU62I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ia4b7Swf; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ia4b7Swf"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4aff04f17c7so3775183137.0;
        Mon, 27 Jan 2025 13:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738012838; x=1738617638; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlHISqOUW58QFDTgW9wyzvh/oL0ZP0cPfQRiCdJD/LA=;
        b=Ia4b7SwfD0/yyt5SxcTWX0boyQ3BcMhox2BOCAxqMZmzfSg5CEukF5Wpg9OBCggUNs
         6o2R6Q7QwR6WsUniYMv1BE9ys3m85t/QpUx6I4JII+mke3I34Knsl3RNwZLrKfbNgNC7
         Indp/rUJoHKEEn8ci0T90nAFJUSxKeD7tPUpMrZHZI50bFjjoA/8ZZoq8n+qm77JqTye
         p+0qxU6xMRl2AZ99lGmxfSqcO9UNc2OsoNy9YfHf/jSqyipPThHDJsIIQNfhhLviUB/t
         JACUu5+pulN1q2pZ54AJyBT8FH/Zj2Te11ELj8fRQS6WoMH8bSjLkOTHBGPKbbcBwGWs
         NFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738012838; x=1738617638;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HlHISqOUW58QFDTgW9wyzvh/oL0ZP0cPfQRiCdJD/LA=;
        b=bDqH6UKMm7l0gD+Z1a07mEiErByTyiurONUkjRj+ZgXilXM0BtFW1juwL296uPDPfC
         QGwy9JmcdhyfDoa5Qbc2wSySw0umQDW2ZjyvbceoVRyjI/kIZucm7xSlumchx+ofrFHg
         Q5akMQlTP08SphMUXbH6qMzFKb/Ief/v8oRZLjkPo9+ijKKxSXONr9JLeT5KaXCKWU18
         tlDE44Mr2B2dgZw/CfupIBHd8kkeY7NjtIGrTT+vwwiNnyW0LgDnmxd9zAe1QoQ6XCQ4
         xo+uMn8YGIVkmyoXTnG5str4RAm+N7Ft0gaa6/aiKZM2GKIP2pM1d36hsXRYD4eZEskc
         /HCg==
X-Forwarded-Encrypted: i=1; AJvYcCUmkQexsQOnxw3LlQOu40fdjfDoEg38OpmV0Zubv6vuPjPaDuq7ebheqAW6hQKMDoyc1uhjZbmS60Efmj3sbJJTLCBErw==@vger.kernel.org, AJvYcCUqciyYEQHNlkTC8Jnjw7sRXbU/TgrGPoXOvKr/hudi6tDJcd45+7XSaDFwJy40p7l35o5R7KrVHfQ2ubI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuBMbVdOiBTlmNGZ4FkyaHo8pO2ZXeYdXNTZny0ftNmSurFu3h
	Uj2o5Pi5xagJJ+OmhiMUPvtQoFSoairxUJIVLv5ZedyiB3vhmreNlYevYg==
X-Gm-Gg: ASbGncs6SuJvVAtVfr6KpJ+1tqEMZTr72oSvdMkvnC+nnHMcewJaBUXNAnVy6O4Ix4Q
	OatKqsssNGAgI6BfMpHRYzvhbpf1I9CQXwOWCBBOKTQjPzI432uBkg8JRvXjK4gP7peDqn6TFCH
	8ZSVJ8IkyNQI5LtNx2p0u6kQPma0cpHGH8bk05oUlmYnhVkncNAiDs5SjMATzmZsEEeujlYOn5U
	7sUphgvZyyhAduTDFUO1BKBRg+E6kaCnLTd3g//zU94jgRbvKOUkBaqhxCgKmSvy3wz1pqn7qw=
X-Google-Smtp-Source: AGHT+IFJ9dFYO/oE8XFAtikztduZle+glUkc9OhqDQzXjrlQ68XufnCEEC7ITGhFVtz4SnESWFYpuw==
X-Received: by 2002:a67:ec8a:0:b0:4b2:bcae:a721 with SMTP id ada2fe7eead31-4b752da331amr1130607137.11.1738012838383;
        Mon, 27 Jan 2025 13:20:38 -0800 (PST)
Received: from localhost ([2800:bf0:179:113e:f067:4e25:4298:6451])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-864a9ada27fsm2087803241.6.2025.01.27.13.20.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 13:20:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jan 2025 16:20:34 -0500
Message-Id: <D7D64PVB9HKZ.2UZWO7Z4FWSPV@gmail.com>
Cc: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Mark
 Pearson" <mpearson-lenovo@squebb.ca>, "Mario Limonciello"
 <mario.limonciello@amd.com>, <platform-driver-x86@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: pass a correct pointer to
 the driver data
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Fedor Pchelkin" <pchelkin@ispras.ru>, "Ike Panhc"
 <ike.pan@canonical.com>, "Hans de Goede" <hdegoede@redhat.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250127210202.568691-1-pchelkin@ispras.ru>
In-Reply-To: <20250127210202.568691-1-pchelkin@ispras.ru>

On Mon Jan 27, 2025 at 4:02 PM -05, Fedor Pchelkin wrote:
> devm_platform_profile_register() expects a pointer to the private driver
> data but instead an address of the pointer variable is passed due to a
> typo. This leads to the crashes later:
>
> BUG: unable to handle page fault for address: 00000000fe0d0044
> PGD 0 P4D 0
> Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
> CPU: 6 UID: 0 PID: 1284 Comm: tuned Tainted: G        W          6.13.0+ =
#7
> Tainted: [W]=3DWARN
> Hardware name: LENOVO 21D0/LNVNB161216, BIOS J6CN45WW 03/17/2023
> RIP: 0010:__mutex_lock.constprop.0+0x6bf/0x7f0
> Call Trace:
>  <TASK>
>  dytc_profile_set+0x4a/0x140 [ideapad_laptop]
>  _store_and_notify+0x13/0x40 [platform_profile]
>  class_for_each_device+0x145/0x180
>  platform_profile_store+0xc0/0x130 [platform_profile]
>  kernfs_fop_write_iter+0x13e/0x1f0
>  vfs_write+0x290/0x450
>  ksys_write+0x6c/0xe0
>  do_syscall_64+0x82/0x160
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>
> Found by Linux Verification Center (linuxtesting.org).
>
> Fixes: 249c576f0f9d ("ACPI: platform_profile: Let drivers set drvdata to =
the class device")
> Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>

This is my bad. Thanks!

Reviewed-by: Kurt Borja <kuurtb@gmail.com>

> ---
>  drivers/platform/x86/ideapad-laptop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86=
/ideapad-laptop.c
> index dfb5d4b8c046..30bd366d7b58 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -1121,7 +1121,7 @@ static int ideapad_dytc_profile_init(struct ideapad=
_private *priv)
> =20
>  	/* Create platform_profile structure and register */
>  	priv->dytc->ppdev =3D devm_platform_profile_register(&priv->platform_de=
vice->dev,
> -							   "ideapad-laptop", &priv->dytc,
> +							   "ideapad-laptop", priv->dytc,
>  							   &dytc_profile_ops);
>  	if (IS_ERR(priv->dytc->ppdev)) {
>  		err =3D PTR_ERR(priv->dytc->ppdev);

