Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450CC18D626;
	Wed,  8 Jan 2025 21:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736372237; cv=none; b=nJwesbH2VBGfgK90xdA3qaLD33JXnxNXngSv/pWQA7CxY2s+t2xyEd1J/JYmRh5M/VJ01hNVrf9gJ38ir+G8t5FMKGwNAAgppBG5M1f9X1uUeCL1FZpR97iHIT6Imr0uoHpDQ5cWwdapzMf3XWen42WPoJ6ZeySzh/PnwivPN34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736372237; c=relaxed/simple;
	bh=kFFX/loN5gfU/XWf0hvJYB3hary3hW6cVZcZPtKcAi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GqHbwB5GGZraVgyIEopG2AsVu7F2pjC8Z7BOVUXkMLI4upAu28KPWWdFATzdwVpXKNmpjUs8evzaraJWaaIa9FhXv8kuyyZAddy35iazy82PKgO76Oe2OqZXnvZWzB4n1nZaoB4limbSpRJww9/WAoFoEY3F4evpe+o4+/LukhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-84a1ce51187so6683839f.1;
        Wed, 08 Jan 2025 13:37:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736372234; x=1736977034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rkr035lGoBmwz9KK8ReaaYxQpEWXurjEKYgsDndAqWE=;
        b=sX0LGDtiH4fetCdXQG0jbKi/R7lxvSj4mJ6cczpfJDYOMbpwh+hAVcZ+BNSiNGqCAq
         9we+R8S0Bpg+jmalmhfo8UG/ytgXVkqiKCOmuyg0gT/Dk6/oPUjr8NoitUvRhncvR5rT
         7QKMoyXEas1nKPO/yNE6JBIurTgMDGgoXnWSkS9fzSmreGG9Hk7YZoKRrkLuHlO4V68o
         5/RpLPgrQX8p7YZ1QH2qQGhszZ+RC7z0btdL+427dvmp26Prz8YhAKm58xwWkaNedEyQ
         XQOaJsOq88/pHG30BLFrJe1XcAYUStJF70BljIahaU665j7R7sHFjTf60oK4cKflywBX
         azBw==
X-Forwarded-Encrypted: i=1; AJvYcCUYe3vPBM0piH6JrSb8MwftNn4GV6Ce8Wt9tM/VOsk9gIZizLTKKOHI+eSv4NrEAXPDRGnMwYRAXkM=@vger.kernel.org, AJvYcCVRxlg+VsBaAkxbySaR4dV4ZUQkeUCZuF9yX1B0FQjrM2AWhuGJfSxmjHgGXLJTS8NfV+oF2v3IbJv/50Gimy7iGxp33Q==@vger.kernel.org, AJvYcCVU79Zj7AuuMw3kUMHeui5N0MNXXuLzc77dDlthI6L2ZAg7jfT99RYJGZClMj+3yxMRjKLsQOF4tjwz5/nb@vger.kernel.org
X-Gm-Message-State: AOJu0YyA6UdannjaUXAYzPLw8cyQ3k9z6vPIKAwkropI9GgUU4dSTMY4
	tCPZDmxckcgv03iIl+8K3U3irllacV0neXcTNH0kGKvqwa6OIuEGkLTAwkyl
X-Gm-Gg: ASbGnctUiMzBKoy76yDg+b3jNKP19qjNDtiYrwrBuHHqmuOl/84EqTvc0OnsJ+83MJA
	7rfyQSI+q493t4yUXV8bcV4sRNU1pIn+KF8e2B18AvD5WotDqJUesSXqJjbNVw+hxcGA5XLMMV/
	4IMLm6Ga9xZwNUusaIOaiSdZs+Zt4cUkG9hDQlCupHvFHpnftGsuj74he+3yzkCtHaH5T5eOq+G
	+iMDfpERO1M4a5+da9E3n8AGg8WxdFxXiK0jpQjhXBvWltXCfXs1J9Rnec9Z3gnmREprxgTBewj
	K5cNqb/0TWAue0bEX1TMjWljNA==
X-Google-Smtp-Source: AGHT+IEFjYultJ3p8PyY6/IYhiiw91MX8ljurrhXAk5QjM+siQ0uEMCir/KTwYgjmiV5fntkG4YBvg==
X-Received: by 2002:a05:6602:4c06:b0:841:a652:b0c8 with SMTP id ca18e2360f4ac-84ce003c439mr470135839f.3.1736372234308;
        Wed, 08 Jan 2025 13:37:14 -0800 (PST)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com. [209.85.166.178])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-84d61fca4f0sm199439f.44.2025.01.08.13.37.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 13:37:13 -0800 (PST)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3a8f1c97ef1so583565ab.2;
        Wed, 08 Jan 2025 13:37:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUstPAUmrMs1hQfUo5i74JhyrvWGlyOfES3YND8qAsKP6P04KZe77aAYvxCNOx+xbW/7Jwbn82XhV4=@vger.kernel.org, AJvYcCWxEA7lPzZd8kLcFnvwGMyy7imhjfhgdKi9x55w/CqRp7VQdSuNwdtsb+k9zIC+AIGhGW1s9FZ9pE6saXkAfEYQd9PaHg==@vger.kernel.org, AJvYcCXsFkRRrH8DQHUuDthRIQJu5skKbQFY+S146rWGVc3CiCgH2q7w3k5uXCL9u7efq9rvdYMZTr4c5vfUhLAP@vger.kernel.org
