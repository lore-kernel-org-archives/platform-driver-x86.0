Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793642700;
	b=slTu7zsdDqSZn6zi6VCP1Rrqc8xIT10MOdok0upRZhebHoYOuHBzMNEAQQK3mxfh8Z40
	 9Pb0X5FjZrjEcDI7sZnPsuPEjN/bwM6dF47VWF6OSrF0vJfctFGzyz7zxSMorHxWzfJSZ
	 Veakpe+zx5RFsohIthVUkIKdIE4kHEzt21zCu5pc4PQrHND3QzW5p3T5GPaO6DWXDlaaH
	 qrQEHnUz3elBwSedr9MabO2stdo1yMYxfHb64TOYVg4PmheaIy83lZvj7r10iQ8IOhAiv
	 ZxYyss4qkMz4HJugVowgPyQFEmwNbQldbxDzA/fybGFt0fsL3XAqOF+GM8ryxz2NNlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793642700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/vXXDZI2TLqXD/tqTZGHj/cF0YcMq0fXP1TpWYkM2ME=;
	b=g11EgYtWbVg4rIY5jFsXMNGXRxz6T/X4oS+j2NroqrgqXVPY02PVFHtjtD6aEmoXKVVY
	 M+ZV5qkC9dEdOM7wTdKJBLKNQa6sEmTTZmWFaQRjKP16YJU+Qq3HuiAkFLoRBHxjGS+3G
	 JQlfLBCqZ6jmmJyaI5TfUJZno6PTaMF/Lqz46ZHsrJ3dIoUoGLxd36NhfjvUAUPNcc6H6
	 7lOuDuXwQ0+32vn7/SKJTk9vEJMODtpxKr3ZBZG6E5kBGSOyhoJK2rOQ8YbAwzU99wN7V
	 Ywcodn3poUcwyHAu4nGIp4vQXrldsZ76q3GFoN4Ijsi3VJnyq7Oi4YkcreQn0Ajlwbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=bK+1PtXZ;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32B6606A590
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 18:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D32B6606A590
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=bK+1PtXZ
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bfc32574e7so1752860e87.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 Nov 2026 10:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793642698; x=1794247498; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/vXXDZI2TLqXD/tqTZGHj/cF0YcMq0fXP1TpWYkM2ME=;
        b=bK+1PtXZxHxdhaYZGcYSns9PCiQxxoF9IIKnyicW+lkouEVrxqE55PlCLywuPu2ciJ
         wY2mEYbibH4HvxYTP5iyfIhTq0LSDsAMcXo+wLx2FzxeSFeGbGD3sC+QgPND+ddc0sn5
         N4fFHwijT+MLdP1WNZYpYZmeKXUvIRI5Zu+PA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793642698; x=1794247498;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/vXXDZI2TLqXD/tqTZGHj/cF0YcMq0fXP1TpWYkM2ME=;
        b=zwpS+kyt1B5Q/hX7UTE9oU6iHzv6DiEbGvGpfMVAQvPyaygY4ejyl7Dhw/f9vJpfcy
         7ruIVzdByMF17Cpu/gaWj9nJQIOXexFhCD+rtb05p1YObCHLpfMoMm85xXnwKhSKltwH
         HyMAg5VLrLJ7nF0rygYemrPphygG8ZQI5zwTfmFM9jDuEdfqXeOiOnvNjpQNHjn3AkjG
         qlK1Hhx1iVGzy52vVn6vK/KCTwXPKfdADF6en7fgcfYOjKzhLVjgnJ5n4Qe6aYBnlO5P
         3oh/UaGosey5KXusDBpGRrNhVBKa2VKUF69NrrK0Z6L82R5FMhaomsfcbVzzhAIHsdo0
         mCyA==
X-Forwarded-Encrypted: i=1; AKwUvBz+QF3Qo2MZRYsFn5DgQ45UHteVaj3SqbnQoCDBSEV3lnu2xgCIggSKv2UkoDA1ACmZXRXYBFdr27/EF0iSV5w8kbwt@vger.kernel.org
X-Gm-Message-State: APuU4Z95SNCu/DSBsxO6kRlrSJkL4RIn2E/7MdY9DQbGRzqSlMS4cKb6
	DHXaI6oPPnwLyH3xd1DCF4X1EYofRBSLEUGBIxalBmECYzkGzimOE6brMzGkoAoF68vCPRZYrRb
	YNt/g1MF86w==
