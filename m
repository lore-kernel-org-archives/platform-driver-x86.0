Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F122BB13
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Feb 2026 14:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771337594; cv=pass; b=gdQ/5/yhO/D66/DyvOxheWjy1G2Q+D71ytTgCYIR+dCfUIoX6y+RrOjOIZwWrJIs7ST2PI6OHrWJst6U9minGSqHfkJ3GKtY34UqyhDtuWSWi2Ea2cL/lfcVD4OoIc9oMQ3HONGEV6VEtXCo1hBtg2y/bm/bUnCnGCHX2ZnzCrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771337594; c=relaxed/simple;
	bh=Fk24cpeyUJrt9hv5DFIPfzM4A90SBA+7mFNsYOmGzVg=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Ja7Sm2If8yQc5Z2Q9b2PuPYfJ8FGirLEXC8bnSU/pWQSoJzlDTPFWowhNqPNEUZi75xtyv6hpHJCcEuNTCDFQHFZGBXOgJ/pMmg1s8+J2FGeXmAAXgo84+vrLKAcFSuB3HzI7s27YbiQJGY3XFl4YQvT5bJUUeCrzOCFHXo4N3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=oYp/XbpT; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="oYp/XbpT"
ARC-Seal: i=1; a=rsa-sha256; t=1771337585; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=diGjJMXETCN5sU28DBzRP9+te75rLreCNMYqqUiqI1d53RCMqz5DKzZCYgLbfKLfgQJxA5UYa0Nz/UUiCjAr4EUSZ0vqu7ipdqya0i0ZB5vksQ+OFC/T7REwPgOgBDJhQpZRpzGISCfMGjM/mhLKLiP8GYLBfEAH98yTERuee1A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771337585; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=iyOdxHdPy4Uwwhdl0Sms+80dvfgqT13EgNgAB51hDG0=; 
	b=Kjh5OHdDHsUf/2HoqtSlim5SD4/fp3OF3rhkBzKRawd/91s/DLztv0aBIa/rCjeK0IXy8FKpM+DhcufGrAYNx2oDWtT3t+m+p6PVO+7HeOeN/mrks2blm2Ny+UrGoPQXALJok3EQQJdCbIk3ApFvuXcPYBt28smGiHCllBkSLA8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771337584;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=iyOdxHdPy4Uwwhdl0Sms+80dvfgqT13EgNgAB51hDG0=;
	b=oYp/XbpTfeSs89OtjG+M4bquPaXdm/1a88VCCemCt0tQhCJ3mz7y+2x77Dff5o6H
	k0C3qzgVQsQm4HJrPDvFTHJUD1IFHTY+rKIZvMG5E55DlY361Ul/cYNTUeRZupNBbLx
	dhIZJ921U2ruBkFKuRCgvnz2086pnZWSFNxRx2H+Vr8lZq/WtTN1E5mTNRnikrv42iC
	+rfk72TufvHHPTToJfn/W3BP+DAMbSlhad/z9foEkFhnMQxode9tzp3iNMnN4xkAKqV
	SOF6IgSHi85K51QO8lHb7K/AHYxgMaMBAliDJwD6UF6mxP6q+Q7rAkZiQAvy8I02Wcm
	a4Y8Ev/KTw==
Received: by mx.zohomail.com with SMTPS id 1771337583596675.9500302381153;
	Tue, 17 Feb 2026 06:13:03 -0800 (PST)
Message-ID: <44fe2de9f872554cf96fd8145c9a311617eb5752.camel@rong.moe>
Subject: Re: Report: lenovo_wmi_other FW attributes always read 0
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Kurt Borja
 <kuurtb@gmail.com>
