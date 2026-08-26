Received: from mail.kekto.ru (mail.kekto.ru [188.242.149.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2471A2E764D;
	Wed, 26 Aug 2026 13:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.242.149.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750968; cv=none; b=ow37lazQeo7M1dNx8j48Y5uVxu8xDd+6ybxmyb4PFss8Vhkrknkri1itei/8svO/pnBbmHwqKXQTMumYc2udmg378dz3MFTWbzQ/b/H/E1LI7bIV/Mr3+CkwvuL63DO6uCQPvsEClQwip7CQatmiYNM4hArQNDLR5VsVHrhOsII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750968; c=relaxed/simple;
	bh=wPg52BCKf0oQaRBqHIfc4G2wuj60BiIFAzNo4C3TV1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mj+wGrpwfYClbEPDpanm+w1FpwoM0RKYWDvqmKFu6W+6ZtWvBpO0Qs/pxLhFgCjNyTvcGSv+CIlb2MqwY7MWluz3ogYsa7lnxSL7xvc0gFcLRColZClXyQXJavpoenGCBCN+fKT8ZsuudftywsrtbJ2iQYCUaGrMQixk1vQGYg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kekto.ru; spf=pass smtp.mailfrom=kekto.ru; dkim=pass (2048-bit key) header.d=kekto.ru header.i=@kekto.ru header.b=lQAnXua+; arc=none smtp.client-ip=188.242.149.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kekto.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kekto.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kekto.ru header.i=@kekto.ru header.b="lQAnXua+"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7FB42254B9;
	Wed, 26 Aug 2026 16:29:23 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kekto.ru; s=dkim;
	t=1787750963; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wPg52BCKf0oQaRBqHIfc4G2wuj60BiIFAzNo4C3TV1g=;
	b=lQAnXua+rOX7G4HyDpUhw64BdhqE3zL0DGJwQouj5Z9+CK8OKDFw56O979d5BoiZhHDnt6
	6OVu687DePh/1yy5SiRPc+V+dGmcJsyEfIjkOlHqoZyRU1+NCg/kgvDxFPuFZELFuq3pQc
	BibCXewH1gOPWFYSBu6+2I8CqE26u/zMxgRYvft8PfbWfYIykJ9DWj9Td6XEqiqUy0HY53
	LXSD1tMM9l8TH2zVJXv1F7LwERK/YxfqHGM+k5E2MDH/bYUqkywyUZ1ITvBG/UbSNyc7Od
	yf0Dz+noVU3+pZhXfvGASEOea9/Rj4oy0YJxuHOOxk142IpG9Wy5x3vi0iL/LA==
From: KentoNion <kento@kekto.ru>
To: platform-driver-x86@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Armin Wolf <W_Armin@gmx.de>,
	Mingyou Chen <qby140326@gmail.com>,
	Gladyshev Ilya <foxido@foxido.dev>,
	linux-kernel@vger.kernel.org,
	Nabil Danial <nabildanial.93@gmail.com>,
	Nika Krasnova <nika@nikableh.moe>
Subject: Re: [RESEND PATCH 1/5] platform/x86: bitland-mifs-wmi: validate WMAA status, never abort suspend
Date: Wed, 26 Aug 2026 16:29:23 +0300
Message-ID: <20260826132923.179587-1-kento@kekto.ru>
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
