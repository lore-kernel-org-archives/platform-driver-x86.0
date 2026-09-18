Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B496547042;
	Fri, 18 Sep 2026 22:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789768828; cv=none; b=epV9URid/+sLTpwk3w9O+KsCS+a82c6MaMp4GGLqbqAxj8yW0mceEEDudquuMlF9YPFAmmUkn5w26GZMGpM0/WHMt3PWN6oiV/A5S+qn5njkRUIsaJ4bYWbcT1GgDLwtdTarDHOGTjbITQVCGXtTXyvVN8ajVBdEMycaxra+u3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789768828; c=relaxed/simple;
	bh=Y8cclJaKFpvomCN5z5Q6Gp+MgwH67A6budeEqmTrl/E=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ZYid7EISqvzwIZC13kwLq5xtrQqc0L/g/isq4fCx4DJERq/cJJhJKUGwadhnL25AzwEwAKzODw3TztLhfYxpOwAn1MippZtlyyiJddiDLT3zWaqO7UsqNlxSnJdzNIhRFMH7h0fB+4G1TDBeXxRVep4MnU8qUVIfQTGgcoczQns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=L/X80erN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Mepg844v; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="L/X80erN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Mepg844v"
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.stl.internal (Postfix) with ESMTP id 53C521D000E7;
	Fri, 18 Sep 2026 18:00:26 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Fri, 18 Sep 2026 18:00:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1789768826;
	 x=1789855226; bh=EHEZHgGkhEN6E7HVb9enpP5EDm5+fj0ebxeY+O8ZzAg=; b=
	L/X80erNIXhmwzEvEHsv1bHUwjTgBIhdlrJBX3f8z3MAI5hinXeZ9cD8F3DisLJP
	+xzHnFhmLlHtsKpYNPJF5R51mmnxnW2Ig5t2EcAdaosVXuaThUlcfqGBewHPzn91
	9uiJ8NgLCm1XYkDvBQZBXVCyBEGZfxXGI13g1HxtznNBii/72BsAf8DV1hy/wFEo
	hG8GSymrtJmxEDxgUO0kqGY/QmjXrilkDySedznst6Yd+FyVJxQOdiIhyeFspEN5
	XaUanasze+81t98uJV4NdJU9lor9oOWBtxg/1KQ4MStE10iG1pOthH2di0dLAKKz
	Pz2Uzh3xCv5p8tUnj6t/dQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789768826; x=
	1789855226; bh=EHEZHgGkhEN6E7HVb9enpP5EDm5+fj0ebxeY+O8ZzAg=; b=M
	epg844vuaXfTGi8pB+RcKCDfKTR4Jt3AyvfAu5VbQVo1XkuwUx3cc4J3x1BAkvSJ
	UD7fQRMcrjkkqonWQNdXvqni2vLduDxNok4p06fnYqES89xB82gBWN3PYUP3NcmZ
	gPfNR3hwUo8LxJSohCSUX46kthJBZutuO1FctLep4ERCkeTIxlUyR9GwUgNW9mSM
	lA5vRUVoRjMXFkryqsVppRsrEcagrEon6yWKLVsxT45ukOWVq9X9J0A+0r9ehAk9
	5ftt2d2u3dNZMaTI9Ee0ys8qVN8vZnhWldr8W6yF9qdG8jSlVrel5EiH9Od460iG
	1NpoOMdvgGALk0OGu/Rgw==
X-ME-Sender: <xms:ebStahu8X0EmqeNnBXabTxGnhL16Moi6zrDPyAUGy-5eLwtnfuSwuw>
    <xme:ebStalQtNof7qi-fCvDpsunK94w-ANAumCUpyvDN6OYQKSglFo-TjEpP6lXX3clN8
    Q3ipPKnkkJqF2A9AtEnMA9ZuIRvnccYqZaDrC85zPZgYNpUripf5fo>