X-Received: by 2002:a92:cda6:0:b0:3a7:e0d1:e255 with SMTP id
 e9e14a558f8ab-3ce3aa75a70mr38853085ab.23.1736372233405; Wed, 08 Jan 2025
 13:37:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226153031.49457-1-josh@joshuagrisham.com> <fb019bc7-72ba-4b1b-9260-36cac76a5a60@t-8ch.de>
In-Reply-To: <fb019bc7-72ba-4b1b-9260-36cac76a5a60@t-8ch.de>
From: Joshua Grisham <josh@joshuagrisham.com>
Date: Wed, 8 Jan 2025 22:37:01 +0100
X-Gmail-Original-Message-ID: <CAMF+KebS6eEGEVzrO3Bm3CfL7OYP7-XxUp7hLiDiwUrjWOEJYQ@mail.gmail.com>
X-Gm-Features: AbW1kvbmyuYMBguk01h3aHUr1AdfWMg0_FyKKmCBr1-LaIYtK-36cGslhh9a5E4
Message-ID: <CAMF+KebS6eEGEVzrO3Bm3CfL7OYP7-XxUp7hLiDiwUrjWOEJYQ@mail.gmail.com>
Subject: Re: [PATCH v4] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>
Cc: Joshua Grisham <josh@joshuagrisham.com>, ilpo.jarvinen@linux.intel.com, 
	hdegoede@redhat.com, W_Armin@gmx.de, platform-driver-x86@vger.kernel.org, 
	corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas! I was prepping my v5 patch to send in and trying to figure
out everything I changed for the change list comments, but I stumbled
on a few comments here that I wanted to ask you about as I realized I
did not fully address them.

Den fre 3 jan. 2025 kl 20:37 skrev Thomas Wei=C3=9Fschuh <thomas@t-8ch.de>:
>

> > +This driver implements the
> > +Documentation/userspace-api/sysfs-platform_profile.rst interface for w=
orking
>
> You can make this real reST link which will be converted into a
> hyperlink.
>

Here I actually tried this a few different ways (linking to the entire
page instead of a specific section within the page) but would always
get a warning and then no link when I built the docs. However, from
finding other examples then I found just giving the path like this is
actually giving me a link in both the htmldocs and pdfdocs with the
title of the target page exactly as I wanted... with that in mind,
does it seem ok to leave as-is or is there a syntax that you would
recommend instead to link directly to a page (and not a section within
a page)?

> > +static int galaxybook_acpi_method(struct samsung_galaxybook *galaxyboo=
k, acpi_string method,
> > +                               struct sawb *in_buf, size_t len, struct=
 sawb *out_buf)
