Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972455;
	b=TF24hJtrGSL1hvm1ZIDx7mPohx6G1rR+HtQARjygMUEUpb0chnKjjZJ4KUc+rlgpNfZu
	 BfF9Y1Gmynn1I4xWlBtb84IEStmb6f3QWMvmxZX+26wayAPgJbQgMVl1VffNKrY8P63O0
	 CDKX7U2N3z/o4j0dJNY3sXc+VStpPulrI6lGAEHLvUvp2az4OKuWi2yLmrLrqapsOGtQn
	 oWQq8W1qBEQ8Z/t2zVfQyPn9KGeOTQuuh4WRIcoWecha2fKavK0Y7+qm7/fLExflMpxKe
	 HzHeXO1X1GEn+O8nBiHkVTkI5Dy7UmgxQFJvxFjLtmEqRKKFCr8uri95BOp71uO+Ivg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972455;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:From:To:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-MBO-RS-META:X-MBO-RS-ID;
	bh=7xayycAavZQ24eTSEQUPjsBEzFm7e7VWIjN7qneuw3U=;
	b=t8i1l0wxNTqRl7E+0InlaBbyj8UyzB4RAcQFVdoGq1+qba2b/sZsRGrJ8j3TVAOWn/KA
	 kjhvj1nb0B2uw5vF67FTaGrnSnLC68Q5gswFsI8vhpZqdi929mSqiIJb3zg+uHCtRWslf
	 gI4gXn9uRw6viTsJ5e4LZqXmMTlVekYoCk8S6ojBI/VSlMMeolBW4/l0B3MVpt7vBEyAZ
	 QSflGSyHNuSv0PIwCtGP7r3gO2rf4TznV5tRjuHLCDf8mb6dyfdQxreMQSkMTkSK0KkPf
	 rcRdUKoCQww44vPxdJkojjEh2CCM7bL5g+oa71v0uCRGPOjgD2//Ot1igOP0o7BNDow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=KCkLoC0h;
	arc=none smtp.remote-ip=80.241.56.152
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9832D606A326;
	Fri,  6 Nov 2026 13:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9832D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=KCkLoC0h
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jLgL86mJ7zKnCN;
	Fri, 06 Nov 2026 14:40:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1793972449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7xayycAavZQ24eTSEQUPjsBEzFm7e7VWIjN7qneuw3U=;
	b=KCkLoC0hgzv0vvniCu75dJkNziuk3i55xJu0asn4He9ki1giLHNOhTDDQOif++ACZR0rvm
	1Sc4pd2JhnQbReHD/uxgHJG7ccrL5JWlQNyqJlwudEWDvQGWQ99/N0MsEpSLdtx09RohE0
	ySvmv9e1wsds7lfVcdnMO//imTNrDFiKLkTackngRetLsA5rzeooQm20rrDtVEU4B4mLQs
	yqsBNLOwfQlRi1nwqgA1Ju8wR9NrAkQhKJCQjLmGv3OCDaXpQMbOQhMvVj3ndsQkRBZCNh
	etDSWONdQ+qdAN0oahE0zfwlfF6pumUbXQLoOqdS1jxhbY6BYD/1hcP2Tqlrsw==
Message-ID: <d6d0b957-6af5-4720-8917-ba0117e445ca@mailbox.org>
Date: Fri, 6 Nov 2026 21:40:44 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [BUG] platform/x86: acer-wmi: Nitro ANV15-52 platform_profile WMI
 failure on newer BIOS
From: Nguyen Tri Nghia <nghiant@mailbox.org>
To: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 linux-kernel@vger.kernel.org, jlee@suse.com, hansg@kernel.org
References: <52b51e8a-384b-47a8-856e-5e1e4c98e82e@mailbox.org>
Content-Language: en-US
In-Reply-To: <52b51e8a-384b-47a8-856e-5e1e4c98e82e@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: phzimat4ptry9mkfrzw6o13b43781op3
X-MBO-RS-ID: cafb5d7562261165767

Apologies, adding correct email for the subsystem maintainers.

On 11/6/26 21:18, Nguyen Tri Nghia wrote:
> Hi all,
>
> I have opened a Kernel Bugzilla report with acpi_dump and DMI logs for 
> Acer Nitro ANV15-52 (BIOS 
> v1.53):Link: https://bugzilla.kernel.org/show_bug.cgi?id=222240
>
> Unlike the ANV15-51,loading `acer_wmi` with `predator_v4=1` on the 
> ANV15-52 fails to expose working thermal profiles with `Input/output 
> error`.
>
> Inspecting the DSDT shows that thermal profile transitions on this 
> BIOS are handled via an EC shared-memory window at `0xFE708000` 
> (offset `0x607`) and `\_SB.PC00.LPCB.EC0._Q30`.I have an AI-assissted 
> proof-of-concept using that path in a unofficial kernel module 
> `Linuwu-Sense` (Link: https://github.com/0x7375646F/Linuwu-Sense),and 
> would appreciate any guidance on how this should be handled cleanly in 
> mainline `acer_wmi` module.
>
> Thanks,
> Nguyen Tri Nghia
>
>
