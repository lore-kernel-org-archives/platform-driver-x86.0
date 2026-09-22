Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEFF576EB6;
	Tue, 22 Sep 2026 17:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790098394; cv=none; b=V3XhvWonT+bYzcoXZmotgqeMuOZk72v4M+ezqjiSuyRvefaOh6qLdNkyVEcsa3fSF46XxKb2dZ8v55WxD2Ns1Uzn8tGYLSuVd/krmbiqtkllV750MmJCYU3whtmqWbEbMTsd8vYxdLPbeJwAtV/f7GIRbgCuk1PVVZs6N0r6L6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790098394; c=relaxed/simple;
	bh=+57jVvwAKGV1jk81tJivydCRmwV1oudj5Xa86utxyZ0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=DEW/JM3AIVlgjTgxpH9YZ5hBOMfmUP7EhvWhvKup1Wz51QAsttqt4oRa9Hzcz8JWO8mbqg8wjuXwtWOIwp+9u/wAAt7z88lAx4oIYRh8qwQuAmNmV5d+DPJ/tSmLhMQfpe4e+ZoVlrl3nzm5ewcmt4m3t2iIEo+CQJ6Qh/7zlRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=wpnieT5E; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ISiY4KM5; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="wpnieT5E";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ISiY4KM5"
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.stl.internal (Postfix) with ESMTP id 8B2D61D000AB;
	Tue, 22 Sep 2026 13:33:02 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Tue, 22 Sep 2026 13:33:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1790098382;
	 x=1790184782; bh=qUwIFaa8eQSh2PjMn7HmRiSZdhkcYj2HQT29rFIIez4=; b=
	wpnieT5EcoQvx8OyPEN7nPdoNw8HOzpRApwriTzPzaUnuuLrXD7mAFTK2U8grBtp
	OADRaGiRvAwdN/BYzV0y7ymfd/RhEQbZz4NE/LYR9Hjv1F6GpWZkck4JiLvn+IlF
	p1kHgKvwgssYIVGhF8lql9rN/9FeArWibYBezYXHlt/cPOnTVG0CSO1QHI3zkR6I
	2cI86prHBmN/XlNgLSXbWOlV/i/BfAW2r9ngGQM1zEyxdWWc0FMkvIgQRSmMD9Xq
	Pdp0T8SR6Q1m2CkEr6SFbqzFOWKwd6VDrmYGdbjQoaG0/QN3Q0Pn+8OG4GZi3mDe
	Dj/+PnBvEWv761sd7nSEqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790098382; x=
	1790184782; bh=qUwIFaa8eQSh2PjMn7HmRiSZdhkcYj2HQT29rFIIez4=; b=I
	SiY4KM5haivpn/JDN9GTQ1aBoROd1pZvXFRe4v4w/JoK82td78IJstbiP18a8G+R
	B4X4MRJ9gg51muUMZeMIH5TdxeAoE/2iYMY8pBIxLeb0lj7iFK50pKhHlxWdPwGd
	c0YxFB/TS8pV80L220P5UihobT8LmjW+NBLR5EEgwBq9we3tOjlrzvCEnb0Fa96g
	KGApTCDrch5Xq2ZI3TgPebNRQHmCzqNsowA5tT1jhRnY/7BFhnhg9+4HLRth7J1a
	AI8zFdiPJ0/BkzRuzqvUprj+Z/EMzU3Kx6xY+3W8MyNaeui66EsmK/JG8HdTm+UU
	aULAXeSGW5y636kPcoV6g==
X-ME-Sender: <xms:zbuyaqBUJOwhLKtJVmwe_kbSDt-UVTtX0XN10aFF04uFt6OE_epRrA>
    <xme:zbuyavWbjs5azBRqbzj3g5vItQZP-61IJfRlBKjExzIG4Cuw-l-wPKvcLinS8xDi5
    8gEnULaFpj47ZUgAH5AA5PXnjJPd9yF4rRbmu0j8-pSNXftj0NHo0dt>
