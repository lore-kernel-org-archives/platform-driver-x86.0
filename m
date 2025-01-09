Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F56813B2B8;
	Thu,  9 Jan 2025 21:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736458425; cv=none; b=BTHVWRHe0O6CTcx3ANNYrlJtTO9R/yZqHxKCJxhWiH8+WHwP48oqYHATylq1QP9T+W/VPaCK4aJ1mVnjFlomH6DQfoQh0Q/IgShWdRvG5iml6/C4tXIPP/h3BzWDM+hIdtspgTQmMyfTXhICEew5IWBhxIooz1sKhHMCShb2GFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736458425; c=relaxed/simple;
	bh=hMVg4l0Xb088MiEEOfRE9qEvSVtU7ZGMohLFU9Bf1Rk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XQI0qmWXdmGjP88F1trgXXTcBJ4qyx/hBEhNx0rP7ydb06SrwadR6qHQDdCZ5pYZt2Ud3QvHNcU/LR7oWHNdKOQDsUE66EjitfKH2eXSV2qQn2KvA5rWAe4r7TCIYl20YiP9YYfLxGU4chBJYdjhLe+4iUDwBz/C6UaCqqTaCAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-844e9b83aaaso100581839f.3;
        Thu, 09 Jan 2025 13:33:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736458422; x=1737063222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=znzf9Ws5srA6nvuUT9olkx1+/Y2WL0svrtrPLYOzwvw=;
        b=dgLAaEmQRr+w+lXgkrXXIJ9/gIJw7/0Z1gz40b5noLd7bUP1CuALExrVtbBXsUM0qL
         8aDM1QqmyAQmo25s/xBRi1vGT2dBRzst7zRcv09Zasp8NoiYS3+iPjxtILp9T6+meRRw
         9wgaHHw2KMWIs8PmrJICTZydu0Iqcco/o/6RM9XEeWPoQiPTFLt3R7zXRcfi0GaH34eR
         a7WFcIrgDucFYtT1z+7AhjHh+H3UDIP9rS5h5eKZu0d32AXfziol4RqlGYb7iJt9X9Pg
         ztMhvgc/VnFApqFf0BayVB01JWc11kc9Lt9b7dhTprzpvNoXLXMXKk7EMFqrNEnIBT6X
         ynNA==
X-Forwarded-Encrypted: i=1; AJvYcCUq+gRO5YBPBju8bXype0GUk0r4U0aPzi+1xMZDkBTlg1KZ/GsFjKdD741W6ZV2Ml72AwSSc6OZEiv044ws@vger.kernel.org, AJvYcCVE3vrvZzDYQVWOvwrdFu6ax3b1tPnHBGu5tGr/h71lr2KpdHNX4AyOgO5EETeh/Lu7UYlK/ZWxcg8KrCv7fKnYyYu3UA==@vger.kernel.org, AJvYcCWwMaWpmN25S1QO0ClRAz8QOhrqdGxssDmHlymIEQRX49B0pXIvNoTruEPPkAD/3p0e5j5uBMkyUcU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqUsXj9w9iV4DM/MOR5k1E591lgr6Q5pZyHTHzZx3OXn6TwPw+
	64Dqk0EW/cPTwFSBd5Ry69zPrJg9kOcjeIKFVc4o7CkB1BPUpkuvwUoGkQf1X6Q=
X-Gm-Gg: ASbGncu3w4TmTAhrVbvtf+a2pZnW+R9LSofxKneTJ98HEmK3iCPBNOetTdkr3+47eMQ
	m0hRF15slNeuvAU79vVqIJRZzxtUDsnXnDs2xY5cfeAg55BEhvcg1l0kVdVCLea7sk5zTjsrvgy
	S3tXT1U38bh1cgEEx0HHzyoJkh+yR5PIQzNDSZnmi8MjChgRNKsBQN5kXAL3u1UQg49kGsS98Ub
	ukW7aSH4z4uW6xUft9JVInzw9C+mdq1r+nEXSKH3NOtLl5ACYWlSBJl/Bv41XxOdHoPBktVdEO1
	29Y/vaUbCzKBcX8oNJnNAw==
