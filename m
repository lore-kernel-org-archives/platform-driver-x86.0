Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794840234;
	b=xENOG4M0AF/o4KfBRc4HS2nCjRzlhqg8lL2u32dSfTHweKXPRdInUS0O5sDZCRkW18FI
	 kRHV8CN8Jp7sSs1prDxWqWpFK5aJOiaXRiLam48wSOQu90rht60rXiWIgJXk8rlcnMgCk
	 uFzQtNEMPCL2TLOahQDWTbQ0UyVoZonRkuJnqrlewqBjv8DzySqhOTHABDrLRW+E/2T5p
	 Odtw4ZCCuwEJV8OlXooL0falG6Hwu9K/+w1VYlfEzJwd0P7F4cPLnMOufUi/Yh8TOIW8K
	 YcikoSaJrqDWzX0YJ+oFRIo5LGr9kV4Ha66vJmH7Kf5dOeCWS2JBP/9QzrNzookpnew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=sbC/P8PkXe6co3T0q5XlUb+4s1rCCi7zDGSauCdJ3XE=;
	b=fI/lFkGQ0NaaSSuP9XR6wxsSZr+S6+Te2guOtGI6XySZ9cJqFEXhazS+xr9JPq6ozyhb
	 QsaXqp8z+aOT7S+e5aYqQ58Dm9fa3KU4nccOUclGLXdo+mrn1Xfi1nIwQAL0L950cDxUE
	 sWrESlDpQ7L6fTOi2N2k7CUyR5Yn4DiFXJcORjGNgfGfhs7uYR+HcJdJF/5eIgh6LcXgm
	 28Rn1CyFPhOyPug540UO82TeuZJGYWvEbaADZkDuhE/AjERFj2kIFAp+BUmhirOoTiAqh
	 eBha9nuKeP+EJPJqxAQV8yMMo/0vcfFtXE0rwQaStBzjjtwcpm2R7OJT52WPe7OmPhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LJZtThat;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40D3606A31C
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 14:43:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D40D3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LJZtThat
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4d28f75d62so698545466b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 06:43:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794840232; cv=none;
        d=google.com; s=arc-20260327;
        b=q12fmj3k8FJHSh5BV1pe5RbE2w61OaaRVTbQff2k5sZmQ4kzULK2hmGWRqSgjgMm1D
         KYK9GyvHpKE3ChM5IOk4lnYiUJ4DGhxcS9YRltpfLS/sl74/mPlAN7vvyxD8iVmUNfxj
         ZqznnATeA8wdu4oh1s8XAElkzlHLhdf+HGjudJM6urYfvuRBkWi+libQiPSbiApZzDbA
         dajwiMR4gmOjxzUU6rW65tiG6FNsTG0Yec7iWFB8s5u3SZ17/3PaKAIfeL1IlLCp4jDp
         HlOcLEjmbF89vsN4CvFwIvsZdS3ioRAiphzhVbXXhonLjxm4YK0I9Xw4FtVmgTjeMRrR
         Io7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sbC/P8PkXe6co3T0q5XlUb+4s1rCCi7zDGSauCdJ3XE=;
        fh=gypDJeJUuhFudktwAFj35joqt7cskVn39ZccqXkxz94=;
        b=GMaYuLHeKYmEhpkIBeq8VDAsLgORBJKbDGStjKjwaOPuDZ1MWAsZqhTdMi010dVRnr
         rAX4msgxS46dpmyhniuRiX1G1Cq7m3H0mFdkxefPxgTWh6mdSU5O2VgYgp3SlY50PX+E
         tvcnOnp9fDquyg8Csh03OQrsOV49c1R1IyCx7U/7f3aMPX1eZRA3cj+M65CNnSx/jS7V
         ScB6skS+y7++qGMTb5BW8OjIjIYBPVCHBMo00brYxypvluXMzr8jTaZxhKScAxGube7c
         NLRceRMDAUmxDCt4CnMgFKL0ctLaqHL/NDk1xbWoxXHehYgnIkwMKbxDZSh1GO4HHmQZ
         EbxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794840232; x=1795445032; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sbC/P8PkXe6co3T0q5XlUb+4s1rCCi7zDGSauCdJ3XE=;
        b=LJZtThatK6K0+/QRl0VZXYdgWJbyO8o12oAmzBTtG1u2mOWrqb/fTDB2e93TBV8Qn0
         MQehSI+Kw4wCmc2sB/zKnpCGt8jAEuq0tCKk/fiVHgbRFLdudQeXTWOA2Wlk5JkSaOB7
         X53v3qdCCVGbyH8ZuiS6JbJnVShbxeKOFZLOy+8KTvH8D7FneS7qR3uxK0hj4wRhszFj
         r7xRBHVS1UZNbNFazp5shpdq+lPBAcKmegywUWURVcuTVb2GOxFSH8cby/uvAkM0GCmg
         dPyGg+e45ElNTArXV0NwprNIJcZcjxbGburToczD9HZdfkYJtUbVL5oXdKyp23tnLVKj
         DWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794840232; x=1795445032;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sbC/P8PkXe6co3T0q5XlUb+4s1rCCi7zDGSauCdJ3XE=;
        b=nuP8aTmrQFpoyR4MZUAJuQ5vV09wYEBbP9XHN6V0wqIXlgKZ3W48ymkv6ppAUQzdbI
         w8+clMmEyqWe5YwifwIno4bwWUAOThJREg5oyM2jBloKumeiterp86Xl5vHnSoDv5pGc
         N3fUJuUHHxyLIwjgB8daI0SBv1CTQ5WNaVRTa6PcbHFPC5BjaQpIviwttisDz6KACjfy
         r96MrS2CTg45XtuNJ0n9MEX7ONKEWRqGXEhMXTh3VmaDRrWehZJs/lUL1o9UWp/tjHST
         0LkwHoUpEGUsXdsOCf0yaQosTVKtDMbePRadVRjQeY2ym1b11FJfVHpGM/eObA3w6n9G
         It8Q==
