Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501732;
	b=OGYIrUfpg7Zu9RSnZc9zGCRAU+F3anDP1B3Xuco/0a229dqwjXSwYtUth5mumgYZX2Ys
	 ujAcXVBo/rvRMuhvdHMo4YwMsMhAjcPYLhcX5XyUfKuszARMv79eShVAZ8Ng+KaJ03l5q
	 /Ao3FSYITHcHy0HxkZecon25Ew6La7kah4mfsWj+1xfC9K0k1DNwCfoDRDuwmV6oyfT2P
	 LiU0GGn4IqB4sHTqcHwmsaTnhJiTzJMyI9mmZaXRO+GQm7RU3xvOlm910/ehH4JdYEYZ1
	 5PIwAinCAV7nND6e3itpsD+/YHoc9IYgFo1jGyfPxWnSPEC4oD+kYEsFu8pBZXAlFHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501732;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=Z6XXg8D2Jni1w5UG/h2otN80XxXBVxUGHMl3ukoCRhs=;
	b=jZya00V0z3iiyzgwz3KmFdjlZLK9+D4aCOZKR45FoP4fGTOz7PxX24NUgSTldyzR3Chp
	 77swexsas++UbEZRgLMuZkdt7YJQJYiwvewW5n044naZz2uyNDyGbtRQhaidui77854ff
	 rB1iGHmHhG1BSrprMDKpsWOngFvn+XXJ9AWHMB9P1rtvSx6il9h9jjDwKyCrA4MhU+GX0
	 32g/6WTE2POEMXW+d8QH4t5JnInjyAcQu+A0iLocIHgV9d+1ySzxr//1UGgryzu0Fgz27
	 zXIWiLA3KfQoZkqJQ4cOIT9KJmrHfBqoBTcOookQBU7Wv4sxxT71xx/+yUYhgO7nDcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DpUnGnWA;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A64606A319;
	Tue, 20 Oct 2026 13:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46A64606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DpUnGnWA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792501733; x=1824037733;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ftoDVKP4FmzQxXitwmaMLu02k8bEuuMI6TnnwAM9v+o=;
  b=DpUnGnWAI7sSh5TSOt59ZkHTdwLUgaESCus6omgFgGvmlPfzTI/7Pd6X
   n52+JebIdVDyFdkA/+7HJsQKCczjh39SwpbpwlzkzsOqWVvrY6ZTj6ZIJ
   huCh40T9nsKnYfzLmtJMhrnFo9KI4B0UT9jU0NKfcLPaniBWLgU7EiIFh
   3FypNjKscRoqTBEfMtUXy9aQu5uSG/7StWGmSKTwlKxXqaXrQ1pJPiSkR
   Dra6q46e8xT1v8gKtH94snxStXBpR3wPOBbjVJ8wrFcSc7itIm/YDVXr+
   nNYTEbNA2Zj903JGffHrJ+28k9P+xxMl7KBInAB5E3szsDJOwQ3PEfKhc
   Q==;
X-CSE-ConnectionGUID: z7MrYQjfQMykseyHl17a+A==
X-CSE-MsgGUID: rO3SBx5ZTtu7c+c1hi020A==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1213963"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1213963"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 06:08:52 -0700
X-CSE-ConnectionGUID: GaNmvxB4RkaF9lRLOPTApQ==
X-CSE-MsgGUID: j/RDLSMFQkmN/GwlhnW4nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2814933"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.181])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 06:08:49 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 Oct 2026 16:08:44 +0300 (EEST)
To: Denis Benato <benato.denis96@gmail.com>
cc: Denis Benato <denis.benato@linux.dev>, Bartu Alev <bartualev@gmail.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    Hans de Goede <hansg@kernel.org>, "Luke D . Jones" <luke@ljones.dev>
Subject: Re: [PATCH v2 2/2] platform/x86: asus-wmi: add TUF keyboard RGB
 readback support
In-Reply-To: <2C6A459C-890A-418C-9331-D8B521B226A5@gmail.com>
Message-ID: <6086490b-4a59-5095-8bcc-3728922fd9d6@linux.intel.com>
References: <20260925200744.129714-1-bartualev@gmail.com> <20260926005625.171560-1-bartualev@gmail.com> <20260926005625.171560-3-bartualev@gmail.com> <c0301eb2-62b9-4dbd-ba24-3a2c40675b20@linux.dev> <570a8f23-0782-8a45-d62f-c95bb28dade9@linux.intel.com>
 <2C6A459C-890A-418C-9331-D8B521B226A5@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1389911286-1792501724=:1177"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1389911286-1792501724=:1177
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 8 Oct 2026, Denis Benato wrote:

