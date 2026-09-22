Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA5247FB0C;
	Tue, 22 Sep 2026 15:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092355; cv=none; b=mQeLI2lkt97AY2MfPN8EFvsWJ4OS42t7wznzvsx+iFQA3iHarRedHrFsds5iysNx/Egdgm10jba+/1Y99aMFRBo+BZSWaMxy2fEaG7qTN0h38jm29fg/VbqCCj5GO9tkJdYjgSDfKNHeynVOpAowUHeZ/44QZmNexNjjVLKg2xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092355; c=relaxed/simple;
	bh=7/Tjl+wHObiPm2kkzTTIJd3tE4ti74m7Z2pSZ8OW67k=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=lQ+95LsZIa6eNa9R7aCzYmzSaXyDdhyKnux/G2wgkAM0rHu+CIaiOhYtTs2m1a2wSQ9VGUHD1X21Ei91JGKcberVkBCJPYyMJ++dpZBffXxs1/WGJmyq48rDr2Js6pKlBSKIq5dPX9x9VVMD8L2zGSOASYvUT6LY2I6FzfDWRHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=MHm7Bvkk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cYqXR1aI; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="MHm7Bvkk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cYqXR1aI"
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.stl.internal (Postfix) with ESMTP id 4C17E1D00018;
	Tue, 22 Sep 2026 11:52:32 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Tue, 22 Sep 2026 11:52:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1790092352;
	 x=1790178752; bh=UXviWuIws5x/Vj10Z/JcnmznT9pgc/2qjRgyWUn/3y4=; b=
	MHm7BvkkXmmHO8lPb5BPyUjdcZyQiCgswmlJYd8Mztmm/N7Fxv0joEzQcngtCDz7
	kwd82vDxpE7b8uatLkDAwnOGX9PzVbd5d7ws7L/e2O7KFZwo07wIjbax6bqCUlTb
	UrZ5Gn+sDc1mY/MFO4vCYdteX7Kg+GXsG2Pi33bYBwx8QYQwaq84gbPfw7Fp0RmR
	cUh+/rrXBTAdVKjAHfeovIyT9WiyOL87Mishe9aIcdnJGoq6CI7jAveATxkkVGYi
	URkxQ16Mp4fLBh7lJtYIke5b6ymMbuc9VASczx1BwXRbObplQ3FBx7qb3JPs+E2j
	jyngYRrMvo5oMeZ6MYThHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790092352; x=
	1790178752; bh=UXviWuIws5x/Vj10Z/JcnmznT9pgc/2qjRgyWUn/3y4=; b=c
	YqXR1aItojHM3BzanYb8S88e8lE1U5lqI+F9mpMLytO8wbdUqW1wsqs4KDkI6sUt
	MbvsX6eD2asduUrGvJnplDvCCySn8BT4ZQPqGOIR+QFik15z95oymv1z8QNaEOOu
	dZAJ2vPjiT2748AkFXZTJpq8l5xaZFDwjuIlp2B5DfidrRoFLGxK2i1jggfBOPAd
	WPsFlXQwhHTvdalK1eriFMRAMEPs/YYpTcSAs3zLWfaWztWkNWRA3EZr+/9m8wnn
	7UN9/vHGWzDAOGjqUF6yr6+UEwqsFac+E9WReuUXz6tCsR3+HRdf0h0MpO8i/v7+
	D6s0WG5ScIIBSk0hmGuvQ==
X-ME-Sender: <xms:PqSyaq2H5DxUC9D9AV33KhKkB9RSeMtqcJpYjL4XwWbxl38YsY0n2w>
    <xme:PqSyan4GPjRfxf1yI_QUonHBtTQZscXvwwSyR4ngNy7h-r8w77bytP2y_m6N0AJ7q
    3v6G4e_NaPAtKdDzoqgjrtxU0NC39qem9OLtOeBJVJZkbMP-bl_99RN>
