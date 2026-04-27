Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C03724336D
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 01:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777252469; cv=pass; b=Rw3BuKYx6r8Wa602HOM+yOw4/BKdL4LI5JntwEV+05HXRsjrvrF79gSFrLPlWcC9nnwSYNN2gnh21r144DS8R5TlG5fXHMNJDf82mc8H90e7rXbXeBotF7GX5gHVtpoAiRFfNUDVnLGsHJMzZN7QUogbf5Y2ZPsudLu2OlLpasU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777252469; c=relaxed/simple;
	bh=wFH12rzbJOD/Vju7SEE2Go2p2570MXyu1r8McTLIM+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=beziX+7jGPOhuvSr/AQR9ihuYxNZA+UzFB3CB1BQ5Txl5M5a7qvwNUc+OqzAS6p8UXWvaGLKJjEAoF9cOwVN1bmm5oMq9nQQJQf+0gffP1r4qpwhgNEilGTCHfFuOLPHFwmKju/S0GxKJVqGA0a5o9KoBMLwcbFJUBXXyUZp00s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mflrJ2VF; arc=pass smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mflrJ2VF"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8a151012558so106047526d6.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Apr 2026 18:14:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777252467; cv=none;
        d=google.com; s=arc-20240605;
        b=Szlh3mzbAuhPOy37bzId2rNcyhe3ap/DSWTea+xU54p2ktTWOt1+TucWV7Tck0gjp9
         46kYuLKgVffOADB7ACvUMYvguyEJTo3FP6Pd7uS6evWAUsxtJFLspx8GihWf+oXTTfO7
         5nDzHMfAc8TgTQuO8sTuRZTHE7TMLX8AliIfAujwMlbSYj33z57nsmfscWW0w+hYWnUp
         eHZwiO7T0vQHe/ZePa64KhCQhkTh8l/giVcj9ix+bTC8CwnOjuspG+17bdEPBRr0Fx/q
         5agJjyga8jyy8WuUfMoShUjrRyqDEO+W01qMbG9LPzQDFnnbwHp2lbkML8H2ElzSk3fJ
         LVaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wFH12rzbJOD/Vju7SEE2Go2p2570MXyu1r8McTLIM+M=;
        fh=y2a3dZMQ7VmC4faZcKcLD7G9Aj3WbHDycHuXwdMIPFo=;
        b=SfexDBKOClavKHqU3yEstgKhvzZHVdX7nIXJPztvMlLH3uZjMn8ZknYwhd2grXkjCf
         U+3wnJC2XMQJNV3VdD8qoHT3TlRdgiVWH7UyL2kzl649tM+4LyWDdShYK9Vqr2cKC2XO
         sG0frEnxGWzH9qCIhpJPzUepPq/Ga/ZwaU67KuV4VB+Zzo0tz8kHVewBYx2Z4EyE37WT
         4DG3NnzICVynmz9scS4G8QDfMjL4jJJ51kiWgeKlUwNT03eQTylXlnM1tcfTtpFRnKvg
         6KXFbDs/JOZvAKZ8YNsJt71gSyNULl7YdV+8I/MNZogAbYR+T5PZxGbKMBm9R4+j9l7D
         2pJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777252467; x=1777857267; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wFH12rzbJOD/Vju7SEE2Go2p2570MXyu1r8McTLIM+M=;
        b=mflrJ2VFNa27+4YU7/txW1WE8ZkUbpaD21s4moJm06oqL8tl68B9v+tfAy2r8KcsjJ
         Z/HkDgA/rIwUaLi2Ih+qH69FhQUQsIPGShzhV9gN0oYgvWE7JjhmmDLvD0xLh9Z8Mucb
         XbXmE+7bqstJ+2aoIatT3M6NpPxa1r9EbcibxHjt4q6jkXnaIvhgVy8Xf5937Z1vuLEf
         HV843nA/s/vMUf3qg6WHi7JmHJ426KAJVz3mKuF7rh1uw7+SVkWBZqdfBEfhGccmimXI
         aTq3zMWAdUFAdetITlwVqK41j+zJodEE+Qw0qlvGKYIZ58vq9jdUw7pzFtnY6yneOgyh
         0frQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777252467; x=1777857267;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFH12rzbJOD/Vju7SEE2Go2p2570MXyu1r8McTLIM+M=;
        b=SDtMRHP+1IlGo0L7V2iMnmfqftfitMb3AUAf0coKpKahhebFHN6NfCU8xxJ0t3/Rgj
         MiHyKgddS504B3oHqFqq+sa6efi7ZcKP/s2KbJJL03jRFB9B0XlQPrFw61yv3klQzroR
         TeMGlwxm1+Oq0quQ3WHpxHY6QVlI3t1gu5eSuIRGe7SyI5beXz61C4bNjL3Trfk9Hn7k
         1MFoit/H/0EY/64T18fKvwUSOsRjQJaoYQikG9IYM+dec9w9r32Enn0VPnPoGQbZqIIm
         FtULAS2YI4SiMVHOZCapvRrWbyvDDFcy9N8Fphd4wWABBSG01Hln164nDGM63p+82siv
         vAPQ==
