Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA382517A5
	for <platform-driver-x86@vger.kernel.org>; Fri,  3 Apr 2026 16:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775233161; cv=pass; b=AWS4c8jug2llt2pLxRWYQLGHYT8YbLSjbZhDv7996kzkWwCnsq77ic749Rkc0WeOo/mM4LYTEzP8k62E7kzu3FAOF+lTWNUa2W9eLQUEk4Q3BCoZffdypEhirlPZlnNCaP9ymUC3uqFyxQaMhuvoRJAHJSSGbmle3oFwKnVcWFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775233161; c=relaxed/simple;
	bh=L30/b4+Gyh2roINFrjR8Nr0vV0xKSjAAnBDD3nswarY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SMheopal6ZyjPGZ3HGcaeZL4ogCk/n9p1zjQXODu+Dnz8x2SlCmldUKNLPcsmfl8pel3lL44i1h8RSz1fZUnWp/avl8ZK8loghyqHxJYKKRbwcCmCRIOrxYp7LBXMGOzq1ou+5J+S98A5sZMsm8VM6J1wosUg0d8RL92bL2Y6hg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joyfullee.me; spf=none smtp.mailfrom=joyfullee.me; dkim=pass (2048-bit key) header.d=joyfullee-me.20251104.gappssmtp.com header.i=@joyfullee-me.20251104.gappssmtp.com header.b=IgvPzJ4e; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joyfullee.me
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=joyfullee.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=joyfullee-me.20251104.gappssmtp.com header.i=@joyfullee-me.20251104.gappssmtp.com header.b="IgvPzJ4e"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-66dd1b5bb6aso3528410a12.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Apr 2026 09:19:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775233158; cv=none;
        d=google.com; s=arc-20240605;
        b=Q91U2Ilrohknjv7NqC9lSrzMpWauYP6egEz2CxUiuBZ2BYY+VYOBJyfapFQODUOGtB
         CJ2oTtoNYVDM6RKvc8bL6b//3kOqsLC8QQJZcIoRtE9KTMaoOMrndPeUMaLA6S/b7nY5
         N0kY1xT9aFscWdoI27yqMLrQW91kTpffF7DaDL8L4sFNLEi2mEN3MHEHUjVWNGNH+hVo
         KuUsKjiatlOYLQRYTjKPPu7nDXVL1XkQj7pT8byRkSSySb9qwlqUlkeAegaNfhkw51on
         5Ng389pgkdeGmvZiv4467J1Q6aGla7pSEIeqTinK75vjU02doP3x0iQZw2e/qwlKtdNN
         H38Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F3gZOk0u2GpWeeWhIugCmNU2OqtSSo0NtKnU+5FZ5cU=;
        fh=89rhhixn7jbhSryJmuJMIxGxEhh6/Dw9ZMvS+L+nIBk=;
        b=REH1sy6b7o9KsHktMPlSzuszPSbNwsQ06BmsU25qACdRzkaCIXFHUzu9d5TlNlQxXr
         AK+hOd4D9E9m19fyELTWu2i8c55mUaklcnzyqgtmLRo0bjQJkDUm8IusZ7jwlNKDmFjt
         Ci9PE6LwXoLZLeZcTl/BDo9fsyoeKdwBsZDir2JYXi5wxHT34AAoOaWJoWmIWKuD7ETB
         et6l+sQ0LBmOfOUP/zj+um29PtEevIsQZcN7fIi6nxzTSfuTmmT237jJ6k/PhWra5nZG
         ZlcriKiAJrmPJoQT5TU9CldRDjMMJCgtb4sRmHecbcvHDfFl3CNp33hPrWb1/Lu0eXof
         Pudg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joyfullee-me.20251104.gappssmtp.com; s=20251104; t=1775233158; x=1775837958; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3gZOk0u2GpWeeWhIugCmNU2OqtSSo0NtKnU+5FZ5cU=;
        b=IgvPzJ4ecaieqx8gqzpxkFIAvEerdRagxmjw7ONA5GKWwmmA4Nb+Q3LhouxAXs5bCl
         ettdniV89+VdyAIYkhZ30Ijtbcp6lxJUogXLfTMbHfk1YcwdxTQnG9eK1yuWW4EEpo9l
         yeJFbvnGNg99jghzixMd++LH8lMZlEFG8JSydQflp4rxAwnqS9UhSSp7xB0irc6aanD4
         r5jDfE9LRWZ4sZQJk3B9HUpG5Ts/dm42QdyZ9h8GzZx8wsGAFzn1NJ/ERb23ENAodMyo
         +bPV+vcjaCfZIqyCbffd5z2escXOuO+jy1B3wOScAiv5PVMYwizzD8/cMIg5dNY9D/zn
         edww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775233158; x=1775837958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F3gZOk0u2GpWeeWhIugCmNU2OqtSSo0NtKnU+5FZ5cU=;
        b=g54AcPtqRPk09eeYHNih1dTaEGq+vQhkLtL8pEPiWh6Budzr6wg4GtlV+9LBxwFHDN
         ++WW1t4EYxFc1bBHVZf8guuf+Gp79dzavaASKSmvqowx6YeDe7cRo7Rm6q84V1PBaW3C
         HCsna7zPknkXn/eA1fDhrLbGpk6vqrSlTEzTU/tFpxvr1LZhisLv861TOrOau4guewA+
         cK15LmwFfcjHa+vbEyOGYylJ2kdOX46nEI0JAz9hrwbS42wPIjXhjOcuuBwyxciv68Dh
         9oJ7oTx/CiJ4FGGSnkIdGxo8yi6zdkJS0pVgfFDTG60rpx3cvxeFFqLMCELRI4SdwL1j
         9DqQ==
