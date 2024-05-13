Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580B914AD02
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 12:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715602375; cv=none; b=K4HCEqpLvkeWncDB/Ihw8kW2LedI5k9xFZ77S3sdtlD+eE/QP9ObsPmo70Jbq/464OfDKhCbYxY2VmxCiMdKqaiOdVvtRsu0F+fa5Se2nt9JjYpHocM4E1aXcPM1W/RsBhIIWAsoBl1/dX/ZW4TZl8AlHzlLNAPHKPPEnw1zzWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715602375; c=relaxed/simple;
	bh=E7zOnvBHuWysYT7/2zcNvcN2Yyc3pX5o7ZM8rgjtkqc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XTwOu2SX5/vp68ja/lO3GdOWvYOQpdhhJZUPvR/YWtiPu601JC+vAqkyulFRNWH2ado3lVQKbZebOWoCWqLU7GgaKFpBiLFg8r7tvyROLha+xZudYCsSumejDJvCoynnCmXavdgKORgZJWoKCgZBc6oBFHA1jemxBe0upWweuiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N3Cb4qg0; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N3Cb4qg0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715602374; x=1747138374;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=E7zOnvBHuWysYT7/2zcNvcN2Yyc3pX5o7ZM8rgjtkqc=;
  b=N3Cb4qg0rV89/kQLIIEK6krfebGv/bNTj4oWjbh9oveECyAG45DQ2jbU
   obZrA2csudAdymjQygOZcj2js6XjbkBxrPHBzacnJ98v9b8Sdkj6bj8rx
   w9gAEm9ouUh6CIjCq9AXjRiCJwrKJTHNa/lpA3UAfB/KA3QDlSeVvU8cu
   UERBMdsXQjj1W28ztB+29WHtLIaYI3I0gN+JHI+WzVE1w9bBz5hcKnAH/
   qAHrWnnFSZRso0aJY6EhpZPxzuovFptQ6Y7055e+4DXtXRahp5/sGEgZ3
   ppBe5dz9Mi/H4RdIOob04wsx9rn5xTjO13MumNNIUXSzWLW/yFxRimPGl
   A==;
X-CSE-ConnectionGUID: nHnF7pQFQWaQINDi9AWPGA==
X-CSE-MsgGUID: abtIzztWSmKTHgtvhl7G5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11665019"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="11665019"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 05:12:53 -0700
X-CSE-ConnectionGUID: F22MWjfwSgW5Nqshr2bOYg==
X-CSE-MsgGUID: tevznyV3QTyHH0QIBQQ/BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="53530117"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.89])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 05:12:50 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 13 May 2024 15:12:45 +0300 (EEST)
To: Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andy@kernel.org>, AceLan Kao <acelan.kao@canonical.com>, 
    Kai-Heng Feng <kai.heng.feng@canonical.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/2] platform/x86: Add new Dell UART backlight driver
In-Reply-To: <b1187314-35f2-4a10-80be-156f6f645a7e@redhat.com>
Message-ID: <ab5c3c46-a438-0ad8-3d67-78261eb3a8d1@linux.intel.com>
References: <20240512162353.46693-1-hdegoede@redhat.com> <20240512162353.46693-2-hdegoede@redhat.com> <106aa14e-b621-84db-f5da-89bf29ed0999@linux.intel.com> <b1187314-35f2-4a10-80be-156f6f645a7e@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1387726641-1715601963=:1286"
Content-ID: <d71dbe91-085d-92b4-b9ce-fa5d06043643@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1387726641-1715601963=:1286
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <6bae6989-6111-5a2f-b58b-de28ce4d2aa5@linux.intel.com>

On Mon, 13 May 2024, Hans de Goede wrote:

> Hi Ilpo,
>=20
> Thank you for the review.
>=20
> On 5/13/24 10:34 AM, Ilpo J=E4rvinen wrote:
> > On Sun, 12 May 2024, Hans de Goede wrote:

> >> +=09u8 resp[3];
> >> +
> >> +=09set_brightness[2] =3D brightness;
> >> +=09set_brightness[3] =3D dell_uart_checksum(set_brightness, 3);
> >=20
> > Also, couldn't these be accessed through a struct to eliminate most of =
the=20
> > magic indexes?
>=20
> With the checksum at the end, this would require a VLA in the middle
> of the struct (get_version return buffer contains more then 1 dat byte)
> We could treat the checksum as an extra data byte, but then we are
> mixing struct usage for some fields + using an array of bytes
> approach for the data + checksum. For consistency I prefer to just
> stick with one approach which means using the array of bytes approach
> for everything.

Ok.

