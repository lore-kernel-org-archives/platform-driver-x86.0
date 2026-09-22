Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2B453FD51;
	Tue, 22 Sep 2026 12:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790079833; cv=pass; b=BlFJ7Lr5mhQFJBy61wwhoil1EaaImKg9jXMdLuG6Pls7THkb2ObEZqKrYfj7ghes8qOAlaxFpmUkgjdLtZxLpEEsezDELzeo92HkN+/o6QFibIrFlvTP3bMJERdTgr/gSr+vElcaVMAq/3snnmLD2+6VryhN10wZgJtkRMYUogo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790079833; c=relaxed/simple;
	bh=CvLFvXB+3eRQ98a857HgnP0hWWDGIHRC+plN2n8vmTc=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=FRyPSqMh9iSC/WpP4uh1TA2wTKJlUdj0D7sEYr8mRLtx1IxX0/30ed7GTE9utkcpTJgTyH/4lfRaw+RdPp+dB0k/TVAgiQa43jiV1vQAU9BD2bv4Eooy9ZPyd5fVW+0bxifn6nsElyAs2w+HB2YhE+7fi8skjRn6OJcIEtsRIn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=I0xbePo9; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="I0xbePo9"
ARC-Seal: i=1; a=rsa-sha256; t=1790079809; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eBhvO48vcqWG0wG5+tKsYd3YfWgGmyoOYtsIWpnEr+Ijh8mL3E4bOlDWZekMY3XRsHhtP1t62E3kclnyB78HKE9TSQq3TyGlqpKLVWwcJRy1bCiwIA2EwSMNlSxsEjXWsL4C+VI7jZ7bctCoMDUfVK3tVWMQ6KvDVFALfMPLw9I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790079809; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/njVByldGYOBhTAwqhoP89j1uhEzd+ElLsD14WY+lbE=; 
	b=hrseGz0ZLuy65/YH7wEYfKAFWm9jP0MF9cPjJTElHRd+B/YFFLBT4uxs1IOMhBb4yJmwZiLI8fk9wKpg3qxyXc+J5XerqKJoUkf+ldxQYUPaxHagbhYybNcdzSRIo3KAr6/9AXCHsP0RRG1g0gy+vv6Dttig8sEoIJ4VOA6QJxg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790079809;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=/njVByldGYOBhTAwqhoP89j1uhEzd+ElLsD14WY+lbE=;
	b=I0xbePo9fqiV7R6ORCuIG5F+EDM5tk1T4sF56jLgTCfed4p5+Bgs5TLzGLxEjyzH
	UhzWfbpI3emV1CgWvkHhO4ELssoG+KgvvHythNNvSMas+xGAw+EWpUth85q5KDE7QDA
	KWNP6L/3lU9JaJ2/dlrrvsOAki/sWBJ/HxqyV6g9YsSfFAfWRoZ3MOxNXijHk07TOfY
	xRO+Vm1Ez2I9iMEPc6Yi2fYoO03DIwNy/yaOfevyfzJ/LUsz2GmsJSgvQXBux7CjHiq
	GZxDjlN2G63l0z+vK9ap5JDiYmXLxN2WTTKjJlQRPUSI6Hm6R4ZtEGskkIWyM1WzDJr
	f8vngHK02g==
Received: by smtp.zohomail.com with SMTPS id 1790079808286943.0968898257333;
	Tue, 22 Sep 2026 05:23:28 -0700 (PDT)
Message-ID: <9be0971e7f84162bc57e01eb4cde508ed15e3096.camel@rong.moe>
Subject: Re: [PATCH v2] platform/x86: ideapad-laptop: Report camera switch
 as SW_CAMERA_LENS_COVER
From: Rong Zhang <i@rong.moe>
To: Marco Giunta <marco_giunta@outlook.it>
Cc: derekjohn.clark@gmail.com, hansg@kernel.org, huangwei@kylinos.cn, 
	ikepanhc@gmail.com, ilpo.jarvinen@linux.intel.com,
 linux-kernel@vger.kernel.org, 	mpearson-lenovo@squebb.ca,
 platform-driver-x86@vger.kernel.org
