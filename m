Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9B132E745
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 23:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770766737; cv=none; b=ESxtjGEg3lDtMGRaFGB5oZa7cOMRcaLWB4vr21tUZo2SYP1kR2j4aKHOnACeZpm5FRyaIMC+faNj6AIuK6CYI732J6Y9dfBK3G+0hSY1GiJRwdk0aAs+oH6X0OQjSS/d2P6nGE5pSo9iKouZ5CacUP/ApIpZdwylKDhkLnoeZA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770766737; c=relaxed/simple;
	bh=8c7HGPwcuSrW3EMPHi5d3r9OUVE0BJLOQO3enTCAeKA=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=JpYVdFilrw2/krv2TfY7jX1kFqBaqHFWckLiFkG86HPbOopjVy00b3VhhfZABCGY4vILdbbrE+pZK9K4cUCV501sqZF2Oy1LNPuLx948Go2DaNkRoggFRNu0oLxFCWd/stZYtZAAAuzOAr8B89WzVDDsBcmSX1BwKjwxXDNaDgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O87rCBI9; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O87rCBI9"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-94aca174532so767715241.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 15:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770766735; x=1771371535; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nKIIiy30Kc97CWx9ufHLK1yyykeIpNTrfY4AKx1fIWE=;
        b=O87rCBI9k1yqhQrVg0q7oifW4ZA1kU6PZ9LpQcab1ZSlyoVOT3WHbMLU0Rr8MLhFpi
         wECFA+ybSK3uXbyX/bBCwL7Q1SdP1jjWEft6zqrmHmsBLWjYfp6cJvNlcaomkylfUjOf
         nijSweXUZu62Mp94KuDRhms0xKNrbpA1Nxgyp710b6bhkevRXYO1q0/Q25z9/fXglAHX
         Mw+B8NW8L55O/pwGSi5ZhzBqYi0ff7niY3SyvpWBtJImurstDF1alkkfEoJDxQAZbVmY
         IvEdDtkuMu5yXWF5V2x2GmtFgGIzEtbgdK7sYbsoDKCNIkAAmLPQNfmRbOBjCsKsRV0t
         rVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770766735; x=1771371535;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nKIIiy30Kc97CWx9ufHLK1yyykeIpNTrfY4AKx1fIWE=;
        b=Jql80f8gOPkOYpD+1GPeYxIRAnkxcFSTTGlCROSqgj0qi8Nx9HKmDuFC+W4WkdVsAX
         um7j/wi8yn35PfN+wPPBrQ1RpgyuDQN7fukgcjo3AZmJxNdv/6Q5sJ73apPx0yh3O9tc
         QOeCn8PSA46702ypAHD157aCzpYuKGUiRFiGt5H445hK/1EN8d1EMlTYSfA1rzZot1GC
         GclQAWSwoQSSiOSe/g70B7UzfJlrgTtpfC4ocwZZK0Q+Dx9ydgXJyjX8QHuIuKvWXY8A
         6sSzPy6gttUVuFM6sK6J902gPzlO2meAH2SBIzuzD3NIbFiu4581WOOZRsiLbKvC6wVh
         /dSw==
X-Forwarded-Encrypted: i=1; AJvYcCXoHqYYKzHIFDdyYcSotPZ1ATvyLu1uNwBZg+PQoj7Gc3P21SDY8NXh+m85roeG2WdJ0SpACDE5MMJSZe7f9uXeCnic@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8ik9JVm/wUuTqlT12KDE4PJ1dFhmT3J6l5l6Rgzy6sCBoIfny
	G2n2z9OF2EdQiXLHpLbASdF81pULYk59nxuIy2x96NBPY7OAk3u3Gvlj
X-Gm-Gg: AZuq6aIR6PL4V9HA89jOEb+d93DwRTc+qctTd8ZPtzk0LXwjls3ggckOmSpQgS5KLi/
	rBgHqrd/3rDY0mUAjPuandUyXwywQ197ojblc1fadH9txNfGx2VXNjWRvHjdF3gR0W+5q5V1rFO
	Bs+J6n1Rj4YK/848TLIPGZ+i4qRXALoYZuhClWtTNfCXK7XwntmihbPC1KcelK1Mkec3/i8wHpA
	AHWlFnAMLw2RLoiClaULrRdisNwls3gC5XpL1OUuySLgRhUxhWXH7Cf9Mcc0vzjsc3ozYxzCnnp
	yETV5Hkuzn8fBEy9C0MLyvwmFwrGFGnkWEtetXnlEclLZiFVOtJf9UFr4rja1hc5KGgR09QQV3N
	z61/bpAPYMzNX6iWS/wV6xG5YqlwvWQnwG9RW+4E13tmBVLY4X3LeQ8g08FQLPpp/3gS2zqzlq4
	3NWUjkDlynbGdNC4b9yqI=
