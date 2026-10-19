Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792448200;
	b=1nmNpd2P0N/mQ4Q9ydbFAzYly3NNA4qrnzAE8VD4zv/e04bjhZpxLYRKpPq/qWHNGYGR
	 8qx+pffHiyFcq8i9CygljpnG+G4pNF9bG9a9FAG54jCFc72WokIC/tpMtNQkdprl+OO0C
	 xF8qJBMvhN5EcFkJ6zus0RAm6ZkxT2tOboSogcto+eNj1uNJ0j/U7ND8faqGgUQVkc6bK
	 OUNrs/Kvj9TaN3wJVB256UkZEHuxi44Yf16lOcp88BtcYbABetDaSiA/B059EnoOgpWM/
	 NtWBbGtJ3xD+v1QZ9trzD/Aqbkr0ejPe7nYgMgAkzQ6/K3BN4NHPrhntJfXnQQLYdlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792448200;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=EXsWdRRXk9+eSwgIbAC5EdjqHAJ26rQd5xjGJ291me8=;
	b=kiFhcdvLZEYFm3503bhUVFaBdMi941gfHh0jzqtiYG1dTOfxNu8FYgVJYbD9uILYk7p1
	 XIGToGZ38XU/nOG457/Z50JXaBeDXUvLJbl9aXOANju6BdDI+roIhksLNijqd+8NYwCOi
	 ESddHaE70n1qLBz8hBcE58PHyLoJtl+gRi0vBtXRkB2HS+uiM23uQHzlXjoj8Ucqu9qa0
	 eOAicCg4EeaYBzczG7u9F+34LEPPq1vmqUyDfaU7h+1PpoZWR3UTrBhTgzJr65R6gk63x
	 u/NkTmvarEIENhyVzcdlh7jOq/cdcXYMNW5Uo7ZJfO4mCIpHEI6uOl+FqzFMinH4/Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=k4f4OZv6;
	arc=none smtp.remote-ip=95.215.58.226
Received: from mta1.migadu.com (out-226.mta1.migadu.com [95.215.58.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35CB606A321
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 22:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D35CB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=k4f4OZv6
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VdViblTxEAGeTZ5GLdZhsWWOx0ITRuctWTHtwxKtpLE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792448198; v=1; x=1793052998;
 b=k4f4OZv635S01y0v3A3Q7XDOcojtHz8dTJgq5xYLNlP0MJeTtTTRCuZafhrYz9QN93pHtySU
 7dTHhoG52dJxVYx/qungin/U69z/JnmoWSpnN5xird9GyNNXJSk9FepUK4UgGLLGIrWfsDUOpOh
 ZUrGTW00fig1PK+mQ+ZP5NIQ=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4a9cb402a2071a1a;
	Mon, 19 Oct 2026 22:16:37 +0000
X-Mizu-Trace-ID: 4a9cb402a2071a1a
X-Migadu-Flow: FLOW_OUT
Message-ID: <6eeab3fd-3f87-4289-9e5e-b8b3c2679116@linux.dev>
Date: Tue, 20 Oct 2026 00:16:37 +0200
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86: asus-laptop: Unregister the wimax
 rfkill on exit
To: "Pavel Kossenko (kotekompotek)" <kotekompotek@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261010193837.1120-1-kotekompotek@gmail.com>
 <20261010193837.1120-2-kotekompotek@gmail.com>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20261010193837.1120-2-kotekompotek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/10/26 21:38, Pavel Kossenko (kotekompotek) wrote:
> asus_rfkill_init() registers an "asus-wimax" rfkill switch on machines
> that implement WM_RSTS, but asus_rfkill_exit() never unregisters it.
> The rfkill device is leaked when the driver is removed, and also when
> probe fails after asus_rfkill_init() has succeeded.
>
> Add the missing asus_rfkill_terminate() call. It is a no-op when the
> switch was never registered.

Reviewed-by: Denis Benato <denis.benato@linux.dev>

> Fixes: 3c8671ffd334 ("asus-laptop: add rfkill interfaces for wlan and wwan")
> Assisted-by: Claude Opus 5.5
> Signed-off-by: Pavel Kossenko (kotekompotek) <kotekompotek@gmail.com>
> ---
>  drivers/platform/x86/asus-laptop.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
> index de607ed..8e69f02 100644
> --- a/drivers/platform/x86/asus-laptop.c
> +++ b/drivers/platform/x86/asus-laptop.c
> @@ -1332,6 +1332,7 @@ static void asus_rfkill_terminate(struct asus_rfkill *rfk)
>  
>  static void asus_rfkill_exit(struct asus_laptop *asus)
>  {
> +	asus_rfkill_terminate(&asus->wimax);
>  	asus_rfkill_terminate(&asus->wwan);
>  	asus_rfkill_terminate(&asus->bluetooth);
>  	asus_rfkill_terminate(&asus->wlan);
