Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D8A302756
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Feb 2026 07:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770361872; cv=pass; b=GaEN68XT20dNL7UeKYFEM8qrXZxSpw1pOJvARxxXLvLe9R8QeuG3FJkJaIRdAFhpo5lCqG9NTQvk1WPJIsQj4CLqUBU+L8HkYB2OLSs1fnBa2ZUJ37KUoHuJXxmWg6mhlUGvjtF2IhFlOxBhOA1+xN5aCfFE+9Ii72K26mcDxiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770361872; c=relaxed/simple;
	bh=GxefqRyblWFN4bgmmK4FMFdWq2Bn7NV8bG2YwBO5oT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RUbcEY0AlaRMv9SuBQ4hNtxQSdx2zlNKvavm1ky1jNye9P5CNOv7Dxeg5e9/bAGKY7PtriOh22MT9EXeDgFRFqWYIbSKjGknIk3XgLG6d/oDHaq1y4scXThNg5ehtSy4FkDfddD+qDwmkUn7/sFap+e/lfpxe9bzwYnw3IwNOa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/If31s4; arc=pass smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/If31s4"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-895071c5527so5204076d6.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Feb 2026 23:11:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770361871; cv=none;
        d=google.com; s=arc-20240605;
        b=hDxMTfEFAUVw/XFQYeil9kJQka4ZC+7h6GfY09cRC9U4iPNBxjOeUCgmZtR5IVR9cg
         BAxJNj9Y4kMgvH6DWAa/SXLD0QuoqBAOO9g1hmvZ5+L0o24SQznrzlJPnbVc3DplmSiQ
         /MsmxooN24p7H6R1fIc2YRXPIHmlJUg30PsZDMPwYL0FsG0T+UIxH6bTUz9xAy7+90qg
         F5883ypkG3xvwlT76Tx5445jJ/EU8fgSwu/w/vlCwHKQFnx4oAaLjNbmxiR+H4TLGuR6
         IhRKlEm0snAtfdYXer68NT3eq9Dt6bitFNwtCiUB2WbAnsWAHYroO5wP8knk8gonQrN3
         5+Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4C3DhmX/fVbaJeN2CgmpsaOs/IQj0eyWcKUbiVgqAkI=;
        fh=HhPA0SbPYBYHCn3TmchYXKWP8yU6WXmDbKKDvZBfFRk=;
        b=dRd7Of0WBGGaItcHe5pTPYW+bgOAj2uix+RtTl/aFmqn+KlxihbaVPNlB5Pa4kGmR+
         8DxdNflFAyBM/wJ53IOiLMwxyADoRqWc/cb5J546t+bDEwScwh6y/LQ/W93PIe6zBLpC
         /zZNWOPdzzY/nipL4ej72M+jeeuXdhbQ24HCLsQolCujtmm4Ov3Xlnq94Cq+SdTn+x+U
         VTW65A49BqfyDukMx4CWiCmP6xxg28OJZ+3IuXCk8se/wTiBvs4a/S0Wx1/t4ra59Kf/
         ho0fvC7Zc/KzdngoIhhm+TsEjCiAoeEeESuZ0CVC5ye5t7GFcazKc9TjDKG0eJgFHMLq
         Hl3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770361871; x=1770966671; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4C3DhmX/fVbaJeN2CgmpsaOs/IQj0eyWcKUbiVgqAkI=;
        b=G/If31s4qeWPaB9maWITwKqiEnS+u33Vm01Bbn2YwT9sn3Aup3oWToeDYPniFjZpzg
         36OZBMvNg5xQu/5eQOGvEM9wd4VI8XpYyJMmoEyfto3Bk0VFtf7kzDYbo4vowP4hZLd4
         SFQfMFruFogGh8uApOCk9P9pYhmEuFqq5AvhQZu0mH30M7LXGKmLb0J89BT+uwg8D4Al
         /OQR2RyJl86PJ7TDmDb8KQzjEDNomQhI5Eg+SLalyqR/oZrF+4ifG4lokkIpHQucr4fm
         340/vA4Wo+hMRQ1aAtq96+LGAq1Eu1VPw/G+UGxLO+43whdQAuFQrfzw1GPKNFtRZvd7
         WIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770361871; x=1770966671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4C3DhmX/fVbaJeN2CgmpsaOs/IQj0eyWcKUbiVgqAkI=;
        b=WtrNrqfsKEGy7ggChB56GhEVc4rGar2J+CugLVZpGPUG3/phcUKFwFMJPeDEdndQgl
         WILu9pMSM3GA/41qdLpN6fHKD5DJLrVfW3nrJhJ2PJzvoCj9sl5ECu38doUbLKiwviRg
         Lzj3ds5mYxk/gS99+pxJIk+qXmb/y+jbGGVpKoaYd9C7rTuioDFDdOV6IDuFBMoXJd0v
         Y33OhkUh+/CmFLg4giIeoFbv81nfmb9uvjoTSiCVYWTyrqavQfsrdetCHvyUvOVR066W
         1e/2Ua5W+sHxNQgjeHl7x4Z6095c1XZQsPtUHa0hKu5Af2I4Pz8JSRQVscSJeS++ChIk
         FaUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH9FgM5qYEje+/K6+Nah7IwyES1pSuwZ0W10CVr9/Eb3/kiCs0P97t5qEuRgS80qYwl1BMzUFrpkKskBlBzV8VMjIm@vger.kernel.org
