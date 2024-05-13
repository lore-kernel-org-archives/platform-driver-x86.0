Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF4314F10C
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 12:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715602465; cv=none; b=no4AMmfjipMlIip9246Bb+ZPe5m4AHHdDdATqPsO5xPINKZW8tekEzqsNaQiFlsopC4Egb0mDPnCLGRk8g1a959CUMMdEycKBhRaALjG59sjzAi/WGaF29+VIvN2NY2Lj2Ps0DZvuIsA81nLrfEL6RQhpM2hryZ6OVTrwAQRJAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715602465; c=relaxed/simple;
	bh=Sf+o70YbEU7xK8JKwsT35ZZtQZ6LksjhFrmlvhCj/A0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fzMft9TE6WXIqCpKufANck5gdli2YEfP22kzMh68izFgkqGXtep1CEzPIOcimOb4RTjT8rwRLDe6d2bKgEXsOwBYOPGmCSE8o4YBjaBnmrz1Ogons9uYAQSWY7cElIHzyxCA/eAcmRpllGstOGvZIirKnRnayMCnzY6ks/xFh58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YWALWgyG; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YWALWgyG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715602464; x=1747138464;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Sf+o70YbEU7xK8JKwsT35ZZtQZ6LksjhFrmlvhCj/A0=;
  b=YWALWgyGFMJarqSOoLwCH58AfMotS2T5uNQD7xa2ldGxMYjKibQeqbB1
   gjjJXpGsSwLDicP7tgzG+Nd7dNwmhDwebxgrWSYsVurmzggCVQR7+NNrF
   0zJmI7MRwYfM5hwZq3/cn6+sT6jGN45dtb5saaXHNfLAyiaDkbHj9Kgm9
   jH4fA6yLNrOoVa14TlMKm59MO8T3myNk6H5HfSi+CNbP4MRey1/Gyiy5l
   mJFkCVvgr4Vn0QlB2jarOZFh0TTAxFzrkSMcr1Ql6qd1/Guj70nAR5uZU
   nbUViZ3FKOJhC2zrj2FvimMcp2xeZd6umDCBz1ZAx9RrXG1cknOgrGecg
   A==;
X-CSE-ConnectionGUID: 163qu5BKQWes01zHM0Chxg==
X-CSE-MsgGUID: do3DrVyeSvqjiojWFCmHvQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22680982"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="22680982"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 05:14:23 -0700
X-CSE-ConnectionGUID: 0qKSb7bzQ82Hs7xsiLVRQA==
X-CSE-MsgGUID: ZqTDf0MNTQ2zNNJ/P8xYNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="30433017"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.89])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 05:14:22 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 13 May 2024 15:14:17 +0300 (EEST)
To: Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andy@kernel.org>, AceLan Kao <acelan.kao@canonical.com>, 
    Kai-Heng Feng <kai.heng.feng@canonical.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/2] platform/x86: Add new Dell UART backlight driver
In-Reply-To: <ab5c3c46-a438-0ad8-3d67-78261eb3a8d1@linux.intel.com>
Message-ID: <93730193-0b22-f0a9-4783-8ad7c4d5f166@linux.intel.com>
References: <20240512162353.46693-1-hdegoede@redhat.com> <20240512162353.46693-2-hdegoede@redhat.com> <106aa14e-b621-84db-f5da-89bf29ed0999@linux.intel.com> <b1187314-35f2-4a10-80be-156f6f645a7e@redhat.com>
 <ab5c3c46-a438-0ad8-3d67-78261eb3a8d1@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1205560120-1715602457=:1286"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1205560120-1715602457=:1286
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 13 May 2024, Ilpo J=E4rvinen wrote:

