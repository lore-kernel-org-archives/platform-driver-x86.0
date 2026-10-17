Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA82D396D28
	for <platform-driver-x86@vger.kernel.org>; Sat, 17 Oct 2026 16:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792255862; cv=pass; b=ncr8QX/jZZoqqV/ycWVHqgE2BaZnQyTePh3HPEl101tRDos/3ED3QEegKzQF9JWyJwgLn5/GPO4iyp0ktrUAb1wLnn3guTVJx5PAgCC5afbWiHsQ+cMdrMxlhLFCfj2jteJ85mbdI1ZI0LCADoI6cMiSL8WJyZd/yY0PS/cbf/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792255862; c=relaxed/simple;
	bh=83M4MyXq/RiRwb7EafWtGjILCKuDrrHlOjHO76QYXVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KOSqqjitqCKGrn/+e6sOpL7lyPs8sS/OzuQJLJt1BK5gPwWmuiAuPxlkGsaXiNGP7O/G+hNzu6/D95lcpgCiCOXIJ/H7Ur6gGbMvn1akb4NndsWWP2OSTVE7tP9Puwq75gqrwdEhfpwwv2ptMK1D9NB1dXGInyqowLYzJEtt5P4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com; spf=pass smtp.mailfrom=miget.com; dkim=pass (1024-bit key) header.d=miget.com header.i=@miget.com header.b=Ni+qlc3z; arc=pass smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=miget.com header.i=@miget.com header.b="Ni+qlc3z"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4b1fcd3b1a9so295256b6e.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 17 Oct 2026 09:51:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792255859; cv=none;
        d=google.com; s=arc-20260327;
        b=XEMVECNUWX9fzBD+zo1jGBp9PzU7FRWEOL6B+LkCCZuw4v7m/qXWNV2k/0Gvu4oJEN
         nAhL6C+i1LUOKI6LASYNTdOEVQXKS5UlN0VY4i+VPXqoMalpdCll2P3hrweEDceYiCun
         PxjUp5GNo4VY28KOxfV7teNoJIkFXZmsIrYH8vqO7c5ccdCRhvNFf9OxUxqtcKi6ja/Y
         BAO9iYgyzM+lu0t4XI+6HuIxCwcf4TA8NVaBBAh7cDSFmT8jh3B7Cn6rr6mfZvxvp9Ud
         YXtGCblzI9Mf6p5T/mzDGCNZh6aKGUOM6PPvqZtqPdJGvaFaKI1UzdhSbPJlagX8SEfT
         YcwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GKwIEygABle0PoeediCGRpNjYYPfEavyPiTjbOeCCEQ=;
        fh=yIo6NE5kmYJnsfIl1FURSDEpaE7SSr9UDN6JIBxcdgk=;
        b=BF+VZ1GW5xQiYHgJ7YfB2zudohxXKcg5rppuUIoTlT4VPoL/3YmJdIKCzghwl6qG1l
         tnJMxy4ZTsjvVYYP3Z96Q0SgRBVo1dERcTtrWcTgVHWYR5+x6aKA6IPF80LTT0VmeMAx
         EId/e7Bs2qccRawDVYPW48W5tOUtAh4c0ISZvwm02LU8U7z6RAGEp5meczS79hpNftNF
         I2J+jjoXNtJAXrTOTMYULDeV3VHdrM1abyuTTcDXCVZV3aIHy3J6+Sbmkxhv9fc5Ddil
         pFJLhqK2FFv8ntEL2AK3tYMNfCRr9zLUkVVZJroI2iAkaTdYja31H1ZJLXhSs+z6GRez
         i0sA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1792255859; x=1792860659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GKwIEygABle0PoeediCGRpNjYYPfEavyPiTjbOeCCEQ=;
        b=Ni+qlc3zmQDStbjlMHwpJD7SvnHg3sGf3VMWeScpMZ/rr55hSzP5u0icxeyF5Mcuqj
         V/bYMHzwlo7r9jLNb6IohdMocKgeX+NUAu0hvF2RPrZKSNZdB2IFbb9MG+m0FgqC3PeC
         rT3NTF6dciH2DMGLgmtcnaGLRA0D5v8bwYflY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255859; x=1792860659;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GKwIEygABle0PoeediCGRpNjYYPfEavyPiTjbOeCCEQ=;
        b=WVTF/HPIFMEfpe5B7GcYDFKD1MAN5iSLUUe6JxEkn/h8PIZrKVaF0dcSAQGdIfs47i
         cC8zubGmlwjkZ4b9isAaoEPKSWM/E2mTVng9BGTzM5ASsqTxqahJHxAaY68F458IzII/
         rzgVHOfwg3o8VteNqZ4fLeeinFU4cKHMZKtGCdfMp9wGqnK0e3my5CcVSESQwDJoV1tL
         3YYzaDEhT/TqutlZ6dBTJijAg1rW4GqdISZ6iYp4Q32emU2oFLHH2KoUSG2FLFefkqJi
         +gIiNEj4ykZ9BSTP84+w/SdsAtMEABC/gAHAcVc/ttp9vC1W3AScZorZD5XuBvhl2xO+
         CiqA==
