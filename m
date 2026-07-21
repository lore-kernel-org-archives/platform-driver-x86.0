Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6918E366075
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jul 2026 04:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784607391; cv=pass; b=hdLhALxcFx5DJDIykPqdA3YajRnPNthd4dm0IOo9n0rANYHUOJsUyrT9HUEIWHntO82HXdpYrMcRyqoEc8VqyXhn53AQpkzdmsOG7r1P2vEUoZdyRj/85JZZCjJg/DvnTgeOYD8lWpzJ8JRQHM1BN5F09kUunMwiwAouKAOWqRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784607391; c=relaxed/simple;
	bh=j75ov8FablcKZ/Lns6RuqNxjEq0qrKGRJPQHwnoRO5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YCpZvhtsFi+Ms4SBaw+WeOiB8mRIFWR5dOCiYCoOoXDa/oH3h0n5C16DAk6pa605ucE1B5A3RAKQI9D5awb4Okk9+8tR5QHWIoyDrRmjw2Q60HQ/51TT4xKZNNci/9u1H6BijqriZFKtzq4aB1ajFX9HMZVEbsaqFkVtRVGvkPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJZahAxS; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJZahAxS"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aeb98460c6so8744420e87.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jul 2026 21:16:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784607380; cv=none;
        d=google.com; s=arc-20260327;
        b=qzRYDiUIdByXg7cX3jNEB/NuzmdYXcDvAShLWfBy3NtyAPnzggVFR31PwBdX0yNUXp
         3KGNtdf9VmAMtutrsWutm6v+M2UOWxyX4Ex9t8v+ejMVAiDlZzhGSsWjnobyTnC2MApl
         fbMotXqRcwo9pDxGhR6sVvPKOH5fAHpCX0FqlFFyaaPB5oeGyv0A/zZJ+XepvX49s82t
         WKgvJvMvWil//4ewmYlIv9EAlb1R2csjdGdM3UyP8w86KSkZpquWupy0VtPo3etAsALn
         kmStwj7v6+9q7PTDn2Y5lXkx787/paAhdJLaJ1CE54K8mYFxI9G2dTImU9/2Jkgyedp6
         ykuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fgz5nyP5euNay+X/9QjjW7EW5yXJ17PBq+pdkqOJDcs=;
        fh=aRpzWhzKGmC4sfDg7Ox8fJzDJels0ikJ1APcl7KGhhE=;
        b=QsLHP18APN0aECljxnlTRttsXvh4TUW9dLMlwnZD0U5x5d2Llgoq27UCAN+1SBL6IU
         4oWZ9pyZvCasB/2xRIjJvVeGLs8Kp3W6lIH14SJ8wbYPCdjQgYSTzLztwKaBZwAjjSev
         zOHLZRCN4khA8LCuDQaKcnVuQ2XAuaJttHQmSTtXpHMK0VnhFmSjejUZrOra3wbyEGLJ
         9Oqq383kDjexO2V1AeeranjBGU1F3TxSzpvH1kHSzeEY2GaJCzptFnTtQsFK6zLKIcZ0
         j7uIKWzjdiaGnBFv3tSoJqjVvzvAxqJAGk6l6o/yZYv06dJUwlYOGFd/3bRKnxKC+17r
         pcPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784607380; x=1785212180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fgz5nyP5euNay+X/9QjjW7EW5yXJ17PBq+pdkqOJDcs=;
        b=YJZahAxSkVn1o+noR+4Bz6roV7bNbxvRH/0GLqxUXL2JZg8jbEBmjGvEeLI/o0SJOx
         cly2WrvEzDCsqFenCoy8wkydWx+KcD+KFmkk8pn5SIXBWXGRz7AKFjuIAP3vW9LsSHtk
         JBbsjURRP1+kETLL/rHGN3TRTL+Bak47cuL9bHnaysEUBHn5JS5PaMW0nGG5AVpyHz1b
         l6+1F9ELol1rjUWqOTlo91skk2H9w38MQS3uV0hoBXvOzFhW2XRnx7pzDMp3dX9l+4D2
         uTiugKy1QL1GXHXX+CJ0OHROi/xU7E3HDbd04y4AavqJaMNBsO60xhAhLGImsUeIJUeV
         Ep/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784607380; x=1785212180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fgz5nyP5euNay+X/9QjjW7EW5yXJ17PBq+pdkqOJDcs=;
        b=TI8Okv8M26MPffcYinV32DON3FWIfYzM4h0tQIRVL0LeG+PEJayUrAAIcnK4mbX9oH
         psAdl6wacXXyTz9l4ucWKadalNzi8O3h52NL7wxEPDLeQjuKvp/E6DFWRIskjI7moYUZ
         JqNqmpK5xZJvR3L35bLcMc9b5OuVsbqw4Qxij8gIFIz35VzZ+tP0TaSNgxABZXWQDTyo
         Z3cy4A6FaSlc2DtbivgEHHFG4krCajTH6dXd2q42RPt+QdJKhJrZ0CRuWdo4JUK0Fj5K
         1RT3j+vRGEGDlTqGJIqUU2aYuDDsM5tS23sFm5fGKv6waTYnArXgrwvE/Jx+HIGhvyjx
         jeDw==
