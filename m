Received: from outbound.soverin.net (outbound.soverin.net [185.233.34.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D79385529
	for <platform-driver-x86@vger.kernel.org>; Mon,  7 Sep 2026 07:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788765855; cv=none; b=GTdi2wKV3tqQsFb9gLj77i/vAYSMGZX5FbGNGXedYJPSyEu/Bq0H02LgJZBhlCeEJUB+T/mmwTxk44xZROWzSAVtjdOs+qm6zBWeMwyWD8Tx4e1OS6W6BfSmfgj2twLq5v4eVN5nmjXaQXz7F6p0ysGsreRrHlyFRCxRcyrQ+0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788765855; c=relaxed/simple;
	bh=yM23ltILx4sxudnp9jBVacLVjTapD+p+bgo+u+4/Lg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TpBm7kwOUTfATKt4kbx3OhFHYy6ohYVBZZG1p0qxUYdscC6i4GDH7addvfpfGchr+rntylkkrI6EJbxzzF1wS3vMiviBbWnAdy5U0WkIu1CJTgtnkpDEFbq048bU7QWAlzVCQ6LoEQ5pvfnaSmFZEgg7pVti7mxwqHOEIpxhNA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lewisclement.nl; spf=pass smtp.mailfrom=lewisclement.nl; dkim=pass (2048-bit key) header.d=lewisclement.nl header.i=@lewisclement.nl header.b=gnWj0jkW; arc=none smtp.client-ip=185.233.34.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lewisclement.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lewisclement.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lewisclement.nl header.i=@lewisclement.nl header.b="gnWj0jkW"
Received: from smtp.soverin.net (unknown [10.10.4.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by outbound.soverin.net (Postfix) with ESMTPS id 4hddhF75VZz1xqS;
	Mon,  7 Sep 2026 07:18:05 +0000 (UTC)
Received: from smtp.soverin.net (smtp.soverin.net [10.10.4.100]) by soverin.net (Postfix) with ESMTPSA id 4hddhF3wQGzJT;
	Mon,  7 Sep 2026 07:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lewisclement.nl;
	s=soverin1; t=1788765485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DScAlIm04F+175xCrBvX683PBfjk0Inm0ljCU55iKE0=;
	b=gnWj0jkWNYn2wlzsh6yM4w2A0/IUKNG/zEYQJW5ebCktX+FB93NP/Z63yYSdrwGQSXUe9d
	fHYDaQqklbDndUVp8ORr0FXjEp87jKDLICcBi2BcAQd/wpoPpPixMM3nwZS2SGHQOFY9r5
	VCPGZKGD5jy/Sy2IkSj8h+BDrRPBePDbjmyMfpsWgurfNY7nzzE244yYPGv0gYxloPHnoF
	0Y8tydtbfcfkb26KxAIObPeep2l/UATgB9m2Qqx4HQEg7UdNX5k7jj0c9A6QwNCh1/q/Wn
	ehhdamF1SBHP1sT/tYsDRvjqKjDEsgJauXFxT0idaHhUCjgePQOokr9zgNILVg==
X-CM-Envelope: MS4xfA6FjRbdVsfdJL5f5Tn4/V1TaQduKe2VvlMnpiKBZ9iFjyImAgoWyFGBBSQqx+uLV7SLP8BquqiZYibIQfz2lT8OXSD+PZ1bV5opLrlmKTIn5b7LX3f9 wa6HlXGnLCaCHmRx1p4gHmwTkg3TH4m7o+0fBLOAzyZJ0aqdGo1dXmciXZc+v2pE6F6MUFbW4BPWtyXd3LBRU5ISyTkX98gkQEKO0WznHY0XnoSdx2N4RAwU VseSzgoMHY14qNgCCbe/oyxFaF5jQMH3RrZH/Ab6io/k8TngllcMAivVJJHSQsX8
X-Soverin-Id: 01a07abb-37c8-73ea-8982-feba2b0a360b
From: Lewis Clement <lewis@lewisclement.nl>
To: platform-driver-x86@vger.kernel.org
Cc: kuurtb@gmail.com,
	ilpo.jarvinen@linux.intel.com
Subject: Re: [PATCH] platform/x86: alienware-wmi-wmax: Do not enable G-Mode for Dell G-series
Date: Mon,  7 Sep 2026 09:17:35 +0200
Message-ID: <20260907071735.35805-1-lewis@lewisclement.nl>
In-Reply-To: <DL6Z05M2G2LP.2OVU37WYH5R3U@gmail.com>
References: <DL6Z05M2G2LP.2OVU37WYH5R3U@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spampanel-Class: ham

Hi Kurt, 

Thanks for taking a look. 

I would agree that losing the option for enabling the "G-Mode" isn't desirable.
However, there is a semantic issue in here: what is normally communicated as a
separate gaming mode now replaces the normal performance mode. It took me this
kernel driver investigation to find out that switching to balanced would've
fixed my problem. Since my device configuration doesn't have a G-Mode button,
I wasn't even aware of the feature for this machine before. As far as I
understand it, performance is commonly the default selection by distros when
the machine is plugged in, so this behavior can be triggered without the user
explicitly choosing G-Mode.
Also, I just found out that in Gnome desktop selecting balanced will enable the
Balanced profile, while selecting power saver enables Balanced-Performance. 
That seems confusing to me.

If you think this should be addressed in userspace, 
where would you suggest this needs to be handled?

Attached you'll find my acpidump. 

Thanks, 
Lewis
