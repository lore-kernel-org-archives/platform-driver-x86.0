Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD17923C8AE
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Feb 2026 23:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770420684; cv=none; b=kUVd6xmlg7nKF2Wukcb43RmEB9xQlRTNNqm2gZJylYyzjIzGZOP/43zB2j14kLO+bS9hawZ/R+6wVXPNMujIgK0LMwNhzlIKFRGMl3TR3Mjt9rp0IS4IQZo7OAJqgJ9M/Vt0rt6Kj26AjrF74S0ZJpTl6FnG6eOsvjNORIyg+r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770420684; c=relaxed/simple;
	bh=Q2G3Wx0WJQzYaEoiZbH10V7Oc3CecIW4MMb5VjvTZQ8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=FxYMAVsgSA72CH7iUIdLu020OMWxdYEZwDG0592dGDOz+8e8vukMGFC6l/cDSmNwWYusXgDleF+vAMpPK22+qTxPdN+3JajFNu3LKPdlQv8uFNZPpBx8lJYPBZliYrg6FeuZIfbeEAxO95gows0nhMlqOWWun/sxl9pWHmhnM8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qhug0KsE; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qhug0KsE"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b72e49776eso2009242eec.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Feb 2026 15:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770420683; x=1771025483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TNN+9jiT5b08tkW0hXoJQdwI6uumpbtEgDt34okHg48=;
        b=Qhug0KsEVHEdScIs0YmrzbcoZcvwVNCBQoswBQmvA8hVi8hHu1h0M/aiAAZ/oEU2dj
         62SJd4c+Km+nRX1Jc+ZgBYQpgL9BDH74+gFtl2PkI9luEvYjEYTshtjY8Ob4SVB2m2Hp
         caQGYBjFJORnkzStfv63wL/NN80xJ/7a08nMTIw+UyUia6kmSTKyEgzX7SWHOx2uyGPw
         MeldrUMX6DOScjqLp16vfi7t03JFrRjW9yqwgZz8bM/sYrCwcuRRWGEQCZak7Din88e8
         Jlbu9TdGFFIyfaBR7mk+tOmWSvkEPWfRcjiK9b4blIizkPDDbBg2mejdRgt+GGgwcg6l
         pGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770420683; x=1771025483;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TNN+9jiT5b08tkW0hXoJQdwI6uumpbtEgDt34okHg48=;
        b=HKm+5NdaG83E0qp2dxTJ8xSegdkIhUaOOsD91KgYV8gSYpc4i0SBUG2BSQZs2c7yep
         B4gsPyjWw3yg07UBBK7YV31JgEzVERCbjstDXP0fvN9vz0mXhxRjyBq775PlaSCkTYxr
         6OlQ7WvMG361oi25goN0hDAIVGshMdqFQjek8opp4jY0w3CVdxYxPnnrzw3qz1Dwr+V8
         AkC3gkF//yM8o0LcGr73aZrQ+IPuze3LiS81K3gNcNHAiThJD595bff7BYVaKazL40Oj
         88raYXAvf2Cyk9frNmxzsGZ2xvEgNpHaKcVyjhxA6PmAXRhMZCtq3XKWOapdXdG1EXEp
         u3/A==
X-Forwarded-Encrypted: i=1; AJvYcCUKvbUsbWH2c5yJEbJ5TpJo1GlAJ7tMgbGztE1q7DdALIpLkxABGjGLXwqqMS/rQbEG9GGd/GpLp+bDP1ZW120aCwXm@vger.kernel.org
X-Gm-Message-State: AOJu0YyzRn0mPQLmX4FiRodo44anys8Oiwi+gcf6hmICL2n8UE24s/2q
	oyPiok0cKUjJPY0cYRTdQqdQv1qipDgDQYTOf83nvA4DbCK6xt+ud6xq
