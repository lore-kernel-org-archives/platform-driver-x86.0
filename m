Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793039748;
	b=e2EBedQE67WFH0JWvj7Q6vZZH3aaVXNkrIy7PMZXpKliA268/FpisXMsACXymfndWr6z
	 KUz6IEcpBPLTMCiyKs9dF/TVHGb1U1vxdjoBLqB9i5UUW7I4VXh6hCf8LYMyHazl37FMr
	 M2ecUEdCbaLRhGzQkoA86mq6MQELpKIvz8tVccHYixkS3aBuKpXE4fstdsJ/xzPTu/YAa
	 ITd525VRif/X4dR/kP4zhNbUEmclSOYr/CL3jRzMlrQ4Ha/OjdxWtkOV8XU2FKJdY8OHx
	 sn7fMXToIuk8SUPJzgivfu4gQQZA8OZnSEv+oIhoBmopvDcrx5Sb2ROURZj/wfAsW7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=XVqAsV73aHG6/gVakHtHzwu7a/Y3OBtpGyVPADfxORE=;
	b=mkSECkZ6VkLeCGNQ/re/bpFZa/11bXJuU5lTgDCHrP15cwn6IC2dpuHgATMRlzwJZfdX
	 zObo7kQKYJejiaHPdZ2eQrg/hFKPtWNHSDs45OGmJVmhxBY3cAqvfzumHQpoFiBrkyibP
	 uo+Gc5WM4hBQ+Rk0I18mpkSL14KdkDnikPmZIw+yz1lqDm/4dO4KIZ0HvqWiElJkO9bKu
	 YK6fTJKXWZQAxa+OzR13/jT1M+Q7KooBBfzpIULdHUhkKbWOq5ojWUurCueYfWrjcw4Zp
	 hndlh/EwIaL2g4p8jt/bfrLu7UGfSlohtXGyf+im1RUHkuzNIFQbyUTXF7hruceA3fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=nilk.net;
	spf=none smtp.mailfrom=nilk.net;
	dkim=pass header.d=nilk.net header.i=@nilk.net header.a=rsa-sha256 header.s=nilk header.b=pnc9kNMQ;
	arc=none smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7705960A3835
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 18:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7705960A3835
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nilk.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nilk.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=nilk.net header.i=@nilk.net header.a=rsa-sha256 header.s=nilk header.b=pnc9kNMQ
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-48ed0b68895so1743443fac.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 11:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nilk.net; s=nilk; t=1793039747; x=1793644547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XVqAsV73aHG6/gVakHtHzwu7a/Y3OBtpGyVPADfxORE=;
        b=pnc9kNMQDKPRwkmY0TxaZvbOzCJ+DKqkwH5I8WmzVcLd/zWhGjH2JZUTU/tbJLNqC3
         a4eWgblNu3rV+Zske7w9IPb/Hq2poiFlENyf/ydAXqck8ame5LdsMudP0aU2G8S1Ivon
         iiyv1JbvRw/AA8r5yDcgNyT2vRCsGjAeZ/ddM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039747; x=1793644547;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XVqAsV73aHG6/gVakHtHzwu7a/Y3OBtpGyVPADfxORE=;
        b=zSYIoFTYmD1q0ijFrc7mmm/UoTY+6CTZciSTbpkVkRo8HuFKn5O0h+3CU4tSxFSisq
         kRy5NIzbtKxyxaOBaAmWVf71jSSwKPOGJXhR8mNEvbXeKeYjRdi2sjUBAAqyrwpqlV+0
         kTTczllGf65LL91efndLJTOA2d6I5ZlC3kvriL7mOpRRp7q4LdJRC3IjQbsupSfNmc+1
         HZkBxjpbr67l0c+ltKR8UlELcwe2rHubkh21wOtPQIEIZXVC9INNbossgokesKDS7TYc
         SfeTeCInYzlISdFCjQ5/nlrY27k/i/a8Zj9V5Zz6HZe5Q2LbuV4rehYOmivj6vPgLy/7
         mdxA==
X-Forwarded-Encrypted: i=1; AKwUvBy1TOX+CpZiDXL1QontgrWxkwVaOyCkHKUxdimdzC/HJ//w+BOjVTvXCABkraVKXJ5doN1vTwUY/VKhOLhHuo4epTzP@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3aYIDCEkqLVz+3KWZCWolVYgdFKWuHC0X2HmgYQwuE+9RNMuz
	sWpSbaA5vwOsQwem6vdPVyxsDtbGhJNR8Q7EMMIxcnM+y93j675S3qkl8Ov2DSpuAQ==
