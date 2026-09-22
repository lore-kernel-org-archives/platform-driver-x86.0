Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF874560AD7;
	Tue, 22 Sep 2026 16:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790093083; cv=pass; b=FXjV3dcKAvYJw+NWyeyG8BNgi9Uuspof1gPq9Tht8yzb/VLjXv1Sm6/YJaOFPJW3jTcV9yeMLU6no4SLpMOYUNeVw/R7yc4NAY+YBsw9ptjPnw4Gq68oRDfuFdL/ZFE1PQ4vdtiMldlwEUrYm88KUcgvn03jq4twdZG7JEfcebs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790093083; c=relaxed/simple;
	bh=tONYzLwLuCWfLpil6WgDLpg2qtRbQDxVJOviPblVqtw=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=SpNO0FY9Fw5IcxsInPllgwX6Rtk+FM7P8dpF01J5Xj3P3kHalstTxU1BdDcwQX4Px/3VD9a0oeJ5fKeZTD7MmNtQHCswCe0pIT0g487n2ZMGez0DRQXWs/IovndKngStgEnLuVZsuPAEg1wFHwwa/wxAMTml/WaXjZqQ9QyqW1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Jif3taBe; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Jif3taBe"
ARC-Seal: i=1; a=rsa-sha256; t=1790093050; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mcUz2wA8FnTGmMGmfZdcNe332UKS6M61/SYbhhu9NWYejG5SD8MA1qytaSDyhbW9zQJBgHRlMIlzygBkkTKE9Z4O31BOQ1fQhoQ8S1ROr7Y8re+/SDLA81++FIxwtXFaQQCObYA7Pio983G4sPQSdGxsP0n7jcjdDAFQg8YPETg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790093050; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7gA9j3WhcFciG20JoDQCkePVC9InuZr68sThPnnJEyY=; 
	b=mU/CFRjc+Out+qrG+iZb04rEJtiht6sADSYXwdlXBMz7j7KFyW1WlORNyyQ/nMxssXsiBwGhS3Bujqi8zG+LLQ4OU+tDnLFbEcX+oT/IhztBcQtzkXBhOWWZba/0CpmDT9y7AeEYHoobYyghvREhRV/B2ZkBp8XlsVSLIIOsLCU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790093050;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=7gA9j3WhcFciG20JoDQCkePVC9InuZr68sThPnnJEyY=;
	b=Jif3taBeWkfTn1xzKn+QQ25HO/ctIwL7x3mx32i0eCObp5RaXcfrcCrFJml/RQO7
	dXQ1J9z5t5akZqTWAzwqvYbNVM8uXk3shoRHZt4FCRpRprjcMVxAhhCgPk4zjED5Hnn
	81c90nWW0L/RjAYcu/K6VqT+LQt7sIw4yf30O5iupQ9cAI4TOD4QagNp0ZizK452f03
	4kq96Pb4XuPiKUQf/ZSdoEpjfPvEFnQvCGkxsx7mUDifOfWQReFgiYX0Vu+hdVye0Am
	a4w5zPqal0q7WHjlyrzL0dY1vuJMrgbCwhWRCaxAuBwoB9iJOZPF+U5yXyDfviMh7Q7
	B3EFO4jUPQ==
Received: by smtp.zohomail.com with SMTPS id 1790093048105954.7656900809674;
	Tue, 22 Sep 2026 09:04:08 -0700 (PDT)
Message-ID: <271a88b113a0734b150d5a0d812c4c6e2a6418e3.camel@rong.moe>
Subject: Re: [PATCH v2] platform/x86: ideapad-laptop: Report camera switch
 as SW_CAMERA_LENS_COVER
From: Rong Zhang <i@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, Marco Giunta
	 <marco_giunta@outlook.it>
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>, Hans de Goede
	 <hansg@kernel.org>, Huang Wei <huangwei@kylinos.cn>, Ike Panhc
	 <ikepanhc@gmail.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
	 <ilpo.jarvinen@linux.intel.com>, linux-kernel@vger.kernel.org, 
 "platform-driver-x86@vger.kernel.org"
	 <platform-driver-x86@vger.kernel.org>
