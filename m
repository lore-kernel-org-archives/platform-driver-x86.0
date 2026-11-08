Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794164398;
	b=kxwAl0AGRQIpU12vb/aHi3ErY+AumCopfZ2fPh754rVV9B2yf0rTSwzxpx8Wz+nU3orX
	 npWeQjMHKlGe01/8akTjDaqT7KmI0z7FXLQlINlexOAd4prsykDUB1z8R5Wz02oOrljCG
	 UIRl/F8hueceeWxqLSfWDsknSQp4qwfQ+qdhXlQ1gtCMDdtm/VrwNjL0BND1HyopFoyVU
	 QRpjaDghE04jwuTbkjnGFxZs3/canGfUA0BkUpZMCbVTbLbZXXv/qlqnVUZccBhci0xnV
	 RK/UVsV2dEGR/1Nh0vDoS8N6r4KSGSocAGemz8xeE4bpvdWoHcS+ICGB5pjswX1v4Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794164398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
	b=Z06TPSCVzJ9H2Qa6vKTM6RDl9/vxoLesx8Y1ovMcSrzkZunJ49GdOLvXkk5rao00k/0p
	 Fupils4aXcHAgcFn6Eay1WWfM05yzKp05XaFgTIC7VNc/XY2JNkZdWfgUEbjaLgh83vE4
	 lFP3Hol6VTYFcCd86mOAH3SWOK1opbvzUwRtpREB19W/9pOFG1Fm7dJfgod4jL04Z0m9K
	 3Ew4zsrY/Q2K8yisSMVL0M9dvFo6t8ULPYMdwWhHFggRUbidqSP8KiDwW317ONd1VlZZK
	 7bTjllZ02z33G0cP7oaboTXpzYPnag/EZn2lyRTVHoMY3Tuxr33r6Vjk7ISijoRXFIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XrEUEgHU;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F8F606D806
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Nov 2026 18:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42F8F606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XrEUEgHU
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso1791445e9.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 08 Nov 2026 10:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794164397; x=1794769197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
        b=XrEUEgHUwv+lt2Z0T4RzlOQuYT1yMbnY/MJrtF5HY2pc8m0ujKE+1IGJbqc3A1SsPJ
         Pz+po0Wh7ECcrOl1hyNdZBme+OsO/r11IeCA1lW9KMbstFhlOkC0Hm7Ef+TTavGsfrDk
         7T2AE8nlcorDhYFpLo0KTCt4xOv09AacMRilfH2h4PS2mZ0iBReAF8XAcgtI3iT+qlRY
         EJQPYUIUlDRCCjadf1+24R8V0flZyhCZpLCroCVsidoQ510350k4POOaAcSXgGRrBTWF
         rbpUnz5O6K0TOR8uz/zwLHiObwDAqnCJFWP0+ssCNYCBYnXJwQ2yMfUqdKkv6ro/lp/q
         XMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794164397; x=1794769197;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
        b=SLKvG+x6hEqStcyXNaQm5XMnvbjLH+5GXrpBZ0SYYnQINi8Ow8CJuEdqG7glfIshnA
         jHq5GTt1guwXvfEIqz8Qfy3/bL89v/lGTinvSgVex6XOQ3UiQnyj9gqyl/k/Y52zD8ZL
         3nEpHXmy7HsPzoZQ9axhKrt459Hoy6GD3rOFsdjYWVeXzXdkRyCbj7iBeYYlNK23jjZh
         uWWTeAeYcJAkIStnuK3zCCxCJp8YHtmTe4sqwZ8GYcw/x7J4s/AHSsDnweu4soeX6Z5X
         oD8qbQTfZief4V+gXA0Z850y1k7gxAulwSzM3eguM/oOcPzHqirtM2bB0poxL9oTNjUi
         kdxQ==
