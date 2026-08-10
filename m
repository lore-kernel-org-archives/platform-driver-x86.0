Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F36236EAB8
	for <platform-driver-x86@vger.kernel.org>; Mon, 10 Aug 2026 07:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786345279; cv=pass; b=mToQGxT6Am5FjuASCSq7QEYJYM9MaXH2sibG0y9mDrMeN+yHrqkG+8JO77Qp+9Ks7GOZofNy/GnlMpGpE3Zk7UtOVnsiawe3Xm2QnzdR7vvAmpPZo22D2WqechtCLG+4K1c16dH1IYxyi7yAyycLyoTykqxx8UcBhsMX9IpS1UY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786345279; c=relaxed/simple;
	bh=slwHyEj8RPzL/WTLLbRF2T/WBiFIUt9q9P0hjWGORsw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uF006z1HY6MWIYm5kDi9xEPm13cO0Yo09BOg8ryzy/Mq/HcXnE+KlKiVg7TAJaP7UlHGvI+U5Gw6w2w9y+btAi/jquzzBcIswLX1hGp/9+KAXuLhmKGW8LkZYhgJhIaAzzlXmXTJ5gWfZseRBkDFBNXBenczTU+OSdf32/A2QuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CmH1JcK1; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CmH1JcK1"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b01910b499so1283858e87.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Aug 2026 00:01:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786345276; cv=none;
        d=google.com; s=arc-20260327;
        b=QycsG+679LN9oFhMcSR9vDoY/bQOFotVfm+nfN+eZzHVawYfrvdj7EON86TJPUFoEB
         yBft19bJt7xTxAfhm6CafcxaDh/+x04etnyRuo9ZAj5zgFQndRNKSVnJV+bl8cd0KBbC
         8XgSMNPpkQrWyUQ2N0saC0DMUPRK6K2fu9UkmA8O+7YpUFOjTLMabIb3zCRpp/rpCUYU
         e1k/lyRU6jPAVLUWok9bKVb/g/2HHBReWZIXPqdF8mcHFyAplcQjm/hu1YJPQfXhB3Di
         M5e6HfATN262d2azZ9hAn2Wq6i2XIH0ZVGgUShg3WoOf0ZZ776wjVL7Hi04cg368wfnE
         buOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9fZSt3bBSn+cqkmX5lNXHy5+SG+GsSEuK8bj4s4M6z8=;
        fh=3es2dz528igutnpAYwOw80slbD/b1vxuAgXd8+j+tjQ=;
        b=gP2DnryCJ3qtAbpIhhy5iRMfEh2xC5N99HWTVPlZ4BeMZAqn4C80xWE0cGj/HT3fmY
         lGM/oJwdOfGU4wnM9v8SPbKZC0l6Pd6+woncy18qgNisxNIF48dZP5EPmawx1PiIZ4Qq
         HuzRYR+z6Z2Eukdd8cu9IS1ZU+OCgJnao3hzn0m7OqA5TzN9ZJwyDPg5+mbD5Roh3OCI
         jpIcMFJSJ6WX4NCFDj5QCHJ5IFlefCk4YIBhiDfdDP8UZSdav7W/xYQ7WQ+dp9kvghHi
         67loPkVOFWRHRcqhR2WdiAVf899ogzN9ik/G/9hQ16gmT99zzkNxabHYXFuoEmU9GShI
         /etA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786345276; x=1786950076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9fZSt3bBSn+cqkmX5lNXHy5+SG+GsSEuK8bj4s4M6z8=;
        b=CmH1JcK1DyKqwdoCpif0c+Yi9MJobJDTANsGTBxkkfkxWgwU3yyhKQv9pstGMneTya
         tDoHFXWCOkIpBRpK8F5Ru7WySuz3jtWrrXl3BCsXB/fBEj/HQpRCyUl0mvFbI9f3NwB/
         oZunpHdL6zG1UT9/sJP7X4+fNGXmQONUTS1sRrvQZaZfT33554jjrHJ1GeYbJq7/U5FP
         QCsUI9u9mbtBfbq4cpI8fawSnYviEuARReKLtVKZbKBdDad42JloLqSeyE+CHBc63twp
         hHoE9Eyrg0if2OC9LoVBGI9MBxWSNIA7PMaTDEw18yesrVuFprQ7b//f68wN3nAro9NU
         9GOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786345276; x=1786950076;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9fZSt3bBSn+cqkmX5lNXHy5+SG+GsSEuK8bj4s4M6z8=;
        b=SV7mGM9zW7YlOCscGAh/DWXvhhNXDo62d/8MUILScaR81DOx0KnPkFhySXIjbzpAbQ
         /BEbI/wZyud3whm6WNa5D/nXurYrFKrNn6gqgNhPuyjbsXUttjZVeP0JCGbUwZOUrotR
         8YOvtOBRIPXiIkYGz9ZsU4glKoWeSeEqD3dznsSR5dHkMdyq4ACQd7xMcKlus4NDyynW
         CykSyqFjIFkp0h9oOuFpaLKDp9j4SshZ6S2loNhP2ogtgn49LW6xkagZtxixxQoHiKno
         MdrNzBdFF964C+Sqe7vg0LZipbZBhN+PHW9wbj+q4SFLCYTBvOmiaCgp718j7oP2D89+
         RnOA==
