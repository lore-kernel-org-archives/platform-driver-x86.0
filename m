Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12791465A2
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 13:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715607314; cv=none; b=gCl3XvntYjG1votrhuyNOviqDh6Wm27griz7PKGsDM/f57oxigfgHdA8CuvmkbjsdGoRV4Mst79Rv19dD9M/M3e2QnGA12jOla2T1vjPQtD/Ep4+ZNXM+3+wriJI198ywXCU/rsZy7/Ja9hBIYmojWB5SCljG0U9xzVGV1mwYJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715607314; c=relaxed/simple;
	bh=0D4VuGuAqkZgg69EyA040zwWG9wcIuLfR6hUczpTUKw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=a2bRYOpybFZeuXepalmgsONkPvXhtYhhS8nYKAxN21KuMCh/jgFipf4WB79OJLWg1hDfse8ydwNBUBbeq1kRcspv7DW+EerzU+yDb+vgSWbVEw7AIeoGH3jI7Y93O9Y7IA9hcaKd9gk3YxZ9LbMC8iqN4iKI3dA/dtjomiamSTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gr0nT9uf; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gr0nT9uf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715607313; x=1747143313;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=0D4VuGuAqkZgg69EyA040zwWG9wcIuLfR6hUczpTUKw=;
  b=Gr0nT9ufMs+usFL7U8i3yhkNvJOvRNcO83BYWU09RGjEZTekt4lp9ASS
   AzrC0xGvvsYhecWLoRejtY+tVJj614z/TovDXyLhnR9FKjHwayuoKRJEp
   cfJGw/8PjSYp5GDX1jYcZxb/GR9GS9swe1VEB+8YpPCxVhsLd4qzWZ5bk
   Ee0krOMUcLjVEz9vZ7RG2LPPAiR3lnBkjjhFTz+lMYTQbc69Zm7U/b7ps
   dNi1AAST67wNSDWKVwwXUNKv2DZYNaJICOmVcJWk1s644pliDh1HbBRSp
   dTE1oZTWxNehZUnFUbcTdcGy82pnRXGvivnfoK9Vt9jJB7CzTvQpK3Z/S
   Q==;
X-CSE-ConnectionGUID: cdoeZuWrTmWwPTJ1X8uSOQ==
X-CSE-MsgGUID: Ti+zEh0SQY+PCaRJbnAw0A==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11416621"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="11416621"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 06:34:41 -0700
X-CSE-ConnectionGUID: 8U97po36R3yRCdusv0eP9w==
X-CSE-MsgGUID: W9K3krikQoq3AAz9PSKKdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="30291926"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.89])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 06:34:39 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 13 May 2024 16:34:35 +0300 (EEST)
To: Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andy@kernel.org>, AceLan Kao <acelan.kao@canonical.com>, 
    Kai-Heng Feng <kai.heng.feng@canonical.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/2] platform/x86: Add new Dell UART backlight driver
In-Reply-To: <c9ec9611-615c-4a7d-9a72-89d6c7b4c680@redhat.com>
Message-ID: <7163ebe9-6cca-c21f-78b7-e6aeda2961b3@linux.intel.com>
References: <20240512162353.46693-1-hdegoede@redhat.com> <20240512162353.46693-2-hdegoede@redhat.com> <106aa14e-b621-84db-f5da-89bf29ed0999@linux.intel.com> <b1187314-35f2-4a10-80be-156f6f645a7e@redhat.com> <ab5c3c46-a438-0ad8-3d67-78261eb3a8d1@linux.intel.com>
 <7c535f53-5cca-4ac5-bcaa-f2f89d40f97d@redhat.com> <1c14872e-7b7d-b67f-9557-bd14fbe604d8@linux.intel.com> <c9ec9611-615c-4a7d-9a72-89d6c7b4c680@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-984417251-1715606923=:1286"
Content-ID: <11e5a4f0-782d-79ea-9064-d3fc2e951ba7@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-984417251-1715606923=:1286
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <4c015526-2ab6-d915-5fbc-7e64ca4dcbdb@linux.intel.com>

On Mon, 13 May 2024, Hans de Goede wrote:

> Hi,
>=20
> On 5/13/24 3:14 PM, Ilpo J=E4rvinen wrote:
> > On Mon, 13 May 2024, Hans de Goede wrote:
> >> On 5/13/24 2:12 PM, Ilpo J=E4rvinen wrote:
> >>> On Mon, 13 May 2024, Hans de Goede wrote:
> >>>> On 5/13/24 10:34 AM, Ilpo J=E4rvinen wrote:
> >>>>> On Sun, 12 May 2024, Hans de Goede wrote:
> >=20
> >>>>>> +
> >>>>>> +=09=09dell_bl->resp_idx++;
> >>>>>> +=09=09if (dell_bl->resp_idx < dell_bl->resp_len)
> >>>>>> +=09=09=09continue;
> >>>>>> +
> >>>>>> +=09=09csum =3D dell_uart_checksum(dell_bl->resp, dell_bl->resp_le=
n - 1);
> >>>>>> +=09=09if (dell_bl->resp[dell_bl->resp_len - 1] !=3D csum) {
> >>>>>> +=09=09=09dev_err(dell_bl->dev, "Checksum mismatch got 0x%02x expe=
cted 0x%02x\n",
> >>>>>> +=09=09=09=09dell_bl->resp[dell_bl->resp_len - 1], csum);
> >>>>>> +=09=09=09dell_bl->status =3D -EIO;
> >>>>>> +=09=09=09goto wakeup;
> >>>>>> +=09=09}
> >>>>>
> >>>>> Why is the checksum calculation and check inside the loop??
> >>>>
> >>>> The loop iterates over received bytes, which may contain extra data=
=20
> >>>> after the response, the:=20
> >>>>
> >>>> =09=09dell_bl->resp_idx++;
> >>>> =09=09if (dell_bl->resp_idx < dell_bl->resp_len)
> >>>> =09=09=09continue;
> >>>>
> >>>> continues looping until we have received all the expected bytes. So =
here, past this
> >>>> check, we are are at the point where we have a complete response and=
 then we verify it.
