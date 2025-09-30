Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779C8238166
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Sep 2025 21:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759267417; cv=none; b=Ik1XsJTfL3kB1Dh7PL04HGsnERuJDWnHjzrIKV0rHwHl+pFR0DsPX4P1zIS7lj5u0t3dFsjDS2I1uNdjDTlUUxBJ6KndJUtYVnl0gwhUQwGvOJul8poeMwwIwzROdf5hfnqbyj3QZPZfSi1G5H8er4F4+z8e1CqK7r/BdMY5Fys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759267417; c=relaxed/simple;
	bh=UJ0qhsXY1FCMn4xw0TLSCTC+6x+RYKDjyn73bGI8LJ8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=oBKgHRKa88GgOKUyxCCRy/QH1KtSwouojHMU7gsbiX6Mt+1EWsUrKmmaoj5FrnARJePb42hqqF696Gkm/hHago8kmqKAmg3JH6HgJzwxzuwHsEtuvwF4qmdv4GqXzstd62kDX477fJSln0pjYDscv0j+aA9zZoVo5etnfihAlt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EY2uxdcY; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EY2uxdcY"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ee12807d97so5556900f8f.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Sep 2025 14:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759267414; x=1759872214; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJ0qhsXY1FCMn4xw0TLSCTC+6x+RYKDjyn73bGI8LJ8=;
        b=EY2uxdcYO5n948b32QVqe21iwIKMLoARfZCX54/dTikr37DMtgcQK4Zq3hwhktFT4v
         JU3aLNzG0D4YFbdrS8fJFdeEDk7FbDiCPG0ZhCLm6L20LXQGLccA2rDPxZ7nB/1GvfIq
         nHz7qcfculcfQldf62Q0pxvdR9QdriW0aw3v5W4onkCxyj/aJajhR4T/hFvc23hkstg7
         AJHa7Fd9k9N/Ovli550n+0a61Crxm9gOAmBu8Eweg9skOa/muHlnPTU8XUIRwmesyj1j
         LrZX0TB3Opdwc1HZ2wwnEhUlneUiH0VzTxvS4OIquj/5sZTKQUyyA+zioXN77pRDUMyH
         CPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759267414; x=1759872214;
        h=content-transfer-encoding:cc:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UJ0qhsXY1FCMn4xw0TLSCTC+6x+RYKDjyn73bGI8LJ8=;
        b=W9F7vz4xtoozeIOq5Lg/2stdYuBgOW2j2WWjctXjilEAW6Yg/pU9w3VEnNPFocQYyK
         ZKEQzXJeigr5Gye3j4iU7Tc+juNvEBzhqgJbvWDH4cKv0Qwmslcuksjr1+exahGYc+No
         PuzFYUgnOMDCpG9HWXTRIPa2+0bzEqFa1pMBIaEACZv0HTWmv8EoS4aUsSc+5XDj53VS
         IYNZJVrMhm3Jpdb2PInhXmo4PglIkxjZuF5v3dJ61bXyjbun0l8BvacQAQSQZJjGIFNh
         LaICDECP6Rxteq8jrvZzNTh5usKRs5Ee8RiAx1TZ47Q1QnvDFh6ynZORXFuiz3gZKShG
         6z7g==
X-Gm-Message-State: AOJu0YyHdKQrCATqG9a4lrFKCtmhS+ZEEsN57FbrGfsSzOoJdiDxp9XQ
	Q6LM8J39ltv0ZyYCjLRx20Ii1w7HJ+4T8MCvisO6KeLTSOzVICIGQ7Dd
X-Gm-Gg: ASbGncuhb3t9RSRRSb78WUKiTA5pVhveDAEZprByZKv++Pg9V+jMg8RrOFCAnvUewcz
	dGjDw/f8LRBlxJdstJRMlzW//DwZeBPAAWN4hWI0QCBQWVsSCZqS73DqUf6Oeb2k4y3vlax8twq
	8WPmyllx3fNRr9yJKe6ZbePw6oH2hsenxPBnPHB8ShHlIe2eBKR0m5qsw1XFWST8tJMOi+V20IU
	h4w+Q0euz8JGciUdVpjKi6Ak0hVaoP0ZPmskRlQL9QHxnTMOklKmi33raJE6mTAodeeuST3kAJO
	uiT3qEFF94JTF7b8OURORcXJz7D9R5Wg3CF5/rCpWfh8xvh5ggEssi9yQWY8BCqETbyi7oOEeFO
	2bQzH1NozVC/ipIWiYp/gbUNQpNfr/ArbeUdaoH2AeGJPetOg96heGHtB3kqo
X-Google-Smtp-Source: AGHT+IGm9KqlaWCEmtfcvTCYEb280Bi19ayiyfpWLQ+s8WQa3dTO66HwawV404mNLijDSR1im2xP9A==
X-Received: by 2002:a05:6000:2203:b0:3d1:c805:81e with SMTP id ffacd0b85a97d-425577edc8emr736033f8f.4.1759267413616;
        Tue, 30 Sep 2025 14:23:33 -0700 (PDT)
Received: from [192.168.1.121] ([176.206.100.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc5602dc2sm24030865f8f.32.2025.09.30.14.23.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 14:23:33 -0700 (PDT)
Message-ID: <8128cd6b-50e3-464c-90c2-781f61c3963e@gmail.com>
Date: Tue, 30 Sep 2025 23:23:32 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Denis Benato <benato.denis96@gmail.com>
Subject: New co-maintainer for ASUS driver
To: linux-kernel@vger.kernel.org
Content-Language: en-US, it-IT, en-US-large
Cc: platform-driver-x86@vger.kernel.org, "Luke D . Jones" <luke@ljones.dev>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

I am Denis Benato and I have been asked by my friend and person I estimate Luke to help him in his asus support effort and I gladly accepted.

As a first step I have refined his asus-armoury as requested and resent it upsteam [1].

With quite a few more work on the horizon for me, like the hid-ally driver, adding more models to the asus-armoury driver and working on the xg mobile interface I want to ask what's the best thing for me (and everybody) going forward?
Should I be added as a driver maintainer? Please, advice me on what to do next.

Thanks for your time and understanding,
Denis Benato

[1] https://lore.kernel.org/all/20250813165620.1131127-1-benato.denis96@gmail.com/