>
> in_buf and out_buf are always the same.
>
> > +{
> > +     struct acpi_buffer output =3D {ACPI_ALLOCATE_BUFFER, NULL};
> > +     union acpi_object in_obj, *out_obj;
> > +     struct acpi_object_list input;
> > +     acpi_status status;
> > +     int err;
> > +
> > +     in_obj.type =3D ACPI_TYPE_BUFFER;
> > +     in_obj.buffer.length =3D len;
> > +     in_obj.buffer.pointer =3D (u8 *)in_buf;
> > +
> > +     input.count =3D 1;
> > +     input.pointer =3D &in_obj;
> > +
> > +     status =3D acpi_evaluate_object_typed(galaxybook->acpi->handle, m=
ethod, &input, &output,
> > +                                         ACPI_TYPE_BUFFER);
> > +
> > +     if (ACPI_FAILURE(status)) {
> > +             dev_err(&galaxybook->acpi->dev, "failed to execute method=
 %s; got %s\n",
> > +                     method, acpi_format_exception(status));
> > +             return -EIO;
> > +     }
> > +
> > +     out_obj =3D output.pointer;
> > +
> > +     if (out_obj->buffer.length !=3D len || out_obj->buffer.length < S=
AWB_GUNM_POS + 1) {
> > +             dev_err(&galaxybook->acpi->dev, "failed to execute method=
 %s; "
> > +                     "response length mismatch\n", method);
> > +             err =3D -EPROTO;
> > +             goto out_free;
> > +     }
> > +     if (out_obj->buffer.pointer[SAWB_RFLG_POS] !=3D RFLG_SUCCESS) {
> > +             dev_err(&galaxybook->acpi->dev, "failed to execute method=
 %s; "
> > +                     "device did not respond with success code 0x%x\n"=
,
> > +                     method, RFLG_SUCCESS);
> > +             err =3D -ENXIO;
> > +             goto out_free;
> > +     }
> > +     if (out_obj->buffer.pointer[SAWB_GUNM_POS] =3D=3D GUNM_FAIL) {
> > +             dev_err(&galaxybook->acpi->dev,
> > +                     "failed to execute method %s; device responded wi=
th failure code 0x%x\n",
> > +                     method, GUNM_FAIL);
> > +             err =3D -ENXIO;
> > +             goto out_free;
> > +     }
> > +
> > +     memcpy(out_buf, out_obj->buffer.pointer, len);
>
> Nit: This memcpy() could be avoided by having the ACPI core write directl=
y
> into out_buf. It would also remove the allocation.
>

Now I have replaced in_buf and out_buf with just one parameter, buf.
Now it feels like I cannot write directly to it (since I am reusing
the same buf as the outgoing value) so have left the memcpy in place.
I guess I would need to choose to have 2 buffers or use one and do a
memcpy at the end like this (which is how I have it now in my v5
draft) .. am I thinking wrong here and/or is there a preference
between the two alternatives? I can just for now say that "usage" of
this function in all of the other functions feels easier to just have
one buffer... :)

> > +static int power_on_lid_open_acpi_set(struct samsung_galaxybook *galax=
ybook, const bool value)
> > +{
> > +     struct sawb buf =3D { 0 };
> > +
> > +     buf.safn =3D SAFN;
> > +     buf.sasb =3D SASB_POWER_MANAGEMENT;
> > +     buf.gunm =3D GUNM_POWER_MANAGEMENT;
> > +     buf.guds[0] =3D GUDS_POWER_ON_LID_OPEN;
> > +     buf.guds[1] =3D GUDS_POWER_ON_LID_OPEN_SET;
> > +     buf.guds[2] =3D value ? 1 : 0;
>
> No need for the ternary.
>

I did not have this before but it was requested to be added by Ilpo
IIRC. I am ok with either way but would just need to know which is
preferred between the two :)

> > +static void galaxybook_i8042_filter_remove(void *data)
> > +{
> > +     struct samsung_galaxybook *galaxybook =3D data;
> > +
> > +     i8042_remove_filter(galaxybook_i8042_filter);
> > +     if (galaxybook->has_kbd_backlight)
> > +             cancel_work_sync(&galaxybook->kbd_backlight_hotkey_work);
> > +     if (galaxybook->has_camera_lens_cover)
> > +             cancel_work_sync(&galaxybook->camera_lens_cover_hotkey_wo=
rk);
> > +}
> > +
> > +static int galaxybook_i8042_filter_install(struct samsung_galaxybook *=
galaxybook)
> > +{
> > +     int err;
> > +
> > +     if (!galaxybook->has_kbd_backlight && !galaxybook->has_camera_len=
s_cover)
> > +             return 0;
> > +
> > +     if (galaxybook->has_kbd_backlight)
> > +             INIT_WORK(&galaxybook->kbd_backlight_hotkey_work,
> > +                       galaxybook_kbd_backlight_hotkey_work);
> > +
> > +     if (galaxybook->has_camera_lens_cover)
> > +             INIT_WORK(&galaxybook->camera_lens_cover_hotkey_work,
> > +                       galaxybook_camera_lens_cover_hotkey_work);
>
> I would just always initialize and cancel the work_structs.
> This is no hot path and it makes the code simpler.
>

I apologize but I don't think I am 100% following what you mean here.
Is there an example or more information that can be provided so I can
know what should be changed here?

> > +     err =3D galaxybook_enable_acpi_notify(galaxybook);
> > +     if (err)
> > +             dev_warn(&galaxybook->platform->dev, "failed to enable AC=
PI notifications; "
> > +                      "some hotkeys will not be supported\n");
>
> Will this dev_warn() trigger always for certain devices? If so a
> dev_info() would be more appropriate IMO.
>

Yes good point here; for the devices which have this condition, they
will get this message every single time, so I will change it to info.
I can also change it to debug if that makes even more sense.

> [...]

Other than these I think (hope) I have tried to address everything
else from all other comments. I will hold off on sending this v5 in
case you reply soon-ish but otherwise will go ahead and send it as-is
in the next day or two just to keep the feedback cycle going.

Thank you again!

Best regards,
Joshua
