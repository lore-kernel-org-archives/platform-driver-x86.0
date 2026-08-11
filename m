Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4301F8AC5
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Aug 2026 03:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786419067; cv=pass; b=UNppw6Z+Am7vu3I4QklUvCZXGR928S4DbNFInyUL1xc9iPzimdMaZQFtJYLU9VnA6BfEUJdLSWJtsUCUYBCAc9m+11GqJnmyp+2Xq4efHtvm1SUBxgJlR8iNVOsLMacjV943cKLIQUqOwKcxGUZzb3Hk09wVfaV0yGw99/P4duo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786419067; c=relaxed/simple;
	bh=avHyb9Q/l6jKUS3TlYKS4ZmrvZngg/PHXAcaK/uIa6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BsXd5CtBxAGB9ro5tc6cjD8hwBHcyMqEDYVnXj5zFWxPjd/bWNTiJ9r1WGdBfpKObIQXzRsDTrilDqoI6ai1KOCjYLrPZVoCJKgvpoydEh0TR9VLesL3Ph7rnjz9UUq03GwHlaLv4zaUC2bs1meAaDTfGCPBRReYJUp6wFA8u4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VdWFe8LD; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VdWFe8LD"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-caf45fc5202so2182578a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Aug 2026 20:31:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786419065; cv=none;
        d=google.com; s=arc-20260327;
        b=HafRBdVLTqYI3eMFl+7G/7/a/JFg0TYLEyXBy/VUYYGO8r4nJbUWvLTImqwoOclLCr
         CpDO806pCxINpqG80ykuVA2/BtNBI9cKIRMFe9McLUpA4Npp8nC9VCBuPUvF3vTN1skk
         qO9Z/5Efj6Zl3uLqqtuHFfhO71ObUniqvFtqV0Q2dvVM6bddmfTQMOKHpCc8+w9t8GZq
         CKIAZAhfnokcCJvnn5bZUo4j/y3lsw3xTo97ajpcIqW/yoKD/HxOOiFsv50Q5Y43wKJZ
         2URhbSTlfERVtZSVEg3cwwobiOxhCDhCEtQjvZNh1tql1sePc6JAnG1ajvpYQ8OZPxUZ
         07fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uxjKn6B7akWoVJbpDPAP9JEe0PUeBNPnw5QNKIAnSh4=;
        fh=DPxIWD89TkETApqBGUmip56QJ92zWE2y2wnycKhrpio=;
        b=PtpvrRw/dIoSvxWumS6/vD104evFg8/tAudxi8/XY4rn2a2jzV1Nyq27Ichv0ZJCr8
         /mv3jAoZazmEgPF7j2KQeX7SUdiH1J3XCFhkacjfwIZBZaE6ZgUd3cFABo8wDWzXAYq2
         322PiXjywzXvUEJrbw2L3DFsQYmo3VyQO/cDS3hV2ypCFG+CBjkvoIt1Bx2h1hXNN/AW
         chC4P7sm4Sn6BxsnpmkHp18c5UYTj2DLYgax5MPZn20dbYVpA2UblJ/4THbMuo5Veiqu
         DjJ4bucBgvlhitr3BvpKgXOjayc6UuGVuTZmB+GeyEw/uSS5sBcTxMMVKnZBCP0uMJ2u
         3TkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786419065; x=1787023865; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uxjKn6B7akWoVJbpDPAP9JEe0PUeBNPnw5QNKIAnSh4=;
        b=VdWFe8LDXJRi6z+QW6TP3K8Vcg8auMF7tMWC1re8ZLQKJq/xqStx/Sv8pFhOYScAC6
         /EIwTX57kY0wqN6o3lzWywCmXx7gkXkIs53PG9B95UtjAdBk9HKCYp6SLwVfCiCw19Q6
         hyfhPOW2e94x8m0El0NUvg8Y3KTMMh+VLTIMLCnkWMf1uMwIpLfj0gK1M0izXeAAKc+8
         fVNJNiln6VkBJZCPW8YNUzawhm6BJ1nmNmQcM5/jqtpNca2IywCcjVvTAPlJuQ++seKS
         D+MWqqvKQeeQPMLlorwjeQ121XawJMMOzKhNeBHrsM9eTUoHgLm7rqEWh6EQ5kfYUl9D
         73YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786419065; x=1787023865;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uxjKn6B7akWoVJbpDPAP9JEe0PUeBNPnw5QNKIAnSh4=;
        b=mto9iTDDUbvoIfu2o3tFTERMCEYU30enjsJB/venwj6/CM6gLVrUr6D80XFKXvcomA
         1OAsAQwK3CGiBPxZyaoTsF4u5Ma3kypPp4WHF+KHTCPvoCq7KuqkcAKc9bNalyK0hC2+
         6hwnh56Ifz3TF0p47wlcNB8Dpp3svC6vKKmzFBnzUiSSCgeEFR2zHZuUcqskDixSIfg/
         /Vz8ny0X7OOg6/oiwPAC75ovLv0NSJc9joePqgUOuvppgY9raVJrWx/gyZ/H/8fIElnm
         ZT5M5rCodg58M+iMXbt0cd2Od/N67fzEw96bXszBxuU/Zkd9zSbz6YMPv94lfDz2Bf/r
         42Vw==
