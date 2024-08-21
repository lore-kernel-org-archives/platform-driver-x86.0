Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFA6134AC
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Aug 2024 12:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724244094; cv=none; b=rBjIDjzkO5oI2C2cEH4Vc3EtScRvu62RKrnGGJ705w3kWru4n6ZOceAnmQSDugT9d6LZyMcL939eqkEKl1L1JawfGwECDteIiiWBUo3e+vUzsLix9UQQeercOtlZntY5lgHrC0/5crvNPjcKOoB4bIeivApvPIkv/AgsQdtCQIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724244094; c=relaxed/simple;
	bh=amj0gncMvSyJLSP2syzFBmIWykTzcPbktkTvdyLZ230=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r4jvNNN3XZfLfGRd2zNPH65aQafm+45KWLj7wnGq5l3FlUlzz9O1r5NlFUyqXZHCsfZ89SjSL5amrzANX4VAPnuuRe4BCOpO9vvjUZMxQZuUwlCGZx9hJIGZb9XlFjYJktqQiq4OfxHp8Xjef6gWJk3hxiO4izOP8xVR4rjdiCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FteYYQdJ; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FteYYQdJ"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-844c333b03bso224091241.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Aug 2024 05:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724244091; x=1724848891; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=amj0gncMvSyJLSP2syzFBmIWykTzcPbktkTvdyLZ230=;
        b=FteYYQdJcGb3ZZrebjvmIG/FiKK8qFGg0SXJR/Z30x1L8+nBBI2vmktGzCMjdvEXs3
         fy0t2kgs+J00ldbD8SWwciMr+wPPGvBmZWki/2b+nYnuiwzNC3rbDIJoHSySeIehdcVU
         qakZFJxuF3CcAQRmG2qMh28r+qswngOi6metGH4Vyck4ZVG8SXVez/+0SIb0KBNLHGt2
         pE9E+vaFDsb102S8t/HhsJDBVFWRoOdbyDjFzQmeEXjcSS6iHaB7xM6XK1FRxsJJu8+s
         8daV1rcucxYEVbXA3rfD3S2QBx9MvJOHDV1IJxG0Z9GB6XFnAT7MHmHpWqYR1xFU2tAb
         KnBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724244091; x=1724848891;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=amj0gncMvSyJLSP2syzFBmIWykTzcPbktkTvdyLZ230=;
        b=YfQtRcIqrI3F/gXAvRrkaYqHTj6RRtwg+W58D8YCNpsyLisI0Zk3F3hWxGZS95+zvz
         5ZrpamLaOPG5VjSizlK99hwEdovJenfZ7XNsoRLj1xew548eHLO+aAkSFf9dg0njfOK6
         dTuxzhLNWLwQkp1pwooomQ7Avy/uB8EinTAgMFPBO8TkXWkzgSw4mSDD/l9bwcoM1c2v
         V+u8cQSHHM7jfsCKC9m85BsrgqmIyqp5N4yXQ1HmWFEqNa2hRPl11t0tHkncThii5fch
         EZmwA0KQDZrzBfQ0mzGZiNYDi3n0dW3fMU3SNj99himGegellrnZpbxjQDgNfOPTLz28
         +JdQ==
X-Gm-Message-State: AOJu0Yxbub01i5p+dpuNWmCWSjxJRyHTaSOhlmAXtgkWFG34B2k1kgT5
	2fnwGsCZcGjKeEGBu5p/94UIsXzx29QfQUpWbKsx4EF/O9wKCCIis2uJ/o6bCf2Vibft44RioOj
	I2Hrw3m2fxxvtyHkPJl4/mL6MZX4=
X-Google-Smtp-Source: AGHT+IFH4cn6zuLEbEeyPJDCN78GqDvC4DrZxh8jbSJdmQacbVOypNvRA98WuVT9mY9OxP8k7TrAayaDWJiiG2kQ39Y=
X-Received: by 2002:a05:6102:6c2:b0:498:c2cd:1ac5 with SMTP id
 ada2fe7eead31-498d2ea4831mr3120323137.9.1724244091494; Wed, 21 Aug 2024
 05:41:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <808c835b-3500-4345-a338-b0f8014d049d@gmx.de> <202FA1F1-967D-4D99-94A1-9649C7C9B6F6@gmail.com>
In-Reply-To: <202FA1F1-967D-4D99-94A1-9649C7C9B6F6@gmail.com>
From: Rayan Margham <rayanmargham4@gmail.com>
Date: Wed, 21 Aug 2024 12:41:19 +0100
Message-ID: <CACzB==6Hpp173CzcsOpU+epz13uDU5mpudX1xvZuMkphODTPAw@mail.gmail.com>
Subject: Re: Add Support for the Acer Predator Triton PT14-51
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

It does not work very well, sure the mode switching led changes but
the actual fan speed doesn't change. Performance is still awful, and
theres no rgb control for the keyboard/logo

Rayan Margham
