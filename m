Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435DE19F411
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Nov 2024 15:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731945595; cv=none; b=IlP4EX4qf7XdZyZqwAOgyaij5O4mF+S+FIrmebpqPKqq1ipkkxzNubns+BjLhyD4JzgDO7LyTpICUb8pDt+08Kultrle4IKyBdmLjKk/b9ofr1VwFWr7TVofw6bmTTlnKCVNNE5qBI3QJjIDDpDsOH/5nARhpSo+6W9lhN5xl/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731945595; c=relaxed/simple;
	bh=Qg7Yt+94W/OUlkehFVr3g5Y+XmxB1aXOpCrBkdS0fGU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=R0cReCFjOiO/wJKwUCQsJtAE4o59gAisiKDZtNnkMdq+mW8qmzeIUGpI1ZT3cUSgO1vXvRC4CgPtW4oAoqOGmMmHkMKQ8w0dYf56v1w9QKLhNtRjpM+w4cAJY4qnAVA1Peo32NoSMJ1MybLLeYLsAWpWThAux5d5fqp1a9spaPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UgGLb3eQ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UgGLb3eQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731945593; x=1763481593;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Qg7Yt+94W/OUlkehFVr3g5Y+XmxB1aXOpCrBkdS0fGU=;
  b=UgGLb3eQ4/VLI9atzULQohUdcMeOA19ycugLlgVgaUEO0zf1Tfwn3RkO
   kwDMy5aucCss3XF53ji/Yr0MuDVAT3R9/zMYALxU9rTbXTOcwxPDlecM3
   ZLtE9ZjvDeWn6u+emt088qchfGjBABcxQCezMMfHmepRgVAp2+1Y/hkHs
   CJTMZIabLCqk8E5fkWMG/1ZrgTHQjTEdsfyP8OFMVc00XKWew0BBpMplj
   yV/ZqbMp0vyzKHGZgwZ9NJqMoiUbkfQRvkH4M+GNHLK4LO6oPqpf5TSmp
   lsq20rzC6PAcfTjfeX20ENZ23CShSoLh2D1Tw9HrQiOCDo6n8p9I3tb+c
   A==;
X-CSE-ConnectionGUID: WlPx1HDCSD2KGdYIRDdaHA==
X-CSE-MsgGUID: 6FBt0E05Q5mPG1OJanCAlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32009138"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="32009138"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 07:59:53 -0800
X-CSE-ConnectionGUID: wqDAPsjXSDCqrM42hfxf7w==
X-CSE-MsgGUID: ixOnAuYbSZS7sh+BRrC46g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="93721924"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.193])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 07:59:51 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 18 Nov 2024 17:59:47 +0200 (EET)
To: Joshua Grisham <josh@joshuagrisham.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org
Subject: Re: Adding a new platform driver samsung-galaxybook
In-Reply-To: <CAMF+KeYus9dW00WNJMLVxLLHdG9JgCfrGJ491fu7NM8GAEqqCg@mail.gmail.com>
Message-ID: <a8ba0455-625f-1c14-2489-4ad5c03c2bd5@linux.intel.com>
References: <CAMF+KeYus9dW00WNJMLVxLLHdG9JgCfrGJ491fu7NM8GAEqqCg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Nov 2024, Joshua Grisham wrote:

> Hello! I have created a platform driver for Samsung Galaxy Book series
> notebooks which has now gone through several iterations and
> contributions from several other community members. Based on stars and
> community involvement I would guess that the usage of the driver is
> more than at least 100 users (if not more?) across multiple different
> generations of devices and many different distributions, so hopefully
> we have ironed out a lot of issues by now!
> 
> The existing driver samsung-laptop is of course somewhat
> famous/notorious for how it works, but on newer devices (primarily
> Samsung Galaxy Book series devices but does include a few others),
> Samsung is using a new ACPI device called "SCAI" which is what this
> new driver is built on, and the functionality is totally different.
> There are only a few ACPI methods on this device that then actually
> control a lot of different features; the "magic" is in building
> various payloads to steer all of these different functionalities even
> though it is often using the same ACPI method.
> 
> It is my opinion that, as we now have achieved some level of stability
> with this driver, it would be good to try and get it added to mainline
> as having it in mainline will add a lot of benefits (even larger
> number of users who will gain benefit from this, better quality and
> standardization with involvement from maintainers and the larger
> community, etc).
> 
> I have myself tried to adhere to many of the existing patterns that
> exist within other pdx86 drivers and the community has helped to find
> and ensure (and in some cases even directly contributed to that)
> various features are using standard interfaces such as with the
> battery extension, platform profile, etc, in a way that seems to be
> unified with existing platform drivers as well.
> 
> The driver code is currently located here:
> https://github.com/joshuagrisham/samsung-galaxybook-extras/blob/main/samsung-galaxybook.c
> 
> As there are a few variants of what features are supported on
> different devices (even devices with the same ACPI device id) then one
> of the key principles that I have tried to now follow with the driver
> is that each feature tries to check that it works or not (receives an
> error code in the payload from the ACPI method) before "enabling" the
> feature (creating a sysfs attribute or registering a new device etc)
> when the module is probed and loaded.
> 
> Instead of just sending the code as-is in a new patch then I thought
> to ask you all as the PDX86 maintainers if there is anything glaring
> that you would prefer should be changed or re-designed before we try
> to push this in as a patch and add this driver to the kernel?
> 
> You can see more background and what features are supported in the
> README file here:
> https://github.com/joshuagrisham/samsung-galaxybook-extras/blob/main/README.md
> 
> A few potentially "controversial" bits that I can highlight already now:
> 
> 1. various failure messages or "unsupported features" write a warning
> that directs users to create an issue in my own Github repository
> instead of in Bugzilla -- maybe this is ok at the beginning but assume
> it would be better to just remove some of this info from the message
> and/or direct users to create a new bug in Bugzilla under the right
> component there ?

