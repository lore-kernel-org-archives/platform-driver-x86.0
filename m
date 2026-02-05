Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CA33EBF32
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Feb 2026 03:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770261219; cv=pass; b=TOryB9v/Y/qiHTGd/ezzYf449SQ/WFGNFxd5HJJFIL+NAtKGftO58Am9C+HXuzyvQeB7a79xYlEfZdGR1QfoabDWOWnGV+fSZiuFFAEEsoOtmRxNeTCwhwyPuJA+aRnmJA7fwrXL+rcGPBrYzPBpIDvHtrT+meYLFlv+1mlBVWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770261219; c=relaxed/simple;
	bh=S0kEDaN5qjlMaZbAcEIYLJb4zt1C+BWzzuRCa+ZjQmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lpw/0ri3MVyx8m7youUZMNCcN+Z7WuI/rs9qUQoa9uyrC4ojT+AJj3IdzaawEfyetx9yVTeW1roKXiL+nORlcJH0HZMxEv4JOXHAxkdJ1EdCcuNitfv/hplrK6vMyI2iUp7vokwF+tuOpBirKU5R/eb4ORwpW13UTdnRJe9HL7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ch+XmKpG; arc=pass smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ch+XmKpG"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8946e0884afso10797516d6.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Feb 2026 19:13:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770261218; cv=none;
        d=google.com; s=arc-20240605;
        b=G0X98wc2waa6NpF2F4t35aJU5Wbc76rAhg+EjzJo3kWmxSP4twfClQBool2lGsJ/uJ
         AwhWBK1I8AXH5/SxpTqCfNA0VfFwHWn/pcv6h8ld2p8Q77vjlBZCBoPKZIy1fIIqmvI6
         iYdMMmrk0vTtc89Bd/R4Y3NJNnmpDbLcteuEijSM7FBciI3LcB8V9CRy1t0zz8uutEP6
         pddUMeD1rbBwKNCqTW0+cF3HE7ru2fzIkWmxx4rKpaNdDLs4Pl7bOTS2GWOAEQ04IJLZ
         WPKhqp3g6V4u4sO+Q1d/9Cmoku4dsQGgM/slz4ae9O5o5WK1DgYP+Qi7wPL0jo96ykDI
         hGaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Iiwyy8FID2JbQFOI08ZVbSYEcv3SmVgaFXbSxjskpeI=;
        fh=DVhjoea61+60jwuQ19K6D1XZ3DUp/+PMFtwyo3VXgLs=;
        b=Ivl4NkMpB3P8eNngc6qoE2tb/p7mU41w/MGDNDokDpokXXx/PwA5IGRAhqrPgIXr9M
         xskeD6s1HImgJveOxgD1GwDSSn4+v85HJZpNO0N5/E5FAp4JBVfZMDf/jsnanIJKn2zS
         zOlIwlMU0u+/r6HlURzjMWNTKorHloukRnMvj6ZFtPVHN/bCm3oeDUYZKZx/NFtd7EBU
         MHulQTvu4lDgLvPvnIGa9idGLd45uyCt5bwXZRSutuKoG6O4K0g/zwr5Gnk5Hh2y2VMC
         OsA9sJurALBipn5GH9fNmxVjJCjHkWm8XA4Jse276mlyly9ITd86zxPOmrzie54DeI3V
         Rf9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770261218; x=1770866018; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iiwyy8FID2JbQFOI08ZVbSYEcv3SmVgaFXbSxjskpeI=;
        b=ch+XmKpG2v2L6wwwPHLN+nhmbNfXkKXgWkedckcEZ1Gk2t62xk0yVeehKpEBa72XBT
         I5Y8dcA6tqbKbM9lcNmuSCnKNwo1DKhK5gQwlIptU5wd5nL4XBmsTBCMeW/5sQq9JOWj
         rE7eY9wSFrW8P38C96/2AH3eIxFSLCcIqhbpNiNxeXlIvubI4Y2rFVL/cGIrFcys/HK/
         WzzEsQxmZinnpaiaXoYL4QiGa/Yb28T7rUE1Xopo8FEYj899gdAyYCbGUtguBZf9E7wS
         49DrlqTHJPw8tSGmhXMIliObvi62BE2695YY7R9iQr5eNGUXBPj9TZu19tbDVuWcKec5
         39Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770261218; x=1770866018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Iiwyy8FID2JbQFOI08ZVbSYEcv3SmVgaFXbSxjskpeI=;
        b=CkTd2RuoJzwBzYqLWHd56z69FV+el9LCKfSv73b4N6LvrwqG4kmpwvY6EjivXN/kBl
         mNYnTbJUu7hC+BngnlnUxLEdaMGEVNUiSGHi3kj9qbKbOlm0lZ3fKEHM8oSJpWwKfDOx
         /bz9VLuRZB02tF+goq41+tGBy6aU8riH5HR6SaU55FHZF/EZMg1OXSTA7HE4xqnC0WmG
         1tnmw+aATZD8sXREbtvS74ybSvYXhBZ+T35r1OLoHI3bkydprBjQ160e8K4UpHcPVHZc
         NpBuP3KzJMZejutVnxYgVt9k8Ko4eT3i5KD/X4mPEsPjlNuru0jxjZtAlUs+hw+ymELU
         kkiA==
