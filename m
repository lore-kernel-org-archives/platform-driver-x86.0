Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383CE13AD05
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Sep 2025 14:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638599; cv=none; b=YiM9gaFWiGA98u7tV5dEQ8iCSF7QO49xiWdPj8t7ur6HcyntCbxUIKhIPUejHYtYWu6pRoi//fUf1Z0XBGFwRZajF0vGh5zlK/wUPuUWhO4Nd2jpWjLuibMzWoh/ZcgHcfnQ08nzgamzxTSh4SerpuyTyfCoB6cyeVipKgPTHP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638599; c=relaxed/simple;
	bh=uInZkEnThjsrqzsYYM/nNBHKVWx0k34druq6hODmJEw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=vECR5D95/hCbjZcLHXy8lqeq7FVSryFIiPNys+EWEWB/r11Vj4V3fWVYYyh4yPtS0KG4MMIKHqgn4x5Ldl0htOd1xQNeo/12bP6KXqsMT5ZAYHdkZ43m+8m79lWQzGNpAj9dEeS9FZelzMWeGrwBsiiBc3hD8Ggu0lbkyrFJrdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lCCMbyJm; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lCCMbyJm"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-90f5eb2feb8so103559241.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Sep 2025 07:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758638597; x=1759243397; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3b8Bn3OI9shHUmMHdw7vcndpKQnNIfOUqNzwetdyrC8=;
        b=lCCMbyJmMwoUQnvukrYkiee3279dtwtUmSEKw7l7b7BW4Z7HostweIYtNTo7RkR5XT
         qCtlm6zaimXGNBNzKOwfR2N2iblDwtV3Q+tfwr0iAN1FeW8ebw6jv0j9hHawAqhan0Js
         iOFAXJR5/HZK856Hkio75CKIcJMKOss1JbK5MtCqJ/7CjvmlBllRM+1wdGUPjP0+vD/Y
         AHlY4rRUaf6mz08IkdrTTPoOo6ENuv/wlSCP57pqogK5jrMYKnkrP5+PFPLLS07fDZ26
         yDRumj1GWKZFaDNWBuyGXyHfXqjNcYuAKRpf2ws050HBI8nTp5shTaXlPC6JnTTW2WP5
         CEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638597; x=1759243397;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3b8Bn3OI9shHUmMHdw7vcndpKQnNIfOUqNzwetdyrC8=;
        b=n596M2oviwW4M3faMA6pdmIjJPN+RJkiq2MknkQURPEMMYVWD7jK6sGEOLnhd2mfqs
         EKRNKNjcoCGflmXnJE9G0BeQo52Lm1/WxxTnH4swlQdC4gDkNzFYPuQMYhE2wHlPkpPv
         flGNa1GStbpyabvBgYoYEGyWxfwAcft7uqIhFXmz6XbpHMTVxTb3nUTQXTKQTPs2xFnu
         YXnZ5dZMXIM4SJ4HnIDlnHYPie8ouuKXadCYu21ndcYX9xN0GgRDx+XuIjuP7M/nuLce
         YFZTVEnN+FSPEG6tdAFB3xPgkl6LSZTV5Y86nYkeOyB/2qclUQJOw8wOaHoXDq75jJSp
         PJRA==
X-Forwarded-Encrypted: i=1; AJvYcCXXV61tTBZx8rRYffxp/msheL1jmzvlh+SWZtq4XTflkq7hkYIcrEQ0Bs7AZ3Ss/nGrXXWNK+qkPoUdzOzUKrZzIo7X@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4Aft2n46nV2/mMY5zZb3GhbqkxStoKWi2vn0W2RqGr3PNu+th
	QDd0a3D1HwUk/F8QbynDf643Cs7yHanbsXKfOS/7Q+dmN0oJkS/PWnear9aMSA==
