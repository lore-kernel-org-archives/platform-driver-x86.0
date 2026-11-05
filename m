Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872356;
	b=nDD1PxD8Ocvb6JSC3dFkBcgHqtEsOzD5vabapU9sYMXRFAjFMf2Ovs9FX3gytjyUHhVd
	 cLeObEZKA18E5bhX0FofHPAkDq7ZQP6OFeeKN5wfSbbTBPWrmw8rOimvXBuQJDjZKgsk0
	 jKl50vhPZV1cNUXQ+TxzIy0+nX3y3tbko/cxhiw11BJq+KfL3xQwwT5UTLWrCCoP9ARHM
	 bt2os+o08cA4KeoC4sYkWJvjea6cjsqcLZXpuZVZOrLFDYp2av81tdp+613qvxIFtlihz
	 /OuCtEbEXY91g10wF2vf/Kz6bcY3RrWx4xGwu8OukbBr0nKsbrGiV6/4/n/M6O/oQeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872356;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=SqrTjgENN7Dfs+HehxbKPgACeb32UvvfMAFijNHd6N4=;
	b=mh2d3xSsNEawioiup9MjxR7rgihWDXluS6DuhUjuu2syWUG/xMzNCsSbZhuSWS0FC9nZ
	 8vQxNXBtipAp+hS8k+gC4LfxmOFve4KTXKQNaeA7b5YRiYGI1UT78pnA3dTE5dDhqqX60
	 jOZF+6ts9MaxoZuTxXQ/Nlk43ajO2/K/kESu+VrXlvfftdC6tZhgcYRixtejYRhtRwqAd
	 Xo4sSwkWhE/vH3eBFVbBV2IW2IYd5tyHxY8UYUZJL1uTgzKbfjFXRrcsnmWRVb1QNOKxu
	 98D2/+fqyftP/TT+ohIHrqjpsPM2dTNfpP+UwtRvV5Zs8EGs7tJcTYFCVx4mgQm3aSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA574606CC72
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Nov 2026 09:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA574606CC72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53653e30353so21940341cf.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Nov 2026 01:52:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872355; x=1794477155;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SqrTjgENN7Dfs+HehxbKPgACeb32UvvfMAFijNHd6N4=;
        b=Muu7sBNT/xph01yVxPEPpDYton1+4kpAyVZBGuSzupSw6m13OIeIhx3KFsBkykHK37
         6wqOJj9/fZXPG67ulUaZeHO5/ZHPJTU+oWvTGGpl0WXBn8A7TeEuWXuFnze+ddYnBe7u
         reXbQZ/BOr8vTpAypl/4negSpoZP8N7nCmNGfCHMMB/WUWmoGGYFzzYQiqgATGXLgz9s
         OdXOZguGKb7h+0AVsfDMMEkZzHws4PEqCxWibD7wJgaiRNFW6OfCYRJSfadnxqGPBu79
         Cpw0Ybxl1Wt9zEweddblPUEkWCoD/rzQMPHTKOkO32ljexIgoKtdDOk+CK/FFy9mCn30
         ippA==
X-Forwarded-Encrypted: i=1; AKwUvBy77XiRj1P0lwTZQ9hAXeypgC0NAch+UCtUJqyb3hq2akPNir9ahXlk+llTrnexgaBs8OTCbhnc0C/bLX762lxhroF8@vger.kernel.org
X-Gm-Message-State: APuU4Z93EQdaqCawgdYQwcFTjEV/Kwn7DaJfN2FIJYnh5cGcd6eFzevc
	Q0VmdWsJLxmJWPXb/1E8zmoj54x7MWDrmCV7GUfNM+JdP9Abeu2BjRUQQTrK6zZ6plk=
X-Gm-Gg: AYBFou2Q46NUJrMOK7rRgdjiAfrufhul3OQAQxv6UoMAv/8ZPRyzlkqdFdoUnOXWC+G
	GSMPVPZKkaJQDF2pT3X/Tfgn8G+HwSHg9jNuucXp7NyVVHdEYRk7GxU0Gq7/nxgZZSYdMU7vRDH
	KCaT2sHFDYj2p9dcK2AvCq3B30ls/mF0vO4rFQOD/P/DvMZMHoJmGk72I1WXgCBXAGC9Dvp0fRN
	qcMzlKEKa9YOyryayZA2/M+BOPV8NeksxrOj0kTre3TdbfhzXwnsJg8xOYPfYsbFVzYCGl0nayj
	vn+FpEcGkQ0yluzpo0tVeBLodhug5K/RGSQqu2aZVm591X+ROPFHQ+D2ZdIDVFCxTDHWfluUfiF
	qu8AXqvDE2IfemWMOSm+F9yjEw51L4APRXAiUwc2jUqcyduvzagt55G/LmxhK27UDFsGVOBSBYc
	3qw7psnxR7NF/iqoc7fPW6ArBQJanBM/N30dAgMPAV0oXs2kUknAfdiseARhj5ktN9wtVXt7e+P
	dUxRY/692sS6KaZ0u5mInM+kxGlyRbIUezJg/s1sNVVTXIifrNOFosdhHZdd4zmkc11adtfzzA6
	+dHAeBu8v/Qfg4MD0+OVRW5Q4nHvqgpv+NLtBT+IuqdTrQYM027RwAL1Y4FjsPRl3Q==
X-Received: by 2002:a05:622a:e388:20b0:536:8d0d:2d96 with SMTP id d75a77b69052e-54a92a3c4d9mr81827241cf.13.1793872354989;
        Thu, 05 Nov 2026 01:52:34 -0800 (PST)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com. [209.85.219.41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b10cdc3d3sm47335951cf.28.2026.11.05.01.52.34
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:52:34 -0800 (PST)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91c6ce60697so22123456d6.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Nov 2026 01:52:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBz1GYvss9eRR2d+gBIRv0Ru5o8k3SKL7zXeb+SQmLim2H+Y3I6VecjgkN091UUN+LbzTNsCediBysHBVMV40pce+lGy@vger.kernel.org
X-Received: by 2002:a05:6102:3ec5:b0:7cc:2bb7:131d with SMTP id
 ada2fe7eead31-7d072baa484mr7324212137.9.1793871885062; Thu, 05 Nov 2026
 01:44:45 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org> <20261104-work-procfs-bugfixes-v2-10-021c84d852e0@kernel.org>
In-Reply-To: <20261104-work-procfs-bugfixes-v2-10-021c84d852e0@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:44:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUy1RYKG0g8OWss3AD-jyYx3DXL0K7ABYkFUdxTxZ9VdQ@mail.gmail.com>
X-Gm-Features: AclHuK9D-nB8icBns0zdoQH8fV1cfUPJ6LOey8o_VlUZpDIGqKC4cFf8-j5-HdE
Message-ID: <CAMuHMdUy1RYKG0g8OWss3AD-jyYx3DXL0K7ABYkFUdxTxZ9VdQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 10/51] zorro: size the proc files like what they serve
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

On Wed, 4 Nov 2026 at 20:18, Christian Brauner <brauner@kernel.org> wrote:
> The files under /proc/bus/zorro hand out a struct ConfigDev and seek
> within that, but their size says sizeof(struct zorro_dev). Say
> sizeof(struct ConfigDev).
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
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