X-Received: by 2002:a05:6102:4191:b0:5fc:ea57:d1ca with SMTP id ada2fe7eead31-5fde43ad8bbmr237972137.30.1770766734459;
        Tue, 10 Feb 2026 15:38:54 -0800 (PST)
Received: from localhost ([2800:bf0:4580:3149:c903:2904:3cc3:8b4c])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94afd14d749sm125307241.1.2026.02.10.15.38.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 15:38:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 18:38:52 -0500
Message-Id: <DGBOF2O43IUT.1EJ7X7L00993R@gmail.com>
To: "Derek John Clark" <derekjohn.clark@gmail.com>, "Kurt Borja"
 <kuurtb@gmail.com>
Cc: "Rong Zhang" <i@rong.moe>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Armin Wolf" <W_Armin@gmx.de>, "Mark
 Pearson" <mpearson-lenovo@squebb.ca>, <platform-driver-x86@vger.kernel.org>
Subject: Re: Report: lenovo_wmi_other FW attributes always read 0
From: "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <DG60P3SHXR8H.3NSEHMZ6J7XRC@gmail.com>
 <C18EFC0C-741A-4DF3-85A9-E3DE9CBC1737@gmail.com>
 <DG6BU3U96TTS.1XNHFL5NRADT5@gmail.com>
 <4C43FF8D-A529-4645-93E8-DF5E6734328A@gmail.com>
 <DG6KJR1FONK7.2TL5QSPZ2A4GA@gmail.com>
 <CAFqHKTn=0JS3jcp7FKYvfTHzG5u1kXXtavSK9hNEphagDiDdgA@mail.gmail.com>
 <CAFqHKTnpGTRuW=HMxSu2YQ9qq7inajXOT6p3Vpc8sg0v_EGQQw@mail.gmail.com>
 <DG77O19JWSAH.2TC5GU5CR5U5H@gmail.com>
 <CAFqHKTkHhx14rM7QTATLTq-ry1z53+D5h1y982gaBd+RbMNJAQ@mail.gmail.com>
In-Reply-To: <CAFqHKTkHhx14rM7QTATLTq-ry1z53+D5h1y982gaBd+RbMNJAQ@mail.gmail.com>

