Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BE02FA0C6
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 21:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774387683; cv=pass; b=hjxXTg3BMOVobFlgrdd29F9anvHfFASF1f/4C+Mt2gHlI1ZLmrWiet2WrFlsnM92XVDyX2J8Q+gwMQ+/ChmSL2m4Sp3sHlxoXWhS+VBJynwj8H9R7SeuAoDmGkb5+tTJFiNyCNGsQxGR0gyILEDztLE9ecaiOA98kusQFLLjDVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774387683; c=relaxed/simple;
	bh=LDyNbT07z947mAwwCU/H4seMEakotNHDyOjJ4WTP4wk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ITild9Etqdx+3QBVfIIw404d7ZXCFo6JTdWhBnywolQEhyI2N4zL/76i8STHLjuhdWuJcwPZ5SB1FuzRMpkfIG69pq0K9wsWOj4X7CP5xLYVoBOBbkzTrzuI4N2G9/1KTixPYkqdjb31meKrSb4PFQz72St6FBivFpc+l/9bllo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhF86uHS; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhF86uHS"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b9910707d82so132454066b.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 14:28:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774387680; cv=none;
        d=google.com; s=arc-20240605;
        b=LxAXJUZSxLVMbENWOtUYiOHov9h5WXaYDpBO6QUvpU0HB+l28oCtZTx59XNKQISx7i
         oxK59Qu0qkw7apsD4EB3iYJ4axRtaKdqkXF7Ar7VSU937yEkAJSr3pREnl8FbPpZ8wSO
         Grh1WO1ea9124o4eG1+Ty15zW8YFw+MMNJ7MulRvl9qk3QuaXefDLf994G5c3zceOu0U
         DQTiyRBAm30zzfGUEHwha1CMQ28p15U86/cRbCiX4P8q17ASPcvFNMxOHXU5vhs910RJ
         615DNMa85e0q0vuZ/DOT5beo2KHvEA/Cjea0ODkt/YizQZn4fp6oCjlDq8kho+/zOgMQ
         ra0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GxQi3ohN2SF498D3BGe3v0S3aNizlnyTOGo8I1Infqk=;
        fh=bl3oaCkJqJLi1976U6daTIbmpx9cT8+79DLB542x7lw=;
        b=T9rNkddjILS2lwuVurspnXvU5Da4TCqyop4cMD8q3LYQaXc/Gts8TrshN8lxvei4u/
         AKyXNvSc9b6AYwvgrg+HJFDQwkVWi8BZCe7hYov+7JtQzjPqTRS3nKZDl7iu8o7iviiL
         d51trFYITZC1slB8Fl3piiMai3h+A8Ucp9KwkWcdc34cm+oja1OuIOz6CrH+cwizPExV
         H8XY+LwAq5J7ipCcD7398iMYMBx1boEpyv6AEgV2fSzAJu0JxoNFsN+Aycich0BaTzGE
         l5DFzzFF0GJo2nmm5IXMjEAtepD/x3U9AaWmk0TnNOxAYhhU4FdNZ2MStSjAWBTnm4Lo
         I1JQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774387680; x=1774992480; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GxQi3ohN2SF498D3BGe3v0S3aNizlnyTOGo8I1Infqk=;
        b=NhF86uHSRJrOJPYdo5xMIiyOf/x5xxlwu1N/53q1xVHPJU3lccZtUxn9Zr3ObVDKvs
         9uRATXXCZqwnaETSBL+DJj8Kh6y4Hj1twKLL9m/W8oLINrpYB32Ni8jP87D59c16nLue
         fs7yIvxmmUJQ2tN3ypCw3rdGiYXfwKnKik6kY6Blc2w0HstEM9tSnm/0xs3D6ddSmF50
         4+FwHqolJiWdCoC6hk0rB3VxXo8Wz1sgy2i4Qon7wPatPJbEu/+6vvfrzsqPo7Q+8Kqq
         IR62No61K8TjGLUUzRncAs7lLelxekXSwSUaQtjYgMwgBTTxISYID/QBtSwYdnOkkWsg
         RXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774387680; x=1774992480;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxQi3ohN2SF498D3BGe3v0S3aNizlnyTOGo8I1Infqk=;
        b=OQdb+A2fg9fJUe9GcUVvYKhf+D2jhqn0uZhhqS2aZBtiD1pblG/i9yjrbkfGHD35uJ
         Cm4MsRUy740f6OdrR/x/sZwKrMWyEna50/LUk8SswKvMSbHYMm9RIC/vd3UBvqbMs9/3
         1zpuh8qgS8BMGbnRQHIL0RUXcPz6CrC9EuXVeEGZQusxPhVCcaeGPmm4rkj181wTmVgb
         4IZHmBEjcJadr7OyJi7BegP09OMH/VO/r1770ayqCtvtWEBx3wEfX6TRSWJos2VXgxQI
         h+myWs+vIxSaH5otG4y+ok6VULwaRRxm6q5yi8PfFq9MhIBZb9sLoIVj+LyMoLDwf+mI
         o/IA==
