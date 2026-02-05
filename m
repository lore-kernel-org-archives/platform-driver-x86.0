Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A632EC55C
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Feb 2026 17:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770313239; cv=none; b=l4LdKvm8XxslvDwZEp//9mvbfcL9niWF6PARNTGiUjm9MhepAFcSgbj/vU3hr/Uwgp+yi4Zqc4ldpdenbPCzNcYUKc9AJXcoOgAgnXuQgVOh0PX9C600ENNnbaeKSzv/qhrtPVxkpGwjxx2JwqyMzr3IzsEK2NWidX5vDJ6PHNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770313239; c=relaxed/simple;
	bh=XPxK5zessFhHsbM/3UVI0JjuNgxsPorAyORkeirzPnw=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:Mime-Version:
	 References:In-Reply-To; b=kFwtolQf3xe1xiEEa9G6XZC6JMd0Jg8k3KmYcTeLebS05mW1bpyJbTLNDDoiymPs5crulBfTkl/d7pNeJevOygq97/j+otWvp66MHiMtpwpcOGZ5mfFRA/lhOh3b1d6VcRUMxTkwRMq4Q/qeoebnJU5WLhM0Zz5DUF8lb492LRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YKResdWM; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YKResdWM"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5664848545fso462942e0c.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Feb 2026 09:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770313238; x=1770918038; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version
         :subject:cc:to:from:message-id:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZZ8NS0a92q6JlXq5FRnjZ4dc4mLrjupAbnP+bLxCh0=;
        b=YKResdWM7OJk7c9NiqAOQvBEYJdzgKAgfBxYfhidGRSlmq2m4uMwAPlsGJxkILaa2b
         KISUUTPQozAgYMEdT4nWKBTta69rCfVvPHuCmeb4PckXVkGXSiI0rDE80+V/AH8SiZVd
         dymTwjAiNTiqjJWfS3riDT/KvWf9hDM8zvQAui1pYvc7O0scI5RXcErTVhdcWE3c8ARx
         wEYBJtejvUF0nbt1xAGEUjp2Gz+hU0AQ0DxC9Zk7GIRKsNdoIJZaHzYdWcJUOKNAivgX
         56uCPEOIzti1MOZ3SavYW3D7uF/dcY0posb4RTwmakNXSdwRfp5UPnAWq6YgOzw6KhDO
         pCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770313238; x=1770918038;
        h=in-reply-to:references:content-transfer-encoding:mime-version
         :subject:cc:to:from:message-id:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SZZ8NS0a92q6JlXq5FRnjZ4dc4mLrjupAbnP+bLxCh0=;
        b=Ahb4OPrUktey3c4mE2brb1b1jeUMm2OMT2+g9Ov6hYiXXFGMEpMmHOF0fzFqaQjczs
         Ip9r2MuYuabdDkVPm8ZjD/2wtxiCsD8aGe1+GuCOKwXiugy563RA+PQEpXzdOZFv0ONL
         Lf4Q2VKPoSsLMZ1dQNDi9A+oQUAvdndUyBbDVgSFnsrWsQvcHmFAPcuFOpiZzAc5LgX8
         ow6YzkOqDjD83wyoIcwXQWnFozCyjGXWAHHrNvgxs7TqQKgUKc10CNfiPMs2dafolLZi
         jRkFbFFxvqSCde3pFNKSP6JTuV9TxtdcmubO+bXklpZS4siVBz6M5ECQX9yoJqvkvHhx
         9Pow==
X-Gm-Message-State: AOJu0Yzul5V8IfPFd8WaI0Ol1EYLp96OrYZigVFvn9sRO1NgRmgNzfce
	4g/t56wSRrkTcltfOWgTrY5kwDv+xjDzgDUD7N5w/T3pkuPPKRuKRX8d
