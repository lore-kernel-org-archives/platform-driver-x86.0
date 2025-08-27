Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5B331A566
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Aug 2025 08:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756284773; cv=none; b=qczC1eujjOfQAY1LeV9nf0+VfvU4E+ayOrV2SW22miLU6PQvxv6e2cxu+sKmJoT49o4lvzigCPN6IxUXby80JCY2QZQG26KdIrmgBcv3r3pNzatygoxBlVs9pdZZJM2cJeSdhGhAXFC5IsFm9oZS8BP/ZIJihQlyiS1NbjO2xp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756284773; c=relaxed/simple;
	bh=/bZBwbWjM4t3HbXeNHFI0WpHTt8bpmx5ELQVsl5o5Kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hDg22KRoVeGnO5jsVIv2XqbijflDj7r3uKpuwQVmUCDCr6wNYTvlMNRyelfT0mkP2m+WIfJaQ+VTTdCY2n2ilFySkgi2nC+PMwnTzY4a+h6HVFWjSyTSwFBEthTNBe8AtVP/T5Pun+zEL8ZYhW4Yo5Y6r325KaHHpG25LenHk8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FvJ54BPx; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FvJ54BPx"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-244580523a0so64710665ad.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Aug 2025 01:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756284771; x=1756889571; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/OJ4XJbogpaWF3M2MsUSzvzZbDWhRAXNIjduAuCcoIc=;
        b=FvJ54BPxq0gD1RDq0c3wJyCe2/VGeQznSCphUMPhiI/fqaYdW5LkKJSSCf9VJ+z5t9
         V+AJLI/NCoANPZrg22t1gPulRym/ghe0s2k60qCjOYK5HjQC3XoZQvrTFWLkA2QQ8VXQ
         +5nbIxh7yjuJjjNWRaOj753CdvCeCrL+APbbVUyCbuIor2P3HeQOPioFT5wMKT9evlZe
         FVTjbxDQBcp/IbW1zjdSL7OyoRqV4zE6ASblfuVsB3AlplKdvZr1x+frDW9os5s3kxav
         UcAlsZMSiArPqUZCppm7yxm11uE9PbDmwJD2s6uW2RfA9r0hV/QUzfIrP1OzeWyncBSy
         8b5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756284771; x=1756889571;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/OJ4XJbogpaWF3M2MsUSzvzZbDWhRAXNIjduAuCcoIc=;
        b=vP4l/fO7K9o4QDRRPBauFFADPu0iLqINxxnA7vxYQaPYfO2UjZGCUxMz7NWIlLq0KE
         9EHGbPJ+xvHMVkE808eKb/fuCwKtwsFOmN4sa6YsecpgHZd0cG8/7uJQE7R6CzQdbYMh
         nBHxeNxPiX36eUsw3AAzv9tD8AN0kiaT2JtRuHXTxGFFetD4uTNcRCGSxz3dtNlHB37c
         CrhO3fzQjGmKjRIJupy4FfQcgmhy2QdrtzdqfKil+0IvNSWnQidUR/jJCUYxQknyaY9i
         YItRJ+TDfsH6fE5PCguytFi+sb1XGQ4fq+a8yZIRlY5r2zF2M6E0Lg0guB9EymPAj1uS
         EpFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUci8oIypXK5SMHkQtwmOTVMREcIFojwp1SQ8mOvBk60o1rYChcobQwWbKLUhVNGEjU4qoClBbLWUsMTuqS+UuuZIIq@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnl6feJu70rhFByYG2x98h5BtLRLSld0m8iRkDcJ/QyBCGOrY9
	8NdxY6g4bLFdNlLQVkkOfl6zgdHU2g2FjOyfCJP93LRkrswndP0y0qKTkg+Gt6Jo
X-Gm-Gg: ASbGncuQ0OPO07Wgp5uhfnBGvAn6m0k4RInukWub98fwXwPVrNYIr8wioY9MdrRe2zY
	QxC4piZad7Hf8y0VaP4FZjkEeHeCKNfxtb9fJdq12WdZZB3svkT5XJUNk/qBGmdvwWODpM1YEbY
	yCk/5pGNDdMNCM5dZ6ZwOFHN0Vs9AaWT0ke99BxnzV4a4jc/wbM1Rx5CjyVAaD/Hhw7r8wQMZ1t
	ahHVhY0Gpswuqb1EW/skbL9vKItFSlo46hZ2ihXFdoVycmBORhac5hm4acvLLw4CmsYhHFSzP4M
	Bs3A+LTG/hTuEI83dPHzsvkoJocRhyEylj3zrvmOSSMvG9riAW7yXCLHdOd8QQolYcuOSKCme4d
	UD/yqPsMkm861+3nnZ1Rm