X-ME-Proxy-Cause: dmFkZTEUpHonM33rB3heRcpgPuYRVPQWxxlT12yxASrb2OBQKeG34i9lT0xvytqrr6DBvm
    Ph/Zs79mlTPFMXc0rmbgqM20dUJfmdFpVkAXNulKRTT/D7j464c5w+pQjJV0lV5k/ciX03
    80rvsqp/88wDm64QFd3cNTC+f8PKO50T39KDeUjDpLzYXd7ttGofnmhCGt2rzx2sRVmm4G
    33sp9dbbDWNjHVpjww36Ob3YlIkYoO6lOullU6hTPtE1ecbJH4LIvC+eagWETXYfI/aCyf
    Q1IDZ3uOtnvlkKB9H+NDCQgw81d/ogwZzaUOI/0HjuuGXBgQ9Qo6f3He6GoQQOXNyEVTBQ
    LKzTqmVmxdF/V6QLsSVtFIUMj8k2Gku6TPYgzSa46NY9i/HbbiKat6eMJYiWXGTUw5BHWQ
    FoPjK+KjmcJc/J1x7WJ7n/dDReO/X6RzbDktYMOuJ3VF0JQCKjudqcWFL1DBWfrV35YP+F
    ZZ5D7BBb19Wm30G6JWCpRdU0am+jQdsVH+HlpOUjmQ2clNsmOWBb5IqiPDdGqw8JmbKlqo
    ITIuFOOPhzypQ+xHbau6yEaS2zBrku1/4DaZSju2KK7j0P0y0O69gTjkeLBBndWcdMHOb7
    oWt0c5UMcqVEUzGYCOcl34eXroTFzgVK+akjPK5flk2SAsWXurbEX3Hcrhcw
X-ME-Proxy: <xmx:ebStajSzcnXEUgrWC_cPtBP2irpAwjMTh_fVBJjE7u1R2Y1j6pj4tg>
    <xmx:ebStanAJlVllxooegqwnD6LXzNiDr4kC12tTmSOkVLmDKFCKiow3iQ>
    <xmx:ebStarGAc8m0j2Jo0yLFbWoLF188kUCc7YKEwI1YknviAa3rCQsZgQ>
    <xmx:ebStapA_qDuKu26ylNvbL-MOaivPmH7zOaZHlAbKiUPjoD3aoqR0qA>
    <xmx:erStal5GkrJooeEDk0RM0Ifn7TMJvJgQOF7HMCvNjsvsDrk73eFojG9E>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id F3F9E2C00067; Fri, 18 Sep 2026 18:00:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A21iI5Udebv-
Date: Fri, 18 Sep 2026 18:00:04 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hans de Goede" <hansg@kernel.org>, "Huang Wei" <huangwei@kylinos.cn>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org, thisisamirv@gmail.com
Message-Id: <3d4bb6df-a3db-41a7-a568-b268efaa1c93@app.fastmail.com>
In-Reply-To: <178975590278.29716.17309474720733695095.b4-ty@b4>
References: <20260918161539.2676619-1-huangwei@kylinos.cn>
 <178975590278.29716.17309474720733695095.b4-ty@b4>
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: Add X9-14 Gen 1 to non-standard
 thermal/fan quirk tables
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026, at 2:25 PM, Ilpo J=C3=A4rvinen wrote:
> On Sat, 19 Sep 2026 00:15:39 +0800, Huang Wei wrote:
>
>> The Lenovo ThinkPad X9-14 Gen 1 uses a non-standard Embedded Controll=
er
>> firmware (ECFW) whose thermal and fan registers are not located at the
>> classic addresses. On this model the thermal registers sit at 0xA8-0x=
AF /
>> 0xB8-0xBF and the fan registers use the non-standard offsets, instead=
 of
>> the legacy 0x78-0x7F / 0xC0-0xC7 (thermal) and 0x2f / 0x84 (fan).
>>=20
>> Because the model is not covered by the existing quirk tables, the dr=
iver
>> probes the legacy thermal addresses during init, reads back 0x00 from
>> every register, concludes the EC is "misbehaving" and disables all
>> thermal sensor access:
>>=20
>> [...]
>
> Thank you for your contribution, it has been applied to my local
> review-ilpo-next branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> local branch there, which might take a while.
>
> FYI [if applicable to your patch], as per Linus' policy change, also
> fixes are mostly routed through for-next unless the fix is for a
> commit introduced in the most recent cycle or is clearly a regression
> fix.
>
> The list of commits applied:
> [1/1] platform/x86: thinkpad_acpi: Add X9-14 Gen 1 to non-standard=20
> thermal/fan quirk tables
>       commit: bb0f3a5d6b9844b70ad696b9470762028f6d86ec
>
> --
>  i.

Just a note that I have a ticket in to the FW team to confirm this (LO-4=
662). This platform was Linux certified so I was a bit puzzled at it bei=
ng different, but I think the proposed patch is correct. Just making sur=
e (and to figure out how we missed it...)

I don't mean to hold up the review - just noting that this is being veri=
fied and confirmed on the Lenovo side for completeness

Mark
