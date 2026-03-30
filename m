Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818E94C6D
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 20:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774900895; cv=pass; b=o0a1NneDEO2+0lLdoUXA3DwiOHNvWIkioU6bMSYRC1jrcU6uDlw6hS3JRGDAlPu5d8VdmWfEarDXzbGul9IO7LouqENVQgc30n1G4YbjUtdPfja6z3NPQsqULofEsEkWGFaLIDtbYWfqNOhalFoqLOGvEl4BySmzkKhyVVnKFjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774900895; c=relaxed/simple;
	bh=Kor+56ot3pmrkCh5O1SFVHgT4b45Wo0NMiGEBMVJGwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JbMiuDxWQ6O1e+AiPxpJUi+ll/NZ55/zGlSnC3B3Gz6/1eY/+pS2xTaz8+LYZcm8qSu/56DqcnndxbAi9jNQnSSBKzcpt0VlCV+Jjd+JOWN86jCE61p8rQ2hfWEKIK7pRSTp4yzgx92Kv/WHSpsANt06RmcQ1vgMNkrcGiO0tNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e+CbjzkI; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+CbjzkI"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b980c65b97aso738492166b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 13:01:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774900893; cv=none;
        d=google.com; s=arc-20240605;
        b=f4SX3rMfAYiKa/gqeoKC6qc14smX6rRpLqJRjBbm5cf4m+3uuW0gUaw/oeMSKQnCYW
         llMcE5pe9kSIzZ0fEq0RGxUSBaQrVqpRNZr4Tir5BEZFYy/Ot2TLpVrFiK5vHflmrNGO
         KpN54DSKcRwtTm+/g+lVKpQYgGGXDzfNIVRbCGhetzrsBabRyMzK2S27LEKPfGT5dL/U
         AIwJcY/SP3d+JZTDWVfloSmlr6exJxGOYk4YG+cbR1hnQlAMpC1dVMUGRSRe9azmBXKJ
         5KvMvT1BaybPg0ynacfxu2BlN1mL8dthlYKQX39EarjEAPlWuJZhXZK7e0hy/Y7HZpTJ
         IeWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Kor+56ot3pmrkCh5O1SFVHgT4b45Wo0NMiGEBMVJGwY=;
        fh=bl3oaCkJqJLi1976U6daTIbmpx9cT8+79DLB542x7lw=;
        b=kGhhOJCpewG9nFmFEmB1nnOt4mfp/ISVdlNvwqKLo830wqCoGWWXUHvU+Ec5NiAq1V
         NghcYKNf4q0IuVpLDdfeq/th1L1X4OKBqhR8DDJiFo2e/qOe9PL8ulvF9tCjVsFPGKnL
         jAnFcpwCWJYG25aBjQQR73KJ3F0xIxnj4uU5wFuLDRytarMVuIjah2Xqh8drk2zF/pgh
         L3AnzvlGNCcrgM09ADL/0gOJfEwAjZb6rXSm4LS24Z8fOQMJkAmrKsdBnlNfQyQJlG0D
         AieWgMOqW5hHNgniXFQKgh8wz5h/doUPfinHVZCi1HnVQSjEcjxDL8PYjZxiIwRd2kT5
         Q7vA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774900893; x=1775505693; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Kor+56ot3pmrkCh5O1SFVHgT4b45Wo0NMiGEBMVJGwY=;
        b=e+CbjzkIynqc5TMGQvZp14CqsnRym/RoDKuVZVDgjBPsctOAU6Qnr38gt2nYgw9W56
         sFm/eFryodSL2caTmpLcd6qc9jMq+QO0PKN4OrpnoxQE6dDE2M0uzFMCXcBPYQvBuKap
         oV2yBEktU4xmRyj7ulvhi5so4Mr2QI5zO2FT/FFm20awZrHTH+VdoZXgLHe2paF78/US
         kaeSkW4d6V36Cso+D8gtNTC5OOvHrdmTo6ypOzisyS6tV8CTsLwbVBttqXZK0aPxLx2/
         SxKVK4DtgJEP6bEj0R/gxQBb1N3BuAofa8xrnuTTmE6fUJLJkRMbs7Zrb1oWcCkiUoc3
         Qeyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774900893; x=1775505693;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kor+56ot3pmrkCh5O1SFVHgT4b45Wo0NMiGEBMVJGwY=;
        b=UcxjTsw+7+VayBGBZzsyHtMvaLpSCsrPdbsV0RHw4scAq9/K2kuNY7fSiKKTh2JKKB
         qLqd9h0eY0JVV2q3xYd81OdhyZ3Wa6ampH5OXrvOiRlYL38erDpcCXkAppfHtznMFuBy
         1iloZHt7USC4mXL/JrNvwI7IYlQ+uVChignD58skGbWaNQSRkZHrpnZECPUHmCvwEiVZ
         cVa0sc7YxEDYX3+0EWX2cT6sBJskNShbCsYty26OonzOwzT9uAYV6C4V6TLJapHGOIpG
         w1JoYemai0gOQOH3ldN+Y1WEoXsILq0rwtVbdtIsxWTbegdvL6KVLslyr0dP5bYijElq
         agow==
