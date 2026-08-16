Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044223D4130
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 10:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786876950; cv=pass; b=IlkDqFgW3tNXmOHtIpdf/Ct1JquG2EZUH6lxeDcZFLxJV+vS1sTWyNsgvA004G6htCZU1Oj7xeLVWGj0OSaRlRb1y8+YI2/Sb3STw6C0a55YC4hje2SEUAEWUt9os3aD1rhEUIxssthJG26dZqCkx9R5yJ6waLKqB5fnVj/GYcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786876950; c=relaxed/simple;
	bh=iCdf+ww8TJtdjH7rlENagk3TrwPpsNrFM+0lrHjTWvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cWkDlIuF5H1IAAGO1/IBb04ANVg++pluuGgqse4gL58BdY5RCFRQuYiis97n8ioFPmwrDPzlHUL4yVqTt2StwrQPrG2QbgG36e8EYCY48IrxuuRG9RHu/oxMFxZydDftCjaZIjPASP1kR2tP8LaaGH/0PRveYvJJBRVxjqjWTGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XepIUflY; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XepIUflY"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a17c04563fso3501191a12.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 03:42:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786876947; cv=none;
        d=google.com; s=arc-20260327;
        b=n4NOWaroKYHzUkDS5yJBk8lRSa4GWUGYi8xXJF3372jwUBA3gje6KbSQEu4cVnsuvQ
         Pci1Gw9yqqY76K7bESQwvB5fJMZW9gUOhkiQsBl1yvGEKEBX8pfIvNkeOK0v85nMIpDj
         SqEhw0HKPmYnFD90v6RodIlq9W/hs4sKZ1esorPVlcDGZGWSuGw4DInufCCwmavtkM8V
         gYs4Yk9U+GkJunJuHMh6AoXjnXl1AIP+MhhYNd4rPlo0XuP8/f8bYhVEvdMqO1bDfIk2
         8N+QZs5mw6nYD56h4wdS0s++/EF/n9h0WPd13EfnVDA+hM/jXLUT3n1RNWRHvYI0UUtQ
         28lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iCdf+ww8TJtdjH7rlENagk3TrwPpsNrFM+0lrHjTWvQ=;
        fh=xhdCNAjITSX/96nvGZ1APHJMQ6OC801Kh/50Z96RBiw=;
        b=UMNei4TC3W8+N1w96Hp9BxOx0+n/TKStKw4yzL9gTtQa83Qye5I6NMGqKDgXFPWBzx
         Ko+EcIrsfn0THradJPAJimljwgjnjDt5JkJsl/lLV3/iLbKJuPBp0mIo1/i+oQ5gVhkc
         ApwvyszU3sUCM9ygv5WUrsCmhLUFp83eJqnTz40ZW+Uk6Ban3PQGa25HcgiL5RapkTuR
         CRYVsgU7NNBx8yK3MfDt48tpP65ac4BsRj5Oi2x4xert+4jF5P+ry/ozCtpPRQle+UM/
         GP8OSK4Tn9B7b/3pfaH7xg/Tufc0hsdv+PdKOFkVOUwO4ay1prVS1pDWZBa+nIAYxROK
         hOIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786876947; x=1787481747; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCdf+ww8TJtdjH7rlENagk3TrwPpsNrFM+0lrHjTWvQ=;
        b=XepIUflYsTQF8GsN5uvQmXuVy7BcviR7JEk2Db86/pLGdom/8VoSe8XK/ubzNIUbJD
         CEX+F1U90DEqrXSSbh6GED+yiESCZypyjwdJnJYzB6vfKAo7XqaDS0G7yPcRSNprAdO2
         m96RzvAII+lm1ZV6FWW6ZbSK77hwI3Ybz3Bn16n/Ys172zjdJTvq32E3hqHQ36k9K23g
         om2N9EI8/kX5RvpzkY4JafpAOtf9Ig/kMOBB3zSorCCGzPofxkYKf4jKQ2cn9gnTD5uZ
         MUsYb4OI2R0rEPZ6gX7Ph5YSm4ciwhsNJsVWJmy3qgzT7ana4f3smzcpCUzqjpVyXwZv
         akMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786876947; x=1787481747;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iCdf+ww8TJtdjH7rlENagk3TrwPpsNrFM+0lrHjTWvQ=;
        b=s5pb9y0D/Bg2M4wlfe1BZmHmau6+UcIxmzfQOG02+yqvoum/ROb402hCcnzBfXUiJ+
         moPeQBtae5HUZOsURbGlCDELtvyAnb43a4WfP+7DzwjubuEyDq2h0Cs3eoDAI5NZbP62
         2vq+KsFRzlTfiVbXVOFB3PF4QsQ4IZGOhzjjnnKQBSWsFlldNWSLdHwFSvff6wkIMbQp
         H2Eup5rf8CYwLJyVJDcTfwuii74uf2jVLS71NgbeVKBUNTs5rg5LrB1Wy1A56jzm4QxJ
         Dd6fLbGYdiCEOaE5CD/NK3E0Q55eIFxZrWwaefUhbknkUZvFgLyIOr7Lxmp+sbCtezAI
         O6cQ==
