Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838338;
	b=lYyyPrzYHdE8MWu8hvr+TN8AcQ/7jAsr7ytohOeeOGXq0oxaHpz6zuLOAWVwrx5sS19/
	 8weUI0+y1pSFJI4LOY2Z7hGS23W4FCNI18V4WeCi+Hut4SKtwQTotKM8C4QY0lPPoNC5l
	 CPaMHGoMVRjWyQ+0Q9PoO0iQw8v1HHd8VP+LdTNl8BBc2B/XBHo117tQcb8dPg3bh9J+e
	 OVOpo6z14+v6cMgq0FKfwl4jg/MgwbZMuKC6YzSKW0sDDvGtevuZw0N4s7RS+GG+9u4yt
	 8z5U89WXDnRDb5ZXwumHJck/BCDYi1HAZg0ueGeob4s8Mpq563Zs0WbCI7ZOVtm8z9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=n0Ta/Vc78c+FsZsmhc0EhlSKcAtCCOLe3sz437EQwkY=;
	b=ScjCoTHxihXyVijEXgOLpQucrtcGADDK+j1p2FIRIDLHWr991IKMInxq9DjRil6kWR9W
	 U41LyqrGHMsg7N6LGcxeW4ieih9h12YXKeUSkX30+JpuLolQmbCkb0fJdaWmiFWZi4PI/
	 EOvRUn3Gxep1oCsNFYC5uHbjm8qZilCK6Bt+Qe7G2h9GlckIH37YciIQOSuccLdg6zh6v
	 iWgrKZQXYaDoRIjtnJYC+qZlSmt1ZdTMHmeHJT+jFuYKNEoRxy9EhIQglT6LDyItgWAJh
	 RISSNkgb2tFJfqj4/1vazYrWTYrkeafpy28gY3q5/XtUa1eVi+GFQFSsGFFYgdXqHXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="h/x1wYOC";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B920606A888
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 14:12:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B920606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h/x1wYOC
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-490585eddfcso2522985f8f.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 06:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794838337; x=1795443137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n0Ta/Vc78c+FsZsmhc0EhlSKcAtCCOLe3sz437EQwkY=;
        b=h/x1wYOCcrTbETEcHLcZduq5U+Y5sqgilB9tHBG9zTyaHLnrpmdqfFD88xC+qG2B03
         QCle/AHOf947HqrOkvQUzYeh9jqhEuz0k4JQsZ/qA3xlMoaQ/AZrMf2JZ4I+aE6CeYhq
         snMV+rDKUmjpXQYZyajKfz3yka77crn6xj5fZUJf8+IqjxJ8ccqvEJ6lxUYxYDKGJwEH
         i2u/Ip7lbh/Hr8BzSPFAnmVw9/brIhGGMB/70ACv3KT16ocCLtlRQA7LS348Btd+EKUF
         PB/8dKij0/nrYPA4cgM/UjvBNXspX6/5rDG1hw7ZC4z165H/3B4sSP7BKRVDZUIG+K4H
         83Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794838337; x=1795443137;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n0Ta/Vc78c+FsZsmhc0EhlSKcAtCCOLe3sz437EQwkY=;
        b=N3cafy4S/r14gL7q5GqJBOYbr4aMGhiZiYx+QhvYZ56lmMLxJ2Do9XXQhumLgClhL9
         KRhLj5TWqMHakHvM+MSVI1YHa8LcaL/F5ocgmTIxMyXNYqCF3VQ4U/vPlgm554m/7B9r
         8GSWmqz7matpfmElgIp33J7nRCoaOyBdzJdOu8eU9SkGBXa3TCXU81Pi62e5XwQl3TuG
         tZDOSNqjUP620Oa41VQdJWn7tSsDwCVkNge3EuUGZdNVuWVeRw2NXsh+z0WXtKdxcKvw
         4Tt6wAIWxq4I9ujGL6/lHYMb3rG4WDhB6jdmK7XoUw7YYY+JWFkbfLu+SOQa1Si83vwu
         7h2g==
X-Gm-Message-State: APuU4Z+J72Op0sePJH39TLcalD2L63IAG3x1wZa+I5vlVHrwFz7y/VpS
	a8SOkM8eKu1507TxhP8c55fWG69LHTiucGxDcgleM3CZVC/CL6Oj/jE8
X-Gm-Gg: AZFdTZeGQyIUABdwKkT18kdMSUu9TjVJTVWyaIxAm+rLtkGOGKyu4F9KY1uDWD4+4ei
	YTZLi3WAZ/sysPwoeMyPeeIs0/JEtba8c0LYTG/c0/DaEcP6II80KqolfWi/Mf+uYoPhBSPGKw6
	mDWPu1P7WVF1FDCbXk+fkroUv3HqLIWEKGOwgZcFf1uYgVPuyCqjMBRp+ubazhV9c0z4YMhcKRD
	l9U3kTZfU10jpd/JnqqNhLHt2XRnrUrX7RTUIC5lcsLW4fpoG22U9veZLxtMfwNDXoQdSqOVzAv
	EMoM8KFb2NCkjLUe81OcxpWUmZVpT+20s5ti1plih//WnZ/z7dfiIHKISdg7Ef5eRzkiYEYStQy
	ik/d+vF4SRY77pvZBGMJxaj4VcCMFMq4dQjcI0dSxqpVkS80I4b4/Ge+fraNfUrKJ5GwmVyPCB3
	jz/PgNFTZ9n5shqdvtawKdSZmUVQpcsblJqJBBDrlhpTTYj1/S2SSkbw6AqEsAnQMtHAYHaUcea
	iwaKkxhNsi7z+zzofcxsmrOGWAg7Nenui8rmdTi6mJwjXTKrqCoGnAzyc/95OdRcGY8/BPx4AnZ
	cOO1cH0NfSG6iT6rQHi/3zM7uyCwKHxGl8cTDk/vBhDUKxjSRviG7dt/Iz30D6ndc38db3A3VF4
	S6x5Y
