Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156AB3DAC02
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 13:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688385; cv=none; b=uyi4cIbio0DReNYcQ3eZXqid1nrBHeOKC6l49rbC6K1hhvGCasKUjcRoCEK3XNFOwEpsLYOCKJW5/pXnF2MFzp1GCCNQGrfFo+fElO3oeba6GMGltQqNyS0QVb0JU6jSPNyWWiNxHA8elDrGf8+cxxsuW1YIn5B8i+A0u4hhbu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688385; c=relaxed/simple;
	bh=XYJ121tcwt8Pk1Ea6bO06cIMEmOF6Tdyk1jKVmV1gKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PEoMB7e/Ju5xPM270x2VpwG9h4nanQBZyCtwF9S1EFsCpG0TYxK7h5Lhk4i1BF/4743wNP45r1QOEZiyojhTLVTfKWtGpkwZkQ+CQ/80l6W1186/+4ZlbenVYLn42Cqjh8STWOwLzG0FgHTPVROGLNBmAjHPs6Lizv0OpVznGFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EidNkV3U; arc=none smtp.client-ip=74.125.229.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EidNkV3U"
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-33e5ae86ff2so1438196eec.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 06:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790688383; x=1791293183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UhyYRQHQ87I5M5mEOfyWjhfFcg5NiKnh4Prr6HH1V6Y=;
        b=EidNkV3UN9opm4p8k2FL+K0NJTCLct41wkyW6VA1sab7RMo2BmGJnAdMLW0V9y9PNu
         IcofJeHPf6FEiqBPkQpl2Ka7aGhAh43dLhKkSUWb/uaRKR36stKu75UHtIUHkmDOGCzE
         FloMAuWlSwvW5jZtvRY/E1rZzun2JubcxjO7ijazarYE+Aq3Xhw3cOdTleCWo2Zq8WM1
         XKggPWSXS6hUS2Y1aROnqx2di7XjYdz+TUkFK3YcDxGprF7n0Fdcu2sBEbTEPzUPFkuX
         5U9c4Zt8HfncCv0hLdcazDTW7lpJ2kFDPOUvefDMo7vgS88LNknX0/945Lt6f4ect3mY
         rGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790688383; x=1791293183;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UhyYRQHQ87I5M5mEOfyWjhfFcg5NiKnh4Prr6HH1V6Y=;
        b=2Huuu84rVqTFSUVBHHIxlBbyt3nNJNkrjVf7QEp5k2FWVWrelTrQkv0LMFOjzb+3bh
         qmfKSF9OQWU5v8EeakdYIV8QixoUiE5j6/vmPCVhKKacbxV997huANEviZtEAjR7OqB5
         hX5IzJik24zsZTjVmojrFDX0rAKwgvD25RaBb9anrPVV09Rqxz2U+s1KlJ19V/XB/04m
         hhBW8W4EECvGqNk/HEq45su737ewuJMrd8Ib+g84SOc26+uKsQ5om7eZDB8ST7TkoGE+
         F9Yenr4Kaq76SJ0sUhOthLk0pn5ALEuMU03HmTonXmpQTSkZAdexNVGxYEeCKZV3ubEz
         NcLw==
X-Forwarded-Encrypted: i=1; AKwUvBz0AU0NyB64A50jd5sLczlCQOOj69n1XAa9BbHhlWo1k4xIF71ctVtMXu8VzgtRwC1biYGlCB+QE4q2TEM6GHqxNLBc@vger.kernel.org
X-Gm-Message-State: AFuF++kLsxZU6/p4SGr6aXQwGj53dsY9tmLA398QGPyK2AEJYUf0j0+t
	VM5w78jhjVJPpLhudvRVvvelVEUEjMt1OwCozkOobPItOWDPGKIWVnfb
