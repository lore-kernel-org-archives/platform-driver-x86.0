Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0F04BA1E8;
	Wed, 30 Sep 2026 12:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790770847; cv=none; b=cbEvw9sEib7MxXjUypYFc9NQne2VI1FlcimhvCr+XnuuFujSfSOgmg8XcPShiZ+IQxGsPYIMlOWOEm5zVrrBlO0BA2akU24juJ2Av+i3N5lFqU3awfDxzeKps3skbxMi3uJwGtpyYo3fwCfZ3cwRWrqZRim0fvCc/deR4THo6bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790770847; c=relaxed/simple;
	bh=xPWlb9ux/cYjWtKyiJ5WnAbadKrX36pazJ71YIh0SKM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=QGrueL1tXuPE+cNFP5NhLCUsIsFieRvIR+Dw+NNItCaLrx1o0DSm2cUDlDZewVZVGaWB26aoRVlIwedRy+NaMU22EBJEtkmfemjkVbXdBr9tT6mR2diT1nls8KXyBUVUrRVA6SIDXqh/8fJrWuBRSsQz9+vLFvl74SE8JbmSosw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=YD0v8PPT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=coXsc16t; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="YD0v8PPT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="coXsc16t"
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 35AF91400228;
	Wed, 30 Sep 2026 08:20:44 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Wed, 30 Sep 2026 08:20:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1790770843;
	 x=1790857243; bh=bWYaoquOn/9BBYkVED9OyBRWS+nCJ92rzvtPiZVSHiI=; b=
	YD0v8PPTFzWy79O/QP5UCYSwrFALzgymUUZ2gg9QcWDiYvUL7PFd0hI829gEj4yY
	5wmUFdlSTp61NiaGTl/QpD3uIjoO/Y0YNQXn61A7nfLDF9W+hQnm1lgL0QTemKBD
	I0tImrSMi50/0t8d3elgEkGiWuJiXHgyvCl1yeDRQnISR076kwQDt7LKtGXoiOJM
	iimDbooZVZIiVSHrkK/07fm7VajqLUlWve08eLDjnqUcPFg7rpBEoqEer3xwus6V
	704phwmVnE4jd34FpAJVmgVn1+UCC3kpdGRipSslFdTk/Zv0lRc3csnrMK4H36sr
	8ga2eHzqv4DJxPSxAv0ozQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790770843; x=
	1790857243; bh=bWYaoquOn/9BBYkVED9OyBRWS+nCJ92rzvtPiZVSHiI=; b=c
	oXsc16tYEFdhmLIceqoNlCqn0eyFPtq/wb6BA0D39XVue6JyxD+9o6TwCgParxga
	onDaVTNsSvgtNJdrVn6Or3aSOrklF0jjSg0Yl45pXxcj70alDBYl5/Lq/7f1QkZH
	646QuL4sl2HXLjL9uudMKhnyRsGrztcAWHo8pQwYQAA0ziJTKaZTeVHs/g8V1yfl
	RKUQlHeGcmarB4kA8ajLyOY+4uaYpd0GJ60JLXT4+oP6vH9z+j4kHKjHLnTTnXIX
	xOMl9bDZCeQLApqiPO6ZxL/xlx64Ep1NWEwsQe8TdZpi0/PsV01VC6J19a2mPHdJ
	S6xgHvsrQwhgfKbirJT6g==
X-ME-Sender: <xms:m_68apWYaFM6MwcpmmuirqRbQDehOkkji6yDmz3xOvaauDM65JMIFQ>
    <xme:m_68akapiTeMMzaaLDumhkQwn6cRJ5AcCFcyu-MSW9trPAS4RjdITLzU1jrtM8MHp
    l3ern379q3bBo6__y-BQUmu7c32IshtY8S0EBkMjaxDzV7C8lsfDaHL>
X-ME-Proxy-Cause: dmFkZTE7mvMhadT6Opvn4HzM2VvwGzpL2hHiBhTVhD6n1WGLOZcvAS/cxlslZ7OJQN3cs6
    nZmIf6nrXPK2RRiWh3czvj2kgv3IF6xkBzx+mtg6lse1c7ObPZ9az9hAqGKJtp42vTX3dP
    DrroDSOF+1m+BTqcKeD9b8TCNQ7tlMtk0RW1wduQRAHuYn6YdDnqCuXr6e25/qFKp8M98h
    x1NBfaRcAlvbR/d2QG50SFnFY74z0zBocNyIiAL8VwJkapq4ABsxtrtIrkB+8A6GmKRiha
    dHY1GQQ1ZB4Og+k6Ky7nDUM0vLAoj9jvChAGx+jG7WjDfEEplhHlBWIV6Xqp3NsRNM5aCv
    atq3S1PxU8Ka7ZDlM6FEU6jXSFZDUADnz2CSLIFLH78BWc1gg9nW13D4oEO6ZmZvlpdaQU
    ZDspu+B9eNiZW2NZiHUXAtX8TGTfu5taDdueXdvVYLydlSgyidUgz/8kMlkHMJlXYxQ8iq
    4Xa3pl2+jR9jPVIA9QttA/6XtqSA9kOGu7xXfiEVLkhh6aS1TY1+9mZLANSUwd2JCIih4B
    U8JQxxV2aoDbq4BreZvZBXGiYGmvmUEWUYkU9Rob/aNyDJp44pBXoRsbWUngW0XtQoIwO4
    ZeZHrVFcvIHrBjmcC0nN+U8VsLyor5IqtMC7K/ufh3SYIdTUmuAG5UKizP7w
