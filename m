Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792928058;
	b=Ym0cjElfs/3NOJ58WgKhBwAaXLqhcWRpxVwH7kQi14cpX0vrsipueNjZ+wNvg3+8jVj6
	 gZjhoFgKj/5zHUprBD9pPUAm29Dqxwxs1ClWhRGapu6EBMEajSL13s5YlY9cL89QkGe6d
	 uOgXY8nROltDibsc6oPLmSEA2I3bIBvVuZxJiNUrxefPXFlzhbUW976oPRivUEwAvX2rg
	 mar1cYfeYrTHpyfiJorCS5Zzyh5lty1ZeC2l6WXT8uadab5JJLkboEWwxxm4stclcKmoe
	 GlrpYrYB5jjbgl5rYd1B7NzucemM49UoU2JO7Qwk51yBrs0YPIMBvY5290g5fga4t3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792928058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=41RAX7MgRXoDWB++MDi19DObLArHcqUImXX3BQuhLqI=;
	b=a//dJIs5pGTUv+DQnDewnyPjfICi2PLgi2alFnIfHJDCe3V9FmqxQfJ3AJ8tkqrWQh+F
	 z+/bDKxD+82AFNeJhReet5A83lem2GguWwYQpl9Sr/TAFeh5oQ4tCOiDsjF1uVvKgVLRm
	 SDM0TmYG9bM+bYh+tMMzrV8sNUkiSZwla97LRDaUBM5wU1soQMU0nocXlwc/sWXA5jokZ
	 8CRh2rf/hbi7d8VQzsZOgNJp01uFJkSUEA+Bt1c9KgMg5dOjtyHAG/0qMsyanU0QB/zVn
	 sI8I36xA3B2LsXfqGkjaVvhlU03KkEdFzfTe4X14LB2FuHyAmNBv8WyK4rp4FUykn4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51848606A31D
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 11:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51848606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b10d24345dso19249937b3.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 04:34:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792928052; cv=none;
        d=google.com; s=arc-20260327;
        b=hFT0ePLPM8+Nn30hGCShi26K1lKD+bLIXmLXkhJFYJyW+N3r3qfuiaDcBaLDjn0lPf
         KZUWOTxEY7cyzz3PHGG8RiceW0fzZvNwgnBpu7xJeduVX0cjlQOys+KKZBRLU0vA2gM4
         9DnoLYfiT4b3Bt4TerxSDCZemV0Tm9vEEbw0JNWNEqt0l8CwTvo1KnwHJIeZVw1pfD6m
         mBJ6H20CimIhzeCoCRldk4uGm/lxwZeVVqLhAYmvZdtTkhs+wTxoGhOAE3xxygdZWE6o
         0ODgN9Odnsf+32lysCTZbn0dbJJN47SdoutqpnYoAafx/KEJexGptVpfzYVngw6ZYPet
         5yeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=41RAX7MgRXoDWB++MDi19DObLArHcqUImXX3BQuhLqI=;
        fh=zWP4HteR4YCKJQJKwERtBB28gJZDtDTkDKEnaeW5cXQ=;
        b=s3+BJ00XRrBgD2GCto6VCO7YhZIax++axPOU783+c0cmhGCw91v+6rjL5rQDokw0fk
         YjTgF87gKBd7tbLFhQnXnzf2bloaKH+tquJAqmkphTlD182okyngJ8uzgK0fyI1csCB2
         zC4S01ENE3y8nL/qrUVnRoiG1ymwp1n7Dm4/xVS7hC8K/ALyR4Zm62z4xCFxsTmI0GTq
         E7Ccb5rJGe8zXxmnU+QNIgRo/O2etMFuj7W2rrXFJZUcYAHMUH8D56WyeoAUeLio+AoH
         fE7NKAp1U7ExBRINUFStPu4arE/1HAFpL+868tZE2IrJF6pLlwLvTBPzsadO/cyZWkUi
         uR6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792928052; x=1793532852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=41RAX7MgRXoDWB++MDi19DObLArHcqUImXX3BQuhLqI=;
        b=EeBBa2G+PcBteQrDuZ86LdWxzfKzJ21bFmSXTEEk6ke+CPj/HMKCJ/DYDf6QlUEKHQ
         NKo+GtSpTuoRIqsIhtfaSv7beA3JSw8mnOG4X0phnXIX+Dlx4jQHQ8DC2CMOb7B3CMqa
         +RTt6YVBauEFZ2bNwy/Je8IKxZIcA7CPHZ9FcHkGodko1oOopdMY48p8AYu7E3w848IT
         /QYPCJI5HnKxl3F9aHamgmBbLgb02zv0Z1TpKgYm1Ds9tdni3wUp++UoEhDsrNDmg3nu
         HDOlp/JE3KgjCjQ6kLUeQVqCknjGfHCIG5wY7FUGPpD9ICVi4eKvJXZRzToKgeYHqMYx
         FnpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792928052; x=1793532852;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=41RAX7MgRXoDWB++MDi19DObLArHcqUImXX3BQuhLqI=;
        b=igYpLxYSSN2p3YeZRtLprHtY0c9ABUzcaiPXta17k5TO/Ylwq8DyWLVh3BhAHzqxvW
         EKZ5gBMHxstDAx3uxGN0NFDsxsmp4Noiii3FEA5Aicd4nL2KgldeZ4PdsW186pUbgiaR
         Ww8aojrxn1OCpMUO419S0eH7uRSt9usQZN9FkypRF5p6vvXQhul0gDR0WuNui+MonWvG
         0BckXpRUytYR1cdEmG3OZUhJcLipWxX5M5D4DOc4n+/y9z1julihwSGbazAUuzUZUBFy
         Mv7d0WBQLoPKlNriCQo6TswHm6h72uG2hJgc68i4AytsXg4agDQ2apZkovQdd72Q/REN
         EzKw==
