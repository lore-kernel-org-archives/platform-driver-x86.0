Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795094339;
	b=kR/RM209F1a+3kiT3MIH2b4B5kAu/OiGR2/h3PUoHfQlhMKL5Rbtu+b41EtARWTSPtJR
	 tiz2nd3DyO5z2HTj2S4INK1LX2CzdRRthj/AVW3R3FrQURZbu0AaCbPYZKEE7GHHnvZlq
	 U1sKbTAgHlKn0N+H1xSEs7L9BcQ8mzkrseLMfOvnvrp7wdN9ItE0xwYhyxtMutjqES16A
	 8OFUrbYzkVPpgWlQaSF2jSiNszigCHnhH/MEWU0YBCAVhxuGvSP83OnvEThGOqqSrB+z9
	 uCQsbO//LlNx2JIheyNG8+L0ldh3eFsUEeCbe5PQgW7rKCRyzXN7Q9kD6JlJQbyQ/AA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094339;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=Y5QljIJzJ2EvsPCbBU99vVrmRlTnuD78DuUYhuPJum4=;
	b=oFYw3XqMaG/X4Na28P4bXPX2mFI3H9LiMpWzHfGWCaNORvwkGgAV8cMIRURWcTaRadju
	 np2S4S0BMx6r2vjs37Qyu8tc8fc7ljXl46gqaXwNckNB5CAS2toZI/XPobTye/ejx3XKa
	 Rsb8HmEHMPvDouiPf67GsPvBM3kr0uEt/cGkuOlTDJLJzcEf34wKaC1lBEwA75rR0P92w
	 fglqYzcmidTiLffNxQB17NAUNuvxpyfEVupTI11aljqyM0HEWLC/CXLfC2HkB+wBSWIUf
	 D01BCYEL4y+CnLx0EMk5JioOPwldjAcv9DsL2nkckdeWTjnmaVJHjgLYOayXBpaj7aA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=I8OG2BDR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
