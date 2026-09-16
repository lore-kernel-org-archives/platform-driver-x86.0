Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8A34B8261
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 20:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789589084; cv=pass; b=Y/Xl8iOMPWigww1vN5iZTbssG8NCX/7L5Rak8MX+zcumQqWMK7YnSjHozSfRDQNTpiB2B2ErMCWIIXXnhM7OqQ2iAPmfKOJDGgnQC27JHvpmji/eJzTGg2XuJyTYMSUpVwICdat0PoIRg00Rtood6a/codNTYNPM03RPYQaw+os=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789589084; c=relaxed/simple;
	bh=VovxLMqQzT9VnXEmjSuytSbvxklscy/JO/24zxbnrzQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QTuu3UKPrgULRVM7nSWwzqAkW/K/53Fgel5/t/hwF1xzSZy7e947jZxv63BBzftDZtntJ8OBrv32ZXdggkG6qa5KN1LFZXo/HpaSHue58kH+bwxiBmWr3ViM6Ac2ui3kC9W2QyLs+3AuzRai3Hg4G1qzdYZPEtK4djIGndgAK10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=hkZtzr/N; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="hkZtzr/N"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1ca5b0d6so997375e9.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 13:04:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789589062; cv=none;
        d=google.com; s=arc-20260327;
        b=mzTaaZP5MxGDwX45+Rzg3eretaEDZP7CzBa8LyNv/sebHWDuvbDjvYO2oKp+cT3sBD
         uq6MTZ5OLC9wRCzfznxXS42W4T5M2BO2MdPiQGuVES6cs+/KNOdIsN4DMpTxwv9Ae0zb
         tJv/YwvVW6EBZbXxUu0MOaEJ1qnIHwSpyeOMGBCUG7yDWPjExD/8fOUMMirjxapedzKF
         Igpq6Yod1jIXXfLwLzjrOIZa7gBy/xY8lpINeq4ySQTKCEM4H/JUqs9YfwqnC68CXUDw
         g5FxBnJ6b8WAcP3YPac5FX7+zDD9usT9Eg2mjXIH9yfpzp7wxOOy0Hov2YyibakrJGiq
         b2gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VovxLMqQzT9VnXEmjSuytSbvxklscy/JO/24zxbnrzQ=;
        fh=Np+EdOq028fPtpPw46XF5JZpnQPHfO+AwlBH+S0HKOE=;
        b=FfouL2lVNLxU8/9lrYuxJE0O6DTV0uukYBy9fV4QK+s/LyMaLOawAgGXt+y9kcel2c
         0IJ9oTqaZXbtdJfHyV5el+Ddxa5vgQbl+hWpVDZeC73Vqgy4qg9yZEyOjPo9lkwMF1st
         SMRTLjslqppPLwCaXzDtAocpv7gS2Rwhc1ngsc0bpIYjeUtPJMPNGdHiQzl6DnCycvNp
         y83bARUIdUW3dnwqAzKdQtLWGP0TfLCBOEpQUeGqytxVgdAkc9O2aE8yL7bDzpBWojDc
         UR5erlAvCazOS0khRKmixd3xZDiwMO7al69XzzhwrGVS5Y9Eq2N7fBzHv38I3pWXVjHl
         8tkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1789589062; x=1790193862; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VovxLMqQzT9VnXEmjSuytSbvxklscy/JO/24zxbnrzQ=;
        b=hkZtzr/NVvUd4chViSFHNKmFI1oLEZZmeByo6ftQAN/15zpZTaqz07Tc/w9IdRilwU
         g4Os+bpjdIZu51WEcLMjnBrm6JchwMMJb3ZPBZlTTJpuDozipaf9xL5s5rE0x6nY5rLJ
         XXmbAuF3iyJwahXXmmg6EWqm+g/L/wuVlGmYxiPl7wI5W8Ed9FZ3BzQU9W8flY5WSMzV
         51gLQH35PKlR3zbjc9EI4+hWOtEokgXLMJjxSafGV/BnmshAZSuqZdiXSN0g4th2RVTV
         Nz0FxvIsHlAl423yzMqykKI673YjL920QNDUZDUS8UCkkJ5BRIdln4mlO3QfVXJmfOkC
         z/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789589062; x=1790193862;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VovxLMqQzT9VnXEmjSuytSbvxklscy/JO/24zxbnrzQ=;
        b=URtdwHUaNIuJz/Aa5k0nly+K4T+A3XgASPHp+6ZFOmtA6CdxE5oDk37OJXDLGiwx56
         lCukQMVL9StEm6WPGyFyIEiBLZighugv6tONaYYyUSheM3zOYH/uf5iOZNLhOOpep8cK
         BetmZ01g0U3BnLKZyg24s5VCin0BR0CLCcBnptNnkK8Al68HgZpZaGpS5ETNcobosdwf
         LWu3RAX3Ttl8vz1ONWMwh2pRJ/ClgSNbTsRdfEAvV20rkJ001KM8QIDZhn5VkyMdXiND
         O5appEQoUdpoi+ALzpOupbZC6RjGLv4cq1Rgh2rN+12Occ4cFU3sHk8UAz86pdCUJ0qm
         pY4g==
