Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591D137F319
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2026 02:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790044711; cv=pass; b=VZCwJK+V8MdHG3YNTwI3XFXaDau3Owllb4Xg5vBUhV7MN/gahKfcylNKKxJ+FA/LBMmB2lpo278kNl5McDpm14pxTT1vb97/1DlDZYjFTW7oz77zqsFouFEYIGeof7LmOiHQBVJWDKcVZR8jfJzWy9FPQe93oZg1n/gYrx+2Upc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790044711; c=relaxed/simple;
	bh=WbSgfukLRhlbeKFLy822gliOp3+chBonUKVsDk9aHns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D2OsG4xZ3b8ClX/d/q2Y0/hghI5A0oscGNFaXmEyZz5EiCSW1F/KfUvJXukFPH49OhW6ZOLFkEsxPDSg+nw5hTtpp7wFGWG5Z3TU742FwDlHc8rJOmTakbYKlvAYvfIRX8TSasHi7ScmKmNW9W5sA344SYYXuO7APp/EXhpGTsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q9Iiscu8; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q9Iiscu8"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4aac929eso3211639d50.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Sep 2026 19:38:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790044708; cv=none;
        d=google.com; s=arc-20260327;
        b=PzYSgs9j5oQHBMcGmEILqCjWe/DTA0SBi1DjaTK8vRm4Hw7+MHjxlOT19LnGTAqmdb
         3ZWsvIGpRnwOtcyWwuQMm3XLezuRrVx7E+6U0C4eTaQEVEB/PJPiTwxh+WPC/5wXIkD9
         wxZCCLqev1qaNxaPJxsWO7E1t+jYAcD20AsKOWK59oMTD/iSHunlwfhtT6gYF6NbFnNJ
         VDT2uR90oq22Cwl6S6l21E2npzKPZKJGtjioUzfUyOoJUTTDKxHvwwMnu4OyhgNVBzm6
         BeUHqodj+FH0oFikU3pdS4Pp4HDcWn+4GUBy21nS2VPBn4hP3P0lRVCgoHffwhqDbXbc
         1V7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=i+YOLUgl686GA9xLdxwBjrm4qOHndQYdgO5GBb0/IXw=;
        fh=e8o08hXKrZYEcxNuFBC+Q1JoqT88Q2FX6P7NAJwKTiA=;
        b=gjz2Su6uQ/ZJvbGz80mfV7tsIsSVUMqrezJ8Mzj57TfUmX+5EuRdteV+30S5oHbkWk
         5OFjvqaOaqggFaXJ8ooSp9KgTOFd3QmKSVkpNq5VWUdF2wzFXb/1TpoV/GIsGyMvXoop
         Z/tf8G1hYiJkoOmJSS6KnlCyuvFq5s5DeOfhsKGnlG7Aj+BsjPDS6/98q504WQILIqvY
         nrvKGuhvcWa86a8uzJolLFMv5r9X4WXHeyW6j1QthryaF9OKR+Ldg0doV+XTEhMe9unb
         xn2noXwaxmkVfdrG2Cu0Vr6yUhZQRBYIX/iV9zQ64GmBt0w4aViUrnXUcXJKN/8xzSFs
         tKNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790044708; x=1790649508; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i+YOLUgl686GA9xLdxwBjrm4qOHndQYdgO5GBb0/IXw=;
        b=q9Iiscu85T7PbDBOf3XfGOjjE2szbejlfeeomMtQaUoh2lIfTD3TVTUg1l1v+H6x0u
         2MeEF/D1hJRsIqmQXECa91jNsvywWHxrZAw6G7TJj9VqqDjtCjQdie9l934Ufg1Kaobz
         1o6pc/mZnFO0pQtmikPsOyYnbaZaIoZ5LbhFS+pJPxqq59339iMzgquyzFe0+X1S8Kwz
         rEhdGsf3r8RrcW1xgI4/YyHbG2HjOf8peeVIg4+0dBoFRnSPPZiWP2HrSSaldEeHxISa
         UUKtX5kW77tP49yXyYbeFgzLVlK1+KI8I3ddCD4k+i2OPkL41n9jouL9NtX6YvhR5U2Q
         oFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790044708; x=1790649508;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i+YOLUgl686GA9xLdxwBjrm4qOHndQYdgO5GBb0/IXw=;
        b=HGEWKifv78HMNyGjPG9zCWrNtDrOJohJTjeZsJFbhraimeFKMtTIR4bQzZcjBJCnbp
         prsd85b/+ItVbQyBXiZowlxmW0ehL+J5t8BETRYAdT07CauW2CnvimcrZRH/9UHNyVo5
         d1Viej3inZo0MLooilq57M0MDRiqdNnmgPfOjZ/D4r1mEHhsaAdfNzeRfgQtNw+yjfpK
         q6AYefNpjHEzcLalCUZv+UEKxiy/Hip6bE5W7fGxGecX8S8p1Ckf/miD6dI4pC+1Zjmg
         nA84o5D42FHG7Pbzyk1A4XlSHhd1NsLMcDKXH46jX74Gi01trTdTDmSp64/VQcbHXpyx
         yh5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxC/FPFto2QhtbQgYBCFUen5Q5BzrdvFBHU/Nx6FhDNQ0383bwyYnPKjO5cKJJY/keOm/Q4Wq1jW8OBqG/W/43Vn6kk@vger.kernel.org
