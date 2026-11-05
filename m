Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872900;
	b=0l3miKDCczUm/Mj2Zg9XtFJoTO8LGIe6oOHCqRD/vSNeHj32RTYd6YAVQqwjKTannb5k
	 thjMZABESEAQ+dL8j2/wlhKgNI6/ezeumGKeUJXNAs/5WvMtH2Ciag458xV1OVEkBgyuG
	 V+I49aqFrmZVYmXj8dzlPPHYvqH/TyFrkim1Ixf5RDqx3ekTSDjFy6OB1ovZEsRseMkaL
	 GpKjGCjo+NImH6Uq7N6Df5ZUHcMMLzA/vIhHZAc0yBywOopnALX6VxBBu6SAt0wrzGqbK
	 /Ec5SvuZWwohH3IoCdQ6T+ajXuTdB1EpjL8Vg8yhXtAf1+sEupdjJZiO8xWP4YhcDTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872900;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=LrgDMUrSYXpYgkAhfsYKg0ebb/uLgOfOMhqzX4yL0j4=;
	b=uCXuQMf2MYA2dfM4ljoOYrQwdOVDZLIEbyLiGlGyagh/PUYQST7WqauDGn5cJr9q3mKA
	 Z+357VZ/Rs+2tbiyCjXQpSWb0B9EkJ03lAQq9T8PpG+O32DoyuL5+juPL5CIUczqH1ubH
	 cntR9HBXvJudISfwCNQNLbfTjj/6OrAyt0uNdTkj/YY2vtLO/o5wswbo/o5lL65lrl1uh
	 WB5sCw1fSPH6JSZrozGqMyQ28ksHSMftIXx0aKkSBo7fvVh0c3leVSZzVP4lyRwd6Dr12
	 zesB0v5N8YtJokpW92kNhPfkJWueQIozjuD7vmstXlGOzXeO9itt5rY2d1OMNOlraHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F10F606A328
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Nov 2026 10:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F10F606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-945ae2daa3eso203242085a.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Nov 2026 02:01:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872899; x=1794477699;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LrgDMUrSYXpYgkAhfsYKg0ebb/uLgOfOMhqzX4yL0j4=;
        b=gmwst20Pn0Q9xZChbmiiMv7mV8mQiSmUc7aDcJShUJsu7HvW1uDcGucjsY26MiZLj0
         W0P+/cx0Jm2GHxyy9dZmVRPcu3obcCeTHBfEyO1PLLDqJRcOMZn4DDgMhfzufdkZSiZT
         yuc+b204B6q4Xu4IQFhqDMAMWcGq88EAtJ15m/mLLXbqaJtq6zROLI+XSrKQ4wZBypIy
         HibjEROI+ljPS3z7p1NXgwc6bmzwxF5QDx5o6IGvybXZBSe+Jzw+NxBkz8z4Z6Z6AxXG
         n2C+EPkwqaqHKMNN+iXgejcTcs1FZBiQRpC9uhxX566TymQnBJIVr1kEiQxLEP4xjEsF
         5ArQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKYrTefiQsRVj513asi1uGeD/Uj3mLXpfC9YduRFH7slMQraBvTcV3Regc+ikPJBlWV5tW/gNZtgnXCKtXkaE2VzLY@vger.kernel.org
X-Gm-Message-State: APuU4Z/CDM6m7L5OCwgNC49gFTzRYGPG112UAmaLhHIk66pWVrlG2HNv
	OggINmKzVsfYSwTcvQiOaAnOfPrEJb1MBUBr+bZu7c/o643sYHJrMM02Tg0fioTy0uE=
X-Gm-Gg: AYBFou2IiQpR+/asvDhnSzVDgAnONxA3pEnBeSmQyu1/rlQEx15ymagZHhOMn0XD4Y6
	+asLcNPglnZgCaQ0OZ4KejBnBccjtRL+QVX1/fPBV5fLNmq+jP45On0yP3S2b5KBY/oIM/ged8u
	1BRBUjVpcKfI4wk/dbPE6YA2lQHP65+YrRGVH/9LGtuGfCr8UFdvwoIeRazcgTP3NRAzZ6QA97u
	tj0JjR9KyruwdNJimXOjSq14VeZ3f4/j4/ix40msSU/7oZ/87qGBSZjNz8/0z9AUr69Vgag6WfJ
	f31VLz5eM7TYN1tCmkArwPPIcPdOYLhhHv6LYRPby0P/FGTunbjO5Co//ZZnqplz48VpbhBzUy4
	I7O/EqJPoQ0DAIpk2vVK3Nl46BCp9E7lqNXtItKqYB0xv1OQ6nIzgCTxm0ro8CCZMWBbfatX1h5
	sm/BE1E2l9AJFNUQhU/PE8s8aJN0bI/BHOLVi4RB0re1yNKhS5P8cvE3UBU9jBTDqrBZfFszON+
	29eaUeLmSmebD7ULHYpAA51amCTSm1Us5Oo51B7eYOBoDhbQu12lgZWFQw5xRNH5TS57LyMWfFG
	oENVlo5h4fbWyt/9oULzuPNvwkE5hsC0ivctLXANnW9+kXbTKz/bCpaMh9SYYnjObj1rmJ2he5L
	y3DXbw+PdvhfUln8=
X-Received: by 2002:a05:620a:28cb:b0:93f:3120:6c6d with SMTP id af79cd13be357-944217396a2mr3084368985a.35.1793872898946;
        Thu, 05 Nov 2026 02:01:38 -0800 (PST)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d47f68d0sm426964785a.19.2026.11.05.02.01.38
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:01:38 -0800 (PST)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93ece7a73b9so195593185a.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Nov 2026 02:01:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBw+gIG42TnKAzSGbPzqr7HeglimX+M41SwCZHc0UpCxiPhENaBMVU3j68shoPpCpti/9FqNcl/zJo/4uDb3p+Jj678H@vger.kernel.org
X-Received: by 2002:a05:6102:5108:b0:7cc:56a:58e5 with SMTP id
 ada2fe7eead31-7d072d84a58mr8269567137.37.1793872526219; Thu, 05 Nov 2026
 01:55:26 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org> <20261104-work-procfs-drivers-v2-2-245e54e87116@kernel.org>
In-Reply-To: <20261104-work-procfs-drivers-v2-2-245e54e87116@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:55:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVHxQvKnJyKHrOZhaOg9Rn2hMeRU1JnMFFEEi31FPZaGg@mail.gmail.com>
X-Gm-Features: AclHuK_UsJ1nGicdWEWcMLQAICTi1A7pGF3yhNkxXkXRPqohle17eXAHHNBsR6k
Message-ID: <CAMuHMdVHxQvKnJyKHrOZhaOg9Rn2hMeRU1JnMFFEEi31FPZaGg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 02/26] zorro: let procfs copy out reads
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

On Wed, 4 Nov 2026 at 20:43, Christian Brauner <brauner@kernel.org> wrote:
> Implement ->proc_read_buf() so procfs copies what is read from
> /proc/bus/zorro/<slot> to userspace after it unpinned the entry.
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