X-ME-Proxy-Cause: dmFkZTFyjw9/lBukhlsnOvBUoZS40agPxwtYe6+7ntFR7u40e337hgt0diFlKmdQMBOkPh
    aZg73N4qsArmKAduQXCk505vtu9ddwNf4GLO9uiMK/wMV7U/ZM6eaAMrYXOA4oHNwtzdm7
    a8ciTzxvj+/7fVrItO033dshz47UpQ6C10E+P1pEIOzAh3+avYVOwMoCEAWKgvrvgb0a78
    qxuqDi4muXiDG7CrnLQfhvuA/XJdJa/rHWOTVZA5RNpXmT4bUR8rzwBtJnfHdaPkPLStQO
    yiY1aQ+vuXAffWaXqaHs/xtnJ6vucywo2fqfq2fvxsb/Lr5Y0A5UKSDMPOW6214hTCWrik
    ubE6aRdDv37+UfqNPQ2IxSWsum8ys/iquDXFe+ktQ3x7hZ1geeCAz3brAGpSlK2eWV+SIj
    uXE4RM3ZN/rUAoTI56Qg9iS8KqHqLhPynhN/z4r8iHjCaWTJU7Zhxx6af7xoupFC2ZLq1p
    q7rTVYXViRVfWj6t5rwOvDJ0qVbyd7PqWDeo3AR+BGPPkUDGwttlGuBpz4U9kZC/Wl8ki3
    3VBH6jhxdRZ+aMdK5JQkT0elQODtg/hb47bZW30RDq0cZ2rfRN+eziRqqOigbcb9Gu1YUZ
    7ROMpxT36/oLi3OXCSYebDMSIv4Wm326iX/jEsxhiNFzySMqJbUq1Y5bv2hw
X-ME-Proxy: <xmx:P6Syah2H2DH0iRCO7RGwmExMF58nQC1bVM3AxmF3HytTSbBej5xUGA>
    <xmx:P6Syakp8He_DUX9jI9HsC21y5XsgBFDzdKW8JNVEvbvcb5lLpqIMLQ>
    <xmx:P6SyamWgFoEKkm-jP7zYr5X1UsUFKbKk9o_vScEjx1yZ3cSiq79N8g>
    <xmx:P6SyaloKTu6wNY8JlYZ6mE6ERs4n2DDD8walPVGURXr9UEVm1HheXg>
    <xmx:QKSyahBg5PclyyOb_C1i0wduJ5uJ5L8YDchQ0ccVlNttZd1YRk_koDJB>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id C2EB12C00067; Tue, 22 Sep 2026 11:52:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Ah5D1kAduVmc
Date: Tue, 22 Sep 2026 11:52:10 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rong Zhang" <i@rong.moe>, "Marco Giunta" <marco_giunta@outlook.it>
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>, "Huang Wei" <huangwei@kylinos.cn>,
 "Ike Panhc" <ikepanhc@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-kernel@vger.kernel.org,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Message-Id: <048278d5-8c58-415f-890a-3ca45f3d31c9@app.fastmail.com>
In-Reply-To: <9be0971e7f84162bc57e01eb4cde508ed15e3096.camel@rong.moe>
References: <d867a4f6b798809776164542972e68d724f29fd5.camel@rong.moe>
 <SN6PR19MB2303278926469783FA99824CFC842@SN6PR19MB2303.namprd19.prod.outlook.com>
 <9be0971e7f84162bc57e01eb4cde508ed15e3096.camel@rong.moe>
Subject: Re: [PATCH v2] platform/x86: ideapad-laptop: Report camera switch as
 SW_CAMERA_LENS_COVER
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Rong

On Tue, Sep 22, 2026, at 8:18 AM, Rong Zhang wrote:
> Hi Marco,
>
> On Mon, 2026-09-21 at 21:00 +0200, Marco Giunta wrote:
>> Hi Rong,
>>=20
>> Thank you so much for your detailed reply and the much improved patch.
>>=20
>> Let me immediately go on record and say that, apart from a small addi=
tion
>> to the SMI driver and one line in ideapad-laptop, I am mostly active =
in
>> the sound system, and therefore consider myself a platform/x86 newbie.
>> So I really appreciate you sharing your knowledge here.
>>=20
>> > > * I considered a couple of alternatives to the approach in this p=
atch:
>> > >=20
>> > >   1.  Simply map 0x0c and 0x0d to KEY_CAMERA_ACCESS_ENABLE/DISABL=
E:
>> > >=20
>> > >       { KE_KEY,	0x0c | IDEAPAD_WMI_KEY, { KEY_CAMERA_ACCESS_ENABL=
E } },
>> > >       { KE_KEY,	0x0d | IDEAPAD_WMI_KEY, { KEY_CAMERA_ACCESS_DISAB=
LE } },
>> > >=20
>> > >       similar to the touchpad off/on hkey events (66/67) this dri=
ver emits
>> > >       after the firmware has toggled the touchpad state. However,=
 HUTRR72
>> > >       describes these hkey events as asserting a camera access st=
ate for
>> > >       the host to apply, rather than reporting one the firmware h=
as
>> > >       already applied.
>> > >=20
>> >=20
>> > Well, it really doesn't matter how the specification says; what mat=
ters
>> > is how devices in reality do: whenever the HID Usage Table doesn't =
define
>> > a usage for hardware/firmware to report the already-applied value b=
ut
>> > defines a usage for notifying the host to apply a specific value, a=
 lot