X-Gm-Message-State: AFuF++kcsaOdRe3Dsoi53MwYBxW5CWI6ZFQY4Vq1sND/mqieot4daICr
	Qu45KHaRKx86AiJXjJuBgFByrsHKu49/DFdwlQEYSZiV8+5Sn9ZC5nSJ5yvGex0xFqCPSETAL0+
	5SUwaz8+R6f5eK0PSxmig1ODFmkwmMvF37ysSHQk=
X-Gm-Gg: AYBFou2/E2tW10QruHiCMHlYfIzI1vK5YBEX8gtkKNojjxfSvxy8KzhpFdg8PCncDZ4
	t8I46hkAGX08KcLsmmdt6/RPbYUFisMWyTALhts1hsZtYSeqwpYZNR6cPqHUsSua/vxPY+owrX0
	Ka04NoueEyeudmDvdAX6qEvjlAIGNX5LnRd/IvAZE7AIWwINbmq7Qp16rwDFu8AfaVP+Brs0GPO
	/dsAop6qNg7/MYZJpzH9TXHWCa9gAnLnrnAs97GTXPGO8L2tRvPfKsfnq24W45osx8FDRdZgTmC
	i6RcSjnEqwadtfSit6/2vUos6RBFfQG5KXItLw4nNxZiFcit1ZfSkIw=
X-Received: by 2002:a05:600c:4e8b:b0:49e:73d3:78ab with SMTP id
 5b1f17b1804b1-49eac4116e3mr46191585e9.0.1789589061548; Wed, 16 Sep 2026
 13:04:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAM=nh0S9e1+_U4WGR92HwOrNC2h2xYb6eKvgN5_skg-vvbSbqQ@mail.gmail.com>
 <d8d7a246-00f4-42a5-881f-66839eb6b302@amd.com>
In-Reply-To: <d8d7a246-00f4-42a5-881f-66839eb6b302@amd.com>
From: Karsten Wiese <fzuuzf@googlemail.com>
Date: Wed, 16 Sep 2026 22:04:09 +0200
X-Gm-Features: AcwNN1WOUGUXhS_OmGoGrE1ws1Gk1e3lxRwE27SXbWvUnj2W59Ep215yhJ8TD7w
Message-ID: <CAM=nh0SB5uhsqGyH9v_1N1oZsv94SmrJTqWi_0YVbULgY-c_aw@mail.gmail.com>
Subject: Re: amd/pmc
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> * What issue were you having before?
The system would hang on suspend to RAM infinitely. Sometimes it
suspended, but the fan kept spinning.

> * Was it a problem on every single time, or just sometimes?
Sometimes it would hang on the first try, sometimes it survived some
suspend_to_ram/resume cycles.
When the fan kept spinning, I woke it up and suspended it immediately again.
It never survived more than 2 weeks with some 3 cycles daily.

> * What is the new behavior with that module parameter in place?
17 days without the fan keeping spinning or the system hanging on
suspend to ram.
Followed by restarting into a newer kernel.

> * What BIOS version do you have?
MDCN30WW
From september 2023. Should update.

Thanks

Am Mi., 16. Sept. 2026 um 19:28 Uhr schrieb Mario Limonciello
<mario.limonciello@amd.com>:
>
>
>
> On 9/16/26 06:46, Karsten Wiese wrote:
> > Hi,
> >
> > your change makes a huge difference here, no more hangs suspending/resuming.
> >
> > amd_pmc AMDI0009:00: Delaying suspend by 2.5s because delay_suspend=1.
> > If this solves problems on your machine, please report this whole line
> > to: platform-driver-x86@vger.kernel.org so it can be automatically
> > detected as affected in the future. System Vendor: "LENOVO" Product
> > Name: "83AR" Product Family: "IdeaPad Pro 5 16APH8" Board Vendor:
> > "LENOVO" Board Name: "LNVNB161216"
> >
> > Thanks,
> > Karsten
>
> Hi Karsten,
>
> Can you give some more context so we can properly document this and turn
> it into a quirk.
>
> * What issue were you having before?
> * Was it a problem on every single time, or just sometimes?
> * What is the new behavior with that module parameter in place?
> * What BIOS version do you have?
>
> Thanks!
