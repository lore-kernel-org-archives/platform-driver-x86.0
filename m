Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8261D9A66
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Mar 2026 01:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773797743; cv=pass; b=JBiwfSB8W1B+ZxofqZQ0FhqZH1y0hI4lPXUzDmd2QsUTwJhH78c+6bdpPXIgx2SSEUn0oHe2y4jsXpYP6r1t5EBIfkQooWA8rhKi/saGeAHAdMqlILe6pkp1RkM7I/IfdqGPpl87UXh7iKyux5dE6Y1MlNU0htTKMw4GRg4V5c8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773797743; c=relaxed/simple;
	bh=r9hsKb9PfTufYzjHiq0hMbGcpfgxzO52s1Vpsdo+xGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HWoL2V9xQ+0LEPh3Ka/oVO9A0oly4Xrw5mdL7kV7o5QY+y+vrNpwcsspStIYD95P3oFfyjikCaeWHzsGArFNcZzUiJp+1cC5Fi4DLvNXAp8zZ7Fw26JU1B8VD9Xid8u7nQdXL5EfuwrQAytj/CbhOK1kyisjfOkajN0QLtUG7zc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJb/EnfM; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJb/EnfM"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a1322af04fso318679e87.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Mar 2026 18:35:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773797740; cv=none;
        d=google.com; s=arc-20240605;
        b=ST+lPIGyvaP/UzmRjPscBKY9+jN1SPxURAhqWwtQCavlb9g79Tg/1o9hAZ7BKrYWZQ
         /UwblXDJe6o/Q4v8fit1+v++MTv6dsQG0Z/MJpsUsRcrPX1BIV/eWoWuTDO6qY9cSPgB
         suEnoWnZIpMEIljaPjZTVOFb9k2teoDcBs6X5IGrl0MFJTIz097TudbC2YjRuPIBrzbG
         uSDatIO3TXgc8LeBmtPtRwnPn4zg/IHrI5LXQJDaeMI6J8V+KFvhSKLd9pfevKUxTNFK
         Zss76iWFceopCrXS8X0bJERCPw61Yb6i9+6fzZw66QuxKNRxDD8pNnNTun4o/jnGQm+g
         1pZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bnHRGZux9J8/Uki/jwcTCNraQa2a1iivTN3+HD+7Wu4=;
        fh=urSfBeNdW0IDq/EITFYdgarxD1E1/uEKfKqKs2IKCwk=;
        b=GCk86z3/EEJrG7ZIwj4Pfe71IqvRJN13GZqj1SEkyvNITm82s8vKGlB0Ez6+f/eTVF
         zSPOPrCEpYPGdsCCS66T1U+Wd+ePwz5CmksR1QxdxMg8OS1DsjLTpObGabdoXyXMs0NU
         reAJxXGaqqYlT4qIKUbwrsyfp7mzHb9YnQw49CrRPWWNTrrmGop6IBPn8tuIAfU1XwTf
         kFCVyoXN9K2UuVUsXkkp42ek5711JY7hMYv04ga2qXXmOb7l697r48AiCGaHLEzarywA
         9LuWwBc7p1UfWTFagZ20L4uf6FyeW90BYDF+MkX0UBKF6+PJ6OFsHA2Il8klVF9UCQkS
         U3cw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773797740; x=1774402540; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnHRGZux9J8/Uki/jwcTCNraQa2a1iivTN3+HD+7Wu4=;
        b=MJb/EnfMuI8mxqMYieH9cSSAYbkj1/9JrXHzCirnzWKMiNdOd+NHuD6KqvuFBjtNmY
         vqLqqIH6NS00QytxnujFiXf/tgxFtvPQvCHvLsIXJnJN569g0cM6ZnJPn4VdmJBDpZQE
         hLKiA2CLtIrPhWEK/u8MPCwIGW5Oh9Q5dUAMD5E1wjg4aDxUdQPukqf/jrJmVFXc+dwS
         hTqYsUkZLFWaJlZrSYmH4/vQ6n3S/rPodYMMR3dc3cPLb8ldk1Tnfq+K7BHjeaSpeVYY
         bYo8ebgNfQxjDrV1wN1PvvfNWnQ3DWfz+0reXYT82J8bDzZoZFxw1YrhNX+8USWsuxFE
         O5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773797740; x=1774402540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bnHRGZux9J8/Uki/jwcTCNraQa2a1iivTN3+HD+7Wu4=;
        b=enBcJI2XtC3UuuAUhwCyfwsDQpQgWlw1KmPwngmjfGNawhE2pMbWFtSeGkJ8xxlS5V
         8eMo3r0POqrN+37zveHt+KQs5xdD9Ch4Ic8MyPkk3e4b4R1+OezWHht3EBNUvLgomeSH
         ua4tmKo1CaMhqSnQZE8ICODIUo0C7sTgcqS6g+ndKTNNwSlsoQIOWJlNQ9OitlJAePy9
         8p2gNcznLblrUu6tFazxOVr2u4LSnPy79IyhotWPgJMOVKqCRMxOKU2ukPXqBpAMDj/C
         B2ZJINP6GS6XpXTBxS/aUozKZZ/e+N54cVxSfmx6gAtifnZ3Lox8vwHfgg3JuOvihoT5
         XlbA==
