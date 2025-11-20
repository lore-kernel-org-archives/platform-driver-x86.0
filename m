Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C242F7ACC;
	Thu, 20 Nov 2025 10:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763635454; cv=none; b=gD1iYJYCcS2vACTqmvR1jw+NaGPWAPh55FRDnEZchC9ams6CftQ0pJBuYCS5undnS6CrOqYK6ZDmCkkIT13ljtVgvhzUpHAtnyYrzSR/i1cSbEsxUtxeGNvrTlsmxnOVuEt5DVNhElNupWsCUpsEVH5U6QgY8rcKZxSpvEBTazA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763635454; c=relaxed/simple;
	bh=qdrRAmYRVugzU8MJfQRhajMOZXxN7VhE85YlRmTnNeM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nvTmLhu3vFCC5x4+tLAA9wFQt8CEIagb44fMmCPkg4GpRzUo+THi1O7q8tBQhe2ltI6BYchlAAEOn+f1PFY6LkuRrp3bPqz+AdTyZrNxm7MfKOwl030EAnCOOB7uNtWkCezRgdBglr+ppa2yzt/fJLwOBUfH3iSz0jI1xZJZIbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZizPH9yk; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZizPH9yk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763635452; x=1795171452;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=qdrRAmYRVugzU8MJfQRhajMOZXxN7VhE85YlRmTnNeM=;
  b=ZizPH9ykqUdylWxr1xmlpW1KpPi4ZBJrK4IkBle7lqDPQ/bVNiKhkFt3
   UomAtCUBmovKeewIRooQaJfNs+3yd4M6ZnZTVorfaIAgMafHaWfNNaCD0
   KkouAveYB35BTxeN0ZrajVTBb03BmJf++d+i11ajZV3vrqq8G/q4AB8F5
   /XO2iR9q1FuiaeSyh5PoXFdwXgSA7kHrw6T/4UJy/Sm0MlWJLuXCSXLbz
   zERtBAMGYVDtdUBtAL/oZYgquyZ1/n9ayfSi6k0Wski4wnOhafbkwvKKM
   Xpeb338xnASWpdtz4UR70UQ2R6gEt0dPrLWpD/4XaAo7yStN8JNZSMGUh
   A==;
X-CSE-ConnectionGUID: /2ka/EkaR4Sknv1OXvs8WA==
X-CSE-MsgGUID: WMM55f+JQHaE5fjFzC8MwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="68305474"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="68305474"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 02:44:09 -0800
X-CSE-ConnectionGUID: d4qluxvtT+CNPVLPs5HMcw==
X-CSE-MsgGUID: tlv2sY/ETVWns1yKxfk9gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="228639439"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.161])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 02:44:06 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 20 Nov 2025 12:44:02 +0200 (EET)
To: Werner Sembach <wse@tuxedocomputers.com>
cc: W_Armin@gmx.de, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] platform/x86/uniwill: Handle more WMI events
 required for TUXEDO devices
In-Reply-To: <69819b2c-9deb-481b-b404-fc6523c87a3f@tuxedocomputers.com>
Message-ID: <2b7d8dca-b476-19c8-0bfb-7f3c0ccd2323@linux.intel.com>
References: <20251118150839.55336-1-wse@tuxedocomputers.com> <20251118150839.55336-2-wse@tuxedocomputers.com> <69819b2c-9deb-481b-b404-fc6523c87a3f@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 19 Nov 2025, Werner Sembach wrote:

> 
> Am 18.11.25 um 16:02 schrieb Werner Sembach:
> > Handle some more WMI events that are triggered on TUXEDO devices.

To avoid another round-trip and a version, please write a bit more what 
this is about than extremely vague "some".

-- 
 i.