X-Gm-Gg: AYBFou3JK7iOqrPBSI1fixB8J34VcG71dymYQDxnOR4dzsYUO+IhW98r6KhDuOCkpRb
	KWMh64/lIdhP1SgcZYrRhGOlL/jhIyPHgPeIqvD8CTAunpOzOs4jFbitOSA6E5LlbLZ/wuNay5M
	TKbPE+fG+v89d3drC8FFP1Vk6Ca6rQvsEi8mafPT9mDMK7eTNAApDA6M/unxSWWp4ve8B75YXtt
	YvBVW5KVp5z7+4FI+ejNp9hzdb+5JJ1mOJaFyQm39gNmdAWHGFjPOZewV+bTAsc3FjVIUhlEvje
	yg8JprPsm9sd3oUBIvyO1LaHfO82kH7uKzX/kfRFRmSt8aEVJy8mv0rxKzCFRAYlxcBjP4aJZFK
	BRcFMAICQ3WTFfn2sIQ1zyw9FMfTeFpQnoprQIvEDSsWAkzJxEfpoW+u1354HvXydg49Q1WwIHT
	bjkiOCJAKOvfcPlfwxwJuXKY3HKmEIYx62D1BNAZASN8eVji/f1/Y8Yf1QQKWJo/4P5HijsqrsF
	LdYNux5WsEBtKwWcgeOVpuvtC2mATfA9oBEr7MqsfflrTpOBUM1Dm7Lj29M8QnyIQM9tyL3gIOx
	KKmw3WB9y1yOlqImVGqt9f/+5lrtnHDCgPaojqVQaMtZrfsVWYprbaXYx9YaSR/9dVGlsCV7Gxc
	bTEQpQ+aiYaXHqsdqIH1SMsrdP3RCEXKPm8OeromaZsXxYWqvjM4dAETQVmYzm99Nt+6A1lTF1w
	pJ8/hywTaQeLNe9wNxsfa6jhYtPIuMYWc=
X-Received: by 2002:a05:6870:5b8f:b0:49d:d617:b692 with SMTP id 586e51a60fabf-4a83f670948mr4391982fac.49.1793039747059;
        Mon, 26 Oct 2026 11:35:47 -0700 (PDT)
Received: from [192.168.0.114] ([187.14.251.82])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8431c1f89sm5099015fac.13.2026.10.26.11.35.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:35:46 -0700 (PDT)
Message-ID: <17d6081f-50e2-42b1-831e-34ad02b7240f@nilk.net>
Date: Mon, 26 Oct 2026 12:35:45 -0600
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] surface: aggregator: propagate -EPROBE_DEFER from
 ssam_irq_setup()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Konrad Dybcio <quic_kdybcio@quicinc.com>, Hans de Goede <hansg@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: janussss@163.com, luzmaximilian@gmail.com,
 platform-driver-x86@vger.kernel.org
References: <7d51f80e-9552-957f-f32c-1d608042b647@linux.intel.com>
 <d0bb21cc-6d3c-4526-8204-2511da51a6ac@nilk.net>
 <2faa9857-9d55-a607-bd46-588598b64ca4@linux.intel.com>
Content-Language: en-US
From: Chris Simpson <chris@nilk.net>
In-Reply-To: <2faa9857-9d55-a607-bd46-588598b64ca4@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ilpo,

> Are there some legimate cases where error other than -EDEFER_PROBE should
> end up into this else like it previously did?

Two corrections to my earlier mail first. The Surface Pro 9 here is
Alder Lake (i7-1255U), not Tiger Lake; its GPIO controller, INTC1055,
is handled by pinctrl-tigerlake, which is where my mix-up came from.
And "follows Ilpo's comment" was my misreading of your review: the
gpiod_get_optional() idea was mine, sorry for attributing it to you
(v2's "Suggested by Ilpo" comes from that too).

On the question, I couldn't find such a case:

- DT: microsoft,surface-sam.yaml requires "interrupts" and has
  additionalProperties: false, and the in-tree DTS files
  (sc8280xp-microsoft-arcata, x1e80100-microsoft-romulus,
  x1-microsoft-denali, x1p42100-microsoft-sp12in) all use
  interrupts-extended. So on DT gpiod_get() returns -ENOENT, which
  gpiod_get_optional() turns into NULL, and v2 still takes the
  fwnode_irq_get() path.

- ACPI: fwnode_irq_get() ends up in acpi_irq_get(), which only looks at
  Interrupt()/IRQ() resources, not GpioInt(). On the Pro 9 (UEFI
  22.107.143) the MSHW0084 _CRS has UartSerialBusV2 plus GpioInt and
  GpioIo on pin 174 of INTC1055, and no Interrupt() or IRQ(), and the
  Surface Laptop 4 tables in linux-surface#2219 have the same layout.
  So on these two machines the fallback can only turn -EPROBE_DEFER, or
  a real GPIO error, into -EINVAL; for -EPROBE_DEFER that is the probe
  failure v2 fixes.

What I can't tell is whether Konrad had another case in mind, or whether
some other Surface model has a plain Interrupt() there; I've only looked
at these two. I'm happy to test any variant on the Pro 9. As before, I
did the analysis with Claude Code.

Chris Simpson
