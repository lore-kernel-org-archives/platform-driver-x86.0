Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBB41F61C
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Apr 2024 08:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713773274; cv=none; b=Qw1PHEDd3DlUoWDmP6X2uv3K3Nd4cHMqCDB1MnZ/bdpFbJXrX5LjitZbLeZvSz8bNRnLt3hoecBMeANejIwF2IY7skiX5epcJoBttF/uhgjoiSVyXH4m+l9znUk2MVWOmeYbzN+QCwJPsz6TQsoFpK3FNbVY633W+iyNMxDYya8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713773274; c=relaxed/simple;
	bh=akH2o1ceWPH71RCGzed/sAmSEKaZ5inlFU8Bg2K9L8M=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=BYeJp6QWL2QOxxY2W5ggEdfUKTAYu2Auz+9fzZNCmxl4JiCLRIRiOYljAWgwRbqQSb1Ob65zX6DGdSn04dpab80qblZFtP+IJWYwSnBNmIBixDwf55bma8LshFCGPJeb9faQrls+fZ1UacRBJgOLSgrlJhrP7FE2OAAa6uYfacM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mIYiZc15; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mIYiZc15"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713773273; x=1745309273;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=akH2o1ceWPH71RCGzed/sAmSEKaZ5inlFU8Bg2K9L8M=;
  b=mIYiZc15j49klaaYPRmYWc5UwPAevVa9xkY++iNpHhG10AfatEQlWqHq
   CDGIifuV53ynWu6D+ByjE1Q01vI0Whbiwgz/1PperngGa+B7hGOB1VvxO
   hhcP/MwlH5Wdln2c3YzttLUEtURU8X8JM6f9V5+Wp+VGRxkMplEgU08Cm
   tdvBy4HjFy8K2UccJzky2y4plZ4cAUxArI7oTq4unsnNE4fnLv/EOd7OU
   B6DtbiPF2Vv/RvhvTokTrYEXx/lPyLIE6lWgYQodoNHnl1XmmhUFV6T5A
   JHRUfcZcGUYduwnH5W/2HmGcg+MmBctAuSxxce9QTejQA1URmB22Nitsv
   Q==;
X-CSE-ConnectionGUID: Hunt3RNkSdObehFWsFzxPw==
X-CSE-MsgGUID: l8W1va06QE+FMwxLMsZF/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="13073019"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="13073019"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 01:07:52 -0700
X-CSE-ConnectionGUID: f6ep5Wj/Sk6a6OPPhpcOcw==
X-CSE-MsgGUID: I3GEDO9YSNOYQoT4FOaeZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="55155322"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.39])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 01:07:50 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 22 Apr 2024 11:07:45 +0300 (EEST)
To: Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andy@kernel.org>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
    Vishnu Sankar <vishnuocv@gmail.com>, Nitin Joshi <njoshi1@lenovo.com>, 
    ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 03/24] platform/x86: thinkpad_acpi: Drop setting
 send_/ignore_acpi_ev defaults twice
In-Reply-To: <20240421154520.37089-4-hdegoede@redhat.com>
Message-ID: <4f62150d-da65-7ecf-fc5d-50afa5dfccb3@linux.intel.com>
References: <20240421154520.37089-1-hdegoede@redhat.com> <20240421154520.37089-4-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1737572569-1713773265=:2288"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1737572569-1713773265=:2288
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sun, 21 Apr 2024, Hans de Goede wrote:

> send_acpi_ev, ignore_acpi_ev are already initialized to true resp. false =
by

Wording here is odd (but I'm not native so could be I just don't=20
understand what "true resp. false" is supposed to mean/fit into the=20
general structure of this sentence). I could nonetheless guess the=20
general meaning of the sentence despite that, but you might want to=20
consider rewording it into something that is easier to understand.

The code change is fine,

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

