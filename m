Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101203438A1
	for <platform-driver-x86@vger.kernel.org>; Sat, 26 Sep 2026 05:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790400911; cv=none; b=hrPdE2MuPz75PLCnPD4hdqNWc7i/S+mzpYoeXm0g38fBYpdOilUtu96JPA7FhLim4+7nrdbDL6ZXSC/Bppcqxk6zMb+MUZv/ls2bvzNL1bkMQ/aPjUCheq02+EUYxQ2mWbLXK0nBKQHlZXujE1SRUggV49HDgOJYr8cDAEEGEDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790400911; c=relaxed/simple;
	bh=jqVfDelRCatz8IoZuMGXl24mQwGuacef7xYu9wrEt2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T0gyIaUyytL/dhuF5VvrzhcQDSvnyAlVbeyy44g7s5bmLBtg66MVEKsOJdpDcSND4mnSqnbYmYpum81UFfe4fBwAH9BQPEyqqygaVv74XudqfA5hl+sw67DKu93niqsSrlvpDzkAMeZ5/lBhL7w7/0BaT6QxTHx362P8VFdx0NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RhiyLyGS; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhiyLyGS"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3425f2b24a4so508658eec.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 22:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790400909; x=1791005709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZgS6ZoQB//wv4pNMtltkoO1b4JMLAheYxOJXzMb228I=;
        b=RhiyLyGSKD2dE17gzGnvIz+33KrWtj32H/+u+fCze2Z2rhSxJMdRDGsTvoxUmDijbR
         ZEHeDTKzRQInFvxbaZ4Pzhtry1lAQ3cHY+BkIkGbSKQyrPNFvw6GciCFsvcmRDOI4DnS
         SQCAbhUTZNfsQe7fx/8pgDKKcn4KaFQREq5Aftm2pN0ekdco5fQlapahlK9INDJV9Vok
         80vSSFDJNjC31AzFrGwMjuiiX/Cgk29xnqo+Ig5A3AFJebWMaN7iR3znqqf3T5QNWPYi
         vqVqGyV/qhrW1mgxpsf/K3XHVTa7GOxKbjQMkwMK7UPdeO9NOP/DPdlhK94RE24wHarQ
         BXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790400909; x=1791005709;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZgS6ZoQB//wv4pNMtltkoO1b4JMLAheYxOJXzMb228I=;
        b=VOeP3Alq73BZntuQOjFciTg4Uqm8yLr8ynjV0/2iBVr2J71dLQkfEXfQBelO0cYsN3
         M4kLsEbXaGLcPZULmjkJCd0lH0pHsCri/amUJcfnJld7JQOgxve78OT6sQkr32yZvLXD
         hAxk2RRJwY4vWIXp7ZC5hP+iXaL5K2YwLo5T1bx1CR/cnmTxtUVFKWNAV1JibjiAGfSO
         EScsMMVMRYyxa5d1qq6sp1rk7eXpkFR6k75gjRktd3AKPwPdf5SIhnsX5nOhjJiw5A8b
         IhMnb0jOviZC2a0WONemKXGl6DBa0xQ7ib8htdw1tCoc8h4KRcyEdNppMJX1JoDgtToM
         IpJA==
X-Forwarded-Encrypted: i=1; AKwUvByDNkdxbavPnrgs944B53vzs+gMBOb9dnC09wPSzk9oUh34cmeke2WksPpoRQU24riFQAEdGTuFl5MIAcvbcF0M3Jz1@vger.kernel.org
X-Gm-Message-State: AFuF++lptvw433Z7uP+ivzZIvksfDSUR8dSqBG9mfqc8RVKRaPsk0Zt9
	OkF8/TJhOMuDS+5hTmTPNvtdliwTvA9Ed0L2H24QgOMYwDVU21xP0VEx
