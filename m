Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.219.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793322163;
	b=ZwK/0+KqIjq/+SGr/JZb9CHivctkthPs6GexCLGFzG2eCn8Lnsdt4veIasGWc0EqIZGM
	 VcTipb1o6zOxGKHl6KLrG258U3QadyMGuZQQbUSYxEQYrrI5YjlbTYHrcdk/Kvy/7FqMq
	 X58dgnNQQbGvsUj1yQ3DoRnBdJCYTeBHFy+pFLr5OySw8QTdhaynebwVrVcKhgBUv0B+q
	 TKN6kBIy7dzLone5ypdl9wdEb+BgtYm5RGCrGGkT8vCGjZlsTuCYIC1T7HTkjuEs8iVuL
	 MTD5qs4CFEZA4jzz9+f0ETDsb6IMRIp2GyYCj7boO4cRQi9JwPKhGmiXXB+cjqokVFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793322163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=SZvmD0cJyfgbDaWm1GDvW29zuwyZyXicGYmT+t5443A=;
	b=zsOklDkrHH46rN8o0d8pP4SDeXqxMMfI08GOjFkHpDnoW6g4RbuOhvsoPu4MAQEe2d5c
	 xcCsiKn4idsuuRw+/xRuVaaosflbM54ATV0ogA6M18fVBoDb2jTjFdnWMthJov8KObLnx
	 Vga8kofHguupNWOBN39oyQj1OV5Tj07NjH+aGA4vgeJ/Aphpl5OqtogSmChycfwUC751c
	 VruC1/F8S2+3JPJRzabVEL333J4ZmXpOTH+QFmbB5mU9h0yKXkozb00QsGiWLki8dAsBz
	 rmzLh0FO758kMUWGf2rGSysnByCPpRpFf5NGpzgRmn9/87JJhC+PrdbRbD/dHfBs7hw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="C3vT/wK1";
	arc=fail smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FA8606A31C
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 Oct 2026 01:02:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11FA8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C3vT/wK1
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91bb5795792so2221626d6.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Oct 2026 18:02:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793322162; cv=none;
        d=google.com; s=arc-20260327;
        b=C1DFkS/8KYODuwObw/3n3BdmKx2BwAtvCpEM5LFwPvvlJ2nj2p660Tp8f35Tve/Ets
         zIhlxouqkraAB5c8V6VkKRogEEoAYsZv4NojUk0RzjJyGKdVTpkTWAGdDu2cWvpforlJ
         E1zm0f9R01+/BljPa4mHnUzpfdbZKMTLXEgxVU/9XeFfuevfnKVU3YV/DgIf3mdQYQE7
         33fvelAboGk632j3ko9IxyCWaBA96rFYttm+9gp2G5iL96AlXK2+XSNtbz9DgxP9YPtd
         KViyNL8e6ISw1778c7JO19qsubhC2F0tBy3ViDK0TAmlkKUOjwoxZ4SmdgfZYfqPKQt0
         VQNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=SZvmD0cJyfgbDaWm1GDvW29zuwyZyXicGYmT+t5443A=;
        fh=TnvhOBgKpbZyQrWZxNOO2pMo4jDVANoDt5b07W2VfOo=;
        b=i6mchZnh7vBWsAwzbujCW7cOA3pN7KMdY8XKuv67aCsMVT0Ab5OA9YopmkdDUPbbwb
         9SbuSp7FaiRPKzxs8oWv/j3ncv/86NKszB72Gxh6TouR3zbh048JEaBzAQKDUlbNUE6h
         hFsN8NWCVyHTkF/n47D6Ztr2nbZAvnKn+jEH1Xd7CVDFEuf2Jv24Jx2ZniNabiy2h6nz
         vMPSbtSBv7ou22R7pjG+7akntOOFjwp/+E1BduJiz4Ts672Nc45IHN/V2RyDIVyroehD
         5MySjiMgClDfcKbVKMtuzJBUSa5j0iDZ5N7qJxUWzSXpkhE/R6j9orIIkUE8csPjOjcH
         A6Dw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793322162; x=1793926962; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SZvmD0cJyfgbDaWm1GDvW29zuwyZyXicGYmT+t5443A=;
        b=C3vT/wK1BPu8PPcF5kTaY8t1PR5lITtEja12EZpSrMn4ii201Xn6Jsa6rG9tyaCco2
         S7VuTWBhvzRWPltnhSWolorueUAWljvs33BbqB5IC2kWaIV4ym07QNLaTuQG2NuoNcHu
         bqi2ZEnXcOIMhbq6jnKVcFq7K42AqzOJ7Zrz9txJiZDx1Cdit1OYTsWopNkYDfUEidFB
         Ox3mMErQ1xXS0xpvtLhPnz2qOfapwCUawautzoLQnfypMUHbxi24n9mwJhx9Y/Eb+zlA
         mYlLGalbLrIdYQ8y/msECJ4wfX4Esb2djfWbqBFo9g8eeiq3sbD4EIyqpx5ReRilnIDd
         Cosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793322162; x=1793926962;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SZvmD0cJyfgbDaWm1GDvW29zuwyZyXicGYmT+t5443A=;
        b=L2BbTtK0xOXNM2McFiXx/QFZDOQC8GCVZPC3uGUCEvsJVu1KTumQt389ihbmYeC+MK
         zNGdmD/+7DUsomZCafEV0m48ZNRsespVtz4cYdBM4aI2UkVe6OkScK2FWGlWz6WOFWUH
         j/R80Ifgiuvp3veBACWTKg0Z7eFZqdcMzx6sC3APgpgB2o1WjyelQn6HVMX9B+QcRbU/
         cHggSGWovVpvaDkpEVqcLdVN/ej96WZ94nevc+ud2os65bz9d0Xl9L3I+7YBEip71/l2
         wVht08p5HIHLdPB84z4q1io8MGWphjBhEVaDkrkJp5CXYjMWNs8Ih7DiPm32x7B9ExB+
         XIgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxc4226zPPnol9Y6wJb7uqtjc57W74TCL1XmRzP10uKP8CMaDk4JvAaiIAsx3iKRqzgojxTcqCMdAND+PWVvG8u0Bxr@vger.kernel.org
