Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F022F4A14
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Dec 2025 15:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765036514; cv=none; b=cJ7BepwO8CzKCc7fPid/TKRwr2JCa+4p/WNFaBHEaazF/gO4/18F0JHFx7XPIymwGYx8obXyMTVaM4fD7xWla58bDgope6q7wxkgTIxizmgprM0BmfISv70pygQ77EpNgiK8Ug820QtlNBNH2r04vnP+x7O0Onp3pT4oEyWCI1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765036514; c=relaxed/simple;
	bh=qHpFPKknypA0ah2igyAH5y08BG2rl6SyKPYcke6Zjys=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=n7vTYZmP3fDdCDcQ3qPNVBL20oYXO8jYp6X6bWpY35Umrnwry+9mXbSJim82dUYZWsFpTTCegZ+9ICNqlv6PMCrTzRpEJMr4HrJE0fSFI1PQFV9quOur6zhx/9tIsOYci1ZYvffQ93nVux+/u/HyUDVWUbOyYazoMwtaJc9eCZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UYP6xl/x; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UYP6xl/x"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-55b4dafb425so2739603e0c.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 06 Dec 2025 07:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765036510; x=1765641310; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHpFPKknypA0ah2igyAH5y08BG2rl6SyKPYcke6Zjys=;
        b=UYP6xl/xu4yOwYCehn628FZG/CpT/DYIxxatVScaj8m7DV4SVdRQ/sFDmlsIPtVLq9
         rzXEaWPvXRZBbWu3NTcfJ+ZQFj1MS+F9dzUL6gtOWhEk0G2Oj3bi5UfZg9TIosGyzmoq
         hOwmuAkc3Y6QM5uKUf+/f8br1fDh9qaSjMp1AwePmoTgnlEk+QRFCdXtSf9Njq3+XwLC
         bw1OEPX+wfm+s3T1eLxhpoLcw1WTkMrsYZMOiAWsByGHbyRQLwGc5dq9Azo4zJXvuxtb
         GRuo1jDIF97WI7xnzuSfMxcZl9bAIk1OeDD8b/VYZYrRn6i9cQV4T5b1m7k5lH+9ahAt
         pVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765036510; x=1765641310;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qHpFPKknypA0ah2igyAH5y08BG2rl6SyKPYcke6Zjys=;
        b=RB8/Q9RxxvKCsvHEMDk1yYnWN45Ld5adcpwrIJvMx70Tq9rJgdPYl+37996OJi9j96
         vzxgu5gWVyZWHXy3g+Qlo39fpFI8q+YynMXjN8+jVGsJqSGcc79USTB2oXdYZ1qKm0WV
         Y+y/Wa1Z5Tq3EtzvrDRnMfVJ7PNgBe2V6Bzd8PYU6ThKBkyrSHEKJ/OowaScErUIzKtD
         baVABjXHD11eCGZA2FnuTo+dnChhP1bX6jIf7ZknHvnvwTwABU/iEb/lBNzn4bUDW8R+
         I3L15GC82y7+pTyDuwcyjT4aMT11uitxrWCe2erfEhJgtYQmulR+WdXfvikCUAtMMm1i
         NWwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXny/8ASVDXqVKGMU427F4tdy/+9o7vSnh/WZvnicXzyxzsihMhC1nPNq5aDR29cpxJCHwq3sv2ewW0+iKhxfle8XqO@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdcw2YWtk+GvCxTXC+ERXhirZnFV6UBAoKSk2k94Zq6lAUmPEt
	LJ4dw8AZh78bPLvrtS4n/+gymAvwzBHs9aOtMKAsWSZKIufLm10H9cbQ
X-Gm-Gg: ASbGnctalCCBZbhyx5YV8dkvG2M4gt1l0nbY4K0WbMsAxGV9ogk81btGeIoLG3lgeSn
	x35wwo+E5KWF7W0HVik+zOaOQyxJEBg911X/QMJ+Fh1bMfBToNlElgADMsx2ANBtuevWgM3B8lW
	rGHgXaWdEdNSMVDngEylQUhOfx0pWMLv7/iuEXZF18UAo9MRL+7UI9+HLggGDnxBGsAw/Dm+0hd
	HoF+q4CU4jnwwGv7dPzLvt+XBdIKCt05Ccq9huCKKvf2NLvTCtJTJD1DTawUZnP/B9T7lymDqsK
	rfnhNNPWM6VRXneY5r+/FToEXbH7izzal4v0apS9+wmbat7g0iQsnP21CyArtEkcmxdAF0e+qr5
	5SFwRzoPtI3SZ7Rcd1rrHc8GC8QuSWcR2ri4FYmxgDFJpHT9kd1LA1pD3M3HA2EsWy6fP05jfU2
	V4bEA=
X-Google-Smtp-Source: AGHT+IEvRv+kygrTplD6p7uaH0hNC2+/LeFm8cJChsnRJhKxJnVtaAvlqNfs/qdzkRiP1g8V6Doe0A==
X-Received: by 2002:a05:6122:2194:b0:559:14e2:9fc7 with SMTP id 71dfb90a1353d-55e8443b290mr987345e0c.0.1765036509721;
        Sat, 06 Dec 2025 07:55:09 -0800 (PST)
Received: from localhost ([2800:bf0:82:3d2:875c:6c76:e06b:3095])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55e6c939f42sm3717810e0c.11.2025.12.06.07.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 07:55:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 06 Dec 2025 10:55:07 -0500
Message-Id: <DER981UI3N4S.1TN7U3YSJ4LXG@gmail.com>
Cc: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Hans de
 Goede" <hansg@kernel.org>, <platform-driver-x86@vger.kernel.org>,
 <Dell.Client.Kernel@dell.com>, "LKML" <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH 0/3] platform/x86: alienware-wmi-wmax: Add support for
 some newly released models
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>, "Kurt Borja"
 <kuurtb@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251205-area-51-v1-0-d2cb13530851@gmail.com>
 <49c9bab4-520f-42ca-5041-8a008b55f188@linux.intel.com>
 <DEQIPUKHDQYB.2LLGMK25N40VN@gmail.com>
 <20251205-masked-classy-ferret-9bb445@lemur>
In-Reply-To: <20251205-masked-classy-ferret-9bb445@lemur>

On Fri Dec 5, 2025 at 3:57 PM -05, Konstantin Ryabitsev wrote:
> On Fri, Dec 05, 2025 at 02:08:52PM -0500, Kurt Borja wrote:
>> >> Thanks for all your latest reviews!
>> >>=20
>> >> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> >
>> > You don't need to signoff the coverletter. :-) (Hopefully it won't=20
>> > confuse any tools but I guess they should handle duplicate tags sensib=
ly=20
>> > so likely no problem in this case).
>>=20
>> Actually, unless I messed up something, this is b4's default settings
>> :-). I'll take a look.
>
> This is intentional, because some subsystems use the cover letter as the
> content of the merge commit.
>
> -K

Makes sense. Thanks for clarifying!


--=20
 ~ Kurt