X-Received: by 2002:a05:6000:2388:b0:48c:414f:cc12 with SMTP id ffacd0b85a97d-49c72306b9emr22056210f8f.40.1794838336629;
        Mon, 16 Nov 2026 06:12:16 -0800 (PST)
Received: from B87454BG30364.retailmedia.com (284035233.box.freepro.com. [82.96.134.200])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c60da0a03sm18096212f8f.53.2026.11.16.06.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:12:15 -0800 (PST)
From: Erwan Velu <erwanaliasr1@gmail.com>
To: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] platform/x86/amd/hsmp: Add /sys/devices/amd_hsmp socket devices
Date: Mon, 16 Nov 2026 15:11:50 +0100
Message-ID: <20261116141150.667950-1-erwanaliasr1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <73b9c9a8-479d-4a5f-9321-2e095f11951d@gmail.com>
References: <20261007125908.321186-1-erwanaliasr1@gmail.com> <20261007125908.321186-3-erwanaliasr1@gmail.com> <73b9c9a8-479d-4a5f-9321-2e095f11951d@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/1/26 18:57, Carlos Bilbao wrote:
> Is this over-engineering it? The platform driver already creates
> /sys/devices/platform/amd_hsmp/socket0/, socket1/, etc. they're just dumb
> dirs with only metrics_bin inside. This patch series ignores those and
> builds a whole new /sys/devices/amd_hsmp/socket0/ tree from scratch with
> root_device_register(), manual refcounting, etc. instead of building a
> parallel tree, upgrade what's already there. Turn those existing socketN
> directories from bare sysfs dirs into proper struct device objects?

Hi Carlos,

Thanks for the review and the acks on 1/4 and 4/4.

I think the commit message did not explain the goal well enough, so let
me clarify it first. The goal is not only to get more attributes on the
platform driver. It is to give userspace a single path to the per-socket
metrics, whichever driver probed.

Today the same metrics are found in different places depending on the
platform:

  - Zen5 (ACPI probe):
      /sys/devices/platform/AMDI0097:00/
      /sys/devices/platform/AMDI0097:01/
  - Zen3/4 (legacy platform probe):
      /sys/devices/platform/amd_hsmp/socket0/
      /sys/devices/platform/amd_hsmp/socket1/

"modprobe amd_hsmp" does the right thing and probes the platform or the
ACPI driver depending on the system, which is good. But as a
consequence, userspace cannot know in advance which of the two trees it
has to read, unless it walks sysfs to find out.

On a Zen5 system there is no amd_hsmp platform device at all, so
upgrading the existing amd_hsmp/socketN directories only covers one of
the two cases. A monitoring agent running on a mixed fleet (our case)
still has to find out which driver probed and use a different layout
for each.

That said, I agree with your point on the implementation. The separate
root device and the hand-rolled refcount were the wrong tool. Ilpo also
pointed out that kref.h was the right helper there. For v2 I would like
to propose the following:

  - Add a device class (e.g. "amd_hsmp") and create one socketN device
    per socket in it, with hsmp_sock_groups.
  - Platform driver: the socketN device is parented to the amd_hsmp
    platform device and replaces the current named attribute group, as
    you suggested. /sys/devices/platform/amd_hsmp/socketN/metrics_bin
    keeps the same path, so nothing changes for existing users.
  - ACPI driver: the socketN device is parented to AMDI0097:0X, and the
    attributes already on AMDI0097:0X are left in place.
  - Userspace gets /sys/class/amd_hsmp/socketN/ on both drivers.

This removes root_device_register() and the manual refcounting, and it
lets us use device_create_with_groups() instead of building the device
by hand.

Before working on it, I have a question about the AMDI0097:0X path,
which I think needs a maintainer decision:

The telemetry files on /sys/devices/platform/AMDI0097:0X/ are
documented in Documentation/arch/x86/amd_hsmp.rst (since 511a4a5ea2b6),
but there is no entry in Documentation/ABI/. They are tied to the ACPI
device name, not to the socket. As far as I understand, the :0X suffix
is the ACPI instance number, while the socket index comes from _UID, so
nothing guarantees that the two match.

What is your view for this path?

  a) It is stable ABI and stays as is forever. The class path is only
     added next to it.
  b) It stays, but the class path becomes the documented interface,
     with a Documentation/ABI/testing entry. The AMDI0097:0X files are
     documented as kept for compatibility only, and we would propose a
     progressive deprecation of them (e.g. a Documentation/ABI/obsolete
     entry first), so they can eventually be removed once userspace has
     moved to the class path.
  c) Something else you have in mind.

My preference would be b), as it doesn't break anyone today, gives new
users one documented place to look at, and leaves a clean path to a
single interface in the long run. But I would rather align with you and
Naveen on this before sending v2.

Thanks,
Erwan
