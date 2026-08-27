Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBE13B52E4
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 12:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787832696; cv=pass; b=XFwYzRula84Qp1tiUsxPlYQOytN2dqxZRogBXpm+Mg88A1Sfho4gTFlwXG90ngogBRhdqGtQuzqYC+EwaqhpaabTcj/4vcbnei24S88nOHxPvf/KzHhSrxvbhrJgDoFgAsNu9/rtnmKLFjwRdTtFMoX5fhQf816cqEp6DJ0eiF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787832696; c=relaxed/simple;
	bh=GV2+EeGg9iG8pcP1dXbP7lmQPGX1Vg12OIUyvHohFK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JVZUOZO6dQjeOwZX+5K1Nk3vmosOB7X9Gxe4PFkby6rNnqsVgF1mnQNCbZiyWbZ/HjBPHWLnxYIZbVOlySecJDW0tQHvGSU6UikO5JaWAtJEtYOYkorEkGicNDYlcMOFFMYnrTYbJ47OVAh/fdpjUvVIsi52hxrEEeoNkqhRiRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJxpa8uq; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJxpa8uq"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2022323c37so289385966b.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 05:11:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787832692; cv=none;
        d=google.com; s=arc-20260327;
        b=OMHASuA1VkmW9UYLq/YcHO1WvCH8444ZTDUk62ARrdC8erCAK3mlRC6MYHRTsivyPA
         hOBfwA5ueh9PCyRBC8PpfnrtiIEW7aVVF6AgU58ELQV18eC7PLF7eQqIT0qJCjwhX17c
         G63cyxLMIX8Tkj85METD6oixCBvUAwIn5gOAAhtKl2CUjLL0vjDgCDB5Xe2bVl8yaGkP
         aeICpQV9o5QA+r29qsN6MoBgY5SjZLHFP/9XGWjwg++H/3MqM+q818t1N031YmdE+fkc
         N7oDdApEHKxzUUewzK3DCvg9DCNCMrpPfoi+XZPHKd8G2zDANu3BGF6iSAwt3JiLBltO
         ROkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+q1HQLAretufjGzFZX3LMWRmcfcUVWMEE0FbIyp1xkQ=;
        fh=JWumdzRowlEeEO7CGnbFEbOTBm8/egkJEV+Z1t4pXtE=;
        b=WBYzIbVVKdWpN9ZUv6l3VFtUogCfV9hlANVLoYz39t0zBQMNOKzl+94PNLDGcLGx8R
         ChVLDLk7dLFuqR0QFeo55w31z4c5wH5Vl7mEVh9nuNMjXZ4Gj6qzD64kTYplW09xYzbe
         flC52sQuhrTDU66iLGYIQOfxjsV8D3XP7g6DTT2422QSHonVqlAMwEXmP5yuoqt0Dtzx
         PBf3D7QUsKslqWtr7t6QD/viKgFaJgLTm6ETwXcYMhb1dUF9bs30giUYFjBkhLu2sp/b
         BJ9ta8ApwkBx2o9O6zj+BvOl6NYbesupF6K/VZYorVInieE9PhHaaLtIFAXL7z4ktnZQ
         yNvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787832692; x=1788437492; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+q1HQLAretufjGzFZX3LMWRmcfcUVWMEE0FbIyp1xkQ=;
        b=IJxpa8uqmTo7HbHUZJc4uXSkagKmFR7Ytmsf9Z0ilPgc6Vph6eIoQXpevEaNa9mdCG
         IIlEhziBFBETy5iT2VSbnsc6MP8huy5zp4b7pxsrymz9vK1iZlVpKQcTxm9n26jyLLVa
         e2SgQ6t6NUY4sCKv2qCtZPd7yQWWpVJzhMHvpEinVf5Li02XXQOk7FW1iFG4la404w/i
         iw85+sq+A4ykvZOuwRRpO88J0ROphy+MwQnKOLpb40UeBaKbCv8y+32aRMmHt+ztAWOD
         oeXHhJjGRN8U/RTP+4vty99xBvShEZtjGNeJWr81LuCNiS3YzJcCXk6EApn2rPqQchjO
         2inA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787832692; x=1788437492;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+q1HQLAretufjGzFZX3LMWRmcfcUVWMEE0FbIyp1xkQ=;
        b=LpJk3XIztdrIQF7i0nF3Z45iH0tOcrQtzq4rF6TUckBNz+z04/W/B2BBZ2ixQpjKcI
         H5LIiIOkHIhslSK7v8sTm4ffONKb2Z/FEsKpQGL4KXJa6e2tXMyVNuiK/gToOoJfHjhM
         kVXE93YPjRfXHNxGY5BF7yU8tLia6SmVQh1utOKnhf1jRlApkaiwiG3tlIv/uqaZsXs3
         d9uDDWAIg0uUW6ax3N6JV7YwYz/ZVvslQo1crEJhidNkm/oVmKVq5zYVplDv9+kJmXBm
         WpMXjdO0W272KVva4BSaeuQSmXoi/46tuEWZh9OaPAvX92IiZWsqyODbfMugppS32b2G
         0LmQ==