X-Gm-Message-State: AOJu0YyXjWfl6CDu8v+AhKtaAj+5aRpJfb/MxBGTmPhqygNTqUoRM7TK
	nN/2MkfV9u9hqi2xYQlWx0B5jIMOnTwhopfmiMhbJopFnVwhgOoF+FZEuEkR/SLSUuWuycikKRs
	3o8lNU3E/h7y5W5M3VaDFimRk36WPZZU=
X-Gm-Gg: AR+sD12/xmF79sluHk5F8MyhxlYvP7ild8FE4jaZ1MR4gip3ubuYrxBqX+srYrQJWjQ
	D2k7XytYOcwnQ/TdLXERtjVDGj1Xsstals4fZhx3ccpghWUVpV9vD2mKp0ZZOJWJmwbQ2cX9hLq
	X9qygJy8V6BdaWHau0fpml02efG7/lnxrwhosJxVKSNFaFZ6MJM1Fo9b3i82i9V61hPGAheB2Sk
	qHlDrQgANTbyci72gfHMPfRSPxt/1TUVh+p1Pzt4Zx2D6N+8LG9UU2uKFro7o8iVUcnbKvDJHoy
	UdqHWYEI7BBqU6jtaWlporOEfsxeKE7DipuZ7EKrX/WPalPEieGEgqu76QFyPt0=
X-Received: by 2002:a05:6402:4608:b0:6a3:6b8f:94c4 with SMTP id
 4fb4d7f45d1cf-6a38a9bf8ffmr6044311a12.16.1786876946945; Sun, 16 Aug 2026
 03:42:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEX=435pEyPHPjJgQnJUJLL8JJD65RsRa7Sjbx4NedZFG80dtA@mail.gmail.com>
 <71f66925-9a2e-4d95-87fe-eb11de78b215@gmail.com> <CAEX=436pkA5eG7N2MXpgE6kPL-Cbue3XeiLHOMPc2kFaxVj7ng@mail.gmail.com>
 <46295e2a-0e27-4936-a04a-2f8c71560740@gmail.com> <CAEX=436MOAPVPdqsupWFk5=2naeB1ghgRFCYi8FiLeGk9MLZDw@mail.gmail.com>
 <77155747-5550-468f-b8af-c25b713e9c14@gmail.com> <CAEX=436Nzf_NiHmuYcN8NpEnD1PdgtEz6qzLk_9wu9XHeSKeRw@mail.gmail.com>
 <83f9fcc0-f80c-4395-a513-34343162ef7e@gmail.com> <CAEX=43630i1znyzkfQNd21eiYOXsjDhmugejk7n+XrQenE-NHw@mail.gmail.com>
In-Reply-To: <CAEX=43630i1znyzkfQNd21eiYOXsjDhmugejk7n+XrQenE-NHw@mail.gmail.com>
From: Bheda Rahul <rahulbheda131313@gmail.com>
Date: Sun, 16 Aug 2026 16:12:15 +0530
X-Gm-Features: AcwNN1Ub6WS2FuLxX0TuHgEB4MNp-SUjBD51fiRcKqGdhpz8XlTm1oSFfEhZTw8
Message-ID: <CAEX=435Oud97yous1cRA9rBbE5vtXvO7aCshx=kfJCQzoHZJjg@mail.gmail.com>
Subject: Re: [BUG] bitland-mifs-wmi: Power profiles not working on Xiaomi Mi
 NoteBook Ultra
To: Mingyou Chen <qby140326@gmail.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

so i apply your new patches and it still does not work but available
profiles now changed to only 3.and after reboot platform_profile now
shows performance where it is balance before
rahull@fedora ~> cat /sys/firmware/acpi/platform_profile_choices
low-power balanced performance
rahull@fedora ~> cat /sys/firmware/acpi/platform_profile
performance
rahull@fedora ~> echo balanced | sudo tee /sys/firmware/acpi/platform_profile
balanced
rahull@fedora ~> cat /sys/firmware/acpi/platform_profile
performance

pls tell if you need extra info thanks