In-Reply-To: <048278d5-8c58-415f-890a-3ca45f3d31c9@app.fastmail.com>
References: <d867a4f6b798809776164542972e68d724f29fd5.camel@rong.moe>
	 <SN6PR19MB2303278926469783FA99824CFC842@SN6PR19MB2303.namprd19.prod.outlook.com>
	 <9be0971e7f84162bc57e01eb4cde508ed15e3096.camel@rong.moe>
	 <048278d5-8c58-415f-890a-3ca45f3d31c9@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 23:58:57 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Mark,

On Tue, 2026-09-22 at 11:52 -0400, Mark Pearson wrote:
> Hi Rong
>=20
> On Tue, Sep 22, 2026, at 8:18 AM, Rong Zhang wrote:
> > Hi Marco,
> >=20
> > On Mon, 2026-09-21 at 21:00 +0200, Marco Giunta wrote:
> > > Hi Rong,
> > >=20
> > > Thank you so much for your detailed reply and the much improved patch=
.
> > >=20
> > > Let me immediately go on record and say that, apart from a small addi=
tion
> > > to the SMI driver and one line in ideapad-laptop, I am mostly active =
in
> > > the sound system, and therefore consider myself a platform/x86 newbie=
.
> > > So I really appreciate you sharing your knowledge here.
> > >=20
> > > > > * I considered a couple of alternatives to the approach in this p=
atch:
> > > > >=20
> > > > >   1.  Simply map 0x0c and 0x0d to KEY_CAMERA_ACCESS_ENABLE/DISABL=
E:
> > > > >=20
> > > > >       { KE_KEY,	0x0c | IDEAPAD_WMI_KEY, { KEY_CAMERA_ACCESS_ENABL=
E } },
> > > > >       { KE_KEY,	0x0d | IDEAPAD_WMI_KEY, { KEY_CAMERA_ACCESS_DISAB=
LE } },
> > > > >=20
> > > > >       similar to the touchpad off/on hkey events (66/67) this dri=
ver emits
> > > > >       after the firmware has toggled the touchpad state. However,=
 HUTRR72
> > > > >       describes these hkey events as asserting a camera access st=
ate for
> > > > >       the host to apply, rather than reporting one the firmware h=
as
> > > > >       already applied.
> > > > >=20
> > > >=20
> > > > Well, it really doesn't matter how the specification says; what mat=
ters
> > > > is how devices in reality do: whenever the HID Usage Table doesn't =
define
> > > > a usage for hardware/firmware to report the already-applied value b=
ut
> > > > defines a usage for notifying the host to apply a specific value, a=
 lot
> > > > of devices will emerge, using the latter even when the former is
> > > > intended.
> > > >=20
> > > > For example, many USB Audio Class devices come with volume control
> > > > buttons or knobs. Some of them tune the volume themselves as well a=
s
> > > > emitting Volume Increment/Decrement HID events.
> > > >=20
> > > > In this case, the audio stack, in response to the HID events,
> > > > intentionally overrides the volume set by hardware, effectively
> > > > synchronizing the hardware and software volume value.
> > > >=20
> > > > The pattern has become so common that many devices like that also
> > > > implement an internal timeout mechanism. They only set the volume
> > > > themselves when reaching the timeout with no UAC volume control req=
uest
> > > > received.
> > > >=20
> > > > IOW, it doesn't matter whether the hardware/firmware has done its j=
ob as
> > > > long as the subsequent software control is harmless. That's why we =
can
> > > > safely use KEY_TOUCHPAD_ON/OFF even if the firmware has toggled the
> > > > touchpad state. They cause the desktop environment to mask/unmask
> > > > touchpad input, which is essentially a no-op (thus a safe operation=
) when
> > > > the firmware has already disabled/enabled the touchpad.
> > > >=20
> > > > Fundamentally speaking, using KEY_CAMERA_ACCESS_ENABLE/DISABLE is a=
lso
> > > > OK. It's just...
> > > >=20
> > > > > Furthermore, lenovo-wmi-camera moved away from
> > > > >       these hkey events in favor of SW_CAMERA_LENS_COVER in the q=
uoted
> > > > >       commit, which is arguably the closest relevant precedent.
> > > >=20
> > > > ...relatively new and isn't widely used compared to SW_CAMERA_LENS_=
COVER.
> > > >=20
> > > > Thus, I agreed that using SW_CAMERA_LENS_COVER is a better approach=
 as it