X-Gm-Gg: AZuq6aIrGDFCHKmGqFEueCa74zn2g3Eu9Q85KQPycI3kTBV5H5uovKF/ylsMRmm+vj/
	oaIxPnsrZq5BcT9IKNoh0hWC9s/k1nwe6dsiMF2LVo909QhBLFHOpMN1pa7GrKzRKr6oRz6h8cO
	I3fj0etezjNvwxS70ia09NeJC8AjwnUhwStfVzlD/D2quaZa9wZ3741NpP37NqrmNgSLddS4PJQ
	F3h3KhJ+hTDorfrubHDmULcrSajPNIB4SmYsmrRU7zguyNQinsiH9GOW7UTdegX1wjmHF4wX0+P
	2dUbOyv/7Hkh8ycB3lWDb/lSzBpPTY0ZGkVOjzm+TcxyNGq/S9YdPOmOQQSJricKUHJxZ6CKCN0
	Q+039wJFiKDp+1KpiESu6de0FiCGcivvj68uOAJ5hOwtqhVl5o6IYM0SN6mCSE5G7ivO46Kjnkt
	/Hmby0otKsQkxj
X-Received: by 2002:a05:6122:509:b0:563:7d93:b135 with SMTP id 71dfb90a1353d-56705e82913mr84213e0c.2.1770313237940;
        Thu, 05 Feb 2026 09:40:37 -0800 (PST)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-948dfe5a63csm1813984241.3.2026.02.05.09.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 09:40:37 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 12:40:35 -0500
Message-Id: <DG77O19JWSAH.2TC5GU5CR5U5H@gmail.com>
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Derek John Clark" <derekjohn.clark@gmail.com>, "Kurt Borja"
 <kuurtb@gmail.com>, "Rong Zhang" <i@rong.moe>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Armin
 Wolf" <W_Armin@gmx.de>, "Mark Pearson" <mpearson-lenovo@squebb.ca>
Cc: <platform-driver-x86@vger.kernel.org>
Subject: Re: Report: lenovo_wmi_other FW attributes always read 0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <DG60P3SHXR8H.3NSEHMZ6J7XRC@gmail.com>
 <C18EFC0C-741A-4DF3-85A9-E3DE9CBC1737@gmail.com>
 <DG6BU3U96TTS.1XNHFL5NRADT5@gmail.com>
 <4C43FF8D-A529-4645-93E8-DF5E6734328A@gmail.com>
 <DG6KJR1FONK7.2TL5QSPZ2A4GA@gmail.com>
 <CAFqHKTn=0JS3jcp7FKYvfTHzG5u1kXXtavSK9hNEphagDiDdgA@mail.gmail.com>
 <CAFqHKTnpGTRuW=HMxSu2YQ9qq7inajXOT6p3Vpc8sg0v_EGQQw@mail.gmail.com>
In-Reply-To: <CAFqHKTnpGTRuW=HMxSu2YQ9qq7inajXOT6p3Vpc8sg0v_EGQQw@mail.gmail.com>

