Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD6B54DACB;
	Tue, 22 Sep 2026 16:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790095707; cv=pass; b=iPjExLOaCRsQtYVVjfb0hH/pIvjwe1hPmmRESRyg9pQ+6fuBKtVvBLMYDB0r9gOmMHhLzCzbjR7MAAE36BwzWl5HjdqFRpufFnJNx6PxW4H6A4S9bsJpuveqc+rp/Czh2zi5k0FgboWZ3/8Ev/aAsoM3f0p+ZTgfSrnVmeX62Uk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790095707; c=relaxed/simple;
	bh=I/7hedycKQbJhLElzUl9IV7YGvW9MUWj2y6F+do8sus=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=GS1rqGeewlvx8HjuXIUwQs3EYNVsnRTLwwKyJnJ8e7zfj6eE2OZRkGg3eSs2WrsQYRzt0hOjGjA/hdwAKLfdD4I9kL+/e1jszFmF4f7NmkSOVZrDI0PwSViarl3lpgl0F/PUJO4a/adctaCt93oNik/tsUXg4qanWU0z0t5YanM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=HbRXPNpQ; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="HbRXPNpQ"
ARC-Seal: i=1; a=rsa-sha256; t=1790095677; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Zphho4cUqgkfImYTnZXbZ+aWzleX2DQJU7SpfY3Vn1OtU4roS6qCWpYZYivi1Kv5o50xMuSiuidmdRt+ISiC/K4TCLLtgLhTeLUeN8H2TrZI9nZc5soJMsPnxklwHeyHnBGzPUUU61et2ijJ5Vfx79hb0qB+VK2nAk1DmPomy1M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790095677; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rB4+nVJxX7zjyb2tTT+YHFgARq3cqBq6gYRyOdOUGHk=; 
	b=HRXexTP/wpZ/3RqF3U5Q8R2WzNeypIhP0bUkuy/0GXzWoilJuzscwj8ojAHtYMu4Gy1yC42ctKcWN0UkbCNQInCh/OFBID8fhkqp05nYy7V8JAa1dl3VdH6Otpjrl6Day2a0Kcws7o3OYVzuhYoYSYZZMTtvvpDZSoui2fN8Ebg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790095677;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=rB4+nVJxX7zjyb2tTT+YHFgARq3cqBq6gYRyOdOUGHk=;
	b=HbRXPNpQLp4Vi+DLM5CmVE19naSlRA0ax4sUK0VYjeFoo9oHCPEaJ2c+nv5gxncI
	csz11nv6YS8BDK32Nzc7H3sXrCKuU6yJlbMw1B3J+Z9kxW2bjVAuKfDmFRSPPodW+zW
	ah/jTRnaIAI3ok60dZaav5Ua6PVM93EwiRFxV9zfm77kFsg2eB7XzHEOQh01vJKjntA
	TiA6Fb0d2ygoUCyslY+5AJ/AQj1Lj2sAom3s5DAkigk24G0q3/TfAFY7/4AYC6FSPAM
	AJJC74IK49iFm7mP7Q1lLnEGnKRFzt26eM08kuZ0A87uQA0I3YzTfMgnCzN1PTMuO89
	2jd4gD9bGQ==
Received: by smtp.zohomail.com with SMTPS id 1790095675705159.19219753529308;
	Tue, 22 Sep 2026 09:47:55 -0700 (PDT)
Message-ID: <63afee899ccf13730af1b6b281c528ecdfa568c3.camel@rong.moe>
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
In-Reply-To: <271a88b113a0734b150d5a0d812c4c6e2a6418e3.camel@rong.moe>
References: <d867a4f6b798809776164542972e68d724f29fd5.camel@rong.moe>
		 <SN6PR19MB2303278926469783FA99824CFC842@SN6PR19MB2303.namprd19.prod.outlook.com>
		 <9be0971e7f84162bc57e01eb4cde508ed15e3096.camel@rong.moe>
		 <048278d5-8c58-415f-890a-3ca45f3d31c9@app.fastmail.com>
	 <271a88b113a0734b150d5a0d812c4c6e2a6418e3.camel@rong.moe>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 00:42:48 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Mark,

