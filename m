Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.161.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793008149;
	b=PCzJDAX8XhNYr6fY0LLY3Hmdd7SFOBWvIfjkh1G6ZTANrOvf5xFRDhbYhHhIVDny+XvS
	 RLVLOORgLKE7CRRwS1WHba41nsSbNRGo5tljdCP7W3jtpFcdrc8cHl/QImFvvjfVA20Fy
	 yRc0Pgyy8xaNlnAXFKn1dwXt5hi7BdDNKbgKM0myVbnZ/G/nQKT6sPzA8EYLTbYY29rBN
	 m2tjqEoWG90gM4xMNZtndZ2Db7wMWqL5AfsWYxLaUPz+cVwfgU0/Dv7AhXKOfOD33HGZs
	 KTXVvr7rwEKXyg91T9+IwwsZbypZkm0hdDpjiDLO+zx93I6mgcgNaKVI+Ki6k91KMww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008149;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=FuUzM1WaQyok0e/qkOj26iucNld9X/+5dUm21tLW5Ng=;
	b=NmtgNh9gF4WIJlT4w28h8EixFsse+TxXy0GWxMxTSkD77AssvCf42er3t4m7DBMeDNYn
	 VPzp1KBck25CO5DTeCx68WuD82RqFrWqW/Y1qJbzzzOBerXf08Ug6vTO/47fZgtwNjLw5
	 4INIvAgJdDsXKmS8RYVMs9mzZfxEuS+G/svGygwJzWWRx4/1vadVuDgsW5Yuq16l2N57P
	 vnrBCuboWIweppnvvwPALEKkHVYCoNBKfga+/33PAjLtK5EaXR9tOFcetIsSias57tKDb
	 hCWe55cclg2IpEl/vnpB2POBai85k9OZgOey2OozOEvuM/lw/ruVPKUSa7nkcmlo6Ww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=MFsRk5Mg;
	arc=fail smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1B3606A329
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 09:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE1B3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=MFsRk5Mg
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6aa9606ddadso1932887eaf.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 02:49:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793008148; cv=none;
        d=google.com; s=arc-20260327;
        b=LMlgE6IXB6QJQFaG7goflzD5zpdo7Putqszitr4z7jopW+OCeqcv0e5DBGgrsxR1BE
         98s0urkpF0j35N7DpARfyVYVi3PSVs19SSSp3mCTdcR4DD10yghnhhvJI9vH2gMoIEgv
         F3Vgxc5szfOCCYVVWqRpvw4St573qDbkMGJ6l1hRVeQNj8KCfrNxf5ZNYb7IbHmmUbW5
         sgqAZvWWxbC29MzGl93V7J15geERQFHXkAIJx4jI7MOPLn4DVkrPEaZX5CVIP6ucrNTd
         yaLptUUyQB1s6RxWDJMYOaB68wVmZ8l1gQACQqwLDtNDditt12P/gvBJuWuf0yQLZ1gV
         vsXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FuUzM1WaQyok0e/qkOj26iucNld9X/+5dUm21tLW5Ng=;
        fh=D5RHZ31Br97+l3YS7jI4TT12JMYEZfgY6fukiXixIss=;
        b=PqM9WApeWgdzr/umRkbiYgn2xVer1oYCu5z5mb6+ih09s+NVEkiEjaD51sXLrJifxV
         1c8Ec9BzMBzC4JDve5Tv7tRHvGSM1WziHTbIHZjst3Sn3Wu2YNw5ArU1EjTvHHHUnPqe
         y0dDARdL9agDPKMieGIYM9HRHMrCg0eYcx0Z26UFdEce7PuoZ/h7aFfCafN1zu2Kx2ls
         N1cy+hYvMTF0InabKgiOe6wdcs1r7AfuDtFJIN5DVAyxcEudlVcPJzuteshXYEfo64GP
         KkxmpSLHsKy7dr2t3yLC1sgqD+3KjtXYaSjgSmUdfQXQeorpH0FOg/GeOGuIM1kvsHF2
         L9RA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793008148; x=1793612948; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FuUzM1WaQyok0e/qkOj26iucNld9X/+5dUm21tLW5Ng=;
        b=MFsRk5Mg23obbBNpKJiXdyAqBhEoxn2+qZ/llSvpkFxqxqWje4AigorkPeosfp7DHB
         4us1KTiC3i9s6hUDz8+iipZtIcbNs7qkGMUZBQPZuVqZsrVEOH/et52QW3kqAYlSgNUw
         538/x7biZ8zwMjsgKiaE2MU6cofOUF5kKJc2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008148; x=1793612948;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FuUzM1WaQyok0e/qkOj26iucNld9X/+5dUm21tLW5Ng=;
        b=DzR3i0YdmB+P7lDJnCJwpbp3knb/y61KL3gu57qn2e/jeW2qRSmNo2hSC299nmJQb6
         OwymqV/dvgkMrnO9J7tLbmidb+JG9rp9d5O6sf91FUunslzxP1367ozCWEXWnvqPazCE
         qJm9vlobb5nMNz2tEDo3rML/w4HgzperfwagINPj6LZX9UxXopN8ausBOLeG0XQ7Iztw
         WSBSUs/Q+znjYbja2NV6HgF5vlQoi4vWUthZhnWksMQohNF6w2f3Pe+61QCeMVd6gYgR
         6RjG4g8ScalXWgfBl6u6F74abt1q3iJLQ/EdIbsWgIslV6wpMJXstxUEI6AZEdVuzlOT
         P67Q==
