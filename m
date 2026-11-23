Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795416477;
	b=Rb1myc4emZtY4EwpH2Mn0Q9RvgP3jE9OOm8Y7Iq4r8jyPBGNY30Wsov2wO2dP6Eyn1dj
	 iygKvgT0gAuIrO4sh7LcYkBuDtRl/CDR73SEcJ5/FH07HLndpKcUlAozQIpEsfl+5qYJN
	 Bm3w7+pfLCdSB772Um/d0/et3JxSDvRv5lR1daBnSKLMtZSrxGZnBx5Ypii42W31b+jN1
	 bpKrpiW/jdh/vZJySqObZwl+d1UWQE18ddz+TkcfQd6R9HkVtEUoFZVDVfMLUxu4wRTVC
	 UtscPjL9RBi6QUIQ1biyBWinaVtDqyPI4OAy7rE8WUzPLvgCIiQK90Zul5wf9cXSY0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795416477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=MpdWRQGt7FrCuyLLRBTmUxjIIESLmxZZy2MLy3uKw7k=;
	b=XeYm3N3Wmtm75LRLuSfAq1LgLB9FI0wV5gAMjlk7Okmb4k4EKgWy0JPdn3AUiM0VBa6R
	 ncW01Uir3jUsxFUxqeGhQBAAxxv71EvrWkxlEx2hs4KtBj978Dq2+liyjEjb7sI9ZyU2G
	 bSXP9PFPdBLqVsebJsbvj6gGRyWDDig64XsjwrwwslnuOdhW3kJgXnL0NBDViqjjjL/Vc
	 cmGksC0hizI47+nOzk7Zcm4jLTS3qaodZg9NTyz0O8qFs7WHhmIQKGXRhM3u1IaWh+isU
	 VNsl+snPbPmLxABoJhZCxK0Qj+/qBccg8LzIWTCUrLEPuixvkbCti6rXc0kfs1rECeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sui00Ob7;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 5297E606A32A
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 06:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5297E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sui00Ob7
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so1533323b3a.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 22 Nov 2026 22:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795416475; x=1796021275; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MpdWRQGt7FrCuyLLRBTmUxjIIESLmxZZy2MLy3uKw7k=;
        b=sui00Ob749YP/4E0URw2ubSzDUQP9KyBjfsmmDw9AzxIDxTYS6M49S1JibeFvPEBVc
         qxmPMlLkjqeHtjjaN7HvIH7fHwsh4z3btvPa519DONCM3a8F31p3NAmeMGSbIBAqhVXw
         5txmr4OBG91xAg91dxl180zBYNgs2sAiXvTgDE7cFJeajijmCEsby493dgeu2NU9qZIe
         AOvHl8i6VREYiO1AJs8bd9Y+u3Wd8mtajSfG6AMj9CMP8bF0uqYgd4Y9TA7w5AXW8uDK
         YQ+QuR6/yknUWT84taqMCfSyX7b6XxC7IIgRv2PGwskSgwLDtlasV+5SLJy7c7g+qSd2
         P3Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795416476; x=1796021276;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MpdWRQGt7FrCuyLLRBTmUxjIIESLmxZZy2MLy3uKw7k=;
        b=Rz3AatEGr+djKIZMt5dzVtIRmP7HT5w+Z+S0sG14Gvl/BSDBzJBVbZazYbLEYLzHHy
         bYLKDp5YFYGy5ZZKOB9NSS7N5mUsPDmEXmulPFKzpXWu7qXUz0Z7TK3O2XRZnMaXi0x6
         qhkMfFQ3QDEFxw3iCe9EK9/P2y5s1fizhOxEZzeubBWk/hU8xHocmX7bYxTCPjGLlRSm
         ldzqnZT1qUIEEj0AgVqbJOYa4nLLXIhT7vXh3V/JaaNkQUzM32iW3AiMaRm+rXpgkmZX
         L/FBVPROZKP81UHdQV5zyQLJmwHCeM2dwZrpfFtSHDyy61G2CmruwMqd3N3xhZQsDLKx
         JMKA==