X-Gm-Message-State: AOJu0YzQo+ZBhPZ7V9WYMabiHfXRfD7XogngdHaIQS7cG8ihipbrUe9S
	08ZwE3iflVDbYCeaUiQ1l093iDRgYSfopOheEYEe0V3b7KMeaVDp8lsr0n4X0uoe1rJAhXmR/nh
	7QYBxCA+BFBk0tRowpBZcY1x+MgfvfnAR0/mX/10=
X-Gm-Gg: ATEYQzwGE9bvqjdenCSUdxZhWJ/1i7OOG5DMlj+UPJZyw2E1ZPBc6v8cVgAUSwmE/uN
	0gPIRD88WwaVIQMVH2QPUrwriMMOrKp1p3tjcNSSYTG82Jm8c2d1KM2U+xnWFp6o3Q2LDgLEimY
	ldlIPNEGNfv89nHcCBi2lexITYAZnjltgt1o92IUGYJSQjFtFkah7ut9VCJ7R04ReuAbA3BDFj1
	Dy46ak8C7kKinIS7pWVYRKGaQqguy1lM8337qG7t/hhK2ZKxde3q6IxQ0YsL6CKVUWM6si2ctge
	ml7l8w==
X-Received: by 2002:a17:907:960e:b0:b83:1326:7d45 with SMTP id
 a640c23a62f3a-b9b508d6014mr845872766b.32.1774900892440; Mon, 30 Mar 2026
 13:01:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ0oKyQTEJit294y=fs2s2nzhzUs_GQzsgMswDNs==zkdiqz0g@mail.gmail.com>
 <05ae0012-db1b-4826-a466-f706d2a57cc7@gmx.de> <CAJ0oKyRU3=qBQvxaBycQYAyxCaVogzuVNv_M=4=npTkBF=X1zg@mail.gmail.com>
 <18a5bcab-84d2-4957-a053-dabbf900e85d@gmx.de> <CAJ0oKyR0VPXz887cJsF+oUZFYVD7QY3F3FXWbjAGZGTmFFV-UA@mail.gmail.com>
 <81b30359-7090-430d-8cb1-805cf2d6fcc9@gmx.de>
In-Reply-To: <81b30359-7090-430d-8cb1-805cf2d6fcc9@gmx.de>
From: Ian Jensen <ianmoellerjensen@gmail.com>
Date: Mon, 30 Mar 2026 22:01:20 +0200
X-Gm-Features: AQROBzCQLXzyyncDXJiDLuIvN2tFWjEsl_03zUG1b9uCCRSapUygRjXUHSGeSmA
Message-ID: <CAJ0oKySZ-7eqtYoD6OL1VCpzYuQULdoRNi2JrbomosKDt5aO6w@mail.gmail.com>
Subject: Re: Internal keyboard non-functional on linux on Medion Laptop -
 NTC816 (Intel IPF) has no driver, PS/2 fallback produces corrupted scancodes
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000034dce0064e435194"

--00000000000034dce0064e435194
Content-Type: multipart/alternative; boundary="00000000000034dce0064e435192"

--00000000000034dce0064e435192
Content-Type: text/plain; charset="UTF-8"

Hello, here is the output of ls /sys/bus/i2c/devices/. I sent it 6 days ago
but it seems to not have arrived.

--00000000000034dce0064e435192
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">Hello, here is the output of ls /sys/bus/i2c/devices/. I sent it 6 days ago but it seems to not have arrived.</div>

--00000000000034dce0064e435192--
--00000000000034dce0064e435194
Content-Type: text/plain; charset="US-ASCII"; name="output.txt"
Content-Disposition: attachment; filename="output.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mndm5l7i0>
X-Attachment-Id: f_mndm5l7i0

MTYtMDAzNgoxNi0wMDM3CjE2LTAwNTAKaTJjLTAKaTJjLTEKaTJjLTEwCmkyYy0xMQppMmMtMTIK
aTJjLTEzCmkyYy0xNAppMmMtMTUKaTJjLTE2CmkyYy0yCmkyYy0zCmkyYy00CmkyYy01CmkyYy02
CmkyYy03CmkyYy04CmkyYy05CmkyYy1TWU5BMzYwMjowMAo=
--00000000000034dce0064e435194--
