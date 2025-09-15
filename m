Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED6F2D7805
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Sep 2025 10:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757931116; cv=none; b=ZHmVP6CGwCvHAjdx7ODPj9VZIcNSZmJ9wzbZ9REao5WnEgP/yaW8JYT8aJlQiFNOENCtjxHR/Yf6w34hXReLAzUSlL0COHkzPvjwL3ds9Zoq4BQCjtXOzncT563s13BpHD2zWCAdv1jvw//aNTCChjEBCGYi7Yk7Z4LdqwAUkA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757931116; c=relaxed/simple;
	bh=4F7cUk1cYjqKfsZI3rD8wSweAXIPmwzLqMsV026UQvQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=D/+IDk9m8YxGrrzO7/sUQM5N/sbtpJv2FwUmUy1H+86N1slv8zVv607iNsWLMF86ZMTt0C1OqBQONVwa+Io0GI16CLRyd7ywVXmyjlUqWaUqi1/9rWOtCeOdjkmVBiEOr27TM6QQ4YsphZtZRimJIeXQjEfTOZ/sXfPRIBnReCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lutwp46h; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lutwp46h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757931114; x=1789467114;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=4F7cUk1cYjqKfsZI3rD8wSweAXIPmwzLqMsV026UQvQ=;
  b=lutwp46htsux92SZQYmnHEd+YzsnL/GROon2/OEepJ0gC9MJUw0yh2Bu
   +JZ0GsXgreaJHgnaITW4+g1LCMRtZtEol340T0xJSDSyV6G3h1jx8iPPn
   6zk2+tAAkVeUg2gSbVncgpHFs5k+RhK3VP//EJu4Z/dmNuX2AQTNhvIhm
   Po1TEMPv6mnpR7PfbuVdbgLFiDhJauP7mr+6b4rTcyViq2M7Ja3Ra5lXz
   2MOGdVbHXHyRzJnqgVeH44Mdos7rPCDXtPn5XOOEUjOqAW3eAi/CXFzcF
   lKbcXZbBa7O276a9z4wg8yjiYY3cJplfhnAwd2Pp78A+qN44K8dqZx3UK
   g==;
X-CSE-ConnectionGUID: HtwYG/GwRu+p1eSbUwoC5A==
X-CSE-MsgGUID: C6kJ4E6qRVG9Ip1+g2eLTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="77631089"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="77631089"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 03:11:53 -0700
X-CSE-ConnectionGUID: s87nDyQOT6iz/NYRhie4SA==
X-CSE-MsgGUID: 5wM8WBLPRwqtE+ToW7M6Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="174182264"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.39])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 03:11:52 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 15 Sep 2025 13:11:48 +0300 (EEST)
To: =?ISO-8859-15?Q?Tom=E1=A8_Hnyk?= <tomashnyk@gmail.com>
cc: platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: lenovo: Reassign KEY_CUT to 
 KEY_SELECTIVE_SCREENSHOT for Ideapad laptops
In-Reply-To: <1757599473382.2879968666.2275695113@gmail.com>
Message-ID: <219e020c-11e8-fdea-0ad6-656101999e88@linux.intel.com>
References: <1757599473382.2879968666.2275695113@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-904851415-1757930044=:1043"
Content-ID: <fa23f448-f940-ff1a-df01-26f0e923dbf4@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-904851415-1757930044=:1043
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <fa4055fb-daf3-8387-a85a-8f68f73f84f1@linux.intel.com>

On Thu, 11 Sep 2025, Tom=E1=A8 Hnyk wrote:

> This key is produced by FN+PRINT_SCREEN and as per Lenovo documentation,
> it should be "Open the Snipping tool". This corresponds to
> KEY_SELECTIVE_SCRENSHOT, whose keycode is 0x27a. Previously, keycodes
> under 248 were preferred due to X11 limitations, so KEY_CUT was used.
> This is now being corrected.

Hi Tomas,

Thanks for the patch.

Please use "platform/x86: ideapad-laptop:" as the prefix for shortlog and=
=20
remove "for Ideapad laptops" as prefix already covers that information.

I'd rehrapse the commit message to something along the lines of:

As per Lenovo documentation, Fn+Print-Screen should "Open the Snipping=20
tool" which corresponds to KEY_SELECTIVE_SCREENSHOT (keycode 0x27a). It
is currently assigned to KEY_CUT because keycodes under 248 were
preferred due to X11 limitations.

Reassign Fn+Print-Screen from KEY_CUT to KEY_SELECTIVE_SCREENSHOT.


Note also there should be double E in SCREENSHOT.

> Signed-off-by: Tom=E1=A8 Hnyk <tomashnyk@gmail.com>
> ---
>  Fixes https://bugzilla.kernel.org/show_bug.cgi?id=3D220566

Fixes: (note the colon) tag should refer to a commit you're fixing with=20
this patch (not really applicable here). It also has a certain formatting=
=20
requirements which are explained in Documentation/process in case you need=
=20
to use that tag one day.

Closes: is the correct tag to use for bug tickets so please change to=20
that.

Also, please place all tags before your signed-off-by line as anything you=
=20
put after --- line will be automatically cut by maintainer tools.
=20
>  drivers/platform/x86/lenovo/ideapad-laptop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platf=
orm/x86/lenovo/ideapad-laptop.c
> index fcebfbaf0460..556d50fb7996 100644
> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> @@ -1328,7 +1328,7 @@ static const struct key_entry ideapad_keymap[] =3D =
{
>     /* Performance toggle also Fn+Q, handled inside ideapad_wmi_notify() =
*/
>     { KE_KEY,   0x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
>     /* shift + prtsc */
> -   { KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_CUT } },
> +   { KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_SELECTIVE_SCREENSHOT } },
>     { KE_KEY,   0x29 | IDEAPAD_WMI_KEY, { KEY_TOUCHPAD_TOGGLE } },
>     { KE_KEY,   0x2a | IDEAPAD_WMI_KEY, { KEY_ROOT_MENU } },

This patch is corrupted by spaces. (This is a quite common problem, no=20
need to apologize).

After fixing the forementioned issues, please send v2. You may want to=20
try first to send the patch only to yourself and try applying the patch=20
you received from yourself to check that nothing corrupted the patch while=
=20
sending it.

--=20
 i.
--8323328-904851415-1757930044=:1043--
