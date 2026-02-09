Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D74244665
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 12:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770639103; cv=pass; b=GnVg95s8toqx+phHhXxIjdOXVPokCTMEwCXXKAcrB1eZOQpRWwsl6SwvYgcwP64O54nEKLlYGq3e3iGLyQSgaEXTEEpA+z13ITor4mgOuVn1HxIQluujCMbZszG8Ci6IO6JQfwdYqOVxUzhWcxbsnlr7aWO1EKu+81Chm/ERjfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770639103; c=relaxed/simple;
	bh=QZnj2wNHgxul7rwQK9qNEfeFTioeLHL/g0xXQFtqOBo=;
	h=Message-ID:Subject:From:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=i34i7fflUv2gj5IOTEIGXfNaFXKr0nhyKMQGqGeIQFOzDiIPdNO2zsPk5+FDa/tggokmsgNriB1I3KN1nbVTuqeIGMG6fsCz9rFl5J6wOpETWB0DkZFYyTExWYIT3zona3I144vxHt/mJmvJtx6xnjSz/SZzzP8zlrQUN+tsbo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=nKaaTEd9; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="nKaaTEd9"
ARC-Seal: i=1; a=rsa-sha256; t=1770639096; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=M0EliNaGlBKfgff0iGMJiWSRUDi5duaraWwdmwRq1OGi7XKuBvsqq+51orq/9qtdl9APXSc9XvD5w4Hn0We+me9x2onteYAwGI7T+czlFSi+0d5ffZYfzd7VSY+adZVPxfxXAlMMVU9Ef8svsWMv/wmFBvg66sC+hgJ0YnGgY8Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770639096; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=jwiO3zyAWJRqzoVImpIPZvY05fUx8cFiOXfOnts9IJQ=; 
	b=auqEFVDd4SbF1Mndo9ePXgzuFg8LaUkUCo8vlFECDa/s+36IsEMCNr+4+ofkIkIgFtEgQ+n8nCak4tQ1WfkALAjkX7jre4vnUuWd1NLs7wXkr7mSfEEFFC7N7zJCzPSOBsBFFqygKVDvKWgI4Co8sN+DEVIdv5TQO54+lCiA02E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770639096;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To:Cc;
	bh=jwiO3zyAWJRqzoVImpIPZvY05fUx8cFiOXfOnts9IJQ=;
	b=nKaaTEd9Zyx/XY05haaYa1yMXQ8nZP/2ivqIDYzbB4WXv6V8Me+05DoA0rSlfgEg
	0lHyHBOFALvr7rpy/Ed5bnhYLwwuC1atIwzPRg/nwSqYHkzwLmXzxch2Trdst77HiOP
	kMDrBhIqQnqztEhZp16oVFx+AFQOcapsIrJwB51MIiJkzma1PR7WW7fyAw7uLbjJ9Yr
	0Ixj4UAE7uPNp4h9dZAQE6SvvxgBtmiyrT7QokOZISl7+a0ARjyRa1Klpai5jh+QITY
	c4pYBcpI/J7Izb2Y0vYIverUhhECGd3U13m31m48eyhtr0dGIKWnPF256E8xhjOSDYb
	eVrt7Ecs5w==
Received: by mx.zohomail.com with SMTPS id 1770639094746574.2654918985517;
	Mon, 9 Feb 2026 04:11:34 -0800 (PST)
Message-ID: <d4e2c2c228abb7f9359a17a1d6d036427ff5c2a8.camel@rong.moe>
Subject: Re: [Bug 221065] New: ideapad_acpi: unexpected charge_types spam
 on Yoga Pro 7 14ASP9
From: Rong Zhang <i@rong.moe>
To: bugzilla-daemon@kernel.org, platform-driver-x86@vger.kernel.org
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Feb 2026 20:06:27 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-8 
X-ZohoMailClient: External

Hi Raphael,

On Mon, 2026-02-09 at 07:50 +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D221065
>=20
>             Bug ID: 221065
>            Summary: ideapad_acpi: unexpected charge_types spam on Yoga Pr=
o
>                     7 14ASP9
>            Product: Drivers
>            Version: 2.5
>           Hardware: AMD
>                 OS: Linux
>             Status: NEW
>           Severity: low
>           Priority: P3
>          Component: Platform_x86
>           Assignee: drivers_platform_x86@kernel-bugs.osdl.org
>           Reporter: rbitton@linux.com
>         Regression: No
>=20
> Hi,
>=20
> I'm experiencing constant dmesg spam from ideapad_acpi on my Lenovo Yoga =
Pro 7
> 14ASP9:
>=20
> [  733.997072] ideapad_acpi VPC2004:00: unexpected charge_types: both [Fa=
st]
> and [Long_Life] are enabled

Please attach the full dmesg log along with the acpidump of your
device.

This error log is intended to remind users to write either Fast or
Long_Life to charge_types to break the dilemma. Could you check
/sys/kernel/debug/ideapad/status before and after writing into
charge_types?

> This started on 6.19.0 on both my distro's mainline kernel and the vanill=
a
> mainline kernel I compiled. The issue is not present in 6.18. It happens =
about
> every minute starting about a minute after boot regardless of if I'm char=
ging
> or not.

In your case there was a userspace process reading charge_types every
minute and triggering the error log.

What process was it? Could you check with

   sudo perf --no-pager ftrace -T ideapad_psy_ext_get_prop

to see its pid and find out what it is?

> Model: Lenovo Yoga Pro 7 14ASP9 (83HN)
> CPU: AMD Ryzen AI 9 365
> BIOS: PSCN17WW (up to date)
>=20
> The laptop appears to be reporting both Fast and Long_Life charge modes
> simultaneously, which the driver considers unexpected. Functionally every=
thing
> works fine, including fast charging, but the log spam is excessive.

Did it stop charging at 60%/80%? That's what I got (i.e., both fast
charging and charge threshold) when I manually put my device into such
a state.

> Of note:
> zsh rbitton@rbitton-linux3 01:46 /sys/class/power_supply/BAT0 > cat
> /sys/class/power_supply/BAT*/charge_types   =20
> [Fast] Standard Long_Life

Wait, I don't understand how this could happen. Reading charge_types
should have failed with -EINVAL when it ran into the error path. In
other words, you have already got out of the dilemma when reading
charge_types returns successfully. So at least it temporarily recovered
to an expected state when you read charge_types, but was somehow broken
by other things afterward...

Could you check `sudo lsmod | grep acpi_call'? Did you ever set up
anything abusing acpi_call?

> All attempts to fix it on my end have failed.Let me know if you need any
> additional information; I would be more than willing to test any fixes.

Could you try booting into a livecd (or a fresh installation) of your
distro with 6.19 kernel and monitoring any upcoming kmsg with `sudo
dmesg -w', then:

1. read charge_types
2. write Fast into charge_types
   a. read charge_types
   b. unplug and replug AC power
   c. read charge_types
   d. wait several minutes
   e. read charge_types
3. write Standard into charge_types
   repeat a-e
4. write Long_Life into charge_types
   repeat a-e

And attach your observation in reply.

If the issue persist in fresh installation/livecd, the firmware on your
device may have its own thoughts (?!) and messes up charge modes on its
own.

Thanks,
Rong

> Thanks,
> Raphael Bitton
