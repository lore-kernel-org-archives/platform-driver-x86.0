Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F9D353EE0
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 03:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783654425; cv=pass; b=WBJNlHyD4EkEbV1vZy4Juhjney8ieshOsY9nuy0d8mUaX8De1qZOOtZKt0JInFVme0Xj10foR0hjrJ+6eGCgbkkSekjlVB27LygZ8IJL4avA4EGfIubc5A0wxuH6nkTIf09n1ACCkopD3OsXNLkYaxcmleOsv8x395l3KY3vUw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783654425; c=relaxed/simple;
	bh=7AF8MvrHg1SOY061DM3pmobhSmgDsEH6yfBsDgTLZWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hN811RpTG+v71HcpE0XuMxeFmab9WOCn7FDl7mDto73Dl4irKjsmBgkf8/j25XgGcNDq+vytANpWgwXgP8iShWGJIb6d0mAvYB3UmBxjO7QP44LdPOr6ju3aKaN0x9zA397DVJ5DIKOjgTvZ86IhKgIBk7M6vMKQ5XeQrdPePCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dW7YNB7V; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dW7YNB7V"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aeb5829fd5so405743e87.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jul 2026 20:33:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783654422; cv=none;
        d=google.com; s=arc-20260327;
        b=R1sDGaT7yHCu1R4raG324ekoTpVIP3/qLfEugaLXDdvrefW5oUjmddE2kqmaqyBmrz
         XrsVf8c0nbp7mYH6BtSOCahm8ItnMdqNcgkqD0zDFcpATVxOnTBmVnQv4mVzdV2WkD+n
         LEeSr1RWXCe/oYjqw7hpxOzeAbU89DiV+3Zg+b/tJZhH1Zw4ig/wKH2VpvfUcGZNjsoL
         /Q6UwQW2OAgHc8d/ZteeEGK7dqkS7OO3xoob+en+Vjy0UfAmQFpJJZ07iiejyGxi4qgw
         6/i+M8VihZTGJMmiStKBOFtlcvzG2PcN49PHhjBUIqyJQmSOj+wfDmiHoyWNe+cTcuDo
         D1IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vcKE/1zZV4FR8Gq7PnI9d2/vs9rDhLuQyTr8HFgxCkk=;
        fh=VVX+G7EWHPxNBTb1YMo1pRqURfmzTonlNztnSUI8+m8=;
        b=DP2KAF5RgdpIPMgDofOndyQMUK7fd3Q4+4LnW4UpQCiy55Ib/hrROrA8/SzjAhvoxf
         yVUpiHjowDxh2Jt53zE19jR7/lN2LkfDqD1CaNWhP20wjlhcTFIqzgvpWDiVD5dRqIfm
         /2AgR3wAVCHORtT647iQz7Yn6SU/AVSLxmz/JZR1vDFrl020FFp7ctLZz0pidLUfs4Pw
         hy7zdhiSVoPs1psMZ8MPHAk+6msvHzC5ynoZAu+Dgm/rzV/ngkxrnN3CxVpHrDAFimKe
         KpMlAOBlcaHYLf1AY4LCponGYe+xjXV4uYqGCboT4hx46kALbG79Iw9PfTJiY0rIKTBZ
         iolA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783654422; x=1784259222; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vcKE/1zZV4FR8Gq7PnI9d2/vs9rDhLuQyTr8HFgxCkk=;
        b=dW7YNB7VPCeDIY+UnhxZrxyfiMb/Hb1T8x/I/imgyJ9aYS1vsM1JRU3mCBZKx/q8fJ
         BYEsHXi2LObewVmuHBMPbF62p2mO3EMxO4yHN8bG94zexEsP1fDKnrGCo6e93nzFSxYQ
         +/v5HJXPPCJ6Saxy1h1Z1U9XTD5G5rNoUYt7FsfksPzF6kUaDYaTqsG0XUCDxC/lFuNC
         EAq7ZPvfekPeoBHdFiNZJ2uc+iOCl4EVWfYdhVn/m62oJXXo0WON0Ch4ba/GIYrqVJQm
         fyXbht7b2ZyeWCACM8dt+/Gcy1ody4QwJpfK2PZvdNhbLzP1HkPzPRElck1uX5N7flBU
         /Gjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783654422; x=1784259222;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vcKE/1zZV4FR8Gq7PnI9d2/vs9rDhLuQyTr8HFgxCkk=;
        b=p3jMIBNWwOWRArSchslaZacX9tO1C1SpH9OikoeiKSs/nqIMgUaYYmxaqY3aYPnDjd
         AuzZboA8ydpNtzJqyICssRf+3kM0SxvKg/7dh+jmjwOWfNdUgyaN64+ibyt+mwT3/d0/
         Opqqgj9lvnY/6D6QjtDc+Hk/8P2dIocgT9Qk1fdjeexedu72W6Te6GA/xhORR/Rbq2MY
         YY6ks2aFsRHfKcqbbQ5l9qb8o62iMjIQptkI2M/GMyPHNIfb52f2KAIuwOGAi9bT6J8I
         818I5OlPTQiYFYC1QH7eVVmnON4vIY7rC82HoJkF8Z3ApDC4adP24nh7sRvPPdkX8yas
         E0zQ==
