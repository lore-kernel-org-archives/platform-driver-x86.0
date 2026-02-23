Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C66285C8E
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 14:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771856809; cv=none; b=etz3VUdCoBMkU6OP0AV13CRsNceVU4tSg4+yLC6htCY7oGPchZQX+9BaoTwoDskV6XSgE6cysCshuyCV1Qr7C80FL3yIIuy2b4e69o1uVt99FWHuPYVHhmnfc8Sv4ae25CS7+rsDPmLndjJQdF3sKXEcHVMBIY4k0mbEsiQuBtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771856809; c=relaxed/simple;
	bh=BAx/sqSxmP9wJO5u8pT1N7rOIxxnAX7jnoOvquHzPpI=;
	h=Message-ID:Date:MIME-Version:To:References:Subject:Cc:From:
	 In-Reply-To:Content-Type; b=k/Z4F/0z7g3pKFobDvhYzLVfaprhshlhKYb9ZU6lOg89BJs76mgUGbQkOPvO/DTn0k51DNe4jY6gtDaRJPjyEKkM6WzFE7N54aoTq24oq8ntcHx1tHZEk5aDbkWudE32CBpip2mAnmANV2gQ5BSGFR71qFWXq7161In/oe83XrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sheffield.ac.uk; spf=pass smtp.mailfrom=sheffield.ac.uk; dkim=pass (2048-bit key) header.d=sheffield.ac.uk header.i=@sheffield.ac.uk header.b=Bb92kMoX; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sheffield.ac.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sheffield.ac.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sheffield.ac.uk header.i=@sheffield.ac.uk header.b="Bb92kMoX"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43626796202so3780254f8f.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 06:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sheffield.ac.uk; s=170424.google; t=1771856804; x=1772461604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :subject:references:to:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZmOA1PhmFcd2mJlrhiZgT9nXBjce6PFT/SVDOBDGpIY=;
        b=Bb92kMoXz1YrMzxELH7xutzW08fNg3YYfCvMBI3jwPCpriTjyG36zuR841dr9dRU60
         85ifUwBObiYLfDW0CfEygiL5mvu02e+8H8O6lYQJTAHVArIQedZUYFvJ7zWtSZNPF1k9
         tKjkiLVabHJorEzR9uExe6Qth/bXvay9sj20NMlXmrJl14N+asm/f4FdgBCdeODFXKHu
         gO9E2auByl5428qmCaTF2fELHS4xy4npSqo90xFwFkYA6Z0v922M4uweW9bs1oWTAkEl
         h/eooS5/5X2Bd/7qUNR759xtLX0qvxkke12AVrbKgpUxZSN2wWOzakK1vcSWj6x7PaII
         uWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771856804; x=1772461604;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :subject:references:to:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZmOA1PhmFcd2mJlrhiZgT9nXBjce6PFT/SVDOBDGpIY=;
        b=hzl3+pHYI/Pmzx1xi5pzXxa+eXKtQOnhOBpcKignz9C40tA69lk5b3sVBwhmx8y0b+
         2Rh5psx6KwScIaD60dbKsd4BiIHdndP+oidV2l7r0oekkm495JrZqi+oK9knjwOik2/Z
         mw9LOj1uW/D02CauNfcF/maCnhZdfAtwLvx5sN1pr/DreHAawcngYLlZWFnrbpNJPTRa
         YrJVWf1lsKAxwpoWcrKII5PdkkH7Ea3pce73F9iEc2TGgoea+muYRdjf6uMYoczfycIP
         Nl0nKGzC0taFljxxkvv7+oWEFXfOyHkHSJv6+quaPUE4dRNtsXKGDk8rrdyoMEF/5Yyp
         OOww==
X-Forwarded-Encrypted: i=1; AJvYcCWC5ZSpmMl28aLNUzoJuBKb2+vPRj0IuGmfFl7eWE8/489rcPLmZr17shQHWHMmsGiR4B03Udn9cPDW0vvWmmHP4t8e@vger.kernel.org
X-Gm-Message-State: AOJu0YzKo7kjaPpqM3dLVJL0/z/P0cKOgd47lOVHSuYNNiedZR0G1Fmv
	eLEOn63owo6fc0rujLEVIt5rZf2VnYBD9KDKSwzZG3I8UF7GFqRh8WkFHU8RBai9YJbkjcU1oiC
	17all5KQsIRnn15H4jWxwy1swiFQFbqr17Mjp0A9P+wOrK4zysbZo9LIYeJjbWrIoWfbVglRIso
	EWJqKQ38FF9rHFkaOMEfeRoMZxGba128N1uyLKtEm6dkFBFO1EIUSffZ2oFTV00lrxlNBPuaPOE
	TencHG8HiBL4A==
