Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D2F13A25F
	for <platform-driver-x86@vger.kernel.org>; Thu, 31 Oct 2024 10:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730372150; cv=none; b=kHOW0zHTnGfvhiKFB6gnXjJ4lD6quZxbr1mICWUL2WgTHLvdzR0z3py56+2LQXYBSOotTixuJ+Eb47iRCqK+yOHO8O4yGf5nWLWDBGZHxmFSx/Ms7AO3n7ij88z9vyiVgtFZaK0S0ukFDwSR/FFDg0Nmxf97gLw+ArO8AG5rY48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730372150; c=relaxed/simple;
	bh=Y9tHr6QUMGdOZY6JoMrsxciwdOh2To+N+QDE6XUH70Y=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=mXLR0hfF7wV/iebkBgnyDxhSlCAzdimTI1L2eS3dgsXE5EZufq3ATiYCoflfgUFsYKPVdZJpd4mLneu+OWezHRPBww0Qu8LQq0vfyjkNtwlBYKM0nM1IjVXTvhqSSu3MG04o2etcJbuyxiNnUWY7Jv7MhCh1wONgf9u4bamkln0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=UgeBirQh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jIEjKrph; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="UgeBirQh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jIEjKrph"
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id 36887114014A;
	Thu, 31 Oct 2024 06:55:47 -0400 (EDT)
Received: from phl-imap-01 ([10.202.2.91])
  by phl-compute-08.internal (MEProxy); Thu, 31 Oct 2024 06:55:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1730372147;
	 x=1730458547; bh=EN44bblL8GFLPJWVJpFG7c9gLjx7inCz7lcP7dZM2TY=; b=
	UgeBirQhEfLlgVtinw/qhrzx7R9bluCtwI1qQ3gSi6o58aQSC6cW90UP9CUmrddi
	eUxsf5P1XdIQ5LWUDXYjiA8f5jO1R1kUoayilvRpTeUaZ7nMEoxu81QWm4/izsY8
	mo8An8Q06BYToQrviveXORdgXqKKMqglcskktzEitY38XmiK2nlPUX1Ehcdb6nda
	eWklGw/s40Bs3fvG9tbdqeG3zFjWQXPicxPa6pMtrA5RF0wO1EDu+ALqA1QKOCx0
	scqQpL7ttUWJGlaANgwj9teIQ80YdP3+ce7/IsNajFofd3UW3xx9TTlRyN4ISQ1x
	0SOKBku5fYYQi2lHaV7hUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1730372147; x=
	1730458547; bh=EN44bblL8GFLPJWVJpFG7c9gLjx7inCz7lcP7dZM2TY=; b=j
	IEjKrphf5gG6ypNc+heQBMxoQc8smv07Hs1xUVrdYLUg6vpRUJlE9cHRO8/DGwBq
	6wc/J+6DBH8fnnH38DXqI4xzJa45H6Jk8rDGssQjWDks0dbZTdvmtGOgFT+wMBo6
	LjqzeiugG5Zb3K6WAlUpVXJ+rCTZStIdrswxlczYGmyrvoTDGC+S3Ga5sI2WBd90
	CJSU11FY6beefedDfRHf9vs7TGPleeEH/3/jpy7zJW9gfNeNrxLrLkai0HgaZfa/
	geWM+9K5MCfvLe6ktodLDX8HBZhLLinvzJZ1XkyraXYQyTacCUuB2hH3z5pfAxVA
	eIVJ0suhNBvu4GL53wWzQ==