X-Google-Smtp-Source: AGHT+IFhTKhDciia02C2XFywBgKS+lwXbztq1imFXbD1lAzPN5l05+sEeFR/vhVYLzlAaSCMqER1Ng==
X-Received: by 2002:a05:6e02:1945:b0:3a7:e800:7d37 with SMTP id e9e14a558f8ab-3ce3a878177mr60022405ab.10.1736458422292;
        Thu, 09 Jan 2025 13:33:42 -0800 (PST)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com. [209.85.166.44])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ce4add8827sm5723695ab.35.2025.01.09.13.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 13:33:42 -0800 (PST)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-844bff5ba1dso90946339f.1;
        Thu, 09 Jan 2025 13:33:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUIeEhIAjliWDeY7O/pbrgsKmm5hCyUflcy/LfxY+PZDOARfmNP2qI0tPP93VxvXFXUm79X2dzo6TrltTfj@vger.kernel.org, AJvYcCWRJORIZqzozGYaDa6M9jgW0BpPT6ydESzfbNmYxDsWdfe/XKYZr77DJ7emEHw9RNPkuZPv1m6SMGM=@vger.kernel.org, AJvYcCXydqQXN+2/HEtDnQp5sEAMKGqR3dfOP3K7VyFIX/yIqNk6HCUBP96L5fnEopgrkgIa9QPSBo3K71+1o/PxhjYsAyjGNA==@vger.kernel.org
X-Received: by 2002:a92:c26d:0:b0:3a7:87f2:b00e with SMTP id
 e9e14a558f8ab-3ce3a8bb3cbmr63769435ab.19.1736458421839; Thu, 09 Jan 2025
 13:33:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226153031.49457-1-josh@joshuagrisham.com>
 <fb019bc7-72ba-4b1b-9260-36cac76a5a60@t-8ch.de> <CAMF+KebS6eEGEVzrO3Bm3CfL7OYP7-XxUp7hLiDiwUrjWOEJYQ@mail.gmail.com>
 <19caaf5c-dbdd-43a4-989f-35a810dbe91a@t-8ch.de>
In-Reply-To: <19caaf5c-dbdd-43a4-989f-35a810dbe91a@t-8ch.de>
From: Joshua Grisham <josh@joshuagrisham.com>
Date: Thu, 9 Jan 2025 22:33:30 +0100
X-Gmail-Original-Message-ID: <CAMF+KebyMbv_t1-BvjfcXRBK-hGo=o0-Nt3LgKkUyBLfmV_4bg@mail.gmail.com>
X-Gm-Features: AbW1kvY6F_jIx5ub_reAAqdxOhienkhT5tjNAQfIR-NFeT3LEFEMOzwd1z0AqmE
Message-ID: <CAMF+KebyMbv_t1-BvjfcXRBK-hGo=o0-Nt3LgKkUyBLfmV_4bg@mail.gmail.com>
Subject: Re: [PATCH v4] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>
Cc: Joshua Grisham <josh@joshuagrisham.com>, ilpo.jarvinen@linux.intel.com, 
	hdegoede@redhat.com, W_Armin@gmx.de, platform-driver-x86@vger.kernel.org, 
	corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

Den ons 8 jan. 2025 kl 23:07 skrev Thomas Wei=C3=9Fschuh <thomas@t-8ch.de>:
>
> If it works, then leave it as is.
> To exact warning would have been nice though :-)
>
> Did you try :ref:`userspace-api/sysfs-platform_profile`?
>

Just tried this specifically again and the warning was:
./Documentation/admin-guide/laptops/samsung-galaxybook.rst:72:
WARNING: undefined label: 'userspace-api/sysfs-platform_profile'
[ref.ref]

As it seems to work exactly as intended with only having the path as
clear text (a link is added in both pdf and html plus the title of the
target page is displayed as the link text) then I will leave as-is for
now but please say if you would like for me to try anything else!

