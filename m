Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F337C27A477
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 16:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774888633; cv=pass; b=aIKftSvz3daw8w/4vqL28NQjXMTfUsXEzMHAFjzIi6nLxfstOxb1K5Oovwth7Ji3o2+KhThd0Dz/aakP3xTM6WJWnseh9lepAIr1bbWxzew5oOdLIq37wbYWhCOlCGycXyoBx9Rao2fTfmP8sMZatxva8ms1bBhgyXRcSXug2FQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774888633; c=relaxed/simple;
	bh=uIg+hfrrVf5Zjp9LewIaXed69dpFyI93GeIBpI2B6Ww=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=e+sJY43aCe4pEIM8tVLDHhuTiRL4stQuFnzYLPklEptD2Xcz1OOTI9y4bXKT1LBWZ2185K2VE4+RFsA9ju+WHEAEPLejJg0jf4ATNKzPjgsC5TOQpd+G0MuiesdM8Q4oZLYSXOUEbuFmxOD6SScRNbyZO9vjEX1lHMpQiWtdRxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CRV1dMnX; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRV1dMnX"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-66c24b42efbso566412a12.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 09:37:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774888630; cv=none;
        d=google.com; s=arc-20240605;
        b=f+zj4HE16cdhBB6qF3NrYuuN9WcRpOzlAISWcCSnSo4MJKVrlQmAz6yot64Cx24Q8X
         d5DM/uOuG4W5hNCN1e9R2pICwDnxdej7li7ifjuePEZSmKugk562Y8X6nOZo6/KJGhcj
         CMFtW3OuBz9+7OJzyFDqeuyL+WlGEl5BpfUjx3izRpGLV/sUnzPeQuZU/OMdU0+CDV37
         Bj87fLgF0DDwjFfBFKzWiN9LiTkhymyB4ovVXAu1YNdinnhshm9egMzyK+fZhfPN0+Xi
         gu9BVwUAAJxWx3Q+ecvGPzp9ATBZol4NwbvMpLFCFWiDy94btvNNi3gPmZ8XWMg8d3rU
         ClKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=uIg+hfrrVf5Zjp9LewIaXed69dpFyI93GeIBpI2B6Ww=;
        fh=LAtpHtVR30q6rinFeyskR7Ff9QyURHB8q3bpp5R7hcA=;
        b=ONVzFxdmA88SWSZhUACLwhNylcBZQR725HVELX6E5JlpdZqIqIYrVa9mh+1ZbTkqkD
         EEJqR3HQOgm+tXt08MvH4uiBshTAKZ6OzEKIQgxS8x7Vtdh6X4VrlXc3L/uvMJnJuLVz
         T9E3A075FkyFUucmOq2QhEaya75eTJIqYHlj1WNbhQqkfhFL4fY879tZgWNL+7IS6Uw3
         /7nIp9X4ieE1P1ie9X9U6vCUtv13O+/fk9U6027VRoCT4hpLLo7mNYflzcr1BA+EOZjU
         GWWdRoRaLnsYkNGCwggdLVDsO1zs1DKCbdRXjqMBTViNjz1oSgBt8WnJu78PFCt+syFf
         HZQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774888630; x=1775493430; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uIg+hfrrVf5Zjp9LewIaXed69dpFyI93GeIBpI2B6Ww=;
        b=CRV1dMnXneet/9+i9x5TIfM2TTowVzHMHMi3/XoNM0Ww5H9npIR53DGTPKJFWzvf9e
         eb03OXekBJvsiNIsytEAZCN3qIjvCQgdgWyFl7avYXIyw0TiEchz1ulhw5VPkE4x8Deg
         3kgPXbZyTbrw1Hi3u3nwRv0fKvHtVCsGFK+62eeaUXjdnz23N/YRI1ugR2tzDTGbbngy
         4ja+TB7E0H0HWkLzkX2J5KTcbUxqjnZo/EH0jdjvdhs+kMP7zS+3tycNzj3Ohjqvged+
         +jyfCnmsedli46CHIk5/hlwc0w5u037+r8M8I8d1xP3uB/tAF0+tJ4d9nAVgtgtalUHj
         xVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774888630; x=1775493430;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uIg+hfrrVf5Zjp9LewIaXed69dpFyI93GeIBpI2B6Ww=;
        b=G85aik9nqyQyQe6larlIKGK9dVH3h+n1u/OqEa4QVB5KHLTEN+J9o9hCCR0BWORMfe
         ZkE9FJE5r4rgizn0q9EEaIvf7lpDkUpqqMXnoqjSu/1GvmaIeaHlEs48Qmuv4HE5oZWc
         c6aIH4ZsdCXiGR+Eo/HZTleoO+DRE4lxKusdSHUDrMRyaBIAIyz5Fw/OPxxnN007Q7h5
         D9xi4NmlnARsY70nhm7FtXOis5XWf9bBv2wK6Cxi2sairRheRP7Fk0CNFwnewHkujx6r
         eeyI5TPcdBN/QK4KhwaU2tYvBMvv8fnqWdiYQ/pv61qYmv3vQgSJq3SAm6lJzz5zbm0a
         XyyA==
X-Gm-Message-State: AOJu0Yyz1Wez/HALXvXPqtXWmbIjOhD7M/2M1brzMN/8DLd0MFD9r2rX
	cLcYXuWj41iS08TOMgTqhzyyjp3u6BPHG4EmT1x3XO6T5TNEsDuNGLb/mP5q3yIumU3yGJhCluo
	TERhOrixrRGmWDY0PcryclSbKwgp/ftcqrJTD
X-Gm-Gg: ATEYQzwqU2JHyL/X+spVSLvPgkwTWjioaWvFikmjZ3rOxwr3kRCnA7hYS543fh1b0Oo
	LBZMrHAvyO+PWl8c18H6hRUg8qJTq8S9w1doSVLQqAdxF0znmThjbpk66CQQZaxtoDHVt6c1mTn
	+HGo67H6g5HMwSWR2k2+E00VsN9WszocfyNTLqiCfmP98RCIxoVhV3b0WoVkVCutnF1mKVZOF5O
	/QF6iX0xy0k9+ktW/QwQTp8NjXzJEyEPA4PVhZptRqcEfugAfHJ6hX5n8BGpkdRrSwCil3SxOXy
	M96oPhsdXAciL6DcV8XCgQjD4yCz54WXRfYd6XPNtfarlZsiPtAmn+GxbokwGUN9K8bFpUdn83j
	hPENX51w=
X-Received: by 2002:a05:6402:27c6:b0:668:8086:78f4 with SMTP id
 4fb4d7f45d1cf-66b28e6aec2mr8025518a12.24.1774888629948; Mon, 30 Mar 2026
 09:37:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: tommy86 <absolute3d86@gmail.com>
Date: Mon, 30 Mar 2026 18:36:58 +0200
X-Gm-Features: AQROBzAZe8Zf3IYBAtL_KaSzRiu_2N0Dt8iFc_g4orDhQBAzPrqVKj9O3QvbTjI
Message-ID: <CAJjPojgfUnPV2Nuqe-5YhjwC2QqsA3gbzLBbXQRY7mnFcUvCVQ@mail.gmail.com>
Subject: HP-wmi board support request
To: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I've found this email address linked into a github post, and I feel
sorry if this isn't the right one to send this kind of request.
I have an HP Omen 16 wf1xxx laptop with a board type 8C77. My board is
actually not supported by the hp-wmi module and so I can't control the
motherboard fans.
Is there something I can help you with to get this resolved?

Many thanks for your support
Thomas
