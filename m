Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D794E21B9E0
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Oct 2025 23:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761520908; cv=none; b=k8BFMAmGraxGa1c05GGLwCTTewFnmYJH2YQCdK4IznGWE3N9Kw6ob+oXfj3/DS2/R8s8eRihS0nTREd4k+SWuPCwtZa/w2znBhAfjG/r5N4WO3qr0+jTFFqSxg+5Y4LMBjBnUNCFOFyKdO85CAddNS83NaBYNbjjxOr5dPr8MUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761520908; c=relaxed/simple;
	bh=wuJp7l9BxYQQvm76gYsE6mpd5w3Q5qPAgxwJZMJ4ttg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Maxtnx9dQevmGlON3IO9V6etAa84Yz9hHFLWrjcKdtFaq2oBhn4xx/rZt/PgZncE++3NJTiAoQ+HIpWJEUiOV+GqjNqLB6F1y57pgu6VkppSRDGu9inIyUbSPS/zTRjyhwUCbtSOi0dokTgrjglKYxnG8DEg4hFM2/9WovPFpMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTTS0qH2; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTTS0qH2"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-89048f76ec2so461226185a.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Oct 2025 16:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761520906; x=1762125706; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=irMfHBFvOpJpafEoCbjsjiA11ZUAH7Ucr6Iei1D4hKM=;
        b=mTTS0qH2LmJOoCTF0xTb2N1F3Jv/X58Qo1ISXVk9Ftsx7XHnIo5PzDuxGHaPG1bRae
         8ieGvUqqKPOqe/vQbxZaxW/uvOpVnt30OEvpJaEUTodfNF6+7PaEz8VUSNHQAR3h6Bnf
         sYvUp1376+gMbzQG0fLuCT3TkHCiEI0nJ4GB++5HZ9wfQXng3nGjhGnJm2m8FloDmQZt
         /NHgaF7ujt4RkJMtMl4SYAWDtSx9/Q/JwbY7eeJQnCvXUBQbEIJvdJMIBW5I9PQO18tA
         KwBuOS4QCT+mx4PpxE/tjt6qBuI8cxZy7zkCJvS+CzC98XyCHDZHR4AAhNhn1qdvONiy
         pzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761520906; x=1762125706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=irMfHBFvOpJpafEoCbjsjiA11ZUAH7Ucr6Iei1D4hKM=;
        b=g9LPADsdkHHD1RdK2sEm5hQhOYd/l6qCV5CfJwWShjSfiBUoI6+vCb+/6e7YI5seEA
         l0T47350zVBEBe/pLohtzBkMGyqQIMOetQk4HAeaW0SSFH05nxyh7F/hnTINcE3zzTWV
         /WieOhjoACgX0n0GaJPGNUArOaaDgO9el28vgwaE9qQB+QL8FEkjKJioTE62uQuVE9My
         UreTbuFC2AGyi0UxhiPpNpmBf9k9rpAEt7VCg7a2iaUMWZt5PfO7DQlkMh5is+/dg30t
         s3uWlVVHTqxIo9jF7hrXtXIUrVGU4sO3JjKz1hnBCibc0H3MGCQJrJLUJANw4UidSdkD
         ulJg==
X-Forwarded-Encrypted: i=1; AJvYcCWgZEpWWOYva4C6ijUrWXrZcVeif/L1Nis4yODKW4LYVwF6MXOMq31TIUwi5ND1DSjMw57ivLQ1fUyjcfeo8NtBeP+c@vger.kernel.org
X-Gm-Message-State: AOJu0YwASqi/L3BHa1D8SUb+llwRhwR3DCErpQP1zca+/5szfeq/x1ir
	J4z73XAe87oRq8gzuWc6D9qLSAAk/vxyo2Zjr7aSm47TH7A3IFmco4CoTJzRjaCHZuv5mUjk6vC
	v3cZPlJ1MRId5qmLAI7aeEfXC+9+J8P4=
