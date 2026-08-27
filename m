Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CB518DB1F
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 07:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787815041; cv=pass; b=DaBNHOUVnT9hF49YgRd2lO5gbjSb9lJnFUNBkSSuTGHM3rV3KTqHGiAYT9BOSjW7y9ipFZB7wrTjA82xBImpvBUwyUlGUY51G8dJ28vp+GC6cWH/MxXc7ZX0BkOsVup9RaNisyEV3zJoAPmssYiGM1IPwv+f84RDaJLGAsWO0pY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787815041; c=relaxed/simple;
	bh=OZeEOZUPQp+DlcbiFPsJNn6h5bw3Gm7ANYPswk9HZ6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VzMAywZOb6YsNqQHGJdFSvEo2WX402ECgHaOTK9N0lBXryZsqa6NvM5S38niYyieGbz6WN5RxA2GUmDVUffbcc5eYXtjUHlTG4KnZH+mqOSZmaNcLgrQG9P6O8Sni71uTfTzFErj72hQWOcrLM/7nTsu2ns9eauoiTkOLboattU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=raPHxzIN; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="raPHxzIN"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c169ae1cb26so147040266b.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 00:17:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787815038; cv=none;
        d=google.com; s=arc-20260327;
        b=RMfajO/S/tOiVj2tYfDtVkJrtFVbdXyYx4KcByC1eHVUek5UJKrzdS92LKH63FNwRi
         ItOCJh4N2zIYX3zR2U5cZoQGX29Odp/mSbt+Qwu038cmS4Wpk5qTiIjuXdKl6qN0Eq8G
         k9puUlRm3zfNTJqH2Js+6uLtuWcC1g2iZwEOpcYoF4QmHytPrRLgUbrJdN7Z5o1rNJ0a
         k+J1pDRVe6IT732swTxM4OS96B0pSMPZGtPpEfeulk9XP7NUVXePlv+uHAPdb+fXnupU
         wFxlox+farIefathbyNbc7pQtAYiQetyxA0yqZ8GjPtTZqis70VCw8xw/IXYXnMVsqMf
         2eIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VCW6qNszZee5NLjsJPZEApH953iF4iQXNT2egnVXxlE=;
        fh=jNTJjpeDb1Z+5LC+DQnXGJsWbr6wmJx3yknW+OmNqNM=;
        b=qFWpux/eQ6XDPatRGWel3LM6WCnXTZZ12GYZKoF/q6qJUhFb4JbhpBBn7CYz5DwxFL
         NPhdYm8iWvw6wvcVq1sa10qrV5yI0pYrEm2pWjHWqJ7gg+NnWe7osVXd4hoDqKJpMUdr
         DAm7C5UDmkIibdt8G6mKeKjz2c5cHSA5diEh0/IqzgdBSz8/YhKcuaCYBjbkoZks1Gp9
         VfSXv3NnF3YD7rgZ1pXhM54PGm14SPZvrPNezzaeO1Pcrvs5H+XK941RZRbvO/PfCMfX
         ZetB6yECxFpNsFG47tO845l0bcPNqnUAyHfKfvaFGVHy+UzURk4WN+cQNy/lwISRwOMo
         qpPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787815038; x=1788419838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VCW6qNszZee5NLjsJPZEApH953iF4iQXNT2egnVXxlE=;
        b=raPHxzINJ3NrFYF1YTYBTyZ5sW1oyLcNt+iM36oZsbn0coPY3vLDxUBIMxei4S8O8c
         jZwmIsNd1WDv6gSGrqUloR7pQj+MheZ0Q4W2w0gJOyHOfjFPwvi/jAhVByZh/BieyiJP
         QnR4fepfGWdq/gfEpa1dXqVAMsTMKov7opXBPOvDbpd3sBAihLvf8LYmSET0JXYvLL/g
         7oebtxI+U8oh3su6sExqle/+ghveB4sgKPmhBPKvegjexT7pWA5A4HHw43XJLDLFdJtq
         veh9ooScrSshhqmZi+aiDwcqhCFUsFYSY4JGPov5PqgOtTZPUURlwvxu+heugOIPhe2a
         oTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787815038; x=1788419838;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VCW6qNszZee5NLjsJPZEApH953iF4iQXNT2egnVXxlE=;
        b=AqrqtZU7ThL7qq3Mea0r51M1MuhUdR63Y9BQ3RxayZ5QUsiqN87G7g/Ps1wMu5rDZ+
         ImUGlaBdNCkLP6wj14kcIuQOQvTf/T7SNpnf/PqF8wF8wSiLk/xstsKSKgZRM9YHo7YS
         GbC72jtxDFNtdU3e9JUyq196TPvGwbZIr0ecgLZR4IChpUrC/RtL/TKPugZ8ToAeG257
         Q5+lYXk/EIObw8PJwynpOLXw8nsMtI5IVriKcAurxc0v2q0IMi6QnuwdZNBETtTxD+Zv
         B8w4CvDpClJFfG98russBLbfhpTPXtJq5HHfO0CvHE0hDpGQQMhkSNxFHlkvwjcJS4cX
         DwNw==
