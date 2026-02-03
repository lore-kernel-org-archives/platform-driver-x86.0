Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B8330DEC6
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Feb 2026 02:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770086457; cv=none; b=ep/oZgmCeSUvTzQDyNuxP+HH76198+vdXz68qW+ufoaj5U52/3pgnz0QBFRr+f0+jFVk6Es+RwpZCQw3C/KUBYvjB+hU1YdjeDH2mPby+1H3YWpVWSi5ZynI1DZU0hfv1o5uJG21AF3GRn6Rk2QB5XV7Lqsb3x39MrNjgyzsoFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770086457; c=relaxed/simple;
	bh=ndaXLIpsmF2vxSgB6X+oRj8aKFBYdVhhWSbAd6S4LNI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Jl3tj4diYnJ2OgnMh9ejUf4JKevEirsaz0FSuAveOx02mT2pm+A2zIKSA6gTAsVtlFje8PVhCN+hfDL9b0PviBnLlViQSXBCMxEmL3FWHwCTzQgNLtfTQ+yGCiomaFiP3cil3zrsK41F5kX1aeJIZGK+l5O24pEzw/6KR3mLej4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N9I6rN3C; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N9I6rN3C"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-560227999d2so1937685e0c.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 Feb 2026 18:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770086455; x=1770691255; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KsqYKO57kcaexHTzdufWdg6k5lDbRhwfeK1kutGLUV8=;
        b=N9I6rN3C+xdyq9S8fRz+kcx8LJWyskEpmJmDVr1pqvBVRzJsbJcxk7GdDAbrtUD2Eb
         mmLqviafH55lgh2SpiyMqSADR5MUOGEet0iHFtQFHznrBvoU3k+hLaQLhPnns7VeBl8j
         NZ8kpJBUTo7A5H0ovqBTL1ZQ2MfFHBqXWCu/mE2sbQ+AyWxnRGZsYuDNhPX8QOj6WDuw
         9puM8coAabY2Yzh7mGrae9xs38AUlJbfb0NDM43Tj8qKYa6erotQrPUgAz8KBJe3xg1L
         xXnylNwdfn7D/5tOC3HeiTAN1cAX7VetWOU7WoAA9KK6c6bm5yryqKmNC7UODbid7ij1
         q9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770086455; x=1770691255;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KsqYKO57kcaexHTzdufWdg6k5lDbRhwfeK1kutGLUV8=;
        b=FNG64MoJbObXshhpk2HWVrSQD7FmHfpd0W56crmksL1SVNjyDPInda+yS31CovqNke
         C4eHmg+dVKlx9uVFwtXulSnD7QNMZLFiizUIaVz/Vz4pOEfg+MHtrQtNa5hEDc9w7Us3
         OivwXbqeIY5cTVc27trPzL6aMdXz6282RK1E31Euq6q8AW4YA04ZeZRSCXp9Q55doPuS
         A8KMcAcVpKTkKG1u0JExA0XLuyKYfXGJHA62FoSDExUEmlIjF+5KouVodnFxvh+/2n2V
         Skup/M1RTwtxxY8JLwYFf+bwcb8I3ADMoOTz6YTdBrRo/kbS5dggzNev6PqXz0DHWqX9
         fP0w==
X-Forwarded-Encrypted: i=1; AJvYcCWY7hld45x0RYW/fCGF1hHk0EGHWQen93XbSoGtx78qzTAGUPUsTICUybnIHdEumrhkeMWkSxYJ/tG+KooPNQKu8F7d@vger.kernel.org
X-Gm-Message-State: AOJu0YzVweeOG+p/7bFW7R0zMBujAhU92KTIeH0t7ZbnM8O5MfhnD8Nc
	2/870yGu/NgB0tw9brTdh6rPeJh0B666bA9h4ROrsiipHd5MDLn/Jdj0
X-Gm-Gg: AZuq6aLCyOLihDgNc3FEyLEIBNa9ehfwBlm1rc+M/Qcwx0Gmvy7HCgGwzJr2oDEgLPv
	RGFja0Yiv90/ymzrkA3dJ0RBzTCRhfydXtnakhR2B1FvlMvdbD+OgOrzIhpL3WR3vRhB82UxwOL
	sCzy0eplzKYYjdPwllNYTVHVOUCvRVcIGryFV8k36aoOqoocApAluW4Z1MbeOf/bBUJ1026V2/4
	Bz4nCAuKnHuvafEcjMqRzrZ1CiWKmwiL/JWOdM6aiMQHFwLJRWwN+p01edpQVAZ3kwRzq+4HLRB
	XwZJn3sYTNMRSY9cYB2PR6cX9TkFmuZ7LIgM9WjaAcgKQYE6ZprKobUeZIq0RXK0/npFIiAf6MG
	Pll5cOffI05WsJED3ns9SBSOfneks3KKHDMiw8tUwGTLRWibIMFmsujUPQ4QN4vAm3odnzufHMl
	NgPg==
