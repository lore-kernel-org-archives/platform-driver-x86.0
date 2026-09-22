Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95721477E4B;
	Tue, 22 Sep 2026 18:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101046; cv=none; b=fsJrroR+u/BgTI3rmjxln5YlF+LBu4nutTZFOXnJOjD38nTbkKGz/9xjShaddw0VhAQgGqxpIOOBkZ+Vxuit8Z9vWQGQens5RKvjEzsb8zdFCVV+jwtoUcK+gGnzmYrk9wLkcN6nHjU9/zwsgYeAH3msnHG23Ij05RKB6wjAfm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101046; c=relaxed/simple;
	bh=/G/YfJ6rB6LEW/WopurgG8R5skWktphFDj2LkgLNapM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Vh6KuTs5jqof5aEyQpPwpTVW7zqxdCvuij3Xyl547pbwCOv/lnS1PbmGhImWIVYhkJzfCWzXL2/vJS9lTK1KNoAjfLD8ATULRadR2piE4hGrmTvBNxiuKFtEnA6+RR50g64KGfc90jsdwgy74YTaHv+iAoa80qNSbWm4G36ZgDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=XESz2AgD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TyJtunZN; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="XESz2AgD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TyJtunZN"
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.stl.internal (Postfix) with ESMTP id DDFF57A007E;
	Tue, 22 Sep 2026 14:17:23 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Tue, 22 Sep 2026 14:17:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1790101043;
	 x=1790187443; bh=hQ7N9KYkGtvR5wvEPZv8VeoVlJ0R80Ho3X4PvHB+6VY=; b=
	XESz2AgDJjYsTHnr/2R4Cb+OoNBVlDPi+DER76jTwEU/ujG3juf0gYnOdLbnsqik
	/c4qik76/wfF2XgbiRzGK8GAbKPK4KsiT5dFchSBQwUrHGThX3s30q3FcHH3WP0t
	j66dxDtfMFUrfZkeayyldBZy9wbTWFSSNF2SzC8rYVU4irk1jghQWPntPJLiN49v
	A2eQhhoImZvQn4DhTPuI39pIf1f5WYKZV28B99w6gqxiIGVPYWC01iHseNt8E7hO
	c4MCJBEjrACgp1IwnqMCUfZKI54NJNrb+QoUwHePsB+Mik0KbVHRL7Hu9S71Joy+
	kYOVsiuMLAuZRb3RWQhbDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790101043; x=
	1790187443; bh=hQ7N9KYkGtvR5wvEPZv8VeoVlJ0R80Ho3X4PvHB+6VY=; b=T
	yJtunZNYdVXIsh3FNe73FAqCldFaFHygm8gk29sqQ6XAyn2EKa5aUl6ABuQWXlaL
	R6HKfzDEvk3f8TuRDIfBvqoVkREK1oqDsmZXidiMUVJpwtwxjd5I+3PcLBAtoLyj
	psRydYSk5+Pk3NnAMA52Ecrjz/orfBOxYQ9GhYweheLmt8esCNQnojkiUZZTZdYb
	q6uQCxraL28a9aCehRh4nopGZUi2iCwbW72i8o+Lu+WiwbAVFb1sev96FzgLcE7W
	/gvkkhZ3g54qh31QzpomFdeipKx/RjTHFzipmFF3+zjgl6fyCjNFyNLsQ78CJ5kP
	tEH/e/tNsYOEAzgE4j7Dg==
X-ME-Sender: <xms:MsayakUsdNgfCZRUo1oKKUxCuNKI1BUCehR0sBEeryWGEG0JTdadzQ>
    <xme:MsayajarZwqGECW7FHNcV6ha6G4zxDDc76j09--yyIgO2V7W2btW438BKcqBUgqVZ
    w39SPgOAS2yYGpiImZU_otvk9hdzgUE74SsmMP47llggDNQJRnEBX1P>
