Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794260762;
	b=n+8BM0EUeWCtvISAr66uPpJR7mKAJy/3yDd/+0UurPszz+MhX3bfvCQHPDc/Va40QrSm
	 sTcjytjpS4Cavsd8Vm5UBzkm77MRGRsKepqdmssdIAIpL4fV+8JLmsVWsfQ/s7/cn1T/e
	 2ZI3uxUMJLihgoU23kdnsYCIG8xVxbUzWC9jWrSjHyrpBRoZZn0VAHJ25F06hGSX+foJg
	 xvFcaRbsPc/pcFYa+JgmhkqwlenYOo7TlzX+l9lrWTXA37yCgTYGCjHUEla8rnZ8w3c0s
	 ip+ckuzJw78xzmjxkxoIEpaPrrnLTpt9d9aWqV/RDHEBCHhhu813IbAfrrFwU0j2Xrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794260762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=874yjmK9ypxK94+nKOJ/uR1d6HpqK0owgIThZQA8ZUA=;
	b=JAwcdv//pmcGqRo70dGMYRtzqfJX5nVNp2WdHgVhxdPog8atfB+W3zUa9xmXpoNRhC0r
	 +GmsnASZuWApHi8L+C+tFpPdDcwpg+OSRqvEZGmUxDqXtHu3A3Gq7v61NsuV6+UONXXwQ
	 QJv94r2PJmRLZaeJC2QNZP2jLjVgz5XnZ9C+U7uimSvtaJflwvHVlrroTPFf0+QaGZUgh
	 l2XlwKZLXXBPX6EMpR4D91+h920mK+ye2TYRRz37/YRZrzImai1xyrxpdQRF+8uZl6lJF
	 l7OySnpp9A42To3eRYUVhluviNCz3kyhc7L5TXYMdyndFmg6wQaiEYpoU4lIEsJjYow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LaZ0qPv5;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92526606A332
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Nov 2026 21:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92526606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LaZ0qPv5
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-492f6b7f70dso881101f8f.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2026 13:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794260761; x=1794865561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=874yjmK9ypxK94+nKOJ/uR1d6HpqK0owgIThZQA8ZUA=;
        b=LaZ0qPv5+whTFQHjIA7oYo021SUS2QeXnWN8ii9Y4im7Ue68o46nz2xh/hHMwIUfQ/
         ICad5fyoXePYl6/8nNVhZk6UxBKiDwJbHcHq6QklDSJskt7Ox2MaUqpcgklbAASOb1WD
         7U13gt1MK2zXHTSuMFiAfjmE40I4QhfpTIR2Mc6nMOBQW6Dg/mqe6U/h69Hyf/QnrKae
         CyKIviPRPYc2tnG0IM8qOylYYY2PKnrUJzf833wY0ZcFYDbyZdAS7ekVESO+FaUUNtdA
         WzN6sPDUCv7pE3hPSGmxzNcqgZM1jmpktE+mpPCXGo9ukB9qCsiBySNit7DIM51G+Ivt
         K68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794260761; x=1794865561;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=874yjmK9ypxK94+nKOJ/uR1d6HpqK0owgIThZQA8ZUA=;
        b=UbDtE8SbFDS8i1uSySh9CNB+iENokcW8ED37t0MQLLZA14SOnO5gqIfcMvjPFr9rO4
         6EQaok3FdTPCq7tGqAJkYOY2s6x/QsyxL/OE5xnX5yE3XpftKxrAnjYNhNjGK1UksALG
         fYctA2B8sk3/U6jxhq4AO7PBBsLF0xAsSAdAv+1KCIermjlIQ8js4L7F7FuaM+JjBNI3
         E6pnG6tKLOqyTl3f0YGlJyRs16aYQayYVHq6XAKSY6rmbmOfbORiCoIrCbF3RGSEYpmZ
         8nI1MZNW5Q0C5dqY1sSu0pmXUQQ51PjJGLaJVjbCsjGcj47X5U4CBDELuzl3GtJzTgJh
         DZwg==
