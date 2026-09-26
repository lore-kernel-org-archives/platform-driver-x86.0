Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2082654707A
	for <platform-driver-x86@vger.kernel.org>; Sat, 26 Sep 2026 00:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790382282; cv=pass; b=hQzy/X3ab0mhqOTeFg3I1mic2S6dLgYxZfGn9mTpy8WYBOh4SMRGIvZwP2ImMAeWg6/3jJL7L5jQCsnGTHJvS6F2Wctt8nzGyaEV2ao5Rm9dZ/x1OC8QZJaG3GrLd6v52ZF4AJRYi1TRUR9xYBWtUNVlzn5v0j7di/Mou/doORU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790382282; c=relaxed/simple;
	bh=A0YIxOe8VsMhOPafBAuYw8SEC1RJdFP0d+7LWFZrNj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KEdxxCAn+lxor7T5OFb4K0KNh+lrAvVR3c1b3JQEfH3S6b739rFymL9a/QgyeWcs/0Ij1OzvD5PmEQuxJbR0O6Ca7TD+P5zsAOVgwtU9m3XmofT9rvxrm0EBJor2iIa+6awoM2GhMH0P9UuR9b4t1kDy5w6JmaGhDG9Qdyj+xD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cT1x5JC4; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cT1x5JC4"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9a2b95b72so2471088a12.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 17:24:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790382279; cv=none;
        d=google.com; s=arc-20260327;
        b=LZL2dDEv/WwBXwqTmCGL2LwuLX0WPzupyAn93Al7oWjD++cwrOBzeTC5aCN27NvpJH
         uTHbkEcbvPSvmIcIgihURLDvxrJQ5jg0AEyH6ng0LBTLFSbat/Cvn2NSISZoE0MCWjRX
         ycvah0DgILJydMCjKtyIhtOvpqj6YMaqWZ1pX6HI8M3kG87yRFrqgmd0Q9Y02Jq18teu
         2O1I7ghb5FMqr57jDmU2xjap5odO6O5sPYnmqzoUb7eZ+e+Gt0iOQZjGHEcwxj/nquQE
         Uuk0jr29p8VV/VESMMsaxPB7TXfTD8zk8/FZKakyf0lzn7zMUKuq62tqIbmVJ4PpO5mR
         avlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=A0YIxOe8VsMhOPafBAuYw8SEC1RJdFP0d+7LWFZrNj8=;
        fh=LGJldSNZ8VnMBUB7XxeCE+Dh1EiKDNP/gH2XK4qDM4w=;
        b=eyrAV8hR4Mn75JHjNOrWbFs6U2fq+Snsabloxed7fZ8IP54Xo9KAT9//XjuvQcM97y
         TATOTOjfQVQABwukdS0xvrB10SrH4AbnY3U1YrZGDlDjhe07dlYDk9PqLdqe0HgiLpNb
         uxmsM9XJcro2zdtOfFyyLSEmkihC6Dp7mw7YQhbuSO3LPGbBGmtutTedQ0d5zgWq0yj8
         F+L1Q2DYoD+m5Ovd86rqONs+EhcBIzzfzzEpVcXXIRzPv/b1ryXoOE4GEcPJKk3NSG45
         2/tKF+7dtr9jkk4b1kDNND7HUSrnXeXrxBDlcrk5YCiyEbo0AS6sm1b6VlMHpFzT1Xm0
         6shw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790382279; x=1790987079; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A0YIxOe8VsMhOPafBAuYw8SEC1RJdFP0d+7LWFZrNj8=;
        b=cT1x5JC4Um87x2uo1hZqxVtCEt2m3+uDTKGR4y7hqmzDnbiKMppmLUH2Wx39ppICqf
         WqODtHX4lVirdQrkRovQLsX24ivA/1csE3l6bPTeNLI2juhSdT56mBZwHQBTtrmY1xAE
         hx7xd8bo6rl1R7zpJXFHKqTNMwGPHz/kLuLvF9+m24hWyFAcXbh+H7gLavuHWItjgRom
         V83WzCwAighiPgFJ5yVV6EXfecVQGtgs5QPOXw+H/wgIB54Thstv9tO8KV/J4wO1Io/k
         3/DJCjZfwGwrYYnLFH9kRAyn+oiQFFnw4rJtsqiDvygZZzw4UvjlzlLsJ4zBLLqzzECN
         jnkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790382279; x=1790987079;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=A0YIxOe8VsMhOPafBAuYw8SEC1RJdFP0d+7LWFZrNj8=;
        b=O+BPOLPbYYu9tHDG3IwQ8GFryhXu/+Ap168e2vrrSGbZ6QC6mrDVTOm8P6lsoufZRF
         PLKnzR+O8EUNPwbHDNxtmwIfu2ywq4A5H7vPgoA+Lr1QX9kGPWGiWOxpKUEvenjCd+ks
         GNDRpqxehwqu/5B77vLT/9BGSFZLaTQbFvZ6lsOSMUBz0jI9uoaHpVvESXYOh9FEHww7
         g/mxD+0SUWAnDoc0ixRqNBAPgI2ZEbV5PUkEuQZ9/xPEJCCG2ARJue2nFc5QWEyspjwe
         M9CQ2jgYCx+awz9prdT7tuZ7lbyWMAuxXFqLF88uznhYAgznfBWgfuy4fc6+Z2DWz+3r
         DMIg==