In-Reply-To: <SN6PR19MB2303278926469783FA99824CFC842@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <d867a4f6b798809776164542972e68d724f29fd5.camel@rong.moe>
	 <SN6PR19MB2303278926469783FA99824CFC842@SN6PR19MB2303.namprd19.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 20:18:22 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Marco,

On Mon, 2026-09-21 at 21:00 +0200, Marco Giunta wrote:
> Hi Rong,
>=20
> Thank you so much for your detailed reply and the much improved patch.
>=20
> Let me immediately go on record and say that, apart from a small addition
> to the SMI driver and one line in ideapad-laptop, I am mostly active in
> the sound system, and therefore consider myself a platform/x86 newbie.
> So I really appreciate you sharing your knowledge here.
>=20
> > > * I considered a couple of alternatives to the approach in this patch=
:
> > >=20
> > >   1.  Simply map 0x0c and 0x0d to KEY_CAMERA_ACCESS_ENABLE/DISABLE:
> > >=20
> > >       { KE_KEY,	0x0c | IDEAPAD_WMI_KEY, { KEY_CAMERA_ACCESS_ENABLE } =
},
> > >       { KE_KEY,	0x0d | IDEAPAD_WMI_KEY, { KEY_CAMERA_ACCESS_DISABLE }=
 },