X-Forwarded-Encrypted: i=1; AHgh+RoYGU3P5daQQRR5mG7cjWPYxAwohZpaYklx/gs/5JQKsh1YPOEjky5pyqpfvA7lA+YrzHORBQEqQoZl/eMqYZ4hEoKe@vger.kernel.org
X-Gm-Message-State: AFuF++kv6irw5yLKufX9E17IwVF1l1SUWV/uoZzMr27DAwUGQKN4zLs3
	kLbjhn0KejCkfszyyQEUfX+hAWYqpEM+y6M+IMJOCQKIb1Z/gKimgPnGKREk9I0gOXFLHJYPil/
	A8t1/115jjWCIM/BHvQLoAGWdxqYi+w4=
X-Gm-Gg: AR+sD12u9YQWvCcn0gshlXLUHGOWT92sFIwlsCNqTRsMgfTmQ0+81N+47OA79eBRMEl
	fc22EKDKm+/I+mEl7NDzfS4uHAnvYxRsLnrOsZP51U2ler0eBmItoUbjTx6SuJCLrrKZwUaE6H5
	FF3vzbqOMCwSecDA073BTqwfK7FJtmVyjXFBHtk2LSI1KqNJiiqZXT84bM6tT1ZWXghoBhRE4XW
	WQQquUqRyiBEfPmD9acdYglj2DWVwN1IWfD0A46VqGSK9MtuEMkzD9BX3DLqOAu1ltMgK3G+IaC
	UmQpJrppUTuO03MstSrE+Bb8DXNfg3EqovQ2KpFuvt1oK9QeOFY4xyFe0ImL0YGjO92CebUXPlk
	OEG8QgVPQQIsWcee7G6H4R7wVokAH
X-Received: by 2002:a17:907:3d12:b0:c21:5cd6:3e49 with SMTP id
 a640c23a62f3a-c25360cb00fmr331534766b.9.1787815037767; Thu, 27 Aug 2026
 00:17:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAH4cXPgq6hUiGqyk4BDYcbnmjLxRM_2uM52uzc2kCF-jDc5Q7Q@mail.gmail.com>
 <CADqcGBnbq9FrTz5R+=4W8n+xkWdeaOgqy2DfiOFDJX9DW4Jjfw@mail.gmail.com> <CAH4cXPhqcfX7XJSoUe6KVSA58jnHnFV=P3zqOVwkA6MtbTmb4g@mail.gmail.com>
