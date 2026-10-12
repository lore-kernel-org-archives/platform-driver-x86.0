Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565E63C060E
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 18:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831424; cv=pass; b=sbsg9r2nnWkXOf93z8zBBVXXZLhtiUmlc+jKvl/n/igxRel61jgEaQ+Ymi0nUkDmcqodAGIxsnwSu2dQ14I6hiGgoB9SK+sD08pi1Dv/OrlJj39w3dpd+CFhIWYvbyitzcAIQV/xcE6tGS+HdRwjNyc83Cqp3h3qWy12D+UqoC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831424; c=relaxed/simple;
	bh=nMkb5bAZ7ybwAbgFArWE6KX2eaNmCxoRO1fDwwh6Qkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l4GyfatC65ObWcNxMjGQ3fjFA4gSrjZJZEJZNVUrvebfZ3WTZId9PxbBvVtOSwOR70HmXL0p4PxgcHCot2mvQmIAmW1i3WG7n1YCOXwPTRxYPAhDri5QdyZCGgMGhbByRt7gq/wYamZXqWYS0FRbsIB5Pv6icZkKdAk6ybWtLmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bxEMn19X; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bxEMn19X"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c31745ad205so687249166b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 11:57:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791831420; cv=none;
        d=google.com; s=arc-20260327;
        b=RwjsXfF+VQBYVA07JiLmyCu/sJLobAIWSh7EAFrkbAtU6/uS7j1/DFmMW98gwye3M+
         Ao9+GRNi4oaNk/xfunGuISoOJL76l7mf491uM3PmUYbKZePrYa+XGZ30EKIswNsK7dOG
         LR+DpYvPjEKuIej+4yc/tMbkd8c+NUcemFu2s7ntnYvJ2qPab/p55eElUbOxGiXKS0Lr
         xX+A48zPhfnksoMK+qZhDuPY2ePlHiiEKnHfcl4mBWMkKn0gCvDwKC5skIob6YRzK1Bt
         5PPtUUYIdSvX6NH6+kLuluz7AFK7h9scCRHIO/VSPCfn1MJjdfin3ZQ7/xmYmkWvB+9i
         JnaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nMkb5bAZ7ybwAbgFArWE6KX2eaNmCxoRO1fDwwh6Qkw=;
        fh=acc5LEEZmMC4IFXvFtNJ5nFY7tspzcc/S7kqS7fxlg8=;
        b=kUw3Hdeta06xXjqM04kzXgSTZCwdqctOLOJGBXmUTYgLv6I7Gnxdn//j4WbEsShL+n
         w6HhshuX79wRYs4vpzUaaEqkrPoDAHAnrBeif5LCrzfj/MO29sL5DMhnyJqz2cfbhmBO
         4NmLR0Y7jQSOpC3KcO7BUAdP8dsnc7vU61zlybHJSvl0AqW9DoSW/EBjWGh8OmLjEKGK
         lwujwBZoK5HAyS1dW/v88MezFwUD0bSjs2hlTKTKEYsUDsgVCqh/G5v0FOoQ+otjBeYq
         /mjuxNNoAhs8h0AiovaxcdXS/GRkYyMBYQ6U1cEirXzXkVLCLmPN/mJbJ1Fs3zJkB9Xq
         v2Og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791831420; x=1792436220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nMkb5bAZ7ybwAbgFArWE6KX2eaNmCxoRO1fDwwh6Qkw=;
        b=bxEMn19XS52JX/QLtpdQJA5Ijg6+QkF0DfUX5HfmJeeEvv7OSmrc8vTQhSozQX8C9S
         dlfMP+XEtzvP06O9OTONNK/TTOKC/zOTdDMhuIn4Mu+1fLYEejJKTdNGHO+B9X3z0PRG
         cX5TyxSobs+n0jq71nx80h3N6zFw+4ZCTqc1FzT8z9mxCYcpEtANTWCgm4F9cGrGB1Up
         3QSkJQNF1uXoaevPsiIVOhfRZL5vH9RE6MRqZ48Isu/xOFtxN2bWWK4ZR1JVM0XaTdtm
         W5fLzrwL79Cq2tE7UtCsE4ww/2g1+EzDPW9ziaixxuKDfx8uZRJS4z7I++VcAfdVNdaR
         hkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791831420; x=1792436220;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nMkb5bAZ7ybwAbgFArWE6KX2eaNmCxoRO1fDwwh6Qkw=;
        b=UMb5x8GGWg19HjTjzE+NkXrKluOPMLoqeDBDVsfelb9/8mRQyn/Lq9gpJnEZ9jY458
         vxzCoM1SK66sQkZXhWOQAO3fIN8qTf7cXWcAhuMzyeB6YraU6XixFIi6/P2hqNnhT54a
         KZRGu5M4932jRvhMIb+CqA/joZ77yEbkyh1dVMrQUWHo7U7Rtb+a9zI4WoTpz2Y8DD6J
         ul5/03gku1HpkoV9OLZCdYHsLWR3prIRWUlnPSwHK+jSeWXMcIUMeLBoGOnAygeVWMJO
         GS3kH+sGw0KmHjEugWKBYNJD3Rx9L+lNr78K55Ng4RYH97a+BIdZsgg3WIFnw88/zabP
         0rKA==
