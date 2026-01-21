Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B35F441044
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jan 2026 09:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768987198; cv=pass; b=CcAb5IAdCbSyrCqRQ6DqwdlQnG5cIBUVDffWNuzwGJxcVaQv8tZEBlCft2oozYrwUlhRufXWjTuRvmingi2ytvzZsosRa5Y1/TM3jnDmBRo8dEoO5lNWiWOy2evbvQDWzry0UZT71xZDg8bCf4PkjwRUT7dqT5et5MhpvcoIlgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768987198; c=relaxed/simple;
	bh=79b775lMvczPPQ1sCHPV9x0iaa287H0D0dSytd73Qv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sUEO9BovBlLhKKxUpn+G+OInJrAfZW2B9cZKTdVySvISxhdy2qufEz6xLxYYoXMIDafS54BlBL3dCWcvYRepkzGy6QfYOV0Bk+ZN//CojevhW43EQmTGh7YyOer0Q949wBtda55a3PyhwT+gHZ41R8YjjnmTEpIffTggUYwUj1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jO7q7wal; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jO7q7wal"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59b6df3d6b4so7921623e87.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jan 2026 01:19:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768987195; cv=none;
        d=google.com; s=arc-20240605;
        b=BCSWZWipnm8DfjCYF7qQsb+bPiAozvw8C0zzDSkB3eWcd3p1dkejA9kDdIhln1jdpy
         qOh0nkNH1p21oRivGBfCrazm+4HzGbrNZtd+zVbytzArR+I2cCOUojjCV5NA7Llx6DL0
         JMoMLDJn+gMlK8iCUNL2mHy+eBuZ36yX70qcJ/vAhBplBvxlyT/buwrelELWJm3XYt31
         DS/5DDndrQiA+eYjjPanse3AwdndXmblWJZrSHlbwSkWCK5CcQOusjzEyO4LyMasTRhw
         uMVBkq8jWZYWgqXsMZyC87H6kXEYZ4PxjTEd68IDdMkQ7OZAEv3MMa68GhOFggC4PuJN
         t4rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cKTgJE3f1vXR3wpOnVsDNv0ntd16ZnwfsXCdqjWFLU8=;
        fh=xjw5TMhN1doV8stAFkT6Pzbq/JX++GSKDw9SD8Gj9dA=;
        b=deAFlqRZ7HPZNeyQEaISwW/EC8/PflsKjAaQ5jqEzHMzpDw9oPNIngZ00qyAAeR+GN
         etIPNnxB8O8otgi4dwCf/31yjCMUC7bqN+pucp12ftPRoPOoV7S31R+OcvcVtl9tD/TB
         9erG662kIjUGVlWXbrmZW0qeuFI/4aAAxrGM3RHrYMX7A7uc4G59QL2oYUbchyGhdK/d
         Cz+CFpHeAtkxvwciNzYPqjRRQBcaNL9hUNUlYtLvvZVye7Q7/mUh9D/EV/8fN3KXIs75
         huxyoOP3aA9w2zw7gd5H6Xzr12CNY4TXWqxqK++i0FTHLGsvWLQsewEkz/G4W6UzjVSk
         eMfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768987195; x=1769591995; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cKTgJE3f1vXR3wpOnVsDNv0ntd16ZnwfsXCdqjWFLU8=;
        b=jO7q7walxoTYrTV55gj7+zFq7/mMJige3Fi0WbTJ3uSmRNVKHXH/73RX99yEC1SoIT
         p0ZTk5wUop33HwM5CF+4aFCVnx5PTBh+OX7JmnDBk8JFzA5wZjndbqZULYIgG14SFKmM
         X8+c8y/dWwSeBcA/yabTEMSIs1IfTZguop6k8EAoXkNRq+swbnxzqSCeOjNRDknjTvw5
         B5Dad1l62CHw8iVU2V+osk/J2aIGzvxGz//VaeP5TTsZ4uVBAheXgswQYeJFz5OhDmMS
         tlqGzLaWBZRnRbNez19uotw0j4YO8wVG1pbcYuWwj1ucOMY2ncqGwwTVoZns+mhXsK6h
         YZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768987195; x=1769591995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cKTgJE3f1vXR3wpOnVsDNv0ntd16ZnwfsXCdqjWFLU8=;
        b=C2+xmwkmKqFgLSwYXLS6IXxq/Avp85+B9aaqp9tDaPP2Oy5CDgaiVqOHm0no3A246G
         hX2aNtNy+2aOcaHrqaE/D/JKVrkfrt/QfZExaT7Oz6xz4FDOM1gcsoLKdKjr9Ma2R5ZQ
         bvN12EdBf1Ft/T0VrOX0LnY5QMayz5UyoeZZf8aCNSFhmmqA4Sb1ojoPR15dsTpevSjr
         Fhp4IrRDY1niQFyOYQZ4g/glpaM+Lhk8W6YlyW0Y7rq1OuRT6Tw8RcsGOAWpHjIEGcio
         6s0REvQ62j8maEOv7YiMtWSGb+ROYLBxS4YvPZ0qzQ6QqrU4z5fSsNWEJ7l4J66rOXSi
         dpvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWS9B1Our4g56BPzEnlPTnvDJ82WCTec+HPu5lrItLx5VZEOx1a8cB+2vQQ9HrZGiG8f9LqQoqiNsNEZwOVI8bhgSxR@vger.kernel.org
