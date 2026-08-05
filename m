Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3914134D384;
	Wed,  5 Aug 2026 14:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785941537; cv=none; b=HHyudsxeOAGXOh6hrrKZGa60hnrIELITghaTKYFCeWLG5f2fUUDNhD9AUt1rc6dSb98xBR2Ys/1oq8qXkw/75jLwsf3335DNS9aanbnSTJ7m+ot+JVRZrL8ri14RHZAVWpEqXzjKzeR2Jh2Vi0W8jYLMasZ+/FWZ0XOVTrRBzwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785941537; c=relaxed/simple;
	bh=0nE50Bmhcd1zI2+O5Luhqmn5LzyPW1muTcQrGscgB5I=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=rjqtUbioDTixiER0iSReZ2zs/YW5HL4Dhs+yIt0ZQkefq0svL/5V36OPeykfJ4CtrUL+8nTRZMNTUkVaROMzgApuf1XU8sdWmUNWXov0ZasTiBltMX0JA95Y/quqsNrpaMXkiR9bj1rUuSSzRGjRlOt6WboWjDsaGbXSS6x2k7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=Gikffz4t; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EnmyxwHR; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="Gikffz4t";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EnmyxwHR"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 2F280EC0218;
	Wed,  5 Aug 2026 10:52:14 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Wed, 05 Aug 2026 10:52:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1785941534;
	 x=1786027934; bh=7KDMkTxl9F/4HOh0eEBuok+yfhlCQoIvBMfmCS6/jKs=; b=
	Gikffz4tm3fGHA4Cm5lWLpI8MumjuzZ4QOhOuWPF7TGh3TPvZWinYhLVH6iCjbcn
	Le8CDH+IOJ9fDbk9ReLWbkP/L4RpW0MglfxNyt1Hik31nWzfIn1Cu82x1MbpxErV
	IxO6x5um84uTuRwSOldvpwThOQy+UnyveQwqlV6BCrZtOsJ9zXHoUDNzvto4N4hx
	HEHPECx2GgODuYJWN288A8pI1q9WRiGLfQRgPai9nxvAWSBad3zqhQPcYwH/jnFh
	c9Xgi6b/S+THDR4UtItgUGzZ0h/Eh8+t8Tqw3r+3rytqGJ3vaV1VJxxBnWGf65r2
	RHJL3I3OmCt/9nHQiQzxNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1785941534; x=
	1786027934; bh=7KDMkTxl9F/4HOh0eEBuok+yfhlCQoIvBMfmCS6/jKs=; b=E
	nmyxwHRPbMEmH2UJXnwJEqdlZO7rpI6Q/8VCX/oLxJ5L4v6sctnKAC2UWTMZNzeD
	gDIymNFjN1LT4OKBoD8x8W5rT/PiHu6npGpuF1fier/NdT6DkAuvVL01LA3XUWDS
	YeOmVL7ph25RSRquSR8tF/vu7ws0TwkxfrxoGxsLQAoPzFPWfGSMge8AA6n1GjG7
	aA2J9Euw/v/zAPzsi9VvbFkLml6V2NFDnUFd2yv9su0HBqgzswc06C9KXxrzhgLN
	qkirwS+FxhECEUikDxCVzhQFQoh8+5OBgOxpXtOTxOKW+VVg1kytKvFp6B0Y134D
	RgdYkpJ/FbtPP7xbBrbGA==
X-ME-Sender: <xms:HU5zainl_nWQuy4R2W0QyRuHDHPvvwr3rp73F3K38rt2Svhc46a1qg>
    <xme:HU5zako8xeo5ogcFKzDVHxnmXYf59d9FY7RPHm0MUC9sWWjiq-m3iSTVDISG7nt8D
    0ZQx7RSIqgzApNEayEUZR9Lo_AFbZ025rYi5cXTu_O5RkNh54Ar6g1A>