> > >=20
> > >       similar to the touchpad off/on hkey events (66/67) this driver =
emits
> > >       after the firmware has toggled the touchpad state. However, HUT=
RR72
> > >       describes these hkey events as asserting a camera access state =
for
> > >       the host to apply, rather than reporting one the firmware has
> > >       already applied.
> > >=20
> >=20
> > Well, it really doesn't matter how the specification says; what matters
> > is how devices in reality do: whenever the HID Usage Table doesn't defi=
ne
> > a usage for hardware/firmware to report the already-applied value but
> > defines a usage for notifying the host to apply a specific value, a lot
> > of devices will emerge, using the latter even when the former is
> > intended.
> >=20
> > For example, many USB Audio Class devices come with volume control
> > buttons or knobs. Some of them tune the volume themselves as well as
> > emitting Volume Increment/Decrement HID events.
> >=20
> > In this case, the audio stack, in response to the HID events,
> > intentionally overrides the volume set by hardware, effectively
> > synchronizing the hardware and software volume value.
> >=20
> > The pattern has become so common that many devices like that also
> > implement an internal timeout mechanism. They only set the volume
> > themselves when reaching the timeout with no UAC volume control request
> > received.
> >=20
> > IOW, it doesn't matter whether the hardware/firmware has done its job a=
s
> > long as the subsequent software control is harmless. That's why we can
> > safely use KEY_TOUCHPAD_ON/OFF even if the firmware has toggled the
> > touchpad state. They cause the desktop environment to mask/unmask
> > touchpad input, which is essentially a no-op (thus a safe operation) wh=
en
> > the firmware has already disabled/enabled the touchpad.
> >=20
> > Fundamentally speaking, using KEY_CAMERA_ACCESS_ENABLE/DISABLE is also
> > OK. It's just...
> >=20
> > > Furthermore, lenovo-wmi-camera moved away from
> > >       these hkey events in favor of SW_CAMERA_LENS_COVER in the quote=
d
> > >       commit, which is arguably the closest relevant precedent.
> >=20
> > ...relatively new and isn't widely used compared to SW_CAMERA_LENS_COVE=
R.
> >=20
> > Thus, I agreed that using SW_CAMERA_LENS_COVER is a better approach as =
it
> > aligns with other drivers' behavior. The patch seems over-engineered
> > though, see below.
>=20
> This seems pretty reasonable to me, I figured that a single standard was
> hard to enforce and also not strictly needed in practice (the "harmless
> no-op" argument above).
> I was mostly wondering about certain discussions I saw online while doing
> research for this patch of people arguing that such a no-op should be
> avoided, see e.g.:
> https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/merge_requests/181

Thanks for the context. I didn't know the behavior of GNOME as I use KDE
Plasma, whose behavior is unmask/mask touchpad events on
KEY_TOUCHPAD_ON/OFF.

>=20
> Still, your point that userspace duplicating an action already applied by
> the hardware is common practice, and fine as long as it is harmless, make=
s
> perfect sense to me. So overall I have no objections to your reasoning he=
re.
>=20
> > >=20
> > >   2.  Ignore these events like the firmware-handled FnLock events:
> > >=20
> > > 			{ KE_IGNORE,	0x0c | IDEAPAD_WMI_KEY },
> > > 			{ KE_IGNORE,	0x0d | IDEAPAD_WMI_KEY },
> > >=20
> > >       This fixes the KEY_UNKNOWN issue, but userspace gets no informa=
tion.
> > >=20
> > >   Overall, in the end I copied the approach of the lenovo-wmi-camera
> > >   driver. Kindly let me know if there are other/better solutions.
> > >=20
> > > * Unlike the touchpad, whose state this driver reads with VPCCMD_R_TO=
UCHPAD
> > >   at probe, on resume and on each event,
> > >=20
> >=20
> > At least for the input device, the synchronization on probe or on resum=
e
> > does not matter, as no input event is emitted due to !send_events.
>=20
> Good point, I was conflating stuff.
>=20
> > > the camera switch state is only
> > >   available in EC-private fields, and the two tested laptops even use
> > >   different ones. Hence the lenovo-wmi-camera approach: the switch ap=
pears
> > >   on the first event, and a change made while suspended is not report=
ed,
> > >   leaving the state wrong until the switch is toggled again.
> >=20
> > So the difference compared to the lenovo-wmi-camera approach is only
> > about when and how the input device is registered.
> >=20
> > On recent models, the firmware neither emits VPCCMD_R_TOUCHPAD nor
> > toggles the touchpad. It leaves the job to software by emitting WMI key
> > event 0x29, which is converted to KEY_TOUCHPAD_TOGGLE via ideapad_keyma=
p.
> > It'd be tidier to take that approach and reuse the existing input devic=
e.
> > Sparse keymap supports KEY_SW, so it's viable to map the two WMI events
> > to SW_CAMERA_LENS_COVER with appropriate switch value.
>=20
> This makes a lot of sense to me. I appreciate the simplicity of this
> approach.
>=20
> Part of the reason why I initially adopted the "separate input device"
> approach was this comment from
> drivers/platform/x86/dell/dell-wmi-privacy.c:
>=20
> /*
>  * Unlike keys where only presses matter, userspace may act
>  * on switches in both of their positions. Only register
>  * SW_CAMERA_LENS_COVER if it is actually there.
>  */

Hmm, this makes some sense. Ideally we should prevent exposing
SW_CAMERA_LENS_COVER unless it's there. I wonder, if the capability is
declared in LENOVO_UTILITY_DATA? AFAIK, LENOVO_UTILITY_EVENT (8FC0DE0C-
B4E4-43FD-B0F3-8871711C1294) shares the same ACPI device as
LENOVO_UTILITY_DATA (CE6C0974-0407-4F50-88BA-4FC3B6559AD8). The former's
driver is ideapad-laptop, while latter's driver is lenovo-wmi-hotkey-
utilities.

   [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Le=
novo Utility Key Press Event"), guid("{8fc0de0c-b4e4-43fd-b0f3-8871711c1294=
}")]
   class LENOVO_UTILITY_EVENT : WMIEvent {
     [key, read] string InstanceName;
     [read] boolean Active;
     [WmiDataId(1), read, Description("Lenovo Utility Press key Event")] ui=
nt32 PressTypeDataVal;
   };
  =20
   [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("LE=
NOVO_UTILITY_DATA class"), guid("{ce6c0974-0407-4f50-88ba-4fc3b6559ad8}")]
   class LENOVO_UTILITY_DATA {
     [key, read] string InstanceName;
     [read] boolean Active;
  =20
     [WmiMethodId(1), Implemented, Description("Utility 3.1 function is Sup=
port or the function Version")] void GetIfSupportOrVersion([in, Description=
("Control type")] uint32 datatype, [out, Description("0 is not support 1,2,=
3...version")] uint32 Data);
     [WmiMethodId(2), Implemented, Description("Utility 3.1 Set feature fun=
ction ")] void SetFeature([in, Description("Control type")] uint32 featuret=
ype, [out, Description("Control result 0 is success 1,2,3...is failed")] ui=
nt32 Data);
     [WmiMethodId(3), Implemented, Description("Utility 3.2 Set feature fun=
ction ")] void SetFeatureEx([in] uint32 IDs, [in] uint32 Value, [out, Descr=
iption("result 0 is success 1,2,3...is failed")] uint32 Ret);
   };


I just checked several DSDT tables from different devices (they don't
have camera switches though). The ACPI device is usually \_SB.WMIU. The
former's=C2=A0WMI event is usually implemented by \_SB.WMIU._WED, while the
latter's WMI methods are usually implemented by \_SB.WMIU.WMSK. There may
be some capabilities defined in the first WMI method, and the WMI event
may also reveal some details in EC query handling.

Could you dump the ACPI tables of the two devices and attach the acpidump
files in your reply?

As you've said, "the camera switch state is only available in EC-private
fields, and the two tested laptops even use different ones." Could you
elaborate it as well? Such information may be helpful when cross-
referencing ACPI tables.

>=20
> and so I implemented a conditional registration (which was then easy to d=
o
> by copying the overall approach of the lenovo-wmi-camera driver).
>=20
> However, I understand that with your patch the switch will simply be
> advertised by the existing input device with a default state of 0,
> i.e. "camera enabled", which never changes on a device without a
> privacy switch, and is indeed a correct description of it. So I
> don't think there's any harm in going with your approach.

From my perspective, the hazard on exposing SW_CAMERA_LENS_COVER
unconditionally is mostly theoretical, as there is hardly any userspace
program handling it. I believe the reason why dell-wmi-privacy exposes it
conditionally is that it emits an event on probe even when the state is
0. If there is any userspace program handling SW_CAMERA_LENS_COVER, I
really doubt if it will consult EVIOCGBIT() for the initial state. IOW,
having a 0 initial state should be safe as you've said, as long as we
don't emit an SW_CAMERA_LENS_COVER event on probe.

Of course, your approach is also somewhat reasonable considering the
hazard, but I still consider the dedicated input device as unnecessary.
We can simply reregister the existing input device with KE_SW entries if
we had to take that approach.

Still, it'd be better if it's exposed only when the device has such a
capability. Let's see if we can query the capability programmatically
first...

>=20
> > I've attached a patch implementing the approach. Could you test if it
> > works on your devices?
>=20
> I compiled it on my Legion and it works as expected. Right after booting,
> evtest says:
>=20
> Input driver version is 1.0.1
> Input device ID: bus 0x19 vendor 0x0 product 0x0 version 0x0
> Input device name: "Ideapad extra buttons"
> Supported events:
>   Event type 0 (EV_SYN)
>   Event type 1 (EV_KEY)
>     Event code 1 (KEY_ESC)
>     Event code 138 (KEY_HELP)
>     Event code 148 (KEY_PROG1)
>     Event code 149 (KEY_PROG2)
>     Event code 186 (KEY_F16)
>     Event code 202 (KEY_PROG3)
>     Event code 203 (KEY_PROG4)
>     Event code 212 (KEY_CAMERA)
>     Event code 227 (KEY_SWITCHVIDEOMODE)
>     Event code 240 (KEY_UNKNOWN)
>     Event code 247 (KEY_RFKILL)
>     Event code 248 (KEY_MICMUTE)
>     Event code 364 (KEY_FAVORITES)
>     Event code 445 (KEY_PICKUP_PHONE)
>     Event code 446 (KEY_HANGUP_PHONE)
>     Event code 447 (?) # commit bc39af8c2c43 was included in this kernel
>     Event code 530 (KEY_TOUCHPAD_TOGGLE)
>     Event code 531 (KEY_TOUCHPAD_ON)
>     Event code 532 (KEY_TOUCHPAD_OFF)
>     Event code 562 (KEY_REFRESH_RATE_TOGGLE)
>     Event code 618 (KEY_ROOT_MENU)
>     Event code 634 (KEY_SELECTIVE_SCREENSHOT)
>   Event type 4 (EV_MSC)
>     Event code 4 (MSC_SCAN)
>   Event type 5 (EV_SW)
>     Event code 9 (SW_CAMERA_LENS_COVER) state 0
>=20
> Starting from the "camera enabled" state and toggling the privacy switch
> twice causes:
>=20
> Event: time 1790013067.697647, type 5 (EV_SW), code 9 (SW_CAMERA_LENS_COV=
ER), value 1
> Event: time 1790013067.697647, -------------- SYN_REPORT ------------
> Event: time 1790013069.208581, type 5 (EV_SW), code 9 (SW_CAMERA_LENS_COV=
ER), value 0
> Event: time 1790013069.208581, -------------- SYN_REPORT ------------
>=20
> This is the same behavior as my original patch, just on the same input
> device as everything else (as expected).
>=20
> The switch starts on state 0 at boot even if the camera was disabled
> while the device was turned off, in which case a new event is reported on=
ly
> after toggling the switch twice. However this is expected and is the same
> behavior as in the original patch if e.g. the switch is toggled during
> suspend, so this is not a critique, only a confirmation that your patch
> works as I expected.
>=20
> > If so, you may submit my patch yourself by adding
> > a From: pseudo header with my identity and swapping the two Signed-off-
> > by: tags. I can also submit it myself as long as you permit me to do so=
.
>=20
> I am happy to have you submit the new patch as its main author; it's your
> code now!
>=20
> I'll only add that, apart from
>=20
> Co-developed-by: Marco Giunta <marco_giunta@outlook.it>
> Signed-off-by: Marco Giunta <marco_giunta@outlook.it>
>=20
> I think it's also appropriate to add
>=20
> Tested-by: Marco Giunta <marco_giunta@outlook.it>

Thanks for that.

If we eventually figure out an appropriate approach to expose
SW_CAMERA_LENS_COVER conditionally, I'd prefer indicating your credits
(i.e., C-d-b) anyway, as it won't be done without your help :-)

Thanks,
Rong

>=20
> > >=20
> > > * For reference, on KDE Plasma 6.7.5, using the Legion's touchpad tog=
gle
> > >   button shows an OSD, but nothing on a SW_CAMERA_LENS_COVER change o=
r if
> > >   sending KEY_CAMERA_ACCESS_ENABLE/DISABLE events. I am not sure whet=
her
> > >   this is simply a case of "not implemented yet" or if I misunderstoo=
d how
> > >   these events are supposed to be used to communicate with userspace.
> > >   Please feel free to correct me here.
> >=20
> > I believe KDE Plasma has not implemented it yet. You may raise an issue
> > on their Bugzilla.
> >=20
> Noted, thanks.
>=20
> > > Hi Macro,
> >=20
> > Whoops, I mistyped your name. Sorry for that. My fingers definitely hav=
e
> > their own thoughts.
>=20
> No worries!!
>=20
> Thank you again for your very informative review and much simpler patch.
> And please feel free to correct me again if there are further inaccuracie=
s
> in my understanding of the problem.
>=20
> Best regards,
> Marco