X-Forwarded-Encrypted: i=1; AHgh+RoddiX2gi4XDzhtEe8sxSal0p72oLt2IAYGoJVYk/AlFWKQpdIX6ADrr0HemIyK1mkwL1GeqEPTZ2e7IiRK18SifbuW@vger.kernel.org
X-Gm-Message-State: AFuF++lgLLYE/34iKPSuKZC9/Tx4Nr41SZuqHueC/tjhBSAADApintWO
	hHX6yK6M1iAcCWUY1XqIu1/2ZaX8m9EBNZttpiVJQnGe4zo+w+8m/s/hkqsX7QWUBCg+EjlYg4F
	hHxs5/tY81hPh2P5jFwb0F0hLTzeiXGY=
X-Gm-Gg: AR+sD12m1QLQ1vwr33Cnte4m+Vp12JMF4pyem1Lp4qneaOyFOmKhFv+a5QmvQeyPpYd
	UsIDoMhOfPJYjhEY0jjb0Phuz9QtyXHxFZm3rrUh1v+JdlWTT2ugquvOfqMxOwYxmwHdtcV8zpX
	sO0F4vOyyyL8h/xWPrcVbv0RJLA8gsmwA/SBujUzIxRr0erPUXtbYqHPbRyzlJrWPgzJmbyqr2+
	A/3Kl8igFEVvf+kYbDwPppKedgLqcjkqbPgcM5Eeo9i1kzwdw3KUols0NLyV2qO4JhfeMqC/VZ3
	vPc5LqUKYEXG9efoDGIEyNb6MzP0cU4554QaFVOisLrdFVHx2gXGSusd+ZNEOpfkq+uZsCe1VCJ
	dL+HI0/S7mxlBy0DoT6tbUM4jPk0EUA==
X-Received: by 2002:a17:907:3d44:b0:c12:74af:51f3 with SMTP id
 a640c23a62f3a-c250bb126c5mr1479827666b.6.1787832691809; Thu, 27 Aug 2026
 05:11:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAH4cXPgq6hUiGqyk4BDYcbnmjLxRM_2uM52uzc2kCF-jDc5Q7Q@mail.gmail.com>
 <CADqcGBnbq9FrTz5R+=4W8n+xkWdeaOgqy2DfiOFDJX9DW4Jjfw@mail.gmail.com>
 <CAH4cXPhqcfX7XJSoUe6KVSA58jnHnFV=P3zqOVwkA6MtbTmb4g@mail.gmail.com>
 <CADqcGBkU733BkQaPkFjq3fQD3sFNYwBo3N8HrgGrT=u4Hm09Gw@mail.gmail.com> <CAH4cXPhDbQAJDga_jVKcEy5TrYr9SNkOFbhdH_MO_KoYdG2wsA@mail.gmail.com>
In-Reply-To: <CAH4cXPhDbQAJDga_jVKcEy5TrYr9SNkOFbhdH_MO_KoYdG2wsA@mail.gmail.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Thu, 27 Aug 2026 17:11:19 +0500
X-Gm-Features: AcwNN1WansmB0n25ViVWh6AUcTw77iaCbJhR7trCjDFCKK8TTcnMBwA4dDmcev0
Message-ID: <CADqcGBkSa2Q3rHF-bYOjqfqJ8so-m-fhGSBeFBO7F2hTzFdcuA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] hp-bioscfg: fix attribute enumeration on older HP BIOS
To: Luigi Maria Vecchioni <luigimaria.vecchioni@gmail.com>
Cc: orge.lopez2@hp.com, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luigi,

Thank you, this was exactly what was needed, and genuinely excellent
work getting the DSDT extracted and disassembled cleanly.