X-Forwarded-Encrypted: i=1; AFNElJ8lycNbbH40p6HABdkKVyb4lfapAXmb1V9skJO8FY7RYS0CzVyHBAKEoF/auKEh39jYrmgqZeV+2L8I95ELUjBAWzKY@vger.kernel.org
X-Gm-Message-State: AOJu0YxSB3wkxIbAPBZxK/dv7DgNOUdBvDOyhIWmFogDcoFhmOb2xjsu
	aIhB18Ql0xo66CEPafJroNVSUcVS7j7nkJS+XwafqdRvRrDY7S9QTGFKWZ1/DGbnmp4Olz/VSfD
	cGUMFwKo4ArUCANlCuO2+LhT1P6w23lE=
X-Gm-Gg: AeBDieu5G2EzIyD0DWQJGRc0Vo+k3DzklM8f8vtKceySXjgws1bCw4D+t9WOrJxVNKI
	i60nf40/+NDQCBEdztaXodlm1u85dl2T6lENoglWw8XGtnDnSqClBUWjYTw/jyBEf3KmFkQwirx
	w8WLq5cYgJSexICL8MZHj5D4nFPV5+cmXlDj/t9bEOd0E0kyW+xlCSuCPcJsM4QywUnsr0XCuqP
	PiGf44fAr4YUfwv/N/YGesmA47WWoqhelh5z5s0t2F3rHx30k+e87yK2pk6VaJU4a5nu0vpPakI
	SiNhKtDa+LHSPwlxdXY=
X-Received: by 2002:a05:6214:4d06:b0:8ac:8938:ee55 with SMTP id
 6a1803df08f44-8b02802b6fcmr597136986d6.11.1777252467214; Sun, 26 Apr 2026
 18:14:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <673b66893c16ca31b403e7e7cba32e9b71a7515a.camel@rong.moe>
 <20260426174332.9981-1-cd345al@gmail.com> <F095C80C-C233-4A50-ADC2-EC932563E1EC@gmail.com>
 <CALoEd=GncBHeSOh7eqmVaJrKWNGLsFEyh5TsF87boSQgsDM0vg@mail.gmail.com> <5BB41C4A-12DC-4059-9C97-CBBA4226DFC6@gmail.com>
In-Reply-To: <5BB41C4A-12DC-4059-9C97-CBBA4226DFC6@gmail.com>
From: no name <cd345al@gmail.com>
Date: Mon, 27 Apr 2026 09:14:16 +0800
X-Gm-Features: AQROBzCD3thtZ6r9IsNlVSVM0GTL5vUg-QIpPrnMXSLsf9ClU0tfWU-WHifDjEg
Message-ID: <CALoEd=F57oCUjvW=k0c3Oj8H5y_Rs2-qW2QUuv=qeUOjdc=4tg@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: lenovo: wmi-other: Fix uninitialized
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, mpearson-lenovo@squebb.ca, 
	Rong Zhang <i@rong.moe>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks for your reply! I appreciate your work on the patch series. If
you or Rong have any suggestions, I'm happy to hear.
Thanks,
Yufei