On Wed Feb 4, 2026 at 10:13 PM -05, Derek John Clark wrote:
> On Wed, Feb 4, 2026 at 4:04=E2=80=AFPM Derek John Clark
> <derekjohn.clark@gmail.com> wrote:
>>
>> On February 4, 2026 3:33:34 PM PST, Kurt Borja <kuurtb@gmail.com> wrote:
>> >On Wed Feb 4, 2026 at 12:45 PM -05, Derek J. Clark wrote:
>> >> On February 4, 2026 8:43:56 AM PST, Kurt Borja <kuurtb@gmail.com> wro=
te:
>> >>>On Wed Feb 4, 2026 at 3:36 AM -05, Derek J. Clark wrote:
>> >>>> On February 4, 2026 12:00:12 AM PST, Kurt Borja <kuurtb@gmail.com> =
wrote:
>> >>>>>Hi all,
>> >>>>
>> >>>> Hi Kurt.
>> >>>
>> >>>Hi Derek,
>> >>>
>> >>>>
>> >>>>>In my system (83KY Legion 7 16IAX1) the current_value of any of the
>> >>>>>firmware attributes exposed by this driver always reads 0
>> >>>>>
>> >>>>>   $ ls /sys/class/firmware-attributes/lenovo-wmi-other-0/attribute=
s/
>> >>>>>   ppt_pl1_spl  ppt_pl2_sppt  ppt_pl3_fppt
>> >>>>>
>> >>>>>   $ cat /sys/class/firmware-attributes/lenovo-wmi-other-0/attribut=
es/*/current_value
>> >>>>>   0
>> >>>>>   0
>> >>>>>   0
>> >>>>>
>> >>>>>After investigating my acpidump [1] I found that the argument passe=
d to
>> >>>>>the WMI method Arg2 is matched as a whole integer instead of indivi=
dual
>> >>>>>bytes (L: 49203)
>> >>>>>
>> >>>>>   If ((ToInteger (Arg2) =3D=3D 0x01010000))
>> >>>>>   {
>> >>>>>           Return (^^PC00.LPCB.EC0.F5E0) /* \_SB_.PC00.LPCB.EC0_.F5=
E0 */
>> >>>>>   }
>> >>>>>
>> >>>>>   If ((ToInteger (Arg2) =3D=3D 0x01020000))
>> >>>>>   {
>> >>>>>           Return (^^PC00.LPCB.EC0.CCP1) /* \_SB_.PC00.LPCB.EC0_.CC=
P1 */
>> >>>>>   }
>> >>>>>
>> >>>>>   If ((ToInteger (Arg2) =3D=3D 0x01030000))
>> >>>>>   {
>> >>>>>           /* This case (CPU FPPT) is actually just zero... */
>> >>>>>           Return (Zero)
>> >>>>>   }
>> >>>>>
>> >>>>>...and the driver always sets the second byte of Arg2 to the curren=
t
>> >>>>>profile (mode), which is never zero!
>> >>>>>
>> >>>>>   attribute_id =3D
>> >>>>>           FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_i=
d) |
>> >>>>>           FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature=
_id) |
>> >>>>>   -->     FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
>> >>>>>           FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id=
);
>> >>>>>
>> >>>>>So it never actually matches the attribute and falls back to zero :=
/
>> >>>>>
>> >>>>>This is however, not the case for all tunables. As you can see in t=
he
>> >>>>>acpidump, just bellow the block above, these are matched depending =
on
>> >>>>>the current mode (second byte)
>> >>>>
>> >>>> This typically means that the method is stubbed so that it returns =
0 on is_supported. During development I forgot to go back and add a check f=
or this when adding the attributes. Per the spec, there is no profile that =
corresponds to 0x00, so this is working as expected when showing an unsuppo=
rted attribute. If you add a debug print to the capdata driver when it is q=
uerying the attributes you can see the entries are empty.
>> >>>
>> >>>Hmm it's weird because if I read
>> >>>
>> >>>     \_SB_.PC00.LPCB.EC0_.F5E0
>> >>>     \_SB_.PC00.LPCB.EC0_.CCP1
>> >>>
>> >>>directly, they show the correct SPPT and SPL values shown in the wind=
ows
>> >>>Legion Space app (under Custom mode).
>> >>>
>> >>>It seems like these are supported?
>> >>
>> >> Oh, that is strange, yeah. It also explains why some things just aren=
't working like they should. Once again the documentation is not completely=
 accurate for this interface, which is quite frustrating... I think I have =
a device with this problem as well that I haven't yet troubleshot in the ne=
w series, so I can work it locally.
>> >>
>> >> It sounds like I'll need to check if the current mode entry is presen=
t in the cached data, and if not check if there is a  "no mode" present. Tr=
aversing the list twice seems tedious & slow, so I'll probably refactor the=
 capdata side to check for a match in bytes 0, 1, and 3, and if byte 2 is 0=
 in the data then return that, but if it is missing continue to search for =