On Fri Feb 6, 2026 at 2:11 AM -05, Derek John Clark wrote:
> On Thu, Feb 5, 2026 at 9:40=E2=80=AFAM Kurt Borja <kuurtb@gmail.com> wrot=
e:
>>
>> On Wed Feb 4, 2026 at 10:13 PM -05, Derek John Clark wrote:
>> > On Wed, Feb 4, 2026 at 4:04=E2=80=AFPM Derek John Clark
>> > <derekjohn.clark@gmail.com> wrote:
>> >>
>> >> On February 4, 2026 3:33:34 PM PST, Kurt Borja <kuurtb@gmail.com> wro=
te:
>> >> >On Wed Feb 4, 2026 at 12:45 PM -05, Derek J. Clark wrote:
>> >> >> On February 4, 2026 8:43:56 AM PST, Kurt Borja <kuurtb@gmail.com> =
wrote:
>> >> >>>On Wed Feb 4, 2026 at 3:36 AM -05, Derek J. Clark wrote:
>> >> >>>> On February 4, 2026 12:00:12 AM PST, Kurt Borja <kuurtb@gmail.co=
m> wrote:
>> >> >>>>>Hi all,
>> >> >>>>
>> >> >>>> Hi Kurt.
>> >> >>>
>> >> >>>Hi Derek,
>> >> >>>
>> >> >>>>
>> >> >>>>>In my system (83KY Legion 7 16IAX1) the current_value of any of =
the
>> >> >>>>>firmware attributes exposed by this driver always reads 0
>> >> >>>>>
>> >> >>>>>   $ ls /sys/class/firmware-attributes/lenovo-wmi-other-0/attrib=
utes/
>> >> >>>>>   ppt_pl1_spl  ppt_pl2_sppt  ppt_pl3_fppt
>> >> >>>>>
>> >> >>>>>   $ cat /sys/class/firmware-attributes/lenovo-wmi-other-0/attri=
butes/*/current_value
>> >> >>>>>   0
>> >> >>>>>   0
>> >> >>>>>   0
>> >> >>>>>
>> >> >>>>>After investigating my acpidump [1] I found that the argument pa=
ssed to
>> >> >>>>>the WMI method Arg2 is matched as a whole integer instead of ind=
ividual
>> >> >>>>>bytes (L: 49203)
>> >> >>>>>
>> >> >>>>>   If ((ToInteger (Arg2) =3D=3D 0x01010000))
>> >> >>>>>   {
>> >> >>>>>           Return (^^PC00.LPCB.EC0.F5E0) /* \_SB_.PC00.LPCB.EC0_=
.F5E0 */
>> >> >>>>>   }
>> >> >>>>>
>> >> >>>>>   If ((ToInteger (Arg2) =3D=3D 0x01020000))
>> >> >>>>>   {
>> >> >>>>>           Return (^^PC00.LPCB.EC0.CCP1) /* \_SB_.PC00.LPCB.EC0_=
.CCP1 */
>> >> >>>>>   }
>> >> >>>>>
>> >> >>>>>   If ((ToInteger (Arg2) =3D=3D 0x01030000))
>> >> >>>>>   {
>> >> >>>>>           /* This case (CPU FPPT) is actually just zero... */
>> >> >>>>>           Return (Zero)
>> >> >>>>>   }
>> >> >>>>>
>> >> >>>>>...and the driver always sets the second byte of Arg2 to the cur=
rent
>> >> >>>>>profile (mode), which is never zero!
>> >> >>>>>
>> >> >>>>>   attribute_id =3D
>> >> >>>>>           FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->devic=
e_id) |
>> >> >>>>>           FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feat=
ure_id) |
>> >> >>>>>   -->     FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
>> >> >>>>>           FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type=
_id);
>> >> >>>>>
>> >> >>>>>So it never actually matches the attribute and falls back to zer=
o :/
>> >> >>>>>
>> >> >>>>>This is however, not the case for all tunables. As you can see i=
n the
>> >> >>>>>acpidump, just bellow the block above, these are matched dependi=
ng on
>> >> >>>>>the current mode (second byte)
>> >> >>>>
>> >> >>>> This typically means that the method is stubbed so that it retur=
ns 0 on is_supported. During development I forgot to go back and add a chec=
k for this when adding the attributes. Per the spec, there is no profile th=
at corresponds to 0x00, so this is working as expected when showing an unsu=
pported attribute. If you add a debug print to the capdata driver when it i=
s querying the attributes you can see the entries are empty.
>> >> >>>
>> >> >>>Hmm it's weird because if I read
>> >> >>>
>> >> >>>     \_SB_.PC00.LPCB.EC0_.F5E0
>> >> >>>     \_SB_.PC00.LPCB.EC0_.CCP1
>> >> >>>
>> >> >>>directly, they show the correct SPPT and SPL values shown in the w=
indows
>> >> >>>Legion Space app (under Custom mode).
>> >> >>>
>> >> >>>It seems like these are supported?
>> >> >>
>> >> >> Oh, that is strange, yeah. It also explains why some things just a=
ren't working like they should. Once again the documentation is not complet=
ely accurate for this interface, which is quite frustrating... I think I ha=
ve a device with this problem as well that I haven't yet troubleshot in the=
 new series, so I can work it locally.
>> >> >>
>> >> >> It sounds like I'll need to check if the current mode entry is pre=
sent in the cached data, and if not check if there is a  "no mode" present.=
 Traversing the list twice seems tedious & slow, so I'll probably refactor =