X-Forwarded-Encrypted: i=1; AKwUvBzRZgugIwjkglXHyILe4aeLjezjXyK+8bKJu90C9w//+InsmFMjMhV2tpSIV0Yys2LwrzVw9mXSBrzLQS68Ov62nEVd@vger.kernel.org
X-Gm-Message-State: AFq9FYJud0o8AW58FKXkGRD7c1yRvRs55OvpCJlVblJ2JwqD6qX84Krv
	LzE5hrG0rxmLNBWyTJ9l/syFfy+8qq3KPuTgRIPqEYaDAwkzoHvQnYtjv+rGdUymafAhCqXRMhj
	6cwC7k+QFo+XYMlJQGAqrspNL6mnV5A==
X-Gm-Gg: AYBFou3K78AyMuYOHZVrp4+ZPMwEDY+b7RbSsbMcSHQwrj9rl6CHKDo2sTktsdvh5/w
	3+DgI5V25FLScO0SrXPUuZOjSOCqhJQ1Ddurkx14uwJd6aJx3mKRuA9VfPdD7ZtGVqFNNIj9ard
	bfjs0zu6Naa0aAjwNd6JkH4e23c99XUfpOdnHIFVpqJeXjj+aIEt4IKnxp6Ib21EGbG0ied3c7l
	m6SSJ0Rlb/Y/kG0VbuIaMhQVnCAhHpqFKdg9R3R4T/Swap1oS1tjvY+5KPlZjQyvHVIuWRc7sLG
	dtAF952Ddk3AytGHgrTIX+9qqr+gd1YzzHW6VopjPHajL+hxEtv4gQ==
X-Received: by 2002:a17:907:7b8a:b0:c2e:1e4c:35a0 with SMTP id
 a640c23a62f3a-c31a702fee2mr1083958066b.14.1791831420287; Mon, 12 Oct 2026
 11:57:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251220-surface-sp11-for-next-v5-0-16065bef8ef3@gmail.com>
 <M7kfFb5fz-WB43U_xCUwgxpmBJ4TNdp4jE6yFu6HmemIcDx5tXO6H4xnW_pEQz6DMkKm-3POdB9hIdB092zhGQ==@protonmail.internalid>
 <20251220-surface-sp11-for-next-v5-2-16065bef8ef3@gmail.com>
 <e0e9e690-c56e-4b56-90f9-2af46a7feaf3@nxsw.ie> <20251220-fervent-mamba-of-sunshine-f680a8@quoll>
 <571681d6-67f3-47fe-9a42-dce5aca13c99@oss.qualcomm.com> <6a90eb12-87c7-4942-9f18-6490a91cb0b7@kernel.org>
In-Reply-To: <6a90eb12-87c7-4942-9f18-6490a91cb0b7@kernel.org>
From: =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>
Date: Mon, 12 Oct 2026 20:56:24 +0200
X-Gm-Features: AclHuK8XNRMVa5i_-1gcBHkcX16OiXLgWfJwauZ8ZsGnsvSYHUGeaNp1UtvCa9w
Message-ID: <CA+kEDGEBqMh8X=q54EkQNutxTpqutQ11QdkUr7bvJO8_iFy5JA@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] dt-bindings: wireless: ieee80211: Add
 disable-rfkill property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, "Bryan O'Donoghue" <bod.linux@nxsw.ie>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	ath12k@lists.infradead.org, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	Dale Whinham <daleyo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 12 oct. 2026 =C3=A0 18:53, Krzysztof Kozlowski <krzk@kernel.org> a =
=C3=A9crit :
>
> On 12/10/2026 18:38, Konrad Dybcio wrote:
> > On 12/20/25 10:12 AM, Krzysztof Kozlowski wrote:
> >> On Sat, Dec 20, 2025 at 06:04:00AM +0000, Bryan O'Donoghue wrote:
> >>> On 20/12/2025 00:21, J=C3=A9r=C3=B4me de Bretagne via B4 Relay wrote:
> >>>> From: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> >>>>
> >>>> For some devices, Wi-Fi is entirely hard blocked by default making
> >>>> the Wi-Fi radio unusable, except if rfkill is disabled as expected
> >>>> on those models.
> >
> > [...]
> >
> >>> Is this really a hardware description though ?
> >>>
> >>> Its really more of a logical/functional description. It tells the run=
time
> >>> what todo, not what the hardware is.
> >>>
> >>> You could also have a list of quirks in ath12k for this or have a use=
r-space
> >>> utility look for the appropriate platform device string name and disa=
ble
> >>> rfkill.
> >>>
> >>> I think this logic belongs in drivers/net/wireless/ath/ath12k/ trigge=
ring on
> >>> a compat string.
> >>
> >> This is good point. Either this could be deducible from the compatible
> >> or this should actually describe the hardware and whatever is there
> >> wired/configured, not what OS should do.
> >
> > Sorry for digging up an old thread. The board-compatible change is now
>
> I don't get why exactly the board-compatible option was chosen, except
> of course finding workaround which did not need digging out the root of
> the problem. I suggested the compatible of this device or proper
> hardware description.

Could someone give an example of what a "proper hardware description"
would be in this case, to move the needle a bit? It is quite abstract for m=
e.

I guess this was chosen as a workaround since not having Wi-Fi working
for 10 months has been a major difficulty for some new users trying to
get Linux working on their SP11 / SL7.

I can only talk for my own contribution but in my case I had removed
this patch from the series as I had understood from Mani that the
connector binding would have to get merged first and it was far
from ready at the time.

Thank you,
J=C3=A9r=C3=B4me

> > I think merged into ath12k, but I'm not sure I like that, as now every
> > OS consuming this DT has to carry a table of board compatibles (hence
> > needing updates _every single time_ we want to support a new device),
> > instead of being able to convey the quirk through the property
>
> Best regards,
> Krzysztof