>> > of devices will emerge, using the latter even when the former is
>> > intended.
>> >=20
>> > For example, many USB Audio Class devices come with volume control
>> > buttons or knobs. Some of them tune the volume themselves as well as
>> > emitting Volume Increment/Decrement HID events.
>> >=20
>> > In this case, the audio stack, in response to the HID events,
>> > intentionally overrides the volume set by hardware, effectively
>> > synchronizing the hardware and software volume value.
>> >=20
>> > The pattern has become so common that many devices like that also
>> > implement an internal timeout mechanism. They only set the volume
>> > themselves when reaching the timeout with no UAC volume control req=
uest
>> > received.
>> >=20
>> > IOW, it doesn't matter whether the hardware/firmware has done its j=
ob as
>> > long as the subsequent software control is harmless. That's why we =
can
>> > safely use KEY_TOUCHPAD_ON/OFF even if the firmware has toggled the
>> > touchpad state. They cause the desktop environment to mask/unmask
>> > touchpad input, which is essentially a no-op (thus a safe operation=
) when
>> > the firmware has already disabled/enabled the touchpad.
>> >=20
>> > Fundamentally speaking, using KEY_CAMERA_ACCESS_ENABLE/DISABLE is a=
lso
>> > OK. It's just...
>> >=20
>> > > Furthermore, lenovo-wmi-camera moved away from
>> > >       these hkey events in favor of SW_CAMERA_LENS_COVER in the q=
uoted
>> > >       commit, which is arguably the closest relevant precedent.
>> >=20
>> > ...relatively new and isn't widely used compared to SW_CAMERA_LENS_=
COVER.
>> >=20
>> > Thus, I agreed that using SW_CAMERA_LENS_COVER is a better approach=
 as it
