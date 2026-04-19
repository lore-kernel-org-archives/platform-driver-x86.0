Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BE5175A6D
	for <platform-driver-x86@vger.kernel.org>; Sun, 19 Apr 2026 10:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776594970; cv=pass; b=nlJhnWnZgT2USVWePWFrhIEJxcLCcKXLwDP3iRWabk3b+ddMXaSRSNTqRjW9vRjb/uf+V5HnCWGgLGs1PbTyZ8Hj74mHnpeAPyVi8iE7Xzp/gs2kG0A1GggyYSi1nvVbm2KvNzC9UVckR8rRsldHLryciVSb+g8aw+IJQbUqzVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776594970; c=relaxed/simple;
	bh=XdE6Eq/koFKWakMrfTypz95nQBfaZLy3vdLDUwdtL9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CupS5nRF8xwhuJnJV0MOX178pUjE5fRByru9K5UaLJGfZxopwAfZxx+mMihmtJms43e0i3bavQ9gPQugZYQPDK7yqZqZ4lavDta77lCBSgUSQPglUZnsYzZ6Sd1Mvq+7ILiKqq1g8TjKUwW3SM7YNRKV+6EmcpVhEuDg5QRFhQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=fgIS4mZt; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="fgIS4mZt"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64d5a7926cfso2024698d50.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Apr 2026 03:36:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776594969; cv=none;
        d=google.com; s=arc-20240605;
        b=GJJShIehbbmjZ1wcMqCOYCcirLYtI2wpoiNAV9qmZE6FhIYRAo4pZP16XGn+p8U3NA
         E1KIKm9jQmgyumUUxFUvMR3QQOzozidEKc50hx2AqLgxr3oWOXRpdcslI7tfuci4ckfR
         n5HVEH07UxceYHeq7PHRsiJCG44B/KBWU88A2ULlH8v7W5aObKTnv5PYNdk+1BrkLbQI
         VLRRMe/JFczGMNmj+lDn9zfQEGQc5Z3hc4mQqYx4wiI39gR9yVtgJmbe9M+BcjSlK5kj
         fNipSysBb7G5Imeq+wC4r4DSY0fSkWhrtqS9Fh+h0cPYADPN7aBVvL1gm8gLM+cXjgO4
         z07A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uDecoIfKTbR+dHQNvuYjtHUUP8GokjVSx8iDKeD0F9s=;
        fh=YmD6mQu7bqY1UxmZ2xWsAe5xcatXOr1sjYfsVPyuswk=;
        b=SzJ8V6VLPH2mTFiiBghtZSzFAXuhbsR2RqDSIsLdhstamMIJlSsUTYizXqYNTWffri
         c9RzJ5y/tf6XCFinjVNsJS37p82UvsbgJ55sEMPBD9hu3iUjAVknE8SqR/XH9PO+DtZH
         7vefIXf5C0cOWsmY8ASZ7xfoM0BRkEJiGRXBIqGmajGLNQDU+MFU6NS891Hh5X+5oT3L
         YjJdXIFm6tb/ofA2OZCilf21ZkZQqIx6g3yn1oPDlGslwr3K4BH+3LkeBVJOVQhjYto+
         jwttd9/lj6fx2QT9h47NXA2qD+RJHIwNlMFV+QB+FBg6vM353wdxsqglx3lrsvicMAXS
         lT8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1776594969; x=1777199769; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDecoIfKTbR+dHQNvuYjtHUUP8GokjVSx8iDKeD0F9s=;
        b=fgIS4mZtdoRCfw50pYpRqOzuyfLau2HijKLZuwGTXUmdE+uA+Zwsh+hgdLxLJn8Mqa
         KkGi/VgurhIQmz+KsLryr/kxvvKU1WLR53cD3//Hp/sEAYEDE5CzgO0yl7TtQWCGKLre
         HdXWzrI4HnCYdgVovgr3rq2BvsI5HsS26sqHymMZUYHepCqmUw6w3aZ5wg7hFOMpQ8dm
         RcTkFxeOYgKa3ECH//+ivgcppAyv/ps08uHrFKfnxmCcDn4k/XTj1UhmO7mIjULNL/YI
         +1K7Meb0SmMvCrHFxen5Wf2Rno0iQmCeaL/rasw8whQQAJP1KEcqVCrr3TPJSGHifcAR
         09CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776594969; x=1777199769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uDecoIfKTbR+dHQNvuYjtHUUP8GokjVSx8iDKeD0F9s=;
        b=EEZJki0l1zCVBZNM5eylPuENEi4GdguIVfpQmgJZk0bzYHxd85503M4TbwBk7798XN
         G+45F+U6VYX5B0uMN5J6Tq+5HVBJ6Jg0uBjFnHPi4Ou/Lq4tPqr2Rf25Lbe421zfk94l
         Cb4hApMOMG0Hd7T5WrWIxirqg47YwZiyeccWdqB+5Vz7uE34PfhD04nX/t90zY80oYN2
         G36lzIic/PF7DuFleInXTHqYoV/Ae6rAg02ZUZzkzrshTwHfugObgtnN1rY/U3RnkkEF
         Lo+M8Xaf9Cnb6ML+nnEkA2Z8yEp1nteDA0w20fWDCDsOtgJ8KFYsP7wZmimRQmpAcMqN
         Lw5g==
