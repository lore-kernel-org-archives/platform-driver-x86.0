Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A885C1D5174;
	Sat, 26 Sep 2026 15:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790437645; cv=none; b=a7SojYnqGCh+Vu+UQvQWBOzSLK5K9O5KxSImbO4Z/Mksh8AdqXqyzzQscgeOLlumo9QjPcBarCdenR4e/N6UTMN4LjQ2UxrcHPalvdPrE4qG3bbdpWuCic+70/s4ZYCC8FmB2GNzRdihTyzKdzK81FsQj7MR2ikyMyrl5SfTJEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790437645; c=relaxed/simple;
	bh=96eJ9KanZNZE0k2CyXW0j3T2ycbZU3qpH2RXuSI2Mz8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=K3WNbpy5rri40f6PhImmYTtt4AoR9N3iglSiT7YaR1DLmXTjJJHf3XR6l8IPDKU3evXR3+3ourTWyUFB0+kwlq7AldwcgYZATnTWZZ+F2ErhOdYjno3GlZtS1zmDbMcAqfqlRydql8zCuemvV85eBqAn8gGyRiuXkvOw+pdLK9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ggeau+Vj; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ggeau+Vj"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E6E55415AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1790437644; bh=STmWHZz7vbpKy77gQg7vGzia63ag1na+oIEsQzeq5y0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ggeau+VjrDcf3I3V2dTXl6Ckm3+bJQDNz878FhL82fpWjGEerpyOUf7gOP77/eR42
	 DVnkUrTY5xN0J3f3rHsrSWp9iocYUlzWQCJdkCsu8IBIxKn5I33y742lj0O4MJr69S
	 tVQ5Rv60/9kWhUvYGyhQXpXUM0NFammy1KOI/WK2p8MEVKp5SSyGVp6Otau2Jx/6RG
	 AiTu4cPsjbER5vhP/V17DJKCBS2ElcGqGJfYxaaU2z+krJcQZR+PuTL1Qe3TxrEtjC
	 jd+u0vEPKHu4ylhW9Vg4mDchSEmp/osmCSJPhZj98SyyVK/kc7HpMbYbIFvDAKmcL9
	 vNi+eUZ0e1VBg==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E6E55415AB;
	Sat, 26 Sep 2026 15:47:23 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Mark Pearson
 <mpearson-lenovo@squebb.ca>, Hans de Goede <hansg@kernel.org>, Ilpo
 =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, Shuah Khan
 <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: ABI: sysfs-class-firmware-attributes: use literal
 blocks for console commands
In-Reply-To: <20260923024957.845198-1-rdunlap@infradead.org>
References: <20260923024957.845198-1-rdunlap@infradead.org>
Date: Sat, 26 Sep 2026 09:47:23 -0600
Message-ID: <87mrt42ewk.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Randy Dunlap <rdunlap@infradead.org> writes:

> Use a literal block for console I/O so that the lines aren't merged
> together in the produced output.
>
> Also correct some punctuation.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Mark Pearson <mpearson-lenovo@squebb.ca>
> Cc: Hans de Goede <hansg@kernel.org>
> Cc: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Cc: platform-driver-x86@vger.kernel.org
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
>
>  Documentation/ABI/testing/sysfs-class-firmware-attributes |   21 +++++--=
---
>  1 file changed, 12 insertions(+), 9 deletions(-)

Applied, thanks.

jon