In-Reply-To: <CAH4cXPhqcfX7XJSoUe6KVSA58jnHnFV=P3zqOVwkA6MtbTmb4g@mail.gmail.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Thu, 27 Aug 2026 12:17:03 +0500
X-Gm-Features: AcwNN1VOyE6iCTmDfGIzQKQvkSXHXgr8I7WXACWsNCv2ym3mGv_vbGGyg2bh0NE
Message-ID: <CADqcGBkU733BkQaPkFjq3fQD3sFNYwBo3N8HrgGrT=u4Hm09Gw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] hp-bioscfg: fix attribute enumeration on older HP BIOS
To: Luigi Maria Vecchioni <luigimaria.vecchioni@gmail.com>
Cc: Jorge Lopez <jorge.lopez2@hp.com>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luigi,

Thank you for testing the full v5 series and for the detailed report,
that's genuinely useful.

I went back and checked this against the actual driver source rather
than just the error text, and I don't think this is the same bug the
four merged patches fixed. Those patches all operate on the ACPI
package after it's successfully returned by the firmware, they make
the driver tolerate a smaller-than-expected package. What your trace
shows is different: the AML method \_SB.WMID.WQBZ is aborting
internally (AE_AML_BUFFER_LIMIT, index 0x32 equals the object's own
length 0x32, a one-past-the-end access) before it returns anything at
all. hp_get_wmiobj_pointer() correctly gets nothing back and returns
NULL in that case, so none of the parsing code those four patches
touch ever runs. This looks like it's failing inside your BIOS's own
AML bytecode, not in the Linux driver.

A few things worth noting: this happens on the very first call (Arg0 =3D
0), not partway through enumeration, which points to a bug in the
method itself rather than something tied to a specific attribute. And
the fact that your system otherwise boots cleanly with 0 failed units
suggests the driver is failing gracefully here, there may not be
anything further to fix on the Linux side for this specific case,
since the AML abort happens before the driver has any data to work
with.

To confirm this and see exactly what's going on, would you be able to
grab your DSDT/SSDT tables and share the WQBZ method body? Either:

  sudo acpidump -o acpi.dat

or pull the tables directly from /sys/firmware/acpi/tables/DSDT and
any SSDT* files, then disassemble with:

  iasl -d <file>

If you still have access to an earlier BIOS version for this model,
testing whether it avoids the error would also help confirm whether
this is a regression in F.25 specifically versus something that's
always been broken on this model, that would matter for whether it's
worth reporting to HP directly.

No pressure on any of this, only if you're up for it. And for what
it's worth, you've been doing this exactly right, reproducing the
actual behavior and reporting real output is exactly what's useful
here, expertise isn't a prerequisite for that.

Thanks again,
Muhammad

