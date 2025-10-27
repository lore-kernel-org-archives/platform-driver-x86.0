Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F07F202963
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Oct 2025 21:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761600241; cv=none; b=FhHwNpsasPCpDSoX6+VeawDdYDuO3Mgskvy6Gj7rbfBkDxhumhx8TQcuJpisdGkNkJfw5AmfLiWiCDSvMrLIhVTd/ZzDM9vw0HXzwoIKTBfES+68b54boEe48sXPltEDQ15tYF3yH1jNzaKOLAWCFIfDI8jyRjoyHCLJmGdwwm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761600241; c=relaxed/simple;
	bh=1wUE/REmV5er33ZrZ90tFYHgY3DZ5ahpENtsLCHltQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YAak0sgjLgvh80eA+hGqO1c+rEqJRuM4nY3ImQa0n/ugpNd1AtSV20c5amv9OsNRggI4fbruvij0052AvWmcRAjLxu1cbacc3Ta89w8Srr3ORMb7SdkvOqvIaxtb1Ro68f/4r+a6R6hc7y9PEeqZ43O2hRryX8+Y6wl5sjEGDcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nDhtBduH; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nDhtBduH"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4ed06acf75dso4909211cf.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Oct 2025 14:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761600239; x=1762205039; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1wUE/REmV5er33ZrZ90tFYHgY3DZ5ahpENtsLCHltQ4=;
        b=nDhtBduHgBv4T1qTPhAgyMw8bdG3q06XmpqSmDhW5SN2o8ZVvPaRZJiqSQ7GvPk0Vx
         P143sxm45kpVvaiAhab0n8/D/YwEPqaeWr8qRqPHqmjCDj+J6hGDTBtWTropYxZEOFYH
         UQ7Z8tDuL/fq9gujDjBCooMU2g/F8w99FvFkq0BV11iGWZSjhs+iOF0PfPv6t/UkweLy
         +4zjv7XEM65ZXAEAhkeUkFYluLv87EueFrV5l0myY8sMhprKFswnIjL9VBfC732Naz3d
         jajdw9MJSymFh6GXLuffFCzlKJ9KOSMrTGKfQ5eelGqcm6nc7AjeATnVkdDWvk3yxlVd
         t/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761600239; x=1762205039;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1wUE/REmV5er33ZrZ90tFYHgY3DZ5ahpENtsLCHltQ4=;
        b=RULD5xjC/gWJtoKF13HmyOy0f0leuL+WI5nAOEAyz77DZx4BbBKODxbp3WCJ5zgJZe
         GZP+CnmvZjDKQKORgParD9w76ggam43wm+spfnFZ5JFC34le80foqVF73LDZRnom2NA1
         QZ2jhtjoS2Pg6s2Ekg+duBySe3dg0l5W8MNLVRvl+MRlyhPgrJulk2SwXsKlALON8Qgp
         Ia8mkSyDD/ITf4bixSYbrU72ZhgLlJ4KNvZC+4n2YnFrrFF/CQR1v5aOSY8k4GGDrC7y
         c1CHvcImH7y/+Q4MaEYTev9PTvr9eWkoibZLXbrksJn1d0q7akZqdFf5C/SDxGBVHGQg
         DjAA==
X-Forwarded-Encrypted: i=1; AJvYcCXyxhMJBMpIJQlzTrLsrpv02g7e6NSB9WQDO/d7uPAeCgGnDEbOSp2uxAoEtMpCZVnnvH+L8wuRR9LtY14ZOoNYZDwt@vger.kernel.org
X-Gm-Message-State: AOJu0YzyiKuFVcygOHXDs7KS3HcGlelReV4bg2NIQHk3rL8ErPMwk6HL
	ZEe/zO/7PewzL8RmeHe1dZzVbqpDY5lZreGruIIAaWrqGD6trHy2Ma6jFZMe33cDa5YkTDxTLYY
	lQmcSVH+LsmgFVlttO5dNtRcszTGw7mZtaBcoiWzvSQ==
