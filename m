Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FC6378D7D
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Oct 2026 21:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791496340; cv=none; b=lV6OkqMjO10S5yStIsPvDERVOXmFEK4Mwlchw3Cxfu+ILAU5MHFnnxq7gcc9OsrTDUNOYkeWYFF+YBL9i08GHUibxDIlpnlsUVh+N5jdnnQIquodB0UPFaB9mzJEjb/wjvq4vjhCN9uXcjy8SvhlcaNiynnyjfuAwnt0fxClO7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791496340; c=relaxed/simple;
	bh=FhHUcaD8UXSzbiyTZq4K/AtVaFMkDoVaPhEfzChUsDY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=nvWmfnZrWGQmoJzv/mUx0N7mQUzMap4sQtZyZ+G5ZiYS0EtqgJxqqJCqx4AvRzoyaLbyDsXu07YbccdwbRbSOFwF3X+b3QTv28JMPBNRu/p26saRb2FTQmgrZpYvt9Nu6j1v0u5WL99VxbsdoKDz5FY1QqReLDSzqK915Y4oEc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pQKn+KYf; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pQKn+KYf"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48afbd2c386so2673175f8f.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Oct 2026 14:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791496336; x=1792101136; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/pDad/p1iYw8HWC/CzvqEa/trY0DbP6hqYsWT2Ny3bA=;
        b=pQKn+KYfohZHYdKIhpQ42znbsuDIFpCuzLdT3niCwj06xbznGXVvjZOu8XgfhZvHQu
         Ljed8qroJ5SZ4Nfwu7yn9MRwFZaVhqvhNE8d1wmkcZR16BETT3G4junF0irSBLjRuYzE
         6KGNmTcl0oAgj1h6b2tMukuSAEmMIn0w43OjFpsPS3VA19Uef7YD/PyGwqhcRcYiUimR
         df+uYMq9EAYnjN/4l608ARCL3leI+lWQangbIOwjYkvgq6fTWnDM8Irbj1fMeejNwXZd
         QC0pnqImVmsU8Ssd2sx8dJJuDUcfQpg4Ax50G+mSc3u0sx7WOHRgvSllxn0XUOjrjUhd
         Tr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791496336; x=1792101136;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/pDad/p1iYw8HWC/CzvqEa/trY0DbP6hqYsWT2Ny3bA=;
        b=PBu8yIcvM+LASjyIbeILP+7RY4t0wLA251SzPuNuJRCeE8VZPO4pBWXJRnM6/iVIl/
         CP76AWwfkAszZmoYv0AK5d4Hmswc7rPp8gp9As9b5xK6qYNkGajD9MPvJfK6mzZ749co
         2K7TGrJ1V4kpYataOkt3Xc0wCvywXYtbG4bH2IpjYJHuF1qC2sEJxX2fr/EvvlDfT4HF
         Ao5O4w1cMX8YxtljRpy2Q0CyUBOcRafvh8lBWXU/WgAoT4UsIlGeupDnZpT/ElRBKVLa
         zj02NLqtPn7iko/vbLtrOfhJFPzggUwfhFdnwt4iQEmGqyaJTaewmkbQuWBIKg+nXm69
         weWw==
X-Gm-Message-State: AFq9FYJDBnRmNSj2Ig2yY7VyDRY8RZxX29wx52xweXwldqJ/fl6XyY06
	P2m0w/iZVL/YiHPR8T8fITDMStKAFkVdTsXkbW5+3YWm27uNuE5NLY5ec7Y2CA==
X-Gm-Gg: AYBFou29QdmYOsGACMjyZ3oewfCantttfh25CELHtZs/zPRV/Z6WOBcKDJiRqdNSI/r
	K2/2cAUgBNLefXh7Lj9vdSGsg0gVcfR2OUbUCq3NonWNsLA/5QyTxZ7n09URDK8s0uqWsaT71y/
	zrxxWwa4zoD/9N7k7AQ1Wjxi6YE63OXUPm12lUfIrfIBTL3Hlnj0FITKEL9eeSEA+A6UQzNifO0
	4N6IvDU6qm6XLc0aB8kfV+k65qkg9XS0zLY88dV7UceJVQbPC2sYlKhHtuwlvL2p1vOaYLgCjPy
	0Km1QWub0kLQwjuDYfg4QvDXJ1qBHAktvcQRYifkSBukycKcm8iJFAEgYER2rG1mM06ZdRL/jbm
	gOBEwRy4wCM+gzeFw97hiiHvtWqqWVQhHC/eJKp0LnyTid4tJC2BGNj67yPqm/xlKtRSPctbFuk
	zId3JYGKAWwglDZYTinv2LHi5AX85bgb4At3Ix+zL0rdWn7jQYomOaTFlxWvndxnxOfWsSeYMiR
	v6AvgnjY77h2qP53A==
