Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8A63A1C9
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Oct 2025 00:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761783815; cv=none; b=Ls7QtvTkXN52iMBNpLT8PY+eHwfyxsDsKq5PFiHI3ICSVUzG732ZUOJOZFMsNB9dMsFMwCPYqmafSpE+BDi5NkW+7XYZiaB9VIFJPFArgSmThxVEhROyRMGBe93I8UWpzaVIMRGkw6VANTFY6SRJQF2xTu4c1B8jv0jek83VdKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761783815; c=relaxed/simple;
	bh=jjHSMfYroc1NxitLgMklOVgnTfH/oHY6lqJlHLZMBhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eRvWCAv0W++OKISdRPbjhtDmfDhCNsoBkVB2gpOVScBeHrduS6Wlk/Rm21nTikXxZ88yYY2DFm+WiF0bWjcZ0e0k/zUlIB5QPWXVETnuCBHJXiHoQOguZPBQkZIkuNElOPD6riPSAowO9JrO0SjvgTiLdvWXNtgCc1LlrFc/t4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WakJl7e0; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WakJl7e0"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8a074e50b41so51906085a.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Oct 2025 17:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761783813; x=1762388613; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjHSMfYroc1NxitLgMklOVgnTfH/oHY6lqJlHLZMBhc=;
        b=WakJl7e0ihCG2DDIkU7dF8vPI70xgpcykBP485DSzdn8/Ip2Hqr/lJnB3kTTCg+g43
         pyt9bKrmywJnRPhyeWHxzZ1zeF8XYpC1m82rwo2qtlQZFHgKLSn6xa2nE8RF4RIFs2QC
         Raj63wyU2C24sYL3+JuYAI05nen58cyo2s/J73Z+BD9AkzV/vd3/oF2OqLIaVDU/Ns99
         F6Zqv2WV4vlqIUIWkQUQx4MeCJ0eLlwWGt9IL6vH3PI3Jq4Pbw3iKsxOC1dvqT1Avnr0
         je6RfAbSIHA5G5yerrIvu3Hcp/qpUXLgHTUM651CYvtQ2divRH6JS7/y14p9QqNto0GD
         dqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761783813; x=1762388613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjHSMfYroc1NxitLgMklOVgnTfH/oHY6lqJlHLZMBhc=;
        b=tTYMWobYlFn9w7GKbBUfjv5q5NSXPSR5Z5Vmnk77Uo4dsfB3+EhNXAxEUK4mH/sdU8
         2tCcJE4lZ5PfuxLGMAdLmsVFJqx4j6ECY3Dr4Nr+gMU2ycQ2umiAQbrP5RgVjEm/zfwd
         xA7qd6pI69z/GhaOnuvstNh5BwWrPA+bR3B/6rgE9u7L8LFBbVY5HTFeQyqWT9yZQXbA
         9Mx0DuFc7NOxl7vg173TYruTVgFEnL+Z/S9Hl/z0079FcNqViNbkmere8Ru0WL+e+e1p
         VUmYGVQlij8kDXZvz39vyC+vuE3MZ8SHkbKKQbCo/oxgCL7Du97uKozQ9eCFk8H7Aaz2
         vK8w==
X-Forwarded-Encrypted: i=1; AJvYcCVm5bnX0z4Y4oWfGpmuydrN1rHSZYd0c/9v07KQB0vTiPcTa3AK7qo35VcsmZrB0j3Ccgj/fPy89MBiorroQ+gf9fmT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3+aON+L3RSiihGicEQJPDyt2jlH3EiQEUob0qRFp3ljOZJwaz
	AfepaqnA9KXsdZKF9N4FOzbRNTt51sZnWtEo8PioT75rXSspKmS0YfUsuDayVXBlbMHyDrv9oym
	BsRTSjs2zCaWhnVMQRPJtAYFkR2DRBiOtX8dGC0I=
X-Gm-Gg: ASbGncsiH2D3eE2f4pLeAMl57MxgJmAhcU6A+6sGbBZIaWF9jyHt1ibkATj4r9uH93X
	ztEkiW7HkGwBbm6ODvAaogb5VnVoqv6XS+agf2GkqLcd67nmG4BOVja60zqL7p3AUMJsd05YqW4
	GKwbJSCQHWxRqA+TJD3gcQepEJPm5CIsZ9/nqMZiOoDYpgtABrnfM+ByvULqOgIJKp/iXffjvBu
	0MAbpAW+MKZpJcN5YvIB3CjU3ntSX0ITfDvWZMLJoD4FpJuRIPGSPzBy1X0oNSQJJEpjGGn4RRH
	l4MlZAL0m6ss//IOoTIIg4t4OuahUU8g9aerXXUZ