X-Gm-Gg: AYBFou1qZ6667FqySIk1odYZC0qdEdFfM100fIpJQZCVq9q5OysR+5ZOvMXZmUbSeLs
	32d/rRq4ZyyTyo0dXpES88ASmszDmSCq8dFX0lgCGeziqN6vmonVEV7BEsd2seXGJBnRwZGq/JG
	FrEHi0ic0h6tI2zn/BfapEPGh4bSHzkSTe7Qbj8WQWMpPKLkGObDFJl1hM2LuDKdpiih9EW53KP
	z2mvUOUNyUJeiCzPuSWuz4HLUyixqxa9iZCAgvhqVXJleSclBSgsTo/YZxm10GO2cVcm1n2LmEZ
	QOCbgoUqf++1tmUjdmZdgu6SHu3YPq5R8Comgh9s1i3SdEZI0XPBoxFKxjtsLA38eKLaG6QDnlH
	9gnmWSefakd2TYhcDz6tB7Wt4P1/wLitJecr8zURYhNgxJ9r4iL9SFngsKs9T/329nK290Yxg9r
	XTZoLjphuXCDDBbek/Q5x7IUXJOVbHTIJpkoxU/RUcfxH2WukVo+r2E2Bc1gJ5A208KJ3fUkXE7
	Go8R70MjUOA+SGEw7CWi4ENZPjBwrH8npHZTzCv+P0m8rD3TTnuPDyPKDGyH1aVaWIu9T0YYPuF
	ymiG29D5q4xNBP5S/hd7inRYi/f/VgdpRo87YQG5w+CApTgqNdwi7qHatUm8Ein5fjAnYGbY1Wj
	37Zvb/g==
X-Received: by 2002:a05:6512:694:b0:5bf:a1bd:d489 with SMTP id 2adb3069b0e04-5bfd118c306mr3746901e87.3.1793642698089;
        Mon, 02 Nov 2026 10:04:58 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe1b1ddb3sm1633952e87.27.2026.11.02.10.04.57
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 10:04:57 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ab3b29a210so35834481fa.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 Nov 2026 10:04:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByPv53yA4tdeXca3KW4/8DkfYMaBF3r37gYAj9zKFp84RtD5s2MIpVmSwIE/cg/zqsGhzougaT2Bw42vguBhfCUOHp7@vger.kernel.org
X-Received: by 2002:a17:907:d94:b0:c2d:c80e:8366 with SMTP id
 a640c23a62f3a-c4ca7426f6emr874452266b.0.1793642348398; Mon, 02 Nov 2026
 09:59:08 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org> <20261102-work-procfs-bugfixes-v1-1-59422ed3e465@kernel.org>
In-Reply-To: <20261102-work-procfs-bugfixes-v1-1-59422ed3e465@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 Nov 2026 09:58:51 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiSA7-mqmAjTQDaU7UjUyWt0TxYwXHafL8ZAPudy+B_uQ@mail.gmail.com>
X-Gm-Features: AclHuK_qZTBVsLQIdymgRHScSFenC6XsGggUDmcuOugjrSTbuVkeASUmC_hYPZo
Message-ID: <CAHk-=wiSA7-mqmAjTQDaU7UjUyWt0TxYwXHafL8ZAPudy+B_uQ@mail.gmail.com>
Subject: Re: [PATCH RFC 01/38] PCI/proc: don't truncate the position of config
 space accesses
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
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Nov 2026 at 06:22, Christian Brauner <brauner@kernel.org> wrote:
>
> proc_bus_pci_write() truncates the file position to an int. A pwrite()
> at an offset like 0xfffff000 turns it negative [..]

I think this would actually be better with rw_verify_area() just
checking a per-file maxbytes.

We already have that logic for lseek and friends - using that fairly
hacky combination of s_maxbytes and !unsigned_offsets().

We should combine s_maxbytes and unsigned_offsets() at file open time
into f_maxbytes and check that not just at lseek but in
rw_verify_area.

And then things like proc_bus_pci could set it's size limit in one single place.

Hmm?

                   Linus