X-Received: by 2002:a05:6000:2205:b0:48c:54c0:4cf3 with SMTP id ffacd0b85a97d-48db94b3293mr405257f8f.28.1791496336232;
        Thu, 08 Oct 2026 14:52:16 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2a02:b027:8013:a311:38c3:93ff:fe00:31b1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9463a9dsm406901f8f.6.2026.10.08.14.52.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 14:52:15 -0700 (PDT)
Date: Thu, 08 Oct 2026 23:52:11 +0200
From: Denis Benato <benato.denis96@gmail.com>
To: =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Denis Benato <denis.benato@linux.dev>, Bartu Alev <bartualev@gmail.com>
CC: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Hans de Goede <hansg@kernel.org>, "Luke D . Jones" <luke@ljones.dev>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_2/2=5D_platform/x86=3A_asus-wm?=
 =?US-ASCII?Q?i=3A_add_TUF_keyboard_RGB_readback_support?=
User-Agent: Thunderbird for Android
In-Reply-To: <570a8f23-0782-8a45-d62f-c95bb28dade9@linux.intel.com>
References: <20260925200744.129714-1-bartualev@gmail.com> <20260926005625.171560-1-bartualev@gmail.com> <20260926005625.171560-3-bartualev@gmail.com> <c0301eb2-62b9-4dbd-ba24-3a2c40675b20@linux.dev> <570a8f23-0782-8a45-d62f-c95bb28dade9@linux.intel.com>
Message-ID: <2C6A459C-890A-418C-9331-D8B521B226A5@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Il 8 ottobre 2026 14:48:31 CEST, "Ilpo J=C3=A4rvinen" <ilpo=2Ejarvinen@linu=
x=2Eintel=2Ecom> ha scritto:
>On Sat, 26 Sep 2026, Denis Benato wrote:
>> On 9/26/26 02:56, Bartu Alev wrote:
>> > TUF Gaming laptops expose kbd_rgb_mode and kbd_rgb_state as write-onl=
y
>> > attributes (DEVICE_ATTR_WO), preventing userspace from querying the
>> > active hardware configuration=2E
>> >
>> > Add readback support by querying ASUS_WMI_DEVID_TUF_RGB_READBACK
>> > (0x0010005B) via the WMI DSTS method=2E On supported platforms this
>> > evaluates the DSDT method EC0=2EKBLS(), which returns a 16-byte buffe=
r
>> > containing the active lighting mode, RGB color channels, effect speed
>> > and power-state flags=2E
>> >
>> > Introduce kbd_rgb_read_status() to evaluate and validate the buffer,
>> > and convert both attributes to DEVICE_ATTR_RW=2E Map the hardware spe=
ed
>> > codes (0xe1, 0xeb, 0xf5) to their sysfs indices (0, 1, 2)=2E
>> >
>> > The command field is not part of the status buffer: "immediate vs
>> > save-to-flash" is a property of the write verb (0xb3/0xb4), not of
>> > readable state, and the EC mirror is updated identically by both=2E
>> > Readback therefore emits a synthetic leading '1' - the canonical
>> > input form userspace writes - so that output matches input=2E
>> >
>> > Suggested-by: Denis Benato <denis=2Ebenato@linux=2Edev>
>> > Signed-off-by: Bartu Alev <bartualev@gmail=2Ecom>
>> > ---
>> >  drivers/platform/x86/asus-wmi=2Ec            | 79 ++++++++++++++++++=
+++-
>> >  include/linux/platform_data/x86/asus-wmi=2Eh |  3 +
>> >  2 files changed, 80 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/platform/x86/asus-wmi=2Ec b/drivers/platform/x86=
/asus-wmi=2Ec
>> > index db6ee1974838=2E=2Efe1dcc7701ad 100644
>> > --- a/drivers/platform/x86/asus-wmi=2Ec
>> > +++ b/drivers/platform/x86/asus-wmi=2Ec
>> > @@ -1046,7 +1046,58 @@ static ssize_t gpu_mux_mode_store(struct devic=
e *dev,
>> >  static DEVICE_ATTR_RW(gpu_mux_mode);
>> >  #endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
>> > =20
>> > +static int kbd_rgb_read_status(u8 data[16])
>> > +{
>> > +	int err;
>> > +
>> > +	err =3D asus_wmi_evaluate_method_buf(ASUS_WMI_METHODID_DSTS,
>> > +					   ASUS_WMI_DEVID_TUF_RGB_READBACK,
>> > +					   0, data, 16);
>> > +
>> > +	if (err)
>> > +		return err < 0 ? err : -ENODEV;
>> > +
>> > +	/* DUBF[0] is a constant 1 set by the AML: anything else is not KBL=
S */
>> > +	if (data[0] !=3D 1)
>> > +		return -ENODEV;
>> > +
>>=20
>> -ENODEV or -ENOTSUPP ? Which one is better suited for these kind of thi=
ngs?
>
>If something is not there, -ENODEV is appropriate=2E
>
>Unexpected comms is -EIO (-EINVAL is unfortunately often misused for=20
>this but it -EINVAL is to say input parameter was wrong)=2E
>
>-ENOTSUPP is not a standard error code (the correct one would be=20
>-EOPNOTSUPP)=2E
>
>TBH, I don't really know where the line between -ENODEV and -EOPNOTSUPP=
=20
>is=2E I'd personally use the latter mostly for the case where software si=
de=20
>lacks something=2E
>
>In anycase, wrong errno's are endemic and hard to fix without running=20
>afoul with something as they often relate also to userspace ABIs=2E
>

-ENODEV it is=2E=2E=2E=2E Or -ENODATA when we can write but not read back =
the status?


>> If we go with two separate sysfs attrs you don't register the read one,
>> otherwise I am not sure=2E
>>=20
>> > +	return 0;
>> > +}
>> > +
>> >  /* TUF Laptop Keyboard RGB Modes ***********************************=
***********/
>> > +static ssize_t kbd_rgb_mode_show(struct device *dev,
>> > +				 struct device_attribute *attr,
>> > +				 char *buf)
>> > +{
>> > +	u8 data[16] =3D {};
>> > +	u32 speed;
>> > +	int err;
>> > +
>> > +	err =3D kbd_rgb_read_status(data);
>> > +	if (err)
>> > +		return err;
>> > +
>> > +	/* Map hardware speed codes back to sysfs index:
>> > +	 * 0xe1 -> 0 (slow), 0xeb -> 1 (normal), 0xf5 -> 2 (fast)
>> > +	 */
>> > +	switch (data[5]) {
>> > +	case 0xe1:
>> > +		speed =3D 0;
>> > +		break;
>> > +	case 0xeb:
>> > +		speed =3D 1;
>> > +		break;
>> > +	case 0xf5:
>
>Name literals with defines=2E When it comes to offsets, consider if a=20
>struct would be viable instead of byte array + named define index=2E
>
>> > +		speed =3D 2;
>> > +		break;
>> > +	default:
>> > +		speed =3D 1;
>> > +		break;
>> > +	}
>> > +
>> > +	return sysfs_emit(buf, "1 %d %d %d %d %d\n",
>> > +			  data[1], data[2], data[3], data[4], speed);
>>=20
>> We had this discussion in discord so I want to update everyone reading:
>> the status returned is the current one and both cmd=3D0 and cmd=3D1 on =
write
>> update the current status=2E
>>=20
>> Therefore this is an asymmetry that doesn't really need to be,
>> what if we introduce another sysfs that is RO? Ilpo?
>
>I'm not entirely sure what's the suggestion=2E
>

1 sysfs attribute for read and don't touch the write one since they are in=
 two different formats=2E

Like one returns 4 values and one accepts 5: they are asymmetric hence my =
suggestion=2E

>> > +}
>> >  static ssize_t kbd_rgb_mode_store(struct device *dev,
>> >  				 struct device_attribute *attr,
>> >  				 const char *buf, size_t count)
>> > @@ -1099,7 +1150,7 @@ static ssize_t kbd_rgb_mode_store(struct device=
 *dev,
>> > =20
>> >  	return count;
>> >  }
>> > -static DEVICE_ATTR_WO(kbd_rgb_mode);
>> > +static DEVICE_ATTR_RW(kbd_rgb_mode);
>> > =20
>> >  static DEVICE_STRING_ATTR_RO(kbd_rgb_mode_index, 0444,
>> >  			     "cmd mode red green blue speed");
>> > @@ -1115,6 +1166,30 @@ static const struct attribute_group kbd_rgb_mo=
de_group =3D {
>> >  };
>> > =20
>> >  /* TUF Laptop Keyboard RGB State ***********************************=
***********/
>> > +static ssize_t kbd_rgb_state_show(struct device *dev,
>> > +				  struct device_attribute *attr,
>> > +				  char *buf)
>> > +{
>> > +	u8 data[16] =3D {};
>> > +	u8 flags;
>> > +	int err;
>> > +
>> > +	err =3D kbd_rgb_read_status(data);
>> > +	if (err)
>> > +		return err;
>> > +
>> > +	/*
>> > +	 * data[6] power-state bitmask:
>> > +	 * BIT(1) boot, BIT(3) awake, BIT(5) sleep, BIT(7) shutdown
>> > +	 */
>> > +	flags =3D data[6];
>> > +
>> > +	return sysfs_emit(buf, "1 %d %d %d %d\n",
>> > +			  !!(flags & BIT(1)),
>> > +			  !!(flags & BIT(3)),
>> > +			  !!(flags & BIT(5)),
>> > +			  !!(flags & BIT(7)));
>
>These BIT(x) should be named with defines as you clearly know what they=
=20
>mean (I assume the _store ones too match to these so do the addition and=
=20
>conversion in own patch)=2E
>
>A comment like the one above is almost always an indication of a naming=
=20
>problem that, after fixed, makes the comment totally redundant=2E
>
>We try to leave comments for something that is tricky, non-intuitive, or
>complex=2E
>
>> > +}
>> >  static ssize_t kbd_rgb_state_store(struct device *dev,
>> >  				 struct device_attribute *attr,
>> >  				 const char *buf, size_t count)
>> > @@ -1146,7 +1221,7 @@ static ssize_t kbd_rgb_state_store(struct devic=
e *dev,
>> > =20
>> >  	return count;
>> >  }
>> > -static DEVICE_ATTR_WO(kbd_rgb_state);
>> > +static DEVICE_ATTR_RW(kbd_rgb_state);
>> > =20
>> >  static DEVICE_STRING_ATTR_RO(kbd_rgb_state_index, 0444,
>> >  			     "cmd boot awake sleep shutdown");
>> > diff --git a/include/linux/platform_data/x86/asus-wmi=2Eh b/include/l=
inux/platform_data/x86/asus-wmi=2Eh
>> > index b5ed8c83ace1=2E=2E1447c7f354bc 100644
>> > --- a/include/linux/platform_data/x86/asus-wmi=2Eh
>> > +++ b/include/linux/platform_data/x86/asus-wmi=2Eh
>> > @@ -161,6 +161,9 @@
>> >  /* TUF laptop RGB power/state */
>> >  #define ASUS_WMI_DEVID_TUF_RGB_STATE	0x00100057
>> > =20
>>=20
>> The pre-existing one should probably be renamed to make clear
>> it's write only and it is a command=2E=2E=2E In its own patch=2E
>>=20
>> ASUS_WMI_DEVID_TUF_RGB_CMD probably?
>>=20
>> > +/* TUF laptop RGB keyboard status readback*/
>> > +#define ASUS_WMI_DEVID_TUF_RGB_READBACK	0x0010005B
>> > +
>>=20
>> ASUS_WMI_DEVID_TUF_RGB_READ_STATUS ?
>>=20
>>=20
>> >  /* Bootup sound control */
>> >  #define ASUS_WMI_DEVID_BOOT_SOUND	0x00130022
>> > =20
>>=20
>

