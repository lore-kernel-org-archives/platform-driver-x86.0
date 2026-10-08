Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4E743F4C5;
	Thu,  8 Oct 2026 12:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791463721; cv=none; b=NBFE2MgOF55hdNonlKlmJ5D8FHOI98AeFFOiwuaw4wlLyMWhXd5S4fxSHBodICJoHb7e+9Hli04cnMvZRWqygVzAuz07poyCRPrP48S9GlBRLFptVhPmT2qSy0khQPuP0l/Y0tWKUBqnuge61viLBnxa+6o3UR05zU/56mkplPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791463721; c=relaxed/simple;
	bh=iwn1jD9kDV1xe6eLybb/VQrcDHJ1H1es07AYJEVgqw4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Cpcu9v3sPRijWALcGae4HCibfRkCiyy+VWa6bAjg1EPBH76eiqfgFtr1MxGvX8Scd4o1rxI7Ke9LsI6JmUda0L3azSoKCavPCM0QSyjn4NAZ534cROAuywxjD6qmy6uRu+zMUP4llkNcDfZ0Cia5ft6E7fUxMtMx+RKbjSZoOCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JTVP7i1Z; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JTVP7i1Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791463719; x=1822999719;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=iwn1jD9kDV1xe6eLybb/VQrcDHJ1H1es07AYJEVgqw4=;
  b=JTVP7i1ZWBSp6P4HrW5hFQWwl2M4alRCzVG5RaCpuBeKofqA8DAXLX8K
   QaonSICGcAdxykkqHa6Ea2x1YxD1jCG6aWfTOWYUponntQtio8WJ1KIU+
   79LpsODgxJHeU+sPdkvJWUF9xsbXCbbIPekmjA0sLraspi/06DmIowalM
   prFzyXzfmwBgQNu3UKAxQIrOQnz8JzZB/vKl69nBoekKD6+MWqoF2hUis
   tLdSnFZtUU7JRoRlBa9LFYREbCvmXV0W4wbytufBkuSDdpkRkupwxMCXu
   F0hpBF/5Z4cfQbl/HImqKCM7w1g0HytB1GsjUDlgHboqluriabQAntSW4
   A==;
X-CSE-ConnectionGUID: Bk2MJj3jSj6JoVeZ//9omw==
X-CSE-MsgGUID: FSmGdu9wTTSWyk/uiOgGGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="122191"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="122191"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 05:48:38 -0700
X-CSE-ConnectionGUID: cNVRPr48R7K08OvUOdjYsg==
X-CSE-MsgGUID: XS2Q+eX9RaulUhHysR4esw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="1791319"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.140])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 05:48:36 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 8 Oct 2026 15:48:31 +0300 (EEST)
To: Denis Benato <denis.benato@linux.dev>, Bartu Alev <bartualev@gmail.com>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    Hans de Goede <hansg@kernel.org>, "Luke D . Jones" <luke@ljones.dev>, 
    Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH v2 2/2] platform/x86: asus-wmi: add TUF keyboard RGB
 readback support