X-Forwarded-Encrypted: i=1; AKwUvBxdcIdWsjqhlNKiKf7SWjAaAINzj7+LH5K/rDx/S/1uKgocXzOpBU092Fi4YSlTgDNsqMdUDs8yxdVhmAF6mnjFlHTe@vger.kernel.org
X-Gm-Message-State: AFq9FYJJAqIife+FWF9BRmLRsFr0fI+l91n95gku93jbK/OYNurwO8eq
	k+h4e9Bc6Jxa3v8jDgqts0QaWU8JYA3GVR2MlpnmKke5RCl1dhhil4qvHSevQIG/tly4SlWBN+i
	cFM76s6iQxoeT5EcFI6mZ0GS86mehoDo+Cpp6tJtpgA==
X-Gm-Gg: AYBFou29ff7NQ3SyyO/MER9bEplxcI1uhAeIXe0oSJsNEeq2X5aoHb+xhB96EgmA7Pu
	sLdxHgf7e/ozwyp8lbx1wrJ34Fy3rSOFP2P7PrlSPYiFV29ZSpUFP+B95/GbWDPI7kXEiKQXyGY
	cT0S3Ai3aw8CMfM4CSG5oD8p+dVU25s0coX9Ekgi82A65INegzkmlRQF0QnWreuXViBdhqauTTG
	sdQg/3s5OOhny47+u7W9/vZvCVOAzIevk0A5itEv8Mxal/aachUYBdDxtx7MibvcANkvcPw8khI
	b8xfE+koD3h/2ZajqNHFdKnMYlxHH74oFfY6/Teigbds4LmWO4dVcG1eg22jV36x8sUICnKeq84
	9XeE6UcxU042CabZnlzUpIVtEG+8JPb17JDJWKcxV24+OPfV8UBL2nLwGKZWPP/9sxCrtZw==
X-Received: by 2002:a05:6820:1393:b0:6f9:59ee:cfb7 with SMTP id
 006d021491bc7-70ba0e6375fmr3568051eaf.23.1793008147879; Mon, 26 Oct 2026
 02:49:07 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025195456.43414-1-chris@miget.com> <20261025195456.43414-3-chris@miget.com>
 <5360953a-ed8a-450b-93c2-f55876af8600@gmail.com>
In-Reply-To: <5360953a-ed8a-450b-93c2-f55876af8600@gmail.com>
From: Chris Taraszka <chris@miget.com>
Date: Mon, 26 Oct 2026 10:48:55 +0100
X-Gm-Features: AclHuK8ozhNoswhNuPdRnKi6YYcff8kxUXP8CRTlrzEGAMZVA7mXrrYS6jcIhps
Message-ID: <CAAcRvKM2CQeJLWDnUhQJ+pKxiduY3XakeBbJCTbnY8=beE5MLw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] platform/x86: bitland-mifs-wmi: Don't fail suspend
 or resume on profile errors
To: Mingyou Chen <qby140326@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ilya Gladyshev <ilya.gladyshev@linux.dev>, Armin Wolf <W_Armin@gmx.de>, KentoNion <kento@kekto.ru>, 
	Matias Civadda <matias.civadda2342001@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026, Mingyou Chen wrote:
> What value does the firmware respond?
>
> This patch fixes the suspend problem, but it hides the real driver
> problem (unsupported profile entry).
>
> I saw 0x04 in your patch "platform/x86: bitland-mifs-wmi: Add Xiaomi
> Book Pro 14 quirk".
>
> If result.data[0] in laptop_profile_get actually equals 0x04, the
> function should be succeed, but it doesn't.

Hi Mingyou,

It does succeed with patch 1. The firmware returns 0x04 (I also read it
back from EC 0x68), and with the TM2424 entry laptop_profile_get() maps
it to performance. Since then the machine has suspended and resumed
several times without the warning.

The test in the notes was run without patch 1 on purpose, on the v13
default table, where 0x04 is not listed. That is the state of every
Bitland machine that has no entry yet: the TM2424 before patch 1, the
TM2107 before Matias' patch, and whatever model comes next. On those,
the aborted suspend is what users hit first. Before I knew the mode
values, logind retried the suspend every 15 seconds with the lid
closed, and the laptop drained about 40 Wh in one night.

> Is there another no_set (for read only) profile entry for the
> performance profile?

No. GET only ever returned 0x02, 0x03, 0x04, 0x09 and 0x0a here, and
all five are in the table.

So patch 2 does not hide a problem on this machine. On a machine
without an entry it keeps suspend working, and the "Failed to save
platform profile" warning still shows that the table needs an entry.

Thanks for the review of patch 1.

Chris
