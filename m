Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823031;
	b=Hr/n+9e1mK9ZO10f5LzL3Fzfg8WzydtkUWh6ZMCx2C+mj9j6ES9tokIgC6pCmM+7k7e1
	 oN8lDVB4mpe6mr53d1DXClu5y4szYgxPOYilLde5Y556qk1qINl36qIJ9lFBD3zI0UIR/
	 GlEq/AaM2VCpgX03yI7AIL3opg5EX+5+HvDA1U+IOoGnnnhLj+N216V9+/4Efhzmxh46l
	 oAPYQFAryQoEEC9eP+hjHXiLJdFp1a5HAvt/g/3d1am1wmyTn0ggNLSPpg8mtBtYz2P52
	 GUfRHZYJQLbR1QCZFllaxfv/mQzzl47jd54VsAL5PmK5VDTqCL5c0HDHCvu6lrLnhIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823031;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=LCqiLHf1DIbfKNXx3ccWkvqxBhOdwo3yYkazQxIGarg=;
	b=XLo43HIrfXF95vniu03XfIZhOVTqNlS9Rh9/B5crPb7AWZXXJn9pcXVIwRwvYclN+TZ0
	 BLMvJHgstw9HLoawVvfuhWC2jgrm7PRXZRMtN4BovS4tNyOWrU8eyyJAv0blKzjcAtSn+
	 F/JDuvUR6BkNrTWHfwLRiEqptasBA1u7IyY+Wa5njO2s7B82i6sx9cgWGw/T/T5caig11
	 pab+7hRwECIsK0ETDZUM64y/6L0oKWttpVf7spc+aDe8xv3etTZXulZA5MICpTSk0EQNx
	 WrzBQ8J8WN7ukT07HF/TeDmwO3jr9FWdRjRqkM1vu2Bjs5sGF5kz6al/7nIWCXMr6pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=WnaqQ0wa;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB056070F1B
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Nov 2026 20:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CB056070F1B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=WnaqQ0wa
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4550d8ab15so176662066b.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Nov 2026 12:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793823028; x=1794427828; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCqiLHf1DIbfKNXx3ccWkvqxBhOdwo3yYkazQxIGarg=;
        b=WnaqQ0waSeddOOPhKf3izxnFGo5VJ9Bv2dht4oPss98xhHBCb+3EuXQVkgEQdIScXL
         TzEnm2CvvQziYDneb1+U9QvdT/wSDVIW4XI2hULZlvFgurBk1+KITEHtqpsx906eL+LR
         QaELQLXwRAid6M0H01tziQLSayJLFtqh3DIlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823028; x=1794427828;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LCqiLHf1DIbfKNXx3ccWkvqxBhOdwo3yYkazQxIGarg=;
        b=2rOIqUETTIOfkCtXuNrt1JLOZfCEYrnmaHigHeviWnhvD8thOxJhDoQzS/s1CgnNNS
         M84tyLRzbv4l3006nThxpXSyIJ+sqKZ+gOjIK4kwuDyjWDCyJLAK4QOILrFg+O8i6y6d
         Y/+f60vpGimvwe3g7+EEyVBapB6BUos8sx1F7ZGfxKim2eyCRns0HiExycO3JXj3o6fx
         IlCxPn+noBy/RkjMvoVB6poy6WeWzx5jO/WvJhx2337vAfPg9GL5JY6AKr02cq16Cr++
         K8YFQ8lLtAUx0qM1tXAtWvnlBpV7TFaUNCxxJInRs1aIrBbnCR1y2F6rr3swyk/OhxCr
         v91A==
X-Forwarded-Encrypted: i=1; AKwUvBz15VCug0aCq5OUmaAE65Qu0/abxTwfL+u4zo9bSLfTcxjvWZPQJ9204yxzeqGuiaQKAQzesE9ZbJmI8MXxf7/ZDwuR@vger.kernel.org
X-Gm-Message-State: APuU4Z9+MCy7gK6NqBtweDTHb03xDYoLnQQeuPZtrrJJIUORvDMKe9rS
	ir+mKpIUHYpYwSGYY9FE2VgleKKjXW2zhBT2gBAUaDTjIaaO/ephh4u56ASRwr02Ca5rWzYgJoU
	KNmMfg6XwzA==