X-Gm-Message-State: AOJu0YyQRFnYTovjzIWVyy6Ves8NFFSC3OgKQStWflhN2yZdlmoRZCOf
	2I5N5wjOii3f2Mbkrmjx8Yxl8NJZqTesSH0065+yHoah8odwDGQ2qCUBVYCG0sYO3Yun1Y+pSFx
	Uv5g1QWfYBMkVbyn9iyXom5xqfiniyoHir0bzTiP66A==
X-Gm-Gg: AeBDievAfcKt18RjtXzOegFe9EfCKJnqqZSe+jtgdxknhU/C4Nvfufuv2IyaShUxvh3
	445Z7fYF/ncpP/Oyzt4Vz7RLyQ5liwyC0USfwqzte0KBYMgd38Uxq6ZNpFHupu7r6gQZDfMlx2R
	UJ07aqY40y23zJAhCjbJ+dtSumCbZ4DAZWOsMxexOQtctQodYV0oAx02tFBcTQkIu3fYtPi9All
	vbcPBnFeANSjb+dZskVIPHanEN3PxIdMbPcvQjnfuRU/w6y0G7+14oMPwaRfJl16knerHvN9UrW
	q332XQ==
X-Received: by 2002:a17:907:6d1b:b0:b8f:848b:4456 with SMTP id
 a640c23a62f3a-b9c6742299emr177158966b.13.1775233157953; Fri, 03 Apr 2026
 09:19:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADj6jrgK+sRXoNaYH90Rdc8DYEFK2iSF4vkJC=KE4UaZ73y67A@mail.gmail.com>
 <a935b2e3-e11d-47ec-af47-7eb7e86a9dd0@amd.com> <CADj6jrgcuz=Bcp0q7BHVizVeF=C2r_8qXw7r0Mc5X9Vd8uWK-w@mail.gmail.com>
 <4192851c-20d1-4185-9f63-32c66ed2a664@amd.com> <CADj6jrgse2NksUgkHUzTm0332ba4qnV=0QOJAnupS=Lr=5hh4A@mail.gmail.com>
 <4978c9b7-00bf-4562-baae-098bd0d09ba4@amd.com> <CADj6jrh2AT6vvQqujB5UN5tfcQ-qdDKjV_7fK18zsqkHpFTMzw@mail.gmail.com>
 <867b2fa7-a8a4-44ad-aee8-fbb9d0555072@amd.com>
In-Reply-To: <867b2fa7-a8a4-44ad-aee8-fbb9d0555072@amd.com>
From: Joyful Lee <joy@joyfullee.me>
Date: Fri, 3 Apr 2026 12:19:06 -0400
X-Gm-Features: AQROBzD_0zG6UUOBfCeJDvISibakR2t2dYw6Xl5_Zpv1OrcQrZkOco2YmA-Qx6Q
Message-ID: <CADj6jriuyztRnB60awqyhO-hu18mZ+UmpMsY+_qnSYPkcGqDSA@mail.gmail.com>
Subject: Re: [BUG] ASUS ProArt PX13 HN7306WU: amd_pmc s2idle S0ix corrupts AMD
 1022:150b root port, NVIDIA dGPU returns header type 7f
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: platform-driver-x86@vger.kernel.org, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 10:25=E2=80=AFAM Mario Limonciello
<mario.limonciello@amd.com> wrote:
> That's really unfortunate to hear.  If I was in your shoes - If not
> solved by the end of the return period I would return the machine and
> purchase one from a vendor that has been testing, fixing BIOS issues and
> supporting Linux.
>
> I'm not going to pick favorites, but Dell, Framework, HP, and Lenovo all
> have offerings that they do this.
>
> By chance does the BIOS offer access to "AMD PBS" or "AMD CBS" menus?
> If so, there may be an option nestled in there for dGPU D3 behavior.

I got it working. My kernel, which I build up from defconfig, was
missing CONFIG_HOTPLUG_PCI_PCIE. It makes sense, but I wish there was
more evidence that pointed me to this option. At least we can close the
loop here in case anyone else runs into this problem. As a side benefit,
enabling this option also got the dGPU to enter D3cold where before the
lowest it would get is D3hot.

Thanks again,
Joy
