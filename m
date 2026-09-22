Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EBD49363D;
	Tue, 22 Sep 2026 17:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790098581; cv=none; b=Mf3sLXIBusJUlWb2BezsmVWaoMhApFD+33c1kafFlwEuG3eyIKiqrt88FVNNcJzGJ/8EMa+Q1wzNQzuw5f9p/emvYUilUPLYQsLNkqb39QhRyufMIhVo+ffaMdTrK8kfgqnwLhH0phXaOrSZ5q7mf2OH0jJTW2wXY6gSZ37CSGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790098581; c=relaxed/simple;
	bh=prctDNlE5adZ9L/DjMylwleky2/BsMcTpLemAxyD18Y=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=kSBd9uQUTN/LWNCjNUQDFD48kOcOsiSNGODBgOiuCTnzD8wn9T+/iqJCfHmsqxCm2rCHDETvFWslFmFkd2LrSR8YfGRflIuJKYIV5SdmvTQVrCa49SFw4aUeAluAf6hph52xjQepXV3vWz6+iXaYFmQUugwMUxHMioXpp1y41dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=Tk3Ry4un; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mbVAmMys; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="Tk3Ry4un";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mbVAmMys"
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8FE947A006B;
	Tue, 22 Sep 2026 13:36:19 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Tue, 22 Sep 2026 13:36:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1790098579;
	 x=1790184979; bh=wavFuDeuFdsEiTZxKJ4EgtzANxA9BvdiVVy33hl1kyg=; b=
	Tk3Ry4unKyNIkTlq5Ae04i3GnPcEUA3rCmHyRFk0uQ6S4k36CGhYm1fP++nuRvss
	PqMxgKFLKdNy47L6rppYPQDEcnYSUnw4xqwOa9d/zD1oeinQ+cYja/5oQpu6kuNZ
	i1PqWov3qjAbjeMKVCQql1Eq6q6C/9LOnYIXM+mcfSxQsYfRGxk1oHrnS6kj4fr3
	Hsg67VuJ4DLCQSlOvHpvqPqfRiDEQoHt/ZtU7fvN7/3yVbFNQn8pZah+BqPQrRyX
	4bL/LTkJbh5lntVCNYZhSs/vQjjuETXK3rZpz3sZyn25Fc4DsGPwUhqbIIljBFKD
	A4eYSbi8JygTZ802JJUkgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790098579; x=
	1790184979; bh=wavFuDeuFdsEiTZxKJ4EgtzANxA9BvdiVVy33hl1kyg=; b=m
	bVAmMysac3tkTw1TAGhM1UWwgTcHb65Dug+wT7fYEHXJv3n+mIjx1OANh4J6JxLM
	b9QRBxyXYEmdTTDXmXGETSC/QCzGpRJWXpMM/MD7QZIM/fpHI2NvCbxOLEJm2F6C
	LW/u+t5ixdpSyNjxCz3hmRNtV9Q21doGKsmWJqMcmYU+RRell6zeStf9M2vid0yW
	0olBn5bV8UQjWailX2gbbdVVRHnoS01K+I59cf1Z1aeAGIFl9HW04CWA9wfIqcJe
	5pDafPNKVAxxPlmx98G9zhFo73yJJn9I/W0XGpa8l4BSqIhsQ9e9ixIWVhmF36c3
	nnvvKm8A5qF7+VqPBwPnQ==
X-ME-Sender: <xms:k7yyavKRKMicXpLObpRA2vBQiA3yX_8OLmmaFVcHrmW36kSo0zxCxg>
    <xme:k7yyat9jDO-Ry-SFUjG3PV38LKtE_hPYpS7PLs8bUavcrmOPN6ub6KHU2vHBYIqoY
    hfboibbMsbtanOcy009PYB0s3Ibf1BVjoRZTUVdPbxJbj6cfjFtOP1n>