X-Forwarded-Encrypted: i=1; AKwUvBwwHRAjbuTFh8ByuSUbMra6zjSJ3sjJK9GFkkNmQ6MlxPkaNfSAIhNkNqjzu97vcOyjtNBBSjIjBBp3Ri1oEv04TkCL@vger.kernel.org
X-Gm-Message-State: AFuF++mQ3t+3jeGeaauKBldZMAfJ0tgOz3z9YhvxK4532oA8rzdTV23+
	j1ccnZIO3jirdexyo2FUW4wGloHwCtP/391sXez2+m7i0KO9PDcMrK4UDG0tYXJl5DXvG8sgYlQ
	cLOrPTZ30fFlQoXd8hj/BGQQQk49ZHu4=
X-Gm-Gg: AYBFou1CGmoFA4EbkqAYB/jWx+pnXTaDFDDxm6E04YlAlf+ZPfwX9MtF3TJIm/9S22I
	B4nKSOeIjluHjqZ5JgNcJQOP97Kr6AFwN18e5AKFcLnNmvj/UGorxIvVAyOkxjssF0Xl1jmW1Ax
	KQ6cV2ujK9osG+BawIbePlA+iwHlKc2S5znKraeKBGxPQAVZKnHdVXCpCsc1qIxav9mzWWrXrej
	c+hu3mLy639j8DHhRxG05S+zA0xZwf5TeJr5Z+C7QBzHzwGdzv0aPD33D1N09GfTBY34twMXgJF
	93TdeMHiyR75e8s3aQCemJZyFGvBFdpxBKJbcRNda9Mft0t4WuFbbXq0geUDp5SuythRGyR1CXc
	h58QnXcWX3HRH3w==
X-Received: by 2002:a05:6402:28c9:b0:6a9:bb40:6e14 with SMTP id
 4fb4d7f45d1cf-6aac9143fcbmr6336665a12.44.1790382279146; Fri, 25 Sep 2026
 17:24:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925211635.1422516-1-amad3v@gmail.com> <20260925211635.1422516-2-amad3v@gmail.com>
 <00235605-05f0-48e7-8561-486b8ddc9c12@gmx.de>
In-Reply-To: <00235605-05f0-48e7-8561-486b8ddc9c12@gmx.de>
From: Am Dev <amad3v@gmail.com>
Date: Sat, 26 Sep 2026 01:24:28 +0100
X-Gm-Features: AclHuK_DpvgkbQkylfjRzRCGji52vYqlzbXoYUsACw21CI08o7oMUY8JnOnrcRA
Message-ID: <CADfX_O2Q9NEfRcev78jb-BL_vuHZ0eC-W829hkAV65fRto_dwQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] platform/x86: uniwill-laptop: Add PCSpecialist Recoil
 16 AMD
To: Armin Wolf <W_Armin@gmx.de>
Cc: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 26 Sept 2026 at 00:44, Armin Wolf <W_Armin@gmx.de> wrote:
>
> it is to be expected that the EC firmware will emulate a full charge to 100 percent even
> when battery health conservation is enabled. I strongly warn you against enabling the
> charge limit on machines other that Intel NUC-based models because apparently Uniwill
> considers the charge limit feature as a preview on all other models, so accessing it
> might permanently damage you battery!
>
> I suggest you continue to use the battery charge modes.
>
Hi Armin,

thanks for the warning, I did not know that the charge limit is only a
preview feature on these models. I have stopped using it and will switch
to the battery charge modes in v2.

One question: the EC originally had 0 in EC_ADDR_CHARGE_CTRL, and it is
now 100 after I lifted the limit through charge_control_end_threshold.
Is 100 safe to leave, or should it be restored to 0?

Thanks,
Mohamed
