Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC4F32E12C
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Oct 2025 14:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760712179; cv=none; b=gaiPSO6nSgIxeItmxvS2SvMu7M4VaGLYh2BtbJBu2xcOzPPertSQSoes82OxU6d8rm3bZAAev6c5XbWhiljpip8s/Va2BMqENA8Xa5ZfPfycr2IiKocy/i6BBK5ltITlfzjA0wx3w4zBgFdmorMM1mhbYf8Vwbbl1FQL/9qEe9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760712179; c=relaxed/simple;
	bh=Xx7XdhV/7kyHbdK+hFaFGxPdJ2gUXJJwY77QDduTYHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PUyrAX1gmiT/0RJsp+VZkf5iydI0HsOATfvCS+/a2nZNmPjkrQc5EH7DOuln6ZkhTDfT8b7RGNo3L7zadknTvX1VVX1QwSN3sADijqn8i05v/Aifgqa0hpagzgbDkUvPAKza1vhwZnr3uVoXsdQU0mc97pCYHaDM9vxj7I+/uTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZXy9W3p; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZXy9W3p"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso1657937a12.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Oct 2025 07:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760712177; x=1761316977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWOesE9+ukIK9ZiHh+lbkgu9u3o79T9+p9YpsPsRmb0=;
        b=TZXy9W3pShhFUSTGxQjyxBwrE9KC2qX0Egwu2vzQhBWZfrUuJ/ZKxOF/Xuc9FsdTEs
         qI/IMahV8U6b4hD6NnYFieKG19ma9PbNTB6N7UC2CUpTVht0gikUj2M25Hm6vy82oFLS
         UUBIgEctKo0j5Is2j/wmIoYS3oU4WumET/urzvDE3OdwnHuCUNNKUQP55fHa73z8czI8
         VFQH30nB7/3FJVY+IDghM9aVn++EBTp/lhTPaY5Jsiavv8Ym/rLCzqKUjOYMyFShYM7/
         vfo2zvHjOus0oJOj71tH1aWaNBrkYq3UwzrqOODQnv17eOAnEmJ92XluWzNX55EjPzoY
         In6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760712177; x=1761316977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CWOesE9+ukIK9ZiHh+lbkgu9u3o79T9+p9YpsPsRmb0=;
        b=QZxEjQ5xShCM158Q1gz5PwXsuo0yFvZSw5hnNt/zHYHvBbDucOf8obN0Uinvysb2E9
         mdxvbopHh/zYcRH0p5J7DtJVNvGzXmuspNapFmzvCCWI+EpSzPdNO8g1lVDU5giHE1Uo
         DKT5G8XlG0u1ejYEkdsvzzpmc7rBLB7SlIgcDPhj7KE1zYcL8mhPPlTYeDsOlgrlHQc2
         8sWv6/WIfD3NY3G4xj7/7NnAN+mJR3HzcFZS43aOBm0PJfCBNYg+aa2L/GESxk5mKUtd
         JsCgAU0y2Y9k8nGFApO1uCDdxnoCFSjSfglNFwFUXL7KbBnH/IXTXwve9Lfa7FMrp69X
         dZSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc+SA2rurXhFEsXBiYMydhHAMzSHEhqs90/JtkQA0y5lPgl0WzvvzhdzNbucwJAbgMt9esmd8ut2gE0xPCHKJN0tuu@vger.kernel.org
X-Gm-Message-State: AOJu0YwD/pe6iuuWdBfuTeGVY8BvCdrHpgMQvn0BAvsxmmTtLgI2YY6W
	nZJXf6B+dyT7IGUQB+Lj2nY+fqMzyvVu7in/TWxJdxdJiRfVOmJw0HOB
X-Gm-Gg: ASbGncugc9/a5W9SdVQ/iGzssYqmM6UvMSUlJw8gfRXpO8Vk5gszUO3P7Yry1uzugoQ
	jpfx3N9XSluJV9/RSayez9tNGiE6kXq0LS1zBPf4UQUlHDhle07ykNPmAlVGDlalF0nFXvdzAyx
	oac/6cwFAHmZGn6V83DFo63LAqwINgDG5nBm8iCgc9kgGXAJGVa4QFWQoktZ/JGtC6I2JyKQc/o
	hO2uYBccLoN9Tm2pxaCZe5+JJLapNxMFlw/fc+VexYfrZ2nfCsSjalcksaDFxfUtC8Ad0kIoGgE
	At5WpNFIufyzwflwdnP1E1SqQUxjtpKXS8h64sKuvv6iFheI19lp19S9SEj8RDI6F3ppUlIEgfP
	shTWI1H/8GrDDmq51PMHycR6SRYPW2SUsb7QHSpsZXpsmB1QeScz6JXSiaTBSFupQDNXc6RBwJH
	pWuhvns//dbzhqEktkpYRsPuVVjUhB
X-Google-Smtp-Source: AGHT+IEJKRDsRmaiczSDYsoY6FCHyVAPf70YNE0uDneNM7ZCLgU1sUXAy2/5HTm7bMMrNP2iuBaHgA==
X-Received: by 2002:a17:903:2b06:b0:269:b30c:c9b8 with SMTP id d9443c01a7336-290cba4e91fmr47934175ad.56.1760712177453;
        Fri, 17 Oct 2025 07:42:57 -0700 (PDT)
Received: from cacher.localnet ([111.94.119.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7de45sm66292355ad.54.2025.10.17.07.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 07:42:56 -0700 (PDT)
From: Fa-Iz Faadhillah Ibrahim <faiz.faadhillah@gmail.com>
To: jlee@suse.com, basak.sb2006@gmail.com, rayanmargham4@gmail.com,
 Armin Wolf <W_Armin@gmx.de>
Cc: kuurtb@gmail.com, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] platform/x86: acer-wmi: Add fan control support
Date: Fri, 17 Oct 2025 21:42:53 +0700
Message-ID: <12762215.O9o76ZdvQC@cacher>
In-Reply-To: <20251016180008.465593-1-W_Armin@gmx.de>
References: <20251016180008.465593-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday, October 17, 2025 1:00=E2=80=AFAM Armin Wolf wrote:
> This patch series aims to add fan control support to the acer-wmi
> driver. The patches are compile-tested only and need to be tested
> on real hardware to verify that they actually work.
>=20
> I CCed three users who requested support for this feature. I would be
> very happy if one of you could test those patches and report back.
>=20
> Changes since v3:
> - fix error in WMID_gaming_set_fan_behavior()
>=20
> Changes since v2:
> - get rid of nested bit masks
>=20
> Changes since v1:
> - remove unnecessary blank line
>=20
> Changes since RFC v2:
> - improve error handling when setting fan behavior
> - Add Reviewed-by tags
> - whitelist PHN16-72
>=20
> Changes since RFC v1:
> - remove duplicate include and replace hwmon_pwm_mode with
>   hwmon_pwm_enable in second patch
>=20
> Armin Wolf (4):
>   platform/x86: acer-wmi: Fix setting of fan behavior
>   platform/x86: acer-wmi: Add fan control support
>   platform/x86: acer-wmi: Enable fan control for PH16-72 and PT14-51
>   platform/x86: acer-wmi: Add support for PHN16-72
>=20
>  drivers/platform/x86/acer-wmi.c | 292 +++++++++++++++++++++++++++++---
>  1 file changed, 269 insertions(+), 23 deletions(-)
Hello,

I've tested your patch, had a weird thing where i need to reboot to windows=
=20
first to make fan control works again, but it all works well now, both CPU =
and=20
GPU fan control works just fine.

Thanks,
=46a-Iz Faadhillah Ibrahim