X-Forwarded-Encrypted: i=1; AHgh+Ro4Ib56I09RBliz03YlCkPLH0BJTchY/3690JfG/LvpX3nLYR69Jox7vwDBSvnbzla2Zr2yOsfnp9JvmoS2h4o1guss@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx+Wx8O773vqe5+PoTYlPIDZBja52TedSyXWQmzemN5xQ9TqB1
	ARz0bFLBAuXfCDYUqtNxt0afPVynHi9ZL2Vgn0kNI7Bdazmt5h28cVEPp1V0BTs+0J/To5SLoLr
	IFWysQqZ91jp1cqz7SIHRIxf3p+bqyco=
X-Gm-Gg: AR+sD12W04HTwMWBeiUzwg8TwgbDK+izFQqQrfmpabM/4eLVfislcgUs2nq3rXrs5A5
	KwmXnK4PoPcvcGYRsSXgWRd1lnCNJoIkvaEVyfqzgnEDFofrh53sI6xk4Okn3oL3391Yka0Mrh1
	QJFD/ZS8iVPOayo/3h/DpRKqCBeTzUAKqZ0E0KTd11nhSdVxZGw4Y2whUpISz3E3kdXZxjLa3/a
	wfyGn/1e3K1S5t/p+H3GQYs4kQ4wkguFb5L9i0BbWIay61/HlHPDr9bDQ==
X-Received: by 2002:a05:6512:2388:b0:5b2:9599:b5c7 with SMTP id
 2adb3069b0e04-5b29599b7e9mr2457086e87.41.1784607379665; Mon, 20 Jul 2026
 21:16:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715010205.514132-1-vishnuocv@gmail.com> <178456545819.1362.9472740011574577381.b4-ty@b4>
In-Reply-To: <178456545819.1362.9472740011574577381.b4-ty@b4>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Tue, 21 Jul 2026 13:15:42 +0900
X-Gm-Features: AUfX_mzL7VZoNxPc38XciwYIMVYpJM0rTJkbk5DUX1wYGjWdBz1QhC-p6fEbu5s
Message-ID: <CABxCQKtRAoL9wjD8VYeKr5fC3h7n3rr833YbcitY2G5x7eq93g@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: Fix USB-C Security probe
 failure on unsupported platforms
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: hansg@kernel.org, oliver@liuxiaozhen.dev, 
	platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org, 
	ibm-acpi-devel@lists.sourceforge.net, mpearson-lenovo@squebb.ca, 
	vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

Thank you so much.

On Tue, Jul 21, 2026 at 1:37=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Wed, 15 Jul 2026 10:02:05 +0900, Vishnu Sankar wrote:
>
> > On systems where the USCS ACPI method is absent, acpi_evalf() returns
> > AE_NOT_FOUND which maps to -EIO. This caused tpacpi_usbc_security_init(=
)
> > to propagate the error and thinkpad_acpi failed to probe entirely on
> > unsupported platforms.
> >
> > Fix this by checking for USCS method presence with acpi_has_method() be=
fore
> > attempting to call it, returning -ENODEV immediately if absent.
> > This follows the same pattern used by other subdrivers in thinkpad_acpi=
.c.
> >
> > [...]
>
> Thank you for your contribution, it has been applied to my local
> review-ilpo-next branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> local branch there, which might take a while.
>
> FYI [if applicable to your patch], as per Linus' policy change, also
> fixes are mostly routed through for-next unless the fix is for a
> commit introduced in the most recent cycle or is clearly a regression
> fix.
>
> The list of commits applied:
> [1/1] platform/x86: thinkpad_acpi: Fix USB-C Security probe failure on un=
supported platforms
>       commit: 10bae492e814eeb1013ab9bc08f655d14fca46e4
>
> --
>  i.
>


--=20

Regards,

      Vishnu Sankar