X-Gm-Gg: AZuq6aIoRwgCWCN3zSyMrXCOh0SmAni9lFbQBWp8tOjkjRYsBeVsCgvRL7JFUv9G4Mk
	7rG48rOys0+kHZc2ohoUBfdycmb2RbodX56RMMgcsIez0gXProdWzu8Pb630ev24un1fG7dWr8g
	dYqV8mqapyuPSlpjvzUnteKmSe8gG27cmYnoY+32QFFSdbC1B0lu1WTUwdwIDT/TxP1Pi0Lq2HA
	bk5UTI6FC0FQjdJv6+szXs2FtWzSzfcaGnLkv/xx8k+7wyGAhZZdfrV+Eyjuvy5zsasdXQl7ExP
	BBg/A/pQppKLLPvLUkyY8BrIQU1xFp3z1ostO0kc3wa8wgMftFUT44f9+6r7pgJZeSgDrIGROs7
	6BzZRdru/Ot3Z8SlYpOCxEnDcutO0KgeblVEv+ffx6+ZoifhBiooS0EeaJHb6IeC6eG85IRd0Mv
	iFh8iRPZ+Dk0k2SC9H4uEqxA+soYWHKIvabvQhjhhGFGYTzFvdIG3m2QfTzJgxetjgFTnq567is
	MKmx+BcDQ==
X-Received: by 2002:a05:7300:8c03:b0:2b8:5159:eca5 with SMTP id 5a478bee46e88-2b8564a37e4mr1785958eec.14.1770420682555;
        Fri, 06 Feb 2026 15:31:22 -0800 (PST)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855c3db4asm3615042eec.18.2026.02.06.15.31.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 15:31:22 -0800 (PST)
Date: Fri, 06 Feb 2026 15:31:20 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>
CC: =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Armin Wolf <W_Armin@gmx.de>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 platform-driver-x86@vger.kernel.org
Subject: Re: Report: lenovo_wmi_other FW attributes always read 0
User-Agent: Thunderbird for Android
In-Reply-To: <6022d164dc499184345dd43bcbd196b39cc08ce9.camel@rong.moe>
References: <DG60P3SHXR8H.3NSEHMZ6J7XRC@gmail.com> <C18EFC0C-741A-4DF3-85A9-E3DE9CBC1737@gmail.com> <DG6BU3U96TTS.1XNHFL5NRADT5@gmail.com> <4C43FF8D-A529-4645-93E8-DF5E6734328A@gmail.com> <DG6KJR1FONK7.2TL5QSPZ2A4GA@gmail.com> <CAFqHKTn=0JS3jcp7FKYvfTHzG5u1kXXtavSK9hNEphagDiDdgA@mail.gmail.com> <CAFqHKTnpGTRuW=HMxSu2YQ9qq7inajXOT6p3Vpc8sg0v_EGQQw@mail.gmail.com> <DG77O19JWSAH.2TC5GU5CR5U5H@gmail.com> <CAFqHKTkHhx14rM7QTATLTq-ry1z53+D5h1y982gaBd+RbMNJAQ@mail.gmail.com> <6022d164dc499184345dd43bcbd196b39cc08ce9.camel@rong.moe>
Message-ID: <48408683-C3F7-454C-A0D1-7FC73FA69AF7@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On February 6, 2026 10:01:08 AM PST, Rong Zhang <i@rong=2Emoe> wrote:
>Hi Derek and Kurt,
>
>On Thu, 2026-02-05 at 23:11 -0800, Derek John Clark wrote:
>> On Thu, Feb 5, 2026 at 9:40=E2=80=AFAM Kurt Borja <kuurtb@gmail=2Ecom> =
wrote:
>> >=20
>> > On Wed Feb 4, 2026 at 10:13 PM -05, Derek John Clark wrote:
>> > > On Wed, Feb 4, 2026 at 4:04=E2=80=AFPM Derek John Clark
>> > > <derekjohn=2Eclark@gmail=2Ecom> wrote:
>> > > >=20
>> > > > On February 4, 2026 3:33:34 PM PST, Kurt Borja <kuurtb@gmail=2Eco=
m> wrote:
>> > > > > On Wed Feb 4, 2026 at 12:45 PM -05, Derek J=2E Clark wrote:
>> > > > > > On February 4, 2026 8:43:56 AM PST, Kurt Borja <kuurtb@gmail=
=2Ecom> wrote:
>> > > > > > > On Wed Feb 4, 2026 at 3:36 AM -05, Derek J=2E Clark wrote:
>> > > > > > > > On February 4, 2026 12:00:12 AM PST, Kurt Borja <kuurtb@g=
mail=2Ecom> wrote:
>> > > > > > > > > Hi all,
>> > > > > > > >=20
>> > > > > > > > Hi Kurt=2E
>> > > > > > >=20
>> > > > > > > Hi Derek,
>> > > > > > >=20
>> > > > > > > >=20
>> > > > > > > > > In my system (83KY Legion 7 16IAX1) the current_value o=
f any of the
>> > > > > > > > > firmware attributes exposed by this driver always reads=
 0