On Tue, Aug 25, 2026 at 6:56=E2=80=AFPM Luigi Maria Vecchioni
<luigimaria.vecchioni@gmail.com> wrote:
>
> Dear Muhammad,
>
> Thank you very much for your reply. I really appreciated both the
> quick response and the explanation.
>
> As a small way of returning the favor, I decided to test the complete
> v5 series on my machine.
>
> I applied all four patches cleanly on top of vanilla Linux 7.2, using
> exactly the same kernel configuration as my current working kernel,
> and built a separate test kernel.
>
> The patched kernel boots and otherwise works normally, but
> unfortunately hp_bioscfg still does not enumerate any firmware
> attributes on this machine.
>
> hp_bioscfg is loaded:
>
> hp_bioscfg                  61440  0
> firmware_attributes_class   12288  1 hp_bioscfg
>
> but /sys/class/firmware-attributes contains no attribute directories,
> and the attribute count is 0.
>
> The same error sequence is still present:
>
> ACPI BIOS Error (bug): AE_AML_BUFFER_LIMIT, Index (0x32) is beyond end
> of object (length 0x32)
> ACPI Error: Aborting method \_SB.WMID.WQBZ due to previous error
> (AE_AML_BUFFER_LIMIT)
> ACPI Error: Aborting method \_SB.WMID.WQBE due to previous error
> (AE_AML_BUFFER_LIMIT)
> hp_bioscfg: Returned error 0x3, "Invalid command value/Feature not suppor=
ted"
>
> The system otherwise boots normally and systemctl --failed reports 0
> failed units.
>
> I am not sure whether this means that this machine is hitting a
> different firmware path from the one addressed by the v5 series, so I
> prefer not to speculate further.
>
> Test system:
>
> HP Laptop 15-fc0xxx
> BIOS F.25, 04/20/2026
> AMD Ryzen 7 7730U
> Linux 7.2 + complete hp-bioscfg v5 series
>
> I should add that I am not an expert in kernel or ACPI development. I
> am simply trying to learn something with the assistance of AI: I run
> the commands myself and provide the actual outputs from the machine.
>
> That said, if you think this system could be useful for further
> testing, and you are willing to guide me on what to collect or try, I
> would be very happy to help.
>
> Thanks again for your work and for taking the time to reply.
>
> BR,
>
> Luigi
>
>
> Il giorno mar 25 ago 2026 alle ore 00:01 Muhammad Bilal
> <meatuni001@gmail.com> ha scritto:
> >
> > Hi Luigi,
> >
> > Thank you for the report. Good to know this affects current 2026 HP
> > platforms too and not just older ones.
> >
> > The AE_AML_BUFFER_LIMIT / WQBE error you are seeing is caused by the
> > hp_bioscfg driver requesting more ACPI package elements than the
> > firmware provides. The fix was merged upstream in the following commits=
:
> >
> >   b0e2af3ec94e ("platform/x86: hp-bioscfg: warn on element type
> >                  mismatch instead of failing")
> >   40e10e6cc8f7 ("platform/x86: hp-bioscfg: accept reduced ACPI packages
> >                  from older HP BIOS")
> >   1d143d78299d ("platform/x86: hp-bioscfg: bound ordered-list parsing
> >                  by the package count")
> >   e0ddfd77c0c3 ("platform/x86: hp-bioscfg: pass validated element count
> >                  to package parsers")
> >
> > These are in Linux 7.2-rc1+ and will be in the 7.2 stable release. If
> > you are running Linux Mint on kernel 7.2 RC you should already have
> > them; if not, upgrading to the final 7.2 release or applying those four
> > commits as stable backports should resolve the issue on your machine.
> >
> > Thanks,
> > Muhammad Bilal
> >
> > On Sat, Aug 22, 2026 at 10:02=E2=80=AFPM Luigi Maria Vecchioni
> > <luigimaria.vecchioni@gmail.com> wrote:
> > >
> > > Hi,
> > >
> > > I am writing in relation to the discussion:
> > >
> > > [PATCH v2 0/3] hp-bioscfg: fix attribute enumeration on older HP BIOS
> > >
> > > Message-ID: <20260704160759.236249-1-meatuni001@gmail.com>
> > >
> > > I am seeing the same AE_AML_BUFFER_LIMIT / WQBE / hp_bioscfg error 0x=
3
> > > pattern on a recent HP platform:
> > >
> > > HP Laptop 15-fc0xxx
> > > AMD Ryzen 7 7730U
> > > BIOS F.25, 04/20/2026
> > > Operating system: Linux Mint
> > > Kernel: Linux 7.2
> > >
> > > Loading the upstream hp_bioscfg driver produces:
> > >
> > > ACPI BIOS Error (bug): AE_AML_BUFFER_LIMIT, Index (0x32) is beyond en=
d
> > > of object (length 0x32)
> > >
> > > followed by:
> > >
> > > ACPI Error: Aborting method \_SB.WMID.WQBZ
> > > ACPI Error: Aborting method \_SB.WMID.WQBE
> > > hp_bioscfg: Returned error 0x3, "Invalid command value/Feature not su=
pported"
> > >
> > > ACPICA tracing of \_SB.WMID.WQBZ shows the failure with:
> > >
> > > Arg0 =3D 0
> > > Local5 =3D 0x32
> > >
> > > I thought this might be useful because this system is running a
> > > current 2026 HP BIOS, so the issue may not be limited to older HP
> > > firmware.
> > >
> > > Regards,
> > >
> > > Luigi