X-Forwarded-Encrypted: i=1; AHgh+RpFGLOhpuVS1aSMZMlEeuUYe5V3ebot7lIlMhdHlxC8vrR8UQecsxG8Sob+Xu+gRJCOyI+PLg2Qt6GshWCpdM0zjzSA@vger.kernel.org
X-Gm-Message-State: AOJu0YxJApKuvA3YrKUIjIpxN8sXNiO/O53u973/kgKKl27z2vLUqeg8
	FLUpS96pwQZjlZ48AXNu9w+6EkK3Z9Vibyqy4VvWkS0V2RlIkzBOMaUhcQ8BYSpX6PgI30lZlzL
	C3JJ6sbeI+No3T9snFfl0TdqXF8YaWpg=
X-Gm-Gg: AfdE7clibVcF73j+t4UNp6rgwDubnissRzYCRq+l+DXNRmCP04+7FXus7HAv39usSIM
	WkH0iX6BJJKotROu5xHI0a9GE+hfAFemRwJspvMLIAXDNbaQESNQHe72PhVi5spg5to9cfDyghW
	3QNWm+OWTsO71JnCcG215eYjYZv25sEvf9C/cePGqT8UljM656uEQIYuexKfZ+p8BpGu2eU85d/
	c7ZlXSEnVLyJ9H/QeqePNm0bnJ7QWHvqqse7Y2Ly6mEXRPcQh5AxD0ggocZ9znClIOYZQ==
X-Received: by 2002:a05:6512:3ba9:b0:5b0:1a3a:6680 with SMTP id
 2adb3069b0e04-5b01a3a68b7mr899560e87.30.1783654422023; Thu, 09 Jul 2026
 20:33:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709021504.465792-1-vishnuocv@gmail.com> <178360436568.12613.9417666621877155453.b4-ty@b4>
In-Reply-To: <178360436568.12613.9417666621877155453.b4-ty@b4>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Fri, 10 Jul 2026 12:33:04 +0900
X-Gm-Features: AVVi8CcSE-_ebN-X9wxVOTscT2uv2ixCpRputYr5Fbze1Zb57IGn9QootVXXpXk
Message-ID: <CABxCQKtC5KnTRHdz7KwABRBJKVeRNXv8w__uYh9Qh1dDeoTOCw@mail.gmail.com>
Subject: Re: [PATCH v4] platform/x86: thinkpad_acpi: Add USB-C Security (USCS) support
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, derekjohn.clark@gmail.com, 
	hansg@kernel.org, platform-driver-x86@vger.kernel.org, 
	mark.pearson@lenovo.com, linux-acpi@vger.kernel.org, 
	linux-doc@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
	vsankar@lenovo.com, Mark Pearson <mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 10:39=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Thu, 09 Jul 2026 11:15:04 +0900, Vishnu Sankar wrote:
>
> > Newer ThinkPad systems expose a USB-C Security (Restricted Mode) featur=
e.
> > When active, USB-C data connections are disabled while power delivery i=
s
> > preserved. This is useful for kiosk and physically-secured deployments.
> >
> > Hardware interface:
> >
> > The HKEY device exposes a read-only ACPI method USCS():
> >
> > [...]
>
> Thank you for your contribution, it has been applied to my local
> review-ilpo-next branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> local branch there, which might take a while.
>
Thank you for accepting this.
Understood.
> FYI [if applicable to your patch], as per Linus' policy change, also
> fixes are mostly routed through for-next unless the fix is for a
> commit introduced in the most recent cycle or is clearly a regression
> fix.
>
Got it.
> The list of commits applied:
> [1/1] platform/x86: thinkpad_acpi: Add USB-C Security (USCS) support
>       commit: 740f324f8f036607d59c05ab2b2fc22231c9641d
>
> --
>  i.
>


--=20

Regards,

      Vishnu Sankar