On Tue, 2026-09-22 at 23:58 +0800, Rong Zhang wrote:
> Hi Mark,
>=20
> On Tue, 2026-09-22 at 11:52 -0400, Mark Pearson wrote:
> > Hi Rong
> >=20
> > On Tue, Sep 22, 2026, at 8:18 AM, Rong Zhang wrote:
> > > Hi Marco,
> > >=20
> > > On Mon, 2026-09-21 at 21:00 +0200, Marco Giunta wrote:
> > > > Hi Rong,
> > > >=20
> > > > Thank you so much for your detailed reply and the much improved pat=
ch.
> > > >=20
> > > > Let me immediately go on record and say that, apart from a small ad=
dition
> > > > to the SMI driver and one line in ideapad-laptop, I am mostly activ=
e in
> > > > the sound system, and therefore consider myself a platform/x86 newb=
ie.
> > > > So I really appreciate you sharing your knowledge here.
> > > >=20
> > > > > > * I considered a couple of alternatives to the approach in this=
 patch:
> > > > > >=20
> > > > > >   1.  Simply map 0x0c and 0x0d to KEY_CAMERA_ACCESS_ENABLE/DISA=
BLE:
> > > > > >=20
> > > > > >       { KE_KEY,	0x0c | IDEAPAD_WMI_KEY, { KEY_CAMERA_ACCESS_ENA=
BLE } },
> > > > > >       { KE_KEY,	0x0d | IDEAPAD_WMI_KEY, { KEY_CAMERA_ACCESS_DIS=
ABLE } },
> > > > > >=20
> > > > > >       similar to the touchpad off/on hkey events (66/67) this d=
river emits
> > > > > >       after the firmware has toggled the touchpad state. Howeve=
r, HUTRR72
> > > > > >       describes these hkey events as asserting a camera access =
state for
> > > > > >       the host to apply, rather than reporting one the firmware=
 has
> > > > > >       already applied.
> > > > > >=20
> > > > >=20
> > > > > Well, it really doesn't matter how the specification says; what m=
atters
> > > > > is how devices in reality do: whenever the HID Usage Table doesn'=
t define
> > > > > a usage for hardware/firmware to report the already-applied value=
 but
> > > > > defines a usage for notifying the host to apply a specific value,=
 a lot
> > > > > of devices will emerge, using the latter even when the former is
> > > > > intended.
> > > > >=20
> > > > > For example, many USB Audio Class devices come with volume contro=
l
> > > > > buttons or knobs. Some of them tune the volume themselves as well=
 as
> > > > > emitting Volume Increment/Decrement HID events.
> > > > >=20
> > > > > In this case, the audio stack, in response to the HID events,
> > > > > intentionally overrides the volume set by hardware, effectively
> > > > > synchronizing the hardware and software volume value.
> > > > >=20
> > > > > The pattern has become so common that many devices like that also
> > > > > implement an internal timeout mechanism. They only set the volume
> > > > > themselves when reaching the timeout with no UAC volume control r=
equest
> > > > > received.
> > > > >=20
> > > > > IOW, it doesn't matter whether the hardware/firmware has done its=
 job as
> > > > > long as the subsequent software control is harmless. That's why w=
e can
> > > > > safely use KEY_TOUCHPAD_ON/OFF even if the firmware has toggled t=
he
> > > > > touchpad state. They cause the desktop environment to mask/unmask
> > > > > touchpad input, which is essentially a no-op (thus a safe operati=
on) when
> > > > > the firmware has already disabled/enabled the touchpad.
> > > > >=20
> > > > > Fundamentally speaking, using KEY_CAMERA_ACCESS_ENABLE/DISABLE is=
 also
> > > > > OK. It's just...
> > > > >=20
> > > > > > Furthermore, lenovo-wmi-camera moved away from
> > > > > >       these hkey events in favor of SW_CAMERA_LENS_COVER in the=
 quoted
