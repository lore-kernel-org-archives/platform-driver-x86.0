Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0132E2652AF
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Oct 2025 20:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761596299; cv=none; b=eeEs6YXYMwkjM68LUUb7n7leiCfuTN6OOb/Zm+Ip0Cu+JZimik0fGnLS0QzTSMoOq4H8kjHG6val7uuRsmWFP+qjjpBbkboU8ZxUt6mSFw5s2/Mk8wKdjY71sV8EXzNJNIdo6zSHmASz9OEa6ZeTJHq9fIUvj18G9JWFFm7j2KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761596299; c=relaxed/simple;
	bh=lSTokCifpl4J7lSVpw0q3H9Es6fVXHcmLTj2i3P3cAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rjFTCqd1Refxm6PmbYDhBYK233ZF0hhWg+GbW3h8XT+YKh1XnPM5c9VVC6cZWHTn0dbuNm0f3B+bq84wsHmb1pjPlmtiKh67njFCCIAqE7Cgf+QmixfjkeFYg/b9BplLvcfQuIoqQYpQeeXsWTH/jCwnlRFTbb7FMPDRRwEuKDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvSVDc3g; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvSVDc3g"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8909f01bd00so554104685a.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Oct 2025 13:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761596297; x=1762201097; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SFsRDURbupErddEzQWwOfBEL6PL6iuOZS7ti0DR/0UA=;
        b=kvSVDc3g8PRvE2j8hVdh7yM64uEIFfsG4ZmLd9sxvFqNVffTqbdI552+NJLYht3p9W
         bdE2PrkdUrerggewC7DFbD8muhmEZ/EcNA08lHrbq4XXAo4kbXbVNsyPequ1cRjOGQ0p
         PVC8jF0/rLNMTFiuRWkATlYOvc+9sTSckpFPbAGo1zQ0zPC/+CP1ZyLIa5FLEXqAss+y
         VtXCICfiweMs4F7WJ7cujiUKBr9C2Or7tOLr57rpwv1a7CTDKH256EozEnEDsw2vHt7M
         zX4m+wN1OBNRdTbF54kmw0gz8ywCIajDS5hPyeBlUPaG72dFGcN3jqj/r9Gm5xuevR2e
         gO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761596297; x=1762201097;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SFsRDURbupErddEzQWwOfBEL6PL6iuOZS7ti0DR/0UA=;
        b=d2Rsg/mcyTWsQwWcoGW1fzpVR2B8giCzmhLyZUrgEXm14LvIWLQzaOxExw++Jxkzko
         0wtJzeNC7xJfypyMmCkdYWimZp0OtuQd/9UO+gtToJP3cR3zCSrSvJm6S9oy8cpC/xPm
         fPsdj5NrZWWX1aR+owJMWeSZn3dc/Dv3lmxTIH9EXfRUmZaJGs8fQ66HefAjC1PmuGte
         C0owd9BgHUDzS/5FhSRQ1LEb+mys+3l1QfKCeXcNMoM8T0bhthqnbL/Ev0RDPqzISJna
         85EFfZ/bGAeeTEQSZsj0jwau3Q9cMrXWUe8ZZM1mldMKRlqFojaUXww1cb+thx49qRxV
         qYiw==
X-Forwarded-Encrypted: i=1; AJvYcCU2NTs2ymWzTzgqUJhEsIWOXoxBtPc5S6GuEURf36/taasaID0RwhkFu8bco6Kfip46Cl9gfS+9Q73c3WkECYsCy+3V@vger.kernel.org
X-Gm-Message-State: AOJu0YyonvV1bGluNuqNeSqYMdemHnLcBB8xpeWYto7dinLcjYVtm+4E
	/O83MuJkFHrp2stEP5AY7ynOHS1Vj/AQc2QQTh+qn22Va1eDVrs28vmAzRzTMRDkfrRDgRTzaky
	UKYKoCSxDwgifndLwY/MGrMu8r3zMDh8=