> >>>>
> >>>> And on successful verification wake-up any waiters.
> >>>
> >>> So effectively you want to terminate the loop on two conditions here:
> >>>
> >>> a) dell_bl->resp_idx =3D=3D dell_bl->resp_len (complete frame)
> >>> a) if i =3D=3D len (not yet received a full frame)
> >>>
> >>> Why not code those rather than the current goto & continue madness?
> >>>
> >>> Then, after the loop, you can test:
> >>>
> >>> =09if (dell_bl->resp_idx =3D=3D dell_bl->resp_len) {
> >>> =09=09// calc checksum, etc.
> >>> =09}
> >>>
> >>> ?
> >>
> >> Ok, I've added the following change for v3:
> >>
> >> diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers=
/platform/x86/dell/dell-uart-backlight.c
> >> index bf5b12efcb19..66d8c6ddcb83 100644
> >> --- a/drivers/platform/x86/dell/dell-uart-backlight.c
> >> +++ b/drivers/platform/x86/dell/dell-uart-backlight.c
> >> @@ -87,6 +87,7 @@ static int dell_uart_bl_command(struct dell_uart_bac=
klight *dell_bl,
> >>  =09dell_bl->status =3D -EBUSY;
> >>  =09dell_bl->resp =3D resp;
> >>  =09dell_bl->resp_idx =3D 0;
> >> +=09dell_bl->resp_len =3D -1; /* Invalid / unset */
> >>  =09dell_bl->resp_max_len =3D resp_max_len;
> >>  =09dell_bl->pending_cmd =3D cmd[1];
> >> =20
> >> @@ -219,7 +219,7 @@ static size_t dell_uart_bl_receive(struct serdev_d=
evice *serdev, const u8 *data,
> >>  =09=09return len;
> >>  =09}
> >> =20
> >> -=09for (i =3D 0; i < len; i++) {
> >> +=09for (i =3D 0; i < len && dell_bl->resp_idx !=3D dell_bl->resp_len;=
 i++, dell_bl->resp_idx++) {
> >>  =09=09dell_bl->resp[dell_bl->resp_idx] =3D data[i];
> >> =20
> >>  =09=09switch (dell_bl->resp_idx) {
> >> @@ -228,46 +228,41 @@ static size_t dell_uart_bl_receive(struct serdev=
_device *serdev, const u8 *data,
> >>  =09=09=09if (dell_bl->resp_len < MIN_RESP_LEN) {
> >>  =09=09=09=09dev_err(dell_bl->dev, "Response length too small %d < %d\=
n",
> >>  =09=09=09=09=09dell_bl->resp_len, MIN_RESP_LEN);
> >> -=09=09=09=09dell_bl->status =3D -EIO;
> >> -=09=09=09=09goto wakeup;
> >> +=09=09=09=09goto error;
> >>  =09=09=09}
> >> =20
> >>  =09=09=09if (dell_bl->resp_len > dell_bl->resp_max_len) {
> >>  =09=09=09=09dev_err(dell_bl->dev, "Response length too big %d > %d\n"=
,
> >>  =09=09=09=09=09dell_bl->resp_len, dell_bl->resp_max_len);
> >> -=09=09=09=09dell_bl->status =3D -EIO;
> >> -=09=09=09=09goto wakeup;
> >> +=09=09=09=09goto error;
> >>  =09=09=09}
> >>  =09=09=09break;
> >>  =09=09case RESP_CMD: /* CMD byte */
> >>  =09=09=09if (dell_bl->resp[RESP_CMD] !=3D dell_bl->pending_cmd) {
> >>  =09=09=09=09dev_err(dell_bl->dev, "Response cmd 0x%02x !=3D pending 0=
x%02x\n",
> >>  =09=09=09=09=09dell_bl->resp[RESP_CMD], dell_bl->pending_cmd);
> >> -=09=09=09=09dell_bl->status =3D -EIO;
> >> -=09=09=09=09goto wakeup;
> >> +=09=09=09=09goto error;
> >>  =09=09=09}
> >>  =09=09=09break;
> >>  =09=09}
> >> +=09}
> >> =20
> >> -=09=09dell_bl->resp_idx++;
> >> -=09=09if (dell_bl->resp_idx < dell_bl->resp_len)
> >> -=09=09=09continue;
> >> -
> >> +=09if (dell_bl->resp_idx =3D=3D dell_bl->resp_len) {
> >>  =09=09csum =3D dell_uart_checksum(dell_bl->resp, dell_bl->resp_len - =
1);
> >>  =09=09if (dell_bl->resp[dell_bl->resp_len - 1] !=3D csum) {
> >>  =09=09=09dev_err(dell_bl->dev, "Checksum mismatch got 0x%02x expected=
 0x%02x\n",
> >>  =09=09=09=09dell_bl->resp[dell_bl->resp_len - 1], csum);
> >> -=09=09=09dell_bl->status =3D -EIO;
> >> -=09=09=09goto wakeup;
> >> +=09=09=09goto error;
> >>  =09=09}
> >> -
> >>  =09=09dell_bl->status =3D 0; /* Success */
> >> -=09=09goto wakeup;
> >> +=09=09wake_up(&dell_bl->wait_queue);
> >> +=09=09return i;
> >>  =09}
> >> =20
> >>  =09return len;
> >> =20
> >> -wakeup:
> >> +error:
> >> +=09dell_bl->status =3D -EIO;
> >>  =09wake_up(&dell_bl->wait_queue);
> >>  =09return i + 1;
> >>  }
> >=20
> > Thanks, this is way easier to follow.
>=20
> I'm glad you like it.
>=20
> There is a little bug in this version though, the goto error on the check=
sum fail
> case returns i + i, which should be i in that case, I'll just drop the go=
to there and
> instead always use the return i already present at the end of the
> "if (dell_bl->resp_idx =3D=3D dell_bl->resp_len) { }" block.

It could have been solved more logically incrementing i and resp_idx here:

=09=09dell_bl->resp[dell_bl->resp_idx] =3D data[i];
=09=09dell_bl->resp_idx++;
=09=09i++;

so that the inconsistent state is eliminated.

I also realized (I know I was the one who suggested it) that reverse logic=
=20
would be better for the incomplete frame check:

=09if (dell_bl->resp_idx < dell_bl->resp_len)
=09=09return len;

=09// checksum logic...

Perhaps the success and error return paths could then be merged too.

--=20
 i.
--8323328-984417251-1715606923=:1286--