X-Gm-Message-State: AOJu0YxqMamLHVGwBaPh4bAdiOIM4AHltSK2YroEp0r4qFN8u93baAPq
	geZqgijGSW5hSzpPT8dApSpKAzd9LB196SeSALHwpiXARX1y0D1bV7RSgq+v41mbpq1CjzNbsCq
	zdO4xtNlNZf7NP1pgV+qA/srTwtbx8N4=
X-Gm-Gg: AZuq6aK8/aR8R9NwS0wjrwwubeX4y7l0jxgLDbTweuZxwo4JzpXG6fqAmbjrJ9Z1uiT
	echZtFJ2ZUc4H6hF4hEs8bJZoOoXjHF9+M8B69+O0ET9BV27etFb7QtmudUrHobb4CYjcnXoLNw
	OLFGfa43BRmizWgu3YWiI/uSHKjodzwVBVZVLuSpMakepISoo2ZRv5eGqY+ITFRF9LKfMeAKCC1
	09o1HWOJp5fqAHCDKNaNc3Se3r2DQJxUDW4h+cNHBZeH0UeLx1zBMUufduBqqMRA/2j9Ojn
X-Received: by 2002:a05:6214:2266:b0:888:8913:89af with SMTP id
 6a1803df08f44-8953c7df95fmr26147696d6.15.1770361871317; Thu, 05 Feb 2026
 23:11:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DG60P3SHXR8H.3NSEHMZ6J7XRC@gmail.com> <C18EFC0C-741A-4DF3-85A9-E3DE9CBC1737@gmail.com>
 <DG6BU3U96TTS.1XNHFL5NRADT5@gmail.com> <4C43FF8D-A529-4645-93E8-DF5E6734328A@gmail.com>
 <DG6KJR1FONK7.2TL5QSPZ2A4GA@gmail.com> <CAFqHKTn=0JS3jcp7FKYvfTHzG5u1kXXtavSK9hNEphagDiDdgA@mail.gmail.com>
 <CAFqHKTnpGTRuW=HMxSu2YQ9qq7inajXOT6p3Vpc8sg0v_EGQQw@mail.gmail.com> <DG77O19JWSAH.2TC5GU5CR5U5H@gmail.com>