In-Reply-To: <c0301eb2-62b9-4dbd-ba24-3a2c40675b20@linux.dev>
Message-ID: <570a8f23-0782-8a45-d62f-c95bb28dade9@linux.intel.com>
References: <20260925200744.129714-1-bartualev@gmail.com> <20260926005625.171560-1-bartualev@gmail.com> <20260926005625.171560-3-bartualev@gmail.com> <c0301eb2-62b9-4dbd-ba24-3a2c40675b20@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 26 Sep 2026, Denis Benato wrote:
> On 9/26/26 02:56, Bartu Alev wrote:
> > TUF Gaming laptops expose kbd_rgb_mode and kbd_rgb_state as write-only
> > attributes (DEVICE_ATTR_WO), preventing userspace from querying the
> > active hardware configuration.
> >
> > Add readback support by querying ASUS_WMI_DEVID_TUF_RGB_READBACK
> > (0x0010005B) via the WMI DSTS method. On supported platforms this
> > evaluates the DSDT method EC0.KBLS(), which returns a 16-byte buffer
> > containing the active lighting mode, RGB color channels, effect speed
> > and power-state flags.
> >
> > Introduce kbd_rgb_read_status() to evaluate and validate the buffer,
> > and convert both attributes to DEVICE_ATTR_RW. Map the hardware speed
> > codes (0xe1, 0xeb, 0xf5) to their sysfs indices (0, 1, 2).
> >
> > The command field is not part of the status buffer: "immediate vs
> > save-to-flash" is a property of the write verb (0xb3/0xb4), not of
> > readable state, and the EC mirror is updated identically by both.
> > Readback therefore emits a synthetic leading '1' - the canonical
> > input form userspace writes - so that output matches input.
> >
> > Suggested-by: Denis Benato <denis.benato@linux.dev>
> > Signed-off-by: Bartu Alev <bartualev@gmail.com>
> > ---
> >  drivers/platform/x86/asus-wmi.c            | 79 +++++++++++++++++++++-
> >  include/linux/platform_data/x86/asus-wmi.h |  3 +
> >  2 files changed, 80 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> > index db6ee1974838..fe1dcc7701ad 100644
> > --- a/drivers/platform/x86/asus-wmi.c
> > +++ b/drivers/platform/x86/asus-wmi.c
> > @@ -1046,7 +1046,58 @@ static ssize_t gpu_mux_mode_store(struct device *dev,
> >  static DEVICE_ATTR_RW(gpu_mux_mode);
> >  #endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
> >  
> > +static int kbd_rgb_read_status(u8 data[16])
> > +{
> > +	int err;
> > +
> > +	err = asus_wmi_evaluate_method_buf(ASUS_WMI_METHODID_DSTS,
> > +					   ASUS_WMI_DEVID_TUF_RGB_READBACK,
> > +					   0, data, 16);
> > +
> > +	if (err)
> > +		return err < 0 ? err : -ENODEV;
> > +
> > +	/* DUBF[0] is a constant 1 set by the AML: anything else is not KBLS */
> > +	if (data[0] != 1)
> > +		return -ENODEV;
> > +
> 
> -ENODEV or -ENOTSUPP ? Which one is better suited for these kind of things?

If something is not there, -ENODEV is appropriate.

Unexpected comms is -EIO (-EINVAL is unfortunately often misused for 
this but it -EINVAL is to say input parameter was wrong).

-ENOTSUPP is not a standard error code (the correct one would be 
-EOPNOTSUPP).

TBH, I don't really know where the line between -ENODEV and -EOPNOTSUPP 
is. I'd personally use the latter mostly for the case where software side 
lacks something.

In anycase, wrong errno's are endemic and hard to fix without running 
afoul with something as they often relate also to userspace ABIs.

> If we go with two separate sysfs attrs you don't register the read one,
> otherwise I am not sure.
> 
> > +	return 0;
> > +}
> > +
> >  /* TUF Laptop Keyboard RGB Modes **********************************************/
> > +static ssize_t kbd_rgb_mode_show(struct device *dev,
> > +				 struct device_attribute *attr,
> > +				 char *buf)
> > +{
> > +	u8 data[16] = {};
> > +	u32 speed;
> > +	int err;
> > +
> > +	err = kbd_rgb_read_status(data);
> > +	if (err)
> > +		return err;
> > +
> > +	/* Map hardware speed codes back to sysfs index:
> > +	 * 0xe1 -> 0 (slow), 0xeb -> 1 (normal), 0xf5 -> 2 (fast)
> > +	 */
> > +	switch (data[5]) {
> > +	case 0xe1:
> > +		speed = 0;
> > +		break;
> > +	case 0xeb:
> > +		speed = 1;
> > +		break;
> > +	case 0xf5:

Name literals with defines. When it comes to offsets, consider if a 
struct would be viable instead of byte array + named define index.

> > +		speed = 2;
> > +		break;
> > +	default:
> > +		speed = 1;
> > +		break;
> > +	}
> > +
> > +	return sysfs_emit(buf, "1 %d %d %d %d %d\n",
> > +			  data[1], data[2], data[3], data[4], speed);
> 
> We had this discussion in discord so I want to update everyone reading:
> the status returned is the current one and both cmd=0 and cmd=1 on write
> update the current status.
> 
> Therefore this is an asymmetry that doesn't really need to be,
> what if we introduce another sysfs that is RO? Ilpo?

I'm not entirely sure what's the suggestion.

> > +}
> >  static ssize_t kbd_rgb_mode_store(struct device *dev,
> >  				 struct device_attribute *attr,
> >  				 const char *buf, size_t count)
> > @@ -1099,7 +1150,7 @@ static ssize_t kbd_rgb_mode_store(struct device *dev,
> >  
> >  	return count;
> >  }
> > -static DEVICE_ATTR_WO(kbd_rgb_mode);
> > +static DEVICE_ATTR_RW(kbd_rgb_mode);
> >  
> >  static DEVICE_STRING_ATTR_RO(kbd_rgb_mode_index, 0444,
> >  			     "cmd mode red green blue speed");
> > @@ -1115,6 +1166,30 @@ static const struct attribute_group kbd_rgb_mode_group = {
> >  };
> >  
> >  /* TUF Laptop Keyboard RGB State **********************************************/
> > +static ssize_t kbd_rgb_state_show(struct device *dev,
> > +				  struct device_attribute *attr,
> > +				  char *buf)
> > +{
> > +	u8 data[16] = {};
> > +	u8 flags;
> > +	int err;
> > +
> > +	err = kbd_rgb_read_status(data);
> > +	if (err)
> > +		return err;
> > +
> > +	/*
> > +	 * data[6] power-state bitmask:
> > +	 * BIT(1) boot, BIT(3) awake, BIT(5) sleep, BIT(7) shutdown
> > +	 */
> > +	flags = data[6];
> > +
> > +	return sysfs_emit(buf, "1 %d %d %d %d\n",
> > +			  !!(flags & BIT(1)),
> > +			  !!(flags & BIT(3)),
> > +			  !!(flags & BIT(5)),
> > +			  !!(flags & BIT(7)));

These BIT(x) should be named with defines as you clearly know what they 
mean (I assume the _store ones too match to these so do the addition and 
conversion in own patch).

A comment like the one above is almost always an indication of a naming 
problem that, after fixed, makes the comment totally redundant.

We try to leave comments for something that is tricky, non-intuitive, or
complex.

> > +}
> >  static ssize_t kbd_rgb_state_store(struct device *dev,
> >  				 struct device_attribute *attr,
> >  				 const char *buf, size_t count)
> > @@ -1146,7 +1221,7 @@ static ssize_t kbd_rgb_state_store(struct device *dev,
> >  
> >  	return count;
> >  }
> > -static DEVICE_ATTR_WO(kbd_rgb_state);
> > +static DEVICE_ATTR_RW(kbd_rgb_state);
> >  
> >  static DEVICE_STRING_ATTR_RO(kbd_rgb_state_index, 0444,
> >  			     "cmd boot awake sleep shutdown");
> > diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> > index b5ed8c83ace1..1447c7f354bc 100644
> > --- a/include/linux/platform_data/x86/asus-wmi.h
> > +++ b/include/linux/platform_data/x86/asus-wmi.h
> > @@ -161,6 +161,9 @@
> >  /* TUF laptop RGB power/state */
> >  #define ASUS_WMI_DEVID_TUF_RGB_STATE	0x00100057
> >  
> 
> The pre-existing one should probably be renamed to make clear
> it's write only and it is a command... In its own patch.
> 
> ASUS_WMI_DEVID_TUF_RGB_CMD probably?
> 
> > +/* TUF laptop RGB keyboard status readback*/
> > +#define ASUS_WMI_DEVID_TUF_RGB_READBACK	0x0010005B
> > +
> 
> ASUS_WMI_DEVID_TUF_RGB_READ_STATUS ?
> 
> 
> >  /* Bootup sound control */
> >  #define ASUS_WMI_DEVID_BOOT_SOUND	0x00130022
> >  
> 

-- 
 i.

