Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279451D9587
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Dec 2024 18:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735065991; cv=none; b=Z1w1M9TBJo0ZGbeQJ9Mo/YjbtGsMtjm6t6o6rRVEnRbgbVL8xlC0Kql/8beSr+X4/DztcFhFNAWpePB9itBrORNUfUylvTIkAgYVFGvQZ2VQTV4v8/36VGe519eM0SUTXf5KtRBX9svxTgauihKupAUMBhaRoLzNbMbBZKQxpIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735065991; c=relaxed/simple;
	bh=GGspTzTy2xy1//1Ta6tTuRjspRGT8EKOaLiUQQi0Q24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ucwnPdQ7ph/j2N3jPX5GPvQHoabE1ZZV3cHSmnf+sNtopeuD3AdwhOSjNDvKL0UY3V1sr134wp51AJTyfjo/eezs3BtCGQRT7ES+mWWaEQaJZR1hMvCWhUlVJhDMv+dTcD+caDxUxkZT5XWoDFDBP90Usq85rhL4PAEpq3RyE7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PVl7J3qz; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PVl7J3qz"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2156e078563so51474075ad.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Dec 2024 10:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735065989; x=1735670789; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GGspTzTy2xy1//1Ta6tTuRjspRGT8EKOaLiUQQi0Q24=;
        b=PVl7J3qzm30ENlzYGkKZB5ri050pnb0IiaMQo6vEt1tC8YRjxwiQ3nfzYBX/8sS3JK
         YYGOMX3zBT+/1tKR3+MQsUCQfqWeyJvnX57VsdTsZWzcyjzC9hKGNWx6Dfnk09fRlg1N
         iaEJKXR9la9NkBqW076Gf/a5Fb/bKqBAwYYluMNKljrPoSmxcLi2ceaMg/hirZ+vMaC8
         mzWyAZuxBP7+x8KCNoe9tBOuTILG+lYH+9W7xBisih0jLm1Lo7/S/Py8I7HehEeyyKNC
         nQLoJ1FCLL6cJPK+7NUgYYYz8/ATKB9H8fnpLlPARrHRoq3uaTLHAkYgC7kDB7zEtLFa
         dByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735065989; x=1735670789;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGspTzTy2xy1//1Ta6tTuRjspRGT8EKOaLiUQQi0Q24=;
        b=K+uGn9yIs9l+3hVZrgVI41SfDS6GrT4UTdX4Zk2uTorXFRgqFss13d9gQaplds6ehw
         KJdyhpjTvNgbHtgdC85AToUqhJsKfPr97OG8GdSSkQdfe4F+T+NZ8EDGN4JV+B1ewWV/
         JCMLp+63nZMzotU6o7Iko/IGSBAsyaMTq6qVxXlunKHMgzhFKNYf69M0uS7KUds0udvz
         nMUV6OmpzD9kBEl9ytEqvbjrCXrsv7ZzjuwKladudZ08wlz3MJu2aAowEfHfv8lENZqz
         H2UPeM2CUUUu9+p1AMc8KcPj0NhV0egjla0roEkB1t309bgVtUY8O2s3U0xl6p7AOn3b
         nVdw==
X-Gm-Message-State: AOJu0YxF1vJdRNgYm3L38TN7z4XUOLX2Hrf+hD/i+U5uX5N6y7lceiE6
	c3LgDfU63c2zA2qOmTkss7r30hKxYC0QUVE/IsvCct+GG/NISv4NVEWyFSLHsEhAe8z9/rsck5F
	uBCMxqn9BI5OKLEwjuUzKZvxzCTfD8lav
X-Gm-Gg: ASbGncssxdn9KfUMSuf9aEsiNE14uVU5pHFLcgXPL13to6zGsjCLSQL94TzBhYSYlKZ
	znWpAiPHhg5Wer2l5hTUc/wfi7Hp2OUNq4MHE3A==
X-Google-Smtp-Source: AGHT+IHYCaCgz92PV/ErA5yO8BauXZLrgOtW33HdpMR7o1CVy/u1jlTjXJDgJeck9DtlGCQMV4mH8GbUY0DkgKGutk0=
X-Received: by 2002:a17:903:32c6:b0:215:7dbf:f3de with SMTP id
 d9443c01a7336-219e6eb3b16mr263259295ad.28.1735065989275; Tue, 24 Dec 2024
 10:46:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALiyAom1xDH6A0Q2WNHCMUcpMJfM3pXO2DaW=bgHGUi8ZOpBbQ@mail.gmail.com>
 <8b8749c1-59c8-4f95-a43e-055cf94f9597@gmx.de> <CALiyAo=R1kcvwRpw22s=YU0YHUxR8T_WHLwSvDr=8Ahsenn-jA@mail.gmail.com>
 <9c625119-e46e-464b-933d-9c836577f454@gmx.de> <CALiyAo=7kVi4ipA5-xDfRYQ-gqyza0woYHUzwGuW5BccLOVHgg@mail.gmail.com>
 <209f39ab-a312-45b5-981c-8324d9b8cd90@gmx.de> <CALiyAo=GpKN2Aty5c3Bw0Vh4U16vgUP29pZkaeBsOKw8kcK29w@mail.gmail.com>
 <c5124fb9-74af-4c90-9edc-ddb3517cd9ac@gmx.de> <CALiyAok0_JKE+BkUQxHHH8Z39FHq5bW0Hb1Gk-MYHgDy0yFoMA@mail.gmail.com>
 <cea0918c-7c7d-49e1-8b33-b952b64d67f1@gmx.de> <d7be714c-3103-42ee-ad15-223a3fe67f80@gmx.de>
In-Reply-To: <d7be714c-3103-42ee-ad15-223a3fe67f80@gmx.de>
From: Hridesh MG <hridesh699@gmail.com>
Date: Wed, 25 Dec 2024 00:15:53 +0530
Message-ID: <CALiyAomaT5y10Bawth3X44WB9Cie1fhW0GyBZgASo7ySK6g9zQ@mail.gmail.com>
Subject: Re: acer-wmi: Nitro button doesn't produce a WMI event
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Am 24.12.24 um 00:06 schrieb Armin Wolf:
> This WMI call is already supported by the driver and exposed to userspace using the platform profile interface.
> It seems however that your device:
>
> - does only support the turbo profile and not the other OC settings
>
> - only supports a subset of the platform profile choices
>
> - uses a different EC address for storing the current platform profile
>
> Can you test kernel patches? I can prepare a patch for you which:
>
> - puts your device on the necessary whitelists
>
> - fixes the platform profile handling
>
> Thanks,
> Armin Wolf

Oh I see, thank you for your work! Actually, could I work on the patch
myself? I'd like to take this as an opportunity to learn something
new, I'm also a mentee under the LFX kernel bug fixing mentorship
program and was hoping to create a patch which could count towards my
graduation requirements out of this issue.

I understood the rest, but if it isn't too much of a bother, could you
tell me how you found out the EC address? (or the fact that it was
different)

Thanks,
Hridesh MG
