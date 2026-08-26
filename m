Received: from mail.kekto.ru (mail.kekto.ru [188.242.149.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DABE41D239;
	Wed, 26 Aug 2026 13:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.242.149.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751257; cv=none; b=raqx3HWWZz7GPMGT/qNLXOuvpaaFr8zUPQ+gQNeNsI8wYX1Ca9/IIkrnJNrYccYKAiQ45isAoUjPzzLD8aaL0EOG05vE3CO95c8vyjs4k11PZk5xkbYx1jr+9mAvh9kpUllN8DrTkD4R0N+lRyah8uIOYjvONsmwmitCiYDud6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751257; c=relaxed/simple;
	bh=wPg52BCKf0oQaRBqHIfc4G2wuj60BiIFAzNo4C3TV1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rfvgTwOmAE9tcESYnKbTLo9A9yMKNz7rskhRzD7/ehbf53WL0mXQ8UNCxF3R5t3fxM9swS444xr1aq0Yx1VE2HgaEIOIg0SHc3tyHW9JZiWi87dyTWctWgT5XupbdBqQUUVpZdWlnsJQiiQO9K2FWQ3okTMYbdWYiqIfX83iUWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kekto.ru; spf=pass smtp.mailfrom=kekto.ru; dkim=pass (2048-bit key) header.d=kekto.ru header.i=@kekto.ru header.b=ud0/aacQ; arc=none smtp.client-ip=188.242.149.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kekto.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kekto.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kekto.ru header.i=@kekto.ru header.b="ud0/aacQ"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D26A2549F;
	Wed, 26 Aug 2026 16:26:37 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kekto.ru; s=dkim;
	t=1787750797; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wPg52BCKf0oQaRBqHIfc4G2wuj60BiIFAzNo4C3TV1g=;
	b=ud0/aacQduxVm+7gChI2CJgu/tHGelPgOr+xBKwAH9eQwgAG421naz3BoNnOP8AaJr8AUi
	oBgXPE85ktGoFy4wPsivt+qXTT8ysPgLrt3RWkYr0eDJjx5i3s+kOHBlFCTw7dtbJGz6GB
	w0Ve/olBiQAkQuhU7DUFWIepVFQNnksJWVgwqSkk2ttcx5XVlvQO0aiHHPX3Ok8toTlgw2
	hZQusJwKLdELfus7SDDdyqtu5PNU5V3qmcF/sgaf202Dkwh+A6y68KQYsQMm9LOeCBSz4L
	2x1VwIUMMR9CpTa/Nj4GL0pX+KDorUheKOgRXyNMG5WGhj+38Zykie1GANXacw==
From: KentoNion <kento@kekto.ru>
To: platform-driver-x86@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Yuming Sun <wolf109909@outlook.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Armin Wolf <W_Armin@gmx.de>,
	Mingyou Chen <qby140326@gmail.com>,
	Gladyshev Ilya <foxido@foxido.dev>,
	linux-kernel@vger.kernel.org,
	Nabil Danial <nabildanial.93@gmail.com>,
	Nika Krasnova <nika@ableh.moe>
Subject: Re: [RESEND PATCH 1/5] platform/x86: bitland-mifs-wmi: validate WMAA status, never abort suspend
Date: Wed, 26 Aug 2026 16:26:38 +0300
Message-ID: <20260826132638.177797-1-kento@kekto.ru>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <bc7a6576-54da-1517-5d0c-adbb3d77fa78@linux.intel.com>
References: <20260728180944.51356-1-wolf109909@outlook.com> <20260728180944.51356-2-wolf109909@outlook.com> <bc7a6576-54da-1517-5d0c-adbb3d77fa78@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Ilpo,

On Mon, Aug 24, 2026 at 18:42:43 +0300, Ilpo Järvinen wrote:
> How about using union inside the struct and a type that annotates the
> endianness + endianness accessor to read it here?

Agreed for a global status-word helper. I did not put that in the
TM2424 follow-up on Mingyou v5. On this SKU SET-accepted is the
operation byte 0x80 (XiControl OutData[1]); packed as a 16-bit word
that is the 0x8000 success value Yuming documented. A union +
get_unaligned_le16() belongs in 1/5 so every WMAA call can share it.

> This code makes no sense to me. laptop_profile_get() can return error
> codes so how come can profile be "valid" in that case?

Also agreed: profile_valid as "get returned 0" is a bad name. I
dropped that pattern from the TM2424 patch and left the v5 suspend
hook unchanged. With the TM2424 GET mapping, cmd 0x08 bytes 0x02/03/04/
09/0A are no longer unmapped, so the existing hook should not abort
sleep on this machine. A never-abort change can still go in 1/5 if
you want it globally, with an explicit ret check rather than a
boolean named "valid".

Thanks,
Kento
