Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512243E2AC1
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 May 2026 12:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779970658; cv=pass; b=KQ6tuKDVP6a2RTYfv857GySYAVieZkyWkrP+k9mP2TQprf9bYhhPIozpKzslpyX/G390KhKlYNvzuD2efx7MhVxe+eQAxPRfBWceB63kAfFzPsuqr/q4Q56dPJ/Yi8MBaEAtNK9rod1DN/KXUc8IE7YZZHMXaeEhJqzQSp2p2xw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779970658; c=relaxed/simple;
	bh=VQtCMLl2Q2W23AXPQ0o5MFN/GHoDjelbhT5c8Y/nw8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aeyv8JuU+4naejEch11RHsET3ZIZpuj2s58qSO5L9dWe10G8XM8GRs1u2/5PeYK8LKVV+lMEbdm1CmKzjvsgZpG1eeJHs27AZuESriE6Jq+e+jlafTMWktTQ/PI4Q9nT1Fny3PN+CwZDUBEbbrt+NL+acplz69avbfuSwkH0e9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HeJBUDFv; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HeJBUDFv"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a8ee4b703fso11732036e87.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 May 2026 05:17:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779970650; cv=none;
        d=google.com; s=arc-20240605;
        b=gK/5w9EP25XjCs0NlS2Zunp0ZxD7EUZQe9PIEpIOqIVpmQSQzd7cZJpC0ZbLObQgXt
         B3pZjjhkE6ZQXJR65+S2W7kQNoPHwbfxGrRVkfstyIM+GT9QLqnPHbdhMFn97VrEl1X9
         T3n6jfdt33z9z0O43NMS9MiywmdkjAVwMDXPYiW90Oqb/iEn2yjl/Dr3tCpM0m65pHAx
         onu2rfQsf90guUrEnSD0uF54qBjmV4bc4wuCyRJ2PpSu9kPNZsxp6qn/ha7HHa8KwX72
         sszznIl0nBHN/AnMZCIecLfb9aAIMZYg+u+ZQCzQcykwngu+oEsSB1l3uFdJ4hZRPQAW
         8LMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cCtpMqw+r4SMF8HeSaJrB+KZ2qkkuG2Zq0ZfkWhKuDk=;
        fh=+CwYhAx5+UnO6Gd9ciQAwiN/+rqAMjmWNO2RuIWdHZE=;
        b=KSu9G9FAlNtS+m2uJuYDM97uqQlai7LOurGnc3PlTVbKTkNWoxKn49FTgnsSccBVUg
         alnj0PjtQcgu0Q4dVYY0C7lNgHYPt7/P7SLRIiEWKWwR/jc1Z6kpowavf5d9dsPrHREc
         ZxH6CJSsjOu3eFH9lW5lHliZYYvz4XvRpd3fRyrjOQo+8fRyC/qblogfAJjplQWOhAB/
         3zhOfa7UzilicJzNg9wdlEsdsYlnPu/gLHQfzwNvAicd/OnxoECQKxLlf4KH7a/cOEtb
         2uLbJjxQdk2L8lSCMj0R+RarVdruPfAIXTmCW6X++tSsS29uOLSaQWP5kOixm1OQ9RIe
         7zfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779970650; x=1780575450; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCtpMqw+r4SMF8HeSaJrB+KZ2qkkuG2Zq0ZfkWhKuDk=;
        b=HeJBUDFvkhaA/VCjngrNyCoIdlhPHv4WpZuZ9mQoHV/pyFgi836HpwPjUKcxH1uzh0
         dQ2QOFCIbRQG2MgAPMbZ5slfsnUaHZQeNHhZYx14E6yzR6rqOcyAkELbDpqRxUKpk3A6
         89UwlvkcTKOYUa0oAHIXYRD9tYoXKjhTYXXG6Qg2pfZvzYA943WtnCQgYSH3vnLgX5OC
         KF2RPmoD49Wow61BJtdfk9WeDkShVdHSCcp3VufaWrZVS171p04gBZ4rpbVxknnWzF4y
         411O+6247LrR6/VIkjunHDrwqAFE8mO9p4nYqiiJSbQVEtA1gvag211Iwiqj1btxlMl1
         WKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779970650; x=1780575450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cCtpMqw+r4SMF8HeSaJrB+KZ2qkkuG2Zq0ZfkWhKuDk=;
        b=lNjwjeih5unQx86rk+SDXU6Y9myI19IfHnMKXSu1vLG7Qs95WRX1z7n6sd+9pcBu68
         URNbT3zeRHlwQsjA023YC67wJVnKJt8hm60esxG4i8gl0D5F9f/6QXT3wSIz92jynB57
         PsuolK4BNVBqhQG8jeT2yBbqCCW3LjRLKa6/u+LGLf3CjEbIhFiD1j5ke3RxvB5h8WJL
         SMhJktWOmp30JzYjQ/tWVfXdoVCDWpV7aq8l31ChxZnroIJPo+gDFa4/JC4MgfNkv9UC
         iYHnH9W+8Z3XO2HthfLteMICgV814z3iqMvMMR+J7d2OMNSTow71obG6XVanq25bBdAu
         fnuw==
