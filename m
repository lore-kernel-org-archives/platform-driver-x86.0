Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793216200;
	b=W3d9Q+3K94HPP/BlKtVB8xG97VQ2mnra1ymx9oa0bwfMxvVSA1mI9PumxdJ00Tju5L6W
	 bUIkhiqJd0fmsR6f4PkC7shdQN55xQ6GJRWzt83PIc2BMw3LQh7uq+CPFOb9VMOZIhuMT
	 TgDFuhThPnubBoGblW2uBW/dV8/JgosJMBSkOB10mRYD3DttZx5jOLZibG6JnhBzW7/mo
	 r3S2fildpVqoWLoOygUMG2ThTW4ZU4DK7C+Vt3Xvty67ZEIsmI7gCiEKq6jRyoBwZw4w0
	 keiPv1kOk0kiZQwnlDiw/YHiarfVFJy6jS1xmhKcJynGXvaER4ltn3AIvRK+J5m772A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793216200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UgVj7cp8bikzxjiNp3NE3CNorNbMjTnkuaG1LUbFxQ8=;
	b=R/fldKrjyngNXhHoGZolmBtu6jCrr2JVi2FeY22F5cjODKon/V9Pb33mYxKOOIp/Ox1i
	 BmYK0TTkS3XE3Z7srfdS0ykE3citMOb5J/owDhvOKCmmnGmsHE7/dTDCNtc3/1qH2e5eH
	 VISxa7hgiDa02vvCwq1pWlfLnY3Xiw7PVTL7YposQSb3aAPGUcuzTsbcsIv+ExzT7Lt2x
	 ItN0SuB4T2g7Zs2IrKCQvi/vTpoDws6muTP1apdPoPqjds9l2GNWo/igMN3sr2iMD1RUa
	 /T+VO9hs3Sr9euDXsKlDKQiQsYY9Iu5k6v61RvsoOUt7onz3QrAPYaKfL+sk2MY9i9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=OjG0d0t5;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A97606A31A
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2026 19:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01A97606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=OjG0d0t5
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b1aa377c61so1992553a12.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2026 12:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793216197; x=1793820997; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UgVj7cp8bikzxjiNp3NE3CNorNbMjTnkuaG1LUbFxQ8=;
        b=OjG0d0t5NTZwMFXcoffGuQQgoCQ0Ez2h5d0QQ6nediwlZ8n1WAXuhSRQ56LwhEu6CA
         fUMFcL6SVwlxmiYlDEOKrdcP29AnpXmD/L4pE94UbWfuBbpD+IOBI9Atjqa8bgQOPtsL
         I5j04u8O9ZFzW3yhsziwe0fytH9XsuzxtD0ig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793216197; x=1793820997;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UgVj7cp8bikzxjiNp3NE3CNorNbMjTnkuaG1LUbFxQ8=;
        b=vEZHKBdKKCYDBoX1JQK6yc7YlxXgLNlgPCCy/7f/X6ENVi5RoZa+ncBC4hXHi/K2jE
         tntT47mgEkM/MBFZJfijGmJU03KdWjbPmglIheE8rDtyzU253vj6Al/9D0z2V+HjQobG
         /bUtNwaT3LHvtpEY52TSN/2yTQ2vjy/YcoXSGW4L3gbtegJsIxY2PlfaL+Ps/KX8qIVd
         oqlafF8tgWA/VjBAYDd67APxRZpfcX3nGlxNIX0qwFTlohM4+HvgLKs/+5uHQ/kuMfDn
         YD8D9i00hzWLI6R91mPAWndO1069M1qF+MQkj2mDcTFxRL3q3lHsChFmnD0fupFsIGWL
         tvdA==
X-Forwarded-Encrypted: i=1; AKwUvByockglHbx6+/q4qmK0KJeItrhCEdKLdDeQQeTtr2Gbi4htrqmE2fLKuAk9JDmGpxqcXaeXWgHwcuNjSzoQISZ1Dowx@vger.kernel.org
X-Gm-Message-State: AFq9FYLB3S2dpv6nSqSlZPpAmDdW6RaWWov5+gTGYkfYclG3fVC6Js4W
	mJpG2dLTGSBW1wbCuMF1gyLXK0AmYtd/L0sYvJqd6PWlgTVoHuMDMlJ0z7Zd2rP9ewDGBmypiZi
	pS++v+sA=
