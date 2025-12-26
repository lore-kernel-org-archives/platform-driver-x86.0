Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0018B2F5A32
	for <platform-driver-x86@vger.kernel.org>; Fri, 26 Dec 2025 20:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766781469; cv=none; b=llacTnSzJ6lCIGpuEfoFyFDXMhQ2hFmhZNOM96/PJTTQjVXsbr9pjQAcK5Q/2Tpr/pPHmCNntsjprVxBlYyAOZPC27xYYLfiXXbn7TzKW9lugOEsnkgh5YBlxoi5zpOYDVjPVTeSx6b4WkVrf30wBF2sQe7G3lIVCidU2KRDgzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766781469; c=relaxed/simple;
	bh=s/KVVzpn5tfrVfUqQILEJpmVp2j7KLekvYfPsh0bjP8=;
	h=Content-Type:Message-Id:From:To:Subject:Date:In-Reply-To:
	 References:MIME-Version; b=MvXWdJVz2aeX7ZtHZ/9YO/1iZSthv1djaJkCXAcbbvXm5Wn2IDFTmO92PS/WsoYRn/SvQbLzYd6CvKzRLVjMDwtuSl0pBXL9xHx0JwPlR1ma+7TKQaFSxBfZs2htlhg4Ys+CWIA8CwYqh8ododu9S4mmldFEcfY+fQSMS1wfHhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lB4jZRgU; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lB4jZRgU"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4779c9109ceso6185825e9.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Dec 2025 12:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766781465; x=1767386265; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:user-agent:references
         :in-reply-to:date:subject:to:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBgm/q5c8oRQdA4cw4eFy9cmIf/nksRHAM4xaBKkolY=;
        b=lB4jZRgUkLplazOf9D1YL/5V/loeaDpCqYZcMgDvjy+PlwPlHlGSZ/+aGWKNVZHHSH
         q1psls3+D1H6DUOKR1uq6YD2fmiCrIQshDPuz55OwRS90mZppBxio7Bin/CTgM9Hfy7q
         9n57NDNdBSreU6JuT8w0iG8gNCiwDnZMRPLSxBOWOhTSdo+uqaMpiWgJVvqnbyJkCUJl
         Ji2EF4yU/5N92MpXJpAHsgzoAiBeI0zKRpUhkcK2FbRFDspjKi4MAPS9895DPAz9HKwO
         BuRxdOX92UK4hDQEWI4QOIWtlEv/ggVQtz702WIltr7zFVZq779gagCyhQzY10ZCFwSl
         7kXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766781465; x=1767386265;
        h=mime-version:content-transfer-encoding:user-agent:references
         :in-reply-to:date:subject:to:from:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jBgm/q5c8oRQdA4cw4eFy9cmIf/nksRHAM4xaBKkolY=;
        b=eAJ+6TcJWp5wzHhFdAI5GXMylA+YSU/CxAJsEAyFKCQIL3GLKXDGYEK/R6tJ272hN8
         Wutfi15oG1yjj8bvBFjU7m8GLWMMWaRy5gmo4SvXlBlp2C5UcYKMxt7R9O+vvH0CL9aK
         00CNwCGzGXWalu3Zh3D2nOdIkzhRIWJA3MfT4p5cxFQB1AvOewm6DAoVtwHrHVJb+J3j
         ARPJ8A3O4Woag7tVrcGJPXq4tcUz4vwpXuRcczg2eM/Dug1c2R7/hshYsiowJRRj+02x
         MbXpSz7h0bC1ajBEssWNBeA2wZW1cocspHyXL7YP8o0uf/mOZIgNeg57QnOYLmTPnGzg
         K1ZA==
X-Gm-Message-State: AOJu0Yw9GOu/GEVIsubR/Q7W61DMBvLTrzCiSbG8rYU4FbWnq0oXmo63
	EygdIs42b9cW5MMt+mk6XjXUz1998tpoB7bOPiDt35RbKiWi97vbzavtekieJdhMTSE=
X-Gm-Gg: AY/fxX6NcccOX0mgUpV0XpYk75yuh/Hd5IfbbgZSgURdRhc4dtuZo6Dq+vhpcVEXY5y
	wvOj5Ab5f2dzjkOPP74xZm951uIRlCsxUM2snKwxazm583ZmCNDji+pu1RMQfrCVvv0R+iF0Ym6
	5c7AkUyJ3ve9dq30Y0XMY/h281q//4ypTRRA47Q97H8gEuHJ6/Cd11B+/21UkXoVn2OyivNNCDk
	AILVQ3VwilKtOEX+ZnwohGiwP5Yfw8nL7m7D67LUmeKpmDPwe75glsdzBNtQXC5qDhsZw+cBBFU
	Ynb5EK5hQF415/h9bRgq/EHE027krM51qMYSlir9+TUbwBXAQk7ICzFhPiyqsbSBiXTmz1Tw01K
	LhUXi5SfutouUMlgagdhNhg89tXZ/JkYy8U/8J6KM5fdW2CUdS7DoNoZ3q0/4aDHYD3CoQtixbN
	zSR/S4qBBfu7Pc