X-Forwarded-Encrypted: i=1; AHgh+RrVsdG3HgYvqjI0RJvmsWAj5lUktp6VreMuJLBh7by+yOXajsEsFfCPfUNMxGJN5Vr9bV1FsCBgJlKPW0KBRFN4yAyv@vger.kernel.org
X-Gm-Message-State: AOJu0YxVEfDsVw0s5k0nNmPswf+Na+16qAVpSFHSlXPUqTHGhR7FFJwx
	i60GM4upRzsNk5bwvpd+NbiKjbf4z6JZv/Kd8awtryglwfOAbyOCT/CXu060eiAfK58vbd7w/ST
	BYRnyE2orH4nC6Stpjd6fTXfpTYOcmYGb4eqC
X-Gm-Gg: AR+sD11F4XDfz9BdsKmXeTIVIkKlY4SR7pMNO+cBB/gW/ml/vUPnprPjI+rngZ9KJwl
	WfiEFe/GOP1ilwXXMAa2qtGTqDvYqR/Z2yXdKUROU3hGa+MNu8H9DPT6rYfCpRFtxCz7AhDbRRL
	lYGHHeYCNJ0imY3FJaMsS7/z8NShlsbQ5pgFQ8j28DUnavXK5NIIjIlKGn4jkEnfsc1kaXDbOO8
	awMXkyuw4i5Bve8gHhr6fn8NcjNjLhOC4bPNaE7wT7yUm02f8MkvF9zwamylgGDxYmUIHudb+X4
	cy4LjMe+siISETOf/uquZLT8Amow73vxGHfgdrNy/4bcT75fn7B3sLXGjjntHapKapP+E1O5cS1
	EM5AmoCW1PRbbzWO4xQIRIBbTVqRptGbElZMUDGMjDPtbpRL+fM2g52CX
X-Received: by 2002:a05:6a20:5681:b0:3bf:9142:ba3a with SMTP id
 adf61e73a8af0-3cc2bac0da2mr611986637.26.1786419065033; Mon, 10 Aug 2026
 20:31:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810052625.27614-1-phucduc.bui@gmail.com> <20260810052625.27614-2-phucduc.bui@gmail.com>
 <CAHp75VeCWatCnsWnzRe3mVM3bDCJkqJTOh8vYyY=GoFgqg18hQ@mail.gmail.com>
In-Reply-To: <CAHp75VeCWatCnsWnzRe3mVM3bDCJkqJTOh8vYyY=GoFgqg18hQ@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 11 Aug 2026 10:30:53 +0700
X-Gm-Features: AUfX_mxIITLg6rVuJbxy9Y5RFY8zGNCR4OMWUwmRuMo-6XPtF0FVqlJxnVGnn2Y
Message-ID: <CAABR9nGwD6Qy7e-XxcamsDFZh0d=06SR=mAHNLGdVt_uEi71gw@mail.gmail.com>
Subject: Re: [PATCH 2/3] platform/x86: intel: punit_ipc: Propagate errors from
 optional IRQ lookup
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Eric Piel <eric.piel@tremplin-utc.net>, Hans de Goede <hansg@kernel.org>, 
	ilpo.jarvinen@linux.intel.com, Zha Qipeng <qipeng.zha@intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

Thank you for your review .

>
> >         irq = platform_get_irq_optional(pdev, 0);
> >         if (irq < 0) {
> > +               if (irq != -ENXIO)
> > +                       return irq;
> >                 dev_warn(&pdev->dev, "Invalid IRQ, using polling mode\n");
>
> I can admit that the warning message is not comprehensive, but after
> this patch it obviously makes a regression. A previously working
> driver for even some Linux failures (besides deferred probe) now
> becomes unusable. Have you studied the possible error codes returned
> by platform_get_irq_optional()? What are they? Perhaps you need to
> improve the documentation of that API?
>

So I understand you'd prefer to keep the current behavior of the function,
to make sure existing systems keep working fine?

However, I think if this IRQs is truly meant to be optional, then any error
other than -ENXIO should be captured and returned
so that developers can actually investigate and fix the underlying issue.
Silently swallowing an error and falling back to polling doesn't
really guarantee
the system is working correctly or safely either, does it?

That said, if you'd rather keep the current implementation as-is,
then I think it would make more sense to switch to platform_get_irq() instead.
That would more accurately reflect that this driver doesn't actually
treat the IRQ
as optional, rather than using an "optional" lookup function while implementing
it as if it weren't optional.

https://elixir.bootlin.com/linux/v7.2-rc6/source/drivers/base/platform.c#L301

Best regards,
Phuc