> > > > aligns with other drivers' behavior. The patch seems over-engineere=
d
> > > > though, see below.
> > >=20
> > > This seems pretty reasonable to me, I figured that a single standard =
was
> > > hard to enforce and also not strictly needed in practice (the "harmle=
ss
> > > no-op" argument above).
> > > I was mostly wondering about certain discussions I saw online while d=
oing
> > > research for this patch of people arguing that such a no-op should be
> > > avoided, see e.g.:
> > > https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/merge_requests=
/181
> >=20
> > Thanks for the context. I didn't know the behavior of GNOME as I use KD=
E
> > Plasma, whose behavior is unmask/mask touchpad events on
> > KEY_TOUCHPAD_ON/OFF.
> >=20
> > >=20
> > > Still, your point that userspace duplicating an action already applie=
d by
> > > the hardware is common practice, and fine as long as it is harmless, =
makes
> > > perfect sense to me. So overall I have no objections to your reasonin=
g here.
> > >=20
> > > > >=20
> > > > >   2.  Ignore these events like the firmware-handled FnLock events=
:
> > > > >=20
> > > > > 			{ KE_IGNORE,	0x0c | IDEAPAD_WMI_KEY },
> > > > > 			{ KE_IGNORE,	0x0d | IDEAPAD_WMI_KEY },
> > > > >=20
> > > > >       This fixes the KEY_UNKNOWN issue, but userspace gets no inf=
ormation.
> > > > >=20
> > > > >   Overall, in the end I copied the approach of the lenovo-wmi-cam=
era
> > > > >   driver. Kindly let me know if there are other/better solutions.
> > > > >=20
> > > > > * Unlike the touchpad, whose state this driver reads with VPCCMD_=
R_TOUCHPAD
> > > > >   at probe, on resume and on each event,
> > > > >=20
> > > >=20
> > > > At least for the input device, the synchronization on probe or on r=
esume
> > > > does not matter, as no input event is emitted due to !send_events.
> > >=20
> > > Good point, I was conflating stuff.
> > >=20
> > > > > the camera switch state is only
> > > > >   available in EC-private fields, and the two tested laptops even=
 use
> > > > >   different ones. Hence the lenovo-wmi-camera approach: the switc=
h appears
> > > > >   on the first event, and a change made while suspended is not re=
ported,
> > > > >   leaving the state wrong until the switch is toggled again.
> > > >=20
> > > > So the difference compared to the lenovo-wmi-camera approach is onl=
y
> > > > about when and how the input device is registered.
> > > >=20
> > > > On recent models, the firmware neither emits VPCCMD_R_TOUCHPAD nor
> > > > toggles the touchpad. It leaves the job to software by emitting WMI=
 key
> > > > event 0x29, which is converted to KEY_TOUCHPAD_TOGGLE via ideapad_k=
eymap.
> > > > It'd be tidier to take that approach and reuse the existing input d=
evice.
> > > > Sparse keymap supports KEY_SW, so it's viable to map the two WMI ev=
ents
> > > > to SW_CAMERA_LENS_COVER with appropriate switch value.
> > >=20
> > > This makes a lot of sense to me. I appreciate the simplicity of this
> > > approach.
> > >=20
> > > Part of the reason why I initially adopted the "separate input device=
"
> > > approach was this comment from
> > > drivers/platform/x86/dell/dell-wmi-privacy.c:
> > >=20
> > > /*
> > >  * Unlike keys where only presses matter, userspace may act
> > >  * on switches in both of their positions. Only register
> > >  * SW_CAMERA_LENS_COVER if it is actually there.
> > >  */
> >=20
> > Hmm, this makes some sense. Ideally we should prevent exposing
> > SW_CAMERA_LENS_COVER unless it's there. I wonder, if the capability is
> > declared in LENOVO_UTILITY_DATA? AFAIK, LENOVO_UTILITY_EVENT (8FC0DE0C-
> > B4E4-43FD-B0F3-8871711C1294) shares the same ACPI device as
> > LENOVO_UTILITY_DATA (CE6C0974-0407-4F50-88BA-4FC3B6559AD8). The former'=
s
> > driver is ideapad-laptop, while latter's driver is lenovo-wmi-hotkey-
> > utilities.
> >=20
> >    [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),=20
> > Description("Lenovo Utility Key Press Event"),=20
> > guid("{8fc0de0c-b4e4-43fd-b0f3-8871711c1294}")]
> >    class LENOVO_UTILITY_EVENT : WMIEvent {
> >      [key, read] string InstanceName;
> >      [read] boolean Active;
> >      [WmiDataId(1), read, Description("Lenovo Utility Press key=20
> > Event")] uint32 PressTypeDataVal;
> >    };
> >  =20
> >    [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),=20
> > Description("LENOVO_UTILITY_DATA class"),=20
> > guid("{ce6c0974-0407-4f50-88ba-4fc3b6559ad8}")]
> >    class LENOVO_UTILITY_DATA {
> >      [key, read] string InstanceName;
> >      [read] boolean Active;
> >  =20
> >      [WmiMethodId(1), Implemented, Description("Utility 3.1 function is=
=20
> > Support or the function Version")] void GetIfSupportOrVersion([in,=20
> > Description("Control type")] uint32 datatype, [out, Description("0 is=
=20
> > not support 1,2,3...version")] uint32 Data);
> >      [WmiMethodId(2), Implemented, Description("Utility 3.1 Set feature=
=20
> > function ")] void SetFeature([in, Description("Control type")] uint32=
=20
> > featuretype, [out, Description("Control result 0 is success 1,2,3...is=
=20
> > failed")] uint32 Data);
> >      [WmiMethodId(3), Implemented, Description("Utility 3.2 Set feature=
=20
> > function ")] void SetFeatureEx([in] uint32 IDs, [in] uint32 Value,=20
> > [out, Description("result 0 is success 1,2,3...is failed")] uint32 Ret)=
;
> >    };
> >=20
> >=20
> > I just checked several DSDT tables from different devices (they don't
> > have camera switches though). The ACPI device is usually \_SB.WMIU. The
> > former's=C2=A0WMI event is usually implemented by \_SB.WMIU._WED, while=
 the
> > latter's WMI methods are usually implemented by \_SB.WMIU.WMSK. There m=
ay
> > be some capabilities defined in the first WMI method, and the WMI event
> > may also reveal some details in EC query handling.
> >=20
> > Could you dump the ACPI tables of the two devices and attach the acpidu=
mp
> > files in your reply?
> >=20
> > As you've said, "the camera switch state is only available in EC-privat=
e
> > fields, and the two tested laptops even use different ones." Could you
> > elaborate it as well? Such information may be helpful when cross-
> > referencing ACPI tables.
> >=20
>=20
> I'm way behind on my emails and trying to get through my inbox a bit...so=
 apologies if I've missed subtleties as I skim read this a bit
>=20
> Reading the internal spec - there are some WMI calls I can see that retur=
n Camera shutter status:
> LENOVO_OTHER_METHOD (GUID dc2a8805-3a8c-41ba-a6f7-092e0089cd3b)
> Get CV DSP Camera Shutter Status - Input ID 0x00200000 - returns 0 (close=
d) or 1 (open)
> Get Normal Camera Shutter Status - Input ID 0x00201000 - returns 0 (close=
d) or 1 (open)
>=20
> I can't find the Utility GUIDs mentioned at all I'm afraid. Is the above =
useful?

Thanks for the information. It's useful! I will cross-check with the DSL
code of the correlated WMI method.

>=20
> When I get a chance I'll check this out on a Legion platform I have that =
has this switch and confirm....but it might take a little while.

Take your time and don't worry :-)

Thanks,
Rong

>=20
> Mark