X-Google-Smtp-Source: AGHT+IGN0Ow8+eOlpIlWhfxVE0XDvCurE31rNn+ctzFAAD/hIJPl6/fsrJUrfQqdAPnpBwF9xF0i/A==
X-Received: by 2002:a05:600c:3151:b0:477:a203:66dd with SMTP id 5b1f17b1804b1-47d197f69demr167715395e9.2.1766781464853;
        Fri, 26 Dec 2025 12:37:44 -0800 (PST)
Received: from noip.localdomain ([2a03:a900:1000:22b1::9d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2ebfsm46733391f8f.40.2025.12.26.12.37.42
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Dec 2025 12:37:43 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Message-Id: <1766781371853.1837395511.4224584554@gmail.com>
From: =?UTF-8?Q?Tom=C3=A1=C5=A1_Hnyk?= <tomashnyk@gmail.com>
To: platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: lenovo: Reassign KEY_CUT to
 KEY_SELECTIVE_SCREENSHOT for Ideapad laptops
Date: Fri, 26 Dec 2025 20:37:42 +0000
In-Reply-To: <219e020c-11e8-fdea-0ad6-656101999e88@linux.intel.com>
References: <219e020c-11e8-fdea-0ad6-656101999e88@linux.intel.com>
X-Mailer: Vivaldi Mail
User-Agent: Vivaldi Mail/7.7.3851.61
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


Hello,

On Monday 15. September 2025, 12:11:48 (+02:00), Ilpo J=C3=A4rvinen wrote:

> On Thu, 11 Sep 2025, Tom=C3=A1=C5=A1 Hnyk wrote:
>=20
> > This key is produced by FN+PRINT_SCREEN and as per Lenovo documentation=
,
> > it should be "Open the Snipping tool". This corresponds to
> > KEY_SELECTIVE_SCRENSHOT, whose keycode is 0x27a. Previously, keycodes
> > under 248 were preferred due to X11 limitations, so KEY_CUT was used.
> > This is now being corrected.
>=20
> Hi Tomas,
>=20
> Thanks for the patch.
>=20
> Please use "platform/x86: ideapad-laptop:" as the prefix for shortlog =
and=20
> remove "for Ideapad laptops" as prefix already covers that information.
>=20
> I'd rehrapse the commit message to something along the lines of:
>=20
> As per Lenovo documentation, Fn+Print-Screen should "Open the =
Snipping=20
> tool" which corresponds to KEY_SELECTIVE_SCREENSHOT (keycode 0x27a). It
> is currently assigned to KEY_CUT because keycodes under 248 were
> preferred due to X11 limitations.
>=20
> Reassign Fn+Print-Screen from KEY_CUT to KEY_SELECTIVE_SCREENSHOT.
>=20
>=20
> Note also there should be double E in SCREENSHOT.
>=20
> > Signed-off-by: Tom=C3=A1=C5=A1 Hnyk <tomashnyk@gmail.com>
> > ---
> >  Fixes https://bugzilla.kernel.org/show_bug.cgi?id=3D220566
>=20
> Fixes: (note the colon) tag should refer to a commit you're fixing =
with=20
> this patch (not really applicable here). It also has a certain =
formatting=20
> requirements which are explained in Documentation/process in case you =
need=20
> to use that tag one day.
>=20
> Closes: is the correct tag to use for bug tickets so please change to=20
> that.
>=20
> Also, please place all tags before your signed-off-by line as anything =
you=20
> put after --- line will be automatically cut by maintainer tools.
> =20
> >  drivers/platform/x86/lenovo/ideapad-laptop.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c =
b/drivers/platform/x86/lenovo/ideapad-laptop.c
> > index fcebfbaf0460..556d50fb7996 100644
> > --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> > +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> > @@ -1328,7 +1328,7 @@ static const struct key_entry ideapad_keymap[] =
=3D {
> >     /* Performance toggle also Fn+Q, handled inside =
ideapad_wmi_notify() */
> >     { KE_KEY,   0x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
> >     /* shift + prtsc */
> > -   { KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_CUT } },
> > +   { KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_SELECTIVE_SCREENSHOT } },=

> >     { KE_KEY,   0x29 | IDEAPAD_WMI_KEY, { KEY_TOUCHPAD_TOGGLE } },
> >     { KE_KEY,   0x2a | IDEAPAD_WMI_KEY, { KEY_ROOT_MENU } },
>=20
> This patch is corrupted by spaces. (This is a quite common problem, =
no=20
> need to apologize).
>=20
> After fixing the forementioned issues, please send v2. You may want =
to=20
> try first to send the patch only to yourself and try applying the =
patch=20
> you received from yourself to check that nothing corrupted the patch =
while=20
> sending it.
>=20
Sorry, I completely missed this e-mail back in September. I have just sent =
version2. I first tried to send it to myself and it applied. I also fixed =
the commit message. I hope now everything is ok.
Tomas
