Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4394E325734
	for <platform-driver-x86@vger.kernel.org>; Fri, 31 Oct 2025 12:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761912844; cv=none; b=IQchuFK9rfXWgCHMpb4XteFR2EtCB6u1GE9MGDNxC0l5y8X8QhOBfcll/VaOQJSz7gYFxe9JPOGpI6EPeJz1TRICjV+5hOAUDSEhaMEROFUEOuZQZXHQsd+Da7E1SoO2Z6VBIPYguFrYujMBLDYR9KkD2fthOMHfcaotI/obWLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761912844; c=relaxed/simple;
	bh=KAsRDWgv2NXfZ3B+X8i2YPvusK0gxuSGNIOhrjdxmG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n83szsyE5gJyx9y8XIaXc6rWrVdjT51G+XpN9akIPJcqYcjMFWylw2bhVQ7O/cv5y2xDrf621k4WzDyyzdP+C546QnUU4dZv9YUkw4ysOmzo6EnaO5GZTaS8aPNg+6tACx4C9c+GJ6nQeQY9O70Hyeup1oDvUyIescwdRNbHMpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=eT0nrUjh; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="eT0nrUjh"
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 662B1C5C27
	for <platform-driver-x86@vger.kernel.org>; Fri, 31 Oct 2025 14:13:55 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id C3531C5AB6
	for <platform-driver-x86@vger.kernel.org>; Fri, 31 Oct 2025 14:13:54 +0200 (EET)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 12A651FF522
	for <platform-driver-x86@vger.kernel.org>; Fri, 31 Oct 2025 14:13:54 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1761912834;
	bh=XDLMqD7nEFshp2WG4Ildq72xmi2MAqdYc3+r4s9+n3I=;
	h=Received:From:Subject:To;
	b=eT0nrUjhVFveiNfFRD7Pv3eMlLmFmE6wcSEawFuKHm9YQW+lA3S4zi05RP3anCNm3
	 S92ke++BzJnJCF6MWKbDok933QbSIjbpkNWBmMXLIGQKHpSYMaFws0h8WTIOke/xQ1
	 kV19qB+J1pC98qqghYcT3mn36I9CqJOvDbAOYE9gID56XRSokSMk9cGG+oETpkI7Lw
	 I7ggWR3g+HCSk7o4MLsWGw1QrCTy9bvA9zNXGqKCMjpQpmuHpvvqLcIamWYHls3X1W
	 XC/LoKFJRlGfEGZf7i7ZYk6G77fMrvN3fKH/ToSFFme6Qf+6fsJR+ACAAPsrvzxkfE
	 Z2XyETkI76b0w==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.171) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f171.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-378d50162e0so23704571fa.2
        for <platform-driver-x86@vger.kernel.org>;
 Fri, 31 Oct 2025 05:13:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXUumdpRx/5ULyp/NTrwXaLHnc17P2vEcDCdsDWR6QeVxmB15TnhDWt4SKVBfYsmR9t8hr2pI/0KUlpRHCOxc9slwv9@vger.kernel.org
X-Gm-Message-State: AOJu0YwKsoEfsAuzsbLYO3v/dU5UknQaw7J8ehtoTru39eBnQRSrJgow
	uaBantIdWl9E8UkyG6Vax7QEzLxrkK7IyaVxOBQta5MGK6YPyPIPRqJ0mXVcwrKgGrEcSI/cxV5
	wzn0qWNd1z7LjhDQNjp5O7cyJFNVf2ZU=
X-Google-Smtp-Source: 
 AGHT+IHLvg+QVKJLRgPQGaJgLJOka5UXPrAEhFAvF8BSPVZ7o3I8EUXF/J/4/XYlnPpyRCbSAkYX/I4BHhW+qLfd2Gs=
X-Received: by 2002:a05:651c:19a1:b0:360:e364:bb3d with SMTP id
 38308e7fff4ca-37a18cf70a1mr12519561fa.0.1761912833609; Fri, 31 Oct 2025
 05:13:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251018101759.4089-6-lkml@antheas.dev>
 <202510222013.EBLC609m-lkp@intel.com>
 <CAGwozwGDBj2e83JBW71G_z6hMD5PsOXTQLqFVdPKZ6sU54tsGw@mail.gmail.com>
 <39n24387-0o0n-50p8-s2rn-9qoqs6sq8336@xreary.bet>
In-Reply-To: <39n24387-0o0n-50p8-s2rn-9qoqs6sq8336@xreary.bet>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Fri, 31 Oct 2025 13:13:42 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwFgd91n2HnHn0VEL3BTGkj8QCRnp2jfCsMB38JqK8znNg@mail.gmail.com>
X-Gm-Features: AWmQ_blJS4pzpONNbJGbKFFyV7UhrXL_Gbz5apymTl2RdEt79wy1YgZX4ddGWr4
Message-ID: 
 <CAGwozwFgd91n2HnHn0VEL3BTGkj8QCRnp2jfCsMB38JqK8znNg@mail.gmail.com>
Subject: Re: [PATCH v7 5/9] platform/x86: asus-wmi: Add support for multiple
 kbd led handlers
To: Jiri Kosina <jikos@kernel.org>
Cc: kernel test robot <lkp@intel.com>, platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
 "Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <benato.denis96@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176191283428.2961539.6787677734838428051@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Fri, 31 Oct 2025 at 09:27, Jiri Kosina <jikos@kernel.org> wrote:
>
> On Thu, 23 Oct 2025, Antheas Kapenekakis wrote:
>
> > >   1589
> > >   1590  static void kbd_led_update_all(struct work_struct *work)
> > >   1591  {
> > >   1592          enum led_brightness value;
> > >   1593          struct asus_wmi *asus;
> > >   1594          bool registered, notify;
> > >   1595          int ret;
> >                               /\ value should have been an int and
> > placed here. It can take the value -1 hence the check
>
> Thanks, that needs to be fixed before the final merge.
>
> > Are there any other comments on the series?
> >
> > The only issue I am aware of is that Denis identified a bug in asusd
> > (asusctl userspace program daemon) in certain Asus G14/G16 laptops
> > that cause laptop keys to become sticky, I have had users also report
> > that bug in previous versions of the series. WIthout asusd running,
> > keyboards work fine incl. with brightness control (did not work
> > before). Given it will take two months for this to reach mainline, I
> > think it is a fair amount of time to address the bug.
>
> One thing that is not clear to me about this -- is this causing a visible
> user-space behavior regression before vs. after the patchset with asusctl?
>
> If so, I am afraid this needs to be root-caused and fixed before the set
> can be considered for inclusion.

Commit 591ba2074337 ("HID: asus: prevent binding to all HID devices on
ROG") adds HID_QUIRK_INPUT_PER_APP and the extra devices seem to
confuse asusd. Since the devices are the same as with hid-asus not
loaded, it is specific to that program.

We can delay that patch until Denis who took over maintenance of the
program can have a deeper look. I will still keep the last part of
that patch that skips the input check, because that causes errors in
devices that do not create an input device (e.g., lightbar).

Antheas

> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>
>

