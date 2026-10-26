Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015419;
	b=vmWWI9zEmVxMGuUA4Wi0Fz9pYcqpe+eEqP+xw5FVLHLXRWhrD2YFmczHt3DCrlIznOnB
	 0OSOfpjM/1wrYfFLS+1/7s+nKEDgrGumeBc75I1fuDrOjhZ+dxBL2/VGivhmTvfU8YJ6P
	 o4P2LBfdq8DQfNUcHtLebZSYp/kOtgkaYJU82zlx82Bqpsf16cgrHi5uqY5vIiceUVj3r
	 sUJkKj+6FeHHZV4uu1G0EN9oE/Pobj8+ERKr8avdSTKMAnDAqrBB2aoAxU5X67ch+t5wK
	 M7gxrrylM/RzOwE7vPxdrtYSOXxBNETzuOgP0qFIhz9dmKiEX5TRRguY128DNWjoAtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015419;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=2fGbm/hcmTw9l0rJzK5DiHz4iKiUDYxk1HFY9p38hx4=;
	b=CAaXq/fDmvL2tKSZ9V5XPJ24AxZThefR/GHOBkAS6Pzcrxw0JrEohyx7oZUVsJvBrgkY
	 ikwEpVGOlAs7e4PUTXc48ZZ+piCci77gbEtKbArzviTxXiXNBpizkXv5dm+Nwv9ngKNar
	 gjkdmKkD46tG17/sSl60vwHvLyLi7/qXcxieyct6hMIktUZiKBur7Ift657153HD0gLeD
	 lJyOlmkMOUawyoeZjQjl0tDcltoxtU2NgoBX1DsoLcvw+o8MEdL7tLexRCYHnrcj47Scr
	 ROun1MvZtcBJXpCDn+26QZbErTBwfV+9axrTo+EK/x3BlXkds+PmyFM8ZSmIDx3cZPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ojlgGEUq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C29606A32F;
	Mon, 26 Oct 2026 11:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ojlgGEUq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 249FC1F031E0;
	Mon, 26 Oct 2026 11:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793015419;
	bh=2fGbm/hcmTw9l0rJzK5DiHz4iKiUDYxk1HFY9p38hx4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ojlgGEUq7ZxFYIY4+SW8BTJtVzq7V0sWlXkicrTF9nhHbR7/khSwhbX+2X/CMOXAF
	 Cr4RlQMHz5tglCOWKc7azdcI4HOt55DVM5Y2KRGs1USXR2vXvlEheYPf40M/Vds589
	 rPSI0q2Z3M0sXr0mSR9nG44lhEy5jofNe1FIGF8tGyGrh5YTXEQ3MARG2WUL2IV2ix
	 x+Ro9EfKs/p+a+teSnBtq24fZkAcpBbDSgxnaKjTaGI0esfwgUAR0wrCGAuWKxfLYs
	 eXtCPujRhzovM2pcQ+tkMYSVgnt2v4dx1AE+OdbqTRsboSEqfGrD8y9gVYA5BXjVlM
	 EDrygpzkSUI3w==
Message-ID: <5c0d3a58-6dce-4fbb-b2b3-07f3b3d4a094@kernel.org>
Date: Mon, 26 Oct 2026 12:50:16 +0100
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
Subject: Re: [PATCH] platform/x86: dell-uart-backlight: switch to
 devm_mutex_init()
To: chitranshmandhaniya@gmail.com, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chitransh_Mandhaniya@dell.com
References: <20261026042310.596206-1-chitranshmandhaniya@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20261026042310.596206-1-chitranshmandhaniya@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 26-Oct-26 5:23 AM, chitranshmandhaniya@gmail.com wrote:
> From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
> 
> Replace mutex_init() with devm_mutex_init() so that the mutex is
> automatically destroyed on driver removal via devres. The driver was
> missing a mutex_destroy() call on the teardown path.
> 
> Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans

> ---
>  drivers/platform/x86/dell/dell-uart-backlight.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
> index f323a667dc2d..2ed2f00d8c49 100644
> --- a/drivers/platform/x86/dell/dell-uart-backlight.c
> +++ b/drivers/platform/x86/dell/dell-uart-backlight.c
> @@ -279,7 +279,9 @@ static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
>  	if (!dell_bl)
>  		return -ENOMEM;
>  
> -	mutex_init(&dell_bl->mutex);
> +	ret = devm_mutex_init(dev, &dell_bl->mutex);
> +	if (ret)
> +		return ret;
>  	init_waitqueue_head(&dell_bl->wait_queue);
>  	dell_bl->dev = dev;
>  

