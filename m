Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB4982488
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jul 2024 12:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719922358; cv=none; b=AlI3Vet1NFbJW8MlNAYAjyydbA6aConAL33pRvmXhu/iQe9AhPLOOiCxXXtx0UOXnMz10O/xEuA+biHJktPe0QuhzLpzHJe6CSSRYfooUKmQLMjNJKMy66ZdQqnja16SzRGTwaLaOSznXZqxBdBi3eCN8zPc3/Ptzms/wJ7ryho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719922358; c=relaxed/simple;
	bh=XEqjlQDJ2vqsKUrvmHDmRzD5pE4ApK1dfB6jPWbsTO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W9qOBIZdhGXR1qMiOt8053y0hRk23XleEJGgrY3Y42hjBnUHHniU5uGe/NkVdYXcQTiwweq/8G0jna09AP1xibwukw9SCYGYZeORT7toVjbmhQmjGbjGfrqBx/XlGq9czWToiUbPcGS1eorylbhlbtu54fdLremM+ldw/Kbl0cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.it; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QmnlWkL+; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QmnlWkL+"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3761f8d689fso17694035ab.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Jul 2024 05:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719922355; x=1720527155; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XEqjlQDJ2vqsKUrvmHDmRzD5pE4ApK1dfB6jPWbsTO0=;
        b=QmnlWkL+07QRKHVWw2qTHdU+usUCbqF7LLB3LTluap+QpSsLoa4A2HP8fRy1aPBhjQ
         fwvtti6Bb6fF21WczmM/8YMlVDJeQgKnZbfkNW3ybcji5kjUxfGIIK0YYZZlGZu5z4BE
         sk3v7uAzmF4Oa03if1qJ3B372gBvqf2lNi+WQgajP7hCw+e0N+bvbEyUrEG0COHTPB7o
         EHeKz3rzLU/3zLzi5zAmfmQbuZlvldngBoR9M5wszietnPGhPyfjpHvPDgG8+/8HuCpI
         LKhn0qRLmdXw/VtwGpFS4RShuToWuaF2+hLFX7uEeMxFOzPY4GEtlyVvxRMWnntcHBgT
         dhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719922355; x=1720527155;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XEqjlQDJ2vqsKUrvmHDmRzD5pE4ApK1dfB6jPWbsTO0=;
        b=xSNk4AXDFwozMl48kxVX5a7f6HOew1wVTQmBvDjVgn/n4ZJY3JHQvS7/U1umy9gXhY
         tCuEOG99RocggwBqXY34Dq3LSBnz0LGJIrCsh1ywredxT82t/2RvP113Or6mmfBoO9HH
         +9Jzr1EohkyCNow7jkaAauygqqml14bQYvjtZfUp/mgv2lrn9lpKoajEYFVbNCf6HVA8
         bxyP37POR96AmbTRp7FCIMen1T4A0WyedqLaykf9oNsFJK7+1B77C8FOtVi1XWNRLMfj
         cBVO4sA7aAbZru0xuLTCoqEqVyQKFjr1rJWq8GHY+8NDlz5IORsZb3ad3HQ/M/CZyxLP
         89+g==
X-Forwarded-Encrypted: i=1; AJvYcCVJXnWOx3T400Y1HOvy8NrC30VP3sd3j1zVtiKizZp/yAWS9NJa115oquWT8AapwS/Zb9xOc6XDHNJRTUqBgnmrNR21W0wWHrohNR5TqnhOGP/+hw==
X-Gm-Message-State: AOJu0YywMhYkvn7Y9ZmkFFtmXPlFYFFWKKwV/zBzo1wfrkmc/Vo6cjFJ
	kRW6weIbr6YxgaQjITkJtpK6cj1zeC0tEHzafMZS8hL3s9a4RNR5