In-Reply-To: <DG77O19JWSAH.2TC5GU5CR5U5H@gmail.com>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Thu, 5 Feb 2026 23:11:00 -0800
X-Gm-Features: AZwV_QjbW-QX5PFqBJr6WJjGfaVTedykYtvjcQrcGSTD_xO6BRP1WyYrEyVfsMM
Message-ID: <CAFqHKTkHhx14rM7QTATLTq-ry1z53+D5h1y982gaBd+RbMNJAQ@mail.gmail.com>
Subject: Re: Report: lenovo_wmi_other FW attributes always read 0
To: Kurt Borja <kuurtb@gmail.com>
Cc: Rong Zhang <i@rong.moe>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Armin Wolf <W_Armin@gmx.de>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 9:40=E2=80=AFAM Kurt Borja <kuurtb@gmail.com> wrote:
>
> On Wed Feb 4, 2026 at 10:13 PM -05, Derek John Clark wrote:
> > On Wed, Feb 4, 2026 at 4:04=E2=80=AFPM Derek John Clark
> > <derekjohn.clark@gmail.com> wrote:
> >>
> >> On February 4, 2026 3:33:34 PM PST, Kurt Borja <kuurtb@gmail.com> wrot=
e:
> >> >On Wed Feb 4, 2026 at 12:45 PM -05, Derek J. Clark wrote:
> >> >> On February 4, 2026 8:43:56 AM PST, Kurt Borja <kuurtb@gmail.com> w=
rote:
> >> >>>On Wed Feb 4, 2026 at 3:36 AM -05, Derek J. Clark wrote:
> >> >>>> On February 4, 2026 12:00:12 AM PST, Kurt Borja <kuurtb@gmail.com=
> wrote:
> >> >>>>>Hi all,
> >> >>>>
> >> >>>> Hi Kurt.
> >> >>>
> >> >>>Hi Derek,
> >> >>>
> >> >>>>
> >> >>>>>In my system (83KY Legion 7 16IAX1) the current_value of any of t=
he
> >> >>>>>firmware attributes exposed by this driver always reads 0
> >> >>>>>
> >> >>>>>   $ ls /sys/class/firmware-attributes/lenovo-wmi-other-0/attribu=
tes/
> >> >>>>>   ppt_pl1_spl  ppt_pl2_sppt  ppt_pl3_fppt
> >> >>>>>
> >> >>>>>   $ cat /sys/class/firmware-attributes/lenovo-wmi-other-0/attrib=
utes/*/current_value
> >> >>>>>   0
> >> >>>>>   0
> >> >>>>>   0
> >> >>>>>
> >> >>>>>After investigating my acpidump [1] I found that the argument pas=
sed to
> >> >>>>>the WMI method Arg2 is matched as a whole integer instead of indi=
vidual
> >> >>>>>bytes (L: 49203)
> >> >>>>>
> >> >>>>>   If ((ToInteger (Arg2) =3D=3D 0x01010000))
> >> >>>>>   {
> >> >>>>>           Return (^^PC00.LPCB.EC0.F5E0) /* \_SB_.PC00.LPCB.EC0_.=
F5E0 */
> >> >>>>>   }
> >> >>>>>
> >> >>>>>   If ((ToInteger (Arg2) =3D=3D 0x01020000))
> >> >>>>>   {
> >> >>>>>           Return (^^PC00.LPCB.EC0.CCP1) /* \_SB_.PC00.LPCB.EC0_.=
CCP1 */
> >> >>>>>   }
> >> >>>>>
> >> >>>>>   If ((ToInteger (Arg2) =3D=3D 0x01030000))
> >> >>>>>   {
> >> >>>>>           /* This case (CPU FPPT) is actually just zero... */
> >> >>>>>           Return (Zero)
> >> >>>>>   }
> >> >>>>>
> >> >>>>>...and the driver always sets the second byte of Arg2 to the curr=
ent
> >> >>>>>profile (mode), which is never zero!
> >> >>>>>
> >> >>>>>   attribute_id =3D
> >> >>>>>           FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device=
_id) |
> >> >>>>>           FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->featu=
re_id) |
> >> >>>>>   -->     FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
> >> >>>>>           FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_=
id);
> >> >>>>>
> >> >>>>>So it never actually matches the attribute and falls back to zero=
 :/
> >> >>>>>
> >> >>>>>This is however, not the case for all tunables. As you can see in=
 the
> >> >>>>>acpidump, just bellow the block above, these are matched dependin=
g on
> >> >>>>>the current mode (second byte)
> >> >>>>
> >> >>>> This typically means that the method is stubbed so that it return=
s 0 on is_supported. During development I forgot to go back and add a check=
 for this when adding the attributes. Per the spec, there is no profile tha=
t corresponds to 0x00, so this is working as expected when showing an unsup=
ported attribute. If you add a debug print to the capdata driver when it is=
 querying the attributes you can see the entries are empty.
