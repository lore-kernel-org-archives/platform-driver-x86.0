Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872834;
	b=EXvfb7CgAwNGb3L9z8diJ1Sj4n8ISs71saJI1GL9T5RPiiqRqIg5iKzb81zC9qV9kBEV
	 dJOte84sHnuVG5tW5fLr2kG0KKtPHIXZ6PDklb9n5c+4U2TCuP91Lm1f7pTtw20GhbsEM
	 tpY7rA6A2+UiK7M9+mfWWz+UdI/m58ThIdSfn/i2jrIYizY3ta7KWyfBM1KukAwwM9ExG
	 gBKKZpXbj6um3Va0/u9qUDPIHAE0Xc5+hdVDZ06fHBFe+5knqpEScz90Y3ctfOx1IsMxd
	 VVCkW8xtkTXygFLjByAxACiADVnKdcNSaGCqnzuGxYde7t4ORzFbJN+/pnrmNV2uOhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872834;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=n+1lmuZTLENNkpqKh8T8PUriZ63OKZ7RGcjsYNzzAGM=;
	b=FatV09r1AhE1roK5h+mRuLBDlXUOxsDnW4m+vO5LGGZPUGKkUtR3ZjY4RfF4iX3WLfad
	 WOJALSHXex5EBfXYD6FdsuTeqzwM/Jqq5R8z8Y6fFbaIFtzkuv39FGOLnf73QPvzbWagC
	 w9RlCYexRAHFx8RycyhXQTs+ghb5wOejCvsilsJQutJOLKPIDyknCVgUckNUXZm3YN2of
	 T4CsHP2SL1nVg9Pc8f/rGC+AfCwaDRKus9vA24pLDexS1naxtIJ3eS9Ii20JBHsbbz+qo
	 kMVsDTRNjctql+z8jwVVitGvHn8jfBR9nSGI7UVkpXPj7hV/ukUr5exQT/3oz3CDEwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23B8606A32D
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Nov 2026 10:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F23B8606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-93f3c8958d5so188148885a.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Nov 2026 02:00:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872833; x=1794477633;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n+1lmuZTLENNkpqKh8T8PUriZ63OKZ7RGcjsYNzzAGM=;
        b=J+x291QXB7WvoSU5ymI/IuZW5aBITuEkFjulSFSB8Kh0HXHPKdX93bDQVGeXKGw3Qe
         bp9oMbdswRpTTLgg2VAeHqJiRyFBh5AYEq3v8hyXD4QcO1ad3zEAiducn/30hGqhAQ3G
         hFAx4TZeK1RCSNcPrLwnCaLoTHKbmJz9fNfldH9xmndjR5hRMlBb/9ptwXMP381Ca5Je
         vWhwO2qdiSV3z1sEvL28+ujtfdewIJBccVWXdPy/8qgNC+mX00q3fZNCGawLeBGuqTD5
         3SYXP8oIbYD5lUNHQRn1oFH1cQr9Wrn3zm7pUxOQi6PZLulGg468KeEDVZYjbwnI3ap6
         Er8A==
X-Forwarded-Encrypted: i=1; AKwUvByfSw54k80esx6iuOG5lSsPaZsUYMYdZAWoPfF9B6X01uKHtHVrcDJPipXJhqTy9F6jCJozlc6m5PynsuRC6baeXFn9@vger.kernel.org
X-Gm-Message-State: APuU4Z/a43HRAiS700/m2hI6Ql6BoMcJoYdMSTlWgJY2+gDhOqo9XpyM
	53UFuHgJsKDsAd0+DB7hMcLI9MHRjYVKoW73qxwwgYRz/rnDp/9HZRGWFD27uWJN3DA=
X-Gm-Gg: AYBFou3+Te5ippRrWt1Yq0VVdfQoCpGNJJYGsOlZ3K9MrPpEks7Pda+W73OqEtkuYOz
	+fZ7MLhtf/HBno/GygVZkA2ltADJ9KZLa48vBsvgkfcAFPm29/pAxYwLMIROYqBfz3oeI4oOfgf
	Sw/M3zqg5uI06UyIuu71p5sXHfXS1k2lbZ7X3RV/OE+EUyCP+NuVPP5+jRcO6RgyLR/wTl9LvNN
	PM/UuDP0/CYqAOtyKvXpCJ2eYtsfWJmEh23VtI61gUjhX3x0pfnDiZHH+FOnKvMwBYp/8/ZmVsH
	RvPX5ernpTHadumey0U9hoPJHrzQRUgX1QPrBdOQ4ZXAURGmpRuYmxOM8QD2VaDwMdkHHWC5h8e
	L9cZt5s64jvg08fu5QYZOYAwEvCYAsDiSCVvB77gL73jRdlsrgr51yPSCr/bvYmMtHm3m/YYt4O
	ag+2TR2X7cTZ49neFSxwWbJQwRSHf4YzFuy34tD9mmoFjjDzDEyR9krh01KPsI7LlL78cykh/aq
	kAJsXRYrt+qGK2O2z9Rd+Ls9MuFh/cCHkj/Pc2V3ywNGwSOOzyRJBwLND6htFx9hQMi8pGib6Ur
	IRBm3CgOtX3SRyClPkgfCL/pm+RJLGNVrdurW41KYDdrv1a4wN72S6Im9SP80kT2s5+F7A==
X-Received: by 2002:a05:620a:170a:b0:93e:bdeb:f067 with SMTP id af79cd13be357-944216cc773mr3215226385a.48.1793872832829;
        Thu, 05 Nov 2026 02:00:32 -0800 (PST)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com. [209.85.160.176])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d479e107sm425350185a.7.2026.11.05.02.00.32
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:00:32 -0800 (PST)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5365f9a04c5so23565831cf.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Nov 2026 02:00:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzTisr9BSxqvqurmBzNd4ENA5rziD+JtmHCTCPcEDXbIiv+c5Hkp1Z7otnHHioCDzwiiTbSwMVTlrgNvZhjU2dOUnHF@vger.kernel.org
X-Received: by 2002:a05:6102:6449:b0:7cb:bc5e:7dad with SMTP id
 ada2fe7eead31-7d072baa450mr7614890137.10.1793872492413; Thu, 05 Nov 2026
 01:54:52 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-arch-v2-0-2aeb952c9597@kernel.org> <20261104-work-procfs-arch-v2-4-2aeb952c9597@kernel.org>
In-Reply-To: <20261104-work-procfs-arch-v2-4-2aeb952c9597@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:54:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUNBs_NyhFpXonirMXkYptUWsAizMvVpGHUDLzto1LGJg@mail.gmail.com>
X-Gm-Features: AclHuK_RsrcE7hVRjmpZezBV5tMd490Mza2XAQiqUTgUNqAiHAzRP5z7NIbtMh8
Message-ID: <CAMuHMdUNBs_NyhFpXonirMXkYptUWsAizMvVpGHUDLzto1LGJg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 04/23] m68k/bootinfo: let procfs copy out reads
 of /proc/bootinfo
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Jann Horn <jannh@google.com>, 
	Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, 
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

On Wed, 4 Nov 2026 at 20:36, Christian Brauner <brauner@kernel.org> wrote:
> Implement ->proc_read_buf() so procfs copies what is read to userspace
> after it unpinned the entry.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
