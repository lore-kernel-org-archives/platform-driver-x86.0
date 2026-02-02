Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6331E5205
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Feb 2026 03:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770004656; cv=pass; b=JgP9QEcjUSYdfqrcaPmKF3wMoeutYX9B5nqXJ9i7+AiqSFUtzJ8MG4hYpSAlGpWFgNgoPnXx+7p3joXOEXL/B7BJ1J2epbk6XVbG1dvmmF15syny6mOv9RN3iFNgoCRy9i1jR51hgXB8AbOVpqzW6dMOafW/r0rQUYv/SX9uuek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770004656; c=relaxed/simple;
	bh=NQqxDajhoKEjVOw3sQ9GExXSu0a7BSic0YieJ2RLuIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O+kyF36xRXavmuB6Jw2Md1ItCvIq/qfT6YbJ+9Zzid5xJydWu7BA3I3/3jvzJZiRH5vMJyIxU35dYL42/oHlIYYHhGXXycrvzAuoIPseqss4VDbfU+RMnYiE4/7gg1suTJ6L7/CzQ8D/9MCVJNzLPby9mTPE3xx24caQn2EuDdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BEOxp1Ft; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BEOxp1Ft"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-382fe06a9c4so31318741fa.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 01 Feb 2026 19:57:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770004653; cv=none;
        d=google.com; s=arc-20240605;
        b=P5RS92ZvH+9nxCdTY9M9TT50y6ZqxXjr/k0dcmDp9ZQtY5lqNDnRQatfQiNejBjq8F
         wqigeGsDiGrLmPzrGAhk+8i/mxmq+SWKJs4b0kBkHiaSzpaa2CwKOc1nPw68e7hd4hZh
         LF4f1IHSzb6iRjmpl9Zq5+58EwCoeVUy6C/L0DNLddvgW/cl32ensGPCbjeWG+1RdPCn
         5vb6RXFvl2kJDtj4vobr8OGcPsKeYm0EAT8cGkVCvnaiT8D8eyllmB9bFaojlCzsNKZV
         lAlbGCmf3PvSgRYFReJWc6H8t1GSXTZo/XKUkSNLnv6hjtWSHnRj533JFpcLhzKuluOd
         eDZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4KkZHBfEV4LhZKQypQJPlt0kdlnTL5wPT8BeiQYjtYA=;
        fh=9wptsT+AcVgxn+e6xwikRts3Y2SquLNVNimTjUEKP1A=;
        b=PgiqIoKghlrI45KoyRbYlZTyZfUmgkmcXYH1IBBAg0OkQ+wcGpF8WTaJRA7AW6H3tA
         440eMIpLBlP5uP9fQoXkfw75WHDVUzWmdSrL/qgXB4DVNaaB+GIxGFBj6Q3WnTv+i2WW
         xheYUNtU/78qse9kblKVaTT6d+OMp3F8z5V4SgCwz7JF9E8jg7F/OyYYArzLXvUoTRcm
         OJ9x1w/PsTtKAcns7fTIY/pAxebM4GvhtZ8/++AKx7O5MtqEZbf/9B3w1KSix0pDvPNs
         HHakHN+t6u2ePwo+zraNNIqwGixnKfR4ozeG/hZrVStlNlcvpZPbxe4sFHca/Wx4f1OS
         gGNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770004653; x=1770609453; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KkZHBfEV4LhZKQypQJPlt0kdlnTL5wPT8BeiQYjtYA=;
        b=BEOxp1FthZYwzVsjC3ePN3qNwM9mOoVDh0+qt7oD5lnJy4pHpX9FrKZzcMnNJDF/FJ
         zRzGosL21WU5OIZj2nN6YX0pWYCwp3Y3iSzzBjd65LVlu8TjRwbcmvPieSBKYrwEMI1b
         Q0FrrK4BNque5MsBC3zv5B4un3zcSrXS4e0u5EAn5WSA/q932q6LDBVC0GLkYz36Mzx5
         JROd+FSP61law8b7xIDsEXC6RC2VSucP6wBVssC7yeXxE7ln5lb6taKApV2MzXbwhjqM
         Cloh5AbGPcsvBLUSEqifFwXdiu2nH3BRNjM8W+kUBQLk6QCtO1xzx6ZB1X52xe8wxiDb
         ReUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770004653; x=1770609453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4KkZHBfEV4LhZKQypQJPlt0kdlnTL5wPT8BeiQYjtYA=;
        b=uP+/HATybT6tH1gLWGRhrzoLxIoQwlWYWRRuaqBImK4iw4uZ1/kVlKpnzIiEVoF1yb
         4/S8ceWbZGds6HFGJpQCCR5biZHzooIWd8jk9Ig6v5l7EFYRZKxWgcG1+udkvG+hu+mk
         LdBYkf9sq/DF9Vk4lfB+T3pUFjBhLjGRkzEtaPa/lRTjonvxqVIyQdwOgGR3uleRhUwm
         JODpeUz0eGrJibB+KJtsTTiaPcaHuXj36FxcL8ucl+EAukg2X/v4kGzTbYTROEvR6/U8
         hfFi0QjDYbg9cAWtkx1remN1WOI+DC7R3eXF5p0T4qTMHmIKUTOJtL2DdR6bYMYS+PKl
         qQXg==
