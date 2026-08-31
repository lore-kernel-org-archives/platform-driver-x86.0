Received: from mail-244119.protonmail.ch (mail-244119.protonmail.ch [109.224.244.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987AE46AA62
	for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 15:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189326; cv=none; b=JgQbKerq9zo8Z+wiHJj4ZfMRyYsMP27CCUxetDB4at6UOtDfKUgmVjs/OwTwjmoRvImFz6pVb376O99+JidJMcxPv2WGHgHcE0O1GXm5ZztLhrSEqOPMCJQBWfRORPhvn27pOMaMZrFSaFAH/zjgBe/BEcXIv+MNEJeG4J8Rw3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189326; c=relaxed/simple;
	bh=LkLkWC5E/sHsMF0mhg4YjgzVBtD3KkWXovmGY6mosH0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TZYQb26ZszHlqBPimGW7RKzTHYCBQLLAQQzPJeSpad/z1DBh1SYXH7Q3ZMYk+a8HP/pCqWLDkjMbXlz1Z07r4hd5JiHREcvQLtMQrsEAmHDeeBRJtikG0P/1vPPvGRpCYSXNwRMJuAlbZ88lhSWxCEwKQS8cg9v9JUJli9o42P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=berg.pm; spf=pass smtp.mailfrom=berg.pm; dkim=pass (2048-bit key) header.d=berg.pm header.i=@berg.pm header.b=TyRyDaZM; arc=none smtp.client-ip=109.224.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=berg.pm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berg.pm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berg.pm header.i=@berg.pm header.b="TyRyDaZM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=berg.pm;
	s=protonmail; t=1788189318; x=1788448518;
	bh=7oCwGkT42GO7LqvkoysDwfB7ADZ7QYUXw5/poBlgatI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=TyRyDaZM4wdc7G6QEpxhj2G939X5Zh4/uO/gq6HPd1U2m7QTtX8osd1F9WcUUUwpJ
	 UtvoZo1nMWOiPsDKpCkmqdskneMONewd8gm7vrEG8H2jcmBpEV6Pkx5NK5v+A0AKcK
	 mC7prsQAkYVvJKrOi2hqgl88qsssLWxVFeMYQZJKuyet79PHaPoW0ePx5BKSxISdEm
	 wY6YjFo2IrAmycIKNrH6x1eKrWOU0OJAWnr8bfmZgx3o3lZ0WsNaAbv9iNWcIjKtcK
	 /rCQlG8u+NSU9ZnKfVu+JAJIWX3cYYIbDrYRuQa7XmPCp4aRVAmKG170QMdf1BmMP6
	 e0I+OCaIoV+gg==
Date: Mon, 31 Aug 2026 15:15:11 +0000
To: "D. Manresa" <dmanresa@gmail.com>
From: Jakob Berg Jespersen <dev@berg.pm>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede <johannes.goede@oss.qualcomm.com>, platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: int3472: map the ov7251 power enable GPIO to "vdda"
Message-ID: <9bjLpqRXj6Hx0eSwnrfYfzQUL9rQwcxzb7uzDdMDhfQUkXmd8vUjOYrWOWHduP7IUZ8rtmnsUxIzX5E3CLVGfXCylvdrZYdmJhkX-O24aT4=@berg.pm>
In-Reply-To: <20260831102306.36610-1-dmanresa@gmail.com>
References: <20260831102306.36610-1-dmanresa@gmail.com>
Feedback-ID: 210104851:user:proton
X-Pm-Message-ID: 340426e165c5b6b9ebd6e84c8d9e176b94f2be70
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi,

Tested on a second Surface Pro 7+ (Tiger Lake, IPU6), on v7.3-rc1 with
your patch as the only change, taint 0 and no out-of-tree modules.

Before:

  ov7251 i2c-INT347E:00: supply vdda not found, using dummy regulator
  ov7251 i2c-INT347E:00: ov7251_write_reg: write reg error -121: reg=3D103,=
 val=3D1
  ov7251 i2c-INT347E:00: probe with driver ov7251 failed with error -121

After:

  ov7251 i2c-INT347E:00: supply vdddo not found, using dummy regulator
  ov7251 i2c-INT347E:00: supply vddd not found, using dummy regulator
  ov7251 i2c-INT347E:00: OV7251 revision 7 (1F) detected at address 0x60

and the device binds. vddd and vdddo stay on dummy regulators as you
describe.

Tested-by: Jakob Berg Jespersen <dev@berg.pm>   # Surface Pro 7+, probe/pow=
er-on

I have only confirmed that the sensor powers up and probes.=20
I could not get it streaming here, libcamera 0.7.1 refuses=20
the sensor on this machine:

  'ov7251 3-0060': Mandatory V4L2 control 0x009e0903 not available
  Failed to create sensor for 'ov7251 3-0060': -22

0x009e0903 is V4L2_CID_ANALOGUE_GAIN, and the in-tree ov7251 registers
V4L2_CID_GAIN instead, so only the front and rear cameras get
enumerated.=20

I have a small unsubmitted patch that I had set aside to focus on=20
the front and back cameras.  With this patch, on top of yours,=20
libcamera lists the IR camera as well:

  Available cameras:
  1: Internal front camera (\_SB_.PC00.I2C2.CAMF)
  2: 'ov7251' (\_SB_.PC00.I2C3.CAM3)
  3: Internal back camera (\_SB_.PC00.I2C3.CAMR)

Did you have something equivalent downstream? Happy to send it to you
or to the list if it would help.=20

I should say I have not got a usable image out of it here yet: Frames
come through at the right size and rate, but the content is saturated
white, and the sensor's own test pattern does not come through either.


Regards,
Jakob


On Monday, August 31st, 2026 at 12:23, D. Manresa <dmanresa@gmail.com> wrot=
e:

> On IPU6 designs carrying an OV7251 IR sensor (ACPI HID INT347E) the INT34=
72
> describes the sensor's single gated rail as a power-enable GPIO, which th=
e
> driver registers as a regulator with con_id "avdd". The ov7251 driver and=
 its
> DT bindings name the sensor supplies vdda, vddd and vdddo, so the lookup =
finds
> nothing, the rail is never enabled, and probe fails on the first I2C acce=
ss:
>=20
>   int3472-discrete INT3472:02: avdd  \_SB.GPI0 pin 131 active-high
>   ov7251 i2c-INT347E:00: supply vdda not found, using dummy regulator
>   ov7251 i2c-INT347E:00: probe with driver ov7251 failed with error -121
>=20
> Map the power-enable GPIO to con_id "vdda" for INT347E, the same way the
> existing entries map it to "vdd" for the mt9m114 and to "vana" for the im=
x471.
> The sensor's other two supplies keep falling back to the dummy regulator,
> which is correct here: the firmware gates a single rail.
>=20
> The table already has an INT347E entry mapping the reset GPIO to "enable"=
,
> added when the ov7251 was brought up on these machines; this is the same =
class
> of firmware-vs-binding name mismatch for the remaining pin.
>=20
> Tested on a Microsoft Surface Pro 7+ (Tiger Lake, IPU6): with this change=
 the
> IR sensor probes, the illuminator strobes, and the camera streams 640x480=
 at
> 30 fps through libcamera. The same failure was reproduced independently o=
n a
> second Pro 7+ running stock firmware and a distro kernel, with no out-of-=
tree
> code, in [1].
>=20
> Developed with the assistance of an AI tool (Claude) and verified on hard=
ware.
>=20
> Link: https://github.com/linux-surface/linux-surface/issues/1702 [1]
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Signed-off-by: D. Manresa <dmanresa@gmail.com>
> ---
> v2: no code changes. v1 never reached the lists (a mail tooling error on
> my side dropped the Cc headers); resent with platform-driver-x86 on Cc as
> Hans requested, with his Reviewed-by collected.
>=20
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/plat=
form/x86/intel/int3472/discrete.c
> index 6c729fc..157345e 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -143,6 +143,11 @@ static const char * const power_enable_hids_enable[]=
 =3D {
>  =09NULL
>  };
>=20
> +static const char * const power_enable_hids_vdda[] =3D {
> +=09"INT347E", /* ov7251 */
> +=09NULL
> +};
> +
>  /**
>   * struct int3472_gpio_map - Map GPIOs to whatever is expected by the
>   * sensor driver (as in DT bindings)
> @@ -185,6 +190,13 @@ static const struct int3472_gpio_map int3472_gpio_ma=
p[] =3D {
>  =09=09.con_id =3D "dvdd",
>  =09=09.enable_time_us =3D 45 * USEC_PER_MSEC,
>  =09},
> +=09{=09/* Sensors which expect "vdda" as con_id for power enable */
> +=09=09.hids =3D power_enable_hids_vdda,
> +=09=09.type_from =3D INT3472_GPIO_TYPE_POWER_ENABLE,
> +=09=09.type_to =3D INT3472_GPIO_TYPE_POWER_ENABLE,
> +=09=09.con_id =3D "vdda",
> +=09=09.enable_time_us =3D GPIO_REGULATOR_ENABLE_TIME,
> +=09},
>  =09{=09/* Sensors which expect "vana" as con_id for power enable */
>  =09=09.hids =3D power_enable_hids_vana,
>  =09=09.type_from =3D INT3472_GPIO_TYPE_POWER_ENABLE,
> --
> 2.43.0
> 
