Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DBF17F0
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 14:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715610997; cv=none; b=bfFji1Yw6TYwJQ7u3kRW6FLWrR1WT0bAqsHUt49HSiqnOCwvrWlqv6Pu7NUYv2AbbzEb9j02XexKjnSHZ/BawVEkW3BqqegCvtvI2dMrr4FoBCL+xjb8+dlgi9AC9FoU3MvSkjW2wo/sPFrTXIAz7eccic11V4SCPqup9xI5kew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715610997; c=relaxed/simple;
	bh=WhQfEc70Xka0V0ZpNIctuAy3ZfUqN8hcr0Q9E/KJNig=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=a+FCyvh8H6u009UfIyswTOwZ9VwMz7Taj5sDKGbspQTUpBGuCfgkN5KKfg2B1reDKWAusf3AtxjzGh5UNAnVJ0eiQJ/qc+M14ME7OnlmkiKXHFHDqdLwFtIanqoH8QjinvlSKqQjisWJPq8gZc7fgooMKLWvzvsDlwhfbATv5Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c7TR7suD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c7TR7suD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715610996; x=1747146996;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=WhQfEc70Xka0V0ZpNIctuAy3ZfUqN8hcr0Q9E/KJNig=;
  b=c7TR7suD1frGw+tUdB5vq18fxLE0PMJBJRvvSlrGQFSMF14hP0m/lfmf
   QxSBf22xfLexwaTsKseR4A8Ym85LV9wAfhR6pS7ET/1Ul7rKgdWEwyzoa
   x/MOZHD0llqb71BksTeQZGL7wKic8pdUHlWih6Ur9vLPoBZBL0NMBmGTe
   fAC0Xo9ynxXh10DP+UzAH9/lJpMs71I0jAOyx2RZ3W3DeqxTr8Ig0tYlp
   eMgXS/EvTcqcHVIgbJLw/6kXeX9fLKvW4J8xv+e2RfNbbZGGgQf6gQhWc
   d0qjIFor+ULoQx0aUVAstE8ylLvPRWuonKRYcCEojbrEvPLcwW8ApJ9c+
   Q==;
X-CSE-ConnectionGUID: Q0IBPMMvROqNHE2C/ZxxvQ==
X-CSE-MsgGUID: KyEzUjKGQIqaEcfl+0DNwQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="36924779"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="36924779"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 07:36:35 -0700
X-CSE-ConnectionGUID: Ol8AofvzQ96C46ocwlc7Ig==
X-CSE-MsgGUID: s4IQ2jN5QUOPSomPCvqLHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="35042753"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.89])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 07:36:32 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 13 May 2024 17:36:27 +0300 (EEST)
To: Hans de Goede <hdegoede@redhat.com>
cc: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
    Andy Shevchenko <andy@kernel.org>, AceLan Kao <acelan.kao@canonical.com>, 
    Kai-Heng Feng <kai.heng.feng@canonical.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/2] platform/x86: Add new Dell UART backlight driver
In-Reply-To: <9167c36f-9eac-49a3-a6d3-55f7fb9556c1@redhat.com>
Message-ID: <06498232-5aeb-6e63-6775-2447a8c60542@linux.intel.com>
References: <20240512162353.46693-1-hdegoede@redhat.com> <20240512162353.46693-2-hdegoede@redhat.com> <106aa14e-b621-84db-f5da-89bf29ed0999@linux.intel.com> <b1187314-35f2-4a10-80be-156f6f645a7e@redhat.com> <ab5c3c46-a438-0ad8-3d67-78261eb3a8d1@linux.intel.com>
 <7c535f53-5cca-4ac5-bcaa-f2f89d40f97d@redhat.com> <1c14872e-7b7d-b67f-9557-bd14fbe604d8@linux.intel.com> <c9ec9611-615c-4a7d-9a72-89d6c7b4c680@redhat.com> <7163ebe9-6cca-c21f-78b7-e6aeda2961b3@linux.intel.com>
 <9167c36f-9eac-49a3-a6d3-55f7fb9556c1@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-631489532-1715610670=:1286"