X-Gm-Gg: ASbGncugnVmbLZmZW5u5DdsJD1cOta8pHvaed1kNpnjv0+iTHTdjoPbqwnXMpmBkKkf
	zO3WKti0DcO3DvO0tJHVvckFGphchrbmagD5HLcfZQGa/pp8vkSQk3fmIQc3eOWj3ONA2NMPYCg
	Ux3V2ULpY3nwasJ2QJnZpvFwH19T45IUm0Tev+59okxiAGTiFNkBG6MjS0QiBkqAEG1K8ZMBslv
	8okVoWXD8TmZxOXPCYZvrMsE1xO4+FmXD3sareLQJYQZ+FU74AvqEWMQQNnCs3e7GHBhUnd
X-Google-Smtp-Source: AGHT+IHo8R+zCH7MSvLktz39UYicGMsMbQFZ2tlf4JqIosztocc0bmEfj1I/ELi5zUKGu5GwPG91iZV0rXxG7lGjBls=
X-Received: by 2002:a05:620a:4504:b0:812:48b9:2eb0 with SMTP id
 af79cd13be357-8906f06de81mr4514141685a.19.1761520905645; Sun, 26 Oct 2025
 16:21:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD-Ua_gfJnQSo8ucS_7ZwzuhoBRJ14zXP7s8b-zX3ZcxcyWePw@mail.gmail.com>
 <92785bc4-e8e6-40b4-8ca6-43ef32c0b965@amd.com> <CAD-Ua_imV_eB3uYAbZV=AWaVMPMM4CpqzmYFDN7AvJs5q1yg_g@mail.gmail.com>
 <099ba5b9-600f-4604-94c4-781d4d91b091@amd.com> <84d6bd41-64ff-4380-ad87-54cfbb5bc1a0@gmail.com>
 <CAD-Ua_iHZtBJFXjBytXEhBwS9tJ79JUA7EB911hUZ0=OyoyLDQ@mail.gmail.com> <29af4c8f-e93b-49da-ad22-f5641f0046bb@kernel.org>
In-Reply-To: <29af4c8f-e93b-49da-ad22-f5641f0046bb@kernel.org>
From: Lars Francke <lars.francke@gmail.com>
Date: Mon, 27 Oct 2025 00:21:09 +0100
X-Gm-Features: AWmQ_bkMaZfcAKLj6Ig0tLi0bbFgr2BEYzTdCS4t19hEe5S09dBvjGcPe7oEq2E
Message-ID: <CAD-Ua_hYxHWa_rQWC6-2kMw4pXWt1fkdJT06AWeTZUbBFT-HDA@mail.gmail.com>
Subject: Re: AMD PMF: CCP PSP fails to reinitialize after hibernation causing
 TEE errors
To: Mario Limonciello <superm1@kernel.org>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	John Allen <john.allen@amd.com>, platform-driver-x86@vger.kernel.org, 
	Patil Rajesh <Patil.Reddy@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I did try your patch for the TEE enact cmd issue (I have not applied
the second one yet, I'll try that as well) and I'm sorry to say that
it didn't help. dmesg looks exactly the same as before as far as I can
tell.

I'll triple check if I did everything correctly but I manually
confirmed that my source tree contains your patch so I'm _fairly_
certain.

I did upload the dmesg[1] and more[2] again. Happy to try more patches.

[1] <https://github.com/lfrancke/amd-pmf-hibernate/blob/main/hibernate-debu=
g-20251027-001557/dmesg-full.log>

[2] <https://github.com/lfrancke/amd-pmf-hibernate/tree/main/hibernate-debu=
g-20251027-001557>


On Sun, Oct 26, 2025 at 10:16=E2=80=AFPM Mario Limonciello <superm1@kernel.=
org> wrote:
>
>
>
> On 10/26/25 3:39 PM, Lars Francke wrote:
> >> Can you try this attached patch which inserts that flow to see if it
> >> helps?
> >
> > I haven't build my own kernel in a good 20 years, I'm on it though.
> > I've applied it on top of 6.17.5 - is that good or do I need something
> > newer (6.18 or similar)?
> >
> > Thanks!
>
> 6.17.5 should be fine.  But I suggest you add both patches.  It would be
> a nice confirmation if the other patch fixes your power off after
> hibernate issue.
