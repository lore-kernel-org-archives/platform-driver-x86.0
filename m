Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794273722;
	b=VDeEvGHAgdhJmhLoJ6Sco0ASbAwoDzEbsLJNC9IRLmHX3eMttH1/B3DgiF5yo7ETWB0Q
	 CjinbXaTLYg0/h23w8GQJlq8qx1hFZRuV6TEgVbRpoK9C/gJ3dXt6KwXSXO8Sl3v5tBUo
	 ru37JjkBhx7PnMYvlMqtdGlvfiplYt7nj2/6MlI3Ww0pL7OGoQ0QdS/TvEQ8WdHWLDEMn
	 59H+vl98FS3mg8Es1dauFeNhilhqoOKmKDSLM7GDYi2sgmMQPXffx8957CNAz1fFUXjFI
	 IS37oidLU53e5o21VyG2+U2t7NFe04LttPghkKMvb7Y0XdN7CXYXrHBv46yJ7jeN59A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794273722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
	b=a+RgDHrP6p5RgjbqUrab3O2WaqX4iz3AiWyKsaWXiu5J9XbornY4qX4R8FGBw34DEzto
	 SkAIYNbXpyQTfW/Djwb23jX7pHhclnAZlCycQisMGBhS83mUVTbPRl1ibYZTDzPylBIPA
	 a7oiPkpS8saxsEq9apdxxDtE/gc0ABLe0qB9i/J1ECy/XyrRSs7SKkPeO3Jrb0yVfL7fR
	 /StdplBlKg1fEMQQerPONaGyyb7oeAR0C8FfIOtRj+1jbaSXP9XEo5ksmcj6oqGRiRfPB
	 xdIRjWQFqqh0TVKEJWjUnGTkpRaFHR2124RxnTWJfuxqiQ2WEyBhhD5pemQ95m8LZIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=TBFrmlHY;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B5060A3814
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Nov 2026 01:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7B5060A3814
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=TBFrmlHY
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so2143057a12.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2026 17:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794273720; x=1794878520; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
        b=TBFrmlHYwDfLU0AJVqyZJ5RjobSslpX5tFH8G+rYdIWboovRjdXRQO8ix9uhYwMtOw
         CDZtAg51Ubu+eSowuvYRDsdx3hyWrZbYsjvVlx7zcCRvEFo2AjdOrKSLMYxQJTlqFSy5
         TLuAQD1Xqc9hKShW2943/wm2lErNTVd6E8PjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794273720; x=1794878520;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
        b=mlNAsmyp7akV8wXNMe2ODWHWwqM6WemQxpM2acSYTahZVp+Ko1Sn0/+oNIXZlcI7PK
         mUfMblYdtn8UQ5pFfpxWxL+S9iT+3NsE3Ak8CW0uptwv9oTMNCNcuHkvG7vkxW7Hc7lK
         lXskmseztciCsuZGWa+3JwSE05pfw74b4sbQIc3fXge2to3Ovq5yHnuZ9LI4IvpLFTFU
         7mpvtR8sFOr+kG3WBTL1mIWXkV17CoVkLQbdOhvQ1HdKa5H9f6vxVn/Mm3BBgeW5LIJj
         ddTfeDvC9G97k2etUjKJ1L8XakM7kCR8KkBrRjpA7B08zm7+vt/3abHCaLa3XWhpiQcS
         G5qg==
X-Forwarded-Encrypted: i=1; AL+hErH4iq9P5cO2Pz0TVLRRo5O7DDCwHBRN0MH1VTzM9oQ4hYoUwLo9R6y3OLk1+SkITzwtRh7EaZ+xxIVt+anlGUv+pu7q@vger.kernel.org
X-Gm-Message-State: APuU4Z/WZ/WtMJrtu0LOV9WBbn/GR4dylHMEpF0awOt5bvIdKjZcjzJK
	ZcanfaI0zraIN/kbDKMB5xosRZG+lxzC6aBL7Kc9vwUSu2zdcnu/iROgjD2+LAn2pOtDK93Yvsl
	OuCwdbcgU9Q==