X-ME-Proxy-Cause: dmFkZTFtA1kQSVSq2mwSLVMa1zHnKYK/vuqt+w7fW/EoN1X+AYhpAf7aTwssQJW8vYY8Xq
    WNiJkZzaRDaC34QqQgsjF7gj71VX9D/gpvbJHkHuEep3LJ+Yn3hEJJs2ITMJbA4HWDF0zB
    CDa3qgrmiThMvppEYbLm2dpm6PkruroWEqmKYEmurpWYKi6wD47GQhvUcvt9xtgN2yWQH5
    lZXYIfmPbafcK6Mr/Ww+135pk0WXmYAcZiPGB5U0tf/9qnYxAsrxquJgqEoyqRpXIm/g+S
    +s1aUJAz1WgzNk7T3OVhBJn5xeJoUUMm+kuyiSGu5kvmya4t3expGHwWu3QhwQmaTxQhln
    8gPf/IIQ1bLhpBwYP7wunblj3zCuKK9g3x8P6ThyuupdPIySOm0s4SQq4+9zYByjaW+680
    WCwPquU6I11YSkn8IuzhCg0S82FpXm/U42Kjw7rE5te6PHvvQJHImDxMV7D3DiprEDfY2p
    u7AqqC5SJux8JRroEo+lb26vY+EvtzkesVLAmq5hJwHwtayWJBaW7cVFHv1ET9UAIojTlR
    1vGGQcYNmizN/Wg4WNX9nZT8dywfNrlJI0Q1uIrt/Dn0FqKDYvTM2vPd/I+eBZNj5Iuaxd
    Maf9iq2xnJv14h3NDqsy7/VE8FtCXkF7yHWp/VEgbJovLqYSxsN7q/BXaVhQ
X-ME-Proxy: <xmx:k7yyattw72I0Vw-RpQDi0CzgT7siioM6oujbIKy2YaUBa3x0NHqN9w>
    <xmx:k7yyaovTCTJ24Exm1-YqGoANsYcc1fuy_IF4bUSG_NzQFmIGukuAoA>
    <xmx:k7yyajDQpZsgD41Rb-Jn9VJoIKV0ti9kKyzB14PxpFYmtsif5K8Vvw>
    <xmx:k7yyaqMylFnYJ-He7s7jTcBhXg6Gykd9d_N6ZomFVUQsGsaqVZEgnw>
    <xmx:k7yyavwJKruSjnQTtlrYWUCEw0cBM9hcT96aEKXiTnjOUTdEoLt19Dmt>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 4FF9B2C00067; Tue, 22 Sep 2026 13:36:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AmQBxS_KcYz3
Date: Tue, 22 Sep 2026 13:35:59 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Thorsten Blum" <blum@kernel.org>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <b699ec3f-9708-48fa-a7cf-2f6e0d08be61@app.fastmail.com>
In-Reply-To: <20260920103035.281573-2-blum@kernel.org>
References: <20260920103035.281573-2-blum@kernel.org>
Subject: Re: [PATCH] platform/x86: think-lmi: Use snprintf() in new_password_store()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Sep 20, 2026, at 6:30 AM, Thorsten Blum wrote:
> While the current code works correctly, replace unbounded sprintf()
> calls with the safer snprintf() in new_password_store() to follow secure
> coding best practices.
>
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  drivers/platform/x86/lenovo/think-lmi.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/think-lmi.c 
> b/drivers/platform/x86/lenovo/think-lmi.c
> index a0e3fa766e37..3ddc1f5cec19 100644
> --- a/drivers/platform/x86/lenovo/think-lmi.c
> +++ b/drivers/platform/x86/lenovo/think-lmi.c
> @@ -487,16 +487,16 @@ static ssize_t new_password_store(struct kobject 
> *kobj,
>  		/* Special handling required for HDD and NVMe passwords */
>  		if (setting == tlmi_priv.pwd_hdd) {
>  			if (setting->level == TLMI_LEVEL_USER)
> -				sprintf(pwd_type, "uhdp%d", setting->index);
> +				snprintf(pwd_type, sizeof(pwd_type), "uhdp%d", setting->index);
>  			else
> -				sprintf(pwd_type, "mhdp%d", setting->index);
> +				snprintf(pwd_type, sizeof(pwd_type), "mhdp%d", setting->index);
>  		} else if (setting == tlmi_priv.pwd_nvme) {
>  			if (setting->level == TLMI_LEVEL_USER)
> -				sprintf(pwd_type, "udrp%d", setting->index);
> +				snprintf(pwd_type, sizeof(pwd_type), "udrp%d", setting->index);
>  			else
> -				sprintf(pwd_type, "adrp%d", setting->index);
> +				snprintf(pwd_type, sizeof(pwd_type), "adrp%d", setting->index);
>  		} else {
> -			sprintf(pwd_type, "%s", setting->pwd_type);
> +			snprintf(pwd_type, sizeof(pwd_type), "%s", setting->pwd_type);
>  		}
> 
>  		ret = tlmi_opcode_setting("WmiOpcodePasswordType", pwd_type);

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
