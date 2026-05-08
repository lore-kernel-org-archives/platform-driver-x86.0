Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4B93FB7F1
	for <platform-driver-x86@vger.kernel.org>; Fri,  8 May 2026 18:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778265903; cv=pass; b=t5JFFOs9wa/zBkK+JqMqbIllDSf8iccyT7RcQqHPXEI7dlZUDBBPa+mhgBDTWJSxOToFLUobv3UAF65zU+vi2yonzc68fYgzrhuJAfjsQySZDBLbtf8+Lxlcf3eyTgEFIdFK1N2BN95xtyf0gFX8foDkh3mdG9PWarUo6sDVDlI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778265903; c=relaxed/simple;
	bh=on/Mbi6VBkhECXMm4XW2iA3c1BktrHIO8mUjvlnoNJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=EP1161uXPqERYXHSFtcyTIYYjVLs0Q9YfRaDszhhdrMKed0QeJv3NS48XWfWefNym/Fnqo4qhpOkpPnNZqb593tf+HcBjlIig79nFXG67RXZbPrVHE8y8PqKEsebOYRSb7x4kPz4UHCV1q3HESSIeLirNyZR7GT5aGoi4owH+/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sa82iAuJ; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sa82iAuJ"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-393933b8c6dso3210151fa.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 08 May 2026 11:45:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778265900; cv=none;
        d=google.com; s=arc-20240605;
        b=JSxTcbQFlFS7AqAc+rtwjA16e63Hzg3J2qFizNcguNm+EGQ2Mp6kxSkvJh6DVXSSMy
         AY2O0veqsqLl3CPHameTRogLTLeeFWL4Z3p/U9X79f5z3ke0kNm0Dq2sCuInjC0e/Bhx
         /Nq0lK59c3HXyd/SYNc4KObCHcQUp1lRj92di3qFToGUzCNJ5ucvlPrIR6SX08PFWyjy
         HhZd9Qhx9+McOOSrT8DY9FI8E58flwJM8yJww6QfXxBJ1TaY98OflgDAWYVAwNV2eMf3
         fkdzaAROxaeaJbli7MRrFd5eWMNwti73uCOkDo2bKMfbGHwEsdbLe0eZDsgCHOmTxm3z
         20rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=on/Mbi6VBkhECXMm4XW2iA3c1BktrHIO8mUjvlnoNJo=;
        fh=LAtpHtVR30q6rinFeyskR7Ff9QyURHB8q3bpp5R7hcA=;
        b=T4R+2J1inycAML0BoDT6ZEIfeip83Ff4XwTVALnygZE5zwm4600aUtfM4o6VgGcnn6
         XbwpCP49p7TKaM9SxbpxePRxntyWfEGcTbsfSeGqMaeKHRn3uQvaoo5xoxGLyvqwiGeU
         By+2frSIq8d1h3IFXmx2Zt/mgNeYLAUKmpMeF6S/mOAq4USa7y0ljT14SlvhF5KtJ/Uo
         9Q3eiL3sX6I1e0QI+ImuHVV1Bpnh0SdjqQ+ciJyOdmuPQS89QULwft4/ToQgyKOyBE6f
         xPHMVrubIHunBw/gZ+u3zsngIDKiKoqiwwn1CYzeURv1gFDOTejrD5FWBnq8nfZDGGqE
         8ArA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778265900; x=1778870700; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=on/Mbi6VBkhECXMm4XW2iA3c1BktrHIO8mUjvlnoNJo=;
        b=Sa82iAuJHnAtvxoU4VuAw99j+mPvEomOlIXonY1RM0gxKfuNAqQrMtNi1aDvUJfLRW
         1qwnMnyMt7fqx/KbCbnzkMYZmSUlQSx4OEHDSKjWUfLoNOMjGI4L6qiuqiPJUS2HGi36
         Fc1Imwihg4g69MsRCQIX61KWVbrn2c8sbiML6E7KyUPuktSOucdFJz1y6PMYGTPTKWu4
         ECfZjIw22TLBlb8KPaDb6d7cr5kOaqQL9njFFWaJM77jExFUMfHl74uPifV8en0u/F6i
         vjSAuT63tZS8AItjCiSC/I0VBguQnwPbm9wyt3vo20W08vdkRN1/TwdrSXkSSBghVWSf
         fAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778265900; x=1778870700;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=on/Mbi6VBkhECXMm4XW2iA3c1BktrHIO8mUjvlnoNJo=;
        b=Qh2VeYMnH9+j6ND3lMSMdjXqmfZTB/Il1n9/JE6Po3RH07OFCB8ArzRri8NrA33aT4
         yOu1Ns8Y06PYKKNQBXU5gFQmmjmG8huIQ9OtpHRvMQhX0QK73itzyhJ1HqvRCZ9Ih+A2
         1g0s8RJs8EfPXv52Si6nA42gXQgAz9TamNa69By/PWGkVlnkZnfVOg6YWi++O8grTsZh
         0sVYnpC6ju948+JRad4D5DyxGcyJxcUpZ2O5rl59XffaKrzu/3dCNrsF5rOaiitFraXJ
         RL3zaWBO2Y354gHEONbP9L6cKZa05a6YwqoBt4KpqMDrlFXhjr+OJWDu221HH4qzU0ks
         ouEg==