X-Forwarded-Encrypted: i=1; AJvYcCWHMPbm2w1xZCjvB1KOydVrsrJgjPErDV9vFuJJfSGoFjYixIN2rki6FZClvBq+1ovYhFaDvqOyB/NNlX2+hJh4IZAn@vger.kernel.org
X-Gm-Message-State: AOJu0YwwSPg9wuZQABRjq72CZ64v8ExGlW7nFnrGwEW6+ubJs1PiswSo
	yP/g6w/Zbqh8nLsZJcc/naomEFlQGVTvMabnixRSTeCl5rMvf8vnSN1jAO/adetCGJwBKkWndZx
	gndMk8AGqnu53oeszxhlpnkCbwIl5VEMhkA==
X-Gm-Gg: AZuq6aIhoPnMu3Nh2bJVPOfni1jwJ9V7r2pH/LR0GHFA6uF8192PesWVt20qpkNUpTE
	+juA5aNEkKIroWk8GJG5+2aN49bhZNB4HNaaGV0fzd5xHJgXnzByufBX0GZXvnJ+zaOWa5llZMo
	TvXid+6bRwTpm+BjpIvrV/vSFiwud1KzZtCQzz/6jb3RiiXef1/PKQ5gePAQ9b+8UdRBdXuqMds
	vLkIwmp1bg03Fa5Sh5g8h7WyFphWfI5iTM5AscJK25pwDQRu2odb6Paf6zdq5vblAqfPmFayIJF
	XaU=
X-Received: by 2002:a05:651c:1c8:b0:37f:d484:599c with SMTP id
 38308e7fff4ca-386466b57femr37828881fa.28.1770004653148; Sun, 01 Feb 2026
 19:57:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127103907.20269-1-vishnuocv@gmail.com> <20260127103907.20269-2-vishnuocv@gmail.com>
 <aX8JwB7F8_ypJRAz@google.com>
In-Reply-To: <aX8JwB7F8_ypJRAz@google.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Mon, 2 Feb 2026 12:56:56 +0900
X-Gm-Features: AZwV_Qi7tToR25uY6WlcGtxk-3piw3C98qRUN3Lr-_pA-7htZB6yfNnoroFq8-s
Message-ID: <CABxCQKtW5hnTdo7eojMCDyN_bFK3E9MSmacTA=sD+xLYVF279g@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] input: trackpoint - Enable doubletap by default on
 capable devices
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: mpearson-lenovo@squebb.ca, hmh@hmh.eng.br, hansg@kernel.org, 
	corbet@lwn.net, derekjohn.clark@gmail.com, ilpo.jarvinen@linux.intel.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ibm-acpi-devel@lists.sourceforge.net, linux-doc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

Thank you for the comments.

On Sun, Feb 1, 2026 at 5:10=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Vishnu,
>
> On Tue, Jan 27, 2026 at 07:39:05PM +0900, Vishnu Sankar wrote:
> > @@ -470,6 +509,14 @@ int trackpoint_detect(struct psmouse *psmouse, boo=
l set_properties)
> >                    psmouse->vendor, firmware_id,
> >                    (button_info & 0xf0) >> 4, button_info & 0x0f);
> >
> > +     /* Enable doubletap by default on capable devices */
>
> This is obvious from the code, please drop the comment.
Understood.
Will remove this in v7.
>
>
> > +     if (trackpoint_is_dt_capable(ps2dev->serio->firmware_id)) {
> > +             if (trackpoint_write(ps2dev, TP_DOUBLETAP, TP_DOUBLETAP_E=
NABLE))
> > +                     psmouse_warn(psmouse, "Failed to enable doubletap=
: %d\n", error);
> > +             else
> > +                     psmouse_info(psmouse, "Doubletap enabled by defau=
lt!\n");
>
> Drop psmouse_info(), no need to make the driver too noisy.
Understood.
I will be removing his log as well.
>
> Otherwise:
>
>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Thank you
>
> --
> Dmitry



--=20

Regards,

      Vishnu Sankar
     +817015150407 (Japan)
