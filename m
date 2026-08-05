Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A69483BF0;
	Wed,  5 Aug 2026 16:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785946565; cv=none; b=DPuvt2zRa6dq5/K7lYJcHSJoTBAK/6bYyciiuIkewJzqkRlvnKgdymRoG/g3fCF2KXVGsNHG8LXOjMLaoObAG0JSBPvvJeRagz8vzYH5QfCnuOFh96EbvPBCkNzsVE3QZzNA28AmcZ65EBB4p6/i1KSIJtqALluyysx52QZJVes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785946565; c=relaxed/simple;
	bh=79OlGDSOzg+UQ/opzaxa9bw/+peScdLJGoA2NGQ6iF8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=NN1J89wjXAsFJSB6idcjxK1M81H6zfT9PXBldKPrCNn16NaAckbAW2v2oOTwAr+p3A+bjZv3wl5MWqbBQj5xcVob71/FHda/z0E1MGZs4l/V4PC5gfT+DXmrdrLGlmHzW8yuOXNEqQIo9pwkFrV2sWoQrCuHwSZbYVZzsM+rF0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=Bh6Wu63z; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hoYoPrCI; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="Bh6Wu63z";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hoYoPrCI"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id B34EAEC02D0;
	Wed,  5 Aug 2026 12:15:48 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Wed, 05 Aug 2026 12:15:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1785946548;
	 x=1786032948; bh=YDlCCVsFiMHRzVfAuOda7TBWsebnIw3SGAYYMuK+olQ=; b=
	Bh6Wu63zWaD/q13+KMoKByN5EkPaD2fu6RYgJGGLgkyyAsjeDlKtV/17nW93otXa
	B11vWN7fLW7aslPJ4E0FrGfOf0MKLtbPxs94dH9CJUC1HAFdj9i6UOmXUGd4NLNx
	HtF/F+1JzjuLjJlHKIbCwLOCA5BbonkSW4Ds5QlJ3BCb+IJQSzqJ1uk7JGQNypBr
	JZjpRlH5Amxjcy8ZKrg0y6p9YSa/nSr6zTSzVmApR+wQhJg7xrZKyfKsiJtvS/xH
	yqJf50Acq8i8GdtX04leA7QN3Dr0lzPCUuyt0g0o/LBc3x7Z0h9Ad7sJofD7wnZq
	A2N9YfH5m8bLyhcqvR3D3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1785946548; x=
	1786032948; bh=YDlCCVsFiMHRzVfAuOda7TBWsebnIw3SGAYYMuK+olQ=; b=h
	oYoPrCIEzh6F/7Vb+KGX30YjPYKPaVOlK3/121m7hOd3bJnzREUVCjfM1iLM7b8w
	dsQZfbnQvQi5XwI24FYPbIumQ3eZB1FFMKea8fEaQnO167VXRoxtOWmDCSu4Yq+t
	D9COYhRaTQrRu075a8pL5iVVygcZAtgC8vGgxJvNuBURfkODX4CHu/NxWUsozvcx
	ZFP95LVHWlYqX7ZYW/L0kxXG1E5TyB0pGgcw4Q2UjRRCAj3utH+IkkHuFq64Qt1Q
	c4bhd9cHWBHWuH4lWguksU7ixwSf+KX7qMCkFF4kfx1tj0FNTrObjtAAQmfnO8HG
	pXyBITYin06MJIle9h+5A==
X-ME-Sender: <xms:tGFzakGV3L1NdJymlquWtTjeqnhL0eh8cWpJntLgneyWDyT_JCeRmg>
    <xme:tGFzaoLGftaQz2Hcj0g5oXxvmUkkqu3Le5Xxd_MymsEM519t-aoS8ZszBrkmUfW8d
    d7JDaj9m-yKXMsiA-CsRZYba5WO6eF4EqAKCOvWEpGAqOu60zSZSwZV>
X-ME-Proxy-Cause: dmFkZTF0qJY8YA2yxFx4c0M+RBcsk3uWDSAGUEIx5HiE8ipzmNPyGVON2gm2oiGELkuTPL
    PPzWKStcFoqEl4k1//KAn5E1QdM/Ko4RquAoY4PWxNVf1ExxISD1IFViC88I2uGEAMRqyO
    Twfk1a2qHM7/PhZzQZZ7tu67F8spidc81Tj9kNWYKbcTSw3X2+7H5y0njYWHWF7Md/cmFE
    a3TmPXtV7QAcG9fXoX+WLAUK+80FuLSIPeE1kIpNatmeKxDgg85v5JgjzAGkTMC924Q4Vd
    5kAHGrG0JxzM6BfNnEJRrSVsN3vrPvYVNyzh3j1rqf4P7ErDmvuMq80e72LO60T/ZnFWPJ
    oKtebjru4TV+iaG8H5QvNhfPakCEqjBCAKbrHrxmkX7QkIt8IaD1IVN1bWzNAu4UQOzG0B
    stzbUGAOJJ4iLPsV3f1F5pJZwmgiX6wKQRO51ijUmd4MjqE95RSH4Ab4Rd1BV6C1IAtv35
    QbYiIbkwrW3ysrnQknVbxUv0KP88dRHBpDSDF5nb1WlMx/y0ItwW8dVp00A4DrwlQNR/Id
    5PCNrEp72j28sKNM1DcTquGOlnewTePnhePzxEJCMVOtCoUpIaUGaTMxf9WDqbGfIPR5ja
    uZ4ir0OpHcsRPwVITJ6/6GjOcaMUs+z2h3Due99RLOYcz41t/5B23M1hEnOQ