X-ME-Proxy-Cause: dmFkZTFGZveDz+39oxixZBVxVwdNUz9J0bbBD/3nMlOMza/z6fYj77Qh/5URw0gsaNHtCv
    oSBuz/yCjOJhy/Axl7DHJ+yLWtUP7045OlRVhYC7nBrAQa5JsIrNLEwHp4o0tqylvgQol+
    izILcE9zAbCP9DLUT3lKEpM7I9NHEjJw5eviESo5aQNUTin1d/upP5h/R/I5JNwNwV8enP
    vyN1ZJ0auMwUb+on6EG89bJKpl4leJnSg8WZtg6RbqI5LHtjHrdVEuAK/lyF4HogPx4Dkg
    wlMhX6KXIkwUyPdkZLyZJO7FLrAsUd8wQ8kO/MYXGsxjEyH0MzNC89cG+4I4JRQRnQCrLV
    jNxNTtjYlgxMi0M6ffD/z1j0zlYamm7WlROEVIVf13Mb7RjpBTtSTFoF3yf03gVRIm4VTd
    8/iIfSoaklbvxVseBoF6VsYYhyeLCQlaRwtCs2QSK3HuN3PGimjCmr6RSuDJ9udHcQAS1O
    jScljp/QckGfB6o1ZzslBn3zcd4eylBGy0UbyuxPhhoaGe1fuSH1bLAlsQq8vm5jRK3vDc
    gYAP+GvmSOUXil+yS1aN3ptVmHalrkBSmc3eawjV7RFWvoMg9IHTDuSRY13SPdy3h6q2l0
    dZAPAKnwlrR7C1ao27Z5SIxcqHMu+nY8ZE8jbIIppCWbOmCsO2x+1oxCHYyQ
X-ME-Proxy: <xmx:zbuyahhTpzUn61ammvdb_5G7j1mIBv2dqQbeYpAwERmROebIfrHgdw>
    <xmx:zbuyainY0Q6HZ2yqjGUculRGHUFrHNZL1BTJu6NQXXueFCOJSwI54w>
    <xmx:zbuyalgYAB8TYrfgTglokaadcDChrrDzBiZT_QqBYhn7JBZO0VxwYg>
    <xmx:zbuyatFufjrz6Khbo-rpSleKmqoeYi0UH4Xof0vc0YvVHK4oVu3HXQ>
    <xmx:zruyagMuihH4bzVmok8a0PUnIOZAbf-QrA5Sh9OZO1sNcQRfHleAtbEL>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id A02082C00067; Tue, 22 Sep 2026 13:33:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Ah5D1kAduVmc
Date: Tue, 22 Sep 2026 13:32:41 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rong Zhang" <i@rong.moe>, "Marco Giunta" <marco_giunta@outlook.it>
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>, "Huang Wei" <huangwei@kylinos.cn>,
 "Ike Panhc" <ikepanhc@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-kernel@vger.kernel.org,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Message-Id: <5997344f-b3ff-4694-9563-762061295a57@app.fastmail.com>
In-Reply-To: <63afee899ccf13730af1b6b281c528ecdfa568c3.camel@rong.moe>
References: <d867a4f6b798809776164542972e68d724f29fd5.camel@rong.moe>
 <SN6PR19MB2303278926469783FA99824CFC842@SN6PR19MB2303.namprd19.prod.outlook.com>
 <9be0971e7f84162bc57e01eb4cde508ed15e3096.camel@rong.moe>
 <048278d5-8c58-415f-890a-3ca45f3d31c9@app.fastmail.com>
 <271a88b113a0734b150d5a0d812c4c6e2a6418e3.camel@rong.moe>
 <63afee899ccf13730af1b6b281c528ecdfa568c3.camel@rong.moe>
Subject: Re: [PATCH v2] platform/x86: ideapad-laptop: Report camera switch as
 SW_CAMERA_LENS_COVER
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Rong

