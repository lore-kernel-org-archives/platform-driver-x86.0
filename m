Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793227584;
	b=QvRPBe8CoSPsSn5uV23GztZTgef6f72gXZlXZ/wvk1YNwxhWCQzjG2GypKglvLGZgD9s
	 aTeOVqr3qBllKgg4HjV4ERlEIICgxioEhK0AXM/CDumJ87qRyLIpQ76gnAESXbN3tMlth
	 uD1aQuDVUS7PNhpTWzd4yVh2p76xfJWUbL1EGaj8IKmvMhCM0Ql4D4LZ4SSMhBctDNdPx
	 MCtnndN6K+dJ9nPtQyU+RxFUPkJFzh0tYPjvxbt35ipaa4b1r7QMxPfL+Dvz6Z2eFuMW7
	 8mAF1EU8dMI8mrJ4yyYkioslEUL45BATJrcZwiIf+n6RsBJ8I3fMPkpu2h/btFlVe3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793227584;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=lDvLr9wt3Ne9i0tbH5Y/ikdk4b47mUFiOwr56IpVU+k=;
	b=iDz7qU0JhXtoTwUBuqxM7ELK1jUjrIRagngE5qNDte0ZKqkVwEgADvTILpBTENp4nsTW
	 gYHM+ozjef+BOkGlAO/E6gQJLeNDypbJ8kR947cUkzw4NTAkPBrzMfOUoEX0gz9Mwq1GB
	 MCMfvq0mZyc0I5tsJTs0/VrPw2yVZeYZ/6eBox1Du6+KVbirZt/yTs3PsOahhweDvFwyq
	 TJ+IuHltIfYAElXegm9FGRB37STVIExvQksHgZF8C3j6gtgBvL0v5ZqK1rG3OXJoU7qdm
	 I6h/dV13L2N/wLHEwEShHPIemGtlUVel2X00Xwh9Kwi3riWypyAofdMmCPoAQU/06zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=n0Ah1al+;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA108606A31A;
	Wed, 28 Oct 2026 22:46:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA108606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=n0Ah1al+
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1AC6640917
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1793227583; bh=lDvLr9wt3Ne9i0tbH5Y/ikdk4b47mUFiOwr56IpVU+k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=n0Ah1al+nt2oN1CYuob3LAHg8tKMmbCW15q5Kb/ntRxAoGWplGtr0u2R9dP6lRYiR
	 US3Tk7Rta494az7CF/XV1o0fi/1ZYc6ex+8avHZc3lYuAFmGRCyg1Bbmar5cbth0gb
	 MIwHDjNkw40k4w/IlpTVWxpzqbSchR1gj3IhmyvuieMwybnlayOpd50q4Ug/KEu6kK
	 6sjrO796I7MUe+cgQyHqzg6BmDQTIhiSiaHLY4cnfeSy+oJW9EE0cbV0kNl0R3FCsp
	 7K1aWjjw9Z3m7ma+fbrhDPXY7Whtur4dPFMGw9pJNdRGWE1ew0eQmXB9H8M27Ih61U
	 P8T5zXwz0w0xQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1AC6640917;
	Wed, 28 Oct 2026 22:46:23 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Linus Torvalds <torvalds@linux-foundation.org>, Ilpo =?utf-8?Q?J=C3=A4?=
 =?utf-8?Q?rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86
 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>,
 Andy Shevchenko <andy@kernel.org>, Armin Wolf <W_Armin@gmx.de>
Subject: Re: [GIT PULL] platform-drivers-x86 for v7.4-1
In-Reply-To: <CAHk-=wjsj5evNKrhY-LRARUGYXnNAPqK09GHAEJ9sNLoKn4dyw@mail.gmail.com>
References: <pdx86-pr-20261028113441-148823082@linux.intel.com>
 <CAHk-=wjk2f+Vu656fEa7FOyHHaFe+-M-GEwUQPXykaYoor6A7g@mail.gmail.com>
 <112173bf-15bb-5a6f-e3d9-73c7675de537@linux.intel.com>
 <CAHk-=wjsj5evNKrhY-LRARUGYXnNAPqK09GHAEJ9sNLoKn4dyw@mail.gmail.com>
Date: Wed, 28 Oct 2026 16:46:22 -0600
Message-ID: <878q3ho341.fsf@trenco.lwn.net>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Linus Torvalds <torvalds@linux-foundation.org> writes:

> On Wed, 28 Oct 2026 at 09:26, Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
>>
>> Okay, thanks for the feedback. I'll try to leave more out the next time
>> and/or write it more directly to you specifically.
>
> So yes, it should be to me in the sense that it should explain the
> pull request, but I have actually suggested to people that what they
> should think about as a target audience is something like lwn or
> kernelnewbies or phoronix or similar.

I'd just like to say that the improvement in the merge messages over the
last N years have made the LWN job much easier, and they must be helpful
for anybody else who is wondering what's going on as well.  Thanks to
everybody who puts in that effort!

jon
