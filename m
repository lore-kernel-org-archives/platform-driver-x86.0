Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792958211;
	b=vhsL1hF2Pc+zJcVjqHT77dBXuWbF4tGYKeP4npzCeYD3imkM3/sk+YFZgDxBfakn6rI6
	 MbK8pYOREet+YqOuvIfxIFo76GK27UfCOL/6nWnOKo8U2KJvtEE73H0PfA8VzSYut7wxO
	 0LrXWzok/wtfCW/Oh/kKRGPbLbqGL/MakQuA64YtMA5Fs0GjB76Eq789NDVnygJOihkGQ
	 EvAXtKamj2axnAv5GzQiuAw+qdxyHqDwA9L2fYG4xyOWp6BZdf2uT6dpFSXUcSGIk7iqz
	 K26zrn7Zd+ajnGTGY4+ZurFM9STPHS5KZDAC6lo29U7B+R2r8gw/McOWqJTwbR3nhbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792958211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=8E0DR5GD5b4Tk6mwwmmrVFgi2D/bQejxmkS22k9iLko=;
	b=UswS7+gDpyE95EaraT29KKLJYtE/QIkxUK+WwFp3qND/ctqScq39uyo5+L4vm0lZ4z/E
	 fV8WtxPkjKkTWPqsxvh9b60a81ZPQ7INNWTwHZI1b8x+M8JVg2FTCmYVKU8Np3gJ32fIo
	 TLkdLvMFV0EfaaN3lf8M8Wa8uJx0zWWJV/+8uRr6a9keTI9x/fY4a/7TPoZa3Ng25cwo3
	 6yrDUf2ZRlMMsRvnOay8s5iwrz4+aVOFNacnpj0bXUPRW1tleydYZw9x+vMjBVcI/jT7w
	 e/jR7wOvR53mmZuZVMNjaw04yvoVLveIm7yEkZSTd1zmamsSj8nGGuechYIV3qTQlrA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=YhdKt4bL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBAF606A31B
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 19:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBBAF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=YhdKt4bL
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7f84a55cc06so1452413a34.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 12:56:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792958210; cv=none;
        d=google.com; s=arc-20260327;
        b=ZlvTkfGDwHMuZl3u73iEb6AJo6uWFr0tjplYnDsXLkcYRS12YiLRIlXh0Z2pqtmBC6
         6rMtlWrQ33P1yLG98emRNqW2V2Z5qGCTEbYqchq2WRGs3NfJlmF835o5Ko/OoG4cxhNj
         L0ycevpKH8wYllf1uPB8WEU8bYGbaArUJ81+jvGeXzjDs2pdjZaN2f/n9XJXIAKC2z+P
         0xLSNT7780NOZCAtW2/r0PIY60X9nTtrqStkuTZSOst1kG8r1fdcSjWHrRxDsGIJHQnb
         xn7lqRN+rsj3Rk2stct/kJj3YvBP5OQvFrw8NJKFnNZS2A24d6/cAu0eSPpqn22nvXSl
         UauQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8E0DR5GD5b4Tk6mwwmmrVFgi2D/bQejxmkS22k9iLko=;
        fh=I9QuW1LtCdcJS0HDOiA5Y9S3G9LubC3nHP4GJYzQL9I=;
        b=CPgnFpTX9FLwkA+X5RBgVly6iXo0jwJoy1O4mw7ykRV6U47wdSfShojCqf7AQLEmJm
         vy1PFGys4LALmQloU8g9AGkAi927C27LXdayMlNxwpqbGU8AEKal95USMlvtcpbecIH7
         VOsFgdMMw0/U9d9y9atvB0cJKTMjXiq2LLcDM8eHiPaRaDSQZV4KgVrugDj4VQS2o4OA
         9YADTjajSuveqNsgGtibS3orjdeplJdvi/ELV08zAfN4CSc6Tel9IDsjEFG1oQtkvUTn
         kUnIepbHo2St7QACPOfbd3MmtQQKz1p5WmYD21GHPBvblFJE/679xuxiWRc7/wOYH6qe
         nVMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1792958210; x=1793563010; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8E0DR5GD5b4Tk6mwwmmrVFgi2D/bQejxmkS22k9iLko=;
        b=YhdKt4bL8v4zP1AGhP0iULi9UTrUSqvyjN5tn1ng4hnObgq3uo+Rw3NJAnKTMXTMfN
         8SpIr8XbQ3NSePAzmEbVFmBrQsrDZXZ3447Ekrh9ldaoHLXCLHhvQn6QozXDKO98FCwd
         j10UD8lVVhWIPH8wSCJrbak43Pyz3bY1thy54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792958210; x=1793563010;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8E0DR5GD5b4Tk6mwwmmrVFgi2D/bQejxmkS22k9iLko=;
        b=quvWoOS47anGNClIqzNI35EhwoIQx1j2WQx4hHW1faV9ynXc/gFc50BOciCsD39Hb6
         gxzz67B53eWL3aezXZhNx3SO52ph4281+PrcOLNWNbN4LVFrOQ1Afg8CDpYmgH7fxlEJ
         4bfkAaYmU4vB1jxWJc3zXpErFq0d/QTwzs2gl7jKhhe2QYSwc6falps0zLO+gGacfWqj
         Xq597nOAJ8tw5CNGZRpMOJ8QXAQ70v0WQz/RkhXounb0uDLCj7bDQIoMbO1//WSrJFKy
         rF7PYRtA+j9TtAgV7k8XVhW4Pq/Onk49ItXklg6ZiIMVlk+3CD50LcC2DF6x24+x/tRU
         cNuw==
