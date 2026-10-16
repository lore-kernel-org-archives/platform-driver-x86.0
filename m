Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3823256E059
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 17:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171582; cv=none; b=M3M/PaicIRcc2d8XTJh2GJfPSa1kuxgrztMhfbChH6GURxs7GvM8GsNs5o22cSizUU8fk6zMv3mKBeAWHohzBfNOEkAkM3up70N5Eq2jOnKCS7c3Y/lMB5Mn49mex0SMYL8Tad18uCfklpkv2O2Rk58L+Yrvyck8VsMiRORl4s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171582; c=relaxed/simple;
	bh=M4ytFOlsuAxsi/XkpYodCf/7zbjSI9R56ThsIDKe7B4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AiQN1wxkokD7KRXXf0IyWeDihy+fUJdNYimb7efpztt8PPQO3/HV6K07Qqn/EyUdQrP+mX7BUHLmh2sH1nvjkeDazrIjV89q78yn+/N4dxYGjb/LS3StGTyfhx+cP85F/T6HGJ3FYx4Kqe3s8VCqS+W3ZszjwXdokyg+wiAYqU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YT9r1tyk; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YT9r1tyk"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e5fb79ce82so545325ad.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 10:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792171580; x=1792776380; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M0sMKvoCBddf3NULdihue/8J2Gg5vlScxeExo0WVuVY=;
        b=YT9r1tykwfy+qmrBSU91HMTTkCjnU8RjsmfQNLfQ3XzLTlze4lqW156PQbDydcvjJb
         jfAQZ8gjslI2PqFe2tGlwkqANkTSz04sCQ8k7n+Sb1FuYK3FQ/RliVmeitvEC0ouOt8q
         dmkKyx+3sd6wDB4jIBlv0FVF9plW7wk2iM3xrAgZ4o4uueqPkY1LotcrxSY+Mw/xV4X0
         z0xChxpPXmheaZAGkyDGNjkpwFZ97mahfyfLyb2oLaomBe8dD3JRmmwHmftvZI6ITzeX
         BD+IxG8LrqWR9y6HRedL8VtKBynpKXhTz1dIHJbBbnbDA8lrac6jxn0sUbp6LAbc7F/w
         uRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171580; x=1792776380;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M0sMKvoCBddf3NULdihue/8J2Gg5vlScxeExo0WVuVY=;
        b=ViQKKdx24ozvWZWcIWFwkECriEXA5PkvooOSazlStqHclSNK1Tx7XxZ6zrXTkc//yG
         2Ej9gKMy585n9YnodDaqEdRVTVvEjBnQ9wLzsbs3/+Ckgi+i/qVKf7mktvdu1BXRGyxn
         boYhu5ZDaGe75ik1u0e4kuuhb8CVci39qXtyOp1o04nws9nrPhOcka5YqxLmx/TLKqsc
         zevsQLWO613NZC3zYkU1rXbF2AhoEwyDbGcz54zr1Ed3Fygkw6DH5ONwbuN3Isypn3fM
         /mWTYaBRYMpi4ndxZohf3uXXmQItL1FgxMmA8+Nmh4hkxz9KpQ/0M5dxHz/YfnD8kVdR
         OCUQ==
X-Gm-Message-State: AFq9FYKQcHNVNboU+p4PuFwYv3GeaZKsDAUCxqoBQ/fci72sQyE8OaN6
	v7NKjOsP/LIFXZ7SsTuVOZD7PtrrD0egLktCexz75v1kqveXAHiGhv2/
X-Gm-Gg: AYBFou31wA9TArpxJaYOLxnjpooClDzBZKocQWskZt1p2d9+yik/zXJ3zrSDb2QH267
	KII+6r+8Oy/EfliFONXRgzRcp1D9Ej8y/T3QY/ttE4mKz9W9xXujf2MGyx4ED+NB6qv9J9LqRXe
	PTBlybea2xyd64bR1cW7suPrCZUus3MQBuvng0hJb4cXNisvBc+jEwTuEMQ1w+fpziXg2w414Ei
	bjhOSIQjUBwZ/bPLXLB9yfJlhO0bqK5eTlZmETuIy/sKH+3MjTVYQ9ATWsgHO0l5OxrW7PmNwfP
	mZSUaFRsVU9RVOU2GWmhZaKXUexRr2ARC2s6wGQxW/B0m/EnADTO+PM/8639NDniOVsDY56+oJ6
	axEE/GC4ZM9D3HNQY59HX2DHLBrMN8h+V7vKC/f1di7tMMGFe75s3QFRhs8MCFsHetVbvn1XQ1a
	SHaW/U0zV/gx2owFUZM2gQ96I3MuPOt44IEY+OAmi1HtrK/s1gTHP67h+mhrsL52bNEcQ/Yi3vp
	cBCx5DOsi4kX19tLzrDg34mr8xBTyNox2a+s5e/7gbw1yUUCs1IVCI9Co8lKsRAmgHs