X-Google-Smtp-Source: AGHT+IEm67iW/Xqavr2zwJHKyYkI6TyYRnWHRJjkGEQPzG5cD2ulBp5+uUmDAnwvpEXTbCLGEuqqykAl0c5+Aoofk3o=
X-Received: by 2002:a05:620a:29c5:b0:89d:3c52:558a with SMTP id
 af79cd13be357-8a8e4fef3bemr646255685a.54.1761783812649; Wed, 29 Oct 2025
 17:23:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD-Ua_gfJnQSo8ucS_7ZwzuhoBRJ14zXP7s8b-zX3ZcxcyWePw@mail.gmail.com>
 <CAD-Ua_imV_eB3uYAbZV=AWaVMPMM4CpqzmYFDN7AvJs5q1yg_g@mail.gmail.com>
 <099ba5b9-600f-4604-94c4-781d4d91b091@amd.com> <84d6bd41-64ff-4380-ad87-54cfbb5bc1a0@gmail.com>
 <CAD-Ua_iHZtBJFXjBytXEhBwS9tJ79JUA7EB911hUZ0=OyoyLDQ@mail.gmail.com>
 <29af4c8f-e93b-49da-ad22-f5641f0046bb@kernel.org> <CAD-Ua_hYxHWa_rQWC6-2kMw4pXWt1fkdJT06AWeTZUbBFT-HDA@mail.gmail.com>
 <98d440b0-92b5-45aa-a42b-89dd5a243bae@kernel.org> <CAD-Ua_g+ifUOoJORoBiypgk3v4ynTjw=nvmoK6DJg2h-e7aXEQ@mail.gmail.com>
 <b6462189-5de6-4297-8d10-fce795c38ceb@amd.com> <2146bd06-a1ef-4668-ab34-f00172257424@kernel.org>
 <CAD-Ua_ixbf1ApMPMMSner28-fRg7BuhTu3QSw1U=ozqgS9fUjQ@mail.gmail.com>
 <6f81529b-7ae6-4d63-b0f3-7787a668698e@kernel.org> <CAD-Ua_hAxj5PskiFdiEA7Qt1bWEhKRvCNAyQj0BQmZ2vDnV4aQ@mail.gmail.com>
 <089b2cca-4c84-47b0-a96a-0363ffd642d7@amd.com> <CAD-Ua_gxPsTbG_3shtqAZX_E4ns5hHPZbTszQAXH2jbfLxP_Rg@mail.gmail.com>
 <eee498d1-6c12-4988-9a70-1e108848da62@kernel.org>
In-Reply-To: <eee498d1-6c12-4988-9a70-1e108848da62@kernel.org>
From: Lars Francke <lars.francke@gmail.com>
Date: Thu, 30 Oct 2025 01:22:55 +0100
X-Gm-Features: AWmQ_bk6qykGIEL4ywxj5JErAi8nhP4CermQkJGDf5h7_dQYzJaXmhWZz6TsgZo
Message-ID: <CAD-Ua_hX_PYxYUfFDcTv3R4pV0s5ninRSK+-1zxtttMhSPoQtg@mail.gmail.com>
Subject: Re: AMD PMF: CCP PSP fails to reinitialize after hibernation causing
 TEE errors
To: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	John Allen <john.allen@amd.com>, platform-driver-x86@vger.kernel.org, 
	Patil Rajesh <Patil.Reddy@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 4:38=E2=80=AFAM Mario Limonciello (AMD) (kernel.org=
)
<superm1@kernel.org> wrote:
> On 10/28/2025 6:45 PM, Lars Francke wrote:
> > On Tue, Oct 28, 2025 at 6:12=E2=80=AFPM Shyam Sundar S K
> > <Shyam-sundar.S-k@amd.com> wrote:
> >
> >> Can you try the attached patches now?
> >>
> >> First patch is the same which Mario shared last time and the 2nd one
> >> is on PMF to handle the .restore() callback for hibernate.
> >>
> >> I have tried this on 6.18-rc3 (though this should not matter)
> >
> > I just did and I'm afraid that the patches made it even worse for some =
reason.
> > Hibernate works but when rebooting I end up in the console, the cursor
> > is blinking but I can't do anything - no keyboard input, nothing. And
> > what's even weirder is that after a reboot I have nothing in my
> > journal on that boot. Not a single line. I have no idea how to debug
> > this behavior, sorry. Usually when my patches broke the system I would
> > still get logs. If you have any idea what I can do to debug let me
> > know.
> >
> > Thanks,
> > Lars
> >
>
> FWIW I tested Shyam's PMF + my CCP patch and didn't observe this behavior=
.

Thanks. I tested the patches on 6.18-rc3 and I observed the same behavior.

> Can you please add this patch and see if it improves things?
>
> https://lore.kernel.org/linux-pm/5935682.DvuYhMxLoT@rafael.j.wysocki/T/#u

I tried this as well, didn't change anything.
I'll try again in a couple of days with various combinations of
patches just to make sure that I haven't made a mistake.

Lars
