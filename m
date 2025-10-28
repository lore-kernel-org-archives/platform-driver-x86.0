Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8637819CCFD
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Oct 2025 23:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761695191; cv=none; b=IGFcR9yV0NMSBFjTzoUiPiMuZ2js6YBa5p+pGx6cQfaDJ6wzB+QVHsS5PXPl+AtxoJyxo7wSkSibKtIo+ycmmf8TRnuccajxZNDnPDalV8YMf+MnGjKUrV3d7xkydkWG2bweBkKDDVt1rXf/IOu/klRwREGFRiP1fRHRSBAwR08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761695191; c=relaxed/simple;
	bh=MwoQy59dVEppfa04glBdVCRdHIoLSeADwlPJN/bsnok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qCPtcKqoTNnLke9eT4FmD9tzSyzgRKdgYuLR2suQ+atLt7pObSzOWid2R3RzjB+Pxe+DUEl+kiQvPodqUlLCrH7Sc8Q3lhzyARpxJDcqZSey3k8r1Yjnw9QtrF/P5wxo925QrNRI3v0Y9i6P9ih9vN/eygj1HZMPObpqWBidxJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j0V7tNzZ; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0V7tNzZ"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-89f4779fe03so428337785a.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Oct 2025 16:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761695188; x=1762299988; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MwoQy59dVEppfa04glBdVCRdHIoLSeADwlPJN/bsnok=;
        b=j0V7tNzZ+Kp5/HmQyHTN3V2z67L0bcgH52g80w5gApC6l9OT7ZGGOCBf92xFS5OcFv
         TZW/4kPFOW5eyqAwabDtAqucOeYfj71DvJTH4izrJzzX2lcsUdvHIIovZj30KVxkxZni
         ThL4vKaP9YzaSRPgNDo7ETFb5vJ4+BocjcSzoEJPu83PDuZa+/6DnvyiJSOOK2nzVw20
         UWfFbBwvJyPiHF5HPNOG9P6+Avxv5rOQmQu0+OCjhgPCSOxeWam5kRD2PVyIUVnkx2iS
         sM6tMdiNlPxEGmM5vW26Whq70vOZKHXfG3buN0Fiot6o+CBDJ05y4WH8jNVuvJ2pHNeG
         CizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761695188; x=1762299988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MwoQy59dVEppfa04glBdVCRdHIoLSeADwlPJN/bsnok=;
        b=ICDZpHGn17qDvNy6K27inbVnon4o+4szz9MUQYQeoA8vYL4Fl6r8qir9Ub0SheOCou
         BsMO4bSWrGR7MTGl0fgs+3GtpoQXj6g9VjYRiZaKTU61immYSdGwCL+qd+3of16FbIK6
         UHZhaYd8bHA5MSDpr0IMlE4Fe00t1/kW8KFHq2EMfcwGY8YWZnmItNZK+u2TlFTsTVwp
         Gor16HmylNjQHnn40+Kct4hfjVewVGS6FdglNIhbD0E+9lHlHx+5BOQ4cO5BjnsztI5j
         Dry2Y78avy4jmyPhW2jKtDdfEzJP40mgeSfSgbnAKzfb4ffKcYbRVDND0oD76blAqMh+
         Dnsg==
X-Forwarded-Encrypted: i=1; AJvYcCWewlyKnwlQI47Fhgg2ycgiFlkaH49EmcsYq8Ln7mR07qYdxWPwHfhtEC/pQIxN9Li+OuRIB5V4JsrebLIGJ6x4AQ4T@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/o4DDRIa5btso3nWsnUwEM7PLBDTYH3bhh+lan27V1Zw9nlzK
	4tff2iy0rLGiy8uF8x9BibQQc44GeRQtZMVibVSXuhijIqaNDwfhCEgke7ImDKwf17Uu/5ZhfDA
	uPRWXpjI3dOcIQYhY8aqPTUNIB7nKdnd2K87yAQo=
X-Gm-Gg: ASbGnctES+J5ul7DB+Ec3Fxmc/jBJhadRkimaZ7q2TFoKOGn5gRUR6kJbxPWXkQhp53
	/wR8DBzKjOn38mt+Zlr6Iw2SYEh2t5BCKz/BYG2pbJxh2M6MxF3fjdPIPFV/0RhuuGmCLH2Bor6
	ZqtwuzFJWonoovb81Wpz5IG4eulqsMej09bOE8yEmg174PVXPqPTa0U9oOPqyPj/+RRx/UUBCM2
	hiWM0vOgIL0jNfQSE9ibXDcW0A8OtFU3ISZjAlxJIQGiFv547U4uAqYlDKFLCXRwOYN2dk0pWEQ
	zYXJIYnifmltG/cwQ9gyJra5V5GFaTfPLCreA55Yfg==
X-Google-Smtp-Source: AGHT+IGnGXhr7XsSiDeYPx+Ej4VOw1XVXr8mGYLW4gvtrYACbCkBg99g5+PEHlLE4Lv3JdN1glPIL3B3b9ZoyOp4fZ8=
X-Received: by 2002:a05:620a:1a91:b0:8a7:23f0:535f with SMTP id
 af79cd13be357-8a8e407c7a7mr145328485a.18.1761695188403; Tue, 28 Oct 2025
 16:46:28 -0700 (PDT)
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
 <CAD-Ua_ixbf1ApMPMMSner28-fRg7BuhTu3QSw1U=ozqgS9fUjQ@mail.gmail.com>
 <6f81529b-7ae6-4d63-b0f3-7787a668698e@kernel.org> <CAD-Ua_hAxj5PskiFdiEA7Qt1bWEhKRvCNAyQj0BQmZ2vDnV4aQ@mail.gmail.com>
 <089b2cca-4c84-47b0-a96a-0363ffd642d7@amd.com>
In-Reply-To: <089b2cca-4c84-47b0-a96a-0363ffd642d7@amd.com>
From: Lars Francke <lars.francke@gmail.com>
Date: Wed, 29 Oct 2025 00:45:52 +0100
X-Gm-Features: AWmQ_bnd2cylpOlPcySTatC1VTGg6fGmoeG5qKVSzzAW34pH2QIirASd_XhHmng
Message-ID: <CAD-Ua_gxPsTbG_3shtqAZX_E4ns5hHPZbTszQAXH2jbfLxP_Rg@mail.gmail.com>
Subject: Re: AMD PMF: CCP PSP fails to reinitialize after hibernation causing
 TEE errors
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Mario Limonciello <superm1@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, 
	John Allen <john.allen@amd.com>, platform-driver-x86@vger.kernel.org, 
	Patil Rajesh <Patil.Reddy@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 6:12=E2=80=AFPM Shyam Sundar S K
<Shyam-sundar.S-k@amd.com> wrote:

> Can you try the attached patches now?
>
> First patch is the same which Mario shared last time and the 2nd one
> is on PMF to handle the .restore() callback for hibernate.
>
> I have tried this on 6.18-rc3 (though this should not matter)

I just did and I'm afraid that the patches made it even worse for some reas=
on.
Hibernate works but when rebooting I end up in the console, the cursor
is blinking but I can't do anything - no keyboard input, nothing. And
what's even weirder is that after a reboot I have nothing in my
journal on that boot. Not a single line. I have no idea how to debug
this behavior, sorry. Usually when my patches broke the system I would
still get logs. If you have any idea what I can do to debug let me
know.

Thanks,
Lars