X-Gm-Message-State: AOJu0Yz/FxOI6wktNcSyJJog5vy3ztCdaC07Kk2s86SgNoogEOGnvDNm
	O6ORBSB46tItsN9CqrF2xcjDM0ss02ys7wu7onLjZTFsVfO2EUw5J/cCEnCnjUI3ZivZUas77hy
	9e5OdgpVncuSff/x06eHrOBh9ShsTDgo=
X-Gm-Gg: AZuq6aJSKtVCxwOGzl9KdIengfcgLNZ2qtcNRnEQEaLC4OZWZKSItXN2mE0eTfrNCEy
	zm2p6kR8EuKWiGckwTYXLgt/Yx57caFBn4QW8/Qfrqp8XvQTGPF8qIqIVMneAXGmgUJhplpkmzK
	QMj897GyoDgSMtZwaC8XBlprNgYvbbrq4wsxXVsQL/hg6q659yiBpkNcuFEXWtSWE3mMy9ToADk
	vV7NH27I732nJq9OVuKooSQHVhnS1JNAfY60P2dy0TnIVS2inIHUmIOiB4sDrgpLooxFFmw
X-Received: by 2002:a05:6214:528c:b0:894:75e0:625c with SMTP id
 6a1803df08f44-8952210f293mr79465546d6.21.1770261217625; Wed, 04 Feb 2026
 19:13:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DG60P3SHXR8H.3NSEHMZ6J7XRC@gmail.com> <C18EFC0C-741A-4DF3-85A9-E3DE9CBC1737@gmail.com>
 <DG6BU3U96TTS.1XNHFL5NRADT5@gmail.com> <4C43FF8D-A529-4645-93E8-DF5E6734328A@gmail.com>
 <DG6KJR1FONK7.2TL5QSPZ2A4GA@gmail.com> <CAFqHKTn=0JS3jcp7FKYvfTHzG5u1kXXtavSK9hNEphagDiDdgA@mail.gmail.com>
