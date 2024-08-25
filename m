Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1620E153BEE
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Aug 2024 16:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724603833; cv=none; b=bhTgzBHyGDBPt+MZptwiTPV5ZX9zI81QtkBG6xrH7Xn3VW4+/32wIDNQhk0CRTWXWAbO3FUN1tlSXLMK0bLjzL4QbKZWyVrzpa59zpmp+5DtEOaEadg8SHM7526XhqR97djvOcNMLAQv6JbYjM6e9BjRxtiwQviCrdxuFvFSBhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724603833; c=relaxed/simple;
	bh=NFKn6k87NwWSSSAIokPcSgAkGQQJnKkif+fO3y0rVNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lhuhk0g3TIknu+dPL/qYK6TEdpczf9GkQlCEbqtbW/a8hijnTG/OUj5USk5Xy5XCsMdKaQmcrt8tpyan48pNZrQPDLlvc511aPuWt7uMem0nCCwQOiEm5rsnIXKomk5KF4IkesKflLqcwyFVWyBsr3jis434JWrJesQ7SgSrAJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TAglX01L; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TAglX01L"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-4fcfcdcb4acso1107105e0c.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Aug 2024 09:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724603831; x=1725208631; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NFKn6k87NwWSSSAIokPcSgAkGQQJnKkif+fO3y0rVNM=;
        b=TAglX01LtY8Cgs52yy0xMUGvKCkmay2wBQeY6gkMjeXRAEAGM02/KgRMzTGl+renKH
         oLE73BBrX/mKpSfoLG2mCiMEutjZ+7+/EU0ZInc+kEyMpV7efqVGCuJoBELX1Xm8rF3b
         ewDpcq6ppv/AxI6wM8/CHJp/4Yzs8pITeQ/6gurLYKAezUoTwVH/mdPx5ZjkQ5szEq6a
         JTxfvniW+S221aaKSSF1bn1fp9Q9ZRltxI/n7sA7Q7I44VLA0ulBLs3DeePNVcetXe3h
         nEgjb+t5tN9c36aDPMGqsvji1XsK9flu7z7rkRft1b0TeEYF49Ad6FByCOT00Qn6zXZ7
         V5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724603831; x=1725208631;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NFKn6k87NwWSSSAIokPcSgAkGQQJnKkif+fO3y0rVNM=;
        b=TV5IrLVF5lsghrhO3sOVxLTXpyoKg5+kJ4Thb0O+m6T7B3TJxkH/EBxMVn1WJuMFZL
         wopTBfyuELXQOPJRFoDZlBVVxRBtmpGPnSTE9G5Jasv989QN7585uU2gzY5fmoW90+1E
         ujevPhG1s2tBjnbu9eQ/1CGvxOkhS3kyoXdWHlIQTnuaOEKXYDlVUYomK8oorjfWiJig
         +B8KUxS2eSU3xBLiA8dQRwEYHMeyjcx4Ntz2ze7/d+Glmy6kh0TK0Cr7h/Jz6fmK8DPj
         jrBtXjM0OF3x0Vik9JIXlHDyY0iAfAhwYF/hUS2inZal4+z2kYis/P0nvEZCHTo9y7CO
         JOpQ==
X-Gm-Message-State: AOJu0YyqXBBrAdykz+Xa3nYaJcF93VKPV+tNmQAVJHo2rIdFmjIKQCg8
	mL5ve7YQs23m3J3EZl9qKCMBu6RrSIIjGeExbUoks5dXs+GOxGAKNE8zqbQC7DPIiYirIjWJqVH
	gazCB7vhikABuBHnA8TKz+uEfm4I=
X-Google-Smtp-Source: AGHT+IEBdHx1p/u2C7gHmIYmNwRfVbR4y1j37w4MieGdlf4kFJaZgJ2UcBbQJGNCbAdHZYuPE6JT87QQ09gBU2dVFMc=
X-Received: by 2002:a05:6122:3b01:b0:4f5:26c6:bf13 with SMTP id
 71dfb90a1353d-4fd1a826f74mr8564574e0c.13.1724603830905; Sun, 25 Aug 2024
 09:37:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <808c835b-3500-4345-a338-b0f8014d049d@gmx.de> <202FA1F1-967D-4D99-94A1-9649C7C9B6F6@gmail.com>
 <CACzB==6Hpp173CzcsOpU+epz13uDU5mpudX1xvZuMkphODTPAw@mail.gmail.com> <ecba8732-fbef-4e4c-b518-d5042fd18480@gmx.de>
In-Reply-To: <ecba8732-fbef-4e4c-b518-d5042fd18480@gmx.de>
From: Rayan Margham <rayanmargham4@gmail.com>
Date: Sun, 25 Aug 2024 18:37:05 +0200
Message-ID: <CACzB==7=AUGXuAyDrQBRO35fap=ok7B8tSjaXY0tDPjn2qExyg@mail.gmail.com>
Subject: Re: Add Support for the Acer Predator Triton PT14-51
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

>Does the fan speed reporting work?
No it does not, sadly, only the LED switching functionality works when
the turbo button is pressed.
Thanks,
Rayan Margham
