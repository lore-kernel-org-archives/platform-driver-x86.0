Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793550216;
	b=RUYahWtCBEs+QpCaLMH4A3pz0Y+yguPR+v/QH72H4CDdbysYDrbhb020Gu85lzFN7xG3
	 2Vh3iZIARR3bHpY3DLlpdNJupcbUuStHWYkYV+/sZOwO7KjfD0aeEdA7CA21GSIKq+hMH
	 kxeeUYs3QFQbc1n/2/frOeuW5z+TgrJHlJsbVtnppYxWgCFaRU29fDRzv4RcJNdV48dzX
	 oXPnH/FwgxxzdFSsW3127uOUwwagndRm3U+8CTAH8Man/Gx+iLkrez7HmWuRugCZP1vuR
	 ilLmzaKPcpKPS47YJa90RxIuW04dDZBKYJ65NugysBF/0RSGpWGcBsXLE1kzIuFIprA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793550216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=//BiYczTSqt77P177JXkniyDHFQ+z+V4gCGeruh2sQ0=;
	b=MBZPpo+u0WHYbdyX3zfIrjLy3qbxrWiErKKoW4PIzEHwO7iFednWJ5W9kLO47Q9B23Cl
	 ZmoyoAtXCq/cz90oKYkz/awiVdABDu+wUgRS8sk/2V/+K7Pt9EKWd4ZYFbXotoEniKttb
	 wUa8QF5tQoMApiiGwpatDJ50a0Lg+9wJ4Qcj06GwBZRL0qX1vaO31ZMckngIODMmMHB9H
	 AainmZ3TKHtWl2S7jqrDEymWvDl4D+plb8tVBuv4PAtj1qvwusLk4MUXI1L5UYxpxxsD8
	 U3UpRdIhjduabJpSfhxLSzDZhxaxWsM3GexrFraXZT6T2JC1TEnvu42QNazs8+m8H1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B65606A325
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 16:23:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05B65606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6faddda49e7so1904454eaf.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 01 Nov 2026 08:23:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793550210; cv=none;
        d=google.com; s=arc-20260327;
        b=ZhSCDw73Fy7uSK5BLWLaZd8gbA4Ah3tWSl3DCaSrm8ApFRKa1KaO5hVIG/hSOBnATY
         Jo8kYsCqmnN8TgC9bgbR35QR6ERmsUdKQaePcvLgy0U6KCsowhsB8lQk2kT56/txXTJd
         0++7hFdnn+kgS89Aam8vStGHamZoXznYuDk+IeM6KZlC6mlBGgLBb9euW2uauq3W9aQt
         KnAg5Sebap7nqHebN37wNGZAl+67d8Sw+aX7tegUPomo5v6YpdKCjPI9ecMwcgNoSeQE
         Y+8ZLUmT3htVPE5L0YgoZcsAXyCie9U8TwCZdgp5Z06ijQhMv6KLERXXaMSu+5S9Dzx0
         njQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=//BiYczTSqt77P177JXkniyDHFQ+z+V4gCGeruh2sQ0=;
        fh=5zj63QUxOejMamRPa08zQ7S8zdItOF70oN3UaI2SbtE=;
        b=hEM79V9gkhUL2QhCdT25RmKM70WY3tAj9VdtFF5j2zLFZuFEB6WSqF8NsHqvGou2vN
         lba+SsWS9TWJDo0Tbct9uTZovGzLXiqHVebhFoyoXI4D9ndokyd6ALmr/whFYqCrN86/
         5hxbNNR/wzbQqd/99iQeGAskevvPNURf0npJ4wnyz4th26XvXv4ABbtam9yeTKKmDHeb
         O1UyyvKSkMwIiKcTsjPJTkNAi0+9s0n4f/Bjw/7Q8YarxpgZPQsXpYnAIHJ0Wdz2oLTC
         XSu/kdmG31wBuyzOqRuufUe7fVXJyHEx+5bAgjfmKMtJGl7JU4QKLShCKrBPxhS9B7rV
         tvjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793550210; x=1794155010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=//BiYczTSqt77P177JXkniyDHFQ+z+V4gCGeruh2sQ0=;
        b=IptkT1lCeVEW4GSLktWlzpRHIvYEQzQbHAjdian8+bAtOiw65U/iZe3Zoej2SCZXVF
         tmQTv5OvjQOYs/6Sb95w6uNBdK5tZ1+Ti39et0wcaxN7Scae2mwCI61ti4BHt0/JHY/H
         huek61pbYoOvDx/ODkhZzAtIIiTW9XL4c/TUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793550210; x=1794155010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=//BiYczTSqt77P177JXkniyDHFQ+z+V4gCGeruh2sQ0=;
        b=dCKQzAhbrdiFUehMt5SQMyxvEiyDfO86jtysQyc0zcF0ibtV7RKYXuc89TRm2JCkBQ
         S+Vwn1bUbDnvLyR2XsQ5SrKCg0QZX2aULoOZz3Qchcbj6e+71Ae6FAiAVjnZYi7za8vC
         R8oJXJfBz0ee3JgNLY8gWn8dWEBVeQ6Cd3XUQmaVxAbN0VPAE34kQL4CITpOwNYLxaUQ
         1HYStJGk3z1mmnkyfrj8irOHbuBHQOTb6uEWOZHrwFtwssmySEXXEDdxShkIfK0E6WHE
         MyXygrw1eDI61pHl//VE2xyQpO/tCX6aO+G6GZATXdPHTEu85fSjaYBozJAmO99dn1lm
         uEfA==