X-Received: by 2002:a17:903:2f86:b0:2e9:460e:ca49 with SMTP id d9443c01a7336-2e9a68da459mr5690005ad.18.1792171580463;
        Fri, 16 Oct 2026 10:26:20 -0700 (PDT)
Received: from archlinux ([2405:201:1b:20ef:268a:fa82:9f05:61a5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e5d5558sm13901345ad.7.2026.10.16.10.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:26:20 -0700 (PDT)
Date: Fri, 16 Oct 2026 22:56:14 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Lorenzo Collevecchio <lorenzocollevecchio17@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, W_Armin@gmx.de
Subject: Re: hp-wmi: WHCM AE_AML_OPERAND_TYPE and fan init -22 on HP OmniBook
 5 16-ag1xxx (board 8DF4)
Message-ID: <atJc2J2hYrdI_Eun@archlinux>
References: <CAPvUaSo1D+1Tvk3-4TMiXw-ScBtY8Mu0FzO7R_EG6zrjYfjYqg@mail.gmail.com>
 <asxTYBiGy6lf6-Ki@archlinux>
 <CAPvUaSo-ubCOCYYPadY1C23y1Fd_AAhQLuVKWRa6F1XVh6mk_Q@mail.gmail.com>
 <asz7WqGzukhkYHGD@archlinux>
 <CAPvUaSrbWrBuvAi3R02xC8w8M5Yh97pVd3-+FBXLp3mPgG5cUQ@mail.gmail.com>
 <as0bOFOoaaw-smyB@archlinux>
 <CAPvUaSoBgAG=MX93vMhfEiEk5bYXGydFsGn8CpoCu_QVQRPTCQ@mail.gmail.com>
 <CAPvUaSpPVYc-5M72G0Hf9JPsbdAp2-4f-p5OetYbMKdLqm0PXQ@mail.gmail.com>
 <atEh9Gon95EFIq76@archlinux>
 <CAPvUaSpq2d5hkxTaqAL6rBoeHct68Y37C4nSpV+goGZ-QwrCsw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <CAPvUaSpq2d5hkxTaqAL6rBoeHct68Y37C4nSpV+goGZ-QwrCsw@mail.gmail.com>

On Fri, Oct 16, 2026 at 09:06:03AM +0200, Lorenzo Collevecchio wrote:
>Subject: Re: hp-wmi: WHCM AE_AML_OPERAND_TYPE and fan init -22 on HP
>OmniBook 5 16-ag1xxx (board 8DF4)
>
>Hi Krishna,
>
>Thanks a lot for digging into the ACPI code, the explanation makes
>everything fit: the missing GMCF call for HPWMI_GM, Local2 being left
>as an Integer, and the -22 coming from that.
>
>I also tried your suggestion about the platform profile. With
>HPWMI_READ/WRITE the errors should not appear:
>
>  Before: dmesg | grep -c WHCM  ->  3 (the three boot-time errors)
>  cat /sys/firmware/acpi/platform_profile  ->  quiet
>  After:  dmesg | grep -c WHCM  ->  3 (no new errors)
>
>On the fan: thanks for confirming that acpi_fan reads the EC value
>correctly. Together with hearing the fan on Mint and on CachyOS at
>idle, that makes me fairly comfortable that the 0 RPM readings are the
>fan really being off.
>
>Your plan to query the fan count and hide pwm1_enable and
>fan{1,2}_input when it fails sounds good to me. I am happy to test it
>on 8DF4 whenever you have a patch, and I can rebase it onto a stable
>kernel tree on my side if that is easier for you.
>
>I also tried 7.2.10-1-cachyos: dmesg and the hp-wmi hwmon folder are
>identical to 7.2.9 (three WHCM errors, then the -22 message, and
>pwm1_enable still present).
>
>Thanks again for the time you spent on this.

Thanks, I will share the final proposed patch on your Bugzilla report
(222138), and leave this thread for others to pick up the WQBC/WQBE
errors.

>Best regards,
>Lorenzo
>
[...]
