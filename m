Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186613;
	b=BwPwlqxKHmkEuv2t/3YM4wjKNASXm+W1dGdnVVVKkjox2OvROx5HrBxtGPyPx+kiStQJ
	 dPSY/UFwKgfi/hwlVnHG23894UiAXT29u1ZveCQb8AcTc2oVPHDoCzhzB/gDMATTvmUJo
	 OJov5BEF7kMliLtMhghm9WTBmqq44Xbqdn6ZHN65VxhO4icFsaIJs115ug+aE1rCxtGSs
	 +sz3GnwkooMuo834wz9IgvQaZaQfVODLlK2uLQ8RB95sKc/JEfJIUSoUyXK6trIO97sn5
	 aszuOlw7k9zI7omby1iJJ/GqsGyt5GN6aHfAYeAlLGTJFpehFuTzLLjottO1c1EY5gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186613;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=OLURmNVEVjdnpUnnfugJTEwbglau9GZTtSs8MdEEDEQ=;
	b=KtfpXJYBG9e2LPMkx+/ELTsrL68Y2L3uLYX4e7TkA1av1Us4SRrwohTCatB1nzpWkgxH
	 qy0mcCemLHGybO+Qn7MQbFkcvwOHpLETIQti1bzaSawb9/NpeOAs48oS9Tc4/8nlHM0y0
	 lkzgljsbyxKLFi8XJHV4RDg3v70aAIiWnBmAoP5BoVrhq3KnszNwvQ70Bg9bEbe5LFqpW
	 Z0350AIcFCrtiuwQQWJnXGZ20xfoz1xjzWWqjESRwoZfEJMB36WwsDwksuU+TjG2RzWRj
	 uiDM7v4BLQH5E3kZFAkFnq8EQ/drq1D8kqVNaCFnxpednBpv4AwivzRT1mjA2gCeGEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KeTvz6qs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63178606A320
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 14:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KeTvz6qs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB47B1F000C4;
	Fri, 20 Nov 2026 14:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795186612;
	bh=OLURmNVEVjdnpUnnfugJTEwbglau9GZTtSs8MdEEDEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KeTvz6qsEPzaPVYK12yniZxiuweHZl/5/jv1la16qjt+7ZrC5AEXkPcOcPQChtrOk
	 xaRLxcOq4LHkJxsRjOQNujE5OAEGvYXpTdv/3zg2yUonXCxMFPKw0VxN6pcLENtezP
	 QDa7qtY8xZP38ejSS75vPj9RDeD4gihsyYd9PghyKYEJcrRuBrFal1Hqp+Y5F6IDtS
	 5iow86sdvu7g7NKAQqhrSoHg7SNKjx+VddedJht7ESnVOZVXCajGhk59V8F6tsWHxe
	 sKU3p33553dgCPgQjaAgo7H3chYIi8yvcW/5vXhnSC6UAsVjf44fxxeTqWTFuGF6iP
	 Dr+CK2JkSEd4Q==
Date: Fri, 20 Nov 2026 15:56:47 +0100
From: Thorsten Blum <blum@kernel.org>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, Seth Forshee <sforshee@kernel.org>,
	Matthew Garrett <mjg@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: apple-gmux: Fix max_brightness limit check
 in gmux_probe()
Message-ID: <awBfr9PSLL_2w7qS@kernel.org>
References: <20261120142914.825047-2-blum@kernel.org>
 <9fa07231-6bb4-86d5-451f-f5a18d33d967@linux.intel.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9fa07231-6bb4-86d5-451f-f5a18d33d967@linux.intel.com>

On Fri, Nov 20, 2026 at 04:38:57PM +0200, Ilpo Järvinen wrote:
> On Fri, 20 Nov 2026, Thorsten Blum wrote:
> 
> > gmux_read32() returns a u32, but the maximum brightness is stored in the
> > signed ->max_brightness field. Large values can thus become negative and
> > bypass the GMUX_MAX_BRIGHTNESS check.
> > 
> > Cast props.max_brightness to u32 for the check so that these values also
> > trigger the warning and are capped at GMUX_MAX_BRIGHTNESS.
> > 
> > Fixes: 917ee75a5916 ("platform/x86: Add driver for Apple gmux device")
> > Signed-off-by: Thorsten Blum <blum@kernel.org>
> > ---
> > Found by code inspection; not reproduced on hardware.
> > 
> >  drivers/platform/x86/apple-gmux.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
> > index 9c728ac4e045..4d3a6d2393f7 100644
> > --- a/drivers/platform/x86/apple-gmux.c
> > +++ b/drivers/platform/x86/apple-gmux.c
> > @@ -881,7 +881,7 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
> >  		 * brightness at this value, but print a warning if the hardware
> >  		 * reports something higher so that it can be fixed.
> >  		 */
> > -		if (WARN_ON(props.max_brightness > GMUX_MAX_BRIGHTNESS))
> > +		if (WARN_ON((u32)props.max_brightness > GMUX_MAX_BRIGHTNESS))
> 
> ???
> 
> This looks very wrong way to fix the problem (using int as proxy to 
> carry it until it's bounds checked).

I considered a local u32 variable before assigning it to
props.max_brightness, but then chose the smaller change.

> And why is it using WARN_ON()? Is it an indication of programming error 
> that gmux_read32() returns a too large value??

It's a hardware value, so dev_warn() would be better.

I'll send a v2.

Thanks,
Thorsten