>> > aligns with other drivers' behavior. The patch seems over-engineered
>> > though, see below.
>>=20
>> This seems pretty reasonable to me, I figured that a single standard =
was
>> hard to enforce and also not strictly needed in practice (the "harmle=
ss
>> no-op" argument above).
>> I was mostly wondering about certain discussions I saw online while d=
oing
>> research for this patch of people arguing that such a no-op should be
>> avoided, see e.g.:
>> https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/merge_requests=
/181
>
> Thanks for the context. I didn't know the behavior of GNOME as I use K=
DE
> Plasma, whose behavior is unmask/mask touchpad events on
> KEY_TOUCHPAD_ON/OFF.
>
>>=20
>> Still, your point that userspace duplicating an action already applie=
d by
>> the hardware is common practice, and fine as long as it is harmless, =
makes
>> perfect sense to me. So overall I have no objections to your reasonin=
g here.
>>=20
>> > >=20
>> > >   2.  Ignore these events like the firmware-handled FnLock events:
>> > >=20
>> > > 			{ KE_IGNORE,	0x0c | IDEAPAD_WMI_KEY },
>> > > 			{ KE_IGNORE,	0x0d | IDEAPAD_WMI_KEY },
>> > >=20
>> > >       This fixes the KEY_UNKNOWN issue, but userspace gets no inf=
ormation.
>> > >=20
>> > >   Overall, in the end I copied the approach of the lenovo-wmi-cam=
era
>> > >   driver. Kindly let me know if there are other/better solutions.
>> > >=20
>> > > * Unlike the touchpad, whose state this driver reads with VPCCMD_=
R_TOUCHPAD
>> > >   at probe, on resume and on each event,
>> > >=20
>> >=20
>> > At least for the input device, the synchronization on probe or on r=
esume
>> > does not matter, as no input event is emitted due to !send_events.
>>=20
>> Good point, I was conflating stuff.
>>=20
>> > > the camera switch state is only
>> > >   available in EC-private fields, and the two tested laptops even=
 use
>> > >   different ones. Hence the lenovo-wmi-camera approach: the switc=
h appears
>> > >   on the first event, and a change made while suspended is not re=
ported,
>> > >   leaving the state wrong until the switch is toggled again.
>> >=20
>> > So the difference compared to the lenovo-wmi-camera approach is only
>> > about when and how the input device is registered.
>> >=20
>> > On recent models, the firmware neither emits VPCCMD_R_TOUCHPAD nor
>> > toggles the touchpad. It leaves the job to software by emitting WMI=
 key
>> > event 0x29, which is converted to KEY_TOUCHPAD_TOGGLE via ideapad_k=
eymap.
>> > It'd be tidier to take that approach and reuse the existing input d=
evice.
>> > Sparse keymap supports KEY_SW, so it's viable to map the two WMI ev=
ents
>> > to SW_CAMERA_LENS_COVER with appropriate switch value.
>>=20
>> This makes a lot of sense to me. I appreciate the simplicity of this
>> approach.
>>=20
>> Part of the reason why I initially adopted the "separate input device"
>> approach was this comment from
>> drivers/platform/x86/dell/dell-wmi-privacy.c:
>>=20
>> /*
>>  * Unlike keys where only presses matter, userspace may act
>>  * on switches in both of their positions. Only register
>>  * SW_CAMERA_LENS_COVER if it is actually there.
>>  */
>
> Hmm, this makes some sense. Ideally we should prevent exposing
> SW_CAMERA_LENS_COVER unless it's there. I wonder, if the capability is
> declared in LENOVO_UTILITY_DATA? AFAIK, LENOVO_UTILITY_EVENT (8FC0DE0C-
> B4E4-43FD-B0F3-8871711C1294) shares the same ACPI device as
> LENOVO_UTILITY_DATA (CE6C0974-0407-4F50-88BA-4FC3B6559AD8). The former=
's
> driver is ideapad-laptop, while latter's driver is lenovo-wmi-hotkey-
> utilities.
>
>    [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),=20
> Description("Lenovo Utility Key Press Event"),=20
> guid("{8fc0de0c-b4e4-43fd-b0f3-8871711c1294}")]
>    class LENOVO_UTILITY_EVENT : WMIEvent {
>      [key, read] string InstanceName;
>      [read] boolean Active;
>      [WmiDataId(1), read, Description("Lenovo Utility Press key=20
> Event")] uint32 PressTypeDataVal;
>    };
>  =20
>    [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),=20
> Description("LENOVO_UTILITY_DATA class"),=20
> guid("{ce6c0974-0407-4f50-88ba-4fc3b6559ad8}")]
>    class LENOVO_UTILITY_DATA {
>      [key, read] string InstanceName;
>      [read] boolean Active;
>  =20
>      [WmiMethodId(1), Implemented, Description("Utility 3.1 function i=
s=20
> Support or the function Version")] void GetIfSupportOrVersion([in,=20
> Description("Control type")] uint32 datatype, [out, Description("0 is=20
> not support 1,2,3...version")] uint32 Data);
>      [WmiMethodId(2), Implemented, Description("Utility 3.1 Set featur=
e=20
> function ")] void SetFeature([in, Description("Control type")] uint32=20
> featuretype, [out, Description("Control result 0 is success 1,2,3...is=20
> failed")] uint32 Data);
>      [WmiMethodId(3), Implemented, Description("Utility 3.2 Set featur=
e=20
> function ")] void SetFeatureEx([in] uint32 IDs, [in] uint32 Value,=20
> [out, Description("result 0 is success 1,2,3...is failed")] uint32 Ret=
);
>    };
>
>
> I just checked several DSDT tables from different devices (they don't
> have camera switches though). The ACPI device is usually \_SB.WMIU. The
> former's=C2=A0WMI event is usually implemented by \_SB.WMIU._WED, whil=
e the
> latter's WMI methods are usually implemented by \_SB.WMIU.WMSK. There =
may
> be some capabilities defined in the first WMI method, and the WMI event
> may also reveal some details in EC query handling.
>
> Could you dump the ACPI tables of the two devices and attach the acpid=
ump
> files in your reply?
>
> As you've said, "the camera switch state is only available in EC-priva=
te
> fields, and the two tested laptops even use different ones." Could you
> elaborate it as well? Such information may be helpful when cross-
> referencing ACPI tables.
>

I'm way behind on my emails and trying to get through my inbox a bit...s=
o apologies if I've missed subtleties as I skim read this a bit

Reading the internal spec - there are some WMI calls I can see that retu=
rn Camera shutter status:
LENOVO_OTHER_METHOD (GUID dc2a8805-3a8c-41ba-a6f7-092e0089cd3b)
Get CV DSP Camera Shutter Status - Input ID 0x00200000 - returns 0 (clos=
ed) or 1 (open)
Get Normal Camera Shutter Status - Input ID 0x00201000 - returns 0 (clos=
ed) or 1 (open)

I can't find the Utility GUIDs mentioned at all I'm afraid. Is the above=
 useful?

When I get a chance I'll check this out on a Legion platform I have that=
 has this switch and confirm....but it might take a little while.

Mark