X-Gm-Gg: AYBFou1WOuPaKqcyI4zTsUJOjUD2mjZvjR64JLVbMAyRZHe8v6Plo+HfXOKLOrlTKWH
	sC/4KJa8FZoZdras+UIVHhr8K7S4XkLmTjRaaq+Zg+CGLtj4x0vV8fRHLxWcPQkHO8kjojyoS7j
	Z+5pjnUCMlursUm0njVO86VMTqwbqI7Hk4HgltXVZ709XMAqbCiw1EcpbDRwfZVYpluKgKEJmX/
	eqPWNIEu0IFyF+aH2m61Pq3ulCutUW5d2+GV0+P4tB4Z/OSr0NkcCYoMas0s8XILa57bwamoshZ
	l4QlHENcPUuuo3P7DabWA/rSC7OXTuiO46QPT+y4hxJKI3rnpmDlzEciULM+dujNLzO9sYTId9V
	nkJ1EoL//b4nZkvnt72wg9BT2xCdfhSjTRdq/6SnPc0/VqNXoWMA6giOOfCKP39zSgdUMRpMIOo
	jCbnn1Af8tZuNKYiP/JCd45ltOTyCN9dJU/TXV62F3uOruD/ImXM6XfeHeUSMY9HG15pvFMmIMQ
	lOjXRml1lxv2cIdw/REJwqv9C5MyfAB8cVa3m9/WuHJq7WFSoOajMP3kuqmLPAjN+KVorm7/OKF
	N04=
X-Received: by 2002:a05:7301:5412:b0:333:75a5:10d8 with SMTP id 5a478bee46e88-34273e309ddmr1956205eec.27.1790400908838;
        Fri, 25 Sep 2026 22:35:08 -0700 (PDT)
Received: from archlinux ([2405:201:1b:20ef:8b08:15c4:66f2:a984])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3433628f5basm1648812eec.18.2026.09.25.22.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 22:35:08 -0700 (PDT)
Date: Sat, 26 Sep 2026 11:05:05 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: BurningHoryd <sjunhyuk1@gmail.com>
Cc: linux-usb@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [BUG] HP OMEN Transcend 14 (board 8E41): GPU power ceiling on
 65W USB-C charger is non-deterministic
Message-ID: <ardXy3mJuZg7trP2@archlinux>
References: <20260922192312.40607-1-sjunhyuk1@gmail.com>
 <20260922213218.5334-1-sjunhyuk1@gmail.com>
 <arVGfB1PV7kt2Llq@archlinux>
 <20260925134148.435774-1-sjunhyuk1@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20260925134148.435774-1-sjunhyuk1@gmail.com>

On Fri, Sep 25, 2026 at 09:41:48AM -0400, BurningHoryd wrote:
>Krishna,
>
>Thanks for taking a look. The acpidump is already up -- BIOS is still
>F.05 (same as when I captured it on 8E41), so a fresh dump would be
>byte-identical to what I already have; no need to redo it.
>
>Full acpidump + decompiled SSDT23 (the table with the NPCF device) is
>attached to my earlier comment on the NVIDIA issue:
>
>  https://github.com/NVIDIA/open-gpu-kernel-modules/issues/1162#issuecomment-5779711336
>
>Same topology as board 8D40 from that issue: NPCF sits under \_SB as a
>peer of the GPU rather than as its PCIe child, which is why the open
>kernel module's NPCF binding misses it and Power Management Object
>stays N/A. That explains why >50W Dynamic Boost never works here, but
>it's a separate mechanism from the 25W/65W split on the 65W charger --
>PMO is N/A in both states, so it can't be what's flipping that.
>
>Happy to attach the raw acpidump/ssdt23-acpi.zip directly to this
>thread instead of linking out, if that's easier for you to work with
>-- just say the word.

Thanks but I can only find SSDT23, I wanted to take a look at the HP WMI
side too. Is it possible for you to attach the full acpidump instead?

>Thanks for flagging the missing Signed-off-by on the other 8E41 patch
>too.