> > 
> > Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> > ---
> >   drivers/platform/x86/uniwill/uniwill-acpi.c | 19 ++++++++++++++++++-
> >   drivers/platform/x86/uniwill/uniwill-wmi.h  |  2 ++
> >   2 files changed, 20 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c
> > b/drivers/platform/x86/uniwill/uniwill-acpi.c
> > index 014960d16211b..4efb5a909f717 100644
> > --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> > +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> > @@ -371,9 +371,11 @@ static const struct key_entry uniwill_keymap[] = {
> >     	/* Reported in manual mode when toggling the airplane mode status */
> >   	{ KE_KEY,       UNIWILL_OSD_RFKILL,                     { KEY_RFKILL
> > }},
> > +	{ KE_IGNORE,    UNIWILL_OSD_RADIOON,                    { KEY_UNKNOWN
> > }},
> > +	{ KE_IGNORE,    UNIWILL_OSD_RADIOOFF,                   { KEY_UNKNOWN
> > }},
> >     	/* Reported when user wants to cycle the platform profile */
> > -	{ KE_IGNORE,    UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE,    { KEY_UNKNOWN
> > }},
> > +	{ KE_KEY,       UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE,    { KEY_F14 }},
> >     	/* Reported when the user wants to adjust the brightness of the
> > keyboard */
> >   	{ KE_KEY,       UNIWILL_OSD_KBDILLUMDOWN,               {
> > KEY_KBDILLUMDOWN }},
> > @@ -382,11 +384,19 @@ static const struct key_entry uniwill_keymap[] = {
> >   	/* Reported when the user wants to toggle the microphone mute status
> > */
> >   	{ KE_KEY,       UNIWILL_OSD_MIC_MUTE,                   { KEY_MICMUTE
> > }},
> >   +	/* Reported when the user wants to toggle the mute status */
> > +	{ KE_IGNORE,    UNIWILL_OSD_MUTE,                       { KEY_MUTE }},
> > +
> >   	/* Reported when the user locks/unlocks the Fn key */
> >   	{ KE_IGNORE,    UNIWILL_OSD_FN_LOCK,                    { KEY_FN_ESC
> > }},
> >     	/* Reported when the user wants to toggle the brightness of the
> > keyboard */
> >   	{ KE_KEY,       UNIWILL_OSD_KBDILLUMTOGGLE,             {
> > KEY_KBDILLUMTOGGLE }},
> > +	{ KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL0,              {
> > KEY_KBDILLUMTOGGLE }},
> > +	{ KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL1,              {
> > KEY_KBDILLUMTOGGLE }},
> > +	{ KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL2,              {
> > KEY_KBDILLUMTOGGLE }},
> > +	{ KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL3,              {
> > KEY_KBDILLUMTOGGLE }},
> > +	{ KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL4,              {
> > KEY_KBDILLUMTOGGLE }},
> >     	/* FIXME: find out the exact meaning of those events */
> >   	{ KE_IGNORE,    UNIWILL_OSD_BAT_CHARGE_FULL_24_H,       { KEY_UNKNOWN
> > }},
> > @@ -395,6 +405,9 @@ static const struct key_entry uniwill_keymap[] = {
> >   	/* Reported when the user wants to toggle the benchmark mode status */
> >   	{ KE_IGNORE,    UNIWILL_OSD_BENCHMARK_MODE_TOGGLE,      { KEY_UNKNOWN
> > }},
> >   +	/* Reported when the user wants to toggle the webcam */
> > +	{ KE_IGNORE,    UNIWILL_OSD_WEBCAM_TOGGLE,              { KEY_UNKNOWN
> > }},
> > +
> >   	{ KE_END }
> >   };
> >   @@ -1247,6 +1260,10 @@ static int uniwill_notifier_call(struct
> > notifier_block *nb, unsigned long action
> >   		}
> >   		mutex_unlock(&data->battery_lock);
> >   +		return NOTIFY_OK;
> > +	case UNIWILL_OSD_DC_ADAPTER_CHANGED:
> > +		// noop for the time being
> Sorry forgot to edit comment style here, will do for v3 but first waiting for
> ack of the rest.
> > +
> >   		return NOTIFY_OK;
> >   	default:
> >   		mutex_lock(&data->input_lock);
> > diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.h
> > b/drivers/platform/x86/uniwill/uniwill-wmi.h
> > index 2bf69f2d80381..48783b2e9ffb9 100644
> > --- a/drivers/platform/x86/uniwill/uniwill-wmi.h
> > +++ b/drivers/platform/x86/uniwill/uniwill-wmi.h
> > @@ -113,6 +113,8 @@
> >     #define UNIWILL_OSD_BENCHMARK_MODE_TOGGLE	0xC0
> >   +#define UNIWILL_OSD_WEBCAM_TOGGLE		0xCF
> > +
> >   #define UNIWILL_OSD_KBD_BACKLIGHT_CHANGED	0xF0
> >     struct device;
> 