One correction first: the section your AI flagged in WQBZ isn't the
bug. N018 is set to 4 at the very top of the method, and N013 (the
package those loops search) is declared as a 4-element package, so
that loop is internally consistent and can never reach index 50. I
traced it against the actual declaration to confirm. Worth knowing for
your own sake, not a criticism of the approach, that's exactly the
kind of thing worth double-checking rather than assuming.

I kept following the call chain past that point. WQBZ calls a shared
helper, WSMI, and there I found something that does line up: a retry
loop bounded by the same value, 50 attempts, 5ms apart, waiting for a
status field to change after triggering an actual SMI (I/O port 0xB2,
the standard x86 SMI trigger port). AEAX is loaded with 0xEA7B before
that, which is HP's known signature for their WMI BIOS SW SMI
interface.

I can't say with full certainty that specific loop is the exact crash
site, I didn't find a literal buffer index operation right there, but
the direction is clear: this hands off into SMM firmware code that's
completely invisible from the AML side, and invisible to Linux
entirely. That's consistent with everything we've seen: it fails on
the very first call, the driver correctly gets nothing back and fails
gracefully, and now the actual mechanism traces into a hardware SMI
hand-off rather than anything in the ACPI tables Linux processes
directly.

Given that, I don't think there's a Linux-side fix available here, and
I don't want to ask you to push further into territory your own
tooling is (rightly) cautious about. This looks like a firmware defect
on HP's side.

Jorge, you're already on this thread, do you know if this SW SMI
interface (0xEA7B command, on BIOS F.25 for the 15-fc0xxx line) rings
a bell, or is there a better channel for Luigi's report to reach the
right team internally?

Luigi, thank you again, this is exactly the kind of report that's
genuinely useful even when it doesn't end in a Linux patch, you've
helped narrow down something real. ;)

Best,
Muhammad

On Thu, Aug 27, 2026 at 4:03=E2=80=AFPM Luigi Maria Vecchioni
<luigimaria.vecchioni@gmail.com> wrote:
>
> Hi Muhammad,
>
> Thanks. I=E2=80=99ve attached the full `acpi.dat` dump and the disassembl=
ed `dsdt.dsl`.
>
> I also made an additional effort to help by going through the DSDT
> with AI assistance. I want to be completely transparent: I do not have
> the AML/ACPICA expertise to independently analyse this code, so the
> following is not my technical conclusion. It is simply a point the AI
> identified in the HP firmware code that seemed specific enough to pass
> on to you for evaluation.
>
> The AI focused on this part of `WQBZ`:
>
> ```asl
> While ((Local1 !=3D N018))
> {
>     Local4 =3D DerefOf (N003 [Local1])
>     Local5 =3D Zero
>     While ((Local5 !=3D N018))
>     {
>         Local7 =3D DerefOf (DerefOf (N013 [Local5]) [Zero])
>         If ((Local4 =3D=3D Local7))
>         {
>             BF01 =3D DerefOf (DerefOf (N013 [Local5]) [One])
>             N007 =3D BF01
>             N015 [Local6] =3D N007
>             Local6++
>             Local5 =3D (N018 - One)
>         }
>
>         Local5++
>     }
>
>     Local1++
> }
>
> ...
>
> Local1 =3D Zero
> Local2 =3D Zero
> While ((Local2 !=3D N018))
> {
>     BF01 =3D DerefOf (N015 [Local2])
>     Local5 =3D Zero
>     While ((DerefOf (BF01 [Local5]) !=3D Zero))
>     {
>         Local3 =3D DerefOf (BF01 [Local5])
>         N005 [Local1] =3D Local3
>         Local5++
>         Local1++
>     }
>
>     N005 [Local1] =3D 0x2C
>     Local1++
>     Local2++
> }
> ```
>
> Regarding the older BIOS: I would prefer not to downgrade unless it
> becomes really necessary. I=E2=80=99m not afraid of experimenting =E2=80=
=94 over the
> years I=E2=80=99ve managed to kill a computer or two doing exactly that =
=E2=80=94 but
> I also try not to go beyond the limits of my own fear, and BIOS
> flashing is definitely one of those limits. :-)
>
> One other limitation on my side is that the AI assistance I=E2=80=99m usi=
ng
> has cybersecurity restrictions around some lower-level firmware work.
> So if the investigation moves beyond static analysis and ordinary
> diagnostics, I=E2=80=99m afraid I may reach the point where I cannot push=
 it