X-ME-Sender: <xms:MmIjZ24k20MXm4FlXGCOxgHrwPegAfgsqtchTsNPLvRA3T68ReabRg>
    <xme:MmIjZ_5yZwgRnybEJ_Xn6EQQF1zRxUzOw3L568jxL3y9VQOgZ-9GYeylUdiLKySdM
    fbW_zoBU1XP-fkyDUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekhedgudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedfnfhukhgvucflohhnvghsfdcuoehluhhkvgeslhhjohhnvghsrdguvg
    hvqeenucggtffrrghtthgvrhhnpeejleegjeekieeluefggeetgfffvdelffeiieejffff
    gedtueduteeufeduvdektdenucffohhmrghinhepvghsphgvfigvsgdrnhgvthenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslhhj
    ohhnvghsrdguvghvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehpvghsphhinhesvghsphgvfigvsgdrnhgvthdprhgtphhtthhopegtohhr
    vghnthhinhdrtghhrghrhiesghhmrghilhdrtghomhdprhgtphhtthhopeifpggrrhhmih
    hnsehgmhigrdguvgdprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeei
    sehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:MmIjZ1eC5MI7WiNzD-NQK_Uy1IE3jGDjgWpky_f-dF6LomL8fo-LMw>
    <xmx:MmIjZzIVfSfkX6mrirjPq9KjEbkQ_D74p0gh0JsO13QJjWh_CEQ2PQ>
    <xmx:MmIjZ6K2qFOEAZqeT7VwoBuzXpCd_KwT3JqFZUwTS3bTLh7dPqtJWw>
    <xmx:MmIjZ0zrKY0cDfkN6MlEHt0f5ifrwp5jqK86RwaZz5pgYeJOLPmhIQ>
    <xmx:M2IjZxU2Y1Kko5rH4zCNtEX6epMBbj6Dd83F_w4mXZlLWhbR_M_ywvy3>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B10713360079; Thu, 31 Oct 2024 06:55:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 31 Oct 2024 11:55:26 +0100
From: "Luke Jones" <luke@ljones.dev>
To: "Armin Wolf" <W_Armin@gmx.de>, "Pau Espin Pedrol" <pespin@espeweb.net>,
 "Corentin Chary" <corentin.chary@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
Message-Id: <542d3ca9-5b63-431e-b711-39f7ab387204@app.fastmail.com>
In-Reply-To: <8cbc8310-7533-40e4-ab2b-b8c3c9e1911e@gmx.de>
References: <54d4860b-ec9c-4992-acf6-db3f90388293@espeweb.net>
 <6131c8e6-5a25-492f-a296-2ed56a9db360@gmx.de>
 <7557c282-2521-40d5-a499-48b260c7db4c@espeweb.net>
 <8cbc8310-7533-40e4-ab2b-b8c3c9e1911e@gmx.de>
Subject: Re: "asus_wmi: Unknown key code 0xcf" when plugging in charger to laptop
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Thu, 31 Oct 2024, at 12:28 AM, Armin Wolf wrote:
> Am 30.10.24 um 22:44 schrieb Pau Espin Pedrol:
>
>> Hi,
>>
>> On 10/30/24 1:06 AM, Armin Wolf wrote:
>>>
>>> can you share the output of "acpidump"?
>>
>>
>> Find it here:
>> https://pespin.espeweb.net/~pespin/tmp/asus_wmi/acpidump.txt.bz2
>>
>>
>> regards,
>>
>> Pau
>>
>>
> Thank you. The event seems to be causes by this piece of AML code:
>
> 	If (ACPS ())
> 	{
> 		ACPF = One
> 		Local0 = 0x58
> 		If (ATKP)
> 		{
> 			^^^^ATKD.IANE (0xCF)
> 		}
> 	}
> 	Else
> 	{
> 		ACPF = Zero
> 		Local0 = 0x57
> 	}
>
> 	Notify (AC0, 0x80) // Status Change
> 	If (ATKP)
> 	{
> 		^^^^ATKD.IANE (Local0)
> 	}
>
> 	Sleep (0x64)
> 	PNOT ()
> 	Sleep (0x0A)
> 	NBAT (0x80)
>
> Since the event codes 0x67/0x58 are used to signal battery/ac mode, i 
> think that the 0xCF event
> might be an alias for event 0x58. Maybe we can just map it as 
> KEY_IGNORE to silence the warning?

Do we know which laptop exactly? The "gamer" laptops along with I think the ProArt ones use an MCU on USB to do keyboard I/O. Others use I2C.

Not all that relevant if all we need to do is ignore the event but there might be something additional in code already that can be used.

> Thanks,
> Armin Wolf