X-Gm-Gg: AYBFou0Sg6AR00gT+zwMsiJeeqSxvFx4EKM7as5EdUFhBLo57S8wgO4KxDQ7J3YLmoa
	KtKZvrjoqHeQU3OqEu5cyIWrZkg9iQ6P6hbIhzsg69bSZWR8vuFO5VddWHhdqwLSzYRh2RyelcS
	tj+O70eapc6cnm1LpgDnrNTbYkb3xZsKbvWnElvJFZd9RtHMyloBZHZfPY6YJhYdQQAplnus6CL
	xXeHyeCNFc6btrXR05HvxpoT17wpXugdnka3pk6cp5d6KJKTZMTTxakcWAEuCVpx7EMtAt0wwbs
	aC9rlcv2iqYHJL1QaDjV1bcO+HzUEq41W1QdPLddO61Z+ADVxR2aafXOfonap95Mv+c34c90P3o
	V4Y6AdW7xwN/q8r1HZIHpk7/se5GFZpUHCwXiciJUqT61sOgfQUPR5VRcNSVVwM7QfMapCVMyqk
	6hphGUvBwutR+sHXe+H55YD/4JNf7O2Yx/+IpTrrcdtMEsWHhjXEz/6dHGFpLnu6N0fQE9nfUad
	LD5Ae6XdEDLu1ZwiazPZgCIgTQHa5EMFW0JmU6NAfYyProeLOjgeWJ9ChMhDjy/A7pj5G+hbRW8
	B/k6CXdmNnWYdEL6TIPurfmDqXukSvVCAA8PZjBstAdtUTRlYQotLK4dXrmTgtWA3D157QSTZEb
	XrsFZ
X-Received: by 2002:a05:6402:14c3:b0:6a7:e514:1d85 with SMTP id 4fb4d7f45d1cf-6b49cbcf9b8mr1651956a12.13.1793216197338;
        Wed, 28 Oct 2026 12:36:37 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b496447e8dsm1901496a12.30.2026.10.28.12.36.37
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 12:36:37 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4697404c2bso195390766b.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2026 12:36:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx7eAajyaxALiPr5mzoiwjchG6p+ZA7iG/yA9Zff4g+C6M5a5AbeYzhGdSpgsap2RUlTS0iVQaM/PEzQqRlkE6/hlUg@vger.kernel.org
X-Received: by 2002:a17:906:2dcd:b0:c49:cf3a:a324 with SMTP id
 a640c23a62f3a-c49cf3aa682mr79949166b.22.1793216196830; Wed, 28 Oct 2026
 12:36:36 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <pdx86-pr-20261028113441-148823082@linux.intel.com>
 <CAHk-=wjk2f+Vu656fEa7FOyHHaFe+-M-GEwUQPXykaYoor6A7g@mail.gmail.com> <112173bf-15bb-5a6f-e3d9-73c7675de537@linux.intel.com>
In-Reply-To: <112173bf-15bb-5a6f-e3d9-73c7675de537@linux.intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 28 Oct 2026 09:36:19 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjsj5evNKrhY-LRARUGYXnNAPqK09GHAEJ9sNLoKn4dyw@mail.gmail.com>
X-Gm-Features: AclHuK8eek5pw9bB7ni6vcPuGENpOKcsC_mlYSxFUawUrF86ogcfsAaLxo_9u8g
Message-ID: <CAHk-=wjsj5evNKrhY-LRARUGYXnNAPqK09GHAEJ9sNLoKn4dyw@mail.gmail.com>
Subject: Re: [GIT PULL] platform-drivers-x86 for v7.4-1
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Armin Wolf <W_Armin@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 28 Oct 2026 at 09:26, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> Okay, thanks for the feedback. I'll try to leave more out the next time
> and/or write it more directly to you specifically.

So yes, it should be to me in the sense that it should explain the
pull request, but I have actually suggested to people that what they
should think about as a target audience is something like lwn or
kernelnewbies or phoronix or similar.

IOW, if you write the pull request message to be of a form where "this
is what might interest a wider audience", I think you'll automatically
also end up writing it as a good explanation for a merge commit.

So a merge commit message should typically explain the "overall shape"
of what is brought in, not every detail. And it is typically meant for
an "outsider": not a developer of that subsystem, but somebody who
maybe bisected down to that merge (I find that particularly during the
merge window it's often useful to use "git bisect --first-parent" on
the mainline kernel to get to a "which big merge caused this problem"
before delving down into the weeds of whcih low-level commit it was).
Or, as mentioned, some outsider that is interested in what happens in
the kernel, but doesn't care about the exact details of every driver.

Because once you care about one particular driver, doing a

    git log drivers/xyz/abc.c

is typically *much* more informative than the alternatives. At that
point you get targeted information about one specific thing. That's
not what a mainline merge message is about (unless, of course, that
merge was only a fix for one single driver - at that point the merge
message obviously *is* just "Fix driver abc behavior")

        Linus