> On Mon, 13 May 2024, Hans de Goede wrote:
>=20
> > Hi Ilpo,
> >=20
> > Thank you for the review.
> >=20
> > On 5/13/24 10:34 AM, Ilpo J=E4rvinen wrote:
> > > On Sun, 12 May 2024, Hans de Goede wrote:
>=20
> > >> +=09u8 resp[3];
> > >> +
> > >> +=09set_brightness[2] =3D brightness;
> > >> +=09set_brightness[3] =3D dell_uart_checksum(set_brightness, 3);
> > >=20
> > > Also, couldn't these be accessed through a struct to eliminate most o=
f the=20
> > > magic indexes?
> >=20
> > With the checksum at the end, this would require a VLA in the middle
> > of the struct (get_version return buffer contains more then 1 dat byte)
> > We could treat the checksum as an extra data byte, but then we are
> > mixing struct usage for some fields + using an array of bytes
> > approach for the data + checksum. For consistency I prefer to just
> > stick with one approach which means using the array of bytes approach
> > for everything.
>=20
> Ok.
>=20
> > >> +=09const u8 get_brightness[] =3D { 0x6A, 0x0C, 0x89 };
> > >> +=09u8 resp[4];
> > >> +=09int ret;
> > >> +
> > >> +=09ret =3D dell_uart_bl_command(dell_bl, get_brightness, ARRAY_SIZE=
(get_brightness),
> > >> +=09=09=09=09   resp, ARRAY_SIZE(resp));
> > >> +=09if (ret)
> > >> +=09=09return ret;
> > >> +
> > >> +=09if (resp[0] !=3D 4) {
> > >=20
> > > sizeof(resp)
> >=20
> > Ack.
> >=20
> > > but isn't this already checked when reading it??
> >=20
> > No dell_uart_bl_receive() checks that the response will fit in the supp=
lied
> > buffer and that it has a valid checksum but the controller may send a
> > response smaller then the passed in buffer and it will actually do this=
 for
> > the get_version command.
>=20
> Ah, I see now that it checked against constant rather than the actual=20
> value.
>=20
> > >> +=09=09dev_warn(dell_bl->dev, "Bytes received out of band, dropping =
them.\n");
> > >> +=09=09return len;
> > >> +=09}
> > >> +
> > >> +=09for (i =3D 0; i < len; i++) {
> > >> +=09=09dell_bl->resp[dell_bl->resp_idx] =3D data[i];
> > >> +
> > >> +=09=09switch (dell_bl->resp_idx) {
> > >> +=09=09case 0: /* Length byte */
> > >> +=09=09=09dell_bl->resp_len =3D dell_bl->resp[0];
> > >> +=09=09=09if (dell_bl->resp_len < DELL_BL_MIN_RESP_SIZE) {
> > >> +=09=09=09=09dev_err(dell_bl->dev, "Response length too small %d < %=
d\n",
> > >> +=09=09=09=09=09dell_bl->resp_len, DELL_BL_MIN_RESP_SIZE);
> > >> +=09=09=09=09dell_bl->status =3D -EIO;
> > >> +=09=09=09=09goto wakeup;
> > >> +=09=09=09} else if (dell_bl->resp_len > dell_bl->resp_max_len) {
> > >> +=09=09=09=09dev_err(dell_bl->dev, "Response length too big %d > %d\=
n",
> > >> +=09=09=09=09=09dell_bl->resp_len, dell_bl->resp_max_len);
> > >> +=09=09=09=09dell_bl->status =3D -EIO;
> > >> +=09=09=09=09goto wakeup;
> > >> +=09=09=09}
> > >> +=09=09=09break;
> > >> +=09=09case 1: /* CMD byte */
> > >> +=09=09=09if (dell_bl->resp[1] !=3D dell_bl->pending_cmd) {
> > >> +=09=09=09=09dev_err(dell_bl->dev, "Response cmd 0x%02x !=3D pending=
 0x%02x\n",
> > >> +=09=09=09=09=09dell_bl->resp[1], dell_bl->pending_cmd);
> > >> +=09=09=09=09dell_bl->status =3D -EIO;
> > >> +=09=09=09=09goto wakeup;
> > >> +=09=09=09}
> > >> +=09=09=09break;
> > >> +=09=09}
> > >> +
> > >> +=09=09dell_bl->resp_idx++;
> > >> +=09=09if (dell_bl->resp_idx < dell_bl->resp_len)
> > >> +=09=09=09continue;
> > >> +
> > >> +=09=09csum =3D dell_uart_checksum(dell_bl->resp, dell_bl->resp_len =
- 1);
> > >> +=09=09if (dell_bl->resp[dell_bl->resp_len - 1] !=3D csum) {
> > >> +=09=09=09dev_err(dell_bl->dev, "Checksum mismatch got 0x%02x expect=
ed 0x%02x\n",
> > >> +=09=09=09=09dell_bl->resp[dell_bl->resp_len - 1], csum);
> > >> +=09=09=09dell_bl->status =3D -EIO;
> > >> +=09=09=09goto wakeup;
> > >> +=09=09}
> > >=20
> > > Why is the checksum calculation and check inside the loop??
> >=20
> > The loop iterates over received bytes, which may contain extra data=20
> > after the response, the:=20
> >=20
> > =09=09dell_bl->resp_idx++;
> > =09=09if (dell_bl->resp_idx < dell_bl->resp_len)
> > =09=09=09continue;
> >=20
> > continues looping until we have received all the expected bytes. So her=
e, past this
> > check, we are are at the point where we have a complete response and th=
en we verify it.
> >=20
> > And on successful verification wake-up any waiters.
>=20
> So effectively you want to terminate the loop on two conditions here:
>=20
> a) dell_bl->resp_idx =3D=3D dell_bl->resp_len (complete frame)
> a) if i =3D=3D len (not yet received a full frame)
>=20
> Why not code those rather than the current goto & continue madness?
>=20
> Then, after the loop, you can test:
>=20
> =09if (dell_bl->resp_idx =3D=3D dell_bl->resp_len) {
> =09=09// calc checksum, etc.
> =09}
>=20
> ?

+ the len has been received check:

=09if (dell_bl->resp_idx && dell_bl->resp_idx =3D=3D dell_bl->resp_len) {
=09=09...
=09}

--=20
 i.

--8323328-1205560120-1715602457=:1286--
