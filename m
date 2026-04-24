Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF38332916;
	Fri, 24 Apr 2026 08:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777019697; cv=none; b=to8y0ZHHfzh01Xstu2my/tMrO4ovqU8K3xApeju6cz0z51O7biuAp6fRPu5l0D7+tnp69WSMd197J+FO/tfn9c6J8WWJ3Qj9IQyGVrbSw3H7tmGb3A0U2a1mIkixQ+QOxVejl8Jv613Dol4izuKywgJrR7ZGwtLMGN2wcGOVr50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777019697; c=relaxed/simple;
	bh=XhnKeeVSeym/NAMfGCWHzqkr/ICD1UZkDXN+hfUdKDA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=eXjOzvltVKY7FQezPafACCRgcKZcvdSNrJ2U4DCYHK9XfeUv34rpr6xAGu5lYNquShVCfdeHOwbtJxL0AljIQtFOexiK1w2rmDkQmxDcgbXkM2f2r4d9HWNQ/d+C1lnkIL/TP4wumcH7syFQyCgjlW3KRprQbEmaKSsnJMNq+/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=gKiHM973; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=snUajgrX; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="gKiHM973";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="snUajgrX"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 834F31D001E2;
	Fri, 24 Apr 2026 04:34:51 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 24 Apr 2026 04:34:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777019691;
	 x=1777106091; bh=XhnKeeVSeym/NAMfGCWHzqkr/ICD1UZkDXN+hfUdKDA=; b=
	gKiHM9733mCQsGKJMF+pX7LfuV+Sfo9aWZB+IPzZX6f6wxnBQ/C1F7b9FfSi+br4
	vuJciPuULT3Q+XyRG+GHJfg6sMWq08whIDKfEN0bc3MgRgAn6aryY/GvJq19Qi3+
	ipuDy6P/9GZamsrb2NU9kCX5djRcb18/ylK25MKF8X5S+Em8ZIMNMzDJxKx6ZIYX
	ySp/fniRuBsqLdgsqZkL3cINQBQNe9v2QuqOrABE7rFYDjrhCSEiE1/BZqLZDtvx
	+gSY6WM0Ac38iCBauEDh4m0rGQyv24LlTYnc5cmpnbnJuEY6p36DbKu7EOEQ7NZM
	5bIpT7jh/WJ1iyyAPsVyeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1777019691; x=
	1777106091; bh=XhnKeeVSeym/NAMfGCWHzqkr/ICD1UZkDXN+hfUdKDA=; b=s
	nUajgrXC8A+WcZGnvxeA3sXAOx8/LYilyn50n0HPKIrkeyi2qyIYP+1ADtL9KVGI
	Oa97TW7iMdb6X/Z3Ml7lvxnixYRSa3N3YPNVnW3z+DEpcUIuqD9CRGhQ/tGxbBwA
	W9dBYYHy1pM5YI9zgoTSjBVrTMiPCde1zFKwcKuUppJBRZ0EEQnloGi5OiufCGji
	DsfBz8lhVWfyzPUwAKpJ32nObPalJurY+j5b2FGawXSTs1xeJd9CosGhyM8ObyB5
	Kv95iombo4cAHuUf4wrrANnK27pEAawONFHjyF0HVqSROjlf2KFeFeXZW0cxo+3E
	1nyC2IH7+fQ7J0iH4vxTw==
X-ME-Sender: <xms:KyvradoNden4C-P1tcUuHZAqP2pUAp8-5RG5Cnh5UjoseGKr07WDNw>
    <xme:KyvraaeVzz2u6vh5Tn10IKzJF8XicLyjisJ5aJfzmMW50otxNi8M_1YHi-QqtZTkt
    SJy55EHUNQsP5uiQNK6Ooex-AWTPMHzmsifZHK9AzLVlCA9fH77FdI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeileehiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeekvdeuhfeitdeuieejvedtieeijeefleevffefleekieetjeffvdekgfetuefhgfen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghp
    thhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhhohhrshhtvghnrd
    gslhhumheslhhinhhugidruggvvhdprhgtphhtthhopehmrghlrghtthhirgeslhhinhhu
    gidrihhtpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrd
    horhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvg
    hrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Kyvrae13EuZUy53p9ptfOKxZwFQn3Cp9Ao0iEZ2Owu4ef8kz9LGIwQ>
    <xmx:KyvraaBXFKb2owCl1iH0fJcND2MZbWIVDeENZeV0fvRvHj2pzsEM7A>
    <xmx:KyvraSdXHNuy1lMDvxo1VyNL24WlPhlHhFvz2eT9D4wwB7fjADVvKA>
    <xmx:Kyvraf5mw-LpLoLWc6ajJvVoAzZEtyNHJKHe16RjCysJZg_QMIGdlg>
    <xmx:KyvraZkT_beCeXg2kH_GiQ7rB88W2cwNxSu3bU8UgCYowhDG7JEsS7iU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EF357700065; Fri, 24 Apr 2026 04:34:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AY2eugjpOVnk
Date: Fri, 24 Apr 2026 10:34:20 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thorsten Blum" <thorsten.blum@linux.dev>,
 "Mattia Dongili" <malattia@linux.it>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <c81f5117-6fcb-4bcf-a929-135dac68865d@app.fastmail.com>
In-Reply-To: <20260424075755.305770-3-thorsten.blum@linux.dev>
References: <20260424075755.305770-3-thorsten.blum@linux.dev>
Subject: Re: [PATCH] sonypi: use strscpy() in sonypi_acpi_probe
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026, at 09:57, Thorsten Blum wrote:
> strcpy() has been deprecated=C2=B9 because it performs no bounds check=
ing on
> the destination buffer, which can lead to buffer overflows. While the
> current code works correctly, replace strcpy() with the safer strscpy()
> to follow secure coding best practices.
>
> =C2=B9 https://www.kernel.org/doc/html/latest/process/deprecated.html#=
strcpy
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
> Based on linux-next and the new function name sonypi_acpi_probe().

Acked-by: Arnd Bergmann <arnd@arndb.de>