Cc: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	platform-driver-x86@vger.kernel.org
In-Reply-To: <48408683-C3F7-454C-A0D1-7FC73FA69AF7@gmail.com>
References: <DG60P3SHXR8H.3NSEHMZ6J7XRC@gmail.com>
	 <C18EFC0C-741A-4DF3-85A9-E3DE9CBC1737@gmail.com>
	 <DG6BU3U96TTS.1XNHFL5NRADT5@gmail.com>
	 <4C43FF8D-A529-4645-93E8-DF5E6734328A@gmail.com>
	 <DG6KJR1FONK7.2TL5QSPZ2A4GA@gmail.com>
	 <CAFqHKTn=0JS3jcp7FKYvfTHzG5u1kXXtavSK9hNEphagDiDdgA@mail.gmail.com>
	 <CAFqHKTnpGTRuW=HMxSu2YQ9qq7inajXOT6p3Vpc8sg0v_EGQQw@mail.gmail.com>
	 <DG77O19JWSAH.2TC5GU5CR5U5H@gmail.com>
	 <CAFqHKTkHhx14rM7QTATLTq-ry1z53+D5h1y982gaBd+RbMNJAQ@mail.gmail.com>
	 <6022d164dc499184345dd43bcbd196b39cc08ce9.camel@rong.moe>
	 <48408683-C3F7-454C-A0D1-7FC73FA69AF7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Feb 2026 22:07:58 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-8 
X-ZohoMailClient: External

Hi Derek,

Sorry for the delay. I should have sent this but I somehow forgot it.

It's the Spring Festival (Chinese New Year) these days; hopefully I
will find some time looking into your recent patch series in a few
days.

On Fri, 2026-02-06 at 15:31 -0800, Derek J. Clark wrote:
> On February 6, 2026 10:01:08 AM PST, Rong Zhang <i@rong.moe> wrote:
> > Hi Derek and Kurt,
> >=20
> > On Thu, 2026-02-05 at 23:11 -0800, Derek John Clark wrote:
> > > On Thu, Feb 5, 2026 at 9:40=E2=80=AFAM Kurt Borja <kuurtb@gmail.com> =
wrote:
> > > >=20
> > > > On Wed Feb 4, 2026 at 10:13 PM -05, Derek John Clark wrote:
> > > > > On Wed, Feb 4, 2026 at 4:04=E2=80=AFPM Derek John Clark
> > > > > <derekjohn.clark@gmail.com> wrote:
> > > > > >=20
> > > > > > On February 4, 2026 3:33:34 PM PST, Kurt Borja <kuurtb@gmail.co=
m> wrote:
> > > > > > > On Wed Feb 4, 2026 at 12:45 PM -05, Derek J. Clark wrote:
> > > > > > > > On February 4, 2026 8:43:56 AM PST, Kurt Borja <kuurtb@gmai=
l.com> wrote:
> > > > > > > > > On Wed Feb 4, 2026 at 3:36 AM -05, Derek J. Clark wrote:
> > > > > > > > > > On February 4, 2026 12:00:12 AM PST, Kurt Borja <kuurtb=
@gmail.com> wrote:
> > > > > > > > > > > Hi all,
> > > > > > > > > >=20
> > > > > > > > > > Hi Kurt.
> > > > > > > > >=20
> > > > > > > > > Hi Derek,
> > > > > > > > >=20
> > > > > > > > > >=20
> > > > > > > > > > > In my system (83KY Legion 7 16IAX1) the current_value=
 of any of the
> > > > > > > > > > > firmware attributes exposed by this driver always rea=
ds 0
> > > > > > > > > > >=20
> > > > > > > > > > >   $ ls /sys/class/firmware-attributes/lenovo-wmi-othe=
r-0/attributes/
> > > > > > > > > > >   ppt_pl1_spl  ppt_pl2_sppt  ppt_pl3_fppt
> > > > > > > > > > >=20
> > > > > > > > > > >   $ cat /sys/class/firmware-attributes/lenovo-wmi-oth=
er-0/attributes/*/current_value
> > > > > > > > > > >   0
> > > > > > > > > > >   0
> > > > > > > > > > >   0
> > > > > > > > > > >=20
> > > > > > > > > > > After investigating my acpidump [1] I found that the =
argument passed to
> > > > > > > > > > > the WMI method Arg2 is matched as a whole integer ins=
tead of individual
> > > > > > > > > > > bytes (L: 49203)
> > > > > > > > > > >=20
> > > > > > > > > > >   If ((ToInteger (Arg2) =3D=3D 0x01010000))
> > > > > > > > > > >   {
> > > > > > > > > > >           Return (^^PC00.LPCB.EC0.F5E0) /* \_SB_.PC00=
.LPCB.EC0_.F5E0 */
> > > > > > > > > > >   }
> > > > > > > > > > >=20
> > > > > > > > > > >   If ((ToInteger (Arg2) =3D=3D 0x01020000))
> > > > > > > > > > >   {
> > > > > > > > > > >           Return (^^PC00.LPCB.EC0.CCP1) /* \_SB_.PC00=
.LPCB.EC0_.CCP1 */
> > > > > > > > > > >   }
> > > > > > > > > > >=20
> > > > > > > > > > >   If ((ToInteger (Arg2) =3D=3D 0x01030000))
> > > > > > > > > > >   {
> > > > > > > > > > >           /* This case (CPU FPPT) is actually just ze=
ro... */
> > > > > > > > > > >           Return (Zero)
> > > > > > > > > > >   }
> > > > > > > > > > >=20
> > > > > > > > > > > ...and the driver always sets the second byte of Arg2=
 to the current