X-Forwarded-Encrypted: i=1; AKwUvByGEn/hlXic5/zR77fiPSCNYK4gqfJNmWuOBrmmYKz4xxgam7gVF8XT3uWMoWUCcd4bBpjg2wJRsM7CxqX9CBh4LPC9@vger.kernel.org
X-Gm-Message-State: AFq9FYLN8UW668hkU+wQwt5hh/NlKHbwG/w3DorLcb062agmKT5YqF6F
	3v3fIJLz01C9jZ/MIdo8UcNpkuiF9kScej+YiM64w3iciEvnnAkGt1bDaHxZ25kUHXiY2RAS1ls
	LeKRmxKi5g39Oa4UAHF418mZafgHuuc059bQ9cR0ifQ==
X-Gm-Gg: AYBFou36CevJidUoIbEtQcyMTmsWIOTkPWqs8oDAs0ANF1hL4stvKuZQMC91Htnhukn
	p8M+Qlzf2NDbHUubXVmNHQbXY5jkY22MTi5RTw0RclLDsiWvV6Okarm29XXTk/Di4BMCJf9xZLr
	yAcZN4xAKw6gO9WgZ8oVN/MwbfleNDK6oF4UvCUNt/6lXjJvTDpipAuYn11Ay6OmcZHICaqAtP3
	+zvpGwZenmIJN4jecyex4inbHXpxCRQWJC8skkQU3SE6xTZtwWkiOp8Nk7ipavmNfomd8sM1kgZ
	hceNQU8hGLErBDqMVz2emkiXaWCagonSOKyJvdxZJ8YOvXFXyvr7igEtRVOUQ3ezG0y5JHfQKRm
	z+LiRLg81yTbS6A==
X-Received: by 2002:a05:6808:1914:b0:4b3:98f4:f057 with SMTP id
 5614622812f47-53cc3e3c6e2mr2326553b6e.3.1792255859634; Sat, 17 Oct 2026
 09:50:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928153902.139956-1-chris@miget.com> <5430348c-8ff3-c31a-927f-321b2cf94883@linux.intel.com>
 <CAAcRvKNrRMb44p-v0-wiWQx8QiToYyKCoCzXvVku-o0RGTxEgQ@mail.gmail.com> <793647dd-8835-3bb2-88f4-ddc053580bd3@linux.intel.com>
In-Reply-To: <793647dd-8835-3bb2-88f4-ddc053580bd3@linux.intel.com>
From: Chris Taraszka <chris@miget.com>
Date: Sat, 17 Oct 2026 18:50:48 +0200
X-Gm-Features: AclHuK_bS9tpLiMd4Z6l6HJmjTQJsGVwFA9VDFZZuhvba-SDG9oa9QIO2ZPElI8
Message-ID: <CAAcRvKOADz1T_MCv4VB1QxT6uMxmU5Ax7B3HGRYbZ8Ph7+8-rg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: Add Xiaomi Book Pro 14
 platform profile values
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: TuteMthCD <matias.civadda2342001@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Armin Wolf <W_Armin@gmx.de>, Mingyou Chen <qby140326@gmail.com>, kento@kekto.ru
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 12 Oct 2026, Ilpo J=C3=A4rvinen wrote:
> I've not seen v2 so far, has there been some progress with this?
>
> (Not having the generalization seems a blocker adding many models.)

Hi Ilpo,

Sorry for the silence. Mingyou's v12 5/6 ("platform/x86:
bitland-mifs-wmi: Add quirks table") now has the {value, profile}
pair table I described, plus the no_set flag for GET-only values and
accept_zero_function for SET replies without a function id. That
covers what my v2 generic patch would have done, so I won't post a
second one. I'll test v12 on the Xiaomi Book Pro 14 and base the
model entry on top of it.

Mingyou, one issue in v12 5/6, in bitland_mifs_wmi_call():

    memcpy(output->data, payload_data, sizeof(*output->data));

data is u8[28], so this copies a single byte. laptop_hwmon_read()
reads res.data[0..7] for the fan speeds, which would then come from
uninitialized stack. sizeof(output->data) is what you want.

Kento, you're right that the match has to be on board_name TM2424.
Since we have the same machine, let's send a single TM2424 entry. If
you rebase your v2 onto Mingyou's table, I'm fine with it being yours
and I'll test it here on BIOS XMAPT4B0P0909 with accept_zero_function
set.

Matias, sorry for the delay. I think your TM2107 v3 can go on top of
Mingyou's 5/6 directly.

Thanks,
Chris