X-Received: by 2002:a05:6122:1692:b0:563:702b:e2a7 with SMTP id 71dfb90a1353d-566a01437b9mr3665059e0c.19.1770086454761;
        Mon, 02 Feb 2026 18:40:54 -0800 (PST)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56685b015e5sm5611567e0c.3.2026.02.02.18.40.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 18:40:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Feb 2026 21:40:47 -0500
Message-Id: <DG4ZA0AFOSQI.J5EJQMPYPV7K@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-wmi: Add audio/mic mute key codes
From: "Kurt Borja" <kuurtb@gmail.com>
To: =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, "Kurt Borja"
 <kuurtb@gmail.com>
Cc: "Matthew Garrett" <mjg59@srcf.ucam.org>, "Hans de Goede"
 <hansg@kernel.org>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, <platform-driver-x86@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, "Olexa Bilaniuk"
 <obilaniu@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260201-mute-keys-v1-1-825e786732fc@gmail.com>
 <20260202081247.vpvbsapdrynr7vtf@pali>
 <DG4NNLOA8MJI.35V2HGOFN3RM8@gmail.com>
 <20260202174322.x6fr4atrx5vulxt7@pali>
In-Reply-To: <20260202174322.x6fr4atrx5vulxt7@pali>

On Mon Feb 2, 2026 at 12:43 PM -05, Pali Roh=C3=A1r wrote:
> On Monday 02 February 2026 12:34:19 Kurt Borja wrote:
>> On Mon Feb 2, 2026 at 3:12 AM -05, Pali Roh=C3=A1r wrote:
>> > On Sunday 01 February 2026 23:37:37 Kurt Borja wrote:
>> >> Add audio/mic mute key codes found in some Alienware devices.
>> >>=20
>> >> Cc: stable@vger.kernel.org
>> >> Tested-by: Olexa Bilaniuk <obilaniu@gmail.com>
>> >> Suggested-by: Olexa Bilaniuk <obilaniu@gmail.com>
>> >> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> >> ---
>> >>  drivers/platform/x86/dell/dell-wmi-base.c | 3 +++
>> >>  1 file changed, 3 insertions(+)
>> >>=20
>> >> diff --git a/drivers/platform/x86/dell/dell-wmi-base.c b/drivers/plat=
form/x86/dell/dell-wmi-base.c
>> >> index 28076929d6af..62cf28d1fe19 100644
>> >> --- a/drivers/platform/x86/dell/dell-wmi-base.c
>> >> +++ b/drivers/platform/x86/dell/dell-wmi-base.c
>> >> @@ -86,6 +86,9 @@ static const struct key_entry dell_wmi_keymap_type_=
0000[] =3D {
>> >>  	/* Meta key unlock */
>> >>  	{ KE_IGNORE, 0xe001, { KEY_RIGHTMETA } },
>> >> =20
>> >> +	{ KE_KEY,    0x0109, { KEY_MUTE } },
>> >> +	{ KE_KEY,    0x0150, { KEY_MICMUTE } },
>> >
>> > Hello, please keep codes in the array sorted.
>>=20
>> Hi Pali,
>>=20
>> I thought I sorted it... I'll fix it, thanks!
>
> Before is value 0xe001 and your new values are 0x01xx. Most of values
> are 0xeXXX, so it is quite unusual that Dell allocated values with
> different pattern.

It is a bit unusual but it corresponds with the user report

	dell_wmi: Unknown key with type 0x0000 and code 0x0109 pressed
	dell_wmi: Unknown key with type 0x0000 and code 0x0150 pressed

and I also checked the acpidump.

>
> Also, could you please include into commit message for which Alienware
> devices is change needed? It would help to detect devices which will be
> fixed by your change.

Sure, the model is Alienware m18 r1 AMD.

I said "some" in the commit message because it's very likely other
Alienware models also use these codes.

>
> And please add some comment into source file above those two new codes
> for which are needed, in similar way how we have commented/documented
> other key codes.

Ack.

--=20
Thanks,
 ~ Kurt
