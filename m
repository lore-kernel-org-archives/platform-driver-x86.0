Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537C141D63F
	for <platform-driver-x86@vger.kernel.org>; Fri,  2 Oct 2026 12:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945779; cv=none; b=G9pJZCRzlPGsURkx5hWwSSdNfYFyX/p6fzsAfqnF0/VLseNRSkHVHRe6vsbq5ahh/EVce7v490ky2pULyoBCHraCl7hbHUqQ6yk1BGjEL7JSM9XBu4DQYNVJgj/IrQJAHlcWukJI5u53veArI7IFgM+PXDyXjneO+U/uEi6yEiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945779; c=relaxed/simple;
	bh=mzpmjqzmjT5iR3bDi3+YDm5VlnxaZBMQ4+yBadz9T54=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=qaTuc0u4AXGH6TZ2uQiHmMNxOtWq9Hi/7ba0HponoDH9lFCaPhURJAdSCkSIC8ePxUBSg6Szt2zMoYPPH305tGSBb0Iizr15FmQpl84zjfWNI0vgTH/AlLSojetf+XvhIVeieJ8h8HIRkMjPTTmigFeVkRaBO18tUoudvsTNQYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=O3f+VWJs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Y5pcdj66; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="O3f+VWJs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Y5pcdj66"
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9BDE17A013F
	for <platform-driver-x86@vger.kernel.org>; Fri,  2 Oct 2026 08:56:16 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Fri, 02 Oct 2026 08:56:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1790945776;
	 x=1791032176; bh=BMazx/2pEY3oqmEHc3jzJPxtOpg46BGaKTnViFsPJWc=; b=
	O3f+VWJsBedlI62g44o9PRhtKIcO6nlcd9CqC+piRh4C7x8TO5qhPmYIEuusW3ug
	9ozesYJt27QseFf6Tyyf+Z8XgbeZqGHUqn/wmp7zIK/PtPSIKPQdc+VwVG++owHF
	x2gLnPYMXpDMkJIshov19uZC3Y1uzpgtSc2UkPRpmlx8Kf9wiQL6GzbTcUKTL7rg
	d+pi9cen6yLWCCZ8z0CzQEsAKzV40k+WpmAff1Tj9rbyUdn2exMveIOD8bSKcoww
	DBzGgFCbjPhF+fzxkVWaP6QshWXLcALvBd92zj18Ry/GyLi41/JvDuWzrY2emub3
	Ebq+dTLnSJCR4IC2m20gJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790945776; x=
	1791032176; bh=BMazx/2pEY3oqmEHc3jzJPxtOpg46BGaKTnViFsPJWc=; b=Y
	5pcdj66KKOoejACYSIfZwNxEysjwYKoz8BCRC1gV36+/B9bmpUV5Ynwii48cp/8N
	nz5bPTla8+iRCUzRBOrMLXBy9Ad5dQVew45idHj787oVICYaTt78bq5EhSlLUOhQ
	28IWwPYokpKbXEsTUseiYOJDsCFbTD7Wdxup2cB5co+n0YBDgX45c6xag3nXcCSw
	tZnkFL/HJFJe5I0u/SmGzpxDV3mXubE9M22V2D9tN3CruIosmB1JWtphZP3lqpWD
	DvVg4Whx4AL2IwOReXw5jZBCH1EaIbDIg6RuX0AxHW2WhX6BSB4I1zC/5/CZS54H
	pqmz8euBs4VuL9RjHtVUQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1790945776; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm2:rsa-sha256:NKMMprYTW/2gza3EqL2A5PNisWMBP55y9uiSpbnfg+lUEd6
	kcahUC1teJIpPyhsinYO/NZ9wQjOXBpLJOtP2ARtHPmJv7GZrRf5nWS/cqJ5AeTA
	w2XgBtSFALUVkN7BopS0Pb0ojG3m8gex7AALu/JASPFoPG0i+ncEJHUgTwVxOgV7
	Yf/CKynv3wlJ/Ysv86vn2h8WklEsJCSPDgw8ivpF24JxnMeV/JT5B00TJo/+Xmjx
	Z0OOHo3RZGi9Bp72gnUhNtJNrqKHms+Xn0aIUjYylU1GgPl2M5qVhup2YHvWCuaS
	AD3M1wrp/VvOWz1XOm4LGWrNc6SkXZALQSTXHhg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:bDep90g3SXoJusc2tpIqZzw2ddMHz+gYUaXOOAfwQ7Q=:mzpmjqzmjT5iR3bDi3+YDm5VlnxaZBMQ4+yBadz9T54=;
X-ME-Sender: <xms:76m_amXRpsaSBsX0Ftlw1rU7Sj5G6BfCYPe7gm11E6vI-glkfm8Q4w>
    <xme:76m_ata50u-izPWPUnZlrq9BgOVJLLyk_Ha8P99AbIPnL79Uc2z2XowSzmp2fGYIY
    Q0xSGpWv6KMXNkw8EL8dD7UJcVxbYu2xSbV1qYiIw9x08rwohP7uT8>
