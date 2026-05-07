Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956F53F1676;
	Thu,  7 May 2026 13:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778162168; cv=none; b=hMcS/chYNgr22ftlaRzWJR9/eLgk7I8c2cpuOCd0yEIXY/SJWktI0xWR0waFDf08L6/iaCZdMnNZhXYUT5+U7ce6cItqye6DBbBvfqm6S+BxMpbyNO2LMsqhpBC/hWtrKA1UC/zVRx2T5Dj8lVdWNS79bW2ba8LKu6a6slnfJvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778162168; c=relaxed/simple;
	bh=d2P4T+tfIjHdJIeyHllBZi89biw+X4JNaj0lL/jSYbI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gGr3Io6SlO0Ibhta4rUe3ocSyP9Ay8D38LeZnfvj2A4FRW5ZtD2EMTAhchbs+LBvyJp/ixm0fiRAyhmfnItpVdPkM1BeubgHD3Qk6cS0w7+c0swRc+te+2AUn59uZgpYgNG+FdYMqUF4ebVtAqgA7o7QW6z/UVBWb7wFEeaRh9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VL9bd75H; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VL9bd75H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778162167; x=1809698167;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=d2P4T+tfIjHdJIeyHllBZi89biw+X4JNaj0lL/jSYbI=;
  b=VL9bd75H6SYN2FbpPG2igaeN43H5MrwykVgHEAPQROujKbG4gvf4WzdP
   sFajAgdkzjDz+WfsG4pVZX+ZD3H3bs4IVSN6nNRxdVWfCQowsufcyWltH
   xd0WxbN9lZTqRIMmKB4yFxqkeHkRPkNGZNULmCV9RZK7DmFSpy+9RUrST
   rQX9NQob65QtvIgfkSnPqKQqRTw0B19MwBFAIg/ImoCHFoW+y0XK22Kdt
   hZJpaJ4ecA0JR8RlXZTT/Hr3BADxgC3w8nTl7Hh1rWlpXfarKr4ujaJTY
   V8EvQFtJnmTEWyIS9cGKyUyTFYh9UMfzGvrJCwPmf3GOvaSvQ7ARPR7QQ
   Q==;
X-CSE-ConnectionGUID: YyN2gWE0RKqmW2B354GbDg==
X-CSE-MsgGUID: tHUvm/BORRKe8T3EJ7H3Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79048793"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="79048793"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 06:56:07 -0700
X-CSE-ConnectionGUID: ZK+6Z+JVSIeJIybb9ioSCg==
X-CSE-MsgGUID: 8FD+jfROS+iMvDUhYME/bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="236386980"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.116])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 06:56:04 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 7 May 2026 16:56:01 +0300 (EEST)
To: Denis Benato <denis.benato@linux.dev>
cc: Armandas Kvietkus <armundunelis@gmail.com>, luke@ljones.dev, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, fxzxaxon@outlook.com
Subject: Re: [PATCH] platform/x86: asus-armoury: downgrade missing power
 limits warning to debug
