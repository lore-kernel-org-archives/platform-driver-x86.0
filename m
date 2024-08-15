Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A9F1B3F03
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Aug 2024 16:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723739241; cv=none; b=bWMalLW2Y5QyWy9tiAj2mQlchoTkJfxGG4YbnGIvnUWlfv5Cfa8LNFCWdNz6LoHagtBF3ZoQHAVo3pkDb67NYKQHyugQMMFAcw4tFpBjCEF5eHnz9NyPvN7DEiBaa/XA4DWTDMNrho2t1F/0bO6IITPN1+9j/lA7wJhONSvVYDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723739241; c=relaxed/simple;
	bh=9OyHzeAFylkTFtN+D0zrBS2pM/2TW9J91WPyHjR+2ro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X8RGAbi3aTX4So3VDu3i7tclt1wYJ8BzhyguQg6JSs6P0+w7+ERvgMbF2fdpJL6ChFUwoA0Pqu5ga0Eiana1/hP8H7ljbaKu4BT9hcrAbLKYIRfGshcqOk00BxXK0v1JuWxEw+2qNBN09P+RaNL0Q6dgJmAyhawmKQKDkuL8xB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kpjqyf8k; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kpjqyf8k"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-492a3fe7e72so414889137.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Aug 2024 09:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723739239; x=1724344039; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9OyHzeAFylkTFtN+D0zrBS2pM/2TW9J91WPyHjR+2ro=;
        b=kpjqyf8knrY88BBR4n9EM4sOWIOh6/iWkmxljSlRsmyAE2gE1LDeGB+BOfIOQPq15c
         VGoJcnNR+bB0M3OYfNZQ+dVv91h6XN1EH5sJON/yM2F+Vnpu9D9Cf5fLa3MRBwxeWXlS
         eXyGdLR5pvc8rJtMeRZs96QlYUxR6FeA0H+Kym9l7PmYOjIJCPEfdXCwGc+QZtAUDGBB
         GhQBs+i3Y70M1NlvwXeypbGfL+vw80Y4RVDiKrF1gONgXcLAN6izEKUmYPoE3z0Dp2eV
         Sd2DRcQFaRD7iOgGVucqHTgj1Z0Y7wK9ekZrZW7X8vD1pUaE7ynVceAurNmsBvEVKmeg
         +bdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723739239; x=1724344039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9OyHzeAFylkTFtN+D0zrBS2pM/2TW9J91WPyHjR+2ro=;
        b=xFVoeIWomFU1UjqsNCR4TKu+JLogISZeg7nmlycBBPUVKSC2ZQsfmpCAXfi9uUutF5
         5ai19cTh2RjWwvwEzsDyX/OadlOPvdqk7mofcGYiU7ajk+sy9kDqu2aEwHR0jZ6W1ZPP
         kLOTqhrDj77SKZJhYELYCIw3oLjVxOeDXa7i3Xp1JdngAKuLbZ7mnO3FoOVQvRVfbIHG
         GWZKl51SRj2K9WkgY1tOYmkxW68WZ04O4WOhzwAPovb/dxurr6uvuW9qoOY5m+mEuwQu
         IPcY2M3LUqLBDukwkiygIGRfXlIWyvvvIUkUiuqVGl/Zf7NUbY2kYcZiNmxE1aByDhED
         VIFw==
X-Gm-Message-State: AOJu0Yy4IotzDaSd+l9i6LF0QkHby/XZVFLmxVpY6jl2/fpm2rhYKD8W
	OAdbVZfob3Tx9u6sg8427YniYzj6A9ngT6w4sjnvUfGV2OJLeto11oX7Z/v58biqwnsvcXW4ZTO
	1eq3znXSLSRp2hvXg7beyfzv2VQg=
X-Google-Smtp-Source: AGHT+IECUeeAOLhgPvNqEVEsJYwuKsipOtg6h10XNeJ8tAEZ6CwkBYqNBvtVbj2485VfCDWuzQMd6vqmdTfhUDipvbA=
X-Received: by 2002:a05:6102:dce:b0:48f:959f:7ce9 with SMTP id
 ada2fe7eead31-49779a11489mr385830137.30.1723739239094; Thu, 15 Aug 2024
 09:27:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACzB==6tUsCnr5musVMz-EymjTUCJfNtKzhMFYqMRU_h=kydXA@mail.gmail.com>
 <749421fc-73d9-4657-86f4-40cc048265f4@gmx.de> <CACzB==427GUH4b571KuVDzh6EsG7kB4bb00hmLu=7OzEt4QrCw@mail.gmail.com>
 <1867c880-41b4-49e3-a02a-b61438908e98@gmx.de>
In-Reply-To: <1867c880-41b4-49e3-a02a-b61438908e98@gmx.de>
From: Rayan Margham <rayanmargham4@gmail.com>
Date: Thu, 15 Aug 2024 17:27:09 +0100
Message-ID: <CACzB==7gTa5D6bheFckSXRgKee0O1W9UGRid8gQTpb1-2Oqvhw@mail.gmail.com>
Subject: Re: Add Support for the Acer Predator Triton PT14-51
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 1:31=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrote:
>
> I will try to create a prototype driver so we can take a better look at t=
he fan-related WMI methods.
>
> Thanks,
> Armin Wolf

Okay, happy to test it on the laptop! just let me know when you finish
work on this prototype driver.