X-Google-Smtp-Source: AGHT+IEnoZoszPXsmWPwm2UuEwrJdRyRWzyrb4zk57QGLemjIxp+y0we5r1/UuXBz9NjZRi9cj6JcQ==
X-Received: by 2002:a05:6e02:13a9:b0:375:ca62:a418 with SMTP id e9e14a558f8ab-37cd31b6d2bmr114061985ab.22.1719922353623;
        Tue, 02 Jul 2024 05:12:33 -0700 (PDT)
Received: from taihen.jp ([2405:6580:2100:d00:5df1:9ecd:d6d7:59a7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c69b51fa7sm6476148a12.18.2024.07.02.05.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 05:12:33 -0700 (PDT)
Sender: Mattia Dongili <malattia@gmail.com>
Date: Tue, 2 Jul 2024 21:12:30 +0900
From: Mattia Dongili <malattia@linux.it>
To: Armin Wolf <W_Armin@gmx.de>
Cc: =?euc-jp?B?TWljaGGPqcg=?= Szczepaniak <m.szczepaniak.000@gmail.com>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [sony-laptop] Hardware keys are not properly mapped on Sony VAIO
 UX VGN-UX390N
Message-ID: <ZoPurnLUNXW4_T_u@taihen.jp>
References: <ZnDhk4YvczQV0JhW@taihen.jp>
 <2c7aeda6-40a5-43e8-ad7d-c1ba4e8ee0c0@gmail.com>
 <617b732c-f044-46ca-a7eb-cade979386c7@gmx.de>
 <bb8ddd94-53e7-4824-94c6-f2ebff7d93ea@gmail.com>
 <c6f4cbb7-ced0-4dfd-8d58-42878a47329c@gmx.de>
 <ZnKOpP0sSklJh53i@taihen.jp>
 <3f3b63a3-7d6b-4f84-929c-41c9998f256d@gmail.com>
 <ZnKT6E5_bFdOa1bt@taihen.jp>
 <dac93fe5-a72d-43dc-a7b2-c203f4c3156c@gmx.de>
 <af6fd27a-76bd-472d-a773-d25d23ad15c9@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <af6fd27a-76bd-472d-a773-d25d23ad15c9@gmx.de>
X-Message-Flag: Cranky? Try Free Software instead!
X-Operating-System: Linux 6.8.12-amd64 x86_64
X-Editor: Vim http://www.vim.org/
X-Disclaimer: Buh!

On Sat, Jun 29, 2024 at 10:07:25PM +0200, Armin Wolf wrote:
> Am 19.06.24 um 14:02 schrieb Armin Wolf:
>=20
> > Am 19.06.24 um 10:16 schrieb Mattia Dongili:
> >=20
> > > On Wed, Jun 19, 2024 at 10:00:18AM +0200, Micha=C5=82 Szczepaniak wro=
te:
> > > > On 19/06/2024 09:54, Mattia Dongili wrote:
> > > > > On Tue, Jun 18, 2024 at 11:18:12PM +0200, Armin Wolf wrote:
[...]
> > > > > > =C2=A0 From 7c44c1d15f859647f19e5e2d9874432bb3a5cb92 Mon Sep 17
> > > > > > 00:00:00 2001
> > > > > > From: Armin Wolf <W_Armin@gmx.de>
> > > > > > Date: Tue, 18 Jun 2024 23:09:36 +0200
> > > > > > Subject: [PATCH] platform/x86: sony-laptop: Fix
> > > > > > SONYPI_EVENT_ZOOM_OUT_PRESSED
> > > > > > =C2=A0=C2=A0 on Sony VAIO UX VGN-UX390N
> > > > > >=20
> > > > > > It turns out that on type 3 models, the definitions for the
> > > > > > programmable
> > > > > > keys partially conflict with the definitions for the zoom keys.
> > > > > >=20
> > > > > > This causes SONYPI_EVENT_ZOOM_OUT_PRESSED on the Sony VAIO UX
> > > > > > VGN-UX390N
> > > > > > to be reported as SONYPI_EVENT_PKEY_P1. Fix this by providing a
> > > > > > separate
> > > > > > definition for type3 models without the conflicting key entry.
> > > > > >=20
> > > > > > Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> > > > > > ---
> > > > > > =C2=A0=C2=A0 drivers/platform/x86/sony-laptop.c | 9 ++++++++-
> > > > > > =C2=A0=C2=A0 1 file changed, 8 insertions(+), 1 deletion(-)
> > > > > >=20
> > > > > > diff --git a/drivers/platform/x86/sony-laptop.c
> > > > > > b/drivers/platform/x86/sony-laptop.c
> > > > > > index 3e94fdd1ea52..0e1d099ac06a 100644
> > > > > > --- a/drivers/platform/x86/sony-laptop.c
> > > > > > +++ b/drivers/platform/x86/sony-laptop.c
> > > > > > @@ -3451,6 +3451,13 @@ static struct sonypi_event sonypi_pkeyev=
[] =3D {
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { 0, 0 }
> > > > > > =C2=A0=C2=A0 };
> > > > > > +static struct sonypi_event sonypi_pkeyev_type3[] =3D {
> > > > > > +=C2=A0=C2=A0=C2=A0 { 0x01, SONYPI_EVENT_PKEY_P1 },
> > > > > > +=C2=A0=C2=A0=C2=A0 { 0x02, SONYPI_EVENT_PKEY_P2 },
> > > > > > +=C2=A0=C2=A0=C2=A0 { 0x04, SONYPI_EVENT_PKEY_P3 },
> > > > > > +=C2=A0=C2=A0=C2=A0 { 0, 0 }
> > > > > > +};
> > > > > > +
> > > > > > =C2=A0=C2=A0 /* The set of possible bluetooth events */
> > > > > > =C2=A0=C2=A0 static struct sonypi_event sonypi_blueev[] =3D {
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { 0x55, SONYPI_EVENT_BLUET=
OOTH_PRESSED },
> > > > > > @@ -3572,7 +3579,7 @@ static struct sonypi_eventtypes
> > > > > > type3_events[] =3D {
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { 0x31, SONYPI_MEMORYSTICK=
_MASK, sonypi_memorystickev },
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { 0x41, SONYPI_BATTERY_MAS=
K, sonypi_batteryev },
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { 0x31, SONYPI_PKEY_MASK, =
sonypi_pkeyev },
> > > > > > -=C2=A0=C2=A0=C2=A0 { 0x05, SONYPI_PKEY_MASK, sonypi_pkeyev },
> > > > > > +=C2=A0=C2=A0=C2=A0 { 0x05, SONYPI_PKEY_MASK, sonypi_pkeyev_typ=
e3 },
> > > > > Based on the commits you found, the conflicting event was added f=
or
> > > > > the
> > > > > VGN-A series (a Type3 model). This change is effectively removing
> > > > > the P1
> > > > > button handling for them.
> > > > >=20
> > > > > See 3eb8749a37990b505ab94466038c067444bbd7eb and later
> > > > > e93c8a6819b217f4f4a490f67f26e02ff6b23b44: there used to be a Type4
> > > > > model
> > > > > that was meant to keep some of the events separate from Type3 mod=
els.
> > > > > Perhaps reintroducing the distinction is going to serve us better=
 in
> > > > > this case?
> > > > > The IRQ handler can be shared between Type3/4, but the events
> > > > > can be in separate arrays, one for type3 and one for type4.
> > > > >=20
> > > > > What do you think?
> >=20
> > Sounds good, however there seem to be even more conflicting key
> > entries inside the type 3 key definitions.
> > Since you are the maintainer of the driver, i would prefer if you
> > would handle this.
> >=20
> > Thanks,
> > Armin Wolf
> >=20
> Any progress so far?


Sorry, no. I don't think I'll have time to work on this for a few more week=
s.
If you want to work on a fix please do, but like I said I'd rather not
risk breaking other models to fix one.=20

--=20
mattia
:wq!
