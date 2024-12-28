Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC411CA9C;
	Sat, 28 Dec 2024 03:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735356652; cv=none; b=MFKHkJMX1SHAFNCvdbpaswoPHjd5/aHzRgXGa6uoHrxINuXF0BmNFmMZfsS9Qj6QxZ8kuXVAau8QkQ378nzpcTN7qLf4HkQs11Ywarryz3F8NhAOit9NzjHyfUddL3rfwKmSAv85LT7BINB4/bqtdUGjxn7NFBEvYbz+M4dnRXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735356652; c=relaxed/simple;
	bh=2GiEZ42IYieNHfMgxRj7DTWCGwgDfKbttkdvkVIw4bk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CpMSjE3gL2Qadq312XXN+1240e0FhEBVd65wCuZ222dV+YxHTWxxTwDo9NknkQKp9W6CyT2ZM8TEGrzJ9FZO6ypOIPaUD1UJ9cFafr3N78PWYEyFU8YuW/9tMe24TkcqjM4FLt2bCEvFXF+mH8LjAr7MMLF5ZYZAQd9ZjnCDOCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdCKJYZn; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdCKJYZn"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6dce7263beaso68155126d6.3;
        Fri, 27 Dec 2024 19:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735356650; x=1735961450; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f8GYBZuEMER9Nx+eft+7uVydGovTURzOA4xadqgTI18=;
        b=gdCKJYZn/ZWM3C5F2IafS4s3opBvnP4jrzfCyH7YsqJUEBrOuJUj3ouez4S9PQroNR
         wYXs0XC2wybTKPilc3WZCS48WIHAweggUz/eRhA8HSTk2MF6Kl9CtEv0w+Fg5WDLIo3H
         kLHgvb7gGiBkJru/LM7E5ZfuNa1yQ5DAH1IQcN4K1QCWZVSqzmo+9rvHAkCT0bndr342
         t1mjXM6HbEWcMslenO4V7vUEOOOjUnSSQiUSepFVeQFuoy6M6gnPM5zbvyHnCP/mEI0I
         /wYdmqBYP3AEQxF8FRmS1aa2HXbYSS76phWAlEEED/JE2n8BNaoDijClKevursxx9yDH
         ceVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735356650; x=1735961450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f8GYBZuEMER9Nx+eft+7uVydGovTURzOA4xadqgTI18=;
        b=cv1wsNsSem5fhFhhnwHXb79vSvdAHCgyDcT82iYi5w/9S2L7OIvNpKg6N+Bxnajy8D
         AjymnCpUND2vTCzUzi3FSdnjTxYzE7A+kS/1k3z62jpxd4X0J014d2Mk8Qgr/t3qReMn
         2eySBzHiXsC7knBUnqiweNplPEeGRlDK/1s5ViP1WxjcMgSE/6jFZop4bDE59U8FxkqO
         qM7BcqS23vxRhyOjNaAFbV5F8yDjaShK/r8LyHGi0tKJcmxadd17N9zz33W9JbfFvTZX
         6z30FDmZ0cOUsoNgIukpZdweq05LhkMZm8J0lnEty18CmzJ5YtEBxkpqbQD2KvwUM8u4
         q3gA==
X-Forwarded-Encrypted: i=1; AJvYcCUuFCs4IlSZNYWEydYLHGU1Owzn8FaqxwAy6xS2Ddo1B6FncRglu7ZNqjoIlM4icDcucz5tdHh4Fm8=@vger.kernel.org, AJvYcCWrvZ4mjC+1oNE6gDhVUraYRotwmgRqpCAxrounu3PehhT3Se4/G6kmKS5v96G8tfB3johahfBHKCSxTl+wkQrrA18Brg==@vger.kernel.org, AJvYcCXYkYIE+6QBkgdu8dIW6BROgaKNos2Il/q+Xzi/IrZ3ZGUjX+yoh5iTd8RkZnpda93Pd//6D2vuA9NQffJw@vger.kernel.org
X-Gm-Message-State: AOJu0YynxLlAb/fGSGi+9oNfGbkGKp3dURmjF0JyP5Io0+3WhmvsFfDC
	N+Zf9g8R01vDUvFgsLt0c8c0rczkAzs/cHwu0RD7rhEM9/pex8icZV0SPOWmOiiJFIFiwMH0osI
	p9LsiGO9t0vI3S/480Pptogfv9B0=
X-Gm-Gg: ASbGncvw0clKwN+S0fqXnCjbnCuN43NTtqiESelurQtxzVoekb8Ys3paMsP97/GfUYe
	NCu1ItqvKkWx8rGcbd8W4HcOgoE3of06saz2DGDM=
