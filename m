Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F99351C2B
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 Apr 2026 16:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776702605; cv=none; b=tqG4QmHsXYIhQdlQMr/1Ld3WefNMAsRJBNpk1mLDqrEUDUFXJmpFA79YP6gQP/7D3L3QjFgqeDhpnGYFez2PI8Migv01LeJLXSyJ5T1FVfQYL0Iy8BQLOG6vRvYa48gFmamOpcKbA24dB2Kdfr/HYQ8zuuPpzwkLIFI/DVcYKrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776702605; c=relaxed/simple;
	bh=1FZNMMWn2mfuFQRKV39o9u06Bb7L6kVeqBozxU34kcU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=a1zGVwBku+4geQ9+HcOuQB0/lTxHZ26gPFUqc5MWnI189W9KFHtcGvDtSo59M/bvCagLckEAEybJrEM4ori1C8DNFgRNd/H13Bmrn1Xz6WltONmhJfSBRjCAjoOTvYnNKFiErANDfxkAoUytdBBQNHlZ/zNaVscaL2waG598E3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OTLkmtMG; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTLkmtMG"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56739adfa1aso2439617e0c.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Apr 2026 09:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776702603; x=1777307403; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FZNMMWn2mfuFQRKV39o9u06Bb7L6kVeqBozxU34kcU=;
        b=OTLkmtMGPTXtIeeHOWfMaquur9Zvl1viX0mWNnQzlH0O3K/bHhY0I5LVeTUPx1qrms
         wOpXekG2pnzftNtJOMRHD5lr9GG1vQDqI6RCv/5BWC+LyTIkkyu+EM8Rzu7BAalOjigI
         JJExa0+0mXdiq/Bm1RdVr72bmBbeaIXkKgVnbKXYJTU1+5G8KSWITV7kZoBdarpkOLnd
         8VE/aHEGpbsZw7cUb1WV29Q49hBaM/KMXR7ECOUyhkU/j3K+pR/19KYfhc1juJ7398k4
         pbIWwKMQZ4jiZrMiFXS0tEzDROXT9Fg3tY7A7sZ9WuFeGvGn48EEYcg4NpVuJqDAy2BY
         7n4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776702603; x=1777307403;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1FZNMMWn2mfuFQRKV39o9u06Bb7L6kVeqBozxU34kcU=;
        b=KS2jYFh0BQCXHbpfL9Dslngd/BNfldW5V4UE8bpfWOiiNIrFOMHGt4gDBSH87U9UWB
         +heRQZpK5beUjsc94K9wndwpgH0Ks8C39pNycQ7kEwf01kEReQ+OuxwTHBhxCjqfJgd9
         SR9wl5fgoTTb5RpfxikngDE030WGxSZRV9kNBtr3dUNh63iuVHPBOFysO5owyRRQum2R
         qMGEGoZb4JxQ0zttZPBg0d3hIPaS3gMBcyWLJEAG2JLyFdX6d1TMK6KxowZHLrlNNzv3
         aIwTnTon/ALAbPVHyH9oK3+l4vj5KKKjzzwhigAVi0HHv2PZxj/u6skPpz6v1ImPS5Zq
         mtog==
X-Gm-Message-State: AOJu0YxzSLnAUqjBc7jGaHG6yVH/Vzz8BT4ceyhlDRHQ2pjqPEvHvp7N
	pLySo52USP4rMamIFhD1jrkv3JfWnDyBMfi2/rBjeiaufMr3jov2d4Pu
X-Gm-Gg: AeBDiesnsEhHzHK1jPrD5vy/Luj6hRhReQdpKT8GVM1mOGlpSZDw3HyulwVW37g1Oh+
	YgUcUmaA4TmDkryNz3L/xa7ReWixMmEulT5miB8fRwEEnhasvRiFurejEk04bA+4WrXHXRCRyTN
	OcaYPCygus5kaBZmXqAi5QE7/AKUxIV4m2omNROODDMwVo1mpwL/gxlWxzIvsLOYqa6j7ioWVy+
	Y5upPDqryUkKNKHkbpFifKzJUY/nqVlhoX1Iy5kh29kLqO7SKxF7x2KV512Rlr/WbXcje8clzZn
	hyR639xrGTmwY+uOwLvsJEuS2NicxHDFAYnbcCFJXzU+QzIEimcNJufJQl7D5j2Z1Heyb9rL3me
	ATvXW+N4E6vWRhPj8Vs+tPdGQzRmTYs0j7ymnYBZyo42WmlDAi0+IyMwwlPC0a+IjsfOqwmo3No
	Mi0g1mU3OlQsRQ1qVcIFsQq9pt
X-Received: by 2002:a05:6122:4b82:b0:56d:451b:e4dd with SMTP id 71dfb90a1353d-56fa5a232c6mr6634105e0c.12.1776702602684;
        Mon, 20 Apr 2026 09:30:02 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa93253aesm6156415e0c.14.2026.04.20.09.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 09:30:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 11:29:55 -0500
Message-Id: <DHY4I8I2KLOU.1F5GQO5EMRL4H@gmail.com>
Cc: <platform-driver-x86@vger.kernel.org>, <Dell.Client.Kernel@dell.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] platform/x86: alienware-wmi-base: Transition to new
 WMI API
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Armin Wolf" <W_Armin@gmx.de>, "Kurt Borja" <kuurtb@gmail.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Hans de
 Goede" <hansg@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260331-aw-new-api-v3-1-ef03b94529d8@gmail.com>
 <eb4b7361-128e-4e1d-853b-667deb52603a@gmx.de>
In-Reply-To: <eb4b7361-128e-4e1d-853b-667deb52603a@gmx.de>

On Mon Apr 13, 2026 at 1:25 AM -05, Armin Wolf wrote:
> Am 31.03.26 um 18:20 schrieb Kurt Borja:
>> Transition to the new wmi_buffer based WMI API.
>
> Hi,
>
> i think you will have to adapt this patch to the changes i made to
> wmidev_invoke_method(). Said function now takes an additional parameter
> specifying the minimum size of the output data.

Hi Armin,

I'll go for this!

>
> In your case this would replace the size check when output data is=20
> expected, otherwise you should call wmidev_invoke_procedure.
>
> Thanks,
> Armin Wolf
