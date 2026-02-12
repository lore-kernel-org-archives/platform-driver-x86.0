Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D8E2AE78
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Feb 2026 13:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770902323; cv=none; b=tSo+ptl5e4gLe4DJHNfam0md4Cd82/ATUC2jxPr8yMoQv6TBR3WFNMQjRy7FAs5wjIqdohvbL8EGppWUogdlRaor/xNeam03LlovWas61DLsPD47w+aM2EHLznm3VWdcfrDSvRIFTiKTc6+COZ1ll9CX/S6p12sBxMiV7QA2ncA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770902323; c=relaxed/simple;
	bh=1frNnfCy94N8L6Zz4/8oBPoJbMtE3urATbo94siWtaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kh1JLyLJSjEi4gu3XEzzgfBUKkjkyrSqSM+VaT7l046SsEaIiwd4MqlP3So8F9khVodbhIbo2hsBtrECnhpmATRjZmo3ztrUEeSArL8diwfpu8In6qvQQ205UPvR0076fEaTSRc+ycs2qabcQt4uT9udzA6b/yDk1nrshBgvgMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jiapGp/b; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jiapGp/b"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ab077e3f32so17223775ad.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Feb 2026 05:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770902322; x=1771507122; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h3TzbP+o+yfzPyWrI0kYRMxNWHXMn5HoWLLDKziSLYE=;
        b=jiapGp/b0/z40O6AN8X1CiiUmI8QynUV6MMau/Og6SblTg8oN/MaMIMCYrFOyLUX1v
         rh0/3lX5iqZYSPPRcXNAcncZHUYHKLGdjZIpeoJs3U9POkTelXBF3NQiLRkgxjmdYhQ4
         rotKVrLdt3GGPUQIE1OEsTy4oruHfpv6j5SRKUqf3Wmnab2je1AjPIa8VwhN2gu8rHb2
         J6p1899+s8GyySP525nc01pAl2e3mKHEuLpwZ1R5QrwZxGZ9BL5IywQArHwVe+hw6Dy4
         eoefho5YDB2GQ0DBQmU39HuFaOauqaIPCQBckaLquTyNDlDBL4TZ2JqUFdTQWusWss9z
         cBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770902322; x=1771507122;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h3TzbP+o+yfzPyWrI0kYRMxNWHXMn5HoWLLDKziSLYE=;
        b=sCUB+O51Ym2lly7roI2QGxnhzt0Y5Lj9tgxEvKr6wo3FgwKGQm2jG0zlGA+fphGXy/
         GhVvbOMqvN26H1VfAA1vKZKjrhXO+EGOmjj4aT/P1Tc+LDw6TUDQjxZx+Js2u3+Wnij2
         yU5N5rjEdtPenU70jXNQg+Uy0n0OXmH1dwDL71bbNZdfqJJyqeHyZpX/Gp+loV9uBTJR
         MqFBCnT3mSKd51ZyLlvwnJ2gMnWL8HDeBR/gbPJi9n1fSgMYoApPOaHkvrYXIovdnyaf
         MSCYqbgOQXoR+nFWwM4CpjR7IBDgk3lzR94TYP0zZmGdXIYOFfQPZVj6lWGlFouv94DP
         vKlg==
X-Gm-Message-State: AOJu0YymnhNw7CI8IBVYbtkd8pCC8k5CAtGeyk/NVdUKS21fydt/dmeL
	rjcIAIuNTMPMkoCD5g70CFZLdR7f+/xh4DxKr6Boxae21zMsakUvyUJA
X-Gm-Gg: AZuq6aKVi6GQ26RQLoZQECRUdgSIFR819r6ldVRvjcyCXY7eFR59deN8JTZinm8zLy9
	sIkHJTSCEkoi3ybQ5+siM12pAFtrKd6rcvkuL2OnI57DV7jJo5cfFeR7VG1ICpSTWmTqQwDK/u/
	MyZ4n53o7Vej6VwNuYwxEhrhpeSlBGEa6WyBQy0hi/SZFiWeDXqRtuVCBB79apOx3VypFm2IlCy
	OWf1FGzw8ztNg6HWAoECR74Lw9ifP9VSSMItOtp/NjkEHvXQY+27rR+4FHWYyGiF+rR8XIG61GZ
	q3B4EbWWt6pmo9TXTBTeaoX4mcmd3CO1AL4ckSVtg8XqGhKP6FzOEf9vyYjD2UKTc0xQXwWn2oe
	+MVrOBeH/wBp8nxJkbpY3OhEwIX67xgm2HYu8l9fQ7M4QL8xwqn89Lr1r5XFsm9z3o8eKqpY4Ji
	RmciYu8nNH1WjdnKB6VgZjNYzlDBk3muz5UhOFtktU7RlcpBAVe68aeSzrF7nRdyrAVQIXy4C9I
	1gy7B55vWMz1GQoLCqK
X-Received: by 2002:a17:903:3b87:b0:2aa:d611:ac69 with SMTP id d9443c01a7336-2ab39c62378mr25958085ad.52.1770902321797;
        Thu, 12 Feb 2026 05:18:41 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab29964c62sm50968665ad.55.2026.02.12.05.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 05:18:41 -0800 (PST)
Date: Thu, 12 Feb 2026 18:48:37 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Juan Martin Morales Ozcoidi <juanm4morales@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: platform/x86: hp-wmi: Add support for HP Omen 16-wf0xxx (Board
 8BAB)
Message-ID: <aY3PNMdQag84XyDv@archlinux>
References: <CADM3J-ABWx2z_zsgJ0xGuj=29sT2zPMqVN0GH88pKYbkfZdrjQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADM3J-ABWx2z_zsgJ0xGuj=29sT2zPMqVN0GH88pKYbkfZdrjQ@mail.gmail.com>

On Thu, Feb 12, 2026 at 04:59:00AM -0300, Juan Martin Morales Ozcoidi wrote:
>Hi, the hp-wmi driver currently lacks support for the board ID *8BAB*,
>which is used in the *HP Omen 16-wf0008la* laptop.
>
>Due to the absence of this board ID in the driver's device tables, the
>driver does not bind correctly to the hardware. Consequently,
>platform-specific features such as thermal profile management,
>Omen-specific hotkeys, and WMI event handling are currently unavailable for
>this model.
>
>Relevant DMI information for hardware enablement:
>
>   -
>
>   *System Vendor:* HP
>   -
>
>   *Product Name:* HP OMEN Laptop 16-wf0008la
>   -
>
>   *Board ID:* 8BAB
>
>Verification via dmidecode:
>
>$ sudo dmidecode -s system-product-name
>
>
>
>*OMEN by HP Gaming Laptop 16-wf0xxx*
>
>$ sudo dmidecode -s baseboard-product-name
>*8BAB*
>
>I am available to test any patches or provide additional technical logs to
>assist in adding support for this board.
>
>Best regards,
>
>Juan Martín Morales

Hi Juan,

Thanks for reporting. This seems like an easy fix. To make sure we don't
lose any details due to mail formatting issue, let's move the discussion
to the Bugzilla entry that you have opened (#220639).

Please upload the output of the following directly to that bug report. I
will track the progress there and will notify you when I have a test
patch ready.

$ sudo modprobe ec_sys
$ sudo xxd /sys/kernel/debug/ec/ec0/io
