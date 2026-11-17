Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908549;
	b=JRGyUc9hrMDCsl73aWidolmuJbxRj/p7EcpDFKPuPMlR39tOEXy5t3EshGpRbQvTVvoo
	 KxjjGHInsDRhN3GhYhgxJfuBrz3mtFLZIxr3GYddkiH7pl3I4wHn14Cs11EhXn0Xj7ryg
	 /lhF9P0IOcSY8v0xHoAjraKyatd/U8pjW/88xpQYsj2F54HzUf6v1Bmqct5TMzWkNamG+
	 S6P/Q3J+VIlBtTBb4WNqbWP8K3gVmXs6CYpus3gNdUwATeZB18avPZTZwwfblbBqAxlcD
	 uJaem2CtC//uwwDfKBXIClw1XlQnbZaO0MCOiCdM9SI01glu9IJQ4/N7sQj4xE1ZwHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908549;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=/QfK8etD8mkzYZgvReTst2doUFcuKQeVbkwT3LaG6Tg=;
	b=mro7B+zMaQamXqRUJ/JE7Oiq1JEdse8pUiFfCXuEhLXl+g0FcqGkUZ9mMcl6gO7RiY10
	 0wkxVGwofIZnrcfO7tc5UgAG9JjxU+OCeqB/XEk8kmLUIY2M7HAjVZsnMesR+EvjScRzx
	 4GFfomfpQCYIBo4wwozqbhSErgnqRIP6UVBXePJHQWSYSiX33BLJnJQXMGIa5bgfGm/HI
	 eZmNuNrjb0rat5jlJSKx5dWHXqklqHXuW1/sBwegzHtGcfxogiJtLkf4hGuZO2yb0L2VP
	 PXu4b+kpjk3LGPPpVIaOa2zhDC6uAd9ykSTk7ZpWHUv7ZnckQJub7tx6nx+VlMZxpvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=TIUPSmb4;
	arc=none smtp.remote-ip=109.224.244.116
Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BE2606A329
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 09:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42BE2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=TIUPSmb4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794908547; x=1795167747;
	bh=/QfK8etD8mkzYZgvReTst2doUFcuKQeVbkwT3LaG6Tg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=TIUPSmb4KO4MeYW4DpN7jjSZeo7unSIv2qjqMLrVXFIAtiX9MJ5e8dG7u9T7KUB+k
	 Ef43alqhd0UrIiR8RmTbzp4xOtYrzsqbN1l03y9kwu/1gGpggGYoB5tHlgqeLP6rUM
	 BZCDztEhDi0Ulu9LopDJGcKi9C2O32rxyA3OO6kjdingnsgtE6g8Bsdvg2P8IqnQSK
	 nTIWVGEoBi5oT7e16uBADcFPvu57xonpbR2hUWzJ6E6HwGZ/dVdXjM71rVZyQ5xNbJ
	 y5ULvnvCRHCdhUQ//wx2Ft5+CoQ+aSk/TefrZMDOibnNUZ4V2EEFoOLbt4JcAJ93YA
	 uhgaZuEtX0QQw==
Date: Tue, 17 Nov 2026 09:42:22 +0000
To: Hao Yao <hao.yao@intel.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>, Hans de Goede <hansg@kernel.org>, Daniel Scally <dan.scally@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: int3472: Use actual clock frequency for DSM method
Message-ID: <20261117094217.83041-1-lsa.uz@pm.me>
In-Reply-To: <20261026111012.33347-1-fernandorimoli11@gmail.com>
References: <20251208035122.2147678-1-hao.yao@intel.com> <20261025155048.42957-1-fernandorimoli11@gmail.com> <20261025162614.95385-1-lsa.uz@pm.me> <20261026111012.33347-1-fernandorimoli11@gmail.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 0c4c5f6e791ac21873776b3bd8a084c554e9d09b
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

Hi Hao,

Following up on my offer of 16 October: unless you would rather send it
yourself, I will send v3 after 24 November, based on media-committers
next, with you as the author.

Fernando's results change it a little. The value for 24 MHz depends on
the generation, and coreboot's camera_clock_ctl.asl shows the same split:

  Tiger Lake, Jasper Lake, Alder Lake   one bit, 0 =3D 24 MHz, 1 =3D 19.2 M=
Hz
  Meteor Lake, Panther Lake, Nova Lake  two bits, 3 =3D 24 MHz

The Surface Pro 11 (Lunar Lake) has the second layout, the Surface Pro 9
(Alder Lake) the first. On the first, 3 also sets the enable bit again
when the clock is turned off. So v3 would pick the 24 MHz value by CPU
generation and keep 1 for 19.2 MHz, which is right on both. It would
also have the Fixes tag and your note on 0 and 2 that Ilpo asked for. If
Intel's _DSM documentation says otherwise, I will follow it.

Sergey