X-Forwarded-Encrypted: i=1; AL+hErGN/CS+a3PM9qDtU/ZAwAPIVnwd079vId3hp2U9To5JUBqTideO18bL9QtEiNrYu/27ZGDafjJ5KohEoBp2V8rcwM4J@vger.kernel.org
X-Gm-Message-State: APuU4Z+591ZdvKjiqFshSqbXSQwXIG2Z0Rlpcc88VbuL9znshKlZcoN7
	oG8Zc2WBRcgRc3EkFtYMQzXAVr3plgM6eW0H/GCf+BTtxMfankHW05B2idykc6t+AwV2+XeUXk/
	CvLwkJ06aOIdu9Y7ug6PDKcpdN+laqd8=
X-Gm-Gg: AYBFou0qdRvigP5jNZ5qldidjPqIloYT5DluX+MqQmVoe7RtFnqpl7CJS7bSzan+7tj
	xJTmn/L+Lx108xVyH/bdXalgjXc2NG/rHI8lPaBPmDWYzVhJuZ34oblgtOzBuGWeprcdILhX+uI
	lcxzlye71xlVcJGKWu4JgPL8TUKEeY7hq7JVtxCVxsc1AIwngEq462eimLVHGJ01YUOajfdG8dR
	OlbdKt0F/e0W1tCj+b6aCgXQzgTBgaaXJxgGvJNWFeFkL/PEw97LqjOhejuaj8iQMtCi6ZfhWXC
	NbpCgAFeldZCTyq60SsoS1KW1Y+k0z5t1bprPyx8t5ABG0G2l8GJPBkGPvmp5gBR0rtfGVnenOi
	noKfii69fwGw+kixTyCRjnGJTF4k5k9L9ynmtL9sr04dcdWnV74U5MPLvmrHcX50KPS5ta2hVTH
	IG00/MsnBOjBNkYKczNQ==
X-Received: by 2002:a17:907:7ba3:b0:c25:91bc:ff55 with SMTP id
 a640c23a62f3a-c509636a832mr811383966b.23.1794840232163; Mon, 16 Nov 2026
 06:43:52 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261007125908.321186-1-erwanaliasr1@gmail.com>
 <20261007125908.321186-3-erwanaliasr1@gmail.com> <73b9c9a8-479d-4a5f-9321-2e095f11951d@gmail.com>
 <20261116141150.667950-1-erwanaliasr1@gmail.com> <2ad73cfe-3ae6-43d8-c7e9-247239b72519@linux.intel.com>
In-Reply-To: <2ad73cfe-3ae6-43d8-c7e9-247239b72519@linux.intel.com>
From: Erwan Velu <erwanaliasr1@gmail.com>
Date: Mon, 16 Nov 2026 15:43:40 +0100
X-Gm-Features: AclHuK8BDXpvNI0_3pllJdwQDzikwYZpRgLllXxe5RPi3P4JjVG4FqCURPk7LoA
Message-ID: <CAL2JzuyL63cqnV+DR22NfAPFHCO24G0_NkPohm1vao-U985pBw@mail.gmail.com>
Subject: Re: [PATCH 2/4] platform/x86/amd/hsmp: Add /sys/devices/amd_hsmp
 socket devices
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>, platform-driver-x86@vger.kernel.org, 
	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>, Carlos Bilbao <carlos.bilbao@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

> The lack of Documentation/ABI entry should not be taken as an indication
> for something not being ABI. We generally don't take away ABI without
> doing proper deprecation and waiting first.
>
> Sometimes, the old place can be covered with a symlink to the new place.

Yeah, but since the trees are very different between the current ACPI
(AMDI) and the platform (socket<x>) one, I don't think a simple
symlink would be accepted. Would it be ? That's my main issue here.
The two implementations of the same structures vary so much that
unifying the output means breaking one.
The platform structure with socket<x>/ is way easier to manage from a
monitoring software point of view.
