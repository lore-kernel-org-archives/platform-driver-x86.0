Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8508F340A4A
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Oct 2025 17:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761239214; cv=none; b=cv2RPU4iehiiSbY/Ma4P7kAKZK2tAwO/mvisNnA74skDgKqSfseQDcgvCxxrotn4wn/xjbU96MMoAlcWtqR0ljZq8cL+gR7x933EAxMcl/YiQv2KZsP1VtnujbZ4Nq262/CDu4gpU5L/jDgrSwHGL1X5hI7WeAq3eJJYIc1em1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761239214; c=relaxed/simple;
	bh=PECSIW3krhGuJb11E3crJdvrNsJtWevjN0kDoXCOJas=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lIstXRwczrbbZX+PB9tIw6OBXLBIgghIMFJi2gq0dCqDeGXZzfV4Y6HRvDaHqAXRFvKE3s45ln9afZAy2tbpX1JrIfYrtjXJD5ZRmUcyY/DGvpCpogDHZVK7mGdSuJuN+L+LIxESToBfEwCqQBvzfZOhQjYTN4ctsfwf5E+Twl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kScwt8Sb; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kScwt8Sb"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-378d50e1c77so10043621fa.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Oct 2025 10:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761239211; x=1761844011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ay+42qhIEPdXa+n4WvORTn6I3PLfhdqjaHkfndYAfck=;
        b=kScwt8SbKBHth+fbMFKTAwrZmBaPQi32DE8oVyRXdmtndtBygPbSVKIVG4BGdWpzom
         C0jlAMxfYNiBr283VsYgFqPWUzfp/0pE8goq33CLTHWLWMFbvsMTxjmVI7LdxupjM6XB
         dbBDWm16aDJj9S92TftoFATwLNSANvJjcx/WjFoHu1zo9FObY63vd6+PVeWiltKa6WK8
         z+ZFHd83aSE3UGycQwhBGl9VGYI/GHW0pQh07Na7rV9FwlbqdwWaGwc8wFFtegMC4Cle
         rIkiiDtxqWfecqv4luWCfFKJGCWajd6qtA4NdfFl331fjQtsXTGlsN8FnslemrBk/Mmm
         A0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761239211; x=1761844011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ay+42qhIEPdXa+n4WvORTn6I3PLfhdqjaHkfndYAfck=;
        b=tJPkXltXVIVlyufnOQUaovYAvI+0dtPfFTw7P7cyJJh2BgxlJig6lN/ClkSOcH5ywI
         R0RmnTK2tYwPkdqVeifounHDqsVmz7XsAvFg6IL9bJivjN6A6NnaH4JaJnK8pR1KRRrh
         HGtlUDioUYVU7TjWfINfYTkGTM/EZee+jEi4ma3Dmxl7zZ6mZF97TjRIXug1lTsvZ7uh
         PNFABDplx5HImguxXWjI2OdVRc3I+j50iS38EmZQvPtYwm8bWV/9odKLFZzxR9aiwsu2
         uuSX++4i4yViVMZTfEQ2YhJOsarZH1lH8c1uHykbUb3VM4YrVE0OUattmFs7rRVkYJWX
         YY1A==
X-Forwarded-Encrypted: i=1; AJvYcCVR6twIdy1A9CfRBDQalGOQJFCRqv/n1mCDWm0p5IlsUCSHNtbx2rE4EGkf1CNHnlc7cwzYEydH4uOMseoJwLzNXN+X@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2XsZ9Avy+3PtdfAw72XfOSxN0D0v+vWLEolkFzVrOQs5xYzZX
	xL0UsWKcKWdVlhGN/JV1rb1Kt+ywyVFELLd4G7oJ1vwSKKv7vjq8UFQv