In-Reply-To: <CAFqHKTn=0JS3jcp7FKYvfTHzG5u1kXXtavSK9hNEphagDiDdgA@mail.gmail.com>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Wed, 4 Feb 2026 19:13:26 -0800
X-Gm-Features: AZwV_Qi_lS6MHGQHr0N6q6YMIBIROl9Pd3d1utHmPplgUS7D6p5IU_ATBcUp0As
Message-ID: <CAFqHKTnpGTRuW=HMxSu2YQ9qq7inajXOT6p3Vpc8sg0v_EGQQw@mail.gmail.com>
Subject: Re: Report: lenovo_wmi_other FW attributes always read 0
To: Kurt Borja <kuurtb@gmail.com>, Rong Zhang <i@rong.moe>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Armin Wolf <W_Armin@gmx.de>, Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 4, 2026 at 4:04=E2=80=AFPM Derek John Clark
<derekjohn.clark@gmail.com> wrote:
>
> On February 4, 2026 3:33:34 PM PST, Kurt Borja <kuurtb@gmail.com> wrote:
> >On Wed Feb 4, 2026 at 12:45 PM -05, Derek J. Clark wrote:
> >> On February 4, 2026 8:43:56 AM PST, Kurt Borja <kuurtb@gmail.com> wrot=
e:
> >>>On Wed Feb 4, 2026 at 3:36 AM -05, Derek J. Clark wrote:
> >>>> On February 4, 2026 12:00:12 AM PST, Kurt Borja <kuurtb@gmail.com> w=
rote:
> >>>>>Hi all,
> >>>>
> >>>> Hi Kurt.
> >>>
> >>>Hi Derek,
> >>>
> >>>>
> >>>>>In my system (83KY Legion 7 16IAX1) the current_value of any of the
> >>>>>firmware attributes exposed by this driver always reads 0
> >>>>>
> >>>>>   $ ls /sys/class/firmware-attributes/lenovo-wmi-other-0/attributes=
/
> >>>>>   ppt_pl1_spl  ppt_pl2_sppt  ppt_pl3_fppt
> >>>>>
> >>>>>   $ cat /sys/class/firmware-attributes/lenovo-wmi-other-0/attribute=
s/*/current_value
> >>>>>   0
> >>>>>   0
> >>>>>   0
> >>>>>
> >>>>>After investigating my acpidump [1] I found that the argument passed=
 to
> >>>>>the WMI method Arg2 is matched as a whole integer instead of individ=
ual
> >>>>>bytes (L: 49203)
> >>>>>
> >>>>>   If ((ToInteger (Arg2) =3D=3D 0x01010000))
> >>>>>   {
> >>>>>           Return (^^PC00.LPCB.EC0.F5E0) /* \_SB_.PC00.LPCB.EC0_.F5E=
0 */
> >>>>>   }
> >>>>>
> >>>>>   If ((ToInteger (Arg2) =3D=3D 0x01020000))
> >>>>>   {
> >>>>>           Return (^^PC00.LPCB.EC0.CCP1) /* \_SB_.PC00.LPCB.EC0_.CCP=
1 */
> >>>>>   }
> >>>>>
> >>>>>   If ((ToInteger (Arg2) =3D=3D 0x01030000))
> >>>>>   {
> >>>>>           /* This case (CPU FPPT) is actually just zero... */
> >>>>>           Return (Zero)
> >>>>>   }
> >>>>>
> >>>>>...and the driver always sets the second byte of Arg2 to the current
> >>>>>profile (mode), which is never zero!
> >>>>>
> >>>>>   attribute_id =3D
> >>>>>           FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id=
) |
> >>>>>           FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_=
id) |
> >>>>>   -->     FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
> >>>>>           FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id)=
;
> >>>>>
> >>>>>So it never actually matches the attribute and falls back to zero :/
> >>>>>
> >>>>>This is however, not the case for all tunables. As you can see in th=
e
> >>>>>acpidump, just bellow the block above, these are matched depending o=
n
> >>>>>the current mode (second byte)
> >>>>
> >>>> This typically means that the method is stubbed so that it returns 0=
 on is_supported. During development I forgot to go back and add a check fo=
r this when adding the attributes. Per the spec, there is no profile that c=
orresponds to 0x00, so this is working as expected when showing an unsuppor=
ted attribute. If you add a debug print to the capdata driver when it is qu=
erying the attributes you can see the entries are empty.
> >>>
> >>>Hmm it's weird because if I read
> >>>
> >>>     \_SB_.PC00.LPCB.EC0_.F5E0
> >>>     \_SB_.PC00.LPCB.EC0_.CCP1
> >>>
> >>>directly, they show the correct SPPT and SPL values shown in the windo=
ws
> >>>Legion Space app (under Custom mode).
> >>>
> >>>It seems like these are supported?
> >>
> >> Oh, that is strange, yeah. It also explains why some things just aren'=
t working like they should. Once again the documentation is not completely =
accurate for this interface, which is quite frustrating... I think I have a=
 device with this problem as well that I haven't yet troubleshot in the new=
 series, so I can work it locally.
> >>
> >> It sounds like I'll need to check if the current mode entry is present=
 in the cached data, and if not check if there is a  "no mode" present. Tra=