> >> >>>
> >> >>>Hmm it's weird because if I read
> >> >>>
> >> >>>     \_SB_.PC00.LPCB.EC0_.F5E0
> >> >>>     \_SB_.PC00.LPCB.EC0_.CCP1
> >> >>>
> >> >>>directly, they show the correct SPPT and SPL values shown in the wi=
ndows
> >> >>>Legion Space app (under Custom mode).
> >> >>>
> >> >>>It seems like these are supported?
> >> >>
> >> >> Oh, that is strange, yeah. It also explains why some things just ar=
en't working like they should. Once again the documentation is not complete=
ly accurate for this interface, which is quite frustrating... I think I hav=
e a device with this problem as well that I haven't yet troubleshot in the =
new series, so I can work it locally.
> >> >>
> >> >> It sounds like I'll need to check if the current mode entry is pres=
ent in the cached data, and if not check if there is a  "no mode" present. =
Traversing the list twice seems tedious & slow, so I'll probably refactor t=
he capdata side to check for a match in bytes 0, 1, and 3, and if byte 2 is=
 0 in the data then return that, but if it is missing continue to search fo=
r the match? They have historically been in ascending order (though, at thi=
s point I don't know if that can be trusted) I'm curious if any devices hav=
e both a 00 entry and mode specific entries, because that pattern would pos=
sibly break them. I could perhaps save the index of the 00 entry separately=
 when it is seen, then keep looking for the exact match and, if not found, =
fall back to the saved index. That guarantees a maximum O(n) search every t=
ime, which isn't great either.
> >> >
> >> >I checked the captada buffers in my device and the "mode" byte is nev=
er
> >> >zero :/ In fact every tunable is listed once for each mode, which I
> >> >think is just normal behavior.
> >> >
> >> >Can you send me an acpidump of a device which enforces the mode byte =
for
> >> >each tunable? I want to see how other devices do it.
> >> >
> >>
> >> I attached the Legion Go 2 acpidump
> >>
> >> >>
> >> >> I'd like to hear everyone else's thoughts, perhaps there's a more c=
lever way we can do this efficiently and accurately.
> >> >
> >> >I think my firmware's behavior is just non-compliant with the
> >> >specification. In that case a quirk approach should work? The only
> >> >problem would be the tunables that DO enforce the mode byte in my
> >> >system.
> >>
> >> I think doing it programmatically would be more effective if we can
> >> get it to work. I'd imagine there are lots of models with random
> >> attributes that behave this way.
> >>
> >> >Another possibility is that there are some tunables that do not enfor=
ce
> >> >modes (but don't necessarily reject them either).
> >> >
> >> >Maybe a workaround for non-compliant attributes could work. Something
> >> >dirty like
> >> >
> >> >zero_fallback:
> >> >       attribute_id =3D LWMI_ATTR_ID(tunable_attr->device_id, tunable=
_attr->feature_id,
> >> >                                   mode, tunable_attr->type_id);
> >> >       ret =3D lwmi_cd01_get_data(priv->cd01_list, attribute_id, &cap=
data);
> >> >       if (ret)
> >> >               return ret;
> >> >
> >> >       ...
> >> >
> >> >       if (value =3D=3D 0) {
> >> >               mode =3D 0;
> >> >               goto zero_fallback;
> >> >       }
> >>
> >> That could work, though I'd do it like this to avoid infinite recursio=
n:
> >>
> >> zero_fallback:
> >>         attribute_id =3D LWMI_ATTR_ID(tunable_attr->device_id,
> >> tunable_attr->feature_id,
> >>                                     mode, tunable_attr->type_id);
> >>         ret =3D lwmi_cd01_get_data(priv->cd01_list, attribute_id, &cap=
data);
> >>         if (ret)
> >>                 return ret;
> >>
> >>
> >> if (value =3D=3D 0 & mode !=3D 0) {
> >>                 mode =3D 0;
> >>           goto zero_fallback;
> >>
> >>         if (value =3D=3D 0) {
> >>     return -EINVAL;
> >>         }
> >>
> >> I'll push something to that effect to my tree and we'll see how that
> >> works. The downside is traversing the list multiple times, and the
> >> need to put this in multiple _show functions. As a proof of concept
> >> I'm fine with it though.
> >>
> >> - Derek
> >>
> >>
> >
> > Kurt,
> >
> > After adding the workaround as described I got some interesting
> > results. The attribute I have issues with in particular is cpu_temp
> > (01040000). This attribute has capdata for custom mode & shows full
> > set/get support, but is hard coded to return 0 in the dsdt. That means
> > this isn't a "silver bullet" to work around a poorly implemented BIOS
> > it seems.
>
> In my system FPPT is also hardcoded to zero :/
>
> >
> > I did go back and recheck the documentation, and all these attributes
> > do have a valid 00 mode in the docs that I overlooked before. It looks
> > like an older version of the spec possibly. The notes are fairly
> > sparse on it.
>
> Is the 0x00 mode actually a mode or just something like no-mode?
>
> I checked the acpidump you sent the SPPT tunable accepts valid modes and
> also the 0x00 mode when reading... that's interesting.
>
> >
> > I updated by branch and also included a few lazy "info" debug
> > statements to help figure out what is going on. Let me know if that
> > has better results for you.
>
> It has! Now all attributes are readable. There quite a few attributes
> with 0 min/max/step values. I guess that's just poorly implemented BIOS
> again.
>
> Here are the results
>
>         $ fwupdmgr get-bios-settings
>
>         gpu_oc_stat:
>           Setting type:         Integer
>           Current Value:        17
>           Description:          Set the GPU overclocking status
>           Read Only:            False
>           Minimum value:        0
>           Maximum value:        0
>           Scalar Increment:     0
>
>         cpu_temp:
>           Setting type:         Integer
>           Current Value:        103
>           Description:          Set the CPU thermal load limit
>           Read Only:            False
>           Minimum value:        85
>           Maximum value:        105
>           Scalar Increment:     1
>
>         gpu_nv_ac_offset:
>           Setting type:         Integer
>           Current Value:        55
>           Description:          Set the Nvidia GPU AC total processing po=
wer baseline offset
>           Read Only:            False
>           Minimum value:        10
>           Maximum value:        80
>           Scalar Increment:     1
>
>         gpu_nv_cpu_boost:
>           Setting type:         Integer
>           Current Value:        10
>           Description:          Set the Nvidia GPU to CPU dynamic boost l=
imit
>           Read Only:            False
>           Minimum value:        0
>           Maximum value:        0
>           Scalar Increment:     0
>
>         gpu_temp:
>           Setting type:         Integer
>           Current Value:        87
>           Description:          Set the GPU thermal load limit
>           Read Only:            False
>           Minimum value:        75
>           Maximum value:        87
>           Scalar Increment:     1
>
>         ppt_pl1_spl:
>           Setting type:         Integer
>           Current Value:        70
>           Description:          Set the CPU sustained power limit
>           Read Only:            False
>           Minimum value:        50
>           Maximum value:        110
>           Scalar Increment:     1
>
>         cpu_oc_stat:
>           Setting type:         Integer
>           Current Value:        16
>           Description:          Set the CPU overclocking status
>           Read Only:            False
>           Minimum value:        0
>           Maximum value:        0
>           Scalar Increment:     0
>
>         ppt_cpu_cl:
>           Setting type:         Integer
>           Current Value:        65
>           Description:          Set the CPU cross loading power limit
>           Read Only:            False
>           Minimum value:        30
>           Maximum value:        75
>           Scalar Increment:     1
>
>         ppt_pl2_sppt:
>           Setting type:         Integer
>           Current Value:        125
>           Description:          Set the CPU slow package power tracking l=
imit
>           Read Only:            False
>           Minimum value:        60
>           Maximum value:        168
>           Scalar Increment:     1
>
>         ppt_pl1_tau:
>           Setting type:         Integer
>           Current Value:        56
>           Description:          Set the CPU sustained power limit exceed =
duration
>           Read Only:            False
>           Minimum value:        0
>           Maximum value:        0
>           Scalar Increment:     0
>
>         gpu_nv_ppab:
>           Setting type:         Integer
>           Current Value:        15
>           Description:          Set the Nvidia GPU power performance awar=
e boost limit
>           Read Only:            False
>           Minimum value:        0
>           Maximum value:        0
>           Scalar Increment:     0
>
>         gpu_nv_ctgp:
>           Setting type:         Integer
>           Current Value:        65
>           Description:          Set the GPU configurable total graphics p=
ower
>           Read Only:            False
>           Minimum value:        0
>           Maximum value:        0
>           Scalar Increment:     0

That is encouraging, at least we're on the right path.

> I still can't write to them though. Every write gets ignored without
> failing
>
>         $ cat /sys/class/firmware-attributes/lenovo-wmi-other-0/attribute=
s/ppt_pl2_sppt/current_value
>         125
>
>         $ echo 126 | sudo tee /sys/class/firmware-attributes/lenovo-wmi-o=
ther-0/attributes/ppt_pl2_sppt/current_value
>         126
>
>         $ cat /sys/class/firmware-attributes/lenovo-wmi-other-0/attribute=
s/ppt_pl2_sppt/current_value
>         125
>
> I tried writting to them using acpi_call and it works (0x7e =3D 126)
>
>         $ echo '\_SB_.GZFD.WMAE 0 0x12 {0x00, 0x00, 0x01, 0x01, 0x7e, 0x0=
0, 0x00, 0x00}' | sudo tee /proc/acpi/call
>         \_SB_.GZFD.WMAE 0 0x12 {0x00, 0x00, 0x01, 0x01, 0x7e, 0x00, 0x00,=
 0x00}
>
>         $ sudo cat /proc/acpi/call
>         0x0
>
>         $ cat /sys/class/firmware-attributes/lenovo-wmi-other-0/attribute=
s/ppt_pl2_sppt/current_value
>         126

This is very annoying. Presumably that means your device is providing
good capdata for custom mode on some attributes? If that is the case
then it will bee very difficult to auto-discover the no-mode.

> Maybe we can check if the tunable returns zero at the discovery phase
> and add some kind of flag there `.no_mode =3D 1`. Then we can check that
> flag when writting the attribute.
>
> It's getting tricky because legion go 2 does enforce 0xFF mode when
> writting, while my device enforces 0x00. Even worse, if I pass 0xFF it
> returns 0, like it was successful...

Indeed, I confirmed my device does the inverse.


>         $ echo '\_SB_.GZFD.WMAE 0 0x12 {0x00, 0xFF, 0x01, 0x01, 0x7e, 0x0=
0, 0x00, 0x00}' | sudo tee /proc/acpi/call
>         \_SB_.GZFD.WMAE 0 0x12 {0x00, 0xFF, 0x01, 0x01, 0x7e, 0x00, 0x00,=
 0x00}
>
>         $ sudo cat /proc/acpi/call
>         0x0
>
> IMO we should check this no_mode stuff at the discovery phase.

I updated my branch to try and discover the GET and SET per attribute
during the is_supported phase by doing the fail loop there, once for
each. I store the modes that worked on new members of the tunable_attr
to reuse if either 0xff or 0x00 worked, and report -EOPNOTSUPP if
nothing worked. If that happens it won't create the attribute at all,
which eliminates showing attributes with botched implementations such
as the gpu_temp on Go 2. That will add a lot of wmi calls on init (up
to 2 per attribute in the config), but that might be preferable as it
eliminates the loops in the _store and _show functions for all the RO
and RW file descriptors. I check the capdata first at least to early
exit if the attribute isn't supported at all.

To summarize the flow in is_suported is now:
- Check if there is a capdata block for the attribute under custom mode
- If that fails, check if there is a capdata block for the attribute
under no mode
- If both fail then return
- If one of them succeed, check if the attribute is supported in the
capdata block, return -EOPNOTSUPP if not.
- set the tunable_attr->get_mode_id to the successful mode.
- reset the mode var to custom, get the current value, and check if
the return value is 0
- if that fails, try again with no mode
- if both fail, return -EOPNOTSUPP
- If either pass, set the tunable_attr->set_mode_id to the successful mode.
- return capdata->supported

Then in the _show & _store functions I can just reuse the previously
discovered mode values. when getting the capdata or setting/getting
the current value itself.

There is some hope perhaps in using the WMI interface version for a
quirk as well. 0x000c0000 "Get BIOS WMI Version" returns a u32 with
bytes 015 being minor version and 16-31 being the major version. If we
were to quirk this then presumably that would have a discernible
pattern. It would require a large sample size to figure out which
devices do what exactly though, which would be less than ideal.

In any case, I've updated my branch with the changes. If that works
for you I'll clean it up a bit and start getting ready to submit for
review. I do have a couple more features to add on top of this issue
so my timeline for submitting has slid right about a week.

Thanks,
Derek

> >
> > Thanks,
> > Derek
> >
>
> --
> Thanks,
>  ~ Kurt