X-Gm-Message-State: AFq9FYKfDN5MaWtoQnFxjzvpdKbk1IW8DMYV+/bCXyJS46rapY3nb60N
	2VLYBBB19hKbbWkt+ZaZzSXiAU6Z7yxSKdOeNv9+MYN9Swp80qOViHUPmo/KIzcFsy+TGwXwTl+
	WeB0RoUmBDKkRUPY5GulN5/Iy9GSzPIQ=
X-Gm-Gg: AYBFou22Njwubf+bzWriZtgNAxXqrkS+0jQntObxRdR7NiX11Zl9fzODuQrHEdMGYXG
	vh0zkF/M1EA3AGmNkQlwg4OAqn5tTKX9V5GcxLOx+y8O/BtPTk3zX4xe4RdKLJ+Xf/w7KUI4OGY
	5YnrtIQ9FOhfmfRaT1Qultb4TgCfEZKGj6PPQLNLWzv9Qt1mpgLQW3rDwcSAh2gek49VATwDtsX
	aRVw5dZXc6PRZzYjWb/V5jkZxJZBw7HC8UgXUhQ8qiEMQbmAgO9cXyWIhoathiq4q+EgSHSpSde
	2v1jcahcs2Egoc4RNR6LKsoPjzLJSInxd4Kss4TV9I6P7iX7lgY4dY+RqVtqAF/AUJioE+VgMnl
	/LWr0k+kdKegdjopXfj8m0Wt8Ax6CfEkX9ooRPPyqJ1kNb2XtVch++1Um74XBoUjjsxK0MaY1/i
	1uQl5SgUx8wfNfIGyhxTyDUduxijpW2EvFKJQ6/gyLDGe0D4C1SoGQ93PCK+JhPEcCg8OJ6vr+P
	hYIEG3JzZnvGkZ57tqGwpJG6PIr2gQQf4VU8hbZSAmuvCzY
X-Received: by 2002:ad4:5ca6:0:b0:915:e5c8:5663 with SMTP id
 6a1803df08f44-91ca4a0cfa7mr11886956d6.4.1793322161725; Thu, 29 Oct 2026
 18:02:41 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 29 Oct 2026 22:02:29 -0300
X-Gm-Features: AclHuK9pTotqg-4NXfN0QGNmi4zl63SrTrsIxEaA1R26_yNKaDtcg8Q4fwZl0Kw
Message-ID: <CAMAsx6d68k49rTNqzJwvZxq-+JZnVKGo7oovnhk_49R3JeP_tg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] Documentation/ABI: asus-wmi: document TUF keyboard
 RGB attributes
To: bartualev@gmail.com
Cc: corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev, 
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Oct 2026 02:48:52 +0300, Bartu Alev wrote:

> The kbd_rgb_mode and kbd_rgb_state attributes predate their
> documentation: they were introduced as write-only interfaces and never
> received ABI entries. The readback support now being added makes the
> omission visible, since the read format is part of the interface.
>

Reviewed, no errors as far as I can tell.

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel
