Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3347A143C6E
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jul 2024 23:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721864762; cv=none; b=UCh1zDi65ScMP3fpwF4/zR8nZfrg0CnSVjrnlA31pov/IlmbBpYsDMPQaHUrKGdL9gdHt9vkU5646m0VXG7K9MraYqeNchN/TFKRY1MN4yKz/isrAMZZMixivopOsChQkucz9SVDdgsAzsXvGO2XaNkTFrIGc36TuaoqBaBRwEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721864762; c=relaxed/simple;
	bh=ITqgSbvo7Q1gCVXBDuGoRpaEndAT1XKMZzV718jEhzs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qJyk2ZPjftqkiWOiO7S0ItZJH7p8VIJm7XpBP3nrpdVPUcyHm2WfrJE+GeGhoDy/xT2hozth/lbGwAQUfVvhVhKkj/GtC1ngO4X1FyxocEC88IkkvvKYAfynJj+yBjFn7/wP4u67jU2tvHV0Ak5XANm7Mab+VmJJCoXEGQEGPsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=AnjPlNuT; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="AnjPlNuT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1721864758; x=1722123958;
	bh=VTUpiKMcdneqCgWSgT9HJnjcDT4T1oja8zC2L4JITtI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=AnjPlNuToabbUgaA6eHVkPrAfW0unTKu9AqLCDZqw7/Wizd8JrbA1UGckCWi7xUEs
	 cfV1e08vcrb9hqG3u0ujyU41rDN831/lw0I/NWfSWm+YVn5lZr0bzGtKrryBqZ1sic
	 bMjDQIvivNISkhkW/cB3Z3fXFQhlS+tR7FmL6C6IchhzeUllUw6rcQ+R/w4+qHL5tp
	 CoZq4r8yzvAAcUbEsCHUvFBBy8GreBQRQPELOu1Me56sYS6YRjx1fwM/wDL0n9bvmp
	 8fP1By2yu2fpjMHzP7pAH67Jw2K/pI0P1oKl1lLUdCM12J1XdV15vhxJLuMySX4tUY
	 +aVAsqMXm2zbg==
Date: Wed, 24 Jul 2024 23:45:54 +0000
To: Liam Howlett <howlett@gmail.com>
From: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc: Armin Wolf <W_Armin@gmx.de>, hmh@hmh.eng.br, hdegoede@redhat.com, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Subject: Re: Tablet mode on L13 Yoga Gen 3
Message-ID: <JrI0KCYBVY2fFxGaZWHazfLIX7oZRsF41F_DnFD886nJEcq7uyegWQPOM2O7UkmvrL2FGFjwB_TNRn2FFvv_aZVnpEn14mLkLg4bHCyjV2s=@protonmail.com>
In-Reply-To: <CAHfPaQsK5=VChWa_y1eotQQx=YfpduE13jcCyp5KwPUwbUs+0g@mail.gmail.com>
References: <CAHfPaQt_ZkJ=LghsuNg98X+HmXcbDbPvT2QyB9sDQLX5+KkU4Q@mail.gmail.com> <CAHfPaQuLT1zvuRBQ9bJZ7=rxLrOXbZ9xryoGH8piWa3r5cfSPQ@mail.gmail.com> <1f3435c3-6006-4f6c-8e8d-d6e0ef23e42e@gmx.de> <CAHfPaQsK5=VChWa_y1eotQQx=YfpduE13jcCyp5KwPUwbUs+0g@mail.gmail.com>
Feedback-ID: 20568564:user:proton
X-Pm-Message-ID: 87a771ee70690c631e76582a20622684cd23d250
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

2024. j=C3=BAlius 24., szerda 4:39 keltez=C3=A9ssel, Liam Howlett <howlett@=
gmail.com> =C3=ADrta:

> On Tue, Jul 23, 2024 at 10:19=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrot=
e:
> >
> > Am 24.07.24 um 01:35 schrieb Liam Howlett:
> >
> > > Just to follow this up, it's not (just?) an acpi issue, the driver
> > > isn't doing what it needs to do - if there is a driver for the
> > > hardware at all.  I'm still looking into what is necessary.
> > >
> > > I did write the value to the CMMD variable, but calling the _Q2E
> > > function does not cause the ^HKEY.MHKQ (0x60C0) to be sent.  If I
> > > understand this correctly, that's what should happen.
> > >
> > > Thanks,
> > > Liam
> > >
> > Hi,
> >
> > can you share the output of "acpidump"? This will make it easier to fig=
ure
> > out what the ACPI code is doing.
>=20
> Sure, see attached (I hope gmail doesn't mess this up on me..)
>=20
> What makes me think it's not just an acpi issue is that the iio device
> doesn't seem to have an indicator for the rotation of hinge angle of
> the screen:
> ls /sys/bus/iio/devices/iio\:device0
> buffer  buffer0  current_timestamp_clock  dev  in_accel_hysteresis
> in_accel_offset  in_accel_sampling_frequency  in_accel_scale
> in_accel_x_raw  in_accel_y_raw  in_accel_z_raw  name  power
> scan_elements  subsystem  trigger  uevent

Hi


I am not sure if this will be useful but I have a Lenovo YOGA 520-14IKB. An=
d on that
machine the hinge rotation angle seems to be reported via a custom HID sens=
or based
on reverse engineering and experimentation.

You might want to check under /sys/bus/platform/drivers/hid_sensor_custom/.=
 In my
case there is one.

$ pwd
/sys/bus/platform/drivers/hid_sensor_custom/HID-SENSOR-2000e1.3.auto
$ cat feature-b-200306/feature-b-200306-value
76 0 101 0 110 0 111 0 118 0 111 0 32 0 89 0 111 0 103 0 97 0

The above feature (property-sensor-model) spells out "Lenovo Yoga" in UTF-1=
6.
As far as I remember this is how the windows service finds the correct sens=
or.
Under the various inputs, the sensor seems to report the hinge rotation ang=
le,
as well as the angles between the keyboard and screen, and the ground level=
.

If the situation is similar in your case, then there is already infrastruct=
ure
to expose the angles to user space in iio sensors. See hid-sensor-custom an=
d
hid-sensor-custom-intel-hinge.


Regards,
Barnab=C3=A1s P=C5=91cze


>=20
> It is difficult to figure out if it's supposed to be the iio device
> that is supposed to make this happen - there's some talk of intel
> virtual buttons, but that seems wrong on an amd laptop and I don't see
> the necessary details in the dsdt table.  Any idea on where the data
> is supposed to come from would also be helpful.  The fact that it
> remains 0 after boot does seem to indicate that the device isn't
> writing anything to acpi - which fits with the missing module or
> module logic for whatever hardware is supposed to be doing this.
>=20
> I will say that the rotation of the display is detected and works,
> it's just the "laptop/tablet mode" that does not (0x60c0 is never
> emitted and so the keyboard and touchpad remain active).
>=20
> Although, I don't have a working screen rotating laptop, so I'm not
> entirely sure if that's necessary?
>=20
> >
> > Thanks,
> > Armin Wolf
> >
> > (Also, please do not top-post, thank you).
> >
>=20
> Sorry, I generally don't use gmail form development and haven't set up
> mutt for this address.  Thank you for look at this issue.
>=20
> Thanks,
> Liam
>=20
> ...