Received: from sender6-pp-f112.zoho.com (sender6-pp-f112.zoho.com [165.173.180.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00999606A324;
	Thu, 19 Nov 2026 13:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00999606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=I8OG2BDR
ARC-Seal: i=1; a=rsa-sha256; t=1795094307; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NRLgq3lY11xn3AieWMMsUd10Y3yZ4lLHny2rJmCypVUOWTjgBM8CQVs7UDr6afLZO0Rs1CZOZ7E9eo7TlGSDiMjn14DPw03yiIZQcMi6aWJ9DYrYdlV5RNHuELcP51LVBAT6vX6XZHr3eQN/mFK7vZwX6OBB2whrhBxYjCIBCl4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795094307; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Y5QljIJzJ2EvsPCbBU99vVrmRlTnuD78DuUYhuPJum4=; 
	b=e5UmJ1w2MAuy6KqWU49WdR9Y3a74MBU5eb6Ct+giVCy8SJ1CK76eSItiqjn9Q+AGJTPj3MfSQvqwaUzdxkBqyRdWejJVHcF/YM6QhsS92OiDrAC6Z4zcBFYOWvemElj6gCIf9acFfEQGHMajcUb8r9oTW4OBeojDDNVf/wUsyCw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=I8OG2BDRwE2dzG6r6V7ebAzn+3BJrPySr2t/auA+Wvbx/E8HeZAyqm/m3ipSz+7Zstf5lEDs9QJcC4sArfwlo8iz2k8Xr5ShKUzpGNEmkdubtus8gxSJDeOF8wTb2h6QY/zQt7XMG/EiVbcLJAKHCzVrhZxaMuL+/XNJGnf6cMB4kxEnLx0fiFBZVdG9/1SltpMqhcodru8wf7LZRnnvdJTuDpIhjWhzHQN9su0ITRXv1sDBL+oXO5q5IyEZdb8TGfA1WKas7Mggt5FHrXX0b4e9z4SYeQn/sCzwh80d0dIKSz5MsQhvVuoHWUp/ETho4TbLiCd4s7ihnjBuPi5mDw==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=Y5QljIJzJ2EvsPCbBU99vVrmRlTnuD78DuUYhuPJum4=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 17950943035410.2615982106077581;
	Thu, 19 Nov 2026 05:18:23 -0800 (PST)
Message-ID: <73a6179232b6db07014d78508c441a6013912e69.camel@rong.moe>
Subject: Re: [PATCH v4] platform/x86: asus-wmi: fix camera key LED on
 Zenbook S14
From: Rong Zhang <i@rong.moe>
To: Devin Bayer <dev@doubly.so>, Denis Benato <denis.benato@linux.dev>, 
 skyedryv <skyedryv@gmail.com>, git@turtledev.nz, Corentin Chary
 <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, Hans de
 Goede <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org
Cc: =?ISO-8859-1?Q?Jos=E9?= Guilherme de Castro Rodrigues
	 <jose.guilherme.cr.bh@gmail.com>, linux-kernel@vger.kernel.org
In-Reply-To: <9cbdb61b-9c49-4b31-a28d-022500b271a5@doubly.so>
References: <20261019-asus-wmi-camera-led-v4-1-7744c125bcc9@turtledev.nz>
	 <e212e07006249d68aa7b9df25c95581b307b10e2.camel@rong.moe>
	 <395209cded20a0bdc069b7bc19a68366b62a3f39.camel@rong.moe>
	 <a35a487b-7932-41f7-bbd5-0d0fad2035c4@linux.dev>
	 <4c7d100f18820cba7c4fe6f6fe50c6e3324504cc.camel@rong.moe>
	 <9cbdb61b-9c49-4b31-a28d-022500b271a5@doubly.so>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 21:12:26 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.62.1-3 
X-ZohoMailClient: External

Hi Devin,

On Wed, 2026-11-18 at 10:02 +0100, Devin Bayer wrote:
>=20
> On 17/11/2026 14.52, Rong Zhang wrote:
> >=20
> > > > > When a device has both ASUS_WMI_DEVID_CAMERA_LED and
> > > > > ASUS_WMI_DEVID_CAMERA_LED_NEG implemented, camera_neg_led_availab=
le is
> > > > > false and the LED device can't benefit from brightness_hw_changed=
.
> > >=20
> > > Does such device even exists? Can it exists?
> >=20
> > (+CC Devin)
> >=20
> > Both macros were added together, i.e., in commit 4bf1ea3fc914
> > ("platform/x86: asus-wmi: support the disable camera LED on F10 of
> > Zenbook 2023") for Zenbook UX3404VC, so I assume it has both implemente=
d.
> >=20
> > Plus, the name "_NEG" sounds like it was concluded through trial-and-
> > error.
> >=20
> > I suspect that the two devids were defined for different purposes, i.e.=
,
> > 0x00060078 for notification and 0x00060079 for query.
>=20
> Hello Rong,
>=20
> I can tell you what I know. I discovered the arguments from the ACPI=20
> metadata, and found that writing to both the CAMERA and CAMERA_NEG does=
=20
> the same thing, as far as I know, but NEG 1 =3D other 0.
>=20
> They control the LED and the camera.
>=20
> I don't know about query=C2=A0and notifications.

Could you test if any event is emitted when you press the camera key? See
is_camera_toggle() in Zane's patch for the corresponding event codes.

>=20
> The hardware key doesn't do anything if it's remapped, at least in my set=
up.

How to "remap" the "hardware key"? Isn't the LED device only "remaps" the
status LED?

Thanks,
Rong

>=20
> > > > > It'd be better to decouple the brightness_hw_changed path from
> > > > > !ASUS_WMI_DEVID_CAMERA_LED, since devices with both IDs should be=
 able to
> > > > > emit the WMI event.
> > > > >=20
> > > > > With that, how about adding a wrapper function that dispatches ca=
ll to
> > > > > either asus_wmi_get_devstate(ASUS_WMI_DEVID_CAMERA_LED) or
> > > > > asus_wmi_get_devstate(ASUS_WMI_DEVID_CAMERA_LED_NEG) according to=
 the
> > > > > IDs' presence? Then you can share the same brightness_hw_changed =
path by
> > > > > calling the wrapper function and eliminate the need of adding a d=
edicated
> > > > > brightness_get() callback in the same manner.
> > >=20
> > > I'm not understanding this: first the discussion moves toward "what i=
f one
> > > device has both" and then you ask about reusing the code for the non-=
neg
> > > dev id.... What am I missing here?
> >=20
> > Because I assume such devices exist. Perhaps Devin can give us some
> > clues...
> So it has both, I don't know which is more correct. I just documented it=
=20
> for posterity.
>=20
> Cheers,
> Devin