On Tue, Sep 22, 2026, at 12:42 PM, Rong Zhang wrote:
> Hi Mark,
>
> On Tue, 2026-09-22 at 23:58 +0800, Rong Zhang wrote:
>> Hi Mark,
>>=20
>> On Tue, 2026-09-22 at 11:52 -0400, Mark Pearson wrote:
>> > Hi Rong
>> >=20
>> > On Tue, Sep 22, 2026, at 8:18 AM, Rong Zhang wrote:
>> > > Hi Marco,
>> > >=20
>> > > On Mon, 2026-09-21 at 21:00 +0200, Marco Giunta wrote:
>> > > > Hi Rong,
>> > > >=20
>> > > > Thank you so much for your detailed reply and the much improved=
 patch.
>> > > >=20
>> > > > Let me immediately go on record and say that, apart from a smal=
l addition
>> > > > to the SMI driver and one line in ideapad-laptop, I am mostly a=
ctive in
>> > > > the sound system, and therefore consider myself a platform/x86 =
newbie.
>> > > > So I really appreciate you sharing your knowledge here.
>> > > >=20
>> > > > > > * I considered a couple of alternatives to the approach in =
this patch:
>> > > > > >=20
>> > > > > >   1.  Simply map 0x0c and 0x0d to KEY_CAMERA_ACCESS_ENABLE/=
DISABLE:
>> > > > > >=20
>> > > > > >       { KE_KEY,	0x0c | IDEAPAD_WMI_KEY, { KEY_CAMERA_ACCESS=
_ENABLE } },
>> > > > > >       { KE_KEY,	0x0d | IDEAPAD_WMI_KEY, { KEY_CAMERA_ACCESS=
_DISABLE } },
>> > > > > >=20
>> > > > > >       similar to the touchpad off/on hkey events (66/67) th=
is driver emits
>> > > > > >       after the firmware has toggled the touchpad state. Ho=
wever, HUTRR72
>> > > > > >       describes these hkey events as asserting a camera acc=
ess state for
>> > > > > >       the host to apply, rather than reporting one the firm=
ware has
>> > > > > >       already applied.
>> > > > > >=20
>> > > > >=20
>> > > > > Well, it really doesn't matter how the specification says; wh=
at matters
>> > > > > is how devices in reality do: whenever the HID Usage Table do=
esn't define
>> > > > > a usage for hardware/firmware to report the already-applied v=
alue but
>> > > > > defines a usage for notifying the host to apply a specific va=
lue, a lot
>> > > > > of devices will emerge, using the latter even when the former=
 is
>> > > > > intended.
>> > > > >=20
>> > > > > For example, many USB Audio Class devices come with volume co=
ntrol
>> > > > > buttons or knobs. Some of them tune the volume themselves as =
well as
>> > > > > emitting Volume Increment/Decrement HID events.
>> > > > >=20
>> > > > > In this case, the audio stack, in response to the HID events,
>> > > > > intentionally overrides the volume set by hardware, effective=
ly
>> > > > > synchronizing the hardware and software volume value.
>> > > > >=20
>> > > > > The pattern has become so common that many devices like that =
also
>> > > > > implement an internal timeout mechanism. They only set the vo=
lume
>> > > > > themselves when reaching the timeout with no UAC volume contr=
ol request
>> > > > > received.
>> > > > >=20
>> > > > > IOW, it doesn't matter whether the hardware/firmware has done=
 its job as
>> > > > > long as the subsequent software control is harmless. That's w=
hy we can
>> > > > > safely use KEY_TOUCHPAD_ON/OFF even if the firmware has toggl=
ed the
>> > > > > touchpad state. They cause the desktop environment to mask/un=
mask
>> > > > > touchpad input, which is essentially a no-op (thus a safe ope=
ration) when
>> > > > > the firmware has already disabled/enabled the touchpad.
>> > > > >=20
>> > > > > Fundamentally speaking, using KEY_CAMERA_ACCESS_ENABLE/DISABL=
E is also
>> > > > > OK. It's just...
>> > > > >=20
>> > > > > > Furthermore, lenovo-wmi-camera moved away from
>> > > > > >       these hkey events in favor of SW_CAMERA_LENS_COVER in=
 the quoted