X-Forwarded-Encrypted: i=1; AL+hErGUcvOXHf5NLYC11mFiXd7+YhNbRRWRZCV6b8BbFb9nM/Hivs4Ty1uO4YmMhnnSH8cjQ/RHXfD2glWztnhouo6c9sg2@vger.kernel.org
X-Gm-Message-State: APuU4Z9LX4XIKh37a9MvA9NtGK+hOP6ktiGaja1nSk4pHNhUO0hdM+E3
	r5iXetVJ+e2YojGD8+CaHLqSBJ+wSjBSmnEoWIG191xAOaURGKoQdXFF
X-Gm-Gg: AYBFou1SZsrRv6LiSplU2xftgqTYcowf51YwH823zRvfcYNw3QbBBE8WdjjlAtLko1H
	hZDwq2I9zyPu+/LzS2KMFnr5AdXrsx13asRkIaZh6EhMCu9n0SiY6WfqNNNZ84RuUg3tAITpvEQ
	stIefYGC2Eb9yiwRNEDv6H7IpyUE+PzcPL6GPpVD/ef94VsTLR2+ErQuOnoLLE4GEjqR9lD5ydm
	/rcSxvbT7vxmQb2/foSM1vjXhRlAWYoy50YVsntY0KJEZSFtT5aj+vGHL+IPSWFvMtGoQBI+HRO
	HovyixuOGX2lj7ky/OTPWQqLuFXeNe4xldAq1C62W5eAyyCbFYQ+Yv51VbOwsNwJpWdEW5a7Ozh
	K/tT81WPJr4uImmDwDo8fNbzADdhgAnJFh2nRAMrrV54/mimTJl30HRjd3Tz4vNxcAkc0k1LHFQ
	+PC3xAbqnDcS11FiSFYWEtUJFjfX74RKP43KgYTTSPsOo00Dy0/M0fDDy5Zq7+jvjtOsZONlnWK
	h/BMH1QbgQzKqA5IyLNRcuKJxJz50pYYooW9/lGqmY+4xvs4DQbkxyXOFpwsksZ1qnZ0fj9MpyF
	uFflFekKeIF8tjvVNXqL9B9FNl+YiPqpwNopnu9fJdJsL18+4Q29HFH3tmhZeBO+
X-Received: by 2002:a05:600c:468f:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4b960d9b170mr35982125e9.5.1794164396406;
        Sun, 08 Nov 2026 10:59:56 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1f3acsm185228445e9.14.2026.11.08.10.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:59:56 -0800 (PST)
Date: Sun, 8 Nov 2026 18:59:53 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-fsdevel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Jann Horn <jannh@google.com>, Josef Bacik
 <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, Jeff Layton
 <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Eric Dumazet
 <edumazet@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Al Viro
 <viro@zeniv.linux.org.uk>, Jonathan Corbet <corbet@lwn.net>, Christoph
 Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>, Joel Granados
 <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, Jan Kara
 <jack@suse.cz>, Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-um@lists.infradead.org,
 linux-wireless@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 netdev@vger.kernel.org, ntfs3@lists.linux.dev,
 platform-driver-x86@vger.kernel.org, coreteam@netfilter.org,
 kexec@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net,
 jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-mm@kvack.org, linux-sh@vger.kernel.org, linux-usb@vger.kernel.org,
 samba-technical@lists.samba.org, sparclinux@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
 Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-debuggers@vger.kernel.org, Chuck Lever
 <cel@kernel.org>
Subject: Re: [PATCH RESEND v2 14/23] proc: let procfs copy in writes before
 pinning the entry
Message-ID: <20261108185953.28054fb3@pumpkin>
In-Reply-To: <20261107-akteur-gemieden-eckdaten-21304d085e35@brauner>
References: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
	<CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
	<20261107-akteur-gemieden-eckdaten-21304d085e35@brauner>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 7 Nov 2026 10:48:35 +0100
Christian Brauner <brauner@kernel.org> wrote:

> > While at it, I think it would be good to use this conversion as an
> > opportunity to replace "char *" by "void *", which will probably let
> > you drop several casts from users.  
> 
> So I tried that too. The thing is it drops exactly one u8 * cast in
> ntfs3's label write. 

Since char is now unsigned that one isn't even needed...

David