In-Reply-To: <dfe28a80-6ce8-4bba-b151-3c24d385782c@linux.dev>
Message-ID: <2e6d1880-fd4c-e00d-3042-0913bedb7456@linux.intel.com>
References: <20260503175734.27795-1-armundunelis@gmail.com> <6460ef7c-b4d9-4106-95cc-35710b4798bb@linux.dev> <91d3cc8d-ee5b-f204-ee42-ad8825a14a24@linux.intel.com> <dfe28a80-6ce8-4bba-b151-3c24d385782c@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-144601563-1778162161=:983"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-144601563-1778162161=:983
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 6 May 2026, Denis Benato wrote:
> On 5/6/26 13:26, Ilpo J=C3=A4rvinen wrote:
> > On Mon, 4 May 2026, Denis Benato wrote:
> >> On 5/3/26 19:57, Armandas Kvietkus wrote:
> >>> When a system is not found in the power_limits DMI table,
> >>> init_rog_tunables() emits a pr_warn() and returns. This is
> >>> expected behaviour for hardware that does not support ROG
> >>> power limit tunables, not an error condition.
> >>>
> >>> Downgrade to pr_debug() to avoid spurious boot noise on
> >>> unsupported systems while preserving the message for debugging.
> >>>
> >>> Reported-by: fxzxaxon@outlook.com
> >>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D221441
> >>> Signed-off-by: Armandas Kvietkus <armundunelis@gmail.com>
> >>> ---
> >>>  drivers/platform/x86/asus-armoury.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x=
86/asus-armoury.c
> >>> index 5b0987ccc..c8e9ff89f 100644
> >>> --- a/drivers/platform/x86/asus-armoury.c
> >>> +++ b/drivers/platform/x86/asus-armoury.c
> >>> @@ -991,7 +991,7 @@ static void init_rog_tunables(void)
> >>>  =09/* Match the system against the power_limits table */
> >>>  =09dmi_id =3D dmi_first_match(power_limits);
> >>>  =09if (!dmi_id) {
> >>> -=09=09pr_warn("No matching power limits found for this system\n");
> >>> +=09=09pr_debug("No matching power limits found for this system\n");
> >> Maybe this is right to get downgraded, but still no debug: I think inf=
o is better,
> >> but I would like to hear from Luke what this is about.
> > Hi Denis,
> >
> > When kernel is built with CONFIG_DYNAMIC_DEBUG=3Dy, all debug messages=
=20
> > will appear if kernel's cmdline enables it:
> >
> > dyndbg=3D"file drivers/platform/x86/asus-armoury.c +p"
> >
> > (wildcards too could be used where helpful and semicolon as a separator=
=20
> > if, in rare cases, more than one filter should be necessary).
> >
> > So all we need is to ask the reporter to boot with dyndbg enabled for t=
he=20
> > relevant file(s), no recompiling the kernel required.
> >
> >
> > I suspect most distros do have dynamic debugging capability in their=20
> > kernel configs so it shouldn't be a problem when they don't by default=
=20
> > show these messages (at least the two major ones I just checked have it=
).
> >
> Hi!
>=20
> My position is that the experience of most users is:
> they boot linux, install asusctl, notice that not only is less fancy than=
 the windows counterpart,
> but it also lacks TDP sliders so they enter in discord and ask "why can't=
 I control my TDP".
>=20
> As of now one just answers "dmesg | grep asus" and the warning appears, w=
hile if this becomes a debug
> the process becomes more involved, for both parts, as most people know dm=
esg, but a person randomly
> hanging in the discord doesn't usually know how to enable dynamic debuggi=
ng, or how to reconfigure
> a bootloader. I surely don't know how to configure every bootloader under=
 the sun for every major distro.
>=20
> My point of view is that said warning guided someone straight to me, so i=
t reached its objective effectively,
> why changing something that works?
>=20
> The only reason I can think of is people who run with panic on warning, b=
ut since I have yet to see an asus
> laptop that doesn't make linux spam a bunch of acpi errors and warnings s=
uch a kernel (as of now) is
> unbootable on these machines.
>=20
> Perhaps you have a stronger motivation and can point me to it?

I don't have strong motivation here, other than shooting down the false=20
claim that debug level messages are not available when it comes to distro=
=20
settings.

Debug message can be enabled also through

  /sys/kernel/debug/dynamic_debug/control

=2E..but yes, there will be more steps in that case too as that requires=20
mounting debugfs, and reloading the driver too to retrigger the message=20
(and I'm not sure if the userspace program likes that, etc. :-)).

So I understand if you prefer to not go there.

> My current opinion is that instead of demoting it from a warning I should=
 perhaps phrase it better
> as Mario suggests.

I don't have a problem with the message wording myself.

--=20
 i.

--8323328-144601563-1778162161=:983--