> > > > > > > > > > > profile (mode), which is never zero!
> > > > > > > > > > >=20
> > > > > > > > > > >   attribute_id =3D
> > > > > > > > > > >           FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_a=
ttr->device_id) |
> > > > > > > > > > >           FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_=
attr->feature_id) |
> > > > > > > > > > >   -->     FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
> > > > > > > > > > >           FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_=
attr->type_id);
> > > > > > > > > > >=20
> > > > > > > > > > > So it never actually matches the attribute and falls =
back to zero :/
> > > > > > > > > > >=20
> > > > > > > > > > > This is however, not the case for all tunables. As yo=
u can see in the
> > > > > > > > > > > acpidump, just bellow the block above, these are matc=
hed depending on
> > > > > > > > > > > the current mode (second byte)
> > > > > > > > > >=20
> > > > > > > > > > This typically means that the method is stubbed so that=
 it returns 0 on is_supported. During development I forgot to go back and a=
dd a check for this when adding the attributes. Per the spec, there is no p=
rofile that corresponds to 0x00, so this is working as expected when showin=
g an unsupported attribute. If you add a debug print to the capdata driver =
when it is querying the attributes you can see the entries are empty.
> >=20
> > My device's capdata01 is completely stubbed, i.e., all entries are
> > empty. I tested your repo and it did hide all attributes, thanks.
> >=20
> > > > > > > > > Hmm it's weird because if I read
> > > > > > > > >=20
> > > > > > > > >     \_SB_.PC00.LPCB.EC0_.F5E0
> > > > > > > > >     \_SB_.PC00.LPCB.EC0_.CCP1
> > > > > > > > >=20
> > > > > > > > > directly, they show the correct SPPT and SPL values shown=
 in the windows
> > > > > > > > > Legion Space app (under Custom mode).
> > > > > > > > >=20
> > > > > > > > > It seems like these are supported?
> > > > > > > >=20
> > > > > > > > Oh, that is strange, yeah. It also explains why some things=
 just aren't working like they should. Once again the documentation is not =
completely accurate for this interface, which is quite frustrating... I thi=
nk I have a device with this problem as well that I haven't yet troubleshot=
 in the new series, so I can work it locally.
> > > > > > > >=20
> > > > > > > > It sounds like I'll need to check if the current mode entry=
 is present in the cached data, and if not check if there is a  "no mode" p=