> Il 8 ottobre 2026 14:48:31 CEST, "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linu=
x.intel.com> ha scritto:
> >On Sat, 26 Sep 2026, Denis Benato wrote:
> >> On 9/26/26 02:56, Bartu Alev wrote:
> >> > TUF Gaming laptops expose kbd_rgb_mode and kbd_rgb_state as write-on=
ly
> >> > attributes (DEVICE_ATTR_WO), preventing userspace from querying the
> >> > active hardware configuration.
> >> >
> >> > Add readback support by querying ASUS_WMI_DEVID_TUF_RGB_READBACK
> >> > (0x0010005B) via the WMI DSTS method. On supported platforms this
> >> > evaluates the DSDT method EC0.KBLS(), which returns a 16-byte buffer
> >> > containing the active lighting mode, RGB color channels, effect spee=
d
> >> > and power-state flags.
> >> >
> >> > Introduce kbd_rgb_read_status() to evaluate and validate the buffer,
> >> > and convert both attributes to DEVICE_ATTR_RW. Map the hardware spee=
d
> >> > codes (0xe1, 0xeb, 0xf5) to their sysfs indices (0, 1, 2).
> >> >
> >> > The command field is not part of the status buffer: "immediate vs
> >> > save-to-flash" is a property of the write verb (0xb3/0xb4), not of
> >> > readable state, and the EC mirror is updated identically by both.
> >> > Readback therefore emits a synthetic leading '1' - the canonical
> >> > input form userspace writes - so that output matches input.
> >> >
> >> > Suggested-by: Denis Benato <denis.benato@linux.dev>
> >> > Signed-off-by: Bartu Alev <bartualev@gmail.com>
> >> > ---
> >> >  drivers/platform/x86/asus-wmi.c            | 79 +++++++++++++++++++=
++-
> >> >  include/linux/platform_data/x86/asus-wmi.h |  3 +
> >> >  2 files changed, 80 insertions(+), 2 deletions(-)
> >> >
> >> > diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/=
asus-wmi.c
> >> > index db6ee1974838..fe1dcc7701ad 100644
> >> > --- a/drivers/platform/x86/asus-wmi.c
> >> > +++ b/drivers/platform/x86/asus-wmi.c
> >> > @@ -1046,7 +1046,58 @@ static ssize_t gpu_mux_mode_store(struct devi=
ce *dev,
> >> >  static DEVICE_ATTR_RW(gpu_mux_mode);
> >> >  #endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
> >> > =20
> >> > +static int kbd_rgb_read_status(u8 data[16])
> >> > +{
> >> > +=09int err;
> >> > +
> >> > +=09err =3D asus_wmi_evaluate_method_buf(ASUS_WMI_METHODID_DSTS,
> >> > +=09=09=09=09=09   ASUS_WMI_DEVID_TUF_RGB_READBACK,
> >> > +=09=09=09=09=09   0, data, 16);
> >> > +
> >> > +=09if (err)
> >> > +=09=09return err < 0 ? err : -ENODEV;
> >> > +
> >> > +=09/* DUBF[0] is a constant 1 set by the AML: anything else is not =
KBLS */
> >> > +=09if (data[0] !=3D 1)
> >> > +=09=09return -ENODEV;
> >> > +
> >>=20
> >> -ENODEV or -ENOTSUPP ? Which one is better suited for these kind of th=
ings?
> >
> >If something is not there, -ENODEV is appropriate.
> >
> >Unexpected comms is -EIO (-EINVAL is unfortunately often misused for=20
> >this but it -EINVAL is to say input parameter was wrong).
> >
> >-ENOTSUPP is not a standard error code (the correct one would be=20
> >-EOPNOTSUPP).
> >
> >TBH, I don't really know where the line between -ENODEV and -EOPNOTSUPP=
=20
> >is. I'd personally use the latter mostly for the case where software sid=
e=20
> >lacks something.
> >
> >In anycase, wrong errno's are endemic and hard to fix without running=20
> >afoul with something as they often relate also to userspace ABIs.
> >
>=20
> -ENODEV it is.... Or -ENODATA when we can write but not read back the sta=
tus?
>=20
>=20
> >> If we go with two separate sysfs attrs you don't register the read one=
,
> >> otherwise I am not sure.
> >>=20
> >> > +=09return 0;
> >> > +}
> >> > +
> >> >  /* TUF Laptop Keyboard RGB Modes **********************************=
************/
> >> > +static ssize_t kbd_rgb_mode_show(struct device *dev,
> >> > +=09=09=09=09 struct device_attribute *attr,
> >> > +=09=09=09=09 char *buf)
> >> > +{
> >> > +=09u8 data[16] =3D {};
> >> > +=09u32 speed;
> >> > +=09int err;
> >> > +
> >> > +=09err =3D kbd_rgb_read_status(data);
> >> > +=09if (err)
> >> > +=09=09return err;
> >> > +
> >> > +=09/* Map hardware speed codes back to sysfs index:
> >> > +=09 * 0xe1 -> 0 (slow), 0xeb -> 1 (normal), 0xf5 -> 2 (fast)
> >> > +=09 */
> >> > +=09switch (data[5]) {
> >> > +=09case 0xe1:
> >> > +=09=09speed =3D 0;
> >> > +=09=09break;
> >> > +=09case 0xeb:
> >> > +=09=09speed =3D 1;
> >> > +=09=09break;
> >> > +=09case 0xf5:
> >
> >Name literals with defines. When it comes to offsets, consider if a=20
> >struct would be viable instead of byte array + named define index.
> >
> >> > +=09=09speed =3D 2;
> >> > +=09=09break;
> >> > +=09default:
> >> > +=09=09speed =3D 1;
> >> > +=09=09break;
> >> > +=09}
> >> > +
> >> > +=09return sysfs_emit(buf, "1 %d %d %d %d %d\n",
> >> > +=09=09=09  data[1], data[2], data[3], data[4], speed);
> >>=20
> >> We had this discussion in discord so I want to update everyone reading=
:
> >> the status returned is the current one and both cmd=3D0 and cmd=3D1 on=
 write
> >> update the current status.
> >>=20
> >> Therefore this is an asymmetry that doesn't really need to be,
> >> what if we introduce another sysfs that is RO? Ilpo?
> >
> >I'm not entirely sure what's the suggestion.
> >
>=20
> 1 sysfs attribute for read and don't touch the write one since they are i=
n two different formats.
>=20
> Like one returns 4 values and one accepts 5: they are asymmetric hence my=
 suggestion.

Hi again,

Does it have to return "1" or even a number? Could we just have return=20
something like "n/a" in that field (which would be ~ "not available")?

--
 i.
--8323328-1389911286-1792501724=:1177--