X-ME-Proxy-Cause: dmFkZTFI5S09W8s8qCiE0wSLFhR5t6TIDxa9CarWsNoJZiOx1R7RICYSPWTpHan0afxVGz
    qB9/Q7QGs5BljMkVVeB4CThbG03ts1u1g7pzqtGEkNyA9y+KD91ME6rsxb7aR95PPLoyJC
    TznemOhw097axNELfPVzpVMmbWhSSCG82wbQkD0OpcaVv0LMb+wrTNZp+3BiUwHiU78uIy
    ZRhroBLCAucvacn5VH76FvZ71gRL54qQtyNGMdnZNBEbElhn9xyIEhffusdSkCALVHw+lh
    dE7TMu3ffSd9THlukdx3PTAgtMRtjKhcnnjDj8EL5ezGGSTqyMJnCSPXKBinP4pWtAL+MS
    Dr7P/oHmacXnH+bLlW/VukeeOO/St7k7xMJBmmli8iLylwf37fZc0gP5yrt3doKAWsgX/T
    1KbjDXjFqkNVZWxa7XNCa/3SHd6V37v3n/+GxAsqdnJ0rTtwDlyBfEX+dK5eexDfJ6H+nV
    QwXqMjbfHZbar1URlRpKqdz5Cr9DS32SfTtYrkJ9wrrfP5GB5By7Lx4ZkvSRub0YcYtYNs
    rEVp7gj4CL8N6tIj98RSMwc8er6dX+Z4kEijL+a6A0RBlJ2hJ91iiAqw+xhyftK3GXWzmQ
    v8G4i1tFQAcbAIGnx61aWongI/xOhn0wwQAMb/go31VTNdM9BIqQvRhF/yyw
X-ME-Proxy: <xmx:76m_al7DBO8x9Xp9gW-nzSqI-7yaJ3P7tXo4OBZJdJReXULCymFd0A>
    <xmx:76m_alKnA6qtL831OV6jHNFNUgPWzMy8nrvkfQm_jHQVeMDH7KyUOQ>
    <xmx:76m_auvFvfIQS8toVtUwW_WeVel-O6mnQnX3Oua7wjIAcNbCVWw8kg>
    <xmx:76m_akLV8afpJW9LS9cbSsottFIzTAzo6KQfETFByBbhsKuy_JTk4g>
    <xmx:8Km_ahCfTUQOfAcm88IuXu6FX0N1sX-1Y1bA2dK_YV0AU8LeunqU0AMq>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 6DB8B2C0006F; Fri,  2 Oct 2026 08:56:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A21iI5Udebv-
Date: Fri, 02 Oct 2026 08:55:55 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hans de Goede" <hansg@kernel.org>, "Huang Wei" <huangwei@kylinos.cn>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org, thisisamirv@gmail.com
Message-Id: <000acb24-7aef-4718-89ea-0dffd1ab34d9@app.fastmail.com>
In-Reply-To: <2aa11257-5bef-4739-9994-a511a29b4141@app.fastmail.com>
References: <20260918161539.2676619-1-huangwei@kylinos.cn>
 <178975590278.29716.17309474720733695095.b4-ty@b4>
 <3d4bb6df-a3db-41a7-a568-b268efaa1c93@app.fastmail.com>
 <2aa11257-5bef-4739-9994-a511a29b4141@app.fastmail.com>
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: Add X9-14 Gen 1 to non-standard
 thermal/fan quirk tables
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026, at 8:20 AM, Mark Pearson wrote:
> On Fri, Sep 18, 2026, at 6:00 PM, Mark Pearson wrote:
>> On Fri, Sep 18, 2026, at 2:25 PM, Ilpo J=C3=A4rvinen wrote:
>>> On Sat, 19 Sep 2026 00:15:39 +0800, Huang Wei wrote:
>>>
>>>> The Lenovo ThinkPad X9-14 Gen 1 uses a non-standard Embedded Contro=
ller
>>>> firmware (ECFW) whose thermal and fan registers are not located at =
the
>>>> classic addresses. On this model the thermal registers sit at 0xA8-=
0xAF /
>>>> 0xB8-0xBF and the fan registers use the non-standard offsets, inste=
ad of
>>>> the legacy 0x78-0x7F / 0xC0-0xC7 (thermal) and 0x2f / 0x84 (fan).
>>>>=20
>>>> Because the model is not covered by the existing quirk tables, the =
driver
>>>> probes the legacy thermal addresses during init, reads back 0x00 fr=
om
>>>> every register, concludes the EC is "misbehaving" and disables all
>>>> thermal sensor access:
>>>>=20
>>>> [...]
>>>
>>> Thank you for your contribution, it has been applied to my local
>>> review-ilpo-next branch. Note it will show up in the public
>>> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
>>> local branch there, which might take a while.
>>>
>>> FYI [if applicable to your patch], as per Linus' policy change, also
>>> fixes are mostly routed through for-next unless the fix is for a
>>> commit introduced in the most recent cycle or is clearly a regression
>>> fix.
>>>
>>> The list of commits applied:
>>> [1/1] platform/x86: thinkpad_acpi: Add X9-14 Gen 1 to non-standard=20
>>> thermal/fan quirk tables
>>>       commit: bb0f3a5d6b9844b70ad696b9470762028f6d86ec
>>>
>>> --
>>>  i.
>>
>> Just a note that I have a ticket in to the FW team to confirm this=20
>> (LO-4662). This platform was Linux certified so I was a bit puzzled a=
t=20
>> it being different, but I think the proposed patch is correct. Just=20
>> making sure (and to figure out how we missed it...)
>>
>> I don't mean to hold up the review - just noting that this is being=20
>> verified and confirmed on the Lenovo side for completeness
>>
> Confirmed that this patch is correct - the X9-14 uses the non-standard=20
> implementation. Thanks for the fix - we should have caught this one :(
>
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Mark

Sorry - I need to retract the above. We did a bit more checking on the s=
pecifics, as my colleague noticed some inconsistencies, and some of the =
offsets used are unique to this platform.

We need more time to check it and get the updated spec from the FW team,=
 But we don't think this patch is correct I'm afraid. We're working on t=
he correct solution.

Can I (belatedly) nack this one please.

Mark