X-Gm-Message-State: AOJu0YxWuXmRvvagGKMMZY9RVkezSmjnZq4eHVIpATrzAf2+mGo4gBdI
	duzcr9YgT8cWyMhxCsADn2v6mBKdhTmKW+qS6LPc0nhWKFK1/AHpjOGielaycq0HeVaIAQ86kvI
	uG3UGCk3bRa7wzuJTptD5p7kB6fqlUkAXGYXiScQ=
X-Gm-Gg: Acq92OH/jLZOwB45IvhLSePnoc5yZJcMUs9iNueDQZAe+q6NamCuLsZy47N8/ojkNgW
	wwvlaTKES7TNjIq7w/teSbpRbKiqGQs3s+oWNxH9Uz7E08LqqQSV4P1neacXA465GzdH5munFm2
	9NAkvX7wS0qBGjZ6jUnGTgZAw3auXAsPkHFp35DaApdQ3cv7FGce7uNlNG+D9D86/GwGxNQSGTD
	OV/VcpPBduxFACvDBQXNj156+YHBtCwG3oDRs4MZDaMMBfTqkjVsKT66P+An985YlPjqP3RHSeB
	ybBfYIMIwFznigCIGfaKH+S5qeSQQcMvHhlp8rSSmutXducVFrFF+MG+VyQKhNcbiHJngTbzxg=
	=
X-Received: by 2002:a05:6512:3e0a:b0:5a4:a67:fb6c with SMTP id
 2adb3069b0e04-5a88853f56cmr2379515e87.5.1778265899519; Fri, 08 May 2026
 11:44:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEosg6nUPu526uA1OWo8UnTAiieMpwi2gPojd-LJUJnXrArmDg@mail.gmail.com>
In-Reply-To: <CAEosg6nUPu526uA1OWo8UnTAiieMpwi2gPojd-LJUJnXrArmDg@mail.gmail.com>
From: =?UTF-8?Q?Jes=C3=BAs_Alejandro_Cort=C3=A9s_Pandele?= <jcor.alejandro@gmail.com>
Date: Fri, 8 May 2026 19:44:47 +0100
X-Gm-Features: AVHnY4IJX06brNbVER9bVUb9nHA2yOAR2h5pEg5mCdAwYNAy-XfS-E4pw_--z44
Message-ID: <CAEosg6nGxHk7KzPpbpLiyOEtUBhDuGGuTr7ovHEn5hJ0r+-v=Q@mail.gmail.com>
Subject: Re: [BUG] Lenovo Legion Gen 10 (83NN) - GPU power limit hard-locked
 at 35W (RTX 5070 Mobile)
To: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 7, 2026 at 11:11=E2=80=AFPM Jes=C3=BAs Alejandro Cort=C3=A9s Pa=
ndele
<jcor.alejandro@gmail.com> wrote:
>
> Hello,
>
> I am reporting a power-limit regression/issue on the new Lenovo Legion Pr=
o 5
> 16IRX10 (Board ID: 83NN) equipped with an RTX 5070 Mobile (Blackwell).
>
> [...]
>
> Please let me know if there are specific WMI queries or EC registers
> you would like me to probe to help map the unlock sequence for this board=
.
>
> Regards,
> Kenju

Hi again,

Just wanted to provide a quick addendum to my original report. I did
some static analysis on the ACPI tables (specifically ssdt14) for the
83NN board this weekend and traced the WMI routing for the
power/thermal profiles.

It looks like this board uses the Lenovo System Interface Foundation
(LSIF) mailbox rather than standard VPC2004 limits for the 115W TGP
unlock.

Here is what I found in the _WDG block:

WMI GUID: 82A14BDD-B246-41AB-89E5-6CB41D06C2B3

ACPI Method: Maps to WMA0

I believe the WMA0 method acts as a pass-through mailbox. It accepts a
payload buffer (up to 1024 bytes) and triggers an SMI via WBFN(0xA1).
I strongly suspect the Windows Lenovo driver is building a custom hex
payload and pushing it through this specific mailbox to unlock the
NVIDIA GSP thermal budget.

Hopefully, knowing the exact WMI GUID and Mailbox method helps narrow
down the ideapad-laptop integration. I'd gladly help more but I don't
have the tools to do so.

Thanks, Kenju