>> > > > > > > > >=20
>> > > > > > > > >   $ ls /sys/class/firmware-attributes/lenovo-wmi-other-=
0/attributes/
>> > > > > > > > >   ppt_pl1_spl  ppt_pl2_sppt  ppt_pl3_fppt
>> > > > > > > > >=20
>> > > > > > > > >   $ cat /sys/class/firmware-attributes/lenovo-wmi-other=
-0/attributes/*/current_value
>> > > > > > > > >   0
>> > > > > > > > >   0
>> > > > > > > > >   0
>> > > > > > > > >=20
>> > > > > > > > > After investigating my acpidump [1] I found that the ar=
gument passed to
>> > > > > > > > > the WMI method Arg2 is matched as a whole integer inste=
ad of individual
>> > > > > > > > > bytes (L: 49203)
>> > > > > > > > >=20
>> > > > > > > > >   If ((ToInteger (Arg2) =3D=3D 0x01010000))
>> > > > > > > > >   {
>> > > > > > > > >           Return (^^PC00=2ELPCB=2EEC0=2EF5E0) /* \_SB_=
=2EPC00=2ELPCB=2EEC0_=2EF5E0 */
>> > > > > > > > >   }
>> > > > > > > > >=20
>> > > > > > > > >   If ((ToInteger (Arg2) =3D=3D 0x01020000))
>> > > > > > > > >   {
>> > > > > > > > >           Return (^^PC00=2ELPCB=2EEC0=2ECCP1) /* \_SB_=
=2EPC00=2ELPCB=2EEC0_=2ECCP1 */
>> > > > > > > > >   }
>> > > > > > > > >=20
>> > > > > > > > >   If ((ToInteger (Arg2) =3D=3D 0x01030000))
>> > > > > > > > >   {
>> > > > > > > > >           /* This case (CPU FPPT) is actually just zero=
=2E=2E=2E */
>> > > > > > > > >           Return (Zero)
>> > > > > > > > >   }
>> > > > > > > > >=20
>> > > > > > > > > =2E=2E=2Eand the driver always sets the second byte of =
Arg2 to the current
>> > > > > > > > > profile (mode), which is never zero!
>> > > > > > > > >=20
>> > > > > > > > >   attribute_id =3D
>> > > > > > > > >           FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_att=
r->device_id) |
>> > > > > > > > >           FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_at=
tr->feature_id) |
>> > > > > > > > >   -->     FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
>> > > > > > > > >           FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_at=
tr->type_id);
>> > > > > > > > >=20
>> > > > > > > > > So it never actually matches the attribute and falls ba=
ck to zero :/
>> > > > > > > > >=20
>> > > > > > > > > This is however, not the case for all tunables=2E As yo=
u can see in the
>> > > > > > > > > acpidump, just bellow the block above, these are matche=
d depending on
>> > > > > > > > > the current mode (second byte)
>> > > > > > > >=20
>> > > > > > > > This typically means that the method is stubbed so that i=
t returns 0 on is_supported=2E During development I forgot to go back and a=
dd a check for this when adding the attributes=2E Per the spec, there is no=
 profile that corresponds to 0x00, so this is working as expected when show=
ing an unsupported attribute=2E If you add a debug print to the capdata dri=
ver when it is querying the attributes you can see the entries are empty=2E
>
>My device's capdata01 is completely stubbed, i=2Ee=2E, all entries are
>empty=2E I tested your repo and it did hide all attributes, thanks=2E
>
>> > > > > > > Hmm it's weird because if I read
>> > > > > > >=20
>> > > > > > >     \_SB_=2EPC00=2ELPCB=2EEC0_=2EF5E0
>> > > > > > >     \_SB_=2EPC00=2ELPCB=2EEC0_=2ECCP1
>> > > > > > >=20
>> > > > > > > directly, they show the correct SPPT and SPL values shown i=
n the windows
>> > > > > > > Legion Space app (under Custom mode)=2E
>> > > > > > >=20
>> > > > > > > It seems like these are supported?
>> > > > > >=20
>> > > > > > Oh, that is strange, yeah=2E It also explains why some things=
 just aren't working like they should=2E Once again the documentation is no=
