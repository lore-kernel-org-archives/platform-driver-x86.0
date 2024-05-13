Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D70150980
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 13:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715606296; cv=none; b=csU2CLSob2GBizrvNY3DAGe+gUPQ5bRYrHLT4kSZjU7fSMxrwMw9Mnx+epwM5swoZ1Tgpy5L5jWS30lZK4sz9fdqzY3ZIOZel7j1VVXFvg2DBYiS1i6WFzN6ywTnHxdsqrf+ujQWgELAYcWWb4iQTMwLAfp4UF6EWKojoR0FSaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715606296; c=relaxed/simple;
	bh=LIKMtrjVIwsLzJt8Z+fCf2950sEkCs0coNDS09hv1CI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ud6rZQklD6vPFh+3ZxyhjsoK0wKqHXkxLePYETTOTj/NnIBQZpEYqAssn3iz4qngLd8f3L9msiQebttEk0rGcEnO7dZMuNp46cKIrlMmsqit5uW3k1haH/2wSe1B6ZlQxn7uTbjuynqIBAGpUdd8iQI0BRQdVQMrLkt8TkGffH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K00GLo7K; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K00GLo7K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715606295; x=1747142295;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=LIKMtrjVIwsLzJt8Z+fCf2950sEkCs0coNDS09hv1CI=;
  b=K00GLo7KrXwh1+yrNYw+g0S2y8gwIPF7j8i1kKa1jR5j3aqQUMQLBdpi
   yBX0d8/x7fzRrR2A4Co59fEs0Eh4TiW/B/0nYdowBlrFprSq3uIQDA4WI
   hl87aWESRsNu31xzoNWCHtpMVKhZDbDiZ3JTV91nr/WLBAQBtAGnm38QS
   FZHvtDFzac+ccmuB7Q5DxKZVNe37XIZjmj5Jbpe6d/E/IvANL2nhK52Hz
   1rR3+HwLIqplRaGb8xVu9+ex7JOkoXJXN12Me7GHbuR8Nji30/9q5Ru3Q
   ma8ZwAP/YxbKTKCkv0tTjfiPJeRpXrBZl3hrJCTuHueB/etT2nB4HnL0t
   g==;
X-CSE-ConnectionGUID: G2VeSzWETZuQ5c6B4/8OTQ==
X-CSE-MsgGUID: EHXfb93wTgu6AAC5hNOY2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11481037"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="11481037"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 06:14:57 -0700
X-CSE-ConnectionGUID: isGnHqLZSOmYR6Uu5u/s1g==
X-CSE-MsgGUID: 0840lbymRmGc3GP+8cltIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="30744041"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.89])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 06:14:55 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 13 May 2024 16:14:50 +0300 (EEST)
To: Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andy@kernel.org>, AceLan Kao <acelan.kao@canonical.com>, 
    Kai-Heng Feng <kai.heng.feng@canonical.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/2] platform/x86: Add new Dell UART backlight driver
In-Reply-To: <7c535f53-5cca-4ac5-bcaa-f2f89d40f97d@redhat.com>
Message-ID: <1c14872e-7b7d-b67f-9557-bd14fbe604d8@linux.intel.com>
References: <20240512162353.46693-1-hdegoede@redhat.com> <20240512162353.46693-2-hdegoede@redhat.com> <106aa14e-b621-84db-f5da-89bf29ed0999@linux.intel.com> <b1187314-35f2-4a10-80be-156f6f645a7e@redhat.com> <ab5c3c46-a438-0ad8-3d67-78261eb3a8d1@linux.intel.com>
 <7c535f53-5cca-4ac5-bcaa-f2f89d40f97d@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1072740572-1715606090=:1286"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1072740572-1715606090=:1286
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 13 May 2024, Hans de Goede wrote:
> On 5/13/24 2:12 PM, Ilpo J=C3=A4rvinen wrote:
> > On Mon, 13 May 2024, Hans de Goede wrote:
> >> On 5/13/24 10:34 AM, Ilpo J=C3=A4rvinen wrote:
> >>> On Sun, 12 May 2024, Hans de Goede wrote:

> >>>> +
> >>>> +=09=09dell_bl->resp_idx++;
> >>>> +=09=09if (dell_bl->resp_idx < dell_bl->resp_len)
> >>>> +=09=09=09continue;
> >>>> +
> >>>> +=09=09csum =3D dell_uart_checksum(dell_bl->resp, dell_bl->resp_len =
- 1);
> >>>> +=09=09if (dell_bl->resp[dell_bl->resp_len - 1] !=3D csum) {
> >>>> +=09=09=09dev_err(dell_bl->dev, "Checksum mismatch got 0x%02x expect=
ed 0x%02x\n",
> >>>> +=09=09=09=09dell_bl->resp[dell_bl->resp_len - 1], csum);
> >>>> +=09=09=09dell_bl->status =3D -EIO;
> >>>> +=09=09=09goto wakeup;
> >>>> +=09=09}
> >>>
> >>> Why is the checksum calculation and check inside the loop??
> >>
> >> The loop iterates over received bytes, which may contain extra data=20
> >> after the response, the:=20
> >>
> >> =09=09dell_bl->resp_idx++;
> >> =09=09if (dell_bl->resp_idx < dell_bl->resp_len)
> >> =09=09=09continue;
> >>
> >> continues looping until we have received all the expected bytes. So he=
re, past this
> >> check, we are are at the point where we have a complete response and t=
hen we verify it.
> >>
> >> And on successful verification wake-up any waiters.
> >=20
> > So effectively you want to terminate the loop on two conditions here:
> >=20
> > a) dell_bl->resp_idx =3D=3D dell_bl->resp_len (complete frame)
> > a) if i =3D=3D len (not yet received a full frame)
> >=20
> > Why not code those rather than the current goto & continue madness?
> >=20
> > Then, after the loop, you can test:
> >=20
> > =09if (dell_bl->resp_idx =3D=3D dell_bl->resp_len) {
> > =09=09// calc checksum, etc.
> > =09}
> >=20
> > ?
>=20
> Ok, I've added the following change for v3:
>=20
> diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/pl=
atform/x86/dell/dell-uart-backlight.c
> index bf5b12efcb19..66d8c6ddcb83 100644
> --- a/drivers/platform/x86/dell/dell-uart-backlight.c
> +++ b/drivers/platform/x86/dell/dell-uart-backlight.c
> @@ -87,6 +87,7 @@ static int dell_uart_bl_command(struct dell_uart_backli=
ght *dell_bl,
>  =09dell_bl->status =3D -EBUSY;
>  =09dell_bl->resp =3D resp;
>  =09dell_bl->resp_idx =3D 0;
> +=09dell_bl->resp_len =3D -1; /* Invalid / unset */
>  =09dell_bl->resp_max_len =3D resp_max_len;
>  =09dell_bl->pending_cmd =3D cmd[1];
> =20
> @@ -219,7 +219,7 @@ static size_t dell_uart_bl_receive(struct serdev_devi=
ce *serdev, const u8 *data,
>  =09=09return len;
>  =09}
> =20
> -=09for (i =3D 0; i < len; i++) {
> +=09for (i =3D 0; i < len && dell_bl->resp_idx !=3D dell_bl->resp_len; i+=
+, dell_bl->resp_idx++) {
>  =09=09dell_bl->resp[dell_bl->resp_idx] =3D data[i];
> =20
>  =09=09switch (dell_bl->resp_idx) {
> @@ -228,46 +228,41 @@ static size_t dell_uart_bl_receive(struct serdev_de=
vice *serdev, const u8 *data,
>  =09=09=09if (dell_bl->resp_len < MIN_RESP_LEN) {
>  =09=09=09=09dev_err(dell_bl->dev, "Response length too small %d < %d\n",
>  =09=09=09=09=09dell_bl->resp_len, MIN_RESP_LEN);
> -=09=09=09=09dell_bl->status =3D -EIO;
> -=09=09=09=09goto wakeup;
> +=09=09=09=09goto error;
>  =09=09=09}
> =20
>  =09=09=09if (dell_bl->resp_len > dell_bl->resp_max_len) {
>  =09=09=09=09dev_err(dell_bl->dev, "Response length too big %d > %d\n",
>  =09=09=09=09=09dell_bl->resp_len, dell_bl->resp_max_len);
> -=09=09=09=09dell_bl->status =3D -EIO;
> -=09=09=09=09goto wakeup;
> +=09=09=09=09goto error;
>  =09=09=09}
>  =09=09=09break;
>  =09=09case RESP_CMD: /* CMD byte */
>  =09=09=09if (dell_bl->resp[RESP_CMD] !=3D dell_bl->pending_cmd) {
>  =09=09=09=09dev_err(dell_bl->dev, "Response cmd 0x%02x !=3D pending 0x%0=
2x\n",
>  =09=09=09=09=09dell_bl->resp[RESP_CMD], dell_bl->pending_cmd);
> -=09=09=09=09dell_bl->status =3D -EIO;
> -=09=09=09=09goto wakeup;
> +=09=09=09=09goto error;
>  =09=09=09}
>  =09=09=09break;
>  =09=09}
> +=09}
> =20
> -=09=09dell_bl->resp_idx++;
> -=09=09if (dell_bl->resp_idx < dell_bl->resp_len)
> -=09=09=09continue;
> -
> +=09if (dell_bl->resp_idx =3D=3D dell_bl->resp_len) {
>  =09=09csum =3D dell_uart_checksum(dell_bl->resp, dell_bl->resp_len - 1);
>  =09=09if (dell_bl->resp[dell_bl->resp_len - 1] !=3D csum) {
>  =09=09=09dev_err(dell_bl->dev, "Checksum mismatch got 0x%02x expected 0x=
%02x\n",
>  =09=09=09=09dell_bl->resp[dell_bl->resp_len - 1], csum);
> -=09=09=09dell_bl->status =3D -EIO;
> -=09=09=09goto wakeup;
> +=09=09=09goto error;
>  =09=09}
> -
>  =09=09dell_bl->status =3D 0; /* Success */
> -=09=09goto wakeup;
> +=09=09wake_up(&dell_bl->wait_queue);
> +=09=09return i;
>  =09}
> =20
>  =09return len;
> =20
> -wakeup:
> +error:
> +=09dell_bl->status =3D -EIO;
>  =09wake_up(&dell_bl->wait_queue);
>  =09return i + 1;
>  }

Thanks, this is way easier to follow.

--=20
 i.

--8323328-1072740572-1715606090=:1286--
