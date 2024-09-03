Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FE928F5
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Sep 2024 11:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725361805; cv=none; b=VWU8YjlNgM4b9gwuVd+qwXrQ3tKrHnP6eakzs0T45TBx3ywhjhYYP4iz0hDk7iZEZ7KWbQXVulgaME98yT/FvbTwPB+aMbeUuX0St/I7YP8WBTjY+hfwS7BQlyFAcK26OgleXQ1Sun2MAixxU+dWUssA+lHPL1GgWw1U9ovOBSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725361805; c=relaxed/simple;
	bh=gGiQ+JKkHkafmS5g37s0mC8EnWmGQdii38r8JCvEh0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QDuIJOIxVuQO1KOkd+xFxDTzBrp/FQ92i5VCh0P53VfYuhan9lieUQi+O5AfXuqv6GFRBj5C1GqjD1evgzEDSC+AyVuPEpgv3gsoNOYTR30X/WEDHA/tGSsSF9N4/YGQmjShT2CqfmeTuksUFZYQzq0BLAKUo2n5/TwoP5aK4mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQM0K3xF; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQM0K3xF"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f3e071eb64so74285361fa.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Sep 2024 04:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725361801; x=1725966601; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ut9iSuDuji8b8jMtwh5yHQmOYqyCRY2o4v39z1nD01M=;
        b=lQM0K3xFXCcwvOjhqbfJqlz9iEupR74S2DLbLQh3PEDN1BvUVCDwa9AQX8h+9SleaJ
         YCqQHjptyjXysCPIPVVpKd01sdgA3BzYqYKBXSfQFK1BkgbDcg32rcsztYWPMTQ0uLU7
         /yKh0klyvkdDYWEiZVnwE8qOoP/CbAHN3UqdUvBEq94x/oMaED/tM+2E5PXIjrOq7R5p
         OsbDtIG0jX80PHUUNRq8X5v6EHnwuQu235B9aQb8cMbJ33QK7eKH0TFbJyeG5GiNEOE0
         O/b0bvDum+yTO4yg2oJrhkGeMx0unbnGvniQvc3sPrSYPuquVhje6hiRxkpqxaRrNt+d
         PEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725361801; x=1725966601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ut9iSuDuji8b8jMtwh5yHQmOYqyCRY2o4v39z1nD01M=;
        b=m0aaFWwgPXYXxOh5l8+AQnt1RHPnm6qos0CtPNQf2UoCrZ3aFu+fJaBz5gmCDJ99hO
         kIRWhzNCnGP+9NGshh54/dVAsuIjshNmKyVVSHP1raQ1C8uEDnt+F5xfosPCsg7d4vWl
         rZEFpeDG7HU5VtfC+zL43qcq9pDW2VYrYEIj/odxQ/Qu5oOG+Eo37upumdF3ZaymUAGG
         Ednthsb7SEyuf0UQitpMegRitkzp0ldn8n5q2f3ftIuW9rJsF5185P1GV/A5mGosjung
         U8M+nPC8C7xNGB8AXSzldqXwQHOCHLunJyLfq4D/e08jnI92aIsFyyL/oNoOhy/kNOKW
         K5wA==
X-Forwarded-Encrypted: i=1; AJvYcCWHtiSANqKS5TWXnUGl8aHGljDYJtmqQYCl+PncEWKJWigzex/gKZ93l2Qqwlprh0vfKsFPcwfl4tNLLnWNNtIjxzOV@vger.kernel.org
X-Gm-Message-State: AOJu0YxP1YQBv8zYU/dEbBPr2g1zt6XmXptsovV/eDaOkKpid6MLzP1Z
	+75pr+17cHtR5sfVJY1yn+xX+8cw0mh7rOCEzhwBLmvvtKihvc0xdbMe8zRacczAjxLg6tiSBFu
	6hnqeVQjVGm0APDaGgOtFYXo/NeU=
X-Google-Smtp-Source: AGHT+IHMN9AeKO11ZTprpIvw7qOsQJH8UfsS/VT2RXK5GfT+rHpcl85rUF+bDk2PfOPdf3TKZ8qAWM8zydv7I04wfKc=
X-Received: by 2002:a05:651c:516:b0:2ef:2905:f36d with SMTP id
 38308e7fff4ca-2f6105d7a1bmr154079781fa.16.1725361801254; Tue, 03 Sep 2024
 04:10:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240903083533.9403-1-hdegoede@redhat.com> <20240903083533.9403-3-hdegoede@redhat.com>
 <38ea9608-782f-ca51-84ec-b66abff38c1e@linux.intel.com>
In-Reply-To: <38ea9608-782f-ca51-84ec-b66abff38c1e@linux.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 3 Sep 2024 14:09:24 +0300
Message-ID: <CAHp75VcVcGgca4UBVxS8GSirWB4b9+8Vr_okKwy-1KScrgh2zA@mail.gmail.com>
Subject: Re: [PATCH 3/3] platform/x86: panasonic-laptop: Add support for
 programmable buttons
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
	James Harmison <jharmison@redhat.com>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 1:35=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
> On Tue, 3 Sep 2024, Hans de Goede wrote:

...

> > -     key =3D result & 0xf;
> > +     key =3D result & 0x7f;

Wondering if moving to GENMASK() (and BIT() respectively in other
line(s)) would help reader as well and in commit message to mention
the bit field size(s).

> I'd mention this in the commit message. It's kind of different from addin=
g
> just keys.


--=20
With Best Regards,
Andy Shevchenko