X-Gm-Message-State: AOJu0YwmPKupBsvtSNrcy88fjxcOKvbNliKG2mIN57blhJsX3G6Tl0tu
	AeAYnUYlgRNZY3ZvBGPxuYYqTuSyiPyRDvk/+oUcMr1YH6ZTyXckzz4RUafqclp5RDESKx5SSrQ
	rxSk6jFSj3nMPlDRU9Xa4ilmVHyL+9QeoRqbLauE=
X-Gm-Gg: ATEYQzxbT37veV+/Nuxi6CLOib+NdIBrwuLj7fa2nSHCGt7+DRVKW0+Av+T07t4DFC8
	DfpNs/bU4QIVd9TsNIZ2P+YE4EchV2DWmO2XTyHfhZo9/kZ2reMgmKMgrYAhAYH3IAXDj2dz5LE
	CZAItHYM5IUv6e4lvXyNFct1FZ8AU3LtJrSoOJOJJzbjSo0xqZsDjzf+oFp19A5aYIuGsSFrICT
	fg7f4ypFGuJFkRy54ipvD3NYs+em84ag90VJUAGbB7otSzEGEqlks3y9tkC22trdv6hDdPntHtb
	9PKgaA==
X-Received: by 2002:a17:907:9304:b0:b90:8016:cfe4 with SMTP id
 a640c23a62f3a-b9a3f15ef72mr74194066b.10.1774387679760; Tue, 24 Mar 2026
 14:27:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ0oKyQTEJit294y=fs2s2nzhzUs_GQzsgMswDNs==zkdiqz0g@mail.gmail.com>
 <05ae0012-db1b-4826-a466-f706d2a57cc7@gmx.de> <CAJ0oKyRU3=qBQvxaBycQYAyxCaVogzuVNv_M=4=npTkBF=X1zg@mail.gmail.com>
 <18a5bcab-84d2-4957-a053-dabbf900e85d@gmx.de> <CAJ0oKyR0VPXz887cJsF+oUZFYVD7QY3F3FXWbjAGZGTmFFV-UA@mail.gmail.com>
 <81b30359-7090-430d-8cb1-805cf2d6fcc9@gmx.de>
In-Reply-To: <81b30359-7090-430d-8cb1-805cf2d6fcc9@gmx.de>
From: Ian Jensen <ianmoellerjensen@gmail.com>
Date: Tue, 24 Mar 2026 22:27:46 +0100
X-Gm-Features: AaiRm50uG4cNqBcQoZynZ3UiLOkYQ76sE0Ucya-74srjdn3iAWo5VZMrj8AHtx8
Message-ID: <CAJ0oKySi8dLwbjM5UAgtCBRFEGAMpWZfLth=eWcMrBc3=YQqfQ@mail.gmail.com>
Subject: Re: Internal keyboard non-functional on linux on Medion Laptop -
 NTC816 (Intel IPF) has no driver, PS/2 fallback produces corrupted scancodes
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000058fe41064dcbd3a9"

--00000000000058fe41064dcbd3a9
Content-Type: multipart/alternative; boundary="00000000000058fe3f064dcbd3a7"

