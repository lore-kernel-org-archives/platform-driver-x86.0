Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795039100;
	b=fJQFJ2BLExMOWsh41fdqtm0mFt+8Deq9nVG6mKAzJsVy4SyyVznuxhMg7cHBlYar6ZjE
	 osP2MD3HpjrdyZpVw7yYPACUVycZt5PG0UJaE7JL9HZUA+cSRvoj8MSIVhhDe1TO97TPm
	 FLK+ChOR9OnacHkAKe1aL1qbxR1Is6oZD2TnSISwpXGiCTdhfsNJiqfR/0VzO/tdbgW0z
	 U2pJiSkEdsRQIypulvzArtIUze+Bsj03e4joKhyaIoRcYa6tuyqMQ0DZXJn1QHTExiTyg
	 n1S4WGsPmY07kNE8F3v3mBGkPM6hEaTCuJENUROg4iU2YxodiRKZIbiG8fZrW5t52SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795039100;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=rChBRqqSVBT9e1P75bUhE8ESuw1nkQkXwil9ljzhOmw=;
	b=hf9cIHwlMVA8qqW9pDGAXA22HAaFabUCGt4tL7SGnrFksIHtdjd/NtWL/Ap83vOEt0iv
	 KdOr65MMICpvi6YXHzsG6S/tQOF9X/3VyKX93PHOWV9SrIktVu2Mam4j56Ilhkqq2WmY1
	 yGIxXNQPjtnEG7EdzPe9dYyFcV/PG+Z+1v8hHhZ7EW5h5MAsiAar458LFROg1MrvlShti
	 2NfGo1dDo2iitTpIhGWN3ZJA1MBcUome9/YxJTmlglxuUjLrndMlpLVTnFacWMTaY3Mv1
	 nYyB46U1LKHHRxIxyHhkfIw7dcJe9QafcY6STT3ocRSHrTU/Sn1b2SoziHM6xPfoGjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=VkDexxKW;
	arc=none smtp.remote-ip=185.70.43.16
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDDA606A320;
	Wed, 18 Nov 2026 21:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCDDA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=VkDexxKW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795039098; x=1795298298;
	bh=rChBRqqSVBT9e1P75bUhE8ESuw1nkQkXwil9ljzhOmw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VkDexxKWJMJVnleSYjAEjp9CFgAwAQjVB5mRLnm70v1muEW0lNE/GLnlQwLI/jXtt
	 E96grVy0NAtAzaCrjxGnrdQmjy8f5SDlYausxhjYc+c1DLmgDs81qE7vn+/Fius2Od
	 6+SoAkrCBkDYM+g1/Ajvw43YEw4pgPxSnwXRX1SLCX3AiDcEQ43RLHLKEyavcqVrmh
	 obpvnRROVlaoaJL4E8ueOI9aRnlBEu6NAD1r6YkQZI6QcToOD8uLnKMpjwT7zyKSsu
	 5ppzp8rT2xjlqmn0MUNfderVIMxdM1SVmfY2sz8FUrHidSGANbEf3uFFCLHItSW4vx
	 5sqmpj1TfvCRQ==
Date: Wed, 18 Nov 2026 21:58:14 +0000
To: Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: =?utf-8?Q?Eren_=C3=96zen?= <erenozen@protonmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: huawei-wmi: Set battery charge thresholds through \SBCM
Message-ID: <gR5eRejUrFL8r_avvKgYV4tymr9pYj-ekkfPoBHzguyCAh2rG-LABv8fUn0FjEhllk4xzDNyBE259vwg4vEwTaM6mRM0VoBKNB2lV3c5kNU=@protonmail.com>
In-Reply-To: <20261112-huawei-wmi-charge-mode-v1-1-89974ab1e859@protonmail.com>
References: <20261112-huawei-wmi-charge-mode-v1-1-89974ab1e859@protonmail.com>
Feedback-ID: 19860221:user:proton
X-Pm-Message-ID: 5ffb264db3ceedd8b221e0c3f8f69030ab840d1a
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

Hi Hans, Ilpo,

Gentle ping on this patch. It still  applies cleanly on the current
for-next (9c82959c37bf); huawei-wmi.c hasn't changed since I sent it.

It fixes the charge limit on the MateBook 16 (CREM-WXX9): once GNOME's
"Preserve Battery Health" has been turned off, turning it back on
leaves the EC in its smart-charge mode, and the battery charges past
the end threshold.

Fuwei Xie's RFC v2 [1] also touches huawei_wmi_battery_get(), so the
two patches conflict in three lines there. The fix is to keep my
charge-mode check and Fuwei's huawei_wmi_cmd_min(..., 3) call; with
that, the combined driver builds cleanly with W=3D1. I'm happy to rebase
on top of whichever goes in first, or to send a v2 if anything else
needs changing.

[1] https://lore.kernel.org/all/69C3BBDEF214121E+20261118161311.17252-1-123=
13607@mail.sustech.edu.cn/

Thanks,
Eren