X-Gm-Gg: ASbGncu9QFnIT1/zDlhfZHUfBafPn0XCf8O38qkKuPw3nykNr5lp0v4dnqz6IzL03MY
	MKnC2PTx5u4L2/5mVYQt9/YGF7nTqPFQuzTPpa04WAczinWzLXJA86FO3m9Dpt6npiFgLL1yrrF
	8zhZCMIxyYjp5IP3aqO31+RLFDPLxhUOsiBC7aroJY+sgJgZIl3aO8p7qQwjC3t+MzX1Y6SkQIs
	pUiFZuzEHMkkVc0PCJKfSuLTi/ZZ7kr0fD3AwuP5U9hkP/lrQjTjzmKORdN46VkDBC/NLKVo1JU
	T1/rAEHosq8EHOX2bseKMsVDTjEd5Q29DGtO7c/85LH+Jot2iYr2Bml3E9UkGu0=
X-Google-Smtp-Source: AGHT+IEI7LEI1aKrb+e3rVx1T7MVGG9bTKSV3dE1J8RY7gqF0l5AyPlCoyXJ7YYt/+5CNMyvzu9m+9PDF4JDHT+cDE8=
X-Received: by 2002:a05:620a:191f:b0:891:c248:a50e with SMTP id
 af79cd13be357-8a6f8d52406mr157448085a.71.1761596296717; Mon, 27 Oct 2025
 13:18:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD-Ua_gfJnQSo8ucS_7ZwzuhoBRJ14zXP7s8b-zX3ZcxcyWePw@mail.gmail.com>
 <92785bc4-e8e6-40b4-8ca6-43ef32c0b965@amd.com> <CAD-Ua_imV_eB3uYAbZV=AWaVMPMM4CpqzmYFDN7AvJs5q1yg_g@mail.gmail.com>
 <099ba5b9-600f-4604-94c4-781d4d91b091@amd.com> <84d6bd41-64ff-4380-ad87-54cfbb5bc1a0@gmail.com>
 <CAD-Ua_iHZtBJFXjBytXEhBwS9tJ79JUA7EB911hUZ0=OyoyLDQ@mail.gmail.com>
 <29af4c8f-e93b-49da-ad22-f5641f0046bb@kernel.org> <CAD-Ua_hYxHWa_rQWC6-2kMw4pXWt1fkdJT06AWeTZUbBFT-HDA@mail.gmail.com>
 <98d440b0-92b5-45aa-a42b-89dd5a243bae@kernel.org> <CAD-Ua_g+ifUOoJORoBiypgk3v4ynTjw=nvmoK6DJg2h-e7aXEQ@mail.gmail.com>
 <b6462189-5de6-4297-8d10-fce795c38ceb@amd.com> <2146bd06-a1ef-4668-ab34-f00172257424@kernel.org>
 <CAD-Ua_ixbf1ApMPMMSner28-fRg7BuhTu3QSw1U=ozqgS9fUjQ@mail.gmail.com> <6f81529b-7ae6-4d63-b0f3-7787a668698e@kernel.org>
In-Reply-To: <6f81529b-7ae6-4d63-b0f3-7787a668698e@kernel.org>
From: Lars Francke <lars.francke@gmail.com>
Date: Mon, 27 Oct 2025 21:17:40 +0100
X-Gm-Features: AWmQ_bm3oG5o9n5jw6DrhMFi9RUIjFrnlSdU_9ojQe_e1hPT2PwWh1gFaVB-IdU
Message-ID: <CAD-Ua_hAxj5PskiFdiEA7Qt1bWEhKRvCNAyQj0BQmZ2vDnV4aQ@mail.gmail.com>
Subject: Re: AMD PMF: CCP PSP fails to reinitialize after hibernation causing
 TEE errors
To: Mario Limonciello <superm1@kernel.org>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	John Allen <john.allen@amd.com>, platform-driver-x86@vger.kernel.org, 
	Patil Rajesh <Patil.Reddy@amd.com>
Content-Type: text/plain; charset="UTF-8"

> See if this one helps.  I do think we still need a PMF change though too.

I tried it. System crashes again with:

Oct 27 21:13:51 lars-laptop kernel: BUG: kernel NULL pointer
dereference, address: 00000000000003fc
Oct 27 21:13:51 lars-laptop kernel: #PF: supervisor read access in kernel mode
Oct 27 21:13:51 lars-laptop kernel: #PF: error_code(0x0000) - not-present page

Cheers,
Lars