> > > > +static int galaxybook_acpi_method(struct samsung_galaxybook *galax=
ybook, acpi_string method,
> > > > +                               struct sawb *in_buf, size_t len, st=
ruct sawb *out_buf)
> > >
> > > in_buf and out_buf are always the same.
> > >
> > > > +{
> > > > +     struct acpi_buffer output =3D {ACPI_ALLOCATE_BUFFER, NULL};
> > > > +     union acpi_object in_obj, *out_obj;
> > > > +     struct acpi_object_list input;
> > > > +     acpi_status status;
> > > > +     int err;
> > > > +
> > > > +     in_obj.type =3D ACPI_TYPE_BUFFER;
> > > > +     in_obj.buffer.length =3D len;
> > > > +     in_obj.buffer.pointer =3D (u8 *)in_buf;
> > > > +
> > > > +     input.count =3D 1;
> > > > +     input.pointer =3D &in_obj;
> > > > +
> > > > +     status =3D acpi_evaluate_object_typed(galaxybook->acpi->handl=
e, method, &input, &output,
> > > > +                                         ACPI_TYPE_BUFFER);
> > > > +
> > > > +     if (ACPI_FAILURE(status)) {
> > > > +             dev_err(&galaxybook->acpi->dev, "failed to execute me=
thod %s; got %s\n",
> > > > +                     method, acpi_format_exception(status));
> > > > +             return -EIO;
> > > > +     }
> > > > +
> > > > +     out_obj =3D output.pointer;
> > > > +
> > > > +     if (out_obj->buffer.length !=3D len || out_obj->buffer.length=
 < SAWB_GUNM_POS + 1) {
> > > > +             dev_err(&galaxybook->acpi->dev, "failed to execute me=
thod %s; "
> > > > +                     "response length mismatch\n", method);
> > > > +             err =3D -EPROTO;
> > > > +             goto out_free;
> > > > +     }
> > > > +     if (out_obj->buffer.pointer[SAWB_RFLG_POS] !=3D RFLG_SUCCESS)=
 {
> > > > +             dev_err(&galaxybook->acpi->dev, "failed to execute me=
thod %s; "
> > > > +                     "device did not respond with success code 0x%=
x\n",
> > > > +                     method, RFLG_SUCCESS);
> > > > +             err =3D -ENXIO;
> > > > +             goto out_free;
> > > > +     }
> > > > +     if (out_obj->buffer.pointer[SAWB_GUNM_POS] =3D=3D GUNM_FAIL) =
{
> > > > +             dev_err(&galaxybook->acpi->dev,
> > > > +                     "failed to execute method %s; device responde=
d with failure code 0x%x\n",
> > > > +                     method, GUNM_FAIL);
> > > > +             err =3D -ENXIO;
> > > > +             goto out_free;
> > > > +     }
> > > > +
> > > > +     memcpy(out_buf, out_obj->buffer.pointer, len);
> > >
> > > Nit: This memcpy() could be avoided by having the ACPI core write dir=
ectly
> > > into out_buf. It would also remove the allocation.
> > >
> >
> > Now I have replaced in_buf and out_buf with just one parameter, buf.
> > Now it feels like I cannot write directly to it (since I am reusing
> > the same buf as the outgoing value) so have left the memcpy in place.
> > I guess I would need to choose to have 2 buffers or use one and do a
> > memcpy at the end like this (which is how I have it now in my v5
> > draft) .. am I thinking wrong here and/or is there a preference
> > between the two alternatives? I can just for now say that "usage" of
> > this function in all of the other functions feels easier to just have
> > one buffer... :)
>
> I'm not sure if there is a preference.
>
> But why can't you modify the buffer if it is shared between input and
> output? The caller already has to accept that its buffer will be
> overwritten.
> If it is overwritten once or twice should not matter.
>
> But maybe I'm misunderstanding.
>

There is a very non-zero chance that I am trying to do this completely
wrong ;) but basically if I swap

struct acpi_buffer output =3D {ACPI_ALLOCATE_BUFFER, NULL};
to
struct acpi_buffer output =3D {len, buf};
or even
struct acpi_buffer output =3D {len, (u8 *)buf};

Then I am getting return code of AE_BUFFER_OVERFLOW when trying to
call the method, even though when using ACPI_ALLOCATE_BUFFER len is
always the same as the allocated out_obj->buffer.length.

I have also tried a few variations of using a union acpi_object and
setting the buffer member properties etc but always I am getting
AE_BUFFER_OVERFLOW so it seems like something is a bit off on the
length or I am using the wrong types or something. I have tried
looking through the entire tree and using ACPI_ALLOCATE_BUFFER is
almost universal so it is tough to find examples to try and understand
what else might be possible without really digging deep into the ACPI
tree.

If you know right off the top of your head then please feel free to
mention, otherwise I will keep the new buffer and do a memcpy and free
the newly allocated buffer at the end for the time being!

Thanks again!
Joshua