X-Gm-Message-State: AFq9FYI9FF0F3E+/6d4EqiJXAmzNTc2yEp9DZVDWGeIfHCSxiV6ZMl9F
	p1LRFM7V29geH6D9wHr4n/0MwOYzAJ5QuKj+rH6tgmbSxWVTJN8q9mLykiP6Zoj9vFNWxB6P46P
	LrvWrv53H1bHPmdhBVccYLOx5CVSm2j8=
X-Gm-Gg: AYBFou2pHrZOgWG8GCANGltG/He22ct3wVg3zJqoDj8wWOLJr80DPGvz52Rcsqx5ZiU
	rG7tm8leB+tRRpSDeoTzCdVZ6/qADHjDcjPRn0D3/758F6WE+5ep8SzdGX5UNE9C9oeBZcZbzBC
	VJ+t/FRmCkD2pFHgB1BI/eWhhmtzXuBSMi+dij3aV1VXy1coz4gjSi449/cv0icGKqOQZ9GjCOQ
	Krqfu0I0hD2wbwPl2fgunH50Li72qP65N6XgBOuvkj9up5TX2ErcdD9AQ/W+ybTs0icFKu8ZFL5
	5SysXM7zCRgpbhDIxUIaNLVjwoQrfhWDA9xyjI8XvV2WJvfZ1zZvhzH48FGYwNPG1qpUAl12U2v
	tnyEsdqE7AFQRy7OBjjLjdvmjAxvGtTvJU5FqrMQociCtj5Zlbq5WE2FK29XIl+zBWwbzB14m+x
	88K13zcyeogN43bSuW
X-Received: by 2002:a53:d209:0:b0:679:c916:46f8 with SMTP id
 956f58d0204a3-67a4543dad9mr1944040d50.64.1792928052316; Sun, 25 Oct 2026
 04:34:12 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAJOGg3x1KWjXrMpXoCDEMAV10i4Utk8E+hoJx7UW6Lr3uDkbEA@mail.gmail.com>
 <e46ea453-5a56-4009-8b33-900166345905@gmx.de>
In-Reply-To: <e46ea453-5a56-4009-8b33-900166345905@gmx.de>
From: Julien <julien82453@gmail.com>
Date: Sun, 25 Oct 2026 12:34:00 +0100
X-Gm-Features: AclHuK-6yDmRDYnA6QItL78V10sOajvI8R4QtWENajW4D3u6F8oIBfkKhlNG-ic
Message-ID: <CAJOGg3zRpJeaoZh=bSqcH7w4exu1Dvcwi73WRBEO0sfbFrpqKA@mail.gmail.com>
Subject: Re: [REGRESSION] hp_bioscfg causes boot failure on model HP Laptop 15-bs1xx
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, regressions@lists.linux.dev, 
	jorge.lopez2@hp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The same thing. The system hangs as soon as I load the module. I think
it is a firmware quirk. I'll try to dig more in the next days.

On Sat, Oct 24, 2026 at 6:01=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 22.10.26 um 16:29 schrieb Julien:
> > Since commit 467d4afc6caa ("platform/x86: hp-bioscfg: Fix automatic
> > module loading"), the hp_bioscfg module is automatically loaded on HP
> > Laptop 15-bs1xx.
> >
> > This module causes the system to hang during boot. Blacklisting
> > hp_bioscfg allows the laptop to boot successfully.
> >
> > Sometimes the screen will go black but there is no kernel panic
> > screen. When I get to see logs, there are no messages related to
> > hp-bioscfg. I suspect the system crashes before it can display them
> > because on a normal boot the next message I would see is "Module
> > hp_bioscfg is blacklisted".
> >
> > I think the hp_bioscfg module should be disable on this hp model until
> > a fix can be found.
> >
> > #regzbot introduced: 467d4afc6caa
> >
>
> What happens when you load the module manually after booting the system?
> Does dmesg contains any interesting messages in this case?
>
> Thanks,
> Armin Wolf
