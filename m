Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1627A1465A2
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Apr 2024 11:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713785752; cv=none; b=ByV6y+ccwvIMCoFN3QSIil5peQB6jgWXKs6xa8QWP5bvwPz5S1iFZfUXSS1VKe/Hdlg88blGLCs74fiv4lH+uK8/eM/4/eswIhHDvb4m2C4G7YJU4gZorb5IxrLzwkcDOEIX/pJrzU9aVLyzDg0NVlt4Wk8F6rA3vRXKOuTSkW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713785752; c=relaxed/simple;
	bh=GZgxhB4soXpkcQLkDP9YlJqehsROYIvCF2lEckKBQmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ijTw9Xl/a0sQ+SVEgUboxETa7R1tTEcyZ7oWuF77xTrQaqr5+feyOnL6wHnVACBNt2HSolsZ/oo3xaxtj7PcSbpse3Q8UXV9609vEn4omycj/NfvYjsve4pG48k8gVyqImdxThw5KsqfjWJ0c74WQgTjL4hW0UG9qlYbBPkqzTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2GylrKh; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2GylrKh"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-56e6a1edecfso6532210a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Apr 2024 04:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713785749; x=1714390549; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzj5YK1Bd80oPjOtv0BzKMOOVvRtSlpXAgwXFAF8hIg=;
        b=U2GylrKhr59QVrlI8VgyhrC/4pQ1HujDqaPvFoXBqgJsdBip4XMoWodga39Y76RG4c
         Ae7Yk+FIyjLYkKdVZ3Zjdwkcmqrye7dMFUuYxqKUHsMQG2ZIAOgGxe2Hb1S19A4uwMI9
         b7oxRn7BhpDeylrkP0FCK9cPj2Gmwg8LJQWsAoEzKENjNhTQycoWU0hF07p3c4vXH7cA
         N+f8GSI7x7lXXeoJ25E7AM/xlTe/3I/c5lSuWNXUZ4fWvFMfhbFv6oku8mKRCtGBDPtW
         yx13kDIArohqQJQdZ9103y3N20PJXr3vIm+ugaMhSDbm9IIydJ1L4qUfB/4ppj03qP9Z
         OIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713785749; x=1714390549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pzj5YK1Bd80oPjOtv0BzKMOOVvRtSlpXAgwXFAF8hIg=;
        b=UoI2XYMTmYrwdQF3jzE2n5tq8E5/OuAo7M4iRpy5qkH5zLS60Bt8CSjuq8n/VWI0/q
         nISHshhCRc52Eo8SJ0idbb9pris9ndV7oWKAsW2I5l0IFI9aeG77hPOFGFHjS9XYHtBC
         Qxk/nr+bOq6kLOP8OjkBNiRbybd832aPHxl/QhH0/FJj61hghFhTEJuKTmzfEpJ0AfMw
         tjtj+TZzAvBc4qAFNU148cfj7w22Kysjtf7Rp1LyRU8rj80QEU6xGGYf4mBu/4yth2Py
         PvTHhR8S8rswZqDg7CRnOmiD4IUwowZskgQ1wkMrqYBxwj1mLrV1zQh/QdrH5m6ioEUR
         o0cg==
X-Forwarded-Encrypted: i=1; AJvYcCVMuGUUCtVa1Y5cHUoRMdR42RZ5TwrpfOL/JpTnnL2zg8zA3MmEJtIHNC9XneEHwCEyFRvhUFCdEcGvA2k1OH8btc6EqlkNlyHFOtR9OU6kVmz7uQ==
X-Gm-Message-State: AOJu0YzOvViM1OtY6A0ZRoGWXgZAvYuFhpXtyI280WUQnQXJkHoczCCp
	OdLw/O58QrM2HS78RaJ4Yz/LbX92Y9DSJmgkCNjbD0LkFWWxdQSwzBt+4MlILqPMrUgmng2rm/g
	/dhuxA2EClPoyyQbq7a8zFMqVLnK7+Stz
X-Google-Smtp-Source: AGHT+IGnCelmQzhv9aeURXGp8t89ibUvXDMrPd1ZcoiHxDqfvIn2WOKz1vpyYK01ZmGYWtQ271e52H7pJshnBx7eTmQ=
X-Received: by 2002:a17:907:7b86:b0:a52:5b71:d91f with SMTP id
 ne6-20020a1709077b8600b00a525b71d91fmr8102241ejc.19.1713785749097; Mon, 22
 Apr 2024 04:35:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240421154520.37089-1-hdegoede@redhat.com> <20240421154520.37089-9-hdegoede@redhat.com>
 <a591120c-72c6-7b6c-92ba-c65c36a8d70f@linux.intel.com>
In-Reply-To: <a591120c-72c6-7b6c-92ba-c65c36a8d70f@linux.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 22 Apr 2024 14:35:13 +0300
Message-ID: <CAHp75VfM8WgZt_cDp3htfJSusvMRyoDb6LoFewb+bc4AD0T-gQ@mail.gmail.com>
Subject: Re: [PATCH 08/24] platform/x86: thinkpad_acpi: Move adaptive kbd
 event handling to tpacpi_driver_event()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
	Vishnu Sankar <vishnuocv@gmail.com>, Nitin Joshi <njoshi1@lenovo.com>, 
	ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2024 at 11:29=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
> On Sun, 21 Apr 2024, Hans de Goede wrote:

...

> > +     int mode =3D adaptive_keyboard_get_mode();
> > +
> > +     if (mode < 0)
>
> Please try to keep call and it's error handling together, it costs one
> line but takes less effort to understand:
>
>         int mode;
>
>         mode =3D adaptive_keyboard_get_mode();
>         if (mode < 0)
>
> > +             return;

And not only that. In long-term maintenance the original code is prone
to subtle errors in case some other code is squeezed in between.

--=20
With Best Regards,
Andy Shevchenko