X-Forwarded-Encrypted: i=1; AL+hErHNrDUBaKVfS+YBGkHgV5qG7XpbkU9JDEzM/Up4PUUCNZheuMT156eZMlm2xNzTC1u4y0C++sw0VAnR+2hTE1iSwsfw@vger.kernel.org
X-Gm-Message-State: APuU4Z+YL6xn+1Y8hwadr2FcEM8P658U4Vt0LW8Ce/nhDYbLqy7q3NL7
	2QqGvytADvNN1w9uLAVTOZYZcHEGtQgwBrwQKJG6oq4bREhrcYirmO3x
X-Gm-Gg: AZFdTZcJ7EMNL8EajLKyUVgpF+oDD8UVSPCJ8v3ZAvHZpg4cYrNZDEh1iBBkvb6Ct17
	u6dyI2doa26+Bdv86k1rzNlUzXBjDfUiaACxUhlDrNHA81JJoesLbfIJGujG13pEEIBtna7AKUW
	lOp+VQ7hWFWlbdrEBUo2gu0fx5hrS0yhUywQBHKbBVtjczVqfz9R/UKspSCJlfiPCpaEYAxSlpT
	53ieGLmBgwkdfQ8bLTzrNbPMbrkQgP/m6DvgM8nyCr1m/HxYeXNBowVwYar4BvfcMujPPg7rsaL
	ivI7Yna1s86GBgTdSdfbJ9goqGwqg582UBWUo4MrEpWvs7DzwPzRjfOf5MqHyn4smKGNuMXxc1R
	oj7sPglBpNRP9CgYbs5EVz5PejmNYQMnz2L2h9NL98jHhAJyAs9oHkrGIgjbb1gbyEJMLkYMI3V
	7DCFqxhuK9hyMPcpgMfDEOrrbITCxvijC7RJi/unUkX7XtKKsMhhjN5UFaojvfa6HvZmqMUFAdI
	NAtCdRzF5waIPtbNjvO6yvhfiqLLvHG9EcV8F7z0IR4w6BohLxe2dzwxW73hgCREavfFRPtvgsa
	L5aW4FPJtD2O+DnEExQx+pGNE9uVOAEZlKLULbOGLQmag4RRxbN/oIk0XpMEHZ+5Tb4+cw==
X-Received: by 2002:a05:6a00:2196:b0:878:3538:8f77 with SMTP id d2e1a72fcca58-8c87c6701c8mr9415691b3a.37.1795416475541;
        Sun, 22 Nov 2026 22:47:55 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077fe3fsm5152686b3a.4.2026.11.22.22.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:47:54 -0800 (PST)
Date: Sun, 22 Nov 2026 22:47:54 -0800
Message-ID: <5ec374e9acccdbb5422291d106bd9ea9@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Mika Westerberg <westeri@kernel.org>,
	Corey Minyard <corey@minyard.net>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>,
	Sebastian Reichel <sre@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/8] i2c: docs: update i2c_smbus_read_block_data() prototype in writing-clients
In-Reply-To: <auo-JCn9VES7OwX5@google.com>
References: <20261024-i2c-smbus-read-block-data-v1-0-19bb97467982@gmail.com> <20261024-i2c-smbus-read-block-data-v1-2-19bb97467982@gmail.com> <auI4Qq1KUo7YYVtG@zenone.zhora.eu> <auo-JCn9VES7OwX5@google.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Andi,

On Tue, Nov 03, 2026 at 12:04:29PM -0800, Dmitry Torokhov wrote:
> On Wed, Oct 28, 2026 at 07:00:49PM +0100, Andi Shyti wrote:
> > On Sat, Oct 24, 2026 at 07:48:42PM -0700, Dmitry Torokhov wrote:
> > > Update the prototype of i2c_smbus_read_block_data() in the SMBus
> > > protocol function table to include the length parameter.
> > > 
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > 
> > Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
>
> Andi, so will you be picking up the patches affecting drivers/i2c?

Gentle ping on patches 1/8 and 2/8. Will you be applying them to the i2c
tree, or do you expect me to queue them through my tree?

Thanks.

-- 
Dmitry