X-Google-Smtp-Source: AGHT+IE0Eg0VjnTW0n8aHt96ZsAI7FhOdD9tYx35Ph0VO1whJG9NETfSrrlJAdPeL4Dttxw8YDNFDyxv4BH0qVOvGX8=
X-Received: by 2002:a05:6214:410f:b0:6d8:8874:2126 with SMTP id
 6a1803df08f44-6dd2333a8d5mr373647056d6.11.1735356650026; Fri, 27 Dec 2024
 19:30:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217230645.15027-2-derekjohn.clark@gmail.com>
 <20241227184825.415286-1-lkml@antheas.dev> <CAFqHKT=Y66KNo-e+o+n76tmPEcqL4EBSUQNDXJcoP8B9NXguew@mail.gmail.com>
 <CAGwozwGpEWVQwEAFfWWkTx4G90uhqdfbF85E4F_2w6c6G6P2Sg@mail.gmail.com>
In-Reply-To: <CAGwozwGpEWVQwEAFfWWkTx4G90uhqdfbF85E4F_2w6c6G6P2Sg@mail.gmail.com>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Fri, 27 Dec 2024 19:30:39 -0800
Message-ID: <CAFqHKTnOA5N-uADQLbdA-b+k-TOMdjZtCPsFsCo9jarMiNioLg@mail.gmail.com>
Subject: Re: [PATCH 0/1] platform/x86: Add Lenovo Legion WMI Drivers
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: corbet@lwn.net, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, luke@ljones.dev, 
	mpearson-lenovo@squebb.ca, nijs1@lenovo.com, pgriffais@valvesoftware.com, 
	platform-driver-x86@vger.kernel.org, shaohz1@lenovo.com, superm1@kernel.org, 
	zhangzx36@lenovo.com, johnfanv2@gmail.com, codyit@gmail.com, W_Armin@gmx.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 27, 2024 at 5:10=E2=80=AFPM Antheas Kapenekakis <lkml@antheas.d=
ev> wrote:

> They need to re-agree given the context below. It is one thing for
> them to agree on it theoretically for settings that they might imagine
> are persistent and another thing when in reality they are not.
>
> You did not address this in your comment here.
>
> The problem I am raising is that SPL, SPPT, and FPPT specifically are
> not persistent enough to meet the guidelines of that interface.
>
> [1] and [2] do not address this either.
>
> I do not have an alternative planned, just noting that I'd like
> everyone to be on the same page before we go ahead with this ABI.

I'll let them weigh in on this again if they want to, but I think it
was clear from those threads that this is a new way to use the class.
Armin's comment was related to the fan curve setting John was
discussing, which is specifically covered by the hwmon subsystem.
Hwmon does not cover platform profiles or PPT.

> To rephrase, your ABI style is not intuitive, because it contains
> implementation details such as "gamezone", "capdata01", and "Other
> Method", in addition to the ABI being hardcoded to the WMI structure
> lenovo uses. The documentation uses those keywords as well.

Yeah, it's a driver for those interfaces... If you want an agnostic
BMOF driver then make one. This isn't that.

> If I understand correctly your last sentence, Armin suggested much of
> the same (ie combine and merge).

You don't seem to, no. The suggestion was to use the component  driver
API to aggregate the Other Method driver with the capability data
driver so that the firmware-attributes class is only loaded when both
are present. That is decidedly different from breaking the kernel's
WMI driver requirements and merging two GUID's into one driver.

> GUID tables loading !=3D drivers loading also, I would not pin that on
> the kernel.

What exactly do you think the following does?

 +MODULE_DEVICE_TABLE(wmi, gamezone_wmi_id_table);

> I do not understand what "I hard code the page to custom" means.
> If you mean the capability data does not change you are right, they
> are hardcoded in the decompiled ACPI I am pretty sure (it has been
> close to a year now so I might be forgetting).

The capability data interface has a data block instance for every
attribute in every fan mode. SPL has one for quiet, balanced,
performance, and custom. The method for getting that data block (page)
is the same as calling get/set in Other Method (0x01030100 -
0x0103FF00). Every page produces different values for each attribute,
but I am only ever retrieving the instance for custom (0x0103FF00) as
that's the only one where setting that method ID in Other Method
changes the values on the Legion Go. It is the only relevant data for
userspace. Other Gaming Series laptops might treat this differently,
where every fan mode has an applicable range. I'll need to do more
testing on other hardware to confirm that. In any case, this isn't
relevant as I'm dropping the gamezone check (as I've stated multiple
times in this discussion) and always setting/getting the custom method
ID for a given attribute.

> It's good that you will be fixing that/I hope you will be fixing that.
> It is not clear from your comment. Please try to skip the capability
> call too.

I was pretty clear...

>> v2 will not need this call more than once during probe, and gamezone
> > will not be called by Other Method ever.

Derek