X-Google-Smtp-Source: AGHT+IE0/JIO3RJ1muxsQGQrhVgnFf8WrAz0AtfSTcuCaMlojOVjzhhRokdQHAiL3/k+V2Ky6Z9Vbw==
X-Received: by 2002:a17:903:3843:b0:242:cd69:faa6 with SMTP id d9443c01a7336-2462ef03864mr276867985ad.29.1756284771346;
        Wed, 27 Aug 2025 01:52:51 -0700 (PDT)
Received: from nowy-laptop ([110.46.146.116])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466889ddbbsm116667285ad.152.2025.08.27.01.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 01:52:51 -0700 (PDT)
Date: Wed, 27 Aug 2025 17:52:46 +0900
From: SungHwan Jung <onenowy@gmail.com>
To: Lynne Megido <lynne@bune.city>
Cc: W_Armin@gmx.de, platform-driver-x86@vger.kernel.org
Subject: Re: PROBLEM: acer-wmi driver fails to initialise with Linux kernel
 >6.14
Message-ID: <jvfcaqkeljzzuhi7f55usgjcqob6wxqoddwhe575elnyioqrdw@on2kdd5l6lom>
References: <pyvalwtuobljjedr7e6xn2attiazy6m7ks4uv3zz5zumwsowag@yvkdhmdtgzvb>
 <831b9f1a-a4e5-4328-9db1-f703c8341704@bune.city>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <831b9f1a-a4e5-4328-9db1-f703c8341704@bune.city>

On Wed, Aug 27, 2025 at 05:13:15PM +1000, Lynne Megido wrote:
> 
> I'll test a live image with a recent kernel to see how that goes. I don't
> have the
> time for that today, but I'll get to that when I can.

Thank you for your reply.

If, in your testing, the system also works correctly on other distributions 
without the patch—or if the issue there can be resolved without the patch 
simply by manual or delayed loading—then adding EPROBE_DEFER should be 
sufficient on those distributions. For Fedora, if the configuration that 
contributes to the more severe behavior is adjusted, the problem should also 
be resolved by adding EPROBE_DEFER alone, just like on the other distributions, 
without removing the ACPI bitmap-related code.
 
> However, I can attest that the issue you mention where the module doesn't
> work after
> failing once on Fedora doesn't occur on my system. I just started my laptop
> with
> Fedora's 6.15 kernel, and the `acer-wmi` module loaded at startup, and
> failed (as
> expected). I then unloaded it and loaded the patched driver, which worked:
> 
> 
> ```
> 
> lynne@pasiphael:~/Downloads/acer-wmi2s315ms3.78%11GiB/31GiB
> ❯sudo dmesg | rg acer
> [    1.248981] acer_wmi: Acer Laptop ACPI-WMI Extras
> [    1.249000] acer_wmi: Function bitmap for Communication Button: 0x801
> [    1.280006] acer-wmi acer-wmi: Failed to register platform_profile class
> device with empty choices
> [    1.284834] acer-wmi acer-wmi: probe with driver acer-wmi failed with
> error -22
> [    8.127947] acer_wmi: Unknown function number - 9 - 0
> [   33.811949] acer_wmi: Acer Laptop WMI Extras unloaded
> [   34.414034] acer_wmi: Acer Laptop ACPI-WMI Extras
> [   34.414080] acer_wmi: Function bitmap for Communication Button: 0x801
> [   47.616969] acer_wmi: Unknown function number - 9 - 1
> 
> ```
> 
> As you can see, despite the built-in module failing to load at boot, I was
> able to
> successfully insert the new module later without needing to blacklist the
> built-in
> module and reboot.
> 
> 
> Lynne
> 

I tested without applying the patch. The issue occurs more frequently on 
Fedora than on other distributions, and manual loading has no effect. 
Therefore, I suspect that certain default configurations in Fedora make the 
issue more noticeable.

Thank you.