X-Gm-Message-State: AFuF++mXnHoCMfrXWrNG4IUn88592k2iDfxty/Eke+voUYWeXkM3WEIX
	TSF+4Cw8s+0rTaPeFtYVDPqXY+JeHka7vspeZOb0O4CSExGYZGvLm47J8xz8ISTifWELLxI5sqn
	f36mVW5ZJzgO+WXx9tqSYBdfZNYO8TyA=
X-Gm-Gg: AYBFou0p7nN2TfbrVhCdpfJimf1zhcgQLDi3o1jBUG0/0GghotWaQvp+DZxFSinny+q
	ADCx2alZmtXHF7IhXNitgP2bknzw6ZmQ9nUknXXFlYeJXWLi5KBFVz2bQl9C3/ktiqYAUdEbChA
	zw4f3+iOdwJ5EjIgEPzNnSo3/C5/nCBYdiKVBrx/SFzlpOXJ9cjhARu9F7qvv4FYOXzztdPXTPd
	PhboBYwK5CYeyptwIc2XGaNo86nQRjtcSmYySGAaaXlYajTqSpMVV2psgVV14aopevbdgoHwSlv
	0HBWapLJbA82rK7TAqlmM/4I+yO/s3SBtd3mmWeUQWQMDrpNUIPCSI3Trw==
X-Received: by 2002:a05:690e:4548:20b0:670:fe0f:fe39 with SMTP id
 956f58d0204a3-6717fdfd203mr2973986d50.88.1790044708293; Mon, 21 Sep 2026
 19:38:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921075312.120983-1-lgs201920130244@gmail.com> <arFH0ridHWo3Z_w9@quoll>
In-Reply-To: <arFH0ridHWo3Z_w9@quoll>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 10:38:15 +0800
X-Gm-Features: AcwNN1XWb8ExjcuFj63-aya245KYEcnQa1inFwfN-VmRqAKafLrlWEitnVlBJsg
Message-ID: <CANUHTR9tUL6Dif8MoJ92w0TQYx42zc6jksN8D5_0nHbRVE0aLg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: simatic-ipc: fix platform device leak on
 registration failure
To: krzk@kernel.org
Cc: stable@vger.kernel.org, 
	Benedikt Niedermayr <benedikt.niedermayr@siemens.com>, linux-kernel@vger.kernel.org, 
	Tobias Schaffner <tobias.schaffner@siemens.com>, platform-driver-x86@vger.kernel.org, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, Bao Cheng Su <baocheng.su@siemens.com>, 
	Henning Schild <henning.schild@siemens.com>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thank you for your feedback.

On Mon, 21 Sept 2026 at 23:05, <krzk@kernel.org> wrote:
>
>
> On Mon, 21 Sep 2026 15:53:12 +0800, Guangshuo Li wrote:
> > register_platform_devices() creates multiple platform devices using
> > platform_device_register_data(), but returns directly when a later
> > platform device registration fails.
> >
> > If LED or watchdog platform device registration fails, previously
> > registered platform devices are left registered. Since module init
> > failure does not invoke the module exit cleanup path, these platform
> > devices remain allocated and their backing platform_object memory is
> > leaked.
> >
> > Unregister successfully created platform devices on registration failure
> > paths to restore the missing cleanup.
> >
> > The issue was identified by a static analysis tool I developed and
> > confirmed by manual review.
> >
> > Fixes: dd123e62bded ("platform/x86: simatic-ipc: add main driver for Siemens devices")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/platform/x86/siemens/simatic-ipc.c | 40 ++++++++++++++++++----
> >  1 file changed, 34 insertions(+), 6 deletions(-)
> >
>
>
> You sent multiple independent patches, to multiple independent
> subsystems. The amount of these patches clearly suggest this was
> AI generated and most likely not tested.
>
> More importantly, you sent all this work without properly organizing
> relevant patches into patchsets. This makes reviewing difficult
> and might cause multiple reviewers to address the same issue.
> Replying to the entire set is impossible and requires handling each
> patch independently, instead of applying or discarding the set.
> Maintainers also won't see the bigger picture of your work. Quite
> worrying.
>
> This is on the verge of hostile patch: bomb us with so many
> contributions, we won't be able to handle them in efficient manner,
> like responding ONCE to ask you to slow down.  Considering all this
> is untested and LLM generated, I have even more doubts whether this
> should be considered for review.
>
> Please read kernel documentation BEFORE posting more work. It will
> explain you how to identify subsystems, how to organize your work per
> subsystem, how to document usage of LLM and how what you should not
> do if this was posted in a good faith.
>
> Best regards,
> Krzysztof
>
>
>

I would like to clarify that these patches were manually reviewed and
audited by us; they were not simply generated and submitted by an LLM.
However, I understand why the recent submission pattern may have given
that impression. We sent too many patches in a short period of time,
and we also failed to respond to some discussions in a timely manner,
which made the situation look worse.

Many of the recent patches, especially the v2 revisions, are
corrections and improvements based on previous review feedback rather
than completely new untested changes. That said, we recognize that the
way we submitted them increased the burden on maintainers and
reviewers.

We apologize for the pressure this caused to the community. We will be
more careful about organizing patches by subsystem, preparing proper
patchsets, and following the kernel contribution guidelines before
sending future work.

Thank you again for pointing this out.

Best regards,
Guangshuo