the match? They have historically been in ascending order (though, at this =
point I don't know if that can be trusted) I'm curious if any devices have =
both a 00 entry and mode specific entries, because that pattern would possi=
bly break them. I could perhaps save the index of the 00 entry separately w=
hen it is seen, then keep looking for the exact match and, if not found, fa=
ll back to the saved index. That guarantees a maximum O(n) search every tim=
e, which isn't great either.
>> >
>> >I checked the captada buffers in my device and the "mode" byte is never
>> >zero :/ In fact every tunable is listed once for each mode, which I
>> >think is just normal behavior.
>> >
>> >Can you send me an acpidump of a device which enforces the mode byte fo=
r
>> >each tunable? I want to see how other devices do it.
>> >
>>
>> I attached the Legion Go 2 acpidump
>>
>> >>
>> >> I'd like to hear everyone else's thoughts, perhaps there's a more cle=
ver way we can do this efficiently and accurately.
>> >
>> >I think my firmware's behavior is just non-compliant with the
>> >specification. In that case a quirk approach should work? The only
>> >problem would be the tunables that DO enforce the mode byte in my
>> >system.
>>
>> I think doing it programmatically would be more effective if we can
>> get it to work. I'd imagine there are lots of models with random
>> attributes that behave this way.
>>
>> >Another possibility is that there are some tunables that do not enforce
>> >modes (but don't necessarily reject them either).
>> >
>> >Maybe a workaround for non-compliant attributes could work. Something
>> >dirty like
>> >
>> >zero_fallback:
>> >       attribute_id =3D LWMI_ATTR_ID(tunable_attr->device_id, tunable_a=
ttr->feature_id,
>> >                                   mode, tunable_attr->type_id);
>> >       ret =3D lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capda=
ta);
>> >       if (ret)
>> >               return ret;
>> >
>> >       ...
>> >
>> >       if (value =3D=3D 0) {
>> >               mode =3D 0;
>> >               goto zero_fallback;
>> >       }
>>
>> That could work, though I'd do it like this to avoid infinite recursion:
>>
>> zero_fallback:
>>         attribute_id =3D LWMI_ATTR_ID(tunable_attr->device_id,
>> tunable_attr->feature_id,
>>                                     mode, tunable_attr->type_id);
>>         ret =3D lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capda=
ta);
>>         if (ret)
>>                 return ret;
>>
>>
>> if (value =3D=3D 0 & mode !=3D 0) {
>>                 mode =3D 0;
>>           goto zero_fallback;
>>
>>         if (value =3D=3D 0) {
>>     return -EINVAL;
>>         }
>>
>> I'll push something to that effect to my tree and we'll see how that
>> works. The downside is traversing the list multiple times, and the
>> need to put this in multiple _show functions. As a proof of concept
>> I'm fine with it though.
>>
>> - Derek
>>
>>
>
> Kurt,
>
> After adding the workaround as described I got some interesting
> results. The attribute I have issues with in particular is cpu_temp
> (01040000). This attribute has capdata for custom mode & shows full
> set/get support, but is hard coded to return 0 in the dsdt. That means
> this isn't a "silver bullet" to work around a poorly implemented BIOS
> it seems.

In my system FPPT is also hardcoded to zero :/

>
> I did go back and recheck the documentation, and all these attributes
> do have a valid 00 mode in the docs that I overlooked before. It looks
> like an older version of the spec possibly. The notes are fairly
> sparse on it.

Is the 0x00 mode actually a mode or just something like no-mode?

I checked the acpidump you sent the SPPT tunable accepts valid modes and
also the 0x00 mode when reading... that's interesting.

>
> I updated by branch and also included a few lazy "info" debug
> statements to help figure out what is going on. Let me know if that
> has better results for you.

It has! Now all attributes are readable. There quite a few attributes
with 0 min/max/step values. I guess that's just poorly implemented BIOS
again.

Here are the results

	$ fwupdmgr get-bios-settings

	gpu_oc_stat:
	  Setting type:         Integer
	  Current Value:        17
	  Description:          Set the GPU overclocking status
	  Read Only:            False
	  Minimum value:        0
	  Maximum value:        0
	  Scalar Increment:     0

	cpu_temp:
	  Setting type:         Integer
	  Current Value:        103
	  Description:          Set the CPU thermal load limit
	  Read Only:            False
	  Minimum value:        85
	  Maximum value:        105
	  Scalar Increment:     1

	gpu_nv_ac_offset:
	  Setting type:         Integer
	  Current Value:        55
	  Description:          Set the Nvidia GPU AC total processing power basel=
ine offset
	  Read Only:            False
	  Minimum value:        10
	  Maximum value:        80
	  Scalar Increment:     1

	gpu_nv_cpu_boost:
	  Setting type:         Integer
	  Current Value:        10
	  Description:          Set the Nvidia GPU to CPU dynamic boost limit
	  Read Only:            False
	  Minimum value:        0
	  Maximum value:        0
	  Scalar Increment:     0

	gpu_temp:
	  Setting type:         Integer
	  Current Value:        87
	  Description:          Set the GPU thermal load limit
	  Read Only:            False
	  Minimum value:        75
	  Maximum value:        87
	  Scalar Increment:     1

	ppt_pl1_spl:
	  Setting type:         Integer
	  Current Value:        70
	  Description:          Set the CPU sustained power limit
	  Read Only:            False
	  Minimum value:        50
	  Maximum value:        110
	  Scalar Increment:     1

	cpu_oc_stat:
	  Setting type:         Integer
	  Current Value:        16
	  Description:          Set the CPU overclocking status
	  Read Only:            False
	  Minimum value:        0
	  Maximum value:        0
	  Scalar Increment:     0

	ppt_cpu_cl:
	  Setting type:         Integer
	  Current Value:        65
	  Description:          Set the CPU cross loading power limit
	  Read Only:            False
	  Minimum value:        30
	  Maximum value:        75
	  Scalar Increment:     1

	ppt_pl2_sppt:
	  Setting type:         Integer
	  Current Value:        125
	  Description:          Set the CPU slow package power tracking limit
	  Read Only:            False
	  Minimum value:        60
	  Maximum value:        168
	  Scalar Increment:     1

	ppt_pl1_tau:
	  Setting type:         Integer
	  Current Value:        56
	  Description:          Set the CPU sustained power limit exceed duration
	  Read Only:            False
	  Minimum value:        0
	  Maximum value:        0
	  Scalar Increment:     0

	gpu_nv_ppab:
	  Setting type:         Integer
	  Current Value:        15
	  Description:          Set the Nvidia GPU power performance aware boost l=
imit
	  Read Only:            False
	  Minimum value:        0
	  Maximum value:        0
	  Scalar Increment:     0

	gpu_nv_ctgp:
	  Setting type:         Integer
	  Current Value:        65
	  Description:          Set the GPU configurable total graphics power
	  Read Only:            False
	  Minimum value:        0
	  Maximum value:        0
	  Scalar Increment:     0

I still can't write to them though. Every write gets ignored without
failing

	$ cat /sys/class/firmware-attributes/lenovo-wmi-other-0/attributes/ppt_pl2=
_sppt/current_value
	125

	$ echo 126 | sudo tee /sys/class/firmware-attributes/lenovo-wmi-other-0/at=
tributes/ppt_pl2_sppt/current_value
	126

	$ cat /sys/class/firmware-attributes/lenovo-wmi-other-0/attributes/ppt_pl2=
_sppt/current_value
	125

I tried writting to them using acpi_call and it works (0x7e =3D 126)

	$ echo '\_SB_.GZFD.WMAE 0 0x12 {0x00, 0x00, 0x01, 0x01, 0x7e, 0x00, 0x00, =
0x00}' | sudo tee /proc/acpi/call
	\_SB_.GZFD.WMAE 0 0x12 {0x00, 0x00, 0x01, 0x01, 0x7e, 0x00, 0x00, 0x00}

	$ sudo cat /proc/acpi/call
	0x0

	$ cat /sys/class/firmware-attributes/lenovo-wmi-other-0/attributes/ppt_pl2=
_sppt/current_value=20
	126

Maybe we can check if the tunable returns zero at the discovery phase
and add some kind of flag there `.no_mode =3D 1`. Then we can check that
flag when writting the attribute.

It's getting tricky because legion go 2 does enforce 0xFF mode when
writting, while my device enforces 0x00. Even worse, if I pass 0xFF it
returns 0, like it was successful...

	$ echo '\_SB_.GZFD.WMAE 0 0x12 {0x00, 0xFF, 0x01, 0x01, 0x7e, 0x00, 0x00, =
0x00}' | sudo tee /proc/acpi/call
	\_SB_.GZFD.WMAE 0 0x12 {0x00, 0xFF, 0x01, 0x01, 0x7e, 0x00, 0x00, 0x00}

	$ sudo cat /proc/acpi/call
	0x0

IMO we should check this no_mode stuff at the discovery phase.

>
> Thanks,
> Derek
>

--=20
Thanks,
 ~ Kurt