> > > > > >       commit, which is arguably the closest relevant precedent.
> > > > >=20
> > > > > ...relatively new and isn't widely used compared to SW_CAMERA_LEN=
S_COVER.
> > > > >=20
> > > > > Thus, I agreed that using SW_CAMERA_LENS_COVER is a better approa=
ch as it
> > > > > aligns with other drivers' behavior. The patch seems over-enginee=
red
> > > > > though, see below.
> > > >=20
> > > > This seems pretty reasonable to me, I figured that a single standar=
d was
> > > > hard to enforce and also not strictly needed in practice (the "harm=
less
> > > > no-op" argument above).
> > > > I was mostly wondering about certain discussions I saw online while=
 doing
> > > > research for this patch of people arguing that such a no-op should =
be
> > > > avoided, see e.g.:
> > > > https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/merge_reques=
ts/181
> > >=20
> > > Thanks for the context. I didn't know the behavior of GNOME as I use =
KDE
> > > Plasma, whose behavior is unmask/mask touchpad events on
> > > KEY_TOUCHPAD_ON/OFF.
> > >=20
> > > >=20
> > > > Still, your point that userspace duplicating an action already appl=
ied by
> > > > the hardware is common practice, and fine as long as it is harmless=
, makes
> > > > perfect sense to me. So overall I have no objections to your reason=
ing here.
> > > >=20
> > > > > >=20
> > > > > >   2.  Ignore these events like the firmware-handled FnLock even=
ts:
> > > > > >=20
> > > > > > 			{ KE_IGNORE,	0x0c | IDEAPAD_WMI_KEY },
> > > > > > 			{ KE_IGNORE,	0x0d | IDEAPAD_WMI_KEY },
> > > > > >=20
> > > > > >       This fixes the KEY_UNKNOWN issue, but userspace gets no i=
nformation.
> > > > > >=20
> > > > > >   Overall, in the end I copied the approach of the lenovo-wmi-c=
amera
> > > > > >   driver. Kindly let me know if there are other/better solution=
s.
> > > > > >=20
> > > > > > * Unlike the touchpad, whose state this driver reads with VPCCM=
D_R_TOUCHPAD
> > > > > >   at probe, on resume and on each event,
> > > > > >=20
> > > > >=20
> > > > > At least for the input device, the synchronization on probe or on=
 resume
> > > > > does not matter, as no input event is emitted due to !send_events=
.
> > > >=20
> > > > Good point, I was conflating stuff.
> > > >=20
> > > > > > the camera switch state is only
> > > > > >   available in EC-private fields, and the two tested laptops ev=
en use
> > > > > >   different ones. Hence the lenovo-wmi-camera approach: the swi=
tch appears
> > > > > >   on the first event, and a change made while suspended is not =
reported,
> > > > > >   leaving the state wrong until the switch is toggled again.
> > > > >=20
> > > > > So the difference compared to the lenovo-wmi-camera approach is o=
nly
> > > > > about when and how the input device is registered.
> > > > >=20
> > > > > On recent models, the firmware neither emits VPCCMD_R_TOUCHPAD no=
r
> > > > > toggles the touchpad. It leaves the job to software by emitting W=
MI key
> > > > > event 0x29, which is converted to KEY_TOUCHPAD_TOGGLE via ideapad=
_keymap.
> > > > > It'd be tidier to take that approach and reuse the existing input=
 device.
> > > > > Sparse keymap supports KEY_SW, so it's viable to map the two WMI =
events
> > > > > to SW_CAMERA_LENS_COVER with appropriate switch value.
> > > >=20
> > > > This makes a lot of sense to me. I appreciate the simplicity of thi=
s
> > > > approach.
> > > >=20
> > > > Part of the reason why I initially adopted the "separate input devi=
ce"
> > > > approach was this comment from
> > > > drivers/platform/x86/dell/dell-wmi-privacy.c:
> > > >=20
> > > > /*
> > > >  * Unlike keys where only presses matter, userspace may act
> > > >  * on switches in both of their positions. Only register
> > > >  * SW_CAMERA_LENS_COVER if it is actually there.
> > > >  */
> > >=20
> > > Hmm, this makes some sense. Ideally we should prevent exposing
> > > SW_CAMERA_LENS_COVER unless it's there. I wonder, if the capability i=
s
> > > declared in LENOVO_UTILITY_DATA? AFAIK, LENOVO_UTILITY_EVENT (8FC0DE0=
C-
> > > B4E4-43FD-B0F3-8871711C1294) shares the same ACPI device as
> > > LENOVO_UTILITY_DATA (CE6C0974-0407-4F50-88BA-4FC3B6559AD8). The forme=
r's
> > > driver is ideapad-laptop, while latter's driver is lenovo-wmi-hotkey-
> > > utilities.
> > >=20
> > >    [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),=20
> > > Description("Lenovo Utility Key Press Event"),=20
> > > guid("{8fc0de0c-b4e4-43fd-b0f3-8871711c1294}")]
> > >    class LENOVO_UTILITY_EVENT : WMIEvent {
> > >      [key, read] string InstanceName;
> > >      [read] boolean Active;
> > >      [WmiDataId(1), read, Description("Lenovo Utility Press key=20
> > > Event")] uint32 PressTypeDataVal;
> > >    };
> > >  =20
> > >    [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),=20
> > > Description("LENOVO_UTILITY_DATA class"),=20
> > > guid("{ce6c0974-0407-4f50-88ba-4fc3b6559ad8}")]
> > >    class LENOVO_UTILITY_DATA {
> > >      [key, read] string InstanceName;
> > >      [read] boolean Active;
> > >  =20
> > >      [WmiMethodId(1), Implemented, Description("Utility 3.1 function =
is=20
> > > Support or the function Version")] void GetIfSupportOrVersion([in,=
=20
> > > Description("Control type")] uint32 datatype, [out, Description("0 is=
=20
> > > not support 1,2,3...version")] uint32 Data);
> > >      [WmiMethodId(2), Implemented, Description("Utility 3.1 Set featu=
re=20
> > > function ")] void SetFeature([in, Description("Control type")] uint32=
=20
> > > featuretype, [out, Description("Control result 0 is success 1,2,3...i=
s=20
> > > failed")] uint32 Data);
> > >      [WmiMethodId(3), Implemented, Description("Utility 3.2 Set featu=
re=20
> > > function ")] void SetFeatureEx([in] uint32 IDs, [in] uint32 Value,=
=20
> > > [out, Description("result 0 is success 1,2,3...is failed")] uint32 Re=
t);
> > >    };
> > >=20
> > >=20
> > > I just checked several DSDT tables from different devices (they don't
> > > have camera switches though). The ACPI device is usually \_SB.WMIU. T=
he
> > > former's=C2=A0WMI event is usually implemented by \_SB.WMIU._WED, whi=
le the
> > > latter's WMI methods are usually implemented by \_SB.WMIU.WMSK. There=
 may
> > > be some capabilities defined in the first WMI method, and the WMI eve=
nt
> > > may also reveal some details in EC query handling.
> > >=20
> > > Could you dump the ACPI tables of the two devices and attach the acpi=
dump
> > > files in your reply?
> > >=20
> > > As you've said, "the camera switch state is only available in EC-priv=
ate
> > > fields, and the two tested laptops even use different ones." Could yo=
u
> > > elaborate it as well? Such information may be helpful when cross-
> > > referencing ACPI tables.
> > >=20
> >=20
> > I'm way behind on my emails and trying to get through my inbox a bit...=
so apologies if I've missed subtleties as I skim read this a bit
> >=20
> > Reading the internal spec - there are some WMI calls I can see that ret=
urn C status:
> > LENOVO_OTHER_METHOD (GUID dc2a8805-3a8c-41ba-a6f7-092e0089cd3b)
> > Get CV DSP Camera Shutter Status - Input ID 0x00200000 - returns 0 (clo=
sed) or 1 (open)
> > Get Normal Camera Shutter Status - Input ID 0x00201000 - returns 0 (clo=
sed) or 1 (open)
> >=20
> > I can't find the Utility GUIDs mentioned at all I'm afraid. Is the abov=
e useful?
>=20
> Thanks for the information. It's useful! I will cross-check with the DSL
> code of the correlated WMI method.

I just checked a DSDT dump from 83JR [1], and it does implement
0x00200000!

In detail, LENOVO_CAPABILITY_DATA_00 exposes 0x00200000 as
valid+read+write conditionally, while LENOVO_OTHER_METHOD can be used to
get/set the camera shutter.

Still, I have three questions. Could you kindly check the internal
specification and shed some light?

What's the difference between "CV DSP Camera Shutter" and the "Normal"
one? I guess the former is a firmware switch while the latter is a
hardware switch, am I correct?

The device does not implement LENOVO_CAPABILITY_DATA_01 at all. Is it
possible to determine its existence programmatically using
LENOVO_CAPABILITY_DATA_00? Missing the former is fatal in the current
lenovo-wmi-capdata and lenovo-wmi-other implementations, resulting in
both driver non-functional. We need a programmatic way to tolerate its
non-existence so that we can bind the two drivers via the component
framework in any case.

There is an WMI query in the DSDT dump that looks like
LENOVO_CAPABILITY_DATA_03. What is it?

[1]: I never have such a device. I got the dump when fixing
https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

Appendix (DSDT snippet):

                    Device (GZFD)
                    {
                        Name (_HID, "PNP0C14" /* Windows Management Instrum=
entation Device */)  // _HID: Hardware ID
                        Name (_UID, "GMZN")  // _UID: Unique ID
[..]
/* This is LENOVO_OTHER_METHOD. */
                        Method (WMAE, 3, NotSerialized)
                        {
                            Local0 =3D Arg1
                            CreateDWordField (Arg2, Zero, SIDS)
                            CreateDWordField (Arg2, 0x04, SVAL)
[..]
                            If ((Arg1 =3D=3D 0x11))
                            {
[..]
/* Get 0x00200000. */
                                If ((SIDS =3D=3D 0x00200000))
                                {
                                    Local0 =3D ^^PCI0.LPC0.EC0.DCSS /* \_SB=
_.PCI0.LPC0.EC0_.DCSS */
                                    Return (Local0)
                                }
[..]
                            }

                            If ((Arg1 =3D=3D 0x12))
                            {
[..]
/* Set 0x00200000. */
                                If ((SIDS =3D=3D 0x00200000))
                                {
                                    Local0 =3D ToInteger (SVAL)
                                    ^^PCI0.LPC0.EC0.DCSS =3D Local0
                                    Return (Zero)
                                }
                            }
[..]
                        }
/* The device has no LENOVO_CAPABILITY_DATA_01. */

/* Is this something like LENOVO_CAPABILITY_DATA_03? */
                        Method (WQC3, 1, NotSerialized)
                        {
                            If ((Arg0 =3D=3D Zero))
                            {
                                Return (Buffer (0x10)
                                {
                                    /* 0000 */  0x01, 0x00, 0x00, 0x00, 0x0=
1, 0x00, 0x00, 0x00,  // ........
                                    /* 0008 */  0x10, 0x27, 0x00, 0x00, 0xD=
C, 0x05, 0x00, 0x00   // .'......
                                })
                            }
                        }
[..]
/* This is LENOVO_CAPABILITY_DATA_00. */
                        Name (CPD0, Buffer (0x0C)
                        {
                             0x00                                          =
   // .
                        })
                        CreateDWordField (CPD0, Zero, C0ID)
                        CreateDWordField (CPD0, 0x04, C0CP)
                        CreateDWordField (CPD0, 0x08, C0DV)
                        Method (WQC0, 1, NotSerialized)
                        {
                            If ((Arg0 =3D=3D Zero))
                            {
                                Return (Buffer (0x0C)
                                {
                                    /* 0000 */  0x00, 0x00, 0x05, 0x04, 0x0=
7, 0x00, 0x00, 0x00,  // ........
                                    /* 0008 */  0x00, 0x00, 0x00, 0x00     =
                      // ....
                                })
                            }

                            If ((Arg0 =3D=3D One))
                            {
/* 0x00200000 is exposed conditionally. */
                                C0ID =3D 0x00200000
                                C0DV =3D Zero
                                If ((^^PCI0.LPC0.EC0.CVSP =3D=3D One))
                                {
                                    C0CP =3D 0x07
                                }
                                Else
                                {
                                    C0CP =3D Zero
                                }
                            }

                            Return (CPD0) /* \_SB_.GZFD.CPD0 */
                        }
[..]
                    }

Thanks,
Rong

>=20
> >=20
> > When I get a chance I'll check this out on a Legion platform I have tha=
t has this switch and confirm....but it might take a little while.
>=20
> Take your time and don't worry :-)
>=20
> Thanks,
> Rong
>=20
> >=20
> > Mark
