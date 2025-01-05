Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DED02C9A;
	Sun,  5 Jan 2025 04:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736050641; cv=none; b=lNTr5s1HLKyB4ylwn8a2E1O8rnisWr3sWpDGeZr90ydVghBfSESzn04ggcX9pvuIriv9hD/zSbjM/X1KFJpOJ6NP35KXfHj49cXz8co+Pa5XPX9kLq/bkq5QvlAcuHurTgeLp+3FKoM31LggpQG/z2Ro34ksf7MNJVTFK3oDL9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736050641; c=relaxed/simple;
	bh=7TkEB8jqGLeLi9vkP9Lytbyptks+b8dO3Df+SwqAhck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RoAk8w0gILZOPIUE5stnpwgtT+l04SuTDraLglphUJFCySHk6rBV3hw8ftIPuYeeo7Wxoqrq57Co34ImyoBE6MlQUgSQukfQjyFYdyNsLYUmVmE1lCtsGzPczewwUo/0KgVadTfclQIP6Fs8Py6WDPQCwWwlXEu810BAk66SjqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E9nqJgh7; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9nqJgh7"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21636268e43so632485ad.2;
        Sat, 04 Jan 2025 20:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736050640; x=1736655440; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TkEB8jqGLeLi9vkP9Lytbyptks+b8dO3Df+SwqAhck=;
        b=E9nqJgh7kXL0ovO9B9LCHWJbqgWiTJXKfEnDMSMaJJlEl03R2tm9ncafQbtzyp/w4w
         SiVayNf8FaL0XpzkxYfFzaoqJiNIDh6cFhAZgizhwGDf7417FP5+xb6LT68SwTx/OUzi
         Su7zPBG2/76DERaoT9EUev9GKeZGnBuxkf7QbtJ426krX1bt3cYQBIbj77KEespnXedN
         49A1y92Gb0jbkn8XmWckDbeMC4Y0IXZaSZOAbW8fakaQ+wQ/pE6yU6CdR4QDgz0e+ZD4
         BImYNXrUbkjFjk1gqZmfBC9f5/iWF4HOvRECXAdf/fpfJlVq2r9K4TpbeacrY+uwbXKT
         T+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736050640; x=1736655440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7TkEB8jqGLeLi9vkP9Lytbyptks+b8dO3Df+SwqAhck=;
        b=Hh/8t0YXlpxGFzKtqapTrhqhgxKOZSlhTMCBMaib6hDX+Mb+trGVfTE4DYoHL8H/6K
         QXrKz5Z6Uk1eREtGxkqqrDmm8g7ajfMZ60HnkMATEKuzI9ew4KiUS4wzXnNHhkqyvOa/
         1rtJPWrRr3YJjL7HLP/6Q7xCfqjsszrII0ZyRkzb9raXCSUzXxs3rOKNKKkC0PwRii+V
         5B/+FMZhXg8tvDn+O+AEbCFodZfvF1WoTI5Zq45AMQBU1Ds+2DBwUNrvkEZ2yJB4IeIl
         c43MSKxa/2oR4MEp6W8g18xaHHIat0+MnnWkpmygW5pa+gRfdIk97dpxuT23SqvVZd6L
         4ODg==
X-Forwarded-Encrypted: i=1; AJvYcCU4nbwFsrVF6bN0tqjQCDUaGoQZY0bp+Xil1f0Z2EWkpkNceDrBxLhQezxlfdUh7KcKaTCJuJfpj6LjfXv739i1ohO1WA==@vger.kernel.org, AJvYcCXw5Z809vYLeFtWmrGP9TSNDu5ScnTHJRQQwX0bodEL2btR+u7KTjKQ/hpWiGEb3L1IXWq2+Oq2vDFEJgA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBpMg9gMjGj12mzhKpVTCfplt40GlImQiayX8/lUkOiIImijJA
	twVmYVq4Gmkflamqq/rzfLdAwvJSNTM1SsbKSEpsuUx9+Os8PzHcI4B4TA5BmvFUX0XA9b2KhSi
	xNPEvM5EnrpB+qcw4e1jWI//6HDzb08fhL1c=
X-Gm-Gg: ASbGncteQoVJ5HIW+vMq5goSTyTvmai+v4O2svSCYj4kcCyFP5aYp4mrBpF6WzI6m4+
	HErcYfmAhPHZvWFUQszju3ResBMRC753CxWCGT3U=
X-Google-Smtp-Source: AGHT+IFaALGDKXoypkYQR93rc9TCDtGrxoGG8a1QQr5P3NFqq7azhKQ1yiqoBZco/SZqT5FuXglZdJeGX2G2/W72TEo=
X-Received: by 2002:a17:903:22c3:b0:216:6769:9eea with SMTP id
 d9443c01a7336-219e6f133ccmr791576085ad.37.1736050639622; Sat, 04 Jan 2025
 20:17:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250104-platform_profile-v2-0-b58164718903@gmail.com>
 <20250104-platform_profile-v2-3-b58164718903@gmail.com> <3bqedlhubucaniyrjkig3cbegfxec5pzrv7vpbpnbphuu6h6od@dymxlla3itdl>
 <CALiyAokph3JiReKsod3CZuxyVMqqmXqQ1t2rsH2wUx=hKaZm0Q@mail.gmail.com> <c5609ea8-5af2-4f36-aa2f-6c2ddde9a401@gmail.com>
In-Reply-To: <c5609ea8-5af2-4f36-aa2f-6c2ddde9a401@gmail.com>
From: Hridesh MG <hridesh699@gmail.com>
Date: Sun, 5 Jan 2025 09:46:45 +0530
Message-ID: <CALiyAo=n4zpyZJUPLxLJLkxNn4pe3x=nC=md_KqLmnLf4eNpWw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] platform/x86: acer-wmi: simplify platform profile cycling
To: SungHwan Jung <onenowy@gmail.com>
Cc: Kurt Borja <kuurtb@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 5, 2025 at 9:31=E2=80=AFAM SungHwan Jung <onenowy@gmail.com> wr=
ote:
> On 1/5/25 03:19, Hridesh MG wrote:
> >> I think this should be kept. If the user changes profile manually this
> >> may not reflect the actual last_non_turbo_profile.
> > I thought that the purpose of last_non_turbo_profile was for
> > acer_thermal_profile_change() to store the profile just before
> > toggling turbo so that the system can return to it later on (as
> > mentioned in the comments). I don't see a valid use case for this
> > variable outside of that specific context, which is why I decided to
> > remove its update during manual profile changes.
> >
> I think last_non_turbo_profile is still needed in
> acer_predator_v4_platform_profile_set for returning from turbo mode set
> by user space application in toggle mode.
>
> Without this, when users change profiles and set turbo mode using
> applications or scripts (like predator sense GUI on windows) then use
> the mode button to return from turbo mode, it returns to default or the
> last value by the button, not the actual last profile.
>
Ah, I see now, that case seems to have slipped my mind. Thanks for
pointing it out.


--
Thanks,
Hridesh MG