the capdata side to check for a match in bytes 0, 1, and 3, and if byte 2 i=
s 0 in the data then return that, but if it is missing continue to search f=
or the match? They have historically been in ascending order (though, at th=
is point I don't know if that can be trusted) I'm curious if any devices ha=
ve both a 00 entry and mode specific entries, because that pattern would po=
ssibly break them. I could perhaps save the index of the 00 entry separatel=
y when it is seen, then keep looking for the exact match and, if not found,=
 fall back to the saved index. That guarantees a maximum O(n) search every =
time, which isn't great either.
>> >> >
>> >> >I checked the captada buffers in my device and the "mode" byte is ne=
ver
>> >> >zero :/ In fact every tunable is listed once for each mode, which I
>> >> >think is just normal behavior.
>> >> >
>> >> >Can you send me an acpidump of a device which enforces the mode byte=
 for
>> >> >each tunable? I want to see how other devices do it.
>> >> >
>> >>
>> >> I attached the Legion Go 2 acpidump
>> >>
>> >> >>
>> >> >> I'd like to hear everyone else's thoughts, perhaps there's a more =
clever way we can do this efficiently and accurately.
>> >> >
>> >> >I think my firmware's behavior is just non-compliant with the
>> >> >specification. In that case a quirk approach should work? The only
>> >> >problem would be the tunables that DO enforce the mode byte in my
>> >> >system.
>> >>
>> >> I think doing it programmatically would be more effective if we can
>> >> get it to work. I'd imagine there are lots of models with random
>> >> attributes that behave this way.
>> >>
>> >> >Another possibility is that there are some tunables that do not enfo=
rce
>> >> >modes (but don't necessarily reject them either).
>> >> >
>> >> >Maybe a workaround for non-compliant attributes could work. Somethin=
g
>> >> >dirty like
>> >> >
>> >> >zero_fallback:
>> >> >       attribute_id =3D LWMI_ATTR_ID(tunable_attr->device_id, tunabl=
e_attr->feature_id,
>> >> >                                   mode, tunable_attr->type_id);
>> >> >       ret =3D lwmi_cd01_get_data(priv->cd01_list, attribute_id, &ca=
pdata);
>> >> >       if (ret)
>> >> >               return ret;
>> >> >
>> >> >       ...
>> >> >
>> >> >       if (value =3D=3D 0) {
>> >> >               mode =3D 0;
>> >> >               goto zero_fallback;
>> >> >       }
>> >>
>> >> That could work, though I'd do it like this to avoid infinite recursi=
on:
>> >>
>> >> zero_fallback:
>> >>         attribute_id =3D LWMI_ATTR_ID(tunable_attr->device_id,
>> >> tunable_attr->feature_id,
>> >>                                     mode, tunable_attr->type_id);
>> >>         ret =3D lwmi_cd01_get_data(priv->cd01_list, attribute_id, &ca=
pdata);
>> >>         if (ret)
>> >>                 return ret;
>> >>
>> >>
>> >> if (value =3D=3D 0 & mode !=3D 0) {
>> >>                 mode =3D 0;
>> >>           goto zero_fallback;
>> >>
>> >>         if (value =3D=3D 0) {
>> >>     return -EINVAL;
>> >>         }
>> >>
>> >> I'll push something to that effect to my tree and we'll see how that
>> >> works. The downside is traversing the list multiple times, and the
>> >> need to put this in multiple _show functions. As a proof of concept
>> >> I'm fine with it though.
>> >>
>> >> - Derek
>> >>
>> >>
>> >
>> > Kurt,
>> >
>> > After adding the workaround as described I got some interesting
>> > results. The attribute I have issues with in particular is cpu_temp
>> > (01040000). This attribute has capdata for custom mode & shows full
>> > set/get support, but is hard coded to return 0 in the dsdt. That means
>> > this isn't a "silver bullet" to work around a poorly implemented BIOS
>> > it seems.
>>
>> In my system FPPT is also hardcoded to zero :/
>>
>> >
>> > I did go back and recheck the documentation, and all these attributes
>> > do have a valid 00 mode in the docs that I overlooked before. It looks
>> > like an older version of the spec possibly. The notes are fairly
>> > sparse on it.
>>
>> Is the 0x00 mode actually a mode or just something like no-mode?
>>
>> I checked the acpidump you sent the SPPT tunable accepts valid modes and
>> also the 0x00 mode when reading... that's interesting.
>>
>> >
>> > I updated by branch and also included a few lazy "info" debug
>> > statements to help figure out what is going on. Let me know if that
>> > has better results for you.
>>
>> It has! Now all attributes are readable. There quite a few attributes
>> with 0 min/max/step values. I guess that's just poorly implemented BIOS
>> again.
>>
>> Here are the results
>>
>>         $ fwupdmgr get-bios-settings
>>
>>         gpu_oc_stat:
>>           Setting type:         Integer
>>           Current Value:        17
>>           Description:          Set the GPU overclocking status
>>           Read Only:            False
>>           Minimum value:        0
>>           Maximum value:        0
>>           Scalar Increment:     0
>>
>>         cpu_temp:
>>           Setting type:         Integer
>>           Current Value:        103
>>           Description:          Set the CPU thermal load limit
>>           Read Only:            False
>>           Minimum value:        85
>>           Maximum value:        105
>>           Scalar Increment:     1
>>
>>         gpu_nv_ac_offset:
>>           Setting type:         Integer
>>           Current Value:        55
>>           Description:          Set the Nvidia GPU AC total processing p=
ower baseline offset
>>           Read Only:            False
>>           Minimum value:        10
>>           Maximum value:        80
>>           Scalar Increment:     1
>>
>>         gpu_nv_cpu_boost:
>>           Setting type:         Integer
>>           Current Value:        10
>>           Description:          Set the Nvidia GPU to CPU dynamic boost =
limit
>>           Read Only:            False
>>           Minimum value:        0
>>           Maximum value:        0
>>           Scalar Increment:     0
>>
>>         gpu_temp:
>>           Setting type:         Integer
>>           Current Value:        87
>>           Description:          Set the GPU thermal load limit
>>           Read Only:            False
>>           Minimum value:        75
>>           Maximum value:        87
>>           Scalar Increment:     1
>>
>>         ppt_pl1_spl:
>>           Setting type:         Integer
>>           Current Value:        70
>>           Description:          Set the CPU sustained power limit
>>           Read Only:            False
>>           Minimum value:        50
>>           Maximum value:        110
>>           Scalar Increment:     1
>>
>>         cpu_oc_stat:
>>           Setting type:         Integer
>>           Current Value:        16
>>           Description:          Set the CPU overclocking status
>>           Read Only:            False
>>           Minimum value:        0
>>           Maximum value:        0
>>           Scalar Increment:     0
>>
>>         ppt_cpu_cl:
>>           Setting type:         Integer
>>           Current Value:        65
>>           Description:          Set the CPU cross loading power limit
>>           Read Only:            False
>>           Minimum value:        30
>>           Maximum value:        75
>>           Scalar Increment:     1
>>
>>         ppt_pl2_sppt:
>>           Setting type:         Integer
>>           Current Value:        125
>>           Description:          Set the CPU slow package power tracking =
limit
>>           Read Only:            False
>>           Minimum value:        60
>>           Maximum value:        168
>>           Scalar Increment:     1
>>
>>         ppt_pl1_tau:
>>           Setting type:         Integer
>>           Current Value:        56
>>           Description:          Set the CPU sustained power limit exceed=
 duration
>>           Read Only:            False
>>           Minimum value:        0
>>           Maximum value:        0
>>           Scalar Increment:     0
>>
>>         gpu_nv_ppab:
>>           Setting type:         Integer
>>           Current Value:        15
>>           Description:          Set the Nvidia GPU power performance awa=
re boost limit
>>           Read Only:            False
>>           Minimum value:        0
>>           Maximum value:        0
>>           Scalar Increment:     0
>>
>>         gpu_nv_ctgp:
>>           Setting type:         Integer
>>           Current Value:        65
>>           Description:          Set the GPU configurable total graphics =
power
>>           Read Only:            False
>>           Minimum value:        0
>>           Maximum value:        0
>>           Scalar Increment:     0
>
> That is encouraging, at least we're on the right path.
>
>> I still can't write to them though. Every write gets ignored without
>> failing
>>
>>         $ cat /sys/class/firmware-attributes/lenovo-wmi-other-0/attribut=
es/ppt_pl2_sppt/current_value
>>         125
>>
>>         $ echo 126 | sudo tee /sys/class/firmware-attributes/lenovo-wmi-=
other-0/attributes/ppt_pl2_sppt/current_value
>>         126
>>
>>         $ cat /sys/class/firmware-attributes/lenovo-wmi-other-0/attribut=
es/ppt_pl2_sppt/current_value
>>         125
>>
>> I tried writting to them using acpi_call and it works (0x7e =3D 126)
>>
>>         $ echo '\_SB_.GZFD.WMAE 0 0x12 {0x00, 0x00, 0x01, 0x01, 0x7e, 0x=
00, 0x00, 0x00}' | sudo tee /proc/acpi/call
>>         \_SB_.GZFD.WMAE 0 0x12 {0x00, 0x00, 0x01, 0x01, 0x7e, 0x00, 0x00=
, 0x00}
>>
>>         $ sudo cat /proc/acpi/call
>>         0x0
>>
>>         $ cat /sys/class/firmware-attributes/lenovo-wmi-other-0/attribut=
es/ppt_pl2_sppt/current_value
>>         126
>
> This is very annoying. Presumably that means your device is providing
> good capdata for custom mode on some attributes? If that is the case
> then it will bee very difficult to auto-discover the no-mode.
>
>> Maybe we can check if the tunable returns zero at the discovery phase
>> and add some kind of flag there `.no_mode =3D 1`. Then we can check that
>> flag when writting the attribute.
>>
>> It's getting tricky because legion go 2 does enforce 0xFF mode when
>> writting, while my device enforces 0x00. Even worse, if I pass 0xFF it
>> returns 0, like it was successful...
>
> Indeed, I confirmed my device does the inverse.
>
>
>>         $ echo '\_SB_.GZFD.WMAE 0 0x12 {0x00, 0xFF, 0x01, 0x01, 0x7e, 0x=
00, 0x00, 0x00}' | sudo tee /proc/acpi/call
>>         \_SB_.GZFD.WMAE 0 0x12 {0x00, 0xFF, 0x01, 0x01, 0x7e, 0x00, 0x00=
, 0x00}
>>
>>         $ sudo cat /proc/acpi/call
>>         0x0
>>
>> IMO we should check this no_mode stuff at the discovery phase.
>
> I updated my branch to try and discover the GET and SET per attribute
> during the is_supported phase by doing the fail loop there, once for
> each. I store the modes that worked on new members of the tunable_attr
> to reuse if either 0xff or 0x00 worked, and report -EOPNOTSUPP if
> nothing worked. If that happens it won't create the attribute at all,
> which eliminates showing attributes with botched implementations such
> as the gpu_temp on Go 2. That will add a lot of wmi calls on init (up
> to 2 per attribute in the config), but that might be preferable as it
> eliminates the loops in the _store and _show functions for all the RO
> and RW file descriptors. I check the capdata first at least to early
> exit if the attribute isn't supported at all.
>
> To summarize the flow in is_suported is now:
> - Check if there is a capdata block for the attribute under custom mode
> - If that fails, check if there is a capdata block for the attribute
> under no mode
> - If both fail then return
> - If one of them succeed, check if the attribute is supported in the
> capdata block, return -EOPNOTSUPP if not.
> - set the tunable_attr->get_mode_id to the successful mode.
> - reset the mode var to custom, get the current value, and check if
> the return value is 0
> - if that fails, try again with no mode
> - if both fail, return -EOPNOTSUPP
> - If either pass, set the tunable_attr->set_mode_id to the successful mod=
e.
> - return capdata->supported
>
> Then in the _show & _store functions I can just reuse the previously
> discovered mode values. when getting the capdata or setting/getting
> the current value itself.
>
> There is some hope perhaps in using the WMI interface version for a
> quirk as well. 0x000c0000 "Get BIOS WMI Version" returns a u32 with
> bytes 015 being minor version and 16-31 being the major version. If we
> were to quirk this then presumably that would have a discernible
> pattern. It would require a large sample size to figure out which
> devices do what exactly though, which would be less than ideal.
>
> In any case, I've updated my branch with the changes. If that works
> for you I'll clean it up a bit and start getting ready to submit for
> review. I do have a couple more features to add on top of this issue
> so my timeline for submitting has slid right about a week.
>
> Thanks,
> Derek

Hi Derek,

The procedure above does fix reading and modifying tunables :)

I had a bit of hope the patch would be short enough for stable inclusion
but I think that may not be possible.

Thanks for working on this!

--=20
Thanks,
 ~ Kurt