t completely accurate for this interface, which is quite frustrating=2E=2E=
=2E I think I have a device with this problem as well that I haven't yet tr=
oubleshot in the new series, so I can work it locally=2E
>> > > > > >=20
>> > > > > > It sounds like I'll need to check if the current mode entry i=
s present in the cached data, and if not check if there is a  "no mode" pre=
sent=2E Traversing the list twice seems tedious & slow, so I'll probably re=
factor the capdata side to check for a match in bytes 0, 1, and 3, and if b=
yte 2 is 0 in the data then return that, but if it is missing continue to s=
earch for the match? They have historically been in ascending order (though=
, at this point I don't know if that can be trusted) I'm curious if any dev=
ices have both a 00 entry and mode specific entries, because that pattern w=
ould possibly break them=2E I could perhaps save the index of the 00 entry =
separately when it is seen, then keep looking for the exact match and, if n=
ot found, fall back to the saved index=2E That guarantees a maximum O(n) se=
arch every time, which isn't great either=2E
>
>How about sorting capdata entries so that we can bsearch() them?

Hi Rong,

That might be worth a shot, but also might not be worth the effort=2E I'm =
curious to know what Armin & Ilpo think=2E It's pretty low stakes either wa=
y but minor delays to boot time add up=2E

>> > > > > I checked the captada buffers in my device and the "mode" byte =
is never
>> > > > > zero :/ In fact every tunable is listed once for each mode, whi=
ch I
>> > > > > think is just normal behavior=2E
>> > > > >=20
>> > > > > Can you send me an acpidump of a device which enforces the mode=
 byte for
>> > > > > each tunable? I want to see how other devices do it=2E
>> > > > >=20
>> > > >=20
>> > > > I attached the Legion Go 2 acpidump
>> > > >=20
>> > > > > >=20
>> > > > > > I'd like to hear everyone else's thoughts, perhaps there's a =
more clever way we can do this efficiently and accurately=2E
>
>I am afraid I can't think of some useful ideas considering my device's
>capdata01 is stubbed :-/
>
>That being said, only the query method is stubbed, its data is still in
>the ACPI table as an ACPI package (with some nonsense data probably
>derived from other firmware projects):
>
>   Name (CD01, Package (0x46)
>   {
>       [=2E=2E=2E]
>   }
>
>> > > > > I think my firmware's behavior is just non-compliant with the
>> > > > > specification=2E In that case a quirk approach should work? The=
 only
>> > > > > problem would be the tunables that DO enforce the mode byte in =
my
>> > > > > system=2E
>> > > >=20
>> > > > I think doing it programmatically would be more effective if we c=
an
>> > > > get it to work=2E I'd imagine there are lots of models with rando=
m
>> > > > attributes that behave this way=2E
>> > > >=20
>> > > > > Another possibility is that there are some tunables that do not=
 enforce
>> > > > > modes (but don't necessarily reject them either)=2E
>> > > > >=20
>> > > > > Maybe a workaround for non-compliant attributes could work=2E S=
omething
>> > > > > dirty like
>> > > > >=20
>> > > > > zero_fallback:
>> > > > >       attribute_id =3D LWMI_ATTR_ID(tunable_attr->device_id, tu=
nable_attr->feature_id,
>> > > > >                                   mode, tunable_attr->type_id);
>> > > > >       ret =3D lwmi_cd01_get_data(priv->cd01_list, attribute_id,=
 &capdata);
>> > > > >       if (ret)
>> > > > >               return ret;
>> > > > >=20
>> > > > >       =2E=2E=2E
>> > > > >=20
>> > > > >       if (value =3D=3D 0) {
>> > > > >               mode =3D 0;
>> > > > >               goto zero_fallback;
>> > > > >       }
>> > > >=20
>> > > > That could work, though I'd do it like this to avoid infinite rec=
ursion:
>> > > >=20
>> > > > zero_fallback:
>> > > >         attribute_id =3D LWMI_ATTR_ID(tunable_attr->device_id,
>> > > > tunable_attr->feature_id,
>> > > >                                     mode, tunable_attr->type_id);
>> > > >         ret =3D lwmi_cd01_get_data(priv->cd01_list, attribute_id,=
 &capdata);
>> > > >         if (ret)
>> > > >                 return ret;
>> > > >=20
>> > > >=20
>> > > > if (value =3D=3D 0 & mode !=3D 0) {
>> > > >                 mode =3D 0;
>> > > >           goto zero_fallback;
>> > > >=20
>> > > >         if (value =3D=3D 0) {
>> > > >     return -EINVAL;
>> > > >         }
>> > > >=20
>> > > > I'll push something to that effect to my tree and we'll see how t=
hat
>> > > > works=2E The downside is traversing the list multiple times, and =
the
>> > > > need to put this in multiple _show functions=2E As a proof of con=
cept
>> > > > I'm fine with it though=2E
>> > > >=20
>> > > > - Derek
>> > > >=20
>> > > >=20
>> > >=20
>> > > Kurt,
>> > >=20
>> > > After adding the workaround as described I got some interesting
>> > > results=2E The attribute I have issues with in particular is cpu_te=
mp
>> > > (01040000)=2E This attribute has capdata for custom mode & shows fu=
ll
>> > > set/get support, but is hard coded to return 0 in the dsdt=2E That =
means
>> > > this isn't a "silver bullet" to work around a poorly implemented BI=
OS
>> > > it seems=2E
>> >=20
>> > In my system FPPT is also hardcoded to zero :/
>> >=20
>> > >=20
>> > > I did go back and recheck the documentation, and all these attribut=
es
>> > > do have a valid 00 mode in the docs that I overlooked before=2E It =
looks
>> > > like an older version of the spec possibly=2E The notes are fairly
>> > > sparse on it=2E
>> >=20
>> > Is the 0x00 mode actually a mode or just something like no-mode?
>> >=20
>> > I checked the acpidump you sent the SPPT tunable accepts valid modes =
and
>> > also the 0x00 mode when reading=2E=2E=2E that's interesting=2E
>
>Despite capdata01 being stubbed, I can get/set CPU_SPPT, CPU_SPL,
>CPU_FPPT and CPU_TEMP on my device by manually invoking acpi_call with
>appropriate arguments=2E These methods are not stubbed and only check dev
>and feat (mode and type can be any value)=2E
>
>There are also some interesting debug messages in the ACPI table=2E I've
>attached its acpidump for reference=2E

Oof, that is frustrating=2E I would like to be able to support anything th=
at has the interface but this is looking like we'd need to add a quirk tabl=
e if there's no capdata for the limits=2E That could get fairly tedious if =
only some of the methods are supported, and we don't have much historical d=
ata on what the limits for each attribute would be for these older model=2E=
 Looking at the OOT LenovoLegionLinux driver there doesn't appear to be a l=
egacy EC method to get them either=2E It might be better to just keep them =
inaccessible if the corresponding data isn't available=2E

You wouldn't happen to know if these methods are usable in Windows with th=
e legion software?

>> > > I updated by branch and also included a few lazy "info" debug
>> > > statements to help figure out what is going on=2E Let me know if th=
at
>> > > has better results for you=2E
>> >=20
>> > It has! Now all attributes are readable=2E There quite a few attribut=
es
>> > with 0 min/max/step values=2E I guess that's just poorly implemented =
BIOS
>> > again=2E
>> >=20
>> > Here are the results
>> >=20
>> >         $ fwupdmgr get-bios-settings
>> >=20
>> >         gpu_oc_stat:
>> >           Setting type:         Integer
>> >           Current Value:        17
>> >           Description:          Set the GPU overclocking status
>> >           Read Only:            False
>> >           Minimum value:        0
>> >           Maximum value:        0
>> >           Scalar Increment:     0
>> >=20
>> >         cpu_temp:
>> >           Setting type:         Integer
>> >           Current Value:        103
>> >           Description:          Set the CPU thermal load limit
>> >           Read Only:            False
>> >           Minimum value:        85
>> >           Maximum value:        105
>> >           Scalar Increment:     1
>> >=20
>> >         gpu_nv_ac_offset:
>> >           Setting type:         Integer
>> >           Current Value:        55
>> >           Description:          Set the Nvidia GPU AC total processin=
g power baseline offset
>> >           Read Only:            False
>> >           Minimum value:        10
>> >           Maximum value:        80
>> >           Scalar Increment:     1
>> >=20
>> >         gpu_nv_cpu_boost:
>> >           Setting type:         Integer
>> >           Current Value:        10
>> >           Description:          Set the Nvidia GPU to CPU dynamic boo=
st limit
>> >           Read Only:            False
>> >           Minimum value:        0
>> >           Maximum value:        0
>> >           Scalar Increment:     0
>> >=20
>> >         gpu_temp:
>> >           Setting type:         Integer
>> >           Current Value:        87
>> >           Description:          Set the GPU thermal load limit
>> >           Read Only:            False
>> >           Minimum value:        75
>> >           Maximum value:        87
>> >           Scalar Increment:     1
>> >=20
>> >         ppt_pl1_spl:
>> >           Setting type:         Integer
>> >           Current Value:        70
>> >           Description:          Set the CPU sustained power limit
>> >           Read Only:            False
>> >           Minimum value:        50
>> >           Maximum value:        110
>> >           Scalar Increment:     1
>> >=20
>> >         cpu_oc_stat:
>> >           Setting type:         Integer
>> >           Current Value:        16
>> >           Description:          Set the CPU overclocking status
>> >           Read Only:            False
>> >           Minimum value:        0
>> >           Maximum value:        0
>> >           Scalar Increment:     0
>> >=20
>> >         ppt_cpu_cl:
>> >           Setting type:         Integer
>> >           Current Value:        65
>> >           Description:          Set the CPU cross loading power limit
>> >           Read Only:            False
>> >           Minimum value:        30
>> >           Maximum value:        75
>> >           Scalar Increment:     1
>> >=20
>> >         ppt_pl2_sppt:
>> >           Setting type:         Integer
>> >           Current Value:        125
>> >           Description:          Set the CPU slow package power tracki=
ng limit
>> >           Read Only:            False
>> >           Minimum value:        60
>> >           Maximum value:        168
>> >           Scalar Increment:     1
>> >=20
>> >         ppt_pl1_tau:
>> >           Setting type:         Integer
>> >           Current Value:        56
>> >           Description:          Set the CPU sustained power limit exc=
eed duration
>> >           Read Only:            False
>> >           Minimum value:        0
>> >           Maximum value:        0
>> >           Scalar Increment:     0
>> >=20
>> >         gpu_nv_ppab:
>> >           Setting type:         Integer
>> >           Current Value:        15
>> >           Description:          Set the Nvidia GPU power performance =
aware boost limit
>> >           Read Only:            False
>> >           Minimum value:        0
>> >           Maximum value:        0
>> >           Scalar Increment:     0
>> >=20
>> >         gpu_nv_ctgp:
>> >           Setting type:         Integer
>> >           Current Value:        65
>> >           Description:          Set the GPU configurable total graphi=
cs power
>> >           Read Only:            False
>> >           Minimum value:        0
>> >           Maximum value:        0
>> >           Scalar Increment:     0
>>=20
>> That is encouraging, at least we're on the right path=2E
>>=20
>> > I still can't write to them though=2E Every write gets ignored withou=
t
>> > failing
>> >=20
>> >         $ cat /sys/class/firmware-attributes/lenovo-wmi-other-0/attri=
butes/ppt_pl2_sppt/current_value
>> >         125
>> >=20
>> >         $ echo 126 | sudo tee /sys/class/firmware-attributes/lenovo-w=
mi-other-0/attributes/ppt_pl2_sppt/current_value
>> >         126
>> >=20
>> >         $ cat /sys/class/firmware-attributes/lenovo-wmi-other-0/attri=
butes/ppt_pl2_sppt/current_value
>> >         125
>> >=20
>> > I tried writting to them using acpi_call and it works (0x7e =3D 126)
>> >=20
>> >         $ echo '\_SB_=2EGZFD=2EWMAE 0 0x12 {0x00, 0x00, 0x01, 0x01, 0=
x7e, 0x00, 0x00, 0x00}' | sudo tee /proc/acpi/call
>> >         \_SB_=2EGZFD=2EWMAE 0 0x12 {0x00, 0x00, 0x01, 0x01, 0x7e, 0x0=
0, 0x00, 0x00}
>> >=20
>> >         $ sudo cat /proc/acpi/call
>> >         0x0
>> >=20
>> >         $ cat /sys/class/firmware-attributes/lenovo-wmi-other-0/attri=
butes/ppt_pl2_sppt/current_value
>> >         126
>>=20
>> This is very annoying=2E Presumably that means your device is providing
>> good capdata for custom mode on some attributes? If that is the case
>> then it will bee very difficult to auto-discover the no-mode=2E
>
>While debugging, I found dumping all capdata entries will be very
>useful for adding support for new devices/interfaces and can make
>reports/discussions more clearer=2E Hence, I implemented a debugfs
>interface for this purpose=2E I am planning to submit it in a few days=2E
>If you would like to take an early preview, it can be found here:
>
>https://github=2Ecom/Rongronggg9/linux/tree/lwmi-debugfs

I'll take a look, thanks=2E

>> > Maybe we can check if the tunable returns zero at the discovery phase
>> > and add some kind of flag there `=2Eno_mode =3D 1`=2E Then we can che=
ck that
>> > flag when writting the attribute=2E
>> >=20
>> > It's getting tricky because legion go 2 does enforce 0xFF mode when
>> > writting, while my device enforces 0x00=2E Even worse, if I pass 0xFF=
 it
>> > returns 0, like it was successful=2E=2E=2E
>>=20
>> Indeed, I confirmed my device does the inverse=2E
>>=20
>>=20
>> >         $ echo '\_SB_=2EGZFD=2EWMAE 0 0x12 {0x00, 0xFF, 0x01, 0x01, 0=
x7e, 0x00, 0x00, 0x00}' | sudo tee /proc/acpi/call
>> >         \_SB_=2EGZFD=2EWMAE 0 0x12 {0x00, 0xFF, 0x01, 0x01, 0x7e, 0x0=
0, 0x00, 0x00}
>> >=20
>> >         $ sudo cat /proc/acpi/call
>> >         0x0
>> >=20
>> > IMO we should check this no_mode stuff at the discovery phase=2E
>>=20
>> I updated my branch to try and discover the GET and SET per attribute
>> during the is_supported phase by doing the fail loop there, once for
>> each=2E I store the modes that worked on new members of the tunable_att=
r
>> to reuse if either 0xff or 0x00 worked, and report -EOPNOTSUPP if
>> nothing worked=2E If that happens it won't create the attribute at all,
>> which eliminates showing attributes with botched implementations such
>> as the gpu_temp on Go 2=2E That will add a lot of wmi calls on init (up
>> to 2 per attribute in the config), but that might be preferable as it
>> eliminates the loops in the _store and _show functions for all the RO
>> and RW file descriptors=2E I check the capdata first at least to early
>> exit if the attribute isn't supported at all=2E
>>=20
>> To summarize the flow in is_suported is now:
>> - Check if there is a capdata block for the attribute under custom mode
>> - If that fails, check if there is a capdata block for the attribute
>> under no mode
>> - If both fail then return
>> - If one of them succeed, check if the attribute is supported in the
>> capdata block, return -EOPNOTSUPP if not=2E
>> - set the tunable_attr->get_mode_id to the successful mode=2E
>> - reset the mode var to custom, get the current value, and check if
>> the return value is 0
>> - if that fails, try again with no mode
>> - if both fail, return -EOPNOTSUPP
>> - If either pass, set the tunable_attr->set_mode_id to the successful m=
ode=2E
>> - return capdata->supported
>>=20
>> Then in the _show & _store functions I can just reuse the previously
>> discovered mode values=2E when getting the capdata or setting/getting
>> the current value itself=2E
>>=20
>> There is some hope perhaps in using the WMI interface version for a
>> quirk as well=2E 0x000c0000 "Get BIOS WMI Version" returns a u32 with
>> bytes 015 being minor version and 16-31 being the major version=2E If w=
e
>> were to quirk this then presumably that would have a discernible
>> pattern=2E It would require a large sample size to figure out which
>> devices do what exactly though, which would be less than ideal=2E
>
>FYI, my device doesn't implement 0x000c0000 and returns 0=2E

Interesting=2E I looked back at the documentation change log and that feat=
ure was added in WMI v2=2E3=2E Capdata was added in v2=2E1 and the smart fa=
n control was added in v2=2E2, so I'd assume you're either on 2=2E2 or your=
s is also an incomplete spec=2E

That is unfortunate, hopefully Kurt has some success with setting the attr=
ibutes using the updated is_supported=2E I'll probably need to also check f=
or stubbed but present capdata (all fields 0) as well, just in case there a=
re some additional outliers=2E

Thanks,
Derek

>Thanks,
>Rong
>
>> In any case, I've updated my branch with the changes=2E If that works
>> for you I'll clean it up a bit and start getting ready to submit for
>> review=2E I do have a couple more features to add on top of this issue
>> so my timeline for submitting has slid right about a week=2E
>>=20
>> Thanks,
>> Derek
>>=20
>> > >=20
>> > > Thanks,
>> > > Derek
>> > >=20
>> >=20
>> > --
>> > Thanks,
>> >  ~ Kurt