> much further independently.
>
> I=E2=80=99m very happy, however, to keep running non-invasive tests,
> collecting traces, testing kernels or patches, and reporting back
> exact results through your guidance.
>
> Thanks again,
> Luigi
>
> Il giorno gio 27 ago 2026 alle ore 09:17 Muhammad Bilal
> <meatuni001@gmail.com> ha scritto:
> >
> > Hi Luigi,
> >
> > Thank you for testing the full v5 series and for the detailed report,
> > that's genuinely useful.
> >
> > I went back and checked this against the actual driver source rather
> > than just the error text, and I don't think this is the same bug the
> > four merged patches fixed. Those patches all operate on the ACPI
> > package after it's successfully returned by the firmware, they make
> > the driver tolerate a smaller-than-expected package. What your trace
> > shows is different: the AML method \_SB.WMID.WQBZ is aborting
> > internally (AE_AML_BUFFER_LIMIT, index 0x32 equals the object's own
> > length 0x32, a one-past-the-end access) before it returns anything at
> > all. hp_get_wmiobj_pointer() correctly gets nothing back and returns
> > NULL in that case, so none of the parsing code those four patches
> > touch ever runs. This looks like it's failing inside your BIOS's own
> > AML bytecode, not in the Linux driver.
> >
> > A few things worth noting: this happens on the very first call (Arg0 =
=3D
> > 0), not partway through enumeration, which points to a bug in the
> > method itself rather than something tied to a specific attribute. And
> > the fact that your system otherwise boots cleanly with 0 failed units
> > suggests the driver is failing gracefully here, there may not be
> > anything further to fix on the Linux side for this specific case,
> > since the AML abort happens before the driver has any data to work
> > with.
> >
> > To confirm this and see exactly what's going on, would you be able to
> > grab your DSDT/SSDT tables and share the WQBZ method body? Either:
> >
> >   sudo acpidump -o acpi.dat
> >
> > or pull the tables directly from /sys/firmware/acpi/tables/DSDT and
> > any SSDT* files, then disassemble with:
> >
> >   iasl -d <file>
> >
> > If you still have access to an earlier BIOS version for this model,
> > testing whether it avoids the error would also help confirm whether
> > this is a regression in F.25 specifically versus something that's
> > always been broken on this model, that would matter for whether it's
> > worth reporting to HP directly.
> >
> > No pressure on any of this, only if you're up for it. And for what
> > it's worth, you've been doing this exactly right, reproducing the
> > actual behavior and reporting real output is exactly what's useful
> > here, expertise isn't a prerequisite for that.
> >
> > Thanks again,
> > Muhammad
> >
> > On Tue, Aug 25, 2026 at 6:56=E2=80=AFPM Luigi Maria Vecchioni
> > <luigimaria.vecchioni@gmail.com> wrote:
> > >
> > > Dear Muhammad,
> > >
> > > Thank you very much for your reply. I really appreciated both the
> > > quick response and the explanation.
> > >
> > > As a small way of returning the favor, I decided to test the complete
> > > v5 series on my machine.
> > >
> > > I applied all four patches cleanly on top of vanilla Linux 7.2, using
> > > exactly the same kernel configuration as my current working kernel,
> > > and built a separate test kernel.
> > >
> > > The patched kernel boots and otherwise works normally, but
> > > unfortunately hp_bioscfg still does not enumerate any firmware
> > > attributes on this machine.
> > >
> > > hp_bioscfg is loaded:
> > >
> > > hp_bioscfg                  61440  0
> > > firmware_attributes_class   12288  1 hp_bioscfg
> > >
> > > but /sys/class/firmware-attributes contains no attribute directories,
> > > and the attribute count is 0.
> > >
> > > The same error sequence is still present:
> > >
> > > ACPI BIOS Error (bug): AE_AML_BUFFER_LIMIT, Index (0x32) is beyond en=
d
> > > of object (length 0x32)
> > > ACPI Error: Aborting method \_SB.WMID.WQBZ due to previous error
> > > (AE_AML_BUFFER_LIMIT)
> > > ACPI Error: Aborting method \_SB.WMID.WQBE due to previous error
> > > (AE_AML_BUFFER_LIMIT)
> > > hp_bioscfg: Returned error 0x3, "Invalid command value/Feature not su=
pported"
> > >
> > > The system otherwise boots normally and systemctl --failed reports 0
> > > failed units.
> > >
> > > I am not sure whether this means that this machine is hitting a
> > > different firmware path from the one addressed by the v5 series, so I
> > > prefer not to speculate further.
> > >
> > > Test system:
> > >
> > > HP Laptop 15-fc0xxx
> > > BIOS F.25, 04/20/2026
> > > AMD Ryzen 7 7730U
> > > Linux 7.2 + complete hp-bioscfg v5 series
> > >
> > > I should add that I am not an expert in kernel or ACPI development. I
> > > am simply trying to learn something with the assistance of AI: I run
> > > the commands myself and provide the actual outputs from the machine.
> > >
> > > That said, if you think this system could be useful for further
> > > testing, and you are willing to guide me on what to collect or try, I
> > > would be very happy to help.
> > >
> > > Thanks again for your work and for taking the time to reply.
> > >
> > > BR,
> > >
> > > Luigi
> > >
> > >
> > > Il giorno mar 25 ago 2026 alle ore 00:01 Muhammad Bilal
> > > <meatuni001@gmail.com> ha scritto:
> > > >
> > > > Hi Luigi,
> > > >
> > > > Thank you for the report. Good to know this affects current 2026 HP
> > > > platforms too and not just older ones.
> > > >
> > > > The AE_AML_BUFFER_LIMIT / WQBE error you are seeing is caused by th=
e
> > > > hp_bioscfg driver requesting more ACPI package elements than the
> > > > firmware provides. The fix was merged upstream in the following com=
mits:
> > > >
> > > >   b0e2af3ec94e ("platform/x86: hp-bioscfg: warn on element type
> > > >                  mismatch instead of failing")
> > > >   40e10e6cc8f7 ("platform/x86: hp-bioscfg: accept reduced ACPI pack=
ages
> > > >                  from older HP BIOS")
> > > >   1d143d78299d ("platform/x86: hp-bioscfg: bound ordered-list parsi=
ng
> > > >                  by the package count")
> > > >   e0ddfd77c0c3 ("platform/x86: hp-bioscfg: pass validated element c=
ount
> > > >                  to package parsers")
> > > >
> > > > These are in Linux 7.2-rc1+ and will be in the 7.2 stable release. =
If
> > > > you are running Linux Mint on kernel 7.2 RC you should already have
> > > > them; if not, upgrading to the final 7.2 release or applying those =
four
> > > > commits as stable backports should resolve the issue on your machin=
e.
> > > >
> > > > Thanks,
> > > > Muhammad Bilal
> > > >
> > > > On Sat, Aug 22, 2026 at 10:02=E2=80=AFPM Luigi Maria Vecchioni
> > > > <luigimaria.vecchioni@gmail.com> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > I am writing in relation to the discussion:
> > > > >
> > > > > [PATCH v2 0/3] hp-bioscfg: fix attribute enumeration on older HP =
BIOS
> > > > >
> > > > > Message-ID: <20260704160759.236249-1-meatuni001@gmail.com>
> > > > >
> > > > > I am seeing the same AE_AML_BUFFER_LIMIT / WQBE / hp_bioscfg erro=
r 0x3
> > > > > pattern on a recent HP platform:
> > > > >
> > > > > HP Laptop 15-fc0xxx
> > > > > AMD Ryzen 7 7730U
> > > > > BIOS F.25, 04/20/2026
> > > > > Operating system: Linux Mint
> > > > > Kernel: Linux 7.2
> > > > >
> > > > > Loading the upstream hp_bioscfg driver produces:
> > > > >
> > > > > ACPI BIOS Error (bug): AE_AML_BUFFER_LIMIT, Index (0x32) is beyon=
d end
> > > > > of object (length 0x32)
> > > > >
> > > > > followed by:
> > > > >
> > > > > ACPI Error: Aborting method \_SB.WMID.WQBZ
> > > > > ACPI Error: Aborting method \_SB.WMID.WQBE
> > > > > hp_bioscfg: Returned error 0x3, "Invalid command value/Feature no=
t supported"
> > > > >
> > > > > ACPICA tracing of \_SB.WMID.WQBZ shows the failure with:
> > > > >
> > > > > Arg0 =3D 0
> > > > > Local5 =3D 0x32
> > > > >
> > > > > I thought this might be useful because this system is running a
> > > > > current 2026 HP BIOS, so the issue may not be limited to older HP
> > > > > firmware.
> > > > >
> > > > > Regards,
> > > > >
> > > > > Luigi