X-Gm-Gg: AYBFou2Sh5QzLaVtqqiKNdJIqq/n77YlfZ0SbVmAyWkCgMC8BCPGXpJis4r4ElEqDdI
	tszO5saNckWevXNLkYSlz1SOGznYOZm9gDhXyfElKq2DYLDwwBn4RxjGdJHtkVY0+tsW8PNvJLF
	ieOcMeS+Qx46LOoX6WyoM1iGiRDeSUr42w0g4pFSw91/vLp+69tOcWCyBAW5IEEoYwN0yKrrAuK
	HPOAFsJ5fwGHlDs+p4juakx3fnbx6w3Cf/J4BEO9XBSyG0E2GjVBdvrvZu76rD5JFyd3iP4kG9t
	A4s8TP/c5cLcMHMzNckWK7YccRXc/3l5cGHm90beE7ZkevOQg9LZxS3ErXP7K4QM5YtlZ7uvyiw
	nAiKRhcHCzV5+spK+MjbOCFpaVi/5YAkFwnzJILap9DRR1U2S63SvnFvWyAYteCA5jrC2n7iizS
	iH8gh+soMPKGO33HAN0DMsxh899wLXkWPE7B2uPgM2gaHWJUQa8F5ySy9E/rEH0CJeOXOyZyRkl
	a6QYwmXzGA2xAsECrmRVE0gFsctcwVIU8wcZU+du5tj+tpa1dX1IS/eSsbvzY4/Q2pKoqG7hCm7
	mQLDu8+zEt5K92MGOM4xth3+S9ILQ3njbtGq/N9nrTjStGqUHwuTCxapeoydLxdxzemcoYyprlT
	Mos5/WXx/nQoWNdlh0++ZsfVy
X-Received: by 2002:a17:907:ea8b:b0:c29:f5d8:9c73 with SMTP id a640c23a62f3a-c50496ca6a8mr75659066b.34.1794273720242;
        Mon, 09 Nov 2026 17:22:00 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a6a409csm40240366b.85.2026.11.09.17.22.00
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 17:22:00 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c450ab1483cso245884166b.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2026 17:22:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHaQywTR5mF4CA+6siwE4DBJAY8Zq/zsK5APhVccFj4HL+4OHcv1N9EnwOLhVtXCwhpYhcc35r6wg7dQ66qE/ynsju2@vger.kernel.org
X-Received: by 2002:a17:907:9451:b0:c41:1750:59a2 with SMTP id
 a640c23a62f3a-c50495dfbd5mr87253466b.12.1794273275844; Mon, 09 Nov 2026
 17:14:35 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
 <CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
 <20261107-akteur-gemieden-eckdaten-21304d085e35@brauner> <20261108185953.28054fb3@pumpkin>
 <alpine.DEB.2.21.2611090504170.17804@angie.orcam.me.uk> <20261109214558.0d9d5228@pumpkin>
In-Reply-To: <20261109214558.0d9d5228@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 9 Nov 2026 17:14:19 -0800
X-Gmail-Original-Message-ID: <CAHk-=whsA3tKcUCBJDj_vmJ11rVGT9rivgnKjGRgMO21CPmCxg@mail.gmail.com>
X-Gm-Features: AclHuK-x8jcOOQUqd2amGoGEAKER9jIFGaeL4LxxWAd0cGV7dz_RR64PtDogpPU
Message-ID: <CAHk-=whsA3tKcUCBJDj_vmJ11rVGT9rivgnKjGRgMO21CPmCxg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 14/23] proc: let procfs copy in writes before
 pinning the entry
To: David Laight <david.laight.linux@gmail.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Christian Brauner <brauner@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-fsdevel@vger.kernel.org, 
	Jann Horn <jannh@google.com>, Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Eric Dumazet <edumazet@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>, 
	Joel Granados <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, Jan Kara <jack@suse.cz>, 
	Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	platform-driver-x86@vger.kernel.org, coreteam@netfilter.org, 
	kexec@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net, 
	jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-mm@kvack.org, 
	linux-sh@vger.kernel.org, linux-usb@vger.kernel.org, 
	samba-technical@lists.samba.org, sparclinux@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net, 
	Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org, linux-raid@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 13:46, David Laight <david.laight.linux@gmail.com> wrote:
>
> Just that the cast would have to be:
>         u8 *foo = (u8 *)bar;
> where 'bar' is 'char *', and I don't think you need a cast there when
> char is unsigned.

.. and just to clarify: 'char' is always unsigned in the kernel on all
architectures since commit 3bc753c06dd0 ("kbuild: treat char as always
unsigned") back four years ago...

            Linus
