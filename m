Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D323E2E03F1
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Feb 2026 11:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771068615; cv=none; b=UqXhliUUGml9hgQHBNxu5IWxjXFFhEjprIjxrW69w9mGiGKNAtDRFHe7AOZQubvvkPYJOjjG407oFFpO8eutF4R+ceTrmnKWzIDztJ9H0+FJLMf7KJW0kwoJxNUkENlzRu+JLmP10czZ4fkaxALGiJxddP2pFlasnCbWccpNbq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771068615; c=relaxed/simple;
	bh=DgbSRKN7obSnFljhOAql/uouw65F/1kbfq6dLFzXr6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HR6HCNoMccp73osm/09kpJB5dpupBrqOtyMicvR0wsaJCVRliHAJorTJa6w7Hhyn2rUyFSyL7uqWa8IWFQpBOUQQh0XbQ1vLVCHecletF/GMakhWN/Y1P23vPIy9COSYyxHNWnPX+0gwS4f+exWl+Xfw+xmnCTQ/CZx37go25mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=oUXEgWPm; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="oUXEgWPm"
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id A867DBC44C
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Feb 2026 13:30:03 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id 2D2D3C067C
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Feb 2026 13:30:03 +0200 (EET)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 5C7381FF55C
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Feb 2026 13:30:02 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1771068602;
	bh=rwMfuQYaR4PSEPeLPspl5A36UplsztesbKyXnQYiYdk=;
	h=Received:From:Subject:To;
	b=oUXEgWPmlTy5hNylqaHhbFvMBSJQ0aCKWSI5qK9vnrLJFbLhFUWzTGvyzIkgDbCma
	 dg+dNLq8aTxGDIOcvLoA4PxZkGc2ktxA6kRMOwjzi2ijHO1MWWKizCPjHFpzxeXCUN
	 o5cm8O9x9paxJqAkSrwN49gzXXCYGn6+HwNrzbn3ZHkUq5bKNZfGKXl576mfcvLHrl
	 sfY5NFz5xEn3JBkYea87pV9j+MhhhGpRjmiekrqlif8QDFeGjbv+j4GDHks0gw4HLq
	 /vD5VpKM0HbXfub4Bkgze8KzlKNeE/+OKn1wxMvjLscPuEEEpa54q0hi9AFg9558UQ
	 JdCsl5S0EQYIw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.216.47) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pj1-f47.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-35621da1a7dso1208655a91.0
        for <platform-driver-x86@vger.kernel.org>;
 Sat, 14 Feb 2026 03:30:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXxo9iuvABL/UsArLfNlGCHI66FAAcVBL9sF+a04m42ScKIz0tVhO7p9myRqQ/+CGdrRGJyIIDDnlnPUXHzYP5UYwiq@vger.kernel.org
X-Gm-Message-State: AOJu0YwFPomD7OgGxOP0O3FELt3Q3hxpzvi6rxinXYSobBs2EDVtFOEx
	U3qnqKzf92ocO5SwX0Iq5NgTTc6Iz9faZlnEHuhMMcdxp2xFlS/jdG83Dk5Yu0ysR9KiVCAWSTD
	a5uR+lx0EG9//vcmt0TagFbZKRxXNnYI=
X-Received: by 2002:a17:90b:258b:b0:34c:2db6:57d5 with SMTP id
 98e67ed59e1d1-356aa3904cdmr3809165a91.0.1771068600982; Sat, 14 Feb 2026
 03:30:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pdx86-pr-20260213202427-653022255@linux.intel.com>
 <CAHk-=wh4hNNVW1o7NEeNiN-Kf=JdTsGuS09y9G1E2JiO08NGDQ@mail.gmail.com>
In-Reply-To: 
 <CAHk-=wh4hNNVW1o7NEeNiN-Kf=JdTsGuS09y9G1E2JiO08NGDQ@mail.gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sat, 14 Feb 2026 12:29:50 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwGZeY_DLrLavoQNf4hH4fKd9chJvHYKFu3LXPXgFU3dXQ@mail.gmail.com>
X-Gm-Features: AZwV_Qgqcm-2bY-DfFIVpvcrRvjcpMqNIn1rNVF5ps824gDxcsVvTr8w6VzMrX4
Message-ID: 
 <CAGwozwGZeY_DLrLavoQNf4hH4fKd9chJvHYKFu3LXPXgFU3dXQ@mail.gmail.com>
Subject: Re: [GIT PULL] platform-drivers-x86 for v7.0-1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jiri Kosina <jkosina@suse.com>, Connor Belli <connorbelli2003@gmail.com>,
	LKML <linux-kernel@vger.kernel.org>,
 PDx86 <platform-driver-x86@vger.kernel.org>,
	Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <177106860279.1881483.4597289151074070130@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sat, 14 Feb 2026 at 00:52, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, 13 Feb 2026 at 11:00, Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> >
> > There's a known conflict with HID/asus changes that came through
> > the hid tree:
>
> Bah. I looked at that conflict, and I just couldn't stand doing the
> straightforward but stupid resolution.
>
> > Antheas Kapenekakis (11):
> >       HID: asus: add support for the asus-wmi brightness handler
>
> This was basically doing very similar things right next to commit
> f631011e36b8 ("HID: hid-asus: Implement fn lock for Asus ProArt P16")
> that came in through the HID tree
>
> So since that asus-wmi brightness handler added a switch statement for
> KEY_xyz event, I moved that KEY_FN_ESC from the QUIRK_HID_FN_LOCK
> logic into the same case statement.
>
> Maybe I screwed something up, but I just couldn't deal with having
> that if-statement next to the switch statement.
>
> So my merge isn't the trivial obvious one, and somebody should check me.
>
> Same goes for the added HID_USAGE_PAGE_VENDOR. The driver had alredy
> been changed to use HID_UP_ASUSVENDOR which is that same value in
> <linux/hid.h>.
>
> So I removed the duplicate HID_USAGE_PAGE_VENDOR entirely in favor of
> just consistently using that HID_UP_ASUSVENDOR thing.
>
> Connor / Antheas - please check your respective changes still work
> after I went nuts on it all.

Hi,
I reviewed the merge and it looks good to me. I tested it and
backlight control works properly.

Good catch on HID_UP_ASUSVENDOR, I missed it.

Tobias can comment on QUIRK_HID_FN_LOCK, I do not have an affected device.

Antheas

>            Linus
>