X-Forwarded-Encrypted: i=1; AHgh+Rr7hnzZxVBkhAHwp2H3McNZ5qxzA1b+HG1OrinJLfMhdpvP/WW2pBXsVb/AojjNy51zoQq3xlqoM/vcPaTsPBjB1agl@vger.kernel.org
X-Gm-Message-State: AOJu0YyZdQpCbHJPvqtYyG77wCM3y+cf6kz/mBWh+TVo1LAPwOMwE/pM
	DgzxaoebmTDYTaFZDTjd1NPOGHNkLa4sGYTPn34HLSTD14jlxEoWyGODf1bHc/2nPVXdY42zvQB
	EuLTbJmmoB73J1/Gj6AnetRPy2zdVVQY=
X-Gm-Gg: AR+sD13/5qwyS0FE4Xtde27Qhwwj70MxdrK+LRQG8iKgW5JjvVultik3SSlVBM/0zV+
	tQ/YaR98QyUMcPBBmeXittrFArYlpRAe2cZ/ZFTHXiIYdkVN6mjv21+POQtsfQuJH37wO/qUnUh
	Xhy7YtTau6bb09c74Prv3e7cSs56EYzZDB30ON1q+Z1m1ATjyexGnbcjZWAyF70aUS4Q/c+FGeq
	Aka2Yb2r7efYD+HlMay9mVhxJt7G6jwXRBqfBiIti/UxabnbUhqjDS3nAw4n2JwZjG0nKQqwRwh
	yASLhX/+eHf9Eqni15uRFjx61Dd8QTl8ghdsMM0noXl396gYxvG/h4CgTnVJw2Xcj+yJYCRBtrm
	+pcRtP+MdCDqvoWsq871IvfuMixW2Y+2eO3yQoJna943Myk/pNsIQUw7jXKoMKBkF+SWyf3zUaA
	RwN5FjoqebcoPEnOfaY09q5oOiaoRwS2uT0Rwdyx4cTg==
X-Received: by 2002:a05:6512:64e8:b0:5b3:13eb:ef5f with SMTP id
 2adb3069b0e04-5b313ebf19fmr736932e87.15.1786345276406; Mon, 10 Aug 2026
 00:01:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810052625.27614-1-phucduc.bui@gmail.com> <20260810052625.27614-2-phucduc.bui@gmail.com>
In-Reply-To: <20260810052625.27614-2-phucduc.bui@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 10 Aug 2026 10:00:39 +0300
X-Gm-Features: AUfX_mxrt5C4owtesJaWnGWqPohX3Di4h1wFjMbGrjHc7Ng-4Cm2J54Yv0-eino
Message-ID: <CAHp75VeCWatCnsWnzRe3mVM3bDCJkqJTOh8vYyY=GoFgqg18hQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] platform/x86: intel: punit_ipc: Propagate errors from
 optional IRQ lookup
To: phucduc.bui@gmail.com
Cc: Eric Piel <eric.piel@tremplin-utc.net>, Hans de Goede <hansg@kernel.org>, 
	ilpo.jarvinen@linux.intel.com, Zha Qipeng <qipeng.zha@intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 8:26=E2=80=AFAM <phucduc.bui@gmail.com> wrote:

> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no optional IRQ is available and the driver can fall back to polling
> mode. Other errors should be propagated so that the caller can handle
> them appropriately.
>
> Treat -ENXIO as the only case where the driver falls back to polling
> mode, and propagate all other errors returned by
> platform_get_irq_optional().

...

>         irq =3D platform_get_irq_optional(pdev, 0);
>         if (irq < 0) {
> +               if (irq !=3D -ENXIO)
> +                       return irq;
>                 dev_warn(&pdev->dev, "Invalid IRQ, using polling mode\n")=
;

I can admit that the warning message is not comprehensive, but after
this patch it obviously makes a regression. A previously working
driver for even some Linux failures (besides deferred probe) now
becomes unusable. Have you studied the possible error codes returned
by platform_get_irq_optional()? What are they? Perhaps you need to
improve the documentation of that API?

--=20
With Best Regards,
Andy Shevchenko