> >> +=09const u8 get_brightness[] =3D { 0x6A, 0x0C, 0x89 };
> >> +=09u8 resp[4];
> >> +=09int ret;
> >> +
> >> +=09ret =3D dell_uart_bl_command(dell_bl, get_brightness, ARRAY_SIZE(g=
et_brightness),
> >> +=09=09=09=09   resp, ARRAY_SIZE(resp));
> >> +=09if (ret)
> >> +=09=09return ret;
> >> +
> >> +=09if (resp[0] !=3D 4) {
> >=20
> > sizeof(resp)
>=20
> Ack.
>=20
> > but isn't this already checked when reading it??
>=20
> No dell_uart_bl_receive() checks that the response will fit in the suppli=
ed
> buffer and that it has a valid checksum but the controller may send a
> response smaller then the passed in buffer and it will actually do this f=
or
> the get_version command.

Ah, I see now that it checked against constant rather than the actual=20
value.

> >> +=09=09dev_warn(dell_bl->dev, "Bytes received out of band, dropping th=
em.\n");
> >> +=09=09return len;
> >> +=09}
> >> +
> >> +=09for (i =3D 0; i < len; i++) {
> >> +=09=09dell_bl->resp[dell_bl->resp_idx] =3D data[i];
> >> +
> >> +=09=09switch (dell_bl->resp_idx) {
> >> +=09=09case 0: /* Length byte */
> >> +=09=09=09dell_bl->resp_len =3D dell_bl->resp[0];
> >> +=09=09=09if (dell_bl->resp_len < DELL_BL_MIN_RESP_SIZE) {
> >> +=09=09=09=09dev_err(dell_bl->dev, "Response length too small %d < %d\=
n",
> >> +=09=09=09=09=09dell_bl->resp_len, DELL_BL_MIN_RESP_SIZE);
> >> +=09=09=09=09dell_bl->status =3D -EIO;
> >> +=09=09=09=09goto wakeup;
> >> +=09=09=09} else if (dell_bl->resp_len > dell_bl->resp_max_len) {
> >> +=09=09=09=09dev_err(dell_bl->dev, "Response length too big %d > %d\n"=
,
> >> +=09=09=09=09=09dell_bl->resp_len, dell_bl->resp_max_len);
> >> +=09=09=09=09dell_bl->status =3D -EIO;
> >> +=09=09=09=09goto wakeup;
> >> +=09=09=09}
> >> +=09=09=09break;
> >> +=09=09case 1: /* CMD byte */
> >> +=09=09=09if (dell_bl->resp[1] !=3D dell_bl->pending_cmd) {
> >> +=09=09=09=09dev_err(dell_bl->dev, "Response cmd 0x%02x !=3D pending 0=
x%02x\n",
> >> +=09=09=09=09=09dell_bl->resp[1], dell_bl->pending_cmd);
> >> +=09=09=09=09dell_bl->status =3D -EIO;
> >> +=09=09=09=09goto wakeup;
> >> +=09=09=09}
> >> +=09=09=09break;
> >> +=09=09}
> >> +
> >> +=09=09dell_bl->resp_idx++;
> >> +=09=09if (dell_bl->resp_idx < dell_bl->resp_len)
> >> +=09=09=09continue;
> >> +
> >> +=09=09csum =3D dell_uart_checksum(dell_bl->resp, dell_bl->resp_len - =
1);
> >> +=09=09if (dell_bl->resp[dell_bl->resp_len - 1] !=3D csum) {
> >> +=09=09=09dev_err(dell_bl->dev, "Checksum mismatch got 0x%02x expected=
 0x%02x\n",
> >> +=09=09=09=09dell_bl->resp[dell_bl->resp_len - 1], csum);
> >> +=09=09=09dell_bl->status =3D -EIO;
> >> +=09=09=09goto wakeup;
> >> +=09=09}
> >=20
> > Why is the checksum calculation and check inside the loop??
>=20
> The loop iterates over received bytes, which may contain extra data=20
> after the response, the:=20
>=20
> =09=09dell_bl->resp_idx++;
> =09=09if (dell_bl->resp_idx < dell_bl->resp_len)
> =09=09=09continue;
>=20
> continues looping until we have received all the expected bytes. So here,=
 past this
> check, we are are at the point where we have a complete response and then=
 we verify it.
>=20
> And on successful verification wake-up any waiters.

So effectively you want to terminate the loop on two conditions here:

a) dell_bl->resp_idx =3D=3D dell_bl->resp_len (complete frame)
a) if i =3D=3D len (not yet received a full frame)

Why not code those rather than the current goto & continue madness?

Then, after the loop, you can test:

=09if (dell_bl->resp_idx =3D=3D dell_bl->resp_len) {
=09=09// calc checksum, etc.
=09}

?

> >> +=09=09dell_bl->status =3D 1; /* Success */
> >> +=09=09goto wakeup;
> >=20
> > Huh? Now I'm totally lost how the control flow is supposed to go in thi=
s=20
> > function. Can you rethink this loop so it actual makes sense and doesn'=
t=20
> > misuse gotos like this?
>=20
> This is the receive() callback from the UART the loop consumes bytes rece=
ived
> by the UART. The gotos stop consuming bytes in 2 cases:
>=20
> 1. An error (unexpected data) is encountered.
> 2. A complete frame has been successfully received.
>=20
> The checking of the checksum + goto wakeup at the end of the loop is for =
2.
>=20
> The:
>=20
> =09return len;
>=20
> after the loop indicates to the UART / tty-layer that all passed data
> has been consumed and this path gets hit when the driver needs to wait
> for more data because the response is not complete yet.
>=20
> >> +
> >> +wakeup:
> >> +=09wake_up(&dell_bl->wait_queue);
> >> +=09return i + 1;
> >> +}


--=20
 i.
--8323328-1387726641-1715601963=:1286--
