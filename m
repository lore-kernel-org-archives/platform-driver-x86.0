Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4D81EA91
	for <platform-driver-x86@vger.kernel.org>; Wed, 22 May 2024 19:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716406399; cv=none; b=N9pteNAVMQSUBoaqihavJEPiKU0U0+9nLA4Prh2KVTsC94Ceg8yaG/J8vVshvpxARgM+o5LxIV0x8Lm+o0ej3sOMbUBtEiX+5i80mD8iDGXwaFKqenyk4L1LmQPY33LFyCn2sNiZ2irzvI+u3+gHFpz/wEFmlWYsB7bS62rLHG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716406399; c=relaxed/simple;
	bh=AwSatDFqBWJu4m2n/UAntvXnVwBpzXDu5DoVUaWJLDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jf6rHkR59pJ7ii6JIJSFMztKEN6O8YD+J7SR+vuZTQOsu85zXb2/fZtChoixooKJ+Ga+wY+v+aUHQQWHObqyYIPu3MEgw/FSx3FoGap8MiHMg2WMBayQ5OshuIccvL113/BQ2qMgCTdtSTRBGk2cNygWd6cyKvkiz+CfH3aU9kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gJbHTvQZ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJbHTvQZ"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a59a934ad50so1002422766b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 May 2024 12:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716406396; x=1717011196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9vvqYaJ5smdirFqb7hYqRHIQkOvrV0341CY2tGcTOzk=;
        b=gJbHTvQZlGg+rwSZiaYvVDekYoBg96ZOqyaRC4DnbmUEHp696vD+HXzu9tLxLY9eeq
         sx51eSFQe/E14fKVv5wFObWHrjtbsys+BgIU/fA1A2zTBEseR9PNMjykysQKGf2KDSBy
         5itg1GoRwR2iItMmLtz3rZwgOWxFwpqpz6o5NPM0dNFyE6ZuPz1yRbTk0gGobUXm/TYs
         YCnj4IDHuZCs1BHpYHpEtZS72aOw+hpkuIWSTIovM8lBXTLF4PM7SDig6a2d/Ltkl8z5
         8VoyuH/R2sCuUezvBFJg8oaQ2QMwr44pnRmayy2zriLlP7JoY71Trku1q34198asc77m
         FUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716406396; x=1717011196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9vvqYaJ5smdirFqb7hYqRHIQkOvrV0341CY2tGcTOzk=;
        b=RyaoGZ3u9rrhQhb7kAtcZ5WKopMFf1sQA/TW7/iZx1cUi+8vzCCB5sWt//LEn6acFj
         W7Wd/jQd5TJEOArxdejZpNsZ9HVBDT9qxDncfsxVujxrNKjRc64d1y6oglsYp0pLlhQN
         pQ4BeETXcZfQvmwFoXhjfCU0uOIGUhpOJ013c+O3vZnwBgZTQnqHxCFUBmQt4Mn5ZaNp
         Wg5zb++FDDR8saHMLb6SS5XGCL4gxErAZruoRLVq1nb9i7GVRzLCDVe/tBtEvAjO3lJk
         qwexl9c1E1t4jrk7sV3VPCSuggftvjqFdpvMb28aKBxa/MM4161N+roTY/QfdAH+NBtu
         auJQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/XKeXgxTlXaiLnChF/tlnXLZeKhaXhlUhyH8/3SPIWHLUggBSE6f9IYelEBPyF8PF76wwXUCIHVq/HV/MpU3VvrlF/6ApldOvp4x/taKse8yUrQ==
X-Gm-Message-State: AOJu0YxK9xmAG91cbB41ai6K8vD4PavG1MxEd9C7ccvDQkWvWkh2A1s8
	RnnDoVTBOBHeuO3KzjZIy11PaLdo1DnP/e2dvI42ZzG32EKcRPyhX1xaR4fMPA/JmDkNOYgliAF
	ojTWXrQAYiqH9lGvrFweTrMd8vOE=
X-Google-Smtp-Source: AGHT+IFNVj+yb5caIIf9DTmp4/aD/ooyAlP+IiCDzQ8mn0kL6aiNU1nqthXja3iqvb1XqFhqetwvZglmsE2UjSI0uag=
X-Received: by 2002:a17:906:71db:b0:a5a:54ca:5bf9 with SMTP id
 a640c23a62f3a-a622818c89cmr188735666b.64.1716406396157; Wed, 22 May 2024
 12:33:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240522164807.28936-1-hdegoede@redhat.com> <Zk4pC0dkmTEcS_qA@smile.fi.intel.com>
 <4c14d61f-dc0c-4495-a74c-fa0cef4362d5@redhat.com>
In-Reply-To: <4c14d61f-dc0c-4495-a74c-fa0cef4362d5@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 22 May 2024 22:32:39 +0300
Message-ID: <CAHp75Vex78gE+e8kaUvvNjVUtkv-3GGgcMFZ3tFFqK49WRQDrA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add support for setting
 touchscreen properties from cmdline
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, Gregor Riepl <onitake@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2024 at 9:40=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
> On 5/22/24 7:19 PM, Andy Shevchenko wrote:
> > On Wed, May 22, 2024 at 06:48:07PM +0200, Hans de Goede wrote:

...

> >> +    /*
> >> +     * str is part of the static_command_line from init/main.c and po=
king
> >> +     * holes in that by writing 0 to it is allowed, as is taking long
> >> +     * lasting references to it.
> >> +     */
> >> +    ts_cmdline_data.acpi_name =3D strsep(&str, ",");
> >> +
> >> +    for (i =3D 0; i < MAX_CMDLINE_PROPS; i++) {
> >> +            name =3D strsep(&str, ",");
> >> +            if (!name)
> >> +                    break;
> >> +
> >> +            /* Replace '=3D' with 0 and make value point past '=3D' o=
r NULL */
> >> +            value =3D name;
> >> +            strsep(&value, "=3D");
> >> +            if (!value) {
> >> +                    ts_cmdline_props[i] =3D PROPERTY_ENTRY_BOOL(name)=
;
> >> +            } else if (isdigit(value[0])) {
> >> +                    ret =3D kstrtou32(value, 10, &u32val);
> >> +                    if (ret)
> >> +                            return ret;
> >> +
> >> +                    ts_cmdline_props[i] =3D PROPERTY_ENTRY_U32(name, =
u32val);
> >> +            } else {
> >> +                    ts_cmdline_props[i] =3D PROPERTY_ENTRY_STRING(nam=
e, value);
> >> +            }
> >> +    }
> >
> > This reminds me a lot from the next_arg(), can we not reinvent a wheel?
>
> next_arg is meant for parsing different arguments on the kernel cmdline
> split by spaces. It has space as separator hardcoded so it cannot be
> used here.

I believe it's not the first time I hear such an excuse for
duplicating Yet Another (Same) Parser.
If you think you really need another separator, we may patch
next_arg() or add next_arg_any(is_separator_fn *fn) and make
next_arg() to be a wrapper of the other one.

--=20
With Best Regards,
Andy Shevchenko