X-Gm-Gg: ATEYQzxstr/aAvLB09qRfyeclzbkzmKn8YvPDGf9vUEaVmFfDdmhJzIFebHjYO5aKm1
	BrFT2/vrsx4Kdgw53SFWe0QvBEGXJ0yvWP9jUIJ68vEyrLSIZoPmkcaYMNMtQWEAlUawXHMdgW8
	XLmLZb1RU6RVjOUinCohztUm51eezNafwfN8ttbNewCUlSadKTVfPXth4D0WmH6yjExLex/d6pl
	8CsusTPk4Juw+osmt4iFof7qetCZuqHkUt06vlNy+Ci+d4ZB0A+39AzLdWc6JFCk/C0Kt2TRTXZ
	a4EMzVK6DfovwWEthq7wWpTB5hRtUKDn4f7S/8OX/JfCzwzKZNQT1c1mfpvDFlLIEWuurmmiZT4
	PnsbpyKKfcVzQp74AjKwwH0gSvwBKvp1A5sLbkCY34lBJN7Q6lOfJwObhxxWehLS9KbmJCmXno9
	fRGF2tlQ7r1ANHWO24+jAgjWPD28+HgvAsIPD66yWoItqR7ZTja6Fm
X-Received: by 2002:a05:6000:26c2:b0:436:8058:449 with SMTP id ffacd0b85a97d-4396f17b48dmr16337143f8f.45.1771856804231;
        Mon, 23 Feb 2026 06:26:44 -0800 (PST)
Received: from [143.167.4.104] (hubble.ddns.shef.ac.uk. [143.167.4.104])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3ff27sm21261148f8f.22.2026.02.23.06.26.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 06:26:43 -0800 (PST)
Message-ID: <3167b808-1fc9-4b73-9bd3-b76b149d2b65@sheffield.ac.uk>
Date: Mon, 23 Feb 2026 14:26:43 +0000
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@debian.org>,
 1127612@bugs.debian.org
References: <dafda4bd-87cb-4fbd-a811-66d629a10c70@sheffield.ac.uk>
 <aZMt6sSlpKK_JAdT@monoceros>
 <4ddfa94c-5cb5-4c7a-a0b4-9b9ff5e4cc85@sheffield.ac.uk>
 <dafda4bd-87cb-4fbd-a811-66d629a10c70@sheffield.ac.uk>
 <4faeb5e7-e56e-429e-88fa-a1fefa4d1034@amd.com> <aZnNu_AphE78MIoY@monoceros>
 <d152f056-8583-49c9-a943-494325031d8f@amd.com>
 <d152f056-8583-49c9-a943-494325031d8f@amd.com>
 <7599e019-5c25-4bce-8308-05d53699a2f5@sheffield.ac.uk>
 <7599e019-5c25-4bce-8308-05d53699a2f5@sheffield.ac.uk>
Subject: Re: Bug#1127612: linux-image-6.12.69+deb13-amd64: hp_bioscfg
 mm/page_alloc.c:4802 warning
Content-Language: en-GB
Cc: Jorge Lopez <jorge.lopez2@hp.com>, platform-driver-x86@vger.kernel.org,
 Mario Limonciello <mario.limonciello@amd.com>
From: Paul Kerry <p.kerry@sheffield.ac.uk>
In-Reply-To: <7599e019-5c25-4bce-8308-05d53699a2f5@sheffield.ac.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On Mon, 23 Feb 2026 12:46:54 +0000 Paul Kerry <p.kerry@sheffield.ac.uk> wrote:
> Hi Uwe and Mario
> 
> Thanks, and yes I should be able to incorporate the patch and create a kernel image: I've now moved up to the recently released 6.12.73+deb13-amd64 kernel and the same warning occurs, so would you like me to try to build the patched version against that or on 6.12.69+deb13-amd64 ?

[apologies - I didn't include all email addresses into my previous reply]

Hi Uwe

I'm following...
https://kernel-team.pages.debian.net/kernel-handbook/ch-common-tasks.html#s-common-official

and I've tried to patch things using debian/bin/test-patches but am getting...

patch: **** malformed patch at line 11: kcalloc(bioscfg_drv.enumeration_instances_count,

so perhaps it is how I am copying/pasting the lines from the earlier post into a file that is then causing the problem?

It's also been quite some time since I built a kernel and a debian patched one at that, so I'm more than likely doing something wrong, so if you could create a test package instead of me having to build things, that would be a big help thank you.

Best regards
Paul