X-ME-Proxy: <xmx:tGFzajoif0tvdJP9rzTVgfUHcyBoxy0fV860kva3q4pUfd6i0U1FgQ>
    <xmx:tGFzapiBPi4okVFUfAz9alnFbuWWrfEvlkodJWpOq647tW2otDQEXA>
    <xmx:tGFzatPY9vAWHEInZ07oCHqEMwrwqGF4ot3OjK5JyHRi0D1yejr7zA>
    <xmx:tGFzarxOnfnZaUHd-_mZx9KX6aCDN_G-2UVx2wGmsVUng7c81qwqfw>
    <xmx:tGFzatv38aPtCKgHrQKvFpRDmCg3IZdPBasCRAueHo6n0OvwgAscw09M>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E19322CE03C2; Wed,  5 Aug 2026 12:15:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AGBcYg3zY63F
Date: Wed, 05 Aug 2026 12:15:27 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Nitin Joshi" <nitjoshi@gmail.com>,
 "Andrzej Pietrasiewicz" <andrzej.p@collabora.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Message-Id: <7f1ead83-532b-4546-b6c9-ca157a0286c0@app.fastmail.com>
In-Reply-To: <anNa7i7HnJW476bK@google.com>
References: <anK1j7hbMyFHGBUS@google.com>
 <4ad479fa-8465-4d00-aa73-ced177254eee@app.fastmail.com>
 <anNa7i7HnJW476bK@google.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Use input_device_enabled()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Wed, Aug 5, 2026, at 11:52 AM, Dmitry Torokhov wrote:
> Hi Mark,
>
> On Wed, Aug 05, 2026 at 10:51:53AM -0400, Mark Pearson wrote:
>> 
>> 
>> On Wed, Aug 5, 2026, at 12:03 AM, Dmitry Torokhov wrote:
>> > From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
>> >
>> > Use the new helper. Inspecting input device's 'users' member needs to be
>> > done under device's mutex, so add appropriate invocations.
>> >
>> > Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
>> > Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
>> > Link: https://lore.kernel.org/r/20200608112211.12125-7-andrzej.p@collabora.com
>> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>> > ---
>> >
>> > Not sure how this got stuck in my patch queue but it is still valid...
>> >
>> >  drivers/platform/x86/lenovo/thinkpad_acpi.c | 4 +++-
>> >  1 file changed, 3 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
>> > b/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> > index 445e1403308e..f8e116e8a65d 100644
>> > --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> > +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> > @@ -2547,9 +2547,10 @@ static void hotkey_poll_setup(const bool 
>> > may_warn)
>> > 
>> >  	lockdep_assert_held(&hotkey_mutex);
>> > 
>> > +	mutex_lock(&tpacpi_inputdev->mutex);
>> >  	if (hotkey_poll_freq > 0 &&
>> >  	    (poll_driver_mask ||
>> > -	     (poll_user_mask && tpacpi_inputdev->users > 0))) {
>> > +	     (poll_user_mask && input_device_enabled(tpacpi_inputdev)))) {
>> >  		if (!tpacpi_hotkey_task) {
>> >  			tpacpi_hotkey_task = kthread_run(hotkey_kthread,
>> >  					NULL, TPACPI_NVRAM_KTHREAD_NAME);
>> > @@ -2566,6 +2567,7 @@ static void hotkey_poll_setup(const bool may_warn)
>> >  				  poll_user_mask, poll_driver_mask);
>> >  		}
>> >  	}
>> > +	mutex_unlock(&tpacpi_inputdev->mutex);
>> >  }
>> > 
>> >  static void hotkey_poll_setup_safe(const bool may_warn)
>> > -- 
>> 
>> Looks good to me.
>> 
>> Only note is that can you use guard(mutex)(&tpacpi_inputdev->mutex) instead of the lock/unlock? I think that's preferred these days.
>
> If that is desired the whole driver needs converting. I can do it in a
> separate patch(es) if you want.
>
Ah - good point. Not worth it for this IMO, unless the more experienced maintainers have a strong opinion :)

Mark