X-Gm-Gg: ASbGnctOwYXmW32jJ/Sa4ihh3U2rOUaRPyoMLfG1+M+58TYbm4Kf8KE1JUvcBjmmqgX
	tagsUpJmuldFNFY9/DuQHWae1dYu4xD1MpzX2TpC19Z8VAKg4Rm7APS7wJ3Ypnnba+QwHZy5CDS
	hOLo4Z94aNy2q88Ow+rcbMBvAtHANx15hPuh98sPhgACKgn1RscS014kjg5pvg9KwiOrUZMuU1u
	M6RxZ841iu1fZPam8xRcbAAR/QfiVC8iM8eKp5tVtZsAJQst6YLG9NWMJvKO0ULsy+hWDguGKXq
	mLi8tL1/ofz7/rnmnNz4R/Z/i2sGNgxm7ywrfpXkOA==
X-Google-Smtp-Source: AGHT+IFOvVopDmgN4RksSnWU6rbsGeLztMA8VoVJJ+bCzz92P51NM0XSr2iqGbLrm/m5Iy9Olan/7ACjw1iFDDbEq/8=
X-Received: by 2002:a05:622a:3ce:b0:4e8:a560:d980 with SMTP id
 d75a77b69052e-4ed08a4fa74mr14082871cf.38.1761600239099; Mon, 27 Oct 2025
 14:23:59 -0700 (PDT)
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
 <3896a83f-c7b4-4ba4-a223-946562fb21a3@kernel.org> <CAD-Ua_i7VY+a1Mpn6_iubouYCLYOcx7ZYaKNBgtGQw6w8wuU0A@mail.gmail.com>
In-Reply-To: <CAD-Ua_i7VY+a1Mpn6_iubouYCLYOcx7ZYaKNBgtGQw6w8wuU0A@mail.gmail.com>
From: Lars Francke <lars.francke@gmail.com>
Date: Mon, 27 Oct 2025 22:23:22 +0100
X-Gm-Features: AWmQ_bkKblCzLtsjxiTh7_BxsBCKsGXzLTYuViKMeAZecUHuetvvgpaRStwBKzI
Message-ID: <CAD-Ua_h2GcpLwAfujyVvS7cF8o0txvpfCF-33baH_Q1D3jUewQ@mail.gmail.com>
Subject: Re: AMD PMF: CCP PSP fails to reinitialize after hibernation causing
 TEE errors
To: Mario Limonciello <superm1@kernel.org>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	John Allen <john.allen@amd.com>, platform-driver-x86@vger.kernel.org, 
	Patil Rajesh <Patil.Reddy@amd.com>
Content-Type: text/plain; charset="UTF-8"

This is with a bunch of log statements added. Not sure if it helps.

Oct 27 22:04:57 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu: PSP
is resuming...
Oct 27 22:04:57 lars-laptop kernel: ccp 0000:c3:00.2: tee: ring init
command failed (0x0000000d)
Oct 27 22:04:57 lars-laptop kernel: ccp 0000:c3:00.2: sp_restore:
tee_restore returned -5
Oct 27 22:04:57 lars-laptop kernel: ccp 0000:c3:00.2: sp_restore:
tee_restore failed, returning -5
Oct 27 22:04:57 lars-laptop kernel: ccp 0000:c3:00.2: sp_pci_restore:
sp_restore returned -5
Oct 27 22:04:57 lars-laptop kernel: ccp 0000:c3:00.2: sp_pci_restore:
EXIT (ret=-5)
Oct 27 22:04:57 lars-laptop kernel: ccp 0000:c3:00.2:
======================================
Oct 27 22:04:57 lars-laptop kernel: ccp 0000:c3:00.2: PM:
dpm_run_callback(): pci_pm_restore returns -5
Oct 27 22:04:57 lars-laptop kernel: ccp 0000:c3:00.2: PM: failed to
restore async: error -5
Oct 27 22:04:57 lars-laptop kernel: amdgpu 0000:c3:00.0: amdgpu:
reserve 0x8c00000 from 0x83e0000000 for PSP TMR