--00000000000058fe3f064dcbd3a7
Content-Type: text/plain; charset="UTF-8"

Yes, here

Den tirs. 24. mar. 2026 kl. 22.08 skrev Armin Wolf <W_Armin@gmx.de>:

> Am 24.03.26 um 21:43 schrieb Ian Jensen:
>
> >
> > Yes certainly, my mistake
> > Here it is
> >
> Thank you. Can you share the output of "ls /sys/bus/i2c/devices/"?
>
> Thanks,
> Armin Wolf
>
> > Den tirs. 24. mar. 2026 kl. 21.37 skrev Armin Wolf <W_Armin@gmx.de>:
> >
> >     Am 24.03.26 um 21:28 schrieb Ian Jensen:
> >
> >     > Yes, here it is attached (this is with no launch parameters, so
> >     > completely dead laptop keyboard)
> >
> >     Thanks you.
> >
> >     Can you please also share the acpidump with the whole mailing list
> >     (reply-all) so that everyone can access it?
> >     Also, it seems that the acpidump you have provided is corrupted,
> >     likely because use copied it manually from the
> >     command line.
> >
> >     Please use this command instead:
> >
> >             sudo acpidump > acpidump.txt
> >
> >     The acpidump.txt file should then contain the full data.
> >
> >     Thanks,
> >     Armin Wolf
> >
>

--00000000000058fe3f064dcbd3a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, here</div><br><div class=3D"gmail_quote gmail_quote_c=
ontainer"><div dir=3D"ltr" class=3D"gmail_attr">Den tirs. 24. mar. 2026 kl.=
 22.08 skrev Armin Wolf &lt;<a href=3D"mailto:W_Armin@gmx.de">W_Armin@gmx.d=
e</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Am 24=
.03.26 um 21:43 schrieb Ian Jensen:<br>
<br>
&gt;<br>
&gt; Yes certainly, my mistake<br>
&gt; Here it is<br>
&gt;<br>
Thank you. Can you share the output of &quot;ls /sys/bus/i2c/devices/&quot;=
?<br>
<br>
Thanks,<br>
Armin Wolf<br>
<br>
&gt; Den tirs. 24. mar. 2026 kl. 21.37 skrev Armin Wolf &lt;<a href=3D"mail=
to:W_Armin@gmx.de" target=3D"_blank">W_Armin@gmx.de</a>&gt;:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Am 24.03.26 um 21:28 schrieb Ian Jensen:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Yes, here it is attached (this is with no laun=
ch parameters, so<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; completely dead laptop keyboard)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks you.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Can you please also share the acpidump with the who=
le mailing list<br>
&gt;=C2=A0 =C2=A0 =C2=A0(reply-all) so that everyone can access it?<br>
&gt;=C2=A0 =C2=A0 =C2=A0Also, it seems that the acpidump you have provided =
is corrupted,<br>
&gt;=C2=A0 =C2=A0 =C2=A0likely because use copied it manually from the<br>
&gt;=C2=A0 =C2=A0 =C2=A0command line.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Please use this command instead:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 sudo acpidump &gt; acpi=
dump.txt<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0The acpidump.txt file should then contain the full =
data.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks,<br>
&gt;=C2=A0 =C2=A0 =C2=A0Armin Wolf<br>
&gt;<br>
</blockquote></div>

--00000000000058fe3f064dcbd3a7--
--00000000000058fe41064dcbd3a9
Content-Type: text/plain; charset="US-ASCII"; name="output.txt"
Content-Disposition: attachment; filename="output.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mn54lcqj0>
X-Attachment-Id: f_mn54lcqj0

MTYtMDAzNgoxNi0wMDM3CjE2LTAwNTAKaTJjLTAKaTJjLTEKaTJjLTEwCmkyYy0xMQppMmMtMTIK
aTJjLTEzCmkyYy0xNAppMmMtMTUKaTJjLTE2CmkyYy0yCmkyYy0zCmkyYy00CmkyYy01CmkyYy02
CmkyYy03CmkyYy04CmkyYy05CmkyYy1TWU5BMzYwMjowMAo=
--00000000000058fe41064dcbd3a9--