X-Forwarded-Encrypted: i=1; AKwUvBwkrx0Wl672pes6iVqEPhOFaPvz63+2gpM34ZNN/pT86zAANZdKn/QD89MRZ+NBGBoSNH+84fRbvVclaurKksBt180l@vger.kernel.org
X-Gm-Message-State: AFq9FYL93XHOlYyouUeygeUa+IFG8mMaBVPaQlbb/VdHmDr/xJl+Nfl8
	fRzLIZHV3vvik+v9ZaUgWj/PTu7s9jc+oZiG821cjbZPb2Wgdivumjblx5ZQy1/DryKs5UqQUaR
	TE2DAfWx6j3ntn/2cRMKoA6HvmWwimyDsnXluI46tgg==
X-Gm-Gg: AYBFou0z42Zeaui17XKUFphYS/KSLq6zUaj48g6eXiJzz6Ih5dh70X4Hzp2kswgP5qj
	cpeQJz5e5Lzuchz3alHX6HTTXYHNYhFlx6nR+IMMs7xrfCfxdTROLWIgr3QkMnEOqiwz0OBUVRX
	EBhj0epo4Z5/ErlS2uUHHUWLtpg+ycqaGw3UHy5ZusiN69pya7/163mer51lfmv1gXYlkZZvMPn
	T5m5IoReNk4BrwagiGZFNj/0WQ5rlSaglcn3j0HHVfXX7GgMmcW4LVrz7fJmj7HtAp8YkZw1TjX
	fIDu9LFr1XgYN1IZCrCVARk5Yt6NJKhubaiZ+tgXD1UrLD94pwHlSst8lkopHGVNJTXiG1dlTsc
	pGu657A6OCQRZSVyybP9Hr90mOqcdaDwHAtZ+naopA/TFcNS79Nt4HnRpKU/l/fmP0PYzSg==
X-Received: by 2002:a05:6808:1798:b0:55b:f88d:6ebb with SMTP id
 5614622812f47-55c00353f15mr2758966b6e.54.1792958209871; Sun, 25 Oct 2026
 12:56:49 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021123414.25516-1-qby140326@gmail.com>
In-Reply-To: <20261021123414.25516-1-qby140326@gmail.com>
From: Chris Taraszka <chris@miget.com>
Date: Sun, 25 Oct 2026 20:56:38 +0100
X-Gm-Features: AclHuK9IdxE4OYNBcfhIKhKsiyI6PGABjPIR4Vumut9py7mbCOHZDOUuXUD2Vv0
Message-ID: <CAAcRvKPSk5FYzZGkw12cPVGkxWVGFACwRvupBDDNae7B_JwF0A@mail.gmail.com>
Subject: Re: [PATCH v13 0/7] Merge redmi-wmi into bitland-mifs-wmi
To: Mingyou Chen <qby140326@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, Ilya Gladyshev <ilya.gladyshev@linux.dev>, KentoNion <kento@kekto.ru>, 
	platform-driver-x86@vger.kernel.org, ted eric <ericted8810@gmail.com>, 
	Armin Wolf <W_Armin@gmx.de>, linux-kernel@vger.kernel.org, 
	Matias Civadda <matias.civadda2342001@gmail.com>, =?UTF-8?B?6auYIOS/iuaWhw==?= <btx342@gmail.com>, 
	powerfullz <wleizc7319@gmail.com>, =?UTF-8?B?5a2ZIOiqiemTrQ==?= <wolf109909@outlook.com>, 
	=?UTF-8?Q?Milo=C5=A1_Vlku?= <vlku.milos.fun@gmail.com>, Rsplwe <i@rsplwe.com>, 
	Bozhen Peng <bozhenpeng93@gmail.com>, Anton Karasev <uselessfire@gmail.com>, 
	Jame Jao <jaojame6@gmail.com>, Serhiy Shliapuhin <shlyapugin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026, Mingyou Chen wrote:
> Does accept_zero_function still necessary since the driver now permits
> 0x0 function field on SET operations?

Not on the Xiaomi Book Pro 14 (TM2424). With 7/7 every SET succeeds
without it.

I tested the series on that machine (BIOS XMAPT4B0P0A0A), backported to
v7.3, together with the TM2424 entry I just posted on top of it.
Platform profiles, s2idle suspend/resume and the hotkeys, including mic
mute, work, and redmi-wmi is no longer needed.

Tested-by: Chris Taraszka <chris@miget.com>