X-Forwarded-Encrypted: i=1; AKwUvBy7mF1dF82XMRk9woyL0WhXm25XnAv1XlTcwAq/MnGHFdXExPCWqPC/CegqZyf5EoHtXopQam2RWLEee976+DwgQQu3@vger.kernel.org
X-Gm-Message-State: AFq9FYKAjSPPAWnj1K+ztoNfTW07N51zR0kV6BN5XQmaW269DuJH5PD6
	zVGZoZOKE+We3OUYMg9pMJDUAnBheNLsovkQmXessYy1AHnc1YY3WTG1GAIHr6rsOnHuf44lIlG
	jxB8JpDQ6dxO1apQYyUwu3QgLMwzpHa9e8uOBg1RsHw==
X-Gm-Gg: AYBFou20GE9/3Jksey25QFxxqGjiE70DF1pVltqCaIo4LDFkTQLDMQke1j4vZ8l9i0t
	b3m4uszirMq7/Tl/JG2nTxcu7rkO1tLDkt1zn7hQPJqNj8yNVHpB1NJ1kDri64dA096QYEMrCUz
	+Q5PbWipcFwnbCRrFS+4BcM+H55v2qrhqNW4QV9EzE6ZpcmZmY3uyfW1lPc/0JrlR30o2QqR8/O
	nLRet/8aVEUIkTfjXq09Nzg6s8zN1V1zrhIB6BIejmnYM2VepIgAt0rVZ0CJk40logpj+1HxhX2
	qkHgv+D82AyU7AmHglFKMmjraaZSZhTPBc0HYrdlYLgemuycCvscD+BpOrYC2PH7fIANOw9K0B0
	KLJUo4CY+PfjeIkwbc1+v7zoSCUOlPrLBbXvSgcyEcGF+8pBfUXnK556gVy0ypp6uVb2j9wxfYG
	xKbpZol3sfPtA6xC2V33cRgbiKdg==
X-Received: by 2002:a05:6820:f024:b0:70a:d839:2b4e with SMTP id
 006d021491bc7-714f2885c8bmr4370807eaf.28.1793550209930; Sun, 01 Nov 2026
 08:23:29 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025195456.43414-1-chris@miget.com> <20261101153856.1367825-1-kento@kekto.ru>
In-Reply-To: <20261101153856.1367825-1-kento@kekto.ru>
From: Chris Taraszka <chris@miget.com>
Date: Sun, 1 Nov 2026 17:23:18 +0100
X-Gm-Features: AclHuK95wuYaVs_y70yGzxJna7r1n3cTJpA4sSaZzeYToJAUZISruSrOiT1I-cw
Message-ID: <CAAcRvKOq6C_nWcc1oezzQ1Uima+ehJqDxg7Bf4yhrZ+jheCrrw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] platform/x86: bitland-mifs-wmi: Xiaomi Book Pro 14 support
To: KentoNion <kento@kekto.ru>
Cc: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Armin Wolf <W_Armin@gmx.de>, Mingyou Chen <qby140326@gmail.com>, 
	Ilya Gladyshev <ilya.gladyshev@linux.dev>, Matias Civadda <matias.civadda2342001@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kento,

On Sun, 1 Nov 2026, KentoNion wrote:
> 0x03 is Turbo, not balanced. This board has no
> balanced-performance. 0x09 is the firmware's normal mode.

You are right, thanks. The DTT tables in the firmware's data vault show
the same: on battery 0x03 is Turbo at 50-58 W, and 0x04 has no battery
entry. With v2, balanced on battery ran at 54 W.

v3 maps low-power, balanced and performance to 0x02, 0x09 and 0x04, and
uses 0x03 for performance on battery:
https://lore.kernel.org/all/20261101161814.1325847-1-chris@miget.com/

Thanks,
Chris


On Sun, Nov 1, 2026 at 4:39=E2=80=AFPM KentoNion <kento@kekto.ru> wrote:
>
> Hi Chris,
>
> On Sun, 25 Oct 2026 at 20:54:54 +0100, Chris Taraszka wrote:
> > Kento, if this is a problem on BIOS 0707 or 0A0A, please say so.
>
> Yes. On XMAPT4B0P0707, SET 0x04 is rejected on battery. The supply
> check refuses balanced-performance and performance before the
> firmware is asked, so 0x03 is unreachable on battery as well. On
> XMAPT4B0P0A0A the SET status is success for every write, so that
> status cannot show a rejected mode. Your 0A0A test on AC shows the
> following GET is the value that actually stuck. Keep 0x04 only when
> that GET returns 0x04, and otherwise SET 0x03. The supply check is
> not needed for that.
>
> The map we use on TM2424 is:
>
>   low-power    SET 0x0A
>                GET 0x0A or 0x02
>   balanced     SET 0x09
>   performance  SET 0x04, or 0x03 when the following GET is not 0x04
>                GET 0x04 or 0x03
>
> 0x02 and 0x0A are both about 18 W. 0x0A also dims the panel and the
> keyboard backlight, so that is the low-power write. 0x02 is only a
> read alias. 0x03 is Turbo, not balanced. This board has no
> balanced-performance. 0x09 is the firmware's normal mode.
>
> The quirks entry is the right place for this. I am not sending
> another copy of the patch.
>
> Thanks,
> Kento