X-ME-Proxy-Cause: dmFkZTE18frdKp5g5RvUpf3vYbGWNW/GN5hKp9ux+K5VcXKoZw5EF1H7EUZ89bLUl+54a+
    RLDqYop5s8Eg8NyHZDpcsHv0BF9WqiDtZmqcxcfuuR6VxDnckl/2WEjD/H7iqjtCZMNmsD
    6umHlZAgwIrAJDjqNeKU7KQDZ3a37zBAzblr1AOFnW6Rag2VRLK9azoIT8lA3kAexTl7eE
    tSg1mygM3Dldczg9JF5kvA3Hi8OHoro70ZFMP4Z2pQLio+nWa/dv7QJgAI0jOP8YiqB7Xa
    QQtPELCoPvDliGDVFUb1AbcbKm9fBP9/CQhBxJQ9GSygFnoAe4LkNZHLQPsh/wXMofQLDG
    V0pVqAoW1GjjpdbY8137QcIw1tGZtrDA77gHga1ZTGxtob7oJf0dHpCnWUXM7jeofb8RDd
    Fla8LyF8mCqg/jufA+24xY+Rk06uyztVB/4EP+R2GdvBQIWJ0c1ld9deZI9fNVSyZiqx1o
    POSB10xYpdQGURaE9qz47OPweytKAf1nvJ0sHfFkQ7KxZs37+hg6R9p0CD8hKeTm3cVnrT
    XpZRSdL5vCN0TP+BBGL5G0B9fkjL0y5HlI+MhHRJlxy99d9EDBOpPLLPB17LGkmasoz3SN
    AThp0iqqLxeCn/wqJpt1mhOuFK4OK2nyqlTT57+pDowcSSpwG5PamjmWZtCA
X-ME-Proxy: <xmx:M8ayanqbWXONlJ0kgFIwMYZIVPWXK3bQTfjVzbs9WmXdXP5ygdufIQ>
    <xmx:M8ayarrsNzQFGoP4v15v9aE5Bd32N_nUdl8VrjA-eA-i7NuNvR-wFQ>
    <xmx:M8ayaq11NSpdP5Xjk4CI4ayY2aHayrChqKVfjxBVcta1S4NPCYA1uQ>
    <xmx:M8ayapGGsGLht1ujcITaVVYVX-vql3diNyatdooYW7f3zQN5SUIQ5w>
    <xmx:M8ayasHdjoDOtxFwprdjwgVCNUGkMBZbXYfu1naxRgLZmaZIGag-QiXZ>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id AD6D62C00067; Tue, 22 Sep 2026 14:17:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Aki4E40nKIBZ
Date: Tue, 22 Sep 2026 14:17:02 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, "Peng Fan" <peng.fan@nxp.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Message-Id: <05c50d6a-e3fa-4ab5-afc4-7c13a792b2ef@app.fastmail.com>
In-Reply-To: <20260919130829.3041568-1-peng.fan@oss.nxp.com>
References: <20260919130829.3041568-1-peng.fan@oss.nxp.com>
Subject: Re: [PATCH] platform/x86: yogabook: use assign_bit()/change_bit() where
 applicable
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Sep 19, 2026, at 9:08 AM, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Convert open-coded if/else with set_bit/clear_bit to the assign_bit and
> change_bit APIs.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/platform/x86/lenovo/yogabook.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/yogabook.c 
> b/drivers/platform/x86/lenovo/yogabook.c
> index 1a4b2ab1f35d..f4c99508c6e7 100644
> --- a/drivers/platform/x86/lenovo/yogabook.c
> +++ b/drivers/platform/x86/lenovo/yogabook.c
> @@ -120,10 +120,7 @@ static void yogabook_toggle_digitizer_mode(struct 
> yogabook_data *data)
>  	if (test_bit(YB_SUSPENDED, &data->flags))
>  		return;
> 
> -	if (test_bit(YB_DIGITIZER_MODE, &data->flags))
> -		clear_bit(YB_DIGITIZER_MODE, &data->flags);
> -	else
> -		set_bit(YB_DIGITIZER_MODE, &data->flags);
> +	change_bit(YB_DIGITIZER_MODE, &data->flags);
> 
>  	/*
>  	 * We are called from the ACPI core and the driver [un]binding which 
> is
> @@ -136,10 +133,8 @@ static irqreturn_t yogabook_backside_hall_irq(int 
> irq, void *_data)
>  {
>  	struct yogabook_data *data = _data;
> 
> -	if (gpiod_get_value(data->backside_hall_gpio))
> -		set_bit(YB_TABLET_MODE, &data->flags);
> -	else
> -		clear_bit(YB_TABLET_MODE, &data->flags);
> +	assign_bit(YB_TABLET_MODE, &data->flags,
> +		   gpiod_get_value(data->backside_hall_gpio));
> 
>  	schedule_work(&data->work);
> 
> -- 
> 2.51.0

Looks good to me.
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Mark