> hotkey_notify() before calling the various helpers. Drop the needless
> re-initialization from the helpers.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 24 +++++-------------------
>  1 file changed, 5 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/=
thinkpad_acpi.c
> index fc5681808c3b..007223fded30 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -3754,14 +3754,12 @@ static bool hotkey_notify_extended_hotkey(const u=
32 hkey)
>  =09return false;
>  }
> =20
> +/* 0x1000-0x1FFF: key presses */
>  static bool hotkey_notify_hotkey(const u32 hkey,
>  =09=09=09=09 bool *send_acpi_ev,
>  =09=09=09=09 bool *ignore_acpi_ev)
>  {
> -=09/* 0x1000-0x1FFF: key presses */
>  =09unsigned int scancode =3D hkey & 0xfff;
> -=09*send_acpi_ev =3D true;
> -=09*ignore_acpi_ev =3D false;
> =20
>  =09/*
>  =09 * Original events are in the 0x10XX range, the adaptive keyboard
> @@ -3794,14 +3792,11 @@ static bool hotkey_notify_hotkey(const u32 hkey,
>  =09return false;
>  }
> =20
> +/* 0x2000-0x2FFF: Wakeup reason */
>  static bool hotkey_notify_wakeup(const u32 hkey,
>  =09=09=09=09 bool *send_acpi_ev,
>  =09=09=09=09 bool *ignore_acpi_ev)
>  {
> -=09/* 0x2000-0x2FFF: Wakeup reason */
> -=09*send_acpi_ev =3D true;
> -=09*ignore_acpi_ev =3D false;
> -
>  =09switch (hkey) {
>  =09case TP_HKEY_EV_WKUP_S3_UNDOCK: /* suspend, undock */
>  =09case TP_HKEY_EV_WKUP_S4_UNDOCK: /* hibernation, undock */
> @@ -3834,14 +3829,11 @@ static bool hotkey_notify_wakeup(const u32 hkey,
>  =09return true;
>  }
> =20
> +/* 0x4000-0x4FFF: dock-related events */
>  static bool hotkey_notify_dockevent(const u32 hkey,
>  =09=09=09=09 bool *send_acpi_ev,
>  =09=09=09=09 bool *ignore_acpi_ev)
>  {
> -=09/* 0x4000-0x4FFF: dock-related events */
> -=09*send_acpi_ev =3D true;
> -=09*ignore_acpi_ev =3D false;
> -
>  =09switch (hkey) {
>  =09case TP_HKEY_EV_UNDOCK_ACK:
>  =09=09/* ACPI undock operation completed after wakeup */
> @@ -3879,14 +3871,11 @@ static bool hotkey_notify_dockevent(const u32 hke=
y,
>  =09}
>  }
> =20
> +/* 0x5000-0x5FFF: human interface helpers */
>  static bool hotkey_notify_usrevent(const u32 hkey,
>  =09=09=09=09 bool *send_acpi_ev,
>  =09=09=09=09 bool *ignore_acpi_ev)
>  {
> -=09/* 0x5000-0x5FFF: human interface helpers */
> -=09*send_acpi_ev =3D true;
> -=09*ignore_acpi_ev =3D false;
> -
>  =09switch (hkey) {
>  =09case TP_HKEY_EV_PEN_INSERTED:  /* X61t: tablet pen inserted into bay =
*/
>  =09case TP_HKEY_EV_PEN_REMOVED:   /* X61t: tablet pen removed from bay *=
/
> @@ -3914,14 +3903,11 @@ static bool hotkey_notify_usrevent(const u32 hkey=
,
>  static void thermal_dump_all_sensors(void);
>  static void palmsensor_refresh(void);
> =20
> +/* 0x6000-0x6FFF: thermal alarms/notices and keyboard events */
>  static bool hotkey_notify_6xxx(const u32 hkey,
>  =09=09=09=09 bool *send_acpi_ev,
>  =09=09=09=09 bool *ignore_acpi_ev)
>  {
> -=09/* 0x6000-0x6FFF: thermal alarms/notices and keyboard events */
> -=09*send_acpi_ev =3D true;
> -=09*ignore_acpi_ev =3D false;
> -
>  =09switch (hkey) {
>  =09case TP_HKEY_EV_THM_TABLE_CHANGED:
>  =09=09pr_debug("EC reports: Thermal Table has changed\n");
>=20

--8323328-1737572569-1713773265=:2288--