X-Forwarded-Encrypted: i=1; AJvYcCXNvbvjkXpMNVeIBzO/4f7Oc68oX2tF1uAXmYJaGPTx5na4OKdRqBZ0DvZGR5cSi2uHSrzzaYHIPepGbqEtgyGpcI0O@vger.kernel.org
X-Gm-Message-State: AOJu0YwTBOG7UtG73VCPJnlmt/dyWw/+RKTqWKWhDhZzuGboOvXS0pOu
	V3CMaE04yfpw/7/nvVGBvc5g4AypufMx7M8aaV44hVHCU//aEAwWqAJXH2ZlCt+Dijdy6AMxyz3
	P7y2gHlRp9p1LyP5K1Egswnvn6UVD7NM=
X-Gm-Gg: ATEYQzwkBiBvERlU1ydUp+WR9J8teQgepesDdRJ3PugStJTyVzJlG+JDO/qk1ABXU11
	z4A5HRGCFiwo56ooABQI1r1mhBotTdNv4PnGct+Afa3rcoTEJADGy4qaVkCgPZUuITawcQh+YXh
	CVwirnicy568fr8jWGxjcAU2MuYm8R9THX6CxJZXrRA3yMfhiINKit1KT6MHj8cPOB0zM8SBIiF
	IyVRWgaLjFrS9b0G9S6bfdvjZWMkSdtN/seHzk0ggFgFI3WmQwX7mpWxpdq9/cZsxevB0fe74/6
	vqXFjj0=
X-Received: by 2002:a05:6512:3258:b0:5a1:1914:2bac with SMTP id
 2adb3069b0e04-5a2796b0670mr475858e87.25.1773797740151; Tue, 17 Mar 2026
 18:35:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311143144.482145-1-vishnuocv@gmail.com> <177376698425.15640.5695107795590543274.b4-ty@linux.intel.com>
In-Reply-To: <177376698425.15640.5695107795590543274.b4-ty@linux.intel.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Wed, 18 Mar 2026 10:35:03 +0900
X-Gm-Features: AaiRm53Lg5Zo2AJUp6xaTGJ_mBVnBHtnars3jJTNT9JwA8Rtk6OghHrOaVZ_8Bo
Message-ID: <CABxCQKtNSjdj0pj_-Bt7Jrs9pEp-SbOyjGUno8xc8FpfojGpkQ@mail.gmail.com>
Subject: Re: [PATCH v8 0/3] TrackPoint doubletap enablement and user control
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: mpearson-lenovo@squebb.ca, dmitry.torokhov@gmail.com, hmh@hmh.eng.br, 
	hansg@kernel.org, corbet@lwn.net, derekjohn.clark@gmail.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ibm-acpi-devel@lists.sourceforge.net, linux-doc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

Thank you for accepting this.

On Wed, Mar 18, 2026 at 2:03=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Wed, 11 Mar 2026 23:31:41 +0900, Vishnu Sankar wrote:
>
> > This patch series adds support for TrackPoint doubletap with a clear an=
d
> > simple separation of responsibilities between drivers:
> >
> > 1. Firmware enablement (trackpoint.c):
> >    Automatically enables doubletap on capable hardware during device
> >    detection.
> >
> > [...]
>
>
> Thank you for your contribution, it has been applied to my local
> review-ilpo-next branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> local branch there, which might take a while.
Acked.
>
> The list of commits applied:
> [1/3] input: trackpoint - Enable doubletap by default on capable devices
>       commit: 9a98ebe630cf13c1a6063afa676d1cecc44fb2c9
> [2/3] platform/x86: thinkpad_acpi: Add sysfs control for TrackPoint doubl=
e-tap
>       commit: 6227cc32fa01ffbf5bef8dcc6759743a28a2ad57
> [3/3] Documentation: thinkpad-acpi - Document doubletap_enable attribute
>       commit: fa5062e99b984448b7c8ca9aea47e7fc033b6e2f
>
> --
>  i.
>


--=20

Regards,

      Vishnu Sankar