X-Gm-Gg: AYBFou2nErhDUPAGgr9P2iw2F+IqH4TkXBHe2iYSUoe9IBqt5SX42joJxj61LUM6yc+
	Qq3gR8zztjvhR1cxPdrl/P9RHeAWigf44df+6W3esI2uj8mjX1S+EOEeEA+0mduDyOcsOeENwBo
	YNeppBp7+1SD9vhxu1Fe+elfYlYGDyeCbIi1AgcY5HfsgtQBeAKrirVO8BSG8IS2wlwPtYU2tws
	W00bc6RqbbrvihdQwwaRo7BaRiHaWU7x1we8xpI8Mh8MNeiTh6MWAtAT3dKDBLbbCUY1qQpCcHV
	Go74nHNnqdm9WbZRMnFUYV3Wa7IUHGvRu0EnYkjIK1wEAMN0L32yYlJGZ/TWdfDvyo7Rc6K5GoW
	TsA3tNlMi7WCW9/gFhWcJzbbqVxH5iXmvxeGHIHsSCy4qn/QMn/IrIklcxZGaLyt3eM0iT7NmfY
	i5eODX1yy3WXr6YAyf6J39LWA09O5+oXpMeA5fAHN/lOuwGj36EhhSu1LM9ODYWVoYZnhab2bcm
	0H/RGWK1zOHDywkDZ64/xiLneB1Crc9Z0zJVMjacsf81Ax72k0/iKFC4yzM8IAc8jZHGXz3ssHe
	NfdNGpZ9a7KTeH1UlFejVho/uvhpqYGpwXBNjuL5DST49pskzHu2Du2Fic5Nc2WlOy/cE6Prw4A
	GyA==
X-Received: by 2002:a17:907:3d91:b0:c3f:7ab8:bef1 with SMTP id a640c23a62f3a-c4ca7ac570emr1595310266b.34.1793823028324;
        Wed, 04 Nov 2026 12:10:28 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e140fdcsm105088266b.12.2026.11.04.12.10.27
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 12:10:28 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b579003f29so80333a12.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Nov 2026 12:10:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBw7cXUyspL4/KUI8nrTYVWx4YaZURvwb1lIKV+UZMaXKZZaotdR8q+fBijqrTrMW2OK/ZNV6+kr63KkCXXEPQYvjnDG@vger.kernel.org
X-Received: by 2002:a17:907:60c8:b0:c49:a4b1:9cb1 with SMTP id
 a640c23a62f3a-c4ca795fa50mr1973235866b.3.1793822725121; Wed, 04 Nov 2026
 12:05:25 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-v2-0-b45cd5789ac5@brauner> <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
In-Reply-To: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 4 Nov 2026 12:05:08 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj9Y9NcOesBBm+jhPjYa7qO00fD7g7uwX+H-k0-R2difA@mail.gmail.com>
X-Gm-Features: AclHuK9j_YIgrwhhpWOlnull6heAULBd4dgTqoOhUQQjFm_MgoIgrL1vgPfefvI
Message-ID: <CAHk-=wj9Y9NcOesBBm+jhPjYa7qO00fD7g7uwX+H-k0-R2difA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 00/30] proc: convert the fs, kernel and mm
 entries (Part 5/7)
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
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

On Wed, 4 Nov 2026 at 11:49, Christian Brauner <brauner@kernel.org> wrote:
>
> Part 5/7 of "proc: move procfs to what kernfs does", on top of part 2

Christian - way too many patches, re-sent much too often, cc'd to way
too many people.

Nobody is going to read these repeated resends, and all you are doing
is clogging up peoples mailboxes.

             Linus