versing the list twice seems tedious & slow, so I'll probably refactor the =
capdata side to check for a match in bytes 0, 1, and 3, and if byte 2 is 0 =
in the data then return that, but if it is missing continue to search for t=
he match? They have historically been in ascending order (though, at this p=
oint I don't know if that can be trusted) I'm curious if any devices have b=
oth a 00 entry and mode specific entries, because that pattern would possib=
ly break them. I could perhaps save the index of the 00 entry separately wh=
en it is seen, then keep looking for the exact match and, if not found, fal=
l back to the saved index. That guarantees a maximum O(n) search every time=
, which isn't great either.
> >
> >I checked the captada buffers in my device and the "mode" byte is never
> >zero :/ In fact every tunable is listed once for each mode, which I
> >think is just normal behavior.
> >
> >Can you send me an acpidump of a device which enforces the mode byte for
> >each tunable? I want to see how other devices do it.
> >
>
> I attached the Legion Go 2 acpidump
>
> >>
> >> I'd like to hear everyone else's thoughts, perhaps there's a more clev=
er way we can do this efficiently and accurately.
> >
> >I think my firmware's behavior is just non-compliant with the
> >specification. In that case a quirk approach should work? The only
> >problem would be the tunables that DO enforce the mode byte in my
> >system.
>
> I think doing it programmatically would be more effective if we can
> get it to work. I'd imagine there are lots of models with random
> attributes that behave this way.
>
> >Another possibility is that there are some tunables that do not enforce
> >modes (but don't necessarily reject them either).
> >
> >Maybe a workaround for non-compliant attributes could work. Something
> >dirty like
> >
> >zero_fallback:
> >       attribute_id =3D LWMI_ATTR_ID(tunable_attr->device_id, tunable_at=
tr->feature_id,
> >                                   mode, tunable_attr->type_id);
> >       ret =3D lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdat=
a);
> >       if (ret)
> >               return ret;
> >
> >       ...
> >
> >       if (value =3D=3D 0) {
> >               mode =3D 0;
> >               goto zero_fallback;
> >       }
>
> That could work, though I'd do it like this to avoid infinite recursion:
>
> zero_fallback:
>         attribute_id =3D LWMI_ATTR_ID(tunable_attr->device_id,
> tunable_attr->feature_id,
>                                     mode, tunable_attr->type_id);
>         ret =3D lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdat=
a);
>         if (ret)
>                 return ret;
>
>
> if (value =3D=3D 0 & mode !=3D 0) {
>                 mode =3D 0;
>           goto zero_fallback;
>
>         if (value =3D=3D 0) {
>     return -EINVAL;
>         }
>
> I'll push something to that effect to my tree and we'll see how that
> works. The downside is traversing the list multiple times, and the
> need to put this in multiple _show functions. As a proof of concept
> I'm fine with it though.
>
> - Derek
>
>

Kurt,

After adding the workaround as described I got some interesting
results. The attribute I have issues with in particular is cpu_temp
(01040000). This attribute has capdata for custom mode & shows full
set/get support, but is hard coded to return 0 in the dsdt. That means
this isn't a "silver bullet" to work around a poorly implemented BIOS
it seems.

I did go back and recheck the documentation, and all these attributes
do have a valid 00 mode in the docs that I overlooked before. It looks
like an older version of the spec possibly. The notes are fairly
sparse on it.

I updated by branch and also included a few lazy "info" debug
statements to help figure out what is going on. Let me know if that
has better results for you.

Thanks,
Derek

> >
> >I wonder how Legion Space deals with my device...
> >
> >>
> >> I assume these values are also tunable in Legion Space in Windows and =
not just viewable?
> >>
> >> Thanks,
> >> Derek
> >>
> >>>
> >>>>
> >>>> Coincidentally, I'm planning on submitting a series this week that a=
dds the missing check for is_supported and also adds the not yet implemente=
d attributes. If you want to take an early preview, it can be found here:
> >>>>
> >>>> https://github.com/pastaq/linux/tree/pastaq/6.18/lenovo/wmi-next
> >>>>
> >>>> With this you should only see attributes that are supported.
> >>>
> >>>Same problem, see bellow
> >>>
> >>>     $ fwupdmgr get-bios-settings
> >>>
> >>>     gpu_oc_stat:
> >>>       Setting type:         Integer
> >>>       Current Value:        0
> >>>       Description:          Set the GPU overclocking status
> >>>       Read Only:            False
> >>>       Minimum value:        0
> >>>       Maximum value:        0
> >>>       Scalar Increment:     0
> >>>
> >>>     cpu_temp:
> >>>       Setting type:         Integer
> >>>       Current Value:        0
> >>>       Description:          Set the CPU thermal load limit
> >>>       Read Only:            False
> >>>       Minimum value:        85
> >>>       Maximum value:        105
> >>>       Scalar Increment:     1
> >>>
> >>>     gpu_nv_ac_offset:
> >>>       Setting type:         Integer
> >>>       Current Value:        0
> >>>       Description:          Set the Nvidia GPU AC total processing po=
wer baseline offset
> >>>       Read Only:            False
> >>>       Minimum value:        10
> >>>       Maximum value:        80
> >>>       Scalar Increment:     1
> >>>
> >>>     gpu_nv_cpu_boost:
> >>>       Setting type:         Integer
> >>>       Current Value:        0
> >>>       Description:          Set the Nvidia GPU to CPU dynamic boost l=
imit
> >>>       Read Only:            False
> >>>       Minimum value:        0
> >>>       Maximum value:        0
> >>>       Scalar Increment:     0
> >>>
> >>>     gpu_temp:
> >>>       Setting type:         Integer
> >>>       Current Value:        0
> >>>       Description:          Set the GPU thermal load limit
> >>>       Read Only:            False
> >>>       Minimum value:        75
> >>>       Maximum value:        87
> >>>       Scalar Increment:     1
> >>>
> >>>     ppt_pl1_spl:
> >>>       Setting type:         Integer
> >>>       Current Value:        0
> >>>       Description:          Set the CPU sustained power limit
> >>>       Read Only:            False
> >>>       Minimum value:        50
> >>>       Maximum value:        110
> >>>       Scalar Increment:     1
> >>>
> >>>     cpu_oc_stat:
> >>>       Setting type:         Integer
> >>>       Current Value:        0
> >>>       Description:          Set the CPU overclocking status
> >>>       Read Only:            False
> >>>       Minimum value:        0
> >>>       Maximum value:        0
> >>>       Scalar Increment:     0
> >>>
> >>>     ppt_cpu_cl:
> >>>       Setting type:         Integer
> >>>       Current Value:        0
> >>>       Description:          Set the CPU cross loading power limit
> >>>       Read Only:            False
> >>>       Minimum value:        30
> >>>       Maximum value:        75
> >>>       Scalar Increment:     1
> >>>
> >>>     ppt_pl2_sppt:
> >>>       Setting type:         Integer
> >>>       Current Value:        0
> >>>       Description:          Set the CPU slow package power tracking l=
imit
> >>>       Read Only:            False
> >>>       Minimum value:        60
> >>>       Maximum value:        168
> >>>       Scalar Increment:     1
> >>>
> >>>     ppt_pl1_tau:
> >>>       Setting type:         Integer
> >>>       Current Value:        0
> >>>       Description:          Set the CPU sustained power limit exceed =
duration
> >>>       Read Only:            False
> >>>       Minimum value:        0
> >>>       Maximum value:        0
> >>>       Scalar Increment:     0
> >>>
> >>>     gpu_nv_ppab:
> >>>       Setting type:         Integer
> >>>       Current Value:        0
> >>>       Description:          Set the Nvidia GPU power performance awar=
e boost limit
> >>>       Read Only:            False
> >>>       Minimum value:        0
> >>>       Maximum value:        0
> >>>       Scalar Increment:     0
> >>>
> >>>     gpu_nv_ctgp:
> >>>       Setting type:         Integer
> >>>       Current Value:        0
> >>>       Description:          Set the GPU configurable total graphics p=
ower
> >>>       Read Only:            False
> >>>       Minimum value:        0
> >>>       Maximum value:        0
> >>>       Scalar Increment:     0
> >>>
> >>>Also it still shows SPPT and SPL as supported (which is coherent with
> >>>Legion Space).
> >>>
> >