X-Gm-Gg: AYBFou3Nrxh4zn1oaITwbU/vZzriRbLR2JXHX6rguDz0jg62Z/pB0aji0+tGtViLk1j
	u2P4yiyLf1eYwjtTJ78plZas1TGlPaHPUV8MCJnX0jwcmC+NGUTjvIA2BTBPsP8VIQSNXY5CDfU
	Xxwxl60cWifZxwdWz+p+Zd2aXl2V1oqa1EZCUyaSiV+49wYotIJnq9B++babVOcp9u+BTnNCsjt
	ODkqaIdYrUa5vZciJdRPhipCsqdMPsiKoRQEXjNXTChdkXBJb2iCIrN7nci7sqJCvdRHyki6X2T
	bTEiXLpqpja/gzfRPap+3mNy65CfwYRKJcPAg1FNuGFEV8KucpkPynOmW+4tZ/CSAy64QRk8ZcZ
	unwykKhVx/VGCAP06oLtdxP7lbeS0DpNsAKFBAOi1o9PQhnw9jPbQ7ogrLZQA8aO1LJCEbF3o4j
	63v7H3V1hDYj7HH3lBq4XHBJl7qjLnJDrKHr3Wx42UhTBEw//CJoH+fLtSAkMul16mRe0vCplSN
	jgxqZz8
X-Received: by 2002:a05:7301:4d0f:b0:34b:8832:8706 with SMTP id 5a478bee46e88-34b883287ebmr1521357eec.35.1790688366426;
        Tue, 29 Sep 2026 06:26:06 -0700 (PDT)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144f4eb9esm36468431eec.19.2026.09.29.06.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:26:06 -0700 (PDT)
Date: Tue, 29 Sep 2026 21:25:39 +0800
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Ruslan Koreev <koreev.r@gmail.com>
Cc: sakari.ailus@linux.intel.com, benjamin.mugnier@foss.st.com, 
	sylvain.petinot@foss.st.com, dan.scally@ideasonboard.com, mchehab@kernel.org, 
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, pm@petermarshall.ca
Subject: Re: [PATCH 4/4] media: staging/ipu7: Add monochrome pixel formats
Message-ID: <aru5-aq_sPUDy8dq@ThinkPad>
References: <arY2CULvwXGyVvH_@kekkonen.localdomain>
 <20260929092238.1765758-1-koreev.r@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929092238.1765758-1-koreev.r@gmail.com>

Hi Ruslan,

On Tue, Sep 29, 2026 at 12:22:38PM +0300, Ruslan Koreev wrote:

> I wasn't aware the ipu6 driver had grown IPU7 support, my base was
> 7.3-rc5. Tested now on next-20260924 with the ipu6 driver and patches
> 1-3, the vd55g1 one reworked as you suggested: the sensor probes,
> ipu-bridge connects both cameras, libcamera streams Y8 804x704 at 58 fps
> from the VD55G1, and Y10 and Y10P stream with plain V4L2. So this patch
> is not needed there; I'll drop it in v2.
> 
> Ruslan

I tested patches 1-3 from v1 on another ThinkPad X1 Carbon Gen 14
(21V8A028CD, Panther Lake, IPU7 PCI 8086:b05d) using the ipu6 driver on
next-20260928. I did not apply patch 4.

Patches 1-3 applied cleanly without local changes. The VD55G1
probes successfully, TBE20A1 is discovered by ipu-bridge, and the
media topology is established as:

  vd55g1 1-0010
    -> Intel IPU6 CSI2 2
    -> Intel IPU6 ISYS Capture 16
    -> /dev/video16

The sensor reports Y10_1X10/804x704, and /dev/video16 enumerates
GREY, Y10 and Y10P. Setting Y10 at 804x704 succeeds with:

  Bytes per Line : 1664
  Size Image     : 1173120

However, VIDIOC_STREAMON returns EPIPE for Y10, Y10P and GREY,
and no frames are captured.

Since you reported successful plain-V4L2 Y10/Y10P streaming on
next-20260924, could you share the exact media-ctl/v4l2-ctl commands
and any setup performed before STREAMON? I'd like to reproduce the
same sequence before looking for differences between the two
linux-next snapshots.

My test base before applying the series was:

  6375e61c01e93e35ee7acd336a689ac1fae4b509 (next-20260928)

Hardware: ThinkPad X1 Carbon Gen 14, 21V8A028CD
Kernel: 7.3.0-rc5-next-20260928-x1c14ir

Thanks,
Qiling Zhu