X-ME-Proxy: <xmx:m_68ao67dmJIpX9S34nVohAcMwEk54tBSbhR7ZQsg62pF5wruLS7aQ>
    <xmx:m_68asJzxaLlTQAf4CvRngQInXya7cm1dZXTAFpgvPoMuDZwlIOfSw>
    <xmx:m_68aptxLpJ2kmUCstTBPpyWe_VXQF-w9SatvKTOINY2bUtS1kDN4A>
    <xmx:m_68ajIPa6tKAJGvAhYTm7tZY6BesI1u6TtTUgVYGmBrAyohSD9Lrw>
    <xmx:m_68aqLl28G5GKN40PCMzthHDiGA5yqOOT9rhuAQqgK7KRZQctPxo_ga>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 4BAAF2C0006F; Wed, 30 Sep 2026 08:20:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A21iI5Udebv-
Date: Wed, 30 Sep 2026 08:20:23 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hans de Goede" <hansg@kernel.org>, "Huang Wei" <huangwei@kylinos.cn>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org, thisisamirv@gmail.com
Message-Id: <2aa11257-5bef-4739-9994-a511a29b4141@app.fastmail.com>
In-Reply-To: <3d4bb6df-a3db-41a7-a568-b268efaa1c93@app.fastmail.com>
References: <20260918161539.2676619-1-huangwei@kylinos.cn>
 <178975590278.29716.17309474720733695095.b4-ty@b4>
 <3d4bb6df-a3db-41a7-a568-b268efaa1c93@app.fastmail.com>
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: Add X9-14 Gen 1 to non-standard
 thermal/fan quirk tables
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026, at 6:00 PM, Mark Pearson wrote:
> On Fri, Sep 18, 2026, at 2:25 PM, Ilpo J=C3=A4rvinen wrote:
>> On Sat, 19 Sep 2026 00:15:39 +0800, Huang Wei wrote:
>>
>>> The Lenovo ThinkPad X9-14 Gen 1 uses a non-standard Embedded Control=
ler
>>> firmware (ECFW) whose thermal and fan registers are not located at t=
he
>>> classic addresses. On this model the thermal registers sit at 0xA8-0=
xAF /
>>> 0xB8-0xBF and the fan registers use the non-standard offsets, instea=
d of
>>> the legacy 0x78-0x7F / 0xC0-0xC7 (thermal) and 0x2f / 0x84 (fan).
>>>=20
>>> Because the model is not covered by the existing quirk tables, the d=
river
>>> probes the legacy thermal addresses during init, reads back 0x00 from
>>> every register, concludes the EC is "misbehaving" and disables all
>>> thermal sensor access:
>>>=20
>>> [...]
>>
>> Thank you for your contribution, it has been applied to my local
>> review-ilpo-next branch. Note it will show up in the public
>> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
>> local branch there, which might take a while.
>>
>> FYI [if applicable to your patch], as per Linus' policy change, also
>> fixes are mostly routed through for-next unless the fix is for a
>> commit introduced in the most recent cycle or is clearly a regression
>> fix.
>>
>> The list of commits applied:
>> [1/1] platform/x86: thinkpad_acpi: Add X9-14 Gen 1 to non-standard=20
>> thermal/fan quirk tables
>>       commit: bb0f3a5d6b9844b70ad696b9470762028f6d86ec
>>
>> --
>>  i.
>
> Just a note that I have a ticket in to the FW team to confirm this=20
> (LO-4662). This platform was Linux certified so I was a bit puzzled at=20
> it being different, but I think the proposed patch is correct. Just=20
> making sure (and to figure out how we missed it...)
>
> I don't mean to hold up the review - just noting that this is being=20
> verified and confirmed on the Lenovo side for completeness
>
Confirmed that this patch is correct - the X9-14 uses the non-standard i=
mplementation. Thanks for the fix - we should have caught this one :(

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