Content-ID: <93d25a87-4a5e-8f51-a711-8302fdf16564@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-631489532-1715610670=:1286
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <6689ac0e-4fb1-50bd-0e4d-465fb23bb345@linux.intel.com>

On Mon, 13 May 2024, Hans de Goede wrote:
> On 5/13/24 3:34 PM, Ilpo J=E4rvinen wrote:
> > On Mon, 13 May 2024, Hans de Goede wrote:
> >> On 5/13/24 3:14 PM, Ilpo J=E4rvinen wrote:
> >>> On Mon, 13 May 2024, Hans de Goede wrote:
> >>>> On 5/13/24 2:12 PM, Ilpo J=E4rvinen wrote:
> >>>>> On Mon, 13 May 2024, Hans de Goede wrote:
> >>>>>> On 5/13/24 10:34 AM, Ilpo J=E4rvinen wrote:
> >>>>>>> On Sun, 12 May 2024, Hans de Goede wrote:
> >>>
> >>>>>>>> +
> >>>>>>>> +=09=09dell_bl->resp_idx++;
> >>>>>>>> +=09=09if (dell_bl->resp_idx < dell_bl->resp_len)
> >>>>>>>> +=09=09=09continue;
> >>>>>>>> +
> >>>>>>>> +=09=09csum =3D dell_uart_checksum(dell_bl->resp, dell_bl->resp_=
len - 1);
> >>>>>>>> +=09=09if (dell_bl->resp[dell_bl->resp_len - 1] !=3D csum) {
> >>>>>>>> +=09=09=09dev_err(dell_bl->dev, "Checksum mismatch got 0x%02x ex=
pected 0x%02x\n",
> >>>>>>>> +=09=09=09=09dell_bl->resp[dell_bl->resp_len - 1], csum);
> >>>>>>>> +=09=09=09dell_bl->status =3D -EIO;
> >>>>>>>> +=09=09=09goto wakeup;
> >>>>>>>> +=09=09}
> >>>>>>>
> >>>>>>> Why is the checksum calculation and check inside the loop??
> >>>>>>
> >>>>>> The loop iterates over received bytes, which may contain extra dat=
a=20
> >>>>>> after the response, the:=20
> >>>>>>
> >>>>>> =09=09dell_bl->resp_idx++;
> >>>>>> =09=09if (dell_bl->resp_idx < dell_bl->resp_len)
> >>>>>> =09=09=09continue;
> >>>>>>
> >>>>>> continues looping until we have received all the expected bytes. S=
o here, past this
> >>>>>> check, we are are at the point where we have a complete response a=
nd then we verify it.
> >>>>>>
> >>>>>> And on successful verification wake-up any waiters.
> >>>>>
> >>>>> So effectively you want to terminate the loop on two conditions her=
e:
> >>>>>
> >>>>> a) dell_bl->resp_idx =3D=3D dell_bl->resp_len (complete frame)
> >>>>> a) if i =3D=3D len (not yet received a full frame)
> >>>>>
> >>>>> Why not code those rather than the current goto & continue madness?
> >>>>>
> >>>>> Then, after the loop, you can test:
> >>>>>
> >>>>> =09if (dell_bl->resp_idx =3D=3D dell_bl->resp_len) {
> >>>>> =09=09// calc checksum, etc.
> >>>>> =09}
> >>>>>
> >>>>> ?
> >>>>
> >>>> Ok, I've added the following change for v3:
> >>>>
> >>>> diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drive=
rs/platform/x86/dell/dell-uart-backlight.c
> >>>> index bf5b12efcb19..66d8c6ddcb83 100644
> >>>> --- a/drivers/platform/x86/dell/dell-uart-backlight.c
> >>>> +++ b/drivers/platform/x86/dell/dell-uart-backlight.c
> >>>> @@ -87,6 +87,7 @@ static int dell_uart_bl_command(struct dell_uart_b=
acklight *dell_bl,
> >>>>  =09dell_bl->status =3D -EBUSY;
> >>>>  =09dell_bl->resp =3D resp;
> >>>>  =09dell_bl->resp_idx =3D 0;
> >>>> +=09dell_bl->resp_len =3D -1; /* Invalid / unset */
> >>>>  =09dell_bl->resp_max_len =3D resp_max_len;
> >>>>  =09dell_bl->pending_cmd =3D cmd[1];
> >>>> =20
> >>>> @@ -219,7 +219,7 @@ static size_t dell_uart_bl_receive(struct serdev=
_device *serdev, const u8 *data,
> >>>>  =09=09return len;
> >>>>  =09}
> >>>> =20
> >>>> -=09for (i =3D 0; i < len; i++) {
> >>>> +=09for (i =3D 0; i < len && dell_bl->resp_idx !=3D dell_bl->resp_le=
n; i++, dell_bl->resp_idx++) {
> >>>>  =09=09dell_bl->resp[dell_bl->resp_idx] =3D data[i];
> >>>> =20
> >>>>  =09=09switch (dell_bl->resp_idx) {
> >>>> @@ -228,46 +228,41 @@ static size_t dell_uart_bl_receive(struct serd=
ev_device *serdev, const u8 *data,
> >>>>  =09=09=09if (dell_bl->resp_len < MIN_RESP_LEN) {
> >>>>  =09=09=09=09dev_err(dell_bl->dev, "Response length too small %d < %=
d\n",
> >>>>  =09=09=09=09=09dell_bl->resp_len, MIN_RESP_LEN);
> >>>> -=09=09=09=09dell_bl->status =3D -EIO;
> >>>> -=09=09=09=09goto wakeup;
> >>>> +=09=09=09=09goto error;
> >>>>  =09=09=09}
> >>>> =20
> >>>>  =09=09=09if (dell_bl->resp_len > dell_bl->resp_max_len) {
> >>>>  =09=09=09=09dev_err(dell_bl->dev, "Response length too big %d > %d\=
n",
> >>>>  =09=09=09=09=09dell_bl->resp_len, dell_bl->resp_max_len);
> >>>> -=09=09=09=09dell_bl->status =3D -EIO;
> >>>> -=09=09=09=09goto wakeup;
> >>>> +=09=09=09=09goto error;
> >>>>  =09=09=09}
> >>>>  =09=09=09break;
> >>>>  =09=09case RESP_CMD: /* CMD byte */
> >>>>  =09=09=09if (dell_bl->resp[RESP_CMD] !=3D dell_bl->pending_cmd) {
> >>>>  =09=09=09=09dev_err(dell_bl->dev, "Response cmd 0x%02x !=3D pending=
 0x%02x\n",
> >>>>  =09=09=09=09=09dell_bl->resp[RESP_CMD], dell_bl->pending_cmd);
> >>>> -=09=09=09=09dell_bl->status =3D -EIO;
> >>>> -=09=09=09=09goto wakeup;
> >>>> +=09=09=09=09goto error;
> >>>>  =09=09=09}
> >>>>  =09=09=09break;
> >>>>  =09=09}
> >>>> +=09}
> >>>> =20
> >>>> -=09=09dell_bl->resp_idx++;
> >>>> -=09=09if (dell_bl->resp_idx < dell_bl->resp_len)
> >>>> -=09=09=09continue;
> >>>> -
> >>>> +=09if (dell_bl->resp_idx =3D=3D dell_bl->resp_len) {
> >>>>  =09=09csum =3D dell_uart_checksum(dell_bl->resp, dell_bl->resp_len =
- 1);
> >>>>  =09=09if (dell_bl->resp[dell_bl->resp_len - 1] !=3D csum) {
> >>>>  =09=09=09dev_err(dell_bl->dev, "Checksum mismatch got 0x%02x expect=
ed 0x%02x\n",
> >>>>  =09=09=09=09dell_bl->resp[dell_bl->resp_len - 1], csum);
> >>>> -=09=09=09dell_bl->status =3D -EIO;
> >>>> -=09=09=09goto wakeup;
> >>>> +=09=09=09goto error;
> >>>>  =09=09}
> >>>> -
> >>>>  =09=09dell_bl->status =3D 0; /* Success */
> >>>> -=09=09goto wakeup;
> >>>> +=09=09wake_up(&dell_bl->wait_queue);
> >>>> +=09=09return i;
> >>>>  =09}
> >>>> =20
> >>>>  =09return len;
> >>>> =20
> >>>> -wakeup:
> >>>> +error:
> >>>> +=09dell_bl->status =3D -EIO;
> >>>>  =09wake_up(&dell_bl->wait_queue);
> >>>>  =09return i + 1;
> >>>>  }
> >>>
> >>> Thanks, this is way easier to follow.
> >>
> >> I'm glad you like it.
> >>
> >> There is a little bug in this version though, the goto error on the ch=
ecksum fail
> >> case returns i + i, which should be i in that case, I'll just drop the=
 goto there and
> >> instead always use the return i already present at the end of the
> >> "if (dell_bl->resp_idx =3D=3D dell_bl->resp_len) { }" block.
> >=20
> > It could have been solved more logically incrementing i and resp_idx he=
re:
> >=20
> > =09=09dell_bl->resp[dell_bl->resp_idx] =3D data[i];
> > =09=09dell_bl->resp_idx++;
> > =09=09i++;
> >=20
> > so that the inconsistent state is eliminated.
> >=20
> > I also realized (I know I was the one who suggested it) that reverse lo=
gic=20
> > would be better for the incomplete frame check:
> >=20
> > =09if (dell_bl->resp_idx < dell_bl->resp_len)
> > =09=09return len;
> >=20
> > =09// checksum logic...
> >=20
> > Perhaps the success and error return paths could then be merged too.
>=20
> Interesting suggestion, I also realized that the 2 response-length checks=
 are a
> range check so I've folded those together. So here is what I have now for=
 v3,
> note that the i++ is now done when copying data over:
>=20
> =09i =3D 0;
> =09while (i < len && dell_bl->resp_idx !=3D dell_bl->resp_len) {
> =09=09dell_bl->resp[dell_bl->resp_idx] =3D data[i++];
>=20
> =09=09switch (dell_bl->resp_idx) {
> =09=09case RESP_LEN: /* Length byte */
> =09=09=09dell_bl->resp_len =3D dell_bl->resp[RESP_LEN];
> =09=09=09if (!in_range(dell_bl->resp_len, MIN_RESP_LEN, dell_bl->resp_max=
_len)) {

in_range() takes start and len, not start and end. I really hate that=20
helper because it has that trap and would often require "+ min" to be=20
added.

> =09=09=09=09dev_err(dell_bl->dev, "Response length %d out if range %d - %=
d\n",
> =09=09=09=09=09dell_bl->resp_len, MIN_RESP_LEN, dell_bl->resp_max_len);
> =09=09=09=09dell_bl->status =3D -EIO;
> =09=09=09=09goto wakeup;
> =09=09=09}
> =09=09=09break;
> =09=09case RESP_CMD: /* CMD byte */
> =09=09=09if (dell_bl->resp[RESP_CMD] !=3D dell_bl->pending_cmd) {
> =09=09=09=09dev_err(dell_bl->dev, "Response cmd 0x%02x !=3D pending 0x%02=
x\n",
> =09=09=09=09=09dell_bl->resp[RESP_CMD], dell_bl->pending_cmd);
> =09=09=09=09dell_bl->status =3D -EIO;
> =09=09=09=09goto wakeup;
> =09=09=09}
> =09=09=09break;
> =09=09}
> =09=09dell_bl->resp_idx++;

Good, I didn't realize the switch used the index.

--=20
 i.

> =09}
>=20
> =09if (dell_bl->resp_idx !=3D dell_bl->resp_len)
> =09=09return len; /* Response not complete yet */
>=20
> =09csum =3D dell_uart_checksum(dell_bl->resp, dell_bl->resp_len - 1);
> =09if (dell_bl->resp[dell_bl->resp_len - 1] =3D=3D csum) {
> =09=09dell_bl->status =3D 0; /* Success */
> =09} else {
> =09=09dev_err(dell_bl->dev, "Checksum mismatch got 0x%02x expected 0x%02x=
\n",
> =09=09=09dell_bl->resp[dell_bl->resp_len - 1], csum);
> =09=09dell_bl->status =3D -EIO;
> =09}
> wakeup:
> =09wake_up(&dell_bl->wait_queue);
> =09return i;
> }
>=20
> Regards,
>=20
> Hans
>=20
>=20
--8323328-631489532-1715610670=:1286--