X-Forwarded-Encrypted: i=1; AFNElJ92xL+s3dX2hKR37FRjcVfVguKn0HjeVChlwMBvIbKK3rTB94abirSb/tzf9uglKl/ztdQUrV9FBdgnKoXgWxmUDfIT@vger.kernel.org
X-Gm-Message-State: AOJu0YxF4dZ6adj3Dm7gOhfgMvdTvtFcTtQ6ZWbcIjYMSmoGFpc2oJ6d
	ZO7lNggaOpflIU7339qAKuK/OQGK3QkAjHNB3v7J3tZd0Ku2OzB0R2jWqIPij2tM8eDXO8xEgxw
	9VN9NizRhJNMZ6f3oDofrq5TDXujZ/a6dyaAW9Z362g==
X-Gm-Gg: Acq92OEejIFM3exEnqZZ42AHSXbZZuHOILOXFlAJjlx09b6y4ltquBlTWkabiOM7ovR
	3Z4O2ijvJf0NN/5lpCevKprLAXuGQnS6qEWI8wZnrFWd/jGXkkrbO7Nj06JLCSSstpmq4fpUTrS
	W2VVKS73lQHswuLQ4GqpF4XDOaSAlTRpYOBBQmnY5VxeMB58jtYQsqOzJPbnEmf+UgyHk6Ojzo0
	JZEWWkg/XtjkkCB5tPzlxtAG6EtWcyPN6EUnK/Z6vg/H9SWm28YM0e9MZgbup6JUVm/+iIazxpQ
	BX52fVg7YF45n1p0qzr3CCQwv8BJkgn4mlOBOtyCt8B81VPB1KQ=
X-Received: by 2002:a05:6512:2253:b0:5aa:511a:b92f with SMTP id
 2adb3069b0e04-5aa511abb61mr774466e87.0.1779970649977; Thu, 28 May 2026
 05:17:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515145851.318787-1-marco.crivellari@suse.com> <177997028256.9687.17890840058204553699.b4-ty@linux.intel.com>
In-Reply-To: <177997028256.9687.17890840058204553699.b4-ty@linux.intel.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 28 May 2026 14:17:18 +0200
X-Gm-Features: AVHnY4KVj3OxAe4Vx7hUMGLAguHyzXXmgM7zSYL0YQR6C-mjUXb84tVcbQOp-eA
Message-ID: <CAAofZF64bxHuuyzU2s9-G5awJTSkUdBnFaBZNubkX-KWAgWN4w@mail.gmail.com>
Subject: Re: [RFC PATCH] platform/x86: Move delayed work on system_dfl_wq
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 2:11=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
> [...]
>
>
> Thank you for your contribution, it has been applied to my local
> review-ilpo-next branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> local branch there, which might take a while.
>
> The list of commits applied:
> [1/1] platform/x86: Move delayed work on system_dfl_wq
>       commit: 5a3feefbcfa652e65b9259708222dd31d180eb33

Many thanks!

--=20

Marco Crivellari

SUSE Labs