X-Forwarded-Encrypted: i=1; AL+hErH9WoI3E3Re09pDHQ4wo3HOzSxg+bbtwVS8rnIbF/RaiDU5mx7+ow1yuy63ZlHx+CYzcYJVRcXhdEZdml1jqbOqv1bH@vger.kernel.org
X-Gm-Message-State: APuU4Z/nTDg7elltIOJ7y7TXqHqTfuw6U5GcQ1y9deNO8qbGceywmqUb
	Z73NIahe3+0MqQl9zKIoKxu3lMEG2CmfFjZcJfd8yRYH5SAB52OPxDwz
X-Gm-Gg: AYBFou3Sp4wUbBW5eWnD3nA6dyFTJzrj0JX6qZkogpSFAJKLr/xxMZriJd1Ax0ytl8r
	R583MKnyT+8qY72Gub2TE000kKi3mhF5MVi2B/tMy3moNfb3bqivyX7NEZ7e1ilwL+PPr0E1DNT
	W64b6EZnHvKwjhyn0NmNcSh2eqT7WTqiq/tI6600ghB0soD9TP1ny1Aq2lSrakIi3HK+XWDXosh
	T6OMxyHA5/8QwXbbzEhsOxVY+qoyL2XV9epUoiOLp/QTcvxD2jRO3bfjZYwoFL6icl/5OPkLeuc
	cUzcA+Q4nrY7TOlsMTAHtWcEhMD8X6sIX2l+IqPLhLssmnoyHXlfVoAgsEOVvQlN09xcoGlnfsQ
	lvgtgwQfO/E2mtMGq6KekTqt5+BiAqY6PL8DdUFOdqvwHynN1YKssXxy5spIYvf9AVLJMSivPMj
	xDJlBWoDT1zrowpqw72f9n+arXMGHf86VneezYDmEq+z44f1rb7jcfU0qSaAfkzzOKOgrJg/yr+
	jFyS0pvWyWovKJTkLMEdPRavOrPMBQvwOLYhl2dj5LZzphPt+PEi9WuBsVzaFnq3pzbs7z4jNPT
	h9eyHp9L1JYyYh/g/2f/eKlfDNkgbXunFVR7qYVNnEl5Wsv1QyIVJAgcQlJykMaRjg==
X-Received: by 2002:a05:6000:288d:b0:48e:25e1:5eb8 with SMTP id ffacd0b85a97d-4982b28aa42mr1487213f8f.3.1794260760763;
        Mon, 09 Nov 2026 13:46:00 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c4fdsm1213644f8f.10.2026.11.09.13.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:46:00 -0800 (PST)
Date: Mon, 9 Nov 2026 21:45:58 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Christian Brauner <brauner@kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, linux-fsdevel@vger.kernel.org, Linus Torvalds
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
Message-ID: <20261109214558.0d9d5228@pumpkin>
In-Reply-To: <alpine.DEB.2.21.2611090504170.17804@angie.orcam.me.uk>
References: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
	<CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
	<20261107-akteur-gemieden-eckdaten-21304d085e35@brauner>
	<20261108185953.28054fb3@pumpkin>
	<alpine.DEB.2.21.2611090504170.17804@angie.orcam.me.uk>
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

On Mon, 9 Nov 2026 05:05:57 +0000 (GMT)
"Maciej W. Rozycki" <macro@orcam.me.uk> wrote:

> On Sun, 8 Nov 2026, David Laight wrote:
> 
> > > > While at it, I think it would be good to use this conversion as an
> > > > opportunity to replace "char *" by "void *", which will probably let
> > > > you drop several casts from users.    
> > > 
> > > So I tried that too. The thing is it drops exactly one u8 * cast in
> > > ntfs3's label write.   
> > 
> > Since char is now unsigned that one isn't even needed...  
> 
>  Please excuse me missing the context, but what circumstances does your 
> claim refer to?

Just that the cast would have to be:
	u8 *foo = (u8 *)bar;
where 'bar' is 'char *', and I don't think you need a cast there when
char is unsigned.

David
 
> 
>   Maciej
> 

