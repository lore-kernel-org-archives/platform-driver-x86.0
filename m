Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C13188CCA;
	Fri,  3 Jan 2025 18:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735928406; cv=none; b=JSGHIaZvvl65AnNeKC56306SEZIBrwST8Tf0JBivhXHg2eSQ2TaCDZUiJzWUUSBg31ZgprO8OoQ9GIez6EqLG6L9ibetrNtipZPJt7ETFm9KneVriMWDbREjaLS+FLaEVwEA3kFaS8upbhiuhncW6Cq/737AkBEkwGy5dha5IOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735928406; c=relaxed/simple;
	bh=SGwD/TnnZ0U28x1rkorInSVO+DlibL55BzxH7BSE3bc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N3+lFdY6pYpoMRBJedxg1mKFWUXsBclrSJ1E/5o/9jy8wdHc2qtpC3yjWiD/egLrt/WdHRXKFw4Oxz0WLEdXSFrU8+nehf63K4/ys7t5Ck9hAYYxkeddDRvO0sZXtrKs6XyvkKPEfYnjm/ATEwtCqPjLjnzxsrP0Wxxf0DvEawA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-8442ec2adc7so465469139f.2;
        Fri, 03 Jan 2025 10:20:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735928404; x=1736533204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VefR8EGI5D8o7LjxqTAm0xJU0782DCp9CgfWtfqhV0Y=;
        b=UQsWItmO+vaEKhmJkxYDMeeqecbEmdx4tJ6Yln+xPqqAcFEKmu15el9SZUCph4HOTJ
         RHvrcZxVt6AKBhCnIVkVrOLSF0TKDsu4xr0PTy+l2mi7/Xqlw3TTGnVnBOwDLDm4FrN1
         3WwR0flw3P8SYwd08JZFWHnmU5VMEI6omXGo2BhjLcOOYCQNOX/qZtYxXCNx76hRvnJr
         iS7Plqjuz/bLe+YHVVQUPvUvtLt17VnH7FOlJxVaVdAuiI5Z0VymJFENz6psHUhJR7bw
         5g/4KDJbUquNFHWi+S/U9y7gXKu9Zhq6kXoFOXUQh/zmCiTSCR1S3xG9SpHrPjpYL2Xg
         mcmg==
X-Forwarded-Encrypted: i=1; AJvYcCUW1yMNL+lRRdtiUFi73g4Dk1ou8doRm+XueQj+krrMAefuWBkM9N+NtrRDsWRSA04pJ+XFXh/LfJn9bTrQ11Hy+WdAww==@vger.kernel.org, AJvYcCWoYmZvWYSieUKvu2asHA5w8hWE09BXdRwowG9YNIsg98/9H0jSg1WqUa7ZGL9KlRu6lMCO6TudJm4NXha5@vger.kernel.org, AJvYcCXdHOCEfB5zqiQMrkEFqiOVAhkysI+3pJwpYtzyTD5xUkSoz9+rPDjquUOf7chkRD6cNkskHo5ecBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuvBUAWGquIoc1t2xAWD6cSytZZLu6l3IomEM5tbJ7Rxe+iZuS
	fUVQAJmEpzjXcpwJz8kQozpBM5pDr3qQjXp9jhUK0PyWqClGLUHh0bPQbYOzRdQ=
X-Gm-Gg: ASbGncu811UxeonW6JevyBtugLY/UBA77ajOIuoQWDX78HijZ2eTnchUhZZzf0P1nRv
	6XD+pyda9x/QS6wPiilZojO0HblMaIvPeXuPzetSMvYo3Pko3IoCB+SQlKmrdxdXYcr7qnAmbDx
	FOTkZPHNCdsD7TP+nleG9q1ySLIxRqVoud+qwmZCYq7G7UrpZ0HQprmoczVp+7UJIHA3zMEn+yX
	utJO6GvjYXlgX9xGuAOWmNv5wvWEWL38QrLDABRHY6+zfD9Mrb2L39UG4aM/QW77aGqyOs8wwDs
	4GpVoRmjz7xd53RKEtHkwhrJRA==
X-Google-Smtp-Source: AGHT+IGUByHsixjfei9U1+OiTIblUnrijoO0zEbrOwaDhrMQ04zTRGnWHlOpAAXfNfuwFlk6t2S0pw==
X-Received: by 2002:a05:6e02:1d9c:b0:3a7:87f2:b010 with SMTP id e9e14a558f8ab-3c2d1aa2b54mr399267615ab.5.1735928403708;
        Fri, 03 Jan 2025 10:20:03 -0800 (PST)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com. [209.85.166.173])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e68bf7eaf0sm7745490173.68.2025.01.03.10.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 10:20:03 -0800 (PST)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3a8146a8ddaso46707065ab.1;
        Fri, 03 Jan 2025 10:20:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWWFvKVU8xpyN/LhlIoiYZ8z33diGrdF8z8X2QjrSthqEiEfgT9OWA9vb9Bs+y6aCbxrooRCgvpHlijU/QVZ3kVN8pgKw==@vger.kernel.org, AJvYcCWkRaNnERMZpGUzTimdkX4WIm8xzaPTob0FT5SbOGxsZlLVJwMDnwm7bbTZXkwizUjcfc8D49EOP/eE5E3C@vger.kernel.org, AJvYcCXIzWtzO/ch4tI2W+hv9pdwdf1dxxiFUcgCgPc9JffLHbLSMDAY7V+3Hkdu8RpvHjz1AmSjfAGITp4=@vger.kernel.org