Hi Joshua,

There are some pre-existing 'please report to' prints already.

For the different levels of information needed for production vs 
troubleshooting, I sugges you rely mostly on dynamic debugging though so 
if you need to have a deeper look, just ask the reporter to enable dyndbg 
for the driver so you don't need to have them spamming logs in normal 
situations.

There's nothing wrong with having github as bug reporting place as long 
as somebody keeps an eye on the reports, obviously. You can add a 
MAINTAINERS entry with B:.

I also suggest if you really plan to keep an eye on this driver, add 
yourself as the maintainer too as then tools would automatically add you 
to the relevant patches so you can comment/review. I can still manage the 
merging the patches into pdx86 repo and PRs to Linus so you don't need to 
worry about handling such a boring part of maintainership :-).

> 2. some features where Kernel version are checked for handling some
> things different for older versions of the kernel, but all of this I
> would take away before submitting a patch

Yes. It would be unnecessary dead code.

> 3. usage of the i8042 filter and ACPI hotkey notifications to handle a
> few of the hotkey actions within the driver itself instead of just
> emitting input events and allow userspace to handle the actions
> (namely cycling through keyboard backlight levels, performance modes,
> etc)
>
> This last item (executing hotkey actions in kernel space) is not
> totally unprecedented either, as I have seen there seems to exist
> similar i8042 filters driving hotkey actions in msi-laptop,
> toshiba_acpi, and dell-laptop and ACPI notifications from hotkeys
> driving actions in several x86 platform drivers as well (dell-laptop,
> acer-wmi, asus-laptop, ideapad-laptop, etc; this is an even more
> common pattern than using an i8042 filter, it seems).
>
> The problem with just emitting the "right" input events and relying on
> the userspace to handle this stuff in the right way is that 1) there
> are not really keycodes that exist for exactly the keys we want here
> (even though "Keyboard Backlight Cycle" and some kind of "Performance
> Mode" hotkeys are very common on laptops today) and 2) functionality
> for how to handle these kind of events do not really support these
> use-cases either (an example if you read through the discussion here:
> https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/issues/41 and
> especially several of the comments from Benjamin Berg, that
> implementation of "Keyboard Backlight Toggle" is just on vs off and
> does not cycle, and there should either be special handling of this or
> a new key is created specifically for this purpose... this was from
> 5-6 years ago and the state of this has not changed since then from
> what I can tell). It is because of these same problems that I assume
> the existing PDX86 drivers do in fact implement some of this hotkey
> action logic in the kernel space, in a similar way that I have tried
> to do in this new samsung-galaxybook driver. I am not sure the
> appetite for having even more of this pattern exist and/or if there
> are any details of the implementation that you all would wish that I
> should tweak a bit? I am very open to any kind of feedback on this.

That would be more Hans' domain of expertize so I suggest you ping
him with a private mail as he has decided to pay less attention on
pdx86 mailing list's posts:
  https://lore.kernel.org/platform-driver-x86/02b4c051-ea11-4fe9-876d-070d18cd84bf@redhat.com/

> Any other discussion or questions are of course welcome! Otherwise
> and/or once things are to a point that is looking good then I can
> create and submit a patch for this new driver.

Try to replace as many literals with named defines, it always helps
the code reader. Especially, if you end up adding a comment to explain a 
literal, you really would want to use a named define instead and forgo the 
comment as the code explains itself.

There are some indentation/alignment/style issues, e.g., braces around 
"else" and on continuation lines.

Be silent when no error occurs (=no non-dbg level prints).

Remove any double empty lines.

Don't split print strings to multiple lines to allow easier grep.


Please do realize it's much easier to pinpoint review comments when you 
post actual patch on the list so I hope you won't shy out too far from 
that. We do appreciate contributions and try to help you out to get them 
into shape for merging.


-- 
 i.