X-Gm-Gg: ASbGnct5K1Q9tG2cKFg9oUdyLB0p1UadOQMMe211CxV8gdeafZCDn349nZRHKioaueG
	WA9cfTz/pO8jLxET6/61o5hCY7kr3qGD6tmO/E5IllRDzz/QFsxxyHwYY1HDzKGW1SQPLVI6aCK
	W5gZBimnnzaR3x42D1ErdAcYRMak6ujufVNfTcU6WfpIJzqsG8D/HuYYsmj1tMG/Q8y7nmRaZF0
	myoZV/t+r7xl0FnI9by6SteGbJQuvaPJZFvygx4Tm1SfidQv5P3RERbX9yJZepkeEGnt+sOz5x6
	R/6dpeqjwASbF1RSWJvvJULUiz9/npzeNJFLv1We9MV4GX4gxQ0kUyHDxIq49noGZrtH7hBt18i
	7PemawsxKk+mnryc=
X-Google-Smtp-Source: AGHT+IFntmRmNKNBwFj8+BYAAe/2k4/QtzQnh/MLK6ft99/mz1kQRDK5VUJJpPBWYKCCG4eikU9F7Q==
X-Received: by 2002:a05:6102:3a10:b0:55d:34c:f231 with SMTP id ada2fe7eead31-5a57a2e78ddmr942753137.35.1758638596676;
        Tue, 23 Sep 2025 07:43:16 -0700 (PDT)
Received: from localhost ([2800:bf0:82:3d2:875c:6c76:e06b:3095])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8f31bef21bbsm1563754241.13.2025.09.23.07.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 07:43:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Sep 2025 09:43:14 -0500
Message-Id: <DD09CP8SI4S3.D0SYL9FM7MR2@gmail.com>
Cc: <kuurtb@gmail.com>
Subject: Re: [PATCH] alieneware-wmi-wmax: Add AWCC support to Dell G15 5530
From: "Kurt Borja" <kuurtb@gmail.com>
To: "L Lawliet" <kmtechnical2006@gmail.com>,
 <platform-driver-x86@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <CAE_EmHsRBLJauuYJinTaf=Q6MzexHWti2SWeX8DWPmF6FN-aNA@mail.gmail.com>
In-Reply-To: <CAE_EmHsRBLJauuYJinTaf=Q6MzexHWti2SWeX8DWPmF6FN-aNA@mail.gmail.com>

Hi tr1x_em,

Thank you for your patch!

I believe you patched my personal development tree. Upstream patches
should be made on top of the pdx86 Linux tree:

	[1] https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers=
-x86.git

This should be Cc'd to subsystem maintainers too. You can get the full
list of maintainers with the get_maintainer.pl script (which is also
found in the tree above):

$ ./scripts/get_maintainer.pl drivers/platform/x86/dell/alienware-wmi-wmax.=
c

There is also a few issues bellow.

On Tue Sep 23, 2025 at 8:03 AM -05, L Lawliet wrote:
> From 1dad6e971a889c7936d1a54ab38f146bd23ebbf3 Mon Sep 17 00:00:00 2001
> From: tr1x_em <admin@trix.is-a.dev>
> Date: Tue, 23 Sep 2025 18:24:58 +0530
> Subject: [PATCH] alieneware-wmi-wmax: Add AWCC support to Dell G15 5530
>

Add a commit description too (even if it's a little redundant).

> Signed-off-by: tr1x_em <admin@trix.is-a.dev>

Patches can only be signed off with a known identity (which is usually
your real name).

> ---
>  alienware-wmi-wmax.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/alienware-wmi-wmax.c b/alienware-wmi-wmax.c
> index fd550c8..e7ba590 100644
> --- a/alienware-wmi-wmax.c
> +++ b/alienware-wmi-wmax.c

Again, diffs should be taken from the root of the Linux tree.

> @@ -209,6 +209,15 @@ static const struct dmi_system_id
> awcc_dmi_table[] __initconst =3D {
>          },
>          .driver_data =3D &g_series_quirks,
>      },
> +    {
> +        .ident =3D "Dell Inc. G15 5530",
> +        .matches =3D
> +            {
> +                DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +                DMI_MATCH(DMI_PRODUCT_NAME, "G15 5530"),
> +            },
> +        .driver_data =3D &g_series_quirks,
> +    },
>      {
>          .ident =3D "Dell Inc. G16 7630",
>          .matches =3D {

I believe your editor or email client messed up the formatting. Kernel
source files use tabs instead of spaces.

Please, check the "Submitting patches" guide if you have doubts:

	[2] https://docs.kernel.org/process/submitting-patches.html


--=20
 ~ Kurt