resent. Traversing the list twice seems tedious & slow, so I'll probably re=
factor the capdata side to check for a match in bytes 0, 1, and 3, and if b=
yte 2 is 0 in the data then return that, but if it is missing continue to s=
earch for the match? They have historically been in ascending order (though=
, at this point I don't know if that can be trusted) I'm curious if any dev=
ices have both a 00 entry and mode specific entries, because that pattern w=
ould possibly break them. I could perhaps save the index of the 00 entry se=
parately when it is seen, then keep looking for the exact match and, if not=
 found, fall back to the saved index. That guarantees a maximum O(n) search=
 every time, which isn't great either.
> >=20
> > How about sorting capdata entries so that we can bsearch() them?
>=20
> Hi Rong,
>=20
> That might be worth a shot, but also might not be worth the effort. I'm c=
urious to know what Armin & Ilpo think. It's pretty low stakes either way b=
ut minor delays to boot time add up.

IIUC, `probe_type =3D PROBE_PREFER_ASYNCHRONOUS' has already made boot
time non-critical. The array retrieved from WMI queries should be
mostly ordered on most devices so sorting it shouldn't need too many
swap operations.

> > > > > > > I checked the captada buffers in my device and the "mode" byt=
e is never
> > > > > > > zero :/ In fact every tunable is listed once for each mode, w=
hich I
> > > > > > > think is just normal behavior.
> > > > > > >=20
> > > > > > > Can you send me an acpidump of a device which enforces the mo=
de byte for
> > > > > > > each tunable? I want to see how other devices do it.
> > > > > > >=20
> > > > > >=20
> > > > > > I attached the Legion Go 2 acpidump
> > > > > >=20
> > > > > > > >=20
> > > > > > > > I'd like to hear everyone else's thoughts, perhaps there's =
a more clever way we can do this efficiently and accurately.
> >=20
> > I am afraid I can't think of some useful ideas considering my device's
> > capdata01 is stubbed :-/
> >=20
> > That being said, only the query method is stubbed, its data is still in
> > the ACPI table as an ACPI package (with some nonsense data probably
> > derived from other firmware projects):
> >=20
> >   Name (CD01, Package (0x46)
> >   {
> >       [...]
> >   }
> >=20
> > > > > > > I think my firmware's behavior is just non-compliant with the
> > > > > > > specification. In that case a quirk approach should work? The=
 only
> > > > > > > problem would be the tunables that DO enforce the mode byte i=
n my
> > > > > > > system.
> > > > > >=20
> > > > > > I think doing it programmatically would be more effective if we=
 can
> > > > > > get it to work. I'd imagine there are lots of models with rando=
m
> > > > > > attributes that behave this way.
> > > > > >=20
> > > > > > > Another possibility is that there are some tunables that do n=
ot enforce
> > > > > > > modes (but don't necessarily reject them either).
> > > > > > >=20
> > > > > > > Maybe a workaround for non-compliant attributes could work. S=
omething
> > > > > > > dirty like
> > > > > > >=20
> > > > > > > zero_fallback:
> > > > > > >       attribute_id =3D LWMI_ATTR_ID(tunable_attr->device_id, =
tunable_attr->feature_id,
> > > > > > >                                   mode, tunable_attr->type_id=
);
> > > > > > >       ret =3D lwmi_cd01_get_data(priv->cd01_list, attribute_i=
d, &capdata);
> > > > > > >       if (ret)
> > > > > > >               return ret;
> > > > > > >=20
> > > > > > >       ...
> > > > > > >=20
> > > > > > >       if (value =3D=3D 0) {
> > > > > > >               mode =3D 0;
> > > > > > >               goto zero_fallback;
> > > > > > >       }
> > > > > >=20
> > > > > > That could work, though I'd do it like this to avoid infinite r=
ecursion:
> > > > > >=20
> > > > > > zero_fallback:
> > > > > >         attribute_id =3D LWMI_ATTR_ID(tunable_attr->device_id,
> > > > > > tunable_attr->feature_id,
> > > > > >                                     mode, tunable_attr->type_id=
);
> > > > > >         ret =3D lwmi_cd01_get_data(priv->cd01_list, attribute_i=
d, &capdata);
> > > > > >         if (ret)
> > > > > >                 return ret;
> > > > > >=20
> > > > > >=20
> > > > > > if (value =3D=3D 0 & mode !=3D 0) {
> > > > > >                 mode =3D 0;
> > > > > >           goto zero_fallback;
> > > > > >=20
> > > > > >         if (value =3D=3D 0) {
> > > > > >     return -EINVAL;
> > > > > >         }
> > > > > >=20
> > > > > > I'll push something to that effect to my tree and we'll see how=
 that
> > > > > > works. The downside is traversing the list multiple times, and =
the
> > > > > > need to put this in multiple _show functions. As a proof of con=
cept
> > > > > > I'm fine with it though.
> > > > > >=20
> > > > > > - Derek
> > > > > >=20
> > > > > >=20
> > > > >=20
> > > > > Kurt,
> > > > >=20
> > > > > After adding the workaround as described I got some interesting
> > > > > results. The attribute I have issues with in particular is cpu_te=
mp
> > > > > (01040000). This attribute has capdata for custom mode & shows fu=
ll
> > > > > set/get support, but is hard coded to return 0 in the dsdt. That =
means
> > > > > this isn't a "silver bullet" to work around a poorly implemented =
BIOS
> > > > > it seems.
> > > >=20
> > > > In my system FPPT is also hardcoded to zero :/
> > > >=20
> > > > >=20
> > > > > I did go back and recheck the documentation, and all these attrib=
utes
> > > > > do have a valid 00 mode in the docs that I overlooked before. It =
looks
> > > > > like an older version of the spec possibly. The notes are fairly
> > > > > sparse on it.
> > > >=20
> > > > Is the 0x00 mode actually a mode or just something like no-mode?
> > > >=20
> > > > I checked the acpidump you sent the SPPT tunable accepts valid mode=
s and
> > > > also the 0x00 mode when reading... that's interesting.
> >=20
> > Despite capdata01 being stubbed, I can get/set CPU_SPPT, CPU_SPL,
> > CPU_FPPT and CPU_TEMP on my device by manually invoking acpi_call with
> > appropriate arguments. These methods are not stubbed and only check dev
> > and feat (mode and type can be any value).
> >=20
> > There are also some interesting debug messages in the ACPI table. I've
> > attached its acpidump for reference.
>=20
> Oof, that is frustrating. I would like to be able to support anything tha=
t has the interface but this is looking like we'd need to add a quirk table=
 if there's no capdata for the limits. That could get fairly tedious if onl=
y some of the methods are supported, and we don't have much historical data=
 on what the limits for each attribute would be for these older model. Look=
ing at the OOT LenovoLegionLinux driver there doesn't appear to be a legacy=
 EC method to get them either. It might be better to just keep them inacces=
sible if the corresponding data isn't available.

Just to note: my device has no GameZone support, so ignoring GameZone
mode is also required to get a quirk table useful.

I might add a DMI-based quirk table if I found it useful... For now
tuning them with ryzenadj fulfills my demands.

> You wouldn't happen to know if these methods are usable in Windows with t=
he legion software?

Nope. My device is not a Legion branded laptop, and I hardly use
Windows. I agree that we can just keep them inaccessible for the time
being if the corresponding data isn't available.

Thanks,
Rong

> > > > > I updated by branch and also included a few lazy "info" debug
> > > > > statements to help figure out what is going on. Let me know if th=
at
> > > > > has better results for you.
> > > >=20
> > > > It has! Now all attributes are readable. There quite a few attribut=
es
> > > > with 0 min/max/step values. I guess that's just poorly implemented =
BIOS
> > > > again.
> > > >=20
> > > > Here are the results
> > > >=20
> > > >         $ fwupdmgr get-bios-settings
> > > >=20
> > > >         gpu_oc_stat:
> > > >           Setting type:         Integer
> > > >           Current Value:        17
> > > >           Description:          Set the GPU overclocking status
> > > >           Read Only:            False
> > > >           Minimum value:        0
> > > >           Maximum value:        0
> > > >           Scalar Increment:     0
> > > >=20
> > > >         cpu_temp:
> > > >           Setting type:         Integer
> > > >           Current Value:        103
> > > >           Description:          Set the CPU thermal load limit
> > > >           Read Only:            False
> > > >           Minimum value:        85
> > > >           Maximum value:        105
> > > >           Scalar Increment:     1
> > > >=20
> > > >         gpu_nv_ac_offset:
> > > >           Setting type:         Integer
> > > >           Current Value:        55
> > > >           Description:          Set the Nvidia GPU AC total process=
ing power baseline offset
> > > >           Read Only:            False
> > > >           Minimum value:        10
> > > >           Maximum value:        80
> > > >           Scalar Increment:     1
> > > >=20
> > > >         gpu_nv_cpu_boost:
> > > >           Setting type:         Integer
> > > >           Current Value:        10
> > > >           Description:          Set the Nvidia GPU to CPU dynamic b=
oost limit
> > > >           Read Only:            False
> > > >           Minimum value:        0
> > > >           Maximum value:        0
> > > >           Scalar Increment:     0
> > > >=20
> > > >         gpu_temp:
> > > >           Setting type:         Integer
> > > >           Current Value:        87
> > > >           Description:          Set the GPU thermal load limit
> > > >           Read Only:            False
> > > >           Minimum value:        75
> > > >           Maximum value:        87
> > > >           Scalar Increment:     1
> > > >=20
> > > >         ppt_pl1_spl:
> > > >           Setting type:         Integer
> > > >           Current Value:        70
> > > >           Description:          Set the CPU sustained power limit
> > > >           Read Only:            False
> > > >           Minimum value:        50
> > > >           Maximum value:        110
> > > >           Scalar Increment:     1
> > > >=20
> > > >         cpu_oc_stat:
> > > >           Setting type:         Integer
> > > >           Current Value:        16
> > > >           Description:          Set the CPU overclocking status
> > > >           Read Only:            False
> > > >           Minimum value:        0
> > > >           Maximum value:        0
> > > >           Scalar Increment:     0
> > > >=20
> > > >         ppt_cpu_cl:
> > > >           Setting type:         Integer
> > > >           Current Value:        65
> > > >           Description:          Set the CPU cross loading power lim=
it
> > > >           Read Only:            False
> > > >           Minimum value:        30
> > > >           Maximum value:        75
> > > >           Scalar Increment:     1
> > > >=20
> > > >         ppt_pl2_sppt:
> > > >           Setting type:         Integer
> > > >           Current Value:        125
> > > >           Description:          Set the CPU slow package power trac=
king limit
> > > >           Read Only:            False
> > > >           Minimum value:        60
> > > >           Maximum value:        168
> > > >           Scalar Increment:     1
> > > >=20
> > > >         ppt_pl1_tau:
> > > >           Setting type:         Integer
> > > >           Current Value:        56
> > > >           Description:          Set the CPU sustained power limit e=
xceed duration
> > > >           Read Only:            False
> > > >           Minimum value:        0
> > > >           Maximum value:        0
> > > >           Scalar Increment:     0
> > > >=20
> > > >         gpu_nv_ppab:
> > > >           Setting type:         Integer
> > > >           Current Value:        15
> > > >           Description:          Set the Nvidia GPU power performanc=
e aware boost limit
> > > >           Read Only:            False
> > > >           Minimum value:        0
> > > >           Maximum value:        0
> > > >           Scalar Increment:     0
> > > >=20
> > > >         gpu_nv_ctgp:
> > > >           Setting type:         Integer
> > > >           Current Value:        65
> > > >           Description:          Set the GPU configurable total grap=
hics power
> > > >           Read Only:            False
> > > >           Minimum value:        0
> > > >           Maximum value:        0
> > > >           Scalar Increment:     0
> > >=20
> > > That is encouraging, at least we're on the right path.
> > >=20
> > > > I still can't write to them though. Every write gets ignored withou=
t
> > > > failing
> > > >=20
> > > >         $ cat /sys/class/firmware-attributes/lenovo-wmi-other-0/att=
ributes/ppt_pl2_sppt/current_value
> > > >         125
> > > >=20
> > > >         $ echo 126 | sudo tee /sys/class/firmware-attributes/lenovo=
-wmi-other-0/attributes/ppt_pl2_sppt/current_value
> > > >         126
> > > >=20
> > > >         $ cat /sys/class/firmware-attributes/lenovo-wmi-other-0/att=
ributes/ppt_pl2_sppt/current_value
> > > >         125
> > > >=20
> > > > I tried writting to them using acpi_call and it works (0x7e =3D 126=
)
> > > >=20
> > > >         $ echo '\_SB_.GZFD.WMAE 0 0x12 {0x00, 0x00, 0x01, 0x01, 0x7=
e, 0x00, 0x00, 0x00}' | sudo tee /proc/acpi/call
> > > >         \_SB_.GZFD.WMAE 0 0x12 {0x00, 0x00, 0x01, 0x01, 0x7e, 0x00,=
 0x00, 0x00}
> > > >=20
> > > >         $ sudo cat /proc/acpi/call
> > > >         0x0
> > > >=20
> > > >         $ cat /sys/class/firmware-attributes/lenovo-wmi-other-0/att=
ributes/ppt_pl2_sppt/current_value
> > > >         126
> > >=20
> > > This is very annoying. Presumably that means your device is providing
> > > good capdata for custom mode on some attributes? If that is the case
> > > then it will bee very difficult to auto-discover the no-mode.
> >=20
> > While debugging, I found dumping all capdata entries will be very
> > useful for adding support for new devices/interfaces and can make
> > reports/discussions more clearer. Hence, I implemented a debugfs
> > interface for this purpose. I am planning to submit it in a few days.
> > If you would like to take an early preview, it can be found here:
> >=20
> > https://github.com/Rongronggg9/linux/tree/lwmi-debugfs
>=20
> I'll take a look, thanks.
>=20
> > > > Maybe we can check if the tunable returns zero at the discovery pha=
se
> > > > and add some kind of flag there `.no_mode =3D 1`. Then we can check=
 that
> > > > flag when writting the attribute.
> > > >=20
> > > > It's getting tricky because legion go 2 does enforce 0xFF mode when
> > > > writting, while my device enforces 0x00. Even worse, if I pass 0xFF=
 it
> > > > returns 0, like it was successful...
> > >=20
> > > Indeed, I confirmed my device does the inverse.
> > >=20
> > >=20
> > > >         $ echo '\_SB_.GZFD.WMAE 0 0x12 {0x00, 0xFF, 0x01, 0x01, 0x7=
e, 0x00, 0x00, 0x00}' | sudo tee /proc/acpi/call
> > > >         \_SB_.GZFD.WMAE 0 0x12 {0x00, 0xFF, 0x01, 0x01, 0x7e, 0x00,=
 0x00, 0x00}
> > > >=20
> > > >         $ sudo cat /proc/acpi/call
> > > >         0x0
> > > >=20
> > > > IMO we should check this no_mode stuff at the discovery phase.
> > >=20
> > > I updated my branch to try and discover the GET and SET per attribute
> > > during the is_supported phase by doing the fail loop there, once for
> > > each. I store the modes that worked on new members of the tunable_att=
r
> > > to reuse if either 0xff or 0x00 worked, and report -EOPNOTSUPP if
> > > nothing worked. If that happens it won't create the attribute at all,
> > > which eliminates showing attributes with botched implementations such
> > > as the gpu_temp on Go 2. That will add a lot of wmi calls on init (up
> > > to 2 per attribute in the config), but that might be preferable as it
> > > eliminates the loops in the _store and _show functions for all the RO
> > > and RW file descriptors. I check the capdata first at least to early
> > > exit if the attribute isn't supported at all.
> > >=20
> > > To summarize the flow in is_suported is now:
> > > - Check if there is a capdata block for the attribute under custom mo=
de
> > > - If that fails, check if there is a capdata block for the attribute
> > > under no mode
> > > - If both fail then return
> > > - If one of them succeed, check if the attribute is supported in the
> > > capdata block, return -EOPNOTSUPP if not.
> > > - set the tunable_attr->get_mode_id to the successful mode.
> > > - reset the mode var to custom, get the current value, and check if
> > > the return value is 0
> > > - if that fails, try again with no mode
> > > - if both fail, return -EOPNOTSUPP
> > > - If either pass, set the tunable_attr->set_mode_id to the successful=
 mode.
> > > - return capdata->supported
> > >=20
> > > Then in the _show & _store functions I can just reuse the previously
> > > discovered mode values. when getting the capdata or setting/getting
> > > the current value itself.
> > >=20
> > > There is some hope perhaps in using the WMI interface version for a
> > > quirk as well. 0x000c0000 "Get BIOS WMI Version" returns a u32 with
> > > bytes 015 being minor version and 16-31 being the major version. If w=
e
> > > were to quirk this then presumably that would have a discernible
> > > pattern. It would require a large sample size to figure out which
> > > devices do what exactly though, which would be less than ideal.
> >=20
> > FYI, my device doesn't implement 0x000c0000 and returns 0.
>=20
> Interesting. I looked back at the documentation change log and that featu=
re was added in WMI v2.3. Capdata was added in v2.1 and the smart fan contr=
ol was added in v2.2, so I'd assume you're either on 2.2 or yours is also a=
n incomplete spec.
>=20
> That is unfortunate, hopefully Kurt has some success with setting the att=
ributes using the updated is_supported. I'll probably need to also check fo=
r stubbed but present capdata (all fields 0) as well, just in case there ar=
e some additional outliers.
>=20
> Thanks,
> Derek
>=20
> > Thanks,
> > Rong
> >=20
> > > In any case, I've updated my branch with the changes. If that works
> > > for you I'll clean it up a bit and start getting ready to submit for
> > > review. I do have a couple more features to add on top of this issue
> > > so my timeline for submitting has slid right about a week.
> > >=20
> > > Thanks,
> > > Derek
> > >=20
> > > > >=20
> > > > > Thanks,
> > > > > Derek
> > > > >=20
> > > >=20
> > > > --
> > > > Thanks,
> > > >  ~ Kurt
