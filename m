Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F4A4C92
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Jan 2025 10:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735728558; cv=none; b=ieSQ3cCngJb/PN4S5wP/cDDnpqwEC63OM/lj3azrnA98xvSsMt8nY2ktBLwcEogpcRz3i0e1NanRSW4MGtgVG/OgV6Xx2DEeLdxV0b3TFChzZDLS+jaO2NyUcFyPki6WnjMafGQEUUXLrLMPRfSfhKCgcRXiIxTQwEKiIz6+yUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735728558; c=relaxed/simple;
	bh=6o8mbNZ/X3QS4S9QFsRI5FsRJoamdTkkEXH8Phezm5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E0rdu6YFHdA6c/egrGTzvqURakPwzmQ3wDdHlXcp3O8Vci7ud46r8m1FikkgJr5VLHgYIEOtuWHBrN3KqSynQYEzBjvcWFuFHCUOsTjC0aHNXJCukTJeNI2O3a95Xpg6nbt+ls26Qw6svqjM+AWdIxaWhjy/08hW+vm6yMeearU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b9renN1W; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b9renN1W"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ee709715d9so11445154a91.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Jan 2025 02:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735728556; x=1736333356; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6o8mbNZ/X3QS4S9QFsRI5FsRJoamdTkkEXH8Phezm5k=;
        b=b9renN1W04Fd/HITSm0fExOB4Zxj1nEFqcAbB4psFJG6BcW5Nk2eBCeSAlrN+8uk/G
         sSksWtTk2GUm/5ODdPCrV9sGVR44hsfqnK+u7kZ4Wu8eUOTM0+FSQ6I1Vy6iXt+sXuPa
         6ZP/AumET1bUYbRUn/1iHUpnaudJaxb9ijmBVv6SPrMgzMEMOVYuiNGGFz4fqgDnKfYE
         /I+jI00Fb68vmh42rf3QDGZQaXTWi4Iqr2QKmp45f+57E6kAVmCNSX7vfnsnjsBuPZpD
         YAayx2DPYiYtGwA302eybI3A0h+G5N6MnegCekRJlL52qIvfOyZEKl9nJwmLBwp4/d3L
         ZMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735728556; x=1736333356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6o8mbNZ/X3QS4S9QFsRI5FsRJoamdTkkEXH8Phezm5k=;
        b=qrvkDNbTYyfkNoKtder0NTuwoOucpKabcx7V9n1q5B09bsHtT5ytOwKBWrk5hdt38q
         HMFlS6j9BNBKsmL0MIvseFf6x63u2FgYs/gwZWOc0eCE0HOoD3mjQccvoXLK05xJz7iJ
         zoGrx90uR1+Hrx9+ZWc0N97H5e/xjEkj/8cn351OLjiD4LImJ39IjQiorFg88CWRaNuk
         aMXnSOHwl4q0UO1bZeLwqEEbT2Vc6patQTmYv8gb2hJt0uly9PiaMEc38lpmkZZyDfRO
         PAT25AN9CTJ6PitrMhkV9kw1WrAGns/l5SZDbF8OVRu0A4IQxZiPEtUZbFhvGT609Mo8
         t6dw==
X-Gm-Message-State: AOJu0YwRsVJ2bDaUnapx2XTxeyF9VAGkymk9JNKeutPTO6xQEaZyp+se
	/46xEaLHc0JAa6MmQlcK2RY0LiccXKfUb0KWWHNayRbudNmMnbfIDbO8kkXl+PQppJykG5j4krb
	E5qUpFN+Ot3RaM1p8zGrcib4EAg8GjB+QZIU=
X-Gm-Gg: ASbGncs7QdbOrO3kE8vLR9muPgTozPYG9DKgFwZEDCOowI03hJYjut+bIShiM90dITe
	meg3+/rWaXZ9FT5mTM3ufGqon2mcSrB5O1amGCgazijVRGxJeKcMkp1bb/kfZAz/Agq1Ahbwg
X-Google-Smtp-Source: AGHT+IHkwLKwOrvH/OAFfERl5vwk9tjxcIZZ6WtmummCCZCa6SpEHLbW/77DoTHHFGA240QuoMYZJB4SYFew3cFfoZ4=
X-Received: by 2002:a17:90a:d88c:b0:2ee:94d1:7a9d with SMTP id
 98e67ed59e1d1-2f452eed6cemr57098796a91.32.1735728556535; Wed, 01 Jan 2025
 02:49:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALiyAom1xDH6A0Q2WNHCMUcpMJfM3pXO2DaW=bgHGUi8ZOpBbQ@mail.gmail.com>
 <8b8749c1-59c8-4f95-a43e-055cf94f9597@gmx.de> <CALiyAo=R1kcvwRpw22s=YU0YHUxR8T_WHLwSvDr=8Ahsenn-jA@mail.gmail.com>
 <9c625119-e46e-464b-933d-9c836577f454@gmx.de> <CALiyAo=7kVi4ipA5-xDfRYQ-gqyza0woYHUzwGuW5BccLOVHgg@mail.gmail.com>
 <209f39ab-a312-45b5-981c-8324d9b8cd90@gmx.de>
In-Reply-To: <209f39ab-a312-45b5-981c-8324d9b8cd90@gmx.de>
From: Hridesh MG <hridesh699@gmail.com>
Date: Wed, 1 Jan 2025 16:18:40 +0530
Message-ID: <CALiyAon+5H_g1V-iNbjdLmjgYDJng+ePH0XeoYxijYurHj+uTg@mail.gmail.com>
Subject: Re: acer-wmi: Nitro button doesn't produce a WMI event
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 1:42=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrote:

> Actually i think you need to look into the Windows application and check =
if they call a
> WMI method during initialization to enable this event. On the Linux side =
this event should
> be supported if received.
I looked into this and the only two WMI calls made by the predator
sense service during initialization are SetGamingMiscSetting and
GetGamingSysInfo. Neither of those seem to contain the logic for
enabling the turbo button though. Could you tell me where you found
the ACPI code for submitting the turbo mode WMI event?
