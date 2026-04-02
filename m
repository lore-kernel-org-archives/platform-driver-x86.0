Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425AA3E0249
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Apr 2026 17:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775151057; cv=none; b=OHuBp8f2uSIoPw7kJvpHcOuqoa/8XYf7kplbizNThR7PtZ+F0m1au6zTYzedYoWtCcBLn3j8nHF+M9kXZntW2PoxN8clNLT867+PeBlwyuFWpf5tqt3/wuA0Ssb7m6Eq6GQQCpK0FCnvVRH0JnDrGnUJVRexztTrLy+UWfcpxi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775151057; c=relaxed/simple;
	bh=WdylU5TejPNQZ4tglDbHjuUzBXwTeYUC138LVSnoz3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JEVmYULu2bfxsvYQlo+/06ydtD1Ebjb0qEGOQ6qJE+7INt1/RJ8q3aeKFhAIT+YwqSk3cK0tNldJqZeAw6zUNhyKtA1vPGPA5b8/bcLs9fVBdLqV3Ht5ApcfHDKZWo91uUTya7pXaSfD8rT9TTWLlRfNTn4J5q39Zf4VjB2es9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zm1W3Ahc; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zm1W3Ahc"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1273349c56bso1505931c88.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Apr 2026 10:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775151055; x=1775755855; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QvRfDbu+f0iB/0PXmZoz+zKtEx+yaQ1rdzrhsrVHeqA=;
        b=Zm1W3AhcAJXoYX07OnzeHG3HPcejkt2cmcO5f9YMRAMGp0+yCob8+pCM9YP5TActFU
         52BwhdrzU8UKWJ0DO0UkmTbtflXxUhtXT3Q9T1jgsj660plJMrXb0tbbgWZBLkekbLub
         IHsQ39MCNpMEz/7FcAl+zwXaqA1RuqOGCcdjJBDrI7Zx8gPeX8XVFWlcyCYqkw0Zzmgq
         OfKfjmcGpUG3G6sLw6FG5uUQs46tS26zMfvv/b9JvdgXIQUu4RcAtqLSBoq+a5IT3M/c
         ekBEdD74H5HGl/co8L29t6EcJGSN/JfvEtSB9BQmm3G1WoH7h2VrWgRjaOwQyW09IqrB
         6BYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775151055; x=1775755855;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QvRfDbu+f0iB/0PXmZoz+zKtEx+yaQ1rdzrhsrVHeqA=;
        b=OHztKrPWr/2nDQ25EtNCZfW1Jmp9PLi/cWi6NfAHF2uQh8AIjIUUCTuEUfYmfd6gFv
         rTjl8faSV+ejC+xHvRFJMZ/NHdKSK8IzJmprqvFSJhDIiz/KTz6po0LXBWzIL8c12j4x
         0czqLccaEJLypm3vMhifm11pvgU8a/394E023SwfT/IKLr7Cx0ECJ2YHH+dHx+jB5ZTO
         Bo8jchzVjvXdjoAKDzbcigAVWlWjhD0/l5PIT+34F5DQf9FQ154yuq4YlbI7n71pXAYg
         oM/kbZ8dfDhaSZnybH//Gp3jEiK+QrE3cj82frtqWnub5MsHGoofs/smm+TvPqyHKqjt
         Ld+A==
X-Forwarded-Encrypted: i=1; AJvYcCUMB/961ljYrCOVPyLSEY2/YJPeUZKE4l+7Jyff5O29FbmhX2f4XIrRMueMoJuSJhVqAk1XmcpqImIwgIvQFGMzG1Bb@vger.kernel.org
X-Gm-Message-State: AOJu0YxPtD6DtkgO0IRdo7T7EpzoYE+Dk4lLsmM1yzWkr/cwrRxrwehP
	Qd6OBAnnmWIepBjX1a2CzZsHyM6NpgKxYEXKzCodnw5K3kexe/SGhw3P
X-Gm-Gg: ATEYQzxRxiCTv69MO/yRFn1y7nrahIv7D0qRz379UUnIgO636E4VOm62w+CKYmHHnf4
	o3H7JbtE1srrkz5ZT+F8PG4SEz5KOP0NZvg+082OriPUKQY7USVoTffcY/aIxz6nvBDrn1hzPdM
	Pg9uVv3nuWxnw0gdKgjxo2RlsJ4FCoSrJ57Xn+Uyf+gdKRKhJqZdtjA1BJ75u+xH9pGRLGyfTdV
	0C98jb2Zs/YcojjDb3tgI4oEDPOV4H4+b76MBtt77hLSQBYsQ0yWLNC5/V2twW7PvTDhOJ8q4OT
	DeZGGYMPza7/JFvs7DKIskYIlsAQBoQm432u6fUSH7TuILF+tyFTbAu0l62cnaY/40p5zU9fwhA
	btz3bUUFG2sknbYj0xBO22mt1UVFYfNvIjp5uOeH3skW0bWmUuNfY1BYcnNZvzJzg4PAHu+m+Iz
	R5T3oH1eMOd64ElIhc0L+j7W7EFKbnnbdijxof++stda6pDQEIX8KozqIvVlKUEsct12ismYvFE
	14=
X-Received: by 2002:a05:7022:3d89:b0:12b:f899:717f with SMTP id a92af1059eb24-12bf89975b8mr630179c88.9.1775151055053;
        Thu, 02 Apr 2026 10:30:55 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:902a:cd8d:1c0d:8926])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bede54ba8sm4033033c88.10.2026.04.02.10.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 10:30:54 -0700 (PDT)
Date: Thu, 2 Apr 2026 10:30:51 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Santosh Kumar Yadav <santoshkumar.yadav@barco.com>, 
	Peter Korsgaard <peter.korsgaard@barco.com>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] platform/x86: barco-p50-gpio: attach software node to
 its target GPIO device
Message-ID: <ac6m36bzve2gdSLa@google.com>
References: <20260331112819.103298-1-bartosz.golaszewski@oss.qualcomm.com>
 <acx9veIH-t5cCVc_@google.com>
 <CAMRc=MfCbKa2YZYPckV7bj-+kcOx1g+v9BjYL0v+SFxTVJTTLA@mail.gmail.com>
 <ac6OpN-pfcdAhdEj@google.com>
 <CAMRc=McbuVrw5eNp6vhF1DJP=5YM8BA4yTM6wf_1Dcg_T2gBhQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McbuVrw5eNp6vhF1DJP=5YM8BA4yTM6wf_1Dcg_T2gBhQ@mail.gmail.com>

On Thu, Apr 02, 2026 at 06:39:16PM +0200, Bartosz Golaszewski wrote:
> 
> Ah, maybe sashiko wasn't wrong after all but it definitely could do a
> better job explaining the actual issue.

Yeah, I agree. OTOH it did notice the problem. I missed it when I first
read the patch.

> I missed the fact that this is
> not a device described in firmware and as such doesn't have a firmware
> node. I see it now. Ok, I'll fix it in v2. In fact, I'll probably wait
> until v7.1-rc1 and use the new .swnode field.

Danilo tagged the commit adding swnode to platform_device_info so you
can ask to pull it in when applying the patch:

https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git/tag/?h=platform_device_info_swnode-7.1-rc1

Thanks.

-- 
Dmitry
