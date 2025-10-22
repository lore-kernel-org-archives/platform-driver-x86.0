Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2791A2F6587
	for <platform-driver-x86@vger.kernel.org>; Wed, 22 Oct 2025 20:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761163483; cv=none; b=hJFjkRTDDJlRRrOervZyllmz7Du+aiCe4FJ/kvadhiulUfe2vXQveH9lmbpbP0uqjFWrSwIIrpFZlnhMFoIx0Q75QQ82ycCR+dW5E7tFCnAnj80jZ9pQRgDtk7wGvWvSq+e6wohQBFEQGQOjXm1xRbMY7drJIwcSCbpwwAgMcxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761163483; c=relaxed/simple;
	bh=pzKQpScBojcwimzec515EKqq3HVMVsbUfOukrN3jcX4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=jdf+wjjrqGpPzI8ieWa8ETaThd7ODwuogxfMzEJk2uKW49PonwApGdq3kWY/4vVN1taOObyaFWM52gAQrPFjrBab5AXuFDvxVjblY+2Cqpp8QVyZGdoa/jLloUn8AbplzAZ7B1mgVR1fZmvPiiboNIDVnq7Ya3Y83uaoDCCrQro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EMd1og8l; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EMd1og8l"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4e8b4e4ce70so53841cf.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Oct 2025 13:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761163481; x=1761768281; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=syfHP/FixWx6a5wca9WL1CTN+RPYcNgwgP9r+XYSx/Q=;
        b=EMd1og8lN3VEbabcdtRAXmhTFfi54Dq9CLBQmHvHVO6YrfZFe9+oa/AQ3LU/Q+Diqp
         YcTIA+d5bCAPDfm5QfwmZHEF7T3Qha11ZSD9GGipm8xlOK9A8AZS3KrrGC86rFfE7JyF
         XXlnPtNDv8cPhvE+jrDirlMSKxDzlUorrbZ6+5LRPww9KxBr0rwBdfd7b+WN+igPsLJN
         S+HPwh/G3LjNOvBgu1115ahbiwE4FIm6DM8w2f4KMcB02vpOpGI7ibShfN+i3E8Z61ze
         wEe2szx6LyS+88b9gIWdF1u5deMAcquPWVxJkb15BpHlBszNJJSNiRkGgPc7yRHMDW8u
         JapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761163481; x=1761768281;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=syfHP/FixWx6a5wca9WL1CTN+RPYcNgwgP9r+XYSx/Q=;
        b=e/QN5bpsOynQENzYpTLPem6BFYGNXv65p6Flqx4HmTAeLImbRpj3adG7RqVnblNMaa
         IFhe7ZgaDReCS92S+opVBMx5G+zN2duyrtOePirwdT/lcdWtRF8MejxSWkCt9mMUtAje
         esxsUF4pypF4B0Qop5lxWu6XzmvQ2l9KDWMeWUvUFfxRgF6JE4EN+aeJuzHbgR2xyFOH
         6ER3fI/WOhQIVOAkX+Jqp5sey8+SlLxlFJmLeYgffHkB+Tgus6ePUQlyFjNIr80Homa0
         sNMMnqqBQBlZGqlzhgBlsj1F7+A/7gPWg9n2hACTHh0eazkja/xfUvUexNB+E8ov+rPZ
         +WEg==
X-Forwarded-Encrypted: i=1; AJvYcCX1gk2se0M0D+wSAp9tHfkdurRv+BR5CqJmr7OSOlfU0MT/+7KLOIbcGUuNr6ZZmrevod7xmdZ6JDfRAHXA1d1tl3lR@vger.kernel.org
X-Gm-Message-State: AOJu0YyySkNvBoCICAK4/wrnH4PW7/V+hUYiIznq4MCRqxMxWZqWjKM2
	O0OdNg9U5nAyt6UfPcIA90MTkZWn6JbGpf+osUm/LnufPx8m8IfB8hgcOpLoLLxA1KkBNkVy4mm
	NYxD6XROVB8/3PIfchvS/XM9NtLz+Wdw=
X-Gm-Gg: ASbGncsFfVi64qypl/2bf86g7YYOz4t6iZ0ElG5U2cZGXikqnEWV+LljXlGuYMcIpRQ
	58Lc5KKsoBnV7gcMaTRh/OhwmGMxf+dzNSN/JMcZ5j1Wz37utFiFJlROJLMYNmPHcdJhdkcoXZS
	NBZvsCLedeug/Z020mCfvnNfn/QDGTTeB4QNfMm7gyHX1NXyBnwJ/1DYOdIdkLWMNeGzdzHhpl/
	eSSLiIlmt6JkuMMSegVE6f8YKT02vheT0vAGnsu+ofAtwG0XqXktm/khYL2siA=
X-Google-Smtp-Source: AGHT+IE1HWyHR8dNmsL/vupWShf0EnMmBLwIZCUAx2VkzgWhdpLJSHSZLdM+SlzZoEX3Akpmw3L27v7UDRGKoE9XmG8=
X-Received: by 2002:a05:622a:5cc:b0:4e8:a51e:cdbc with SMTP id
 d75a77b69052e-4e8a51ed369mr228082021cf.43.1761163480648; Wed, 22 Oct 2025
 13:04:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Lars Francke <lars.francke@gmail.com>
Date: Wed, 22 Oct 2025 22:04:04 +0200
X-Gm-Features: AS18NWCDJ6rJiqppxhoJehMFE8nmq0piGouVGcS-qrA3NzToKDxrGF9TcWGHqlI
Message-ID: <CAD-Ua_gfJnQSo8ucS_7ZwzuhoBRJ14zXP7s8b-zX3ZcxcyWePw@mail.gmail.com>
Subject: AMD PMF: CCP PSP fails to reinitialize after hibernation causing TEE errors
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	John Allen <john.allen@amd.com>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

while I've been active in the open-source ecosystem for years, this is
my first report to the kernel. Please be gentle if I made mistakes.

I'm debugging hibernation & sleep issues with my HP ZBook Ultra G1a.
It has a AMD RYZEN AI MAX+ PRO 395 w/ Radeon 8060S.

After resuming from hibernation I get this log line once a second:
  amd-pmf AMDI0105:00: TEE enact cmd failed. err: ffff000e, ret:0

Right after hibernation and before the first of those errors I get:
  ccp 0000:c3:00.2: tee: command 0x5 timed out, disabling PSP

On boot it looks good:
  ccp 0000:c3:00.2: psp enabled

I had to google what TEE, CCP and PSP mean so it's partial guesswork
on my end that these are related. It looks like PSP hardware(?)
doesn't come out of hibernation properly and is disabled which means
all further calls to it fail and I get the error message.
It looks scary but seems harmless?

Commit 11e298f3548a6fe5e6ad78f811abfba15e6ebbc1 from 2024 has
more or less exactly my error message but it doesn't seem
to be fixed for this case.
https://lore.kernel.org/all/20240216064112.962582-2-Shyam-sundar.S-k@amd.com/
(I picked my recipients partially from that mail & maintainers.pl output)

My Environment
- Kernel: 6.17.4-arch2-1
- Hardware: HP ZBook Ultra G1a with AMD Ryzen AI Max+ Pro 395
- Distribution: Arch Linux

I can (try to) test patches and provide additional debug output if needed.
I have not tried any of the 6.18 RCs yet but I'll try to figure out
how I can install them next. Looking at the git history I can't
see any changes between 6.17.4 and 6.18 that seem relevant though.

Thanks for your help!

Cheers,
Lars