X-Forwarded-Encrypted: i=1; AFNElJ+QrqkHGUiRGnqsGYMDqTMVMRvN/84z82usJYlaT0FWoMQsOnRnrL2o0mh9/5xxgYyKaB4DkAZcgU2obNAD+m85dYRy@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvl+Y7ud4J55kcYpsSJUk4JS2sNllSeS46k1wPiiSPzShC7eue
	HKFV5pDVecA7hyyJ2THreVEtcveMxt8Y+KKFfc+Jfl6nSjbcLnkVbJXBMU0gOAaEj70Nz6dwRQM
	ifykcOMH3o52VfAko8VF6gRnHFGO1uL1RXBCDKwVQ
X-Gm-Gg: AeBDietlruadR6UB0FBXbBAdRWPnTt0l2wTfC9K6OtcZXAucFxCWHTfqqQZ3wjsUfka
	W69VdkK8IYXo3krYpIVIxdvrBdJBwSaW3/tjDPojf3lE1nwAwblzmW05Pc1BGE150tN4nigD9zp
	P6ktTyEfm9ZzlEuJv8/ANb+niirACZlchP6xqXhjj2/Fdai61HcgiG4Pecvo3OZv4YvGec+V3Ut
	JsoABSjm7bemortTIedRAGWM1yehRS2Te5PrIFwJFOJJq2CSB5iLGGRgAzlced/wpxZu0oKhUwL
	L1++1mBFLT44WnhPlTduTxPXHFrbmiMlpS/AVwNZHGrRCO/y+Q==
X-Received: by 2002:a05:690e:43d0:b0:64a:d04e:a340 with SMTP id
 956f58d0204a3-653107be0d5mr6721585d50.11.1776594968771; Sun, 19 Apr 2026
 03:36:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260314142236.74514-1-pithenrich2d@gmail.com>
 <0b0f6ef9-ae3a-4642-85af-fbdf7ebafd1e@app.fastmail.com> <CAMBPg2fCtHoA6cX3kCGN7BUARsC5UrB1he6+eC06vfrLXTtktw@mail.gmail.com>
 <6922cac9-de03-4aad-a710-473cb314077a@app.fastmail.com>
In-Reply-To: <6922cac9-de03-4aad-a710-473cb314077a@app.fastmail.com>
From: Pit Henrich <pithenrich2d@googlemail.com>
Date: Sun, 19 Apr 2026 12:35:57 +0200
X-Gm-Features: AQROBzDXFau3D2e3T0O018Y860D_gFXPSSEXTh0MFbqEHG4VwNq75a7DtsFpw_I
Message-ID: <CAMBPg2e_7KpzDFWEnX=tRAO-qDAPo6X3ec+B_hkJP5GssKsKJg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad-acpi: Add X1 Fold keyboard
 attachment detection
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, "Derek J . Clark" <derekjohn.clark@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	ibm-acpi-devel@lists.sourceforge.net, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Fri, 27 Mar 2026 at 18:32, Mark Pearson <mpearson-lenovo@squebb.ca> wrot=
e:
> I got some internal details on the implementation and whilst there isn't =
a spec I can share, we did determine that Windows driver is using some ACPI=
 methods instead: GDST (get device state), GDSZ (get device display occlusi=
on) and NSMC (Notify BIOS of screen mode change).
>
> I don't have any details on how those ACPI methods break down I'm afraid =
- but just wanted you to be aware that  Windows is doing things differently=
.

Sorry for the late reply, I have been busy.
Thanks for this information! I managed to get things working using the
ACPI methods and I have submitted a v2 patch.
I found GDST to provide the keyboard state, but I am somewhat confused
what the other ACPI methods are for.
I didn't find that setting NSMC does anything obvious? Or I am using
it wrongly.. and GDSZ feels a bit redundant?

Greetings
Pit