X-Gm-Message-State: AOJu0YyXW/h4GlyZYrmMAoEuUJaMMceU/L9gX1VrSTpZt21ILhSSAUJ2
	gDejn/RTjMJTeics8uYHuMNMUQJTOYdSMF6TGGAoZjapFP8cpSSASjne+IHJJNs7EwUKJyqg6oQ
	bplO5RrjBBYJtgwgVC34bb8jP1IsGkcg=
X-Gm-Gg: AZuq6aKPd5eqnPPGM4K7TbbKNAh/pr9T8bZDILg25sOnXzQmVjIXVdweUu+FB8v+lkR
	BL7B7J4AWVZ9Uo0rHpPrsizKtvSam6Z0m/qoh+Rcl0sRMwXSR0xY7AJEc+KPjv/a9ksZ4BiT4eI
	fjRL+xJMo13q75Sw2dsGv78imgiBPnUbyunwCF9EWdaiDlsGyVAXmvo6/0HBtcO93PElw/HX+mn
	a7MZID48fGQVr9eZfJ+BN4JMzANTIZ10G35FVoBmZvMtOB+3dkmcxQMyw0zYeMrHb/9oOIIDW3L
	gzwVtw==
X-Received: by 2002:a05:6512:3ba7:b0:59c:bf2e:fa15 with SMTP id
 2adb3069b0e04-59cbf2efb55mr3787256e87.5.1768987194335; Wed, 21 Jan 2026
 01:19:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251226235101.106451-1-vishnuocv@gmail.com> <20251226235101.106451-4-vishnuocv@gmail.com>
 <aW7Gh6WsTjVo5IO_@archie.me>
In-Reply-To: <aW7Gh6WsTjVo5IO_@archie.me>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Wed, 21 Jan 2026 18:19:17 +0900
X-Gm-Features: AZwV_QjqEORNJ_8f-MFBPABn9dnWmNGoiIrX3uwxX_lcnvbIxZvfTJIMH0UgnWc
Message-ID: <CABxCQKuF_1w4iGwH4DVwWZSo1bfbUui8U_RenGBj8JYeCzOG9A@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] Documentation: thinkpad-acpi - Document
 doubletap_enable attribute
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: dmitry.torokhov@gmail.com, hmh@hmh.eng.br, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, corbet@lwn.net, derekjohn.clark@gmail.com, 
	mpearson-lenovo@squebb.ca, linux-doc@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, 
	vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bagas,

Thank you so much for the comments.

On Tue, Jan 20, 2026 at 9:04=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> On Sat, Dec 27, 2025 at 08:51:01AM +0900, Vishnu Sankar wrote:
> > +Values:
> > +     * 1 - doubletap events are processed (default)
> > +     * 0 - doubletap events are filtered out (ignored)
>
> Please separate the bullet list from "Values:" paragraph.
Acked.
I will update this in my V6.
>
> Thanks.
>
> --
> An old man doll... just what I always wanted! - Clara



--=20

Regards,

      Vishnu Sankar
     +817015150407 (Japan)