X-Gm-Gg: ASbGncvDxjhjeZcSGaY0jvEiCY7b0zHZxp++UF3pf9hvM1ylpw+XvyYTDJhziushi2T
	5mJxe1YdFI5omvAZdwAgwLXt6LTgSXghzjcMpPeRTBRaYMGPGIRXAWqusoBY8if+Rub2EI8Vho0
	rNxBwvCKSL5/YdXcYu2pAmSmCQ1wAreD+MbORRh25z/8XxytL7vURLGliaYwwjM0JTHxK9WBDTm
	Pr5HBzcuwtspER3U+AeXANecyWg0H1TkRz5+46SuO/CCrg8DEnMUzeh/62YfX2f/g5ObA7bQyMU
	X5TfY9vgyL3mx+RDNjUv/+NeLlTcMIVBdcNaTowZg+2IvHPF5GQHJzaCcFlGwv7V1VFFghJ1eBD
	X4ufD6qI3wvC8JVEF7lrw9kbj6h/UDipiUuezETGoUN8yHK/H9u8AKeUR3a/UzfJ6KrP8CZ3TC+
	d3OEyJ9RoVWbFGeIFegPH6TKpQYFw=
X-Google-Smtp-Source: AGHT+IFCU+4vgavCbFNLb+Mo4lZ6B2eZuRjKspgl3MEMe+pg4okffP3jDGlOShhYfpkKT3xoeWgSbw==
X-Received: by 2002:a05:651c:199e:b0:36c:ebb0:821c with SMTP id 38308e7fff4ca-37797831bfbmr72598861fa.7.1761239210349;
        Thu, 23 Oct 2025 10:06:50 -0700 (PDT)
Received: from foxbook (bey128.neoplus.adsl.tpnet.pl. [83.28.36.128])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378d67dc50csm5770731fa.41.2025.10.23.10.06.47
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 23 Oct 2025 10:06:50 -0700 (PDT)
Date: Thu, 23 Oct 2025 19:06:44 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Yazen Ghannam <yazen.ghannam@amd.com>, Shyam-sundar.S-k@amd.com,
 bhelgaas@google.com, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 jdelvare@suse.com, linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux@roeck-us.net, naveenkrishna.chatradhi@amd.com,
 platform-driver-x86@vger.kernel.org, suma.hegde@amd.com,
 tony.luck@intel.com, x86@kernel.org
Subject: Re: [PATCH v3 06/12] x86/amd_nb: Use topology info to get AMD node
 count
Message-ID: <20251023190644.114bf9f8.michal.pecio@gmail.com>
In-Reply-To: <5764e711-4c3f-4476-9ecb-1f7643e3b60d@amd.com>
References: <20250107222847.3300430-7-yazen.ghannam@amd.com>
	<20251022011610.60d0ba6e.michal.pecio@gmail.com>
	<20251022133901.GB7243@yaz-khff2.amd.com>
	<20251022173831.671843f4.michal.pecio@gmail.com>
	<20251022160904.GA174761@yaz-khff2.amd.com>
	<20251022181856.0e3cfc92.michal.pecio@gmail.com>
	<20251023135935.GA619807@yaz-khff2.amd.com>
	<20251023170107.0cc70bad.michal.pecio@gmail.com>
	<20251023160906.GA730672@yaz-khff2.amd.com>
	<5764e711-4c3f-4476-9ecb-1f7643e3b60d@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 23 Oct 2025 11:22:29 -0500, Mario Limonciello wrote:
> As this is an ancient BIOS this reminds me of some related commits:
> 
> aa06e20f1be6 ("x86/ACPI: Don't add CPUs that are not online capable")
> a74fabfbd1b70 ("x86/ACPI/boot: Use FADT version to check support for 
> online capable")
> 
> Does reverting that second one help?

Not sure if it's worth trying? My BIOS predates the ACPI 6.3 spec by
several years and (if I understand correctly) MADT revision is 1.

It seems Yazen guessed right: they list 6 APICs and mark absent ones
as not enabled. But I don't think we can assume any ACPI 6.3 flags to
be valid here.

I wonder if some quick check could recognize those consumer CPUs and
simply ignore hotplug there? AFAIK it was never a thing on AM3.

Michal