X-ME-Proxy-Cause: dmFkZTFHUW4WKtHxiFIQcyZ+dSGX3BhXhx9L4A1WT/5BijJoqdxFQ4023kxxE0/i551g0n
    aDX3O+ML/qlnEZdOP6PYJ43gSytF81DrP57C/RStqf7CJ8XgUO5lT0UZYbrDmTuf2mGH2Q
    bXpjEa5q5HmGqsCRdG2lBTdGn5x2N1M8Km0pZ26m6xDq940RK0C7uGJMvgoiDt6jkYYAQ8
    B5hmAF3n6JaOCH+jJr9KlAFGORtlsmYPhRjfWN8qQCv90n4WbI3oJkG9WFo5LRnD+EcrEw
    BssUPmX9XOfuIRWU8/OI4wqmUFd+kt8mdl6rZD8GIrO8DiuUoHzptN0SyKW5/8h2HNm3Df
    13hsyvU7CjNfPKUzJyVchbPAdfe5LUt48XiRgBP4Hv7+FhVJ9EboYLoAnY0u7Kyq6uD2Ri
    3vWpfjYxZVG+qIS+Wv+h6sNra3pxldJ22QUeiM5FD7yiND9DTuJOwcE1ykrowQJLLQ5f+S
    0jzIiiLonh6LtAxVDIB0EhzbenQyCl9durUBBYRu+nsTF7hKQBVfF9chf7CvL/fn1Zqe0C
    8djcSlAbAeGdqmR5UpTUNHRjchf8EgHVM+Pr9s+b9vFplkmZ/g9JvkTc6SlEmg/mIJBuzZ
    nfpDzKOOwWobQZyTS5ucGDQPXVWTvFqFQ/JgT4bPa9oh5+TTluIgeRtdct6w
X-ME-Proxy: <xmx:HU5zaiKvp8yfEUaBp8W9Iw8P0VG_CXtc9pIhy94KzK2qKZ9jwsdjBA>
    <xmx:HU5zamDw-rDe_8UpouTF4N5NlcZjIYBSNf08iQ6snLTHxVEw3BVr2Q>
    <xmx:HU5zavuzGXePOk2dBKp_8EKmx-7-Bh8M2bhUB6GQZJNJzMSUXtEthg>
    <xmx:HU5zasSOOiB7YlZc8nwpKDA9dF3LGHKdKN_t-ScojqdMR0io0rujVA>
    <xmx:Hk5zaiObamMinq_dw-IytUhr3kplNpu-LJFwa_5boJw8qNeZ3N0G50vO>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9F4602CE03C1; Wed,  5 Aug 2026 10:52:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AGBcYg3zY63F
Date: Wed, 05 Aug 2026 10:51:53 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>
Cc: "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Nitin Joshi" <nitjoshi@gmail.com>,
 "Andrzej Pietrasiewicz" <andrzej.p@collabora.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Message-Id: <4ad479fa-8465-4d00-aa73-ced177254eee@app.fastmail.com>
In-Reply-To: <anK1j7hbMyFHGBUS@google.com>
References: <anK1j7hbMyFHGBUS@google.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Use input_device_enabled()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Wed, Aug 5, 2026, at 12:03 AM, Dmitry Torokhov wrote:
> From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
>
> Use the new helper. Inspecting input device's 'users' member needs to be
> done under device's mutex, so add appropriate invocations.
>
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
> Link: https://lore.kernel.org/r/20200608112211.12125-7-andrzej.p@collabora.com
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>
> Not sure how this got stuck in my patch queue but it is still valid...
>
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 445e1403308e..f8e116e8a65d 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -2547,9 +2547,10 @@ static void hotkey_poll_setup(const bool 
> may_warn)
> 
>  	lockdep_assert_held(&hotkey_mutex);
> 
> +	mutex_lock(&tpacpi_inputdev->mutex);
>  	if (hotkey_poll_freq > 0 &&
>  	    (poll_driver_mask ||
> -	     (poll_user_mask && tpacpi_inputdev->users > 0))) {
> +	     (poll_user_mask && input_device_enabled(tpacpi_inputdev)))) {
>  		if (!tpacpi_hotkey_task) {
>  			tpacpi_hotkey_task = kthread_run(hotkey_kthread,
>  					NULL, TPACPI_NVRAM_KTHREAD_NAME);
> @@ -2566,6 +2567,7 @@ static void hotkey_poll_setup(const bool may_warn)
>  				  poll_user_mask, poll_driver_mask);
>  		}
>  	}
> +	mutex_unlock(&tpacpi_inputdev->mutex);
>  }
> 
>  static void hotkey_poll_setup_safe(const bool may_warn)
> -- 

Looks good to me.

Only note is that can you use guard(mutex)(&tpacpi_inputdev->mutex) instead of the lock/unlock? I think that's preferred these days.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
