Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CEB2DE6F5
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Oct 2025 11:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761563600; cv=none; b=r85Fo5570Wh1Cd3inuLZrRrrWe71k/uAaS8d8ONWiCgiUhVP8/mT+0ViM6wbwj64wkQHjsygpPI4u4kmZKk0VOSQ46YVoF2utOmoiPKkDo44O6wKu0eYL4VPZ8jDoeYlVeuy1npRW2yNwQjH9pLOaPA9gSyPlDTh86PpukBnso4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761563600; c=relaxed/simple;
	bh=kyGyfd0WDHuOLYm/3W8XMaV5zq5cyOUzMxoYlFvv3OI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eezLwRWuzUbhQrSQwrewnw7CjitXwNBJi1rnyDhbk7dmzvteAQK+yV9srVftmnZxdB6gL6WpxY3kSW0rENeWpONjpGn99abHSUNiWbKb3vwYuEgYv3ifvRxUvXX8jiZ6b5w1WEtw8NbSNb+XaKnnRj9eKqiemcbwpNnORKCbngk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hTlWR+1U; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hTlWR+1U"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-89048f76ec2so514843585a.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Oct 2025 04:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761563598; x=1762168398; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7h2yc+ZK9f44i4Nk0bu/mR8+N9LW8ltI7/IqUFSyAAY=;
        b=hTlWR+1UQNCId8xVh+7Jz1p0Cyn1v4HA2cJ58QC4mqOCdM87XO+Y9Mh/pMpSV/A6+r
         DQ1QnXGHBrg8ejFy03dZ2kEZKswSNMrQeXJ8twQcm+azusWgfxQcNfDGLJqZOr4ffNSN
         /PMeO0iRO5n//2PFXtgS4+WYwfQuVRpyzYVETV0HY/pFPQcFdx14oTS82BrsodS90qHV
         3DPNK3HBNlnZ4x2NoFEmut+4brpLNd4OrEN0qHkFb0efiFAa0wv6OSrWdsMVaWcEbDD9
         lV5nM4Ky7Tg4NcoMVSpKuWCET2IK/ye/Kiklqo6U0n1U7nrB0Oj61nIpaxDyyq/vO+yu
         Ck6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761563598; x=1762168398;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7h2yc+ZK9f44i4Nk0bu/mR8+N9LW8ltI7/IqUFSyAAY=;
        b=gFWZat4TcXakfyeodQmOOd0IqWCx52z5EuVZelC2S8PMBnm6pEcgPoZtOm4zGreYtp
         NcT/F/WZGH3Z5EG11c3zyqGeDpLKSTIT+7YO1QKqCfDV10L8jN6Ggq49u2+ruBwkPgZG
         DRVhdLSso+EukOsx+DMGQ+y/FchL9k8isdYmajt7Ya5MMfdejOVTEBPDnYpVPonNdfeq
         0AayWdNy4xCHPKP9cXjla4KXDrxPM9je7J3EOyBO8drsZUmo90vYKs//ypor7/BBBYcW
         DTDQAsv92SLNo61buuOt5lbxcaga9QCACFTcPbaKsE4x2zKWGxZawlEPBaoW1ip+a/7z
         yB1A==
X-Forwarded-Encrypted: i=1; AJvYcCW3tz+vtlqJ0+WGNk7hu2MXOx2sDX23Q/wyNqLPZhxcl4pHbJY037N6Cp4qn3aSh6Xu1DQrEeGwr5rZIGDICN6pKoBn@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9rB3/Na+MteYk2ebEfdMl67WGzGgLbe/u++ximQhJcExqxz1D
	fqv+x5fA5iG079UCWB1EX0cqARYK8iarY0+VWSEwhgGfPn8MjyXhNUPgExxF9L1ar06MJgNzd1g
	6U5cwDTCiMRwdq1Bsjvq+LpgToUyoM3Q=
X-Gm-Gg: ASbGncvoOCJvAZhotQhwHckIwUOTFaKZKsLW1GhgCwmCi3YJ+oIhY77hzjfp5fbcVNh
	KdIzGkgiMbFC5VFCrgYfmxIza20YvAgdyvLGUIiqpX2ht4k3oiywPN4VFZMc4CCrdK4eWFk/Xnu
	fVlznAqN8VH9wKJeGD640DEubhAsHppxAZyLRN/bxmGonSlgbrRJgCR1T7+riO1M3D78b2NsJbT
	64bMsGAc6JtjOD8Le0Ma0DqF0wV1hcbmM5jSbtHf7uIsgzYi6Grr+kx0He/cg==
X-Google-Smtp-Source: AGHT+IGPwWOJrFyXvXb7T3DVKbJtMm7vnQxOJ2TbX9Lqjn9OHCO+mEXPS2o1+agHQbmiCQgssSgQDykdd+k50w2tOmQ=
X-Received: by 2002:a05:620a:1a1d:b0:891:937a:b095 with SMTP id
 af79cd13be357-891937ab177mr4195077385a.16.1761563598182; Mon, 27 Oct 2025
 04:13:18 -0700 (PDT)
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
 <98d440b0-92b5-45aa-a42b-89dd5a243bae@kernel.org>
In-Reply-To: <98d440b0-92b5-45aa-a42b-89dd5a243bae@kernel.org>
From: Lars Francke <lars.francke@gmail.com>
Date: Mon, 27 Oct 2025 12:12:41 +0100
X-Gm-Features: AWmQ_bnAKpS2UBBL9rJVVUrVWJTmwd-mf7__pzMMQzKVp-stwbQLqIozMh3z2S4
Message-ID: <CAD-Ua_g+ifUOoJORoBiypgk3v4ynTjw=nvmoK6DJg2h-e7aXEQ@mail.gmail.com>
Subject: Re: AMD PMF: CCP PSP fails to reinitialize after hibernation causing
 TEE errors
To: Mario Limonciello <superm1@kernel.org>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	John Allen <john.allen@amd.com>, platform-driver-x86@vger.kernel.org, 
	Patil Rajesh <Patil.Reddy@amd.com>
Content-Type: text/plain; charset="UTF-8"

> One way to be sure it's applied is to add a pr_info() message into the
> new function.  Then you'll know exactly when the new function is called
> in the logs.
>
> But assuming that was in place then I feel this will still require some
> other coordination work with the PMF driver then too.

I did that now, thanks for the hint.
I added a pr_info to the sp_restore method but it is never printed.
Just to confirm that I'm building and booting the right kernel I also
added a debug line right before the "TEE enact" error:

Oct 27 10:50:06 lars-laptop kernel: Lars patch worked
Oct 27 10:50:06 lars-laptop kernel: amd-pmf AMDI0105:00: TEE enact cmd
failed. err: ffff000e, ret:0

In other words: I'm pretty certain I have your patch applied but
sp_restore is never called which I think was the intention.

I did play around a bit in the code but all I achieved are NULL
pointer crashes :)
It looks like "i2c_hid_core_pm" might be a typo/copy & paste error? I
assume it should be "sp_pci_pm_ops"?

Cheers,
Lars