>> > > > > >       commit, which is arguably the closest relevant preced=
ent.
>> > > > >=20
>> > > > > ...relatively new and isn't widely used compared to SW_CAMERA=
_LENS_COVER.
>> > > > >=20
>> > > > > Thus, I agreed that using SW_CAMERA_LENS_COVER is a better ap=
proach as it
>> > > > > aligns with other drivers' behavior. The patch seems over-eng=
ineered
>> > > > > though, see below.
>> > > >=20
>> > > > This seems pretty reasonable to me, I figured that a single sta=
ndard was
>> > > > hard to enforce and also not strictly needed in practice (the "=
harmless
>> > > > no-op" argument above).
>> > > > I was mostly wondering about certain discussions I saw online w=
hile doing
>> > > > research for this patch of people arguing that such a no-op sho=
uld be
>> > > > avoided, see e.g.:
>> > > > https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/merge_re=
quests/181
>> > >=20
>> > > Thanks for the context. I didn't know the behavior of GNOME as I =
use KDE
>> > > Plasma, whose behavior is unmask/mask touchpad events on
>> > > KEY_TOUCHPAD_ON/OFF.
>> > >=20
>> > > >=20
>> > > > Still, your point that userspace duplicating an action already =
applied by
>> > > > the hardware is common practice, and fine as long as it is harm=
less, makes
>> > > > perfect sense to me. So overall I have no objections to your re=
asoning here.
>> > > >=20
>> > > > > >=20
>> > > > > >   2.  Ignore these events like the firmware-handled FnLock =
events:
>> > > > > >=20
>> > > > > > 			{ KE_IGNORE,	0x0c | IDEAPAD_WMI_KEY },
>> > > > > > 			{ KE_IGNORE,	0x0d | IDEAPAD_WMI_KEY },
>> > > > > >=20
>> > > > > >       This fixes the KEY_UNKNOWN issue, but userspace gets =
no information.
>> > > > > >=20
>> > > > > >   Overall, in the end I copied the approach of the lenovo-w=
mi-camera
>> > > > > >   driver. Kindly let me know if there are other/better solu=
tions.
>> > > > > >=20
>> > > > > > * Unlike the touchpad, whose state this driver reads with V=
PCCMD_R_TOUCHPAD
>> > > > > >   at probe, on resume and on each event,
>> > > > > >=20
>> > > > >=20
>> > > > > At least for the input device, the synchronization on probe o=
r on resume
>> > > > > does not matter, as no input event is emitted due to !send_ev=
ents.
>> > > >=20
>> > > > Good point, I was conflating stuff.
>> > > >=20
>> > > > > > the camera switch state is only
>> > > > > >   available in EC-private fields, and the two tested laptop=
s even use
>> > > > > >   different ones. Hence the lenovo-wmi-camera approach: the=
 switch appears
>> > > > > >   on the first event, and a change made while suspended is =
not reported,
>> > > > > >   leaving the state wrong until the switch is toggled again.
>> > > > >=20
>> > > > > So the difference compared to the lenovo-wmi-camera approach =
is only
>> > > > > about when and how the input device is registered.
>> > > > >=20
>> > > > > On recent models, the firmware neither emits VPCCMD_R_TOUCHPA=
D nor
>> > > > > toggles the touchpad. It leaves the job to software by emitti=
ng WMI key
>> > > > > event 0x29, which is converted to KEY_TOUCHPAD_TOGGLE via ide=
apad_keymap.
>> > > > > It'd be tidier to take that approach and reuse the existing i=
nput device.
>> > > > > Sparse keymap supports KEY_SW, so it's viable to map the two =
WMI events
>> > > > > to SW_CAMERA_LENS_COVER with appropriate switch value.
>> > > >=20
>> > > > This makes a lot of sense to me. I appreciate the simplicity of=
 this
>> > > > approach.
>> > > >=20
>> > > > Part of the reason why I initially adopted the "separate input =
device"
>> > > > approach was this comment from
>> > > > drivers/platform/x86/dell/dell-wmi-privacy.c:
>> > > >=20
>> > > > /*
>> > > >  * Unlike keys where only presses matter, userspace may act
>> > > >  * on switches in both of their positions. Only register
>> > > >  * SW_CAMERA_LENS_COVER if it is actually there.
>> > > >  */
>> > >=20
>> > > Hmm, this makes some sense. Ideally we should prevent exposing
>> > > SW_CAMERA_LENS_COVER unless it's there. I wonder, if the capabili=
ty is
>> > > declared in LENOVO_UTILITY_DATA? AFAIK, LENOVO_UTILITY_EVENT (8FC=
0DE0C-
>> > > B4E4-43FD-B0F3-8871711C1294) shares the same ACPI device as
>> > > LENOVO_UTILITY_DATA (CE6C0974-0407-4F50-88BA-4FC3B6559AD8). The f=
ormer's
>> > > driver is ideapad-laptop, while latter's driver is lenovo-wmi-hot=
key-
>> > > utilities.
>> > >=20
>> > >    [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),=20
>> > > Description("Lenovo Utility Key Press Event"),=20
>> > > guid("{8fc0de0c-b4e4-43fd-b0f3-8871711c1294}")]
>> > >    class LENOVO_UTILITY_EVENT : WMIEvent {
>> > >      [key, read] string InstanceName;
>> > >      [read] boolean Active;
>> > >      [WmiDataId(1), read, Description("Lenovo Utility Press key=20
>> > > Event")] uint32 PressTypeDataVal;
>> > >    };
>> > >  =20
>> > >    [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),=20
>> > > Description("LENOVO_UTILITY_DATA class"),=20
>> > > guid("{ce6c0974-0407-4f50-88ba-4fc3b6559ad8}")]
>> > >    class LENOVO_UTILITY_DATA {
>> > >      [key, read] string InstanceName;
>> > >      [read] boolean Active;
>> > >  =20
>> > >      [WmiMethodId(1), Implemented, Description("Utility 3.1 funct=
ion is=20
>> > > Support or the function Version")] void GetIfSupportOrVersion([in=
,=20
>> > > Description("Control type")] uint32 datatype, [out, Description("=
0 is=20
>> > > not support 1,2,3...version")] uint32 Data);
>> > >      [WmiMethodId(2), Implemented, Description("Utility 3.1 Set f=
eature=20
>> > > function ")] void SetFeature([in, Description("Control type")] ui=
nt32=20
>> > > featuretype, [out, Description("Control result 0 is success 1,2,3=
...is=20
>> > > failed")] uint32 Data);
>> > >      [WmiMethodId(3), Implemented, Description("Utility 3.2 Set f=
eature=20
>> > > function ")] void SetFeatureEx([in] uint32 IDs, [in] uint32 Value=
,=20
>> > > [out, Description("result 0 is success 1,2,3...is failed")] uint3=
2 Ret);
>> > >    };
>> > >=20
>> > >=20
>> > > I just checked several DSDT tables from different devices (they d=
on't
>> > > have camera switches though). The ACPI device is usually \_SB.WMI=
U. The
>> > > former's=C2=A0WMI event is usually implemented by \_SB.WMIU._WED,=
 while the
>> > > latter's WMI methods are usually implemented by \_SB.WMIU.WMSK. T=
here may
>> > > be some capabilities defined in the first WMI method, and the WMI=
 event
>> > > may also reveal some details in EC query handling.
>> > >=20
>> > > Could you dump the ACPI tables of the two devices and attach the =
acpidump
>> > > files in your reply?
>> > >=20
>> > > As you've said, "the camera switch state is only available in EC-=
private
>> > > fields, and the two tested laptops even use different ones." Coul=
d you
>> > > elaborate it as well? Such information may be helpful when cross-
>> > > referencing ACPI tables.
>> > >=20
>> >=20
>> > I'm way behind on my emails and trying to get through my inbox a bi=
t...so apologies if I've missed subtleties as I skim read this a bit
>> >=20
>> > Reading the internal spec - there are some WMI calls I can see that=
 return C status:
>> > LENOVO_OTHER_METHOD (GUID dc2a8805-3a8c-41ba-a6f7-092e0089cd3b)
>> > Get CV DSP Camera Shutter Status - Input ID 0x00200000 - returns 0 =
(closed) or 1 (open)
>> > Get Normal Camera Shutter Status - Input ID 0x00201000 - returns 0 =
(closed) or 1 (open)
>> >=20
>> > I can't find the Utility GUIDs mentioned at all I'm afraid. Is the =
above useful?
>>=20
>> Thanks for the information. It's useful! I will cross-check with the =
DSL
>> code of the correlated WMI method.
>
> I just checked a DSDT dump from 83JR [1], and it does implement
> 0x00200000!
>
> In detail, LENOVO_CAPABILITY_DATA_00 exposes 0x00200000 as
> valid+read+write conditionally, while LENOVO_OTHER_METHOD can be used =
to
> get/set the camera shutter.
>
> Still, I have three questions. Could you kindly check the internal
> specification and shed some light?
>
> What's the difference between "CV DSP Camera Shutter" and the "Normal"
> one? I guess the former is a firmware switch while the latter is a
> hardware switch, am I correct?
>
The Normal ID is new and was just added in the latest version of the spe=
c.
It's possible it is on a not-released platform yet.
As a note - the 'Normal" entry is get only.

Afraid my hooks into the Yoga and Legion team are still quite new and we=
're figuring out some of the pieces needed at the moment :)
The WMI spec seems to cover a lot of different platforms that I've not h=
ad much experience with too.

> The device does not implement LENOVO_CAPABILITY_DATA_01 at all. Is it
> possible to determine its existence programmatically using
> LENOVO_CAPABILITY_DATA_00? Missing the former is fatal in the current
> lenovo-wmi-capdata and lenovo-wmi-other implementations, resulting in
> both driver non-functional. We need a programmatic way to tolerate its
> non-existence so that we can bind the two drivers via the component
> framework in any case.
>
It should be under CAPABILITY DATA_00, at least from what I'm seeing (pa=
sting a table in text....):

CV DSP Camera Shutter
uint32 IDs //0x00200000
uint32 Capability // 7 :by project
bit 2: 0: not support SetFeatureValue(), 1: support SetFeatureValue()
bit 1: 0: not support GetFeatureValue(), 1: support GetFeatureValue()
bit 0: 0: not support CV DSP Camera Shutter, 1: support CV DSP Camera Sh=
utter
uint32 DefaultValue // 0 : by project

Normal Camera Shutter Status
uint32 IDs //0x00201000
uint32 Capability // 3 :by project
bit 2: 0: not support SetFeatureValue(), 1: support SetFeatureValue()
bit 1: 0: not support GetFeatureValue(), 1: support GetFeatureValue()
bit 0: 0: not support Normal Camera Shutter Status, 1: support Normal Ca=
mera Shutter Status
uint32 DefaultValue // 1 : by project

> There is an WMI query in the DSDT dump that looks like
> LENOVO_CAPABILITY_DATA_03. What is it?
>
No idea - my spec sheet doesn't have 03 defined.
Scanning through my doc I'm not spotting anything that looks like a matc=
h for WQC either

Mark


> [1]: I never have such a device. I got the dump when fixing
> https://bugzilla.kernel.org/show_bug.cgi?id=3D221065
>
> Appendix (DSDT snippet):
>
>                     Device (GZFD)
>                     {
>                         Name (_HID, "PNP0C14" /* Windows Management=20
> Instrumentation Device */)  // _HID: Hardware ID
>                         Name (_UID, "GMZN")  // _UID: Unique ID
> [..]
> /* This is LENOVO_OTHER_METHOD. */
>                         Method (WMAE, 3, NotSerialized)
>                         {
>                             Local0 =3D Arg1
>                             CreateDWordField (Arg2, Zero, SIDS)
>                             CreateDWordField (Arg2, 0x04, SVAL)
> [..]
>                             If ((Arg1 =3D=3D 0x11))
>                             {
> [..]
> /* Get 0x00200000. */
>                                 If ((SIDS =3D=3D 0x00200000))
>                                 {
>                                     Local0 =3D ^^PCI0.LPC0.EC0.DCSS /*=20
> \_SB_.PCI0.LPC0.EC0_.DCSS */
>                                     Return (Local0)
>                                 }
> [..]
>                             }
>
>                             If ((Arg1 =3D=3D 0x12))
>                             {
> [..]
> /* Set 0x00200000. */
>                                 If ((SIDS =3D=3D 0x00200000))
>                                 {
>                                     Local0 =3D ToInteger (SVAL)
>                                     ^^PCI0.LPC0.EC0.DCSS =3D Local0
>                                     Return (Zero)
>                                 }
>                             }
> [..]
>                         }
> /* The device has no LENOVO_CAPABILITY_DATA_01. */
>
> /* Is this something like LENOVO_CAPABILITY_DATA_03? */
>                         Method (WQC3, 1, NotSerialized)
>                         {
>                             If ((Arg0 =3D=3D Zero))
>                             {
>                                 Return (Buffer (0x10)
>                                 {
>                                     /* 0000 */  0x01, 0x00, 0x00, 0x00=
,=20
> 0x01, 0x00, 0x00, 0x00,  // ........
>                                     /* 0008 */  0x10, 0x27, 0x00, 0x00=
,=20
> 0xDC, 0x05, 0x00, 0x00   // .'......
>                                 })
>                             }
>                         }
> [..]
> /* This is LENOVO_CAPABILITY_DATA_00. */
>                         Name (CPD0, Buffer (0x0C)
>                         {
>                              0x00                                     =
 =20
>       // .
>                         })
>                         CreateDWordField (CPD0, Zero, C0ID)
>                         CreateDWordField (CPD0, 0x04, C0CP)
>                         CreateDWordField (CPD0, 0x08, C0DV)
>                         Method (WQC0, 1, NotSerialized)
>                         {
>                             If ((Arg0 =3D=3D Zero))
>                             {
>                                 Return (Buffer (0x0C)
>                                 {
>                                     /* 0000 */  0x00, 0x00, 0x05, 0x04=
,=20
> 0x07, 0x00, 0x00, 0x00,  // ........
>                                     /* 0008 */  0x00, 0x00, 0x00, 0x00=
 =20
>                          // ....
>                                 })
>                             }
>
>                             If ((Arg0 =3D=3D One))
>                             {
> /* 0x00200000 is exposed conditionally. */
>                                 C0ID =3D 0x00200000
>                                 C0DV =3D Zero
>                                 If ((^^PCI0.LPC0.EC0.CVSP =3D=3D One))
>                                 {
>                                     C0CP =3D 0x07
>                                 }
>                                 Else
>                                 {
>                                     C0CP =3D Zero
>                                 }
>                             }
>
>                             Return (CPD0) /* \_SB_.GZFD.CPD0 */
>                         }
> [..]
>                     }
>
> Thanks,
> Rong
>
>>=20
>> >=20
>> > When I get a chance I'll check this out on a Legion platform I have=
 that has this switch and confirm....but it might take a little while.
>>=20
>> Take your time and don't worry :-)
>>=20
>> Thanks,
>> Rong
>>=20
>> >=20
>> > Mark