X-Received: by 2002:a05:6e02:1aaa:b0:3a7:e103:3c43 with SMTP id
 e9e14a558f8ab-3c2d514fb31mr437025985ab.19.1735928402870; Fri, 03 Jan 2025
 10:20:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226153031.49457-1-josh@joshuagrisham.com> <mvp4rhnpzjdfyacuzczg2y5vms7hnarxxwbnk3pbtfx3mg3mrm@vzceo5cfjfl6>
In-Reply-To: <mvp4rhnpzjdfyacuzczg2y5vms7hnarxxwbnk3pbtfx3mg3mrm@vzceo5cfjfl6>
From: Joshua Grisham <josh@joshuagrisham.com>
Date: Fri, 3 Jan 2025 19:19:51 +0100
X-Gmail-Original-Message-ID: <CAMF+KebdvjTKYAxWqk0dMaUc=jtqw624GKyc=j4gHJ2PBQK1gA@mail.gmail.com>
Message-ID: <CAMF+KebdvjTKYAxWqk0dMaUc=jtqw624GKyc=j4gHJ2PBQK1gA@mail.gmail.com>
Subject: Re: [PATCH v4] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
To: Kurt Borja <kuurtb@gmail.com>
Cc: Joshua Grisham <josh@joshuagrisham.com>, ilpo.jarvinen@linux.intel.com, 
	hdegoede@redhat.com, W_Armin@gmx.de, platform-driver-x86@vger.kernel.org, 
	corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kurt, thanks for the comments! Will respond inline below...

Den m=C3=A5n 30 dec. 2024 kl 18:50 skrev Kurt Borja <kuurtb@gmail.com>:
>
> > +     if (err)
> > +             goto return_with_dbg;
> > +
> > +     galaxybook->has_kbd_backlight =3D true;
> > +
> > +     return 0;
> > +
> > +return_with_dbg:
> > +     dev_dbg(&galaxybook->platform->dev,
> > +             "failed to initialize kbd_backlight, error %d\n", err);
> > +     return 0;
>
> Return `err` here.
>

I actually intentionally want to return 0 here -- the feature is "not
enabled" but other features of the driver can be (so probe should not
fail and unload the module). Not all devices that have these ACPI IDs
will have keyboard backlight (or various other features that are
supported by this module), but do have other features, so those
features that exist on the specific device should "work" ideally while
others are not made available. This logic matches the behavior from
before but just slightly refactored now to clean it up a bit. Per some
other comments from Armin I will change a bit of this so the debug
messages will be more clear at "point of use" so hopefully it will be
even more clear; does this seem ok or should there also be a comment
or clear text in the debug message that it will continue without
failing the probe?

> > +     int mapped_profiles;
> >  [...]
> > +             /* if current mode value mapped to a supported platform_p=
rofile_option, set it up */
> > +             if (mode_profile !=3D IGNORE_PERFORMANCE_MODE_MAPPING) {
> > +                     mapped_profiles++;
>
> mapped_profiles is uninitialized!!
>

Thank you! A total miss on my part .. and feels like just random
chance that I have not had an issue so far (it seems like it has
always grabbed fresh memory / a value that was already 0) but I will
fix this :)

> > +     err =3D galaxybook_i8042_filter_install(galaxybook);
> > +     if (err)
> > +             return dev_err_probe(&galaxybook->platform->dev, err,
> > +                                  "failed to initialize i8042_filter\n=
");
> > +
> > +     return 0;
> > +}
> > +
> > +static void galaxybook_remove(struct platform_device *pdev)
> > +{
> > +     if (galaxybook_ptr)
> > +             galaxybook_ptr =3D NULL;
>
> Please someone correct me if I'm wrong.
>
> Device resources get released after calling the .remove callback,
> therefore there is a small window in which the i8042 filter is *still*
> installed after this point, which means you could dereference a NULL
> pointer.
>
> I suggest not using devres for the i8042 filter.
>

I believe you are correct, and I checked some of the driver core code
and was able to pinpoint the exact sequence to confirm. This was also
mentioned by Armin in a comment. My intention is that I will actually
fold everything to do with this global pointer into the i8042 init /
remove functions since it is the only thing that uses it, so hopefully
all will work out ok. Also my intention further is if Armin's changes
to add a context pointer to the i8042 filter hook get accepted and
merged then I will move to that and remove this global pointer
entirely :)

Thanks again for looking into this, and please feel free to say if
there is anything else you find or something I responded with here
that does not sound good!

Joshua
